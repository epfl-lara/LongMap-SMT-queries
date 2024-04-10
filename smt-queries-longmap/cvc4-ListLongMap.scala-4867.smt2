; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67120 () Bool)

(assert start!67120)

(declare-fun b!775122 () Bool)

(declare-fun res!524132 () Bool)

(declare-fun e!431424 () Bool)

(assert (=> b!775122 (=> (not res!524132) (not e!431424))))

(declare-datatypes ((array!42475 0))(
  ( (array!42476 (arr!20333 (Array (_ BitVec 32) (_ BitVec 64))) (size!20754 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42475)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42475 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!775122 (= res!524132 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!775123 () Bool)

(declare-datatypes ((Unit!26746 0))(
  ( (Unit!26747) )
))
(declare-fun e!431428 () Unit!26746)

(declare-fun Unit!26748 () Unit!26746)

(assert (=> b!775123 (= e!431428 Unit!26748)))

(declare-fun lt!345258 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7933 0))(
  ( (MissingZero!7933 (index!34100 (_ BitVec 32))) (Found!7933 (index!34101 (_ BitVec 32))) (Intermediate!7933 (undefined!8745 Bool) (index!34102 (_ BitVec 32)) (x!65044 (_ BitVec 32))) (Undefined!7933) (MissingVacant!7933 (index!34103 (_ BitVec 32))) )
))
(declare-fun lt!345266 () SeekEntryResult!7933)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42475 (_ BitVec 32)) SeekEntryResult!7933)

(assert (=> b!775123 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345258 (select (arr!20333 a!3186) j!159) a!3186 mask!3328) lt!345266)))

(declare-fun b!775124 () Bool)

(declare-fun e!431432 () Bool)

(declare-fun e!431426 () Bool)

(assert (=> b!775124 (= e!431432 (not e!431426))))

(declare-fun res!524143 () Bool)

(assert (=> b!775124 (=> res!524143 e!431426)))

(declare-fun lt!345257 () SeekEntryResult!7933)

(assert (=> b!775124 (= res!524143 (or (not (is-Intermediate!7933 lt!345257)) (bvsge x!1131 (x!65044 lt!345257))))))

(declare-fun lt!345264 () SeekEntryResult!7933)

(assert (=> b!775124 (= lt!345264 (Found!7933 j!159))))

(declare-fun e!431427 () Bool)

(assert (=> b!775124 e!431427))

(declare-fun res!524141 () Bool)

(assert (=> b!775124 (=> (not res!524141) (not e!431427))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42475 (_ BitVec 32)) Bool)

