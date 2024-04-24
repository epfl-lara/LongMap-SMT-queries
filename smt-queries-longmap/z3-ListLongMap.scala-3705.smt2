; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50892 () Bool)

(assert start!50892)

(declare-fun b!556669 () Bool)

(declare-fun e!320716 () Bool)

(declare-fun e!320717 () Bool)

(assert (=> b!556669 (= e!320716 e!320717)))

(declare-fun res!348979 () Bool)

(assert (=> b!556669 (=> (not res!348979) (not e!320717))))

(declare-datatypes ((SeekEntryResult!5245 0))(
  ( (MissingZero!5245 (index!23207 (_ BitVec 32))) (Found!5245 (index!23208 (_ BitVec 32))) (Intermediate!5245 (undefined!6057 Bool) (index!23209 (_ BitVec 32)) (x!52250 (_ BitVec 32))) (Undefined!5245) (MissingVacant!5245 (index!23210 (_ BitVec 32))) )
))
(declare-fun lt!253005 () SeekEntryResult!5245)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!556669 (= res!348979 (or (= lt!253005 (MissingZero!5245 i!1132)) (= lt!253005 (MissingVacant!5245 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35064 0))(
  ( (array!35065 (arr!16840 (Array (_ BitVec 32) (_ BitVec 64))) (size!17204 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35064)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35064 (_ BitVec 32)) SeekEntryResult!5245)

(assert (=> b!556669 (= lt!253005 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!556670 () Bool)

(declare-fun res!348981 () Bool)

(assert (=> b!556670 (=> (not res!348981) (not e!320716))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!556670 (= res!348981 (validKeyInArray!0 k0!1914))))

(declare-fun b!556671 () Bool)

(declare-fun res!348982 () Bool)

(assert (=> b!556671 (=> (not res!348982) (not e!320717))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35064 (_ BitVec 32)) Bool)

(assert (=> b!556671 (= res!348982 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun e!320718 () Bool)

(declare-fun b!556672 () Bool)

(assert (=> b!556672 (= e!320718 (= (seekEntryOrOpen!0 (select (arr!16840 a!3118) j!142) a!3118 mask!3119) (Found!5245 j!142)))))

(declare-fun b!556673 () Bool)

(declare-fun res!348978 () Bool)

(assert (=> b!556673 (=> (not res!348978) (not e!320717))))

(declare-datatypes ((List!10827 0))(
  ( (Nil!10824) (Cons!10823 (h!11811 (_ BitVec 64)) (t!17047 List!10827)) )
))
(declare-fun arrayNoDuplicates!0 (array!35064 (_ BitVec 32) List!10827) Bool)

(assert (=> b!556673 (= res!348978 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10824))))

(declare-fun b!556674 () Bool)

(declare-fun res!348985 () Bool)

(assert (=> b!556674 (=> (not res!348985) (not e!320716))))

(declare-fun arrayContainsKey!0 (array!35064 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!556674 (= res!348985 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!556675 () Bool)

(assert (=> b!556675 (= e!320717 (not true))))

(assert (=> b!556675 e!320718))

(declare-fun res!348983 () Bool)

(assert (=> b!556675 (=> (not res!348983) (not e!320718))))

(assert (=> b!556675 (= res!348983 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17335 0))(
  ( (Unit!17336) )
))
(declare-fun lt!253006 () Unit!17335)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35064 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17335)

(assert (=> b!556675 (= lt!253006 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!556676 () Bool)

(declare-fun res!348984 () Bool)

(assert (=> b!556676 (=> (not res!348984) (not e!320716))))

(assert (=> b!556676 (= res!348984 (validKeyInArray!0 (select (arr!16840 a!3118) j!142)))))

(declare-fun b!556677 () Bool)

(declare-fun res!348980 () Bool)

(assert (=> b!556677 (=> (not res!348980) (not e!320717))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35064 (_ BitVec 32)) SeekEntryResult!5245)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!556677 (= res!348980 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16840 a!3118) j!142) mask!3119) (select (arr!16840 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16840 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16840 a!3118) i!1132 k0!1914) j!142) (array!35065 (store (arr!16840 a!3118) i!1132 k0!1914) (size!17204 a!3118)) mask!3119)))))

(declare-fun b!556678 () Bool)

(declare-fun res!348977 () Bool)

(assert (=> b!556678 (=> (not res!348977) (not e!320716))))

(assert (=> b!556678 (= res!348977 (and (= (size!17204 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17204 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17204 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!348976 () Bool)

(assert (=> start!50892 (=> (not res!348976) (not e!320716))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50892 (= res!348976 (validMask!0 mask!3119))))

(assert (=> start!50892 e!320716))

(assert (=> start!50892 true))

(declare-fun array_inv!12699 (array!35064) Bool)

(assert (=> start!50892 (array_inv!12699 a!3118)))

(assert (= (and start!50892 res!348976) b!556678))

(assert (= (and b!556678 res!348977) b!556676))

(assert (= (and b!556676 res!348984) b!556670))

(assert (= (and b!556670 res!348981) b!556674))

(assert (= (and b!556674 res!348985) b!556669))

(assert (= (and b!556669 res!348979) b!556671))

(assert (= (and b!556671 res!348982) b!556673))

(assert (= (and b!556673 res!348978) b!556677))

(assert (= (and b!556677 res!348980) b!556675))

(assert (= (and b!556675 res!348983) b!556672))

(declare-fun m!534809 () Bool)

(assert (=> b!556674 m!534809))

(declare-fun m!534811 () Bool)

(assert (=> b!556672 m!534811))

(assert (=> b!556672 m!534811))

(declare-fun m!534813 () Bool)

(assert (=> b!556672 m!534813))

(declare-fun m!534815 () Bool)

(assert (=> start!50892 m!534815))

(declare-fun m!534817 () Bool)

(assert (=> start!50892 m!534817))

(declare-fun m!534819 () Bool)

(assert (=> b!556675 m!534819))

(declare-fun m!534821 () Bool)

(assert (=> b!556675 m!534821))

(declare-fun m!534823 () Bool)

(assert (=> b!556671 m!534823))

(assert (=> b!556676 m!534811))

(assert (=> b!556676 m!534811))

(declare-fun m!534825 () Bool)

(assert (=> b!556676 m!534825))

(declare-fun m!534827 () Bool)

(assert (=> b!556669 m!534827))

(declare-fun m!534829 () Bool)

(assert (=> b!556670 m!534829))

(assert (=> b!556677 m!534811))

(declare-fun m!534831 () Bool)

(assert (=> b!556677 m!534831))

(assert (=> b!556677 m!534811))

(declare-fun m!534833 () Bool)

(assert (=> b!556677 m!534833))

(declare-fun m!534835 () Bool)

(assert (=> b!556677 m!534835))

(assert (=> b!556677 m!534833))

(declare-fun m!534837 () Bool)

(assert (=> b!556677 m!534837))

(assert (=> b!556677 m!534831))

(assert (=> b!556677 m!534811))

(declare-fun m!534839 () Bool)

(assert (=> b!556677 m!534839))

(declare-fun m!534841 () Bool)

(assert (=> b!556677 m!534841))

(assert (=> b!556677 m!534833))

(assert (=> b!556677 m!534835))

(declare-fun m!534843 () Bool)

(assert (=> b!556673 m!534843))

(check-sat (not b!556670) (not b!556675) (not b!556671) (not b!556674) (not b!556676) (not b!556677) (not start!50892) (not b!556672) (not b!556669) (not b!556673))
(check-sat)
