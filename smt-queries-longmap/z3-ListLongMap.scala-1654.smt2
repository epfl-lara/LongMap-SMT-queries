; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30760 () Bool)

(assert start!30760)

(declare-fun b!308634 () Bool)

(declare-fun res!165253 () Bool)

(declare-fun e!192957 () Bool)

(assert (=> b!308634 (=> (not res!165253) (not e!192957))))

(declare-datatypes ((array!15713 0))(
  ( (array!15714 (arr!7440 (Array (_ BitVec 32) (_ BitVec 64))) (size!7792 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15713)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!308634 (= res!165253 (and (= (select (arr!7440 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7792 a!3293))))))

(declare-fun b!308635 () Bool)

(declare-fun e!192956 () Bool)

(assert (=> b!308635 (= e!192956 e!192957)))

(declare-fun res!165255 () Bool)

(assert (=> b!308635 (=> (not res!165255) (not e!192957))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2580 0))(
  ( (MissingZero!2580 (index!12496 (_ BitVec 32))) (Found!2580 (index!12497 (_ BitVec 32))) (Intermediate!2580 (undefined!3392 Bool) (index!12498 (_ BitVec 32)) (x!30736 (_ BitVec 32))) (Undefined!2580) (MissingVacant!2580 (index!12499 (_ BitVec 32))) )
))
(declare-fun lt!151409 () SeekEntryResult!2580)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15713 (_ BitVec 32)) SeekEntryResult!2580)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308635 (= res!165255 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151409))))

(assert (=> b!308635 (= lt!151409 (Intermediate!2580 false resIndex!52 resX!52))))

(declare-fun b!308636 () Bool)

(declare-fun res!165247 () Bool)

(assert (=> b!308636 (=> (not res!165247) (not e!192956))))

(declare-fun arrayContainsKey!0 (array!15713 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308636 (= res!165247 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!308637 () Bool)

(declare-fun e!192958 () Bool)

(assert (=> b!308637 (= e!192957 e!192958)))

(declare-fun res!165250 () Bool)

(assert (=> b!308637 (=> (not res!165250) (not e!192958))))

(declare-fun lt!151410 () SeekEntryResult!2580)

(assert (=> b!308637 (= res!165250 (and (= lt!151410 lt!151409) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7440 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!308637 (= lt!151410 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!308639 () Bool)

(declare-fun res!165249 () Bool)

(assert (=> b!308639 (=> (not res!165249) (not e!192956))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15713 (_ BitVec 32)) SeekEntryResult!2580)

(assert (=> b!308639 (= res!165249 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2580 i!1240)))))

(declare-fun b!308640 () Bool)

(declare-fun res!165254 () Bool)

(assert (=> b!308640 (=> (not res!165254) (not e!192956))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308640 (= res!165254 (validKeyInArray!0 k0!2441))))

(declare-fun b!308641 () Bool)

(declare-fun res!165252 () Bool)

(assert (=> b!308641 (=> (not res!165252) (not e!192956))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15713 (_ BitVec 32)) Bool)

(assert (=> b!308641 (= res!165252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!308642 () Bool)

(assert (=> b!308642 (= e!192958 (not (bvsge mask!3709 #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308642 (= lt!151410 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!308638 () Bool)

(declare-fun res!165248 () Bool)

(assert (=> b!308638 (=> (not res!165248) (not e!192956))))

(assert (=> b!308638 (= res!165248 (and (= (size!7792 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7792 a!3293))))))

(declare-fun res!165251 () Bool)

(assert (=> start!30760 (=> (not res!165251) (not e!192956))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30760 (= res!165251 (validMask!0 mask!3709))))

(assert (=> start!30760 e!192956))

(declare-fun array_inv!5403 (array!15713) Bool)

(assert (=> start!30760 (array_inv!5403 a!3293)))

(assert (=> start!30760 true))

(assert (= (and start!30760 res!165251) b!308638))

(assert (= (and b!308638 res!165248) b!308640))

(assert (= (and b!308640 res!165254) b!308636))

(assert (= (and b!308636 res!165247) b!308639))

(assert (= (and b!308639 res!165249) b!308641))

(assert (= (and b!308641 res!165252) b!308635))

(assert (= (and b!308635 res!165255) b!308634))

(assert (= (and b!308634 res!165253) b!308637))

(assert (= (and b!308637 res!165250) b!308642))

(declare-fun m!318667 () Bool)

(assert (=> b!308635 m!318667))

(assert (=> b!308635 m!318667))

(declare-fun m!318669 () Bool)

(assert (=> b!308635 m!318669))

(declare-fun m!318671 () Bool)

(assert (=> b!308637 m!318671))

(declare-fun m!318673 () Bool)

(assert (=> b!308637 m!318673))

(declare-fun m!318675 () Bool)

(assert (=> b!308636 m!318675))

(declare-fun m!318677 () Bool)

(assert (=> b!308641 m!318677))

(declare-fun m!318679 () Bool)

(assert (=> start!30760 m!318679))

(declare-fun m!318681 () Bool)

(assert (=> start!30760 m!318681))

(declare-fun m!318683 () Bool)

(assert (=> b!308639 m!318683))

(declare-fun m!318685 () Bool)

(assert (=> b!308634 m!318685))

(declare-fun m!318687 () Bool)

(assert (=> b!308640 m!318687))

(declare-fun m!318689 () Bool)

(assert (=> b!308642 m!318689))

(assert (=> b!308642 m!318689))

(declare-fun m!318691 () Bool)

(assert (=> b!308642 m!318691))

(check-sat (not b!308641) (not b!308642) (not b!308636) (not b!308635) (not start!30760) (not b!308639) (not b!308640) (not b!308637))
(check-sat)
