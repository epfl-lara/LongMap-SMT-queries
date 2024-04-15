; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48102 () Bool)

(assert start!48102)

(declare-fun b!529569 () Bool)

(declare-fun e!308561 () Bool)

(assert (=> b!529569 (= e!308561 true)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!244061 () (_ BitVec 64))

(declare-datatypes ((array!33548 0))(
  ( (array!33549 (arr!16121 (Array (_ BitVec 32) (_ BitVec 64))) (size!16486 (_ BitVec 32))) )
))
(declare-fun lt!244058 () array!33548)

(declare-datatypes ((SeekEntryResult!4585 0))(
  ( (MissingZero!4585 (index!20564 (_ BitVec 32))) (Found!4585 (index!20565 (_ BitVec 32))) (Intermediate!4585 (undefined!5397 Bool) (index!20566 (_ BitVec 32)) (x!49546 (_ BitVec 32))) (Undefined!4585) (MissingVacant!4585 (index!20567 (_ BitVec 32))) )
))
(declare-fun lt!244057 () SeekEntryResult!4585)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33548 (_ BitVec 32)) SeekEntryResult!4585)

(assert (=> b!529569 (= lt!244057 (seekEntryOrOpen!0 lt!244061 lt!244058 mask!3524))))

(assert (=> b!529569 false))

(declare-fun b!529570 () Bool)

(declare-fun res!325418 () Bool)

(declare-fun e!308564 () Bool)

(assert (=> b!529570 (=> (not res!325418) (not e!308564))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!529570 (= res!325418 (validKeyInArray!0 k0!2280))))

(declare-fun b!529571 () Bool)

(declare-fun res!325425 () Bool)

(declare-fun e!308560 () Bool)

(assert (=> b!529571 (=> (not res!325425) (not e!308560))))

(declare-fun a!3235 () array!33548)

(declare-datatypes ((List!10318 0))(
  ( (Nil!10315) (Cons!10314 (h!11254 (_ BitVec 64)) (t!16537 List!10318)) )
))
(declare-fun arrayNoDuplicates!0 (array!33548 (_ BitVec 32) List!10318) Bool)

(assert (=> b!529571 (= res!325425 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10315))))

(declare-fun b!529572 () Bool)

(declare-fun e!308563 () Bool)

(assert (=> b!529572 (= e!308563 e!308561)))

(declare-fun res!325426 () Bool)

(assert (=> b!529572 (=> res!325426 e!308561)))

(declare-fun lt!244060 () Bool)

(declare-fun lt!244063 () SeekEntryResult!4585)

(assert (=> b!529572 (= res!325426 (or (and (not lt!244060) (undefined!5397 lt!244063)) (and (not lt!244060) (not (undefined!5397 lt!244063)))))))

(get-info :version)

(assert (=> b!529572 (= lt!244060 (not ((_ is Intermediate!4585) lt!244063)))))

(declare-fun b!529573 () Bool)

(declare-fun res!325420 () Bool)

