; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30010 () Bool)

(assert start!30010)

(declare-fun b!301152 () Bool)

(declare-fun res!158902 () Bool)

(declare-fun e!190111 () Bool)

(assert (=> b!301152 (=> (not res!158902) (not e!190111))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301152 (= res!158902 (validKeyInArray!0 k!2441))))

(declare-fun res!158901 () Bool)

(assert (=> start!30010 (=> (not res!158901) (not e!190111))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30010 (= res!158901 (validMask!0 mask!3709))))

(assert (=> start!30010 e!190111))

(assert (=> start!30010 true))

(declare-datatypes ((array!15230 0))(
  ( (array!15231 (arr!7207 (Array (_ BitVec 32) (_ BitVec 64))) (size!7559 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15230)

(declare-fun array_inv!5170 (array!15230) Bool)

(assert (=> start!30010 (array_inv!5170 a!3293)))

(declare-fun b!301153 () Bool)

(declare-fun res!158903 () Bool)

(assert (=> b!301153 (=> (not res!158903) (not e!190111))))

(declare-fun arrayContainsKey!0 (array!15230 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301153 (= res!158903 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301154 () Bool)

(assert (=> b!301154 (= e!190111 false)))

(declare-datatypes ((SeekEntryResult!2347 0))(
  ( (MissingZero!2347 (index!11564 (_ BitVec 32))) (Found!2347 (index!11565 (_ BitVec 32))) (Intermediate!2347 (undefined!3159 Bool) (index!11566 (_ BitVec 32)) (x!29843 (_ BitVec 32))) (Undefined!2347) (MissingVacant!2347 (index!11567 (_ BitVec 32))) )
))
(declare-fun lt!149781 () SeekEntryResult!2347)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15230 (_ BitVec 32)) SeekEntryResult!2347)

(assert (=> b!301154 (= lt!149781 (seekEntryOrOpen!0 k!2441 a!3293 mask!3709))))

(declare-fun b!301151 () Bool)

(declare-fun res!158904 () Bool)

(assert (=> b!301151 (=> (not res!158904) (not e!190111))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301151 (= res!158904 (and (= (size!7559 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7559 a!3293))))))

(assert (= (and start!30010 res!158901) b!301151))

(assert (= (and b!301151 res!158904) b!301152))

(assert (= (and b!301152 res!158902) b!301153))

(assert (= (and b!301153 res!158903) b!301154))

(declare-fun m!313019 () Bool)

(assert (=> b!301152 m!313019))

(declare-fun m!313021 () Bool)

(assert (=> start!30010 m!313021))

(declare-fun m!313023 () Bool)

(assert (=> start!30010 m!313023))

(declare-fun m!313025 () Bool)

(assert (=> b!301153 m!313025))

(declare-fun m!313027 () Bool)

(assert (=> b!301154 m!313027))

(push 1)

(assert (not b!301152))

(assert (not b!301154))

(assert (not b!301153))

(assert (not start!30010))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

