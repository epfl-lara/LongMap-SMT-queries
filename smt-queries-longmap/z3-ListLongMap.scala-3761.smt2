; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51562 () Bool)

(assert start!51562)

(declare-fun res!355369 () Bool)

(declare-fun e!325030 () Bool)

(assert (=> start!51562 (=> (not res!355369) (not e!325030))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51562 (= res!355369 (validMask!0 mask!3119))))

(assert (=> start!51562 e!325030))

(assert (=> start!51562 true))

(declare-datatypes ((array!35427 0))(
  ( (array!35428 (arr!17014 (Array (_ BitVec 32) (_ BitVec 64))) (size!17378 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35427)

(declare-fun array_inv!12810 (array!35427) Bool)

(assert (=> start!51562 (array_inv!12810 a!3118)))

(declare-fun b!564215 () Bool)

(declare-fun res!355367 () Bool)

(assert (=> b!564215 (=> (not res!355367) (not e!325030))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564215 (= res!355367 (and (= (size!17378 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17378 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17378 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!564216 () Bool)

(declare-fun res!355370 () Bool)

(declare-fun e!325031 () Bool)

(assert (=> b!564216 (=> (not res!355370) (not e!325031))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35427 (_ BitVec 32)) Bool)

(assert (=> b!564216 (= res!355370 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564217 () Bool)

(declare-fun res!355371 () Bool)

(assert (=> b!564217 (=> (not res!355371) (not e!325030))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564217 (= res!355371 (validKeyInArray!0 k0!1914))))

(declare-fun b!564218 () Bool)

(declare-fun res!355373 () Bool)

(assert (=> b!564218 (=> (not res!355373) (not e!325030))))

(assert (=> b!564218 (= res!355373 (validKeyInArray!0 (select (arr!17014 a!3118) j!142)))))

(declare-fun b!564219 () Bool)

(declare-fun res!355368 () Bool)

(assert (=> b!564219 (=> (not res!355368) (not e!325030))))

(declare-fun arrayContainsKey!0 (array!35427 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564219 (= res!355368 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564220 () Bool)

(assert (=> b!564220 (= e!325030 e!325031)))

(declare-fun res!355372 () Bool)

(assert (=> b!564220 (=> (not res!355372) (not e!325031))))

(declare-datatypes ((SeekEntryResult!5463 0))(
  ( (MissingZero!5463 (index!24079 (_ BitVec 32))) (Found!5463 (index!24080 (_ BitVec 32))) (Intermediate!5463 (undefined!6275 Bool) (index!24081 (_ BitVec 32)) (x!52958 (_ BitVec 32))) (Undefined!5463) (MissingVacant!5463 (index!24082 (_ BitVec 32))) )
))
(declare-fun lt!257473 () SeekEntryResult!5463)

(assert (=> b!564220 (= res!355372 (or (= lt!257473 (MissingZero!5463 i!1132)) (= lt!257473 (MissingVacant!5463 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35427 (_ BitVec 32)) SeekEntryResult!5463)

(assert (=> b!564220 (= lt!257473 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!564221 () Bool)

(assert (=> b!564221 (= e!325031 false)))

(declare-fun lt!257472 () Bool)

(declare-datatypes ((List!11094 0))(
  ( (Nil!11091) (Cons!11090 (h!12093 (_ BitVec 64)) (t!17322 List!11094)) )
))
(declare-fun arrayNoDuplicates!0 (array!35427 (_ BitVec 32) List!11094) Bool)

(assert (=> b!564221 (= lt!257472 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11091))))

(assert (= (and start!51562 res!355369) b!564215))

(assert (= (and b!564215 res!355367) b!564218))

(assert (= (and b!564218 res!355373) b!564217))

(assert (= (and b!564217 res!355371) b!564219))

(assert (= (and b!564219 res!355368) b!564220))

(assert (= (and b!564220 res!355372) b!564216))

(assert (= (and b!564216 res!355370) b!564221))

(declare-fun m!542667 () Bool)

(assert (=> start!51562 m!542667))

(declare-fun m!542669 () Bool)

(assert (=> start!51562 m!542669))

(declare-fun m!542671 () Bool)

(assert (=> b!564221 m!542671))

(declare-fun m!542673 () Bool)

(assert (=> b!564219 m!542673))

(declare-fun m!542675 () Bool)

(assert (=> b!564216 m!542675))

(declare-fun m!542677 () Bool)

(assert (=> b!564220 m!542677))

(declare-fun m!542679 () Bool)

(assert (=> b!564217 m!542679))

(declare-fun m!542681 () Bool)

(assert (=> b!564218 m!542681))

(assert (=> b!564218 m!542681))

(declare-fun m!542683 () Bool)

(assert (=> b!564218 m!542683))

(check-sat (not b!564217) (not b!564218) (not b!564221) (not b!564220) (not b!564219) (not start!51562) (not b!564216))
(check-sat)
