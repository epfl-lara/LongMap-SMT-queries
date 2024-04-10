; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30150 () Bool)

(assert start!30150)

(declare-fun b!301932 () Bool)

(declare-fun res!159541 () Bool)

(declare-fun e!190452 () Bool)

(assert (=> b!301932 (=> (not res!159541) (not e!190452))))

(declare-datatypes ((array!15301 0))(
  ( (array!15302 (arr!7240 (Array (_ BitVec 32) (_ BitVec 64))) (size!7592 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15301)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2380 0))(
  ( (MissingZero!2380 (index!11696 (_ BitVec 32))) (Found!2380 (index!11697 (_ BitVec 32))) (Intermediate!2380 (undefined!3192 Bool) (index!11698 (_ BitVec 32)) (x!29967 (_ BitVec 32))) (Undefined!2380) (MissingVacant!2380 (index!11699 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15301 (_ BitVec 32)) SeekEntryResult!2380)

(assert (=> b!301932 (= res!159541 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2380 i!1240)))))

(declare-fun b!301933 () Bool)

(declare-fun res!159543 () Bool)

(assert (=> b!301933 (=> (not res!159543) (not e!190452))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301933 (= res!159543 (validKeyInArray!0 k!2441))))

(declare-fun b!301934 () Bool)

(declare-fun res!159544 () Bool)

(assert (=> b!301934 (=> (not res!159544) (not e!190452))))

(assert (=> b!301934 (= res!159544 (and (= (size!7592 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7592 a!3293))))))

(declare-fun b!301935 () Bool)

(declare-fun res!159546 () Bool)

(assert (=> b!301935 (=> (not res!159546) (not e!190452))))

(declare-fun arrayContainsKey!0 (array!15301 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301935 (= res!159546 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!159542 () Bool)

(assert (=> start!30150 (=> (not res!159542) (not e!190452))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30150 (= res!159542 (validMask!0 mask!3709))))

(assert (=> start!30150 e!190452))

(assert (=> start!30150 true))

(declare-fun array_inv!5203 (array!15301) Bool)

(assert (=> start!30150 (array_inv!5203 a!3293)))

(declare-fun b!301936 () Bool)

(assert (=> b!301936 (= e!190452 false)))

(declare-fun lt!149979 () SeekEntryResult!2380)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15301 (_ BitVec 32)) SeekEntryResult!2380)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!301936 (= lt!149979 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!301937 () Bool)

(declare-fun res!159545 () Bool)

(assert (=> b!301937 (=> (not res!159545) (not e!190452))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15301 (_ BitVec 32)) Bool)

(assert (=> b!301937 (= res!159545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30150 res!159542) b!301934))

(assert (= (and b!301934 res!159544) b!301933))

(assert (= (and b!301933 res!159543) b!301935))

(assert (= (and b!301935 res!159546) b!301932))

(assert (= (and b!301932 res!159541) b!301937))

(assert (= (and b!301937 res!159545) b!301936))

(declare-fun m!313597 () Bool)

(assert (=> start!30150 m!313597))

(declare-fun m!313599 () Bool)

(assert (=> start!30150 m!313599))

(declare-fun m!313601 () Bool)

(assert (=> b!301932 m!313601))

(declare-fun m!313603 () Bool)

(assert (=> b!301936 m!313603))

(assert (=> b!301936 m!313603))

(declare-fun m!313605 () Bool)

(assert (=> b!301936 m!313605))

(declare-fun m!313607 () Bool)

(assert (=> b!301937 m!313607))

(declare-fun m!313609 () Bool)

(assert (=> b!301935 m!313609))

(declare-fun m!313611 () Bool)

(assert (=> b!301933 m!313611))

(push 1)

(assert (not b!301935))

(assert (not b!301933))

(assert (not b!301937))

(assert (not b!301932))

(assert (not b!301936))

(assert (not start!30150))

