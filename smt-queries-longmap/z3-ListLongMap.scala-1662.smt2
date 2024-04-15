; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30792 () Bool)

(assert start!30792)

(declare-fun b!308980 () Bool)

(declare-fun res!165744 () Bool)

(declare-fun e!193056 () Bool)

(assert (=> b!308980 (=> (not res!165744) (not e!193056))))

(declare-datatypes ((array!15749 0))(
  ( (array!15750 (arr!7458 (Array (_ BitVec 32) (_ BitVec 64))) (size!7811 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15749)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15749 (_ BitVec 32)) Bool)

(assert (=> b!308980 (= res!165744 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!308981 () Bool)

(declare-fun res!165743 () Bool)

(declare-fun e!193055 () Bool)

(assert (=> b!308981 (=> (not res!165743) (not e!193055))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!308981 (= res!165743 (and (= (select (arr!7458 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7811 a!3293))))))

(declare-fun b!308983 () Bool)

(declare-fun res!165740 () Bool)

(assert (=> b!308983 (=> (not res!165740) (not e!193056))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2597 0))(
  ( (MissingZero!2597 (index!12564 (_ BitVec 32))) (Found!2597 (index!12565 (_ BitVec 32))) (Intermediate!2597 (undefined!3409 Bool) (index!12566 (_ BitVec 32)) (x!30812 (_ BitVec 32))) (Undefined!2597) (MissingVacant!2597 (index!12567 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15749 (_ BitVec 32)) SeekEntryResult!2597)

(assert (=> b!308983 (= res!165740 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2597 i!1240)))))

(declare-fun b!308984 () Bool)

(declare-fun res!165745 () Bool)

(assert (=> b!308984 (=> (not res!165745) (not e!193056))))

(declare-fun arrayContainsKey!0 (array!15749 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308984 (= res!165745 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!308985 () Bool)

(assert (=> b!308985 (= e!193056 e!193055)))

(declare-fun res!165747 () Bool)

(assert (=> b!308985 (=> (not res!165747) (not e!193055))))

(declare-fun lt!151313 () SeekEntryResult!2597)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15749 (_ BitVec 32)) SeekEntryResult!2597)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308985 (= res!165747 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151313))))

(assert (=> b!308985 (= lt!151313 (Intermediate!2597 false resIndex!52 resX!52))))

(declare-fun b!308986 () Bool)

(declare-fun res!165742 () Bool)

(assert (=> b!308986 (=> (not res!165742) (not e!193056))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308986 (= res!165742 (validKeyInArray!0 k0!2441))))

(declare-fun e!193058 () Bool)

(declare-fun b!308987 () Bool)

(assert (=> b!308987 (= e!193058 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsle x!1427 #b01111111111111111111111111111110))))))

(declare-fun lt!151312 () SeekEntryResult!2597)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308987 (= lt!151312 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!308988 () Bool)

(assert (=> b!308988 (= e!193055 e!193058)))

(declare-fun res!165739 () Bool)

(assert (=> b!308988 (=> (not res!165739) (not e!193058))))

(assert (=> b!308988 (= res!165739 (and (= lt!151312 lt!151313) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7458 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!308988 (= lt!151312 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!308982 () Bool)

(declare-fun res!165746 () Bool)

(assert (=> b!308982 (=> (not res!165746) (not e!193056))))

(assert (=> b!308982 (= res!165746 (and (= (size!7811 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7811 a!3293))))))

(declare-fun res!165741 () Bool)

(assert (=> start!30792 (=> (not res!165741) (not e!193056))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30792 (= res!165741 (validMask!0 mask!3709))))

(assert (=> start!30792 e!193056))

(declare-fun array_inv!5430 (array!15749) Bool)

(assert (=> start!30792 (array_inv!5430 a!3293)))

(assert (=> start!30792 true))

(assert (= (and start!30792 res!165741) b!308982))

(assert (= (and b!308982 res!165746) b!308986))

(assert (= (and b!308986 res!165742) b!308984))

(assert (= (and b!308984 res!165745) b!308983))

(assert (= (and b!308983 res!165740) b!308980))

(assert (= (and b!308980 res!165744) b!308985))

(assert (= (and b!308985 res!165747) b!308981))

(assert (= (and b!308981 res!165743) b!308988))

(assert (= (and b!308988 res!165739) b!308987))

(declare-fun m!318535 () Bool)

(assert (=> b!308987 m!318535))

(assert (=> b!308987 m!318535))

(declare-fun m!318537 () Bool)

(assert (=> b!308987 m!318537))

(declare-fun m!318539 () Bool)

(assert (=> start!30792 m!318539))

(declare-fun m!318541 () Bool)

(assert (=> start!30792 m!318541))

(declare-fun m!318543 () Bool)

(assert (=> b!308980 m!318543))

(declare-fun m!318545 () Bool)

(assert (=> b!308981 m!318545))

(declare-fun m!318547 () Bool)

(assert (=> b!308983 m!318547))

(declare-fun m!318549 () Bool)

(assert (=> b!308984 m!318549))

(declare-fun m!318551 () Bool)

(assert (=> b!308985 m!318551))

(assert (=> b!308985 m!318551))

(declare-fun m!318553 () Bool)

(assert (=> b!308985 m!318553))

(declare-fun m!318555 () Bool)

(assert (=> b!308988 m!318555))

(declare-fun m!318557 () Bool)

(assert (=> b!308988 m!318557))

(declare-fun m!318559 () Bool)

(assert (=> b!308986 m!318559))

(check-sat (not start!30792) (not b!308980) (not b!308985) (not b!308983) (not b!308987) (not b!308984) (not b!308988) (not b!308986))
(check-sat)
