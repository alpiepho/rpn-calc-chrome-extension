// This code runs when the pop up opens

///////////////////////////////////////////////////////////
// CONSTANTS
///////////////////////////////////////////////////////////
var LEN_PROMPT      = 2;
var MAX_LINES_SHOWN = 4;

// number F's in MAX_VALUE must match MAX_DIGITS
// NOTE: works for 12, but not higher.  probably precision of JS
var MAX_DIGITS      = 8;
var MAX_VALUE       = 0xFFFFFFFF;

// GLOBAL VARIABLES
var stack = [];
var digits;
var fmtHex = true;

///////////////////////////////////////////////////////////
// TABLES
///////////////////////////////////////////////////////////
var ops = [
  "drop",    "clr",    "ac",        "%d",
  "1",   "2", "3",     "+",          "|",
  "4",   "5", "6",     "-",          "&amp;",
  "7",   "8", "9",     "*",          "^",
  "A",   "B", "C",     "/",          "~",
  "D",   "E", "F",     "<<",         ">>",
  ".",   "0", "enter",               "+/-"
];
var opNames = [
  "Drop",     "Clr",   "ClrAll",     "Format",
  "1",   "2", "3",     "Plus",       "Or",
  "4",   "5", "6",     "Minus",      "And",
  "7",   "8", "9",     "Mul",        "Xor",
  "A",   "B", "C",     "Div",        "Not",
  "D",   "E", "F",     "ShiftLeft",  "ShiftRight",
  "Dot", "0", "Enter",               "Chs"
];
var operations = [
  "drop",     "clr",   "ac",         "%d",
                       "+",          "|",
                       "-",          "&amp;",
                       "*",          "^",
                       "/",          "~",
                       "<<",         ">>",
              "enter",               "+/-"
];
var opsHexOnly = [
                                     "|",
                                     "&amp;",
                                     "^",
  "A",  "B",  "C",                   "~",
  "D",  "E",  "F",     "<<",         ">>",
  "."
];


///////////////////////////////////////////////////////////
// LOCAL STORAGE FUNCTIONS
///////////////////////////////////////////////////////////
function getFromLocalStorage() {
  try {
    chrome.storage.local.get(['key'], function(result) {
      data = JSON.parse(result.key);
      fmtHex = data['fmtHex'];
      stack = data['stack'];
      if (!fmtHex) {
        formatClick();
      }
      showLines();
    });  
  } catch(e) {
    console.log('chrome.storage.local.get failed. ' + e);
  }
}

function saveToLocalStorage() {
  s = stack.join(',')
  data = {}
  data['fmtHex'] = fmtHex;
  data['stack'] = stack;
  s = JSON.stringify(data);
  try {
    chrome.storage.local.set({key: s}, function() {
    });
} catch(e) {
  console.log('chrome.storage.local.set failed. ' + eval);
}
}

///////////////////////////////////////////////////////////
// DIGIT LINE FUNCTIONS
///////////////////////////////////////////////////////////
function showDigits() {
  //console.log('showDigits: ' + digits)
  //console.log(document.getElementById("digits").innerHTML)
  document.getElementById("digits").innerHTML = digits;
  document.getElementById("digits").innerHTML = digits;
  //console.log(document.getElementById("digits").innerHTML)
  document.getElementById("digits").blur();
  document.getElementById("digits").focus();
}

function clearDigits() {
  digits = "> ";
  showDigits();
}

function pushDigit(digit) {
  if (digits.length < (LEN_PROMPT + MAX_DIGITS)) {
    digits = digits + digit
  }
  showDigits();
}

function popDigit() {
  digits = digits.slice(0, -1);
  showDigits();
}

function digitsEmpty() {
  return (digits.length <= "> ".length);
}

function popValueFromDigits() {
  var val;
  if (fmtHex) {
    val = parseInt(digits.substr(2), 16);
  }
  else {
    val = parseInt(digits.substr(2));
  }
  return val;
}

function pushValueToDigits(value) {
  if (fmtHex)
    digits = "> " + value.toString(16);
  else
    digits = "> " + value.toString(10);
  digits = digits.toUpperCase();
}

