; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52830 () Bool)

(assert start!52830)

(declare-fun b!575789 () Bool)

(declare-fun e!331316 () Bool)

(declare-fun e!331314 () Bool)

(assert (=> b!575789 (= e!331316 (not e!331314))))

(declare-fun res!364109 () Bool)

(assert (=> b!575789 (=> res!364109 e!331314)))

(declare-datatypes ((SeekEntryResult!5647 0))(
  ( (MissingZero!5647 (index!24815 (_ BitVec 32))) (Found!5647 (index!24816 (_ BitVec 32))) (Intermediate!5647 (undefined!6459 Bool) (index!24817 (_ BitVec 32)) (x!53859 (_ BitVec 32))) (Undefined!5647) (MissingVacant!5647 (index!24818 (_ BitVec 32))) )
))
(declare-fun lt!263314 () SeekEntryResult!5647)

(get-info :version)

(assert (=> b!575789 (= res!364109 (or (undefined!6459 lt!263314) (not ((_ is Intermediate!5647) lt!263314))))))

(declare-fun lt!263312 () SeekEntryResult!5647)

(declare-fun lt!263315 () SeekEntryResult!5647)

(assert (=> b!575789 (= lt!263312 lt!263315)))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!575789 (= lt!263315 (Found!5647 j!142))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35922 0))(
  ( (array!35923 (arr!17242 (Array (_ BitVec 32) (_ BitVec 64))) (size!17606 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35922)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35922 (_ BitVec 32)) SeekEntryResult!5647)

(assert (=> b!575789 (= lt!263312 (seekEntryOrOpen!0 (select (arr!17242 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35922 (_ BitVec 32)) Bool)

(assert (=> b!575789 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18067 0))(
  ( (Unit!18068) )
))
(declare-fun lt!263322 () Unit!18067)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35922 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18067)

(assert (=> b!575789 (= lt!263322 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!575790 () Bool)

(declare-fun e!331319 () Bool)

(assert (=> b!575790 (= e!331314 e!331319)))

(declare-fun res!364100 () Bool)

(assert (=> b!575790 (=> res!364100 e!331319)))

(declare-fun lt!263321 () (_ BitVec 64))

(assert (=> b!575790 (= res!364100 (or (= lt!263321 (select (arr!17242 a!3118) j!142)) (= lt!263321 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!575790 (= lt!263321 (select (arr!17242 a!3118) (index!24817 lt!263314)))))

(declare-fun b!575791 () Bool)

(declare-fun res!364101 () Bool)

(declare-fun e!331317 () Bool)

(assert (=> b!575791 (=> (not res!364101) (not e!331317))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!575791 (= res!364101 (validKeyInArray!0 (select (arr!17242 a!3118) j!142)))))

(declare-fun b!575792 () Bool)

(declare-fun res!364103 () Bool)

(declare-fun e!331315 () Bool)

(assert (=> b!575792 (=> (not res!364103) (not e!331315))))

(declare-datatypes ((List!11229 0))(
  ( (Nil!11226) (Cons!11225 (h!12267 (_ BitVec 64)) (t!17449 List!11229)) )
))
(declare-fun arrayNoDuplicates!0 (array!35922 (_ BitVec 32) List!11229) Bool)

(assert (=> b!575792 (= res!364103 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11226))))

(declare-fun b!575793 () Bool)

(assert (=> b!575793 (= e!331317 e!331315)))

(declare-fun res!364108 () Bool)

(assert (=> b!575793 (=> (not res!364108) (not e!331315))))

(declare-fun lt!263319 () SeekEntryResult!5647)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!575793 (= res!364108 (or (= lt!263319 (MissingZero!5647 i!1132)) (= lt!263319 (MissingVacant!5647 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!575793 (= lt!263319 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!575794 () Bool)

(declare-fun res!364110 () Bool)

(assert (=> b!575794 (=> (not res!364110) (not e!331317))))

(assert (=> b!575794 (= res!364110 (validKeyInArray!0 k0!1914))))

(declare-fun b!575795 () Bool)

(declare-fun e!331318 () Bool)

(assert (=> b!575795 (= e!331319 e!331318)))

(declare-fun res!364107 () Bool)

(assert (=> b!575795 (=> res!364107 e!331318)))

(declare-fun lt!263311 () SeekEntryResult!5647)

(assert (=> b!575795 (= res!364107 (or (bvslt (index!24817 lt!263314) #b00000000000000000000000000000000) (bvsge (index!24817 lt!263314) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!53859 lt!263314) #b01111111111111111111111111111110) (bvslt (x!53859 lt!263314) #b00000000000000000000000000000000) (not (= lt!263321 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!17242 a!3118) i!1132 k0!1914) (index!24817 lt!263314)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!263311 lt!263315))))))

(declare-fun lt!263323 () SeekEntryResult!5647)

(declare-fun lt!263320 () SeekEntryResult!5647)

(assert (=> b!575795 (= lt!263323 lt!263320)))

(declare-fun lt!263310 () (_ BitVec 64))

(declare-fun lt!263317 () array!35922)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35922 (_ BitVec 32)) SeekEntryResult!5647)

(assert (=> b!575795 (= lt!263320 (seekKeyOrZeroReturnVacant!0 (x!53859 lt!263314) (index!24817 lt!263314) (index!24817 lt!263314) lt!263310 lt!263317 mask!3119))))

(assert (=> b!575795 (= lt!263323 (seekEntryOrOpen!0 lt!263310 lt!263317 mask!3119))))

(assert (=> b!575795 (= lt!263312 lt!263311)))

(assert (=> b!575795 (= lt!263311 (seekKeyOrZeroReturnVacant!0 (x!53859 lt!263314) (index!24817 lt!263314) (index!24817 lt!263314) (select (arr!17242 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!575796 () Bool)

(declare-fun res!364102 () Bool)

(assert (=> b!575796 (=> (not res!364102) (not e!331315))))

(assert (=> b!575796 (= res!364102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!364105 () Bool)

(assert (=> start!52830 (=> (not res!364105) (not e!331317))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52830 (= res!364105 (validMask!0 mask!3119))))

(assert (=> start!52830 e!331317))

(assert (=> start!52830 true))

(declare-fun array_inv!13101 (array!35922) Bool)

(assert (=> start!52830 (array_inv!13101 a!3118)))

(declare-fun b!575797 () Bool)

(declare-fun res!364106 () Bool)

(assert (=> b!575797 (=> (not res!364106) (not e!331317))))

(declare-fun arrayContainsKey!0 (array!35922 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!575797 (= res!364106 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!575798 () Bool)

(assert (=> b!575798 (= e!331315 e!331316)))

(declare-fun res!364104 () Bool)

(assert (=> b!575798 (=> (not res!364104) (not e!331316))))

(declare-fun lt!263313 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35922 (_ BitVec 32)) SeekEntryResult!5647)

(assert (=> b!575798 (= res!364104 (= lt!263314 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263313 lt!263310 lt!263317 mask!3119)))))

(declare-fun lt!263318 () (_ BitVec 32))

(assert (=> b!575798 (= lt!263314 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263318 (select (arr!17242 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!575798 (= lt!263313 (toIndex!0 lt!263310 mask!3119))))

(assert (=> b!575798 (= lt!263310 (select (store (arr!17242 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!575798 (= lt!263318 (toIndex!0 (select (arr!17242 a!3118) j!142) mask!3119))))

(assert (=> b!575798 (= lt!263317 (array!35923 (store (arr!17242 a!3118) i!1132 k0!1914) (size!17606 a!3118)))))

(declare-fun b!575799 () Bool)

(declare-fun res!364111 () Bool)

(assert (=> b!575799 (=> (not res!364111) (not e!331317))))

(assert (=> b!575799 (= res!364111 (and (= (size!17606 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17606 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17606 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!575800 () Bool)

(assert (=> b!575800 (= e!331318 true)))

(assert (=> b!575800 (= lt!263311 lt!263320)))

(declare-fun lt!263316 () Unit!18067)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35922 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18067)

(assert (=> b!575800 (= lt!263316 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k0!1914 j!142 (x!53859 lt!263314) (index!24817 lt!263314) (index!24817 lt!263314) mask!3119))))

(assert (= (and start!52830 res!364105) b!575799))

(assert (= (and b!575799 res!364111) b!575791))

(assert (= (and b!575791 res!364101) b!575794))

(assert (= (and b!575794 res!364110) b!575797))

(assert (= (and b!575797 res!364106) b!575793))

(assert (= (and b!575793 res!364108) b!575796))

(assert (= (and b!575796 res!364102) b!575792))

(assert (= (and b!575792 res!364103) b!575798))

(assert (= (and b!575798 res!364104) b!575789))

(assert (= (and b!575789 (not res!364109)) b!575790))

(assert (= (and b!575790 (not res!364100)) b!575795))

(assert (= (and b!575795 (not res!364107)) b!575800))

(declare-fun m!554831 () Bool)

(assert (=> b!575796 m!554831))

(declare-fun m!554833 () Bool)

(assert (=> start!52830 m!554833))

(declare-fun m!554835 () Bool)

(assert (=> start!52830 m!554835))

(declare-fun m!554837 () Bool)

(assert (=> b!575795 m!554837))

(declare-fun m!554839 () Bool)

(assert (=> b!575795 m!554839))

(declare-fun m!554841 () Bool)

(assert (=> b!575795 m!554841))

(declare-fun m!554843 () Bool)

(assert (=> b!575795 m!554843))

(declare-fun m!554845 () Bool)

(assert (=> b!575795 m!554845))

(assert (=> b!575795 m!554837))

(declare-fun m!554847 () Bool)

(assert (=> b!575795 m!554847))

(declare-fun m!554849 () Bool)

(assert (=> b!575797 m!554849))

(declare-fun m!554851 () Bool)

(assert (=> b!575792 m!554851))

(assert (=> b!575791 m!554837))

(assert (=> b!575791 m!554837))

(declare-fun m!554853 () Bool)

(assert (=> b!575791 m!554853))

(assert (=> b!575789 m!554837))

(assert (=> b!575789 m!554837))

(declare-fun m!554855 () Bool)

(assert (=> b!575789 m!554855))

(declare-fun m!554857 () Bool)

(assert (=> b!575789 m!554857))

(declare-fun m!554859 () Bool)

(assert (=> b!575789 m!554859))

(declare-fun m!554861 () Bool)

(assert (=> b!575793 m!554861))

(declare-fun m!554863 () Bool)

(assert (=> b!575794 m!554863))

(declare-fun m!554865 () Bool)

(assert (=> b!575800 m!554865))

(assert (=> b!575790 m!554837))

(declare-fun m!554867 () Bool)

(assert (=> b!575790 m!554867))

(assert (=> b!575798 m!554837))

(declare-fun m!554869 () Bool)

(assert (=> b!575798 m!554869))

(assert (=> b!575798 m!554837))

(declare-fun m!554871 () Bool)

(assert (=> b!575798 m!554871))

(declare-fun m!554873 () Bool)

(assert (=> b!575798 m!554873))

(declare-fun m!554875 () Bool)

(assert (=> b!575798 m!554875))

(assert (=> b!575798 m!554841))

(assert (=> b!575798 m!554837))

(declare-fun m!554877 () Bool)

(assert (=> b!575798 m!554877))

(check-sat (not b!575795) (not b!575798) (not b!575796) (not b!575797) (not b!575789) (not b!575800) (not start!52830) (not b!575793) (not b!575791) (not b!575792) (not b!575794))
(check-sat)
