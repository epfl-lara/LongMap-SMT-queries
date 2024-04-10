; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65188 () Bool)

(assert start!65188)

(declare-fun b!737548 () Bool)

(declare-fun e!412532 () Bool)

(declare-fun e!412535 () Bool)

(assert (=> b!737548 (= e!412532 e!412535)))

(declare-fun res!495772 () Bool)

(assert (=> b!737548 (=> (not res!495772) (not e!412535))))

(declare-datatypes ((SeekEntryResult!7394 0))(
  ( (MissingZero!7394 (index!31944 (_ BitVec 32))) (Found!7394 (index!31945 (_ BitVec 32))) (Intermediate!7394 (undefined!8206 Bool) (index!31946 (_ BitVec 32)) (x!62944 (_ BitVec 32))) (Undefined!7394) (MissingVacant!7394 (index!31947 (_ BitVec 32))) )
))
(declare-fun lt!327256 () SeekEntryResult!7394)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!737548 (= res!495772 (or (= lt!327256 (MissingZero!7394 i!1173)) (= lt!327256 (MissingVacant!7394 i!1173))))))

(declare-datatypes ((array!41361 0))(
  ( (array!41362 (arr!19794 (Array (_ BitVec 32) (_ BitVec 64))) (size!20215 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41361)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41361 (_ BitVec 32)) SeekEntryResult!7394)

(assert (=> b!737548 (= lt!327256 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun res!495767 () Bool)

(assert (=> start!65188 (=> (not res!495767) (not e!412532))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65188 (= res!495767 (validMask!0 mask!3328))))

(assert (=> start!65188 e!412532))

(assert (=> start!65188 true))

(declare-fun array_inv!15590 (array!41361) Bool)

(assert (=> start!65188 (array_inv!15590 a!3186)))

(declare-fun b!737549 () Bool)

(declare-fun res!495763 () Bool)

(declare-fun e!412530 () Bool)

(assert (=> b!737549 (=> (not res!495763) (not e!412530))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!737549 (= res!495763 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19794 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!737550 () Bool)

(declare-fun res!495770 () Bool)

(assert (=> b!737550 (=> (not res!495770) (not e!412535))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41361 (_ BitVec 32)) Bool)

(assert (=> b!737550 (= res!495770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun lt!327254 () SeekEntryResult!7394)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!412528 () Bool)

(declare-fun b!737551 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41361 (_ BitVec 32)) SeekEntryResult!7394)

(assert (=> b!737551 (= e!412528 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19794 a!3186) j!159) a!3186 mask!3328) lt!327254))))

(declare-fun b!737552 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!412529 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!737552 (= e!412529 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19794 a!3186) j!159) a!3186 mask!3328) (Found!7394 j!159)))))

(declare-fun b!737553 () Bool)

(assert (=> b!737553 (= e!412535 e!412530)))

(declare-fun res!495762 () Bool)

(assert (=> b!737553 (=> (not res!495762) (not e!412530))))

(declare-fun lt!327253 () SeekEntryResult!7394)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41361 (_ BitVec 32)) SeekEntryResult!7394)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737553 (= res!495762 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19794 a!3186) j!159) mask!3328) (select (arr!19794 a!3186) j!159) a!3186 mask!3328) lt!327253))))

(assert (=> b!737553 (= lt!327253 (Intermediate!7394 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!737554 () Bool)

(declare-fun res!495775 () Bool)

(assert (=> b!737554 (=> (not res!495775) (not e!412532))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!737554 (= res!495775 (validKeyInArray!0 k!2102))))

(declare-fun lt!327252 () (_ BitVec 32))

(declare-fun e!412527 () Bool)

(declare-fun b!737555 () Bool)

(assert (=> b!737555 (= e!412527 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327252 (select (arr!19794 a!3186) j!159) a!3186 mask!3328) lt!327253)))))

(declare-fun b!737556 () Bool)

