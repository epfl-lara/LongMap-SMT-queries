; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46676 () Bool)

(assert start!46676)

(declare-fun b!515121 () Bool)

(declare-fun res!314745 () Bool)

(declare-fun e!300794 () Bool)

(assert (=> b!515121 (=> (not res!314745) (not e!300794))))

(declare-datatypes ((array!32989 0))(
  ( (array!32990 (arr!15862 (Array (_ BitVec 32) (_ BitVec 64))) (size!16226 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32989)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32989 (_ BitVec 32)) Bool)

(assert (=> b!515121 (= res!314745 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!515122 () Bool)

(declare-fun res!314741 () Bool)

(declare-fun e!300792 () Bool)

(assert (=> b!515122 (=> (not res!314741) (not e!300792))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!515122 (= res!314741 (and (= (size!16226 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16226 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16226 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!515123 () Bool)

(declare-fun e!300791 () Bool)

(assert (=> b!515123 (= e!300794 (not e!300791))))

(declare-fun res!314739 () Bool)

(assert (=> b!515123 (=> res!314739 e!300791)))

(declare-datatypes ((SeekEntryResult!4285 0))(
  ( (MissingZero!4285 (index!19328 (_ BitVec 32))) (Found!4285 (index!19329 (_ BitVec 32))) (Intermediate!4285 (undefined!5097 Bool) (index!19330 (_ BitVec 32)) (x!48445 (_ BitVec 32))) (Undefined!4285) (MissingVacant!4285 (index!19331 (_ BitVec 32))) )
))
(declare-fun lt!235860 () SeekEntryResult!4285)

(declare-fun lt!235858 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32989 (_ BitVec 32)) SeekEntryResult!4285)

(assert (=> b!515123 (= res!314739 (= lt!235860 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235858 (select (store (arr!15862 a!3235) i!1204 k0!2280) j!176) (array!32990 (store (arr!15862 a!3235) i!1204 k0!2280) (size!16226 a!3235)) mask!3524)))))

(declare-fun lt!235857 () (_ BitVec 32))

(assert (=> b!515123 (= lt!235860 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235857 (select (arr!15862 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515123 (= lt!235858 (toIndex!0 (select (store (arr!15862 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!515123 (= lt!235857 (toIndex!0 (select (arr!15862 a!3235) j!176) mask!3524))))

(declare-fun e!300793 () Bool)

(assert (=> b!515123 e!300793))

(declare-fun res!314746 () Bool)

(assert (=> b!515123 (=> (not res!314746) (not e!300793))))

(assert (=> b!515123 (= res!314746 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15889 0))(
  ( (Unit!15890) )
))
(declare-fun lt!235859 () Unit!15889)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32989 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15889)

(assert (=> b!515123 (= lt!235859 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!314742 () Bool)

(assert (=> start!46676 (=> (not res!314742) (not e!300792))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46676 (= res!314742 (validMask!0 mask!3524))))

(assert (=> start!46676 e!300792))

(assert (=> start!46676 true))

(declare-fun array_inv!11721 (array!32989) Bool)

(assert (=> start!46676 (array_inv!11721 a!3235)))

(declare-fun b!515124 () Bool)

(declare-fun res!314748 () Bool)

(assert (=> b!515124 (=> (not res!314748) (not e!300792))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515124 (= res!314748 (validKeyInArray!0 k0!2280))))

(declare-fun b!515125 () Bool)

(assert (=> b!515125 (= e!300792 e!300794)))

(declare-fun res!314747 () Bool)

(assert (=> b!515125 (=> (not res!314747) (not e!300794))))

(declare-fun lt!235861 () SeekEntryResult!4285)

(assert (=> b!515125 (= res!314747 (or (= lt!235861 (MissingZero!4285 i!1204)) (= lt!235861 (MissingVacant!4285 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32989 (_ BitVec 32)) SeekEntryResult!4285)

(assert (=> b!515125 (= lt!235861 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!515126 () Bool)

(declare-fun res!314744 () Bool)

(assert (=> b!515126 (=> (not res!314744) (not e!300792))))

(assert (=> b!515126 (= res!314744 (validKeyInArray!0 (select (arr!15862 a!3235) j!176)))))

(declare-fun b!515127 () Bool)

(declare-fun res!314743 () Bool)

(assert (=> b!515127 (=> (not res!314743) (not e!300792))))

(declare-fun arrayContainsKey!0 (array!32989 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515127 (= res!314743 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!515128 () Bool)

(declare-fun res!314749 () Bool)

(assert (=> b!515128 (=> (not res!314749) (not e!300794))))

(declare-datatypes ((List!9927 0))(
  ( (Nil!9924) (Cons!9923 (h!10821 (_ BitVec 64)) (t!16147 List!9927)) )
))
(declare-fun arrayNoDuplicates!0 (array!32989 (_ BitVec 32) List!9927) Bool)

(assert (=> b!515128 (= res!314749 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9924))))

(declare-fun b!515129 () Bool)

(assert (=> b!515129 (= e!300791 true)))

(assert (=> b!515129 (and (bvslt (x!48445 lt!235860) #b01111111111111111111111111111110) (or (= (select (arr!15862 a!3235) (index!19330 lt!235860)) (select (arr!15862 a!3235) j!176)) (= (select (arr!15862 a!3235) (index!19330 lt!235860)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15862 a!3235) (index!19330 lt!235860)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!515130 () Bool)

(declare-fun res!314740 () Bool)

(assert (=> b!515130 (=> res!314740 e!300791)))

(get-info :version)

(assert (=> b!515130 (= res!314740 (or (undefined!5097 lt!235860) (not ((_ is Intermediate!4285) lt!235860))))))

(declare-fun b!515131 () Bool)

(assert (=> b!515131 (= e!300793 (= (seekEntryOrOpen!0 (select (arr!15862 a!3235) j!176) a!3235 mask!3524) (Found!4285 j!176)))))

(assert (= (and start!46676 res!314742) b!515122))

(assert (= (and b!515122 res!314741) b!515126))

(assert (= (and b!515126 res!314744) b!515124))

(assert (= (and b!515124 res!314748) b!515127))

(assert (= (and b!515127 res!314743) b!515125))

(assert (= (and b!515125 res!314747) b!515121))

(assert (= (and b!515121 res!314745) b!515128))

(assert (= (and b!515128 res!314749) b!515123))

(assert (= (and b!515123 res!314746) b!515131))

(assert (= (and b!515123 (not res!314739)) b!515130))

(assert (= (and b!515130 (not res!314740)) b!515129))

(declare-fun m!496663 () Bool)

(assert (=> b!515129 m!496663))

(declare-fun m!496665 () Bool)

(assert (=> b!515129 m!496665))

(declare-fun m!496667 () Bool)

(assert (=> b!515124 m!496667))

(declare-fun m!496669 () Bool)

(assert (=> start!46676 m!496669))

(declare-fun m!496671 () Bool)

(assert (=> start!46676 m!496671))

(declare-fun m!496673 () Bool)

(assert (=> b!515121 m!496673))

(declare-fun m!496675 () Bool)

(assert (=> b!515128 m!496675))

(declare-fun m!496677 () Bool)

(assert (=> b!515127 m!496677))

(declare-fun m!496679 () Bool)

(assert (=> b!515123 m!496679))

(declare-fun m!496681 () Bool)

(assert (=> b!515123 m!496681))

(assert (=> b!515123 m!496665))

(declare-fun m!496683 () Bool)

(assert (=> b!515123 m!496683))

(assert (=> b!515123 m!496665))

(declare-fun m!496685 () Bool)

(assert (=> b!515123 m!496685))

(assert (=> b!515123 m!496665))

(declare-fun m!496687 () Bool)

(assert (=> b!515123 m!496687))

(assert (=> b!515123 m!496681))

(declare-fun m!496689 () Bool)

(assert (=> b!515123 m!496689))

(declare-fun m!496691 () Bool)

(assert (=> b!515123 m!496691))

(assert (=> b!515123 m!496681))

(declare-fun m!496693 () Bool)

(assert (=> b!515123 m!496693))

(assert (=> b!515131 m!496665))

(assert (=> b!515131 m!496665))

(declare-fun m!496695 () Bool)

(assert (=> b!515131 m!496695))

(declare-fun m!496697 () Bool)

(assert (=> b!515125 m!496697))

(assert (=> b!515126 m!496665))

(assert (=> b!515126 m!496665))

(declare-fun m!496699 () Bool)

(assert (=> b!515126 m!496699))

(check-sat (not b!515123) (not b!515131) (not b!515125) (not b!515128) (not start!46676) (not b!515127) (not b!515121) (not b!515124) (not b!515126))
(check-sat)
