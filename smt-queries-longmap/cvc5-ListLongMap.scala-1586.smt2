; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30140 () Bool)

(assert start!30140)

(declare-fun b!301842 () Bool)

(declare-fun res!159455 () Bool)

(declare-fun e!190423 () Bool)

(assert (=> b!301842 (=> (not res!159455) (not e!190423))))

(declare-datatypes ((array!15291 0))(
  ( (array!15292 (arr!7235 (Array (_ BitVec 32) (_ BitVec 64))) (size!7587 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15291)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15291 (_ BitVec 32)) Bool)

(assert (=> b!301842 (= res!159455 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!301843 () Bool)

(declare-fun res!159452 () Bool)

(assert (=> b!301843 (=> (not res!159452) (not e!190423))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301843 (= res!159452 (validKeyInArray!0 k!2441))))

(declare-fun b!301844 () Bool)

(declare-fun res!159454 () Bool)

(assert (=> b!301844 (=> (not res!159454) (not e!190423))))

(declare-fun arrayContainsKey!0 (array!15291 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301844 (= res!159454 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301845 () Bool)

(assert (=> b!301845 (= e!190423 false)))

(declare-fun lt!149964 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!301845 (= lt!149964 (toIndex!0 k!2441 mask!3709))))

(declare-fun res!159456 () Bool)

(assert (=> start!30140 (=> (not res!159456) (not e!190423))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30140 (= res!159456 (validMask!0 mask!3709))))

(assert (=> start!30140 e!190423))

(assert (=> start!30140 true))

(declare-fun array_inv!5198 (array!15291) Bool)

(assert (=> start!30140 (array_inv!5198 a!3293)))

(declare-fun b!301846 () Bool)

(declare-fun res!159451 () Bool)

(assert (=> b!301846 (=> (not res!159451) (not e!190423))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2375 0))(
  ( (MissingZero!2375 (index!11676 (_ BitVec 32))) (Found!2375 (index!11677 (_ BitVec 32))) (Intermediate!2375 (undefined!3187 Bool) (index!11678 (_ BitVec 32)) (x!29954 (_ BitVec 32))) (Undefined!2375) (MissingVacant!2375 (index!11679 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15291 (_ BitVec 32)) SeekEntryResult!2375)

(assert (=> b!301846 (= res!159451 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2375 i!1240)))))

(declare-fun b!301847 () Bool)

(declare-fun res!159453 () Bool)

(assert (=> b!301847 (=> (not res!159453) (not e!190423))))

(assert (=> b!301847 (= res!159453 (and (= (size!7587 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7587 a!3293))))))

(assert (= (and start!30140 res!159456) b!301847))

(assert (= (and b!301847 res!159453) b!301843))

(assert (= (and b!301843 res!159452) b!301844))

(assert (= (and b!301844 res!159454) b!301846))

(assert (= (and b!301846 res!159451) b!301842))

(assert (= (and b!301842 res!159455) b!301845))

(declare-fun m!313523 () Bool)

(assert (=> start!30140 m!313523))

(declare-fun m!313525 () Bool)

(assert (=> start!30140 m!313525))

(declare-fun m!313527 () Bool)

(assert (=> b!301844 m!313527))

(declare-fun m!313529 () Bool)

(assert (=> b!301842 m!313529))

(declare-fun m!313531 () Bool)

(assert (=> b!301845 m!313531))

(declare-fun m!313533 () Bool)

(assert (=> b!301843 m!313533))

(declare-fun m!313535 () Bool)

(assert (=> b!301846 m!313535))

(push 1)

(assert (not b!301845))

(assert (not b!301842))

(assert (not b!301844))

(assert (not start!30140))

(assert (not b!301843))

(assert (not b!301846))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

