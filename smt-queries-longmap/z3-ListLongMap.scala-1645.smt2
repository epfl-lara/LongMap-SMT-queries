; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30652 () Bool)

(assert start!30652)

(declare-fun b!307635 () Bool)

(declare-fun res!164393 () Bool)

(declare-fun e!192566 () Bool)

(assert (=> b!307635 (=> (not res!164393) (not e!192566))))

(declare-datatypes ((array!15656 0))(
  ( (array!15657 (arr!7413 (Array (_ BitVec 32) (_ BitVec 64))) (size!7765 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15656)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!307635 (= res!164393 (and (= (select (arr!7413 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7765 a!3293))))))

(declare-fun b!307636 () Bool)

(declare-fun res!164397 () Bool)

(assert (=> b!307636 (=> (not res!164397) (not e!192566))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2553 0))(
  ( (MissingZero!2553 (index!12388 (_ BitVec 32))) (Found!2553 (index!12389 (_ BitVec 32))) (Intermediate!2553 (undefined!3365 Bool) (index!12390 (_ BitVec 32)) (x!30628 (_ BitVec 32))) (Undefined!2553) (MissingVacant!2553 (index!12391 (_ BitVec 32))) )
))
(declare-fun lt!151155 () SeekEntryResult!2553)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15656 (_ BitVec 32)) SeekEntryResult!2553)

(assert (=> b!307636 (= res!164397 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!151155))))

(declare-fun b!307637 () Bool)

(declare-fun res!164389 () Bool)

(declare-fun e!192568 () Bool)

(assert (=> b!307637 (=> (not res!164389) (not e!192568))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15656 (_ BitVec 32)) SeekEntryResult!2553)

(assert (=> b!307637 (= res!164389 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2553 i!1240)))))

(declare-fun res!164391 () Bool)

(assert (=> start!30652 (=> (not res!164391) (not e!192568))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30652 (= res!164391 (validMask!0 mask!3709))))

(assert (=> start!30652 e!192568))

(declare-fun array_inv!5376 (array!15656) Bool)

(assert (=> start!30652 (array_inv!5376 a!3293)))

(assert (=> start!30652 true))

(declare-fun b!307638 () Bool)

(declare-fun res!164394 () Bool)

(assert (=> b!307638 (=> (not res!164394) (not e!192568))))

(assert (=> b!307638 (= res!164394 (and (= (size!7765 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7765 a!3293))))))

(declare-fun b!307639 () Bool)

(assert (=> b!307639 (= e!192568 e!192566)))

(declare-fun res!164396 () Bool)

(assert (=> b!307639 (=> (not res!164396) (not e!192566))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307639 (= res!164396 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151155))))

(assert (=> b!307639 (= lt!151155 (Intermediate!2553 false resIndex!52 resX!52))))

(declare-fun b!307640 () Bool)

(declare-fun res!164392 () Bool)

(assert (=> b!307640 (=> (not res!164392) (not e!192568))))

(declare-fun arrayContainsKey!0 (array!15656 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307640 (= res!164392 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!307641 () Bool)

(declare-fun res!164390 () Bool)

(assert (=> b!307641 (=> (not res!164390) (not e!192568))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15656 (_ BitVec 32)) Bool)

(assert (=> b!307641 (= res!164390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307642 () Bool)

(declare-fun res!164395 () Bool)

(assert (=> b!307642 (=> (not res!164395) (not e!192568))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307642 (= res!164395 (validKeyInArray!0 k0!2441))))

(declare-fun b!307643 () Bool)

(assert (=> b!307643 (= e!192566 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7413 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709))))))

(assert (= (and start!30652 res!164391) b!307638))

(assert (= (and b!307638 res!164394) b!307642))

(assert (= (and b!307642 res!164395) b!307640))

(assert (= (and b!307640 res!164392) b!307637))

(assert (= (and b!307637 res!164389) b!307641))

(assert (= (and b!307641 res!164390) b!307639))

(assert (= (and b!307639 res!164396) b!307635))

(assert (= (and b!307635 res!164393) b!307636))

(assert (= (and b!307636 res!164397) b!307643))

(declare-fun m!317907 () Bool)

(assert (=> b!307639 m!317907))

(assert (=> b!307639 m!317907))

(declare-fun m!317909 () Bool)

(assert (=> b!307639 m!317909))

(declare-fun m!317911 () Bool)

(assert (=> b!307643 m!317911))

(declare-fun m!317913 () Bool)

(assert (=> b!307642 m!317913))

(declare-fun m!317915 () Bool)

(assert (=> b!307640 m!317915))

(declare-fun m!317917 () Bool)

(assert (=> b!307635 m!317917))

(declare-fun m!317919 () Bool)

(assert (=> b!307637 m!317919))

(declare-fun m!317921 () Bool)

(assert (=> start!30652 m!317921))

(declare-fun m!317923 () Bool)

(assert (=> start!30652 m!317923))

(declare-fun m!317925 () Bool)

(assert (=> b!307641 m!317925))

(declare-fun m!317927 () Bool)

(assert (=> b!307636 m!317927))

(check-sat (not b!307636) (not b!307642) (not b!307639) (not b!307641) (not b!307640) (not start!30652) (not b!307637))
(check-sat)
