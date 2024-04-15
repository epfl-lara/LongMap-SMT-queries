; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48000 () Bool)

(assert start!48000)

(declare-fun b!528399 () Bool)

(declare-fun res!324502 () Bool)

(declare-fun e!307916 () Bool)

(assert (=> b!528399 (=> res!324502 e!307916)))

(declare-datatypes ((array!33503 0))(
  ( (array!33504 (arr!16100 (Array (_ BitVec 32) (_ BitVec 64))) (size!16465 (_ BitVec 32))) )
))
(declare-fun lt!243297 () array!33503)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!243298 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!4564 0))(
  ( (MissingZero!4564 (index!20480 (_ BitVec 32))) (Found!4564 (index!20481 (_ BitVec 32))) (Intermediate!4564 (undefined!5376 Bool) (index!20482 (_ BitVec 32)) (x!49463 (_ BitVec 32))) (Undefined!4564) (MissingVacant!4564 (index!20483 (_ BitVec 32))) )
))
(declare-fun lt!243288 () SeekEntryResult!4564)

(declare-fun lt!243289 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33503 (_ BitVec 32)) SeekEntryResult!4564)

(assert (=> b!528399 (= res!324502 (not (= lt!243288 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243289 lt!243298 lt!243297 mask!3524))))))

(declare-fun b!528400 () Bool)

(declare-fun e!307915 () Bool)

(assert (=> b!528400 (= e!307915 false)))

(declare-fun b!528401 () Bool)

(declare-fun res!324511 () Bool)

(declare-fun e!307919 () Bool)

(assert (=> b!528401 (=> (not res!324511) (not e!307919))))

(declare-fun a!3235 () array!33503)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!528401 (= res!324511 (validKeyInArray!0 (select (arr!16100 a!3235) j!176)))))

(declare-fun b!528402 () Bool)

(declare-fun e!307917 () Bool)

(assert (=> b!528402 (= e!307919 e!307917)))

(declare-fun res!324505 () Bool)

(assert (=> b!528402 (=> (not res!324505) (not e!307917))))

