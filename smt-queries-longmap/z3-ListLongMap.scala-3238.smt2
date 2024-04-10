; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45236 () Bool)

(assert start!45236)

(declare-fun b!496717 () Bool)

(declare-fun e!291248 () Bool)

(assert (=> b!496717 (= e!291248 true)))

(declare-datatypes ((SeekEntryResult!3912 0))(
  ( (MissingZero!3912 (index!17827 (_ BitVec 32))) (Found!3912 (index!17828 (_ BitVec 32))) (Intermediate!3912 (undefined!4724 Bool) (index!17829 (_ BitVec 32)) (x!46884 (_ BitVec 32))) (Undefined!3912) (MissingVacant!3912 (index!17830 (_ BitVec 32))) )
))
(declare-fun lt!224868 () SeekEntryResult!3912)

(declare-datatypes ((array!32124 0))(
  ( (array!32125 (arr!15445 (Array (_ BitVec 32) (_ BitVec 64))) (size!15809 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32124)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!496717 (and (bvslt (x!46884 lt!224868) #b01111111111111111111111111111110) (or (= (select (arr!15445 a!3235) (index!17829 lt!224868)) (select (arr!15445 a!3235) j!176)) (= (select (arr!15445 a!3235) (index!17829 lt!224868)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15445 a!3235) (index!17829 lt!224868)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!496719 () Bool)

(declare-fun e!291252 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32124 (_ BitVec 32)) SeekEntryResult!3912)

(assert (=> b!496719 (= e!291252 (= (seekEntryOrOpen!0 (select (arr!15445 a!3235) j!176) a!3235 mask!3524) (Found!3912 j!176)))))

(declare-fun b!496720 () Bool)

(declare-fun res!299104 () Bool)

(declare-fun e!291250 () Bool)

(assert (=> b!496720 (=> (not res!299104) (not e!291250))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496720 (= res!299104 (validKeyInArray!0 (select (arr!15445 a!3235) j!176)))))

(declare-fun b!496721 () Bool)

(declare-fun res!299108 () Bool)

(assert (=> b!496721 (=> res!299108 e!291248)))

(get-info :version)

(assert (=> b!496721 (= res!299108 (or (undefined!4724 lt!224868) (not ((_ is Intermediate!3912) lt!224868))))))

(declare-fun b!496722 () Bool)

(declare-fun res!299111 () Bool)

(declare-fun e!291251 () Bool)

(assert (=> b!496722 (=> (not res!299111) (not e!291251))))

(declare-datatypes ((List!9603 0))(
  ( (Nil!9600) (Cons!9599 (h!10470 (_ BitVec 64)) (t!15831 List!9603)) )
))
(declare-fun arrayNoDuplicates!0 (array!32124 (_ BitVec 32) List!9603) Bool)

(assert (=> b!496722 (= res!299111 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9600))))

(declare-fun b!496723 () Bool)

(declare-fun res!299107 () Bool)

(assert (=> b!496723 (=> (not res!299107) (not e!291251))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32124 (_ BitVec 32)) Bool)

(assert (=> b!496723 (= res!299107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!496724 () Bool)

(declare-fun res!299106 () Bool)

(assert (=> b!496724 (=> (not res!299106) (not e!291250))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!496724 (= res!299106 (and (= (size!15809 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15809 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15809 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!496725 () Bool)

(assert (=> b!496725 (= e!291250 e!291251)))

(declare-fun res!299110 () Bool)

(assert (=> b!496725 (=> (not res!299110) (not e!291251))))

(declare-fun lt!224870 () SeekEntryResult!3912)

(assert (=> b!496725 (= res!299110 (or (= lt!224870 (MissingZero!3912 i!1204)) (= lt!224870 (MissingVacant!3912 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!496725 (= lt!224870 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!299114 () Bool)

(assert (=> start!45236 (=> (not res!299114) (not e!291250))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45236 (= res!299114 (validMask!0 mask!3524))))

(assert (=> start!45236 e!291250))

(assert (=> start!45236 true))

(declare-fun array_inv!11241 (array!32124) Bool)

(assert (=> start!45236 (array_inv!11241 a!3235)))

(declare-fun b!496718 () Bool)

(assert (=> b!496718 (= e!291251 (not e!291248))))

(declare-fun res!299113 () Bool)

(assert (=> b!496718 (=> res!299113 e!291248)))

(declare-fun lt!224872 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32124 (_ BitVec 32)) SeekEntryResult!3912)

(assert (=> b!496718 (= res!299113 (= lt!224868 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224872 (select (store (arr!15445 a!3235) i!1204 k0!2280) j!176) (array!32125 (store (arr!15445 a!3235) i!1204 k0!2280) (size!15809 a!3235)) mask!3524)))))

(declare-fun lt!224871 () (_ BitVec 32))

(assert (=> b!496718 (= lt!224868 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224871 (select (arr!15445 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496718 (= lt!224872 (toIndex!0 (select (store (arr!15445 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!496718 (= lt!224871 (toIndex!0 (select (arr!15445 a!3235) j!176) mask!3524))))

(assert (=> b!496718 e!291252))

(declare-fun res!299109 () Bool)

(assert (=> b!496718 (=> (not res!299109) (not e!291252))))

(assert (=> b!496718 (= res!299109 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14770 0))(
  ( (Unit!14771) )
))
(declare-fun lt!224869 () Unit!14770)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32124 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14770)

(assert (=> b!496718 (= lt!224869 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!496726 () Bool)

(declare-fun res!299112 () Bool)

(assert (=> b!496726 (=> (not res!299112) (not e!291250))))

(declare-fun arrayContainsKey!0 (array!32124 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496726 (= res!299112 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!496727 () Bool)

(declare-fun res!299105 () Bool)

(assert (=> b!496727 (=> (not res!299105) (not e!291250))))

(assert (=> b!496727 (= res!299105 (validKeyInArray!0 k0!2280))))

(assert (= (and start!45236 res!299114) b!496724))

(assert (= (and b!496724 res!299106) b!496720))

(assert (= (and b!496720 res!299104) b!496727))

(assert (= (and b!496727 res!299105) b!496726))

(assert (= (and b!496726 res!299112) b!496725))

(assert (= (and b!496725 res!299110) b!496723))

(assert (= (and b!496723 res!299107) b!496722))

(assert (= (and b!496722 res!299111) b!496718))

(assert (= (and b!496718 res!299109) b!496719))

(assert (= (and b!496718 (not res!299113)) b!496721))

(assert (= (and b!496721 (not res!299108)) b!496717))

(declare-fun m!477995 () Bool)

(assert (=> b!496718 m!477995))

(declare-fun m!477997 () Bool)

(assert (=> b!496718 m!477997))

(declare-fun m!477999 () Bool)

(assert (=> b!496718 m!477999))

(assert (=> b!496718 m!477999))

(declare-fun m!478001 () Bool)

(assert (=> b!496718 m!478001))

(declare-fun m!478003 () Bool)

(assert (=> b!496718 m!478003))

(declare-fun m!478005 () Bool)

(assert (=> b!496718 m!478005))

(assert (=> b!496718 m!478003))

(assert (=> b!496718 m!478003))

(declare-fun m!478007 () Bool)

(assert (=> b!496718 m!478007))

(declare-fun m!478009 () Bool)

(assert (=> b!496718 m!478009))

(assert (=> b!496718 m!477999))

(declare-fun m!478011 () Bool)

(assert (=> b!496718 m!478011))

(declare-fun m!478013 () Bool)

(assert (=> start!45236 m!478013))

(declare-fun m!478015 () Bool)

(assert (=> start!45236 m!478015))

(declare-fun m!478017 () Bool)

(assert (=> b!496726 m!478017))

(declare-fun m!478019 () Bool)

(assert (=> b!496727 m!478019))

(declare-fun m!478021 () Bool)

(assert (=> b!496722 m!478021))

(declare-fun m!478023 () Bool)

(assert (=> b!496725 m!478023))

(declare-fun m!478025 () Bool)

(assert (=> b!496723 m!478025))

(assert (=> b!496719 m!478003))

(assert (=> b!496719 m!478003))

(declare-fun m!478027 () Bool)

(assert (=> b!496719 m!478027))

(declare-fun m!478029 () Bool)

(assert (=> b!496717 m!478029))

(assert (=> b!496717 m!478003))

(assert (=> b!496720 m!478003))

(assert (=> b!496720 m!478003))

(declare-fun m!478031 () Bool)

(assert (=> b!496720 m!478031))

(check-sat (not b!496720) (not b!496726) (not b!496722) (not b!496719) (not b!496727) (not b!496725) (not b!496723) (not start!45236) (not b!496718))
(check-sat)
