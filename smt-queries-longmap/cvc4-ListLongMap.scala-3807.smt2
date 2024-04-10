; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52200 () Bool)

(assert start!52200)

(declare-fun b!569867 () Bool)

(declare-fun res!359886 () Bool)

(declare-fun e!327766 () Bool)

(assert (=> b!569867 (=> (not res!359886) (not e!327766))))

(declare-datatypes ((array!35723 0))(
  ( (array!35724 (arr!17153 (Array (_ BitVec 32) (_ BitVec 64))) (size!17517 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35723)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35723 (_ BitVec 32)) Bool)

(assert (=> b!569867 (= res!359886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!569868 () Bool)

(assert (=> b!569868 (= e!327766 (not true))))

(declare-fun e!327768 () Bool)

(assert (=> b!569868 e!327768))

(declare-fun res!359891 () Bool)

(assert (=> b!569868 (=> (not res!359891) (not e!327768))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!569868 (= res!359891 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17906 0))(
  ( (Unit!17907) )
))
(declare-fun lt!259792 () Unit!17906)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35723 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17906)

(assert (=> b!569868 (= lt!259792 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!569870 () Bool)

(declare-datatypes ((SeekEntryResult!5602 0))(
  ( (MissingZero!5602 (index!24635 (_ BitVec 32))) (Found!5602 (index!24636 (_ BitVec 32))) (Intermediate!5602 (undefined!6414 Bool) (index!24637 (_ BitVec 32)) (x!53501 (_ BitVec 32))) (Undefined!5602) (MissingVacant!5602 (index!24638 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35723 (_ BitVec 32)) SeekEntryResult!5602)

(assert (=> b!569870 (= e!327768 (= (seekEntryOrOpen!0 (select (arr!17153 a!3118) j!142) a!3118 mask!3119) (Found!5602 j!142)))))

(declare-fun b!569871 () Bool)

(declare-fun res!359894 () Bool)

(declare-fun e!327765 () Bool)

(assert (=> b!569871 (=> (not res!359894) (not e!327765))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569871 (= res!359894 (validKeyInArray!0 (select (arr!17153 a!3118) j!142)))))

(declare-fun b!569872 () Bool)

(declare-fun res!359890 () Bool)

(assert (=> b!569872 (=> (not res!359890) (not e!327765))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!569872 (= res!359890 (validKeyInArray!0 k!1914))))

(declare-fun b!569873 () Bool)

(assert (=> b!569873 (= e!327765 e!327766)))

(declare-fun res!359892 () Bool)

(assert (=> b!569873 (=> (not res!359892) (not e!327766))))

(declare-fun lt!259791 () SeekEntryResult!5602)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!569873 (= res!359892 (or (= lt!259791 (MissingZero!5602 i!1132)) (= lt!259791 (MissingVacant!5602 i!1132))))))

(assert (=> b!569873 (= lt!259791 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!569874 () Bool)

(declare-fun res!359889 () Bool)

(assert (=> b!569874 (=> (not res!359889) (not e!327765))))

(assert (=> b!569874 (= res!359889 (and (= (size!17517 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17517 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17517 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!569875 () Bool)

(declare-fun res!359888 () Bool)

(assert (=> b!569875 (=> (not res!359888) (not e!327765))))

(declare-fun arrayContainsKey!0 (array!35723 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569875 (= res!359888 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569876 () Bool)

(declare-fun res!359887 () Bool)

(assert (=> b!569876 (=> (not res!359887) (not e!327766))))

(declare-datatypes ((List!11233 0))(
  ( (Nil!11230) (Cons!11229 (h!12250 (_ BitVec 64)) (t!17461 List!11233)) )
))
(declare-fun arrayNoDuplicates!0 (array!35723 (_ BitVec 32) List!11233) Bool)

(assert (=> b!569876 (= res!359887 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11230))))

(declare-fun b!569869 () Bool)

(declare-fun res!359885 () Bool)

(assert (=> b!569869 (=> (not res!359885) (not e!327766))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35723 (_ BitVec 32)) SeekEntryResult!5602)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569869 (= res!359885 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17153 a!3118) j!142) mask!3119) (select (arr!17153 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17153 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17153 a!3118) i!1132 k!1914) j!142) (array!35724 (store (arr!17153 a!3118) i!1132 k!1914) (size!17517 a!3118)) mask!3119)))))

(declare-fun res!359893 () Bool)

(assert (=> start!52200 (=> (not res!359893) (not e!327765))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52200 (= res!359893 (validMask!0 mask!3119))))

(assert (=> start!52200 e!327765))

(assert (=> start!52200 true))

(declare-fun array_inv!12949 (array!35723) Bool)

(assert (=> start!52200 (array_inv!12949 a!3118)))

(assert (= (and start!52200 res!359893) b!569874))

(assert (= (and b!569874 res!359889) b!569871))

(assert (= (and b!569871 res!359894) b!569872))

(assert (= (and b!569872 res!359890) b!569875))

(assert (= (and b!569875 res!359888) b!569873))

(assert (= (and b!569873 res!359892) b!569867))

(assert (= (and b!569867 res!359886) b!569876))

(assert (= (and b!569876 res!359887) b!569869))

(assert (= (and b!569869 res!359885) b!569868))

(assert (= (and b!569868 res!359891) b!569870))

(declare-fun m!548757 () Bool)

(assert (=> b!569867 m!548757))

(declare-fun m!548759 () Bool)

(assert (=> b!569871 m!548759))

(assert (=> b!569871 m!548759))

(declare-fun m!548761 () Bool)

(assert (=> b!569871 m!548761))

(declare-fun m!548763 () Bool)

(assert (=> b!569873 m!548763))

(declare-fun m!548765 () Bool)

(assert (=> b!569876 m!548765))

(declare-fun m!548767 () Bool)

(assert (=> start!52200 m!548767))

(declare-fun m!548769 () Bool)

(assert (=> start!52200 m!548769))

(declare-fun m!548771 () Bool)

(assert (=> b!569872 m!548771))

(declare-fun m!548773 () Bool)

(assert (=> b!569868 m!548773))

(declare-fun m!548775 () Bool)

(assert (=> b!569868 m!548775))

(declare-fun m!548777 () Bool)

(assert (=> b!569875 m!548777))

(assert (=> b!569869 m!548759))

(declare-fun m!548779 () Bool)

(assert (=> b!569869 m!548779))

(assert (=> b!569869 m!548759))

(declare-fun m!548781 () Bool)

(assert (=> b!569869 m!548781))

(declare-fun m!548783 () Bool)

(assert (=> b!569869 m!548783))

(assert (=> b!569869 m!548781))

(declare-fun m!548785 () Bool)

(assert (=> b!569869 m!548785))

(assert (=> b!569869 m!548779))

(assert (=> b!569869 m!548759))

(declare-fun m!548787 () Bool)

(assert (=> b!569869 m!548787))

(declare-fun m!548789 () Bool)

(assert (=> b!569869 m!548789))

(assert (=> b!569869 m!548781))

(assert (=> b!569869 m!548783))

(assert (=> b!569870 m!548759))

(assert (=> b!569870 m!548759))

(declare-fun m!548791 () Bool)

(assert (=> b!569870 m!548791))

(push 1)

(assert (not b!569870))

(assert (not b!569867))

(assert (not b!569876))

(assert (not b!569873))

