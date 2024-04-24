; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50104 () Bool)

(assert start!50104)

(declare-fun b!548694 () Bool)

(declare-fun res!341912 () Bool)

(declare-fun e!317009 () Bool)

(assert (=> b!548694 (=> (not res!341912) (not e!317009))))

(declare-datatypes ((array!34587 0))(
  ( (array!34588 (arr!16610 (Array (_ BitVec 32) (_ BitVec 64))) (size!16974 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34587)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34587 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!548694 (= res!341912 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun res!341917 () Bool)

(assert (=> start!50104 (=> (not res!341917) (not e!317009))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50104 (= res!341917 (validMask!0 mask!3119))))

(assert (=> start!50104 e!317009))

(assert (=> start!50104 true))

(declare-fun array_inv!12469 (array!34587) Bool)

(assert (=> start!50104 (array_inv!12469 a!3118)))

(declare-fun b!548695 () Bool)

(declare-fun res!341911 () Bool)

(assert (=> b!548695 (=> (not res!341911) (not e!317009))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!548695 (= res!341911 (and (= (size!16974 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16974 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16974 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!548696 () Bool)

(declare-fun res!341913 () Bool)

(declare-fun e!317010 () Bool)

(assert (=> b!548696 (=> (not res!341913) (not e!317010))))

(declare-datatypes ((List!10597 0))(
  ( (Nil!10594) (Cons!10593 (h!11566 (_ BitVec 64)) (t!16817 List!10597)) )
))
(declare-fun arrayNoDuplicates!0 (array!34587 (_ BitVec 32) List!10597) Bool)

(assert (=> b!548696 (= res!341913 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10594))))

(declare-fun b!548697 () Bool)

(assert (=> b!548697 (= e!317010 false)))

(declare-fun lt!249967 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!548697 (= lt!249967 (toIndex!0 (select (arr!16610 a!3118) j!142) mask!3119))))

(declare-fun b!548698 () Bool)

(declare-fun res!341916 () Bool)

(assert (=> b!548698 (=> (not res!341916) (not e!317009))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!548698 (= res!341916 (validKeyInArray!0 (select (arr!16610 a!3118) j!142)))))

(declare-fun b!548699 () Bool)

(assert (=> b!548699 (= e!317009 e!317010)))

(declare-fun res!341915 () Bool)

(assert (=> b!548699 (=> (not res!341915) (not e!317010))))

(declare-datatypes ((SeekEntryResult!5015 0))(
  ( (MissingZero!5015 (index!22287 (_ BitVec 32))) (Found!5015 (index!22288 (_ BitVec 32))) (Intermediate!5015 (undefined!5827 Bool) (index!22289 (_ BitVec 32)) (x!51377 (_ BitVec 32))) (Undefined!5015) (MissingVacant!5015 (index!22290 (_ BitVec 32))) )
))
(declare-fun lt!249966 () SeekEntryResult!5015)

(assert (=> b!548699 (= res!341915 (or (= lt!249966 (MissingZero!5015 i!1132)) (= lt!249966 (MissingVacant!5015 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34587 (_ BitVec 32)) SeekEntryResult!5015)

(assert (=> b!548699 (= lt!249966 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!548700 () Bool)

(declare-fun res!341910 () Bool)

(assert (=> b!548700 (=> (not res!341910) (not e!317010))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34587 (_ BitVec 32)) Bool)

(assert (=> b!548700 (= res!341910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!548701 () Bool)

(declare-fun res!341914 () Bool)

(assert (=> b!548701 (=> (not res!341914) (not e!317009))))

(assert (=> b!548701 (= res!341914 (validKeyInArray!0 k!1914))))

(assert (= (and start!50104 res!341917) b!548695))

(assert (= (and b!548695 res!341911) b!548698))

(assert (= (and b!548698 res!341916) b!548701))

(assert (= (and b!548701 res!341914) b!548694))

(assert (= (and b!548694 res!341912) b!548699))

(assert (= (and b!548699 res!341915) b!548700))

(assert (= (and b!548700 res!341910) b!548696))

(assert (= (and b!548696 res!341913) b!548697))

(declare-fun m!525855 () Bool)

(assert (=> b!548694 m!525855))

(declare-fun m!525857 () Bool)

(assert (=> b!548700 m!525857))

(declare-fun m!525859 () Bool)

(assert (=> b!548697 m!525859))

(assert (=> b!548697 m!525859))

(declare-fun m!525861 () Bool)

(assert (=> b!548697 m!525861))

(declare-fun m!525863 () Bool)

(assert (=> start!50104 m!525863))

(declare-fun m!525865 () Bool)

(assert (=> start!50104 m!525865))

(declare-fun m!525867 () Bool)

(assert (=> b!548701 m!525867))

(declare-fun m!525869 () Bool)

(assert (=> b!548696 m!525869))

(declare-fun m!525871 () Bool)

(assert (=> b!548699 m!525871))

(assert (=> b!548698 m!525859))

(assert (=> b!548698 m!525859))

(declare-fun m!525873 () Bool)

(assert (=> b!548698 m!525873))

(push 1)

(assert (not b!548696))

(assert (not b!548699))

(assert (not b!548701))

(assert (not start!50104))

(assert (not b!548698))

(assert (not b!548700))

(assert (not b!548694))

(assert (not b!548697))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

