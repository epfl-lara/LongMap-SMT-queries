; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52130 () Bool)

(assert start!52130)

(declare-fun b!568805 () Bool)

(declare-fun res!358969 () Bool)

(declare-fun e!327246 () Bool)

(assert (=> b!568805 (=> (not res!358969) (not e!327246))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35662 0))(
  ( (array!35663 (arr!17123 (Array (_ BitVec 32) (_ BitVec 64))) (size!17488 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35662)

(assert (=> b!568805 (= res!358969 (and (= (size!17488 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17488 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17488 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!358968 () Bool)

(assert (=> start!52130 (=> (not res!358968) (not e!327246))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52130 (= res!358968 (validMask!0 mask!3119))))

(assert (=> start!52130 e!327246))

(assert (=> start!52130 true))

(declare-fun array_inv!13006 (array!35662) Bool)

(assert (=> start!52130 (array_inv!13006 a!3118)))

(declare-fun b!568806 () Bool)

(declare-fun res!358967 () Bool)

(assert (=> b!568806 (=> (not res!358967) (not e!327246))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!568806 (= res!358967 (validKeyInArray!0 (select (arr!17123 a!3118) j!142)))))

(declare-fun b!568807 () Bool)

(declare-fun res!358970 () Bool)

(declare-fun e!327245 () Bool)

(assert (=> b!568807 (=> (not res!358970) (not e!327245))))

(declare-datatypes ((List!11242 0))(
  ( (Nil!11239) (Cons!11238 (h!12259 (_ BitVec 64)) (t!17461 List!11242)) )
))
(declare-fun arrayNoDuplicates!0 (array!35662 (_ BitVec 32) List!11242) Bool)

(assert (=> b!568807 (= res!358970 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11239))))

(declare-fun b!568808 () Bool)

(declare-fun res!358973 () Bool)

(assert (=> b!568808 (=> (not res!358973) (not e!327245))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35662 (_ BitVec 32)) Bool)

(assert (=> b!568808 (= res!358973 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!568809 () Bool)

(declare-fun e!327243 () Bool)

(assert (=> b!568809 (= e!327245 e!327243)))

(declare-fun res!358966 () Bool)

(assert (=> b!568809 (=> (not res!358966) (not e!327243))))

(declare-datatypes ((SeekEntryResult!5569 0))(
  ( (MissingZero!5569 (index!24503 (_ BitVec 32))) (Found!5569 (index!24504 (_ BitVec 32))) (Intermediate!5569 (undefined!6381 Bool) (index!24505 (_ BitVec 32)) (x!53391 (_ BitVec 32))) (Undefined!5569) (MissingVacant!5569 (index!24506 (_ BitVec 32))) )
))
(declare-fun lt!259072 () SeekEntryResult!5569)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun lt!259069 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35662 (_ BitVec 32)) SeekEntryResult!5569)

(assert (=> b!568809 (= res!358966 (= lt!259072 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259069 (select (store (arr!17123 a!3118) i!1132 k0!1914) j!142) (array!35663 (store (arr!17123 a!3118) i!1132 k0!1914) (size!17488 a!3118)) mask!3119)))))

(declare-fun lt!259067 () (_ BitVec 32))

(assert (=> b!568809 (= lt!259072 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259067 (select (arr!17123 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!568809 (= lt!259069 (toIndex!0 (select (store (arr!17123 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!568809 (= lt!259067 (toIndex!0 (select (arr!17123 a!3118) j!142) mask!3119))))

(declare-fun b!568810 () Bool)

(declare-fun res!358971 () Bool)

(assert (=> b!568810 (=> (not res!358971) (not e!327246))))

(assert (=> b!568810 (= res!358971 (validKeyInArray!0 k0!1914))))

(declare-fun b!568811 () Bool)

(get-info :version)

(assert (=> b!568811 (= e!327243 (not (or (undefined!6381 lt!259072) (not ((_ is Intermediate!5569) lt!259072)) (= (select (arr!17123 a!3118) (index!24505 lt!259072)) (select (arr!17123 a!3118) j!142)) (not (= (select (arr!17123 a!3118) (index!24505 lt!259072)) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!17488 a!3118)))))))

(declare-fun lt!259070 () SeekEntryResult!5569)

(assert (=> b!568811 (and (= lt!259070 (Found!5569 j!142)) (or (undefined!6381 lt!259072) (not ((_ is Intermediate!5569) lt!259072)) (= (select (arr!17123 a!3118) (index!24505 lt!259072)) (select (arr!17123 a!3118) j!142)) (not (= (select (arr!17123 a!3118) (index!24505 lt!259072)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259070 (MissingZero!5569 (index!24505 lt!259072)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35662 (_ BitVec 32)) SeekEntryResult!5569)

(assert (=> b!568811 (= lt!259070 (seekEntryOrOpen!0 (select (arr!17123 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!568811 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17826 0))(
  ( (Unit!17827) )
))
(declare-fun lt!259071 () Unit!17826)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35662 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17826)

(assert (=> b!568811 (= lt!259071 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!568812 () Bool)

(declare-fun res!358972 () Bool)

(assert (=> b!568812 (=> (not res!358972) (not e!327246))))

(declare-fun arrayContainsKey!0 (array!35662 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!568812 (= res!358972 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!568813 () Bool)

(assert (=> b!568813 (= e!327246 e!327245)))

(declare-fun res!358965 () Bool)

(assert (=> b!568813 (=> (not res!358965) (not e!327245))))

(declare-fun lt!259068 () SeekEntryResult!5569)

(assert (=> b!568813 (= res!358965 (or (= lt!259068 (MissingZero!5569 i!1132)) (= lt!259068 (MissingVacant!5569 i!1132))))))

(assert (=> b!568813 (= lt!259068 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!52130 res!358968) b!568805))

(assert (= (and b!568805 res!358969) b!568806))

(assert (= (and b!568806 res!358967) b!568810))

(assert (= (and b!568810 res!358971) b!568812))

(assert (= (and b!568812 res!358972) b!568813))

(assert (= (and b!568813 res!358965) b!568808))

(assert (= (and b!568808 res!358973) b!568807))

(assert (= (and b!568807 res!358970) b!568809))

(assert (= (and b!568809 res!358966) b!568811))

(declare-fun m!546887 () Bool)

(assert (=> b!568812 m!546887))

(declare-fun m!546889 () Bool)

(assert (=> b!568806 m!546889))

(assert (=> b!568806 m!546889))

(declare-fun m!546891 () Bool)

(assert (=> b!568806 m!546891))

(declare-fun m!546893 () Bool)

(assert (=> b!568807 m!546893))

(declare-fun m!546895 () Bool)

(assert (=> b!568813 m!546895))

(declare-fun m!546897 () Bool)

(assert (=> b!568808 m!546897))

(declare-fun m!546899 () Bool)

(assert (=> start!52130 m!546899))

(declare-fun m!546901 () Bool)

(assert (=> start!52130 m!546901))

(declare-fun m!546903 () Bool)

(assert (=> b!568811 m!546903))

(assert (=> b!568811 m!546889))

(declare-fun m!546905 () Bool)

(assert (=> b!568811 m!546905))

(declare-fun m!546907 () Bool)

(assert (=> b!568811 m!546907))

(assert (=> b!568811 m!546889))

(declare-fun m!546909 () Bool)

(assert (=> b!568811 m!546909))

(declare-fun m!546911 () Bool)

(assert (=> b!568810 m!546911))

(assert (=> b!568809 m!546889))

(declare-fun m!546913 () Bool)

(assert (=> b!568809 m!546913))

(assert (=> b!568809 m!546889))

(assert (=> b!568809 m!546889))

(declare-fun m!546915 () Bool)

(assert (=> b!568809 m!546915))

(declare-fun m!546917 () Bool)

(assert (=> b!568809 m!546917))

(declare-fun m!546919 () Bool)

(assert (=> b!568809 m!546919))

(assert (=> b!568809 m!546917))

(declare-fun m!546921 () Bool)

(assert (=> b!568809 m!546921))

(assert (=> b!568809 m!546917))

(declare-fun m!546923 () Bool)

(assert (=> b!568809 m!546923))

(check-sat (not b!568812) (not start!52130) (not b!568813) (not b!568811) (not b!568806) (not b!568807) (not b!568809) (not b!568810) (not b!568808))
(check-sat)