(assert (=> b!775124 (= res!524141 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!345260 () Unit!26746)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42475 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26746)

(assert (=> b!775124 (= lt!345260 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!775125 () Bool)

(declare-fun res!524145 () Bool)

(declare-fun e!431430 () Bool)

(assert (=> b!775125 (=> (not res!524145) (not e!431430))))

(assert (=> b!775125 (= res!524145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!775126 () Bool)

(declare-fun res!524137 () Bool)

(declare-fun e!431425 () Bool)

(assert (=> b!775126 (=> res!524137 e!431425)))

(declare-fun lt!345261 () SeekEntryResult!7933)

(declare-fun lt!345267 () (_ BitVec 64))

(declare-fun lt!345256 () array!42475)

(assert (=> b!775126 (= res!524137 (not (= lt!345261 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345258 lt!345267 lt!345256 mask!3328))))))

(declare-fun b!775127 () Bool)

(assert (=> b!775127 (= e!431424 e!431430)))

(declare-fun res!524142 () Bool)

(assert (=> b!775127 (=> (not res!524142) (not e!431430))))

(declare-fun lt!345259 () SeekEntryResult!7933)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!775127 (= res!524142 (or (= lt!345259 (MissingZero!7933 i!1173)) (= lt!345259 (MissingVacant!7933 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42475 (_ BitVec 32)) SeekEntryResult!7933)

(assert (=> b!775127 (= lt!345259 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!775128 () Bool)

(declare-fun res!524140 () Bool)

(assert (=> b!775128 (=> (not res!524140) (not e!431424))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!775128 (= res!524140 (validKeyInArray!0 k!2102))))

(declare-fun b!775129 () Bool)

(declare-fun res!524149 () Bool)

(assert (=> b!775129 (=> (not res!524149) (not e!431424))))

(assert (=> b!775129 (= res!524149 (validKeyInArray!0 (select (arr!20333 a!3186) j!159)))))

(declare-fun b!775130 () Bool)

(declare-fun res!524139 () Bool)

(assert (=> b!775130 (=> res!524139 e!431425)))

(declare-fun e!431429 () Bool)

(assert (=> b!775130 (= res!524139 e!431429)))

(declare-fun c!85897 () Bool)

(declare-fun lt!345269 () Bool)

(assert (=> b!775130 (= c!85897 lt!345269)))

(declare-fun b!775131 () Bool)

(declare-fun res!524133 () Bool)

(declare-fun e!431423 () Bool)

(assert (=> b!775131 (=> (not res!524133) (not e!431423))))

(declare-fun e!431421 () Bool)

(assert (=> b!775131 (= res!524133 e!431421)))

(declare-fun c!85896 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!775131 (= c!85896 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!775132 () Bool)

(declare-fun Unit!26749 () Unit!26746)

(assert (=> b!775132 (= e!431428 Unit!26749)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!345263 () SeekEntryResult!7933)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42475 (_ BitVec 32)) SeekEntryResult!7933)

(assert (=> b!775132 (= lt!345263 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20333 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!775132 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345258 resIntermediateIndex!5 (select (arr!20333 a!3186) j!159) a!3186 mask!3328) lt!345264)))

(declare-fun b!775133 () Bool)

(assert (=> b!775133 (= e!431426 e!431425)))

(declare-fun res!524138 () Bool)

(assert (=> b!775133 (=> res!524138 e!431425)))

(assert (=> b!775133 (= res!524138 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!345258 #b00000000000000000000000000000000) (bvsge lt!345258 (size!20754 a!3186))))))

(declare-fun lt!345265 () Unit!26746)

(assert (=> b!775133 (= lt!345265 e!431428)))

(declare-fun c!85895 () Bool)

(assert (=> b!775133 (= c!85895 lt!345269)))

(assert (=> b!775133 (= lt!345269 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!775133 (= lt!345258 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!775134 () Bool)

(declare-fun res!524148 () Bool)

(assert (=> b!775134 (=> (not res!524148) (not e!431430))))

(declare-datatypes ((List!14335 0))(
  ( (Nil!14332) (Cons!14331 (h!15439 (_ BitVec 64)) (t!20650 List!14335)) )
))
(declare-fun arrayNoDuplicates!0 (array!42475 (_ BitVec 32) List!14335) Bool)

(assert (=> b!775134 (= res!524148 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14332))))

(declare-fun b!775135 () Bool)

(declare-fun res!524135 () Bool)

(assert (=> b!775135 (=> (not res!524135) (not e!431423))))

(assert (=> b!775135 (= res!524135 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20333 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!775136 () Bool)

(declare-fun res!524150 () Bool)

(assert (=> b!775136 (=> (not res!524150) (not e!431424))))

(assert (=> b!775136 (= res!524150 (and (= (size!20754 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20754 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20754 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!775137 () Bool)

(assert (=> b!775137 (= e!431421 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20333 a!3186) j!159) a!3186 mask!3328) (Found!7933 j!159)))))

(declare-fun b!775138 () Bool)

(assert (=> b!775138 (= e!431429 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345258 resIntermediateIndex!5 (select (arr!20333 a!3186) j!159) a!3186 mask!3328) lt!345264)))))

(declare-fun b!775139 () Bool)

(assert (=> b!775139 (= e!431421 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20333 a!3186) j!159) a!3186 mask!3328) lt!345266))))

(declare-fun b!775140 () Bool)

(assert (=> b!775140 (= e!431430 e!431423)))

(declare-fun res!524134 () Bool)

(assert (=> b!775140 (=> (not res!524134) (not e!431423))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!775140 (= res!524134 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20333 a!3186) j!159) mask!3328) (select (arr!20333 a!3186) j!159) a!3186 mask!3328) lt!345266))))

(assert (=> b!775140 (= lt!345266 (Intermediate!7933 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!775141 () Bool)

(assert (=> b!775141 (= e!431429 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345258 (select (arr!20333 a!3186) j!159) a!3186 mask!3328) lt!345266)))))

(declare-fun b!775142 () Bool)

(declare-fun e!431422 () Bool)

(assert (=> b!775142 (= e!431427 e!431422)))

(declare-fun res!524146 () Bool)

(assert (=> b!775142 (=> (not res!524146) (not e!431422))))

(declare-fun lt!345268 () SeekEntryResult!7933)

(assert (=> b!775142 (= res!524146 (= (seekEntryOrOpen!0 (select (arr!20333 a!3186) j!159) a!3186 mask!3328) lt!345268))))

(assert (=> b!775142 (= lt!345268 (Found!7933 j!159))))

(declare-fun b!775143 () Bool)

(assert (=> b!775143 (= e!431423 e!431432)))

(declare-fun res!524136 () Bool)

(assert (=> b!775143 (=> (not res!524136) (not e!431432))))

(assert (=> b!775143 (= res!524136 (= lt!345261 lt!345257))))

(assert (=> b!775143 (= lt!345257 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345267 lt!345256 mask!3328))))

(assert (=> b!775143 (= lt!345261 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345267 mask!3328) lt!345267 lt!345256 mask!3328))))

