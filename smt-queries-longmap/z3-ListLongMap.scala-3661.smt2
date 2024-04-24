; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50628 () Bool)

(assert start!50628)

(declare-fun b!552837 () Bool)

(declare-fun res!345154 () Bool)

(declare-fun e!319021 () Bool)

(assert (=> b!552837 (=> (not res!345154) (not e!319021))))

(declare-datatypes ((array!34800 0))(
  ( (array!34801 (arr!16708 (Array (_ BitVec 32) (_ BitVec 64))) (size!17072 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34800)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34800 (_ BitVec 32)) Bool)

(assert (=> b!552837 (= res!345154 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!552838 () Bool)

(declare-fun res!345150 () Bool)

(declare-fun e!319019 () Bool)

(assert (=> b!552838 (=> (not res!345150) (not e!319019))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34800 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!552838 (= res!345150 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!552839 () Bool)

(declare-fun res!345149 () Bool)

(assert (=> b!552839 (=> (not res!345149) (not e!319019))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!552839 (= res!345149 (validKeyInArray!0 k0!1914))))

(declare-fun b!552840 () Bool)

(declare-fun e!319020 () Bool)

(declare-fun e!319018 () Bool)

(assert (=> b!552840 (= e!319020 (not e!319018))))

(declare-fun res!345151 () Bool)

(assert (=> b!552840 (=> res!345151 e!319018)))

(declare-fun lt!251346 () (_ BitVec 32))

(assert (=> b!552840 (= res!345151 (or (bvslt mask!3119 #b00000000000000000000000000000000) (bvslt lt!251346 #b00000000000000000000000000000000) (bvsge lt!251346 (bvadd #b00000000000000000000000000000001 mask!3119))))))

(declare-fun e!319023 () Bool)

(assert (=> b!552840 e!319023))

(declare-fun res!345148 () Bool)

(assert (=> b!552840 (=> (not res!345148) (not e!319023))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!552840 (= res!345148 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17071 0))(
  ( (Unit!17072) )
))
(declare-fun lt!251345 () Unit!17071)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34800 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17071)

(assert (=> b!552840 (= lt!251345 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!552842 () Bool)

(declare-datatypes ((SeekEntryResult!5113 0))(
  ( (MissingZero!5113 (index!22679 (_ BitVec 32))) (Found!5113 (index!22680 (_ BitVec 32))) (Intermediate!5113 (undefined!5925 Bool) (index!22681 (_ BitVec 32)) (x!51766 (_ BitVec 32))) (Undefined!5113) (MissingVacant!5113 (index!22682 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34800 (_ BitVec 32)) SeekEntryResult!5113)

(assert (=> b!552842 (= e!319023 (= (seekEntryOrOpen!0 (select (arr!16708 a!3118) j!142) a!3118 mask!3119) (Found!5113 j!142)))))

(declare-fun b!552843 () Bool)

(declare-fun res!345146 () Bool)

(assert (=> b!552843 (=> (not res!345146) (not e!319019))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!552843 (= res!345146 (and (= (size!17072 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17072 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17072 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!552844 () Bool)

(assert (=> b!552844 (= e!319019 e!319021)))

(declare-fun res!345144 () Bool)

(assert (=> b!552844 (=> (not res!345144) (not e!319021))))

(declare-fun lt!251347 () SeekEntryResult!5113)

(assert (=> b!552844 (= res!345144 (or (= lt!251347 (MissingZero!5113 i!1132)) (= lt!251347 (MissingVacant!5113 i!1132))))))

(assert (=> b!552844 (= lt!251347 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!552845 () Bool)

(assert (=> b!552845 (= e!319021 e!319020)))

(declare-fun res!345145 () Bool)

(assert (=> b!552845 (=> (not res!345145) (not e!319020))))

(declare-fun lt!251344 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34800 (_ BitVec 32)) SeekEntryResult!5113)

(assert (=> b!552845 (= res!345145 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251344 (select (arr!16708 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251346 (select (store (arr!16708 a!3118) i!1132 k0!1914) j!142) (array!34801 (store (arr!16708 a!3118) i!1132 k0!1914) (size!17072 a!3118)) mask!3119)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!552845 (= lt!251346 (toIndex!0 (select (store (arr!16708 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!552845 (= lt!251344 (toIndex!0 (select (arr!16708 a!3118) j!142) mask!3119))))

(declare-fun b!552846 () Bool)

(declare-fun res!345153 () Bool)

(assert (=> b!552846 (=> (not res!345153) (not e!319019))))

(assert (=> b!552846 (= res!345153 (validKeyInArray!0 (select (arr!16708 a!3118) j!142)))))

(declare-fun b!552847 () Bool)

(assert (=> b!552847 (= e!319018 (validKeyInArray!0 (select (store (arr!16708 a!3118) i!1132 k0!1914) j!142)))))

(declare-fun res!345152 () Bool)

(assert (=> start!50628 (=> (not res!345152) (not e!319019))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50628 (= res!345152 (validMask!0 mask!3119))))

(assert (=> start!50628 e!319019))

(assert (=> start!50628 true))

(declare-fun array_inv!12567 (array!34800) Bool)

(assert (=> start!50628 (array_inv!12567 a!3118)))

(declare-fun b!552841 () Bool)

(declare-fun res!345147 () Bool)

(assert (=> b!552841 (=> (not res!345147) (not e!319021))))

(declare-datatypes ((List!10695 0))(
  ( (Nil!10692) (Cons!10691 (h!11679 (_ BitVec 64)) (t!16915 List!10695)) )
))
(declare-fun arrayNoDuplicates!0 (array!34800 (_ BitVec 32) List!10695) Bool)

(assert (=> b!552841 (= res!345147 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10692))))

(assert (= (and start!50628 res!345152) b!552843))

(assert (= (and b!552843 res!345146) b!552846))

(assert (= (and b!552846 res!345153) b!552839))

(assert (= (and b!552839 res!345149) b!552838))

(assert (= (and b!552838 res!345150) b!552844))

(assert (= (and b!552844 res!345144) b!552837))

(assert (= (and b!552837 res!345154) b!552841))

(assert (= (and b!552841 res!345147) b!552845))

(assert (= (and b!552845 res!345145) b!552840))

(assert (= (and b!552840 res!345148) b!552842))

(assert (= (and b!552840 (not res!345151)) b!552847))

(declare-fun m!529901 () Bool)

(assert (=> start!50628 m!529901))

(declare-fun m!529903 () Bool)

(assert (=> start!50628 m!529903))

(declare-fun m!529905 () Bool)

(assert (=> b!552837 m!529905))

(declare-fun m!529907 () Bool)

(assert (=> b!552841 m!529907))

(declare-fun m!529909 () Bool)

(assert (=> b!552840 m!529909))

(declare-fun m!529911 () Bool)

(assert (=> b!552840 m!529911))

(declare-fun m!529913 () Bool)

(assert (=> b!552846 m!529913))

(assert (=> b!552846 m!529913))

(declare-fun m!529915 () Bool)

(assert (=> b!552846 m!529915))

(assert (=> b!552845 m!529913))

(declare-fun m!529917 () Bool)

(assert (=> b!552845 m!529917))

(assert (=> b!552845 m!529913))

(assert (=> b!552845 m!529913))

(declare-fun m!529919 () Bool)

(assert (=> b!552845 m!529919))

(declare-fun m!529921 () Bool)

(assert (=> b!552845 m!529921))

(declare-fun m!529923 () Bool)

(assert (=> b!552845 m!529923))

(declare-fun m!529925 () Bool)

(assert (=> b!552845 m!529925))

(assert (=> b!552845 m!529923))

(declare-fun m!529927 () Bool)

(assert (=> b!552845 m!529927))

(assert (=> b!552845 m!529923))

(declare-fun m!529929 () Bool)

(assert (=> b!552839 m!529929))

(assert (=> b!552847 m!529921))

(assert (=> b!552847 m!529923))

(assert (=> b!552847 m!529923))

(declare-fun m!529931 () Bool)

(assert (=> b!552847 m!529931))

(assert (=> b!552842 m!529913))

(assert (=> b!552842 m!529913))

(declare-fun m!529933 () Bool)

(assert (=> b!552842 m!529933))

(declare-fun m!529935 () Bool)

(assert (=> b!552844 m!529935))

(declare-fun m!529937 () Bool)

(assert (=> b!552838 m!529937))

(check-sat (not b!552846) (not b!552839) (not b!552840) (not b!552847) (not b!552845) (not b!552841) (not start!50628) (not b!552844) (not b!552838) (not b!552842) (not b!552837))
(check-sat)
