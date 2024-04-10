; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52292 () Bool)

(assert start!52292)

(declare-fun b!570622 () Bool)

(declare-fun e!328185 () Bool)

(assert (=> b!570622 (= e!328185 (not true))))

(declare-fun e!328184 () Bool)

(assert (=> b!570622 e!328184))

(declare-fun res!360403 () Bool)

(assert (=> b!570622 (=> (not res!360403) (not e!328184))))

(declare-datatypes ((SeekEntryResult!5615 0))(
  ( (MissingZero!5615 (index!24687 (_ BitVec 32))) (Found!5615 (index!24688 (_ BitVec 32))) (Intermediate!5615 (undefined!6427 Bool) (index!24689 (_ BitVec 32)) (x!53563 (_ BitVec 32))) (Undefined!5615) (MissingVacant!5615 (index!24690 (_ BitVec 32))) )
))
(declare-fun lt!260136 () SeekEntryResult!5615)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!570622 (= res!360403 (= lt!260136 (Found!5615 j!142)))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35752 0))(
  ( (array!35753 (arr!17166 (Array (_ BitVec 32) (_ BitVec 64))) (size!17530 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35752)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35752 (_ BitVec 32)) SeekEntryResult!5615)

(assert (=> b!570622 (= lt!260136 (seekEntryOrOpen!0 (select (arr!17166 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35752 (_ BitVec 32)) Bool)

(assert (=> b!570622 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17932 0))(
  ( (Unit!17933) )
))
(declare-fun lt!260134 () Unit!17932)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35752 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17932)

(assert (=> b!570622 (= lt!260134 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!570623 () Bool)

(declare-fun res!360409 () Bool)

(declare-fun e!328183 () Bool)

(assert (=> b!570623 (=> (not res!360409) (not e!328183))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!570623 (= res!360409 (and (= (size!17530 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17530 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17530 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!570624 () Bool)

(declare-fun res!360405 () Bool)

(declare-fun e!328188 () Bool)

(assert (=> b!570624 (=> (not res!360405) (not e!328188))))

(declare-datatypes ((List!11246 0))(
  ( (Nil!11243) (Cons!11242 (h!12266 (_ BitVec 64)) (t!17474 List!11246)) )
))
(declare-fun arrayNoDuplicates!0 (array!35752 (_ BitVec 32) List!11246) Bool)

(assert (=> b!570624 (= res!360405 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11243))))

(declare-fun b!570625 () Bool)

(declare-fun res!360406 () Bool)

(assert (=> b!570625 (=> (not res!360406) (not e!328183))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35752 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!570625 (= res!360406 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!570626 () Bool)

(declare-fun lt!260132 () SeekEntryResult!5615)

(declare-fun e!328187 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35752 (_ BitVec 32)) SeekEntryResult!5615)

(assert (=> b!570626 (= e!328187 (= lt!260136 (seekKeyOrZeroReturnVacant!0 (x!53563 lt!260132) (index!24689 lt!260132) (index!24689 lt!260132) (select (arr!17166 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!570627 () Bool)

(assert (=> b!570627 (= e!328184 e!328187)))

(declare-fun res!360412 () Bool)

(assert (=> b!570627 (=> res!360412 e!328187)))

(assert (=> b!570627 (= res!360412 (or (undefined!6427 lt!260132) (not (is-Intermediate!5615 lt!260132)) (= (select (arr!17166 a!3118) (index!24689 lt!260132)) (select (arr!17166 a!3118) j!142)) (= (select (arr!17166 a!3118) (index!24689 lt!260132)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!360413 () Bool)

(assert (=> start!52292 (=> (not res!360413) (not e!328183))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52292 (= res!360413 (validMask!0 mask!3119))))

(assert (=> start!52292 e!328183))

(assert (=> start!52292 true))

(declare-fun array_inv!12962 (array!35752) Bool)

(assert (=> start!52292 (array_inv!12962 a!3118)))

(declare-fun b!570628 () Bool)

(assert (=> b!570628 (= e!328188 e!328185)))

(declare-fun res!360411 () Bool)

(assert (=> b!570628 (=> (not res!360411) (not e!328185))))

(declare-fun lt!260135 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35752 (_ BitVec 32)) SeekEntryResult!5615)

(assert (=> b!570628 (= res!360411 (= lt!260132 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260135 (select (store (arr!17166 a!3118) i!1132 k!1914) j!142) (array!35753 (store (arr!17166 a!3118) i!1132 k!1914) (size!17530 a!3118)) mask!3119)))))

(declare-fun lt!260137 () (_ BitVec 32))

(assert (=> b!570628 (= lt!260132 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260137 (select (arr!17166 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!570628 (= lt!260135 (toIndex!0 (select (store (arr!17166 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!570628 (= lt!260137 (toIndex!0 (select (arr!17166 a!3118) j!142) mask!3119))))

(declare-fun b!570629 () Bool)

(assert (=> b!570629 (= e!328183 e!328188)))

(declare-fun res!360404 () Bool)

(assert (=> b!570629 (=> (not res!360404) (not e!328188))))

(declare-fun lt!260133 () SeekEntryResult!5615)

(assert (=> b!570629 (= res!360404 (or (= lt!260133 (MissingZero!5615 i!1132)) (= lt!260133 (MissingVacant!5615 i!1132))))))

(assert (=> b!570629 (= lt!260133 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!570630 () Bool)

(declare-fun res!360408 () Bool)

(assert (=> b!570630 (=> (not res!360408) (not e!328188))))

(assert (=> b!570630 (= res!360408 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!570631 () Bool)

(declare-fun res!360410 () Bool)

(assert (=> b!570631 (=> (not res!360410) (not e!328183))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!570631 (= res!360410 (validKeyInArray!0 k!1914))))

(declare-fun b!570632 () Bool)

(declare-fun res!360407 () Bool)

(assert (=> b!570632 (=> (not res!360407) (not e!328183))))

(assert (=> b!570632 (= res!360407 (validKeyInArray!0 (select (arr!17166 a!3118) j!142)))))

(assert (= (and start!52292 res!360413) b!570623))

(assert (= (and b!570623 res!360409) b!570632))

(assert (= (and b!570632 res!360407) b!570631))

(assert (= (and b!570631 res!360410) b!570625))

(assert (= (and b!570625 res!360406) b!570629))

(assert (= (and b!570629 res!360404) b!570630))

(assert (= (and b!570630 res!360408) b!570624))

(assert (= (and b!570624 res!360405) b!570628))

(assert (= (and b!570628 res!360411) b!570622))

(assert (= (and b!570622 res!360403) b!570627))

(assert (= (and b!570627 (not res!360412)) b!570626))

(declare-fun m!549489 () Bool)

(assert (=> start!52292 m!549489))

(declare-fun m!549491 () Bool)

(assert (=> start!52292 m!549491))

(declare-fun m!549493 () Bool)

(assert (=> b!570628 m!549493))

(declare-fun m!549495 () Bool)

(assert (=> b!570628 m!549495))

(assert (=> b!570628 m!549493))

(declare-fun m!549497 () Bool)

(assert (=> b!570628 m!549497))

(assert (=> b!570628 m!549493))

(declare-fun m!549499 () Bool)

(assert (=> b!570628 m!549499))

(declare-fun m!549501 () Bool)

(assert (=> b!570628 m!549501))

(assert (=> b!570628 m!549497))

(declare-fun m!549503 () Bool)

(assert (=> b!570628 m!549503))

(assert (=> b!570628 m!549497))

(declare-fun m!549505 () Bool)

(assert (=> b!570628 m!549505))

(assert (=> b!570626 m!549493))

(assert (=> b!570626 m!549493))

(declare-fun m!549507 () Bool)

(assert (=> b!570626 m!549507))

(declare-fun m!549509 () Bool)

(assert (=> b!570630 m!549509))

(declare-fun m!549511 () Bool)

(assert (=> b!570624 m!549511))

(declare-fun m!549513 () Bool)

(assert (=> b!570631 m!549513))

(declare-fun m!549515 () Bool)

(assert (=> b!570625 m!549515))

(assert (=> b!570632 m!549493))

(assert (=> b!570632 m!549493))

(declare-fun m!549517 () Bool)

(assert (=> b!570632 m!549517))

(assert (=> b!570622 m!549493))

(assert (=> b!570622 m!549493))

(declare-fun m!549519 () Bool)

(assert (=> b!570622 m!549519))

(declare-fun m!549521 () Bool)

(assert (=> b!570622 m!549521))

(declare-fun m!549523 () Bool)

(assert (=> b!570622 m!549523))

(declare-fun m!549525 () Bool)

(assert (=> b!570629 m!549525))

(declare-fun m!549527 () Bool)

(assert (=> b!570627 m!549527))

(assert (=> b!570627 m!549493))

(push 1)

