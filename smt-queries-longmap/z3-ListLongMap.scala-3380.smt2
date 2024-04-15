; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46680 () Bool)

(assert start!46680)

(declare-fun b!515010 () Bool)

(declare-fun res!314718 () Bool)

(declare-fun e!300702 () Bool)

(assert (=> b!515010 (=> (not res!314718) (not e!300702))))

(declare-datatypes ((array!33002 0))(
  ( (array!33003 (arr!15869 (Array (_ BitVec 32) (_ BitVec 64))) (size!16234 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33002)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515010 (= res!314718 (validKeyInArray!0 (select (arr!15869 a!3235) j!176)))))

(declare-fun b!515011 () Bool)

(declare-fun res!314720 () Bool)

(assert (=> b!515011 (=> (not res!314720) (not e!300702))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!515011 (= res!314720 (validKeyInArray!0 k0!2280))))

(declare-fun res!314717 () Bool)

(assert (=> start!46680 (=> (not res!314717) (not e!300702))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46680 (= res!314717 (validMask!0 mask!3524))))

(assert (=> start!46680 e!300702))

(assert (=> start!46680 true))

(declare-fun array_inv!11752 (array!33002) Bool)

(assert (=> start!46680 (array_inv!11752 a!3235)))

(declare-fun b!515012 () Bool)

(declare-fun e!300704 () Bool)

(declare-fun e!300703 () Bool)

(assert (=> b!515012 (= e!300704 (not e!300703))))

(declare-fun res!314726 () Bool)

(assert (=> b!515012 (=> res!314726 e!300703)))

(declare-datatypes ((SeekEntryResult!4333 0))(
  ( (MissingZero!4333 (index!19520 (_ BitVec 32))) (Found!4333 (index!19521 (_ BitVec 32))) (Intermediate!4333 (undefined!5145 Bool) (index!19522 (_ BitVec 32)) (x!48499 (_ BitVec 32))) (Undefined!4333) (MissingVacant!4333 (index!19523 (_ BitVec 32))) )
))
(declare-fun lt!235656 () SeekEntryResult!4333)

(declare-fun lt!235657 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33002 (_ BitVec 32)) SeekEntryResult!4333)

(assert (=> b!515012 (= res!314726 (= lt!235656 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235657 (select (store (arr!15869 a!3235) i!1204 k0!2280) j!176) (array!33003 (store (arr!15869 a!3235) i!1204 k0!2280) (size!16234 a!3235)) mask!3524)))))

(declare-fun lt!235659 () (_ BitVec 32))

