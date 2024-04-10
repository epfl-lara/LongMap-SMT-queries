; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30290 () Bool)

(assert start!30290)

(declare-fun b!303207 () Bool)

(declare-fun res!160701 () Bool)

(declare-fun e!190893 () Bool)

(assert (=> b!303207 (=> (not res!160701) (not e!190893))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303207 (= res!160701 (validKeyInArray!0 k!2441))))

(declare-fun b!303208 () Bool)

(declare-fun res!160699 () Bool)

(declare-fun e!190894 () Bool)

(assert (=> b!303208 (=> (not res!160699) (not e!190894))))

(declare-datatypes ((array!15396 0))(
  ( (array!15397 (arr!7286 (Array (_ BitVec 32) (_ BitVec 64))) (size!7638 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15396)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2426 0))(
  ( (MissingZero!2426 (index!11880 (_ BitVec 32))) (Found!2426 (index!11881 (_ BitVec 32))) (Intermediate!2426 (undefined!3238 Bool) (index!11882 (_ BitVec 32)) (x!30147 (_ BitVec 32))) (Undefined!2426) (MissingVacant!2426 (index!11883 (_ BitVec 32))) )
))
(declare-fun lt!150180 () SeekEntryResult!2426)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15396 (_ BitVec 32)) SeekEntryResult!2426)

(assert (=> b!303208 (= res!160699 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150180))))

(declare-fun b!303209 () Bool)

(declare-fun res!160694 () Bool)

(assert (=> b!303209 (=> (not res!160694) (not e!190893))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!303209 (= res!160694 (and (= (size!7638 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7638 a!3293))))))

(declare-fun b!303210 () Bool)

(declare-fun res!160698 () Bool)

(assert (=> b!303210 (=> (not res!160698) (not e!190893))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15396 (_ BitVec 32)) SeekEntryResult!2426)

(assert (=> b!303210 (= res!160698 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2426 i!1240)))))

(declare-fun b!303211 () Bool)

(declare-fun res!160697 () Bool)

(assert (=> b!303211 (=> (not res!160697) (not e!190893))))

(declare-fun arrayContainsKey!0 (array!15396 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303211 (= res!160697 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun b!303212 () Bool)

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!303212 (= e!190894 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7286 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7286 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7286 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsgt x!1427 #b01111111111111111111111111111110)))))

(declare-fun res!160695 () Bool)

(assert (=> start!30290 (=> (not res!160695) (not e!190893))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30290 (= res!160695 (validMask!0 mask!3709))))

(assert (=> start!30290 e!190893))

(declare-fun array_inv!5249 (array!15396) Bool)

(assert (=> start!30290 (array_inv!5249 a!3293)))

(assert (=> start!30290 true))

(declare-fun b!303213 () Bool)

(assert (=> b!303213 (= e!190893 e!190894)))

(declare-fun res!160700 () Bool)

(assert (=> b!303213 (=> (not res!160700) (not e!190894))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303213 (= res!160700 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150180))))

(assert (=> b!303213 (= lt!150180 (Intermediate!2426 false resIndex!52 resX!52))))

(declare-fun b!303214 () Bool)

(declare-fun res!160696 () Bool)

(assert (=> b!303214 (=> (not res!160696) (not e!190893))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15396 (_ BitVec 32)) Bool)

(assert (=> b!303214 (= res!160696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303215 () Bool)

(declare-fun res!160693 () Bool)

(assert (=> b!303215 (=> (not res!160693) (not e!190894))))

(assert (=> b!303215 (= res!160693 (and (= (select (arr!7286 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7638 a!3293))))))

(assert (= (and start!30290 res!160695) b!303209))

(assert (= (and b!303209 res!160694) b!303207))

(assert (= (and b!303207 res!160701) b!303211))

(assert (= (and b!303211 res!160697) b!303210))

(assert (= (and b!303210 res!160698) b!303214))

(assert (= (and b!303214 res!160696) b!303213))

(assert (= (and b!303213 res!160700) b!303215))

(assert (= (and b!303215 res!160693) b!303208))

(assert (= (and b!303208 res!160699) b!303212))

(declare-fun m!314597 () Bool)

(assert (=> b!303214 m!314597))

(declare-fun m!314599 () Bool)

(assert (=> start!30290 m!314599))

(declare-fun m!314601 () Bool)

(assert (=> start!30290 m!314601))

(declare-fun m!314603 () Bool)

(assert (=> b!303210 m!314603))

(declare-fun m!314605 () Bool)

(assert (=> b!303207 m!314605))

(declare-fun m!314607 () Bool)

(assert (=> b!303212 m!314607))

(declare-fun m!314609 () Bool)

(assert (=> b!303215 m!314609))

(declare-fun m!314611 () Bool)

(assert (=> b!303211 m!314611))

(declare-fun m!314613 () Bool)

(assert (=> b!303208 m!314613))

(declare-fun m!314615 () Bool)

(assert (=> b!303213 m!314615))

(assert (=> b!303213 m!314615))

(declare-fun m!314617 () Bool)

(assert (=> b!303213 m!314617))

(push 1)
