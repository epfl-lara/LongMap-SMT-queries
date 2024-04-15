; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123086 () Bool)

(assert start!123086)

(declare-fun b!1427424 () Bool)

(declare-fun res!962516 () Bool)

(declare-fun e!806216 () Bool)

(assert (=> b!1427424 (=> (not res!962516) (not e!806216))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97302 0))(
  ( (array!97303 (arr!46966 (Array (_ BitVec 32) (_ BitVec 64))) (size!47518 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97302)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11272 0))(
  ( (MissingZero!11272 (index!47480 (_ BitVec 32))) (Found!11272 (index!47481 (_ BitVec 32))) (Intermediate!11272 (undefined!12084 Bool) (index!47482 (_ BitVec 32)) (x!129107 (_ BitVec 32))) (Undefined!11272) (MissingVacant!11272 (index!47483 (_ BitVec 32))) )
))
(declare-fun lt!628406 () SeekEntryResult!11272)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97302 (_ BitVec 32)) SeekEntryResult!11272)

(assert (=> b!1427424 (= res!962516 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46966 a!2831) j!81) a!2831 mask!2608) lt!628406))))

(declare-fun b!1427425 () Bool)

(declare-fun res!962509 () Bool)

(declare-fun e!806218 () Bool)

(assert (=> b!1427425 (=> (not res!962509) (not e!806218))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1427425 (= res!962509 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47518 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47518 a!2831))))))

(declare-fun b!1427426 () Bool)

(declare-fun res!962508 () Bool)

(assert (=> b!1427426 (=> (not res!962508) (not e!806218))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1427426 (= res!962508 (validKeyInArray!0 (select (arr!46966 a!2831) j!81)))))

(declare-fun b!1427427 () Bool)

(declare-fun res!962510 () Bool)

(assert (=> b!1427427 (=> (not res!962510) (not e!806216))))

(declare-fun lt!628409 () SeekEntryResult!11272)

(declare-fun lt!628405 () (_ BitVec 64))

(declare-fun lt!628407 () array!97302)

(assert (=> b!1427427 (= res!962510 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628405 lt!628407 mask!2608) lt!628409))))

(declare-fun b!1427428 () Bool)

(declare-fun res!962514 () Bool)

(assert (=> b!1427428 (=> (not res!962514) (not e!806216))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1427428 (= res!962514 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1427429 () Bool)

(declare-fun e!806217 () Bool)

(assert (=> b!1427429 (= e!806218 e!806217)))

(declare-fun res!962511 () Bool)

(assert (=> b!1427429 (=> (not res!962511) (not e!806217))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1427429 (= res!962511 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46966 a!2831) j!81) mask!2608) (select (arr!46966 a!2831) j!81) a!2831 mask!2608) lt!628406))))

(assert (=> b!1427429 (= lt!628406 (Intermediate!11272 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun e!806215 () Bool)

(declare-fun b!1427430 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97302 (_ BitVec 32)) SeekEntryResult!11272)

(assert (=> b!1427430 (= e!806215 (= (seekEntryOrOpen!0 (select (arr!46966 a!2831) j!81) a!2831 mask!2608) (Found!11272 j!81)))))

(declare-fun b!1427431 () Bool)

(assert (=> b!1427431 (= e!806217 e!806216)))

(declare-fun res!962515 () Bool)

(assert (=> b!1427431 (=> (not res!962515) (not e!806216))))

(assert (=> b!1427431 (= res!962515 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628405 mask!2608) lt!628405 lt!628407 mask!2608) lt!628409))))

