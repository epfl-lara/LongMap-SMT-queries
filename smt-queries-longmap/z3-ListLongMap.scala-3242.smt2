; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45246 () Bool)

(assert start!45246)

(declare-fun b!496809 () Bool)

(declare-fun e!291242 () Bool)

(declare-fun e!291241 () Bool)

(assert (=> b!496809 (= e!291242 (not e!291241))))

(declare-fun res!299346 () Bool)

(assert (=> b!496809 (=> res!299346 e!291241)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32144 0))(
  ( (array!32145 (arr!15455 (Array (_ BitVec 32) (_ BitVec 64))) (size!15820 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32144)

(declare-datatypes ((SeekEntryResult!3919 0))(
  ( (MissingZero!3919 (index!17855 (_ BitVec 32))) (Found!3919 (index!17856 (_ BitVec 32))) (Intermediate!3919 (undefined!4731 Bool) (index!17857 (_ BitVec 32)) (x!46918 (_ BitVec 32))) (Undefined!3919) (MissingVacant!3919 (index!17858 (_ BitVec 32))) )
))
(declare-fun lt!224800 () SeekEntryResult!3919)

(declare-fun lt!224799 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32144 (_ BitVec 32)) SeekEntryResult!3919)

(assert (=> b!496809 (= res!299346 (= lt!224800 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224799 (select (store (arr!15455 a!3235) i!1204 k0!2280) j!176) (array!32145 (store (arr!15455 a!3235) i!1204 k0!2280) (size!15820 a!3235)) mask!3524)))))

(declare-fun lt!224803 () (_ BitVec 32))

(assert (=> b!496809 (= lt!224800 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224803 (select (arr!15455 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496809 (= lt!224799 (toIndex!0 (select (store (arr!15455 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!496809 (= lt!224803 (toIndex!0 (select (arr!15455 a!3235) j!176) mask!3524))))

(declare-fun e!291243 () Bool)

(assert (=> b!496809 e!291243))

(declare-fun res!299347 () Bool)

(assert (=> b!496809 (=> (not res!299347) (not e!291243))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32144 (_ BitVec 32)) Bool)

(assert (=> b!496809 (= res!299347 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14770 0))(
  ( (Unit!14771) )
))
(declare-fun lt!224801 () Unit!14770)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32144 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14770)

(assert (=> b!496809 (= lt!224801 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!496810 () Bool)

(declare-fun res!299343 () Bool)

(assert (=> b!496810 (=> (not res!299343) (not e!291242))))

(declare-datatypes ((List!9652 0))(
  ( (Nil!9649) (Cons!9648 (h!10519 (_ BitVec 64)) (t!15871 List!9652)) )
))
(declare-fun arrayNoDuplicates!0 (array!32144 (_ BitVec 32) List!9652) Bool)

(assert (=> b!496810 (= res!299343 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9649))))

(declare-fun b!496811 () Bool)

(declare-fun res!299339 () Bool)

(declare-fun e!291239 () Bool)

(assert (=> b!496811 (=> (not res!299339) (not e!291239))))

(assert (=> b!496811 (= res!299339 (and (= (size!15820 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15820 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15820 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!496812 () Bool)

(declare-fun res!299338 () Bool)

(assert (=> b!496812 (=> (not res!299338) (not e!291239))))

(declare-fun arrayContainsKey!0 (array!32144 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496812 (= res!299338 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!496813 () Bool)

(declare-fun res!299341 () Bool)

(assert (=> b!496813 (=> res!299341 e!291241)))

(get-info :version)

(assert (=> b!496813 (= res!299341 (or (undefined!4731 lt!224800) (not ((_ is Intermediate!3919) lt!224800))))))

(declare-fun b!496814 () Bool)

(declare-fun res!299342 () Bool)

(assert (=> b!496814 (=> (not res!299342) (not e!291239))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496814 (= res!299342 (validKeyInArray!0 (select (arr!15455 a!3235) j!176)))))

(declare-fun b!496815 () Bool)

(declare-fun res!299340 () Bool)

(assert (=> b!496815 (=> (not res!299340) (not e!291242))))

(assert (=> b!496815 (= res!299340 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!299345 () Bool)

(assert (=> start!45246 (=> (not res!299345) (not e!291239))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45246 (= res!299345 (validMask!0 mask!3524))))

(assert (=> start!45246 e!291239))

(assert (=> start!45246 true))

(declare-fun array_inv!11338 (array!32144) Bool)

(assert (=> start!45246 (array_inv!11338 a!3235)))

(declare-fun b!496816 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32144 (_ BitVec 32)) SeekEntryResult!3919)

(assert (=> b!496816 (= e!291243 (= (seekEntryOrOpen!0 (select (arr!15455 a!3235) j!176) a!3235 mask!3524) (Found!3919 j!176)))))

(declare-fun b!496817 () Bool)

(declare-fun res!299344 () Bool)

(assert (=> b!496817 (=> (not res!299344) (not e!291239))))

(assert (=> b!496817 (= res!299344 (validKeyInArray!0 k0!2280))))

(declare-fun b!496818 () Bool)

(assert (=> b!496818 (= e!291241 true)))

(assert (=> b!496818 (and (bvslt (x!46918 lt!224800) #b01111111111111111111111111111110) (or (= (select (arr!15455 a!3235) (index!17857 lt!224800)) (select (arr!15455 a!3235) j!176)) (= (select (arr!15455 a!3235) (index!17857 lt!224800)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15455 a!3235) (index!17857 lt!224800)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!496819 () Bool)

(assert (=> b!496819 (= e!291239 e!291242)))

(declare-fun res!299348 () Bool)

(assert (=> b!496819 (=> (not res!299348) (not e!291242))))

(declare-fun lt!224802 () SeekEntryResult!3919)

(assert (=> b!496819 (= res!299348 (or (= lt!224802 (MissingZero!3919 i!1204)) (= lt!224802 (MissingVacant!3919 i!1204))))))

(assert (=> b!496819 (= lt!224802 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!45246 res!299345) b!496811))

(assert (= (and b!496811 res!299339) b!496814))

(assert (= (and b!496814 res!299342) b!496817))

(assert (= (and b!496817 res!299344) b!496812))

(assert (= (and b!496812 res!299338) b!496819))

(assert (= (and b!496819 res!299348) b!496815))

(assert (= (and b!496815 res!299340) b!496810))

(assert (= (and b!496810 res!299343) b!496809))

(assert (= (and b!496809 res!299347) b!496816))

(assert (= (and b!496809 (not res!299346)) b!496813))

(assert (= (and b!496813 (not res!299341)) b!496818))

(declare-fun m!477661 () Bool)

(assert (=> b!496810 m!477661))

(declare-fun m!477663 () Bool)

(assert (=> b!496817 m!477663))

(declare-fun m!477665 () Bool)

(assert (=> b!496815 m!477665))

(declare-fun m!477667 () Bool)

(assert (=> b!496816 m!477667))

(assert (=> b!496816 m!477667))

(declare-fun m!477669 () Bool)

(assert (=> b!496816 m!477669))

(declare-fun m!477671 () Bool)

(assert (=> b!496812 m!477671))

(assert (=> b!496814 m!477667))

(assert (=> b!496814 m!477667))

(declare-fun m!477673 () Bool)

(assert (=> b!496814 m!477673))

(declare-fun m!477675 () Bool)

(assert (=> start!45246 m!477675))

(declare-fun m!477677 () Bool)

(assert (=> start!45246 m!477677))

(declare-fun m!477679 () Bool)

(assert (=> b!496819 m!477679))

(declare-fun m!477681 () Bool)

(assert (=> b!496818 m!477681))

(assert (=> b!496818 m!477667))

(declare-fun m!477683 () Bool)

(assert (=> b!496809 m!477683))

(declare-fun m!477685 () Bool)

(assert (=> b!496809 m!477685))

(assert (=> b!496809 m!477667))

(declare-fun m!477687 () Bool)

(assert (=> b!496809 m!477687))

(assert (=> b!496809 m!477667))

(declare-fun m!477689 () Bool)

(assert (=> b!496809 m!477689))

(declare-fun m!477691 () Bool)

(assert (=> b!496809 m!477691))

(declare-fun m!477693 () Bool)

(assert (=> b!496809 m!477693))

(assert (=> b!496809 m!477689))

(declare-fun m!477695 () Bool)

(assert (=> b!496809 m!477695))

(assert (=> b!496809 m!477667))

(declare-fun m!477697 () Bool)

(assert (=> b!496809 m!477697))

(assert (=> b!496809 m!477689))

(check-sat (not b!496815) (not start!45246) (not b!496817) (not b!496809) (not b!496816) (not b!496819) (not b!496812) (not b!496810) (not b!496814))
(check-sat)
