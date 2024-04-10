; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50058 () Bool)

(assert start!50058)

(declare-fun b!548518 () Bool)

(declare-fun res!341841 () Bool)

(declare-fun e!316888 () Bool)

(assert (=> b!548518 (=> (not res!341841) (not e!316888))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!34595 0))(
  ( (array!34596 (arr!16616 (Array (_ BitVec 32) (_ BitVec 64))) (size!16980 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34595)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!548518 (= res!341841 (and (= (size!16980 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16980 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16980 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!548519 () Bool)

(declare-fun e!316889 () Bool)

(assert (=> b!548519 (= e!316889 false)))

(declare-fun lt!249862 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!548519 (= lt!249862 (toIndex!0 (select (arr!16616 a!3118) j!142) mask!3119))))

(declare-fun b!548520 () Bool)

(declare-fun res!341844 () Bool)

(assert (=> b!548520 (=> (not res!341844) (not e!316888))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34595 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!548520 (= res!341844 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!548522 () Bool)

(declare-fun res!341846 () Bool)

(assert (=> b!548522 (=> (not res!341846) (not e!316888))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!548522 (= res!341846 (validKeyInArray!0 k!1914))))

(declare-fun b!548523 () Bool)

(declare-fun res!341843 () Bool)

(assert (=> b!548523 (=> (not res!341843) (not e!316889))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34595 (_ BitVec 32)) Bool)

(assert (=> b!548523 (= res!341843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!548524 () Bool)

(assert (=> b!548524 (= e!316888 e!316889)))

(declare-fun res!341839 () Bool)

(assert (=> b!548524 (=> (not res!341839) (not e!316889))))

(declare-datatypes ((SeekEntryResult!5065 0))(
  ( (MissingZero!5065 (index!22487 (_ BitVec 32))) (Found!5065 (index!22488 (_ BitVec 32))) (Intermediate!5065 (undefined!5877 Bool) (index!22489 (_ BitVec 32)) (x!51424 (_ BitVec 32))) (Undefined!5065) (MissingVacant!5065 (index!22490 (_ BitVec 32))) )
))
(declare-fun lt!249861 () SeekEntryResult!5065)

(assert (=> b!548524 (= res!341839 (or (= lt!249861 (MissingZero!5065 i!1132)) (= lt!249861 (MissingVacant!5065 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34595 (_ BitVec 32)) SeekEntryResult!5065)

(assert (=> b!548524 (= lt!249861 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!548525 () Bool)

(declare-fun res!341842 () Bool)

(assert (=> b!548525 (=> (not res!341842) (not e!316888))))

(assert (=> b!548525 (= res!341842 (validKeyInArray!0 (select (arr!16616 a!3118) j!142)))))

(declare-fun b!548521 () Bool)

(declare-fun res!341845 () Bool)

(assert (=> b!548521 (=> (not res!341845) (not e!316889))))

(declare-datatypes ((List!10696 0))(
  ( (Nil!10693) (Cons!10692 (h!11662 (_ BitVec 64)) (t!16924 List!10696)) )
))
(declare-fun arrayNoDuplicates!0 (array!34595 (_ BitVec 32) List!10696) Bool)

(assert (=> b!548521 (= res!341845 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10693))))

(declare-fun res!341840 () Bool)

(assert (=> start!50058 (=> (not res!341840) (not e!316888))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50058 (= res!341840 (validMask!0 mask!3119))))

(assert (=> start!50058 e!316888))

(assert (=> start!50058 true))

(declare-fun array_inv!12412 (array!34595) Bool)

(assert (=> start!50058 (array_inv!12412 a!3118)))

(assert (= (and start!50058 res!341840) b!548518))

(assert (= (and b!548518 res!341841) b!548525))

(assert (= (and b!548525 res!341842) b!548522))

(assert (= (and b!548522 res!341846) b!548520))

(assert (= (and b!548520 res!341844) b!548524))

(assert (= (and b!548524 res!341839) b!548523))

(assert (= (and b!548523 res!341843) b!548521))

(assert (= (and b!548521 res!341845) b!548519))

(declare-fun m!525523 () Bool)

(assert (=> b!548520 m!525523))

(declare-fun m!525525 () Bool)

(assert (=> b!548525 m!525525))

(assert (=> b!548525 m!525525))

(declare-fun m!525527 () Bool)

(assert (=> b!548525 m!525527))

(declare-fun m!525529 () Bool)

(assert (=> b!548522 m!525529))

(declare-fun m!525531 () Bool)

(assert (=> b!548521 m!525531))

(assert (=> b!548519 m!525525))

(assert (=> b!548519 m!525525))

(declare-fun m!525533 () Bool)

(assert (=> b!548519 m!525533))

(declare-fun m!525535 () Bool)

(assert (=> b!548523 m!525535))

(declare-fun m!525537 () Bool)

(assert (=> b!548524 m!525537))

(declare-fun m!525539 () Bool)

(assert (=> start!50058 m!525539))

(declare-fun m!525541 () Bool)

(assert (=> start!50058 m!525541))

(push 1)

(assert (not b!548524))

(assert (not b!548519))

(assert (not b!548525))

(assert (not b!548522))

(assert (not b!548520))

(assert (not b!548523))

(assert (not start!50058))