(assert (=> b!1427431 (= lt!628409 (Intermediate!11272 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1427431 (= lt!628405 (select (store (arr!46966 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1427431 (= lt!628407 (array!97303 (store (arr!46966 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47518 a!2831)))))

(declare-fun b!1427433 () Bool)

(declare-fun res!962506 () Bool)

(assert (=> b!1427433 (=> (not res!962506) (not e!806218))))

(assert (=> b!1427433 (= res!962506 (validKeyInArray!0 (select (arr!46966 a!2831) i!982)))))

(declare-fun b!1427434 () Bool)

(declare-fun res!962512 () Bool)

(assert (=> b!1427434 (=> (not res!962512) (not e!806218))))

(assert (=> b!1427434 (= res!962512 (and (= (size!47518 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47518 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47518 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1427435 () Bool)

(declare-fun res!962507 () Bool)

(assert (=> b!1427435 (=> (not res!962507) (not e!806218))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97302 (_ BitVec 32)) Bool)

(assert (=> b!1427435 (= res!962507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1427436 () Bool)

(declare-fun res!962518 () Bool)

(assert (=> b!1427436 (=> (not res!962518) (not e!806218))))

(declare-datatypes ((List!33554 0))(
  ( (Nil!33551) (Cons!33550 (h!34858 (_ BitVec 64)) (t!48240 List!33554)) )
))
(declare-fun arrayNoDuplicates!0 (array!97302 (_ BitVec 32) List!33554) Bool)

(assert (=> b!1427436 (= res!962518 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33551))))

(declare-fun b!1427432 () Bool)

(assert (=> b!1427432 (= e!806216 (not (or (= (select (arr!46966 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= (select (arr!46966 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1427432 e!806215))

(declare-fun res!962513 () Bool)

(assert (=> b!1427432 (=> (not res!962513) (not e!806215))))

(assert (=> b!1427432 (= res!962513 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48129 0))(
  ( (Unit!48130) )
))
(declare-fun lt!628408 () Unit!48129)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97302 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48129)

(assert (=> b!1427432 (= lt!628408 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun res!962517 () Bool)

(assert (=> start!123086 (=> (not res!962517) (not e!806218))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123086 (= res!962517 (validMask!0 mask!2608))))

(assert (=> start!123086 e!806218))

(assert (=> start!123086 true))

(declare-fun array_inv!36199 (array!97302) Bool)

(assert (=> start!123086 (array_inv!36199 a!2831)))

(assert (= (and start!123086 res!962517) b!1427434))

(assert (= (and b!1427434 res!962512) b!1427433))

(assert (= (and b!1427433 res!962506) b!1427426))

(assert (= (and b!1427426 res!962508) b!1427435))

(assert (= (and b!1427435 res!962507) b!1427436))

(assert (= (and b!1427436 res!962518) b!1427425))

(assert (= (and b!1427425 res!962509) b!1427429))

(assert (= (and b!1427429 res!962511) b!1427431))

(assert (= (and b!1427431 res!962515) b!1427424))

(assert (= (and b!1427424 res!962516) b!1427427))

(assert (= (and b!1427427 res!962510) b!1427428))

(assert (= (and b!1427428 res!962514) b!1427432))

(assert (= (and b!1427432 res!962513) b!1427430))

(declare-fun m!1317321 () Bool)

(assert (=> b!1427424 m!1317321))

(assert (=> b!1427424 m!1317321))

(declare-fun m!1317323 () Bool)

(assert (=> b!1427424 m!1317323))

(declare-fun m!1317325 () Bool)

(assert (=> b!1427431 m!1317325))

(assert (=> b!1427431 m!1317325))

(declare-fun m!1317327 () Bool)

(assert (=> b!1427431 m!1317327))

(declare-fun m!1317329 () Bool)

(assert (=> b!1427431 m!1317329))

(declare-fun m!1317331 () Bool)

(assert (=> b!1427431 m!1317331))

(assert (=> b!1427430 m!1317321))

(assert (=> b!1427430 m!1317321))

(declare-fun m!1317333 () Bool)

(assert (=> b!1427430 m!1317333))

(assert (=> b!1427429 m!1317321))

(assert (=> b!1427429 m!1317321))

(declare-fun m!1317335 () Bool)

(assert (=> b!1427429 m!1317335))

(assert (=> b!1427429 m!1317335))

(assert (=> b!1427429 m!1317321))

(declare-fun m!1317337 () Bool)

(assert (=> b!1427429 m!1317337))

(declare-fun m!1317339 () Bool)

(assert (=> b!1427435 m!1317339))

(declare-fun m!1317341 () Bool)

(assert (=> start!123086 m!1317341))

(declare-fun m!1317343 () Bool)

(assert (=> start!123086 m!1317343))

(declare-fun m!1317345 () Bool)

(assert (=> b!1427432 m!1317345))

(declare-fun m!1317347 () Bool)

(assert (=> b!1427432 m!1317347))

(declare-fun m!1317349 () Bool)

(assert (=> b!1427432 m!1317349))

(declare-fun m!1317351 () Bool)

(assert (=> b!1427436 m!1317351))

(declare-fun m!1317353 () Bool)

(assert (=> b!1427433 m!1317353))

(assert (=> b!1427433 m!1317353))

(declare-fun m!1317355 () Bool)

(assert (=> b!1427433 m!1317355))

(assert (=> b!1427426 m!1317321))

(assert (=> b!1427426 m!1317321))

(declare-fun m!1317357 () Bool)

(assert (=> b!1427426 m!1317357))

(declare-fun m!1317359 () Bool)

(assert (=> b!1427427 m!1317359))

(check-sat (not b!1427433) (not b!1427429) (not b!1427424) (not b!1427432) (not start!123086) (not b!1427435) (not b!1427436) (not b!1427431) (not b!1427427) (not b!1427430) (not b!1427426))
(check-sat)
(get-model)

(declare-fun b!1427527 () Bool)

(declare-fun e!806257 () SeekEntryResult!11272)

(declare-fun e!806256 () SeekEntryResult!11272)

(assert (=> b!1427527 (= e!806257 e!806256)))

(declare-fun lt!628448 () (_ BitVec 64))

(declare-fun lt!628446 () SeekEntryResult!11272)

(assert (=> b!1427527 (= lt!628448 (select (arr!46966 a!2831) (index!47482 lt!628446)))))

(declare-fun c!131957 () Bool)

(assert (=> b!1427527 (= c!131957 (= lt!628448 (select (arr!46966 a!2831) j!81)))))

(declare-fun b!1427528 () Bool)

(declare-fun c!131958 () Bool)

(assert (=> b!1427528 (= c!131958 (= lt!628448 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!806258 () SeekEntryResult!11272)

(assert (=> b!1427528 (= e!806256 e!806258)))

(declare-fun b!1427529 () Bool)

(assert (=> b!1427529 (= e!806258 (MissingZero!11272 (index!47482 lt!628446)))))

(declare-fun b!1427531 () Bool)

(assert (=> b!1427531 (= e!806256 (Found!11272 (index!47482 lt!628446)))))

(declare-fun b!1427532 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97302 (_ BitVec 32)) SeekEntryResult!11272)

(assert (=> b!1427532 (= e!806258 (seekKeyOrZeroReturnVacant!0 (x!129107 lt!628446) (index!47482 lt!628446) (index!47482 lt!628446) (select (arr!46966 a!2831) j!81) a!2831 mask!2608))))

(declare-fun d!153233 () Bool)

(declare-fun lt!628447 () SeekEntryResult!11272)

(get-info :version)

(assert (=> d!153233 (and (or ((_ is Undefined!11272) lt!628447) (not ((_ is Found!11272) lt!628447)) (and (bvsge (index!47481 lt!628447) #b00000000000000000000000000000000) (bvslt (index!47481 lt!628447) (size!47518 a!2831)))) (or ((_ is Undefined!11272) lt!628447) ((_ is Found!11272) lt!628447) (not ((_ is MissingZero!11272) lt!628447)) (and (bvsge (index!47480 lt!628447) #b00000000000000000000000000000000) (bvslt (index!47480 lt!628447) (size!47518 a!2831)))) (or ((_ is Undefined!11272) lt!628447) ((_ is Found!11272) lt!628447) ((_ is MissingZero!11272) lt!628447) (not ((_ is MissingVacant!11272) lt!628447)) (and (bvsge (index!47483 lt!628447) #b00000000000000000000000000000000) (bvslt (index!47483 lt!628447) (size!47518 a!2831)))) (or ((_ is Undefined!11272) lt!628447) (ite ((_ is Found!11272) lt!628447) (= (select (arr!46966 a!2831) (index!47481 lt!628447)) (select (arr!46966 a!2831) j!81)) (ite ((_ is MissingZero!11272) lt!628447) (= (select (arr!46966 a!2831) (index!47480 lt!628447)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!11272) lt!628447) (= (select (arr!46966 a!2831) (index!47483 lt!628447)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!153233 (= lt!628447 e!806257)))

(declare-fun c!131959 () Bool)

(assert (=> d!153233 (= c!131959 (and ((_ is Intermediate!11272) lt!628446) (undefined!12084 lt!628446)))))

(assert (=> d!153233 (= lt!628446 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46966 a!2831) j!81) mask!2608) (select (arr!46966 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!153233 (validMask!0 mask!2608)))

(assert (=> d!153233 (= (seekEntryOrOpen!0 (select (arr!46966 a!2831) j!81) a!2831 mask!2608) lt!628447)))

(declare-fun b!1427530 () Bool)

(assert (=> b!1427530 (= e!806257 Undefined!11272)))

(assert (= (and d!153233 c!131959) b!1427530))

(assert (= (and d!153233 (not c!131959)) b!1427527))

(assert (= (and b!1427527 c!131957) b!1427531))

(assert (= (and b!1427527 (not c!131957)) b!1427528))

(assert (= (and b!1427528 c!131958) b!1427529))

(assert (= (and b!1427528 (not c!131958)) b!1427532))

(declare-fun m!1317441 () Bool)

(assert (=> b!1427527 m!1317441))

(assert (=> b!1427532 m!1317321))

(declare-fun m!1317443 () Bool)

(assert (=> b!1427532 m!1317443))

(declare-fun m!1317445 () Bool)

(assert (=> d!153233 m!1317445))

(assert (=> d!153233 m!1317335))

(assert (=> d!153233 m!1317321))

(assert (=> d!153233 m!1317337))

(declare-fun m!1317447 () Bool)

(assert (=> d!153233 m!1317447))

(assert (=> d!153233 m!1317341))

(assert (=> d!153233 m!1317321))

(assert (=> d!153233 m!1317335))

(declare-fun m!1317449 () Bool)

(assert (=> d!153233 m!1317449))

(assert (=> b!1427430 d!153233))

(declare-fun b!1427551 () Bool)

(declare-fun e!806269 () Bool)

(declare-fun lt!628453 () SeekEntryResult!11272)

(assert (=> b!1427551 (= e!806269 (bvsge (x!129107 lt!628453) #b01111111111111111111111111111110))))

(declare-fun b!1427552 () Bool)

(assert (=> b!1427552 (and (bvsge (index!47482 lt!628453) #b00000000000000000000000000000000) (bvslt (index!47482 lt!628453) (size!47518 lt!628407)))))

(declare-fun res!962605 () Bool)

(assert (=> b!1427552 (= res!962605 (= (select (arr!46966 lt!628407) (index!47482 lt!628453)) lt!628405))))

(declare-fun e!806272 () Bool)

(assert (=> b!1427552 (=> res!962605 e!806272)))

(declare-fun e!806270 () Bool)

(assert (=> b!1427552 (= e!806270 e!806272)))

(declare-fun b!1427553 () Bool)

(declare-fun e!806271 () SeekEntryResult!11272)

(declare-fun e!806273 () SeekEntryResult!11272)

(assert (=> b!1427553 (= e!806271 e!806273)))

(declare-fun c!131966 () Bool)

(declare-fun lt!628454 () (_ BitVec 64))

(assert (=> b!1427553 (= c!131966 (or (= lt!628454 lt!628405) (= (bvadd lt!628454 lt!628454) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1427554 () Bool)

(assert (=> b!1427554 (and (bvsge (index!47482 lt!628453) #b00000000000000000000000000000000) (bvslt (index!47482 lt!628453) (size!47518 lt!628407)))))

(assert (=> b!1427554 (= e!806272 (= (select (arr!46966 lt!628407) (index!47482 lt!628453)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1427555 () Bool)

(assert (=> b!1427555 (and (bvsge (index!47482 lt!628453) #b00000000000000000000000000000000) (bvslt (index!47482 lt!628453) (size!47518 lt!628407)))))

(declare-fun res!962603 () Bool)

(assert (=> b!1427555 (= res!962603 (= (select (arr!46966 lt!628407) (index!47482 lt!628453)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1427555 (=> res!962603 e!806272)))

(declare-fun b!1427556 () Bool)

(assert (=> b!1427556 (= e!806269 e!806270)))

(declare-fun res!962604 () Bool)

(assert (=> b!1427556 (= res!962604 (and ((_ is Intermediate!11272) lt!628453) (not (undefined!12084 lt!628453)) (bvslt (x!129107 lt!628453) #b01111111111111111111111111111110) (bvsge (x!129107 lt!628453) #b00000000000000000000000000000000) (bvsge (x!129107 lt!628453) #b00000000000000000000000000000000)))))

(assert (=> b!1427556 (=> (not res!962604) (not e!806270))))

(declare-fun b!1427557 () Bool)

(assert (=> b!1427557 (= e!806273 (Intermediate!11272 false (toIndex!0 lt!628405 mask!2608) #b00000000000000000000000000000000))))

(declare-fun d!153235 () Bool)

(assert (=> d!153235 e!806269))

(declare-fun c!131968 () Bool)

(assert (=> d!153235 (= c!131968 (and ((_ is Intermediate!11272) lt!628453) (undefined!12084 lt!628453)))))

(assert (=> d!153235 (= lt!628453 e!806271)))

(declare-fun c!131967 () Bool)

(assert (=> d!153235 (= c!131967 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!153235 (= lt!628454 (select (arr!46966 lt!628407) (toIndex!0 lt!628405 mask!2608)))))

(assert (=> d!153235 (validMask!0 mask!2608)))

(assert (=> d!153235 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628405 mask!2608) lt!628405 lt!628407 mask!2608) lt!628453)))

(declare-fun b!1427558 () Bool)

(assert (=> b!1427558 (= e!806271 (Intermediate!11272 true (toIndex!0 lt!628405 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1427559 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1427559 (= e!806273 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!628405 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!628405 lt!628407 mask!2608))))

(assert (= (and d!153235 c!131967) b!1427558))

(assert (= (and d!153235 (not c!131967)) b!1427553))

(assert (= (and b!1427553 c!131966) b!1427557))

(assert (= (and b!1427553 (not c!131966)) b!1427559))

(assert (= (and d!153235 c!131968) b!1427551))

(assert (= (and d!153235 (not c!131968)) b!1427556))

(assert (= (and b!1427556 res!962604) b!1427552))

(assert (= (and b!1427552 (not res!962605)) b!1427555))

(assert (= (and b!1427555 (not res!962603)) b!1427554))

(declare-fun m!1317451 () Bool)

(assert (=> b!1427552 m!1317451))

(assert (=> b!1427555 m!1317451))

(assert (=> b!1427559 m!1317325))

(declare-fun m!1317453 () Bool)

(assert (=> b!1427559 m!1317453))

(assert (=> b!1427559 m!1317453))

(declare-fun m!1317455 () Bool)

(assert (=> b!1427559 m!1317455))

(assert (=> d!153235 m!1317325))

(declare-fun m!1317457 () Bool)

(assert (=> d!153235 m!1317457))

(assert (=> d!153235 m!1317341))

(assert (=> b!1427554 m!1317451))

(assert (=> b!1427431 d!153235))

(declare-fun d!153243 () Bool)

(declare-fun lt!628468 () (_ BitVec 32))

(declare-fun lt!628467 () (_ BitVec 32))

(assert (=> d!153243 (= lt!628468 (bvmul (bvxor lt!628467 (bvlshr lt!628467 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153243 (= lt!628467 ((_ extract 31 0) (bvand (bvxor lt!628405 (bvlshr lt!628405 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153243 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!962606 (let ((h!34861 ((_ extract 31 0) (bvand (bvxor lt!628405 (bvlshr lt!628405 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129111 (bvmul (bvxor h!34861 (bvlshr h!34861 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129111 (bvlshr x!129111 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!962606 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!962606 #b00000000000000000000000000000000))))))

(assert (=> d!153243 (= (toIndex!0 lt!628405 mask!2608) (bvand (bvxor lt!628468 (bvlshr lt!628468 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1427431 d!153243))

(declare-fun b!1427624 () Bool)

(declare-fun e!806313 () Bool)

(declare-fun e!806315 () Bool)

(assert (=> b!1427624 (= e!806313 e!806315)))

(declare-fun c!131989 () Bool)

(assert (=> b!1427624 (= c!131989 (validKeyInArray!0 (select (arr!46966 a!2831) #b00000000000000000000000000000000)))))

(declare-fun bm!67343 () Bool)

(declare-fun call!67346 () Bool)

(assert (=> bm!67343 (= call!67346 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131989 (Cons!33550 (select (arr!46966 a!2831) #b00000000000000000000000000000000) Nil!33551) Nil!33551)))))

(declare-fun b!1427626 () Bool)

(assert (=> b!1427626 (= e!806315 call!67346)))

(declare-fun b!1427627 () Bool)

(declare-fun e!806312 () Bool)

(assert (=> b!1427627 (= e!806312 e!806313)))

(declare-fun res!962631 () Bool)

(assert (=> b!1427627 (=> (not res!962631) (not e!806313))))

(declare-fun e!806314 () Bool)

(assert (=> b!1427627 (= res!962631 (not e!806314))))

(declare-fun res!962633 () Bool)

(assert (=> b!1427627 (=> (not res!962633) (not e!806314))))

(assert (=> b!1427627 (= res!962633 (validKeyInArray!0 (select (arr!46966 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1427628 () Bool)

(declare-fun contains!9813 (List!33554 (_ BitVec 64)) Bool)

(assert (=> b!1427628 (= e!806314 (contains!9813 Nil!33551 (select (arr!46966 a!2831) #b00000000000000000000000000000000)))))

(declare-fun d!153245 () Bool)

(declare-fun res!962632 () Bool)

(assert (=> d!153245 (=> res!962632 e!806312)))

(assert (=> d!153245 (= res!962632 (bvsge #b00000000000000000000000000000000 (size!47518 a!2831)))))

(assert (=> d!153245 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33551) e!806312)))

(declare-fun b!1427625 () Bool)

(assert (=> b!1427625 (= e!806315 call!67346)))

(assert (= (and d!153245 (not res!962632)) b!1427627))

(assert (= (and b!1427627 res!962633) b!1427628))

(assert (= (and b!1427627 res!962631) b!1427624))

(assert (= (and b!1427624 c!131989) b!1427626))

(assert (= (and b!1427624 (not c!131989)) b!1427625))

(assert (= (or b!1427626 b!1427625) bm!67343))

(declare-fun m!1317475 () Bool)

(assert (=> b!1427624 m!1317475))

(assert (=> b!1427624 m!1317475))

(declare-fun m!1317477 () Bool)

(assert (=> b!1427624 m!1317477))

(assert (=> bm!67343 m!1317475))

(declare-fun m!1317479 () Bool)

(assert (=> bm!67343 m!1317479))

(assert (=> b!1427627 m!1317475))

(assert (=> b!1427627 m!1317475))

(assert (=> b!1427627 m!1317477))

(assert (=> b!1427628 m!1317475))

(assert (=> b!1427628 m!1317475))

(declare-fun m!1317481 () Bool)

(assert (=> b!1427628 m!1317481))

(assert (=> b!1427436 d!153245))

(declare-fun d!153251 () Bool)

(assert (=> d!153251 (= (validKeyInArray!0 (select (arr!46966 a!2831) j!81)) (and (not (= (select (arr!46966 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46966 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1427426 d!153251))

(declare-fun b!1427637 () Bool)

(declare-fun e!806322 () Bool)

(declare-fun lt!628473 () SeekEntryResult!11272)

(assert (=> b!1427637 (= e!806322 (bvsge (x!129107 lt!628473) #b01111111111111111111111111111110))))

(declare-fun b!1427638 () Bool)

(assert (=> b!1427638 (and (bvsge (index!47482 lt!628473) #b00000000000000000000000000000000) (bvslt (index!47482 lt!628473) (size!47518 lt!628407)))))

(declare-fun res!962642 () Bool)

(assert (=> b!1427638 (= res!962642 (= (select (arr!46966 lt!628407) (index!47482 lt!628473)) lt!628405))))

(declare-fun e!806325 () Bool)

(assert (=> b!1427638 (=> res!962642 e!806325)))

(declare-fun e!806323 () Bool)

(assert (=> b!1427638 (= e!806323 e!806325)))

(declare-fun b!1427639 () Bool)

(declare-fun e!806324 () SeekEntryResult!11272)

(declare-fun e!806326 () SeekEntryResult!11272)

(assert (=> b!1427639 (= e!806324 e!806326)))

(declare-fun c!131990 () Bool)

(declare-fun lt!628474 () (_ BitVec 64))

(assert (=> b!1427639 (= c!131990 (or (= lt!628474 lt!628405) (= (bvadd lt!628474 lt!628474) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1427640 () Bool)

(assert (=> b!1427640 (and (bvsge (index!47482 lt!628473) #b00000000000000000000000000000000) (bvslt (index!47482 lt!628473) (size!47518 lt!628407)))))

(assert (=> b!1427640 (= e!806325 (= (select (arr!46966 lt!628407) (index!47482 lt!628473)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1427641 () Bool)

(assert (=> b!1427641 (and (bvsge (index!47482 lt!628473) #b00000000000000000000000000000000) (bvslt (index!47482 lt!628473) (size!47518 lt!628407)))))

(declare-fun res!962640 () Bool)

(assert (=> b!1427641 (= res!962640 (= (select (arr!46966 lt!628407) (index!47482 lt!628473)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1427641 (=> res!962640 e!806325)))

(declare-fun b!1427642 () Bool)

(assert (=> b!1427642 (= e!806322 e!806323)))

(declare-fun res!962641 () Bool)

(assert (=> b!1427642 (= res!962641 (and ((_ is Intermediate!11272) lt!628473) (not (undefined!12084 lt!628473)) (bvslt (x!129107 lt!628473) #b01111111111111111111111111111110) (bvsge (x!129107 lt!628473) #b00000000000000000000000000000000) (bvsge (x!129107 lt!628473) x!605)))))

(assert (=> b!1427642 (=> (not res!962641) (not e!806323))))

(declare-fun b!1427643 () Bool)

(assert (=> b!1427643 (= e!806326 (Intermediate!11272 false index!585 x!605))))

(declare-fun d!153253 () Bool)

(assert (=> d!153253 e!806322))

(declare-fun c!131992 () Bool)

(assert (=> d!153253 (= c!131992 (and ((_ is Intermediate!11272) lt!628473) (undefined!12084 lt!628473)))))

(assert (=> d!153253 (= lt!628473 e!806324)))

(declare-fun c!131991 () Bool)

(assert (=> d!153253 (= c!131991 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!153253 (= lt!628474 (select (arr!46966 lt!628407) index!585))))

(assert (=> d!153253 (validMask!0 mask!2608)))

(assert (=> d!153253 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628405 lt!628407 mask!2608) lt!628473)))

(declare-fun b!1427644 () Bool)

(assert (=> b!1427644 (= e!806324 (Intermediate!11272 true index!585 x!605))))

(declare-fun b!1427645 () Bool)

(assert (=> b!1427645 (= e!806326 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!628405 lt!628407 mask!2608))))

(assert (= (and d!153253 c!131991) b!1427644))

(assert (= (and d!153253 (not c!131991)) b!1427639))

(assert (= (and b!1427639 c!131990) b!1427643))

(assert (= (and b!1427639 (not c!131990)) b!1427645))

(assert (= (and d!153253 c!131992) b!1427637))

(assert (= (and d!153253 (not c!131992)) b!1427642))

(assert (= (and b!1427642 res!962641) b!1427638))

(assert (= (and b!1427638 (not res!962642)) b!1427641))

(assert (= (and b!1427641 (not res!962640)) b!1427640))

(declare-fun m!1317483 () Bool)

(assert (=> b!1427638 m!1317483))

(assert (=> b!1427641 m!1317483))

(declare-fun m!1317485 () Bool)

(assert (=> b!1427645 m!1317485))

(assert (=> b!1427645 m!1317485))

(declare-fun m!1317487 () Bool)

(assert (=> b!1427645 m!1317487))

(declare-fun m!1317489 () Bool)

(assert (=> d!153253 m!1317489))

(assert (=> d!153253 m!1317341))

(assert (=> b!1427640 m!1317483))

(assert (=> b!1427427 d!153253))

(declare-fun b!1427667 () Bool)

(declare-fun e!806347 () Bool)

(declare-fun call!67352 () Bool)

(assert (=> b!1427667 (= e!806347 call!67352)))

(declare-fun b!1427668 () Bool)

(declare-fun e!806346 () Bool)

(declare-fun e!806345 () Bool)

(assert (=> b!1427668 (= e!806346 e!806345)))

(declare-fun c!132000 () Bool)

(assert (=> b!1427668 (= c!132000 (validKeyInArray!0 (select (arr!46966 a!2831) j!81)))))

(declare-fun d!153255 () Bool)

(declare-fun res!962655 () Bool)

(assert (=> d!153255 (=> res!962655 e!806346)))

(assert (=> d!153255 (= res!962655 (bvsge j!81 (size!47518 a!2831)))))

(assert (=> d!153255 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!806346)))

(declare-fun b!1427669 () Bool)

(assert (=> b!1427669 (= e!806345 call!67352)))

(declare-fun bm!67349 () Bool)

(assert (=> bm!67349 (= call!67352 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1427670 () Bool)

(assert (=> b!1427670 (= e!806345 e!806347)))

(declare-fun lt!628487 () (_ BitVec 64))

(assert (=> b!1427670 (= lt!628487 (select (arr!46966 a!2831) j!81))))

(declare-fun lt!628488 () Unit!48129)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97302 (_ BitVec 64) (_ BitVec 32)) Unit!48129)

(assert (=> b!1427670 (= lt!628488 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!628487 j!81))))

(declare-fun arrayContainsKey!0 (array!97302 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1427670 (arrayContainsKey!0 a!2831 lt!628487 #b00000000000000000000000000000000)))

(declare-fun lt!628489 () Unit!48129)

(assert (=> b!1427670 (= lt!628489 lt!628488)))

(declare-fun res!962654 () Bool)

(assert (=> b!1427670 (= res!962654 (= (seekEntryOrOpen!0 (select (arr!46966 a!2831) j!81) a!2831 mask!2608) (Found!11272 j!81)))))

(assert (=> b!1427670 (=> (not res!962654) (not e!806347))))

(assert (= (and d!153255 (not res!962655)) b!1427668))

(assert (= (and b!1427668 c!132000) b!1427670))

(assert (= (and b!1427668 (not c!132000)) b!1427669))

(assert (= (and b!1427670 res!962654) b!1427667))

(assert (= (or b!1427667 b!1427669) bm!67349))

(assert (=> b!1427668 m!1317321))

(assert (=> b!1427668 m!1317321))

(assert (=> b!1427668 m!1317357))

(declare-fun m!1317499 () Bool)

(assert (=> bm!67349 m!1317499))

(assert (=> b!1427670 m!1317321))

(declare-fun m!1317501 () Bool)

(assert (=> b!1427670 m!1317501))

(declare-fun m!1317503 () Bool)

(assert (=> b!1427670 m!1317503))

(assert (=> b!1427670 m!1317321))

(assert (=> b!1427670 m!1317333))

(assert (=> b!1427432 d!153255))

(declare-fun d!153263 () Bool)

(assert (=> d!153263 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!628501 () Unit!48129)

(declare-fun choose!38 (array!97302 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48129)

(assert (=> d!153263 (= lt!628501 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!153263 (validMask!0 mask!2608)))

(assert (=> d!153263 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!628501)))

(declare-fun bs!41581 () Bool)

(assert (= bs!41581 d!153263))

(assert (=> bs!41581 m!1317347))

(declare-fun m!1317511 () Bool)

(assert (=> bs!41581 m!1317511))

(assert (=> bs!41581 m!1317341))

(assert (=> b!1427432 d!153263))

(declare-fun d!153267 () Bool)

(assert (=> d!153267 (= (validKeyInArray!0 (select (arr!46966 a!2831) i!982)) (and (not (= (select (arr!46966 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46966 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1427433 d!153267))

(declare-fun b!1427685 () Bool)

(declare-fun e!806357 () Bool)

(declare-fun lt!628502 () SeekEntryResult!11272)

(assert (=> b!1427685 (= e!806357 (bvsge (x!129107 lt!628502) #b01111111111111111111111111111110))))

(declare-fun b!1427686 () Bool)

(assert (=> b!1427686 (and (bvsge (index!47482 lt!628502) #b00000000000000000000000000000000) (bvslt (index!47482 lt!628502) (size!47518 a!2831)))))

(declare-fun res!962664 () Bool)

(assert (=> b!1427686 (= res!962664 (= (select (arr!46966 a!2831) (index!47482 lt!628502)) (select (arr!46966 a!2831) j!81)))))

(declare-fun e!806360 () Bool)

(assert (=> b!1427686 (=> res!962664 e!806360)))

(declare-fun e!806358 () Bool)

(assert (=> b!1427686 (= e!806358 e!806360)))

(declare-fun b!1427687 () Bool)

(declare-fun e!806359 () SeekEntryResult!11272)

(declare-fun e!806361 () SeekEntryResult!11272)

(assert (=> b!1427687 (= e!806359 e!806361)))

(declare-fun c!132004 () Bool)

(declare-fun lt!628503 () (_ BitVec 64))

(assert (=> b!1427687 (= c!132004 (or (= lt!628503 (select (arr!46966 a!2831) j!81)) (= (bvadd lt!628503 lt!628503) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1427688 () Bool)

(assert (=> b!1427688 (and (bvsge (index!47482 lt!628502) #b00000000000000000000000000000000) (bvslt (index!47482 lt!628502) (size!47518 a!2831)))))

(assert (=> b!1427688 (= e!806360 (= (select (arr!46966 a!2831) (index!47482 lt!628502)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1427689 () Bool)

(assert (=> b!1427689 (and (bvsge (index!47482 lt!628502) #b00000000000000000000000000000000) (bvslt (index!47482 lt!628502) (size!47518 a!2831)))))

(declare-fun res!962662 () Bool)

(assert (=> b!1427689 (= res!962662 (= (select (arr!46966 a!2831) (index!47482 lt!628502)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1427689 (=> res!962662 e!806360)))

(declare-fun b!1427690 () Bool)

(assert (=> b!1427690 (= e!806357 e!806358)))

(declare-fun res!962663 () Bool)

(assert (=> b!1427690 (= res!962663 (and ((_ is Intermediate!11272) lt!628502) (not (undefined!12084 lt!628502)) (bvslt (x!129107 lt!628502) #b01111111111111111111111111111110) (bvsge (x!129107 lt!628502) #b00000000000000000000000000000000) (bvsge (x!129107 lt!628502) #b00000000000000000000000000000000)))))

(assert (=> b!1427690 (=> (not res!962663) (not e!806358))))

(declare-fun b!1427691 () Bool)

(assert (=> b!1427691 (= e!806361 (Intermediate!11272 false (toIndex!0 (select (arr!46966 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun d!153269 () Bool)

(assert (=> d!153269 e!806357))

(declare-fun c!132006 () Bool)

(assert (=> d!153269 (= c!132006 (and ((_ is Intermediate!11272) lt!628502) (undefined!12084 lt!628502)))))

(assert (=> d!153269 (= lt!628502 e!806359)))

(declare-fun c!132005 () Bool)

(assert (=> d!153269 (= c!132005 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!153269 (= lt!628503 (select (arr!46966 a!2831) (toIndex!0 (select (arr!46966 a!2831) j!81) mask!2608)))))

(assert (=> d!153269 (validMask!0 mask!2608)))

(assert (=> d!153269 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46966 a!2831) j!81) mask!2608) (select (arr!46966 a!2831) j!81) a!2831 mask!2608) lt!628502)))

(declare-fun b!1427692 () Bool)

(assert (=> b!1427692 (= e!806359 (Intermediate!11272 true (toIndex!0 (select (arr!46966 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1427693 () Bool)

(assert (=> b!1427693 (= e!806361 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46966 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!46966 a!2831) j!81) a!2831 mask!2608))))

(assert (= (and d!153269 c!132005) b!1427692))

(assert (= (and d!153269 (not c!132005)) b!1427687))

(assert (= (and b!1427687 c!132004) b!1427691))

(assert (= (and b!1427687 (not c!132004)) b!1427693))

(assert (= (and d!153269 c!132006) b!1427685))

(assert (= (and d!153269 (not c!132006)) b!1427690))

(assert (= (and b!1427690 res!962663) b!1427686))

(assert (= (and b!1427686 (not res!962664)) b!1427689))

(assert (= (and b!1427689 (not res!962662)) b!1427688))

(declare-fun m!1317513 () Bool)

(assert (=> b!1427686 m!1317513))

(assert (=> b!1427689 m!1317513))

(assert (=> b!1427693 m!1317335))

(declare-fun m!1317515 () Bool)

(assert (=> b!1427693 m!1317515))

(assert (=> b!1427693 m!1317515))

(assert (=> b!1427693 m!1317321))

(declare-fun m!1317517 () Bool)

(assert (=> b!1427693 m!1317517))

(assert (=> d!153269 m!1317335))

(declare-fun m!1317521 () Bool)

(assert (=> d!153269 m!1317521))

(assert (=> d!153269 m!1317341))

(assert (=> b!1427688 m!1317513))

(assert (=> b!1427429 d!153269))

(declare-fun d!153271 () Bool)

(declare-fun lt!628508 () (_ BitVec 32))

(declare-fun lt!628507 () (_ BitVec 32))

(assert (=> d!153271 (= lt!628508 (bvmul (bvxor lt!628507 (bvlshr lt!628507 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153271 (= lt!628507 ((_ extract 31 0) (bvand (bvxor (select (arr!46966 a!2831) j!81) (bvlshr (select (arr!46966 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153271 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!962606 (let ((h!34861 ((_ extract 31 0) (bvand (bvxor (select (arr!46966 a!2831) j!81) (bvlshr (select (arr!46966 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129111 (bvmul (bvxor h!34861 (bvlshr h!34861 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129111 (bvlshr x!129111 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!962606 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!962606 #b00000000000000000000000000000000))))))

(assert (=> d!153271 (= (toIndex!0 (select (arr!46966 a!2831) j!81) mask!2608) (bvand (bvxor lt!628508 (bvlshr lt!628508 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1427429 d!153271))

(declare-fun b!1427707 () Bool)

(declare-fun e!806372 () Bool)

(declare-fun call!67359 () Bool)

(assert (=> b!1427707 (= e!806372 call!67359)))

(declare-fun b!1427708 () Bool)

(declare-fun e!806371 () Bool)

(declare-fun e!806370 () Bool)

(assert (=> b!1427708 (= e!806371 e!806370)))

(declare-fun c!132011 () Bool)

(assert (=> b!1427708 (= c!132011 (validKeyInArray!0 (select (arr!46966 a!2831) #b00000000000000000000000000000000)))))

(declare-fun d!153275 () Bool)

(declare-fun res!962671 () Bool)

(assert (=> d!153275 (=> res!962671 e!806371)))

(assert (=> d!153275 (= res!962671 (bvsge #b00000000000000000000000000000000 (size!47518 a!2831)))))

(assert (=> d!153275 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!806371)))

(declare-fun b!1427709 () Bool)

(assert (=> b!1427709 (= e!806370 call!67359)))

(declare-fun bm!67356 () Bool)

(assert (=> bm!67356 (= call!67359 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1427710 () Bool)

(assert (=> b!1427710 (= e!806370 e!806372)))

(declare-fun lt!628511 () (_ BitVec 64))

(assert (=> b!1427710 (= lt!628511 (select (arr!46966 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!628512 () Unit!48129)

(assert (=> b!1427710 (= lt!628512 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!628511 #b00000000000000000000000000000000))))

(assert (=> b!1427710 (arrayContainsKey!0 a!2831 lt!628511 #b00000000000000000000000000000000)))

(declare-fun lt!628513 () Unit!48129)

(assert (=> b!1427710 (= lt!628513 lt!628512)))

(declare-fun res!962670 () Bool)

(assert (=> b!1427710 (= res!962670 (= (seekEntryOrOpen!0 (select (arr!46966 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11272 #b00000000000000000000000000000000)))))

(assert (=> b!1427710 (=> (not res!962670) (not e!806372))))

(assert (= (and d!153275 (not res!962671)) b!1427708))

(assert (= (and b!1427708 c!132011) b!1427710))

(assert (= (and b!1427708 (not c!132011)) b!1427709))

(assert (= (and b!1427710 res!962670) b!1427707))

(assert (= (or b!1427707 b!1427709) bm!67356))

(assert (=> b!1427708 m!1317475))

(assert (=> b!1427708 m!1317475))

(assert (=> b!1427708 m!1317477))

(declare-fun m!1317533 () Bool)

(assert (=> bm!67356 m!1317533))

(assert (=> b!1427710 m!1317475))

(declare-fun m!1317535 () Bool)

(assert (=> b!1427710 m!1317535))

(declare-fun m!1317537 () Bool)

(assert (=> b!1427710 m!1317537))

(assert (=> b!1427710 m!1317475))

(declare-fun m!1317541 () Bool)

(assert (=> b!1427710 m!1317541))

(assert (=> b!1427435 d!153275))

(declare-fun d!153277 () Bool)

(assert (=> d!153277 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123086 d!153277))

(declare-fun d!153293 () Bool)

(assert (=> d!153293 (= (array_inv!36199 a!2831) (bvsge (size!47518 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123086 d!153293))

(declare-fun b!1427720 () Bool)

(declare-fun e!806378 () Bool)

(declare-fun lt!628527 () SeekEntryResult!11272)

(assert (=> b!1427720 (= e!806378 (bvsge (x!129107 lt!628527) #b01111111111111111111111111111110))))

(declare-fun b!1427721 () Bool)

(assert (=> b!1427721 (and (bvsge (index!47482 lt!628527) #b00000000000000000000000000000000) (bvslt (index!47482 lt!628527) (size!47518 a!2831)))))

(declare-fun res!962678 () Bool)

(assert (=> b!1427721 (= res!962678 (= (select (arr!46966 a!2831) (index!47482 lt!628527)) (select (arr!46966 a!2831) j!81)))))

(declare-fun e!806381 () Bool)

(assert (=> b!1427721 (=> res!962678 e!806381)))

(declare-fun e!806379 () Bool)

(assert (=> b!1427721 (= e!806379 e!806381)))

(declare-fun b!1427722 () Bool)

(declare-fun e!806380 () SeekEntryResult!11272)

(declare-fun e!806382 () SeekEntryResult!11272)

(assert (=> b!1427722 (= e!806380 e!806382)))

(declare-fun c!132015 () Bool)

(declare-fun lt!628528 () (_ BitVec 64))

(assert (=> b!1427722 (= c!132015 (or (= lt!628528 (select (arr!46966 a!2831) j!81)) (= (bvadd lt!628528 lt!628528) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1427723 () Bool)

(assert (=> b!1427723 (and (bvsge (index!47482 lt!628527) #b00000000000000000000000000000000) (bvslt (index!47482 lt!628527) (size!47518 a!2831)))))

(assert (=> b!1427723 (= e!806381 (= (select (arr!46966 a!2831) (index!47482 lt!628527)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1427724 () Bool)

(assert (=> b!1427724 (and (bvsge (index!47482 lt!628527) #b00000000000000000000000000000000) (bvslt (index!47482 lt!628527) (size!47518 a!2831)))))

(declare-fun res!962676 () Bool)

(assert (=> b!1427724 (= res!962676 (= (select (arr!46966 a!2831) (index!47482 lt!628527)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1427724 (=> res!962676 e!806381)))

(declare-fun b!1427725 () Bool)

(assert (=> b!1427725 (= e!806378 e!806379)))

(declare-fun res!962677 () Bool)

(assert (=> b!1427725 (= res!962677 (and ((_ is Intermediate!11272) lt!628527) (not (undefined!12084 lt!628527)) (bvslt (x!129107 lt!628527) #b01111111111111111111111111111110) (bvsge (x!129107 lt!628527) #b00000000000000000000000000000000) (bvsge (x!129107 lt!628527) x!605)))))

(assert (=> b!1427725 (=> (not res!962677) (not e!806379))))

(declare-fun b!1427726 () Bool)

(assert (=> b!1427726 (= e!806382 (Intermediate!11272 false index!585 x!605))))

(declare-fun d!153295 () Bool)

(assert (=> d!153295 e!806378))

(declare-fun c!132017 () Bool)

(assert (=> d!153295 (= c!132017 (and ((_ is Intermediate!11272) lt!628527) (undefined!12084 lt!628527)))))

(assert (=> d!153295 (= lt!628527 e!806380)))

(declare-fun c!132016 () Bool)

(assert (=> d!153295 (= c!132016 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!153295 (= lt!628528 (select (arr!46966 a!2831) index!585))))

(assert (=> d!153295 (validMask!0 mask!2608)))

(assert (=> d!153295 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46966 a!2831) j!81) a!2831 mask!2608) lt!628527)))

(declare-fun b!1427727 () Bool)

(assert (=> b!1427727 (= e!806380 (Intermediate!11272 true index!585 x!605))))

(declare-fun b!1427728 () Bool)

(assert (=> b!1427728 (= e!806382 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!46966 a!2831) j!81) a!2831 mask!2608))))

(assert (= (and d!153295 c!132016) b!1427727))

(assert (= (and d!153295 (not c!132016)) b!1427722))

(assert (= (and b!1427722 c!132015) b!1427726))

(assert (= (and b!1427722 (not c!132015)) b!1427728))

(assert (= (and d!153295 c!132017) b!1427720))

(assert (= (and d!153295 (not c!132017)) b!1427725))

(assert (= (and b!1427725 res!962677) b!1427721))

(assert (= (and b!1427721 (not res!962678)) b!1427724))

(assert (= (and b!1427724 (not res!962676)) b!1427723))

(declare-fun m!1317559 () Bool)

(assert (=> b!1427721 m!1317559))

(assert (=> b!1427724 m!1317559))

(assert (=> b!1427728 m!1317485))

(assert (=> b!1427728 m!1317485))

(assert (=> b!1427728 m!1317321))

(declare-fun m!1317561 () Bool)

(assert (=> b!1427728 m!1317561))

(assert (=> d!153295 m!1317345))

(assert (=> d!153295 m!1317341))

(assert (=> b!1427723 m!1317559))

(assert (=> b!1427424 d!153295))

(check-sat (not b!1427645) (not d!153253) (not d!153269) (not d!153233) (not b!1427710) (not bm!67349) (not b!1427728) (not d!153263) (not b!1427532) (not b!1427708) (not b!1427559) (not b!1427670) (not b!1427668) (not d!153235) (not b!1427627) (not b!1427693) (not d!153295) (not bm!67356) (not b!1427624) (not bm!67343) (not b!1427628))
(check-sat)
