; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51878 () Bool)

(assert start!51878)

(declare-fun b!566872 () Bool)

(declare-fun res!357600 () Bool)

(declare-fun e!326229 () Bool)

(assert (=> b!566872 (=> (not res!357600) (not e!326229))))

(declare-datatypes ((array!35581 0))(
  ( (array!35582 (arr!17087 (Array (_ BitVec 32) (_ BitVec 64))) (size!17452 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35581)

(declare-datatypes ((List!11206 0))(
  ( (Nil!11203) (Cons!11202 (h!12214 (_ BitVec 64)) (t!17425 List!11206)) )
))
(declare-fun arrayNoDuplicates!0 (array!35581 (_ BitVec 32) List!11206) Bool)

(assert (=> b!566872 (= res!357600 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11203))))

(declare-fun b!566873 () Bool)

(declare-fun res!357608 () Bool)

(declare-fun e!326227 () Bool)

(assert (=> b!566873 (=> (not res!357608) (not e!326227))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!566873 (= res!357608 (and (= (size!17452 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17452 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17452 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!566874 () Bool)

(assert (=> b!566874 (= e!326227 e!326229)))

(declare-fun res!357603 () Bool)

(assert (=> b!566874 (=> (not res!357603) (not e!326229))))

(declare-datatypes ((SeekEntryResult!5533 0))(
  ( (MissingZero!5533 (index!24359 (_ BitVec 32))) (Found!5533 (index!24360 (_ BitVec 32))) (Intermediate!5533 (undefined!6345 Bool) (index!24361 (_ BitVec 32)) (x!53241 (_ BitVec 32))) (Undefined!5533) (MissingVacant!5533 (index!24362 (_ BitVec 32))) )
))
(declare-fun lt!258222 () SeekEntryResult!5533)

(assert (=> b!566874 (= res!357603 (or (= lt!258222 (MissingZero!5533 i!1132)) (= lt!258222 (MissingVacant!5533 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35581 (_ BitVec 32)) SeekEntryResult!5533)

(assert (=> b!566874 (= lt!258222 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun e!326226 () Bool)

(declare-fun b!566875 () Bool)

(assert (=> b!566875 (= e!326226 (= (seekEntryOrOpen!0 (select (arr!17087 a!3118) j!142) a!3118 mask!3119) (Found!5533 j!142)))))

(declare-fun b!566876 () Bool)

(declare-fun res!357605 () Bool)

(assert (=> b!566876 (=> (not res!357605) (not e!326227))))

(declare-fun arrayContainsKey!0 (array!35581 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!566876 (= res!357605 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!566877 () Bool)

(assert (=> b!566877 (= e!326229 (not true))))

(assert (=> b!566877 e!326226))

(declare-fun res!357601 () Bool)

(assert (=> b!566877 (=> (not res!357601) (not e!326226))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35581 (_ BitVec 32)) Bool)

(assert (=> b!566877 (= res!357601 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17754 0))(
  ( (Unit!17755) )
))
(declare-fun lt!258223 () Unit!17754)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35581 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17754)

(assert (=> b!566877 (= lt!258223 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!566878 () Bool)

(declare-fun res!357604 () Bool)

(assert (=> b!566878 (=> (not res!357604) (not e!326227))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!566878 (= res!357604 (validKeyInArray!0 k0!1914))))

(declare-fun b!566879 () Bool)

(declare-fun res!357606 () Bool)

(assert (=> b!566879 (=> (not res!357606) (not e!326229))))

(assert (=> b!566879 (= res!357606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!566880 () Bool)

(declare-fun res!357599 () Bool)

(assert (=> b!566880 (=> (not res!357599) (not e!326229))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35581 (_ BitVec 32)) SeekEntryResult!5533)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!566880 (= res!357599 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17087 a!3118) j!142) mask!3119) (select (arr!17087 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17087 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17087 a!3118) i!1132 k0!1914) j!142) (array!35582 (store (arr!17087 a!3118) i!1132 k0!1914) (size!17452 a!3118)) mask!3119)))))

(declare-fun res!357602 () Bool)

(assert (=> start!51878 (=> (not res!357602) (not e!326227))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51878 (= res!357602 (validMask!0 mask!3119))))

(assert (=> start!51878 e!326227))

(assert (=> start!51878 true))

(declare-fun array_inv!12970 (array!35581) Bool)

(assert (=> start!51878 (array_inv!12970 a!3118)))

(declare-fun b!566881 () Bool)

(declare-fun res!357607 () Bool)

(assert (=> b!566881 (=> (not res!357607) (not e!326227))))

(assert (=> b!566881 (= res!357607 (validKeyInArray!0 (select (arr!17087 a!3118) j!142)))))

(assert (= (and start!51878 res!357602) b!566873))

(assert (= (and b!566873 res!357608) b!566881))

(assert (= (and b!566881 res!357607) b!566878))

(assert (= (and b!566878 res!357604) b!566876))

(assert (= (and b!566876 res!357605) b!566874))

(assert (= (and b!566874 res!357603) b!566879))

(assert (= (and b!566879 res!357606) b!566872))

(assert (= (and b!566872 res!357600) b!566880))

(assert (= (and b!566880 res!357599) b!566877))

(assert (= (and b!566877 res!357601) b!566875))

(declare-fun m!544901 () Bool)

(assert (=> start!51878 m!544901))

(declare-fun m!544903 () Bool)

(assert (=> start!51878 m!544903))

(declare-fun m!544905 () Bool)

(assert (=> b!566877 m!544905))

(declare-fun m!544907 () Bool)

(assert (=> b!566877 m!544907))

(declare-fun m!544909 () Bool)

(assert (=> b!566874 m!544909))

(declare-fun m!544911 () Bool)

(assert (=> b!566878 m!544911))

(declare-fun m!544913 () Bool)

(assert (=> b!566872 m!544913))

(declare-fun m!544915 () Bool)

(assert (=> b!566876 m!544915))

(declare-fun m!544917 () Bool)

(assert (=> b!566881 m!544917))

(assert (=> b!566881 m!544917))

(declare-fun m!544919 () Bool)

(assert (=> b!566881 m!544919))

(assert (=> b!566875 m!544917))

(assert (=> b!566875 m!544917))

(declare-fun m!544921 () Bool)

(assert (=> b!566875 m!544921))

(assert (=> b!566880 m!544917))

(declare-fun m!544923 () Bool)

(assert (=> b!566880 m!544923))

(assert (=> b!566880 m!544917))

(declare-fun m!544925 () Bool)

(assert (=> b!566880 m!544925))

(declare-fun m!544927 () Bool)

(assert (=> b!566880 m!544927))

(assert (=> b!566880 m!544925))

(declare-fun m!544929 () Bool)

(assert (=> b!566880 m!544929))

(assert (=> b!566880 m!544923))

(assert (=> b!566880 m!544917))

(declare-fun m!544931 () Bool)

(assert (=> b!566880 m!544931))

(declare-fun m!544933 () Bool)

(assert (=> b!566880 m!544933))

(assert (=> b!566880 m!544925))

(assert (=> b!566880 m!544927))

(declare-fun m!544935 () Bool)

(assert (=> b!566879 m!544935))

(check-sat (not b!566872) (not b!566874) (not b!566875) (not b!566878) (not b!566879) (not b!566876) (not b!566877) (not start!51878) (not b!566881) (not b!566880))
(check-sat)
