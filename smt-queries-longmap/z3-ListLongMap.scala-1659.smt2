; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30790 () Bool)

(assert start!30790)

(declare-fun b!309039 () Bool)

(declare-fun res!165658 () Bool)

(declare-fun e!193136 () Bool)

(assert (=> b!309039 (=> (not res!165658) (not e!193136))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-datatypes ((array!15743 0))(
  ( (array!15744 (arr!7455 (Array (_ BitVec 32) (_ BitVec 64))) (size!7807 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15743)

(assert (=> b!309039 (= res!165658 (and (= (select (arr!7455 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7807 a!3293))))))

(declare-fun b!309040 () Bool)

(declare-fun e!193135 () Bool)

(assert (=> b!309040 (= e!193135 e!193136)))

(declare-fun res!165652 () Bool)

(assert (=> b!309040 (=> (not res!165652) (not e!193136))))

(declare-datatypes ((SeekEntryResult!2595 0))(
  ( (MissingZero!2595 (index!12556 (_ BitVec 32))) (Found!2595 (index!12557 (_ BitVec 32))) (Intermediate!2595 (undefined!3407 Bool) (index!12558 (_ BitVec 32)) (x!30791 (_ BitVec 32))) (Undefined!2595) (MissingVacant!2595 (index!12559 (_ BitVec 32))) )
))
(declare-fun lt!151500 () SeekEntryResult!2595)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15743 (_ BitVec 32)) SeekEntryResult!2595)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309040 (= res!165652 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151500))))

(assert (=> b!309040 (= lt!151500 (Intermediate!2595 false resIndex!52 resX!52))))

(declare-fun res!165660 () Bool)

(assert (=> start!30790 (=> (not res!165660) (not e!193135))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30790 (= res!165660 (validMask!0 mask!3709))))

(assert (=> start!30790 e!193135))

(declare-fun array_inv!5418 (array!15743) Bool)

(assert (=> start!30790 (array_inv!5418 a!3293)))

(assert (=> start!30790 true))

(declare-fun b!309041 () Bool)

(declare-fun res!165659 () Bool)

(assert (=> b!309041 (=> (not res!165659) (not e!193135))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15743 (_ BitVec 32)) Bool)

(assert (=> b!309041 (= res!165659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!309042 () Bool)

(declare-fun e!193137 () Bool)

(assert (=> b!309042 (= e!193136 e!193137)))

(declare-fun res!165654 () Bool)

(assert (=> b!309042 (=> (not res!165654) (not e!193137))))

(declare-fun lt!151499 () SeekEntryResult!2595)

(assert (=> b!309042 (= res!165654 (and (= lt!151499 lt!151500) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7455 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!309042 (= lt!151499 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!309043 () Bool)

(declare-fun res!165653 () Bool)

(assert (=> b!309043 (=> (not res!165653) (not e!193135))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15743 (_ BitVec 32)) SeekEntryResult!2595)

(assert (=> b!309043 (= res!165653 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2595 i!1240)))))

(declare-fun b!309044 () Bool)

(declare-fun res!165657 () Bool)

(assert (=> b!309044 (=> (not res!165657) (not e!193135))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!309044 (= res!165657 (validKeyInArray!0 k0!2441))))

(declare-fun b!309045 () Bool)

(assert (=> b!309045 (= e!193137 (not true))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309045 (= lt!151499 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!309046 () Bool)

(declare-fun res!165656 () Bool)

(assert (=> b!309046 (=> (not res!165656) (not e!193135))))

(assert (=> b!309046 (= res!165656 (and (= (size!7807 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7807 a!3293))))))

(declare-fun b!309047 () Bool)

(declare-fun res!165655 () Bool)

(assert (=> b!309047 (=> (not res!165655) (not e!193135))))

(declare-fun arrayContainsKey!0 (array!15743 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!309047 (= res!165655 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30790 res!165660) b!309046))

(assert (= (and b!309046 res!165656) b!309044))

(assert (= (and b!309044 res!165657) b!309047))

(assert (= (and b!309047 res!165655) b!309043))

(assert (= (and b!309043 res!165653) b!309041))

(assert (= (and b!309041 res!165659) b!309040))

(assert (= (and b!309040 res!165652) b!309039))

(assert (= (and b!309039 res!165658) b!309042))

(assert (= (and b!309042 res!165654) b!309045))

(declare-fun m!319057 () Bool)

(assert (=> b!309044 m!319057))

(declare-fun m!319059 () Bool)

(assert (=> b!309042 m!319059))

(declare-fun m!319061 () Bool)

(assert (=> b!309042 m!319061))

(declare-fun m!319063 () Bool)

(assert (=> b!309041 m!319063))

(declare-fun m!319065 () Bool)

(assert (=> b!309040 m!319065))

(assert (=> b!309040 m!319065))

(declare-fun m!319067 () Bool)

(assert (=> b!309040 m!319067))

(declare-fun m!319069 () Bool)

(assert (=> b!309039 m!319069))

(declare-fun m!319071 () Bool)

(assert (=> b!309045 m!319071))

(assert (=> b!309045 m!319071))

(declare-fun m!319073 () Bool)

(assert (=> b!309045 m!319073))

(declare-fun m!319075 () Bool)

(assert (=> b!309043 m!319075))

(declare-fun m!319077 () Bool)

(assert (=> b!309047 m!319077))

(declare-fun m!319079 () Bool)

(assert (=> start!30790 m!319079))

(declare-fun m!319081 () Bool)

(assert (=> start!30790 m!319081))

(check-sat (not b!309041) (not b!309047) (not start!30790) (not b!309045) (not b!309040) (not b!309042) (not b!309044) (not b!309043))
(check-sat)
