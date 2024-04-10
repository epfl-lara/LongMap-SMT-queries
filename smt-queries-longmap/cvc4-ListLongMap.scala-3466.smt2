; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48130 () Bool)

(assert start!48130)

(declare-fun b!530104 () Bool)

(declare-fun e!308881 () Bool)

(declare-fun e!308878 () Bool)

(assert (=> b!530104 (= e!308881 e!308878)))

(declare-fun res!325816 () Bool)

(assert (=> b!530104 (=> res!325816 e!308878)))

(declare-fun lt!244512 () Bool)

(declare-datatypes ((SeekEntryResult!4597 0))(
  ( (MissingZero!4597 (index!20612 (_ BitVec 32))) (Found!4597 (index!20613 (_ BitVec 32))) (Intermediate!4597 (undefined!5409 Bool) (index!20614 (_ BitVec 32)) (x!49579 (_ BitVec 32))) (Undefined!4597) (MissingVacant!4597 (index!20615 (_ BitVec 32))) )
))
(declare-fun lt!244511 () SeekEntryResult!4597)

(assert (=> b!530104 (= res!325816 (or (and (not lt!244512) (undefined!5409 lt!244511)) (and (not lt!244512) (not (undefined!5409 lt!244511)))))))

(assert (=> b!530104 (= lt!244512 (not (is-Intermediate!4597 lt!244511)))))

(declare-fun b!530105 () Bool)

(declare-fun res!325813 () Bool)

(declare-fun e!308880 () Bool)

(assert (=> b!530105 (=> (not res!325813) (not e!308880))))