///////////////////////////////////////////////////////////
// RESULT LINES FUNCTIONS
///////////////////////////////////////////////////////////
function showLines() {
  var val;
  var str;
  var line;

  for (i=0; i<MAX_LINES_SHOWN; i++) {
    val = stack[i];
    str = i+1 + ": ";
    if (val !== undefined) {
      if (fmtHex) {
        // add leading 0's
        vstr = (val < 0 ? (MAX_VALUE + val + 1) : val).toString(16)
        len = vstr.length;
        while (vstr.length < MAX_DIGITS) {
          vstr = "0" + vstr;
        }
        vstr = vstr.toUpperCase();
        str += vstr;
      }
      else {
        str +=  val.toString(10);
      }
    }
    line = "line" + i;
    document.getElementById(line).innerHTML = str;
  }
}

function formatLines(fmt) {
  showLines();
}

function clearLines() {
  stack = [];
  showLines();
}

function pushLine() {
  var val;
  if (digitsEmpty()) {
    val = stack[0];
  } else {
    val = popValueFromDigits();
  }
  stack.unshift(val);
  showLines();
  clearDigits();

  saveToLocalStorage();
}

function popLine() {
  val = stack.shift();
  showLines();
  return (val === undefined ? 0 : val);
}

function clearAll() {
  clearDigits();
  clearLines();
}

///////////////////////////////////////////////////////////
// OPERANDS FUNCTIONS
///////////////////////////////////////////////////////////
function getOneOperand() {
  var val1;
  if (digitsEmpty()) {
    val1 = popLine();
  } else {
    val1 = popValueFromDigits();
  }
  return val1;
}

function getTwoOperands() {
  var val1, val2;
  if (digitsEmpty()) {
    val1 = popLine();
    val2 = popLine();
  } else {
    val1 = popValueFromDigits();
    clearDigits();
    val2 = popLine();
  }
  return {val1, val2};
}

///////////////////////////////////////////////////////////
// CLICK FUNCTIONS
///////////////////////////////////////////////////////////
function digitClick(digit) {
  pushDigit(digit);
}

function formatClick() {
  op = $("#buttonFormat")[0].innerText;
  switch (op) {
    case "%d": $("#buttonFormat").html("%x"); fmtHex = false; break;
    case "%x": $("#buttonFormat").html("%d"); fmtHex = true;  break;
  }
  for (i = 0; i < opsHexOnly.length; i++) {
    str = "#" + buttonIdName(opsHexOnly[i]);
    if (fmtHex)
      $(str).removeAttr("disabled");
    else
      $(str).attr("disabled", "true");
  }
  // disable . for now
  $("#buttonDot").attr("disabled", "true");
  formatLines(op);

  saveToLocalStorage();
}

function operationClick(op) {
  switch (op) {
    case "drop":
      popLine();
      break;
    case "clr":
      popDigit();
      break;
    case "ac":
      clearAll();
      break;
    case "enter":
      pushLine();
      break;
    case "+":
      var {val1, val2} = getTwoOperands();
      pushValueToDigits(val2 + val1);
      pushLine();
      break;
    case "-":
      var {val1, val2} = getTwoOperands();
      pushValueToDigits(val2 - val1);
      pushLine();
      break;
    case "*":
      var {val1, val2} = getTwoOperands();
      pushValueToDigits(val2 * val1);
      pushLine();
      break;
    case "/":
      var {val1, val2} = getTwoOperands();
      pushValueToDigits(Math.floor(val2 / val1));
      pushLine();
      break;
    case "|":
      var {val1, val2} = getTwoOperands();
      pushValueToDigits(val2 | val1);
      pushLine();
      break;
      case "^":
        var {val1, val2} = getTwoOperands();
        pushValueToDigits(val2 ^ val1);
        pushLine();
        break;
    case "&amp;":
      var {val1, val2} = getTwoOperands();
      pushValueToDigits(val2 & val1);
      pushLine();
      break;
    case "~":
      var val1 = getOneOperand();
      pushValueToDigits(~val1);
      pushLine();
      break;
    case "<<":
      var val1 = getOneOperand();
      pushValueToDigits(val1 << 1);
      pushLine();
      break;
    case ">>":
      var val1 = getOneOperand();
      pushValueToDigits(val1 >> 1);
      pushLine();
      break;
    case "+/-":
      var val1 = popValueFromDigits();
      pushValueToDigits(-1 * val1);
      showDigits();
      break;
  }
}

function buttonClickFunction(op) {
  result = function() {digitClick(op)}; // default
  if (operations.indexOf(op) >= 0)
    result = function() {operationClick(op)};
  if (op == "%d")
    result = formatClick;
  return result;
}

