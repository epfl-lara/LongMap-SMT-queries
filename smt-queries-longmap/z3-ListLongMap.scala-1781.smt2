; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32372 () Bool)

(assert start!32372)

(declare-fun b!322815 () Bool)

(assert (=> b!322815 false))

(declare-datatypes ((Unit!9882 0))(
  ( (Unit!9883) )
))
(declare-fun lt!156547 () Unit!9882)

(declare-fun e!199688 () Unit!9882)

(assert (=> b!322815 (= lt!156547 e!199688)))

(declare-datatypes ((array!16524 0))(
  ( (array!16525 (arr!7819 (Array (_ BitVec 32) (_ BitVec 64))) (size!8171 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16524)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun c!50729 () Bool)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(get-info :version)

(declare-datatypes ((SeekEntryResult!2915 0))(
  ( (MissingZero!2915 (index!13836 (_ BitVec 32))) (Found!2915 (index!13837 (_ BitVec 32))) (Intermediate!2915 (undefined!3727 Bool) (index!13838 (_ BitVec 32)) (x!32204 (_ BitVec 32))) (Undefined!2915) (MissingVacant!2915 (index!13839 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16524 (_ BitVec 32)) SeekEntryResult!2915)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322815 (= c!50729 ((_ is Intermediate!2915) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun e!199685 () Unit!9882)

(declare-fun Unit!9884 () Unit!9882)

(assert (=> b!322815 (= e!199685 Unit!9884)))

(declare-fun b!322816 () Bool)

(declare-fun res!176623 () Bool)

(declare-fun e!199686 () Bool)

(assert (=> b!322816 (=> (not res!176623) (not e!199686))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16524 (_ BitVec 32)) Bool)

(assert (=> b!322816 (= res!176623 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!322817 () Bool)

(declare-fun res!176618 () Bool)

(assert (=> b!322817 (=> (not res!176618) (not e!199686))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16524 (_ BitVec 32)) SeekEntryResult!2915)

(assert (=> b!322817 (= res!176618 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2915 i!1250)))))

(declare-fun b!322818 () Bool)

(declare-fun Unit!9885 () Unit!9882)

(assert (=> b!322818 (= e!199688 Unit!9885)))

(declare-fun b!322819 () Bool)

(declare-fun res!176616 () Bool)

(assert (=> b!322819 (=> (not res!176616) (not e!199686))))

(assert (=> b!322819 (= res!176616 (and (= (size!8171 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8171 a!3305))))))

(declare-fun res!176620 () Bool)

(assert (=> start!32372 (=> (not res!176620) (not e!199686))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32372 (= res!176620 (validMask!0 mask!3777))))

(assert (=> start!32372 e!199686))

(declare-fun array_inv!5769 (array!16524) Bool)

(assert (=> start!32372 (array_inv!5769 a!3305)))

(assert (=> start!32372 true))

(declare-fun b!322820 () Bool)

(assert (=> b!322820 false))

(declare-fun Unit!9886 () Unit!9882)

(assert (=> b!322820 (= e!199685 Unit!9886)))

(declare-fun b!322821 () Bool)

(declare-fun res!176622 () Bool)

(assert (=> b!322821 (=> (not res!176622) (not e!199686))))

(declare-fun arrayContainsKey!0 (array!16524 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!322821 (= res!176622 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!322822 () Bool)

(declare-fun e!199689 () Unit!9882)

(declare-fun Unit!9887 () Unit!9882)

(assert (=> b!322822 (= e!199689 Unit!9887)))

(declare-fun b!322823 () Bool)

(declare-fun res!176621 () Bool)

(declare-fun e!199687 () Bool)

(assert (=> b!322823 (=> (not res!176621) (not e!199687))))

(declare-fun lt!156549 () SeekEntryResult!2915)

(assert (=> b!322823 (= res!176621 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156549))))

(declare-fun b!322824 () Bool)

(declare-fun res!176625 () Bool)

(assert (=> b!322824 (=> (not res!176625) (not e!199687))))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!322824 (= res!176625 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7819 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(declare-fun b!322825 () Bool)

(declare-fun Unit!9888 () Unit!9882)

(assert (=> b!322825 (= e!199688 Unit!9888)))

(assert (=> b!322825 false))

(declare-fun b!322826 () Bool)

(assert (=> b!322826 (= e!199687 (not (or (not (= (select (arr!7819 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3777 #b00000000000000000000000000000000) (bvsge index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsle x!1490 #b01111111111111111111111111111110))))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!322826 (= index!1840 resIndex!58)))

(declare-fun lt!156548 () Unit!9882)

(assert (=> b!322826 (= lt!156548 e!199689)))

(declare-fun c!50728 () Bool)

(assert (=> b!322826 (= c!50728 (not (= resIndex!58 index!1840)))))

(declare-fun b!322827 () Bool)

(declare-fun res!176624 () Bool)

(assert (=> b!322827 (=> (not res!176624) (not e!199687))))

(assert (=> b!322827 (= res!176624 (and (= (select (arr!7819 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8171 a!3305))))))

(declare-fun b!322828 () Bool)

(declare-fun res!176617 () Bool)

(assert (=> b!322828 (=> (not res!176617) (not e!199686))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!322828 (= res!176617 (validKeyInArray!0 k0!2497))))

(declare-fun b!322829 () Bool)

(assert (=> b!322829 (= e!199689 e!199685)))

(declare-fun c!50727 () Bool)

(assert (=> b!322829 (= c!50727 (or (= (select (arr!7819 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7819 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!322830 () Bool)

(assert (=> b!322830 (= e!199686 e!199687)))

(declare-fun res!176619 () Bool)

(assert (=> b!322830 (=> (not res!176619) (not e!199687))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322830 (= res!176619 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156549))))

(assert (=> b!322830 (= lt!156549 (Intermediate!2915 false resIndex!58 resX!58))))

(assert (= (and start!32372 res!176620) b!322819))

(assert (= (and b!322819 res!176616) b!322828))

(assert (= (and b!322828 res!176617) b!322821))

(assert (= (and b!322821 res!176622) b!322817))

(assert (= (and b!322817 res!176618) b!322816))

(assert (= (and b!322816 res!176623) b!322830))

(assert (= (and b!322830 res!176619) b!322827))

(assert (= (and b!322827 res!176624) b!322823))

(assert (= (and b!322823 res!176621) b!322824))

(assert (= (and b!322824 res!176625) b!322826))

(assert (= (and b!322826 c!50728) b!322829))

(assert (= (and b!322826 (not c!50728)) b!322822))

(assert (= (and b!322829 c!50727) b!322820))

(assert (= (and b!322829 (not c!50727)) b!322815))

(assert (= (and b!322815 c!50729) b!322818))

(assert (= (and b!322815 (not c!50729)) b!322825))

(declare-fun m!330691 () Bool)

(assert (=> b!322821 m!330691))

(declare-fun m!330693 () Bool)

(assert (=> b!322827 m!330693))

(declare-fun m!330695 () Bool)

(assert (=> b!322828 m!330695))

(declare-fun m!330697 () Bool)

(assert (=> b!322817 m!330697))

(declare-fun m!330699 () Bool)

(assert (=> start!32372 m!330699))

(declare-fun m!330701 () Bool)

(assert (=> start!32372 m!330701))

(declare-fun m!330703 () Bool)

(assert (=> b!322829 m!330703))

(declare-fun m!330705 () Bool)

(assert (=> b!322816 m!330705))

(declare-fun m!330707 () Bool)

(assert (=> b!322823 m!330707))

(assert (=> b!322826 m!330703))

(assert (=> b!322824 m!330703))

(declare-fun m!330709 () Bool)

(assert (=> b!322815 m!330709))

(assert (=> b!322815 m!330709))

(declare-fun m!330711 () Bool)

(assert (=> b!322815 m!330711))

(declare-fun m!330713 () Bool)

(assert (=> b!322830 m!330713))

(assert (=> b!322830 m!330713))

(declare-fun m!330715 () Bool)

(assert (=> b!322830 m!330715))

(check-sat (not b!322821) (not b!322828) (not start!32372) (not b!322817) (not b!322815) (not b!322830) (not b!322816) (not b!322823))
(check-sat)
