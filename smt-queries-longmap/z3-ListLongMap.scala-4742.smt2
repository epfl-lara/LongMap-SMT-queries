; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65514 () Bool)

(assert start!65514)

(declare-fun b!747406 () Bool)

(declare-datatypes ((Unit!25608 0))(
  ( (Unit!25609) )
))
(declare-fun e!417294 () Unit!25608)

(declare-fun Unit!25610 () Unit!25608)

(assert (=> b!747406 (= e!417294 Unit!25610)))

(assert (=> b!747406 false))

(declare-fun b!747407 () Bool)

(declare-fun res!504032 () Bool)

(declare-fun e!417292 () Bool)

(assert (=> b!747407 (=> (not res!504032) (not e!417292))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41687 0))(
  ( (array!41688 (arr!19957 (Array (_ BitVec 32) (_ BitVec 64))) (size!20378 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41687)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!747407 (= res!504032 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20378 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20378 a!3186))))))

(declare-fun b!747408 () Bool)

(declare-fun e!417293 () Bool)

(declare-fun e!417297 () Bool)

(assert (=> b!747408 (= e!417293 (not e!417297))))

(declare-fun res!504039 () Bool)

(assert (=> b!747408 (=> res!504039 e!417297)))

(declare-datatypes ((SeekEntryResult!7557 0))(
  ( (MissingZero!7557 (index!32596 (_ BitVec 32))) (Found!7557 (index!32597 (_ BitVec 32))) (Intermediate!7557 (undefined!8369 Bool) (index!32598 (_ BitVec 32)) (x!63539 (_ BitVec 32))) (Undefined!7557) (MissingVacant!7557 (index!32599 (_ BitVec 32))) )
))
(declare-fun lt!332217 () SeekEntryResult!7557)

(get-info :version)

(assert (=> b!747408 (= res!504039 (or (not ((_ is Intermediate!7557) lt!332217)) (bvslt x!1131 (x!63539 lt!332217)) (not (= x!1131 (x!63539 lt!332217))) (not (= index!1321 (index!32598 lt!332217)))))))

(declare-fun e!417291 () Bool)

(assert (=> b!747408 e!417291))

(declare-fun res!504030 () Bool)

(assert (=> b!747408 (=> (not res!504030) (not e!417291))))

(declare-fun lt!332218 () SeekEntryResult!7557)

(declare-fun lt!332222 () SeekEntryResult!7557)

(assert (=> b!747408 (= res!504030 (= lt!332218 lt!332222))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!747408 (= lt!332222 (Found!7557 j!159))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41687 (_ BitVec 32)) SeekEntryResult!7557)

(assert (=> b!747408 (= lt!332218 (seekEntryOrOpen!0 (select (arr!19957 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41687 (_ BitVec 32)) Bool)

(assert (=> b!747408 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!332223 () Unit!25608)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41687 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25608)

(assert (=> b!747408 (= lt!332223 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!747409 () Bool)

(declare-fun res!504041 () Bool)

(declare-fun e!417298 () Bool)

(assert (=> b!747409 (=> (not res!504041) (not e!417298))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!747409 (= res!504041 (validKeyInArray!0 (select (arr!19957 a!3186) j!159)))))

(declare-fun b!747410 () Bool)

(declare-fun res!504036 () Bool)

(assert (=> b!747410 (=> (not res!504036) (not e!417298))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!747410 (= res!504036 (validKeyInArray!0 k0!2102))))

(declare-fun b!747411 () Bool)

(declare-fun res!504037 () Bool)

(assert (=> b!747411 (=> (not res!504037) (not e!417298))))

(declare-fun arrayContainsKey!0 (array!41687 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!747411 (= res!504037 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!747412 () Bool)

(assert (=> b!747412 (= e!417298 e!417292)))

(declare-fun res!504035 () Bool)

(assert (=> b!747412 (=> (not res!504035) (not e!417292))))

(declare-fun lt!332219 () SeekEntryResult!7557)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!747412 (= res!504035 (or (= lt!332219 (MissingZero!7557 i!1173)) (= lt!332219 (MissingVacant!7557 i!1173))))))

(assert (=> b!747412 (= lt!332219 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!747413 () Bool)

(declare-fun res!504029 () Bool)

(assert (=> b!747413 (=> (not res!504029) (not e!417292))))

(assert (=> b!747413 (= res!504029 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!747414 () Bool)

(declare-fun e!417295 () Bool)

(assert (=> b!747414 (= e!417292 e!417295)))

(declare-fun res!504027 () Bool)

(assert (=> b!747414 (=> (not res!504027) (not e!417295))))

(declare-fun lt!332224 () SeekEntryResult!7557)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41687 (_ BitVec 32)) SeekEntryResult!7557)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!747414 (= res!504027 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19957 a!3186) j!159) mask!3328) (select (arr!19957 a!3186) j!159) a!3186 mask!3328) lt!332224))))

(assert (=> b!747414 (= lt!332224 (Intermediate!7557 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!747415 () Bool)

(declare-fun res!504031 () Bool)

(assert (=> b!747415 (=> (not res!504031) (not e!417292))))

(declare-datatypes ((List!13959 0))(
  ( (Nil!13956) (Cons!13955 (h!15027 (_ BitVec 64)) (t!20274 List!13959)) )
))
(declare-fun arrayNoDuplicates!0 (array!41687 (_ BitVec 32) List!13959) Bool)

(assert (=> b!747415 (= res!504031 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13956))))

(declare-fun b!747416 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41687 (_ BitVec 32)) SeekEntryResult!7557)

(assert (=> b!747416 (= e!417291 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19957 a!3186) j!159) a!3186 mask!3328) lt!332222))))

