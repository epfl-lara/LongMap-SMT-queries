; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30284 () Bool)

(assert start!30284)

(declare-fun b!303126 () Bool)

(declare-fun res!160619 () Bool)

(declare-fun e!190865 () Bool)

(assert (=> b!303126 (=> (not res!160619) (not e!190865))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((array!15390 0))(
  ( (array!15391 (arr!7283 (Array (_ BitVec 32) (_ BitVec 64))) (size!7635 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15390)

(declare-datatypes ((SeekEntryResult!2423 0))(
  ( (MissingZero!2423 (index!11868 (_ BitVec 32))) (Found!2423 (index!11869 (_ BitVec 32))) (Intermediate!2423 (undefined!3235 Bool) (index!11870 (_ BitVec 32)) (x!30136 (_ BitVec 32))) (Undefined!2423) (MissingVacant!2423 (index!11871 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15390 (_ BitVec 32)) SeekEntryResult!2423)

(assert (=> b!303126 (= res!160619 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2423 i!1240)))))

(declare-fun b!303127 () Bool)

(declare-fun res!160613 () Bool)

(declare-fun e!190866 () Bool)

(assert (=> b!303127 (=> (not res!160613) (not e!190866))))

(declare-fun lt!150171 () SeekEntryResult!2423)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15390 (_ BitVec 32)) SeekEntryResult!2423)

(assert (=> b!303127 (= res!160613 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150171))))

(declare-fun b!303129 () Bool)

(declare-fun res!160617 () Bool)

(assert (=> b!303129 (=> (not res!160617) (not e!190866))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!303129 (= res!160617 (and (= (select (arr!7283 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7635 a!3293))))))

(declare-fun b!303130 () Bool)

(assert (=> b!303130 (= e!190865 e!190866)))

(declare-fun res!160614 () Bool)

(assert (=> b!303130 (=> (not res!160614) (not e!190866))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303130 (= res!160614 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150171))))

(assert (=> b!303130 (= lt!150171 (Intermediate!2423 false resIndex!52 resX!52))))

(declare-fun b!303131 () Bool)

(declare-fun res!160615 () Bool)

(assert (=> b!303131 (=> (not res!160615) (not e!190865))))

(declare-fun arrayContainsKey!0 (array!15390 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303131 (= res!160615 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!303132 () Bool)

(assert (=> b!303132 (= e!190866 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7283 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7283 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7283 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709))))))

(declare-fun res!160620 () Bool)

(assert (=> start!30284 (=> (not res!160620) (not e!190865))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30284 (= res!160620 (validMask!0 mask!3709))))

(assert (=> start!30284 e!190865))

(declare-fun array_inv!5246 (array!15390) Bool)

(assert (=> start!30284 (array_inv!5246 a!3293)))

(assert (=> start!30284 true))

(declare-fun b!303128 () Bool)

(declare-fun res!160616 () Bool)

(assert (=> b!303128 (=> (not res!160616) (not e!190865))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303128 (= res!160616 (validKeyInArray!0 k!2441))))

(declare-fun b!303133 () Bool)

(declare-fun res!160618 () Bool)

(assert (=> b!303133 (=> (not res!160618) (not e!190865))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15390 (_ BitVec 32)) Bool)

(assert (=> b!303133 (= res!160618 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303134 () Bool)

(declare-fun res!160612 () Bool)

(assert (=> b!303134 (=> (not res!160612) (not e!190865))))

(assert (=> b!303134 (= res!160612 (and (= (size!7635 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7635 a!3293))))))

(assert (= (and start!30284 res!160620) b!303134))

(assert (= (and b!303134 res!160612) b!303128))

(assert (= (and b!303128 res!160616) b!303131))

(assert (= (and b!303131 res!160615) b!303126))

(assert (= (and b!303126 res!160619) b!303133))

(assert (= (and b!303133 res!160618) b!303130))

(assert (= (and b!303130 res!160614) b!303129))

(assert (= (and b!303129 res!160617) b!303127))

(assert (= (and b!303127 res!160613) b!303132))

(declare-fun m!314531 () Bool)

(assert (=> b!303128 m!314531))

(declare-fun m!314533 () Bool)

(assert (=> b!303127 m!314533))

(declare-fun m!314535 () Bool)

(assert (=> b!303131 m!314535))

(declare-fun m!314537 () Bool)

(assert (=> start!30284 m!314537))

(declare-fun m!314539 () Bool)

(assert (=> start!30284 m!314539))

(declare-fun m!314541 () Bool)

(assert (=> b!303132 m!314541))

(declare-fun m!314543 () Bool)

(assert (=> b!303126 m!314543))

(declare-fun m!314545 () Bool)

(assert (=> b!303130 m!314545))

(assert (=> b!303130 m!314545))

(declare-fun m!314547 () Bool)

(assert (=> b!303130 m!314547))

(declare-fun m!314549 () Bool)

(assert (=> b!303133 m!314549))

(declare-fun m!314551 () Bool)

(assert (=> b!303129 m!314551))

(push 1)

(assert (not b!303133))

(assert (not b!303131))

(assert (not start!30284))

(assert (not b!303128))

(assert (not b!303126))

(assert (not b!303127))

(assert (not b!303130))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