(declare-fun lt!243296 () SeekEntryResult!4564)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!528402 (= res!324505 (or (= lt!243296 (MissingZero!4564 i!1204)) (= lt!243296 (MissingVacant!4564 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33503 (_ BitVec 32)) SeekEntryResult!4564)

(assert (=> b!528402 (= lt!243296 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!528403 () Bool)

(declare-fun res!324508 () Bool)

(assert (=> b!528403 (=> res!324508 e!307916)))

(declare-fun e!307918 () Bool)

(assert (=> b!528403 (= res!324508 e!307918)))

(declare-fun res!324506 () Bool)

(assert (=> b!528403 (=> (not res!324506) (not e!307918))))

(declare-fun lt!243292 () SeekEntryResult!4564)

(assert (=> b!528403 (= res!324506 (bvsgt #b00000000000000000000000000000000 (x!49463 lt!243292)))))

(declare-fun e!307912 () Bool)

(declare-fun b!528404 () Bool)

(assert (=> b!528404 (= e!307912 (= (seekEntryOrOpen!0 (select (arr!16100 a!3235) j!176) a!3235 mask!3524) (Found!4564 j!176)))))

(declare-fun lt!243294 () SeekEntryResult!4564)

(declare-fun b!528405 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33503 (_ BitVec 32)) SeekEntryResult!4564)

(assert (=> b!528405 (= e!307918 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!243289 (index!20482 lt!243292) (select (arr!16100 a!3235) j!176) a!3235 mask!3524) lt!243294)))))

(declare-fun b!528406 () Bool)

(declare-fun e!307920 () Bool)

(assert (=> b!528406 (= e!307917 (not e!307920))))

(declare-fun res!324510 () Bool)

(assert (=> b!528406 (=> res!324510 e!307920)))

(get-info :version)

(assert (=> b!528406 (= res!324510 (or (= lt!243292 lt!243288) (undefined!5376 lt!243292) (not ((_ is Intermediate!4564) lt!243292))))))

(declare-fun lt!243293 () (_ BitVec 32))

(assert (=> b!528406 (= lt!243288 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243293 lt!243298 lt!243297 mask!3524))))

(assert (=> b!528406 (= lt!243292 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243289 (select (arr!16100 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!528406 (= lt!243293 (toIndex!0 lt!243298 mask!3524))))

(assert (=> b!528406 (= lt!243298 (select (store (arr!16100 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!528406 (= lt!243289 (toIndex!0 (select (arr!16100 a!3235) j!176) mask!3524))))

(assert (=> b!528406 (= lt!243297 (array!33504 (store (arr!16100 a!3235) i!1204 k0!2280) (size!16465 a!3235)))))

(assert (=> b!528406 (= lt!243294 (Found!4564 j!176))))

(assert (=> b!528406 e!307912))

(declare-fun res!324501 () Bool)

(assert (=> b!528406 (=> (not res!324501) (not e!307912))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33503 (_ BitVec 32)) Bool)

(assert (=> b!528406 (= res!324501 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16702 0))(
  ( (Unit!16703) )
))
(declare-fun lt!243291 () Unit!16702)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33503 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16702)

(assert (=> b!528406 (= lt!243291 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!528407 () Bool)

(declare-fun res!324500 () Bool)

(assert (=> b!528407 (=> (not res!324500) (not e!307917))))

(declare-datatypes ((List!10297 0))(
  ( (Nil!10294) (Cons!10293 (h!11230 (_ BitVec 64)) (t!16516 List!10297)) )
))
(declare-fun arrayNoDuplicates!0 (array!33503 (_ BitVec 32) List!10297) Bool)

(assert (=> b!528407 (= res!324500 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10294))))

(declare-fun b!528408 () Bool)

(declare-fun e!307913 () Unit!16702)

(declare-fun Unit!16704 () Unit!16702)

(assert (=> b!528408 (= e!307913 Unit!16704)))

(declare-fun lt!243290 () Unit!16702)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33503 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16702)

(assert (=> b!528408 (= lt!243290 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!243289 #b00000000000000000000000000000000 (index!20482 lt!243292) (x!49463 lt!243292) mask!3524))))

(declare-fun res!324504 () Bool)

(assert (=> b!528408 (= res!324504 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243289 lt!243298 lt!243297 mask!3524) (Intermediate!4564 false (index!20482 lt!243292) (x!49463 lt!243292))))))

(assert (=> b!528408 (=> (not res!324504) (not e!307915))))

(assert (=> b!528408 e!307915))

(declare-fun b!528409 () Bool)

(assert (=> b!528409 (= e!307916 true)))

(assert (=> b!528409 (= (seekEntryOrOpen!0 lt!243298 lt!243297 mask!3524) lt!243294)))

(declare-fun lt!243295 () Unit!16702)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!33503 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16702)

(assert (=> b!528409 (= lt!243295 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k0!2280 j!176 lt!243289 #b00000000000000000000000000000000 (index!20482 lt!243292) (x!49463 lt!243292) mask!3524))))

(declare-fun b!528410 () Bool)

(declare-fun res!324503 () Bool)

(assert (=> b!528410 (=> (not res!324503) (not e!307919))))

(assert (=> b!528410 (= res!324503 (validKeyInArray!0 k0!2280))))

(declare-fun b!528411 () Bool)

(declare-fun res!324499 () Bool)

(assert (=> b!528411 (=> (not res!324499) (not e!307919))))

(declare-fun arrayContainsKey!0 (array!33503 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!528411 (= res!324499 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!528412 () Bool)

(declare-fun res!324507 () Bool)

(assert (=> b!528412 (=> (not res!324507) (not e!307917))))

(assert (=> b!528412 (= res!324507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!528413 () Bool)

(assert (=> b!528413 (= e!307920 e!307916)))

(declare-fun res!324512 () Bool)

(assert (=> b!528413 (=> res!324512 e!307916)))

(assert (=> b!528413 (= res!324512 (or (bvsgt (x!49463 lt!243292) #b01111111111111111111111111111110) (bvslt lt!243289 #b00000000000000000000000000000000) (bvsge lt!243289 (size!16465 a!3235)) (bvslt (index!20482 lt!243292) #b00000000000000000000000000000000) (bvsge (index!20482 lt!243292) (size!16465 a!3235)) (not (= lt!243292 (Intermediate!4564 false (index!20482 lt!243292) (x!49463 lt!243292))))))))

(assert (=> b!528413 (= (index!20482 lt!243292) i!1204)))

(declare-fun lt!243287 () Unit!16702)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33503 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16702)

(assert (=> b!528413 (= lt!243287 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!243289 #b00000000000000000000000000000000 (index!20482 lt!243292) (x!49463 lt!243292) mask!3524))))

(assert (=> b!528413 (and (or (= (select (arr!16100 a!3235) (index!20482 lt!243292)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16100 a!3235) (index!20482 lt!243292)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16100 a!3235) (index!20482 lt!243292)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16100 a!3235) (index!20482 lt!243292)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!243286 () Unit!16702)

(assert (=> b!528413 (= lt!243286 e!307913)))

(declare-fun c!62259 () Bool)

(assert (=> b!528413 (= c!62259 (= (select (arr!16100 a!3235) (index!20482 lt!243292)) (select (arr!16100 a!3235) j!176)))))

(assert (=> b!528413 (and (bvslt (x!49463 lt!243292) #b01111111111111111111111111111110) (or (= (select (arr!16100 a!3235) (index!20482 lt!243292)) (select (arr!16100 a!3235) j!176)) (= (select (arr!16100 a!3235) (index!20482 lt!243292)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16100 a!3235) (index!20482 lt!243292)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!528414 () Bool)

(declare-fun Unit!16705 () Unit!16702)

(assert (=> b!528414 (= e!307913 Unit!16705)))

(declare-fun b!528415 () Bool)

(declare-fun res!324509 () Bool)

(assert (=> b!528415 (=> (not res!324509) (not e!307919))))

(assert (=> b!528415 (= res!324509 (and (= (size!16465 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16465 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16465 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!324498 () Bool)

(assert (=> start!48000 (=> (not res!324498) (not e!307919))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48000 (= res!324498 (validMask!0 mask!3524))))

(assert (=> start!48000 e!307919))

(assert (=> start!48000 true))

(declare-fun array_inv!11983 (array!33503) Bool)

(assert (=> start!48000 (array_inv!11983 a!3235)))

(assert (= (and start!48000 res!324498) b!528415))

(assert (= (and b!528415 res!324509) b!528401))

(assert (= (and b!528401 res!324511) b!528410))

(assert (= (and b!528410 res!324503) b!528411))

(assert (= (and b!528411 res!324499) b!528402))

(assert (= (and b!528402 res!324505) b!528412))

(assert (= (and b!528412 res!324507) b!528407))

(assert (= (and b!528407 res!324500) b!528406))

(assert (= (and b!528406 res!324501) b!528404))

(assert (= (and b!528406 (not res!324510)) b!528413))

(assert (= (and b!528413 c!62259) b!528408))

(assert (= (and b!528413 (not c!62259)) b!528414))

(assert (= (and b!528408 res!324504) b!528400))

(assert (= (and b!528413 (not res!324512)) b!528403))

(assert (= (and b!528403 res!324506) b!528405))

(assert (= (and b!528403 (not res!324508)) b!528399))

(assert (= (and b!528399 (not res!324502)) b!528409))

(declare-fun m!508453 () Bool)

(assert (=> b!528402 m!508453))

(declare-fun m!508455 () Bool)

(assert (=> b!528408 m!508455))

(declare-fun m!508457 () Bool)

(assert (=> b!528408 m!508457))

(declare-fun m!508459 () Bool)

(assert (=> b!528405 m!508459))

(assert (=> b!528405 m!508459))

(declare-fun m!508461 () Bool)

(assert (=> b!528405 m!508461))

(declare-fun m!508463 () Bool)

(assert (=> b!528410 m!508463))

(assert (=> b!528399 m!508457))

(declare-fun m!508465 () Bool)

(assert (=> b!528407 m!508465))

(assert (=> b!528401 m!508459))

(assert (=> b!528401 m!508459))

(declare-fun m!508467 () Bool)

(assert (=> b!528401 m!508467))

(declare-fun m!508469 () Bool)

(assert (=> b!528411 m!508469))

(declare-fun m!508471 () Bool)

(assert (=> b!528409 m!508471))

(declare-fun m!508473 () Bool)

(assert (=> b!528409 m!508473))

(declare-fun m!508475 () Bool)

(assert (=> b!528413 m!508475))

(declare-fun m!508477 () Bool)

(assert (=> b!528413 m!508477))

(assert (=> b!528413 m!508459))

(assert (=> b!528404 m!508459))

(assert (=> b!528404 m!508459))

(declare-fun m!508479 () Bool)

(assert (=> b!528404 m!508479))

(declare-fun m!508481 () Bool)

(assert (=> start!48000 m!508481))

(declare-fun m!508483 () Bool)

(assert (=> start!48000 m!508483))

(declare-fun m!508485 () Bool)

(assert (=> b!528412 m!508485))

(assert (=> b!528406 m!508459))

(declare-fun m!508487 () Bool)

(assert (=> b!528406 m!508487))

(declare-fun m!508489 () Bool)

(assert (=> b!528406 m!508489))

(declare-fun m!508491 () Bool)

(assert (=> b!528406 m!508491))

(declare-fun m!508493 () Bool)

(assert (=> b!528406 m!508493))

(declare-fun m!508495 () Bool)

(assert (=> b!528406 m!508495))

(assert (=> b!528406 m!508459))

(declare-fun m!508497 () Bool)

(assert (=> b!528406 m!508497))

(assert (=> b!528406 m!508459))

(declare-fun m!508499 () Bool)

(assert (=> b!528406 m!508499))

(declare-fun m!508501 () Bool)

(assert (=> b!528406 m!508501))

(check-sat (not b!528409) (not b!528410) (not b!528404) (not b!528405) (not start!48000) (not b!528406) (not b!528413) (not b!528411) (not b!528399) (not b!528408) (not b!528407) (not b!528401) (not b!528412) (not b!528402))
(check-sat)
