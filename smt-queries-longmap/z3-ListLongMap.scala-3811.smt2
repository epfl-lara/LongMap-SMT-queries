; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52288 () Bool)

(assert start!52288)

(declare-fun b!570556 () Bool)

(declare-fun res!360342 () Bool)

(declare-fun e!328152 () Bool)

(assert (=> b!570556 (=> (not res!360342) (not e!328152))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!570556 (= res!360342 (validKeyInArray!0 k0!1914))))

(declare-fun b!570557 () Bool)

(declare-fun res!360340 () Bool)

(assert (=> b!570557 (=> (not res!360340) (not e!328152))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35748 0))(
  ( (array!35749 (arr!17164 (Array (_ BitVec 32) (_ BitVec 64))) (size!17528 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35748)

(assert (=> b!570557 (= res!360340 (and (= (size!17528 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17528 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17528 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!570558 () Bool)

(declare-fun e!328150 () Bool)

(assert (=> b!570558 (= e!328152 e!328150)))

(declare-fun res!360337 () Bool)

(assert (=> b!570558 (=> (not res!360337) (not e!328150))))

(declare-datatypes ((SeekEntryResult!5613 0))(
  ( (MissingZero!5613 (index!24679 (_ BitVec 32))) (Found!5613 (index!24680 (_ BitVec 32))) (Intermediate!5613 (undefined!6425 Bool) (index!24681 (_ BitVec 32)) (x!53553 (_ BitVec 32))) (Undefined!5613) (MissingVacant!5613 (index!24682 (_ BitVec 32))) )
))
(declare-fun lt!260101 () SeekEntryResult!5613)

(assert (=> b!570558 (= res!360337 (or (= lt!260101 (MissingZero!5613 i!1132)) (= lt!260101 (MissingVacant!5613 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35748 (_ BitVec 32)) SeekEntryResult!5613)

(assert (=> b!570558 (= lt!260101 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!570559 () Bool)

(declare-fun e!328148 () Bool)

(assert (=> b!570559 (= e!328150 e!328148)))

(declare-fun res!360341 () Bool)

(assert (=> b!570559 (=> (not res!360341) (not e!328148))))

(declare-fun lt!260097 () (_ BitVec 32))

(declare-fun lt!260099 () SeekEntryResult!5613)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35748 (_ BitVec 32)) SeekEntryResult!5613)

(assert (=> b!570559 (= res!360341 (= lt!260099 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260097 (select (store (arr!17164 a!3118) i!1132 k0!1914) j!142) (array!35749 (store (arr!17164 a!3118) i!1132 k0!1914) (size!17528 a!3118)) mask!3119)))))

(declare-fun lt!260098 () (_ BitVec 32))

(assert (=> b!570559 (= lt!260099 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260098 (select (arr!17164 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!570559 (= lt!260097 (toIndex!0 (select (store (arr!17164 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!570559 (= lt!260098 (toIndex!0 (select (arr!17164 a!3118) j!142) mask!3119))))

(declare-fun e!328147 () Bool)

(declare-fun lt!260100 () SeekEntryResult!5613)

(declare-fun b!570560 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35748 (_ BitVec 32)) SeekEntryResult!5613)

(assert (=> b!570560 (= e!328147 (= lt!260100 (seekKeyOrZeroReturnVacant!0 (x!53553 lt!260099) (index!24681 lt!260099) (index!24681 lt!260099) (select (arr!17164 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!570561 () Bool)

(declare-fun res!360346 () Bool)

(assert (=> b!570561 (=> (not res!360346) (not e!328152))))

(declare-fun arrayContainsKey!0 (array!35748 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!570561 (= res!360346 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!570562 () Bool)

(declare-fun res!360347 () Bool)

(assert (=> b!570562 (=> (not res!360347) (not e!328152))))

(assert (=> b!570562 (= res!360347 (validKeyInArray!0 (select (arr!17164 a!3118) j!142)))))

(declare-fun b!570563 () Bool)

(assert (=> b!570563 (= e!328148 (not true))))

(declare-fun e!328149 () Bool)

(assert (=> b!570563 e!328149))

(declare-fun res!360345 () Bool)

(assert (=> b!570563 (=> (not res!360345) (not e!328149))))

(assert (=> b!570563 (= res!360345 (= lt!260100 (Found!5613 j!142)))))

(assert (=> b!570563 (= lt!260100 (seekEntryOrOpen!0 (select (arr!17164 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35748 (_ BitVec 32)) Bool)

(assert (=> b!570563 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17928 0))(
  ( (Unit!17929) )
))
(declare-fun lt!260096 () Unit!17928)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35748 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17928)

(assert (=> b!570563 (= lt!260096 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!570565 () Bool)

(assert (=> b!570565 (= e!328149 e!328147)))

(declare-fun res!360344 () Bool)

(assert (=> b!570565 (=> res!360344 e!328147)))

(get-info :version)

(assert (=> b!570565 (= res!360344 (or (undefined!6425 lt!260099) (not ((_ is Intermediate!5613) lt!260099)) (= (select (arr!17164 a!3118) (index!24681 lt!260099)) (select (arr!17164 a!3118) j!142)) (= (select (arr!17164 a!3118) (index!24681 lt!260099)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!570566 () Bool)

(declare-fun res!360343 () Bool)

(assert (=> b!570566 (=> (not res!360343) (not e!328150))))

(assert (=> b!570566 (= res!360343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!360338 () Bool)

(assert (=> start!52288 (=> (not res!360338) (not e!328152))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52288 (= res!360338 (validMask!0 mask!3119))))

(assert (=> start!52288 e!328152))

(assert (=> start!52288 true))

(declare-fun array_inv!12960 (array!35748) Bool)

(assert (=> start!52288 (array_inv!12960 a!3118)))

(declare-fun b!570564 () Bool)

(declare-fun res!360339 () Bool)

(assert (=> b!570564 (=> (not res!360339) (not e!328150))))

(declare-datatypes ((List!11244 0))(
  ( (Nil!11241) (Cons!11240 (h!12264 (_ BitVec 64)) (t!17472 List!11244)) )
))
(declare-fun arrayNoDuplicates!0 (array!35748 (_ BitVec 32) List!11244) Bool)

(assert (=> b!570564 (= res!360339 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11241))))

(assert (= (and start!52288 res!360338) b!570557))

(assert (= (and b!570557 res!360340) b!570562))

(assert (= (and b!570562 res!360347) b!570556))

(assert (= (and b!570556 res!360342) b!570561))

(assert (= (and b!570561 res!360346) b!570558))

(assert (= (and b!570558 res!360337) b!570566))

(assert (= (and b!570566 res!360343) b!570564))

(assert (= (and b!570564 res!360339) b!570559))

(assert (= (and b!570559 res!360341) b!570563))

(assert (= (and b!570563 res!360345) b!570565))

(assert (= (and b!570565 (not res!360344)) b!570560))

(declare-fun m!549409 () Bool)

(assert (=> b!570559 m!549409))

(declare-fun m!549411 () Bool)

(assert (=> b!570559 m!549411))

(declare-fun m!549413 () Bool)

(assert (=> b!570559 m!549413))

(declare-fun m!549415 () Bool)

(assert (=> b!570559 m!549415))

(assert (=> b!570559 m!549409))

(declare-fun m!549417 () Bool)

(assert (=> b!570559 m!549417))

(assert (=> b!570559 m!549409))

(assert (=> b!570559 m!549413))

(declare-fun m!549419 () Bool)

(assert (=> b!570559 m!549419))

(assert (=> b!570559 m!549413))

(declare-fun m!549421 () Bool)

(assert (=> b!570559 m!549421))

(declare-fun m!549423 () Bool)

(assert (=> b!570561 m!549423))

(declare-fun m!549425 () Bool)

(assert (=> b!570566 m!549425))

(declare-fun m!549427 () Bool)

(assert (=> b!570556 m!549427))

(declare-fun m!549429 () Bool)

(assert (=> b!570558 m!549429))

(assert (=> b!570563 m!549409))

(assert (=> b!570563 m!549409))

(declare-fun m!549431 () Bool)

(assert (=> b!570563 m!549431))

(declare-fun m!549433 () Bool)

(assert (=> b!570563 m!549433))

(declare-fun m!549435 () Bool)

(assert (=> b!570563 m!549435))

(declare-fun m!549437 () Bool)

(assert (=> b!570564 m!549437))

(declare-fun m!549439 () Bool)

(assert (=> start!52288 m!549439))

(declare-fun m!549441 () Bool)

(assert (=> start!52288 m!549441))

(assert (=> b!570560 m!549409))

(assert (=> b!570560 m!549409))

(declare-fun m!549443 () Bool)

(assert (=> b!570560 m!549443))

(assert (=> b!570562 m!549409))

(assert (=> b!570562 m!549409))

(declare-fun m!549445 () Bool)

(assert (=> b!570562 m!549445))

(declare-fun m!549447 () Bool)

(assert (=> b!570565 m!549447))

(assert (=> b!570565 m!549409))

(check-sat (not b!570566) (not b!570564) (not b!570558) (not b!570561) (not start!52288) (not b!570556) (not b!570559) (not b!570562) (not b!570560) (not b!570563))
(check-sat)