(assert (=> b!775143 (= lt!345267 (select (store (arr!20333 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!775143 (= lt!345256 (array!42476 (store (arr!20333 a!3186) i!1173 k!2102) (size!20754 a!3186)))))

(declare-fun b!775144 () Bool)

(declare-fun res!524144 () Bool)

(assert (=> b!775144 (=> (not res!524144) (not e!431430))))

(assert (=> b!775144 (= res!524144 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20754 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20754 a!3186))))))

(declare-fun res!524147 () Bool)

(assert (=> start!67120 (=> (not res!524147) (not e!431424))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67120 (= res!524147 (validMask!0 mask!3328))))

(assert (=> start!67120 e!431424))

(assert (=> start!67120 true))

(declare-fun array_inv!16129 (array!42475) Bool)

(assert (=> start!67120 (array_inv!16129 a!3186)))

(declare-fun b!775145 () Bool)

(assert (=> b!775145 (= e!431425 true)))

(assert (=> b!775145 (= (seekEntryOrOpen!0 lt!345267 lt!345256 mask!3328) lt!345264)))

(declare-fun lt!345262 () Unit!26746)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!42475 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26746)

(assert (=> b!775145 (= lt!345262 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3186 i!1173 k!2102 j!159 lt!345258 (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateIndex!5 resIntermediateX!5 mask!3328))))

(declare-fun b!775146 () Bool)

(assert (=> b!775146 (= e!431422 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20333 a!3186) j!159) a!3186 mask!3328) lt!345268))))

(assert (= (and start!67120 res!524147) b!775136))

(assert (= (and b!775136 res!524150) b!775129))

(assert (= (and b!775129 res!524149) b!775128))

(assert (= (and b!775128 res!524140) b!775122))

(assert (= (and b!775122 res!524132) b!775127))

(assert (= (and b!775127 res!524142) b!775125))

(assert (= (and b!775125 res!524145) b!775134))

(assert (= (and b!775134 res!524148) b!775144))

(assert (= (and b!775144 res!524144) b!775140))

(assert (= (and b!775140 res!524134) b!775135))

(assert (= (and b!775135 res!524135) b!775131))

(assert (= (and b!775131 c!85896) b!775139))

(assert (= (and b!775131 (not c!85896)) b!775137))

(assert (= (and b!775131 res!524133) b!775143))

(assert (= (and b!775143 res!524136) b!775124))

(assert (= (and b!775124 res!524141) b!775142))

(assert (= (and b!775142 res!524146) b!775146))

(assert (= (and b!775124 (not res!524143)) b!775133))