(declare-datatypes ((Unit!25172 0))(
  ( (Unit!25173) )
))
(declare-fun e!412534 () Unit!25172)

(declare-fun Unit!25174 () Unit!25172)

(assert (=> b!737556 (= e!412534 Unit!25174)))

(declare-fun lt!327257 () SeekEntryResult!7394)

(assert (=> b!737556 (= lt!327257 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19794 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!327245 () SeekEntryResult!7394)

(assert (=> b!737556 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327252 resIntermediateIndex!5 (select (arr!19794 a!3186) j!159) a!3186 mask!3328) lt!327245)))

(declare-fun b!737557 () Bool)

(assert (=> b!737557 (= e!412527 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327252 resIntermediateIndex!5 (select (arr!19794 a!3186) j!159) a!3186 mask!3328) lt!327245)))))

(declare-fun b!737558 () Bool)

(declare-fun res!495768 () Bool)

(declare-fun e!412536 () Bool)

(assert (=> b!737558 (=> res!495768 e!412536)))

(assert (=> b!737558 (= res!495768 e!412527)))

(declare-fun c!81277 () Bool)

(declare-fun lt!327250 () Bool)

(assert (=> b!737558 (= c!81277 lt!327250)))

(declare-fun b!737559 () Bool)

(declare-fun res!495771 () Bool)

(assert (=> b!737559 (=> (not res!495771) (not e!412530))))

(assert (=> b!737559 (= res!495771 e!412529)))

(declare-fun c!81276 () Bool)

(assert (=> b!737559 (= c!81276 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!737560 () Bool)

(declare-fun e!412538 () Bool)

(assert (=> b!737560 (= e!412538 e!412528)))

(declare-fun res!495774 () Bool)

(assert (=> b!737560 (=> (not res!495774) (not e!412528))))

(assert (=> b!737560 (= res!495774 (= (seekEntryOrOpen!0 (select (arr!19794 a!3186) j!159) a!3186 mask!3328) lt!327254))))

(assert (=> b!737560 (= lt!327254 (Found!7394 j!159))))

(declare-fun b!737561 () Bool)

(declare-fun res!495766 () Bool)

(assert (=> b!737561 (=> (not res!495766) (not e!412535))))

(declare-datatypes ((List!13796 0))(
  ( (Nil!13793) (Cons!13792 (h!14864 (_ BitVec 64)) (t!20111 List!13796)) )
))
(declare-fun arrayNoDuplicates!0 (array!41361 (_ BitVec 32) List!13796) Bool)

(assert (=> b!737561 (= res!495766 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13793))))

(declare-fun b!737562 () Bool)

(declare-fun e!412537 () Bool)

(assert (=> b!737562 (= e!412530 e!412537)))

(declare-fun res!495765 () Bool)

(assert (=> b!737562 (=> (not res!495765) (not e!412537))))

(declare-fun lt!327249 () SeekEntryResult!7394)

(declare-fun lt!327248 () SeekEntryResult!7394)

(assert (=> b!737562 (= res!495765 (= lt!327249 lt!327248))))

(declare-fun lt!327246 () (_ BitVec 64))

(declare-fun lt!327244 () array!41361)

(assert (=> b!737562 (= lt!327248 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!327246 lt!327244 mask!3328))))

(assert (=> b!737562 (= lt!327249 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!327246 mask!3328) lt!327246 lt!327244 mask!3328))))

