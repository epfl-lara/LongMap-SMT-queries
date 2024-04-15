; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30124 () Bool)

(assert start!30124)

(declare-fun res!159308 () Bool)

(declare-fun e!190240 () Bool)

(assert (=> start!30124 (=> (not res!159308) (not e!190240))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30124 (= res!159308 (validMask!0 mask!3709))))

(assert (=> start!30124 e!190240))

(assert (=> start!30124 true))

(declare-datatypes ((array!15279 0))(
  ( (array!15280 (arr!7229 (Array (_ BitVec 32) (_ BitVec 64))) (size!7582 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15279)

(declare-fun array_inv!5201 (array!15279) Bool)

(assert (=> start!30124 (array_inv!5201 a!3293)))

(declare-fun b!301549 () Bool)

(assert (=> b!301549 (= e!190240 false)))

(declare-fun lt!149726 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!301549 (= lt!149726 (toIndex!0 k!2441 mask!3709))))

(declare-fun b!301550 () Bool)

(declare-fun res!159304 () Bool)

(assert (=> b!301550 (=> (not res!159304) (not e!190240))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301550 (= res!159304 (validKeyInArray!0 k!2441))))

(declare-fun b!301551 () Bool)

(declare-fun res!159307 () Bool)

(assert (=> b!301551 (=> (not res!159307) (not e!190240))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301551 (= res!159307 (and (= (size!7582 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7582 a!3293))))))

(declare-fun b!301552 () Bool)

(declare-fun res!159309 () Bool)

(assert (=> b!301552 (=> (not res!159309) (not e!190240))))

(declare-datatypes ((SeekEntryResult!2368 0))(
  ( (MissingZero!2368 (index!11648 (_ BitVec 32))) (Found!2368 (index!11649 (_ BitVec 32))) (Intermediate!2368 (undefined!3180 Bool) (index!11650 (_ BitVec 32)) (x!29934 (_ BitVec 32))) (Undefined!2368) (MissingVacant!2368 (index!11651 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15279 (_ BitVec 32)) SeekEntryResult!2368)

(assert (=> b!301552 (= res!159309 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2368 i!1240)))))

(declare-fun b!301553 () Bool)

(declare-fun res!159306 () Bool)

(assert (=> b!301553 (=> (not res!159306) (not e!190240))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15279 (_ BitVec 32)) Bool)

(assert (=> b!301553 (= res!159306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!301554 () Bool)

(declare-fun res!159305 () Bool)

(assert (=> b!301554 (=> (not res!159305) (not e!190240))))

(declare-fun arrayContainsKey!0 (array!15279 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301554 (= res!159305 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30124 res!159308) b!301551))

(assert (= (and b!301551 res!159307) b!301550))

(assert (= (and b!301550 res!159304) b!301554))

(assert (= (and b!301554 res!159305) b!301552))

(assert (= (and b!301552 res!159309) b!301553))

(assert (= (and b!301553 res!159306) b!301549))

(declare-fun m!312779 () Bool)

(assert (=> b!301552 m!312779))

(declare-fun m!312781 () Bool)

(assert (=> b!301554 m!312781))

(declare-fun m!312783 () Bool)

(assert (=> start!30124 m!312783))

(declare-fun m!312785 () Bool)

(assert (=> start!30124 m!312785))

(declare-fun m!312787 () Bool)

(assert (=> b!301550 m!312787))

(declare-fun m!312789 () Bool)

(assert (=> b!301553 m!312789))

(declare-fun m!312791 () Bool)

(assert (=> b!301549 m!312791))

(push 1)

(assert (not start!30124))

(assert (not b!301549))

(assert (not b!301554))

(assert (not b!301550))

(assert (not b!301552))

(assert (not b!301553))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

