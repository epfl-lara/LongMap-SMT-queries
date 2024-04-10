; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30646 () Bool)

(assert start!30646)

(declare-fun b!307554 () Bool)

(declare-fun e!192539 () Bool)

(declare-fun e!192541 () Bool)

(assert (=> b!307554 (= e!192539 e!192541)))

(declare-fun res!164311 () Bool)

(assert (=> b!307554 (=> (not res!164311) (not e!192541))))

(declare-datatypes ((array!15650 0))(
  ( (array!15651 (arr!7410 (Array (_ BitVec 32) (_ BitVec 64))) (size!7762 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15650)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2550 0))(
  ( (MissingZero!2550 (index!12376 (_ BitVec 32))) (Found!2550 (index!12377 (_ BitVec 32))) (Intermediate!2550 (undefined!3362 Bool) (index!12378 (_ BitVec 32)) (x!30617 (_ BitVec 32))) (Undefined!2550) (MissingVacant!2550 (index!12379 (_ BitVec 32))) )
))
(declare-fun lt!151146 () SeekEntryResult!2550)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15650 (_ BitVec 32)) SeekEntryResult!2550)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307554 (= res!164311 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151146))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!307554 (= lt!151146 (Intermediate!2550 false resIndex!52 resX!52))))

(declare-fun b!307555 () Bool)

(declare-fun res!164315 () Bool)

(assert (=> b!307555 (=> (not res!164315) (not e!192539))))

(declare-fun arrayContainsKey!0 (array!15650 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307555 (= res!164315 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!307556 () Bool)

(declare-fun res!164316 () Bool)

(assert (=> b!307556 (=> (not res!164316) (not e!192539))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307556 (= res!164316 (validKeyInArray!0 k0!2441))))

(declare-fun b!307557 () Bool)

(declare-fun res!164314 () Bool)

(assert (=> b!307557 (=> (not res!164314) (not e!192539))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15650 (_ BitVec 32)) Bool)

(assert (=> b!307557 (= res!164314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307558 () Bool)

(declare-fun res!164313 () Bool)

(assert (=> b!307558 (=> (not res!164313) (not e!192541))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!307558 (= res!164313 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!151146))))

(declare-fun b!307559 () Bool)

(declare-fun res!164310 () Bool)

(assert (=> b!307559 (=> (not res!164310) (not e!192539))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!307559 (= res!164310 (and (= (size!7762 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7762 a!3293))))))

(declare-fun b!307560 () Bool)

(declare-fun res!164312 () Bool)

(assert (=> b!307560 (=> (not res!164312) (not e!192539))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15650 (_ BitVec 32)) SeekEntryResult!2550)

(assert (=> b!307560 (= res!164312 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2550 i!1240)))))

(declare-fun b!307561 () Bool)

(assert (=> b!307561 (= e!192541 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7410 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52)) (bvslt mask!3709 #b00000000000000000000000000000000)))))

(declare-fun res!164308 () Bool)

(assert (=> start!30646 (=> (not res!164308) (not e!192539))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30646 (= res!164308 (validMask!0 mask!3709))))

(assert (=> start!30646 e!192539))

(declare-fun array_inv!5373 (array!15650) Bool)

(assert (=> start!30646 (array_inv!5373 a!3293)))

(assert (=> start!30646 true))

(declare-fun b!307562 () Bool)

(declare-fun res!164309 () Bool)

(assert (=> b!307562 (=> (not res!164309) (not e!192541))))

(assert (=> b!307562 (= res!164309 (and (= (select (arr!7410 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7762 a!3293))))))

(assert (= (and start!30646 res!164308) b!307559))

(assert (= (and b!307559 res!164310) b!307556))

(assert (= (and b!307556 res!164316) b!307555))

(assert (= (and b!307555 res!164315) b!307560))

(assert (= (and b!307560 res!164312) b!307557))

(assert (= (and b!307557 res!164314) b!307554))

(assert (= (and b!307554 res!164311) b!307562))

(assert (= (and b!307562 res!164309) b!307558))

(assert (= (and b!307558 res!164313) b!307561))

(declare-fun m!317841 () Bool)

(assert (=> b!307558 m!317841))

(declare-fun m!317843 () Bool)

(assert (=> start!30646 m!317843))

(declare-fun m!317845 () Bool)

(assert (=> start!30646 m!317845))

(declare-fun m!317847 () Bool)

(assert (=> b!307557 m!317847))

(declare-fun m!317849 () Bool)

(assert (=> b!307561 m!317849))

(declare-fun m!317851 () Bool)

(assert (=> b!307556 m!317851))

(declare-fun m!317853 () Bool)

(assert (=> b!307562 m!317853))

(declare-fun m!317855 () Bool)

(assert (=> b!307554 m!317855))

(assert (=> b!307554 m!317855))

(declare-fun m!317857 () Bool)

(assert (=> b!307554 m!317857))

(declare-fun m!317859 () Bool)

(assert (=> b!307560 m!317859))

(declare-fun m!317861 () Bool)

(assert (=> b!307555 m!317861))

(check-sat (not b!307560) (not b!307556) (not b!307554) (not b!307557) (not b!307555) (not b!307558) (not start!30646))
(check-sat)
