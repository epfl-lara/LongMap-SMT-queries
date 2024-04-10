; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51556 () Bool)

(assert start!51556)

(declare-fun b!564152 () Bool)

(declare-fun e!325003 () Bool)

(declare-fun e!325005 () Bool)

(assert (=> b!564152 (= e!325003 e!325005)))

(declare-fun res!355310 () Bool)

(assert (=> b!564152 (=> (not res!355310) (not e!325005))))

(declare-datatypes ((SeekEntryResult!5460 0))(
  ( (MissingZero!5460 (index!24067 (_ BitVec 32))) (Found!5460 (index!24068 (_ BitVec 32))) (Intermediate!5460 (undefined!6272 Bool) (index!24069 (_ BitVec 32)) (x!52947 (_ BitVec 32))) (Undefined!5460) (MissingVacant!5460 (index!24070 (_ BitVec 32))) )
))
(declare-fun lt!257455 () SeekEntryResult!5460)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564152 (= res!355310 (or (= lt!257455 (MissingZero!5460 i!1132)) (= lt!257455 (MissingVacant!5460 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!35421 0))(
  ( (array!35422 (arr!17011 (Array (_ BitVec 32) (_ BitVec 64))) (size!17375 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35421)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35421 (_ BitVec 32)) SeekEntryResult!5460)

(assert (=> b!564152 (= lt!257455 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!564153 () Bool)

(declare-fun res!355308 () Bool)

(assert (=> b!564153 (=> (not res!355308) (not e!325003))))

(declare-fun arrayContainsKey!0 (array!35421 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564153 (= res!355308 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564154 () Bool)

(declare-fun res!355307 () Bool)

(assert (=> b!564154 (=> (not res!355307) (not e!325003))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564154 (= res!355307 (validKeyInArray!0 (select (arr!17011 a!3118) j!142)))))

(declare-fun b!564155 () Bool)

(declare-fun res!355305 () Bool)

(assert (=> b!564155 (=> (not res!355305) (not e!325003))))

(assert (=> b!564155 (= res!355305 (and (= (size!17375 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17375 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17375 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!564156 () Bool)

(assert (=> b!564156 (= e!325005 false)))

(declare-fun lt!257454 () Bool)

(declare-datatypes ((List!11091 0))(
  ( (Nil!11088) (Cons!11087 (h!12090 (_ BitVec 64)) (t!17319 List!11091)) )
))
(declare-fun arrayNoDuplicates!0 (array!35421 (_ BitVec 32) List!11091) Bool)

(assert (=> b!564156 (= lt!257454 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11088))))

(declare-fun b!564157 () Bool)

(declare-fun res!355304 () Bool)

(assert (=> b!564157 (=> (not res!355304) (not e!325005))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35421 (_ BitVec 32)) Bool)

(assert (=> b!564157 (= res!355304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564158 () Bool)

(declare-fun res!355306 () Bool)

(assert (=> b!564158 (=> (not res!355306) (not e!325003))))

(assert (=> b!564158 (= res!355306 (validKeyInArray!0 k0!1914))))

(declare-fun res!355309 () Bool)

(assert (=> start!51556 (=> (not res!355309) (not e!325003))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51556 (= res!355309 (validMask!0 mask!3119))))

(assert (=> start!51556 e!325003))

(assert (=> start!51556 true))

(declare-fun array_inv!12807 (array!35421) Bool)

(assert (=> start!51556 (array_inv!12807 a!3118)))

(assert (= (and start!51556 res!355309) b!564155))

(assert (= (and b!564155 res!355305) b!564154))

(assert (= (and b!564154 res!355307) b!564158))

(assert (= (and b!564158 res!355306) b!564153))

(assert (= (and b!564153 res!355308) b!564152))

(assert (= (and b!564152 res!355310) b!564157))

(assert (= (and b!564157 res!355304) b!564156))

(declare-fun m!542613 () Bool)

(assert (=> b!564156 m!542613))

(declare-fun m!542615 () Bool)

(assert (=> b!564152 m!542615))

(declare-fun m!542617 () Bool)

(assert (=> start!51556 m!542617))

(declare-fun m!542619 () Bool)

(assert (=> start!51556 m!542619))

(declare-fun m!542621 () Bool)

(assert (=> b!564154 m!542621))

(assert (=> b!564154 m!542621))

(declare-fun m!542623 () Bool)

(assert (=> b!564154 m!542623))

(declare-fun m!542625 () Bool)

(assert (=> b!564153 m!542625))

(declare-fun m!542627 () Bool)

(assert (=> b!564158 m!542627))

(declare-fun m!542629 () Bool)

(assert (=> b!564157 m!542629))

(check-sat (not start!51556) (not b!564158) (not b!564153) (not b!564157) (not b!564156) (not b!564154) (not b!564152))
(check-sat)
