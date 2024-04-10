; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52202 () Bool)

(assert start!52202)

(declare-fun res!359921 () Bool)

(declare-fun e!327779 () Bool)

(assert (=> start!52202 (=> (not res!359921) (not e!327779))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52202 (= res!359921 (validMask!0 mask!3119))))

(assert (=> start!52202 e!327779))

(assert (=> start!52202 true))

(declare-datatypes ((array!35725 0))(
  ( (array!35726 (arr!17154 (Array (_ BitVec 32) (_ BitVec 64))) (size!17518 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35725)

(declare-fun array_inv!12950 (array!35725) Bool)

(assert (=> start!52202 (array_inv!12950 a!3118)))

(declare-fun b!569897 () Bool)

(declare-fun e!327777 () Bool)

(assert (=> b!569897 (= e!327777 (not true))))

(declare-fun e!327778 () Bool)

(assert (=> b!569897 e!327778))

(declare-fun res!359917 () Bool)

(assert (=> b!569897 (=> (not res!359917) (not e!327778))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35725 (_ BitVec 32)) Bool)

(assert (=> b!569897 (= res!359917 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17908 0))(
  ( (Unit!17909) )
))
(declare-fun lt!259798 () Unit!17908)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35725 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17908)

(assert (=> b!569897 (= lt!259798 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!569898 () Bool)

(declare-fun res!359919 () Bool)

(assert (=> b!569898 (=> (not res!359919) (not e!327777))))

(declare-datatypes ((List!11234 0))(
  ( (Nil!11231) (Cons!11230 (h!12251 (_ BitVec 64)) (t!17462 List!11234)) )
))
(declare-fun arrayNoDuplicates!0 (array!35725 (_ BitVec 32) List!11234) Bool)

(assert (=> b!569898 (= res!359919 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11231))))

(declare-fun b!569899 () Bool)

(declare-fun res!359922 () Bool)

(assert (=> b!569899 (=> (not res!359922) (not e!327779))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569899 (= res!359922 (validKeyInArray!0 k!1914))))

(declare-fun b!569900 () Bool)

(declare-fun res!359918 () Bool)

(assert (=> b!569900 (=> (not res!359918) (not e!327779))))

(declare-fun arrayContainsKey!0 (array!35725 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569900 (= res!359918 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569901 () Bool)

(declare-fun res!359915 () Bool)

(assert (=> b!569901 (=> (not res!359915) (not e!327777))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5603 0))(
  ( (MissingZero!5603 (index!24639 (_ BitVec 32))) (Found!5603 (index!24640 (_ BitVec 32))) (Intermediate!5603 (undefined!6415 Bool) (index!24641 (_ BitVec 32)) (x!53510 (_ BitVec 32))) (Undefined!5603) (MissingVacant!5603 (index!24642 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35725 (_ BitVec 32)) SeekEntryResult!5603)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569901 (= res!359915 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17154 a!3118) j!142) mask!3119) (select (arr!17154 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17154 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17154 a!3118) i!1132 k!1914) j!142) (array!35726 (store (arr!17154 a!3118) i!1132 k!1914) (size!17518 a!3118)) mask!3119)))))

(declare-fun b!569902 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35725 (_ BitVec 32)) SeekEntryResult!5603)

(assert (=> b!569902 (= e!327778 (= (seekEntryOrOpen!0 (select (arr!17154 a!3118) j!142) a!3118 mask!3119) (Found!5603 j!142)))))

(declare-fun b!569903 () Bool)

(declare-fun res!359920 () Bool)

(assert (=> b!569903 (=> (not res!359920) (not e!327777))))

(assert (=> b!569903 (= res!359920 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!569904 () Bool)

(assert (=> b!569904 (= e!327779 e!327777)))

(declare-fun res!359924 () Bool)

(assert (=> b!569904 (=> (not res!359924) (not e!327777))))

(declare-fun lt!259797 () SeekEntryResult!5603)

(assert (=> b!569904 (= res!359924 (or (= lt!259797 (MissingZero!5603 i!1132)) (= lt!259797 (MissingVacant!5603 i!1132))))))

(assert (=> b!569904 (= lt!259797 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!569905 () Bool)

(declare-fun res!359916 () Bool)

(assert (=> b!569905 (=> (not res!359916) (not e!327779))))

(assert (=> b!569905 (= res!359916 (validKeyInArray!0 (select (arr!17154 a!3118) j!142)))))

(declare-fun b!569906 () Bool)

(declare-fun res!359923 () Bool)

(assert (=> b!569906 (=> (not res!359923) (not e!327779))))

(assert (=> b!569906 (= res!359923 (and (= (size!17518 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17518 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17518 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!52202 res!359921) b!569906))

(assert (= (and b!569906 res!359923) b!569905))

(assert (= (and b!569905 res!359916) b!569899))

(assert (= (and b!569899 res!359922) b!569900))

(assert (= (and b!569900 res!359918) b!569904))

(assert (= (and b!569904 res!359924) b!569903))

(assert (= (and b!569903 res!359920) b!569898))

(assert (= (and b!569898 res!359919) b!569901))

(assert (= (and b!569901 res!359915) b!569897))

(assert (= (and b!569897 res!359917) b!569902))

(declare-fun m!548793 () Bool)

(assert (=> b!569904 m!548793))

(declare-fun m!548795 () Bool)

(assert (=> b!569899 m!548795))

(declare-fun m!548797 () Bool)

(assert (=> b!569897 m!548797))

(declare-fun m!548799 () Bool)

(assert (=> b!569897 m!548799))

(declare-fun m!548801 () Bool)

(assert (=> b!569898 m!548801))

(declare-fun m!548803 () Bool)

(assert (=> b!569902 m!548803))

(assert (=> b!569902 m!548803))

(declare-fun m!548805 () Bool)

(assert (=> b!569902 m!548805))

(declare-fun m!548807 () Bool)

(assert (=> b!569900 m!548807))

(declare-fun m!548809 () Bool)

(assert (=> b!569903 m!548809))

(assert (=> b!569905 m!548803))

(assert (=> b!569905 m!548803))

(declare-fun m!548811 () Bool)

(assert (=> b!569905 m!548811))

(assert (=> b!569901 m!548803))

(declare-fun m!548813 () Bool)

(assert (=> b!569901 m!548813))

(assert (=> b!569901 m!548803))

(declare-fun m!548815 () Bool)

(assert (=> b!569901 m!548815))

(declare-fun m!548817 () Bool)

(assert (=> b!569901 m!548817))

(assert (=> b!569901 m!548815))

(declare-fun m!548819 () Bool)

(assert (=> b!569901 m!548819))

(assert (=> b!569901 m!548813))

(assert (=> b!569901 m!548803))

(declare-fun m!548821 () Bool)

(assert (=> b!569901 m!548821))

(declare-fun m!548823 () Bool)

(assert (=> b!569901 m!548823))

(assert (=> b!569901 m!548815))

(assert (=> b!569901 m!548817))

(declare-fun m!548825 () Bool)

(assert (=> start!52202 m!548825))

(declare-fun m!548827 () Bool)

(assert (=> start!52202 m!548827))

(push 1)

