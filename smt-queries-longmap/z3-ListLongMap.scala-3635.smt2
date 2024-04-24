; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50232 () Bool)

(assert start!50232)

(declare-fun res!342526 () Bool)

(declare-fun e!317405 () Bool)

(assert (=> start!50232 (=> (not res!342526) (not e!317405))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50232 (= res!342526 (validMask!0 mask!3119))))

(assert (=> start!50232 e!317405))

(assert (=> start!50232 true))

(declare-datatypes ((array!34632 0))(
  ( (array!34633 (arr!16630 (Array (_ BitVec 32) (_ BitVec 64))) (size!16994 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34632)

(declare-fun array_inv!12489 (array!34632) Bool)

(assert (=> start!50232 (array_inv!12489 a!3118)))

(declare-fun b!549480 () Bool)

(declare-fun res!342525 () Bool)

(assert (=> b!549480 (=> (not res!342525) (not e!317405))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!549480 (= res!342525 (and (= (size!16994 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16994 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16994 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!549481 () Bool)

(declare-fun res!342523 () Bool)

(assert (=> b!549481 (=> (not res!342523) (not e!317405))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549481 (= res!342523 (validKeyInArray!0 (select (arr!16630 a!3118) j!142)))))

(declare-fun b!549482 () Bool)

(declare-fun e!317406 () Bool)

(assert (=> b!549482 (= e!317405 e!317406)))

(declare-fun res!342522 () Bool)

(assert (=> b!549482 (=> (not res!342522) (not e!317406))))

(declare-datatypes ((SeekEntryResult!5035 0))(
  ( (MissingZero!5035 (index!22367 (_ BitVec 32))) (Found!5035 (index!22368 (_ BitVec 32))) (Intermediate!5035 (undefined!5847 Bool) (index!22369 (_ BitVec 32)) (x!51456 (_ BitVec 32))) (Undefined!5035) (MissingVacant!5035 (index!22370 (_ BitVec 32))) )
))
(declare-fun lt!250195 () SeekEntryResult!5035)

(assert (=> b!549482 (= res!342522 (or (= lt!250195 (MissingZero!5035 i!1132)) (= lt!250195 (MissingVacant!5035 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34632 (_ BitVec 32)) SeekEntryResult!5035)

(assert (=> b!549482 (= lt!250195 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!549483 () Bool)

(declare-fun res!342519 () Bool)

(assert (=> b!549483 (=> (not res!342519) (not e!317405))))

(declare-fun arrayContainsKey!0 (array!34632 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549483 (= res!342519 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!549484 () Bool)

(declare-fun res!342521 () Bool)

(assert (=> b!549484 (=> (not res!342521) (not e!317405))))

(assert (=> b!549484 (= res!342521 (validKeyInArray!0 k0!1914))))

(declare-fun b!549485 () Bool)

(declare-fun res!342524 () Bool)

(assert (=> b!549485 (=> (not res!342524) (not e!317406))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34632 (_ BitVec 32)) Bool)

(assert (=> b!549485 (= res!342524 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!549486 () Bool)

(assert (=> b!549486 (= e!317406 false)))

(declare-fun lt!250194 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549486 (= lt!250194 (toIndex!0 (select (store (arr!16630 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(declare-fun b!549487 () Bool)

(declare-fun res!342520 () Bool)

(assert (=> b!549487 (=> (not res!342520) (not e!317406))))

(declare-datatypes ((List!10617 0))(
  ( (Nil!10614) (Cons!10613 (h!11589 (_ BitVec 64)) (t!16837 List!10617)) )
))
(declare-fun arrayNoDuplicates!0 (array!34632 (_ BitVec 32) List!10617) Bool)

(assert (=> b!549487 (= res!342520 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10614))))

(assert (= (and start!50232 res!342526) b!549480))

(assert (= (and b!549480 res!342525) b!549481))

(assert (= (and b!549481 res!342523) b!549484))

(assert (= (and b!549484 res!342521) b!549483))

(assert (= (and b!549483 res!342519) b!549482))

(assert (= (and b!549482 res!342522) b!549485))

(assert (= (and b!549485 res!342524) b!549487))

(assert (= (and b!549487 res!342520) b!549486))

(declare-fun m!526469 () Bool)

(assert (=> b!549483 m!526469))

(declare-fun m!526471 () Bool)

(assert (=> b!549485 m!526471))

(declare-fun m!526473 () Bool)

(assert (=> b!549487 m!526473))

(declare-fun m!526475 () Bool)

(assert (=> b!549484 m!526475))

(declare-fun m!526477 () Bool)

(assert (=> b!549481 m!526477))

(assert (=> b!549481 m!526477))

(declare-fun m!526479 () Bool)

(assert (=> b!549481 m!526479))

(declare-fun m!526481 () Bool)

(assert (=> b!549486 m!526481))

(declare-fun m!526483 () Bool)

(assert (=> b!549486 m!526483))

(assert (=> b!549486 m!526483))

(declare-fun m!526485 () Bool)

(assert (=> b!549486 m!526485))

(declare-fun m!526487 () Bool)

(assert (=> b!549482 m!526487))

(declare-fun m!526489 () Bool)

(assert (=> start!50232 m!526489))

(declare-fun m!526491 () Bool)

(assert (=> start!50232 m!526491))

(check-sat (not b!549482) (not b!549483) (not b!549487) (not b!549486) (not start!50232) (not b!549485) (not b!549481) (not b!549484))
(check-sat)
