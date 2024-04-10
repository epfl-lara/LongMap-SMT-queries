; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67128 () Bool)

(assert start!67128)

(declare-fun b!775422 () Bool)

(declare-fun e!431566 () Bool)

(declare-fun e!431574 () Bool)

(assert (=> b!775422 (= e!431566 e!431574)))

(declare-fun res!524365 () Bool)

(assert (=> b!775422 (=> (not res!524365) (not e!431574))))

(declare-datatypes ((array!42483 0))(
  ( (array!42484 (arr!20337 (Array (_ BitVec 32) (_ BitVec 64))) (size!20758 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42483)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7937 0))(
  ( (MissingZero!7937 (index!34116 (_ BitVec 32))) (Found!7937 (index!34117 (_ BitVec 32))) (Intermediate!7937 (undefined!8749 Bool) (index!34118 (_ BitVec 32)) (x!65064 (_ BitVec 32))) (Undefined!7937) (MissingVacant!7937 (index!34119 (_ BitVec 32))) )
))
(declare-fun lt!345432 () SeekEntryResult!7937)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42483 (_ BitVec 32)) SeekEntryResult!7937)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!775422 (= res!524365 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20337 a!3186) j!159) mask!3328) (select (arr!20337 a!3186) j!159) a!3186 mask!3328) lt!345432))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!775422 (= lt!345432 (Intermediate!7937 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun e!431571 () Bool)

(declare-fun b!775423 () Bool)

(declare-fun lt!345435 () SeekEntryResult!7937)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42483 (_ BitVec 32)) SeekEntryResult!7937)

(assert (=> b!775423 (= e!431571 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20337 a!3186) j!159) a!3186 mask!3328) lt!345435))))

(declare-fun b!775424 () Bool)

(declare-fun res!524374 () Bool)

(assert (=> b!775424 (=> (not res!524374) (not e!431566))))

(declare-datatypes ((List!14339 0))(
  ( (Nil!14336) (Cons!14335 (h!15443 (_ BitVec 64)) (t!20654 List!14339)) )
))
(declare-fun arrayNoDuplicates!0 (array!42483 (_ BitVec 32) List!14339) Bool)

(assert (=> b!775424 (= res!524374 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14336))))

(declare-fun e!431575 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun b!775425 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!775425 (= e!431575 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20337 a!3186) j!159) a!3186 mask!3328) lt!345432))))

(declare-fun b!775426 () Bool)

(declare-fun e!431570 () Bool)

(assert (=> b!775426 (= e!431570 e!431571)))

(declare-fun res!524375 () Bool)

(assert (=> b!775426 (=> (not res!524375) (not e!431571))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42483 (_ BitVec 32)) SeekEntryResult!7937)

(assert (=> b!775426 (= res!524375 (= (seekEntryOrOpen!0 (select (arr!20337 a!3186) j!159) a!3186 mask!3328) lt!345435))))

(assert (=> b!775426 (= lt!345435 (Found!7937 j!159))))

(declare-fun b!775428 () Bool)

(declare-fun res!524370 () Bool)

(declare-fun e!431572 () Bool)

(assert (=> b!775428 (=> (not res!524370) (not e!431572))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42483 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!775428 (= res!524370 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun e!431576 () Bool)

(declare-fun b!775429 () Bool)

(declare-fun lt!345427 () (_ BitVec 32))

(assert (=> b!775429 (= e!431576 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345427 (select (arr!20337 a!3186) j!159) a!3186 mask!3328) lt!345432)))))

(declare-fun b!775430 () Bool)

(declare-fun res!524364 () Bool)

(declare-fun e!431565 () Bool)

(assert (=> b!775430 (=> res!524364 e!431565)))

(assert (=> b!775430 (= res!524364 e!431576)))

(declare-fun c!85933 () Bool)

(declare-fun lt!345430 () Bool)

(assert (=> b!775430 (= c!85933 lt!345430)))

(declare-fun b!775431 () Bool)

(declare-fun res!524373 () Bool)

