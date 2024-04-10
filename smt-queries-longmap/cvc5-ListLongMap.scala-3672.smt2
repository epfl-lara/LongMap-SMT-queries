; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50648 () Bool)

(assert start!50648)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!553643 () Bool)

(declare-fun e!319347 () Bool)

(declare-datatypes ((array!34873 0))(
  ( (array!34874 (arr!16746 (Array (_ BitVec 32) (_ BitVec 64))) (size!17110 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34873)

(declare-datatypes ((SeekEntryResult!5195 0))(
  ( (MissingZero!5195 (index!23007 (_ BitVec 32))) (Found!5195 (index!23008 (_ BitVec 32))) (Intermediate!5195 (undefined!6007 Bool) (index!23009 (_ BitVec 32)) (x!51933 (_ BitVec 32))) (Undefined!5195) (MissingVacant!5195 (index!23010 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34873 (_ BitVec 32)) SeekEntryResult!5195)

(assert (=> b!553643 (= e!319347 (= (seekEntryOrOpen!0 (select (arr!16746 a!3118) j!142) a!3118 mask!3119) (Found!5195 j!142)))))

(declare-fun b!553644 () Bool)

(declare-fun res!346059 () Bool)

(declare-fun e!319344 () Bool)

(assert (=> b!553644 (=> (not res!346059) (not e!319344))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553644 (= res!346059 (validKeyInArray!0 (select (arr!16746 a!3118) j!142)))))

(declare-fun b!553645 () Bool)

(declare-fun res!346058 () Bool)

(declare-fun e!319345 () Bool)

(assert (=> b!553645 (=> (not res!346058) (not e!319345))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34873 (_ BitVec 32)) SeekEntryResult!5195)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553645 (= res!346058 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16746 a!3118) j!142) mask!3119) (select (arr!16746 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16746 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16746 a!3118) i!1132 k!1914) j!142) (array!34874 (store (arr!16746 a!3118) i!1132 k!1914) (size!17110 a!3118)) mask!3119)))))

(declare-fun b!553646 () Bool)

(declare-fun res!346060 () Bool)

(assert (=> b!553646 (=> (not res!346060) (not e!319344))))

(assert (=> b!553646 (= res!346060 (and (= (size!17110 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17110 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17110 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!553647 () Bool)

(assert (=> b!553647 (= e!319345 (not true))))

(assert (=> b!553647 e!319347))

(declare-fun res!346062 () Bool)

(assert (=> b!553647 (=> (not res!346062) (not e!319347))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34873 (_ BitVec 32)) Bool)

(assert (=> b!553647 (= res!346062 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17164 0))(
  ( (Unit!17165) )
))
(declare-fun lt!251554 () Unit!17164)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34873 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17164)

(assert (=> b!553647 (= lt!251554 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!553648 () Bool)

(declare-fun res!346061 () Bool)

(assert (=> b!553648 (=> (not res!346061) (not e!319345))))

(declare-datatypes ((List!10826 0))(
  ( (Nil!10823) (Cons!10822 (h!11807 (_ BitVec 64)) (t!17054 List!10826)) )
))
(declare-fun arrayNoDuplicates!0 (array!34873 (_ BitVec 32) List!10826) Bool)

(assert (=> b!553648 (= res!346061 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10823))))

(declare-fun b!553650 () Bool)

(assert (=> b!553650 (= e!319344 e!319345)))

(declare-fun res!346056 () Bool)

(assert (=> b!553650 (=> (not res!346056) (not e!319345))))

(declare-fun lt!251553 () SeekEntryResult!5195)

(assert (=> b!553650 (= res!346056 (or (= lt!251553 (MissingZero!5195 i!1132)) (= lt!251553 (MissingVacant!5195 i!1132))))))

(assert (=> b!553650 (= lt!251553 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!346063 () Bool)

(assert (=> start!50648 (=> (not res!346063) (not e!319344))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50648 (= res!346063 (validMask!0 mask!3119))))

(assert (=> start!50648 e!319344))

(assert (=> start!50648 true))

(declare-fun array_inv!12542 (array!34873) Bool)

(assert (=> start!50648 (array_inv!12542 a!3118)))

(declare-fun b!553649 () Bool)

(declare-fun res!346064 () Bool)

(assert (=> b!553649 (=> (not res!346064) (not e!319344))))

(declare-fun arrayContainsKey!0 (array!34873 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553649 (= res!346064 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!553651 () Bool)

(declare-fun res!346055 () Bool)

(assert (=> b!553651 (=> (not res!346055) (not e!319345))))

(assert (=> b!553651 (= res!346055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!553652 () Bool)

(declare-fun res!346057 () Bool)

(assert (=> b!553652 (=> (not res!346057) (not e!319344))))

(assert (=> b!553652 (= res!346057 (validKeyInArray!0 k!1914))))

(assert (= (and start!50648 res!346063) b!553646))

(assert (= (and b!553646 res!346060) b!553644))

(assert (= (and b!553644 res!346059) b!553652))

(assert (= (and b!553652 res!346057) b!553649))

(assert (= (and b!553649 res!346064) b!553650))

(assert (= (and b!553650 res!346056) b!553651))

(assert (= (and b!553651 res!346055) b!553648))

(assert (= (and b!553648 res!346061) b!553645))

(assert (= (and b!553645 res!346058) b!553647))

(assert (= (and b!553647 res!346062) b!553643))

(declare-fun m!530769 () Bool)

(assert (=> b!553645 m!530769))

(declare-fun m!530771 () Bool)

(assert (=> b!553645 m!530771))

(assert (=> b!553645 m!530769))

(declare-fun m!530773 () Bool)

(assert (=> b!553645 m!530773))

(declare-fun m!530775 () Bool)

(assert (=> b!553645 m!530775))

(assert (=> b!553645 m!530773))

(declare-fun m!530777 () Bool)

(assert (=> b!553645 m!530777))

(assert (=> b!553645 m!530771))

(assert (=> b!553645 m!530769))

(declare-fun m!530779 () Bool)

(assert (=> b!553645 m!530779))

(declare-fun m!530781 () Bool)

(assert (=> b!553645 m!530781))

(assert (=> b!553645 m!530773))

(assert (=> b!553645 m!530775))

(declare-fun m!530783 () Bool)

(assert (=> b!553651 m!530783))

(declare-fun m!530785 () Bool)

(assert (=> start!50648 m!530785))

(declare-fun m!530787 () Bool)

(assert (=> start!50648 m!530787))

(declare-fun m!530789 () Bool)

(assert (=> b!553647 m!530789))

(declare-fun m!530791 () Bool)

(assert (=> b!553647 m!530791))

(declare-fun m!530793 () Bool)

(assert (=> b!553649 m!530793))

(declare-fun m!530795 () Bool)

(assert (=> b!553650 m!530795))

(assert (=> b!553643 m!530769))

(assert (=> b!553643 m!530769))

(declare-fun m!530797 () Bool)

(assert (=> b!553643 m!530797))

(declare-fun m!530799 () Bool)

(assert (=> b!553652 m!530799))

(assert (=> b!553644 m!530769))

(assert (=> b!553644 m!530769))

(declare-fun m!530801 () Bool)

(assert (=> b!553644 m!530801))

(declare-fun m!530803 () Bool)

(assert (=> b!553648 m!530803))

(push 1)

