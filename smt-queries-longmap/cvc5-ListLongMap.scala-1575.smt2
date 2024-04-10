; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30000 () Bool)

(assert start!30000)

(declare-fun b!301092 () Bool)

(declare-fun res!158841 () Bool)

(declare-fun e!190080 () Bool)

(assert (=> b!301092 (=> (not res!158841) (not e!190080))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301092 (= res!158841 (validKeyInArray!0 k!2441))))

(declare-fun b!301093 () Bool)

(declare-fun res!158843 () Bool)

(assert (=> b!301093 (=> (not res!158843) (not e!190080))))

(declare-datatypes ((array!15220 0))(
  ( (array!15221 (arr!7202 (Array (_ BitVec 32) (_ BitVec 64))) (size!7554 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15220)

(declare-fun arrayContainsKey!0 (array!15220 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301093 (= res!158843 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301094 () Bool)

(assert (=> b!301094 (= e!190080 false)))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2342 0))(
  ( (MissingZero!2342 (index!11544 (_ BitVec 32))) (Found!2342 (index!11545 (_ BitVec 32))) (Intermediate!2342 (undefined!3154 Bool) (index!11546 (_ BitVec 32)) (x!29830 (_ BitVec 32))) (Undefined!2342) (MissingVacant!2342 (index!11547 (_ BitVec 32))) )
))
(declare-fun lt!149766 () SeekEntryResult!2342)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15220 (_ BitVec 32)) SeekEntryResult!2342)

(assert (=> b!301094 (= lt!149766 (seekEntryOrOpen!0 k!2441 a!3293 mask!3709))))

(declare-fun res!158844 () Bool)

(assert (=> start!30000 (=> (not res!158844) (not e!190080))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30000 (= res!158844 (validMask!0 mask!3709))))

(assert (=> start!30000 e!190080))

(assert (=> start!30000 true))

(declare-fun array_inv!5165 (array!15220) Bool)

(assert (=> start!30000 (array_inv!5165 a!3293)))

(declare-fun b!301091 () Bool)

(declare-fun res!158842 () Bool)

(assert (=> b!301091 (=> (not res!158842) (not e!190080))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301091 (= res!158842 (and (= (size!7554 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7554 a!3293))))))

(assert (= (and start!30000 res!158844) b!301091))

(assert (= (and b!301091 res!158842) b!301092))

(assert (= (and b!301092 res!158841) b!301093))

(assert (= (and b!301093 res!158843) b!301094))

(declare-fun m!312969 () Bool)

(assert (=> b!301092 m!312969))

(declare-fun m!312971 () Bool)

(assert (=> b!301093 m!312971))

(declare-fun m!312973 () Bool)

(assert (=> b!301094 m!312973))

(declare-fun m!312975 () Bool)

(assert (=> start!30000 m!312975))

(declare-fun m!312977 () Bool)

(assert (=> start!30000 m!312977))

(push 1)

(assert (not b!301092))

(assert (not b!301094))

(assert (not start!30000))

(assert (not b!301093))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

