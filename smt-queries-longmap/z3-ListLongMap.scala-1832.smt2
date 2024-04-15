; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33188 () Bool)

(assert start!33188)

(declare-fun b!329703 () Bool)

(declare-fun res!181692 () Bool)

(declare-fun e!202484 () Bool)

(assert (=> b!329703 (=> (not res!181692) (not e!202484))))

(declare-datatypes ((array!16851 0))(
  ( (array!16852 (arr!7968 (Array (_ BitVec 32) (_ BitVec 64))) (size!8321 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16851)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3098 0))(
  ( (MissingZero!3098 (index!14568 (_ BitVec 32))) (Found!3098 (index!14569 (_ BitVec 32))) (Intermediate!3098 (undefined!3910 Bool) (index!14570 (_ BitVec 32)) (x!32868 (_ BitVec 32))) (Undefined!3098) (MissingVacant!3098 (index!14571 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16851 (_ BitVec 32)) SeekEntryResult!3098)

(assert (=> b!329703 (= res!181692 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3098 i!1250)))))

(declare-fun b!329705 () Bool)

(declare-fun res!181690 () Bool)

(assert (=> b!329705 (=> (not res!181690) (not e!202484))))

(assert (=> b!329705 (= res!181690 (and (= (size!8321 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8321 a!3305))))))

(declare-fun b!329706 () Bool)

(declare-datatypes ((Unit!10188 0))(
  ( (Unit!10189) )
))
(declare-fun e!202483 () Unit!10188)

(declare-fun Unit!10190 () Unit!10188)

(assert (=> b!329706 (= e!202483 Unit!10190)))

(assert (=> b!329706 false))

(declare-fun b!329707 () Bool)

(declare-fun e!202487 () Bool)

(assert (=> b!329707 (= e!202484 e!202487)))

(declare-fun res!181688 () Bool)

(assert (=> b!329707 (=> (not res!181688) (not e!202487))))

(declare-fun lt!158190 () SeekEntryResult!3098)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16851 (_ BitVec 32)) SeekEntryResult!3098)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!329707 (= res!181688 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!158190))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!329707 (= lt!158190 (Intermediate!3098 false resIndex!58 resX!58))))

(declare-fun b!329708 () Bool)

(declare-fun res!181691 () Bool)

(assert (=> b!329708 (=> (not res!181691) (not e!202484))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16851 (_ BitVec 32)) Bool)

