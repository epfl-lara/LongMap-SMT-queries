; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47696 () Bool)

(assert start!47696)

(declare-fun b!524558 () Bool)

(declare-fun res!321500 () Bool)

(declare-fun e!305910 () Bool)

(assert (=> b!524558 (=> (not res!321500) (not e!305910))))

(declare-datatypes ((array!33334 0))(
  ( (array!33335 (arr!16018 (Array (_ BitVec 32) (_ BitVec 64))) (size!16382 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33334)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33334 (_ BitVec 32)) Bool)

(assert (=> b!524558 (= res!321500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!524559 () Bool)

(declare-fun res!321505 () Bool)

(declare-fun e!305911 () Bool)

(assert (=> b!524559 (=> (not res!321505) (not e!305911))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!524559 (= res!321505 (validKeyInArray!0 k0!2280))))

(declare-fun b!524560 () Bool)

(declare-fun e!305909 () Bool)

(assert (=> b!524560 (= e!305910 (not e!305909))))

(declare-fun res!321501 () Bool)

(assert (=> b!524560 (=> res!321501 e!305909)))

(declare-fun lt!240823 () (_ BitVec 32))

(declare-fun lt!240821 () array!33334)

(declare-datatypes ((SeekEntryResult!4441 0))(
  ( (MissingZero!4441 (index!19976 (_ BitVec 32))) (Found!4441 (index!19977 (_ BitVec 32))) (Intermediate!4441 (undefined!5253 Bool) (index!19978 (_ BitVec 32)) (x!49107 (_ BitVec 32))) (Undefined!4441) (MissingVacant!4441 (index!19979 (_ BitVec 32))) )
))
(declare-fun lt!240827 () SeekEntryResult!4441)

(declare-fun lt!240829 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33334 (_ BitVec 32)) SeekEntryResult!4441)

(assert (=> b!524560 (= res!321501 (= lt!240827 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240823 lt!240829 lt!240821 mask!3524)))))

(declare-fun lt!240822 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!524560 (= lt!240827 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240822 (select (arr!16018 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!524560 (= lt!240823 (toIndex!0 lt!240829 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!524560 (= lt!240829 (select (store (arr!16018 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!524560 (= lt!240822 (toIndex!0 (select (arr!16018 a!3235) j!176) mask!3524))))

(assert (=> b!524560 (= lt!240821 (array!33335 (store (arr!16018 a!3235) i!1204 k0!2280) (size!16382 a!3235)))))

(declare-fun e!305912 () Bool)

(assert (=> b!524560 e!305912))

(declare-fun res!321499 () Bool)

(assert (=> b!524560 (=> (not res!321499) (not e!305912))))

(assert (=> b!524560 (= res!321499 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16375 0))(
  ( (Unit!16376) )
))
(declare-fun lt!240828 () Unit!16375)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33334 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16375)

(assert (=> b!524560 (= lt!240828 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!524561 () Bool)

(declare-fun res!321496 () Bool)

(assert (=> b!524561 (=> (not res!321496) (not e!305911))))

(assert (=> b!524561 (= res!321496 (and (= (size!16382 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16382 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16382 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!524562 () Bool)

(declare-fun e!305913 () Bool)

(assert (=> b!524562 (= e!305909 e!305913)))

(declare-fun res!321497 () Bool)

(assert (=> b!524562 (=> res!321497 e!305913)))

(assert (=> b!524562 (= res!321497 (or (bvsgt #b00000000000000000000000000000000 (x!49107 lt!240827)) (bvsgt (x!49107 lt!240827) #b01111111111111111111111111111110) (bvslt lt!240822 #b00000000000000000000000000000000) (bvsge lt!240822 (size!16382 a!3235)) (bvslt (index!19978 lt!240827) #b00000000000000000000000000000000) (bvsge (index!19978 lt!240827) (size!16382 a!3235)) (not (= lt!240827 (Intermediate!4441 false (index!19978 lt!240827) (x!49107 lt!240827))))))))

(declare-fun lt!240820 () Bool)

(declare-fun lt!240825 () (_ BitVec 64))

(assert (=> b!524562 (and (or lt!240820 (= lt!240825 #b1000000000000000000000000000000000000000000000000000000000000000)) (not lt!240820) (= lt!240825 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!524562 (= lt!240820 (= lt!240825 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!240824 () Unit!16375)

(declare-fun e!305908 () Unit!16375)

(assert (=> b!524562 (= lt!240824 e!305908)))

(declare-fun c!61838 () Bool)

(assert (=> b!524562 (= c!61838 (= lt!240825 (select (arr!16018 a!3235) j!176)))))

(assert (=> b!524562 (= lt!240825 (select (arr!16018 a!3235) (index!19978 lt!240827)))))

(assert (=> b!524562 (and (bvslt (x!49107 lt!240827) #b01111111111111111111111111111110) (let ((bdg!15564 (select (arr!16018 a!3235) (index!19978 lt!240827)))) (or (= bdg!15564 (select (arr!16018 a!3235) j!176)) (= bdg!15564 #b0000000000000000000000000000000000000000000000000000000000000000) (= bdg!15564 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!524563 () Bool)

(declare-fun res!321494 () Bool)

(assert (=> b!524563 (=> (not res!321494) (not e!305911))))

(declare-fun arrayContainsKey!0 (array!33334 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!524563 (= res!321494 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!524564 () Bool)

(assert (=> b!524564 (= e!305911 e!305910)))

(declare-fun res!321495 () Bool)

(assert (=> b!524564 (=> (not res!321495) (not e!305910))))

(declare-fun lt!240819 () SeekEntryResult!4441)

(assert (=> b!524564 (= res!321495 (or (= lt!240819 (MissingZero!4441 i!1204)) (= lt!240819 (MissingVacant!4441 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33334 (_ BitVec 32)) SeekEntryResult!4441)

(assert (=> b!524564 (= lt!240819 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!524565 () Bool)

(assert (=> b!524565 (= e!305912 (= (seekEntryOrOpen!0 (select (arr!16018 a!3235) j!176) a!3235 mask!3524) (Found!4441 j!176)))))

(declare-fun b!524566 () Bool)

(declare-fun Unit!16377 () Unit!16375)

(assert (=> b!524566 (= e!305908 Unit!16377)))

(declare-fun res!321503 () Bool)

(assert (=> start!47696 (=> (not res!321503) (not e!305911))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47696 (= res!321503 (validMask!0 mask!3524))))

(assert (=> start!47696 e!305911))

(assert (=> start!47696 true))

(declare-fun array_inv!11877 (array!33334) Bool)

(assert (=> start!47696 (array_inv!11877 a!3235)))

(declare-fun b!524567 () Bool)

(declare-fun e!305907 () Bool)

(assert (=> b!524567 (= e!305907 false)))

(declare-fun b!524568 () Bool)

(assert (=> b!524568 (= e!305913 (not (= lt!240827 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240822 lt!240829 lt!240821 mask!3524))))))

(declare-fun b!524569 () Bool)

(declare-fun Unit!16378 () Unit!16375)

(assert (=> b!524569 (= e!305908 Unit!16378)))

(declare-fun lt!240826 () Unit!16375)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33334 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16375)

(assert (=> b!524569 (= lt!240826 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!240822 #b00000000000000000000000000000000 (index!19978 lt!240827) (x!49107 lt!240827) mask!3524))))

(declare-fun res!321493 () Bool)

(assert (=> b!524569 (= res!321493 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240822 lt!240829 lt!240821 mask!3524) (Intermediate!4441 false (index!19978 lt!240827) (x!49107 lt!240827))))))

(assert (=> b!524569 (=> (not res!321493) (not e!305907))))

(assert (=> b!524569 e!305907))

(declare-fun b!524570 () Bool)

(declare-fun res!321502 () Bool)

(assert (=> b!524570 (=> (not res!321502) (not e!305910))))

(declare-datatypes ((List!10083 0))(
  ( (Nil!10080) (Cons!10079 (h!11010 (_ BitVec 64)) (t!16303 List!10083)) )
))
(declare-fun arrayNoDuplicates!0 (array!33334 (_ BitVec 32) List!10083) Bool)

(assert (=> b!524570 (= res!321502 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10080))))

(declare-fun b!524571 () Bool)

(declare-fun res!321504 () Bool)

(assert (=> b!524571 (=> res!321504 e!305909)))

(get-info :version)

(assert (=> b!524571 (= res!321504 (or (undefined!5253 lt!240827) (not ((_ is Intermediate!4441) lt!240827))))))

(declare-fun b!524572 () Bool)

(declare-fun res!321498 () Bool)

(assert (=> b!524572 (=> (not res!321498) (not e!305911))))

(assert (=> b!524572 (= res!321498 (validKeyInArray!0 (select (arr!16018 a!3235) j!176)))))

(assert (= (and start!47696 res!321503) b!524561))

(assert (= (and b!524561 res!321496) b!524572))

(assert (= (and b!524572 res!321498) b!524559))

(assert (= (and b!524559 res!321505) b!524563))

(assert (= (and b!524563 res!321494) b!524564))

(assert (= (and b!524564 res!321495) b!524558))

(assert (= (and b!524558 res!321500) b!524570))

(assert (= (and b!524570 res!321502) b!524560))

(assert (= (and b!524560 res!321499) b!524565))

(assert (= (and b!524560 (not res!321501)) b!524571))

(assert (= (and b!524571 (not res!321504)) b!524562))

(assert (= (and b!524562 c!61838) b!524569))

(assert (= (and b!524562 (not c!61838)) b!524566))

(assert (= (and b!524569 res!321493) b!524567))

(assert (= (and b!524562 (not res!321497)) b!524568))

(declare-fun m!505435 () Bool)

(assert (=> b!524558 m!505435))

(declare-fun m!505437 () Bool)

(assert (=> b!524570 m!505437))

(declare-fun m!505439 () Bool)

(assert (=> b!524569 m!505439))

(declare-fun m!505441 () Bool)

(assert (=> b!524569 m!505441))

(declare-fun m!505443 () Bool)

(assert (=> b!524563 m!505443))

(assert (=> b!524568 m!505441))

(declare-fun m!505445 () Bool)

(assert (=> b!524564 m!505445))

(declare-fun m!505447 () Bool)

(assert (=> b!524565 m!505447))

(assert (=> b!524565 m!505447))

(declare-fun m!505449 () Bool)

(assert (=> b!524565 m!505449))

(declare-fun m!505451 () Bool)

(assert (=> b!524560 m!505451))

(declare-fun m!505453 () Bool)

(assert (=> b!524560 m!505453))

(assert (=> b!524560 m!505447))

(declare-fun m!505455 () Bool)

(assert (=> b!524560 m!505455))

(assert (=> b!524560 m!505447))

(declare-fun m!505457 () Bool)

(assert (=> b!524560 m!505457))

(declare-fun m!505459 () Bool)

(assert (=> b!524560 m!505459))

(declare-fun m!505461 () Bool)

(assert (=> b!524560 m!505461))

(assert (=> b!524560 m!505447))

(declare-fun m!505463 () Bool)

(assert (=> b!524560 m!505463))

(declare-fun m!505465 () Bool)

(assert (=> b!524560 m!505465))

(declare-fun m!505467 () Bool)

(assert (=> b!524559 m!505467))

(assert (=> b!524562 m!505447))

(declare-fun m!505469 () Bool)

(assert (=> b!524562 m!505469))

(assert (=> b!524572 m!505447))

(assert (=> b!524572 m!505447))

(declare-fun m!505471 () Bool)

(assert (=> b!524572 m!505471))

(declare-fun m!505473 () Bool)

(assert (=> start!47696 m!505473))

(declare-fun m!505475 () Bool)

(assert (=> start!47696 m!505475))

(check-sat (not b!524559) (not b!524564) (not b!524568) (not b!524570) (not b!524563) (not b!524572) (not start!47696) (not b!524560) (not b!524565) (not b!524558) (not b!524569))
(check-sat)
