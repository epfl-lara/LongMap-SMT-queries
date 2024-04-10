; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30134 () Bool)

(assert start!30134)

(declare-fun b!301788 () Bool)

(declare-fun res!159401 () Bool)

(declare-fun e!190405 () Bool)

(assert (=> b!301788 (=> (not res!159401) (not e!190405))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301788 (= res!159401 (validKeyInArray!0 k!2441))))

(declare-fun b!301789 () Bool)

(declare-fun res!159400 () Bool)

(assert (=> b!301789 (=> (not res!159400) (not e!190405))))

(declare-datatypes ((array!15285 0))(
  ( (array!15286 (arr!7232 (Array (_ BitVec 32) (_ BitVec 64))) (size!7584 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15285)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15285 (_ BitVec 32)) Bool)

(assert (=> b!301789 (= res!159400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!301790 () Bool)

(declare-fun res!159398 () Bool)

(assert (=> b!301790 (=> (not res!159398) (not e!190405))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301790 (= res!159398 (and (= (size!7584 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7584 a!3293))))))

(declare-fun b!301791 () Bool)

(declare-fun res!159397 () Bool)

(assert (=> b!301791 (=> (not res!159397) (not e!190405))))

(declare-fun arrayContainsKey!0 (array!15285 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301791 (= res!159397 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!159399 () Bool)

(assert (=> start!30134 (=> (not res!159399) (not e!190405))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30134 (= res!159399 (validMask!0 mask!3709))))

(assert (=> start!30134 e!190405))

(assert (=> start!30134 true))

(declare-fun array_inv!5195 (array!15285) Bool)

(assert (=> start!30134 (array_inv!5195 a!3293)))

(declare-fun b!301792 () Bool)

(declare-fun res!159402 () Bool)

(assert (=> b!301792 (=> (not res!159402) (not e!190405))))

(declare-datatypes ((SeekEntryResult!2372 0))(
  ( (MissingZero!2372 (index!11664 (_ BitVec 32))) (Found!2372 (index!11665 (_ BitVec 32))) (Intermediate!2372 (undefined!3184 Bool) (index!11666 (_ BitVec 32)) (x!29943 (_ BitVec 32))) (Undefined!2372) (MissingVacant!2372 (index!11667 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15285 (_ BitVec 32)) SeekEntryResult!2372)

(assert (=> b!301792 (= res!159402 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2372 i!1240)))))

(declare-fun b!301793 () Bool)

(assert (=> b!301793 (= e!190405 false)))

(declare-fun lt!149955 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!301793 (= lt!149955 (toIndex!0 k!2441 mask!3709))))

(assert (= (and start!30134 res!159399) b!301790))

(assert (= (and b!301790 res!159398) b!301788))

(assert (= (and b!301788 res!159401) b!301791))

(assert (= (and b!301791 res!159397) b!301792))

(assert (= (and b!301792 res!159402) b!301789))

(assert (= (and b!301789 res!159400) b!301793))

(declare-fun m!313481 () Bool)

(assert (=> b!301791 m!313481))

(declare-fun m!313483 () Bool)

(assert (=> b!301793 m!313483))

(declare-fun m!313485 () Bool)

(assert (=> b!301789 m!313485))

(declare-fun m!313487 () Bool)

(assert (=> b!301792 m!313487))

(declare-fun m!313489 () Bool)

(assert (=> b!301788 m!313489))

(declare-fun m!313491 () Bool)

(assert (=> start!30134 m!313491))

(declare-fun m!313493 () Bool)

(assert (=> start!30134 m!313493))

(push 1)

(assert (not b!301791))

(assert (not start!30134))

(assert (not b!301789))

(assert (not b!301788))

(assert (not b!301792))

(assert (not b!301793))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