(assert (=> b!329708 (= res!181691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!329709 () Bool)

(declare-fun e!202485 () Unit!10188)

(declare-fun Unit!10191 () Unit!10188)

(assert (=> b!329709 (= e!202485 Unit!10191)))

(declare-fun b!329710 () Bool)

(declare-fun res!181693 () Bool)

(assert (=> b!329710 (=> (not res!181693) (not e!202487))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!329710 (= res!181693 (and (= (select (arr!7968 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8321 a!3305))))))

(declare-fun b!329711 () Bool)

(assert (=> b!329711 false))

(declare-fun e!202482 () Unit!10188)

(declare-fun Unit!10192 () Unit!10188)

(assert (=> b!329711 (= e!202482 Unit!10192)))

(declare-fun b!329704 () Bool)

(declare-fun Unit!10193 () Unit!10188)

(assert (=> b!329704 (= e!202483 Unit!10193)))

(declare-fun res!181687 () Bool)

(assert (=> start!33188 (=> (not res!181687) (not e!202484))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33188 (= res!181687 (validMask!0 mask!3777))))

(assert (=> start!33188 e!202484))

(declare-fun array_inv!5940 (array!16851) Bool)

(assert (=> start!33188 (array_inv!5940 a!3305)))

(assert (=> start!33188 true))

(declare-fun b!329712 () Bool)

(declare-fun res!181695 () Bool)

(assert (=> b!329712 (=> (not res!181695) (not e!202484))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!329712 (= res!181695 (validKeyInArray!0 k0!2497))))

(declare-fun b!329713 () Bool)

(declare-fun res!181686 () Bool)

(assert (=> b!329713 (=> (not res!181686) (not e!202487))))

(assert (=> b!329713 (= res!181686 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!158190))))

(declare-fun b!329714 () Bool)

(assert (=> b!329714 (= e!202485 e!202482)))

(declare-fun c!51653 () Bool)

(assert (=> b!329714 (= c!51653 (or (= (select (arr!7968 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7968 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!329715 () Bool)

(assert (=> b!329715 false))

(declare-fun lt!158192 () Unit!10188)

(assert (=> b!329715 (= lt!158192 e!202483)))

(declare-fun c!51652 () Bool)

(get-info :version)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!329715 (= c!51652 ((_ is Intermediate!3098) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun Unit!10194 () Unit!10188)

(assert (=> b!329715 (= e!202482 Unit!10194)))

(declare-fun b!329716 () Bool)

(declare-fun res!181689 () Bool)

(assert (=> b!329716 (=> (not res!181689) (not e!202484))))

(declare-fun arrayContainsKey!0 (array!16851 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!329716 (= res!181689 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!329717 () Bool)

(declare-fun res!181694 () Bool)

(assert (=> b!329717 (=> (not res!181694) (not e!202487))))

(assert (=> b!329717 (= res!181694 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7968 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(declare-fun b!329718 () Bool)

(assert (=> b!329718 (= e!202487 (not (= index!1840 resIndex!58)))))

(declare-fun lt!158191 () Unit!10188)

(assert (=> b!329718 (= lt!158191 e!202485)))

(declare-fun c!51651 () Bool)

(assert (=> b!329718 (= c!51651 (not (= resIndex!58 index!1840)))))

(assert (= (and start!33188 res!181687) b!329705))

(assert (= (and b!329705 res!181690) b!329712))

(assert (= (and b!329712 res!181695) b!329716))

(assert (= (and b!329716 res!181689) b!329703))

(assert (= (and b!329703 res!181692) b!329708))

(assert (= (and b!329708 res!181691) b!329707))

(assert (= (and b!329707 res!181688) b!329710))

(assert (= (and b!329710 res!181693) b!329713))

(assert (= (and b!329713 res!181686) b!329717))

(assert (= (and b!329717 res!181694) b!329718))

(assert (= (and b!329718 c!51651) b!329714))

(assert (= (and b!329718 (not c!51651)) b!329709))

(assert (= (and b!329714 c!51653) b!329711))

(assert (= (and b!329714 (not c!51653)) b!329715))

(assert (= (and b!329715 c!51652) b!329704))

(assert (= (and b!329715 (not c!51652)) b!329706))

(declare-fun m!334693 () Bool)

(assert (=> b!329703 m!334693))

(declare-fun m!334695 () Bool)

(assert (=> b!329715 m!334695))

(assert (=> b!329715 m!334695))

(declare-fun m!334697 () Bool)

(assert (=> b!329715 m!334697))

(declare-fun m!334699 () Bool)

(assert (=> b!329708 m!334699))

(declare-fun m!334701 () Bool)

(assert (=> b!329710 m!334701))

(declare-fun m!334703 () Bool)

(assert (=> b!329717 m!334703))

(assert (=> b!329714 m!334703))

(declare-fun m!334705 () Bool)

(assert (=> b!329707 m!334705))

(assert (=> b!329707 m!334705))

(declare-fun m!334707 () Bool)

(assert (=> b!329707 m!334707))

(declare-fun m!334709 () Bool)

(assert (=> start!33188 m!334709))

(declare-fun m!334711 () Bool)

(assert (=> start!33188 m!334711))

(declare-fun m!334713 () Bool)

(assert (=> b!329716 m!334713))

(declare-fun m!334715 () Bool)

(assert (=> b!329713 m!334715))

(declare-fun m!334717 () Bool)

(assert (=> b!329712 m!334717))

(check-sat (not b!329715) (not b!329708) (not b!329707) (not start!33188) (not b!329712) (not b!329716) (not b!329703) (not b!329713))
(check-sat)
