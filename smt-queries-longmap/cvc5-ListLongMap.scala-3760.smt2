; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51554 () Bool)

(assert start!51554)

(declare-fun b!564131 () Bool)

(declare-fun res!355283 () Bool)

(declare-fun e!324995 () Bool)

(assert (=> b!564131 (=> (not res!355283) (not e!324995))))

(declare-datatypes ((array!35419 0))(
  ( (array!35420 (arr!17010 (Array (_ BitVec 32) (_ BitVec 64))) (size!17374 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35419)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564131 (= res!355283 (validKeyInArray!0 (select (arr!17010 a!3118) j!142)))))

(declare-fun b!564133 () Bool)

(declare-fun e!324996 () Bool)

(assert (=> b!564133 (= e!324996 false)))

(declare-fun lt!257448 () Bool)

(declare-datatypes ((List!11090 0))(
  ( (Nil!11087) (Cons!11086 (h!12089 (_ BitVec 64)) (t!17318 List!11090)) )
))
(declare-fun arrayNoDuplicates!0 (array!35419 (_ BitVec 32) List!11090) Bool)

(assert (=> b!564133 (= lt!257448 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11087))))

(declare-fun b!564134 () Bool)

(declare-fun res!355286 () Bool)

(assert (=> b!564134 (=> (not res!355286) (not e!324996))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35419 (_ BitVec 32)) Bool)

(assert (=> b!564134 (= res!355286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564135 () Bool)

(declare-fun res!355285 () Bool)

(assert (=> b!564135 (=> (not res!355285) (not e!324995))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35419 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564135 (= res!355285 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564136 () Bool)

(assert (=> b!564136 (= e!324995 e!324996)))

(declare-fun res!355288 () Bool)

(assert (=> b!564136 (=> (not res!355288) (not e!324996))))

(declare-datatypes ((SeekEntryResult!5459 0))(
  ( (MissingZero!5459 (index!24063 (_ BitVec 32))) (Found!5459 (index!24064 (_ BitVec 32))) (Intermediate!5459 (undefined!6271 Bool) (index!24065 (_ BitVec 32)) (x!52946 (_ BitVec 32))) (Undefined!5459) (MissingVacant!5459 (index!24066 (_ BitVec 32))) )
))
(declare-fun lt!257449 () SeekEntryResult!5459)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564136 (= res!355288 (or (= lt!257449 (MissingZero!5459 i!1132)) (= lt!257449 (MissingVacant!5459 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35419 (_ BitVec 32)) SeekEntryResult!5459)

(assert (=> b!564136 (= lt!257449 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!564137 () Bool)

(declare-fun res!355284 () Bool)

(assert (=> b!564137 (=> (not res!355284) (not e!324995))))

(assert (=> b!564137 (= res!355284 (validKeyInArray!0 k!1914))))

(declare-fun b!564132 () Bool)

(declare-fun res!355287 () Bool)

(assert (=> b!564132 (=> (not res!355287) (not e!324995))))

(assert (=> b!564132 (= res!355287 (and (= (size!17374 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17374 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17374 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!355289 () Bool)

(assert (=> start!51554 (=> (not res!355289) (not e!324995))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51554 (= res!355289 (validMask!0 mask!3119))))

(assert (=> start!51554 e!324995))

(assert (=> start!51554 true))

(declare-fun array_inv!12806 (array!35419) Bool)

(assert (=> start!51554 (array_inv!12806 a!3118)))

(assert (= (and start!51554 res!355289) b!564132))

(assert (= (and b!564132 res!355287) b!564131))

(assert (= (and b!564131 res!355283) b!564137))

(assert (= (and b!564137 res!355284) b!564135))

(assert (= (and b!564135 res!355285) b!564136))

(assert (= (and b!564136 res!355288) b!564134))

(assert (= (and b!564134 res!355286) b!564133))

(declare-fun m!542595 () Bool)

(assert (=> b!564135 m!542595))

(declare-fun m!542597 () Bool)

(assert (=> b!564136 m!542597))

(declare-fun m!542599 () Bool)

(assert (=> b!564134 m!542599))

(declare-fun m!542601 () Bool)

(assert (=> b!564137 m!542601))

(declare-fun m!542603 () Bool)

(assert (=> start!51554 m!542603))

(declare-fun m!542605 () Bool)

(assert (=> start!51554 m!542605))

(declare-fun m!542607 () Bool)

(assert (=> b!564131 m!542607))

(assert (=> b!564131 m!542607))

(declare-fun m!542609 () Bool)

(assert (=> b!564131 m!542609))

(declare-fun m!542611 () Bool)

(assert (=> b!564133 m!542611))

(push 1)

