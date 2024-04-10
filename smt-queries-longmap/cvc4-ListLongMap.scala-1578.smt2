; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30022 () Bool)

(assert start!30022)

(declare-fun b!301231 () Bool)

(declare-fun res!158984 () Bool)

(declare-fun e!190146 () Bool)

(assert (=> b!301231 (=> (not res!158984) (not e!190146))))

(declare-datatypes ((array!15242 0))(
  ( (array!15243 (arr!7213 (Array (_ BitVec 32) (_ BitVec 64))) (size!7565 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15242)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15242 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301231 (= res!158984 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301232 () Bool)

(declare-fun res!158981 () Bool)

(assert (=> b!301232 (=> (not res!158981) (not e!190146))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2353 0))(
  ( (MissingZero!2353 (index!11588 (_ BitVec 32))) (Found!2353 (index!11589 (_ BitVec 32))) (Intermediate!2353 (undefined!3165 Bool) (index!11590 (_ BitVec 32)) (x!29865 (_ BitVec 32))) (Undefined!2353) (MissingVacant!2353 (index!11591 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15242 (_ BitVec 32)) SeekEntryResult!2353)

(assert (=> b!301232 (= res!158981 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2353 i!1240)))))

(declare-fun b!301233 () Bool)

(declare-fun res!158982 () Bool)

(assert (=> b!301233 (=> (not res!158982) (not e!190146))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301233 (= res!158982 (validKeyInArray!0 k!2441))))

(declare-fun b!301234 () Bool)

(declare-fun res!158985 () Bool)

(assert (=> b!301234 (=> (not res!158985) (not e!190146))))

(assert (=> b!301234 (= res!158985 (and (= (size!7565 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7565 a!3293))))))

(declare-fun res!158983 () Bool)

(assert (=> start!30022 (=> (not res!158983) (not e!190146))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30022 (= res!158983 (validMask!0 mask!3709))))

(assert (=> start!30022 e!190146))

(assert (=> start!30022 true))

(declare-fun array_inv!5176 (array!15242) Bool)

(assert (=> start!30022 (array_inv!5176 a!3293)))

(declare-fun b!301235 () Bool)

(assert (=> b!301235 (= e!190146 (bvsgt #b00000000000000000000000000000000 (size!7565 a!3293)))))

(assert (= (and start!30022 res!158983) b!301234))

(assert (= (and b!301234 res!158985) b!301233))

(assert (= (and b!301233 res!158982) b!301231))

(assert (= (and b!301231 res!158984) b!301232))

(assert (= (and b!301232 res!158981) b!301235))

(declare-fun m!313079 () Bool)

(assert (=> b!301231 m!313079))

(declare-fun m!313081 () Bool)

(assert (=> b!301232 m!313081))

(declare-fun m!313083 () Bool)

(assert (=> b!301233 m!313083))

(declare-fun m!313085 () Bool)

(assert (=> start!30022 m!313085))

(declare-fun m!313087 () Bool)

(assert (=> start!30022 m!313087))

(push 1)

(assert (not start!30022))

(assert (not b!301231))

(assert (not b!301233))

(assert (not b!301232))

(check-sat)

(pop 1)

