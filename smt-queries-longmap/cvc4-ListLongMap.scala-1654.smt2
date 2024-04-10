; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30762 () Bool)

(assert start!30762)

(declare-fun b!308661 () Bool)

(declare-fun e!192967 () Bool)

(declare-fun mask!3709 () (_ BitVec 32))

(assert (=> b!308661 (= e!192967 (not (bvsge mask!3709 #b00000000000000000000000000000000)))))

(declare-datatypes ((array!15715 0))(
  ( (array!15716 (arr!7441 (Array (_ BitVec 32) (_ BitVec 64))) (size!7793 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15715)

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2581 0))(
  ( (MissingZero!2581 (index!12500 (_ BitVec 32))) (Found!2581 (index!12501 (_ BitVec 32))) (Intermediate!2581 (undefined!3393 Bool) (index!12502 (_ BitVec 32)) (x!30737 (_ BitVec 32))) (Undefined!2581) (MissingVacant!2581 (index!12503 (_ BitVec 32))) )
))
(declare-fun lt!151415 () SeekEntryResult!2581)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15715 (_ BitVec 32)) SeekEntryResult!2581)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308661 (= lt!151415 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!308662 () Bool)

(declare-fun res!165278 () Bool)

(declare-fun e!192969 () Bool)

(assert (=> b!308662 (=> (not res!165278) (not e!192969))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!308662 (= res!165278 (and (= (select (arr!7441 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7793 a!3293))))))

(declare-fun b!308664 () Bool)

(declare-fun res!165277 () Bool)

(declare-fun e!192968 () Bool)

(assert (=> b!308664 (=> (not res!165277) (not e!192968))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308664 (= res!165277 (validKeyInArray!0 k!2441))))

(declare-fun b!308665 () Bool)

(declare-fun res!165279 () Bool)

(assert (=> b!308665 (=> (not res!165279) (not e!192968))))

(assert (=> b!308665 (= res!165279 (and (= (size!7793 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7793 a!3293))))))

(declare-fun res!165275 () Bool)

(assert (=> start!30762 (=> (not res!165275) (not e!192968))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30762 (= res!165275 (validMask!0 mask!3709))))

(assert (=> start!30762 e!192968))

(declare-fun array_inv!5404 (array!15715) Bool)

(assert (=> start!30762 (array_inv!5404 a!3293)))

(assert (=> start!30762 true))

(declare-fun b!308663 () Bool)

(assert (=> b!308663 (= e!192968 e!192969)))

(declare-fun res!165281 () Bool)

(assert (=> b!308663 (=> (not res!165281) (not e!192969))))

(declare-fun lt!151416 () SeekEntryResult!2581)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308663 (= res!165281 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151416))))

(assert (=> b!308663 (= lt!151416 (Intermediate!2581 false resIndex!52 resX!52))))

(declare-fun b!308666 () Bool)

(declare-fun res!165280 () Bool)

(assert (=> b!308666 (=> (not res!165280) (not e!192968))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15715 (_ BitVec 32)) SeekEntryResult!2581)

(assert (=> b!308666 (= res!165280 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2581 i!1240)))))

(declare-fun b!308667 () Bool)

(declare-fun res!165276 () Bool)

(assert (=> b!308667 (=> (not res!165276) (not e!192968))))

(declare-fun arrayContainsKey!0 (array!15715 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308667 (= res!165276 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!308668 () Bool)

(declare-fun res!165282 () Bool)

(assert (=> b!308668 (=> (not res!165282) (not e!192968))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15715 (_ BitVec 32)) Bool)

(assert (=> b!308668 (= res!165282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!308669 () Bool)

(assert (=> b!308669 (= e!192969 e!192967)))

(declare-fun res!165274 () Bool)

(assert (=> b!308669 (=> (not res!165274) (not e!192967))))

(assert (=> b!308669 (= res!165274 (and (= lt!151415 lt!151416) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7441 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!308669 (= lt!151415 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(assert (= (and start!30762 res!165275) b!308665))

(assert (= (and b!308665 res!165279) b!308664))

(assert (= (and b!308664 res!165277) b!308667))

(assert (= (and b!308667 res!165276) b!308666))

(assert (= (and b!308666 res!165280) b!308668))

(assert (= (and b!308668 res!165282) b!308663))

(assert (= (and b!308663 res!165281) b!308662))

(assert (= (and b!308662 res!165278) b!308669))

(assert (= (and b!308669 res!165274) b!308661))

(declare-fun m!318693 () Bool)

(assert (=> b!308666 m!318693))

(declare-fun m!318695 () Bool)

(assert (=> b!308663 m!318695))

(assert (=> b!308663 m!318695))

(declare-fun m!318697 () Bool)

(assert (=> b!308663 m!318697))

(declare-fun m!318699 () Bool)

(assert (=> b!308664 m!318699))

(declare-fun m!318701 () Bool)

(assert (=> b!308662 m!318701))

(declare-fun m!318703 () Bool)

(assert (=> b!308661 m!318703))

(assert (=> b!308661 m!318703))

(declare-fun m!318705 () Bool)

(assert (=> b!308661 m!318705))

(declare-fun m!318707 () Bool)

(assert (=> start!30762 m!318707))

(declare-fun m!318709 () Bool)

(assert (=> start!30762 m!318709))

(declare-fun m!318711 () Bool)

(assert (=> b!308669 m!318711))

(declare-fun m!318713 () Bool)

(assert (=> b!308669 m!318713))

(declare-fun m!318715 () Bool)

(assert (=> b!308667 m!318715))

(declare-fun m!318717 () Bool)

(assert (=> b!308668 m!318717))

(push 1)

(assert (not b!308669))

(assert (not b!308663))

(assert (not b!308666))

(assert (not b!308661))

(assert (not b!308668))

(assert (not b!308667))

(assert (not b!308664))

(assert (not start!30762))