(declare-fun b!747417 () Bool)

(assert (=> b!747417 (= e!417295 e!417293)))

(declare-fun res!504034 () Bool)

(assert (=> b!747417 (=> (not res!504034) (not e!417293))))

(declare-fun lt!332216 () SeekEntryResult!7557)

(assert (=> b!747417 (= res!504034 (= lt!332216 lt!332217))))

(declare-fun lt!332220 () (_ BitVec 64))

(declare-fun lt!332225 () array!41687)

(assert (=> b!747417 (= lt!332217 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332220 lt!332225 mask!3328))))

(assert (=> b!747417 (= lt!332216 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332220 mask!3328) lt!332220 lt!332225 mask!3328))))

(assert (=> b!747417 (= lt!332220 (select (store (arr!19957 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!747417 (= lt!332225 (array!41688 (store (arr!19957 a!3186) i!1173 k0!2102) (size!20378 a!3186)))))

(declare-fun b!747418 () Bool)

(declare-fun res!504028 () Bool)

(assert (=> b!747418 (=> res!504028 e!417297)))

(assert (=> b!747418 (= res!504028 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19957 a!3186) j!159) a!3186 mask!3328) lt!332222)))))

(declare-fun b!747419 () Bool)

(declare-fun res!504025 () Bool)

(assert (=> b!747419 (=> (not res!504025) (not e!417295))))

