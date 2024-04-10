; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51572 () Bool)

(assert start!51572)

(declare-fun b!564330 () Bool)

(declare-fun res!355485 () Bool)

(declare-fun e!325075 () Bool)

(assert (=> b!564330 (=> (not res!355485) (not e!325075))))

(declare-datatypes ((array!35437 0))(
  ( (array!35438 (arr!17019 (Array (_ BitVec 32) (_ BitVec 64))) (size!17383 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35437)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564330 (= res!355485 (validKeyInArray!0 (select (arr!17019 a!3118) j!142)))))

(declare-fun b!564331 () Bool)

(declare-fun res!355481 () Bool)

(declare-fun e!325076 () Bool)

(assert (=> b!564331 (=> (not res!355481) (not e!325076))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35437 (_ BitVec 32)) Bool)

(assert (=> b!564331 (= res!355481 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564332 () Bool)

(declare-fun res!355487 () Bool)

(assert (=> b!564332 (=> (not res!355487) (not e!325075))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!564332 (= res!355487 (validKeyInArray!0 k!1914))))

(declare-fun b!564333 () Bool)

(assert (=> b!564333 (= e!325075 e!325076)))

(declare-fun res!355482 () Bool)

(assert (=> b!564333 (=> (not res!355482) (not e!325076))))

(declare-datatypes ((SeekEntryResult!5468 0))(
  ( (MissingZero!5468 (index!24099 (_ BitVec 32))) (Found!5468 (index!24100 (_ BitVec 32))) (Intermediate!5468 (undefined!6280 Bool) (index!24101 (_ BitVec 32)) (x!52979 (_ BitVec 32))) (Undefined!5468) (MissingVacant!5468 (index!24102 (_ BitVec 32))) )
))
(declare-fun lt!257502 () SeekEntryResult!5468)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564333 (= res!355482 (or (= lt!257502 (MissingZero!5468 i!1132)) (= lt!257502 (MissingVacant!5468 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35437 (_ BitVec 32)) SeekEntryResult!5468)

(assert (=> b!564333 (= lt!257502 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!564334 () Bool)

(declare-fun res!355483 () Bool)

(assert (=> b!564334 (=> (not res!355483) (not e!325075))))

(declare-fun arrayContainsKey!0 (array!35437 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564334 (= res!355483 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564335 () Bool)

(declare-fun res!355484 () Bool)

(assert (=> b!564335 (=> (not res!355484) (not e!325075))))

(assert (=> b!564335 (= res!355484 (and (= (size!17383 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17383 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17383 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!355486 () Bool)

(assert (=> start!51572 (=> (not res!355486) (not e!325075))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51572 (= res!355486 (validMask!0 mask!3119))))

(assert (=> start!51572 e!325075))

(assert (=> start!51572 true))

(declare-fun array_inv!12815 (array!35437) Bool)

(assert (=> start!51572 (array_inv!12815 a!3118)))

(declare-fun b!564329 () Bool)

(assert (=> b!564329 (= e!325076 false)))

(declare-fun lt!257503 () Bool)

(declare-datatypes ((List!11099 0))(
  ( (Nil!11096) (Cons!11095 (h!12098 (_ BitVec 64)) (t!17327 List!11099)) )
))
(declare-fun arrayNoDuplicates!0 (array!35437 (_ BitVec 32) List!11099) Bool)

(assert (=> b!564329 (= lt!257503 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11096))))

(assert (= (and start!51572 res!355486) b!564335))

(assert (= (and b!564335 res!355484) b!564330))

(assert (= (and b!564330 res!355485) b!564332))

(assert (= (and b!564332 res!355487) b!564334))

(assert (= (and b!564334 res!355483) b!564333))

(assert (= (and b!564333 res!355482) b!564331))

(assert (= (and b!564331 res!355481) b!564329))

(declare-fun m!542763 () Bool)

(assert (=> b!564329 m!542763))

(declare-fun m!542765 () Bool)

(assert (=> b!564334 m!542765))

(declare-fun m!542767 () Bool)

(assert (=> b!564331 m!542767))

(declare-fun m!542769 () Bool)

(assert (=> b!564332 m!542769))

(declare-fun m!542771 () Bool)

(assert (=> start!51572 m!542771))

(declare-fun m!542773 () Bool)

(assert (=> start!51572 m!542773))

(declare-fun m!542775 () Bool)

(assert (=> b!564333 m!542775))

(declare-fun m!542777 () Bool)

(assert (=> b!564330 m!542777))

(assert (=> b!564330 m!542777))

(declare-fun m!542779 () Bool)

(assert (=> b!564330 m!542779))

(push 1)

