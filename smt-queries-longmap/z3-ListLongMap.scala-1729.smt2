; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31828 () Bool)

(assert start!31828)

(declare-fun b!318062 () Bool)

(declare-fun e!197676 () Bool)

(assert (=> b!318062 (= e!197676 (not true))))

(declare-fun e!197678 () Bool)

(assert (=> b!318062 e!197678))

(declare-fun res!172646 () Bool)

(assert (=> b!318062 (=> (not res!172646) (not e!197678))))

(declare-datatypes ((array!16199 0))(
  ( (array!16200 (arr!7665 (Array (_ BitVec 32) (_ BitVec 64))) (size!8017 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16199)

(declare-datatypes ((SeekEntryResult!2805 0))(
  ( (MissingZero!2805 (index!13396 (_ BitVec 32))) (Found!2805 (index!13397 (_ BitVec 32))) (Intermediate!2805 (undefined!3617 Bool) (index!13398 (_ BitVec 32)) (x!31654 (_ BitVec 32))) (Undefined!2805) (MissingVacant!2805 (index!13399 (_ BitVec 32))) )
))
(declare-fun lt!155202 () SeekEntryResult!2805)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun lt!155199 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16199 (_ BitVec 32)) SeekEntryResult!2805)

(assert (=> b!318062 (= res!172646 (= lt!155202 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155199 k0!2441 a!3293 mask!3709)))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318062 (= lt!155199 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!318063 () Bool)

(declare-fun res!172643 () Bool)

(declare-fun e!197677 () Bool)

(assert (=> b!318063 (=> (not res!172643) (not e!197677))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!318063 (= res!172643 (validKeyInArray!0 k0!2441))))

(declare-fun b!318064 () Bool)

(declare-fun lt!155201 () array!16199)

(assert (=> b!318064 (= e!197678 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!155201 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155199 k0!2441 lt!155201 mask!3709)))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!318064 (= lt!155201 (array!16200 (store (arr!7665 a!3293) i!1240 k0!2441) (size!8017 a!3293)))))

(declare-fun b!318065 () Bool)

(declare-fun res!172647 () Bool)

(assert (=> b!318065 (=> (not res!172647) (not e!197677))))

(declare-fun arrayContainsKey!0 (array!16199 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!318065 (= res!172647 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!318066 () Bool)

(declare-fun e!197679 () Bool)

(assert (=> b!318066 (= e!197677 e!197679)))

(declare-fun res!172648 () Bool)

(assert (=> b!318066 (=> (not res!172648) (not e!197679))))

(declare-fun lt!155200 () SeekEntryResult!2805)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318066 (= res!172648 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!155200))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!318066 (= lt!155200 (Intermediate!2805 false resIndex!52 resX!52))))

(declare-fun res!172645 () Bool)

(assert (=> start!31828 (=> (not res!172645) (not e!197677))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31828 (= res!172645 (validMask!0 mask!3709))))

(assert (=> start!31828 e!197677))

(declare-fun array_inv!5628 (array!16199) Bool)

(assert (=> start!31828 (array_inv!5628 a!3293)))

(assert (=> start!31828 true))

(declare-fun b!318067 () Bool)

(assert (=> b!318067 (= e!197679 e!197676)))

(declare-fun res!172649 () Bool)

(assert (=> b!318067 (=> (not res!172649) (not e!197676))))

(assert (=> b!318067 (= res!172649 (and (= lt!155202 lt!155200) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7665 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!318067 (= lt!155202 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!318068 () Bool)

(declare-fun res!172644 () Bool)

(assert (=> b!318068 (=> (not res!172644) (not e!197677))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16199 (_ BitVec 32)) SeekEntryResult!2805)

(assert (=> b!318068 (= res!172644 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2805 i!1240)))))

(declare-fun b!318069 () Bool)

(declare-fun res!172641 () Bool)

(assert (=> b!318069 (=> (not res!172641) (not e!197677))))

(assert (=> b!318069 (= res!172641 (and (= (size!8017 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8017 a!3293))))))

(declare-fun b!318070 () Bool)

(declare-fun res!172650 () Bool)

(assert (=> b!318070 (=> (not res!172650) (not e!197679))))

(assert (=> b!318070 (= res!172650 (and (= (select (arr!7665 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8017 a!3293))))))

(declare-fun b!318071 () Bool)

(declare-fun res!172642 () Bool)

(assert (=> b!318071 (=> (not res!172642) (not e!197677))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16199 (_ BitVec 32)) Bool)

(assert (=> b!318071 (= res!172642 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!31828 res!172645) b!318069))

(assert (= (and b!318069 res!172641) b!318063))

(assert (= (and b!318063 res!172643) b!318065))

(assert (= (and b!318065 res!172647) b!318068))

(assert (= (and b!318068 res!172644) b!318071))

(assert (= (and b!318071 res!172642) b!318066))

(assert (= (and b!318066 res!172648) b!318070))

(assert (= (and b!318070 res!172650) b!318067))

(assert (= (and b!318067 res!172649) b!318062))

(assert (= (and b!318062 res!172646) b!318064))

(declare-fun m!326737 () Bool)

(assert (=> start!31828 m!326737))

(declare-fun m!326739 () Bool)

(assert (=> start!31828 m!326739))

(declare-fun m!326741 () Bool)

(assert (=> b!318068 m!326741))

(declare-fun m!326743 () Bool)

(assert (=> b!318067 m!326743))

(declare-fun m!326745 () Bool)

(assert (=> b!318067 m!326745))

(declare-fun m!326747 () Bool)

(assert (=> b!318070 m!326747))

(declare-fun m!326749 () Bool)

(assert (=> b!318071 m!326749))

(declare-fun m!326751 () Bool)

(assert (=> b!318065 m!326751))

(declare-fun m!326753 () Bool)

(assert (=> b!318062 m!326753))

(declare-fun m!326755 () Bool)

(assert (=> b!318062 m!326755))

(declare-fun m!326757 () Bool)

(assert (=> b!318064 m!326757))

(declare-fun m!326759 () Bool)

(assert (=> b!318064 m!326759))

(declare-fun m!326761 () Bool)

(assert (=> b!318064 m!326761))

(declare-fun m!326763 () Bool)

(assert (=> b!318063 m!326763))

(declare-fun m!326765 () Bool)

(assert (=> b!318066 m!326765))

(assert (=> b!318066 m!326765))

(declare-fun m!326767 () Bool)

(assert (=> b!318066 m!326767))

(check-sat (not b!318062) (not b!318068) (not b!318065) (not b!318066) (not b!318067) (not b!318063) (not b!318071) (not b!318064) (not start!31828))
(check-sat)
