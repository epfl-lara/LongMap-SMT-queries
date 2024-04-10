; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50064 () Bool)

(assert start!50064)

(declare-fun res!341912 () Bool)

(declare-fun e!316916 () Bool)

(assert (=> start!50064 (=> (not res!341912) (not e!316916))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50064 (= res!341912 (validMask!0 mask!3119))))

(assert (=> start!50064 e!316916))

(assert (=> start!50064 true))

(declare-datatypes ((array!34601 0))(
  ( (array!34602 (arr!16619 (Array (_ BitVec 32) (_ BitVec 64))) (size!16983 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34601)

(declare-fun array_inv!12415 (array!34601) Bool)

(assert (=> start!50064 (array_inv!12415 a!3118)))

(declare-fun b!548590 () Bool)

(declare-fun e!316915 () Bool)

(assert (=> b!548590 (= e!316916 e!316915)))

(declare-fun res!341918 () Bool)

(assert (=> b!548590 (=> (not res!341918) (not e!316915))))

(declare-datatypes ((SeekEntryResult!5068 0))(
  ( (MissingZero!5068 (index!22499 (_ BitVec 32))) (Found!5068 (index!22500 (_ BitVec 32))) (Intermediate!5068 (undefined!5880 Bool) (index!22501 (_ BitVec 32)) (x!51435 (_ BitVec 32))) (Undefined!5068) (MissingVacant!5068 (index!22502 (_ BitVec 32))) )
))
(declare-fun lt!249871 () SeekEntryResult!5068)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!548590 (= res!341918 (or (= lt!249871 (MissingZero!5068 i!1132)) (= lt!249871 (MissingVacant!5068 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34601 (_ BitVec 32)) SeekEntryResult!5068)

(assert (=> b!548590 (= lt!249871 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!548591 () Bool)

(assert (=> b!548591 (= e!316915 (bvslt mask!3119 #b00000000000000000000000000000000))))

(declare-fun b!548592 () Bool)

(declare-fun res!341913 () Bool)

(assert (=> b!548592 (=> (not res!341913) (not e!316916))))

(declare-fun arrayContainsKey!0 (array!34601 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!548592 (= res!341913 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!548593 () Bool)

(declare-fun res!341915 () Bool)

(assert (=> b!548593 (=> (not res!341915) (not e!316916))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!548593 (= res!341915 (and (= (size!16983 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16983 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16983 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!548594 () Bool)

(declare-fun res!341914 () Bool)

(assert (=> b!548594 (=> (not res!341914) (not e!316915))))

(declare-datatypes ((List!10699 0))(
  ( (Nil!10696) (Cons!10695 (h!11665 (_ BitVec 64)) (t!16927 List!10699)) )
))
(declare-fun arrayNoDuplicates!0 (array!34601 (_ BitVec 32) List!10699) Bool)

(assert (=> b!548594 (= res!341914 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10696))))

(declare-fun b!548595 () Bool)

(declare-fun res!341911 () Bool)

(assert (=> b!548595 (=> (not res!341911) (not e!316915))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34601 (_ BitVec 32)) Bool)

(assert (=> b!548595 (= res!341911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!548596 () Bool)

(declare-fun res!341916 () Bool)

(assert (=> b!548596 (=> (not res!341916) (not e!316916))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!548596 (= res!341916 (validKeyInArray!0 (select (arr!16619 a!3118) j!142)))))

(declare-fun b!548597 () Bool)

(declare-fun res!341917 () Bool)

(assert (=> b!548597 (=> (not res!341917) (not e!316916))))

(assert (=> b!548597 (= res!341917 (validKeyInArray!0 k!1914))))

(assert (= (and start!50064 res!341912) b!548593))

(assert (= (and b!548593 res!341915) b!548596))

(assert (= (and b!548596 res!341916) b!548597))

(assert (= (and b!548597 res!341917) b!548592))

(assert (= (and b!548592 res!341913) b!548590))

(assert (= (and b!548590 res!341918) b!548595))

(assert (= (and b!548595 res!341911) b!548594))

(assert (= (and b!548594 res!341914) b!548591))

(declare-fun m!525579 () Bool)

(assert (=> b!548590 m!525579))

(declare-fun m!525581 () Bool)

(assert (=> b!548596 m!525581))

(assert (=> b!548596 m!525581))

(declare-fun m!525583 () Bool)

(assert (=> b!548596 m!525583))

(declare-fun m!525585 () Bool)

(assert (=> b!548597 m!525585))

(declare-fun m!525587 () Bool)

(assert (=> b!548595 m!525587))

(declare-fun m!525589 () Bool)

(assert (=> b!548592 m!525589))

(declare-fun m!525591 () Bool)

(assert (=> b!548594 m!525591))

(declare-fun m!525593 () Bool)

(assert (=> start!50064 m!525593))

(declare-fun m!525595 () Bool)

(assert (=> start!50064 m!525595))

(push 1)

(assert (not start!50064))

(assert (not b!548594))

(assert (not b!548590))

(assert (not b!548592))

(assert (not b!548595))

(assert (not b!548596))

(assert (not b!548597))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