(assert (=> b!529573 (=> (not res!325420) (not e!308564))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!529573 (= res!325420 (and (= (size!16486 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16486 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16486 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!529574 () Bool)

(declare-fun res!325427 () Bool)

(assert (=> b!529574 (=> (not res!325427) (not e!308564))))

(declare-fun arrayContainsKey!0 (array!33548 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!529574 (= res!325427 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!529576 () Bool)

(assert (=> b!529576 (= e!308564 e!308560)))

(declare-fun res!325422 () Bool)

(assert (=> b!529576 (=> (not res!325422) (not e!308560))))

(declare-fun lt!244055 () SeekEntryResult!4585)

(assert (=> b!529576 (= res!325422 (or (= lt!244055 (MissingZero!4585 i!1204)) (= lt!244055 (MissingVacant!4585 i!1204))))))

(assert (=> b!529576 (= lt!244055 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!529577 () Bool)

(declare-fun res!325421 () Bool)

(assert (=> b!529577 (=> (not res!325421) (not e!308560))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33548 (_ BitVec 32)) Bool)

(assert (=> b!529577 (= res!325421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!529578 () Bool)

(assert (=> b!529578 (= e!308560 (not e!308563))))

(declare-fun res!325423 () Bool)

(assert (=> b!529578 (=> res!325423 e!308563)))

(declare-fun lt!244062 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33548 (_ BitVec 32)) SeekEntryResult!4585)

(assert (=> b!529578 (= res!325423 (= lt!244063 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244062 lt!244061 lt!244058 mask!3524)))))

(declare-fun lt!244056 () (_ BitVec 32))

(assert (=> b!529578 (= lt!244063 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244056 (select (arr!16121 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!529578 (= lt!244062 (toIndex!0 lt!244061 mask!3524))))

(assert (=> b!529578 (= lt!244061 (select (store (arr!16121 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!529578 (= lt!244056 (toIndex!0 (select (arr!16121 a!3235) j!176) mask!3524))))

(assert (=> b!529578 (= lt!244058 (array!33549 (store (arr!16121 a!3235) i!1204 k0!2280) (size!16486 a!3235)))))

(declare-fun e!308565 () Bool)

(assert (=> b!529578 e!308565))

(declare-fun res!325419 () Bool)

(assert (=> b!529578 (=> (not res!325419) (not e!308565))))

(assert (=> b!529578 (= res!325419 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16768 0))(
  ( (Unit!16769) )
))
(declare-fun lt!244059 () Unit!16768)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33548 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16768)

(assert (=> b!529578 (= lt!244059 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!529579 () Bool)

(declare-fun res!325417 () Bool)

(assert (=> b!529579 (=> (not res!325417) (not e!308564))))

(assert (=> b!529579 (= res!325417 (validKeyInArray!0 (select (arr!16121 a!3235) j!176)))))

(declare-fun b!529575 () Bool)

(assert (=> b!529575 (= e!308565 (= (seekEntryOrOpen!0 (select (arr!16121 a!3235) j!176) a!3235 mask!3524) (Found!4585 j!176)))))

(declare-fun res!325424 () Bool)

(assert (=> start!48102 (=> (not res!325424) (not e!308564))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48102 (= res!325424 (validMask!0 mask!3524))))

(assert (=> start!48102 e!308564))

(assert (=> start!48102 true))

(declare-fun array_inv!12004 (array!33548) Bool)

(assert (=> start!48102 (array_inv!12004 a!3235)))

(assert (= (and start!48102 res!325424) b!529573))

(assert (= (and b!529573 res!325420) b!529579))

(assert (= (and b!529579 res!325417) b!529570))

(assert (= (and b!529570 res!325418) b!529574))

(assert (= (and b!529574 res!325427) b!529576))

(assert (= (and b!529576 res!325422) b!529577))

(assert (= (and b!529577 res!325421) b!529571))

(assert (= (and b!529571 res!325425) b!529578))

(assert (= (and b!529578 res!325419) b!529575))

(assert (= (and b!529578 (not res!325423)) b!529572))

(assert (= (and b!529572 (not res!325426)) b!529569))

(declare-fun m!509581 () Bool)

(assert (=> start!48102 m!509581))

(declare-fun m!509583 () Bool)

(assert (=> start!48102 m!509583))

(declare-fun m!509585 () Bool)

(assert (=> b!529578 m!509585))

(declare-fun m!509587 () Bool)

(assert (=> b!529578 m!509587))

(declare-fun m!509589 () Bool)

(assert (=> b!529578 m!509589))

(assert (=> b!529578 m!509587))

(assert (=> b!529578 m!509587))

(declare-fun m!509591 () Bool)

(assert (=> b!529578 m!509591))

(declare-fun m!509593 () Bool)

(assert (=> b!529578 m!509593))

(declare-fun m!509595 () Bool)

(assert (=> b!529578 m!509595))

(declare-fun m!509597 () Bool)

(assert (=> b!529578 m!509597))

(declare-fun m!509599 () Bool)

(assert (=> b!529578 m!509599))

(declare-fun m!509601 () Bool)

(assert (=> b!529578 m!509601))

(declare-fun m!509603 () Bool)

(assert (=> b!529570 m!509603))

(assert (=> b!529575 m!509587))

(assert (=> b!529575 m!509587))

(declare-fun m!509605 () Bool)

(assert (=> b!529575 m!509605))

(declare-fun m!509607 () Bool)

(assert (=> b!529576 m!509607))

(declare-fun m!509609 () Bool)

(assert (=> b!529574 m!509609))

(declare-fun m!509611 () Bool)

(assert (=> b!529571 m!509611))

(assert (=> b!529579 m!509587))

(assert (=> b!529579 m!509587))

(declare-fun m!509613 () Bool)

(assert (=> b!529579 m!509613))

(declare-fun m!509615 () Bool)

(assert (=> b!529577 m!509615))

(declare-fun m!509617 () Bool)

(assert (=> b!529569 m!509617))

(check-sat (not b!529577) (not b!529578) (not b!529575) (not start!48102) (not b!529569) (not b!529579) (not b!529574) (not b!529571) (not b!529576) (not b!529570))
(check-sat)
