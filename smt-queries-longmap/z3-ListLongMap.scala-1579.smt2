; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30006 () Bool)

(assert start!30006)

(declare-fun b!301195 () Bool)

(declare-fun e!190118 () Bool)

(declare-fun mask!3709 () (_ BitVec 32))

(assert (=> b!301195 (= e!190118 (bvslt mask!3709 #b00000000000000000000000000000000))))

(declare-fun b!301196 () Bool)

(declare-fun res!158999 () Bool)

(assert (=> b!301196 (=> (not res!158999) (not e!190118))))

(declare-datatypes ((array!15242 0))(
  ( (array!15243 (arr!7213 (Array (_ BitVec 32) (_ BitVec 64))) (size!7565 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15242)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15242 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301196 (= res!158999 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301197 () Bool)

(declare-fun res!159000 () Bool)

(assert (=> b!301197 (=> (not res!159000) (not e!190118))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15242 (_ BitVec 32)) Bool)

(assert (=> b!301197 (= res!159000 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!158998 () Bool)

(assert (=> start!30006 (=> (not res!158998) (not e!190118))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30006 (= res!158998 (validMask!0 mask!3709))))

(assert (=> start!30006 e!190118))

(assert (=> start!30006 true))

(declare-fun array_inv!5163 (array!15242) Bool)

(assert (=> start!30006 (array_inv!5163 a!3293)))

(declare-fun b!301198 () Bool)

(declare-fun res!158996 () Bool)

(assert (=> b!301198 (=> (not res!158996) (not e!190118))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301198 (= res!158996 (validKeyInArray!0 k0!2441))))

(declare-fun b!301199 () Bool)

(declare-fun res!158995 () Bool)

(assert (=> b!301199 (=> (not res!158995) (not e!190118))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2318 0))(
  ( (MissingZero!2318 (index!11448 (_ BitVec 32))) (Found!2318 (index!11449 (_ BitVec 32))) (Intermediate!2318 (undefined!3130 Bool) (index!11450 (_ BitVec 32)) (x!29835 (_ BitVec 32))) (Undefined!2318) (MissingVacant!2318 (index!11451 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15242 (_ BitVec 32)) SeekEntryResult!2318)

(assert (=> b!301199 (= res!158995 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2318 i!1240)))))

(declare-fun b!301200 () Bool)

(declare-fun res!158997 () Bool)

(assert (=> b!301200 (=> (not res!158997) (not e!190118))))

(assert (=> b!301200 (= res!158997 (and (= (size!7565 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7565 a!3293))))))

(assert (= (and start!30006 res!158998) b!301200))

(assert (= (and b!301200 res!158997) b!301198))

(assert (= (and b!301198 res!158996) b!301196))

(assert (= (and b!301196 res!158999) b!301199))

(assert (= (and b!301199 res!158995) b!301197))

(assert (= (and b!301197 res!159000) b!301195))

(declare-fun m!313191 () Bool)

(assert (=> start!30006 m!313191))

(declare-fun m!313193 () Bool)

(assert (=> start!30006 m!313193))

(declare-fun m!313195 () Bool)

(assert (=> b!301196 m!313195))

(declare-fun m!313197 () Bool)

(assert (=> b!301199 m!313197))

(declare-fun m!313199 () Bool)

(assert (=> b!301197 m!313199))

(declare-fun m!313201 () Bool)

(assert (=> b!301198 m!313201))

(check-sat (not b!301199) (not start!30006) (not b!301197) (not b!301196) (not b!301198))
(check-sat)
