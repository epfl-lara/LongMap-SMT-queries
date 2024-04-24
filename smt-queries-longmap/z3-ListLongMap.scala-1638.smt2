; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30594 () Bool)

(assert start!30594)

(declare-fun b!307015 () Bool)

(declare-fun res!163819 () Bool)

(declare-fun e!192363 () Bool)

(assert (=> b!307015 (=> (not res!163819) (not e!192363))))

(declare-datatypes ((array!15611 0))(
  ( (array!15612 (arr!7390 (Array (_ BitVec 32) (_ BitVec 64))) (size!7742 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15611)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15611 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307015 (= res!163819 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!307016 () Bool)

(declare-fun e!192361 () Bool)

(assert (=> b!307016 (= e!192363 e!192361)))

(declare-fun res!163820 () Bool)

(assert (=> b!307016 (=> (not res!163820) (not e!192361))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2495 0))(
  ( (MissingZero!2495 (index!12156 (_ BitVec 32))) (Found!2495 (index!12157 (_ BitVec 32))) (Intermediate!2495 (undefined!3307 Bool) (index!12158 (_ BitVec 32)) (x!30511 (_ BitVec 32))) (Undefined!2495) (MissingVacant!2495 (index!12159 (_ BitVec 32))) )
))
(declare-fun lt!151107 () SeekEntryResult!2495)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15611 (_ BitVec 32)) SeekEntryResult!2495)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307016 (= res!163820 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151107))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!307016 (= lt!151107 (Intermediate!2495 false resIndex!52 resX!52))))

(declare-fun b!307017 () Bool)

(declare-fun res!163822 () Bool)

(assert (=> b!307017 (=> (not res!163822) (not e!192363))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15611 (_ BitVec 32)) SeekEntryResult!2495)

(assert (=> b!307017 (= res!163822 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2495 i!1240)))))

(declare-fun b!307018 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!307018 (= e!192361 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7390 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52)) (bvslt mask!3709 #b00000000000000000000000000000000)))))

(declare-fun b!307019 () Bool)

(declare-fun res!163825 () Bool)

(assert (=> b!307019 (=> (not res!163825) (not e!192361))))

(assert (=> b!307019 (= res!163825 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!151107))))

(declare-fun b!307020 () Bool)

(declare-fun res!163823 () Bool)

(assert (=> b!307020 (=> (not res!163823) (not e!192363))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307020 (= res!163823 (validKeyInArray!0 k0!2441))))

(declare-fun res!163824 () Bool)

(assert (=> start!30594 (=> (not res!163824) (not e!192363))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30594 (= res!163824 (validMask!0 mask!3709))))

(assert (=> start!30594 e!192363))

(declare-fun array_inv!5340 (array!15611) Bool)

(assert (=> start!30594 (array_inv!5340 a!3293)))

(assert (=> start!30594 true))

(declare-fun b!307021 () Bool)

(declare-fun res!163821 () Bool)

(assert (=> b!307021 (=> (not res!163821) (not e!192363))))

(assert (=> b!307021 (= res!163821 (and (= (size!7742 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7742 a!3293))))))

(declare-fun b!307022 () Bool)

(declare-fun res!163827 () Bool)

(assert (=> b!307022 (=> (not res!163827) (not e!192363))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15611 (_ BitVec 32)) Bool)

(assert (=> b!307022 (= res!163827 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307023 () Bool)

(declare-fun res!163826 () Bool)

(assert (=> b!307023 (=> (not res!163826) (not e!192361))))

(assert (=> b!307023 (= res!163826 (and (= (select (arr!7390 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7742 a!3293))))))

(assert (= (and start!30594 res!163824) b!307021))

(assert (= (and b!307021 res!163821) b!307020))

(assert (= (and b!307020 res!163823) b!307015))

(assert (= (and b!307015 res!163819) b!307017))

(assert (= (and b!307017 res!163822) b!307022))

(assert (= (and b!307022 res!163827) b!307016))

(assert (= (and b!307016 res!163820) b!307023))

(assert (= (and b!307023 res!163826) b!307019))

(assert (= (and b!307019 res!163825) b!307018))

(declare-fun m!317563 () Bool)

(assert (=> start!30594 m!317563))

(declare-fun m!317565 () Bool)

(assert (=> start!30594 m!317565))

(declare-fun m!317567 () Bool)

(assert (=> b!307015 m!317567))

(declare-fun m!317569 () Bool)

(assert (=> b!307017 m!317569))

(declare-fun m!317571 () Bool)

(assert (=> b!307016 m!317571))

(assert (=> b!307016 m!317571))

(declare-fun m!317573 () Bool)

(assert (=> b!307016 m!317573))

(declare-fun m!317575 () Bool)

(assert (=> b!307019 m!317575))

(declare-fun m!317577 () Bool)

(assert (=> b!307023 m!317577))

(declare-fun m!317579 () Bool)

(assert (=> b!307018 m!317579))

(declare-fun m!317581 () Bool)

(assert (=> b!307022 m!317581))

(declare-fun m!317583 () Bool)

(assert (=> b!307020 m!317583))

(check-sat (not b!307017) (not start!30594) (not b!307022) (not b!307019) (not b!307016) (not b!307020) (not b!307015))
(check-sat)
