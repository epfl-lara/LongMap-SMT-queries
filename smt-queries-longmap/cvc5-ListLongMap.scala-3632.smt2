; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50120 () Bool)

(assert start!50120)

(declare-fun b!548911 () Bool)

(declare-fun res!342147 () Bool)

(declare-fun e!317088 () Bool)

(assert (=> b!548911 (=> (not res!342147) (not e!317088))))

(declare-datatypes ((array!34618 0))(
  ( (array!34619 (arr!16626 (Array (_ BitVec 32) (_ BitVec 64))) (size!16990 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34618)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34618 (_ BitVec 32)) Bool)

(assert (=> b!548911 (= res!342147 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!548912 () Bool)

(assert (=> b!548912 (= e!317088 (bvslt mask!3119 #b00000000000000000000000000000000))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun lt!249957 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!548912 (= lt!249957 (toIndex!0 (select (store (arr!16626 a!3118) i!1132 k!1914) j!142) mask!3119))))

(declare-fun res!342145 () Bool)

(declare-fun e!317086 () Bool)

(assert (=> start!50120 (=> (not res!342145) (not e!317086))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50120 (= res!342145 (validMask!0 mask!3119))))

(assert (=> start!50120 e!317086))

(assert (=> start!50120 true))

(declare-fun array_inv!12422 (array!34618) Bool)

(assert (=> start!50120 (array_inv!12422 a!3118)))

(declare-fun b!548913 () Bool)

(declare-fun res!342149 () Bool)

(assert (=> b!548913 (=> (not res!342149) (not e!317086))))

(assert (=> b!548913 (= res!342149 (and (= (size!16990 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16990 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16990 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!548914 () Bool)

(declare-fun res!342146 () Bool)

(assert (=> b!548914 (=> (not res!342146) (not e!317086))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!548914 (= res!342146 (validKeyInArray!0 k!1914))))

(declare-fun b!548915 () Bool)

(declare-fun res!342148 () Bool)

(assert (=> b!548915 (=> (not res!342148) (not e!317088))))

(declare-datatypes ((List!10706 0))(
  ( (Nil!10703) (Cons!10702 (h!11672 (_ BitVec 64)) (t!16934 List!10706)) )
))
(declare-fun arrayNoDuplicates!0 (array!34618 (_ BitVec 32) List!10706) Bool)

(assert (=> b!548915 (= res!342148 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10703))))

(declare-fun b!548916 () Bool)

(assert (=> b!548916 (= e!317086 e!317088)))

(declare-fun res!342142 () Bool)

(assert (=> b!548916 (=> (not res!342142) (not e!317088))))

(declare-datatypes ((SeekEntryResult!5075 0))(
  ( (MissingZero!5075 (index!22527 (_ BitVec 32))) (Found!5075 (index!22528 (_ BitVec 32))) (Intermediate!5075 (undefined!5887 Bool) (index!22529 (_ BitVec 32)) (x!51466 (_ BitVec 32))) (Undefined!5075) (MissingVacant!5075 (index!22530 (_ BitVec 32))) )
))
(declare-fun lt!249958 () SeekEntryResult!5075)

(assert (=> b!548916 (= res!342142 (or (= lt!249958 (MissingZero!5075 i!1132)) (= lt!249958 (MissingVacant!5075 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34618 (_ BitVec 32)) SeekEntryResult!5075)

(assert (=> b!548916 (= lt!249958 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!548917 () Bool)

(declare-fun res!342143 () Bool)

(assert (=> b!548917 (=> (not res!342143) (not e!317086))))

(declare-fun arrayContainsKey!0 (array!34618 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!548917 (= res!342143 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!548918 () Bool)

(declare-fun res!342144 () Bool)

(assert (=> b!548918 (=> (not res!342144) (not e!317086))))

(assert (=> b!548918 (= res!342144 (validKeyInArray!0 (select (arr!16626 a!3118) j!142)))))

(assert (= (and start!50120 res!342145) b!548913))

(assert (= (and b!548913 res!342149) b!548918))

(assert (= (and b!548918 res!342144) b!548914))

(assert (= (and b!548914 res!342146) b!548917))

(assert (= (and b!548917 res!342143) b!548916))

(assert (= (and b!548916 res!342142) b!548911))

(assert (= (and b!548911 res!342147) b!548915))

(assert (= (and b!548915 res!342148) b!548912))

(declare-fun m!525819 () Bool)

(assert (=> b!548917 m!525819))

(declare-fun m!525821 () Bool)

(assert (=> b!548918 m!525821))

(assert (=> b!548918 m!525821))

(declare-fun m!525823 () Bool)

(assert (=> b!548918 m!525823))

(declare-fun m!525825 () Bool)

(assert (=> b!548916 m!525825))

(declare-fun m!525827 () Bool)

(assert (=> b!548915 m!525827))

(declare-fun m!525829 () Bool)

(assert (=> b!548914 m!525829))

(declare-fun m!525831 () Bool)

(assert (=> b!548912 m!525831))

(declare-fun m!525833 () Bool)

(assert (=> b!548912 m!525833))

(assert (=> b!548912 m!525833))

(declare-fun m!525835 () Bool)

(assert (=> b!548912 m!525835))

(declare-fun m!525837 () Bool)

(assert (=> b!548911 m!525837))

(declare-fun m!525839 () Bool)

(assert (=> start!50120 m!525839))

(declare-fun m!525841 () Bool)

(assert (=> start!50120 m!525841))

(push 1)

