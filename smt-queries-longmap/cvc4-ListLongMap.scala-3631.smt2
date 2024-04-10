; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50118 () Bool)

(assert start!50118)

(declare-fun b!548887 () Bool)

(declare-fun res!342119 () Bool)

(declare-fun e!317077 () Bool)

(assert (=> b!548887 (=> (not res!342119) (not e!317077))))

(declare-datatypes ((array!34616 0))(
  ( (array!34617 (arr!16625 (Array (_ BitVec 32) (_ BitVec 64))) (size!16989 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34616)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34616 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!548887 (= res!342119 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!548888 () Bool)

(declare-fun res!342125 () Bool)

(declare-fun e!317079 () Bool)

(assert (=> b!548888 (=> (not res!342125) (not e!317079))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34616 (_ BitVec 32)) Bool)

(assert (=> b!548888 (= res!342125 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!548889 () Bool)

(declare-fun res!342120 () Bool)

(assert (=> b!548889 (=> (not res!342120) (not e!317077))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!548889 (= res!342120 (validKeyInArray!0 k!1914))))

(declare-fun b!548890 () Bool)

(assert (=> b!548890 (= e!317079 false)))

(declare-fun lt!249951 () (_ BitVec 32))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!548890 (= lt!249951 (toIndex!0 (select (store (arr!16625 a!3118) i!1132 k!1914) j!142) mask!3119))))

(declare-fun b!548891 () Bool)

(declare-fun res!342118 () Bool)

(assert (=> b!548891 (=> (not res!342118) (not e!317079))))

(declare-datatypes ((List!10705 0))(
  ( (Nil!10702) (Cons!10701 (h!11671 (_ BitVec 64)) (t!16933 List!10705)) )
))
(declare-fun arrayNoDuplicates!0 (array!34616 (_ BitVec 32) List!10705) Bool)

(assert (=> b!548891 (= res!342118 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10702))))

(declare-fun b!548892 () Bool)

(declare-fun res!342122 () Bool)

(assert (=> b!548892 (=> (not res!342122) (not e!317077))))

(assert (=> b!548892 (= res!342122 (validKeyInArray!0 (select (arr!16625 a!3118) j!142)))))

(declare-fun res!342124 () Bool)

(assert (=> start!50118 (=> (not res!342124) (not e!317077))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50118 (= res!342124 (validMask!0 mask!3119))))

(assert (=> start!50118 e!317077))

(assert (=> start!50118 true))

(declare-fun array_inv!12421 (array!34616) Bool)

(assert (=> start!50118 (array_inv!12421 a!3118)))

(declare-fun b!548893 () Bool)

(assert (=> b!548893 (= e!317077 e!317079)))

(declare-fun res!342123 () Bool)

(assert (=> b!548893 (=> (not res!342123) (not e!317079))))

(declare-datatypes ((SeekEntryResult!5074 0))(
  ( (MissingZero!5074 (index!22523 (_ BitVec 32))) (Found!5074 (index!22524 (_ BitVec 32))) (Intermediate!5074 (undefined!5886 Bool) (index!22525 (_ BitVec 32)) (x!51457 (_ BitVec 32))) (Undefined!5074) (MissingVacant!5074 (index!22526 (_ BitVec 32))) )
))
(declare-fun lt!249952 () SeekEntryResult!5074)

(assert (=> b!548893 (= res!342123 (or (= lt!249952 (MissingZero!5074 i!1132)) (= lt!249952 (MissingVacant!5074 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34616 (_ BitVec 32)) SeekEntryResult!5074)

(assert (=> b!548893 (= lt!249952 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!548894 () Bool)

(declare-fun res!342121 () Bool)

(assert (=> b!548894 (=> (not res!342121) (not e!317077))))

(assert (=> b!548894 (= res!342121 (and (= (size!16989 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16989 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16989 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50118 res!342124) b!548894))

(assert (= (and b!548894 res!342121) b!548892))

(assert (= (and b!548892 res!342122) b!548889))

(assert (= (and b!548889 res!342120) b!548887))

(assert (= (and b!548887 res!342119) b!548893))

(assert (= (and b!548893 res!342123) b!548888))

(assert (= (and b!548888 res!342125) b!548891))

(assert (= (and b!548891 res!342118) b!548890))

(declare-fun m!525795 () Bool)

(assert (=> b!548890 m!525795))

(declare-fun m!525797 () Bool)

(assert (=> b!548890 m!525797))

(assert (=> b!548890 m!525797))

(declare-fun m!525799 () Bool)

(assert (=> b!548890 m!525799))

(declare-fun m!525801 () Bool)

(assert (=> start!50118 m!525801))

(declare-fun m!525803 () Bool)

(assert (=> start!50118 m!525803))

(declare-fun m!525805 () Bool)

(assert (=> b!548892 m!525805))

(assert (=> b!548892 m!525805))

(declare-fun m!525807 () Bool)

(assert (=> b!548892 m!525807))

(declare-fun m!525809 () Bool)

(assert (=> b!548893 m!525809))

(declare-fun m!525811 () Bool)

(assert (=> b!548891 m!525811))

(declare-fun m!525813 () Bool)

(assert (=> b!548888 m!525813))

(declare-fun m!525815 () Bool)

(assert (=> b!548889 m!525815))

(declare-fun m!525817 () Bool)

(assert (=> b!548887 m!525817))

(push 1)

(assert (not b!548893))

(assert (not start!50118))

(assert (not b!548892))

