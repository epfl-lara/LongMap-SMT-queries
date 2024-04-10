; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52290 () Bool)

(assert start!52290)

(declare-fun b!570589 () Bool)

(declare-fun res!360372 () Bool)

(declare-fun e!328168 () Bool)

(assert (=> b!570589 (=> (not res!360372) (not e!328168))))

(declare-datatypes ((array!35750 0))(
  ( (array!35751 (arr!17165 (Array (_ BitVec 32) (_ BitVec 64))) (size!17529 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35750)

(declare-datatypes ((List!11245 0))(
  ( (Nil!11242) (Cons!11241 (h!12265 (_ BitVec 64)) (t!17473 List!11245)) )
))
(declare-fun arrayNoDuplicates!0 (array!35750 (_ BitVec 32) List!11245) Bool)

(assert (=> b!570589 (= res!360372 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11242))))

(declare-fun b!570590 () Bool)

(declare-fun res!360377 () Bool)

(declare-fun e!328170 () Bool)

(assert (=> b!570590 (=> (not res!360377) (not e!328170))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!570590 (= res!360377 (validKeyInArray!0 k!1914))))

(declare-fun b!570591 () Bool)

(declare-fun res!360371 () Bool)

(assert (=> b!570591 (=> (not res!360371) (not e!328170))))

(declare-fun arrayContainsKey!0 (array!35750 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!570591 (= res!360371 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!570592 () Bool)

(declare-fun res!360370 () Bool)

(assert (=> b!570592 (=> (not res!360370) (not e!328170))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!570592 (= res!360370 (validKeyInArray!0 (select (arr!17165 a!3118) j!142)))))

(declare-fun res!360378 () Bool)

(assert (=> start!52290 (=> (not res!360378) (not e!328170))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52290 (= res!360378 (validMask!0 mask!3119))))

(assert (=> start!52290 e!328170))

(assert (=> start!52290 true))

(declare-fun array_inv!12961 (array!35750) Bool)

(assert (=> start!52290 (array_inv!12961 a!3118)))

(declare-fun b!570593 () Bool)

(declare-fun e!328165 () Bool)

(declare-fun e!328166 () Bool)

(assert (=> b!570593 (= e!328165 e!328166)))

(declare-fun res!360376 () Bool)

(assert (=> b!570593 (=> res!360376 e!328166)))

(declare-datatypes ((SeekEntryResult!5614 0))(
  ( (MissingZero!5614 (index!24683 (_ BitVec 32))) (Found!5614 (index!24684 (_ BitVec 32))) (Intermediate!5614 (undefined!6426 Bool) (index!24685 (_ BitVec 32)) (x!53554 (_ BitVec 32))) (Undefined!5614) (MissingVacant!5614 (index!24686 (_ BitVec 32))) )
))
(declare-fun lt!260114 () SeekEntryResult!5614)

(assert (=> b!570593 (= res!360376 (or (undefined!6426 lt!260114) (not (is-Intermediate!5614 lt!260114)) (= (select (arr!17165 a!3118) (index!24685 lt!260114)) (select (arr!17165 a!3118) j!142)) (= (select (arr!17165 a!3118) (index!24685 lt!260114)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!570594 () Bool)

(declare-fun e!328167 () Bool)

(assert (=> b!570594 (= e!328168 e!328167)))

(declare-fun res!360375 () Bool)

(assert (=> b!570594 (=> (not res!360375) (not e!328167))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun lt!260115 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35750 (_ BitVec 32)) SeekEntryResult!5614)

(assert (=> b!570594 (= res!360375 (= lt!260114 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260115 (select (store (arr!17165 a!3118) i!1132 k!1914) j!142) (array!35751 (store (arr!17165 a!3118) i!1132 k!1914) (size!17529 a!3118)) mask!3119)))))

(declare-fun lt!260119 () (_ BitVec 32))

(assert (=> b!570594 (= lt!260114 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260119 (select (arr!17165 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!570594 (= lt!260115 (toIndex!0 (select (store (arr!17165 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!570594 (= lt!260119 (toIndex!0 (select (arr!17165 a!3118) j!142) mask!3119))))

(declare-fun b!570595 () Bool)

(assert (=> b!570595 (= e!328170 e!328168)))

(declare-fun res!360373 () Bool)

(assert (=> b!570595 (=> (not res!360373) (not e!328168))))

(declare-fun lt!260116 () SeekEntryResult!5614)

(assert (=> b!570595 (= res!360373 (or (= lt!260116 (MissingZero!5614 i!1132)) (= lt!260116 (MissingVacant!5614 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35750 (_ BitVec 32)) SeekEntryResult!5614)

(assert (=> b!570595 (= lt!260116 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!570596 () Bool)

(declare-fun res!360380 () Bool)

(assert (=> b!570596 (=> (not res!360380) (not e!328170))))

(assert (=> b!570596 (= res!360380 (and (= (size!17529 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17529 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17529 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!570597 () Bool)

(declare-fun res!360374 () Bool)

(assert (=> b!570597 (=> (not res!360374) (not e!328168))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35750 (_ BitVec 32)) Bool)

(assert (=> b!570597 (= res!360374 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!570598 () Bool)

(assert (=> b!570598 (= e!328167 (not true))))

(assert (=> b!570598 e!328165))

(declare-fun res!360379 () Bool)

(assert (=> b!570598 (=> (not res!360379) (not e!328165))))

(declare-fun lt!260118 () SeekEntryResult!5614)

(assert (=> b!570598 (= res!360379 (= lt!260118 (Found!5614 j!142)))))

(assert (=> b!570598 (= lt!260118 (seekEntryOrOpen!0 (select (arr!17165 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!570598 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17930 0))(
  ( (Unit!17931) )
))
(declare-fun lt!260117 () Unit!17930)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35750 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17930)

(assert (=> b!570598 (= lt!260117 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!570599 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35750 (_ BitVec 32)) SeekEntryResult!5614)

(assert (=> b!570599 (= e!328166 (= lt!260118 (seekKeyOrZeroReturnVacant!0 (x!53554 lt!260114) (index!24685 lt!260114) (index!24685 lt!260114) (select (arr!17165 a!3118) j!142) a!3118 mask!3119)))))

(assert (= (and start!52290 res!360378) b!570596))

(assert (= (and b!570596 res!360380) b!570592))

(assert (= (and b!570592 res!360370) b!570590))

(assert (= (and b!570590 res!360377) b!570591))

(assert (= (and b!570591 res!360371) b!570595))

(assert (= (and b!570595 res!360373) b!570597))

(assert (= (and b!570597 res!360374) b!570589))

(assert (= (and b!570589 res!360372) b!570594))

(assert (= (and b!570594 res!360375) b!570598))

(assert (= (and b!570598 res!360379) b!570593))

(assert (= (and b!570593 (not res!360376)) b!570599))

(declare-fun m!549449 () Bool)

(assert (=> b!570597 m!549449))

(declare-fun m!549451 () Bool)

(assert (=> b!570593 m!549451))

(declare-fun m!549453 () Bool)

(assert (=> b!570593 m!549453))

(declare-fun m!549455 () Bool)

(assert (=> b!570590 m!549455))

(declare-fun m!549457 () Bool)

(assert (=> b!570591 m!549457))

(assert (=> b!570598 m!549453))

(assert (=> b!570598 m!549453))

(declare-fun m!549459 () Bool)

(assert (=> b!570598 m!549459))

(declare-fun m!549461 () Bool)

(assert (=> b!570598 m!549461))

(declare-fun m!549463 () Bool)

(assert (=> b!570598 m!549463))

(declare-fun m!549465 () Bool)

(assert (=> start!52290 m!549465))

(declare-fun m!549467 () Bool)

(assert (=> start!52290 m!549467))

(declare-fun m!549469 () Bool)

(assert (=> b!570595 m!549469))

(assert (=> b!570599 m!549453))

(assert (=> b!570599 m!549453))

(declare-fun m!549471 () Bool)

(assert (=> b!570599 m!549471))

(declare-fun m!549473 () Bool)

(assert (=> b!570589 m!549473))

(assert (=> b!570594 m!549453))

(declare-fun m!549475 () Bool)

(assert (=> b!570594 m!549475))

(assert (=> b!570594 m!549453))

(declare-fun m!549477 () Bool)

(assert (=> b!570594 m!549477))

(declare-fun m!549479 () Bool)

(assert (=> b!570594 m!549479))

(assert (=> b!570594 m!549477))

(declare-fun m!549481 () Bool)

(assert (=> b!570594 m!549481))

(assert (=> b!570594 m!549453))

(declare-fun m!549483 () Bool)

(assert (=> b!570594 m!549483))

(assert (=> b!570594 m!549477))

(declare-fun m!549485 () Bool)

(assert (=> b!570594 m!549485))

(assert (=> b!570592 m!549453))

(assert (=> b!570592 m!549453))

(declare-fun m!549487 () Bool)

(assert (=> b!570592 m!549487))

(push 1)

