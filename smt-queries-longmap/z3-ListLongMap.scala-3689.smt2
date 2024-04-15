; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50738 () Bool)

(assert start!50738)

(declare-fun b!554846 () Bool)

(declare-fun res!347404 () Bool)

(declare-fun e!319820 () Bool)

(assert (=> b!554846 (=> (not res!347404) (not e!319820))))

(declare-datatypes ((array!34972 0))(
  ( (array!34973 (arr!16796 (Array (_ BitVec 32) (_ BitVec 64))) (size!17161 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34972)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34972 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554846 (= res!347404 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!554847 () Bool)

(declare-fun e!319818 () Bool)

(declare-fun e!319821 () Bool)

(assert (=> b!554847 (= e!319818 e!319821)))

(declare-fun res!347406 () Bool)

(assert (=> b!554847 (=> (not res!347406) (not e!319821))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5242 0))(
  ( (MissingZero!5242 (index!23195 (_ BitVec 32))) (Found!5242 (index!23196 (_ BitVec 32))) (Intermediate!5242 (undefined!6054 Bool) (index!23197 (_ BitVec 32)) (x!52111 (_ BitVec 32))) (Undefined!5242) (MissingVacant!5242 (index!23198 (_ BitVec 32))) )
))
(declare-fun lt!251971 () SeekEntryResult!5242)

(declare-fun lt!251967 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34972 (_ BitVec 32)) SeekEntryResult!5242)

(assert (=> b!554847 (= res!347406 (= lt!251971 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251967 (select (store (arr!16796 a!3118) i!1132 k0!1914) j!142) (array!34973 (store (arr!16796 a!3118) i!1132 k0!1914) (size!17161 a!3118)) mask!3119)))))

(declare-fun lt!251969 () (_ BitVec 32))

(assert (=> b!554847 (= lt!251971 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251969 (select (arr!16796 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554847 (= lt!251967 (toIndex!0 (select (store (arr!16796 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!554847 (= lt!251969 (toIndex!0 (select (arr!16796 a!3118) j!142) mask!3119))))

(declare-fun b!554848 () Bool)

(declare-fun res!347407 () Bool)

(assert (=> b!554848 (=> (not res!347407) (not e!319818))))

(declare-datatypes ((List!10915 0))(
  ( (Nil!10912) (Cons!10911 (h!11896 (_ BitVec 64)) (t!17134 List!10915)) )
))
(declare-fun arrayNoDuplicates!0 (array!34972 (_ BitVec 32) List!10915) Bool)

(assert (=> b!554848 (= res!347407 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10912))))

(declare-fun b!554849 () Bool)

(declare-fun res!347400 () Bool)

(assert (=> b!554849 (=> (not res!347400) (not e!319818))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34972 (_ BitVec 32)) Bool)

(assert (=> b!554849 (= res!347400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!347402 () Bool)

(assert (=> start!50738 (=> (not res!347402) (not e!319820))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50738 (= res!347402 (validMask!0 mask!3119))))

(assert (=> start!50738 e!319820))

(assert (=> start!50738 true))

(declare-fun array_inv!12679 (array!34972) Bool)

(assert (=> start!50738 (array_inv!12679 a!3118)))

(declare-fun b!554850 () Bool)

(declare-fun res!347405 () Bool)

(assert (=> b!554850 (=> (not res!347405) (not e!319820))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554850 (= res!347405 (validKeyInArray!0 k0!1914))))

(declare-fun b!554851 () Bool)

(assert (=> b!554851 (= e!319821 (not true))))

(declare-fun lt!251968 () SeekEntryResult!5242)

(get-info :version)

(assert (=> b!554851 (and (= lt!251968 (Found!5242 j!142)) (or (undefined!6054 lt!251971) (not ((_ is Intermediate!5242) lt!251971)) (= (select (arr!16796 a!3118) (index!23197 lt!251971)) (select (arr!16796 a!3118) j!142)) (not (= (select (arr!16796 a!3118) (index!23197 lt!251971)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!251968 (MissingZero!5242 (index!23197 lt!251971)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34972 (_ BitVec 32)) SeekEntryResult!5242)

(assert (=> b!554851 (= lt!251968 (seekEntryOrOpen!0 (select (arr!16796 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!554851 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17244 0))(
  ( (Unit!17245) )
))
(declare-fun lt!251966 () Unit!17244)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34972 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17244)

(assert (=> b!554851 (= lt!251966 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554852 () Bool)

(declare-fun res!347408 () Bool)

(assert (=> b!554852 (=> (not res!347408) (not e!319820))))

(assert (=> b!554852 (= res!347408 (and (= (size!17161 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17161 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17161 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!554853 () Bool)

(declare-fun res!347401 () Bool)

(assert (=> b!554853 (=> (not res!347401) (not e!319820))))

(assert (=> b!554853 (= res!347401 (validKeyInArray!0 (select (arr!16796 a!3118) j!142)))))

(declare-fun b!554854 () Bool)

(assert (=> b!554854 (= e!319820 e!319818)))

(declare-fun res!347403 () Bool)

(assert (=> b!554854 (=> (not res!347403) (not e!319818))))

(declare-fun lt!251970 () SeekEntryResult!5242)

(assert (=> b!554854 (= res!347403 (or (= lt!251970 (MissingZero!5242 i!1132)) (= lt!251970 (MissingVacant!5242 i!1132))))))

(assert (=> b!554854 (= lt!251970 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!50738 res!347402) b!554852))

(assert (= (and b!554852 res!347408) b!554853))

(assert (= (and b!554853 res!347401) b!554850))

(assert (= (and b!554850 res!347405) b!554846))

(assert (= (and b!554846 res!347404) b!554854))

(assert (= (and b!554854 res!347403) b!554849))

(assert (= (and b!554849 res!347400) b!554848))

(assert (= (and b!554848 res!347407) b!554847))

(assert (= (and b!554847 res!347406) b!554851))

(declare-fun m!531899 () Bool)

(assert (=> b!554848 m!531899))

(declare-fun m!531901 () Bool)

(assert (=> b!554851 m!531901))

(declare-fun m!531903 () Bool)

(assert (=> b!554851 m!531903))

(declare-fun m!531905 () Bool)

(assert (=> b!554851 m!531905))

(declare-fun m!531907 () Bool)

(assert (=> b!554851 m!531907))

(assert (=> b!554851 m!531903))

(declare-fun m!531909 () Bool)

(assert (=> b!554851 m!531909))

(assert (=> b!554847 m!531903))

(declare-fun m!531911 () Bool)

(assert (=> b!554847 m!531911))

(assert (=> b!554847 m!531903))

(declare-fun m!531913 () Bool)

(assert (=> b!554847 m!531913))

(assert (=> b!554847 m!531903))

(declare-fun m!531915 () Bool)

(assert (=> b!554847 m!531915))

(declare-fun m!531917 () Bool)

(assert (=> b!554847 m!531917))

(assert (=> b!554847 m!531913))

(declare-fun m!531919 () Bool)

(assert (=> b!554847 m!531919))

(assert (=> b!554847 m!531913))

(declare-fun m!531921 () Bool)

(assert (=> b!554847 m!531921))

(assert (=> b!554853 m!531903))

(assert (=> b!554853 m!531903))

(declare-fun m!531923 () Bool)

(assert (=> b!554853 m!531923))

(declare-fun m!531925 () Bool)

(assert (=> b!554849 m!531925))

(declare-fun m!531927 () Bool)

(assert (=> b!554846 m!531927))

(declare-fun m!531929 () Bool)

(assert (=> b!554854 m!531929))

(declare-fun m!531931 () Bool)

(assert (=> start!50738 m!531931))

(declare-fun m!531933 () Bool)

(assert (=> start!50738 m!531933))

(declare-fun m!531935 () Bool)

(assert (=> b!554850 m!531935))

(check-sat (not b!554849) (not b!554847) (not b!554848) (not b!554853) (not b!554850) (not b!554846) (not b!554854) (not start!50738) (not b!554851))
(check-sat)
