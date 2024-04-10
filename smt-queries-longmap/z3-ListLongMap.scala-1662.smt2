; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30808 () Bool)

(assert start!30808)

(declare-fun b!309282 () Bool)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun e!193246 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!309282 (= e!193246 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsle x!1427 #b01111111111111111111111111111110))))))

(declare-datatypes ((array!15761 0))(
  ( (array!15762 (arr!7464 (Array (_ BitVec 32) (_ BitVec 64))) (size!7816 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15761)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2604 0))(
  ( (MissingZero!2604 (index!12592 (_ BitVec 32))) (Found!2604 (index!12593 (_ BitVec 32))) (Intermediate!2604 (undefined!3416 Bool) (index!12594 (_ BitVec 32)) (x!30824 (_ BitVec 32))) (Undefined!2604) (MissingVacant!2604 (index!12595 (_ BitVec 32))) )
))
(declare-fun lt!151553 () SeekEntryResult!2604)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15761 (_ BitVec 32)) SeekEntryResult!2604)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309282 (= lt!151553 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!309283 () Bool)

(declare-fun res!165903 () Bool)

(declare-fun e!193244 () Bool)

(assert (=> b!309283 (=> (not res!165903) (not e!193244))))

(declare-fun arrayContainsKey!0 (array!15761 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!309283 (= res!165903 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!309284 () Bool)

(declare-fun res!165902 () Bool)

(declare-fun e!193243 () Bool)

(assert (=> b!309284 (=> (not res!165902) (not e!193243))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!309284 (= res!165902 (and (= (select (arr!7464 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7816 a!3293))))))

(declare-fun b!309285 () Bool)

(assert (=> b!309285 (= e!193243 e!193246)))

(declare-fun res!165896 () Bool)

(assert (=> b!309285 (=> (not res!165896) (not e!193246))))

(declare-fun lt!151554 () SeekEntryResult!2604)

(assert (=> b!309285 (= res!165896 (and (= lt!151553 lt!151554) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7464 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!309285 (= lt!151553 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun res!165900 () Bool)

(assert (=> start!30808 (=> (not res!165900) (not e!193244))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30808 (= res!165900 (validMask!0 mask!3709))))

(assert (=> start!30808 e!193244))

(declare-fun array_inv!5427 (array!15761) Bool)

(assert (=> start!30808 (array_inv!5427 a!3293)))

(assert (=> start!30808 true))

(declare-fun b!309286 () Bool)

(declare-fun res!165898 () Bool)

(assert (=> b!309286 (=> (not res!165898) (not e!193244))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15761 (_ BitVec 32)) Bool)

(assert (=> b!309286 (= res!165898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!309287 () Bool)

(declare-fun res!165895 () Bool)

(assert (=> b!309287 (=> (not res!165895) (not e!193244))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15761 (_ BitVec 32)) SeekEntryResult!2604)

(assert (=> b!309287 (= res!165895 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2604 i!1240)))))

(declare-fun b!309288 () Bool)

(declare-fun res!165897 () Bool)

(assert (=> b!309288 (=> (not res!165897) (not e!193244))))

(assert (=> b!309288 (= res!165897 (and (= (size!7816 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7816 a!3293))))))

(declare-fun b!309289 () Bool)

(declare-fun res!165901 () Bool)

(assert (=> b!309289 (=> (not res!165901) (not e!193244))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!309289 (= res!165901 (validKeyInArray!0 k0!2441))))

(declare-fun b!309290 () Bool)

(assert (=> b!309290 (= e!193244 e!193243)))

(declare-fun res!165899 () Bool)

(assert (=> b!309290 (=> (not res!165899) (not e!193243))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309290 (= res!165899 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151554))))

(assert (=> b!309290 (= lt!151554 (Intermediate!2604 false resIndex!52 resX!52))))

(assert (= (and start!30808 res!165900) b!309288))

(assert (= (and b!309288 res!165897) b!309289))

(assert (= (and b!309289 res!165901) b!309283))

(assert (= (and b!309283 res!165903) b!309287))

(assert (= (and b!309287 res!165895) b!309286))

(assert (= (and b!309286 res!165898) b!309290))

(assert (= (and b!309290 res!165899) b!309284))

(assert (= (and b!309284 res!165902) b!309285))

(assert (= (and b!309285 res!165896) b!309282))

(declare-fun m!319291 () Bool)

(assert (=> b!309284 m!319291))

(declare-fun m!319293 () Bool)

(assert (=> b!309286 m!319293))

(declare-fun m!319295 () Bool)

(assert (=> b!309282 m!319295))

(assert (=> b!309282 m!319295))

(declare-fun m!319297 () Bool)

(assert (=> b!309282 m!319297))

(declare-fun m!319299 () Bool)

(assert (=> b!309290 m!319299))

(assert (=> b!309290 m!319299))

(declare-fun m!319301 () Bool)

(assert (=> b!309290 m!319301))

(declare-fun m!319303 () Bool)

(assert (=> start!30808 m!319303))

(declare-fun m!319305 () Bool)

(assert (=> start!30808 m!319305))

(declare-fun m!319307 () Bool)

(assert (=> b!309287 m!319307))

(declare-fun m!319309 () Bool)

(assert (=> b!309289 m!319309))

(declare-fun m!319311 () Bool)

(assert (=> b!309285 m!319311))

(declare-fun m!319313 () Bool)

(assert (=> b!309285 m!319313))

(declare-fun m!319315 () Bool)

(assert (=> b!309283 m!319315))

(check-sat (not b!309287) (not b!309286) (not b!309289) (not b!309285) (not b!309290) (not start!30808) (not b!309283) (not b!309282))
(check-sat)
