; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65290 () Bool)

(assert start!65290)

(declare-fun b!741188 () Bool)

(declare-fun res!498534 () Bool)

(declare-fun e!414331 () Bool)

(assert (=> b!741188 (=> (not res!498534) (not e!414331))))

(declare-datatypes ((array!41463 0))(
  ( (array!41464 (arr!19845 (Array (_ BitVec 32) (_ BitVec 64))) (size!20266 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41463)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!741188 (= res!498534 (validKeyInArray!0 (select (arr!19845 a!3186) j!159)))))

(declare-fun b!741189 () Bool)

(declare-fun res!498539 () Bool)

(assert (=> b!741189 (=> (not res!498539) (not e!414331))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!741189 (= res!498539 (validKeyInArray!0 k!2102))))

(declare-fun b!741190 () Bool)

(declare-fun e!414328 () Bool)

(declare-fun e!414332 () Bool)

(assert (=> b!741190 (= e!414328 e!414332)))

(declare-fun res!498527 () Bool)

(assert (=> b!741190 (=> (not res!498527) (not e!414332))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7445 0))(
  ( (MissingZero!7445 (index!32148 (_ BitVec 32))) (Found!7445 (index!32149 (_ BitVec 32))) (Intermediate!7445 (undefined!8257 Bool) (index!32150 (_ BitVec 32)) (x!63131 (_ BitVec 32))) (Undefined!7445) (MissingVacant!7445 (index!32151 (_ BitVec 32))) )
))
(declare-fun lt!329305 () SeekEntryResult!7445)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41463 (_ BitVec 32)) SeekEntryResult!7445)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!741190 (= res!498527 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19845 a!3186) j!159) mask!3328) (select (arr!19845 a!3186) j!159) a!3186 mask!3328) lt!329305))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!741190 (= lt!329305 (Intermediate!7445 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun lt!329307 () SeekEntryResult!7445)

(declare-fun e!414330 () Bool)

(declare-fun b!741191 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41463 (_ BitVec 32)) SeekEntryResult!7445)

(assert (=> b!741191 (= e!414330 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19845 a!3186) j!159) a!3186 mask!3328) lt!329307))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!414335 () Bool)

(declare-fun b!741192 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!741192 (= e!414335 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19845 a!3186) j!159) a!3186 mask!3328) (Found!7445 j!159)))))

(declare-fun e!414334 () Bool)

(declare-fun lt!329304 () SeekEntryResult!7445)

(declare-fun b!741193 () Bool)

