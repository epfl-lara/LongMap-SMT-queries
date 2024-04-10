; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30028 () Bool)

(assert start!30028)

(declare-fun b!301284 () Bool)

(declare-fun e!190164 () Bool)

(declare-fun mask!3709 () (_ BitVec 32))

(assert (=> b!301284 (= e!190164 (bvslt mask!3709 #b00000000000000000000000000000000))))

(declare-fun b!301285 () Bool)

(declare-fun res!159036 () Bool)

(assert (=> b!301285 (=> (not res!159036) (not e!190164))))

(declare-datatypes ((array!15248 0))(
  ( (array!15249 (arr!7216 (Array (_ BitVec 32) (_ BitVec 64))) (size!7568 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15248)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2356 0))(
  ( (MissingZero!2356 (index!11600 (_ BitVec 32))) (Found!2356 (index!11601 (_ BitVec 32))) (Intermediate!2356 (undefined!3168 Bool) (index!11602 (_ BitVec 32)) (x!29876 (_ BitVec 32))) (Undefined!2356) (MissingVacant!2356 (index!11603 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15248 (_ BitVec 32)) SeekEntryResult!2356)

(assert (=> b!301285 (= res!159036 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2356 i!1240)))))

(declare-fun b!301286 () Bool)

(declare-fun res!159035 () Bool)

(assert (=> b!301286 (=> (not res!159035) (not e!190164))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301286 (= res!159035 (validKeyInArray!0 k!2441))))

(declare-fun b!301287 () Bool)

(declare-fun res!159034 () Bool)

(assert (=> b!301287 (=> (not res!159034) (not e!190164))))

(declare-fun arrayContainsKey!0 (array!15248 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301287 (= res!159034 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301288 () Bool)

(declare-fun res!159038 () Bool)

(assert (=> b!301288 (=> (not res!159038) (not e!190164))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15248 (_ BitVec 32)) Bool)

(assert (=> b!301288 (= res!159038 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!301289 () Bool)

(declare-fun res!159037 () Bool)

(assert (=> b!301289 (=> (not res!159037) (not e!190164))))

(assert (=> b!301289 (= res!159037 (and (= (size!7568 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7568 a!3293))))))

(declare-fun res!159039 () Bool)

(assert (=> start!30028 (=> (not res!159039) (not e!190164))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30028 (= res!159039 (validMask!0 mask!3709))))

(assert (=> start!30028 e!190164))

(assert (=> start!30028 true))

(declare-fun array_inv!5179 (array!15248) Bool)

(assert (=> start!30028 (array_inv!5179 a!3293)))

(assert (= (and start!30028 res!159039) b!301289))

(assert (= (and b!301289 res!159037) b!301286))

(assert (= (and b!301286 res!159035) b!301287))

(assert (= (and b!301287 res!159034) b!301285))

(assert (= (and b!301285 res!159036) b!301288))

(assert (= (and b!301288 res!159038) b!301284))

(declare-fun m!313113 () Bool)

(assert (=> start!30028 m!313113))

(declare-fun m!313115 () Bool)

(assert (=> start!30028 m!313115))

(declare-fun m!313117 () Bool)

(assert (=> b!301286 m!313117))

(declare-fun m!313119 () Bool)

(assert (=> b!301287 m!313119))

(declare-fun m!313121 () Bool)

(assert (=> b!301288 m!313121))

(declare-fun m!313123 () Bool)

(assert (=> b!301285 m!313123))

(push 1)

(assert (not b!301288))

(assert (not start!30028))

(assert (not b!301287))

(assert (not b!301286))

(assert (not b!301285))

(check-sat)

