; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30726 () Bool)

(assert start!30726)

(declare-fun b!308073 () Bool)

(declare-fun res!164839 () Bool)

(declare-fun e!192676 () Bool)

(assert (=> b!308073 (=> (not res!164839) (not e!192676))))

(declare-datatypes ((array!15683 0))(
  ( (array!15684 (arr!7425 (Array (_ BitVec 32) (_ BitVec 64))) (size!7778 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15683)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15683 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308073 (= res!164839 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!164841 () Bool)

(assert (=> start!30726 (=> (not res!164841) (not e!192676))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30726 (= res!164841 (validMask!0 mask!3709))))

(assert (=> start!30726 e!192676))

(declare-fun array_inv!5397 (array!15683) Bool)

(assert (=> start!30726 (array_inv!5397 a!3293)))

(assert (=> start!30726 true))

(declare-fun b!308074 () Bool)

(declare-fun res!164834 () Bool)

(assert (=> b!308074 (=> (not res!164834) (not e!192676))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!308074 (= res!164834 (and (= (size!7778 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7778 a!3293))))))

(declare-fun b!308075 () Bool)

(declare-fun res!164835 () Bool)

(declare-fun e!192675 () Bool)

(assert (=> b!308075 (=> (not res!164835) (not e!192675))))

(declare-datatypes ((SeekEntryResult!2564 0))(
  ( (MissingZero!2564 (index!12432 (_ BitVec 32))) (Found!2564 (index!12433 (_ BitVec 32))) (Intermediate!2564 (undefined!3376 Bool) (index!12434 (_ BitVec 32)) (x!30691 (_ BitVec 32))) (Undefined!2564) (MissingVacant!2564 (index!12435 (_ BitVec 32))) )
))
(declare-fun lt!151115 () SeekEntryResult!2564)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15683 (_ BitVec 32)) SeekEntryResult!2564)

(assert (=> b!308075 (= res!164835 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!151115))))

(declare-fun b!308076 () Bool)

(declare-fun lt!151114 () (_ BitVec 32))

(assert (=> b!308076 (= e!192675 (and (bvsge mask!3709 #b00000000000000000000000000000000) (bvsge lt!151114 #b00000000000000000000000000000000) (bvslt lt!151114 (bvadd #b00000000000000000000000000000001 mask!3709)) (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308076 (= lt!151114 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!308077 () Bool)

(declare-fun res!164840 () Bool)

(assert (=> b!308077 (=> (not res!164840) (not e!192676))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15683 (_ BitVec 32)) Bool)

(assert (=> b!308077 (= res!164840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!308078 () Bool)

(declare-fun res!164832 () Bool)

(assert (=> b!308078 (=> (not res!164832) (not e!192676))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308078 (= res!164832 (validKeyInArray!0 k0!2441))))

(declare-fun b!308079 () Bool)

(declare-fun res!164838 () Bool)

(assert (=> b!308079 (=> (not res!164838) (not e!192675))))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!308079 (= res!164838 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7425 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun b!308080 () Bool)

(declare-fun res!164833 () Bool)

(assert (=> b!308080 (=> (not res!164833) (not e!192676))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15683 (_ BitVec 32)) SeekEntryResult!2564)

(assert (=> b!308080 (= res!164833 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2564 i!1240)))))

(declare-fun b!308081 () Bool)

(declare-fun res!164836 () Bool)

(assert (=> b!308081 (=> (not res!164836) (not e!192675))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!308081 (= res!164836 (and (= (select (arr!7425 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7778 a!3293))))))

(declare-fun b!308082 () Bool)

(assert (=> b!308082 (= e!192676 e!192675)))

(declare-fun res!164837 () Bool)

(assert (=> b!308082 (=> (not res!164837) (not e!192675))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308082 (= res!164837 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151115))))

(assert (=> b!308082 (= lt!151115 (Intermediate!2564 false resIndex!52 resX!52))))

(assert (= (and start!30726 res!164841) b!308074))

(assert (= (and b!308074 res!164834) b!308078))

(assert (= (and b!308078 res!164832) b!308073))

(assert (= (and b!308073 res!164839) b!308080))

(assert (= (and b!308080 res!164833) b!308077))

(assert (= (and b!308077 res!164840) b!308082))

(assert (= (and b!308082 res!164837) b!308081))

(assert (= (and b!308081 res!164836) b!308075))

(assert (= (and b!308075 res!164835) b!308079))

(assert (= (and b!308079 res!164838) b!308076))

(declare-fun m!317689 () Bool)

(assert (=> b!308077 m!317689))

(declare-fun m!317691 () Bool)

(assert (=> b!308076 m!317691))

(declare-fun m!317693 () Bool)

(assert (=> b!308073 m!317693))

(declare-fun m!317695 () Bool)

(assert (=> b!308082 m!317695))

(assert (=> b!308082 m!317695))

(declare-fun m!317697 () Bool)

(assert (=> b!308082 m!317697))

(declare-fun m!317699 () Bool)

(assert (=> b!308075 m!317699))

(declare-fun m!317701 () Bool)

(assert (=> b!308081 m!317701))

(declare-fun m!317703 () Bool)

(assert (=> b!308078 m!317703))

(declare-fun m!317705 () Bool)

(assert (=> b!308079 m!317705))

(declare-fun m!317707 () Bool)

(assert (=> start!30726 m!317707))

(declare-fun m!317709 () Bool)

(assert (=> start!30726 m!317709))

(declare-fun m!317711 () Bool)

(assert (=> b!308080 m!317711))

(check-sat (not start!30726) (not b!308077) (not b!308075) (not b!308076) (not b!308073) (not b!308078) (not b!308082) (not b!308080))
(check-sat)
