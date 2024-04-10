; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31002 () Bool)

(assert start!31002)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((array!15904 0))(
  ( (array!15905 (arr!7534 (Array (_ BitVec 32) (_ BitVec 64))) (size!7886 (_ BitVec 32))) )
))
(declare-fun lt!152406 () array!15904)

(declare-fun b!311567 () Bool)

(declare-fun lt!152407 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun e!194385 () Bool)

(declare-datatypes ((SeekEntryResult!2674 0))(
  ( (MissingZero!2674 (index!12872 (_ BitVec 32))) (Found!2674 (index!12873 (_ BitVec 32))) (Intermediate!2674 (undefined!3486 Bool) (index!12874 (_ BitVec 32)) (x!31087 (_ BitVec 32))) (Undefined!2674) (MissingVacant!2674 (index!12875 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15904 (_ BitVec 32)) SeekEntryResult!2674)

(assert (=> b!311567 (= e!194385 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!152406 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152407 k!2441 lt!152406 mask!3709)))))

(declare-fun a!3293 () array!15904)

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!311567 (= lt!152406 (array!15905 (store (arr!7534 a!3293) i!1240 k!2441) (size!7886 a!3293)))))

(declare-fun b!311568 () Bool)

(declare-fun e!194383 () Bool)

(assert (=> b!311568 (= e!194383 (not true))))

(assert (=> b!311568 e!194385))

(declare-fun res!168027 () Bool)

(assert (=> b!311568 (=> (not res!168027) (not e!194385))))

(declare-fun lt!152409 () SeekEntryResult!2674)

(assert (=> b!311568 (= res!168027 (= lt!152409 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152407 k!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311568 (= lt!152407 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!311569 () Bool)

(declare-fun res!168021 () Bool)

(declare-fun e!194382 () Bool)

(assert (=> b!311569 (=> (not res!168021) (not e!194382))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311569 (= res!168021 (validKeyInArray!0 k!2441))))

(declare-fun b!311570 () Bool)

(declare-fun res!168026 () Bool)

(declare-fun e!194384 () Bool)

(assert (=> b!311570 (=> (not res!168026) (not e!194384))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!311570 (= res!168026 (and (= (select (arr!7534 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7886 a!3293))))))

(declare-fun b!311571 () Bool)

(declare-fun res!168024 () Bool)

(assert (=> b!311571 (=> (not res!168024) (not e!194382))))

(assert (=> b!311571 (= res!168024 (and (= (size!7886 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7886 a!3293))))))

(declare-fun res!168029 () Bool)

(assert (=> start!31002 (=> (not res!168029) (not e!194382))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31002 (= res!168029 (validMask!0 mask!3709))))

(assert (=> start!31002 e!194382))

(declare-fun array_inv!5497 (array!15904) Bool)

(assert (=> start!31002 (array_inv!5497 a!3293)))

(assert (=> start!31002 true))

(declare-fun b!311572 () Bool)

(assert (=> b!311572 (= e!194382 e!194384)))

(declare-fun res!168028 () Bool)

(assert (=> b!311572 (=> (not res!168028) (not e!194384))))

(declare-fun lt!152408 () SeekEntryResult!2674)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311572 (= res!168028 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!152408))))

(assert (=> b!311572 (= lt!152408 (Intermediate!2674 false resIndex!52 resX!52))))

(declare-fun b!311573 () Bool)

(declare-fun res!168030 () Bool)

(assert (=> b!311573 (=> (not res!168030) (not e!194382))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15904 (_ BitVec 32)) Bool)

(assert (=> b!311573 (= res!168030 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!311574 () Bool)

(assert (=> b!311574 (= e!194384 e!194383)))

(declare-fun res!168023 () Bool)

(assert (=> b!311574 (=> (not res!168023) (not e!194383))))

(assert (=> b!311574 (= res!168023 (and (= lt!152409 lt!152408) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7534 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!311574 (= lt!152409 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!311575 () Bool)

(declare-fun res!168025 () Bool)

(assert (=> b!311575 (=> (not res!168025) (not e!194382))))

(declare-fun arrayContainsKey!0 (array!15904 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311575 (= res!168025 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311576 () Bool)

(declare-fun res!168022 () Bool)

(assert (=> b!311576 (=> (not res!168022) (not e!194382))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15904 (_ BitVec 32)) SeekEntryResult!2674)

(assert (=> b!311576 (= res!168022 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2674 i!1240)))))

(assert (= (and start!31002 res!168029) b!311571))

(assert (= (and b!311571 res!168024) b!311569))

(assert (= (and b!311569 res!168021) b!311575))

(assert (= (and b!311575 res!168025) b!311576))

(assert (= (and b!311576 res!168022) b!311573))

(assert (= (and b!311573 res!168030) b!311572))

(assert (= (and b!311572 res!168028) b!311570))

(assert (= (and b!311570 res!168026) b!311574))

(assert (= (and b!311574 res!168023) b!311568))

(assert (= (and b!311568 res!168027) b!311567))

(declare-fun m!321549 () Bool)

(assert (=> b!311568 m!321549))

(declare-fun m!321551 () Bool)

(assert (=> b!311568 m!321551))

(declare-fun m!321553 () Bool)

(assert (=> b!311574 m!321553))

(declare-fun m!321555 () Bool)

(assert (=> b!311574 m!321555))

(declare-fun m!321557 () Bool)

(assert (=> b!311576 m!321557))

(declare-fun m!321559 () Bool)

(assert (=> b!311573 m!321559))

(declare-fun m!321561 () Bool)

(assert (=> b!311569 m!321561))

(declare-fun m!321563 () Bool)

(assert (=> b!311567 m!321563))

(declare-fun m!321565 () Bool)

(assert (=> b!311567 m!321565))

(declare-fun m!321567 () Bool)

(assert (=> b!311567 m!321567))

(declare-fun m!321569 () Bool)

(assert (=> b!311575 m!321569))

(declare-fun m!321571 () Bool)

(assert (=> start!31002 m!321571))

(declare-fun m!321573 () Bool)

(assert (=> start!31002 m!321573))

(declare-fun m!321575 () Bool)

(assert (=> b!311570 m!321575))

(declare-fun m!321577 () Bool)

(assert (=> b!311572 m!321577))

(assert (=> b!311572 m!321577))

(declare-fun m!321579 () Bool)

(assert (=> b!311572 m!321579))

(push 1)

(assert (not b!311573))

(assert (not b!311567))

(assert (not b!311569))

(assert (not b!311572))

