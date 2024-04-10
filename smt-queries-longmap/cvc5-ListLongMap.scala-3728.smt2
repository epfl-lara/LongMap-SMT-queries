; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51362 () Bool)

(assert start!51362)

(declare-fun b!560750 () Bool)

(declare-fun res!351904 () Bool)

(declare-fun e!323099 () Bool)

(assert (=> b!560750 (=> (not res!351904) (not e!323099))))

(declare-datatypes ((array!35227 0))(
  ( (array!35228 (arr!16914 (Array (_ BitVec 32) (_ BitVec 64))) (size!17278 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35227)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35227 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!560750 (= res!351904 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!560751 () Bool)

(declare-fun res!351909 () Bool)

(assert (=> b!560751 (=> (not res!351909) (not e!323099))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!560751 (= res!351909 (validKeyInArray!0 (select (arr!16914 a!3118) j!142)))))

(declare-fun b!560752 () Bool)

(declare-fun e!323096 () Bool)

(declare-fun e!323101 () Bool)

(assert (=> b!560752 (= e!323096 e!323101)))

(declare-fun res!351911 () Bool)

(assert (=> b!560752 (=> (not res!351911) (not e!323101))))

(declare-fun lt!255033 () (_ BitVec 64))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5363 0))(
  ( (MissingZero!5363 (index!23679 (_ BitVec 32))) (Found!5363 (index!23680 (_ BitVec 32))) (Intermediate!5363 (undefined!6175 Bool) (index!23681 (_ BitVec 32)) (x!52594 (_ BitVec 32))) (Undefined!5363) (MissingVacant!5363 (index!23682 (_ BitVec 32))) )
))
(declare-fun lt!255038 () SeekEntryResult!5363)

(declare-fun lt!255032 () (_ BitVec 32))

(declare-fun lt!255034 () array!35227)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35227 (_ BitVec 32)) SeekEntryResult!5363)

(assert (=> b!560752 (= res!351911 (= lt!255038 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255032 lt!255033 lt!255034 mask!3119)))))

(declare-fun lt!255039 () (_ BitVec 32))

