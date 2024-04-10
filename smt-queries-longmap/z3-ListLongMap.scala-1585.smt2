; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30136 () Bool)

(assert start!30136)

(declare-fun res!159418 () Bool)

(declare-fun e!190410 () Bool)

(assert (=> start!30136 (=> (not res!159418) (not e!190410))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30136 (= res!159418 (validMask!0 mask!3709))))

(assert (=> start!30136 e!190410))

(assert (=> start!30136 true))

(declare-datatypes ((array!15287 0))(
  ( (array!15288 (arr!7233 (Array (_ BitVec 32) (_ BitVec 64))) (size!7585 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15287)

(declare-fun array_inv!5196 (array!15287) Bool)

(assert (=> start!30136 (array_inv!5196 a!3293)))

(declare-fun b!301806 () Bool)

(declare-fun res!159420 () Bool)

(assert (=> b!301806 (=> (not res!159420) (not e!190410))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301806 (= res!159420 (and (= (size!7585 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7585 a!3293))))))

(declare-fun b!301807 () Bool)

(assert (=> b!301807 (= e!190410 false)))

(declare-fun lt!149958 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!301807 (= lt!149958 (toIndex!0 k0!2441 mask!3709))))

(declare-fun b!301808 () Bool)

(declare-fun res!159419 () Bool)

(assert (=> b!301808 (=> (not res!159419) (not e!190410))))

(declare-fun arrayContainsKey!0 (array!15287 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301808 (= res!159419 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301809 () Bool)

(declare-fun res!159415 () Bool)

(assert (=> b!301809 (=> (not res!159415) (not e!190410))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15287 (_ BitVec 32)) Bool)

(assert (=> b!301809 (= res!159415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!301810 () Bool)

(declare-fun res!159417 () Bool)

(assert (=> b!301810 (=> (not res!159417) (not e!190410))))

(declare-datatypes ((SeekEntryResult!2373 0))(
  ( (MissingZero!2373 (index!11668 (_ BitVec 32))) (Found!2373 (index!11669 (_ BitVec 32))) (Intermediate!2373 (undefined!3185 Bool) (index!11670 (_ BitVec 32)) (x!29944 (_ BitVec 32))) (Undefined!2373) (MissingVacant!2373 (index!11671 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15287 (_ BitVec 32)) SeekEntryResult!2373)

(assert (=> b!301810 (= res!159417 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2373 i!1240)))))

(declare-fun b!301811 () Bool)

(declare-fun res!159416 () Bool)

(assert (=> b!301811 (=> (not res!159416) (not e!190410))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301811 (= res!159416 (validKeyInArray!0 k0!2441))))

(assert (= (and start!30136 res!159418) b!301806))

(assert (= (and b!301806 res!159420) b!301811))

(assert (= (and b!301811 res!159416) b!301808))

(assert (= (and b!301808 res!159419) b!301810))

(assert (= (and b!301810 res!159417) b!301809))

(assert (= (and b!301809 res!159415) b!301807))

(declare-fun m!313495 () Bool)

(assert (=> start!30136 m!313495))

(declare-fun m!313497 () Bool)

(assert (=> start!30136 m!313497))

(declare-fun m!313499 () Bool)

(assert (=> b!301809 m!313499))

(declare-fun m!313501 () Bool)

(assert (=> b!301811 m!313501))

(declare-fun m!313503 () Bool)

(assert (=> b!301807 m!313503))

(declare-fun m!313505 () Bool)

(assert (=> b!301810 m!313505))

(declare-fun m!313507 () Bool)

(assert (=> b!301808 m!313507))

(check-sat (not b!301810) (not start!30136) (not b!301811) (not b!301808) (not b!301807) (not b!301809))
