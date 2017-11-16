let maximumNumberOfLoginAttempts = 10

var currentLoginAttempt = 0

var x = 0.0, y = 0.0, z = 0.0

//: ### Type Annotations
var welcomeMessage: String
welcomeMessage = "Hello"

var red, green, blue: Double

//: ### Naming Constants and Variables
let π = 3.14159
let 你好 = "ＨＥＬＬＯ ＷＯＲＬＤ"
let 🐶🐮 = "dogcow"

var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!"

let languageName = "Swift"
//languageName = "Swift++" // Compile time error

//: Printing Constants and Variables
print(friendlyWelcome)

print(π, 你好, 🐶🐮, separator: "-", terminator: "xx")

print("The current value of friendlyWelcome is \(languageName)")

//: ## Comments
// this is a comment

/* this is also a comment,
 but written over multiple lines*/

/* this is the start of the first multiline comment
 /* this is the second, nested multiline comment */
 this is the end of the first multiline comment */

//: ## Semicolons
let cat = "🐱";
print(cat)

//: ## Integers
//: ### Integer Bounds
let minValue = UInt8.min
let maxValue = UInt8.max

//: ## Floating-Point Numbers
var w = [1, 1.2]


//: ## Type Safety and Type Inference
var meaningOfLife = 42
// inferred to be of type Int
// meaningOfLife = 35.0 //Type Error

let  pi = 3.14159
let anotherPi = 3 + 0.14159


//: ## Numeric Literals
let descimalInteger = 17
let binaryInteger = 0b10001
let octalInteger = 0o21
let hexadecimalInteger = 0x11

//let hexFloat = 0x1234.0x5678

var float1 = 1.25e2
var float2 = 1.25e-2

var ex3 = 0xFp2
var ex4 = 0x8p4

let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecialDouble = 0xC.3p0

let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

//: ## Numeric Conversion
//: ### Integer Conversion
//let cannotBeNegative: UInt8 = -1
//let tooBig: Int8 = Int8.max + 1
let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

//: ### Integer and Floating Point Conversion
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi2 = Double(three) + pointOneFourOneFiveNine

let integerPi = Int(pi)
// Floats are always truncated when cast to Integers
let integerFourPointSeven = Int(4.75)
let integerNegativeThreePointNine = Int(-3.9)
// Literals can be cross type combined because they have no type until they are evaluated
let aaa = (3 + 0.14159)


//: ## Type Aliases
// Type aliases are useful when you want to refer to an existing type by a name that is contextually more appropriate, such as when working with data of a specific size from an external source:

typealias AudioSample = UInt16
var macAmplitudeFound = AudioSample.min


//: ## Booleans
let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, turnips are horrible.")
}

// Non-Bool types can't be used for flow control
let i = 1
/*
 if i {
 
 }
 */
if i == 1 {
    
}


//: ## Tuples => 元組
let http404Error = (404, "Not Found")
http404Error.0

let aa = [0,1]

let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")

// use _ if you don't want to decompose one of the values of a tuple
let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")

// You can access the values of the tuple using index numbers
print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")

// You can name the elements of a tuple when it is defined
let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode)")
print("The status message is \(http200Status.description)")
// “Tuples are useful for temporary groups of related values. They are not suited to the creation of complex data structures. If your data structure is likely to persist beyond a temporary scope, model it as a class or structure, rather than as a tuple. For more information”


//: ## Optionals
let possibleNumber = "123"
let convertedNumber: Int? = Int(possibleNumber)
// convertedNumber is inferred to be ot type "Int?" (optional Int)

// nil
var serverResponseCode: Int? = 404
serverResponseCode = nil

var surveyAnswer: String?
// surveyAnswer is automatically set to nil

// If statements and forced Unwrapping
if convertedNumber != nil {
    print("convertedNumber contains some integer value.")
}

if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!)")
}


//: ### Optional Binding

if let actualNumber = Int(possibleNumber) {
    print("\'\(possibleNumber)\' has a value of \(actualNumber)")
} else {
    print("\'\(possibleNumber)\' could not be converted to an Int")
}

if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}

if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}


