; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50220 () Bool)

(assert start!50220)

(declare-fun b!549697 () Bool)

(declare-fun e!317437 () Bool)

(declare-fun e!317439 () Bool)

(assert (=> b!549697 (= e!317437 e!317439)))

(declare-fun res!342848 () Bool)

(assert (=> b!549697 (=> (not res!342848) (not e!317439))))

(declare-datatypes ((SeekEntryResult!5101 0))(
  ( (MissingZero!5101 (index!22631 (_ BitVec 32))) (Found!5101 (index!22632 (_ BitVec 32))) (Intermediate!5101 (undefined!5913 Bool) (index!22633 (_ BitVec 32)) (x!51559 (_ BitVec 32))) (Undefined!5101) (MissingVacant!5101 (index!22634 (_ BitVec 32))) )
))
(declare-fun lt!250293 () SeekEntryResult!5101)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!549697 (= res!342848 (or (= lt!250293 (MissingZero!5101 i!1132)) (= lt!250293 (MissingVacant!5101 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((array!34673 0))(
  ( (array!34674 (arr!16652 (Array (_ BitVec 32) (_ BitVec 64))) (size!17016 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34673)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34673 (_ BitVec 32)) SeekEntryResult!5101)

(assert (=> b!549697 (= lt!250293 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!342847 () Bool)

(assert (=> start!50220 (=> (not res!342847) (not e!317437))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50220 (= res!342847 (validMask!0 mask!3119))))

(assert (=> start!50220 e!317437))

(assert (=> start!50220 true))

(declare-fun array_inv!12448 (array!34673) Bool)

(assert (=> start!50220 (array_inv!12448 a!3118)))

(declare-fun b!549698 () Bool)

(declare-fun res!342846 () Bool)

(assert (=> b!549698 (=> (not res!342846) (not e!317437))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!549698 (= res!342846 (and (= (size!17016 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17016 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17016 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!549699 () Bool)

(declare-fun res!342844 () Bool)

(assert (=> b!549699 (=> (not res!342844) (not e!317439))))

(declare-datatypes ((List!10732 0))(
  ( (Nil!10729) (Cons!10728 (h!11701 (_ BitVec 64)) (t!16960 List!10732)) )
))
(declare-fun arrayNoDuplicates!0 (array!34673 (_ BitVec 32) List!10732) Bool)

(assert (=> b!549699 (= res!342844 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10729))))

(declare-fun b!549700 () Bool)

(declare-fun res!342841 () Bool)

(assert (=> b!549700 (=> (not res!342841) (not e!317437))))

(declare-fun arrayContainsKey!0 (array!34673 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549700 (= res!342841 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!549701 () Bool)

(declare-fun res!342843 () Bool)

(assert (=> b!549701 (=> (not res!342843) (not e!317437))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549701 (= res!342843 (validKeyInArray!0 (select (arr!16652 a!3118) j!142)))))

(declare-fun b!549702 () Bool)

(declare-fun res!342842 () Bool)

(assert (=> b!549702 (=> (not res!342842) (not e!317437))))

(assert (=> b!549702 (= res!342842 (validKeyInArray!0 k!1914))))

(declare-fun b!549703 () Bool)

(assert (=> b!549703 (= e!317439 false)))

(declare-fun lt!250294 () (_ BitVec 32))

(declare-fun lt!250290 () SeekEntryResult!5101)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34673 (_ BitVec 32)) SeekEntryResult!5101)

(assert (=> b!549703 (= lt!250290 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250294 (select (store (arr!16652 a!3118) i!1132 k!1914) j!142) (array!34674 (store (arr!16652 a!3118) i!1132 k!1914) (size!17016 a!3118)) mask!3119))))

(declare-fun lt!250292 () (_ BitVec 32))

(declare-fun lt!250291 () SeekEntryResult!5101)

(assert (=> b!549703 (= lt!250291 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250292 (select (arr!16652 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549703 (= lt!250294 (toIndex!0 (select (store (arr!16652 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!549703 (= lt!250292 (toIndex!0 (select (arr!16652 a!3118) j!142) mask!3119))))

(declare-fun b!549704 () Bool)

(declare-fun res!342845 () Bool)

(assert (=> b!549704 (=> (not res!342845) (not e!317439))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34673 (_ BitVec 32)) Bool)

(assert (=> b!549704 (= res!342845 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!50220 res!342847) b!549698))

(assert (= (and b!549698 res!342846) b!549701))

(assert (= (and b!549701 res!342843) b!549702))

(assert (= (and b!549702 res!342842) b!549700))

(assert (= (and b!549700 res!342841) b!549697))

(assert (= (and b!549697 res!342848) b!549704))

(assert (= (and b!549704 res!342845) b!549699))

(assert (= (and b!549699 res!342844) b!549703))

(declare-fun m!526611 () Bool)

(assert (=> b!549699 m!526611))

(declare-fun m!526613 () Bool)

(assert (=> b!549700 m!526613))

(declare-fun m!526615 () Bool)

(assert (=> start!50220 m!526615))

(declare-fun m!526617 () Bool)

(assert (=> start!50220 m!526617))

(declare-fun m!526619 () Bool)

(assert (=> b!549701 m!526619))

(assert (=> b!549701 m!526619))

(declare-fun m!526621 () Bool)

(assert (=> b!549701 m!526621))

(declare-fun m!526623 () Bool)

(assert (=> b!549704 m!526623))

(declare-fun m!526625 () Bool)

(assert (=> b!549697 m!526625))

(declare-fun m!526627 () Bool)

(assert (=> b!549703 m!526627))

(declare-fun m!526629 () Bool)

(assert (=> b!549703 m!526629))

(assert (=> b!549703 m!526619))

(declare-fun m!526631 () Bool)

(assert (=> b!549703 m!526631))

(assert (=> b!549703 m!526619))

(assert (=> b!549703 m!526627))

(declare-fun m!526633 () Bool)

(assert (=> b!549703 m!526633))

(assert (=> b!549703 m!526619))

(declare-fun m!526635 () Bool)

(assert (=> b!549703 m!526635))

(assert (=> b!549703 m!526627))

(declare-fun m!526637 () Bool)

(assert (=> b!549703 m!526637))

(declare-fun m!526639 () Bool)

(assert (=> b!549702 m!526639))

(push 1)

(assert (not b!549703))

