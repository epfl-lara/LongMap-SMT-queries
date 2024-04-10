; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65156 () Bool)

(assert start!65156)

(declare-fun b!736396 () Bool)

(declare-datatypes ((Unit!25108 0))(
  ( (Unit!25109) )
))
(declare-fun e!411957 () Unit!25108)

(declare-fun Unit!25110 () Unit!25108)

(assert (=> b!736396 (= e!411957 Unit!25110)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41329 0))(
  ( (array!41330 (arr!19778 (Array (_ BitVec 32) (_ BitVec 64))) (size!20199 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41329)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7378 0))(
  ( (MissingZero!7378 (index!31880 (_ BitVec 32))) (Found!7378 (index!31881 (_ BitVec 32))) (Intermediate!7378 (undefined!8190 Bool) (index!31882 (_ BitVec 32)) (x!62880 (_ BitVec 32))) (Undefined!7378) (MissingVacant!7378 (index!31883 (_ BitVec 32))) )
))
(declare-fun lt!326583 () SeekEntryResult!7378)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41329 (_ BitVec 32)) SeekEntryResult!7378)

(assert (=> b!736396 (= lt!326583 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19778 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!326575 () SeekEntryResult!7378)

(declare-fun lt!326578 () (_ BitVec 32))

(assert (=> b!736396 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326578 resIntermediateIndex!5 (select (arr!19778 a!3186) j!159) a!3186 mask!3328) lt!326575)))

(declare-fun lt!326577 () SeekEntryResult!7378)

(declare-fun b!736397 () Bool)

(declare-fun e!411958 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41329 (_ BitVec 32)) SeekEntryResult!7378)

(assert (=> b!736397 (= e!411958 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19778 a!3186) j!159) a!3186 mask!3328) lt!326577))))

(declare-fun e!411959 () Bool)

(declare-fun b!736398 () Bool)

(assert (=> b!736398 (= e!411959 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326578 resIntermediateIndex!5 (select (arr!19778 a!3186) j!159) a!3186 mask!3328) lt!326575)))))

(declare-fun b!736399 () Bool)

(assert (=> b!736399 (= e!411958 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19778 a!3186) j!159) a!3186 mask!3328) (Found!7378 j!159)))))

(declare-fun e!411960 () Bool)

(declare-fun lt!326573 () SeekEntryResult!7378)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!736400 () Bool)

(assert (=> b!736400 (= e!411960 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19778 a!3186) j!159) a!3186 mask!3328) lt!326573))))

(declare-fun b!736401 () Bool)

(declare-fun e!411962 () Bool)

(declare-fun e!411952 () Bool)

(assert (=> b!736401 (= e!411962 e!411952)))

(declare-fun res!494907 () Bool)

(assert (=> b!736401 (=> (not res!494907) (not e!411952))))

(declare-fun lt!326584 () SeekEntryResult!7378)

(declare-fun lt!326580 () SeekEntryResult!7378)

(assert (=> b!736401 (= res!494907 (= lt!326584 lt!326580))))

(declare-fun lt!326574 () array!41329)

(declare-fun lt!326572 () (_ BitVec 64))