(assert (=> b!747419 (= res!504025 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19957 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!747420 () Bool)

(declare-fun res!504026 () Bool)

(assert (=> b!747420 (=> (not res!504026) (not e!417298))))

(assert (=> b!747420 (= res!504026 (and (= (size!20378 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20378 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20378 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!747421 () Bool)

(assert (=> b!747421 (= e!417297 true)))

(assert (=> b!747421 (= (select (store (arr!19957 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!332221 () Unit!25608)

(assert (=> b!747421 (= lt!332221 e!417294)))

(declare-fun c!82071 () Bool)

(assert (=> b!747421 (= c!82071 (= (select (store (arr!19957 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!747422 () Bool)

(declare-fun e!417296 () Bool)

(assert (=> b!747422 (= e!417296 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19957 a!3186) j!159) a!3186 mask!3328) (Found!7557 j!159)))))

(declare-fun b!747423 () Bool)

(assert (=> b!747423 (= e!417296 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19957 a!3186) j!159) a!3186 mask!3328) lt!332224))))

(declare-fun b!747424 () Bool)

(declare-fun Unit!25611 () Unit!25608)

(assert (=> b!747424 (= e!417294 Unit!25611)))

(declare-fun res!504038 () Bool)

(assert (=> start!65514 (=> (not res!504038) (not e!417298))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65514 (= res!504038 (validMask!0 mask!3328))))

(assert (=> start!65514 e!417298))

(assert (=> start!65514 true))

(declare-fun array_inv!15753 (array!41687) Bool)

(assert (=> start!65514 (array_inv!15753 a!3186)))

(declare-fun b!747425 () Bool)

(declare-fun res!504040 () Bool)

(assert (=> b!747425 (=> res!504040 e!417297)))

(assert (=> b!747425 (= res!504040 (= (select (store (arr!19957 a!3186) i!1173 k0!2102) index!1321) lt!332220))))

(declare-fun b!747426 () Bool)

(declare-fun res!504033 () Bool)

(assert (=> b!747426 (=> (not res!504033) (not e!417295))))

(assert (=> b!747426 (= res!504033 e!417296)))

(declare-fun c!82072 () Bool)

(assert (=> b!747426 (= c!82072 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!65514 res!504038) b!747420))

(assert (= (and b!747420 res!504026) b!747409))

(assert (= (and b!747409 res!504041) b!747410))

(assert (= (and b!747410 res!504036) b!747411))

(assert (= (and b!747411 res!504037) b!747412))

(assert (= (and b!747412 res!504035) b!747413))

(assert (= (and b!747413 res!504029) b!747415))

(assert (= (and b!747415 res!504031) b!747407))

(assert (= (and b!747407 res!504032) b!747414))

(assert (= (and b!747414 res!504027) b!747419))

(assert (= (and b!747419 res!504025) b!747426))

(assert (= (and b!747426 c!82072) b!747423))

(assert (= (and b!747426 (not c!82072)) b!747422))

(assert (= (and b!747426 res!504033) b!747417))

(assert (= (and b!747417 res!504034) b!747408))

(assert (= (and b!747408 res!504030) b!747416))

(assert (= (and b!747408 (not res!504039)) b!747418))

(assert (= (and b!747418 (not res!504028)) b!747425))

(assert (= (and b!747425 (not res!504040)) b!747421))

(assert (= (and b!747421 c!82071) b!747406))

(assert (= (and b!747421 (not c!82071)) b!747424))

(declare-fun m!697495 () Bool)

(assert (=> b!747419 m!697495))

(declare-fun m!697497 () Bool)

(assert (=> b!747417 m!697497))

(declare-fun m!697499 () Bool)

(assert (=> b!747417 m!697499))

(declare-fun m!697501 () Bool)

(assert (=> b!747417 m!697501))

(declare-fun m!697503 () Bool)

(assert (=> b!747417 m!697503))

(assert (=> b!747417 m!697501))

(declare-fun m!697505 () Bool)

(assert (=> b!747417 m!697505))

(declare-fun m!697507 () Bool)

(assert (=> b!747413 m!697507))

(assert (=> b!747425 m!697499))

(declare-fun m!697509 () Bool)

(assert (=> b!747425 m!697509))

(declare-fun m!697511 () Bool)

(assert (=> b!747410 m!697511))

(declare-fun m!697513 () Bool)

(assert (=> start!65514 m!697513))

(declare-fun m!697515 () Bool)

(assert (=> start!65514 m!697515))

(declare-fun m!697517 () Bool)

(assert (=> b!747412 m!697517))

(declare-fun m!697519 () Bool)

(assert (=> b!747414 m!697519))

(assert (=> b!747414 m!697519))

(declare-fun m!697521 () Bool)

(assert (=> b!747414 m!697521))

(assert (=> b!747414 m!697521))

(assert (=> b!747414 m!697519))

(declare-fun m!697523 () Bool)

(assert (=> b!747414 m!697523))

(assert (=> b!747422 m!697519))

(assert (=> b!747422 m!697519))

(declare-fun m!697525 () Bool)

(assert (=> b!747422 m!697525))

(assert (=> b!747408 m!697519))

(assert (=> b!747408 m!697519))

(declare-fun m!697527 () Bool)

(assert (=> b!747408 m!697527))

(declare-fun m!697529 () Bool)

(assert (=> b!747408 m!697529))

(declare-fun m!697531 () Bool)

(assert (=> b!747408 m!697531))

(declare-fun m!697533 () Bool)

(assert (=> b!747415 m!697533))

(declare-fun m!697535 () Bool)

(assert (=> b!747411 m!697535))

(assert (=> b!747409 m!697519))

(assert (=> b!747409 m!697519))

(declare-fun m!697537 () Bool)

(assert (=> b!747409 m!697537))

(assert (=> b!747421 m!697499))

(assert (=> b!747421 m!697509))

(assert (=> b!747418 m!697519))

(assert (=> b!747418 m!697519))

(assert (=> b!747418 m!697525))

(assert (=> b!747416 m!697519))

(assert (=> b!747416 m!697519))

(declare-fun m!697539 () Bool)

(assert (=> b!747416 m!697539))

(assert (=> b!747423 m!697519))

(assert (=> b!747423 m!697519))

(declare-fun m!697541 () Bool)

(assert (=> b!747423 m!697541))

(check-sat (not b!747416) (not b!747422) (not b!747415) (not start!65514) (not b!747412) (not b!747413) (not b!747411) (not b!747410) (not b!747408) (not b!747414) (not b!747423) (not b!747409) (not b!747417) (not b!747418))
(check-sat)
