; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51698 () Bool)

(assert start!51698)

(declare-fun b!565372 () Bool)

(declare-fun res!356485 () Bool)

(declare-fun e!325470 () Bool)

(assert (=> b!565372 (=> (not res!356485) (not e!325470))))

(declare-datatypes ((array!35515 0))(
  ( (array!35516 (arr!17057 (Array (_ BitVec 32) (_ BitVec 64))) (size!17422 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35515)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35515 (_ BitVec 32)) Bool)

(assert (=> b!565372 (= res!356485 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!565373 () Bool)

(declare-fun res!356483 () Bool)

(declare-fun e!325469 () Bool)

(assert (=> b!565373 (=> (not res!356483) (not e!325469))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!565373 (= res!356483 (validKeyInArray!0 k0!1914))))

(declare-fun b!565374 () Bool)

(declare-fun res!356492 () Bool)

(assert (=> b!565374 (=> (not res!356492) (not e!325470))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5503 0))(
  ( (MissingZero!5503 (index!24239 (_ BitVec 32))) (Found!5503 (index!24240 (_ BitVec 32))) (Intermediate!5503 (undefined!6315 Bool) (index!24241 (_ BitVec 32)) (x!53119 (_ BitVec 32))) (Undefined!5503) (MissingVacant!5503 (index!24242 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35515 (_ BitVec 32)) SeekEntryResult!5503)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!565374 (= res!356492 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17057 a!3118) j!142) mask!3119) (select (arr!17057 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17057 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17057 a!3118) i!1132 k0!1914) j!142) (array!35516 (store (arr!17057 a!3118) i!1132 k0!1914) (size!17422 a!3118)) mask!3119)))))

(declare-fun b!565375 () Bool)

(declare-fun res!356484 () Bool)

(assert (=> b!565375 (=> (not res!356484) (not e!325469))))

(assert (=> b!565375 (= res!356484 (and (= (size!17422 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17422 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17422 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!565376 () Bool)

(declare-fun res!356486 () Bool)

(assert (=> b!565376 (=> (not res!356486) (not e!325470))))

(declare-datatypes ((List!11176 0))(
  ( (Nil!11173) (Cons!11172 (h!12178 (_ BitVec 64)) (t!17395 List!11176)) )
))
(declare-fun arrayNoDuplicates!0 (array!35515 (_ BitVec 32) List!11176) Bool)

(assert (=> b!565376 (= res!356486 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11173))))

(declare-fun b!565377 () Bool)

(declare-fun res!356491 () Bool)

(assert (=> b!565377 (=> (not res!356491) (not e!325469))))

(assert (=> b!565377 (= res!356491 (validKeyInArray!0 (select (arr!17057 a!3118) j!142)))))

(declare-fun res!356490 () Bool)

(assert (=> start!51698 (=> (not res!356490) (not e!325469))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51698 (= res!356490 (validMask!0 mask!3119))))

(assert (=> start!51698 e!325469))

(assert (=> start!51698 true))

(declare-fun array_inv!12940 (array!35515) Bool)

(assert (=> start!51698 (array_inv!12940 a!3118)))

(declare-fun b!565378 () Bool)

(assert (=> b!565378 (= e!325470 (not true))))

(declare-fun e!325467 () Bool)

(assert (=> b!565378 e!325467))

(declare-fun res!356487 () Bool)

(assert (=> b!565378 (=> (not res!356487) (not e!325467))))

(assert (=> b!565378 (= res!356487 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17694 0))(
  ( (Unit!17695) )
))
(declare-fun lt!257694 () Unit!17694)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35515 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17694)

(assert (=> b!565378 (= lt!257694 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!565379 () Bool)

(declare-fun res!356488 () Bool)

(assert (=> b!565379 (=> (not res!356488) (not e!325469))))

(declare-fun arrayContainsKey!0 (array!35515 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!565379 (= res!356488 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!565380 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35515 (_ BitVec 32)) SeekEntryResult!5503)

(assert (=> b!565380 (= e!325467 (= (seekEntryOrOpen!0 (select (arr!17057 a!3118) j!142) a!3118 mask!3119) (Found!5503 j!142)))))

(declare-fun b!565381 () Bool)

(assert (=> b!565381 (= e!325469 e!325470)))

(declare-fun res!356489 () Bool)

(assert (=> b!565381 (=> (not res!356489) (not e!325470))))

(declare-fun lt!257695 () SeekEntryResult!5503)

(assert (=> b!565381 (= res!356489 (or (= lt!257695 (MissingZero!5503 i!1132)) (= lt!257695 (MissingVacant!5503 i!1132))))))

(assert (=> b!565381 (= lt!257695 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!51698 res!356490) b!565375))

(assert (= (and b!565375 res!356484) b!565377))

(assert (= (and b!565377 res!356491) b!565373))

(assert (= (and b!565373 res!356483) b!565379))

(assert (= (and b!565379 res!356488) b!565381))

(assert (= (and b!565381 res!356489) b!565372))

(assert (= (and b!565372 res!356485) b!565376))

(assert (= (and b!565376 res!356486) b!565374))

(assert (= (and b!565374 res!356492) b!565378))

(assert (= (and b!565378 res!356487) b!565380))

(declare-fun m!543371 () Bool)

(assert (=> b!565379 m!543371))

(declare-fun m!543373 () Bool)

(assert (=> start!51698 m!543373))

(declare-fun m!543375 () Bool)

(assert (=> start!51698 m!543375))

(declare-fun m!543377 () Bool)

(assert (=> b!565372 m!543377))

(declare-fun m!543379 () Bool)

(assert (=> b!565373 m!543379))

(declare-fun m!543381 () Bool)

(assert (=> b!565377 m!543381))

(assert (=> b!565377 m!543381))

(declare-fun m!543383 () Bool)

(assert (=> b!565377 m!543383))

(assert (=> b!565380 m!543381))

(assert (=> b!565380 m!543381))

(declare-fun m!543385 () Bool)

(assert (=> b!565380 m!543385))

(assert (=> b!565374 m!543381))

(declare-fun m!543387 () Bool)

(assert (=> b!565374 m!543387))

(assert (=> b!565374 m!543381))

(declare-fun m!543389 () Bool)

(assert (=> b!565374 m!543389))

(declare-fun m!543391 () Bool)

(assert (=> b!565374 m!543391))

(assert (=> b!565374 m!543389))

(declare-fun m!543393 () Bool)

(assert (=> b!565374 m!543393))

(assert (=> b!565374 m!543387))

(assert (=> b!565374 m!543381))

(declare-fun m!543395 () Bool)

(assert (=> b!565374 m!543395))

(declare-fun m!543397 () Bool)

(assert (=> b!565374 m!543397))

(assert (=> b!565374 m!543389))

(assert (=> b!565374 m!543391))

(declare-fun m!543399 () Bool)

(assert (=> b!565376 m!543399))

(declare-fun m!543401 () Bool)

(assert (=> b!565381 m!543401))

(declare-fun m!543403 () Bool)

(assert (=> b!565378 m!543403))

(declare-fun m!543405 () Bool)

(assert (=> b!565378 m!543405))

(check-sat (not b!565376) (not b!565377) (not b!565380) (not b!565374) (not b!565381) (not start!51698) (not b!565373) (not b!565379) (not b!565378) (not b!565372))
(check-sat)
