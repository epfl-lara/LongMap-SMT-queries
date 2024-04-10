; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30270 () Bool)

(assert start!30270)

(declare-fun b!302947 () Bool)

(declare-fun e!190813 () Bool)

(assert (=> b!302947 (= e!190813 false)))

(declare-datatypes ((array!15376 0))(
  ( (array!15377 (arr!7276 (Array (_ BitVec 32) (_ BitVec 64))) (size!7628 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15376)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2416 0))(
  ( (MissingZero!2416 (index!11840 (_ BitVec 32))) (Found!2416 (index!11841 (_ BitVec 32))) (Intermediate!2416 (undefined!3228 Bool) (index!11842 (_ BitVec 32)) (x!30105 (_ BitVec 32))) (Undefined!2416) (MissingVacant!2416 (index!11843 (_ BitVec 32))) )
))
(declare-fun lt!150150 () SeekEntryResult!2416)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15376 (_ BitVec 32)) SeekEntryResult!2416)

(assert (=> b!302947 (= lt!150150 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!302948 () Bool)

(declare-fun res!160434 () Bool)

(assert (=> b!302948 (=> (not res!160434) (not e!190813))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302948 (= res!160434 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2416 false resIndex!52 resX!52)))))

(declare-fun b!302949 () Bool)

(declare-fun res!160437 () Bool)

(assert (=> b!302949 (=> (not res!160437) (not e!190813))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!302949 (= res!160437 (and (= (select (arr!7276 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7628 a!3293))))))

(declare-fun b!302950 () Bool)

(declare-fun res!160433 () Bool)

(assert (=> b!302950 (=> (not res!160433) (not e!190813))))

(assert (=> b!302950 (= res!160433 (and (= (size!7628 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7628 a!3293))))))

(declare-fun b!302951 () Bool)

(declare-fun res!160436 () Bool)

(assert (=> b!302951 (=> (not res!160436) (not e!190813))))

(declare-fun arrayContainsKey!0 (array!15376 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302951 (= res!160436 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!302953 () Bool)

(declare-fun res!160440 () Bool)

(assert (=> b!302953 (=> (not res!160440) (not e!190813))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15376 (_ BitVec 32)) Bool)

(assert (=> b!302953 (= res!160440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!302954 () Bool)

(declare-fun res!160435 () Bool)

(assert (=> b!302954 (=> (not res!160435) (not e!190813))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302954 (= res!160435 (validKeyInArray!0 k!2441))))

(declare-fun b!302952 () Bool)

(declare-fun res!160439 () Bool)

(assert (=> b!302952 (=> (not res!160439) (not e!190813))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15376 (_ BitVec 32)) SeekEntryResult!2416)

(assert (=> b!302952 (= res!160439 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2416 i!1240)))))

(declare-fun res!160438 () Bool)

(assert (=> start!30270 (=> (not res!160438) (not e!190813))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30270 (= res!160438 (validMask!0 mask!3709))))

(assert (=> start!30270 e!190813))

(declare-fun array_inv!5239 (array!15376) Bool)

(assert (=> start!30270 (array_inv!5239 a!3293)))

(assert (=> start!30270 true))

(assert (= (and start!30270 res!160438) b!302950))

(assert (= (and b!302950 res!160433) b!302954))

(assert (= (and b!302954 res!160435) b!302951))

(assert (= (and b!302951 res!160436) b!302952))

(assert (= (and b!302952 res!160439) b!302953))

(assert (= (and b!302953 res!160440) b!302948))

(assert (= (and b!302948 res!160434) b!302949))

(assert (= (and b!302949 res!160437) b!302947))

(declare-fun m!314385 () Bool)

(assert (=> b!302947 m!314385))

(declare-fun m!314387 () Bool)

(assert (=> b!302953 m!314387))

(declare-fun m!314389 () Bool)

(assert (=> b!302951 m!314389))

(declare-fun m!314391 () Bool)

(assert (=> start!30270 m!314391))

(declare-fun m!314393 () Bool)

(assert (=> start!30270 m!314393))

(declare-fun m!314395 () Bool)

(assert (=> b!302954 m!314395))

(declare-fun m!314397 () Bool)

(assert (=> b!302948 m!314397))

(assert (=> b!302948 m!314397))

(declare-fun m!314399 () Bool)

(assert (=> b!302948 m!314399))

(declare-fun m!314401 () Bool)

(assert (=> b!302949 m!314401))

(declare-fun m!314403 () Bool)

(assert (=> b!302952 m!314403))

(push 1)

(assert (not b!302947))

(assert (not b!302953))

(assert (not start!30270))

(assert (not b!302954))

(assert (not b!302952))

(assert (not b!302951))

(assert (not b!302948))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