(assert (=> b!775431 (=> (not res!524373) (not e!431574))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!775431 (= res!524373 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20337 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!775432 () Bool)

(assert (=> b!775432 (= e!431565 true)))

(declare-fun lt!345431 () SeekEntryResult!7937)

(declare-fun lt!345429 () array!42483)

(declare-fun lt!345433 () (_ BitVec 64))

(assert (=> b!775432 (= (seekEntryOrOpen!0 lt!345433 lt!345429 mask!3328) lt!345431)))

(declare-datatypes ((Unit!26762 0))(
  ( (Unit!26763) )
))
(declare-fun lt!345424 () Unit!26762)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!42483 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26762)

(assert (=> b!775432 (= lt!345424 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3186 i!1173 k!2102 j!159 lt!345427 (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateIndex!5 resIntermediateX!5 mask!3328))))

(declare-fun b!775433 () Bool)

(declare-fun res!524363 () Bool)

(assert (=> b!775433 (=> (not res!524363) (not e!431572))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!775433 (= res!524363 (validKeyInArray!0 k!2102))))

(declare-fun b!775434 () Bool)

(declare-fun e!431573 () Unit!26762)

(declare-fun Unit!26764 () Unit!26762)

(assert (=> b!775434 (= e!431573 Unit!26764)))

(declare-fun lt!345428 () SeekEntryResult!7937)

(assert (=> b!775434 (= lt!345428 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20337 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!775434 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345427 resIntermediateIndex!5 (select (arr!20337 a!3186) j!159) a!3186 mask!3328) lt!345431)))

(declare-fun b!775435 () Bool)

(declare-fun e!431569 () Bool)

(assert (=> b!775435 (= e!431569 e!431565)))

(declare-fun res!524371 () Bool)

(assert (=> b!775435 (=> res!524371 e!431565)))

(assert (=> b!775435 (= res!524371 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!345427 #b00000000000000000000000000000000) (bvsge lt!345427 (size!20758 a!3186))))))

(declare-fun lt!345437 () Unit!26762)

(assert (=> b!775435 (= lt!345437 e!431573)))

(declare-fun c!85931 () Bool)

(assert (=> b!775435 (= c!85931 lt!345430)))

(assert (=> b!775435 (= lt!345430 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!775435 (= lt!345427 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun res!524377 () Bool)

(assert (=> start!67128 (=> (not res!524377) (not e!431572))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67128 (= res!524377 (validMask!0 mask!3328))))

(assert (=> start!67128 e!431572))

(assert (=> start!67128 true))

(declare-fun array_inv!16133 (array!42483) Bool)

(assert (=> start!67128 (array_inv!16133 a!3186)))

(declare-fun b!775427 () Bool)

(declare-fun res!524368 () Bool)

(assert (=> b!775427 (=> (not res!524368) (not e!431574))))

(assert (=> b!775427 (= res!524368 e!431575)))

(declare-fun c!85932 () Bool)

(assert (=> b!775427 (= c!85932 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!775436 () Bool)

(declare-fun e!431568 () Bool)

(assert (=> b!775436 (= e!431568 (not e!431569))))

(declare-fun res!524372 () Bool)

(assert (=> b!775436 (=> res!524372 e!431569)))

(declare-fun lt!345425 () SeekEntryResult!7937)

(assert (=> b!775436 (= res!524372 (or (not (is-Intermediate!7937 lt!345425)) (bvsge x!1131 (x!65064 lt!345425))))))

(assert (=> b!775436 (= lt!345431 (Found!7937 j!159))))

(assert (=> b!775436 e!431570))

(declare-fun res!524361 () Bool)

(assert (=> b!775436 (=> (not res!524361) (not e!431570))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42483 (_ BitVec 32)) Bool)

(assert (=> b!775436 (= res!524361 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!345436 () Unit!26762)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42483 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26762)

(assert (=> b!775436 (= lt!345436 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!775437 () Bool)

(assert (=> b!775437 (= e!431575 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20337 a!3186) j!159) a!3186 mask!3328) (Found!7937 j!159)))))

(declare-fun b!775438 () Bool)

(declare-fun res!524376 () Bool)

(assert (=> b!775438 (=> (not res!524376) (not e!431566))))

(assert (=> b!775438 (= res!524376 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20758 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20758 a!3186))))))

(declare-fun b!775439 () Bool)

(assert (=> b!775439 (= e!431572 e!431566)))

(declare-fun res!524369 () Bool)

(assert (=> b!775439 (=> (not res!524369) (not e!431566))))

(declare-fun lt!345426 () SeekEntryResult!7937)

(assert (=> b!775439 (= res!524369 (or (= lt!345426 (MissingZero!7937 i!1173)) (= lt!345426 (MissingVacant!7937 i!1173))))))

(assert (=> b!775439 (= lt!345426 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!775440 () Bool)

(assert (=> b!775440 (= e!431576 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345427 resIntermediateIndex!5 (select (arr!20337 a!3186) j!159) a!3186 mask!3328) lt!345431)))))

(declare-fun b!775441 () Bool)

(assert (=> b!775441 (= e!431574 e!431568)))

(declare-fun res!524378 () Bool)

(assert (=> b!775441 (=> (not res!524378) (not e!431568))))

(declare-fun lt!345434 () SeekEntryResult!7937)

(assert (=> b!775441 (= res!524378 (= lt!345434 lt!345425))))

(assert (=> b!775441 (= lt!345425 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345433 lt!345429 mask!3328))))

(assert (=> b!775441 (= lt!345434 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345433 mask!3328) lt!345433 lt!345429 mask!3328))))

