; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30594 () Bool)

(assert start!30594)

(declare-fun res!163696 () Bool)

(declare-fun e!192220 () Bool)

(assert (=> start!30594 (=> (not res!163696) (not e!192220))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30594 (= res!163696 (validMask!0 mask!3709))))

(assert (=> start!30594 e!192220))

(declare-datatypes ((array!15602 0))(
  ( (array!15603 (arr!7386 (Array (_ BitVec 32) (_ BitVec 64))) (size!7739 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15602)

(declare-fun array_inv!5358 (array!15602) Bool)

(assert (=> start!30594 (array_inv!5358 a!3293)))

(assert (=> start!30594 true))

(declare-fun b!306793 () Bool)

(declare-fun res!163695 () Bool)

(declare-fun e!192221 () Bool)

(assert (=> b!306793 (=> (not res!163695) (not e!192221))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!306793 (= res!163695 (and (= (select (arr!7386 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7739 a!3293))))))

(declare-fun b!306794 () Bool)

(declare-fun res!163694 () Bool)

(assert (=> b!306794 (=> (not res!163694) (not e!192220))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15602 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!306794 (= res!163694 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!306795 () Bool)

(assert (=> b!306795 (= e!192220 e!192221)))

(declare-fun res!163700 () Bool)

(assert (=> b!306795 (=> (not res!163700) (not e!192221))))

(declare-datatypes ((SeekEntryResult!2525 0))(
  ( (MissingZero!2525 (index!12276 (_ BitVec 32))) (Found!2525 (index!12277 (_ BitVec 32))) (Intermediate!2525 (undefined!3337 Bool) (index!12278 (_ BitVec 32)) (x!30539 (_ BitVec 32))) (Undefined!2525) (MissingVacant!2525 (index!12279 (_ BitVec 32))) )
))
(declare-fun lt!150854 () SeekEntryResult!2525)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15602 (_ BitVec 32)) SeekEntryResult!2525)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306795 (= res!163700 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150854))))

(assert (=> b!306795 (= lt!150854 (Intermediate!2525 false resIndex!52 resX!52))))

(declare-fun b!306796 () Bool)

(declare-fun res!163699 () Bool)

(assert (=> b!306796 (=> (not res!163699) (not e!192220))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15602 (_ BitVec 32)) SeekEntryResult!2525)

(assert (=> b!306796 (= res!163699 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2525 i!1240)))))

(declare-fun b!306797 () Bool)

(declare-fun res!163701 () Bool)

(assert (=> b!306797 (=> (not res!163701) (not e!192221))))

(assert (=> b!306797 (= res!163701 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150854))))

(declare-fun b!306798 () Bool)

(declare-fun res!163693 () Bool)

(assert (=> b!306798 (=> (not res!163693) (not e!192220))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15602 (_ BitVec 32)) Bool)

(assert (=> b!306798 (= res!163693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!306799 () Bool)

(declare-fun res!163698 () Bool)

(assert (=> b!306799 (=> (not res!163698) (not e!192220))))

(assert (=> b!306799 (= res!163698 (and (= (size!7739 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7739 a!3293))))))

(declare-fun b!306800 () Bool)

(assert (=> b!306800 (= e!192221 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7386 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52)) (bvslt mask!3709 #b00000000000000000000000000000000)))))

(declare-fun b!306801 () Bool)

(declare-fun res!163697 () Bool)

(assert (=> b!306801 (=> (not res!163697) (not e!192220))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!306801 (= res!163697 (validKeyInArray!0 k0!2441))))

(assert (= (and start!30594 res!163696) b!306799))

(assert (= (and b!306799 res!163698) b!306801))

(assert (= (and b!306801 res!163697) b!306794))

(assert (= (and b!306794 res!163694) b!306796))

(assert (= (and b!306796 res!163699) b!306798))

(assert (= (and b!306798 res!163693) b!306795))

(assert (= (and b!306795 res!163700) b!306793))

(assert (= (and b!306793 res!163695) b!306797))

(assert (= (and b!306797 res!163701) b!306800))

(declare-fun m!316711 () Bool)

(assert (=> b!306801 m!316711))

(declare-fun m!316713 () Bool)

(assert (=> b!306794 m!316713))

(declare-fun m!316715 () Bool)

(assert (=> b!306796 m!316715))

(declare-fun m!316717 () Bool)

(assert (=> b!306793 m!316717))

(declare-fun m!316719 () Bool)

(assert (=> b!306797 m!316719))

(declare-fun m!316721 () Bool)

(assert (=> b!306800 m!316721))

(declare-fun m!316723 () Bool)

(assert (=> b!306795 m!316723))

(assert (=> b!306795 m!316723))

(declare-fun m!316725 () Bool)

(assert (=> b!306795 m!316725))

(declare-fun m!316727 () Bool)

(assert (=> start!30594 m!316727))

(declare-fun m!316729 () Bool)

(assert (=> start!30594 m!316729))

(declare-fun m!316731 () Bool)

(assert (=> b!306798 m!316731))

(check-sat (not b!306797) (not b!306795) (not b!306801) (not b!306796) (not b!306794) (not b!306798) (not start!30594))
(check-sat)
