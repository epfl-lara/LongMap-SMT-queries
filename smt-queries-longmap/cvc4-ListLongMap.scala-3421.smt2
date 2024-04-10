; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47452 () Bool)

(assert start!47452)

(declare-fun b!522460 () Bool)

(declare-fun e!304729 () Bool)

(assert (=> b!522460 (= e!304729 true)))

(declare-datatypes ((array!33278 0))(
  ( (array!33279 (arr!15995 (Array (_ BitVec 32) (_ BitVec 64))) (size!16359 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33278)

(declare-datatypes ((SeekEntryResult!4462 0))(
  ( (MissingZero!4462 (index!20051 (_ BitVec 32))) (Found!4462 (index!20052 (_ BitVec 32))) (Intermediate!4462 (undefined!5274 Bool) (index!20053 (_ BitVec 32)) (x!49024 (_ BitVec 32))) (Undefined!4462) (MissingVacant!4462 (index!20054 (_ BitVec 32))) )
))
(declare-fun lt!239618 () SeekEntryResult!4462)

(assert (=> b!522460 (and (or (= (select (arr!15995 a!3235) (index!20053 lt!239618)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15995 a!3235) (index!20053 lt!239618)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15995 a!3235) (index!20053 lt!239618)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15995 a!3235) (index!20053 lt!239618)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!16300 0))(
  ( (Unit!16301) )
))
(declare-fun lt!239617 () Unit!16300)

(declare-fun e!304728 () Unit!16300)

(assert (=> b!522460 (= lt!239617 e!304728)))

(declare-fun c!61475 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!522460 (= c!61475 (= (select (arr!15995 a!3235) (index!20053 lt!239618)) (select (arr!15995 a!3235) j!176)))))

(assert (=> b!522460 (and (bvslt (x!49024 lt!239618) #b01111111111111111111111111111110) (or (= (select (arr!15995 a!3235) (index!20053 lt!239618)) (select (arr!15995 a!3235) j!176)) (= (select (arr!15995 a!3235) (index!20053 lt!239618)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15995 a!3235) (index!20053 lt!239618)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!522461 () Bool)

(declare-fun Unit!16302 () Unit!16300)

(assert (=> b!522461 (= e!304728 Unit!16302)))

(declare-fun lt!239623 () (_ BitVec 32))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!239622 () Unit!16300)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33278 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16300)

(assert (=> b!522461 (= lt!239622 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!239623 #b00000000000000000000000000000000 (index!20053 lt!239618) (x!49024 lt!239618) mask!3524))))

(declare-fun res!320121 () Bool)

(declare-fun lt!239619 () array!33278)

(declare-fun lt!239620 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33278 (_ BitVec 32)) SeekEntryResult!4462)

(assert (=> b!522461 (= res!320121 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239623 lt!239620 lt!239619 mask!3524) (Intermediate!4462 false (index!20053 lt!239618) (x!49024 lt!239618))))))

(declare-fun e!304725 () Bool)

(assert (=> b!522461 (=> (not res!320121) (not e!304725))))

(assert (=> b!522461 e!304725))

(declare-fun b!522462 () Bool)

(declare-fun res!320115 () Bool)

(declare-fun e!304727 () Bool)

(assert (=> b!522462 (=> (not res!320115) (not e!304727))))

(declare-datatypes ((List!10153 0))(
  ( (Nil!10150) (Cons!10149 (h!11071 (_ BitVec 64)) (t!16381 List!10153)) )
))
(declare-fun arrayNoDuplicates!0 (array!33278 (_ BitVec 32) List!10153) Bool)

(assert (=> b!522462 (= res!320115 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10150))))

(declare-fun b!522463 () Bool)

(declare-fun e!304726 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33278 (_ BitVec 32)) SeekEntryResult!4462)

(assert (=> b!522463 (= e!304726 (= (seekEntryOrOpen!0 (select (arr!15995 a!3235) j!176) a!3235 mask!3524) (Found!4462 j!176)))))

(declare-fun b!522464 () Bool)

(declare-fun res!320120 () Bool)

(declare-fun e!304730 () Bool)

(assert (=> b!522464 (=> (not res!320120) (not e!304730))))

(declare-fun arrayContainsKey!0 (array!33278 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!522464 (= res!320120 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!320118 () Bool)

(assert (=> start!47452 (=> (not res!320118) (not e!304730))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47452 (= res!320118 (validMask!0 mask!3524))))

(assert (=> start!47452 e!304730))

(assert (=> start!47452 true))

(declare-fun array_inv!11791 (array!33278) Bool)

(assert (=> start!47452 (array_inv!11791 a!3235)))

(declare-fun b!522465 () Bool)

(declare-fun res!320116 () Bool)

(assert (=> b!522465 (=> (not res!320116) (not e!304730))))

(assert (=> b!522465 (= res!320116 (and (= (size!16359 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16359 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16359 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!522466 () Bool)

(assert (=> b!522466 (= e!304725 false)))

(declare-fun b!522467 () Bool)

(declare-fun res!320112 () Bool)

(assert (=> b!522467 (=> (not res!320112) (not e!304727))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33278 (_ BitVec 32)) Bool)

(assert (=> b!522467 (= res!320112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!522468 () Bool)

(declare-fun Unit!16303 () Unit!16300)

(assert (=> b!522468 (= e!304728 Unit!16303)))

(declare-fun b!522469 () Bool)

(assert (=> b!522469 (= e!304727 (not e!304729))))

(declare-fun res!320122 () Bool)

(assert (=> b!522469 (=> res!320122 e!304729)))

(declare-fun lt!239615 () (_ BitVec 32))

(assert (=> b!522469 (= res!320122 (= lt!239618 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239615 lt!239620 lt!239619 mask!3524)))))

(assert (=> b!522469 (= lt!239618 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239623 (select (arr!15995 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!522469 (= lt!239615 (toIndex!0 lt!239620 mask!3524))))

(assert (=> b!522469 (= lt!239620 (select (store (arr!15995 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!522469 (= lt!239623 (toIndex!0 (select (arr!15995 a!3235) j!176) mask!3524))))

(assert (=> b!522469 (= lt!239619 (array!33279 (store (arr!15995 a!3235) i!1204 k!2280) (size!16359 a!3235)))))

(assert (=> b!522469 e!304726))

(declare-fun res!320114 () Bool)

(assert (=> b!522469 (=> (not res!320114) (not e!304726))))

(assert (=> b!522469 (= res!320114 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!239616 () Unit!16300)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33278 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16300)

(assert (=> b!522469 (= lt!239616 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!522470 () Bool)

(declare-fun res!320119 () Bool)

(assert (=> b!522470 (=> (not res!320119) (not e!304730))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!522470 (= res!320119 (validKeyInArray!0 (select (arr!15995 a!3235) j!176)))))

(declare-fun b!522471 () Bool)

(declare-fun res!320123 () Bool)

(assert (=> b!522471 (=> res!320123 e!304729)))

(assert (=> b!522471 (= res!320123 (or (undefined!5274 lt!239618) (not (is-Intermediate!4462 lt!239618))))))

(declare-fun b!522472 () Bool)

(declare-fun res!320113 () Bool)

(assert (=> b!522472 (=> (not res!320113) (not e!304730))))

(assert (=> b!522472 (= res!320113 (validKeyInArray!0 k!2280))))

(declare-fun b!522473 () Bool)

(assert (=> b!522473 (= e!304730 e!304727)))

(declare-fun res!320117 () Bool)

(assert (=> b!522473 (=> (not res!320117) (not e!304727))))

(declare-fun lt!239621 () SeekEntryResult!4462)

(assert (=> b!522473 (= res!320117 (or (= lt!239621 (MissingZero!4462 i!1204)) (= lt!239621 (MissingVacant!4462 i!1204))))))

(assert (=> b!522473 (= lt!239621 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!47452 res!320118) b!522465))

(assert (= (and b!522465 res!320116) b!522470))

(assert (= (and b!522470 res!320119) b!522472))

(assert (= (and b!522472 res!320113) b!522464))

(assert (= (and b!522464 res!320120) b!522473))

(assert (= (and b!522473 res!320117) b!522467))

(assert (= (and b!522467 res!320112) b!522462))

(assert (= (and b!522462 res!320115) b!522469))

(assert (= (and b!522469 res!320114) b!522463))

(assert (= (and b!522469 (not res!320122)) b!522471))

(assert (= (and b!522471 (not res!320123)) b!522460))

(assert (= (and b!522460 c!61475) b!522461))

(assert (= (and b!522460 (not c!61475)) b!522468))

(assert (= (and b!522461 res!320121) b!522466))

(declare-fun m!503373 () Bool)

(assert (=> b!522461 m!503373))

(declare-fun m!503375 () Bool)

(assert (=> b!522461 m!503375))

(declare-fun m!503377 () Bool)

(assert (=> b!522470 m!503377))

(assert (=> b!522470 m!503377))

(declare-fun m!503379 () Bool)

(assert (=> b!522470 m!503379))

(declare-fun m!503381 () Bool)

(assert (=> start!47452 m!503381))

(declare-fun m!503383 () Bool)

(assert (=> start!47452 m!503383))

(declare-fun m!503385 () Bool)

(assert (=> b!522462 m!503385))

(declare-fun m!503387 () Bool)

(assert (=> b!522469 m!503387))

(declare-fun m!503389 () Bool)

(assert (=> b!522469 m!503389))

(declare-fun m!503391 () Bool)

(assert (=> b!522469 m!503391))

(declare-fun m!503393 () Bool)

(assert (=> b!522469 m!503393))

(assert (=> b!522469 m!503377))

(declare-fun m!503395 () Bool)

(assert (=> b!522469 m!503395))

(assert (=> b!522469 m!503377))

(declare-fun m!503397 () Bool)

(assert (=> b!522469 m!503397))

(assert (=> b!522469 m!503377))

(declare-fun m!503399 () Bool)

(assert (=> b!522469 m!503399))

(declare-fun m!503401 () Bool)

(assert (=> b!522469 m!503401))

(assert (=> b!522463 m!503377))

(assert (=> b!522463 m!503377))

(declare-fun m!503403 () Bool)

(assert (=> b!522463 m!503403))

(declare-fun m!503405 () Bool)

(assert (=> b!522460 m!503405))

(assert (=> b!522460 m!503377))

(declare-fun m!503407 () Bool)

(assert (=> b!522467 m!503407))

(declare-fun m!503409 () Bool)

(assert (=> b!522473 m!503409))

(declare-fun m!503411 () Bool)

(assert (=> b!522464 m!503411))

(declare-fun m!503413 () Bool)

(assert (=> b!522472 m!503413))

(push 1)

