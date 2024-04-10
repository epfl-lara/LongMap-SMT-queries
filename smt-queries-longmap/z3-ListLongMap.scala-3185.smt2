; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44738 () Bool)

(assert start!44738)

(declare-fun b!491060 () Bool)

(declare-fun e!288585 () Bool)

(declare-fun e!288584 () Bool)

(assert (=> b!491060 (= e!288585 e!288584)))

(declare-fun res!293998 () Bool)

(assert (=> b!491060 (=> (not res!293998) (not e!288584))))

(declare-datatypes ((SeekEntryResult!3753 0))(
  ( (MissingZero!3753 (index!17191 (_ BitVec 32))) (Found!3753 (index!17192 (_ BitVec 32))) (Intermediate!3753 (undefined!4565 Bool) (index!17193 (_ BitVec 32)) (x!46283 (_ BitVec 32))) (Undefined!3753) (MissingVacant!3753 (index!17194 (_ BitVec 32))) )
))
(declare-fun lt!221908 () SeekEntryResult!3753)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!491060 (= res!293998 (or (= lt!221908 (MissingZero!3753 i!1204)) (= lt!221908 (MissingVacant!3753 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31797 0))(
  ( (array!31798 (arr!15286 (Array (_ BitVec 32) (_ BitVec 64))) (size!15650 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31797)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31797 (_ BitVec 32)) SeekEntryResult!3753)

(assert (=> b!491060 (= lt!221908 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!491061 () Bool)

(declare-fun e!288588 () Bool)

(assert (=> b!491061 (= e!288584 (not e!288588))))

(declare-fun res!293999 () Bool)

(assert (=> b!491061 (=> res!293999 e!288588)))

(declare-fun lt!221906 () array!31797)

(declare-fun lt!221907 () (_ BitVec 64))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31797 (_ BitVec 32)) SeekEntryResult!3753)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491061 (= res!293999 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15286 a!3235) j!176) mask!3524) (select (arr!15286 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221907 mask!3524) lt!221907 lt!221906 mask!3524))))))