(declare-datatypes ((array!33566 0))(
  ( (array!33567 (arr!16130 (Array (_ BitVec 32) (_ BitVec 64))) (size!16494 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33566)

(declare-datatypes ((List!10288 0))(
  ( (Nil!10285) (Cons!10284 (h!11224 (_ BitVec 64)) (t!16516 List!10288)) )
))
(declare-fun arrayNoDuplicates!0 (array!33566 (_ BitVec 32) List!10288) Bool)

(assert (=> b!530105 (= res!325813 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10285))))

(declare-fun b!530106 () Bool)

(declare-fun res!325814 () Bool)

(declare-fun e!308879 () Bool)

(assert (=> b!530106 (=> (not res!325814) (not e!308879))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530106 (= res!325814 (validKeyInArray!0 k!2280))))

(declare-fun b!530107 () Bool)

(assert (=> b!530107 (= e!308879 e!308880)))

(declare-fun res!325812 () Bool)

(assert (=> b!530107 (=> (not res!325812) (not e!308880))))

(declare-fun lt!244513 () SeekEntryResult!4597)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!530107 (= res!325812 (or (= lt!244513 (MissingZero!4597 i!1204)) (= lt!244513 (MissingVacant!4597 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33566 (_ BitVec 32)) SeekEntryResult!4597)

(assert (=> b!530107 (= lt!244513 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!325815 () Bool)

(assert (=> start!48130 (=> (not res!325815) (not e!308879))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48130 (= res!325815 (validMask!0 mask!3524))))

(assert (=> start!48130 e!308879))

(assert (=> start!48130 true))

(declare-fun array_inv!11926 (array!33566) Bool)

(assert (=> start!48130 (array_inv!11926 a!3235)))

(declare-fun b!530108 () Bool)

(declare-fun res!325810 () Bool)

(assert (=> b!530108 (=> (not res!325810) (not e!308879))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!530108 (= res!325810 (and (= (size!16494 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16494 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16494 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!530109 () Bool)

(declare-fun res!325820 () Bool)

(assert (=> b!530109 (=> (not res!325820) (not e!308879))))

(assert (=> b!530109 (= res!325820 (validKeyInArray!0 (select (arr!16130 a!3235) j!176)))))

(declare-fun b!530110 () Bool)

(declare-fun res!325811 () Bool)

(assert (=> b!530110 (=> (not res!325811) (not e!308879))))

(declare-fun arrayContainsKey!0 (array!33566 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530110 (= res!325811 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!530111 () Bool)

(assert (=> b!530111 (= e!308878 true)))

(declare-fun lt!244507 () (_ BitVec 64))

(declare-fun lt!244508 () SeekEntryResult!4597)

(declare-fun lt!244509 () array!33566)

(assert (=> b!530111 (= lt!244508 (seekEntryOrOpen!0 lt!244507 lt!244509 mask!3524))))

(assert (=> b!530111 false))

(declare-fun b!530112 () Bool)

(assert (=> b!530112 (= e!308880 (not e!308881))))

(declare-fun res!325819 () Bool)

(assert (=> b!530112 (=> res!325819 e!308881)))

(declare-fun lt!244506 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33566 (_ BitVec 32)) SeekEntryResult!4597)

(assert (=> b!530112 (= res!325819 (= lt!244511 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244506 lt!244507 lt!244509 mask!3524)))))

(declare-fun lt!244510 () (_ BitVec 32))

(assert (=> b!530112 (= lt!244511 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244510 (select (arr!16130 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!530112 (= lt!244506 (toIndex!0 lt!244507 mask!3524))))

(assert (=> b!530112 (= lt!244507 (select (store (arr!16130 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!530112 (= lt!244510 (toIndex!0 (select (arr!16130 a!3235) j!176) mask!3524))))

(assert (=> b!530112 (= lt!244509 (array!33567 (store (arr!16130 a!3235) i!1204 k!2280) (size!16494 a!3235)))))

(declare-fun e!308883 () Bool)

(assert (=> b!530112 e!308883))

(declare-fun res!325818 () Bool)

(assert (=> b!530112 (=> (not res!325818) (not e!308883))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33566 (_ BitVec 32)) Bool)

(assert (=> b!530112 (= res!325818 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16806 0))(
  ( (Unit!16807) )
))
(declare-fun lt!244505 () Unit!16806)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33566 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16806)

(assert (=> b!530112 (= lt!244505 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!530113 () Bool)

(assert (=> b!530113 (= e!308883 (= (seekEntryOrOpen!0 (select (arr!16130 a!3235) j!176) a!3235 mask!3524) (Found!4597 j!176)))))

(declare-fun b!530114 () Bool)

(declare-fun res!325817 () Bool)

(assert (=> b!530114 (=> (not res!325817) (not e!308880))))

(assert (=> b!530114 (= res!325817 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!48130 res!325815) b!530108))

(assert (= (and b!530108 res!325810) b!530109))

(assert (= (and b!530109 res!325820) b!530106))

(assert (= (and b!530106 res!325814) b!530110))

(assert (= (and b!530110 res!325811) b!530107))

(assert (= (and b!530107 res!325812) b!530114))

(assert (= (and b!530114 res!325817) b!530105))

(assert (= (and b!530105 res!325813) b!530112))

(assert (= (and b!530112 res!325818) b!530113))

(assert (= (and b!530112 (not res!325819)) b!530104))

(assert (= (and b!530104 (not res!325816)) b!530111))

(declare-fun m!510637 () Bool)

(assert (=> start!48130 m!510637))

(declare-fun m!510639 () Bool)

(assert (=> start!48130 m!510639))

(declare-fun m!510641 () Bool)

(assert (=> b!530107 m!510641))

(declare-fun m!510643 () Bool)

(assert (=> b!530110 m!510643))

(declare-fun m!510645 () Bool)

(assert (=> b!530114 m!510645))

(declare-fun m!510647 () Bool)

(assert (=> b!530109 m!510647))

(assert (=> b!530109 m!510647))

(declare-fun m!510649 () Bool)

(assert (=> b!530109 m!510649))

(assert (=> b!530113 m!510647))

(assert (=> b!530113 m!510647))

(declare-fun m!510651 () Bool)

(assert (=> b!530113 m!510651))

(declare-fun m!510653 () Bool)

(assert (=> b!530106 m!510653))

(declare-fun m!510655 () Bool)

(assert (=> b!530112 m!510655))

(declare-fun m!510657 () Bool)

(assert (=> b!530112 m!510657))

(declare-fun m!510659 () Bool)

(assert (=> b!530112 m!510659))

(assert (=> b!530112 m!510647))

(declare-fun m!510661 () Bool)

(assert (=> b!530112 m!510661))

(declare-fun m!510663 () Bool)

(assert (=> b!530112 m!510663))

(assert (=> b!530112 m!510647))

(declare-fun m!510665 () Bool)

(assert (=> b!530112 m!510665))

(assert (=> b!530112 m!510647))

(declare-fun m!510667 () Bool)

(assert (=> b!530112 m!510667))

(declare-fun m!510669 () Bool)

(assert (=> b!530112 m!510669))

(declare-fun m!510671 () Bool)

(assert (=> b!530105 m!510671))

(declare-fun m!510673 () Bool)

(assert (=> b!530111 m!510673))

(push 1)

