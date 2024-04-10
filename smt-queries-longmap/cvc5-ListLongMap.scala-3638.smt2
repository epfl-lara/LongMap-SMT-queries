; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50204 () Bool)

(assert start!50204)

(declare-fun b!549505 () Bool)

(declare-fun res!342655 () Bool)

(declare-fun e!317367 () Bool)

(assert (=> b!549505 (=> (not res!342655) (not e!317367))))

(declare-datatypes ((array!34657 0))(
  ( (array!34658 (arr!16644 (Array (_ BitVec 32) (_ BitVec 64))) (size!17008 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34657)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34657 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549505 (= res!342655 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!549506 () Bool)

(declare-fun res!342656 () Bool)

(assert (=> b!549506 (=> (not res!342656) (not e!317367))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549506 (= res!342656 (validKeyInArray!0 (select (arr!16644 a!3118) j!142)))))

(declare-fun b!549507 () Bool)

(declare-fun res!342653 () Bool)

(declare-fun e!317365 () Bool)

(assert (=> b!549507 (=> (not res!342653) (not e!317365))))

(declare-datatypes ((List!10724 0))(
  ( (Nil!10721) (Cons!10720 (h!11693 (_ BitVec 64)) (t!16952 List!10724)) )
))
(declare-fun arrayNoDuplicates!0 (array!34657 (_ BitVec 32) List!10724) Bool)

(assert (=> b!549507 (= res!342653 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10721))))

(declare-fun b!549508 () Bool)

(assert (=> b!549508 (= e!317365 false)))

(declare-datatypes ((SeekEntryResult!5093 0))(
  ( (MissingZero!5093 (index!22599 (_ BitVec 32))) (Found!5093 (index!22600 (_ BitVec 32))) (Intermediate!5093 (undefined!5905 Bool) (index!22601 (_ BitVec 32)) (x!51535 (_ BitVec 32))) (Undefined!5093) (MissingVacant!5093 (index!22602 (_ BitVec 32))) )
))
(declare-fun lt!250173 () SeekEntryResult!5093)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!250171 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34657 (_ BitVec 32)) SeekEntryResult!5093)

(assert (=> b!549508 (= lt!250173 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250171 (select (store (arr!16644 a!3118) i!1132 k!1914) j!142) (array!34658 (store (arr!16644 a!3118) i!1132 k!1914) (size!17008 a!3118)) mask!3119))))

(declare-fun lt!250174 () (_ BitVec 32))

(declare-fun lt!250170 () SeekEntryResult!5093)

(assert (=> b!549508 (= lt!250170 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250174 (select (arr!16644 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549508 (= lt!250171 (toIndex!0 (select (store (arr!16644 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!549508 (= lt!250174 (toIndex!0 (select (arr!16644 a!3118) j!142) mask!3119))))

(declare-fun b!549509 () Bool)

(declare-fun res!342651 () Bool)

(assert (=> b!549509 (=> (not res!342651) (not e!317367))))

(assert (=> b!549509 (= res!342651 (and (= (size!17008 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17008 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17008 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!549510 () Bool)

(declare-fun res!342649 () Bool)

(assert (=> b!549510 (=> (not res!342649) (not e!317365))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34657 (_ BitVec 32)) Bool)

(assert (=> b!549510 (= res!342649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!549511 () Bool)

(assert (=> b!549511 (= e!317367 e!317365)))

(declare-fun res!342650 () Bool)

(assert (=> b!549511 (=> (not res!342650) (not e!317365))))

(declare-fun lt!250172 () SeekEntryResult!5093)

(assert (=> b!549511 (= res!342650 (or (= lt!250172 (MissingZero!5093 i!1132)) (= lt!250172 (MissingVacant!5093 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34657 (_ BitVec 32)) SeekEntryResult!5093)

(assert (=> b!549511 (= lt!250172 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!342652 () Bool)

(assert (=> start!50204 (=> (not res!342652) (not e!317367))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50204 (= res!342652 (validMask!0 mask!3119))))

(assert (=> start!50204 e!317367))

(assert (=> start!50204 true))

(declare-fun array_inv!12440 (array!34657) Bool)

(assert (=> start!50204 (array_inv!12440 a!3118)))

(declare-fun b!549512 () Bool)

(declare-fun res!342654 () Bool)

(assert (=> b!549512 (=> (not res!342654) (not e!317367))))

(assert (=> b!549512 (= res!342654 (validKeyInArray!0 k!1914))))

(assert (= (and start!50204 res!342652) b!549509))

(assert (= (and b!549509 res!342651) b!549506))

(assert (= (and b!549506 res!342656) b!549512))

(assert (= (and b!549512 res!342654) b!549505))

(assert (= (and b!549505 res!342655) b!549511))

(assert (= (and b!549511 res!342650) b!549510))

(assert (= (and b!549510 res!342649) b!549507))

(assert (= (and b!549507 res!342653) b!549508))

(declare-fun m!526371 () Bool)

(assert (=> b!549510 m!526371))

(declare-fun m!526373 () Bool)

(assert (=> b!549508 m!526373))

(declare-fun m!526375 () Bool)

(assert (=> b!549508 m!526375))

(assert (=> b!549508 m!526373))

(declare-fun m!526377 () Bool)

(assert (=> b!549508 m!526377))

(declare-fun m!526379 () Bool)

(assert (=> b!549508 m!526379))

(assert (=> b!549508 m!526377))

(declare-fun m!526381 () Bool)

(assert (=> b!549508 m!526381))

(assert (=> b!549508 m!526377))

(declare-fun m!526383 () Bool)

(assert (=> b!549508 m!526383))

(assert (=> b!549508 m!526373))

(declare-fun m!526385 () Bool)

(assert (=> b!549508 m!526385))

(declare-fun m!526387 () Bool)

(assert (=> b!549505 m!526387))

(declare-fun m!526389 () Bool)

(assert (=> b!549507 m!526389))

(declare-fun m!526391 () Bool)

(assert (=> start!50204 m!526391))

(declare-fun m!526393 () Bool)

(assert (=> start!50204 m!526393))

(assert (=> b!549506 m!526373))

(assert (=> b!549506 m!526373))

(declare-fun m!526395 () Bool)

(assert (=> b!549506 m!526395))

(declare-fun m!526397 () Bool)

(assert (=> b!549512 m!526397))

(declare-fun m!526399 () Bool)

(assert (=> b!549511 m!526399))

(push 1)