(assert (=> b!515012 (= lt!235656 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235659 (select (arr!15869 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515012 (= lt!235657 (toIndex!0 (select (store (arr!15869 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!515012 (= lt!235659 (toIndex!0 (select (arr!15869 a!3235) j!176) mask!3524))))

(declare-fun e!300705 () Bool)

(assert (=> b!515012 e!300705))

(declare-fun res!314724 () Bool)

(assert (=> b!515012 (=> (not res!314724) (not e!300705))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33002 (_ BitVec 32)) Bool)

(assert (=> b!515012 (= res!314724 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15910 0))(
  ( (Unit!15911) )
))
(declare-fun lt!235660 () Unit!15910)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33002 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15910)

(assert (=> b!515012 (= lt!235660 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!515013 () Bool)

(assert (=> b!515013 (= e!300703 true)))

(assert (=> b!515013 (and (bvslt (x!48499 lt!235656) #b01111111111111111111111111111110) (or (= (select (arr!15869 a!3235) (index!19522 lt!235656)) (select (arr!15869 a!3235) j!176)) (= (select (arr!15869 a!3235) (index!19522 lt!235656)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15869 a!3235) (index!19522 lt!235656)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!515014 () Bool)

(declare-fun res!314722 () Bool)

(assert (=> b!515014 (=> (not res!314722) (not e!300704))))

(declare-datatypes ((List!10066 0))(
  ( (Nil!10063) (Cons!10062 (h!10960 (_ BitVec 64)) (t!16285 List!10066)) )
))
(declare-fun arrayNoDuplicates!0 (array!33002 (_ BitVec 32) List!10066) Bool)

(assert (=> b!515014 (= res!314722 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10063))))

(declare-fun b!515015 () Bool)

(declare-fun res!314721 () Bool)

(assert (=> b!515015 (=> res!314721 e!300703)))

(get-info :version)

(assert (=> b!515015 (= res!314721 (or (undefined!5145 lt!235656) (not ((_ is Intermediate!4333) lt!235656))))))

(declare-fun b!515016 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33002 (_ BitVec 32)) SeekEntryResult!4333)

(assert (=> b!515016 (= e!300705 (= (seekEntryOrOpen!0 (select (arr!15869 a!3235) j!176) a!3235 mask!3524) (Found!4333 j!176)))))

(declare-fun b!515017 () Bool)

(assert (=> b!515017 (= e!300702 e!300704)))

(declare-fun res!314723 () Bool)

(assert (=> b!515017 (=> (not res!314723) (not e!300704))))

(declare-fun lt!235658 () SeekEntryResult!4333)

(assert (=> b!515017 (= res!314723 (or (= lt!235658 (MissingZero!4333 i!1204)) (= lt!235658 (MissingVacant!4333 i!1204))))))

(assert (=> b!515017 (= lt!235658 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!515018 () Bool)

(declare-fun res!314725 () Bool)

(assert (=> b!515018 (=> (not res!314725) (not e!300702))))

(assert (=> b!515018 (= res!314725 (and (= (size!16234 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16234 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16234 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!515019 () Bool)

(declare-fun res!314719 () Bool)

(assert (=> b!515019 (=> (not res!314719) (not e!300702))))

(declare-fun arrayContainsKey!0 (array!33002 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515019 (= res!314719 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!515020 () Bool)

(declare-fun res!314716 () Bool)

(assert (=> b!515020 (=> (not res!314716) (not e!300704))))

(assert (=> b!515020 (= res!314716 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!46680 res!314717) b!515018))

(assert (= (and b!515018 res!314725) b!515010))

(assert (= (and b!515010 res!314718) b!515011))

(assert (= (and b!515011 res!314720) b!515019))

(assert (= (and b!515019 res!314719) b!515017))

(assert (= (and b!515017 res!314723) b!515020))

(assert (= (and b!515020 res!314716) b!515014))

(assert (= (and b!515014 res!314722) b!515012))

(assert (= (and b!515012 res!314724) b!515016))

(assert (= (and b!515012 (not res!314726)) b!515015))

(assert (= (and b!515015 (not res!314721)) b!515013))

(declare-fun m!495841 () Bool)

(assert (=> b!515019 m!495841))

(declare-fun m!495843 () Bool)

(assert (=> b!515020 m!495843))

(declare-fun m!495845 () Bool)

(assert (=> b!515016 m!495845))

(assert (=> b!515016 m!495845))

(declare-fun m!495847 () Bool)

(assert (=> b!515016 m!495847))

(declare-fun m!495849 () Bool)

(assert (=> b!515014 m!495849))

(declare-fun m!495851 () Bool)

(assert (=> b!515017 m!495851))

(declare-fun m!495853 () Bool)

(assert (=> b!515013 m!495853))

(assert (=> b!515013 m!495845))

(declare-fun m!495855 () Bool)

(assert (=> start!46680 m!495855))

(declare-fun m!495857 () Bool)

(assert (=> start!46680 m!495857))

(declare-fun m!495859 () Bool)

(assert (=> b!515011 m!495859))

(declare-fun m!495861 () Bool)

(assert (=> b!515012 m!495861))

(declare-fun m!495863 () Bool)

(assert (=> b!515012 m!495863))

(declare-fun m!495865 () Bool)

(assert (=> b!515012 m!495865))

(assert (=> b!515012 m!495845))

(declare-fun m!495867 () Bool)

(assert (=> b!515012 m!495867))

(assert (=> b!515012 m!495845))

(declare-fun m!495869 () Bool)

(assert (=> b!515012 m!495869))

(assert (=> b!515012 m!495845))

(declare-fun m!495871 () Bool)

(assert (=> b!515012 m!495871))

(assert (=> b!515012 m!495865))

(declare-fun m!495873 () Bool)

(assert (=> b!515012 m!495873))

(assert (=> b!515012 m!495865))

(declare-fun m!495875 () Bool)

(assert (=> b!515012 m!495875))

(assert (=> b!515010 m!495845))

(assert (=> b!515010 m!495845))

(declare-fun m!495877 () Bool)

(assert (=> b!515010 m!495877))

(check-sat (not b!515011) (not b!515017) (not b!515020) (not b!515016) (not b!515010) (not start!46680) (not b!515014) (not b!515019) (not b!515012))
(check-sat)
