; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30768 () Bool)

(assert start!30768)

(declare-fun b!308656 () Bool)

(declare-fun res!165416 () Bool)

(declare-fun e!192914 () Bool)

(assert (=> b!308656 (=> (not res!165416) (not e!192914))))

(declare-datatypes ((array!15725 0))(
  ( (array!15726 (arr!7446 (Array (_ BitVec 32) (_ BitVec 64))) (size!7799 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15725)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15725 (_ BitVec 32)) Bool)

(assert (=> b!308656 (= res!165416 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!308657 () Bool)

(declare-fun e!192911 () Bool)

(declare-fun e!192913 () Bool)

(assert (=> b!308657 (= e!192911 e!192913)))

(declare-fun res!165423 () Bool)

(assert (=> b!308657 (=> (not res!165423) (not e!192913))))

(declare-datatypes ((SeekEntryResult!2585 0))(
  ( (MissingZero!2585 (index!12516 (_ BitVec 32))) (Found!2585 (index!12517 (_ BitVec 32))) (Intermediate!2585 (undefined!3397 Bool) (index!12518 (_ BitVec 32)) (x!30768 (_ BitVec 32))) (Undefined!2585) (MissingVacant!2585 (index!12519 (_ BitVec 32))) )
))
(declare-fun lt!151241 () SeekEntryResult!2585)

(declare-fun lt!151240 () SeekEntryResult!2585)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!308657 (= res!165423 (and (= lt!151241 lt!151240) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7446 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15725 (_ BitVec 32)) SeekEntryResult!2585)

(assert (=> b!308657 (= lt!151241 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!308658 () Bool)

(declare-fun res!165421 () Bool)

(assert (=> b!308658 (=> (not res!165421) (not e!192914))))

(declare-fun arrayContainsKey!0 (array!15725 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308658 (= res!165421 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!308659 () Bool)

(declare-fun res!165417 () Bool)

(assert (=> b!308659 (=> (not res!165417) (not e!192914))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308659 (= res!165417 (validKeyInArray!0 k0!2441))))

(declare-fun b!308660 () Bool)

(declare-fun res!165422 () Bool)

(assert (=> b!308660 (=> (not res!165422) (not e!192911))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!308660 (= res!165422 (and (= (select (arr!7446 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7799 a!3293))))))

(declare-fun b!308661 () Bool)

(assert (=> b!308661 (= e!192914 e!192911)))

(declare-fun res!165420 () Bool)

(assert (=> b!308661 (=> (not res!165420) (not e!192911))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308661 (= res!165420 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151240))))

(assert (=> b!308661 (= lt!151240 (Intermediate!2585 false resIndex!52 resX!52))))

(declare-fun res!165415 () Bool)

(assert (=> start!30768 (=> (not res!165415) (not e!192914))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30768 (= res!165415 (validMask!0 mask!3709))))

(assert (=> start!30768 e!192914))

(declare-fun array_inv!5418 (array!15725) Bool)

(assert (=> start!30768 (array_inv!5418 a!3293)))

(assert (=> start!30768 true))

(declare-fun b!308662 () Bool)

(declare-fun res!165419 () Bool)

(assert (=> b!308662 (=> (not res!165419) (not e!192914))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15725 (_ BitVec 32)) SeekEntryResult!2585)

(assert (=> b!308662 (= res!165419 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2585 i!1240)))))

(declare-fun b!308663 () Bool)

(declare-fun res!165418 () Bool)

(assert (=> b!308663 (=> (not res!165418) (not e!192914))))

(assert (=> b!308663 (= res!165418 (and (= (size!7799 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7799 a!3293))))))

(declare-fun b!308664 () Bool)

(assert (=> b!308664 (= e!192913 (not true))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308664 (= lt!151241 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (= (and start!30768 res!165415) b!308663))

(assert (= (and b!308663 res!165418) b!308659))

(assert (= (and b!308659 res!165417) b!308658))

(assert (= (and b!308658 res!165421) b!308662))

(assert (= (and b!308662 res!165419) b!308656))

(assert (= (and b!308656 res!165416) b!308661))

(assert (= (and b!308661 res!165420) b!308660))

(assert (= (and b!308660 res!165422) b!308657))

(assert (= (and b!308657 res!165423) b!308664))

(declare-fun m!318223 () Bool)

(assert (=> b!308657 m!318223))

(declare-fun m!318225 () Bool)

(assert (=> b!308657 m!318225))

(declare-fun m!318227 () Bool)

(assert (=> b!308662 m!318227))

(declare-fun m!318229 () Bool)

(assert (=> b!308660 m!318229))

(declare-fun m!318231 () Bool)

(assert (=> b!308659 m!318231))

(declare-fun m!318233 () Bool)

(assert (=> b!308658 m!318233))

(declare-fun m!318235 () Bool)

(assert (=> b!308664 m!318235))

(assert (=> b!308664 m!318235))

(declare-fun m!318237 () Bool)

(assert (=> b!308664 m!318237))

(declare-fun m!318239 () Bool)

(assert (=> b!308661 m!318239))

(assert (=> b!308661 m!318239))

(declare-fun m!318241 () Bool)

(assert (=> b!308661 m!318241))

(declare-fun m!318243 () Bool)

(assert (=> b!308656 m!318243))

(declare-fun m!318245 () Bool)

(assert (=> start!30768 m!318245))

(declare-fun m!318247 () Bool)

(assert (=> start!30768 m!318247))

(check-sat (not b!308657) (not b!308661) (not start!30768) (not b!308658) (not b!308664) (not b!308656) (not b!308659) (not b!308662))
(check-sat)
