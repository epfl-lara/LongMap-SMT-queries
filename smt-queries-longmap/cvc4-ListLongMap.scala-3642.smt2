; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50232 () Bool)

(assert start!50232)

(declare-fun b!549849 () Bool)

(declare-fun res!343001 () Bool)

(declare-fun e!317492 () Bool)

(assert (=> b!549849 (=> (not res!343001) (not e!317492))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34685 0))(
  ( (array!34686 (arr!16658 (Array (_ BitVec 32) (_ BitVec 64))) (size!17022 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34685)

(assert (=> b!549849 (= res!343001 (and (= (size!17022 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17022 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17022 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!549850 () Bool)

(declare-fun res!342996 () Bool)

(assert (=> b!549850 (=> (not res!342996) (not e!317492))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549850 (= res!342996 (validKeyInArray!0 k!1914))))

(declare-fun b!549851 () Bool)

(declare-fun res!342998 () Bool)

(assert (=> b!549851 (=> (not res!342998) (not e!317492))))

(assert (=> b!549851 (= res!342998 (validKeyInArray!0 (select (arr!16658 a!3118) j!142)))))

(declare-fun b!549852 () Bool)

(declare-fun res!342997 () Bool)

(declare-fun e!317491 () Bool)

(assert (=> b!549852 (=> (not res!342997) (not e!317491))))

(declare-datatypes ((List!10738 0))(
  ( (Nil!10735) (Cons!10734 (h!11707 (_ BitVec 64)) (t!16966 List!10738)) )
))
(declare-fun arrayNoDuplicates!0 (array!34685 (_ BitVec 32) List!10738) Bool)

(assert (=> b!549852 (= res!342997 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10735))))

(declare-fun b!549853 () Bool)

(assert (=> b!549853 (= e!317491 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34685 (_ BitVec 32)) Bool)

(assert (=> b!549853 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!16988 0))(
  ( (Unit!16989) )
))
(declare-fun lt!250357 () Unit!16988)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34685 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16988)

(assert (=> b!549853 (= lt!250357 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!342994 () Bool)

(assert (=> start!50232 (=> (not res!342994) (not e!317492))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50232 (= res!342994 (validMask!0 mask!3119))))

(assert (=> start!50232 e!317492))

(assert (=> start!50232 true))

(declare-fun array_inv!12454 (array!34685) Bool)

(assert (=> start!50232 (array_inv!12454 a!3118)))

(declare-fun b!549854 () Bool)

(assert (=> b!549854 (= e!317492 e!317491)))

(declare-fun res!342995 () Bool)

(assert (=> b!549854 (=> (not res!342995) (not e!317491))))

(declare-datatypes ((SeekEntryResult!5107 0))(
  ( (MissingZero!5107 (index!22655 (_ BitVec 32))) (Found!5107 (index!22656 (_ BitVec 32))) (Intermediate!5107 (undefined!5919 Bool) (index!22657 (_ BitVec 32)) (x!51581 (_ BitVec 32))) (Undefined!5107) (MissingVacant!5107 (index!22658 (_ BitVec 32))) )
))
(declare-fun lt!250356 () SeekEntryResult!5107)

(assert (=> b!549854 (= res!342995 (or (= lt!250356 (MissingZero!5107 i!1132)) (= lt!250356 (MissingVacant!5107 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34685 (_ BitVec 32)) SeekEntryResult!5107)

(assert (=> b!549854 (= lt!250356 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!549855 () Bool)

(declare-fun res!343000 () Bool)

(assert (=> b!549855 (=> (not res!343000) (not e!317491))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34685 (_ BitVec 32)) SeekEntryResult!5107)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549855 (= res!343000 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16658 a!3118) j!142) mask!3119) (select (arr!16658 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16658 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16658 a!3118) i!1132 k!1914) j!142) (array!34686 (store (arr!16658 a!3118) i!1132 k!1914) (size!17022 a!3118)) mask!3119)))))

(declare-fun b!549856 () Bool)

(declare-fun res!342999 () Bool)

(assert (=> b!549856 (=> (not res!342999) (not e!317492))))

(declare-fun arrayContainsKey!0 (array!34685 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549856 (= res!342999 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!549857 () Bool)

(declare-fun res!342993 () Bool)

(assert (=> b!549857 (=> (not res!342993) (not e!317491))))

(assert (=> b!549857 (= res!342993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!50232 res!342994) b!549849))

(assert (= (and b!549849 res!343001) b!549851))

(assert (= (and b!549851 res!342998) b!549850))

(assert (= (and b!549850 res!342996) b!549856))

(assert (= (and b!549856 res!342999) b!549854))

(assert (= (and b!549854 res!342995) b!549857))

(assert (= (and b!549857 res!342993) b!549852))

(assert (= (and b!549852 res!342997) b!549855))

(assert (= (and b!549855 res!343000) b!549853))

(declare-fun m!526799 () Bool)

(assert (=> b!549854 m!526799))

(declare-fun m!526801 () Bool)

(assert (=> b!549853 m!526801))

(declare-fun m!526803 () Bool)

(assert (=> b!549853 m!526803))

(declare-fun m!526805 () Bool)

(assert (=> b!549851 m!526805))

(assert (=> b!549851 m!526805))

(declare-fun m!526807 () Bool)

(assert (=> b!549851 m!526807))

(declare-fun m!526809 () Bool)

(assert (=> b!549850 m!526809))

(declare-fun m!526811 () Bool)

(assert (=> b!549856 m!526811))

(declare-fun m!526813 () Bool)

(assert (=> start!50232 m!526813))

(declare-fun m!526815 () Bool)

(assert (=> start!50232 m!526815))

(declare-fun m!526817 () Bool)

(assert (=> b!549852 m!526817))

(assert (=> b!549855 m!526805))

(declare-fun m!526819 () Bool)

(assert (=> b!549855 m!526819))

(assert (=> b!549855 m!526805))

(declare-fun m!526821 () Bool)

(assert (=> b!549855 m!526821))

(declare-fun m!526823 () Bool)

(assert (=> b!549855 m!526823))

(assert (=> b!549855 m!526821))

(declare-fun m!526825 () Bool)

(assert (=> b!549855 m!526825))

(assert (=> b!549855 m!526819))

(assert (=> b!549855 m!526805))

(declare-fun m!526827 () Bool)

(assert (=> b!549855 m!526827))

(declare-fun m!526829 () Bool)

(assert (=> b!549855 m!526829))

(assert (=> b!549855 m!526821))

(assert (=> b!549855 m!526823))

(declare-fun m!526831 () Bool)

(assert (=> b!549857 m!526831))

(push 1)

(assert (not start!50232))

