; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50340 () Bool)

(assert start!50340)

(declare-fun b!550832 () Bool)

(declare-fun e!317938 () Bool)

(declare-fun e!317937 () Bool)

(assert (=> b!550832 (= e!317938 e!317937)))

(declare-fun res!343799 () Bool)

(assert (=> b!550832 (=> (not res!343799) (not e!317937))))

(declare-datatypes ((SeekEntryResult!5131 0))(
  ( (MissingZero!5131 (index!22751 (_ BitVec 32))) (Found!5131 (index!22752 (_ BitVec 32))) (Intermediate!5131 (undefined!5943 Bool) (index!22753 (_ BitVec 32)) (x!51675 (_ BitVec 32))) (Undefined!5131) (MissingVacant!5131 (index!22754 (_ BitVec 32))) )
))
(declare-fun lt!250630 () SeekEntryResult!5131)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!550832 (= res!343799 (or (= lt!250630 (MissingZero!5131 i!1132)) (= lt!250630 (MissingVacant!5131 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((array!34736 0))(
  ( (array!34737 (arr!16682 (Array (_ BitVec 32) (_ BitVec 64))) (size!17046 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34736)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34736 (_ BitVec 32)) SeekEntryResult!5131)

(assert (=> b!550832 (= lt!250630 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun b!550833 () Bool)

(declare-fun e!317940 () Bool)

(assert (=> b!550833 (= e!317940 (= (seekEntryOrOpen!0 (select (arr!16682 a!3118) j!142) a!3118 mask!3119) (Found!5131 j!142)))))

(declare-fun b!550834 () Bool)

(declare-fun res!343793 () Bool)

(assert (=> b!550834 (=> (not res!343793) (not e!317937))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34736 (_ BitVec 32)) Bool)

(assert (=> b!550834 (= res!343793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!343802 () Bool)

(assert (=> start!50340 (=> (not res!343802) (not e!317938))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50340 (= res!343802 (validMask!0 mask!3119))))

(assert (=> start!50340 e!317938))

(assert (=> start!50340 true))

(declare-fun array_inv!12478 (array!34736) Bool)

(assert (=> start!50340 (array_inv!12478 a!3118)))

(declare-fun b!550835 () Bool)

(declare-fun res!343796 () Bool)

(assert (=> b!550835 (=> (not res!343796) (not e!317938))))

(assert (=> b!550835 (= res!343796 (and (= (size!17046 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17046 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17046 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!550836 () Bool)

(declare-fun res!343797 () Bool)

(assert (=> b!550836 (=> (not res!343797) (not e!317937))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34736 (_ BitVec 32)) SeekEntryResult!5131)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!550836 (= res!343797 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16682 a!3118) j!142) mask!3119) (select (arr!16682 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16682 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16682 a!3118) i!1132 k!1914) j!142) (array!34737 (store (arr!16682 a!3118) i!1132 k!1914) (size!17046 a!3118)) mask!3119)))))

(declare-fun b!550837 () Bool)

(declare-fun res!343798 () Bool)

(assert (=> b!550837 (=> (not res!343798) (not e!317938))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!550837 (= res!343798 (validKeyInArray!0 (select (arr!16682 a!3118) j!142)))))

(declare-fun b!550838 () Bool)

(declare-fun res!343794 () Bool)

(assert (=> b!550838 (=> (not res!343794) (not e!317937))))

(declare-datatypes ((List!10762 0))(
  ( (Nil!10759) (Cons!10758 (h!11734 (_ BitVec 64)) (t!16990 List!10762)) )
))
(declare-fun arrayNoDuplicates!0 (array!34736 (_ BitVec 32) List!10762) Bool)

(assert (=> b!550838 (= res!343794 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10759))))

(declare-fun b!550839 () Bool)

(assert (=> b!550839 (= e!317937 (not true))))

(assert (=> b!550839 e!317940))

(declare-fun res!343795 () Bool)

(assert (=> b!550839 (=> (not res!343795) (not e!317940))))

(assert (=> b!550839 (= res!343795 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17036 0))(
  ( (Unit!17037) )
))
(declare-fun lt!250629 () Unit!17036)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34736 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17036)

(assert (=> b!550839 (= lt!250629 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!550840 () Bool)

(declare-fun res!343800 () Bool)

(assert (=> b!550840 (=> (not res!343800) (not e!317938))))

(assert (=> b!550840 (= res!343800 (validKeyInArray!0 k!1914))))

(declare-fun b!550841 () Bool)

(declare-fun res!343801 () Bool)

(assert (=> b!550841 (=> (not res!343801) (not e!317938))))

(declare-fun arrayContainsKey!0 (array!34736 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!550841 (= res!343801 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!50340 res!343802) b!550835))

(assert (= (and b!550835 res!343796) b!550837))

(assert (= (and b!550837 res!343798) b!550840))

(assert (= (and b!550840 res!343800) b!550841))

(assert (= (and b!550841 res!343801) b!550832))

(assert (= (and b!550832 res!343799) b!550834))

(assert (= (and b!550834 res!343793) b!550838))

(assert (= (and b!550838 res!343794) b!550836))

(assert (= (and b!550836 res!343797) b!550839))

(assert (= (and b!550839 res!343795) b!550833))

(declare-fun m!527841 () Bool)

(assert (=> b!550832 m!527841))

(declare-fun m!527843 () Bool)

(assert (=> b!550838 m!527843))

(declare-fun m!527845 () Bool)

(assert (=> b!550841 m!527845))

(declare-fun m!527847 () Bool)

(assert (=> b!550836 m!527847))

(declare-fun m!527849 () Bool)

(assert (=> b!550836 m!527849))

(assert (=> b!550836 m!527847))

(declare-fun m!527851 () Bool)

(assert (=> b!550836 m!527851))

(declare-fun m!527853 () Bool)

(assert (=> b!550836 m!527853))

(assert (=> b!550836 m!527851))

(declare-fun m!527855 () Bool)

(assert (=> b!550836 m!527855))

(assert (=> b!550836 m!527849))

(assert (=> b!550836 m!527847))

(declare-fun m!527857 () Bool)

(assert (=> b!550836 m!527857))

(declare-fun m!527859 () Bool)

(assert (=> b!550836 m!527859))

(assert (=> b!550836 m!527851))

(assert (=> b!550836 m!527853))

(declare-fun m!527861 () Bool)

(assert (=> b!550834 m!527861))

(declare-fun m!527863 () Bool)

(assert (=> b!550839 m!527863))

(declare-fun m!527865 () Bool)

(assert (=> b!550839 m!527865))

(declare-fun m!527867 () Bool)

(assert (=> start!50340 m!527867))

(declare-fun m!527869 () Bool)

(assert (=> start!50340 m!527869))

(assert (=> b!550837 m!527847))

(assert (=> b!550837 m!527847))

(declare-fun m!527871 () Bool)

(assert (=> b!550837 m!527871))

(assert (=> b!550833 m!527847))

(assert (=> b!550833 m!527847))

(declare-fun m!527873 () Bool)

(assert (=> b!550833 m!527873))

(declare-fun m!527875 () Bool)

(assert (=> b!550840 m!527875))

(push 1)

