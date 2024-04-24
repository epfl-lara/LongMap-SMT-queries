; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30232 () Bool)

(assert start!30232)

(declare-fun b!302588 () Bool)

(declare-fun res!160130 () Bool)

(declare-fun e!190689 () Bool)

(assert (=> b!302588 (=> (not res!160130) (not e!190689))))

(declare-datatypes ((array!15351 0))(
  ( (array!15352 (arr!7263 (Array (_ BitVec 32) (_ BitVec 64))) (size!7615 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15351)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!302588 (= res!160130 (and (= (select (arr!7263 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7615 a!3293))))))

(declare-fun b!302589 () Bool)

(declare-fun res!160127 () Bool)

(assert (=> b!302589 (=> (not res!160127) (not e!190689))))

(declare-fun mask!3709 () (_ BitVec 32))

(assert (=> b!302589 (= res!160127 (and (= (size!7615 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7615 a!3293))))))

(declare-fun b!302590 () Bool)

(declare-fun res!160125 () Bool)

(assert (=> b!302590 (=> (not res!160125) (not e!190689))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15351 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302590 (= res!160125 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!302591 () Bool)

(assert (=> b!302591 (= e!190689 false)))

(declare-datatypes ((SeekEntryResult!2368 0))(
  ( (MissingZero!2368 (index!11648 (_ BitVec 32))) (Found!2368 (index!11649 (_ BitVec 32))) (Intermediate!2368 (undefined!3180 Bool) (index!11650 (_ BitVec 32)) (x!30022 (_ BitVec 32))) (Undefined!2368) (MissingVacant!2368 (index!11651 (_ BitVec 32))) )
))
(declare-fun lt!150132 () SeekEntryResult!2368)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15351 (_ BitVec 32)) SeekEntryResult!2368)

(assert (=> b!302591 (= lt!150132 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!302592 () Bool)

(declare-fun res!160126 () Bool)

(assert (=> b!302592 (=> (not res!160126) (not e!190689))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302592 (= res!160126 (validKeyInArray!0 k!2441))))

(declare-fun b!302593 () Bool)

(declare-fun res!160124 () Bool)

(assert (=> b!302593 (=> (not res!160124) (not e!190689))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15351 (_ BitVec 32)) Bool)

(assert (=> b!302593 (= res!160124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!302595 () Bool)

(declare-fun res!160129 () Bool)

(assert (=> b!302595 (=> (not res!160129) (not e!190689))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302595 (= res!160129 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2368 false resIndex!52 resX!52)))))

(declare-fun b!302594 () Bool)

(declare-fun res!160128 () Bool)

(assert (=> b!302594 (=> (not res!160128) (not e!190689))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15351 (_ BitVec 32)) SeekEntryResult!2368)

(assert (=> b!302594 (= res!160128 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2368 i!1240)))))

(declare-fun res!160131 () Bool)

(assert (=> start!30232 (=> (not res!160131) (not e!190689))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30232 (= res!160131 (validMask!0 mask!3709))))

(assert (=> start!30232 e!190689))

(declare-fun array_inv!5213 (array!15351) Bool)

(assert (=> start!30232 (array_inv!5213 a!3293)))

(assert (=> start!30232 true))

(assert (= (and start!30232 res!160131) b!302589))

(assert (= (and b!302589 res!160127) b!302592))

(assert (= (and b!302592 res!160126) b!302590))

(assert (= (and b!302590 res!160125) b!302594))

(assert (= (and b!302594 res!160128) b!302593))

(assert (= (and b!302593 res!160124) b!302595))

(assert (= (and b!302595 res!160129) b!302588))

(assert (= (and b!302588 res!160130) b!302591))

(declare-fun m!314243 () Bool)

(assert (=> b!302590 m!314243))

(declare-fun m!314245 () Bool)

(assert (=> b!302595 m!314245))

(assert (=> b!302595 m!314245))

(declare-fun m!314247 () Bool)

(assert (=> b!302595 m!314247))

(declare-fun m!314249 () Bool)

(assert (=> start!30232 m!314249))

(declare-fun m!314251 () Bool)

(assert (=> start!30232 m!314251))

(declare-fun m!314253 () Bool)

(assert (=> b!302593 m!314253))

(declare-fun m!314255 () Bool)

(assert (=> b!302591 m!314255))

(declare-fun m!314257 () Bool)

(assert (=> b!302592 m!314257))

(declare-fun m!314259 () Bool)

(assert (=> b!302594 m!314259))

(declare-fun m!314261 () Bool)

(assert (=> b!302588 m!314261))

(push 1)

(assert (not b!302593))

(assert (not b!302595))

(assert (not b!302590))

(assert (not start!30232))

(assert (not b!302594))

(assert (not b!302592))

(assert (not b!302591))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

