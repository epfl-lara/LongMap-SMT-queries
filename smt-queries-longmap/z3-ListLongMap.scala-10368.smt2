; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122018 () Bool)

(assert start!122018)

(declare-fun b!1416240 () Bool)

(declare-fun e!801559 () Bool)

(declare-fun e!801562 () Bool)

(assert (=> b!1416240 (= e!801559 (not e!801562))))

(declare-fun res!952340 () Bool)

(assert (=> b!1416240 (=> res!952340 e!801562)))

(declare-datatypes ((SeekEntryResult!10997 0))(
  ( (MissingZero!10997 (index!46380 (_ BitVec 32))) (Found!10997 (index!46381 (_ BitVec 32))) (Intermediate!10997 (undefined!11809 Bool) (index!46382 (_ BitVec 32)) (x!127977 (_ BitVec 32))) (Undefined!10997) (MissingVacant!10997 (index!46383 (_ BitVec 32))) )
))
(declare-fun lt!624691 () SeekEntryResult!10997)

(get-info :version)

(assert (=> b!1416240 (= res!952340 (or (not ((_ is Intermediate!10997) lt!624691)) (undefined!11809 lt!624691)))))

(declare-fun lt!624684 () SeekEntryResult!10997)

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1416240 (= lt!624684 (Found!10997 j!112))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96657 0))(
  ( (array!96658 (arr!46660 (Array (_ BitVec 32) (_ BitVec 64))) (size!47212 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96657)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96657 (_ BitVec 32)) SeekEntryResult!10997)

(assert (=> b!1416240 (= lt!624684 (seekEntryOrOpen!0 (select (arr!46660 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96657 (_ BitVec 32)) Bool)

(assert (=> b!1416240 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!47811 0))(
  ( (Unit!47812) )
))
(declare-fun lt!624692 () Unit!47811)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96657 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47811)

(assert (=> b!1416240 (= lt!624692 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!624688 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96657 (_ BitVec 32)) SeekEntryResult!10997)

(assert (=> b!1416240 (= lt!624691 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624688 (select (arr!46660 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416240 (= lt!624688 (toIndex!0 (select (arr!46660 a!2901) j!112) mask!2840))))

(declare-fun b!1416241 () Bool)

(declare-fun res!952341 () Bool)

(assert (=> b!1416241 (=> (not res!952341) (not e!801559))))

(assert (=> b!1416241 (= res!952341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!952336 () Bool)

(assert (=> start!122018 (=> (not res!952336) (not e!801559))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122018 (= res!952336 (validMask!0 mask!2840))))

(assert (=> start!122018 e!801559))

(assert (=> start!122018 true))

(declare-fun array_inv!35893 (array!96657) Bool)

(assert (=> start!122018 (array_inv!35893 a!2901)))

(declare-fun b!1416242 () Bool)

(declare-fun res!952333 () Bool)

(declare-fun e!801563 () Bool)

(assert (=> b!1416242 (=> res!952333 e!801563)))

(declare-fun lt!624685 () SeekEntryResult!10997)

(declare-fun lt!624683 () (_ BitVec 64))

(declare-fun lt!624686 () array!96657)

(assert (=> b!1416242 (= res!952333 (not (= lt!624685 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624688 lt!624683 lt!624686 mask!2840))))))

(declare-fun b!1416243 () Bool)

(declare-fun res!952338 () Bool)

(assert (=> b!1416243 (=> (not res!952338) (not e!801559))))

(declare-datatypes ((List!33257 0))(
  ( (Nil!33254) (Cons!33253 (h!34540 (_ BitVec 64)) (t!47943 List!33257)) )
))
(declare-fun arrayNoDuplicates!0 (array!96657 (_ BitVec 32) List!33257) Bool)

(assert (=> b!1416243 (= res!952338 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33254))))

(declare-fun b!1416244 () Bool)

(declare-fun e!801561 () Bool)

(assert (=> b!1416244 (= e!801562 e!801561)))

(declare-fun res!952342 () Bool)

(assert (=> b!1416244 (=> res!952342 e!801561)))

(assert (=> b!1416244 (= res!952342 (or (= lt!624691 lt!624685) (not ((_ is Intermediate!10997) lt!624685))))))

(assert (=> b!1416244 (= lt!624685 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624683 mask!2840) lt!624683 lt!624686 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1416244 (= lt!624683 (select (store (arr!46660 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1416244 (= lt!624686 (array!96658 (store (arr!46660 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47212 a!2901)))))

(declare-fun b!1416245 () Bool)

(declare-fun res!952334 () Bool)

(assert (=> b!1416245 (=> (not res!952334) (not e!801559))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1416245 (= res!952334 (validKeyInArray!0 (select (arr!46660 a!2901) i!1037)))))

(declare-fun b!1416246 () Bool)

(assert (=> b!1416246 (= e!801561 e!801563)))

(declare-fun res!952339 () Bool)

(assert (=> b!1416246 (=> res!952339 e!801563)))

(assert (=> b!1416246 (= res!952339 (or (bvslt (x!127977 lt!624691) #b00000000000000000000000000000000) (bvsgt (x!127977 lt!624691) #b01111111111111111111111111111110) (bvslt (x!127977 lt!624685) #b00000000000000000000000000000000) (bvsgt (x!127977 lt!624685) #b01111111111111111111111111111110) (bvslt lt!624688 #b00000000000000000000000000000000) (bvsge lt!624688 (size!47212 a!2901)) (bvslt (index!46382 lt!624691) #b00000000000000000000000000000000) (bvsge (index!46382 lt!624691) (size!47212 a!2901)) (bvslt (index!46382 lt!624685) #b00000000000000000000000000000000) (bvsge (index!46382 lt!624685) (size!47212 a!2901)) (not (= lt!624691 (Intermediate!10997 false (index!46382 lt!624691) (x!127977 lt!624691)))) (not (= lt!624685 (Intermediate!10997 false (index!46382 lt!624685) (x!127977 lt!624685))))))))

(declare-fun lt!624690 () SeekEntryResult!10997)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96657 (_ BitVec 32)) SeekEntryResult!10997)

(assert (=> b!1416246 (= lt!624690 (seekKeyOrZeroReturnVacant!0 (x!127977 lt!624685) (index!46382 lt!624685) (index!46382 lt!624685) (select (arr!46660 a!2901) j!112) lt!624686 mask!2840))))

(assert (=> b!1416246 (= lt!624690 (seekEntryOrOpen!0 lt!624683 lt!624686 mask!2840))))

(assert (=> b!1416246 (and (not (undefined!11809 lt!624685)) (= (index!46382 lt!624685) i!1037) (bvslt (x!127977 lt!624685) (x!127977 lt!624691)) (= (select (store (arr!46660 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46382 lt!624685)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!624689 () Unit!47811)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96657 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47811)

(assert (=> b!1416246 (= lt!624689 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624688 (x!127977 lt!624691) (index!46382 lt!624691) (x!127977 lt!624685) (index!46382 lt!624685) (undefined!11809 lt!624685) mask!2840))))

(declare-fun b!1416247 () Bool)

(declare-fun res!952335 () Bool)

(assert (=> b!1416247 (=> (not res!952335) (not e!801559))))

(assert (=> b!1416247 (= res!952335 (validKeyInArray!0 (select (arr!46660 a!2901) j!112)))))

(declare-fun b!1416248 () Bool)

(declare-fun res!952337 () Bool)

(assert (=> b!1416248 (=> (not res!952337) (not e!801559))))

(assert (=> b!1416248 (= res!952337 (and (= (size!47212 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47212 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47212 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1416249 () Bool)

(assert (=> b!1416249 (= e!801563 true)))

(assert (=> b!1416249 (= lt!624684 lt!624690)))

(declare-fun lt!624687 () Unit!47811)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!96657 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47811)

(assert (=> b!1416249 (= lt!624687 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624688 (x!127977 lt!624691) (index!46382 lt!624691) (x!127977 lt!624685) (index!46382 lt!624685) mask!2840))))

(assert (= (and start!122018 res!952336) b!1416248))

(assert (= (and b!1416248 res!952337) b!1416245))

(assert (= (and b!1416245 res!952334) b!1416247))

(assert (= (and b!1416247 res!952335) b!1416241))

(assert (= (and b!1416241 res!952341) b!1416243))

(assert (= (and b!1416243 res!952338) b!1416240))

(assert (= (and b!1416240 (not res!952340)) b!1416244))

(assert (= (and b!1416244 (not res!952342)) b!1416246))

(assert (= (and b!1416246 (not res!952339)) b!1416242))

(assert (= (and b!1416242 (not res!952333)) b!1416249))

(declare-fun m!1306447 () Bool)

(assert (=> b!1416244 m!1306447))

(assert (=> b!1416244 m!1306447))

(declare-fun m!1306449 () Bool)

(assert (=> b!1416244 m!1306449))

(declare-fun m!1306451 () Bool)

(assert (=> b!1416244 m!1306451))

(declare-fun m!1306453 () Bool)

(assert (=> b!1416244 m!1306453))

(declare-fun m!1306455 () Bool)

(assert (=> b!1416242 m!1306455))

(declare-fun m!1306457 () Bool)

(assert (=> b!1416241 m!1306457))

(declare-fun m!1306459 () Bool)

(assert (=> b!1416247 m!1306459))

(assert (=> b!1416247 m!1306459))

(declare-fun m!1306461 () Bool)

(assert (=> b!1416247 m!1306461))

(assert (=> b!1416246 m!1306459))

(declare-fun m!1306463 () Bool)

(assert (=> b!1416246 m!1306463))

(declare-fun m!1306465 () Bool)

(assert (=> b!1416246 m!1306465))

(declare-fun m!1306467 () Bool)

(assert (=> b!1416246 m!1306467))

(assert (=> b!1416246 m!1306459))

(declare-fun m!1306469 () Bool)

(assert (=> b!1416246 m!1306469))

(assert (=> b!1416246 m!1306451))

(declare-fun m!1306471 () Bool)

(assert (=> b!1416245 m!1306471))

(assert (=> b!1416245 m!1306471))

(declare-fun m!1306473 () Bool)

(assert (=> b!1416245 m!1306473))

(declare-fun m!1306475 () Bool)

(assert (=> start!122018 m!1306475))

(declare-fun m!1306477 () Bool)

(assert (=> start!122018 m!1306477))

(declare-fun m!1306479 () Bool)

(assert (=> b!1416249 m!1306479))

(assert (=> b!1416240 m!1306459))

(declare-fun m!1306481 () Bool)

(assert (=> b!1416240 m!1306481))

(assert (=> b!1416240 m!1306459))

(assert (=> b!1416240 m!1306459))

(declare-fun m!1306483 () Bool)

(assert (=> b!1416240 m!1306483))

(declare-fun m!1306485 () Bool)

(assert (=> b!1416240 m!1306485))

(assert (=> b!1416240 m!1306459))

(declare-fun m!1306487 () Bool)

(assert (=> b!1416240 m!1306487))

(declare-fun m!1306489 () Bool)

(assert (=> b!1416240 m!1306489))

(declare-fun m!1306491 () Bool)

(assert (=> b!1416243 m!1306491))

(check-sat (not b!1416245) (not b!1416244) (not b!1416247) (not b!1416246) (not b!1416249) (not b!1416242) (not b!1416243) (not b!1416241) (not start!122018) (not b!1416240))
(check-sat)
