; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30948 () Bool)

(assert start!30948)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun b!310692 () Bool)

(declare-fun lt!151934 () (_ BitVec 32))

(declare-fun e!193907 () Bool)

(declare-datatypes ((array!15854 0))(
  ( (array!15855 (arr!7509 (Array (_ BitVec 32) (_ BitVec 64))) (size!7862 (_ BitVec 32))) )
))
(declare-fun lt!151933 () array!15854)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2648 0))(
  ( (MissingZero!2648 (index!12768 (_ BitVec 32))) (Found!2648 (index!12769 (_ BitVec 32))) (Intermediate!2648 (undefined!3460 Bool) (index!12770 (_ BitVec 32)) (x!31008 (_ BitVec 32))) (Undefined!2648) (MissingVacant!2648 (index!12771 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15854 (_ BitVec 32)) SeekEntryResult!2648)

(assert (=> b!310692 (= e!193907 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!151933 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151934 k0!2441 lt!151933 mask!3709)))))

(declare-fun a!3293 () array!15854)

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!310692 (= lt!151933 (array!15855 (store (arr!7509 a!3293) i!1240 k0!2441) (size!7862 a!3293)))))

(declare-fun b!310693 () Bool)

(declare-fun res!167301 () Bool)

(declare-fun e!193909 () Bool)

(assert (=> b!310693 (=> (not res!167301) (not e!193909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15854 (_ BitVec 32)) Bool)

(assert (=> b!310693 (= res!167301 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!167298 () Bool)

(assert (=> start!30948 (=> (not res!167298) (not e!193909))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30948 (= res!167298 (validMask!0 mask!3709))))

(assert (=> start!30948 e!193909))

(declare-fun array_inv!5481 (array!15854) Bool)

(assert (=> start!30948 (array_inv!5481 a!3293)))

(assert (=> start!30948 true))

(declare-fun b!310694 () Bool)

(declare-fun res!167294 () Bool)

(declare-fun e!193908 () Bool)

(assert (=> b!310694 (=> (not res!167294) (not e!193908))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!310694 (= res!167294 (and (= (select (arr!7509 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7862 a!3293))))))

(declare-fun b!310695 () Bool)

(declare-fun e!193906 () Bool)

(assert (=> b!310695 (= e!193908 e!193906)))

(declare-fun res!167296 () Bool)

(assert (=> b!310695 (=> (not res!167296) (not e!193906))))

(declare-fun lt!151932 () SeekEntryResult!2648)

(declare-fun lt!151931 () SeekEntryResult!2648)

(assert (=> b!310695 (= res!167296 (and (= lt!151931 lt!151932) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7509 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!310695 (= lt!151931 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!310696 () Bool)

(declare-fun res!167293 () Bool)

(assert (=> b!310696 (=> (not res!167293) (not e!193909))))

(declare-fun arrayContainsKey!0 (array!15854 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310696 (= res!167293 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!310697 () Bool)

(assert (=> b!310697 (= e!193906 (not true))))

(assert (=> b!310697 e!193907))

(declare-fun res!167292 () Bool)

(assert (=> b!310697 (=> (not res!167292) (not e!193907))))

(assert (=> b!310697 (= res!167292 (= lt!151931 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151934 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310697 (= lt!151934 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!310698 () Bool)

(declare-fun res!167297 () Bool)

(assert (=> b!310698 (=> (not res!167297) (not e!193909))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310698 (= res!167297 (validKeyInArray!0 k0!2441))))

(declare-fun b!310699 () Bool)

(assert (=> b!310699 (= e!193909 e!193908)))

(declare-fun res!167295 () Bool)

(assert (=> b!310699 (=> (not res!167295) (not e!193908))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310699 (= res!167295 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151932))))

(assert (=> b!310699 (= lt!151932 (Intermediate!2648 false resIndex!52 resX!52))))

(declare-fun b!310700 () Bool)

(declare-fun res!167300 () Bool)

(assert (=> b!310700 (=> (not res!167300) (not e!193909))))

(assert (=> b!310700 (= res!167300 (and (= (size!7862 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7862 a!3293))))))

(declare-fun b!310701 () Bool)

(declare-fun res!167299 () Bool)

(assert (=> b!310701 (=> (not res!167299) (not e!193909))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15854 (_ BitVec 32)) SeekEntryResult!2648)

(assert (=> b!310701 (= res!167299 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2648 i!1240)))))

(assert (= (and start!30948 res!167298) b!310700))

(assert (= (and b!310700 res!167300) b!310698))

(assert (= (and b!310698 res!167297) b!310696))

(assert (= (and b!310696 res!167293) b!310701))

(assert (= (and b!310701 res!167299) b!310693))

(assert (= (and b!310693 res!167301) b!310699))

(assert (= (and b!310699 res!167295) b!310694))

(assert (= (and b!310694 res!167294) b!310695))

(assert (= (and b!310695 res!167296) b!310697))

(assert (= (and b!310697 res!167292) b!310692))

(declare-fun m!320179 () Bool)

(assert (=> b!310694 m!320179))

(declare-fun m!320181 () Bool)

(assert (=> b!310697 m!320181))

(declare-fun m!320183 () Bool)

(assert (=> b!310697 m!320183))

(declare-fun m!320185 () Bool)

(assert (=> b!310696 m!320185))

(declare-fun m!320187 () Bool)

(assert (=> b!310699 m!320187))

(assert (=> b!310699 m!320187))

(declare-fun m!320189 () Bool)

(assert (=> b!310699 m!320189))

(declare-fun m!320191 () Bool)

(assert (=> b!310692 m!320191))

(declare-fun m!320193 () Bool)

(assert (=> b!310692 m!320193))

(declare-fun m!320195 () Bool)

(assert (=> b!310692 m!320195))

(declare-fun m!320197 () Bool)

(assert (=> b!310693 m!320197))

(declare-fun m!320199 () Bool)

(assert (=> b!310695 m!320199))

(declare-fun m!320201 () Bool)

(assert (=> b!310695 m!320201))

(declare-fun m!320203 () Bool)

(assert (=> start!30948 m!320203))

(declare-fun m!320205 () Bool)

(assert (=> start!30948 m!320205))

(declare-fun m!320207 () Bool)

(assert (=> b!310701 m!320207))

(declare-fun m!320209 () Bool)

(assert (=> b!310698 m!320209))

(check-sat (not start!30948) (not b!310696) (not b!310701) (not b!310695) (not b!310699) (not b!310698) (not b!310697) (not b!310692) (not b!310693))
(check-sat)
