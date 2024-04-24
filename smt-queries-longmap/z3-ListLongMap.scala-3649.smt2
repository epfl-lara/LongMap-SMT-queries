; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50376 () Bool)

(assert start!50376)

(declare-fun b!550882 () Bool)

(declare-fun res!343747 () Bool)

(declare-fun e!318008 () Bool)

(assert (=> b!550882 (=> (not res!343747) (not e!318008))))

(declare-datatypes ((array!34719 0))(
  ( (array!34720 (arr!16672 (Array (_ BitVec 32) (_ BitVec 64))) (size!17036 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34719)

(declare-datatypes ((List!10659 0))(
  ( (Nil!10656) (Cons!10655 (h!11634 (_ BitVec 64)) (t!16879 List!10659)) )
))
(declare-fun arrayNoDuplicates!0 (array!34719 (_ BitVec 32) List!10659) Bool)

(assert (=> b!550882 (= res!343747 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10656))))

(declare-fun b!550883 () Bool)

(declare-fun res!343746 () Bool)

(declare-fun e!318007 () Bool)

(assert (=> b!550883 (=> (not res!343746) (not e!318007))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34719 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!550883 (= res!343746 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!550884 () Bool)

(declare-fun res!343745 () Bool)

(assert (=> b!550884 (=> (not res!343745) (not e!318007))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!550884 (= res!343745 (validKeyInArray!0 (select (arr!16672 a!3118) j!142)))))

(declare-fun b!550885 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(assert (=> b!550885 (= e!318008 (not (bvsge mask!3119 #b00000000000000000000000000000000)))))

(declare-fun e!318009 () Bool)

(assert (=> b!550885 e!318009))

(declare-fun res!343744 () Bool)

(assert (=> b!550885 (=> (not res!343744) (not e!318009))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34719 (_ BitVec 32)) Bool)

(assert (=> b!550885 (= res!343744 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!16999 0))(
  ( (Unit!17000) )
))
(declare-fun lt!250710 () Unit!16999)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34719 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16999)

(assert (=> b!550885 (= lt!250710 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!550886 () Bool)

(assert (=> b!550886 (= e!318007 e!318008)))

(declare-fun res!343742 () Bool)

(assert (=> b!550886 (=> (not res!343742) (not e!318008))))

(declare-datatypes ((SeekEntryResult!5077 0))(
  ( (MissingZero!5077 (index!22535 (_ BitVec 32))) (Found!5077 (index!22536 (_ BitVec 32))) (Intermediate!5077 (undefined!5889 Bool) (index!22537 (_ BitVec 32)) (x!51616 (_ BitVec 32))) (Undefined!5077) (MissingVacant!5077 (index!22538 (_ BitVec 32))) )
))
(declare-fun lt!250711 () SeekEntryResult!5077)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!550886 (= res!343742 (or (= lt!250711 (MissingZero!5077 i!1132)) (= lt!250711 (MissingVacant!5077 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34719 (_ BitVec 32)) SeekEntryResult!5077)

(assert (=> b!550886 (= lt!250711 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!550888 () Bool)

(declare-fun res!343738 () Bool)

(assert (=> b!550888 (=> (not res!343738) (not e!318007))))

(assert (=> b!550888 (= res!343738 (and (= (size!17036 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17036 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17036 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!550889 () Bool)

(declare-fun res!343739 () Bool)

(assert (=> b!550889 (=> (not res!343739) (not e!318007))))

(assert (=> b!550889 (= res!343739 (validKeyInArray!0 k0!1914))))

(declare-fun b!550890 () Bool)

(assert (=> b!550890 (= e!318009 (= (seekEntryOrOpen!0 (select (arr!16672 a!3118) j!142) a!3118 mask!3119) (Found!5077 j!142)))))

(declare-fun b!550891 () Bool)

(declare-fun res!343743 () Bool)

(assert (=> b!550891 (=> (not res!343743) (not e!318008))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34719 (_ BitVec 32)) SeekEntryResult!5077)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!550891 (= res!343743 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16672 a!3118) j!142) mask!3119) (select (arr!16672 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16672 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16672 a!3118) i!1132 k0!1914) j!142) (array!34720 (store (arr!16672 a!3118) i!1132 k0!1914) (size!17036 a!3118)) mask!3119)))))

(declare-fun b!550887 () Bool)

(declare-fun res!343741 () Bool)

(assert (=> b!550887 (=> (not res!343741) (not e!318008))))

(assert (=> b!550887 (= res!343741 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!343740 () Bool)

(assert (=> start!50376 (=> (not res!343740) (not e!318007))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50376 (= res!343740 (validMask!0 mask!3119))))

(assert (=> start!50376 e!318007))

(assert (=> start!50376 true))

(declare-fun array_inv!12531 (array!34719) Bool)

(assert (=> start!50376 (array_inv!12531 a!3118)))

(assert (= (and start!50376 res!343740) b!550888))

(assert (= (and b!550888 res!343738) b!550884))

(assert (= (and b!550884 res!343745) b!550889))

(assert (= (and b!550889 res!343739) b!550883))

(assert (= (and b!550883 res!343746) b!550886))

(assert (= (and b!550886 res!343742) b!550887))

(assert (= (and b!550887 res!343741) b!550882))

(assert (= (and b!550882 res!343747) b!550891))

(assert (= (and b!550891 res!343743) b!550885))

(assert (= (and b!550885 res!343744) b!550890))

(declare-fun m!527999 () Bool)

(assert (=> b!550886 m!527999))

(declare-fun m!528001 () Bool)

(assert (=> b!550884 m!528001))

(assert (=> b!550884 m!528001))

(declare-fun m!528003 () Bool)

(assert (=> b!550884 m!528003))

(assert (=> b!550890 m!528001))

(assert (=> b!550890 m!528001))

(declare-fun m!528005 () Bool)

(assert (=> b!550890 m!528005))

(declare-fun m!528007 () Bool)

(assert (=> b!550882 m!528007))

(declare-fun m!528009 () Bool)

(assert (=> b!550883 m!528009))

(declare-fun m!528011 () Bool)

(assert (=> b!550885 m!528011))

(declare-fun m!528013 () Bool)

(assert (=> b!550885 m!528013))

(declare-fun m!528015 () Bool)

(assert (=> b!550889 m!528015))

(declare-fun m!528017 () Bool)

(assert (=> b!550887 m!528017))

(declare-fun m!528019 () Bool)

(assert (=> start!50376 m!528019))

(declare-fun m!528021 () Bool)

(assert (=> start!50376 m!528021))

(assert (=> b!550891 m!528001))

(declare-fun m!528023 () Bool)

(assert (=> b!550891 m!528023))

(assert (=> b!550891 m!528001))

(declare-fun m!528025 () Bool)

(assert (=> b!550891 m!528025))

(declare-fun m!528027 () Bool)

(assert (=> b!550891 m!528027))

(assert (=> b!550891 m!528025))

(declare-fun m!528029 () Bool)

(assert (=> b!550891 m!528029))

(assert (=> b!550891 m!528023))

(assert (=> b!550891 m!528001))

(declare-fun m!528031 () Bool)

(assert (=> b!550891 m!528031))

(declare-fun m!528033 () Bool)

(assert (=> b!550891 m!528033))

(assert (=> b!550891 m!528025))

(assert (=> b!550891 m!528027))

(check-sat (not b!550890) (not start!50376) (not b!550887) (not b!550885) (not b!550889) (not b!550886) (not b!550891) (not b!550882) (not b!550884) (not b!550883))
(check-sat)
