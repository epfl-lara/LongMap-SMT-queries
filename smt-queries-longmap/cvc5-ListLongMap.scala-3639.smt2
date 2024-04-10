; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50210 () Bool)

(assert start!50210)

(declare-fun b!549577 () Bool)

(declare-fun e!317394 () Bool)

(declare-fun e!317392 () Bool)

(assert (=> b!549577 (= e!317394 e!317392)))

(declare-fun res!342727 () Bool)

(assert (=> b!549577 (=> (not res!342727) (not e!317392))))

(declare-datatypes ((SeekEntryResult!5096 0))(
  ( (MissingZero!5096 (index!22611 (_ BitVec 32))) (Found!5096 (index!22612 (_ BitVec 32))) (Intermediate!5096 (undefined!5908 Bool) (index!22613 (_ BitVec 32)) (x!51546 (_ BitVec 32))) (Undefined!5096) (MissingVacant!5096 (index!22614 (_ BitVec 32))) )
))
(declare-fun lt!250218 () SeekEntryResult!5096)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!549577 (= res!342727 (or (= lt!250218 (MissingZero!5096 i!1132)) (= lt!250218 (MissingVacant!5096 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((array!34663 0))(
  ( (array!34664 (arr!16647 (Array (_ BitVec 32) (_ BitVec 64))) (size!17011 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34663)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34663 (_ BitVec 32)) SeekEntryResult!5096)

(assert (=> b!549577 (= lt!250218 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!549578 () Bool)

(assert (=> b!549578 (= e!317392 false)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!250216 () (_ BitVec 32))

(declare-fun lt!250215 () SeekEntryResult!5096)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34663 (_ BitVec 32)) SeekEntryResult!5096)

(assert (=> b!549578 (= lt!250215 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250216 (select (store (arr!16647 a!3118) i!1132 k!1914) j!142) (array!34664 (store (arr!16647 a!3118) i!1132 k!1914) (size!17011 a!3118)) mask!3119))))

(declare-fun lt!250217 () (_ BitVec 32))

(declare-fun lt!250219 () SeekEntryResult!5096)

(assert (=> b!549578 (= lt!250219 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250217 (select (arr!16647 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549578 (= lt!250216 (toIndex!0 (select (store (arr!16647 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!549578 (= lt!250217 (toIndex!0 (select (arr!16647 a!3118) j!142) mask!3119))))

(declare-fun b!549579 () Bool)

(declare-fun res!342723 () Bool)

(assert (=> b!549579 (=> (not res!342723) (not e!317394))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549579 (= res!342723 (validKeyInArray!0 (select (arr!16647 a!3118) j!142)))))

(declare-fun b!549580 () Bool)

(declare-fun res!342724 () Bool)

(assert (=> b!549580 (=> (not res!342724) (not e!317394))))

(declare-fun arrayContainsKey!0 (array!34663 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549580 (= res!342724 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!549581 () Bool)

(declare-fun res!342728 () Bool)

(assert (=> b!549581 (=> (not res!342728) (not e!317392))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34663 (_ BitVec 32)) Bool)

(assert (=> b!549581 (= res!342728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!342725 () Bool)

(assert (=> start!50210 (=> (not res!342725) (not e!317394))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50210 (= res!342725 (validMask!0 mask!3119))))

(assert (=> start!50210 e!317394))

(assert (=> start!50210 true))

(declare-fun array_inv!12443 (array!34663) Bool)

(assert (=> start!50210 (array_inv!12443 a!3118)))

(declare-fun b!549582 () Bool)

(declare-fun res!342726 () Bool)

(assert (=> b!549582 (=> (not res!342726) (not e!317394))))

(assert (=> b!549582 (= res!342726 (validKeyInArray!0 k!1914))))

(declare-fun b!549583 () Bool)

(declare-fun res!342721 () Bool)

(assert (=> b!549583 (=> (not res!342721) (not e!317392))))

(declare-datatypes ((List!10727 0))(
  ( (Nil!10724) (Cons!10723 (h!11696 (_ BitVec 64)) (t!16955 List!10727)) )
))
(declare-fun arrayNoDuplicates!0 (array!34663 (_ BitVec 32) List!10727) Bool)

(assert (=> b!549583 (= res!342721 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10724))))

(declare-fun b!549584 () Bool)

(declare-fun res!342722 () Bool)

(assert (=> b!549584 (=> (not res!342722) (not e!317394))))

(assert (=> b!549584 (= res!342722 (and (= (size!17011 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17011 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17011 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50210 res!342725) b!549584))

(assert (= (and b!549584 res!342722) b!549579))

(assert (= (and b!549579 res!342723) b!549582))

(assert (= (and b!549582 res!342726) b!549580))

(assert (= (and b!549580 res!342724) b!549577))

(assert (= (and b!549577 res!342727) b!549581))

(assert (= (and b!549581 res!342728) b!549583))

(assert (= (and b!549583 res!342721) b!549578))

(declare-fun m!526461 () Bool)

(assert (=> b!549579 m!526461))

(assert (=> b!549579 m!526461))

(declare-fun m!526463 () Bool)

(assert (=> b!549579 m!526463))

(declare-fun m!526465 () Bool)

(assert (=> b!549583 m!526465))

(declare-fun m!526467 () Bool)

(assert (=> b!549577 m!526467))

(declare-fun m!526469 () Bool)

(assert (=> start!50210 m!526469))

(declare-fun m!526471 () Bool)

(assert (=> start!50210 m!526471))

(declare-fun m!526473 () Bool)

(assert (=> b!549581 m!526473))

(declare-fun m!526475 () Bool)

(assert (=> b!549582 m!526475))

(declare-fun m!526477 () Bool)

(assert (=> b!549580 m!526477))

(assert (=> b!549578 m!526461))

(declare-fun m!526479 () Bool)

(assert (=> b!549578 m!526479))

(assert (=> b!549578 m!526461))

(declare-fun m!526481 () Bool)

(assert (=> b!549578 m!526481))

(declare-fun m!526483 () Bool)

(assert (=> b!549578 m!526483))

(assert (=> b!549578 m!526461))

(declare-fun m!526485 () Bool)

(assert (=> b!549578 m!526485))

(assert (=> b!549578 m!526481))

(declare-fun m!526487 () Bool)

(assert (=> b!549578 m!526487))

(assert (=> b!549578 m!526481))

(declare-fun m!526489 () Bool)

(assert (=> b!549578 m!526489))

(push 1)

