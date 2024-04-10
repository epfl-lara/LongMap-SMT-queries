; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30610 () Bool)

(assert start!30610)

(declare-fun b!307095 () Bool)

(declare-fun res!163851 () Bool)

(declare-fun e!192406 () Bool)

(assert (=> b!307095 (=> (not res!163851) (not e!192406))))

(declare-datatypes ((array!15614 0))(
  ( (array!15615 (arr!7392 (Array (_ BitVec 32) (_ BitVec 64))) (size!7744 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15614)

(declare-datatypes ((SeekEntryResult!2532 0))(
  ( (MissingZero!2532 (index!12304 (_ BitVec 32))) (Found!2532 (index!12305 (_ BitVec 32))) (Intermediate!2532 (undefined!3344 Bool) (index!12306 (_ BitVec 32)) (x!30551 (_ BitVec 32))) (Undefined!2532) (MissingVacant!2532 (index!12307 (_ BitVec 32))) )
))
(declare-fun lt!151092 () SeekEntryResult!2532)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15614 (_ BitVec 32)) SeekEntryResult!2532)

(assert (=> b!307095 (= res!163851 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!151092))))

(declare-fun b!307096 () Bool)

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!307096 (= e!192406 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7392 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52)) (bvslt mask!3709 #b00000000000000000000000000000000)))))

(declare-fun b!307097 () Bool)

(declare-fun res!163855 () Bool)

(declare-fun e!192404 () Bool)

(assert (=> b!307097 (=> (not res!163855) (not e!192404))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15614 (_ BitVec 32)) Bool)

(assert (=> b!307097 (= res!163855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307098 () Bool)

(declare-fun res!163853 () Bool)

(assert (=> b!307098 (=> (not res!163853) (not e!192404))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15614 (_ BitVec 32)) SeekEntryResult!2532)

(assert (=> b!307098 (= res!163853 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2532 i!1240)))))

(declare-fun b!307100 () Bool)

(declare-fun res!163852 () Bool)

(assert (=> b!307100 (=> (not res!163852) (not e!192406))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!307100 (= res!163852 (and (= (select (arr!7392 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7744 a!3293))))))

(declare-fun b!307101 () Bool)

(declare-fun res!163856 () Bool)

(assert (=> b!307101 (=> (not res!163856) (not e!192404))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307101 (= res!163856 (validKeyInArray!0 k0!2441))))

(declare-fun b!307099 () Bool)

(assert (=> b!307099 (= e!192404 e!192406)))

(declare-fun res!163850 () Bool)

(assert (=> b!307099 (=> (not res!163850) (not e!192406))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307099 (= res!163850 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151092))))

(assert (=> b!307099 (= lt!151092 (Intermediate!2532 false resIndex!52 resX!52))))

(declare-fun res!163849 () Bool)

(assert (=> start!30610 (=> (not res!163849) (not e!192404))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30610 (= res!163849 (validMask!0 mask!3709))))

(assert (=> start!30610 e!192404))

(declare-fun array_inv!5355 (array!15614) Bool)

(assert (=> start!30610 (array_inv!5355 a!3293)))

(assert (=> start!30610 true))

(declare-fun b!307102 () Bool)

(declare-fun res!163857 () Bool)

(assert (=> b!307102 (=> (not res!163857) (not e!192404))))

(assert (=> b!307102 (= res!163857 (and (= (size!7744 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7744 a!3293))))))

(declare-fun b!307103 () Bool)

(declare-fun res!163854 () Bool)

(assert (=> b!307103 (=> (not res!163854) (not e!192404))))

(declare-fun arrayContainsKey!0 (array!15614 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307103 (= res!163854 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30610 res!163849) b!307102))

(assert (= (and b!307102 res!163857) b!307101))

(assert (= (and b!307101 res!163856) b!307103))

(assert (= (and b!307103 res!163854) b!307098))

(assert (= (and b!307098 res!163853) b!307097))

(assert (= (and b!307097 res!163855) b!307099))

(assert (= (and b!307099 res!163850) b!307100))

(assert (= (and b!307100 res!163852) b!307095))

(assert (= (and b!307095 res!163851) b!307096))

(declare-fun m!317463 () Bool)

(assert (=> start!30610 m!317463))

(declare-fun m!317465 () Bool)

(assert (=> start!30610 m!317465))

(declare-fun m!317467 () Bool)

(assert (=> b!307095 m!317467))

(declare-fun m!317469 () Bool)

(assert (=> b!307101 m!317469))

(declare-fun m!317471 () Bool)

(assert (=> b!307098 m!317471))

(declare-fun m!317473 () Bool)

(assert (=> b!307097 m!317473))

(declare-fun m!317475 () Bool)

(assert (=> b!307099 m!317475))

(assert (=> b!307099 m!317475))

(declare-fun m!317477 () Bool)

(assert (=> b!307099 m!317477))

(declare-fun m!317479 () Bool)

(assert (=> b!307103 m!317479))

(declare-fun m!317481 () Bool)

(assert (=> b!307100 m!317481))

(declare-fun m!317483 () Bool)

(assert (=> b!307096 m!317483))

(check-sat (not b!307097) (not start!30610) (not b!307099) (not b!307095) (not b!307098) (not b!307103) (not b!307101))
(check-sat)
