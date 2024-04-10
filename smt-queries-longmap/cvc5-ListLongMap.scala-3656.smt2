; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50492 () Bool)

(assert start!50492)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun e!318511 () Bool)

(declare-fun b!551894 () Bool)

(declare-datatypes ((array!34774 0))(
  ( (array!34775 (arr!16698 (Array (_ BitVec 32) (_ BitVec 64))) (size!17062 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34774)

(declare-datatypes ((SeekEntryResult!5147 0))(
  ( (MissingZero!5147 (index!22815 (_ BitVec 32))) (Found!5147 (index!22816 (_ BitVec 32))) (Intermediate!5147 (undefined!5959 Bool) (index!22817 (_ BitVec 32)) (x!51751 (_ BitVec 32))) (Undefined!5147) (MissingVacant!5147 (index!22818 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34774 (_ BitVec 32)) SeekEntryResult!5147)

(assert (=> b!551894 (= e!318511 (= (seekEntryOrOpen!0 (select (arr!16698 a!3118) j!142) a!3118 mask!3119) (Found!5147 j!142)))))

(declare-fun b!551895 () Bool)

(declare-fun res!344495 () Bool)

(declare-fun e!318512 () Bool)

(assert (=> b!551895 (=> (not res!344495) (not e!318512))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34774 (_ BitVec 32)) SeekEntryResult!5147)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!551895 (= res!344495 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16698 a!3118) j!142) mask!3119) (select (arr!16698 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16698 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16698 a!3118) i!1132 k!1914) j!142) (array!34775 (store (arr!16698 a!3118) i!1132 k!1914) (size!17062 a!3118)) mask!3119)))))

(declare-fun b!551896 () Bool)

(declare-fun e!318510 () Bool)

(assert (=> b!551896 (= e!318510 e!318512)))

(declare-fun res!344491 () Bool)

(assert (=> b!551896 (=> (not res!344491) (not e!318512))))

(declare-fun lt!250993 () SeekEntryResult!5147)

(assert (=> b!551896 (= res!344491 (or (= lt!250993 (MissingZero!5147 i!1132)) (= lt!250993 (MissingVacant!5147 i!1132))))))

(assert (=> b!551896 (= lt!250993 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!551897 () Bool)

(assert (=> b!551897 (= e!318512 (not true))))

(assert (=> b!551897 e!318511))

(declare-fun res!344489 () Bool)

(assert (=> b!551897 (=> (not res!344489) (not e!318511))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34774 (_ BitVec 32)) Bool)

(assert (=> b!551897 (= res!344489 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17068 0))(
  ( (Unit!17069) )
))
(declare-fun lt!250992 () Unit!17068)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34774 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17068)

(assert (=> b!551897 (= lt!250992 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!551898 () Bool)

(declare-fun res!344496 () Bool)

(assert (=> b!551898 (=> (not res!344496) (not e!318510))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!551898 (= res!344496 (validKeyInArray!0 k!1914))))

(declare-fun res!344493 () Bool)

(assert (=> start!50492 (=> (not res!344493) (not e!318510))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50492 (= res!344493 (validMask!0 mask!3119))))

(assert (=> start!50492 e!318510))

(assert (=> start!50492 true))

(declare-fun array_inv!12494 (array!34774) Bool)

(assert (=> start!50492 (array_inv!12494 a!3118)))

(declare-fun b!551899 () Bool)

(declare-fun res!344497 () Bool)

(assert (=> b!551899 (=> (not res!344497) (not e!318510))))

(assert (=> b!551899 (= res!344497 (validKeyInArray!0 (select (arr!16698 a!3118) j!142)))))

(declare-fun b!551900 () Bool)

(declare-fun res!344498 () Bool)

(assert (=> b!551900 (=> (not res!344498) (not e!318512))))

(assert (=> b!551900 (= res!344498 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!551901 () Bool)

(declare-fun res!344490 () Bool)

(assert (=> b!551901 (=> (not res!344490) (not e!318510))))

(declare-fun arrayContainsKey!0 (array!34774 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!551901 (= res!344490 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!551902 () Bool)

(declare-fun res!344494 () Bool)

(assert (=> b!551902 (=> (not res!344494) (not e!318510))))

(assert (=> b!551902 (= res!344494 (and (= (size!17062 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17062 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17062 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!551903 () Bool)

(declare-fun res!344492 () Bool)

(assert (=> b!551903 (=> (not res!344492) (not e!318512))))

(declare-datatypes ((List!10778 0))(
  ( (Nil!10775) (Cons!10774 (h!11756 (_ BitVec 64)) (t!17006 List!10778)) )
))
(declare-fun arrayNoDuplicates!0 (array!34774 (_ BitVec 32) List!10778) Bool)

(assert (=> b!551903 (= res!344492 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10775))))

(assert (= (and start!50492 res!344493) b!551902))

(assert (= (and b!551902 res!344494) b!551899))

(assert (= (and b!551899 res!344497) b!551898))

(assert (= (and b!551898 res!344496) b!551901))

(assert (= (and b!551901 res!344490) b!551896))

(assert (= (and b!551896 res!344491) b!551900))

(assert (= (and b!551900 res!344498) b!551903))

(assert (= (and b!551903 res!344492) b!551895))

(assert (= (and b!551895 res!344495) b!551897))

(assert (= (and b!551897 res!344489) b!551894))

(declare-fun m!528819 () Bool)

(assert (=> start!50492 m!528819))

(declare-fun m!528821 () Bool)

(assert (=> start!50492 m!528821))

(declare-fun m!528823 () Bool)

(assert (=> b!551894 m!528823))

(assert (=> b!551894 m!528823))

(declare-fun m!528825 () Bool)

(assert (=> b!551894 m!528825))

(assert (=> b!551895 m!528823))

(declare-fun m!528827 () Bool)

(assert (=> b!551895 m!528827))

(assert (=> b!551895 m!528823))

(declare-fun m!528829 () Bool)

(assert (=> b!551895 m!528829))

(declare-fun m!528831 () Bool)

(assert (=> b!551895 m!528831))

(assert (=> b!551895 m!528829))

(declare-fun m!528833 () Bool)

(assert (=> b!551895 m!528833))

(assert (=> b!551895 m!528827))

(assert (=> b!551895 m!528823))

(declare-fun m!528835 () Bool)

(assert (=> b!551895 m!528835))

(declare-fun m!528837 () Bool)

(assert (=> b!551895 m!528837))

(assert (=> b!551895 m!528829))

(assert (=> b!551895 m!528831))

(declare-fun m!528839 () Bool)

(assert (=> b!551896 m!528839))

(declare-fun m!528841 () Bool)

(assert (=> b!551898 m!528841))

(declare-fun m!528843 () Bool)

(assert (=> b!551903 m!528843))

(declare-fun m!528845 () Bool)

(assert (=> b!551897 m!528845))

(declare-fun m!528847 () Bool)

(assert (=> b!551897 m!528847))

(declare-fun m!528849 () Bool)

(assert (=> b!551901 m!528849))

(assert (=> b!551899 m!528823))

(assert (=> b!551899 m!528823))

(declare-fun m!528851 () Bool)

(assert (=> b!551899 m!528851))

(declare-fun m!528853 () Bool)

(assert (=> b!551900 m!528853))

(push 1)

