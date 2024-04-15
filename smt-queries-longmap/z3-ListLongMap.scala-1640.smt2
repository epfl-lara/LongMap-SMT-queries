; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30606 () Bool)

(assert start!30606)

(declare-fun res!163849 () Bool)

(declare-fun e!192265 () Bool)

(assert (=> start!30606 (=> (not res!163849) (not e!192265))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30606 (= res!163849 (validMask!0 mask!3709))))

(assert (=> start!30606 e!192265))

(declare-datatypes ((array!15614 0))(
  ( (array!15615 (arr!7392 (Array (_ BitVec 32) (_ BitVec 64))) (size!7745 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15614)

(declare-fun array_inv!5364 (array!15614) Bool)

(assert (=> start!30606 (array_inv!5364 a!3293)))

(assert (=> start!30606 true))

(declare-fun b!306946 () Bool)

(declare-fun e!192264 () Bool)

(assert (=> b!306946 (= e!192265 e!192264)))

(declare-fun res!163851 () Bool)

(assert (=> b!306946 (=> (not res!163851) (not e!192264))))

(declare-datatypes ((SeekEntryResult!2531 0))(
  ( (MissingZero!2531 (index!12300 (_ BitVec 32))) (Found!2531 (index!12301 (_ BitVec 32))) (Intermediate!2531 (undefined!3343 Bool) (index!12302 (_ BitVec 32)) (x!30561 (_ BitVec 32))) (Undefined!2531) (MissingVacant!2531 (index!12303 (_ BitVec 32))) )
))
(declare-fun lt!150872 () SeekEntryResult!2531)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15614 (_ BitVec 32)) SeekEntryResult!2531)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306946 (= res!163851 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150872))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!306946 (= lt!150872 (Intermediate!2531 false resIndex!52 resX!52))))

(declare-fun b!306947 () Bool)

(declare-fun res!163848 () Bool)

(assert (=> b!306947 (=> (not res!163848) (not e!192264))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!306947 (= res!163848 (and (= (select (arr!7392 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7745 a!3293))))))

(declare-fun b!306948 () Bool)

(declare-fun res!163854 () Bool)

(assert (=> b!306948 (=> (not res!163854) (not e!192265))))

(declare-fun arrayContainsKey!0 (array!15614 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!306948 (= res!163854 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!306949 () Bool)

(declare-fun res!163850 () Bool)

(assert (=> b!306949 (=> (not res!163850) (not e!192265))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!306949 (= res!163850 (validKeyInArray!0 k0!2441))))

(declare-fun b!306950 () Bool)

(assert (=> b!306950 (= e!192264 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7392 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709))))))

(declare-fun b!306951 () Bool)

(declare-fun res!163846 () Bool)

(assert (=> b!306951 (=> (not res!163846) (not e!192265))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15614 (_ BitVec 32)) SeekEntryResult!2531)

(assert (=> b!306951 (= res!163846 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2531 i!1240)))))

(declare-fun b!306952 () Bool)

(declare-fun res!163852 () Bool)

(assert (=> b!306952 (=> (not res!163852) (not e!192265))))

(assert (=> b!306952 (= res!163852 (and (= (size!7745 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7745 a!3293))))))

(declare-fun b!306953 () Bool)

(declare-fun res!163847 () Bool)

(assert (=> b!306953 (=> (not res!163847) (not e!192265))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15614 (_ BitVec 32)) Bool)

(assert (=> b!306953 (= res!163847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!306954 () Bool)

(declare-fun res!163853 () Bool)

(assert (=> b!306954 (=> (not res!163853) (not e!192264))))

(assert (=> b!306954 (= res!163853 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150872))))

(assert (= (and start!30606 res!163849) b!306952))

(assert (= (and b!306952 res!163852) b!306949))

(assert (= (and b!306949 res!163850) b!306948))

(assert (= (and b!306948 res!163854) b!306951))

(assert (= (and b!306951 res!163846) b!306953))

(assert (= (and b!306953 res!163847) b!306946))

(assert (= (and b!306946 res!163851) b!306947))

(assert (= (and b!306947 res!163848) b!306954))

(assert (= (and b!306954 res!163853) b!306950))

(declare-fun m!316837 () Bool)

(assert (=> b!306953 m!316837))

(declare-fun m!316839 () Bool)

(assert (=> b!306947 m!316839))

(declare-fun m!316841 () Bool)

(assert (=> b!306951 m!316841))

(declare-fun m!316843 () Bool)

(assert (=> b!306946 m!316843))

(assert (=> b!306946 m!316843))

(declare-fun m!316845 () Bool)

(assert (=> b!306946 m!316845))

(declare-fun m!316847 () Bool)

(assert (=> b!306950 m!316847))

(declare-fun m!316849 () Bool)

(assert (=> start!30606 m!316849))

(declare-fun m!316851 () Bool)

(assert (=> start!30606 m!316851))

(declare-fun m!316853 () Bool)

(assert (=> b!306948 m!316853))

(declare-fun m!316855 () Bool)

(assert (=> b!306949 m!316855))

(declare-fun m!316857 () Bool)

(assert (=> b!306954 m!316857))

(check-sat (not b!306951) (not b!306953) (not start!30606) (not b!306946) (not b!306948) (not b!306949) (not b!306954))
(check-sat)
