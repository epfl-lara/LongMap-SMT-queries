; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48004 () Bool)

(assert start!48004)

(declare-fun b!528467 () Bool)

(declare-datatypes ((Unit!16708 0))(
  ( (Unit!16709) )
))
(declare-fun e!307979 () Unit!16708)

(declare-fun Unit!16710 () Unit!16708)

(assert (=> b!528467 (= e!307979 Unit!16710)))

(declare-fun b!528468 () Bool)

(declare-fun e!307982 () Bool)

(assert (=> b!528468 (= e!307982 false)))

(declare-fun res!324457 () Bool)

(declare-fun e!307981 () Bool)

(assert (=> start!48004 (=> (not res!324457) (not e!307981))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48004 (= res!324457 (validMask!0 mask!3524))))

(assert (=> start!48004 e!307981))

(assert (=> start!48004 true))

(declare-datatypes ((array!33497 0))(
  ( (array!33498 (arr!16097 (Array (_ BitVec 32) (_ BitVec 64))) (size!16461 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33497)

(declare-fun array_inv!11893 (array!33497) Bool)

(assert (=> start!48004 (array_inv!11893 a!3235)))

(declare-fun b!528469 () Bool)

(declare-fun res!324458 () Bool)

(assert (=> b!528469 (=> (not res!324458) (not e!307981))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33497 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!528469 (= res!324458 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!528470 () Bool)

(declare-fun e!307986 () Bool)

(declare-fun e!307978 () Bool)

(assert (=> b!528470 (= e!307986 (not e!307978))))

(declare-fun res!324453 () Bool)

(assert (=> b!528470 (=> res!324453 e!307978)))

(declare-datatypes ((SeekEntryResult!4564 0))(
  ( (MissingZero!4564 (index!20480 (_ BitVec 32))) (Found!4564 (index!20481 (_ BitVec 32))) (Intermediate!4564 (undefined!5376 Bool) (index!20482 (_ BitVec 32)) (x!49452 (_ BitVec 32))) (Undefined!4564) (MissingVacant!4564 (index!20483 (_ BitVec 32))) )
))
(declare-fun lt!243367 () SeekEntryResult!4564)

(declare-fun lt!243372 () SeekEntryResult!4564)

(assert (=> b!528470 (= res!324453 (or (= lt!243367 lt!243372) (undefined!5376 lt!243367) (not (is-Intermediate!4564 lt!243367))))))

(declare-fun lt!243375 () array!33497)

(declare-fun lt!243376 () (_ BitVec 32))

(declare-fun lt!243373 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33497 (_ BitVec 32)) SeekEntryResult!4564)

(assert (=> b!528470 (= lt!243372 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243376 lt!243373 lt!243375 mask!3524))))

(declare-fun lt!243368 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!528470 (= lt!243367 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243368 (select (arr!16097 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!528470 (= lt!243376 (toIndex!0 lt!243373 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!528470 (= lt!243373 (select (store (arr!16097 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!528470 (= lt!243368 (toIndex!0 (select (arr!16097 a!3235) j!176) mask!3524))))

(assert (=> b!528470 (= lt!243375 (array!33498 (store (arr!16097 a!3235) i!1204 k!2280) (size!16461 a!3235)))))

(declare-fun e!307985 () Bool)

(assert (=> b!528470 e!307985))

(declare-fun res!324455 () Bool)

(assert (=> b!528470 (=> (not res!324455) (not e!307985))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33497 (_ BitVec 32)) Bool)

(assert (=> b!528470 (= res!324455 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!243374 () Unit!16708)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33497 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16708)

(assert (=> b!528470 (= lt!243374 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!528471 () Bool)

(declare-fun res!324461 () Bool)

(assert (=> b!528471 (=> (not res!324461) (not e!307986))))

(assert (=> b!528471 (= res!324461 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun e!307980 () Bool)

(declare-fun b!528472 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33497 (_ BitVec 32)) SeekEntryResult!4564)

(assert (=> b!528472 (= e!307980 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!243368 (index!20482 lt!243367) (select (arr!16097 a!3235) j!176) a!3235 mask!3524) (Found!4564 j!176))))))

(declare-fun b!528473 () Bool)

(declare-fun res!324454 () Bool)

(assert (=> b!528473 (=> (not res!324454) (not e!307981))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!528473 (= res!324454 (validKeyInArray!0 k!2280))))

(declare-fun b!528474 () Bool)

(declare-fun res!324460 () Bool)

(assert (=> b!528474 (=> (not res!324460) (not e!307981))))

(assert (=> b!528474 (= res!324460 (validKeyInArray!0 (select (arr!16097 a!3235) j!176)))))

(declare-fun b!528475 () Bool)

(declare-fun res!324456 () Bool)

(declare-fun e!307983 () Bool)

(assert (=> b!528475 (=> res!324456 e!307983)))

(assert (=> b!528475 (= res!324456 e!307980)))

(declare-fun res!324450 () Bool)

(assert (=> b!528475 (=> (not res!324450) (not e!307980))))

(assert (=> b!528475 (= res!324450 (bvsgt #b00000000000000000000000000000000 (x!49452 lt!243367)))))

(declare-fun b!528476 () Bool)

(assert (=> b!528476 (= e!307983 (= lt!243372 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243368 lt!243373 lt!243375 mask!3524)))))

(declare-fun b!528477 () Bool)

(declare-fun res!324459 () Bool)

(assert (=> b!528477 (=> (not res!324459) (not e!307981))))

(assert (=> b!528477 (= res!324459 (and (= (size!16461 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16461 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16461 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!528478 () Bool)

(assert (=> b!528478 (= e!307978 e!307983)))

(declare-fun res!324451 () Bool)

(assert (=> b!528478 (=> res!324451 e!307983)))

(assert (=> b!528478 (= res!324451 (or (bvsgt (x!49452 lt!243367) #b01111111111111111111111111111110) (bvslt lt!243368 #b00000000000000000000000000000000) (bvsge lt!243368 (size!16461 a!3235)) (bvslt (index!20482 lt!243367) #b00000000000000000000000000000000) (bvsge (index!20482 lt!243367) (size!16461 a!3235)) (not (= lt!243367 (Intermediate!4564 false (index!20482 lt!243367) (x!49452 lt!243367))))))))

(assert (=> b!528478 (= (index!20482 lt!243367) i!1204)))

(declare-fun lt!243369 () Unit!16708)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33497 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16708)

(assert (=> b!528478 (= lt!243369 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!243368 #b00000000000000000000000000000000 (index!20482 lt!243367) (x!49452 lt!243367) mask!3524))))

(assert (=> b!528478 (and (or (= (select (arr!16097 a!3235) (index!20482 lt!243367)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16097 a!3235) (index!20482 lt!243367)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16097 a!3235) (index!20482 lt!243367)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16097 a!3235) (index!20482 lt!243367)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!243366 () Unit!16708)

(assert (=> b!528478 (= lt!243366 e!307979)))

(declare-fun c!62318 () Bool)

(assert (=> b!528478 (= c!62318 (= (select (arr!16097 a!3235) (index!20482 lt!243367)) (select (arr!16097 a!3235) j!176)))))

(assert (=> b!528478 (and (bvslt (x!49452 lt!243367) #b01111111111111111111111111111110) (or (= (select (arr!16097 a!3235) (index!20482 lt!243367)) (select (arr!16097 a!3235) j!176)) (= (select (arr!16097 a!3235) (index!20482 lt!243367)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16097 a!3235) (index!20482 lt!243367)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!528479 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33497 (_ BitVec 32)) SeekEntryResult!4564)

(assert (=> b!528479 (= e!307985 (= (seekEntryOrOpen!0 (select (arr!16097 a!3235) j!176) a!3235 mask!3524) (Found!4564 j!176)))))

(declare-fun b!528480 () Bool)

(assert (=> b!528480 (= e!307981 e!307986)))

(declare-fun res!324452 () Bool)

(assert (=> b!528480 (=> (not res!324452) (not e!307986))))

(declare-fun lt!243371 () SeekEntryResult!4564)

(assert (=> b!528480 (= res!324452 (or (= lt!243371 (MissingZero!4564 i!1204)) (= lt!243371 (MissingVacant!4564 i!1204))))))

(assert (=> b!528480 (= lt!243371 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!528481 () Bool)

(declare-fun Unit!16711 () Unit!16708)

(assert (=> b!528481 (= e!307979 Unit!16711)))

(declare-fun lt!243370 () Unit!16708)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33497 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16708)

(assert (=> b!528481 (= lt!243370 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!243368 #b00000000000000000000000000000000 (index!20482 lt!243367) (x!49452 lt!243367) mask!3524))))

(declare-fun res!324449 () Bool)

(assert (=> b!528481 (= res!324449 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243368 lt!243373 lt!243375 mask!3524) (Intermediate!4564 false (index!20482 lt!243367) (x!49452 lt!243367))))))

(assert (=> b!528481 (=> (not res!324449) (not e!307982))))

(assert (=> b!528481 e!307982))

(declare-fun b!528482 () Bool)

(declare-fun res!324448 () Bool)

(assert (=> b!528482 (=> (not res!324448) (not e!307986))))

(declare-datatypes ((List!10255 0))(
  ( (Nil!10252) (Cons!10251 (h!11188 (_ BitVec 64)) (t!16483 List!10255)) )
))
(declare-fun arrayNoDuplicates!0 (array!33497 (_ BitVec 32) List!10255) Bool)

(assert (=> b!528482 (= res!324448 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10252))))

(assert (= (and start!48004 res!324457) b!528477))

(assert (= (and b!528477 res!324459) b!528474))

(assert (= (and b!528474 res!324460) b!528473))

(assert (= (and b!528473 res!324454) b!528469))

(assert (= (and b!528469 res!324458) b!528480))

(assert (= (and b!528480 res!324452) b!528471))

(assert (= (and b!528471 res!324461) b!528482))

(assert (= (and b!528482 res!324448) b!528470))

(assert (= (and b!528470 res!324455) b!528479))

(assert (= (and b!528470 (not res!324453)) b!528478))

(assert (= (and b!528478 c!62318) b!528481))

(assert (= (and b!528478 (not c!62318)) b!528467))

(assert (= (and b!528481 res!324449) b!528468))

(assert (= (and b!528478 (not res!324451)) b!528475))

(assert (= (and b!528475 res!324450) b!528472))

(assert (= (and b!528475 (not res!324456)) b!528476))

(declare-fun m!509009 () Bool)

(assert (=> b!528480 m!509009))

(declare-fun m!509011 () Bool)

(assert (=> b!528473 m!509011))

(declare-fun m!509013 () Bool)

(assert (=> b!528476 m!509013))

(declare-fun m!509015 () Bool)

(assert (=> b!528479 m!509015))

(assert (=> b!528479 m!509015))

(declare-fun m!509017 () Bool)

(assert (=> b!528479 m!509017))

(declare-fun m!509019 () Bool)

(assert (=> b!528482 m!509019))

(declare-fun m!509021 () Bool)

(assert (=> b!528469 m!509021))

(declare-fun m!509023 () Bool)

(assert (=> b!528471 m!509023))

(declare-fun m!509025 () Bool)

(assert (=> b!528478 m!509025))

(declare-fun m!509027 () Bool)

(assert (=> b!528478 m!509027))

(assert (=> b!528478 m!509015))

(assert (=> b!528472 m!509015))

(assert (=> b!528472 m!509015))

(declare-fun m!509029 () Bool)

(assert (=> b!528472 m!509029))

(assert (=> b!528474 m!509015))

(assert (=> b!528474 m!509015))

(declare-fun m!509031 () Bool)

(assert (=> b!528474 m!509031))

(declare-fun m!509033 () Bool)

(assert (=> b!528481 m!509033))

(assert (=> b!528481 m!509013))

(declare-fun m!509035 () Bool)

(assert (=> start!48004 m!509035))

(declare-fun m!509037 () Bool)

(assert (=> start!48004 m!509037))

(declare-fun m!509039 () Bool)

(assert (=> b!528470 m!509039))

(declare-fun m!509041 () Bool)

(assert (=> b!528470 m!509041))

(declare-fun m!509043 () Bool)

(assert (=> b!528470 m!509043))

(assert (=> b!528470 m!509015))

(declare-fun m!509045 () Bool)

(assert (=> b!528470 m!509045))

(declare-fun m!509047 () Bool)

(assert (=> b!528470 m!509047))

(assert (=> b!528470 m!509015))

(declare-fun m!509049 () Bool)

(assert (=> b!528470 m!509049))

(assert (=> b!528470 m!509015))

(declare-fun m!509051 () Bool)

(assert (=> b!528470 m!509051))

(declare-fun m!509053 () Bool)

(assert (=> b!528470 m!509053))

(push 1)

