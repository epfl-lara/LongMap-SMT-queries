; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30072 () Bool)

(assert start!30072)

(declare-fun b!301500 () Bool)

(declare-fun res!159181 () Bool)

(declare-fun e!190273 () Bool)

(assert (=> b!301500 (=> (not res!159181) (not e!190273))))

(declare-datatypes ((array!15262 0))(
  ( (array!15263 (arr!7222 (Array (_ BitVec 32) (_ BitVec 64))) (size!7574 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15262)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2362 0))(
  ( (MissingZero!2362 (index!11624 (_ BitVec 32))) (Found!2362 (index!11625 (_ BitVec 32))) (Intermediate!2362 (undefined!3174 Bool) (index!11626 (_ BitVec 32)) (x!29898 (_ BitVec 32))) (Undefined!2362) (MissingVacant!2362 (index!11627 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15262 (_ BitVec 32)) SeekEntryResult!2362)

(assert (=> b!301500 (= res!159181 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2362 i!1240)))))

(declare-fun b!301501 () Bool)

(assert (=> b!301501 (= e!190273 false)))

(declare-fun lt!149853 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!301501 (= lt!149853 (toIndex!0 k!2441 mask!3709))))

(declare-fun b!301502 () Bool)

(declare-fun res!159180 () Bool)

(assert (=> b!301502 (=> (not res!159180) (not e!190273))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15262 (_ BitVec 32)) Bool)

(assert (=> b!301502 (= res!159180 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!301503 () Bool)

(declare-fun res!159182 () Bool)

(assert (=> b!301503 (=> (not res!159182) (not e!190273))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301503 (= res!159182 (validKeyInArray!0 k!2441))))

(declare-fun res!159183 () Bool)

(assert (=> start!30072 (=> (not res!159183) (not e!190273))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30072 (= res!159183 (validMask!0 mask!3709))))

(assert (=> start!30072 e!190273))

(assert (=> start!30072 true))

(declare-fun array_inv!5185 (array!15262) Bool)

(assert (=> start!30072 (array_inv!5185 a!3293)))

(declare-fun b!301504 () Bool)

(declare-fun res!159179 () Bool)

(assert (=> b!301504 (=> (not res!159179) (not e!190273))))

(declare-fun arrayContainsKey!0 (array!15262 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301504 (= res!159179 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301505 () Bool)

(declare-fun res!159178 () Bool)

(assert (=> b!301505 (=> (not res!159178) (not e!190273))))

(assert (=> b!301505 (= res!159178 (and (= (size!7574 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7574 a!3293))))))

(assert (= (and start!30072 res!159183) b!301505))

(assert (= (and b!301505 res!159178) b!301503))

(assert (= (and b!301503 res!159182) b!301504))

(assert (= (and b!301504 res!159179) b!301500))

(assert (= (and b!301500 res!159181) b!301502))

(assert (= (and b!301502 res!159180) b!301501))

(declare-fun m!313263 () Bool)

(assert (=> b!301502 m!313263))

(declare-fun m!313265 () Bool)

(assert (=> start!30072 m!313265))

(declare-fun m!313267 () Bool)

(assert (=> start!30072 m!313267))

(declare-fun m!313269 () Bool)

(assert (=> b!301504 m!313269))

(declare-fun m!313271 () Bool)

(assert (=> b!301500 m!313271))

(declare-fun m!313273 () Bool)

(assert (=> b!301501 m!313273))

(declare-fun m!313275 () Bool)

(assert (=> b!301503 m!313275))

(push 1)

(assert (not start!30072))

(assert (not b!301500))

(assert (not b!301504))

(assert (not b!301502))

(assert (not b!301503))

(assert (not b!301501))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

