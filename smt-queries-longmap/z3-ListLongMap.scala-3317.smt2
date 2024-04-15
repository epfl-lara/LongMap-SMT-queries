; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45834 () Bool)

(assert start!45834)

(declare-fun res!308574 () Bool)

(declare-fun e!296956 () Bool)

(assert (=> start!45834 (=> (not res!308574) (not e!296956))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45834 (= res!308574 (validMask!0 mask!3524))))

(assert (=> start!45834 e!296956))

(assert (=> start!45834 true))

(declare-datatypes ((array!32600 0))(
  ( (array!32601 (arr!15680 (Array (_ BitVec 32) (_ BitVec 64))) (size!16045 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32600)

(declare-fun array_inv!11563 (array!32600) Bool)

(assert (=> start!45834 (array_inv!11563 a!3235)))

(declare-fun b!507471 () Bool)

(declare-fun res!308572 () Bool)

(assert (=> b!507471 (=> (not res!308572) (not e!296956))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32600 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507471 (= res!308572 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!507472 () Bool)

(declare-fun e!296958 () Bool)

(assert (=> b!507472 (= e!296956 e!296958)))

(declare-fun res!308581 () Bool)

(assert (=> b!507472 (=> (not res!308581) (not e!296958))))

(declare-datatypes ((SeekEntryResult!4144 0))(
  ( (MissingZero!4144 (index!18764 (_ BitVec 32))) (Found!4144 (index!18765 (_ BitVec 32))) (Intermediate!4144 (undefined!4956 Bool) (index!18766 (_ BitVec 32)) (x!47764 (_ BitVec 32))) (Undefined!4144) (MissingVacant!4144 (index!18767 (_ BitVec 32))) )
))
(declare-fun lt!231740 () SeekEntryResult!4144)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!507472 (= res!308581 (or (= lt!231740 (MissingZero!4144 i!1204)) (= lt!231740 (MissingVacant!4144 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32600 (_ BitVec 32)) SeekEntryResult!4144)

(assert (=> b!507472 (= lt!231740 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!507473 () Bool)

(declare-fun e!296955 () Bool)

(assert (=> b!507473 (= e!296958 (not e!296955))))

(declare-fun res!308580 () Bool)

(assert (=> b!507473 (=> res!308580 e!296955)))

(declare-fun lt!231745 () array!32600)

(declare-fun lt!231744 () (_ BitVec 64))

(declare-fun lt!231742 () SeekEntryResult!4144)

(declare-fun lt!231739 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32600 (_ BitVec 32)) SeekEntryResult!4144)

(assert (=> b!507473 (= res!308580 (= lt!231742 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231739 lt!231744 lt!231745 mask!3524)))))

(declare-fun lt!231743 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!507473 (= lt!231742 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231743 (select (arr!15680 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!507473 (= lt!231739 (toIndex!0 lt!231744 mask!3524))))

(assert (=> b!507473 (= lt!231744 (select (store (arr!15680 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!507473 (= lt!231743 (toIndex!0 (select (arr!15680 a!3235) j!176) mask!3524))))

(assert (=> b!507473 (= lt!231745 (array!32601 (store (arr!15680 a!3235) i!1204 k0!2280) (size!16045 a!3235)))))

(declare-fun e!296953 () Bool)

(assert (=> b!507473 e!296953))

(declare-fun res!308573 () Bool)

(assert (=> b!507473 (=> (not res!308573) (not e!296953))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32600 (_ BitVec 32)) Bool)

(assert (=> b!507473 (= res!308573 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15562 0))(
  ( (Unit!15563) )
))
(declare-fun lt!231741 () Unit!15562)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32600 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15562)

(assert (=> b!507473 (= lt!231741 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!507474 () Bool)

(declare-fun res!308579 () Bool)

(assert (=> b!507474 (=> (not res!308579) (not e!296956))))

(assert (=> b!507474 (= res!308579 (and (= (size!16045 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16045 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16045 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!507475 () Bool)

(declare-fun e!296954 () Bool)

(assert (=> b!507475 (= e!296954 true)))

(declare-fun lt!231737 () SeekEntryResult!4144)

(assert (=> b!507475 (= lt!231737 (seekEntryOrOpen!0 lt!231744 lt!231745 mask!3524))))

(assert (=> b!507475 false))

(declare-fun b!507476 () Bool)

(declare-fun res!308582 () Bool)

(assert (=> b!507476 (=> (not res!308582) (not e!296958))))

(declare-datatypes ((List!9877 0))(
  ( (Nil!9874) (Cons!9873 (h!10750 (_ BitVec 64)) (t!16096 List!9877)) )
))
(declare-fun arrayNoDuplicates!0 (array!32600 (_ BitVec 32) List!9877) Bool)

(assert (=> b!507476 (= res!308582 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9874))))

(declare-fun b!507477 () Bool)

(declare-fun res!308575 () Bool)

(assert (=> b!507477 (=> (not res!308575) (not e!296956))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507477 (= res!308575 (validKeyInArray!0 (select (arr!15680 a!3235) j!176)))))

(declare-fun b!507478 () Bool)

(assert (=> b!507478 (= e!296953 (= (seekEntryOrOpen!0 (select (arr!15680 a!3235) j!176) a!3235 mask!3524) (Found!4144 j!176)))))

(declare-fun b!507479 () Bool)

(assert (=> b!507479 (= e!296955 e!296954)))

(declare-fun res!308576 () Bool)

(assert (=> b!507479 (=> res!308576 e!296954)))

(declare-fun lt!231738 () Bool)

(assert (=> b!507479 (= res!308576 (or (and (not lt!231738) (undefined!4956 lt!231742)) (and (not lt!231738) (not (undefined!4956 lt!231742)))))))

(get-info :version)

(assert (=> b!507479 (= lt!231738 (not ((_ is Intermediate!4144) lt!231742)))))

(declare-fun b!507480 () Bool)

(declare-fun res!308578 () Bool)

(assert (=> b!507480 (=> (not res!308578) (not e!296958))))

(assert (=> b!507480 (= res!308578 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!507481 () Bool)

(declare-fun res!308577 () Bool)

(assert (=> b!507481 (=> (not res!308577) (not e!296956))))

(assert (=> b!507481 (= res!308577 (validKeyInArray!0 k0!2280))))

(assert (= (and start!45834 res!308574) b!507474))

(assert (= (and b!507474 res!308579) b!507477))

(assert (= (and b!507477 res!308575) b!507481))

(assert (= (and b!507481 res!308577) b!507471))

(assert (= (and b!507471 res!308572) b!507472))

(assert (= (and b!507472 res!308581) b!507480))

(assert (= (and b!507480 res!308578) b!507476))

(assert (= (and b!507476 res!308582) b!507473))

(assert (= (and b!507473 res!308573) b!507478))

(assert (= (and b!507473 (not res!308580)) b!507479))

(assert (= (and b!507479 (not res!308576)) b!507475))

(declare-fun m!487807 () Bool)

(assert (=> b!507473 m!487807))

(declare-fun m!487809 () Bool)

(assert (=> b!507473 m!487809))

(declare-fun m!487811 () Bool)

(assert (=> b!507473 m!487811))

(declare-fun m!487813 () Bool)

(assert (=> b!507473 m!487813))

(declare-fun m!487815 () Bool)

(assert (=> b!507473 m!487815))

(declare-fun m!487817 () Bool)

(assert (=> b!507473 m!487817))

(assert (=> b!507473 m!487807))

(declare-fun m!487819 () Bool)

(assert (=> b!507473 m!487819))

(assert (=> b!507473 m!487807))

(declare-fun m!487821 () Bool)

(assert (=> b!507473 m!487821))

(declare-fun m!487823 () Bool)

(assert (=> b!507473 m!487823))

(declare-fun m!487825 () Bool)

(assert (=> b!507480 m!487825))

(declare-fun m!487827 () Bool)

(assert (=> b!507476 m!487827))

(declare-fun m!487829 () Bool)

(assert (=> b!507471 m!487829))

(declare-fun m!487831 () Bool)

(assert (=> b!507475 m!487831))

(declare-fun m!487833 () Bool)

(assert (=> start!45834 m!487833))

(declare-fun m!487835 () Bool)

(assert (=> start!45834 m!487835))

(assert (=> b!507478 m!487807))

(assert (=> b!507478 m!487807))

(declare-fun m!487837 () Bool)

(assert (=> b!507478 m!487837))

(declare-fun m!487839 () Bool)

(assert (=> b!507472 m!487839))

(declare-fun m!487841 () Bool)

(assert (=> b!507481 m!487841))

(assert (=> b!507477 m!487807))

(assert (=> b!507477 m!487807))

(declare-fun m!487843 () Bool)

(assert (=> b!507477 m!487843))

(check-sat (not b!507477) (not b!507471) (not b!507475) (not b!507480) (not start!45834) (not b!507481) (not b!507478) (not b!507472) (not b!507476) (not b!507473))
(check-sat)
