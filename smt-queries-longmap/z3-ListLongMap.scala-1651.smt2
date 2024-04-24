; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30726 () Bool)

(assert start!30726)

(declare-fun b!308295 () Bool)

(declare-fun res!164958 () Bool)

(declare-fun e!192818 () Bool)

(assert (=> b!308295 (=> (not res!164958) (not e!192818))))

(declare-datatypes ((array!15692 0))(
  ( (array!15693 (arr!7429 (Array (_ BitVec 32) (_ BitVec 64))) (size!7781 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15692)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!308295 (= res!164958 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7429 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun b!308296 () Bool)

(declare-fun res!164960 () Bool)

(assert (=> b!308296 (=> (not res!164960) (not e!192818))))

(declare-datatypes ((SeekEntryResult!2534 0))(
  ( (MissingZero!2534 (index!12312 (_ BitVec 32))) (Found!2534 (index!12313 (_ BitVec 32))) (Intermediate!2534 (undefined!3346 Bool) (index!12314 (_ BitVec 32)) (x!30663 (_ BitVec 32))) (Undefined!2534) (MissingVacant!2534 (index!12315 (_ BitVec 32))) )
))
(declare-fun lt!151367 () SeekEntryResult!2534)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15692 (_ BitVec 32)) SeekEntryResult!2534)

(assert (=> b!308296 (= res!164960 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!151367))))

(declare-fun b!308297 () Bool)

(declare-fun res!164967 () Bool)

(declare-fun e!192819 () Bool)

(assert (=> b!308297 (=> (not res!164967) (not e!192819))))

(declare-fun arrayContainsKey!0 (array!15692 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308297 (= res!164967 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!308298 () Bool)

(assert (=> b!308298 (= e!192819 e!192818)))

(declare-fun res!164961 () Bool)

(assert (=> b!308298 (=> (not res!164961) (not e!192818))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308298 (= res!164961 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151367))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!308298 (= lt!151367 (Intermediate!2534 false resIndex!52 resX!52))))

(declare-fun res!164965 () Bool)

(assert (=> start!30726 (=> (not res!164965) (not e!192819))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30726 (= res!164965 (validMask!0 mask!3709))))

(assert (=> start!30726 e!192819))

(declare-fun array_inv!5379 (array!15692) Bool)

(assert (=> start!30726 (array_inv!5379 a!3293)))

(assert (=> start!30726 true))

(declare-fun b!308299 () Bool)

(declare-fun res!164963 () Bool)

(assert (=> b!308299 (=> (not res!164963) (not e!192818))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!308299 (= res!164963 (and (= (select (arr!7429 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7781 a!3293))))))

(declare-fun b!308300 () Bool)

(declare-fun lt!151368 () (_ BitVec 32))

(assert (=> b!308300 (= e!192818 (and (bvsge mask!3709 #b00000000000000000000000000000000) (bvsge lt!151368 #b00000000000000000000000000000000) (bvslt lt!151368 (bvadd #b00000000000000000000000000000001 mask!3709)) (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308300 (= lt!151368 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun b!308301 () Bool)

(declare-fun res!164966 () Bool)

(assert (=> b!308301 (=> (not res!164966) (not e!192819))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15692 (_ BitVec 32)) SeekEntryResult!2534)

(assert (=> b!308301 (= res!164966 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2534 i!1240)))))

(declare-fun b!308302 () Bool)

(declare-fun res!164959 () Bool)

(assert (=> b!308302 (=> (not res!164959) (not e!192819))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308302 (= res!164959 (validKeyInArray!0 k0!2441))))

(declare-fun b!308303 () Bool)

(declare-fun res!164962 () Bool)

(assert (=> b!308303 (=> (not res!164962) (not e!192819))))

(assert (=> b!308303 (= res!164962 (and (= (size!7781 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7781 a!3293))))))

(declare-fun b!308304 () Bool)

(declare-fun res!164964 () Bool)

(assert (=> b!308304 (=> (not res!164964) (not e!192819))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15692 (_ BitVec 32)) Bool)

(assert (=> b!308304 (= res!164964 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30726 res!164965) b!308303))

(assert (= (and b!308303 res!164962) b!308302))

(assert (= (and b!308302 res!164959) b!308297))

(assert (= (and b!308297 res!164967) b!308301))

(assert (= (and b!308301 res!164966) b!308304))

(assert (= (and b!308304 res!164964) b!308298))

(assert (= (and b!308298 res!164961) b!308299))

(assert (= (and b!308299 res!164963) b!308296))

(assert (= (and b!308296 res!164960) b!308295))

(assert (= (and b!308295 res!164958) b!308300))

(declare-fun m!318547 () Bool)

(assert (=> b!308296 m!318547))

(declare-fun m!318549 () Bool)

(assert (=> b!308297 m!318549))

(declare-fun m!318551 () Bool)

(assert (=> b!308302 m!318551))

(declare-fun m!318553 () Bool)

(assert (=> b!308295 m!318553))

(declare-fun m!318555 () Bool)

(assert (=> start!30726 m!318555))

(declare-fun m!318557 () Bool)

(assert (=> start!30726 m!318557))

(declare-fun m!318559 () Bool)

(assert (=> b!308299 m!318559))

(declare-fun m!318561 () Bool)

(assert (=> b!308304 m!318561))

(declare-fun m!318563 () Bool)

(assert (=> b!308300 m!318563))

(declare-fun m!318565 () Bool)

(assert (=> b!308298 m!318565))

(assert (=> b!308298 m!318565))

(declare-fun m!318567 () Bool)

(assert (=> b!308298 m!318567))

(declare-fun m!318569 () Bool)

(assert (=> b!308301 m!318569))

(check-sat (not b!308304) (not b!308297) (not b!308298) (not start!30726) (not b!308302) (not b!308301) (not b!308296) (not b!308300))
(check-sat)
