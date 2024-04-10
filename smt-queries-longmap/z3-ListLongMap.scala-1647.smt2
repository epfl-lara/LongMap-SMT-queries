; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30664 () Bool)

(assert start!30664)

(declare-fun b!307802 () Bool)

(declare-fun res!164563 () Bool)

(declare-fun e!192622 () Bool)

(assert (=> b!307802 (=> (not res!164563) (not e!192622))))

(declare-datatypes ((array!15668 0))(
  ( (array!15669 (arr!7419 (Array (_ BitVec 32) (_ BitVec 64))) (size!7771 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15668)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!307802 (= res!164563 (and (= (size!7771 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7771 a!3293))))))

(declare-fun b!307803 () Bool)

(declare-fun res!164564 () Bool)

(assert (=> b!307803 (=> (not res!164564) (not e!192622))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15668 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307803 (= res!164564 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!307805 () Bool)

(declare-fun res!164559 () Bool)

(assert (=> b!307805 (=> (not res!164559) (not e!192622))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307805 (= res!164559 (validKeyInArray!0 k0!2441))))

(declare-fun b!307806 () Bool)

(declare-fun res!164561 () Bool)

(assert (=> b!307806 (=> (not res!164561) (not e!192622))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15668 (_ BitVec 32)) Bool)

(assert (=> b!307806 (= res!164561 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307807 () Bool)

(declare-fun res!164556 () Bool)

(declare-fun e!192621 () Bool)

(assert (=> b!307807 (=> (not res!164556) (not e!192621))))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!307807 (= res!164556 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7419 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun b!307808 () Bool)

(assert (=> b!307808 (= e!192621 false)))

(declare-fun lt!151178 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307808 (= lt!151178 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!307809 () Bool)

(declare-fun res!164565 () Bool)

(assert (=> b!307809 (=> (not res!164565) (not e!192621))))

(declare-datatypes ((SeekEntryResult!2559 0))(
  ( (MissingZero!2559 (index!12412 (_ BitVec 32))) (Found!2559 (index!12413 (_ BitVec 32))) (Intermediate!2559 (undefined!3371 Bool) (index!12414 (_ BitVec 32)) (x!30650 (_ BitVec 32))) (Undefined!2559) (MissingVacant!2559 (index!12415 (_ BitVec 32))) )
))
(declare-fun lt!151179 () SeekEntryResult!2559)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15668 (_ BitVec 32)) SeekEntryResult!2559)

(assert (=> b!307809 (= res!164565 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!151179))))

(declare-fun res!164557 () Bool)

(assert (=> start!30664 (=> (not res!164557) (not e!192622))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30664 (= res!164557 (validMask!0 mask!3709))))

(assert (=> start!30664 e!192622))

(declare-fun array_inv!5382 (array!15668) Bool)

(assert (=> start!30664 (array_inv!5382 a!3293)))

(assert (=> start!30664 true))

(declare-fun b!307804 () Bool)

(declare-fun res!164562 () Bool)

(assert (=> b!307804 (=> (not res!164562) (not e!192622))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15668 (_ BitVec 32)) SeekEntryResult!2559)

(assert (=> b!307804 (= res!164562 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2559 i!1240)))))

(declare-fun b!307810 () Bool)

(assert (=> b!307810 (= e!192622 e!192621)))

(declare-fun res!164558 () Bool)

(assert (=> b!307810 (=> (not res!164558) (not e!192621))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307810 (= res!164558 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151179))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!307810 (= lt!151179 (Intermediate!2559 false resIndex!52 resX!52))))

(declare-fun b!307811 () Bool)

(declare-fun res!164560 () Bool)

(assert (=> b!307811 (=> (not res!164560) (not e!192621))))

(assert (=> b!307811 (= res!164560 (and (= (select (arr!7419 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7771 a!3293))))))

(assert (= (and start!30664 res!164557) b!307802))

(assert (= (and b!307802 res!164563) b!307805))

(assert (= (and b!307805 res!164559) b!307803))

(assert (= (and b!307803 res!164564) b!307804))

(assert (= (and b!307804 res!164562) b!307806))

(assert (= (and b!307806 res!164561) b!307810))

(assert (= (and b!307810 res!164558) b!307811))

(assert (= (and b!307811 res!164560) b!307809))

(assert (= (and b!307809 res!164565) b!307807))

(assert (= (and b!307807 res!164556) b!307808))

(declare-fun m!318041 () Bool)

(assert (=> b!307805 m!318041))

(declare-fun m!318043 () Bool)

(assert (=> b!307803 m!318043))

(declare-fun m!318045 () Bool)

(assert (=> b!307808 m!318045))

(declare-fun m!318047 () Bool)

(assert (=> b!307809 m!318047))

(declare-fun m!318049 () Bool)

(assert (=> b!307811 m!318049))

(declare-fun m!318051 () Bool)

(assert (=> start!30664 m!318051))

(declare-fun m!318053 () Bool)

(assert (=> start!30664 m!318053))

(declare-fun m!318055 () Bool)

(assert (=> b!307804 m!318055))

(declare-fun m!318057 () Bool)

(assert (=> b!307806 m!318057))

(declare-fun m!318059 () Bool)

(assert (=> b!307810 m!318059))

(assert (=> b!307810 m!318059))

(declare-fun m!318061 () Bool)

(assert (=> b!307810 m!318061))

(declare-fun m!318063 () Bool)

(assert (=> b!307807 m!318063))

(check-sat (not b!307804) (not b!307808) (not b!307803) (not b!307809) (not b!307810) (not b!307805) (not start!30664) (not b!307806))
(check-sat)