(assert (=> b!491061 (= lt!221907 (select (store (arr!15286 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!491061 (= lt!221906 (array!31798 (store (arr!15286 a!3235) i!1204 k0!2280) (size!15650 a!3235)))))

(declare-fun lt!221903 () SeekEntryResult!3753)

(assert (=> b!491061 (= lt!221903 (Found!3753 j!176))))

(assert (=> b!491061 (= lt!221903 (seekEntryOrOpen!0 (select (arr!15286 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31797 (_ BitVec 32)) Bool)

(assert (=> b!491061 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14452 0))(
  ( (Unit!14453) )
))
(declare-fun lt!221905 () Unit!14452)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31797 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14452)

(assert (=> b!491061 (= lt!221905 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!491063 () Bool)

(declare-fun res!294004 () Bool)

(assert (=> b!491063 (=> (not res!294004) (not e!288585))))

(declare-fun arrayContainsKey!0 (array!31797 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491063 (= res!294004 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!491064 () Bool)

(declare-fun res!294003 () Bool)

(assert (=> b!491064 (=> (not res!294003) (not e!288584))))

(declare-datatypes ((List!9444 0))(
  ( (Nil!9441) (Cons!9440 (h!10302 (_ BitVec 64)) (t!15672 List!9444)) )
))
(declare-fun arrayNoDuplicates!0 (array!31797 (_ BitVec 32) List!9444) Bool)

(assert (=> b!491064 (= res!294003 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9441))))

(declare-fun b!491065 () Bool)

(declare-fun res!293997 () Bool)

(assert (=> b!491065 (=> (not res!293997) (not e!288585))))

(assert (=> b!491065 (= res!293997 (and (= (size!15650 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15650 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15650 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!491066 () Bool)

(declare-fun res!294000 () Bool)

(assert (=> b!491066 (=> (not res!294000) (not e!288585))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491066 (= res!294000 (validKeyInArray!0 (select (arr!15286 a!3235) j!176)))))

(declare-fun b!491067 () Bool)

(declare-fun res!294001 () Bool)

(assert (=> b!491067 (=> (not res!294001) (not e!288585))))

(assert (=> b!491067 (= res!294001 (validKeyInArray!0 k0!2280))))

(declare-fun b!491062 () Bool)

(declare-fun res!294005 () Bool)

(assert (=> b!491062 (=> (not res!294005) (not e!288584))))

(assert (=> b!491062 (= res!294005 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!293996 () Bool)

(assert (=> start!44738 (=> (not res!293996) (not e!288585))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44738 (= res!293996 (validMask!0 mask!3524))))

(assert (=> start!44738 e!288585))

(assert (=> start!44738 true))

(declare-fun array_inv!11082 (array!31797) Bool)

(assert (=> start!44738 (array_inv!11082 a!3235)))

(declare-fun b!491068 () Bool)

(declare-fun e!288586 () Bool)

(assert (=> b!491068 (= e!288586 (validKeyInArray!0 lt!221907))))

(declare-fun b!491069 () Bool)

(assert (=> b!491069 (= e!288588 e!288586)))

(declare-fun res!294002 () Bool)

(assert (=> b!491069 (=> res!294002 e!288586)))

(assert (=> b!491069 (= res!294002 (bvslt mask!3524 #b00000000000000000000000000000000))))

(assert (=> b!491069 (= lt!221903 (seekEntryOrOpen!0 lt!221907 lt!221906 mask!3524))))

(declare-fun lt!221904 () Unit!14452)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31797 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14452)

(assert (=> b!491069 (= lt!221904 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(assert (= (and start!44738 res!293996) b!491065))

(assert (= (and b!491065 res!293997) b!491066))

(assert (= (and b!491066 res!294000) b!491067))

(assert (= (and b!491067 res!294001) b!491063))

(assert (= (and b!491063 res!294004) b!491060))

(assert (= (and b!491060 res!293998) b!491062))

(assert (= (and b!491062 res!294005) b!491064))

(assert (= (and b!491064 res!294003) b!491061))

(assert (= (and b!491061 (not res!293999)) b!491069))

(assert (= (and b!491069 (not res!294002)) b!491068))

(declare-fun m!471459 () Bool)

(assert (=> b!491068 m!471459))

(declare-fun m!471461 () Bool)

(assert (=> b!491060 m!471461))

(declare-fun m!471463 () Bool)

(assert (=> b!491063 m!471463))

(declare-fun m!471465 () Bool)

(assert (=> b!491066 m!471465))

(assert (=> b!491066 m!471465))

(declare-fun m!471467 () Bool)

(assert (=> b!491066 m!471467))

(declare-fun m!471469 () Bool)

(assert (=> start!44738 m!471469))

(declare-fun m!471471 () Bool)

(assert (=> start!44738 m!471471))

(declare-fun m!471473 () Bool)

(assert (=> b!491061 m!471473))

(declare-fun m!471475 () Bool)

(assert (=> b!491061 m!471475))

(declare-fun m!471477 () Bool)

(assert (=> b!491061 m!471477))

(declare-fun m!471479 () Bool)

(assert (=> b!491061 m!471479))

(declare-fun m!471481 () Bool)

(assert (=> b!491061 m!471481))

(assert (=> b!491061 m!471465))

(declare-fun m!471483 () Bool)

(assert (=> b!491061 m!471483))

(assert (=> b!491061 m!471465))

(assert (=> b!491061 m!471481))

(assert (=> b!491061 m!471465))

(declare-fun m!471485 () Bool)

(assert (=> b!491061 m!471485))

(assert (=> b!491061 m!471473))

(declare-fun m!471487 () Bool)

(assert (=> b!491061 m!471487))

(assert (=> b!491061 m!471465))

(declare-fun m!471489 () Bool)

(assert (=> b!491061 m!471489))

(declare-fun m!471491 () Bool)

(assert (=> b!491069 m!471491))

(declare-fun m!471493 () Bool)

(assert (=> b!491069 m!471493))

(declare-fun m!471495 () Bool)

(assert (=> b!491067 m!471495))

(declare-fun m!471497 () Bool)

(assert (=> b!491062 m!471497))

(declare-fun m!471499 () Bool)

(assert (=> b!491064 m!471499))

(check-sat (not b!491061) (not b!491069) (not b!491064) (not b!491068) (not b!491066) (not b!491063) (not b!491062) (not b!491060) (not start!44738) (not b!491067))
(check-sat)
