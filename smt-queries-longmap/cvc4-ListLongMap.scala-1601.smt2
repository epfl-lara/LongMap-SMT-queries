; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30266 () Bool)

(assert start!30266)

(declare-fun res!160562 () Bool)

(declare-fun e!190818 () Bool)

(assert (=> start!30266 (=> (not res!160562) (not e!190818))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30266 (= res!160562 (validMask!0 mask!3709))))

(assert (=> start!30266 e!190818))

(declare-datatypes ((array!15385 0))(
  ( (array!15386 (arr!7280 (Array (_ BitVec 32) (_ BitVec 64))) (size!7632 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15385)

(declare-fun array_inv!5230 (array!15385) Bool)

(assert (=> start!30266 (array_inv!5230 a!3293)))

(assert (=> start!30266 true))

(declare-fun b!303023 () Bool)

(declare-fun res!160564 () Bool)

(assert (=> b!303023 (=> (not res!160564) (not e!190818))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303023 (= res!160564 (validKeyInArray!0 k!2441))))

(declare-fun b!303024 () Bool)

(declare-fun res!160565 () Bool)

(assert (=> b!303024 (=> (not res!160565) (not e!190818))))

(declare-fun arrayContainsKey!0 (array!15385 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303024 (= res!160565 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!303025 () Bool)

(assert (=> b!303025 (= e!190818 false)))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2385 0))(
  ( (MissingZero!2385 (index!11716 (_ BitVec 32))) (Found!2385 (index!11717 (_ BitVec 32))) (Intermediate!2385 (undefined!3197 Bool) (index!11718 (_ BitVec 32)) (x!30087 (_ BitVec 32))) (Undefined!2385) (MissingVacant!2385 (index!11719 (_ BitVec 32))) )
))
(declare-fun lt!150183 () SeekEntryResult!2385)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15385 (_ BitVec 32)) SeekEntryResult!2385)

(assert (=> b!303025 (= lt!150183 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!303026 () Bool)

(declare-fun res!160559 () Bool)

(assert (=> b!303026 (=> (not res!160559) (not e!190818))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303026 (= res!160559 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2385 false resIndex!52 resX!52)))))

(declare-fun b!303027 () Bool)

(declare-fun res!160566 () Bool)

(assert (=> b!303027 (=> (not res!160566) (not e!190818))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!303027 (= res!160566 (and (= (select (arr!7280 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7632 a!3293))))))

(declare-fun b!303028 () Bool)

(declare-fun res!160560 () Bool)

(assert (=> b!303028 (=> (not res!160560) (not e!190818))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15385 (_ BitVec 32)) Bool)

(assert (=> b!303028 (= res!160560 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303029 () Bool)

(declare-fun res!160561 () Bool)

(assert (=> b!303029 (=> (not res!160561) (not e!190818))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15385 (_ BitVec 32)) SeekEntryResult!2385)

(assert (=> b!303029 (= res!160561 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2385 i!1240)))))

(declare-fun b!303030 () Bool)

(declare-fun res!160563 () Bool)

(assert (=> b!303030 (=> (not res!160563) (not e!190818))))

(assert (=> b!303030 (= res!160563 (and (= (size!7632 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7632 a!3293))))))

(assert (= (and start!30266 res!160562) b!303030))

(assert (= (and b!303030 res!160563) b!303023))

(assert (= (and b!303023 res!160564) b!303024))

(assert (= (and b!303024 res!160565) b!303029))

(assert (= (and b!303029 res!160561) b!303028))

(assert (= (and b!303028 res!160560) b!303026))

(assert (= (and b!303026 res!160559) b!303027))

(assert (= (and b!303027 res!160566) b!303025))

(declare-fun m!314601 () Bool)

(assert (=> b!303028 m!314601))

(declare-fun m!314603 () Bool)

(assert (=> b!303029 m!314603))

(declare-fun m!314605 () Bool)

(assert (=> b!303027 m!314605))

(declare-fun m!314607 () Bool)

(assert (=> b!303026 m!314607))

(assert (=> b!303026 m!314607))

(declare-fun m!314609 () Bool)

(assert (=> b!303026 m!314609))

(declare-fun m!314611 () Bool)

(assert (=> start!30266 m!314611))

(declare-fun m!314613 () Bool)

(assert (=> start!30266 m!314613))

(declare-fun m!314615 () Bool)

(assert (=> b!303023 m!314615))

(declare-fun m!314617 () Bool)

(assert (=> b!303025 m!314617))

(declare-fun m!314619 () Bool)

(assert (=> b!303024 m!314619))

(push 1)

(assert (not b!303025))

(assert (not b!303028))

(assert (not b!303026))

(assert (not b!303024))

(assert (not start!30266))

(assert (not b!303023))

(assert (not b!303029))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

