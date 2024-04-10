; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50214 () Bool)

(assert start!50214)

(declare-fun b!549625 () Bool)

(declare-fun res!342773 () Bool)

(declare-fun e!317411 () Bool)

(assert (=> b!549625 (=> (not res!342773) (not e!317411))))

(declare-datatypes ((array!34667 0))(
  ( (array!34668 (arr!16649 (Array (_ BitVec 32) (_ BitVec 64))) (size!17013 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34667)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549625 (= res!342773 (validKeyInArray!0 (select (arr!16649 a!3118) j!142)))))

(declare-fun b!549626 () Bool)

(declare-fun res!342774 () Bool)

(assert (=> b!549626 (=> (not res!342774) (not e!317411))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34667 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549626 (= res!342774 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!549627 () Bool)

(declare-fun e!317410 () Bool)

(assert (=> b!549627 (= e!317410 false)))

(declare-fun lt!250248 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5098 0))(
  ( (MissingZero!5098 (index!22619 (_ BitVec 32))) (Found!5098 (index!22620 (_ BitVec 32))) (Intermediate!5098 (undefined!5910 Bool) (index!22621 (_ BitVec 32)) (x!51548 (_ BitVec 32))) (Undefined!5098) (MissingVacant!5098 (index!22622 (_ BitVec 32))) )
))
(declare-fun lt!250246 () SeekEntryResult!5098)

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34667 (_ BitVec 32)) SeekEntryResult!5098)

(assert (=> b!549627 (= lt!250246 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250248 (select (store (arr!16649 a!3118) i!1132 k!1914) j!142) (array!34668 (store (arr!16649 a!3118) i!1132 k!1914) (size!17013 a!3118)) mask!3119))))

(declare-fun lt!250247 () (_ BitVec 32))

(declare-fun lt!250249 () SeekEntryResult!5098)

(assert (=> b!549627 (= lt!250249 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250247 (select (arr!16649 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549627 (= lt!250248 (toIndex!0 (select (store (arr!16649 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!549627 (= lt!250247 (toIndex!0 (select (arr!16649 a!3118) j!142) mask!3119))))

(declare-fun b!549628 () Bool)

(assert (=> b!549628 (= e!317411 e!317410)))

(declare-fun res!342776 () Bool)

(assert (=> b!549628 (=> (not res!342776) (not e!317410))))

(declare-fun lt!250245 () SeekEntryResult!5098)

(assert (=> b!549628 (= res!342776 (or (= lt!250245 (MissingZero!5098 i!1132)) (= lt!250245 (MissingVacant!5098 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34667 (_ BitVec 32)) SeekEntryResult!5098)

(assert (=> b!549628 (= lt!250245 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!549629 () Bool)

(declare-fun res!342772 () Bool)

(assert (=> b!549629 (=> (not res!342772) (not e!317411))))

(assert (=> b!549629 (= res!342772 (and (= (size!17013 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17013 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17013 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!549630 () Bool)

(declare-fun res!342775 () Bool)

(assert (=> b!549630 (=> (not res!342775) (not e!317411))))

(assert (=> b!549630 (= res!342775 (validKeyInArray!0 k!1914))))

(declare-fun res!342769 () Bool)

(assert (=> start!50214 (=> (not res!342769) (not e!317411))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50214 (= res!342769 (validMask!0 mask!3119))))

(assert (=> start!50214 e!317411))

(assert (=> start!50214 true))

(declare-fun array_inv!12445 (array!34667) Bool)

(assert (=> start!50214 (array_inv!12445 a!3118)))

(declare-fun b!549631 () Bool)

(declare-fun res!342770 () Bool)

(assert (=> b!549631 (=> (not res!342770) (not e!317410))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34667 (_ BitVec 32)) Bool)

(assert (=> b!549631 (= res!342770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!549632 () Bool)

(declare-fun res!342771 () Bool)

(assert (=> b!549632 (=> (not res!342771) (not e!317410))))

(declare-datatypes ((List!10729 0))(
  ( (Nil!10726) (Cons!10725 (h!11698 (_ BitVec 64)) (t!16957 List!10729)) )
))
(declare-fun arrayNoDuplicates!0 (array!34667 (_ BitVec 32) List!10729) Bool)

(assert (=> b!549632 (= res!342771 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10726))))

(assert (= (and start!50214 res!342769) b!549629))

(assert (= (and b!549629 res!342772) b!549625))

(assert (= (and b!549625 res!342773) b!549630))

(assert (= (and b!549630 res!342775) b!549626))

(assert (= (and b!549626 res!342774) b!549628))

(assert (= (and b!549628 res!342776) b!549631))

(assert (= (and b!549631 res!342770) b!549632))

(assert (= (and b!549632 res!342771) b!549627))

(declare-fun m!526521 () Bool)

(assert (=> start!50214 m!526521))

(declare-fun m!526523 () Bool)

(assert (=> start!50214 m!526523))

(declare-fun m!526525 () Bool)

(assert (=> b!549627 m!526525))

(declare-fun m!526527 () Bool)

(assert (=> b!549627 m!526527))

(assert (=> b!549627 m!526525))

(declare-fun m!526529 () Bool)

(assert (=> b!549627 m!526529))

(assert (=> b!549627 m!526529))

(declare-fun m!526531 () Bool)

(assert (=> b!549627 m!526531))

(declare-fun m!526533 () Bool)

(assert (=> b!549627 m!526533))

(assert (=> b!549627 m!526525))

(declare-fun m!526535 () Bool)

(assert (=> b!549627 m!526535))

(assert (=> b!549627 m!526529))

(declare-fun m!526537 () Bool)

(assert (=> b!549627 m!526537))

(declare-fun m!526539 () Bool)

(assert (=> b!549628 m!526539))

(declare-fun m!526541 () Bool)

(assert (=> b!549632 m!526541))

(declare-fun m!526543 () Bool)

(assert (=> b!549631 m!526543))

(declare-fun m!526545 () Bool)

(assert (=> b!549626 m!526545))

(declare-fun m!526547 () Bool)

(assert (=> b!549630 m!526547))

(assert (=> b!549625 m!526525))

(assert (=> b!549625 m!526525))

(declare-fun m!526549 () Bool)

(assert (=> b!549625 m!526549))

(push 1)

(assert (not b!549628))

(assert (not b!549630))

(assert (not b!549625))

(assert (not start!50214))