(assert (=> b!736401 (= lt!326580 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!326572 lt!326574 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!736401 (= lt!326584 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!326572 mask!3328) lt!326572 lt!326574 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!736401 (= lt!326572 (select (store (arr!19778 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!736401 (= lt!326574 (array!41330 (store (arr!19778 a!3186) i!1173 k!2102) (size!20199 a!3186)))))

(declare-fun b!736402 () Bool)

(declare-fun res!494909 () Bool)

(declare-fun e!411955 () Bool)

(assert (=> b!736402 (=> (not res!494909) (not e!411955))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!736402 (= res!494909 (validKeyInArray!0 k!2102))))

(declare-fun b!736403 () Bool)

(declare-fun Unit!25111 () Unit!25108)

(assert (=> b!736403 (= e!411957 Unit!25111)))

(assert (=> b!736403 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326578 (select (arr!19778 a!3186) j!159) a!3186 mask!3328) lt!326577)))

(declare-fun b!736404 () Bool)

(declare-fun res!494901 () Bool)

(assert (=> b!736404 (=> (not res!494901) (not e!411955))))

(assert (=> b!736404 (= res!494901 (and (= (size!20199 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20199 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20199 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!736406 () Bool)

(declare-fun res!494902 () Bool)

(assert (=> b!736406 (=> (not res!494902) (not e!411955))))

(declare-fun arrayContainsKey!0 (array!41329 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!736406 (= res!494902 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!736407 () Bool)

(declare-fun res!494903 () Bool)

(assert (=> b!736407 (=> (not res!494903) (not e!411962))))

(assert (=> b!736407 (= res!494903 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19778 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!736408 () Bool)

(declare-fun e!411961 () Bool)

(assert (=> b!736408 (= e!411955 e!411961)))

(declare-fun res!494898 () Bool)

(assert (=> b!736408 (=> (not res!494898) (not e!411961))))

(declare-fun lt!326582 () SeekEntryResult!7378)

(assert (=> b!736408 (= res!494898 (or (= lt!326582 (MissingZero!7378 i!1173)) (= lt!326582 (MissingVacant!7378 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41329 (_ BitVec 32)) SeekEntryResult!7378)

(assert (=> b!736408 (= lt!326582 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!736409 () Bool)

(declare-fun e!411956 () Bool)

(assert (=> b!736409 (= e!411952 (not e!411956))))

(declare-fun res!494897 () Bool)

(assert (=> b!736409 (=> res!494897 e!411956)))

(assert (=> b!736409 (= res!494897 (or (not (is-Intermediate!7378 lt!326580)) (bvsge x!1131 (x!62880 lt!326580))))))

(assert (=> b!736409 (= lt!326575 (Found!7378 j!159))))

(declare-fun e!411954 () Bool)

(assert (=> b!736409 e!411954))

(declare-fun res!494906 () Bool)

(assert (=> b!736409 (=> (not res!494906) (not e!411954))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41329 (_ BitVec 32)) Bool)

(assert (=> b!736409 (= res!494906 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!326585 () Unit!25108)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41329 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25108)

(assert (=> b!736409 (= lt!326585 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!736410 () Bool)

(declare-fun res!494910 () Bool)

(declare-fun e!411953 () Bool)

(assert (=> b!736410 (=> res!494910 e!411953)))

(assert (=> b!736410 (= res!494910 e!411959)))

(declare-fun c!81131 () Bool)

(declare-fun lt!326579 () Bool)

(assert (=> b!736410 (= c!81131 lt!326579)))

(declare-fun b!736411 () Bool)

(declare-fun res!494896 () Bool)

(assert (=> b!736411 (=> (not res!494896) (not e!411961))))

(declare-datatypes ((List!13780 0))(
  ( (Nil!13777) (Cons!13776 (h!14848 (_ BitVec 64)) (t!20095 List!13780)) )
))
(declare-fun arrayNoDuplicates!0 (array!41329 (_ BitVec 32) List!13780) Bool)

(assert (=> b!736411 (= res!494896 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13777))))

(declare-fun b!736412 () Bool)

(assert (=> b!736412 (= e!411954 e!411960)))

(declare-fun res!494911 () Bool)

(assert (=> b!736412 (=> (not res!494911) (not e!411960))))

(assert (=> b!736412 (= res!494911 (= (seekEntryOrOpen!0 (select (arr!19778 a!3186) j!159) a!3186 mask!3328) lt!326573))))

(assert (=> b!736412 (= lt!326573 (Found!7378 j!159))))

(declare-fun b!736413 () Bool)

(assert (=> b!736413 (= e!411959 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326578 (select (arr!19778 a!3186) j!159) a!3186 mask!3328) lt!326577)))))

(declare-fun b!736414 () Bool)

(assert (=> b!736414 (= e!411956 e!411953)))

(declare-fun res!494912 () Bool)

(assert (=> b!736414 (=> res!494912 e!411953)))

(assert (=> b!736414 (= res!494912 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!326578 #b00000000000000000000000000000000) (bvsge lt!326578 (size!20199 a!3186))))))

(declare-fun lt!326576 () Unit!25108)

(assert (=> b!736414 (= lt!326576 e!411957)))

(declare-fun c!81133 () Bool)

(assert (=> b!736414 (= c!81133 lt!326579)))

(assert (=> b!736414 (= lt!326579 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!736414 (= lt!326578 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!736415 () Bool)

(assert (=> b!736415 (= e!411961 e!411962)))

(declare-fun res!494908 () Bool)

(assert (=> b!736415 (=> (not res!494908) (not e!411962))))

(assert (=> b!736415 (= res!494908 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19778 a!3186) j!159) mask!3328) (select (arr!19778 a!3186) j!159) a!3186 mask!3328) lt!326577))))

(assert (=> b!736415 (= lt!326577 (Intermediate!7378 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!736416 () Bool)

(declare-fun res!494900 () Bool)

(assert (=> b!736416 (=> (not res!494900) (not e!411961))))

(assert (=> b!736416 (= res!494900 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20199 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20199 a!3186))))))

(declare-fun b!736417 () Bool)

(declare-fun res!494905 () Bool)

(assert (=> b!736417 (=> (not res!494905) (not e!411962))))

(assert (=> b!736417 (= res!494905 e!411958)))

(declare-fun c!81132 () Bool)

(assert (=> b!736417 (= c!81132 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!736418 () Bool)

(declare-fun res!494904 () Bool)

(assert (=> b!736418 (=> (not res!494904) (not e!411955))))

(assert (=> b!736418 (= res!494904 (validKeyInArray!0 (select (arr!19778 a!3186) j!159)))))

(declare-fun b!736419 () Bool)

(assert (=> b!736419 (= e!411953 true)))

(declare-fun lt!326581 () SeekEntryResult!7378)

(assert (=> b!736419 (= lt!326581 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326578 lt!326572 lt!326574 mask!3328))))

(declare-fun res!494895 () Bool)

(assert (=> start!65156 (=> (not res!494895) (not e!411955))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65156 (= res!494895 (validMask!0 mask!3328))))

(assert (=> start!65156 e!411955))

(assert (=> start!65156 true))

(declare-fun array_inv!15574 (array!41329) Bool)

(assert (=> start!65156 (array_inv!15574 a!3186)))

(declare-fun b!736405 () Bool)

(declare-fun res!494899 () Bool)

(assert (=> b!736405 (=> (not res!494899) (not e!411961))))

(assert (=> b!736405 (= res!494899 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!65156 res!494895) b!736404))

(assert (= (and b!736404 res!494901) b!736418))

(assert (= (and b!736418 res!494904) b!736402))

(assert (= (and b!736402 res!494909) b!736406))

(assert (= (and b!736406 res!494902) b!736408))

(assert (= (and b!736408 res!494898) b!736405))

(assert (= (and b!736405 res!494899) b!736411))

(assert (= (and b!736411 res!494896) b!736416))

(assert (= (and b!736416 res!494900) b!736415))

(assert (= (and b!736415 res!494908) b!736407))

(assert (= (and b!736407 res!494903) b!736417))

(assert (= (and b!736417 c!81132) b!736397))

(assert (= (and b!736417 (not c!81132)) b!736399))

(assert (= (and b!736417 res!494905) b!736401))

(assert (= (and b!736401 res!494907) b!736409))

(assert (= (and b!736409 res!494906) b!736412))

(assert (= (and b!736412 res!494911) b!736400))

(assert (= (and b!736409 (not res!494897)) b!736414))

(assert (= (and b!736414 c!81133) b!736403))

(assert (= (and b!736414 (not c!81133)) b!736396))

(assert (= (and b!736414 (not res!494912)) b!736410))

(assert (= (and b!736410 c!81131) b!736413))

(assert (= (and b!736410 (not c!81131)) b!736398))

(assert (= (and b!736410 (not res!494910)) b!736419))

(declare-fun m!688537 () Bool)

(assert (=> b!736401 m!688537))

(declare-fun m!688539 () Bool)

(assert (=> b!736401 m!688539))

(declare-fun m!688541 () Bool)

(assert (=> b!736401 m!688541))

(declare-fun m!688543 () Bool)

(assert (=> b!736401 m!688543))

(declare-fun m!688545 () Bool)

(assert (=> b!736401 m!688545))

(assert (=> b!736401 m!688537))

(declare-fun m!688547 () Bool)

(assert (=> b!736411 m!688547))

(declare-fun m!688549 () Bool)

(assert (=> b!736409 m!688549))

(declare-fun m!688551 () Bool)

(assert (=> b!736409 m!688551))

(declare-fun m!688553 () Bool)

(assert (=> b!736406 m!688553))

(declare-fun m!688555 () Bool)

(assert (=> b!736414 m!688555))

(declare-fun m!688557 () Bool)

(assert (=> b!736398 m!688557))

(assert (=> b!736398 m!688557))

(declare-fun m!688559 () Bool)

(assert (=> b!736398 m!688559))

(assert (=> b!736415 m!688557))

(assert (=> b!736415 m!688557))

(declare-fun m!688561 () Bool)

(assert (=> b!736415 m!688561))

(assert (=> b!736415 m!688561))

(assert (=> b!736415 m!688557))

(declare-fun m!688563 () Bool)

(assert (=> b!736415 m!688563))

(declare-fun m!688565 () Bool)

(assert (=> b!736407 m!688565))

(assert (=> b!736412 m!688557))

(assert (=> b!736412 m!688557))

(declare-fun m!688567 () Bool)

(assert (=> b!736412 m!688567))

(declare-fun m!688569 () Bool)

(assert (=> b!736402 m!688569))

(assert (=> b!736413 m!688557))

(assert (=> b!736413 m!688557))

(declare-fun m!688571 () Bool)

(assert (=> b!736413 m!688571))

(declare-fun m!688573 () Bool)

(assert (=> b!736408 m!688573))

(declare-fun m!688575 () Bool)

(assert (=> start!65156 m!688575))

(declare-fun m!688577 () Bool)

(assert (=> start!65156 m!688577))

(declare-fun m!688579 () Bool)

(assert (=> b!736405 m!688579))

(assert (=> b!736399 m!688557))

(assert (=> b!736399 m!688557))

(declare-fun m!688581 () Bool)

(assert (=> b!736399 m!688581))

(assert (=> b!736418 m!688557))

(assert (=> b!736418 m!688557))

(declare-fun m!688583 () Bool)

(assert (=> b!736418 m!688583))

(assert (=> b!736400 m!688557))

(assert (=> b!736400 m!688557))

(declare-fun m!688585 () Bool)

(assert (=> b!736400 m!688585))

(assert (=> b!736396 m!688557))

(assert (=> b!736396 m!688557))

(assert (=> b!736396 m!688581))

(assert (=> b!736396 m!688557))

(assert (=> b!736396 m!688559))

(assert (=> b!736403 m!688557))

(assert (=> b!736403 m!688557))

(assert (=> b!736403 m!688571))

(declare-fun m!688587 () Bool)

(assert (=> b!736419 m!688587))

(assert (=> b!736397 m!688557))

(assert (=> b!736397 m!688557))

(declare-fun m!688589 () Bool)

(assert (=> b!736397 m!688589))

(push 1)