//: ### Implicitly Unwrapped Optionals
//: Implicitly unwrapped optionals are useful when an optional’s value is confirmed to exist immediately after the optional is first defined and can definitely be assumed to exist at every point thereafter. The primary use of implicitly unwrapped optionals in Swift is during class initialization

let possibleString: String? = "An optional string."
let forcedString: String = possibleString!

let assumedString: String! = "An implicitly unwrapped optional string"
let implicitString: String = assumedString

if assumedString != nil {
    print(assumedString)
}

if let definiteString = assumedString {
    print(definiteString)
}



//:  Implicitly unwrapped optionals should not be used when there is a possibility of a variable becoming nil at a later point. Always use a normal optional type if you need to check for a nil value during the lifetime of a variable.

//: ## Error Handling
//: In contrast to optionals, which can use the presence or absence of a value to signify success or failure of a function, error handling allows you to determine the underlying cause of failure and if necessary propagate the error to another part of your program.

func canThrowError() throws {
    // This function may or may not throw an error.
}

do {
    try canThrowError()
    // no error was thrown
} catch {
    // an error was thrown
}

enum SandwichError: Error {
    case OutOfCleanDishes
    case MissingIngredients([String])
}

func makeASandwich() throws {
    let sandwichFail = false
    
    
    
    
    if sandwichFail {
        throw SandwichError.MissingIngredients(["butter","ham","bread"])
    }
    
}
func eatASandwich() {
    print("yum yum yum")
}
func washDishes() {
    print("Wash the dishes")
}
func buyGroceries(ingredients: [String]) {
    ingredients.forEach{ i in print(i) }
}

do {
    try makeASandwich()
    eatASandwich()
}
catch SandwichError.OutOfCleanDishes {
    washDishes()
}
catch SandwichError.MissingIngredients(let ingredients) {
    buyGroceries(ingredients: ingredients)
} catch {
    print("Why did I fail")
}

//: ## Assertions
//: ### Debugging with Assertions
//: Use an assertion whenever a condition has the potential to be false, but must definitely be true in order for your code to continue execution.
let age = -3
//assert(age >= 0, "A person's age cannot be less than zero")
// Left this out as it stops the REPL from continuing






// ========== Strings and Characters ===============




let someString = "Some tring literal value"

//let quotation = """
//The White Rabbit put on his spectacles. "Where shall I begin,
//please your Majesty?" he asked.
//
//"Begin at the beginning," the king said gravely, "and go on
//till you come to the end; then stop."
//"""
//
//let threeDoubleQuotes = """
//Escaping the first quote \"""
//Escaping all three quotes \"\"\"
//"""
//
//let singleLineString = "These are the same."
//let mutilineString = """
//These are the same.
//"""
//
//"""
//
//This string starts with a line feed.
//It also ends with a line feed.
//
//"""
//
//func generateQuotation() -> String {
//    let quotation = """
//        The White Rabbit put on his spectacles. "Where shall I begin,
//        please your Majesty?" he asked.
//
//        "Begin at the beginning," the king said gravely, "and go on
//        till you come to the end; then stop."
//        """
//    return quotation
//}
//print(quotation == generateQuotation())


// Initializing an Empty Strings
var emptyString = ""
var anotherEmpyString = String()
if emptyString == "" {
    print("Nothing to see here")
}

// String mutability
var variableString = "Horse"
variableString += " and carriage"

let constantString = "Highlander"
// constantString += " and another Highlander" // There can be only one


// Working with Characters
for character in "Dog!🐶".characters {
    print(character)
}

let exclamationMark: Character = "!"

let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)
catString


// Concatenating Strings and Characters
let string1 = "Hello"
let string2 = " there"
var welcome = string1 + string2
// Welcome now equals "hellow there"

var instruction = "look over"
instruction += string2

welcome.append(exclamationMark)


// String Interpolation
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"


// Special Characters in String LIterals
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
// "Imagination is more important than knowledge" - Einstein
let dollarSign = "\u{24}"           // $,  Unicode scalar U+0024
let blackHeart = "\u{2665}"         // ♥,  Unicode scalar U+2665
let sparklingHeart = "\u{1F496}"    // 💖, Unicode scalar U+1F496