(assert (= (and b!775133 c!85895) b!775123))

(assert (= (and b!775133 (not c!85895)) b!775132))

(assert (= (and b!775133 (not res!524138)) b!775130))

(assert (= (and b!775130 c!85897) b!775141))

(assert (= (and b!775130 (not c!85897)) b!775138))

(assert (= (and b!775130 (not res!524139)) b!775126))

(assert (= (and b!775126 (not res!524137)) b!775145))

(declare-fun m!719419 () Bool)

(assert (=> b!775126 m!719419))

(declare-fun m!719421 () Bool)

(assert (=> b!775145 m!719421))

(declare-fun m!719423 () Bool)

(assert (=> b!775145 m!719423))

(declare-fun m!719425 () Bool)

(assert (=> b!775143 m!719425))

(assert (=> b!775143 m!719425))

(declare-fun m!719427 () Bool)

(assert (=> b!775143 m!719427))

(declare-fun m!719429 () Bool)

(assert (=> b!775143 m!719429))

(declare-fun m!719431 () Bool)

(assert (=> b!775143 m!719431))

(declare-fun m!719433 () Bool)

(assert (=> b!775143 m!719433))

(declare-fun m!719435 () Bool)

(assert (=> b!775138 m!719435))

(assert (=> b!775138 m!719435))

(declare-fun m!719437 () Bool)

(assert (=> b!775138 m!719437))

(assert (=> b!775132 m!719435))

(assert (=> b!775132 m!719435))

(declare-fun m!719439 () Bool)

(assert (=> b!775132 m!719439))

(assert (=> b!775132 m!719435))

(assert (=> b!775132 m!719437))

(assert (=> b!775129 m!719435))

(assert (=> b!775129 m!719435))

(declare-fun m!719441 () Bool)

(assert (=> b!775129 m!719441))

(declare-fun m!719443 () Bool)

(assert (=> b!775128 m!719443))

(assert (=> b!775139 m!719435))

(assert (=> b!775139 m!719435))

(declare-fun m!719445 () Bool)

(assert (=> b!775139 m!719445))

(declare-fun m!719447 () Bool)

(assert (=> b!775134 m!719447))

(declare-fun m!719449 () Bool)

(assert (=> start!67120 m!719449))

(declare-fun m!719451 () Bool)

(assert (=> start!67120 m!719451))

(assert (=> b!775142 m!719435))

(assert (=> b!775142 m!719435))

(declare-fun m!719453 () Bool)

(assert (=> b!775142 m!719453))

(declare-fun m!719455 () Bool)

(assert (=> b!775127 m!719455))

(declare-fun m!719457 () Bool)

(assert (=> b!775124 m!719457))

(declare-fun m!719459 () Bool)

(assert (=> b!775124 m!719459))

(declare-fun m!719461 () Bool)

(assert (=> b!775133 m!719461))

(declare-fun m!719463 () Bool)

(assert (=> b!775125 m!719463))

(declare-fun m!719465 () Bool)

(assert (=> b!775122 m!719465))

(assert (=> b!775146 m!719435))

(assert (=> b!775146 m!719435))

(declare-fun m!719467 () Bool)

(assert (=> b!775146 m!719467))

(assert (=> b!775137 m!719435))

(assert (=> b!775137 m!719435))

(assert (=> b!775137 m!719439))

(assert (=> b!775141 m!719435))

(assert (=> b!775141 m!719435))

(declare-fun m!719469 () Bool)

(assert (=> b!775141 m!719469))

(assert (=> b!775123 m!719435))

(assert (=> b!775123 m!719435))

(assert (=> b!775123 m!719469))

(declare-fun m!719471 () Bool)

(assert (=> b!775135 m!719471))

(assert (=> b!775140 m!719435))

(assert (=> b!775140 m!719435))

(declare-fun m!719473 () Bool)

(assert (=> b!775140 m!719473))

(assert (=> b!775140 m!719473))

(assert (=> b!775140 m!719435))

(declare-fun m!719475 () Bool)

(assert (=> b!775140 m!719475))

(push 1)

