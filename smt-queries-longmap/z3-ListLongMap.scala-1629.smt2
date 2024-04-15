; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30540 () Bool)

(assert start!30540)

(declare-fun b!305723 () Bool)

(declare-fun res!162903 () Bool)

(declare-fun e!191849 () Bool)

(assert (=> b!305723 (=> (not res!162903) (not e!191849))))

(declare-datatypes ((array!15548 0))(
  ( (array!15549 (arr!7359 (Array (_ BitVec 32) (_ BitVec 64))) (size!7712 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15548)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2498 0))(
  ( (MissingZero!2498 (index!12168 (_ BitVec 32))) (Found!2498 (index!12169 (_ BitVec 32))) (Intermediate!2498 (undefined!3310 Bool) (index!12170 (_ BitVec 32)) (x!30440 (_ BitVec 32))) (Undefined!2498) (MissingVacant!2498 (index!12171 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15548 (_ BitVec 32)) SeekEntryResult!2498)

(assert (=> b!305723 (= res!162903 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2498 i!1240)))))

(declare-fun b!305724 () Bool)

(declare-fun e!191845 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!305724 (= e!191845 (not (or (not (= (select (arr!7359 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsle x!1427 #b01111111111111111111111111111110))))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!305724 (= index!1781 resIndex!52)))

(declare-datatypes ((Unit!9421 0))(
  ( (Unit!9422) )
))
(declare-fun lt!150635 () Unit!9421)

(declare-fun e!191848 () Unit!9421)

(assert (=> b!305724 (= lt!150635 e!191848)))

(declare-fun c!49013 () Bool)

(assert (=> b!305724 (= c!49013 (not (= resIndex!52 index!1781)))))

(declare-fun b!305725 () Bool)

(assert (=> b!305725 false))

(declare-fun lt!150634 () SeekEntryResult!2498)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15548 (_ BitVec 32)) SeekEntryResult!2498)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305725 (= lt!150634 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun e!191847 () Unit!9421)

(declare-fun Unit!9423 () Unit!9421)

(assert (=> b!305725 (= e!191847 Unit!9423)))

(declare-fun b!305726 () Bool)

(declare-fun res!162907 () Bool)

(assert (=> b!305726 (=> (not res!162907) (not e!191845))))

(declare-fun lt!150633 () SeekEntryResult!2498)

(assert (=> b!305726 (= res!162907 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150633))))

(declare-fun b!305727 () Bool)

(assert (=> b!305727 (= e!191849 e!191845)))

(declare-fun res!162910 () Bool)

(assert (=> b!305727 (=> (not res!162910) (not e!191845))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305727 (= res!162910 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150633))))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!305727 (= lt!150633 (Intermediate!2498 false resIndex!52 resX!52))))

(declare-fun b!305728 () Bool)

(declare-fun res!162905 () Bool)

(assert (=> b!305728 (=> (not res!162905) (not e!191845))))

(assert (=> b!305728 (= res!162905 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7359 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(declare-fun b!305729 () Bool)

(declare-fun res!162908 () Bool)

(assert (=> b!305729 (=> (not res!162908) (not e!191849))))

(assert (=> b!305729 (= res!162908 (and (= (size!7712 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7712 a!3293))))))

(declare-fun res!162912 () Bool)

(assert (=> start!30540 (=> (not res!162912) (not e!191849))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30540 (= res!162912 (validMask!0 mask!3709))))

(assert (=> start!30540 e!191849))

(declare-fun array_inv!5331 (array!15548) Bool)

(assert (=> start!30540 (array_inv!5331 a!3293)))

(assert (=> start!30540 true))

(declare-fun b!305730 () Bool)

(assert (=> b!305730 false))

(declare-fun Unit!9424 () Unit!9421)

(assert (=> b!305730 (= e!191847 Unit!9424)))

(declare-fun b!305731 () Bool)

(assert (=> b!305731 (= e!191848 e!191847)))

(declare-fun c!49012 () Bool)

(assert (=> b!305731 (= c!49012 (or (= (select (arr!7359 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7359 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!305732 () Bool)

(declare-fun res!162911 () Bool)

(assert (=> b!305732 (=> (not res!162911) (not e!191849))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15548 (_ BitVec 32)) Bool)

(assert (=> b!305732 (= res!162911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!305733 () Bool)

(declare-fun res!162906 () Bool)

(assert (=> b!305733 (=> (not res!162906) (not e!191845))))

(assert (=> b!305733 (= res!162906 (and (= (select (arr!7359 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7712 a!3293))))))

(declare-fun b!305734 () Bool)

(declare-fun res!162909 () Bool)

(assert (=> b!305734 (=> (not res!162909) (not e!191849))))

(declare-fun arrayContainsKey!0 (array!15548 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!305734 (= res!162909 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!305735 () Bool)

(declare-fun Unit!9425 () Unit!9421)

(assert (=> b!305735 (= e!191848 Unit!9425)))

(declare-fun b!305736 () Bool)

(declare-fun res!162904 () Bool)

(assert (=> b!305736 (=> (not res!162904) (not e!191849))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!305736 (= res!162904 (validKeyInArray!0 k0!2441))))

(assert (= (and start!30540 res!162912) b!305729))

(assert (= (and b!305729 res!162908) b!305736))

(assert (= (and b!305736 res!162904) b!305734))

(assert (= (and b!305734 res!162909) b!305723))

(assert (= (and b!305723 res!162903) b!305732))

(assert (= (and b!305732 res!162911) b!305727))

(assert (= (and b!305727 res!162910) b!305733))

(assert (= (and b!305733 res!162906) b!305726))

(assert (= (and b!305726 res!162907) b!305728))

(assert (= (and b!305728 res!162905) b!305724))

(assert (= (and b!305724 c!49013) b!305731))

(assert (= (and b!305724 (not c!49013)) b!305735))

(assert (= (and b!305731 c!49012) b!305730))

(assert (= (and b!305731 (not c!49012)) b!305725))

(declare-fun m!316027 () Bool)

(assert (=> b!305728 m!316027))

(declare-fun m!316029 () Bool)

(assert (=> b!305736 m!316029))

(declare-fun m!316031 () Bool)

(assert (=> b!305733 m!316031))

(declare-fun m!316033 () Bool)

(assert (=> b!305723 m!316033))

(declare-fun m!316035 () Bool)

(assert (=> b!305726 m!316035))

(assert (=> b!305731 m!316027))

(declare-fun m!316037 () Bool)

(assert (=> b!305732 m!316037))

(assert (=> b!305724 m!316027))

(declare-fun m!316039 () Bool)

(assert (=> b!305725 m!316039))

(assert (=> b!305725 m!316039))

(declare-fun m!316041 () Bool)

(assert (=> b!305725 m!316041))

(declare-fun m!316043 () Bool)

(assert (=> start!30540 m!316043))

(declare-fun m!316045 () Bool)

(assert (=> start!30540 m!316045))

(declare-fun m!316047 () Bool)

(assert (=> b!305734 m!316047))

(declare-fun m!316049 () Bool)

(assert (=> b!305727 m!316049))

(assert (=> b!305727 m!316049))

(declare-fun m!316051 () Bool)

(assert (=> b!305727 m!316051))

(check-sat (not start!30540) (not b!305726) (not b!305736) (not b!305732) (not b!305727) (not b!305734) (not b!305723) (not b!305725))
(check-sat)
