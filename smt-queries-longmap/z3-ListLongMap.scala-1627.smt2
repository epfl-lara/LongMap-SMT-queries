; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30528 () Bool)

(assert start!30528)

(declare-fun b!305693 () Bool)

(declare-fun res!162850 () Bool)

(declare-fun e!191901 () Bool)

(assert (=> b!305693 (=> (not res!162850) (not e!191901))))

(declare-datatypes ((array!15545 0))(
  ( (array!15546 (arr!7357 (Array (_ BitVec 32) (_ BitVec 64))) (size!7709 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15545)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!305693 (= res!162850 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7357 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(declare-fun b!305694 () Bool)

(declare-fun res!162857 () Bool)

(declare-fun e!191898 () Bool)

(assert (=> b!305694 (=> (not res!162857) (not e!191898))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2462 0))(
  ( (MissingZero!2462 (index!12024 (_ BitVec 32))) (Found!2462 (index!12025 (_ BitVec 32))) (Intermediate!2462 (undefined!3274 Bool) (index!12026 (_ BitVec 32)) (x!30390 (_ BitVec 32))) (Undefined!2462) (MissingVacant!2462 (index!12027 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15545 (_ BitVec 32)) SeekEntryResult!2462)

(assert (=> b!305694 (= res!162857 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2462 i!1240)))))

(declare-fun b!305695 () Bool)

(declare-fun res!162853 () Bool)

(assert (=> b!305695 (=> (not res!162853) (not e!191898))))

(assert (=> b!305695 (= res!162853 (and (= (size!7709 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7709 a!3293))))))

(declare-fun b!305696 () Bool)

(assert (=> b!305696 false))

(declare-datatypes ((Unit!9393 0))(
  ( (Unit!9394) )
))
(declare-fun e!191899 () Unit!9393)

(declare-fun Unit!9395 () Unit!9393)

(assert (=> b!305696 (= e!191899 Unit!9395)))

(declare-fun b!305697 () Bool)

(declare-fun res!162849 () Bool)

(assert (=> b!305697 (=> (not res!162849) (not e!191901))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!305697 (= res!162849 (and (= (select (arr!7357 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7709 a!3293))))))

(declare-fun b!305698 () Bool)

(declare-fun res!162852 () Bool)

(assert (=> b!305698 (=> (not res!162852) (not e!191898))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15545 (_ BitVec 32)) Bool)

(assert (=> b!305698 (= res!162852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!305699 () Bool)

(declare-fun res!162855 () Bool)

(assert (=> b!305699 (=> (not res!162855) (not e!191898))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!305699 (= res!162855 (validKeyInArray!0 k0!2441))))

(declare-fun b!305700 () Bool)

(assert (=> b!305700 (= e!191901 (not true))))

(assert (=> b!305700 (= index!1781 resIndex!52)))

(declare-fun lt!150833 () Unit!9393)

(declare-fun e!191900 () Unit!9393)

(assert (=> b!305700 (= lt!150833 e!191900)))

(declare-fun c!49025 () Bool)

(assert (=> b!305700 (= c!49025 (not (= resIndex!52 index!1781)))))

(declare-fun b!305701 () Bool)

(assert (=> b!305701 false))

(declare-fun lt!150834 () SeekEntryResult!2462)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15545 (_ BitVec 32)) SeekEntryResult!2462)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305701 (= lt!150834 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun Unit!9396 () Unit!9393)

(assert (=> b!305701 (= e!191899 Unit!9396)))

(declare-fun b!305702 () Bool)

(declare-fun res!162851 () Bool)

(assert (=> b!305702 (=> (not res!162851) (not e!191901))))

(declare-fun lt!150832 () SeekEntryResult!2462)

(assert (=> b!305702 (= res!162851 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150832))))

(declare-fun res!162856 () Bool)

(assert (=> start!30528 (=> (not res!162856) (not e!191898))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30528 (= res!162856 (validMask!0 mask!3709))))

(assert (=> start!30528 e!191898))

(declare-fun array_inv!5307 (array!15545) Bool)

(assert (=> start!30528 (array_inv!5307 a!3293)))

(assert (=> start!30528 true))

(declare-fun b!305703 () Bool)

(assert (=> b!305703 (= e!191900 e!191899)))

(declare-fun c!49024 () Bool)

(assert (=> b!305703 (= c!49024 (or (= (select (arr!7357 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7357 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!305704 () Bool)

(declare-fun res!162858 () Bool)

(assert (=> b!305704 (=> (not res!162858) (not e!191898))))

(declare-fun arrayContainsKey!0 (array!15545 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!305704 (= res!162858 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!305705 () Bool)

(declare-fun Unit!9397 () Unit!9393)

(assert (=> b!305705 (= e!191900 Unit!9397)))

(declare-fun b!305706 () Bool)

(assert (=> b!305706 (= e!191898 e!191901)))

(declare-fun res!162854 () Bool)

(assert (=> b!305706 (=> (not res!162854) (not e!191901))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305706 (= res!162854 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150832))))

(assert (=> b!305706 (= lt!150832 (Intermediate!2462 false resIndex!52 resX!52))))

(assert (= (and start!30528 res!162856) b!305695))

(assert (= (and b!305695 res!162853) b!305699))

(assert (= (and b!305699 res!162855) b!305704))

(assert (= (and b!305704 res!162858) b!305694))

(assert (= (and b!305694 res!162857) b!305698))

(assert (= (and b!305698 res!162852) b!305706))

(assert (= (and b!305706 res!162854) b!305697))

(assert (= (and b!305697 res!162849) b!305702))

(assert (= (and b!305702 res!162851) b!305693))

(assert (= (and b!305693 res!162850) b!305700))

(assert (= (and b!305700 c!49025) b!305703))

(assert (= (and b!305700 (not c!49025)) b!305705))

(assert (= (and b!305703 c!49024) b!305696))

(assert (= (and b!305703 (not c!49024)) b!305701))

(declare-fun m!316723 () Bool)

(assert (=> b!305702 m!316723))

(declare-fun m!316725 () Bool)

(assert (=> b!305699 m!316725))

(declare-fun m!316727 () Bool)

(assert (=> b!305693 m!316727))

(declare-fun m!316729 () Bool)

(assert (=> b!305698 m!316729))

(declare-fun m!316731 () Bool)

(assert (=> b!305706 m!316731))

(assert (=> b!305706 m!316731))

(declare-fun m!316733 () Bool)

(assert (=> b!305706 m!316733))

(declare-fun m!316735 () Bool)

(assert (=> b!305701 m!316735))

(assert (=> b!305701 m!316735))

(declare-fun m!316737 () Bool)

(assert (=> b!305701 m!316737))

(declare-fun m!316739 () Bool)

(assert (=> start!30528 m!316739))

(declare-fun m!316741 () Bool)

(assert (=> start!30528 m!316741))

(declare-fun m!316743 () Bool)

(assert (=> b!305694 m!316743))

(declare-fun m!316745 () Bool)

(assert (=> b!305704 m!316745))

(assert (=> b!305703 m!316727))

(declare-fun m!316747 () Bool)

(assert (=> b!305697 m!316747))

(check-sat (not b!305698) (not b!305706) (not b!305699) (not b!305701) (not start!30528) (not b!305704) (not b!305702) (not b!305694))
(check-sat)