(assert (=> b!737562 (= lt!327246 (select (store (arr!19794 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!737562 (= lt!327244 (array!41362 (store (arr!19794 a!3186) i!1173 k!2102) (size!20215 a!3186)))))

(declare-fun b!737563 () Bool)

(declare-fun Unit!25175 () Unit!25172)

(assert (=> b!737563 (= e!412534 Unit!25175)))

(assert (=> b!737563 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327252 (select (arr!19794 a!3186) j!159) a!3186 mask!3328) lt!327253)))

(declare-fun b!737564 () Bool)

(declare-fun res!495760 () Bool)

(assert (=> b!737564 (=> (not res!495760) (not e!412532))))

(declare-fun arrayContainsKey!0 (array!41361 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!737564 (= res!495760 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!737565 () Bool)

(declare-fun e!412531 () Bool)

(assert (=> b!737565 (= e!412537 (not e!412531))))

(declare-fun res!495764 () Bool)

(assert (=> b!737565 (=> res!495764 e!412531)))

(assert (=> b!737565 (= res!495764 (or (not (is-Intermediate!7394 lt!327248)) (bvsge x!1131 (x!62944 lt!327248))))))

(assert (=> b!737565 (= lt!327245 (Found!7394 j!159))))

(assert (=> b!737565 e!412538))

(declare-fun res!495759 () Bool)

(assert (=> b!737565 (=> (not res!495759) (not e!412538))))

(assert (=> b!737565 (= res!495759 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!327255 () Unit!25172)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41361 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25172)

(assert (=> b!737565 (= lt!327255 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!737566 () Bool)

(declare-fun res!495769 () Bool)

(assert (=> b!737566 (=> (not res!495769) (not e!412532))))

(assert (=> b!737566 (= res!495769 (and (= (size!20215 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20215 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20215 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!737567 () Bool)

(declare-fun res!495761 () Bool)

(assert (=> b!737567 (=> (not res!495761) (not e!412532))))

(assert (=> b!737567 (= res!495761 (validKeyInArray!0 (select (arr!19794 a!3186) j!159)))))

(declare-fun b!737568 () Bool)

(assert (=> b!737568 (= e!412529 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19794 a!3186) j!159) a!3186 mask!3328) lt!327253))))

(declare-fun b!737569 () Bool)

(assert (=> b!737569 (= e!412531 e!412536)))

(declare-fun res!495776 () Bool)

(assert (=> b!737569 (=> res!495776 e!412536)))

(assert (=> b!737569 (= res!495776 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!327252 #b00000000000000000000000000000000) (bvsge lt!327252 (size!20215 a!3186))))))

(declare-fun lt!327247 () Unit!25172)

(assert (=> b!737569 (= lt!327247 e!412534)))

(declare-fun c!81275 () Bool)

(assert (=> b!737569 (= c!81275 lt!327250)))

(assert (=> b!737569 (= lt!327250 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737569 (= lt!327252 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!737570 () Bool)

(assert (=> b!737570 (= e!412536 true)))

(declare-fun lt!327251 () SeekEntryResult!7394)

(assert (=> b!737570 (= lt!327251 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327252 lt!327246 lt!327244 mask!3328))))

(declare-fun b!737571 () Bool)

(declare-fun res!495773 () Bool)

(assert (=> b!737571 (=> (not res!495773) (not e!412535))))

(assert (=> b!737571 (= res!495773 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20215 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20215 a!3186))))))

(assert (= (and start!65188 res!495767) b!737566))

(assert (= (and b!737566 res!495769) b!737567))

(assert (= (and b!737567 res!495761) b!737554))

(assert (= (and b!737554 res!495775) b!737564))

(assert (= (and b!737564 res!495760) b!737548))

(assert (= (and b!737548 res!495772) b!737550))

(assert (= (and b!737550 res!495770) b!737561))

(assert (= (and b!737561 res!495766) b!737571))

(assert (= (and b!737571 res!495773) b!737553))

(assert (= (and b!737553 res!495762) b!737549))

(assert (= (and b!737549 res!495763) b!737559))

(assert (= (and b!737559 c!81276) b!737568))

(assert (= (and b!737559 (not c!81276)) b!737552))

(assert (= (and b!737559 res!495771) b!737562))

(assert (= (and b!737562 res!495765) b!737565))

(assert (= (and b!737565 res!495759) b!737560))

(assert (= (and b!737560 res!495774) b!737551))

(assert (= (and b!737565 (not res!495764)) b!737569))

(assert (= (and b!737569 c!81275) b!737563))

(assert (= (and b!737569 (not c!81275)) b!737556))

(assert (= (and b!737569 (not res!495776)) b!737558))

(assert (= (and b!737558 c!81277) b!737555))

(assert (= (and b!737558 (not c!81277)) b!737557))

(assert (= (and b!737558 (not res!495768)) b!737570))

(declare-fun m!689401 () Bool)

(assert (=> b!737568 m!689401))

(assert (=> b!737568 m!689401))

(declare-fun m!689403 () Bool)

(assert (=> b!737568 m!689403))

(declare-fun m!689405 () Bool)

(assert (=> b!737564 m!689405))

(assert (=> b!737560 m!689401))

(assert (=> b!737560 m!689401))

(declare-fun m!689407 () Bool)

(assert (=> b!737560 m!689407))

(assert (=> b!737555 m!689401))

(assert (=> b!737555 m!689401))

(declare-fun m!689409 () Bool)

(assert (=> b!737555 m!689409))

(assert (=> b!737552 m!689401))

(assert (=> b!737552 m!689401))

(declare-fun m!689411 () Bool)

(assert (=> b!737552 m!689411))

(declare-fun m!689413 () Bool)

(assert (=> b!737550 m!689413))

(declare-fun m!689415 () Bool)

(assert (=> start!65188 m!689415))

(declare-fun m!689417 () Bool)

(assert (=> start!65188 m!689417))

(declare-fun m!689419 () Bool)

(assert (=> b!737554 m!689419))

(assert (=> b!737557 m!689401))

(assert (=> b!737557 m!689401))

(declare-fun m!689421 () Bool)

(assert (=> b!737557 m!689421))

(assert (=> b!737556 m!689401))

(assert (=> b!737556 m!689401))

(assert (=> b!737556 m!689411))

(assert (=> b!737556 m!689401))

(assert (=> b!737556 m!689421))

(declare-fun m!689423 () Bool)

(assert (=> b!737570 m!689423))

(declare-fun m!689425 () Bool)

(assert (=> b!737562 m!689425))

(declare-fun m!689427 () Bool)

(assert (=> b!737562 m!689427))

(declare-fun m!689429 () Bool)

(assert (=> b!737562 m!689429))

(declare-fun m!689431 () Bool)

(assert (=> b!737562 m!689431))

(assert (=> b!737562 m!689429))

(declare-fun m!689433 () Bool)

(assert (=> b!737562 m!689433))

(declare-fun m!689435 () Bool)

(assert (=> b!737569 m!689435))

(declare-fun m!689437 () Bool)

(assert (=> b!737548 m!689437))

(assert (=> b!737567 m!689401))

(assert (=> b!737567 m!689401))

(declare-fun m!689439 () Bool)

(assert (=> b!737567 m!689439))

(assert (=> b!737553 m!689401))

(assert (=> b!737553 m!689401))

(declare-fun m!689441 () Bool)

(assert (=> b!737553 m!689441))

(assert (=> b!737553 m!689441))

(assert (=> b!737553 m!689401))

(declare-fun m!689443 () Bool)

(assert (=> b!737553 m!689443))

(assert (=> b!737563 m!689401))

(assert (=> b!737563 m!689401))

(assert (=> b!737563 m!689409))

(declare-fun m!689445 () Bool)

(assert (=> b!737561 m!689445))

(declare-fun m!689447 () Bool)

(assert (=> b!737549 m!689447))

(declare-fun m!689449 () Bool)

(assert (=> b!737565 m!689449))

(declare-fun m!689451 () Bool)

(assert (=> b!737565 m!689451))

(assert (=> b!737551 m!689401))

(assert (=> b!737551 m!689401))

(declare-fun m!689453 () Bool)

(assert (=> b!737551 m!689453))

(push 1)

