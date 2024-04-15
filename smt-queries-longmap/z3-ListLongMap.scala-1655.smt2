; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30750 () Bool)

(assert start!30750)

(declare-fun b!308413 () Bool)

(declare-fun res!165179 () Bool)

(declare-fun e!192804 () Bool)

(assert (=> b!308413 (=> (not res!165179) (not e!192804))))

(declare-datatypes ((array!15707 0))(
  ( (array!15708 (arr!7437 (Array (_ BitVec 32) (_ BitVec 64))) (size!7790 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15707)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!308413 (= res!165179 (and (= (select (arr!7437 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7790 a!3293))))))

(declare-fun b!308414 () Bool)

(declare-fun e!192806 () Bool)

(assert (=> b!308414 (= e!192806 (not true))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2576 0))(
  ( (MissingZero!2576 (index!12480 (_ BitVec 32))) (Found!2576 (index!12481 (_ BitVec 32))) (Intermediate!2576 (undefined!3388 Bool) (index!12482 (_ BitVec 32)) (x!30735 (_ BitVec 32))) (Undefined!2576) (MissingVacant!2576 (index!12483 (_ BitVec 32))) )
))
(declare-fun lt!151187 () SeekEntryResult!2576)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15707 (_ BitVec 32)) SeekEntryResult!2576)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308414 (= lt!151187 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!308415 () Bool)

(declare-fun res!165177 () Bool)

(declare-fun e!192803 () Bool)

(assert (=> b!308415 (=> (not res!165177) (not e!192803))))

(declare-fun arrayContainsKey!0 (array!15707 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308415 (= res!165177 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!308416 () Bool)

(declare-fun res!165175 () Bool)

(assert (=> b!308416 (=> (not res!165175) (not e!192803))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15707 (_ BitVec 32)) Bool)

(assert (=> b!308416 (= res!165175 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!308417 () Bool)

(assert (=> b!308417 (= e!192803 e!192804)))

(declare-fun res!165178 () Bool)

(assert (=> b!308417 (=> (not res!165178) (not e!192804))))

(declare-fun lt!151186 () SeekEntryResult!2576)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308417 (= res!165178 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151186))))

(assert (=> b!308417 (= lt!151186 (Intermediate!2576 false resIndex!52 resX!52))))

(declare-fun b!308418 () Bool)

(declare-fun res!165173 () Bool)

(assert (=> b!308418 (=> (not res!165173) (not e!192803))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15707 (_ BitVec 32)) SeekEntryResult!2576)

(assert (=> b!308418 (= res!165173 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2576 i!1240)))))

(declare-fun b!308419 () Bool)

(declare-fun res!165172 () Bool)

(assert (=> b!308419 (=> (not res!165172) (not e!192803))))

(assert (=> b!308419 (= res!165172 (and (= (size!7790 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7790 a!3293))))))

(declare-fun res!165174 () Bool)

(assert (=> start!30750 (=> (not res!165174) (not e!192803))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30750 (= res!165174 (validMask!0 mask!3709))))

(assert (=> start!30750 e!192803))

(declare-fun array_inv!5409 (array!15707) Bool)

(assert (=> start!30750 (array_inv!5409 a!3293)))

(assert (=> start!30750 true))

(declare-fun b!308420 () Bool)

(assert (=> b!308420 (= e!192804 e!192806)))

(declare-fun res!165176 () Bool)

(assert (=> b!308420 (=> (not res!165176) (not e!192806))))

(assert (=> b!308420 (= res!165176 (and (= lt!151187 lt!151186) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7437 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!308420 (= lt!151187 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!308421 () Bool)

(declare-fun res!165180 () Bool)

(assert (=> b!308421 (=> (not res!165180) (not e!192803))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308421 (= res!165180 (validKeyInArray!0 k0!2441))))

(assert (= (and start!30750 res!165174) b!308419))

(assert (= (and b!308419 res!165172) b!308421))

(assert (= (and b!308421 res!165180) b!308415))

(assert (= (and b!308415 res!165177) b!308418))

(assert (= (and b!308418 res!165173) b!308416))

(assert (= (and b!308416 res!165175) b!308417))

(assert (= (and b!308417 res!165178) b!308413))

(assert (= (and b!308413 res!165179) b!308420))

(assert (= (and b!308420 res!165176) b!308414))

(declare-fun m!317989 () Bool)

(assert (=> b!308413 m!317989))

(declare-fun m!317991 () Bool)

(assert (=> start!30750 m!317991))

(declare-fun m!317993 () Bool)

(assert (=> start!30750 m!317993))

(declare-fun m!317995 () Bool)

(assert (=> b!308415 m!317995))

(declare-fun m!317997 () Bool)

(assert (=> b!308421 m!317997))

(declare-fun m!317999 () Bool)

(assert (=> b!308418 m!317999))

(declare-fun m!318001 () Bool)

(assert (=> b!308420 m!318001))

(declare-fun m!318003 () Bool)

(assert (=> b!308420 m!318003))

(declare-fun m!318005 () Bool)

(assert (=> b!308416 m!318005))

(declare-fun m!318007 () Bool)

(assert (=> b!308417 m!318007))

(assert (=> b!308417 m!318007))

(declare-fun m!318009 () Bool)

(assert (=> b!308417 m!318009))

(declare-fun m!318011 () Bool)

(assert (=> b!308414 m!318011))

(assert (=> b!308414 m!318011))

(declare-fun m!318013 () Bool)

(assert (=> b!308414 m!318013))

(check-sat (not start!30750) (not b!308417) (not b!308416) (not b!308415) (not b!308420) (not b!308421) (not b!308418) (not b!308414))
(check-sat)
