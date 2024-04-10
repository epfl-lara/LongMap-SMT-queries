; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50202 () Bool)

(assert start!50202)

(declare-fun b!549481 () Bool)

(declare-fun res!342631 () Bool)

(declare-fun e!317356 () Bool)

(assert (=> b!549481 (=> (not res!342631) (not e!317356))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549481 (= res!342631 (validKeyInArray!0 k!1914))))

(declare-fun res!342625 () Bool)

(assert (=> start!50202 (=> (not res!342625) (not e!317356))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50202 (= res!342625 (validMask!0 mask!3119))))

(assert (=> start!50202 e!317356))

(assert (=> start!50202 true))

(declare-datatypes ((array!34655 0))(
  ( (array!34656 (arr!16643 (Array (_ BitVec 32) (_ BitVec 64))) (size!17007 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34655)

(declare-fun array_inv!12439 (array!34655) Bool)

(assert (=> start!50202 (array_inv!12439 a!3118)))

(declare-fun b!549482 () Bool)

(declare-fun res!342628 () Bool)

(assert (=> b!549482 (=> (not res!342628) (not e!317356))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!549482 (= res!342628 (and (= (size!17007 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17007 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17007 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!549483 () Bool)

(declare-fun res!342630 () Bool)

(declare-fun e!317358 () Bool)

(assert (=> b!549483 (=> (not res!342630) (not e!317358))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34655 (_ BitVec 32)) Bool)

(assert (=> b!549483 (= res!342630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!549484 () Bool)

(assert (=> b!549484 (= e!317358 false)))

(declare-datatypes ((SeekEntryResult!5092 0))(
  ( (MissingZero!5092 (index!22595 (_ BitVec 32))) (Found!5092 (index!22596 (_ BitVec 32))) (Intermediate!5092 (undefined!5904 Bool) (index!22597 (_ BitVec 32)) (x!51526 (_ BitVec 32))) (Undefined!5092) (MissingVacant!5092 (index!22598 (_ BitVec 32))) )
))
(declare-fun lt!250157 () SeekEntryResult!5092)

(declare-fun lt!250156 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34655 (_ BitVec 32)) SeekEntryResult!5092)

(assert (=> b!549484 (= lt!250157 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250156 (select (store (arr!16643 a!3118) i!1132 k!1914) j!142) (array!34656 (store (arr!16643 a!3118) i!1132 k!1914) (size!17007 a!3118)) mask!3119))))

(declare-fun lt!250159 () (_ BitVec 32))

(declare-fun lt!250158 () SeekEntryResult!5092)

(assert (=> b!549484 (= lt!250158 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250159 (select (arr!16643 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549484 (= lt!250156 (toIndex!0 (select (store (arr!16643 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!549484 (= lt!250159 (toIndex!0 (select (arr!16643 a!3118) j!142) mask!3119))))

(declare-fun b!549485 () Bool)

(declare-fun res!342626 () Bool)

(assert (=> b!549485 (=> (not res!342626) (not e!317356))))

(assert (=> b!549485 (= res!342626 (validKeyInArray!0 (select (arr!16643 a!3118) j!142)))))

(declare-fun b!549486 () Bool)

(declare-fun res!342629 () Bool)

(assert (=> b!549486 (=> (not res!342629) (not e!317358))))

(declare-datatypes ((List!10723 0))(
  ( (Nil!10720) (Cons!10719 (h!11692 (_ BitVec 64)) (t!16951 List!10723)) )
))
(declare-fun arrayNoDuplicates!0 (array!34655 (_ BitVec 32) List!10723) Bool)

(assert (=> b!549486 (= res!342629 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10720))))

(declare-fun b!549487 () Bool)

(assert (=> b!549487 (= e!317356 e!317358)))

(declare-fun res!342632 () Bool)

(assert (=> b!549487 (=> (not res!342632) (not e!317358))))

(declare-fun lt!250155 () SeekEntryResult!5092)

(assert (=> b!549487 (= res!342632 (or (= lt!250155 (MissingZero!5092 i!1132)) (= lt!250155 (MissingVacant!5092 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34655 (_ BitVec 32)) SeekEntryResult!5092)

(assert (=> b!549487 (= lt!250155 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!549488 () Bool)

(declare-fun res!342627 () Bool)

(assert (=> b!549488 (=> (not res!342627) (not e!317356))))

(declare-fun arrayContainsKey!0 (array!34655 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549488 (= res!342627 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!50202 res!342625) b!549482))

(assert (= (and b!549482 res!342628) b!549485))

(assert (= (and b!549485 res!342626) b!549481))

(assert (= (and b!549481 res!342631) b!549488))

(assert (= (and b!549488 res!342627) b!549487))

(assert (= (and b!549487 res!342632) b!549483))

(assert (= (and b!549483 res!342630) b!549486))

(assert (= (and b!549486 res!342629) b!549484))

(declare-fun m!526341 () Bool)

(assert (=> b!549485 m!526341))

(assert (=> b!549485 m!526341))

(declare-fun m!526343 () Bool)

(assert (=> b!549485 m!526343))

(declare-fun m!526345 () Bool)

(assert (=> b!549483 m!526345))

(declare-fun m!526347 () Bool)

(assert (=> b!549486 m!526347))

(assert (=> b!549484 m!526341))

(declare-fun m!526349 () Bool)

(assert (=> b!549484 m!526349))

(assert (=> b!549484 m!526341))

(declare-fun m!526351 () Bool)

(assert (=> b!549484 m!526351))

(declare-fun m!526353 () Bool)

(assert (=> b!549484 m!526353))

(assert (=> b!549484 m!526351))

(declare-fun m!526355 () Bool)

(assert (=> b!549484 m!526355))

(assert (=> b!549484 m!526341))

(declare-fun m!526357 () Bool)

(assert (=> b!549484 m!526357))

(assert (=> b!549484 m!526351))

(declare-fun m!526359 () Bool)

(assert (=> b!549484 m!526359))

(declare-fun m!526361 () Bool)

(assert (=> b!549488 m!526361))

(declare-fun m!526363 () Bool)

(assert (=> b!549481 m!526363))

(declare-fun m!526365 () Bool)

(assert (=> start!50202 m!526365))

(declare-fun m!526367 () Bool)

(assert (=> start!50202 m!526367))

(declare-fun m!526369 () Bool)

(assert (=> b!549487 m!526369))

(push 1)

(assert (not b!549486))

