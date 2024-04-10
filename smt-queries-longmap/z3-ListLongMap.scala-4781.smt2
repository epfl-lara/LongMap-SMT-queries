; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65748 () Bool)

(assert start!65748)

(declare-fun b!755220 () Bool)

(declare-datatypes ((Unit!26076 0))(
  ( (Unit!26077) )
))
(declare-fun e!421164 () Unit!26076)

(declare-fun Unit!26078 () Unit!26076)

(assert (=> b!755220 (= e!421164 Unit!26078)))

(declare-fun b!755221 () Bool)

(declare-fun e!421163 () Bool)

(declare-fun e!421165 () Bool)

(assert (=> b!755221 (= e!421163 e!421165)))

(declare-fun res!510437 () Bool)

(assert (=> b!755221 (=> res!510437 e!421165)))

(declare-datatypes ((SeekEntryResult!7674 0))(
  ( (MissingZero!7674 (index!33064 (_ BitVec 32))) (Found!7674 (index!33065 (_ BitVec 32))) (Intermediate!7674 (undefined!8486 Bool) (index!33066 (_ BitVec 32)) (x!63968 (_ BitVec 32))) (Undefined!7674) (MissingVacant!7674 (index!33067 (_ BitVec 32))) )
))
(declare-fun lt!336151 () SeekEntryResult!7674)

(declare-fun lt!336157 () SeekEntryResult!7674)

