; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48012 () Bool)

(assert start!48012)

(declare-fun b!528705 () Bool)

(declare-fun res!324768 () Bool)

(declare-fun e!308077 () Bool)

(assert (=> b!528705 (=> (not res!324768) (not e!308077))))

(declare-datatypes ((array!33515 0))(
  ( (array!33516 (arr!16106 (Array (_ BitVec 32) (_ BitVec 64))) (size!16471 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33515)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33515 (_ BitVec 32)) Bool)

(assert (=> b!528705 (= res!324768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!528706 () Bool)

(declare-fun res!324779 () Bool)

(declare-fun e!308075 () Bool)

(assert (=> b!528706 (=> (not res!324779) (not e!308075))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33515 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!528706 (= res!324779 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!528707 () Bool)

(declare-fun res!324782 () Bool)

(declare-fun e!308076 () Bool)

(assert (=> b!528707 (=> res!324782 e!308076)))

(declare-fun lt!243520 () (_ BitVec 64))

(declare-fun lt!243526 () (_ BitVec 32))

(declare-fun lt!243524 () array!33515)

(declare-datatypes ((SeekEntryResult!4570 0))(
  ( (MissingZero!4570 (index!20504 (_ BitVec 32))) (Found!4570 (index!20505 (_ BitVec 32))) (Intermediate!4570 (undefined!5382 Bool) (index!20506 (_ BitVec 32)) (x!49485 (_ BitVec 32))) (Undefined!4570) (MissingVacant!4570 (index!20507 (_ BitVec 32))) )
))
(declare-fun lt!243527 () SeekEntryResult!4570)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33515 (_ BitVec 32)) SeekEntryResult!4570)

(assert (=> b!528707 (= res!324782 (not (= lt!243527 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243526 lt!243520 lt!243524 mask!3524))))))

(declare-fun b!528708 () Bool)

(assert (=> b!528708 (= e!308075 e!308077)))

(declare-fun res!324774 () Bool)

(assert (=> b!528708 (=> (not res!324774) (not e!308077))))

(declare-fun lt!243523 () SeekEntryResult!4570)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!528708 (= res!324774 (or (= lt!243523 (MissingZero!4570 i!1204)) (= lt!243523 (MissingVacant!4570 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33515 (_ BitVec 32)) SeekEntryResult!4570)

(assert (=> b!528708 (= lt!243523 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!324776 () Bool)

(assert (=> start!48012 (=> (not res!324776) (not e!308075))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48012 (= res!324776 (validMask!0 mask!3524))))

(assert (=> start!48012 e!308075))

(assert (=> start!48012 true))

(declare-fun array_inv!11989 (array!33515) Bool)

(assert (=> start!48012 (array_inv!11989 a!3235)))

(declare-fun b!528709 () Bool)

(declare-fun res!324777 () Bool)

(assert (=> b!528709 (=> (not res!324777) (not e!308075))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!528709 (= res!324777 (validKeyInArray!0 (select (arr!16106 a!3235) j!176)))))

(declare-fun b!528710 () Bool)

(declare-datatypes ((Unit!16726 0))(
  ( (Unit!16727) )
))
(declare-fun e!308079 () Unit!16726)

(declare-fun Unit!16728 () Unit!16726)

(assert (=> b!528710 (= e!308079 Unit!16728)))

(declare-fun lt!243528 () SeekEntryResult!4570)

(declare-fun lt!243525 () Unit!16726)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33515 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16726)

(assert (=> b!528710 (= lt!243525 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!243526 #b00000000000000000000000000000000 (index!20506 lt!243528) (x!49485 lt!243528) mask!3524))))

(declare-fun res!324781 () Bool)

(assert (=> b!528710 (= res!324781 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243526 lt!243520 lt!243524 mask!3524) (Intermediate!4570 false (index!20506 lt!243528) (x!49485 lt!243528))))))

(declare-fun e!308078 () Bool)

(assert (=> b!528710 (=> (not res!324781) (not e!308078))))

(assert (=> b!528710 e!308078))

(declare-fun b!528711 () Bool)

(declare-fun e!308082 () Bool)

(assert (=> b!528711 (= e!308077 (not e!308082))))

(declare-fun res!324772 () Bool)

(assert (=> b!528711 (=> res!324772 e!308082)))

(get-info :version)

(assert (=> b!528711 (= res!324772 (or (= lt!243528 lt!243527) (undefined!5382 lt!243528) (not ((_ is Intermediate!4570) lt!243528))))))

(declare-fun lt!243532 () (_ BitVec 32))

(assert (=> b!528711 (= lt!243527 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243532 lt!243520 lt!243524 mask!3524))))

(assert (=> b!528711 (= lt!243528 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243526 (select (arr!16106 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!528711 (= lt!243532 (toIndex!0 lt!243520 mask!3524))))

(assert (=> b!528711 (= lt!243520 (select (store (arr!16106 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!528711 (= lt!243526 (toIndex!0 (select (arr!16106 a!3235) j!176) mask!3524))))

(assert (=> b!528711 (= lt!243524 (array!33516 (store (arr!16106 a!3235) i!1204 k0!2280) (size!16471 a!3235)))))

(declare-fun lt!243531 () SeekEntryResult!4570)

(assert (=> b!528711 (= lt!243531 (Found!4570 j!176))))

(declare-fun e!308081 () Bool)

(assert (=> b!528711 e!308081))

(declare-fun res!324771 () Bool)

(assert (=> b!528711 (=> (not res!324771) (not e!308081))))

(assert (=> b!528711 (= res!324771 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!243529 () Unit!16726)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33515 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16726)

(assert (=> b!528711 (= lt!243529 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!528712 () Bool)

(declare-fun res!324770 () Bool)

(assert (=> b!528712 (=> (not res!324770) (not e!308077))))

(declare-datatypes ((List!10303 0))(
  ( (Nil!10300) (Cons!10299 (h!11236 (_ BitVec 64)) (t!16522 List!10303)) )
))
(declare-fun arrayNoDuplicates!0 (array!33515 (_ BitVec 32) List!10303) Bool)

(assert (=> b!528712 (= res!324770 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10300))))

(declare-fun b!528713 () Bool)

(assert (=> b!528713 (= e!308082 e!308076)))

(declare-fun res!324775 () Bool)

(assert (=> b!528713 (=> res!324775 e!308076)))

(assert (=> b!528713 (= res!324775 (or (bvsgt (x!49485 lt!243528) #b01111111111111111111111111111110) (bvslt lt!243526 #b00000000000000000000000000000000) (bvsge lt!243526 (size!16471 a!3235)) (bvslt (index!20506 lt!243528) #b00000000000000000000000000000000) (bvsge (index!20506 lt!243528) (size!16471 a!3235)) (not (= lt!243528 (Intermediate!4570 false (index!20506 lt!243528) (x!49485 lt!243528))))))))

(assert (=> b!528713 (= (index!20506 lt!243528) i!1204)))

(declare-fun lt!243530 () Unit!16726)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33515 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16726)

(assert (=> b!528713 (= lt!243530 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!243526 #b00000000000000000000000000000000 (index!20506 lt!243528) (x!49485 lt!243528) mask!3524))))

(assert (=> b!528713 (and (or (= (select (arr!16106 a!3235) (index!20506 lt!243528)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16106 a!3235) (index!20506 lt!243528)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16106 a!3235) (index!20506 lt!243528)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16106 a!3235) (index!20506 lt!243528)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!243522 () Unit!16726)

(assert (=> b!528713 (= lt!243522 e!308079)))

(declare-fun c!62277 () Bool)

(assert (=> b!528713 (= c!62277 (= (select (arr!16106 a!3235) (index!20506 lt!243528)) (select (arr!16106 a!3235) j!176)))))

(assert (=> b!528713 (and (bvslt (x!49485 lt!243528) #b01111111111111111111111111111110) (or (= (select (arr!16106 a!3235) (index!20506 lt!243528)) (select (arr!16106 a!3235) j!176)) (= (select (arr!16106 a!3235) (index!20506 lt!243528)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16106 a!3235) (index!20506 lt!243528)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!528714 () Bool)

(assert (=> b!528714 (= e!308076 true)))

(assert (=> b!528714 (= (seekEntryOrOpen!0 lt!243520 lt!243524 mask!3524) lt!243531)))

(declare-fun lt!243521 () Unit!16726)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!33515 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16726)

(assert (=> b!528714 (= lt!243521 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k0!2280 j!176 lt!243526 #b00000000000000000000000000000000 (index!20506 lt!243528) (x!49485 lt!243528) mask!3524))))

(declare-fun b!528715 () Bool)

(declare-fun res!324773 () Bool)

(assert (=> b!528715 (=> (not res!324773) (not e!308075))))

(assert (=> b!528715 (= res!324773 (validKeyInArray!0 k0!2280))))

(declare-fun b!528716 () Bool)

(assert (=> b!528716 (= e!308078 false)))

(declare-fun b!528717 () Bool)

(declare-fun Unit!16729 () Unit!16726)

(assert (=> b!528717 (= e!308079 Unit!16729)))

(declare-fun b!528718 () Bool)

(declare-fun res!324780 () Bool)

(assert (=> b!528718 (=> res!324780 e!308076)))

(declare-fun e!308074 () Bool)

(assert (=> b!528718 (= res!324780 e!308074)))

(declare-fun res!324778 () Bool)

(assert (=> b!528718 (=> (not res!324778) (not e!308074))))

(assert (=> b!528718 (= res!324778 (bvsgt #b00000000000000000000000000000000 (x!49485 lt!243528)))))

(declare-fun b!528719 () Bool)

(declare-fun res!324769 () Bool)

(assert (=> b!528719 (=> (not res!324769) (not e!308075))))

(assert (=> b!528719 (= res!324769 (and (= (size!16471 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16471 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16471 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!528720 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33515 (_ BitVec 32)) SeekEntryResult!4570)

(assert (=> b!528720 (= e!308074 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!243526 (index!20506 lt!243528) (select (arr!16106 a!3235) j!176) a!3235 mask!3524) lt!243531)))))

(declare-fun b!528721 () Bool)

(assert (=> b!528721 (= e!308081 (= (seekEntryOrOpen!0 (select (arr!16106 a!3235) j!176) a!3235 mask!3524) (Found!4570 j!176)))))

(assert (= (and start!48012 res!324776) b!528719))

(assert (= (and b!528719 res!324769) b!528709))

(assert (= (and b!528709 res!324777) b!528715))

(assert (= (and b!528715 res!324773) b!528706))

(assert (= (and b!528706 res!324779) b!528708))

(assert (= (and b!528708 res!324774) b!528705))

(assert (= (and b!528705 res!324768) b!528712))

(assert (= (and b!528712 res!324770) b!528711))

(assert (= (and b!528711 res!324771) b!528721))

(assert (= (and b!528711 (not res!324772)) b!528713))

(assert (= (and b!528713 c!62277) b!528710))

(assert (= (and b!528713 (not c!62277)) b!528717))

(assert (= (and b!528710 res!324781) b!528716))

(assert (= (and b!528713 (not res!324775)) b!528718))

(assert (= (and b!528718 res!324778) b!528720))

(assert (= (and b!528718 (not res!324780)) b!528707))

(assert (= (and b!528707 (not res!324782)) b!528714))

(declare-fun m!508753 () Bool)

(assert (=> b!528710 m!508753))

(declare-fun m!508755 () Bool)

(assert (=> b!528710 m!508755))

(declare-fun m!508757 () Bool)

(assert (=> start!48012 m!508757))

(declare-fun m!508759 () Bool)

(assert (=> start!48012 m!508759))

(declare-fun m!508761 () Bool)

(assert (=> b!528705 m!508761))

(declare-fun m!508763 () Bool)

(assert (=> b!528720 m!508763))

(assert (=> b!528720 m!508763))

(declare-fun m!508765 () Bool)

(assert (=> b!528720 m!508765))

(assert (=> b!528707 m!508755))

(declare-fun m!508767 () Bool)

(assert (=> b!528711 m!508767))

(declare-fun m!508769 () Bool)

(assert (=> b!528711 m!508769))

(declare-fun m!508771 () Bool)

(assert (=> b!528711 m!508771))

(declare-fun m!508773 () Bool)

(assert (=> b!528711 m!508773))

(assert (=> b!528711 m!508763))

(declare-fun m!508775 () Bool)

(assert (=> b!528711 m!508775))

(declare-fun m!508777 () Bool)

(assert (=> b!528711 m!508777))

(assert (=> b!528711 m!508763))

(declare-fun m!508779 () Bool)

(assert (=> b!528711 m!508779))

(assert (=> b!528711 m!508763))

(declare-fun m!508781 () Bool)

(assert (=> b!528711 m!508781))

(declare-fun m!508783 () Bool)

(assert (=> b!528713 m!508783))

(declare-fun m!508785 () Bool)

(assert (=> b!528713 m!508785))

(assert (=> b!528713 m!508763))

(declare-fun m!508787 () Bool)

(assert (=> b!528712 m!508787))

(assert (=> b!528721 m!508763))

(assert (=> b!528721 m!508763))

(declare-fun m!508789 () Bool)

(assert (=> b!528721 m!508789))

(declare-fun m!508791 () Bool)

(assert (=> b!528715 m!508791))

(declare-fun m!508793 () Bool)

(assert (=> b!528706 m!508793))

(declare-fun m!508795 () Bool)

(assert (=> b!528714 m!508795))

(declare-fun m!508797 () Bool)

(assert (=> b!528714 m!508797))

(assert (=> b!528709 m!508763))

(assert (=> b!528709 m!508763))

(declare-fun m!508799 () Bool)

(assert (=> b!528709 m!508799))

(declare-fun m!508801 () Bool)

(assert (=> b!528708 m!508801))

(check-sat (not b!528713) (not b!528709) (not b!528707) (not start!48012) (not b!528714) (not b!528715) (not b!528705) (not b!528706) (not b!528710) (not b!528711) (not b!528720) (not b!528708) (not b!528721) (not b!528712))
(check-sat)