(assert (=> b!775441 (= lt!345433 (select (store (arr!20337 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!775441 (= lt!345429 (array!42484 (store (arr!20337 a!3186) i!1173 k!2102) (size!20758 a!3186)))))

(declare-fun b!775442 () Bool)

(declare-fun res!524360 () Bool)

(assert (=> b!775442 (=> (not res!524360) (not e!431572))))

(assert (=> b!775442 (= res!524360 (and (= (size!20758 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20758 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20758 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!775443 () Bool)

(declare-fun Unit!26765 () Unit!26762)

(assert (=> b!775443 (= e!431573 Unit!26765)))

(assert (=> b!775443 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345427 (select (arr!20337 a!3186) j!159) a!3186 mask!3328) lt!345432)))

(declare-fun b!775444 () Bool)

(declare-fun res!524366 () Bool)

(assert (=> b!775444 (=> (not res!524366) (not e!431572))))

(assert (=> b!775444 (= res!524366 (validKeyInArray!0 (select (arr!20337 a!3186) j!159)))))

(declare-fun b!775445 () Bool)

(declare-fun res!524362 () Bool)

(assert (=> b!775445 (=> res!524362 e!431565)))

(assert (=> b!775445 (= res!524362 (not (= lt!345434 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345427 lt!345433 lt!345429 mask!3328))))))

(declare-fun b!775446 () Bool)

(declare-fun res!524367 () Bool)

(assert (=> b!775446 (=> (not res!524367) (not e!431566))))

(assert (=> b!775446 (= res!524367 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!67128 res!524377) b!775442))

(assert (= (and b!775442 res!524360) b!775444))

(assert (= (and b!775444 res!524366) b!775433))

(assert (= (and b!775433 res!524363) b!775428))

(assert (= (and b!775428 res!524370) b!775439))

(assert (= (and b!775439 res!524369) b!775446))

(assert (= (and b!775446 res!524367) b!775424))

(assert (= (and b!775424 res!524374) b!775438))

(assert (= (and b!775438 res!524376) b!775422))

(assert (= (and b!775422 res!524365) b!775431))

(assert (= (and b!775431 res!524373) b!775427))

(assert (= (and b!775427 c!85932) b!775425))

(assert (= (and b!775427 (not c!85932)) b!775437))

(assert (= (and b!775427 res!524368) b!775441))

(assert (= (and b!775441 res!524378) b!775436))

(assert (= (and b!775436 res!524361) b!775426))

(assert (= (and b!775426 res!524375) b!775423))

(assert (= (and b!775436 (not res!524372)) b!775435))

(assert (= (and b!775435 c!85931) b!775443))

(assert (= (and b!775435 (not c!85931)) b!775434))

(assert (= (and b!775435 (not res!524371)) b!775430))

(assert (= (and b!775430 c!85933) b!775429))

(assert (= (and b!775430 (not c!85933)) b!775440))

(assert (= (and b!775430 (not res!524364)) b!775445))

(assert (= (and b!775445 (not res!524362)) b!775432))

(declare-fun m!719651 () Bool)

(assert (=> b!775425 m!719651))

(assert (=> b!775425 m!719651))

(declare-fun m!719653 () Bool)

(assert (=> b!775425 m!719653))

(declare-fun m!719655 () Bool)

(assert (=> b!775435 m!719655))

(assert (=> b!775434 m!719651))

(assert (=> b!775434 m!719651))

(declare-fun m!719657 () Bool)

(assert (=> b!775434 m!719657))

(assert (=> b!775434 m!719651))

(declare-fun m!719659 () Bool)

(assert (=> b!775434 m!719659))

(declare-fun m!719661 () Bool)

(assert (=> start!67128 m!719661))

(declare-fun m!719663 () Bool)

(assert (=> start!67128 m!719663))

(assert (=> b!775429 m!719651))

(assert (=> b!775429 m!719651))

(declare-fun m!719665 () Bool)

(assert (=> b!775429 m!719665))

(declare-fun m!719667 () Bool)

(assert (=> b!775445 m!719667))

(declare-fun m!719669 () Bool)

(assert (=> b!775431 m!719669))

(assert (=> b!775437 m!719651))

(assert (=> b!775437 m!719651))

(assert (=> b!775437 m!719657))

(declare-fun m!719671 () Bool)

(assert (=> b!775439 m!719671))

(assert (=> b!775426 m!719651))

(assert (=> b!775426 m!719651))

(declare-fun m!719673 () Bool)

(assert (=> b!775426 m!719673))

(assert (=> b!775440 m!719651))

(assert (=> b!775440 m!719651))

(assert (=> b!775440 m!719659))

(assert (=> b!775422 m!719651))

(assert (=> b!775422 m!719651))

(declare-fun m!719675 () Bool)

(assert (=> b!775422 m!719675))

(assert (=> b!775422 m!719675))

(assert (=> b!775422 m!719651))

(declare-fun m!719677 () Bool)

(assert (=> b!775422 m!719677))

(declare-fun m!719679 () Bool)

(assert (=> b!775432 m!719679))

(declare-fun m!719681 () Bool)

(assert (=> b!775432 m!719681))

(declare-fun m!719683 () Bool)

(assert (=> b!775446 m!719683))

(declare-fun m!719685 () Bool)

(assert (=> b!775436 m!719685))

(declare-fun m!719687 () Bool)

(assert (=> b!775436 m!719687))

(declare-fun m!719689 () Bool)

(assert (=> b!775428 m!719689))

(declare-fun m!719691 () Bool)

(assert (=> b!775433 m!719691))

(assert (=> b!775423 m!719651))

(assert (=> b!775423 m!719651))

(declare-fun m!719693 () Bool)

(assert (=> b!775423 m!719693))

(assert (=> b!775444 m!719651))

(assert (=> b!775444 m!719651))

(declare-fun m!719695 () Bool)

(assert (=> b!775444 m!719695))

(declare-fun m!719697 () Bool)

(assert (=> b!775424 m!719697))

(assert (=> b!775443 m!719651))

(assert (=> b!775443 m!719651))

(assert (=> b!775443 m!719665))

(declare-fun m!719699 () Bool)

(assert (=> b!775441 m!719699))

(declare-fun m!719701 () Bool)

(assert (=> b!775441 m!719701))

(declare-fun m!719703 () Bool)

(assert (=> b!775441 m!719703))

(assert (=> b!775441 m!719699))

(declare-fun m!719705 () Bool)

(assert (=> b!775441 m!719705))

(declare-fun m!719707 () Bool)

(assert (=> b!775441 m!719707))

(push 1)

