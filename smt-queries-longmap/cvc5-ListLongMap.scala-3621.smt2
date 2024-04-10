; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49922 () Bool)

(assert start!49922)

(declare-fun res!341161 () Bool)

(declare-fun e!316465 () Bool)

(assert (=> start!49922 (=> (not res!341161) (not e!316465))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49922 (= res!341161 (validMask!0 mask!3119))))

(assert (=> start!49922 e!316465))

(assert (=> start!49922 true))

(declare-datatypes ((array!34543 0))(
  ( (array!34544 (arr!16593 (Array (_ BitVec 32) (_ BitVec 64))) (size!16957 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34543)

(declare-fun array_inv!12389 (array!34543) Bool)

(assert (=> start!49922 (array_inv!12389 a!3118)))

(declare-fun b!547660 () Bool)

(declare-fun res!341164 () Bool)

(declare-fun e!316466 () Bool)

(assert (=> b!547660 (=> (not res!341164) (not e!316466))))

(declare-datatypes ((List!10673 0))(
  ( (Nil!10670) (Cons!10669 (h!11636 (_ BitVec 64)) (t!16901 List!10673)) )
))
(declare-fun arrayNoDuplicates!0 (array!34543 (_ BitVec 32) List!10673) Bool)

(assert (=> b!547660 (= res!341164 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10670))))

(declare-fun b!547661 () Bool)

(assert (=> b!547661 (= e!316465 e!316466)))

(declare-fun res!341160 () Bool)

(assert (=> b!547661 (=> (not res!341160) (not e!316466))))

(declare-datatypes ((SeekEntryResult!5042 0))(
  ( (MissingZero!5042 (index!22395 (_ BitVec 32))) (Found!5042 (index!22396 (_ BitVec 32))) (Intermediate!5042 (undefined!5854 Bool) (index!22397 (_ BitVec 32)) (x!51342 (_ BitVec 32))) (Undefined!5042) (MissingVacant!5042 (index!22398 (_ BitVec 32))) )
))
(declare-fun lt!249613 () SeekEntryResult!5042)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!547661 (= res!341160 (or (= lt!249613 (MissingZero!5042 i!1132)) (= lt!249613 (MissingVacant!5042 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34543 (_ BitVec 32)) SeekEntryResult!5042)

(assert (=> b!547661 (= lt!249613 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!547662 () Bool)

(declare-fun res!341165 () Bool)

(assert (=> b!547662 (=> (not res!341165) (not e!316465))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!547662 (= res!341165 (validKeyInArray!0 (select (arr!16593 a!3118) j!142)))))

(declare-fun b!547663 () Bool)

(declare-fun res!341162 () Bool)

(assert (=> b!547663 (=> (not res!341162) (not e!316466))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34543 (_ BitVec 32)) Bool)

(assert (=> b!547663 (= res!341162 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!547664 () Bool)

(declare-fun res!341159 () Bool)

(assert (=> b!547664 (=> (not res!341159) (not e!316465))))

(assert (=> b!547664 (= res!341159 (validKeyInArray!0 k!1914))))

(declare-fun b!547665 () Bool)

(declare-fun res!341158 () Bool)

(assert (=> b!547665 (=> (not res!341158) (not e!316465))))

(assert (=> b!547665 (= res!341158 (and (= (size!16957 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16957 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16957 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!547666 () Bool)

(assert (=> b!547666 (= e!316466 (bvslt mask!3119 #b00000000000000000000000000000000))))

(declare-fun b!547667 () Bool)

(declare-fun res!341163 () Bool)

(assert (=> b!547667 (=> (not res!341163) (not e!316465))))

(declare-fun arrayContainsKey!0 (array!34543 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!547667 (= res!341163 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!49922 res!341161) b!547665))

(assert (= (and b!547665 res!341158) b!547662))

(assert (= (and b!547662 res!341165) b!547664))

(assert (= (and b!547664 res!341159) b!547667))

(assert (= (and b!547667 res!341163) b!547661))

(assert (= (and b!547661 res!341160) b!547663))

(assert (= (and b!547663 res!341162) b!547660))

(assert (= (and b!547660 res!341164) b!547666))

(declare-fun m!524883 () Bool)

(assert (=> b!547662 m!524883))

(assert (=> b!547662 m!524883))

(declare-fun m!524885 () Bool)

(assert (=> b!547662 m!524885))

(declare-fun m!524887 () Bool)

(assert (=> b!547663 m!524887))

(declare-fun m!524889 () Bool)

(assert (=> b!547660 m!524889))

(declare-fun m!524891 () Bool)

(assert (=> b!547664 m!524891))

(declare-fun m!524893 () Bool)

(assert (=> b!547667 m!524893))

(declare-fun m!524895 () Bool)

(assert (=> start!49922 m!524895))

(declare-fun m!524897 () Bool)

(assert (=> start!49922 m!524897))

(declare-fun m!524899 () Bool)

(assert (=> b!547661 m!524899))

(push 1)

