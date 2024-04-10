; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31822 () Bool)

(assert start!31822)

(declare-fun b!317972 () Bool)

(declare-fun e!197632 () Bool)

(declare-fun e!197635 () Bool)

(assert (=> b!317972 (= e!197632 e!197635)))

(declare-fun res!172551 () Bool)

(assert (=> b!317972 (=> (not res!172551) (not e!197635))))

(declare-datatypes ((array!16193 0))(
  ( (array!16194 (arr!7662 (Array (_ BitVec 32) (_ BitVec 64))) (size!8014 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16193)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2802 0))(
  ( (MissingZero!2802 (index!13384 (_ BitVec 32))) (Found!2802 (index!13385 (_ BitVec 32))) (Intermediate!2802 (undefined!3614 Bool) (index!13386 (_ BitVec 32)) (x!31643 (_ BitVec 32))) (Undefined!2802) (MissingVacant!2802 (index!13387 (_ BitVec 32))) )
))
(declare-fun lt!155166 () SeekEntryResult!2802)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16193 (_ BitVec 32)) SeekEntryResult!2802)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317972 (= res!172551 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!155166))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!317972 (= lt!155166 (Intermediate!2802 false resIndex!52 resX!52))))

(declare-fun res!172558 () Bool)

(assert (=> start!31822 (=> (not res!172558) (not e!197632))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31822 (= res!172558 (validMask!0 mask!3709))))

(assert (=> start!31822 e!197632))

(declare-fun array_inv!5625 (array!16193) Bool)

(assert (=> start!31822 (array_inv!5625 a!3293)))

(assert (=> start!31822 true))

(declare-fun b!317973 () Bool)

(declare-fun res!172553 () Bool)

(assert (=> b!317973 (=> (not res!172553) (not e!197632))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!317973 (= res!172553 (validKeyInArray!0 k0!2441))))

(declare-fun b!317974 () Bool)

(declare-fun res!172560 () Bool)

(assert (=> b!317974 (=> (not res!172560) (not e!197632))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!317974 (= res!172560 (and (= (size!8014 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8014 a!3293))))))

(declare-fun e!197634 () Bool)

(declare-fun lt!155165 () array!16193)

(declare-fun b!317975 () Bool)

(declare-fun lt!155164 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!317975 (= e!197634 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!155165 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155164 k0!2441 lt!155165 mask!3709)))))

(assert (=> b!317975 (= lt!155165 (array!16194 (store (arr!7662 a!3293) i!1240 k0!2441) (size!8014 a!3293)))))

(declare-fun b!317976 () Bool)

(declare-fun res!172556 () Bool)

(assert (=> b!317976 (=> (not res!172556) (not e!197632))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16193 (_ BitVec 32)) SeekEntryResult!2802)

(assert (=> b!317976 (= res!172556 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2802 i!1240)))))

(declare-fun b!317977 () Bool)

(declare-fun e!197631 () Bool)

(assert (=> b!317977 (= e!197631 (not true))))

(assert (=> b!317977 e!197634))

(declare-fun res!172555 () Bool)

(assert (=> b!317977 (=> (not res!172555) (not e!197634))))

(declare-fun lt!155163 () SeekEntryResult!2802)

(assert (=> b!317977 (= res!172555 (= lt!155163 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155164 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317977 (= lt!155164 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!317978 () Bool)

(declare-fun res!172552 () Bool)

(assert (=> b!317978 (=> (not res!172552) (not e!197632))))

(declare-fun arrayContainsKey!0 (array!16193 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!317978 (= res!172552 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!317979 () Bool)

(assert (=> b!317979 (= e!197635 e!197631)))

(declare-fun res!172554 () Bool)

(assert (=> b!317979 (=> (not res!172554) (not e!197631))))

(assert (=> b!317979 (= res!172554 (and (= lt!155163 lt!155166) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7662 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!317979 (= lt!155163 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!317980 () Bool)

(declare-fun res!172557 () Bool)

(assert (=> b!317980 (=> (not res!172557) (not e!197632))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16193 (_ BitVec 32)) Bool)

(assert (=> b!317980 (= res!172557 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!317981 () Bool)

(declare-fun res!172559 () Bool)

(assert (=> b!317981 (=> (not res!172559) (not e!197635))))

(assert (=> b!317981 (= res!172559 (and (= (select (arr!7662 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8014 a!3293))))))

(assert (= (and start!31822 res!172558) b!317974))

(assert (= (and b!317974 res!172560) b!317973))

(assert (= (and b!317973 res!172553) b!317978))

(assert (= (and b!317978 res!172552) b!317976))

(assert (= (and b!317976 res!172556) b!317980))

(assert (= (and b!317980 res!172557) b!317972))

(assert (= (and b!317972 res!172551) b!317981))

(assert (= (and b!317981 res!172559) b!317979))

(assert (= (and b!317979 res!172554) b!317977))

(assert (= (and b!317977 res!172555) b!317975))

(declare-fun m!326641 () Bool)

(assert (=> b!317976 m!326641))

(declare-fun m!326643 () Bool)

(assert (=> b!317979 m!326643))

(declare-fun m!326645 () Bool)

(assert (=> b!317979 m!326645))

(declare-fun m!326647 () Bool)

(assert (=> start!31822 m!326647))

(declare-fun m!326649 () Bool)

(assert (=> start!31822 m!326649))

(declare-fun m!326651 () Bool)

(assert (=> b!317978 m!326651))

(declare-fun m!326653 () Bool)

(assert (=> b!317977 m!326653))

(declare-fun m!326655 () Bool)

(assert (=> b!317977 m!326655))

(declare-fun m!326657 () Bool)

(assert (=> b!317980 m!326657))

(declare-fun m!326659 () Bool)

(assert (=> b!317981 m!326659))

(declare-fun m!326661 () Bool)

(assert (=> b!317975 m!326661))

(declare-fun m!326663 () Bool)

(assert (=> b!317975 m!326663))

(declare-fun m!326665 () Bool)

(assert (=> b!317975 m!326665))

(declare-fun m!326667 () Bool)

(assert (=> b!317973 m!326667))

(declare-fun m!326669 () Bool)

(assert (=> b!317972 m!326669))

(assert (=> b!317972 m!326669))

(declare-fun m!326671 () Bool)

(assert (=> b!317972 m!326671))

(check-sat (not b!317980) (not b!317979) (not b!317973) (not b!317978) (not start!31822) (not b!317977) (not b!317975) (not b!317972) (not b!317976))
(check-sat)
