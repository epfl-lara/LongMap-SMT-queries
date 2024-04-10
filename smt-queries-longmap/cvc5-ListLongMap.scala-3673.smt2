; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50654 () Bool)

(assert start!50654)

(declare-fun b!553733 () Bool)

(declare-fun e!319381 () Bool)

(assert (=> b!553733 (= e!319381 (not true))))

(declare-fun e!319382 () Bool)

(assert (=> b!553733 e!319382))

(declare-fun res!346152 () Bool)

(assert (=> b!553733 (=> (not res!346152) (not e!319382))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!34879 0))(
  ( (array!34880 (arr!16749 (Array (_ BitVec 32) (_ BitVec 64))) (size!17113 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34879)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34879 (_ BitVec 32)) Bool)

(assert (=> b!553733 (= res!346152 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17170 0))(
  ( (Unit!17171) )
))
(declare-fun lt!251571 () Unit!17170)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34879 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17170)

(assert (=> b!553733 (= lt!251571 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!553734 () Bool)

(declare-fun res!346147 () Bool)

(assert (=> b!553734 (=> (not res!346147) (not e!319381))))

(declare-datatypes ((List!10829 0))(
  ( (Nil!10826) (Cons!10825 (h!11810 (_ BitVec 64)) (t!17057 List!10829)) )
))
(declare-fun arrayNoDuplicates!0 (array!34879 (_ BitVec 32) List!10829) Bool)

(assert (=> b!553734 (= res!346147 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10826))))

(declare-fun b!553735 () Bool)

(declare-fun res!346149 () Bool)

(declare-fun e!319383 () Bool)

(assert (=> b!553735 (=> (not res!346149) (not e!319383))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553735 (= res!346149 (validKeyInArray!0 (select (arr!16749 a!3118) j!142)))))

(declare-fun b!553736 () Bool)

(declare-datatypes ((SeekEntryResult!5198 0))(
  ( (MissingZero!5198 (index!23019 (_ BitVec 32))) (Found!5198 (index!23020 (_ BitVec 32))) (Intermediate!5198 (undefined!6010 Bool) (index!23021 (_ BitVec 32)) (x!51944 (_ BitVec 32))) (Undefined!5198) (MissingVacant!5198 (index!23022 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34879 (_ BitVec 32)) SeekEntryResult!5198)

(assert (=> b!553736 (= e!319382 (= (seekEntryOrOpen!0 (select (arr!16749 a!3118) j!142) a!3118 mask!3119) (Found!5198 j!142)))))

(declare-fun b!553737 () Bool)

(declare-fun res!346146 () Bool)

(assert (=> b!553737 (=> (not res!346146) (not e!319383))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!553737 (= res!346146 (and (= (size!17113 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17113 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17113 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!346153 () Bool)

(assert (=> start!50654 (=> (not res!346153) (not e!319383))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50654 (= res!346153 (validMask!0 mask!3119))))

(assert (=> start!50654 e!319383))

(assert (=> start!50654 true))

(declare-fun array_inv!12545 (array!34879) Bool)

(assert (=> start!50654 (array_inv!12545 a!3118)))

(declare-fun b!553738 () Bool)

(declare-fun res!346150 () Bool)

(assert (=> b!553738 (=> (not res!346150) (not e!319381))))

(assert (=> b!553738 (= res!346150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!553739 () Bool)

(declare-fun res!346145 () Bool)

(assert (=> b!553739 (=> (not res!346145) (not e!319383))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34879 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553739 (= res!346145 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!553740 () Bool)

(declare-fun res!346154 () Bool)

(assert (=> b!553740 (=> (not res!346154) (not e!319383))))

(assert (=> b!553740 (= res!346154 (validKeyInArray!0 k!1914))))

(declare-fun b!553741 () Bool)

(declare-fun res!346148 () Bool)

(assert (=> b!553741 (=> (not res!346148) (not e!319381))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34879 (_ BitVec 32)) SeekEntryResult!5198)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553741 (= res!346148 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16749 a!3118) j!142) mask!3119) (select (arr!16749 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16749 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16749 a!3118) i!1132 k!1914) j!142) (array!34880 (store (arr!16749 a!3118) i!1132 k!1914) (size!17113 a!3118)) mask!3119)))))

(declare-fun b!553742 () Bool)

(assert (=> b!553742 (= e!319383 e!319381)))

(declare-fun res!346151 () Bool)

(assert (=> b!553742 (=> (not res!346151) (not e!319381))))

(declare-fun lt!251572 () SeekEntryResult!5198)

(assert (=> b!553742 (= res!346151 (or (= lt!251572 (MissingZero!5198 i!1132)) (= lt!251572 (MissingVacant!5198 i!1132))))))

(assert (=> b!553742 (= lt!251572 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(assert (= (and start!50654 res!346153) b!553737))

(assert (= (and b!553737 res!346146) b!553735))

(assert (= (and b!553735 res!346149) b!553740))

(assert (= (and b!553740 res!346154) b!553739))

(assert (= (and b!553739 res!346145) b!553742))

(assert (= (and b!553742 res!346151) b!553738))

(assert (= (and b!553738 res!346150) b!553734))

(assert (= (and b!553734 res!346147) b!553741))

(assert (= (and b!553741 res!346148) b!553733))

(assert (= (and b!553733 res!346152) b!553736))

(declare-fun m!530877 () Bool)

(assert (=> b!553736 m!530877))

(assert (=> b!553736 m!530877))

(declare-fun m!530879 () Bool)

(assert (=> b!553736 m!530879))

(declare-fun m!530881 () Bool)

(assert (=> b!553742 m!530881))

(declare-fun m!530883 () Bool)

(assert (=> b!553734 m!530883))

(declare-fun m!530885 () Bool)

(assert (=> b!553739 m!530885))

(declare-fun m!530887 () Bool)

(assert (=> b!553738 m!530887))

(assert (=> b!553735 m!530877))

(assert (=> b!553735 m!530877))

(declare-fun m!530889 () Bool)

(assert (=> b!553735 m!530889))

(declare-fun m!530891 () Bool)

(assert (=> b!553733 m!530891))

(declare-fun m!530893 () Bool)

(assert (=> b!553733 m!530893))

(declare-fun m!530895 () Bool)

(assert (=> start!50654 m!530895))

(declare-fun m!530897 () Bool)

(assert (=> start!50654 m!530897))

(assert (=> b!553741 m!530877))

(declare-fun m!530899 () Bool)

(assert (=> b!553741 m!530899))

(assert (=> b!553741 m!530877))

(declare-fun m!530901 () Bool)

(assert (=> b!553741 m!530901))

(declare-fun m!530903 () Bool)

(assert (=> b!553741 m!530903))

(assert (=> b!553741 m!530901))

(declare-fun m!530905 () Bool)

(assert (=> b!553741 m!530905))

(assert (=> b!553741 m!530899))

(assert (=> b!553741 m!530877))

(declare-fun m!530907 () Bool)

(assert (=> b!553741 m!530907))

(declare-fun m!530909 () Bool)

(assert (=> b!553741 m!530909))

(assert (=> b!553741 m!530901))

(assert (=> b!553741 m!530903))

(declare-fun m!530911 () Bool)

(assert (=> b!553740 m!530911))

(push 1)

