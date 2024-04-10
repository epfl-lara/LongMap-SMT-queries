; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50706 () Bool)

(assert start!50706)

(declare-fun e!319728 () Bool)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!554522 () Bool)

(declare-datatypes ((array!34931 0))(
  ( (array!34932 (arr!16775 (Array (_ BitVec 32) (_ BitVec 64))) (size!17139 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34931)

(declare-datatypes ((SeekEntryResult!5224 0))(
  ( (MissingZero!5224 (index!23123 (_ BitVec 32))) (Found!5224 (index!23124 (_ BitVec 32))) (Intermediate!5224 (undefined!6036 Bool) (index!23125 (_ BitVec 32)) (x!52034 (_ BitVec 32))) (Undefined!5224) (MissingVacant!5224 (index!23126 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34931 (_ BitVec 32)) SeekEntryResult!5224)

(assert (=> b!554522 (= e!319728 (= (seekEntryOrOpen!0 (select (arr!16775 a!3118) j!142) a!3118 mask!3119) (Found!5224 j!142)))))

(declare-fun res!346934 () Bool)

(declare-fun e!319729 () Bool)

(assert (=> start!50706 (=> (not res!346934) (not e!319729))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50706 (= res!346934 (validMask!0 mask!3119))))

(assert (=> start!50706 e!319729))

(assert (=> start!50706 true))

(declare-fun array_inv!12571 (array!34931) Bool)

(assert (=> start!50706 (array_inv!12571 a!3118)))

(declare-fun b!554523 () Bool)

(declare-fun res!346942 () Bool)

(assert (=> b!554523 (=> (not res!346942) (not e!319729))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554523 (= res!346942 (validKeyInArray!0 k!1914))))

(declare-fun b!554524 () Bool)

(declare-fun res!346937 () Bool)

(declare-fun e!319730 () Bool)

(assert (=> b!554524 (=> (not res!346937) (not e!319730))))

(declare-datatypes ((List!10855 0))(
  ( (Nil!10852) (Cons!10851 (h!11836 (_ BitVec 64)) (t!17083 List!10855)) )
))
(declare-fun arrayNoDuplicates!0 (array!34931 (_ BitVec 32) List!10855) Bool)

(assert (=> b!554524 (= res!346937 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10852))))

(declare-fun b!554525 () Bool)

(assert (=> b!554525 (= e!319729 e!319730)))

(declare-fun res!346939 () Bool)

(assert (=> b!554525 (=> (not res!346939) (not e!319730))))

(declare-fun lt!251808 () SeekEntryResult!5224)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!554525 (= res!346939 (or (= lt!251808 (MissingZero!5224 i!1132)) (= lt!251808 (MissingVacant!5224 i!1132))))))

(assert (=> b!554525 (= lt!251808 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!554526 () Bool)

(declare-fun res!346940 () Bool)

(assert (=> b!554526 (=> (not res!346940) (not e!319729))))

(assert (=> b!554526 (= res!346940 (validKeyInArray!0 (select (arr!16775 a!3118) j!142)))))

(declare-fun b!554527 () Bool)

(declare-fun res!346935 () Bool)

(assert (=> b!554527 (=> (not res!346935) (not e!319729))))

(assert (=> b!554527 (= res!346935 (and (= (size!17139 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17139 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17139 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!554528 () Bool)

(declare-fun res!346938 () Bool)

(assert (=> b!554528 (=> (not res!346938) (not e!319730))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34931 (_ BitVec 32)) SeekEntryResult!5224)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554528 (= res!346938 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16775 a!3118) j!142) mask!3119) (select (arr!16775 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16775 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16775 a!3118) i!1132 k!1914) j!142) (array!34932 (store (arr!16775 a!3118) i!1132 k!1914) (size!17139 a!3118)) mask!3119)))))

(declare-fun b!554529 () Bool)

(assert (=> b!554529 (= e!319730 (not true))))

(assert (=> b!554529 e!319728))

(declare-fun res!346941 () Bool)

(assert (=> b!554529 (=> (not res!346941) (not e!319728))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34931 (_ BitVec 32)) Bool)

(assert (=> b!554529 (= res!346941 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17222 0))(
  ( (Unit!17223) )
))
(declare-fun lt!251809 () Unit!17222)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34931 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17222)

(assert (=> b!554529 (= lt!251809 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554530 () Bool)

(declare-fun res!346936 () Bool)

(assert (=> b!554530 (=> (not res!346936) (not e!319730))))

(assert (=> b!554530 (= res!346936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554531 () Bool)

(declare-fun res!346943 () Bool)

(assert (=> b!554531 (=> (not res!346943) (not e!319729))))

(declare-fun arrayContainsKey!0 (array!34931 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554531 (= res!346943 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!50706 res!346934) b!554527))

(assert (= (and b!554527 res!346935) b!554526))

(assert (= (and b!554526 res!346940) b!554523))

(assert (= (and b!554523 res!346942) b!554531))

(assert (= (and b!554531 res!346943) b!554525))

(assert (= (and b!554525 res!346939) b!554530))

(assert (= (and b!554530 res!346936) b!554524))

(assert (= (and b!554524 res!346937) b!554528))

(assert (= (and b!554528 res!346938) b!554529))

(assert (= (and b!554529 res!346941) b!554522))

(declare-fun m!531837 () Bool)

(assert (=> b!554526 m!531837))

(assert (=> b!554526 m!531837))

(declare-fun m!531839 () Bool)

(assert (=> b!554526 m!531839))

(declare-fun m!531841 () Bool)

(assert (=> b!554530 m!531841))

(assert (=> b!554528 m!531837))

(declare-fun m!531843 () Bool)

(assert (=> b!554528 m!531843))

(assert (=> b!554528 m!531837))

(declare-fun m!531845 () Bool)

(assert (=> b!554528 m!531845))

(declare-fun m!531847 () Bool)

(assert (=> b!554528 m!531847))

(assert (=> b!554528 m!531845))

(declare-fun m!531849 () Bool)

(assert (=> b!554528 m!531849))

(assert (=> b!554528 m!531843))

(assert (=> b!554528 m!531837))

(declare-fun m!531851 () Bool)

(assert (=> b!554528 m!531851))

(declare-fun m!531853 () Bool)

(assert (=> b!554528 m!531853))

(assert (=> b!554528 m!531845))

(assert (=> b!554528 m!531847))

(declare-fun m!531855 () Bool)

(assert (=> b!554524 m!531855))

(declare-fun m!531857 () Bool)

(assert (=> b!554529 m!531857))

(declare-fun m!531859 () Bool)

(assert (=> b!554529 m!531859))

(declare-fun m!531861 () Bool)

(assert (=> b!554523 m!531861))

(assert (=> b!554522 m!531837))

(assert (=> b!554522 m!531837))

(declare-fun m!531863 () Bool)

(assert (=> b!554522 m!531863))

(declare-fun m!531865 () Bool)

(assert (=> start!50706 m!531865))

(declare-fun m!531867 () Bool)

(assert (=> start!50706 m!531867))

(declare-fun m!531869 () Bool)

(assert (=> b!554531 m!531869))

(declare-fun m!531871 () Bool)

(assert (=> b!554525 m!531871))

(push 1)