///////////////////////////////////////////////////////////
// BUILD HTML
///////////////////////////////////////////////////////////
function buttonIdName(op) {
  return "button" + opNames[ops.indexOf(op)];
}

function buttonWidthString(op) {
  result = "button-";
  switch (op) {
    case "drop":
    case "enter":
      result += "double";
      break;
    default:
      result += "single";
      break;
  }
  return result;
}

function buildHtml() {
  // build results area
  var calc=$("#calculator");
  var results = $("<div></div>").addClass("results");
  for (i = MAX_LINES_SHOWN-1; i >= 0; i--) {
    line = $("<p></p>").addClass("result-line").attr("id", "line" + i);
    results.append(line);
  }

  // build input line
  line = $("<p></p>").addClass("result-line").attr("id", "digits");
  results.append(line);
  calc.append(results);

  // build buttons
  container = $("<div></div>").addClass("button-container");
  for (i = 0; i < ops.length; i++) {
    op = ops[i];
    btn = $("<button></button>")
          .addClass("button")
          .addClass(buttonWidthString(op))
          .attr("id", buttonIdName(op))
          .html(op)
          .click(buttonClickFunction(op));
    container.append(btn);
  }
  calc.append(container);
  // disable . for now
  $("#buttonDot").attr("disabled", "true");
}

// simulatedActive = false
// function simulateButton(text) {
//   el = document.getElementById('button' + text);
//   el.classList.add('button-active');
//   setTimeout(function () {
//     el.click();
//     el.classList.remove('button-active');
//   }, 100);
// }

// debounce = false
// $(document).keyup(function(e) {
//   //TODO: need to fix problem with innerHtml of result not updating
//   //      if set from keys
//   if (debounce) return;
//   debounce = true;
//   setTimeout(function() {
//     debounce = false;
//   }, 2000);
//   switch (e.keyCode) {
//     case 48: simulateButton('0');       break;
//     case 49: simulateButton('1');       break;
//     case 50: simulateButton('2');       break;
//     case 51: simulateButton('3');       break;
//     case 52: simulateButton('4');       break;
//     case 53: 
//       if (e.shiftKey) formatClick();
//       else            simulateButton('5'); 
//       break;
//     case 54:
//       if (e.shiftKey) simulateButton('Xor');
//       else            simulateButton('6'); 
//       break;
//     case 55:
//       if (e.shiftKey) simulateButton('And');
//       else            simulateButton('7'); 
//       break;
//     case 56:
//       if (e.shiftKey) simulateButton('Mul');
//       else            simulateButton('8'); 
//       break;
//     case 57: simulateButton('9');       break;
//     case 65: simulateButton('A');       break;
//     case 66: simulateButton('B');       break;
//     case 67: simulateButton('C');       break;
//     case 68: simulateButton('D');       break;
//     case 69: simulateButton('E');       break;
//     case 70: simulateButton('F');       break;
//     case 13: simulateButton('Enter');   break;
//     case 40: simulateButton('Drop');    break;
//     case  8: simulateButton('Clr');     break;
//     case  12: simulateButton('ClrAll'); break;
//     case 110: simulateButton('Clr');    break;
//     case 187: if (e.shiftKey) simulateButton('Plus');        break;
//     case 189: if (e.shiftKey) simulateButton('Minus');       break;
//     case 191: simulateButton('Div');    break;
//     case 111: simulateButton('Div');    break;
//     case 106: simulateButton('Mul');    break;
//     case 107: simulateButton('Plus');   break;
//     case 109: simulateButton('Minus');  break;
//     case 37: simulateButton('Chs');     break;
//     case 39: simulateButton('Chs');     break;
//     case 220: if (e.shiftKey) simulateButton('Or');          break;
//     case 193: if (e.shiftKey) simulateButton('Not');         break;
//     case 188: if (e.shiftKey) simulateButton('ShiftLeft');   break;
//     case 190: if (e.shiftKey) simulateButton('ShiftRight');  break;   
//   }
//});

$('#title').click(function() {
  document.getElementById('about-overlay').style.display = "block";
  document.getElementById('about').style.display = "block";
})

$('#about').click(function() {
  document.getElementById('about-overlay').style.display = "none";
  document.getElementById('about').style.display = "none";
})

///////////////////////////////////////////////////////////
// MAIN
///////////////////////////////////////////////////////////
buildHtml();
clearDigits();
clearLines();

getFromLocalStorage();