(assert (=> b!755221 (= res!510437 (not (= lt!336151 lt!336157)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!41921 0))(
  ( (array!41922 (arr!20074 (Array (_ BitVec 32) (_ BitVec 64))) (size!20495 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41921)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41921 (_ BitVec 32)) SeekEntryResult!7674)

(assert (=> b!755221 (= lt!336151 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20074 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!755222 () Bool)

(declare-fun e!421159 () Bool)

(declare-fun lt!336155 () SeekEntryResult!7674)

(assert (=> b!755222 (= e!421159 (= lt!336155 lt!336151))))

(declare-fun b!755223 () Bool)

(declare-fun res!510444 () Bool)

(assert (=> b!755223 (=> (not res!510444) (not e!421159))))

(declare-fun lt!336161 () array!41921)

(declare-fun lt!336158 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41921 (_ BitVec 32)) SeekEntryResult!7674)

(assert (=> b!755223 (= res!510444 (= (seekEntryOrOpen!0 lt!336158 lt!336161 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!336158 lt!336161 mask!3328)))))

(declare-fun b!755224 () Bool)

(declare-fun e!421167 () Bool)

(declare-fun e!421158 () Bool)

(assert (=> b!755224 (= e!421167 e!421158)))

(declare-fun res!510434 () Bool)

(assert (=> b!755224 (=> (not res!510434) (not e!421158))))

(declare-fun lt!336160 () SeekEntryResult!7674)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41921 (_ BitVec 32)) SeekEntryResult!7674)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!755224 (= res!510434 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20074 a!3186) j!159) mask!3328) (select (arr!20074 a!3186) j!159) a!3186 mask!3328) lt!336160))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!755224 (= lt!336160 (Intermediate!7674 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!755225 () Bool)

(declare-fun res!510441 () Bool)

(declare-fun e!421166 () Bool)

(assert (=> b!755225 (=> (not res!510441) (not e!421166))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41921 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!755225 (= res!510441 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!755226 () Bool)

(assert (=> b!755226 (= e!421166 e!421167)))

(declare-fun res!510435 () Bool)

(assert (=> b!755226 (=> (not res!510435) (not e!421167))))

(declare-fun lt!336154 () SeekEntryResult!7674)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!755226 (= res!510435 (or (= lt!336154 (MissingZero!7674 i!1173)) (= lt!336154 (MissingVacant!7674 i!1173))))))

(assert (=> b!755226 (= lt!336154 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!755227 () Bool)

(declare-fun res!510449 () Bool)

(assert (=> b!755227 (=> (not res!510449) (not e!421158))))

(declare-fun e!421162 () Bool)

(assert (=> b!755227 (= res!510449 e!421162)))

(declare-fun c!82773 () Bool)

(assert (=> b!755227 (= c!82773 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!755228 () Bool)

(declare-fun Unit!26079 () Unit!26076)

(assert (=> b!755228 (= e!421164 Unit!26079)))

(assert (=> b!755228 false))

(declare-fun b!755229 () Bool)

(assert (=> b!755229 (= e!421162 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20074 a!3186) j!159) a!3186 mask!3328) (Found!7674 j!159)))))

(declare-fun b!755230 () Bool)

(declare-fun e!421161 () Bool)

(assert (=> b!755230 (= e!421161 true)))

(assert (=> b!755230 e!421159))

(declare-fun res!510443 () Bool)

(assert (=> b!755230 (=> (not res!510443) (not e!421159))))

(declare-fun lt!336150 () (_ BitVec 64))

(assert (=> b!755230 (= res!510443 (= lt!336150 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!336153 () Unit!26076)

(assert (=> b!755230 (= lt!336153 e!421164)))

(declare-fun c!82774 () Bool)

(assert (=> b!755230 (= c!82774 (= lt!336150 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!755231 () Bool)

(declare-fun e!421160 () Bool)

(assert (=> b!755231 (= e!421160 (not e!421163))))

(declare-fun res!510448 () Bool)

(assert (=> b!755231 (=> res!510448 e!421163)))

(declare-fun lt!336152 () SeekEntryResult!7674)

(get-info :version)

(assert (=> b!755231 (= res!510448 (or (not ((_ is Intermediate!7674) lt!336152)) (bvslt x!1131 (x!63968 lt!336152)) (not (= x!1131 (x!63968 lt!336152))) (not (= index!1321 (index!33066 lt!336152)))))))

(declare-fun e!421169 () Bool)

(assert (=> b!755231 e!421169))

(declare-fun res!510446 () Bool)

(assert (=> b!755231 (=> (not res!510446) (not e!421169))))

(assert (=> b!755231 (= res!510446 (= lt!336155 lt!336157))))

(assert (=> b!755231 (= lt!336157 (Found!7674 j!159))))

(assert (=> b!755231 (= lt!336155 (seekEntryOrOpen!0 (select (arr!20074 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41921 (_ BitVec 32)) Bool)

(assert (=> b!755231 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!336159 () Unit!26076)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41921 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26076)

(assert (=> b!755231 (= lt!336159 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!755232 () Bool)

(assert (=> b!755232 (= e!421162 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20074 a!3186) j!159) a!3186 mask!3328) lt!336160))))

(declare-fun b!755233 () Bool)

(assert (=> b!755233 (= e!421165 e!421161)))

(declare-fun res!510451 () Bool)

(assert (=> b!755233 (=> res!510451 e!421161)))

(assert (=> b!755233 (= res!510451 (= lt!336150 lt!336158))))

(assert (=> b!755233 (= lt!336150 (select (store (arr!20074 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!755219 () Bool)

(assert (=> b!755219 (= e!421158 e!421160)))

(declare-fun res!510442 () Bool)

(assert (=> b!755219 (=> (not res!510442) (not e!421160))))

(declare-fun lt!336156 () SeekEntryResult!7674)

(assert (=> b!755219 (= res!510442 (= lt!336156 lt!336152))))

(assert (=> b!755219 (= lt!336152 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!336158 lt!336161 mask!3328))))

(assert (=> b!755219 (= lt!336156 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!336158 mask!3328) lt!336158 lt!336161 mask!3328))))

(assert (=> b!755219 (= lt!336158 (select (store (arr!20074 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!755219 (= lt!336161 (array!41922 (store (arr!20074 a!3186) i!1173 k0!2102) (size!20495 a!3186)))))

(declare-fun res!510438 () Bool)

(assert (=> start!65748 (=> (not res!510438) (not e!421166))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65748 (= res!510438 (validMask!0 mask!3328))))

(assert (=> start!65748 e!421166))

(assert (=> start!65748 true))

(declare-fun array_inv!15870 (array!41921) Bool)

(assert (=> start!65748 (array_inv!15870 a!3186)))

(declare-fun b!755234 () Bool)

(declare-fun res!510447 () Bool)

(assert (=> b!755234 (=> (not res!510447) (not e!421167))))

(assert (=> b!755234 (= res!510447 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20495 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20495 a!3186))))))

(declare-fun b!755235 () Bool)

(declare-fun res!510436 () Bool)

(assert (=> b!755235 (=> (not res!510436) (not e!421166))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!755235 (= res!510436 (validKeyInArray!0 (select (arr!20074 a!3186) j!159)))))

(declare-fun b!755236 () Bool)

(assert (=> b!755236 (= e!421169 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20074 a!3186) j!159) a!3186 mask!3328) lt!336157))))

(declare-fun b!755237 () Bool)

(declare-fun res!510440 () Bool)

(assert (=> b!755237 (=> (not res!510440) (not e!421158))))

(assert (=> b!755237 (= res!510440 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20074 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!755238 () Bool)

(declare-fun res!510445 () Bool)

(assert (=> b!755238 (=> (not res!510445) (not e!421167))))

(assert (=> b!755238 (= res!510445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!755239 () Bool)

(declare-fun res!510439 () Bool)

(assert (=> b!755239 (=> (not res!510439) (not e!421166))))

(assert (=> b!755239 (= res!510439 (validKeyInArray!0 k0!2102))))

(declare-fun b!755240 () Bool)

(declare-fun res!510450 () Bool)

(assert (=> b!755240 (=> (not res!510450) (not e!421166))))

(assert (=> b!755240 (= res!510450 (and (= (size!20495 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20495 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20495 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!755241 () Bool)

(declare-fun res!510452 () Bool)

(assert (=> b!755241 (=> (not res!510452) (not e!421167))))

(declare-datatypes ((List!14076 0))(
  ( (Nil!14073) (Cons!14072 (h!15144 (_ BitVec 64)) (t!20391 List!14076)) )
))
(declare-fun arrayNoDuplicates!0 (array!41921 (_ BitVec 32) List!14076) Bool)

(assert (=> b!755241 (= res!510452 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14073))))

(assert (= (and start!65748 res!510438) b!755240))

(assert (= (and b!755240 res!510450) b!755235))

(assert (= (and b!755235 res!510436) b!755239))

(assert (= (and b!755239 res!510439) b!755225))

(assert (= (and b!755225 res!510441) b!755226))

(assert (= (and b!755226 res!510435) b!755238))

(assert (= (and b!755238 res!510445) b!755241))

(assert (= (and b!755241 res!510452) b!755234))

(assert (= (and b!755234 res!510447) b!755224))

(assert (= (and b!755224 res!510434) b!755237))

(assert (= (and b!755237 res!510440) b!755227))

(assert (= (and b!755227 c!82773) b!755232))

(assert (= (and b!755227 (not c!82773)) b!755229))

(assert (= (and b!755227 res!510449) b!755219))

(assert (= (and b!755219 res!510442) b!755231))

(assert (= (and b!755231 res!510446) b!755236))

(assert (= (and b!755231 (not res!510448)) b!755221))

(assert (= (and b!755221 (not res!510437)) b!755233))

(assert (= (and b!755233 (not res!510451)) b!755230))

(assert (= (and b!755230 c!82774) b!755228))

(assert (= (and b!755230 (not c!82774)) b!755220))

(assert (= (and b!755230 res!510443) b!755223))

(assert (= (and b!755223 res!510444) b!755222))

(declare-fun m!703475 () Bool)

(assert (=> b!755231 m!703475))

(assert (=> b!755231 m!703475))

(declare-fun m!703477 () Bool)

(assert (=> b!755231 m!703477))

(declare-fun m!703479 () Bool)

(assert (=> b!755231 m!703479))

(declare-fun m!703481 () Bool)

(assert (=> b!755231 m!703481))

(assert (=> b!755229 m!703475))

(assert (=> b!755229 m!703475))

(declare-fun m!703483 () Bool)

(assert (=> b!755229 m!703483))

(declare-fun m!703485 () Bool)

(assert (=> b!755219 m!703485))

(declare-fun m!703487 () Bool)

(assert (=> b!755219 m!703487))

(declare-fun m!703489 () Bool)

(assert (=> b!755219 m!703489))

(assert (=> b!755219 m!703485))

(declare-fun m!703491 () Bool)

(assert (=> b!755219 m!703491))

(declare-fun m!703493 () Bool)

(assert (=> b!755219 m!703493))

(assert (=> b!755235 m!703475))

(assert (=> b!755235 m!703475))

(declare-fun m!703495 () Bool)

(assert (=> b!755235 m!703495))

(declare-fun m!703497 () Bool)

(assert (=> b!755238 m!703497))

(declare-fun m!703499 () Bool)

(assert (=> b!755226 m!703499))

(declare-fun m!703501 () Bool)

(assert (=> b!755237 m!703501))

(assert (=> b!755232 m!703475))

(assert (=> b!755232 m!703475))

(declare-fun m!703503 () Bool)

(assert (=> b!755232 m!703503))

(declare-fun m!703505 () Bool)

(assert (=> b!755239 m!703505))

(assert (=> b!755224 m!703475))

(assert (=> b!755224 m!703475))

(declare-fun m!703507 () Bool)

(assert (=> b!755224 m!703507))

(assert (=> b!755224 m!703507))

(assert (=> b!755224 m!703475))

(declare-fun m!703509 () Bool)

(assert (=> b!755224 m!703509))

(declare-fun m!703511 () Bool)

(assert (=> b!755241 m!703511))

(assert (=> b!755236 m!703475))

(assert (=> b!755236 m!703475))

(declare-fun m!703513 () Bool)

(assert (=> b!755236 m!703513))

(declare-fun m!703515 () Bool)

(assert (=> b!755223 m!703515))

(declare-fun m!703517 () Bool)

(assert (=> b!755223 m!703517))

(declare-fun m!703519 () Bool)

(assert (=> start!65748 m!703519))

(declare-fun m!703521 () Bool)

(assert (=> start!65748 m!703521))

(declare-fun m!703523 () Bool)

(assert (=> b!755225 m!703523))

(assert (=> b!755221 m!703475))

(assert (=> b!755221 m!703475))

(assert (=> b!755221 m!703483))

(assert (=> b!755233 m!703487))

(declare-fun m!703525 () Bool)

(assert (=> b!755233 m!703525))

(check-sat (not start!65748) (not b!755221) (not b!755239) (not b!755236) (not b!755232) (not b!755238) (not b!755223) (not b!755225) (not b!755226) (not b!755231) (not b!755229) (not b!755241) (not b!755219) (not b!755224) (not b!755235))
(check-sat)
