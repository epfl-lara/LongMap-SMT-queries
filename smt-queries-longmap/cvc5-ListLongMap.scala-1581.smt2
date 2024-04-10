; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30068 () Bool)

(assert start!30068)

(declare-fun b!301464 () Bool)

(declare-fun res!159147 () Bool)

(declare-fun e!190260 () Bool)

(assert (=> b!301464 (=> (not res!159147) (not e!190260))))

(declare-datatypes ((array!15258 0))(
  ( (array!15259 (arr!7220 (Array (_ BitVec 32) (_ BitVec 64))) (size!7572 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15258)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2360 0))(
  ( (MissingZero!2360 (index!11616 (_ BitVec 32))) (Found!2360 (index!11617 (_ BitVec 32))) (Intermediate!2360 (undefined!3172 Bool) (index!11618 (_ BitVec 32)) (x!29896 (_ BitVec 32))) (Undefined!2360) (MissingVacant!2360 (index!11619 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15258 (_ BitVec 32)) SeekEntryResult!2360)

(assert (=> b!301464 (= res!159147 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2360 i!1240)))))

(declare-fun res!159143 () Bool)

(assert (=> start!30068 (=> (not res!159143) (not e!190260))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30068 (= res!159143 (validMask!0 mask!3709))))

(assert (=> start!30068 e!190260))

(assert (=> start!30068 true))

(declare-fun array_inv!5183 (array!15258) Bool)

(assert (=> start!30068 (array_inv!5183 a!3293)))

(declare-fun b!301465 () Bool)

(declare-fun res!159142 () Bool)

(assert (=> b!301465 (=> (not res!159142) (not e!190260))))

(assert (=> b!301465 (= res!159142 (and (= (size!7572 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7572 a!3293))))))

(declare-fun b!301466 () Bool)

(declare-fun res!159144 () Bool)

(assert (=> b!301466 (=> (not res!159144) (not e!190260))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301466 (= res!159144 (validKeyInArray!0 k!2441))))

(declare-fun b!301467 () Bool)

(assert (=> b!301467 (= e!190260 false)))

(declare-fun lt!149847 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!301467 (= lt!149847 (toIndex!0 k!2441 mask!3709))))

(declare-fun b!301468 () Bool)

(declare-fun res!159145 () Bool)

(assert (=> b!301468 (=> (not res!159145) (not e!190260))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15258 (_ BitVec 32)) Bool)

(assert (=> b!301468 (= res!159145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!301469 () Bool)

(declare-fun res!159146 () Bool)

(assert (=> b!301469 (=> (not res!159146) (not e!190260))))

(declare-fun arrayContainsKey!0 (array!15258 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301469 (= res!159146 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30068 res!159143) b!301465))

(assert (= (and b!301465 res!159142) b!301466))

(assert (= (and b!301466 res!159144) b!301469))

(assert (= (and b!301469 res!159146) b!301464))

(assert (= (and b!301464 res!159147) b!301468))

(assert (= (and b!301468 res!159145) b!301467))

(declare-fun m!313235 () Bool)

(assert (=> b!301468 m!313235))

(declare-fun m!313237 () Bool)

(assert (=> b!301469 m!313237))

(declare-fun m!313239 () Bool)

(assert (=> b!301467 m!313239))

(declare-fun m!313241 () Bool)

(assert (=> start!30068 m!313241))

(declare-fun m!313243 () Bool)

(assert (=> start!30068 m!313243))

(declare-fun m!313245 () Bool)

(assert (=> b!301464 m!313245))

(declare-fun m!313247 () Bool)

(assert (=> b!301466 m!313247))

(push 1)

(assert (not start!30068))

(assert (not b!301466))

(assert (not b!301464))

(assert (not b!301469))

(assert (not b!301467))

(assert (not b!301468))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