(assert (=> b!560752 (= lt!255038 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255039 (select (arr!16914 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!560752 (= lt!255032 (toIndex!0 lt!255033 mask!3119))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!560752 (= lt!255033 (select (store (arr!16914 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!560752 (= lt!255039 (toIndex!0 (select (arr!16914 a!3118) j!142) mask!3119))))

(assert (=> b!560752 (= lt!255034 (array!35228 (store (arr!16914 a!3118) i!1132 k!1914) (size!17278 a!3118)))))

(declare-fun b!560753 () Bool)

(declare-fun e!323102 () Bool)

(declare-fun e!323100 () Bool)

(assert (=> b!560753 (= e!323102 e!323100)))

(declare-fun res!351910 () Bool)

(assert (=> b!560753 (=> (not res!351910) (not e!323100))))

(declare-fun lt!255035 () SeekEntryResult!5363)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35227 (_ BitVec 32)) SeekEntryResult!5363)

(assert (=> b!560753 (= res!351910 (= lt!255035 (seekKeyOrZeroReturnVacant!0 (x!52594 lt!255038) (index!23681 lt!255038) (index!23681 lt!255038) (select (arr!16914 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!560754 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35227 (_ BitVec 32)) SeekEntryResult!5363)

(assert (=> b!560754 (= e!323100 (= (seekEntryOrOpen!0 lt!255033 lt!255034 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52594 lt!255038) (index!23681 lt!255038) (index!23681 lt!255038) lt!255033 lt!255034 mask!3119)))))

(declare-fun b!560755 () Bool)

(declare-fun e!323103 () Bool)

(assert (=> b!560755 (= e!323103 e!323102)))

(declare-fun res!351907 () Bool)

(assert (=> b!560755 (=> res!351907 e!323102)))

(declare-fun lt!255040 () (_ BitVec 64))

(assert (=> b!560755 (= res!351907 (or (= lt!255040 (select (arr!16914 a!3118) j!142)) (= lt!255040 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!560755 (= lt!255040 (select (arr!16914 a!3118) (index!23681 lt!255038)))))

(declare-fun b!560756 () Bool)

(assert (=> b!560756 (= e!323101 (not true))))

(declare-fun e!323097 () Bool)

(assert (=> b!560756 e!323097))

(declare-fun res!351906 () Bool)

(assert (=> b!560756 (=> (not res!351906) (not e!323097))))

(assert (=> b!560756 (= res!351906 (= lt!255035 (Found!5363 j!142)))))

(assert (=> b!560756 (= lt!255035 (seekEntryOrOpen!0 (select (arr!16914 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35227 (_ BitVec 32)) Bool)

(assert (=> b!560756 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17500 0))(
  ( (Unit!17501) )
))
(declare-fun lt!255037 () Unit!17500)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35227 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17500)

(assert (=> b!560756 (= lt!255037 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!560757 () Bool)

(declare-fun res!351913 () Bool)

(assert (=> b!560757 (=> (not res!351913) (not e!323099))))

(assert (=> b!560757 (= res!351913 (validKeyInArray!0 k!1914))))

(declare-fun b!560758 () Bool)

(assert (=> b!560758 (= e!323099 e!323096)))

(declare-fun res!351905 () Bool)

(assert (=> b!560758 (=> (not res!351905) (not e!323096))))

(declare-fun lt!255036 () SeekEntryResult!5363)

(assert (=> b!560758 (= res!351905 (or (= lt!255036 (MissingZero!5363 i!1132)) (= lt!255036 (MissingVacant!5363 i!1132))))))

(assert (=> b!560758 (= lt!255036 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!560759 () Bool)

(declare-fun res!351903 () Bool)

(assert (=> b!560759 (=> (not res!351903) (not e!323096))))

(declare-datatypes ((List!10994 0))(
  ( (Nil!10991) (Cons!10990 (h!11993 (_ BitVec 64)) (t!17222 List!10994)) )
))
(declare-fun arrayNoDuplicates!0 (array!35227 (_ BitVec 32) List!10994) Bool)

(assert (=> b!560759 (= res!351903 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10991))))

(declare-fun b!560760 () Bool)

(declare-fun res!351912 () Bool)

(assert (=> b!560760 (=> (not res!351912) (not e!323096))))

(assert (=> b!560760 (= res!351912 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!351902 () Bool)

(assert (=> start!51362 (=> (not res!351902) (not e!323099))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51362 (= res!351902 (validMask!0 mask!3119))))

(assert (=> start!51362 e!323099))

(assert (=> start!51362 true))

(declare-fun array_inv!12710 (array!35227) Bool)

(assert (=> start!51362 (array_inv!12710 a!3118)))

(declare-fun b!560761 () Bool)

(assert (=> b!560761 (= e!323097 e!323103)))

(declare-fun res!351908 () Bool)

(assert (=> b!560761 (=> res!351908 e!323103)))

(assert (=> b!560761 (= res!351908 (or (undefined!6175 lt!255038) (not (is-Intermediate!5363 lt!255038))))))

(declare-fun b!560762 () Bool)

(declare-fun res!351914 () Bool)

(assert (=> b!560762 (=> (not res!351914) (not e!323099))))

(assert (=> b!560762 (= res!351914 (and (= (size!17278 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17278 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17278 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!51362 res!351902) b!560762))

(assert (= (and b!560762 res!351914) b!560751))

(assert (= (and b!560751 res!351909) b!560757))

(assert (= (and b!560757 res!351913) b!560750))

(assert (= (and b!560750 res!351904) b!560758))

(assert (= (and b!560758 res!351905) b!560760))

(assert (= (and b!560760 res!351912) b!560759))

(assert (= (and b!560759 res!351903) b!560752))

(assert (= (and b!560752 res!351911) b!560756))

(assert (= (and b!560756 res!351906) b!560761))

(assert (= (and b!560761 (not res!351908)) b!560755))

(assert (= (and b!560755 (not res!351907)) b!560753))

(assert (= (and b!560753 res!351910) b!560754))

(declare-fun m!538557 () Bool)

(assert (=> b!560759 m!538557))

(declare-fun m!538559 () Bool)

(assert (=> b!560750 m!538559))

(declare-fun m!538561 () Bool)

(assert (=> b!560754 m!538561))

(declare-fun m!538563 () Bool)

(assert (=> b!560754 m!538563))

(declare-fun m!538565 () Bool)

(assert (=> b!560751 m!538565))

(assert (=> b!560751 m!538565))

(declare-fun m!538567 () Bool)

(assert (=> b!560751 m!538567))

(assert (=> b!560756 m!538565))

(assert (=> b!560756 m!538565))

(declare-fun m!538569 () Bool)

(assert (=> b!560756 m!538569))

(declare-fun m!538571 () Bool)

(assert (=> b!560756 m!538571))

(declare-fun m!538573 () Bool)

(assert (=> b!560756 m!538573))

(assert (=> b!560752 m!538565))

(declare-fun m!538575 () Bool)

(assert (=> b!560752 m!538575))

(declare-fun m!538577 () Bool)

(assert (=> b!560752 m!538577))

(assert (=> b!560752 m!538565))

(declare-fun m!538579 () Bool)

(assert (=> b!560752 m!538579))

(declare-fun m!538581 () Bool)

(assert (=> b!560752 m!538581))

(assert (=> b!560752 m!538565))

(declare-fun m!538583 () Bool)

(assert (=> b!560752 m!538583))

(declare-fun m!538585 () Bool)

(assert (=> b!560752 m!538585))

(declare-fun m!538587 () Bool)

(assert (=> b!560760 m!538587))

(declare-fun m!538589 () Bool)

(assert (=> start!51362 m!538589))

(declare-fun m!538591 () Bool)

(assert (=> start!51362 m!538591))

(declare-fun m!538593 () Bool)

(assert (=> b!560757 m!538593))

(assert (=> b!560755 m!538565))

(declare-fun m!538595 () Bool)

(assert (=> b!560755 m!538595))

(assert (=> b!560753 m!538565))

(assert (=> b!560753 m!538565))

(declare-fun m!538597 () Bool)

(assert (=> b!560753 m!538597))

(declare-fun m!538599 () Bool)

(assert (=> b!560758 m!538599))

(push 1)