(assert (=> b!741193 (= e!414334 (not (or (not (is-Intermediate!7445 lt!329304)) (not (= x!1131 (x!63131 lt!329304))) (not (= index!1321 (index!32150 lt!329304))) (bvsge mask!3328 #b00000000000000000000000000000000))))))

(declare-fun e!414329 () Bool)

(assert (=> b!741193 e!414329))

(declare-fun res!498535 () Bool)

(assert (=> b!741193 (=> (not res!498535) (not e!414329))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41463 (_ BitVec 32)) Bool)

(assert (=> b!741193 (= res!498535 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25370 0))(
  ( (Unit!25371) )
))
(declare-fun lt!329309 () Unit!25370)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41463 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25370)

(assert (=> b!741193 (= lt!329309 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!498529 () Bool)

(assert (=> start!65290 (=> (not res!498529) (not e!414331))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65290 (= res!498529 (validMask!0 mask!3328))))

(assert (=> start!65290 e!414331))

(assert (=> start!65290 true))

(declare-fun array_inv!15641 (array!41463) Bool)

(assert (=> start!65290 (array_inv!15641 a!3186)))

(declare-fun b!741194 () Bool)

(assert (=> b!741194 (= e!414331 e!414328)))

(declare-fun res!498533 () Bool)

(assert (=> b!741194 (=> (not res!498533) (not e!414328))))

(declare-fun lt!329303 () SeekEntryResult!7445)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!741194 (= res!498533 (or (= lt!329303 (MissingZero!7445 i!1173)) (= lt!329303 (MissingVacant!7445 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41463 (_ BitVec 32)) SeekEntryResult!7445)

(assert (=> b!741194 (= lt!329303 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!741195 () Bool)

(declare-fun res!498526 () Bool)

(assert (=> b!741195 (=> (not res!498526) (not e!414328))))

(declare-datatypes ((List!13847 0))(
  ( (Nil!13844) (Cons!13843 (h!14915 (_ BitVec 64)) (t!20162 List!13847)) )
))
(declare-fun arrayNoDuplicates!0 (array!41463 (_ BitVec 32) List!13847) Bool)

(assert (=> b!741195 (= res!498526 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13844))))

(declare-fun b!741196 () Bool)

(assert (=> b!741196 (= e!414332 e!414334)))

(declare-fun res!498532 () Bool)

(assert (=> b!741196 (=> (not res!498532) (not e!414334))))

(declare-fun lt!329302 () SeekEntryResult!7445)

(assert (=> b!741196 (= res!498532 (= lt!329302 lt!329304))))

(declare-fun lt!329306 () array!41463)

(declare-fun lt!329308 () (_ BitVec 64))

(assert (=> b!741196 (= lt!329304 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329308 lt!329306 mask!3328))))

(assert (=> b!741196 (= lt!329302 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329308 mask!3328) lt!329308 lt!329306 mask!3328))))

(assert (=> b!741196 (= lt!329308 (select (store (arr!19845 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!741196 (= lt!329306 (array!41464 (store (arr!19845 a!3186) i!1173 k!2102) (size!20266 a!3186)))))

(declare-fun b!741197 () Bool)

(declare-fun res!498536 () Bool)

(assert (=> b!741197 (=> (not res!498536) (not e!414332))))

(assert (=> b!741197 (= res!498536 e!414335)))

(declare-fun c!81712 () Bool)

(assert (=> b!741197 (= c!81712 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!741198 () Bool)

(declare-fun res!498530 () Bool)

(assert (=> b!741198 (=> (not res!498530) (not e!414331))))

(assert (=> b!741198 (= res!498530 (and (= (size!20266 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20266 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20266 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!741199 () Bool)

(assert (=> b!741199 (= e!414335 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19845 a!3186) j!159) a!3186 mask!3328) lt!329305))))

(declare-fun b!741200 () Bool)

(declare-fun res!498525 () Bool)

(assert (=> b!741200 (=> (not res!498525) (not e!414331))))

(declare-fun arrayContainsKey!0 (array!41463 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!741200 (= res!498525 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!741201 () Bool)

(assert (=> b!741201 (= e!414329 e!414330)))

(declare-fun res!498528 () Bool)

(assert (=> b!741201 (=> (not res!498528) (not e!414330))))

(assert (=> b!741201 (= res!498528 (= (seekEntryOrOpen!0 (select (arr!19845 a!3186) j!159) a!3186 mask!3328) lt!329307))))

(assert (=> b!741201 (= lt!329307 (Found!7445 j!159))))

(declare-fun b!741202 () Bool)

(declare-fun res!498531 () Bool)

(assert (=> b!741202 (=> (not res!498531) (not e!414328))))

(assert (=> b!741202 (= res!498531 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20266 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20266 a!3186))))))

(declare-fun b!741203 () Bool)

(declare-fun res!498537 () Bool)

(assert (=> b!741203 (=> (not res!498537) (not e!414328))))

(assert (=> b!741203 (= res!498537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!741204 () Bool)

(declare-fun res!498538 () Bool)

(assert (=> b!741204 (=> (not res!498538) (not e!414332))))

(assert (=> b!741204 (= res!498538 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19845 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!65290 res!498529) b!741198))

(assert (= (and b!741198 res!498530) b!741188))

(assert (= (and b!741188 res!498534) b!741189))

(assert (= (and b!741189 res!498539) b!741200))

(assert (= (and b!741200 res!498525) b!741194))

(assert (= (and b!741194 res!498533) b!741203))

(assert (= (and b!741203 res!498537) b!741195))

(assert (= (and b!741195 res!498526) b!741202))

(assert (= (and b!741202 res!498531) b!741190))

(assert (= (and b!741190 res!498527) b!741204))

(assert (= (and b!741204 res!498538) b!741197))

(assert (= (and b!741197 c!81712) b!741199))

(assert (= (and b!741197 (not c!81712)) b!741192))

(assert (= (and b!741197 res!498536) b!741196))

(assert (= (and b!741196 res!498532) b!741193))

(assert (= (and b!741193 res!498535) b!741201))

(assert (= (and b!741201 res!498528) b!741191))

(declare-fun m!692185 () Bool)

(assert (=> b!741189 m!692185))

(declare-fun m!692187 () Bool)

(assert (=> b!741201 m!692187))

(assert (=> b!741201 m!692187))

(declare-fun m!692189 () Bool)

(assert (=> b!741201 m!692189))

(declare-fun m!692191 () Bool)

(assert (=> b!741200 m!692191))

(declare-fun m!692193 () Bool)

(assert (=> b!741195 m!692193))

(declare-fun m!692195 () Bool)

(assert (=> b!741196 m!692195))

(declare-fun m!692197 () Bool)

(assert (=> b!741196 m!692197))

(assert (=> b!741196 m!692195))

(declare-fun m!692199 () Bool)

(assert (=> b!741196 m!692199))

(declare-fun m!692201 () Bool)

(assert (=> b!741196 m!692201))

(declare-fun m!692203 () Bool)

(assert (=> b!741196 m!692203))

(declare-fun m!692205 () Bool)

(assert (=> b!741194 m!692205))

(assert (=> b!741199 m!692187))

(assert (=> b!741199 m!692187))

(declare-fun m!692207 () Bool)

(assert (=> b!741199 m!692207))

(assert (=> b!741192 m!692187))

(assert (=> b!741192 m!692187))

(declare-fun m!692209 () Bool)

(assert (=> b!741192 m!692209))

(assert (=> b!741188 m!692187))

(assert (=> b!741188 m!692187))

(declare-fun m!692211 () Bool)

(assert (=> b!741188 m!692211))

(declare-fun m!692213 () Bool)

(assert (=> b!741203 m!692213))

(declare-fun m!692215 () Bool)

(assert (=> b!741204 m!692215))

(assert (=> b!741190 m!692187))

(assert (=> b!741190 m!692187))

(declare-fun m!692217 () Bool)

(assert (=> b!741190 m!692217))

(assert (=> b!741190 m!692217))

(assert (=> b!741190 m!692187))

(declare-fun m!692219 () Bool)

(assert (=> b!741190 m!692219))

(assert (=> b!741191 m!692187))

(assert (=> b!741191 m!692187))

(declare-fun m!692221 () Bool)

(assert (=> b!741191 m!692221))

(declare-fun m!692223 () Bool)

(assert (=> b!741193 m!692223))

(declare-fun m!692225 () Bool)

(assert (=> b!741193 m!692225))

(declare-fun m!692227 () Bool)

(assert (=> start!65290 m!692227))

(declare-fun m!692229 () Bool)

(assert (=> start!65290 m!692229))

(push 1)

