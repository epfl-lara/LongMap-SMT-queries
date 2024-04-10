; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30796 () Bool)

(assert start!30796)

(declare-fun res!165741 () Bool)

(declare-fun e!193174 () Bool)

(assert (=> start!30796 (=> (not res!165741) (not e!193174))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30796 (= res!165741 (validMask!0 mask!3709))))

(assert (=> start!30796 e!193174))

(declare-datatypes ((array!15749 0))(
  ( (array!15750 (arr!7458 (Array (_ BitVec 32) (_ BitVec 64))) (size!7810 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15749)

(declare-fun array_inv!5421 (array!15749) Bool)

(assert (=> start!30796 (array_inv!5421 a!3293)))

(assert (=> start!30796 true))

(declare-fun b!309120 () Bool)

(declare-fun res!165736 () Bool)

(assert (=> b!309120 (=> (not res!165736) (not e!193174))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!309120 (= res!165736 (validKeyInArray!0 k0!2441))))

(declare-fun b!309121 () Bool)

(declare-fun res!165733 () Bool)

(assert (=> b!309121 (=> (not res!165733) (not e!193174))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!309121 (= res!165733 (and (= (size!7810 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7810 a!3293))))))

(declare-fun b!309122 () Bool)

(declare-fun e!193173 () Bool)

(assert (=> b!309122 (= e!193174 e!193173)))

(declare-fun res!165734 () Bool)

(assert (=> b!309122 (=> (not res!165734) (not e!193173))))

(declare-datatypes ((SeekEntryResult!2598 0))(
  ( (MissingZero!2598 (index!12568 (_ BitVec 32))) (Found!2598 (index!12569 (_ BitVec 32))) (Intermediate!2598 (undefined!3410 Bool) (index!12570 (_ BitVec 32)) (x!30802 (_ BitVec 32))) (Undefined!2598) (MissingVacant!2598 (index!12571 (_ BitVec 32))) )
))
(declare-fun lt!151517 () SeekEntryResult!2598)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15749 (_ BitVec 32)) SeekEntryResult!2598)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309122 (= res!165734 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151517))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!309122 (= lt!151517 (Intermediate!2598 false resIndex!52 resX!52))))

(declare-fun b!309123 () Bool)

(declare-fun e!193172 () Bool)

(assert (=> b!309123 (= e!193172 (not (bvsge mask!3709 #b00000000000000000000000000000000)))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun lt!151518 () SeekEntryResult!2598)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309123 (= lt!151518 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!309124 () Bool)

(declare-fun res!165740 () Bool)

(assert (=> b!309124 (=> (not res!165740) (not e!193173))))

(assert (=> b!309124 (= res!165740 (and (= (select (arr!7458 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7810 a!3293))))))

(declare-fun b!309125 () Bool)

(declare-fun res!165739 () Bool)

(assert (=> b!309125 (=> (not res!165739) (not e!193174))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15749 (_ BitVec 32)) SeekEntryResult!2598)

(assert (=> b!309125 (= res!165739 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2598 i!1240)))))

(declare-fun b!309126 () Bool)

(assert (=> b!309126 (= e!193173 e!193172)))

(declare-fun res!165735 () Bool)

(assert (=> b!309126 (=> (not res!165735) (not e!193172))))

(assert (=> b!309126 (= res!165735 (and (= lt!151518 lt!151517) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7458 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!309126 (= lt!151518 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!309127 () Bool)

(declare-fun res!165738 () Bool)

(assert (=> b!309127 (=> (not res!165738) (not e!193174))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15749 (_ BitVec 32)) Bool)

(assert (=> b!309127 (= res!165738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!309128 () Bool)

(declare-fun res!165737 () Bool)

(assert (=> b!309128 (=> (not res!165737) (not e!193174))))

(declare-fun arrayContainsKey!0 (array!15749 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!309128 (= res!165737 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30796 res!165741) b!309121))

(assert (= (and b!309121 res!165733) b!309120))

(assert (= (and b!309120 res!165736) b!309128))

(assert (= (and b!309128 res!165737) b!309125))

(assert (= (and b!309125 res!165739) b!309127))

(assert (= (and b!309127 res!165738) b!309122))

(assert (= (and b!309122 res!165734) b!309124))

(assert (= (and b!309124 res!165740) b!309126))

(assert (= (and b!309126 res!165735) b!309123))

(declare-fun m!319135 () Bool)

(assert (=> b!309125 m!319135))

(declare-fun m!319137 () Bool)

(assert (=> b!309124 m!319137))

(declare-fun m!319139 () Bool)

(assert (=> b!309122 m!319139))

(assert (=> b!309122 m!319139))

(declare-fun m!319141 () Bool)

(assert (=> b!309122 m!319141))

(declare-fun m!319143 () Bool)

(assert (=> start!30796 m!319143))

(declare-fun m!319145 () Bool)

(assert (=> start!30796 m!319145))

(declare-fun m!319147 () Bool)

(assert (=> b!309128 m!319147))

(declare-fun m!319149 () Bool)

(assert (=> b!309126 m!319149))

(declare-fun m!319151 () Bool)

(assert (=> b!309126 m!319151))

(declare-fun m!319153 () Bool)

(assert (=> b!309120 m!319153))

(declare-fun m!319155 () Bool)

(assert (=> b!309123 m!319155))

(assert (=> b!309123 m!319155))

(declare-fun m!319157 () Bool)

(assert (=> b!309123 m!319157))

(declare-fun m!319159 () Bool)

(assert (=> b!309127 m!319159))

(check-sat (not start!30796) (not b!309122) (not b!309125) (not b!309126) (not b!309127) (not b!309128) (not b!309123) (not b!309120))
(check-sat)
