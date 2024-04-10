; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50114 () Bool)

(assert start!50114)

(declare-fun b!548839 () Bool)

(declare-fun res!342070 () Bool)

(declare-fun e!317060 () Bool)

(assert (=> b!548839 (=> (not res!342070) (not e!317060))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!548839 (= res!342070 (validKeyInArray!0 k!1914))))

(declare-fun b!548840 () Bool)

(declare-fun res!342077 () Bool)

(assert (=> b!548840 (=> (not res!342077) (not e!317060))))

(declare-datatypes ((array!34612 0))(
  ( (array!34613 (arr!16623 (Array (_ BitVec 32) (_ BitVec 64))) (size!16987 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34612)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!548840 (= res!342077 (validKeyInArray!0 (select (arr!16623 a!3118) j!142)))))

(declare-fun b!548841 () Bool)

(declare-fun res!342071 () Bool)

(declare-fun e!317061 () Bool)

(assert (=> b!548841 (=> (not res!342071) (not e!317061))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34612 (_ BitVec 32)) Bool)

(assert (=> b!548841 (= res!342071 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!548842 () Bool)

(assert (=> b!548842 (= e!317061 false)))

(declare-fun lt!249939 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!548842 (= lt!249939 (toIndex!0 (select (store (arr!16623 a!3118) i!1132 k!1914) j!142) mask!3119))))

(declare-fun b!548843 () Bool)

(declare-fun res!342072 () Bool)

(assert (=> b!548843 (=> (not res!342072) (not e!317060))))

(assert (=> b!548843 (= res!342072 (and (= (size!16987 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16987 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16987 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!548845 () Bool)

(assert (=> b!548845 (= e!317060 e!317061)))

(declare-fun res!342075 () Bool)

(assert (=> b!548845 (=> (not res!342075) (not e!317061))))

(declare-datatypes ((SeekEntryResult!5072 0))(
  ( (MissingZero!5072 (index!22515 (_ BitVec 32))) (Found!5072 (index!22516 (_ BitVec 32))) (Intermediate!5072 (undefined!5884 Bool) (index!22517 (_ BitVec 32)) (x!51455 (_ BitVec 32))) (Undefined!5072) (MissingVacant!5072 (index!22518 (_ BitVec 32))) )
))
(declare-fun lt!249940 () SeekEntryResult!5072)

(assert (=> b!548845 (= res!342075 (or (= lt!249940 (MissingZero!5072 i!1132)) (= lt!249940 (MissingVacant!5072 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34612 (_ BitVec 32)) SeekEntryResult!5072)

(assert (=> b!548845 (= lt!249940 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!548846 () Bool)

(declare-fun res!342076 () Bool)

(assert (=> b!548846 (=> (not res!342076) (not e!317060))))

(declare-fun arrayContainsKey!0 (array!34612 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!548846 (= res!342076 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun res!342073 () Bool)

(assert (=> start!50114 (=> (not res!342073) (not e!317060))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50114 (= res!342073 (validMask!0 mask!3119))))

(assert (=> start!50114 e!317060))

(assert (=> start!50114 true))

(declare-fun array_inv!12419 (array!34612) Bool)

(assert (=> start!50114 (array_inv!12419 a!3118)))

(declare-fun b!548844 () Bool)

(declare-fun res!342074 () Bool)

(assert (=> b!548844 (=> (not res!342074) (not e!317061))))

(declare-datatypes ((List!10703 0))(
  ( (Nil!10700) (Cons!10699 (h!11669 (_ BitVec 64)) (t!16931 List!10703)) )
))
(declare-fun arrayNoDuplicates!0 (array!34612 (_ BitVec 32) List!10703) Bool)

(assert (=> b!548844 (= res!342074 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10700))))

(assert (= (and start!50114 res!342073) b!548843))

(assert (= (and b!548843 res!342072) b!548840))

(assert (= (and b!548840 res!342077) b!548839))

(assert (= (and b!548839 res!342070) b!548846))

(assert (= (and b!548846 res!342076) b!548845))

(assert (= (and b!548845 res!342075) b!548841))

(assert (= (and b!548841 res!342071) b!548844))

(assert (= (and b!548844 res!342074) b!548842))

(declare-fun m!525747 () Bool)

(assert (=> b!548842 m!525747))

(declare-fun m!525749 () Bool)

(assert (=> b!548842 m!525749))

(assert (=> b!548842 m!525749))

(declare-fun m!525751 () Bool)

(assert (=> b!548842 m!525751))

(declare-fun m!525753 () Bool)

(assert (=> b!548839 m!525753))

(declare-fun m!525755 () Bool)

(assert (=> b!548845 m!525755))

(declare-fun m!525757 () Bool)

(assert (=> b!548846 m!525757))

(declare-fun m!525759 () Bool)

(assert (=> b!548844 m!525759))

(declare-fun m!525761 () Bool)

(assert (=> start!50114 m!525761))

(declare-fun m!525763 () Bool)

(assert (=> start!50114 m!525763))

(declare-fun m!525765 () Bool)

(assert (=> b!548840 m!525765))

(assert (=> b!548840 m!525765))

(declare-fun m!525767 () Bool)

(assert (=> b!548840 m!525767))

(declare-fun m!525769 () Bool)

(assert (=> b!548841 m!525769))

(push 1)