// Extended Grapheme Clusters
let eAcute: Character = "\u{E9}"                // é
let combinedEAcute: Character = "\u{65}\u{301}" // e followed by ́
// eAcute is é, combinedEAcute is é

let precomposed: Character = "\u{D55C}"                 // 한
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"  // ᄒ, ᅡ, ᆫ
// precomposed is 한, decomposed is 한

let enclosedEAcute: Character = "\u{E9}\u{20DD}"
// enclosedEAcute is é⃝

let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
// regionalIndicatorForUS is 🇺🇸

let regionalIndicatorForAUS: Character = "\u{1F1E6}\u{1F1FA}"
// regionalIndicatorForAUS is 🇦🇺


// Counting Characters
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.characters.count) characters")
// prints "unusualMenagerie has 40 characters"

// Note that Swift's use of extended grapheme clusters for Character values means that string concatenation and modification may not always affect a string's character count.

var word = "cafe"
print("the number of characters in \(word) is \(word.characters.count)")
// prints "the number of characters in cafe is 4"

word += "\u{301}" // Combining Acute accent, U+301

print("the number of characters in \(word) is \(word.characters.count)")
// prints "the number of characters in café is 4"


// Accessing and Modifying a String
// String Indices
// Different characters can require different amounts of memory to store, so in order to determine which Character is at a particular position, you must iterate over each Unicode scalar from the start or end of that String. For this reaason, Swift strings cannot be indexed by integer values.

let greeting = "Guten Tag!"
greeting[greeting.startIndex]                               // G
greeting[greeting.index(before: greeting.endIndex)]         // !
greeting[greeting.index(after: greeting.startIndex)]        // u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]                                             // a
// greeting[greeting.endIndex]                              // error
// greeting.endIndex.successor()                            // error

for index in greeting.characters.indices {
    print("\(greeting[index]) ", terminator: "")
}
// prints "G u t e n  T a g !"


// Inserting and Removing
// To insert a character at a specified index.
var welcome2 = "hello"
welcome2.insert("!", at: welcome2.endIndex)

// To insert another string at a specified index
welcome2.insert(contentsOf:" there".characters, at: welcome2.index(before: welcome2.endIndex))

// To remove a character at a specified index
welcome2.remove(at: welcome2.index(before: welcome2.endIndex))
welcome2

// To remove a substring
let range = welcome2.index(welcome2.endIndex, offsetBy: -6)..<welcome2.endIndex
welcome2.removeSubrange(range)


// Comparing Strings
let quotation2 = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation2 == sameQuotation {
    print("These two strings are considered equal")
}
// Two String values are considered equal if their extended grapheme clusters are canonically equivalent (if they have the same linguistic meaning and appearance, even if the are composed from different Unicode scalars).

// "Voulez-vous un café?" using LATIN SMALL LETTER E WITH ACUTE
let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"

// "Voulez-vous un café?" using LATIN SMALL LETTER E and COMBINING ACUTE ACCENT
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"
let combinedEAcuteQuestion2 = "Voulez-vous un cafe\u{301}?"

if eAcuteQuestion == combinedEAcuteQuestion {
    print("These two strings are considered equal")
}

// Conversely, characters that are visually similar but do not have the same linguistic meaning are not considered equal.
let latinCapitalLeterA: Character = "\u{41}"
let cyrillicCapitalLetterA: Character = "\u{0410}"
if latinCapitalLeterA != cyrillicCapitalLetterA {
    print("These two characters are not equivalent")
}


// Prefix and Suffix Equality
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]
var act1SceneCount = 0
for scene:String in romeoAndJuliet {
    if scene.hasPrefix("Act 1") {
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in Act 1")

var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")


// Unicode Representations of Strings
let dogString = "Dog!!🐶"

// UTF-8 Representation
for codeUnit in dogString.utf8 {
    print("\(codeUnit) ", terminator: "")
}
print("")

// UTF-16 Representation
for codeUnit in dogString.utf16 {
    print("\(codeUnit) ", terminator: "")
}
print("")

// Unicode Scalar Representation
for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ", terminator: "")
}
print("")

for scalar in dogString.unicodeScalars {
    print("\(scalar)")
}

