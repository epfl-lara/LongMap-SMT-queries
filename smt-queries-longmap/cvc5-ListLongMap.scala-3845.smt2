; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52880 () Bool)

(assert start!52880)

(declare-fun b!576452 () Bool)

(declare-fun res!364689 () Bool)

(declare-fun e!331647 () Bool)

(assert (=> b!576452 (=> (not res!364689) (not e!331647))))

(declare-datatypes ((array!35968 0))(
  ( (array!35969 (arr!17265 (Array (_ BitVec 32) (_ BitVec 64))) (size!17629 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35968)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!576452 (= res!364689 (validKeyInArray!0 (select (arr!17265 a!3118) j!142)))))

(declare-fun b!576453 () Bool)

(declare-fun res!364692 () Bool)

(declare-fun e!331644 () Bool)

(assert (=> b!576453 (=> (not res!364692) (not e!331644))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5714 0))(
  ( (MissingZero!5714 (index!25083 (_ BitVec 32))) (Found!5714 (index!25084 (_ BitVec 32))) (Intermediate!5714 (undefined!6526 Bool) (index!25085 (_ BitVec 32)) (x!53977 (_ BitVec 32))) (Undefined!5714) (MissingVacant!5714 (index!25086 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35968 (_ BitVec 32)) SeekEntryResult!5714)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!576453 (= res!364692 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17265 a!3118) j!142) mask!3119) (select (arr!17265 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17265 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17265 a!3118) i!1132 k!1914) j!142) (array!35969 (store (arr!17265 a!3118) i!1132 k!1914) (size!17629 a!3118)) mask!3119)))))

(declare-fun b!576454 () Bool)

(declare-fun res!364693 () Bool)

(assert (=> b!576454 (=> (not res!364693) (not e!331647))))

(declare-fun arrayContainsKey!0 (array!35968 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!576454 (= res!364693 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun res!364694 () Bool)

(assert (=> start!52880 (=> (not res!364694) (not e!331647))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52880 (= res!364694 (validMask!0 mask!3119))))

(assert (=> start!52880 e!331647))

(assert (=> start!52880 true))

(declare-fun array_inv!13061 (array!35968) Bool)

(assert (=> start!52880 (array_inv!13061 a!3118)))

(declare-fun b!576455 () Bool)

(declare-fun res!364687 () Bool)

(assert (=> b!576455 (=> (not res!364687) (not e!331647))))

(assert (=> b!576455 (= res!364687 (validKeyInArray!0 k!1914))))

(declare-fun b!576456 () Bool)

(declare-fun res!364691 () Bool)

(assert (=> b!576456 (=> (not res!364691) (not e!331647))))

(assert (=> b!576456 (= res!364691 (and (= (size!17629 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17629 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17629 a!3118)) (not (= i!1132 j!142))))))

(declare-fun e!331646 () Bool)

(declare-fun b!576457 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35968 (_ BitVec 32)) SeekEntryResult!5714)

(assert (=> b!576457 (= e!331646 (= (seekEntryOrOpen!0 (select (arr!17265 a!3118) j!142) a!3118 mask!3119) (Found!5714 j!142)))))

(declare-fun b!576458 () Bool)

(declare-fun res!364690 () Bool)

(assert (=> b!576458 (=> (not res!364690) (not e!331644))))

(declare-datatypes ((List!11345 0))(
  ( (Nil!11342) (Cons!11341 (h!12383 (_ BitVec 64)) (t!17573 List!11345)) )
))
(declare-fun arrayNoDuplicates!0 (array!35968 (_ BitVec 32) List!11345) Bool)

(assert (=> b!576458 (= res!364690 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11342))))

(declare-fun b!576459 () Bool)

(assert (=> b!576459 (= e!331647 e!331644)))

(declare-fun res!364685 () Bool)

(assert (=> b!576459 (=> (not res!364685) (not e!331644))))

(declare-fun lt!263665 () SeekEntryResult!5714)

(assert (=> b!576459 (= res!364685 (or (= lt!263665 (MissingZero!5714 i!1132)) (= lt!263665 (MissingVacant!5714 i!1132))))))

(assert (=> b!576459 (= lt!263665 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!576460 () Bool)

(declare-fun res!364686 () Bool)

(assert (=> b!576460 (=> (not res!364686) (not e!331644))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35968 (_ BitVec 32)) Bool)

(assert (=> b!576460 (= res!364686 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!576461 () Bool)

(assert (=> b!576461 (= e!331644 (not true))))

(assert (=> b!576461 e!331646))

(declare-fun res!364688 () Bool)

(assert (=> b!576461 (=> (not res!364688) (not e!331646))))

(assert (=> b!576461 (= res!364688 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!18130 0))(
  ( (Unit!18131) )
))
(declare-fun lt!263664 () Unit!18130)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35968 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18130)

(assert (=> b!576461 (= lt!263664 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!52880 res!364694) b!576456))

(assert (= (and b!576456 res!364691) b!576452))

(assert (= (and b!576452 res!364689) b!576455))

(assert (= (and b!576455 res!364687) b!576454))

(assert (= (and b!576454 res!364693) b!576459))

(assert (= (and b!576459 res!364685) b!576460))

(assert (= (and b!576460 res!364686) b!576458))

(assert (= (and b!576458 res!364690) b!576453))

(assert (= (and b!576453 res!364692) b!576461))

(assert (= (and b!576461 res!364688) b!576457))

(declare-fun m!555417 () Bool)

(assert (=> b!576460 m!555417))

(declare-fun m!555419 () Bool)

(assert (=> b!576458 m!555419))

(declare-fun m!555421 () Bool)

(assert (=> b!576454 m!555421))

(declare-fun m!555423 () Bool)

(assert (=> b!576452 m!555423))

(assert (=> b!576452 m!555423))

(declare-fun m!555425 () Bool)

(assert (=> b!576452 m!555425))

(assert (=> b!576457 m!555423))

(assert (=> b!576457 m!555423))

(declare-fun m!555427 () Bool)

(assert (=> b!576457 m!555427))

(declare-fun m!555429 () Bool)

(assert (=> b!576459 m!555429))

(declare-fun m!555431 () Bool)

(assert (=> b!576461 m!555431))

(declare-fun m!555433 () Bool)

(assert (=> b!576461 m!555433))

(assert (=> b!576453 m!555423))

(declare-fun m!555435 () Bool)

(assert (=> b!576453 m!555435))

(assert (=> b!576453 m!555423))

(declare-fun m!555437 () Bool)

(assert (=> b!576453 m!555437))

(declare-fun m!555439 () Bool)

(assert (=> b!576453 m!555439))

(assert (=> b!576453 m!555437))

(declare-fun m!555441 () Bool)

(assert (=> b!576453 m!555441))

(assert (=> b!576453 m!555435))

(assert (=> b!576453 m!555423))

(declare-fun m!555443 () Bool)

(assert (=> b!576453 m!555443))

(declare-fun m!555445 () Bool)

(assert (=> b!576453 m!555445))

(assert (=> b!576453 m!555437))

(assert (=> b!576453 m!555439))

(declare-fun m!555447 () Bool)

(assert (=> start!52880 m!555447))

(declare-fun m!555449 () Bool)

(assert (=> start!52880 m!555449))

(declare-fun m!555451 () Bool)

(assert (=> b!576455 m!555451))

(push 1)

