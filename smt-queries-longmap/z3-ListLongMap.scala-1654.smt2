; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30744 () Bool)

(assert start!30744)

(declare-fun b!308333 () Bool)

(declare-fun e!192768 () Bool)

(declare-fun e!192770 () Bool)

(assert (=> b!308333 (= e!192768 e!192770)))

(declare-fun res!165091 () Bool)

(assert (=> b!308333 (=> (not res!165091) (not e!192770))))

(declare-datatypes ((SeekEntryResult!2573 0))(
  ( (MissingZero!2573 (index!12468 (_ BitVec 32))) (Found!2573 (index!12469 (_ BitVec 32))) (Intermediate!2573 (undefined!3385 Bool) (index!12470 (_ BitVec 32)) (x!30724 (_ BitVec 32))) (Undefined!2573) (MissingVacant!2573 (index!12471 (_ BitVec 32))) )
))
(declare-fun lt!151169 () SeekEntryResult!2573)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((array!15701 0))(
  ( (array!15702 (arr!7434 (Array (_ BitVec 32) (_ BitVec 64))) (size!7787 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15701)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15701 (_ BitVec 32)) SeekEntryResult!2573)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308333 (= res!165091 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151169))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!308333 (= lt!151169 (Intermediate!2573 false resIndex!52 resX!52))))

(declare-fun b!308334 () Bool)

(declare-fun res!165099 () Bool)

(assert (=> b!308334 (=> (not res!165099) (not e!192768))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15701 (_ BitVec 32)) SeekEntryResult!2573)

(assert (=> b!308334 (= res!165099 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2573 i!1240)))))

(declare-fun b!308335 () Bool)

(declare-fun res!165093 () Bool)

(assert (=> b!308335 (=> (not res!165093) (not e!192768))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15701 (_ BitVec 32)) Bool)

(assert (=> b!308335 (= res!165093 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!308336 () Bool)

(declare-fun res!165094 () Bool)

(assert (=> b!308336 (=> (not res!165094) (not e!192768))))

(assert (=> b!308336 (= res!165094 (and (= (size!7787 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7787 a!3293))))))

(declare-fun b!308337 () Bool)

(declare-fun res!165092 () Bool)

(assert (=> b!308337 (=> (not res!165092) (not e!192768))))

(declare-fun arrayContainsKey!0 (array!15701 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308337 (= res!165092 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!308338 () Bool)

(declare-fun e!192767 () Bool)

(assert (=> b!308338 (= e!192770 e!192767)))

(declare-fun res!165098 () Bool)

(assert (=> b!308338 (=> (not res!165098) (not e!192767))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!151168 () SeekEntryResult!2573)

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!308338 (= res!165098 (and (= lt!151168 lt!151169) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7434 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!308338 (= lt!151168 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!308332 () Bool)

(declare-fun res!165095 () Bool)

(assert (=> b!308332 (=> (not res!165095) (not e!192770))))

(assert (=> b!308332 (= res!165095 (and (= (select (arr!7434 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7787 a!3293))))))

(declare-fun res!165096 () Bool)

(assert (=> start!30744 (=> (not res!165096) (not e!192768))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30744 (= res!165096 (validMask!0 mask!3709))))

(assert (=> start!30744 e!192768))

(declare-fun array_inv!5406 (array!15701) Bool)

(assert (=> start!30744 (array_inv!5406 a!3293)))

(assert (=> start!30744 true))

(declare-fun b!308339 () Bool)

(declare-fun res!165097 () Bool)

(assert (=> b!308339 (=> (not res!165097) (not e!192768))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308339 (= res!165097 (validKeyInArray!0 k0!2441))))

(declare-fun b!308340 () Bool)

(assert (=> b!308340 (= e!192767 (not (bvsge mask!3709 #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308340 (= lt!151168 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (= (and start!30744 res!165096) b!308336))

(assert (= (and b!308336 res!165094) b!308339))

(assert (= (and b!308339 res!165097) b!308337))

(assert (= (and b!308337 res!165092) b!308334))

(assert (= (and b!308334 res!165099) b!308335))

(assert (= (and b!308335 res!165093) b!308333))

(assert (= (and b!308333 res!165091) b!308332))

(assert (= (and b!308332 res!165095) b!308338))

(assert (= (and b!308338 res!165098) b!308340))

(declare-fun m!317911 () Bool)

(assert (=> b!308339 m!317911))

(declare-fun m!317913 () Bool)

(assert (=> b!308338 m!317913))

(declare-fun m!317915 () Bool)

(assert (=> b!308338 m!317915))

(declare-fun m!317917 () Bool)

(assert (=> b!308333 m!317917))

(assert (=> b!308333 m!317917))

(declare-fun m!317919 () Bool)

(assert (=> b!308333 m!317919))

(declare-fun m!317921 () Bool)

(assert (=> b!308340 m!317921))

(assert (=> b!308340 m!317921))

(declare-fun m!317923 () Bool)

(assert (=> b!308340 m!317923))

(declare-fun m!317925 () Bool)

(assert (=> b!308337 m!317925))

(declare-fun m!317927 () Bool)

(assert (=> start!30744 m!317927))

(declare-fun m!317929 () Bool)

(assert (=> start!30744 m!317929))

(declare-fun m!317931 () Bool)

(assert (=> b!308335 m!317931))

(declare-fun m!317933 () Bool)

(assert (=> b!308334 m!317933))

(declare-fun m!317935 () Bool)

(assert (=> b!308332 m!317935))

(check-sat (not b!308334) (not b!308338) (not b!308335) (not start!30744) (not b!308337) (not b!308339) (not b!308340) (not b!308333))
(check-sat)
