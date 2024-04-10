; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30454 () Bool)

(assert start!30454)

(declare-fun b!304944 () Bool)

(declare-fun res!162297 () Bool)

(declare-fun e!191563 () Bool)

(assert (=> b!304944 (=> (not res!162297) (not e!191563))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304944 (= res!162297 (validKeyInArray!0 k0!2441))))

(declare-fun res!162294 () Bool)

(assert (=> start!30454 (=> (not res!162294) (not e!191563))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30454 (= res!162294 (validMask!0 mask!3709))))

(assert (=> start!30454 e!191563))

(declare-datatypes ((array!15509 0))(
  ( (array!15510 (arr!7341 (Array (_ BitVec 32) (_ BitVec 64))) (size!7693 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15509)

(declare-fun array_inv!5304 (array!15509) Bool)

(assert (=> start!30454 (array_inv!5304 a!3293)))

(assert (=> start!30454 true))

(declare-fun b!304945 () Bool)

(declare-fun e!191562 () Bool)

(assert (=> b!304945 (= e!191563 e!191562)))

(declare-fun res!162292 () Bool)

(assert (=> b!304945 (=> (not res!162292) (not e!191562))))

(declare-datatypes ((SeekEntryResult!2481 0))(
  ( (MissingZero!2481 (index!12100 (_ BitVec 32))) (Found!2481 (index!12101 (_ BitVec 32))) (Intermediate!2481 (undefined!3293 Bool) (index!12102 (_ BitVec 32)) (x!30355 (_ BitVec 32))) (Undefined!2481) (MissingVacant!2481 (index!12103 (_ BitVec 32))) )
))
(declare-fun lt!150564 () SeekEntryResult!2481)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15509 (_ BitVec 32)) SeekEntryResult!2481)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304945 (= res!162292 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150564))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!304945 (= lt!150564 (Intermediate!2481 false resIndex!52 resX!52))))

(declare-fun b!304946 () Bool)

(declare-fun res!162296 () Bool)

(assert (=> b!304946 (=> (not res!162296) (not e!191562))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!304946 (= res!162296 (and (= (select (arr!7341 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7693 a!3293))))))

(declare-fun b!304947 () Bool)

(declare-fun res!162289 () Bool)

(assert (=> b!304947 (=> (not res!162289) (not e!191563))))

(declare-fun arrayContainsKey!0 (array!15509 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304947 (= res!162289 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!304948 () Bool)

(declare-fun res!162295 () Bool)

(assert (=> b!304948 (=> (not res!162295) (not e!191563))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15509 (_ BitVec 32)) Bool)

(assert (=> b!304948 (= res!162295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!304949 () Bool)

(declare-fun res!162291 () Bool)

(assert (=> b!304949 (=> (not res!162291) (not e!191563))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15509 (_ BitVec 32)) SeekEntryResult!2481)

(assert (=> b!304949 (= res!162291 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2481 i!1240)))))

(declare-fun b!304950 () Bool)

(declare-fun e!191560 () Bool)

(assert (=> b!304950 (= e!191562 e!191560)))

(declare-fun res!162293 () Bool)

(assert (=> b!304950 (=> (not res!162293) (not e!191560))))

(declare-fun lt!150563 () SeekEntryResult!2481)

(assert (=> b!304950 (= res!162293 (and (= lt!150563 lt!150564) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7341 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7341 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7341 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!304950 (= lt!150563 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!304951 () Bool)

(assert (=> b!304951 (= e!191560 (not true))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304951 (= lt!150563 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!304952 () Bool)

(declare-fun res!162290 () Bool)

(assert (=> b!304952 (=> (not res!162290) (not e!191563))))

(assert (=> b!304952 (= res!162290 (and (= (size!7693 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7693 a!3293))))))

(assert (= (and start!30454 res!162294) b!304952))

(assert (= (and b!304952 res!162290) b!304944))

(assert (= (and b!304944 res!162297) b!304947))

(assert (= (and b!304947 res!162289) b!304949))

(assert (= (and b!304949 res!162291) b!304948))

(assert (= (and b!304948 res!162295) b!304945))

(assert (= (and b!304945 res!162292) b!304946))

(assert (= (and b!304946 res!162296) b!304950))

(assert (= (and b!304950 res!162293) b!304951))

(declare-fun m!316021 () Bool)

(assert (=> start!30454 m!316021))

(declare-fun m!316023 () Bool)

(assert (=> start!30454 m!316023))

(declare-fun m!316025 () Bool)

(assert (=> b!304947 m!316025))

(declare-fun m!316027 () Bool)

(assert (=> b!304944 m!316027))

(declare-fun m!316029 () Bool)

(assert (=> b!304949 m!316029))

(declare-fun m!316031 () Bool)

(assert (=> b!304950 m!316031))

(declare-fun m!316033 () Bool)

(assert (=> b!304950 m!316033))

(declare-fun m!316035 () Bool)

(assert (=> b!304948 m!316035))

(declare-fun m!316037 () Bool)

(assert (=> b!304951 m!316037))

(assert (=> b!304951 m!316037))

(declare-fun m!316039 () Bool)

(assert (=> b!304951 m!316039))

(declare-fun m!316041 () Bool)

(assert (=> b!304946 m!316041))

(declare-fun m!316043 () Bool)

(assert (=> b!304945 m!316043))

(assert (=> b!304945 m!316043))

(declare-fun m!316045 () Bool)

(assert (=> b!304945 m!316045))

(check-sat (not b!304945) (not b!304950) (not b!304947) (not b!304951) (not b!304948) (not b!304944) (not start!30454) (not b!304949))
(check-sat)
