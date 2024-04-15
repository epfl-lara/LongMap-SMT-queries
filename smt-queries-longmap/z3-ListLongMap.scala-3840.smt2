; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52778 () Bool)

(assert start!52778)

(declare-fun b!575426 () Bool)

(declare-fun e!331079 () Bool)

(declare-datatypes ((SeekEntryResult!5695 0))(
  ( (MissingZero!5695 (index!25007 (_ BitVec 32))) (Found!5695 (index!25008 (_ BitVec 32))) (Intermediate!5695 (undefined!6507 Bool) (index!25009 (_ BitVec 32)) (x!53907 (_ BitVec 32))) (Undefined!5695) (MissingVacant!5695 (index!25010 (_ BitVec 32))) )
))
(declare-fun lt!263101 () SeekEntryResult!5695)

(declare-fun lt!263094 () SeekEntryResult!5695)

(assert (=> b!575426 (= e!331079 (= lt!263101 lt!263094))))

(declare-fun lt!263095 () SeekEntryResult!5695)

(declare-fun lt!263096 () SeekEntryResult!5695)

(assert (=> b!575426 (= lt!263095 lt!263096)))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((Unit!18078 0))(
  ( (Unit!18079) )
))
(declare-fun lt!263100 () Unit!18078)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun lt!263098 () SeekEntryResult!5695)

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35932 0))(
  ( (array!35933 (arr!17249 (Array (_ BitVec 32) (_ BitVec 64))) (size!17614 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35932)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35932 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18078)

(assert (=> b!575426 (= lt!263100 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k0!1914 j!142 (x!53907 lt!263098) (index!25009 lt!263098) (index!25009 lt!263098) mask!3119))))

(declare-fun b!575427 () Bool)

(declare-fun e!331075 () Bool)

(declare-fun e!331078 () Bool)

(assert (=> b!575427 (= e!331075 (not e!331078))))

(declare-fun res!363984 () Bool)

(assert (=> b!575427 (=> res!363984 e!331078)))

(get-info :version)

(assert (=> b!575427 (= res!363984 (or (undefined!6507 lt!263098) (not ((_ is Intermediate!5695) lt!263098))))))

(declare-fun lt!263091 () SeekEntryResult!5695)

(assert (=> b!575427 (= lt!263101 lt!263091)))

(assert (=> b!575427 (= lt!263091 (Found!5695 j!142))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35932 (_ BitVec 32)) SeekEntryResult!5695)

(assert (=> b!575427 (= lt!263101 (seekEntryOrOpen!0 (select (arr!17249 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35932 (_ BitVec 32)) Bool)

(assert (=> b!575427 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!263099 () Unit!18078)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35932 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18078)

(assert (=> b!575427 (= lt!263099 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!575428 () Bool)

(declare-fun res!363993 () Bool)

(declare-fun e!331074 () Bool)

(assert (=> b!575428 (=> (not res!363993) (not e!331074))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!575428 (= res!363993 (validKeyInArray!0 k0!1914))))

(declare-fun b!575429 () Bool)

(declare-fun e!331077 () Bool)

(assert (=> b!575429 (= e!331077 e!331079)))

(declare-fun res!363985 () Bool)

(assert (=> b!575429 (=> res!363985 e!331079)))

(declare-fun lt!263102 () (_ BitVec 64))

(assert (=> b!575429 (= res!363985 (or (bvslt (index!25009 lt!263098) #b00000000000000000000000000000000) (bvsge (index!25009 lt!263098) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!53907 lt!263098) #b01111111111111111111111111111110) (bvslt (x!53907 lt!263098) #b00000000000000000000000000000000) (not (= lt!263102 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!17249 a!3118) i!1132 k0!1914) (index!25009 lt!263098)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!263095 lt!263091))))))

(assert (=> b!575429 (= lt!263094 lt!263096)))

(declare-fun lt!263104 () (_ BitVec 64))

(declare-fun lt!263092 () array!35932)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35932 (_ BitVec 32)) SeekEntryResult!5695)

(assert (=> b!575429 (= lt!263096 (seekKeyOrZeroReturnVacant!0 (x!53907 lt!263098) (index!25009 lt!263098) (index!25009 lt!263098) lt!263104 lt!263092 mask!3119))))

(assert (=> b!575429 (= lt!263094 (seekEntryOrOpen!0 lt!263104 lt!263092 mask!3119))))

(assert (=> b!575429 (= lt!263101 lt!263095)))

(assert (=> b!575429 (= lt!263095 (seekKeyOrZeroReturnVacant!0 (x!53907 lt!263098) (index!25009 lt!263098) (index!25009 lt!263098) (select (arr!17249 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!575430 () Bool)

(declare-fun res!363990 () Bool)

(assert (=> b!575430 (=> (not res!363990) (not e!331074))))

(assert (=> b!575430 (= res!363990 (validKeyInArray!0 (select (arr!17249 a!3118) j!142)))))

(declare-fun b!575431 () Bool)

(declare-fun e!331080 () Bool)

(assert (=> b!575431 (= e!331074 e!331080)))

(declare-fun res!363995 () Bool)

(assert (=> b!575431 (=> (not res!363995) (not e!331080))))

(declare-fun lt!263103 () SeekEntryResult!5695)

(assert (=> b!575431 (= res!363995 (or (= lt!263103 (MissingZero!5695 i!1132)) (= lt!263103 (MissingVacant!5695 i!1132))))))

(assert (=> b!575431 (= lt!263103 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!575432 () Bool)

(declare-fun res!363986 () Bool)

(assert (=> b!575432 (=> (not res!363986) (not e!331074))))

(declare-fun arrayContainsKey!0 (array!35932 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!575432 (= res!363986 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!575433 () Bool)

(declare-fun res!363988 () Bool)

(assert (=> b!575433 (=> (not res!363988) (not e!331074))))

(assert (=> b!575433 (= res!363988 (and (= (size!17614 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17614 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17614 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!575434 () Bool)

(assert (=> b!575434 (= e!331080 e!331075)))

(declare-fun res!363987 () Bool)

(assert (=> b!575434 (=> (not res!363987) (not e!331075))))

(declare-fun lt!263093 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35932 (_ BitVec 32)) SeekEntryResult!5695)

(assert (=> b!575434 (= res!363987 (= lt!263098 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263093 lt!263104 lt!263092 mask!3119)))))

(declare-fun lt!263097 () (_ BitVec 32))

(assert (=> b!575434 (= lt!263098 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263097 (select (arr!17249 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!575434 (= lt!263093 (toIndex!0 lt!263104 mask!3119))))

(assert (=> b!575434 (= lt!263104 (select (store (arr!17249 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!575434 (= lt!263097 (toIndex!0 (select (arr!17249 a!3118) j!142) mask!3119))))

(assert (=> b!575434 (= lt!263092 (array!35933 (store (arr!17249 a!3118) i!1132 k0!1914) (size!17614 a!3118)))))

(declare-fun b!575436 () Bool)

(declare-fun res!363992 () Bool)

(assert (=> b!575436 (=> (not res!363992) (not e!331080))))

(declare-datatypes ((List!11368 0))(
  ( (Nil!11365) (Cons!11364 (h!12403 (_ BitVec 64)) (t!17587 List!11368)) )
))
(declare-fun arrayNoDuplicates!0 (array!35932 (_ BitVec 32) List!11368) Bool)

(assert (=> b!575436 (= res!363992 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11365))))

(declare-fun b!575437 () Bool)

(declare-fun res!363989 () Bool)

(assert (=> b!575437 (=> (not res!363989) (not e!331080))))

(assert (=> b!575437 (= res!363989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!363991 () Bool)

(assert (=> start!52778 (=> (not res!363991) (not e!331074))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52778 (= res!363991 (validMask!0 mask!3119))))

(assert (=> start!52778 e!331074))

(assert (=> start!52778 true))

(declare-fun array_inv!13132 (array!35932) Bool)

(assert (=> start!52778 (array_inv!13132 a!3118)))

(declare-fun b!575435 () Bool)

(assert (=> b!575435 (= e!331078 e!331077)))

(declare-fun res!363994 () Bool)

(assert (=> b!575435 (=> res!363994 e!331077)))

(assert (=> b!575435 (= res!363994 (or (= lt!263102 (select (arr!17249 a!3118) j!142)) (= lt!263102 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!575435 (= lt!263102 (select (arr!17249 a!3118) (index!25009 lt!263098)))))

(assert (= (and start!52778 res!363991) b!575433))

(assert (= (and b!575433 res!363988) b!575430))

(assert (= (and b!575430 res!363990) b!575428))

(assert (= (and b!575428 res!363993) b!575432))

(assert (= (and b!575432 res!363986) b!575431))

(assert (= (and b!575431 res!363995) b!575437))

(assert (= (and b!575437 res!363989) b!575436))

(assert (= (and b!575436 res!363992) b!575434))

(assert (= (and b!575434 res!363987) b!575427))

(assert (= (and b!575427 (not res!363984)) b!575435))

(assert (= (and b!575435 (not res!363994)) b!575429))

(assert (= (and b!575429 (not res!363985)) b!575426))

(declare-fun m!553865 () Bool)

(assert (=> b!575429 m!553865))

(declare-fun m!553867 () Bool)

(assert (=> b!575429 m!553867))

(declare-fun m!553869 () Bool)

(assert (=> b!575429 m!553869))

(declare-fun m!553871 () Bool)

(assert (=> b!575429 m!553871))

(assert (=> b!575429 m!553869))

(declare-fun m!553873 () Bool)

(assert (=> b!575429 m!553873))

(declare-fun m!553875 () Bool)

(assert (=> b!575429 m!553875))

(declare-fun m!553877 () Bool)

(assert (=> b!575426 m!553877))

(assert (=> b!575435 m!553869))

(declare-fun m!553879 () Bool)

(assert (=> b!575435 m!553879))

(declare-fun m!553881 () Bool)

(assert (=> b!575436 m!553881))

(declare-fun m!553883 () Bool)

(assert (=> b!575428 m!553883))

(declare-fun m!553885 () Bool)

(assert (=> b!575432 m!553885))

(declare-fun m!553887 () Bool)

(assert (=> b!575437 m!553887))

(assert (=> b!575427 m!553869))

(assert (=> b!575427 m!553869))

(declare-fun m!553889 () Bool)

(assert (=> b!575427 m!553889))

(declare-fun m!553891 () Bool)

(assert (=> b!575427 m!553891))

(declare-fun m!553893 () Bool)

(assert (=> b!575427 m!553893))

(assert (=> b!575434 m!553869))

(declare-fun m!553895 () Bool)

(assert (=> b!575434 m!553895))

(assert (=> b!575434 m!553869))

(declare-fun m!553897 () Bool)

(assert (=> b!575434 m!553897))

(assert (=> b!575434 m!553869))

(declare-fun m!553899 () Bool)

(assert (=> b!575434 m!553899))

(declare-fun m!553901 () Bool)

(assert (=> b!575434 m!553901))

(assert (=> b!575434 m!553871))

(declare-fun m!553903 () Bool)

(assert (=> b!575434 m!553903))

(assert (=> b!575430 m!553869))

(assert (=> b!575430 m!553869))

(declare-fun m!553905 () Bool)

(assert (=> b!575430 m!553905))

(declare-fun m!553907 () Bool)

(assert (=> b!575431 m!553907))

(declare-fun m!553909 () Bool)

(assert (=> start!52778 m!553909))

(declare-fun m!553911 () Bool)

(assert (=> start!52778 m!553911))

(check-sat (not b!575434) (not b!575427) (not start!52778) (not b!575437) (not b!575436) (not b!575429) (not b!575430) (not b!575426) (not b!575432) (not b!575428) (not b!575431))
(check-sat)
