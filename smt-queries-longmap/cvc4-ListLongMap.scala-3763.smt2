; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51576 () Bool)

(assert start!51576)

(declare-fun b!564371 () Bool)

(declare-fun res!355529 () Bool)

(declare-fun e!325094 () Bool)

(assert (=> b!564371 (=> (not res!355529) (not e!325094))))

(declare-datatypes ((array!35441 0))(
  ( (array!35442 (arr!17021 (Array (_ BitVec 32) (_ BitVec 64))) (size!17385 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35441)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35441 (_ BitVec 32)) Bool)

(assert (=> b!564371 (= res!355529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!355528 () Bool)

(declare-fun e!325095 () Bool)

(assert (=> start!51576 (=> (not res!355528) (not e!325095))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51576 (= res!355528 (validMask!0 mask!3119))))

(assert (=> start!51576 e!325095))

(assert (=> start!51576 true))

(declare-fun array_inv!12817 (array!35441) Bool)

(assert (=> start!51576 (array_inv!12817 a!3118)))

(declare-fun b!564372 () Bool)

(declare-fun res!355526 () Bool)

(assert (=> b!564372 (=> (not res!355526) (not e!325095))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564372 (= res!355526 (validKeyInArray!0 (select (arr!17021 a!3118) j!142)))))

(declare-fun b!564373 () Bool)

(assert (=> b!564373 (= e!325095 e!325094)))

(declare-fun res!355524 () Bool)

(assert (=> b!564373 (=> (not res!355524) (not e!325094))))

(declare-datatypes ((SeekEntryResult!5470 0))(
  ( (MissingZero!5470 (index!24107 (_ BitVec 32))) (Found!5470 (index!24108 (_ BitVec 32))) (Intermediate!5470 (undefined!6282 Bool) (index!24109 (_ BitVec 32)) (x!52981 (_ BitVec 32))) (Undefined!5470) (MissingVacant!5470 (index!24110 (_ BitVec 32))) )
))
(declare-fun lt!257514 () SeekEntryResult!5470)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564373 (= res!355524 (or (= lt!257514 (MissingZero!5470 i!1132)) (= lt!257514 (MissingVacant!5470 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35441 (_ BitVec 32)) SeekEntryResult!5470)

(assert (=> b!564373 (= lt!257514 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!564374 () Bool)

(declare-fun res!355523 () Bool)

(assert (=> b!564374 (=> (not res!355523) (not e!325095))))

(assert (=> b!564374 (= res!355523 (validKeyInArray!0 k!1914))))

(declare-fun b!564375 () Bool)

(assert (=> b!564375 (= e!325094 false)))

(declare-fun lt!257515 () Bool)

(declare-datatypes ((List!11101 0))(
  ( (Nil!11098) (Cons!11097 (h!12100 (_ BitVec 64)) (t!17329 List!11101)) )
))
(declare-fun arrayNoDuplicates!0 (array!35441 (_ BitVec 32) List!11101) Bool)

(assert (=> b!564375 (= lt!257515 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11098))))

(declare-fun b!564376 () Bool)

(declare-fun res!355527 () Bool)

(assert (=> b!564376 (=> (not res!355527) (not e!325095))))

(assert (=> b!564376 (= res!355527 (and (= (size!17385 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17385 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17385 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!564377 () Bool)

(declare-fun res!355525 () Bool)

(assert (=> b!564377 (=> (not res!355525) (not e!325095))))

(declare-fun arrayContainsKey!0 (array!35441 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564377 (= res!355525 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!51576 res!355528) b!564376))

(assert (= (and b!564376 res!355527) b!564372))

(assert (= (and b!564372 res!355526) b!564374))

(assert (= (and b!564374 res!355523) b!564377))

(assert (= (and b!564377 res!355525) b!564373))

(assert (= (and b!564373 res!355524) b!564371))

(assert (= (and b!564371 res!355529) b!564375))

(declare-fun m!542799 () Bool)

(assert (=> b!564372 m!542799))

(assert (=> b!564372 m!542799))

(declare-fun m!542801 () Bool)

(assert (=> b!564372 m!542801))

(declare-fun m!542803 () Bool)

(assert (=> b!564373 m!542803))

(declare-fun m!542805 () Bool)

(assert (=> start!51576 m!542805))

(declare-fun m!542807 () Bool)

(assert (=> start!51576 m!542807))

(declare-fun m!542809 () Bool)

(assert (=> b!564374 m!542809))

(declare-fun m!542811 () Bool)

(assert (=> b!564377 m!542811))

(declare-fun m!542813 () Bool)

(assert (=> b!564371 m!542813))

(declare-fun m!542815 () Bool)

(assert (=> b!564375 m!542815))

(push 1)

(assert (not b!564375))

(assert (not b!564374))

(assert (not b!564373))

(assert (not b!564371))

(assert (not b!564372))

(assert (not b!564377))

