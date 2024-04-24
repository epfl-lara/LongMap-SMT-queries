; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51036 () Bool)

(assert start!51036)

(declare-fun b!557611 () Bool)

(declare-fun res!349556 () Bool)

(declare-fun e!321253 () Bool)

(assert (=> b!557611 (=> (not res!349556) (not e!321253))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35094 0))(
  ( (array!35095 (arr!16852 (Array (_ BitVec 32) (_ BitVec 64))) (size!17216 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35094)

(assert (=> b!557611 (= res!349556 (and (= (size!17216 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17216 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17216 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!557612 () Bool)

(declare-fun res!349557 () Bool)

(declare-fun e!321252 () Bool)

(assert (=> b!557612 (=> (not res!349557) (not e!321252))))

(declare-datatypes ((List!10839 0))(
  ( (Nil!10836) (Cons!10835 (h!11829 (_ BitVec 64)) (t!17059 List!10839)) )
))
(declare-fun arrayNoDuplicates!0 (array!35094 (_ BitVec 32) List!10839) Bool)

(assert (=> b!557612 (= res!349557 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10836))))

(declare-fun b!557613 () Bool)

(declare-fun e!321251 () Bool)

(assert (=> b!557613 (= e!321252 e!321251)))

(declare-fun res!349559 () Bool)

(assert (=> b!557613 (=> (not res!349559) (not e!321251))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun lt!253397 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5257 0))(
  ( (MissingZero!5257 (index!23255 (_ BitVec 32))) (Found!5257 (index!23256 (_ BitVec 32))) (Intermediate!5257 (undefined!6069 Bool) (index!23257 (_ BitVec 32)) (x!52306 (_ BitVec 32))) (Undefined!5257) (MissingVacant!5257 (index!23258 (_ BitVec 32))) )
))
(declare-fun lt!253398 () SeekEntryResult!5257)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35094 (_ BitVec 32)) SeekEntryResult!5257)

(assert (=> b!557613 (= res!349559 (= lt!253398 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253397 (select (store (arr!16852 a!3118) i!1132 k0!1914) j!142) (array!35095 (store (arr!16852 a!3118) i!1132 k0!1914) (size!17216 a!3118)) mask!3119)))))

(declare-fun lt!253399 () (_ BitVec 32))

(assert (=> b!557613 (= lt!253398 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253399 (select (arr!16852 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!557613 (= lt!253397 (toIndex!0 (select (store (arr!16852 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!557613 (= lt!253399 (toIndex!0 (select (arr!16852 a!3118) j!142) mask!3119))))

(declare-fun b!557614 () Bool)

(declare-fun res!349554 () Bool)

(assert (=> b!557614 (=> (not res!349554) (not e!321253))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!557614 (= res!349554 (validKeyInArray!0 k0!1914))))

(declare-fun b!557615 () Bool)

(declare-fun res!349553 () Bool)

(assert (=> b!557615 (=> (not res!349553) (not e!321253))))

(declare-fun arrayContainsKey!0 (array!35094 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!557615 (= res!349553 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!557616 () Bool)

(declare-fun res!349558 () Bool)

(assert (=> b!557616 (=> (not res!349558) (not e!321252))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35094 (_ BitVec 32)) Bool)

(assert (=> b!557616 (= res!349558 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!349561 () Bool)

(assert (=> start!51036 (=> (not res!349561) (not e!321253))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51036 (= res!349561 (validMask!0 mask!3119))))

(assert (=> start!51036 e!321253))

(assert (=> start!51036 true))

(declare-fun array_inv!12711 (array!35094) Bool)

(assert (=> start!51036 (array_inv!12711 a!3118)))

(declare-fun e!321255 () Bool)

(declare-fun b!557617 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35094 (_ BitVec 32)) SeekEntryResult!5257)

(assert (=> b!557617 (= e!321255 (= (seekEntryOrOpen!0 (select (arr!16852 a!3118) j!142) a!3118 mask!3119) (Found!5257 j!142)))))

(declare-fun b!557618 () Bool)

(get-info :version)

(assert (=> b!557618 (= e!321251 (not (or (not ((_ is Intermediate!5257) lt!253398)) (undefined!6069 lt!253398) (= (select (arr!16852 a!3118) (index!23257 lt!253398)) (select (arr!16852 a!3118) j!142)) (= (select (arr!16852 a!3118) (index!23257 lt!253398)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!3119 #b00000000000000000000000000000000) (bvslt (index!23257 lt!253398) #b00000000000000000000000000000000) (bvsge (index!23257 lt!253398) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52306 lt!253398) #b01111111111111111111111111111110) (bvslt (x!52306 lt!253398) #b00000000000000000000000000000000) (= (select (arr!16852 a!3118) (index!23257 lt!253398)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!557618 e!321255))

(declare-fun res!349555 () Bool)

(assert (=> b!557618 (=> (not res!349555) (not e!321255))))

(assert (=> b!557618 (= res!349555 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17359 0))(
  ( (Unit!17360) )
))
(declare-fun lt!253395 () Unit!17359)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35094 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17359)

(assert (=> b!557618 (= lt!253395 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!557619 () Bool)

(assert (=> b!557619 (= e!321253 e!321252)))

(declare-fun res!349560 () Bool)

(assert (=> b!557619 (=> (not res!349560) (not e!321252))))

(declare-fun lt!253396 () SeekEntryResult!5257)

(assert (=> b!557619 (= res!349560 (or (= lt!253396 (MissingZero!5257 i!1132)) (= lt!253396 (MissingVacant!5257 i!1132))))))

(assert (=> b!557619 (= lt!253396 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!557620 () Bool)

(declare-fun res!349552 () Bool)

(assert (=> b!557620 (=> (not res!349552) (not e!321253))))

(assert (=> b!557620 (= res!349552 (validKeyInArray!0 (select (arr!16852 a!3118) j!142)))))

(assert (= (and start!51036 res!349561) b!557611))

(assert (= (and b!557611 res!349556) b!557620))

(assert (= (and b!557620 res!349552) b!557614))

(assert (= (and b!557614 res!349554) b!557615))

(assert (= (and b!557615 res!349553) b!557619))

(assert (= (and b!557619 res!349560) b!557616))

(assert (= (and b!557616 res!349558) b!557612))

(assert (= (and b!557612 res!349557) b!557613))

(assert (= (and b!557613 res!349559) b!557618))

(assert (= (and b!557618 res!349555) b!557617))

(declare-fun m!535661 () Bool)

(assert (=> b!557613 m!535661))

(declare-fun m!535663 () Bool)

(assert (=> b!557613 m!535663))

(declare-fun m!535665 () Bool)

(assert (=> b!557613 m!535665))

(declare-fun m!535667 () Bool)

(assert (=> b!557613 m!535667))

(assert (=> b!557613 m!535661))

(assert (=> b!557613 m!535665))

(assert (=> b!557613 m!535661))

(declare-fun m!535669 () Bool)

(assert (=> b!557613 m!535669))

(declare-fun m!535671 () Bool)

(assert (=> b!557613 m!535671))

(assert (=> b!557613 m!535665))

(declare-fun m!535673 () Bool)

(assert (=> b!557613 m!535673))

(declare-fun m!535675 () Bool)

(assert (=> b!557616 m!535675))

(declare-fun m!535677 () Bool)

(assert (=> start!51036 m!535677))

(declare-fun m!535679 () Bool)

(assert (=> start!51036 m!535679))

(declare-fun m!535681 () Bool)

(assert (=> b!557618 m!535681))

(assert (=> b!557618 m!535661))

(declare-fun m!535683 () Bool)

(assert (=> b!557618 m!535683))

(declare-fun m!535685 () Bool)

(assert (=> b!557618 m!535685))

(declare-fun m!535687 () Bool)

(assert (=> b!557612 m!535687))

(declare-fun m!535689 () Bool)

(assert (=> b!557614 m!535689))

(assert (=> b!557620 m!535661))

(assert (=> b!557620 m!535661))

(declare-fun m!535691 () Bool)

(assert (=> b!557620 m!535691))

(declare-fun m!535693 () Bool)

(assert (=> b!557619 m!535693))

(declare-fun m!535695 () Bool)

(assert (=> b!557615 m!535695))

(assert (=> b!557617 m!535661))

(assert (=> b!557617 m!535661))

(declare-fun m!535697 () Bool)

(assert (=> b!557617 m!535697))

(check-sat (not b!557618) (not b!557615) (not b!557620) (not start!51036) (not b!557616) (not b!557619) (not b!557613) (not b!557617) (not b!557612) (not b!557614))
(check-sat)
(get-model)

(declare-fun b!557699 () Bool)

(declare-fun lt!253435 () SeekEntryResult!5257)

(assert (=> b!557699 (and (bvsge (index!23257 lt!253435) #b00000000000000000000000000000000) (bvslt (index!23257 lt!253435) (size!17216 (array!35095 (store (arr!16852 a!3118) i!1132 k0!1914) (size!17216 a!3118)))))))

(declare-fun res!349630 () Bool)

(assert (=> b!557699 (= res!349630 (= (select (arr!16852 (array!35095 (store (arr!16852 a!3118) i!1132 k0!1914) (size!17216 a!3118))) (index!23257 lt!253435)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!321298 () Bool)

(assert (=> b!557699 (=> res!349630 e!321298)))

(declare-fun b!557700 () Bool)

(declare-fun e!321299 () SeekEntryResult!5257)

(assert (=> b!557700 (= e!321299 (Intermediate!5257 true lt!253397 #b00000000000000000000000000000000))))

(declare-fun b!557701 () Bool)

(assert (=> b!557701 (and (bvsge (index!23257 lt!253435) #b00000000000000000000000000000000) (bvslt (index!23257 lt!253435) (size!17216 (array!35095 (store (arr!16852 a!3118) i!1132 k0!1914) (size!17216 a!3118)))))))

(assert (=> b!557701 (= e!321298 (= (select (arr!16852 (array!35095 (store (arr!16852 a!3118) i!1132 k0!1914) (size!17216 a!3118))) (index!23257 lt!253435)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!557702 () Bool)

(declare-fun e!321297 () Bool)

(declare-fun e!321300 () Bool)

(assert (=> b!557702 (= e!321297 e!321300)))

(declare-fun res!349629 () Bool)

(assert (=> b!557702 (= res!349629 (and ((_ is Intermediate!5257) lt!253435) (not (undefined!6069 lt!253435)) (bvslt (x!52306 lt!253435) #b01111111111111111111111111111110) (bvsge (x!52306 lt!253435) #b00000000000000000000000000000000) (bvsge (x!52306 lt!253435) #b00000000000000000000000000000000)))))

(assert (=> b!557702 (=> (not res!349629) (not e!321300))))

(declare-fun b!557703 () Bool)

(assert (=> b!557703 (and (bvsge (index!23257 lt!253435) #b00000000000000000000000000000000) (bvslt (index!23257 lt!253435) (size!17216 (array!35095 (store (arr!16852 a!3118) i!1132 k0!1914) (size!17216 a!3118)))))))

(declare-fun res!349628 () Bool)

(assert (=> b!557703 (= res!349628 (= (select (arr!16852 (array!35095 (store (arr!16852 a!3118) i!1132 k0!1914) (size!17216 a!3118))) (index!23257 lt!253435)) (select (store (arr!16852 a!3118) i!1132 k0!1914) j!142)))))

(assert (=> b!557703 (=> res!349628 e!321298)))

(assert (=> b!557703 (= e!321300 e!321298)))

(declare-fun d!83583 () Bool)

(assert (=> d!83583 e!321297))

(declare-fun c!64377 () Bool)

(assert (=> d!83583 (= c!64377 (and ((_ is Intermediate!5257) lt!253435) (undefined!6069 lt!253435)))))

(assert (=> d!83583 (= lt!253435 e!321299)))

(declare-fun c!64379 () Bool)

(assert (=> d!83583 (= c!64379 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!253434 () (_ BitVec 64))

(assert (=> d!83583 (= lt!253434 (select (arr!16852 (array!35095 (store (arr!16852 a!3118) i!1132 k0!1914) (size!17216 a!3118))) lt!253397))))

(assert (=> d!83583 (validMask!0 mask!3119)))

(assert (=> d!83583 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253397 (select (store (arr!16852 a!3118) i!1132 k0!1914) j!142) (array!35095 (store (arr!16852 a!3118) i!1132 k0!1914) (size!17216 a!3118)) mask!3119) lt!253435)))

(declare-fun b!557704 () Bool)

(declare-fun e!321296 () SeekEntryResult!5257)

(assert (=> b!557704 (= e!321296 (Intermediate!5257 false lt!253397 #b00000000000000000000000000000000))))

(declare-fun b!557705 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!557705 (= e!321296 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!253397 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) (select (store (arr!16852 a!3118) i!1132 k0!1914) j!142) (array!35095 (store (arr!16852 a!3118) i!1132 k0!1914) (size!17216 a!3118)) mask!3119))))

(declare-fun b!557706 () Bool)

(assert (=> b!557706 (= e!321297 (bvsge (x!52306 lt!253435) #b01111111111111111111111111111110))))

(declare-fun b!557707 () Bool)

(assert (=> b!557707 (= e!321299 e!321296)))

(declare-fun c!64378 () Bool)

(assert (=> b!557707 (= c!64378 (or (= lt!253434 (select (store (arr!16852 a!3118) i!1132 k0!1914) j!142)) (= (bvadd lt!253434 lt!253434) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!83583 c!64379) b!557700))

(assert (= (and d!83583 (not c!64379)) b!557707))

(assert (= (and b!557707 c!64378) b!557704))

(assert (= (and b!557707 (not c!64378)) b!557705))

(assert (= (and d!83583 c!64377) b!557706))

(assert (= (and d!83583 (not c!64377)) b!557702))

(assert (= (and b!557702 res!349629) b!557703))

(assert (= (and b!557703 (not res!349628)) b!557699))

(assert (= (and b!557699 (not res!349630)) b!557701))

(declare-fun m!535775 () Bool)

(assert (=> b!557705 m!535775))

(assert (=> b!557705 m!535775))

(assert (=> b!557705 m!535665))

(declare-fun m!535777 () Bool)

(assert (=> b!557705 m!535777))

(declare-fun m!535779 () Bool)

(assert (=> b!557703 m!535779))

(assert (=> b!557701 m!535779))

(declare-fun m!535781 () Bool)

(assert (=> d!83583 m!535781))

(assert (=> d!83583 m!535677))

(assert (=> b!557699 m!535779))

(assert (=> b!557613 d!83583))

(declare-fun b!557708 () Bool)

(declare-fun lt!253437 () SeekEntryResult!5257)

(assert (=> b!557708 (and (bvsge (index!23257 lt!253437) #b00000000000000000000000000000000) (bvslt (index!23257 lt!253437) (size!17216 a!3118)))))

(declare-fun res!349633 () Bool)

(assert (=> b!557708 (= res!349633 (= (select (arr!16852 a!3118) (index!23257 lt!253437)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!321303 () Bool)

(assert (=> b!557708 (=> res!349633 e!321303)))

(declare-fun b!557709 () Bool)

(declare-fun e!321304 () SeekEntryResult!5257)

(assert (=> b!557709 (= e!321304 (Intermediate!5257 true lt!253399 #b00000000000000000000000000000000))))

(declare-fun b!557710 () Bool)

(assert (=> b!557710 (and (bvsge (index!23257 lt!253437) #b00000000000000000000000000000000) (bvslt (index!23257 lt!253437) (size!17216 a!3118)))))

(assert (=> b!557710 (= e!321303 (= (select (arr!16852 a!3118) (index!23257 lt!253437)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!557711 () Bool)

(declare-fun e!321302 () Bool)

(declare-fun e!321305 () Bool)

(assert (=> b!557711 (= e!321302 e!321305)))

(declare-fun res!349632 () Bool)

(assert (=> b!557711 (= res!349632 (and ((_ is Intermediate!5257) lt!253437) (not (undefined!6069 lt!253437)) (bvslt (x!52306 lt!253437) #b01111111111111111111111111111110) (bvsge (x!52306 lt!253437) #b00000000000000000000000000000000) (bvsge (x!52306 lt!253437) #b00000000000000000000000000000000)))))

(assert (=> b!557711 (=> (not res!349632) (not e!321305))))

(declare-fun b!557712 () Bool)

(assert (=> b!557712 (and (bvsge (index!23257 lt!253437) #b00000000000000000000000000000000) (bvslt (index!23257 lt!253437) (size!17216 a!3118)))))

(declare-fun res!349631 () Bool)

(assert (=> b!557712 (= res!349631 (= (select (arr!16852 a!3118) (index!23257 lt!253437)) (select (arr!16852 a!3118) j!142)))))

(assert (=> b!557712 (=> res!349631 e!321303)))

(assert (=> b!557712 (= e!321305 e!321303)))

(declare-fun d!83587 () Bool)

(assert (=> d!83587 e!321302))

(declare-fun c!64380 () Bool)

(assert (=> d!83587 (= c!64380 (and ((_ is Intermediate!5257) lt!253437) (undefined!6069 lt!253437)))))

(assert (=> d!83587 (= lt!253437 e!321304)))

(declare-fun c!64382 () Bool)

(assert (=> d!83587 (= c!64382 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!253436 () (_ BitVec 64))

(assert (=> d!83587 (= lt!253436 (select (arr!16852 a!3118) lt!253399))))

(assert (=> d!83587 (validMask!0 mask!3119)))

(assert (=> d!83587 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253399 (select (arr!16852 a!3118) j!142) a!3118 mask!3119) lt!253437)))

(declare-fun b!557713 () Bool)

(declare-fun e!321301 () SeekEntryResult!5257)

(assert (=> b!557713 (= e!321301 (Intermediate!5257 false lt!253399 #b00000000000000000000000000000000))))

(declare-fun b!557714 () Bool)

(assert (=> b!557714 (= e!321301 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!253399 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) (select (arr!16852 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!557715 () Bool)

(assert (=> b!557715 (= e!321302 (bvsge (x!52306 lt!253437) #b01111111111111111111111111111110))))

(declare-fun b!557716 () Bool)

(assert (=> b!557716 (= e!321304 e!321301)))

(declare-fun c!64381 () Bool)

(assert (=> b!557716 (= c!64381 (or (= lt!253436 (select (arr!16852 a!3118) j!142)) (= (bvadd lt!253436 lt!253436) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!83587 c!64382) b!557709))

(assert (= (and d!83587 (not c!64382)) b!557716))

(assert (= (and b!557716 c!64381) b!557713))

(assert (= (and b!557716 (not c!64381)) b!557714))

(assert (= (and d!83587 c!64380) b!557715))

(assert (= (and d!83587 (not c!64380)) b!557711))

(assert (= (and b!557711 res!349632) b!557712))

(assert (= (and b!557712 (not res!349631)) b!557708))

(assert (= (and b!557708 (not res!349633)) b!557710))

(declare-fun m!535783 () Bool)

(assert (=> b!557714 m!535783))

(assert (=> b!557714 m!535783))

(assert (=> b!557714 m!535661))

(declare-fun m!535785 () Bool)

(assert (=> b!557714 m!535785))

(declare-fun m!535787 () Bool)

(assert (=> b!557712 m!535787))

(assert (=> b!557710 m!535787))

(declare-fun m!535789 () Bool)

(assert (=> d!83587 m!535789))

(assert (=> d!83587 m!535677))

(assert (=> b!557708 m!535787))

(assert (=> b!557613 d!83587))

(declare-fun d!83589 () Bool)

(declare-fun lt!253443 () (_ BitVec 32))

(declare-fun lt!253442 () (_ BitVec 32))

(assert (=> d!83589 (= lt!253443 (bvmul (bvxor lt!253442 (bvlshr lt!253442 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83589 (= lt!253442 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16852 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16852 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83589 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!349634 (let ((h!11832 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16852 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16852 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52310 (bvmul (bvxor h!11832 (bvlshr h!11832 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52310 (bvlshr x!52310 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!349634 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!349634 #b00000000000000000000000000000000))))))

(assert (=> d!83589 (= (toIndex!0 (select (store (arr!16852 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvand (bvxor lt!253443 (bvlshr lt!253443 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!557613 d!83589))

(declare-fun d!83591 () Bool)

(declare-fun lt!253445 () (_ BitVec 32))

(declare-fun lt!253444 () (_ BitVec 32))

(assert (=> d!83591 (= lt!253445 (bvmul (bvxor lt!253444 (bvlshr lt!253444 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83591 (= lt!253444 ((_ extract 31 0) (bvand (bvxor (select (arr!16852 a!3118) j!142) (bvlshr (select (arr!16852 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83591 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!349634 (let ((h!11832 ((_ extract 31 0) (bvand (bvxor (select (arr!16852 a!3118) j!142) (bvlshr (select (arr!16852 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52310 (bvmul (bvxor h!11832 (bvlshr h!11832 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52310 (bvlshr x!52310 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!349634 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!349634 #b00000000000000000000000000000000))))))

(assert (=> d!83591 (= (toIndex!0 (select (arr!16852 a!3118) j!142) mask!3119) (bvand (bvxor lt!253445 (bvlshr lt!253445 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!557613 d!83591))

(declare-fun d!83593 () Bool)

(declare-fun res!349657 () Bool)

(declare-fun e!321341 () Bool)

(assert (=> d!83593 (=> res!349657 e!321341)))

(assert (=> d!83593 (= res!349657 (bvsge j!142 (size!17216 a!3118)))))

(assert (=> d!83593 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!321341)))

(declare-fun b!557771 () Bool)

(declare-fun e!321342 () Bool)

(declare-fun call!32381 () Bool)

(assert (=> b!557771 (= e!321342 call!32381)))

(declare-fun bm!32378 () Bool)

(assert (=> bm!32378 (= call!32381 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!557772 () Bool)

(declare-fun e!321340 () Bool)

(assert (=> b!557772 (= e!321341 e!321340)))

(declare-fun c!64399 () Bool)

(assert (=> b!557772 (= c!64399 (validKeyInArray!0 (select (arr!16852 a!3118) j!142)))))

(declare-fun b!557773 () Bool)

(assert (=> b!557773 (= e!321340 e!321342)))

(declare-fun lt!253460 () (_ BitVec 64))

(assert (=> b!557773 (= lt!253460 (select (arr!16852 a!3118) j!142))))

(declare-fun lt!253462 () Unit!17359)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35094 (_ BitVec 64) (_ BitVec 32)) Unit!17359)

(assert (=> b!557773 (= lt!253462 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!253460 j!142))))

(assert (=> b!557773 (arrayContainsKey!0 a!3118 lt!253460 #b00000000000000000000000000000000)))

(declare-fun lt!253461 () Unit!17359)

(assert (=> b!557773 (= lt!253461 lt!253462)))

(declare-fun res!349658 () Bool)

(assert (=> b!557773 (= res!349658 (= (seekEntryOrOpen!0 (select (arr!16852 a!3118) j!142) a!3118 mask!3119) (Found!5257 j!142)))))

(assert (=> b!557773 (=> (not res!349658) (not e!321342))))

(declare-fun b!557774 () Bool)

(assert (=> b!557774 (= e!321340 call!32381)))

(assert (= (and d!83593 (not res!349657)) b!557772))

(assert (= (and b!557772 c!64399) b!557773))

(assert (= (and b!557772 (not c!64399)) b!557774))

(assert (= (and b!557773 res!349658) b!557771))

(assert (= (or b!557771 b!557774) bm!32378))

(declare-fun m!535807 () Bool)

(assert (=> bm!32378 m!535807))

(assert (=> b!557772 m!535661))

(assert (=> b!557772 m!535661))

(assert (=> b!557772 m!535691))

(assert (=> b!557773 m!535661))

(declare-fun m!535809 () Bool)

(assert (=> b!557773 m!535809))

(declare-fun m!535811 () Bool)

(assert (=> b!557773 m!535811))

(assert (=> b!557773 m!535661))

(assert (=> b!557773 m!535697))

(assert (=> b!557618 d!83593))

(declare-fun d!83601 () Bool)

(assert (=> d!83601 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!253473 () Unit!17359)

(declare-fun choose!38 (array!35094 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17359)

(assert (=> d!83601 (= lt!253473 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!83601 (validMask!0 mask!3119)))

(assert (=> d!83601 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!253473)))

(declare-fun bs!17375 () Bool)

(assert (= bs!17375 d!83601))

(assert (=> bs!17375 m!535683))

(declare-fun m!535821 () Bool)

(assert (=> bs!17375 m!535821))

(assert (=> bs!17375 m!535677))

(assert (=> b!557618 d!83601))

(declare-fun b!557823 () Bool)

(declare-fun e!321379 () SeekEntryResult!5257)

(declare-fun lt!253497 () SeekEntryResult!5257)

(assert (=> b!557823 (= e!321379 (MissingZero!5257 (index!23257 lt!253497)))))

(declare-fun b!557824 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35094 (_ BitVec 32)) SeekEntryResult!5257)

(assert (=> b!557824 (= e!321379 (seekKeyOrZeroReturnVacant!0 (x!52306 lt!253497) (index!23257 lt!253497) (index!23257 lt!253497) k0!1914 a!3118 mask!3119))))

(declare-fun d!83611 () Bool)

(declare-fun lt!253495 () SeekEntryResult!5257)

(assert (=> d!83611 (and (or ((_ is Undefined!5257) lt!253495) (not ((_ is Found!5257) lt!253495)) (and (bvsge (index!23256 lt!253495) #b00000000000000000000000000000000) (bvslt (index!23256 lt!253495) (size!17216 a!3118)))) (or ((_ is Undefined!5257) lt!253495) ((_ is Found!5257) lt!253495) (not ((_ is MissingZero!5257) lt!253495)) (and (bvsge (index!23255 lt!253495) #b00000000000000000000000000000000) (bvslt (index!23255 lt!253495) (size!17216 a!3118)))) (or ((_ is Undefined!5257) lt!253495) ((_ is Found!5257) lt!253495) ((_ is MissingZero!5257) lt!253495) (not ((_ is MissingVacant!5257) lt!253495)) (and (bvsge (index!23258 lt!253495) #b00000000000000000000000000000000) (bvslt (index!23258 lt!253495) (size!17216 a!3118)))) (or ((_ is Undefined!5257) lt!253495) (ite ((_ is Found!5257) lt!253495) (= (select (arr!16852 a!3118) (index!23256 lt!253495)) k0!1914) (ite ((_ is MissingZero!5257) lt!253495) (= (select (arr!16852 a!3118) (index!23255 lt!253495)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5257) lt!253495) (= (select (arr!16852 a!3118) (index!23258 lt!253495)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!321378 () SeekEntryResult!5257)

(assert (=> d!83611 (= lt!253495 e!321378)))

(declare-fun c!64415 () Bool)

(assert (=> d!83611 (= c!64415 (and ((_ is Intermediate!5257) lt!253497) (undefined!6069 lt!253497)))))

(assert (=> d!83611 (= lt!253497 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!83611 (validMask!0 mask!3119)))

(assert (=> d!83611 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!253495)))

(declare-fun b!557825 () Bool)

(assert (=> b!557825 (= e!321378 Undefined!5257)))

(declare-fun b!557826 () Bool)

(declare-fun c!64416 () Bool)

(declare-fun lt!253496 () (_ BitVec 64))

(assert (=> b!557826 (= c!64416 (= lt!253496 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!321377 () SeekEntryResult!5257)

(assert (=> b!557826 (= e!321377 e!321379)))

(declare-fun b!557827 () Bool)

(assert (=> b!557827 (= e!321377 (Found!5257 (index!23257 lt!253497)))))

(declare-fun b!557828 () Bool)

(assert (=> b!557828 (= e!321378 e!321377)))

(assert (=> b!557828 (= lt!253496 (select (arr!16852 a!3118) (index!23257 lt!253497)))))

(declare-fun c!64414 () Bool)

(assert (=> b!557828 (= c!64414 (= lt!253496 k0!1914))))

(assert (= (and d!83611 c!64415) b!557825))

(assert (= (and d!83611 (not c!64415)) b!557828))

(assert (= (and b!557828 c!64414) b!557827))

(assert (= (and b!557828 (not c!64414)) b!557826))

(assert (= (and b!557826 c!64416) b!557823))

(assert (= (and b!557826 (not c!64416)) b!557824))

(declare-fun m!535847 () Bool)

(assert (=> b!557824 m!535847))

(declare-fun m!535849 () Bool)

(assert (=> d!83611 m!535849))

(declare-fun m!535851 () Bool)

(assert (=> d!83611 m!535851))

(declare-fun m!535853 () Bool)

(assert (=> d!83611 m!535853))

(assert (=> d!83611 m!535677))

(assert (=> d!83611 m!535853))

(declare-fun m!535855 () Bool)

(assert (=> d!83611 m!535855))

(declare-fun m!535857 () Bool)

(assert (=> d!83611 m!535857))

(declare-fun m!535859 () Bool)

(assert (=> b!557828 m!535859))

(assert (=> b!557619 d!83611))

(declare-fun b!557829 () Bool)

(declare-fun e!321382 () SeekEntryResult!5257)

(declare-fun lt!253500 () SeekEntryResult!5257)

(assert (=> b!557829 (= e!321382 (MissingZero!5257 (index!23257 lt!253500)))))

(declare-fun b!557830 () Bool)

(assert (=> b!557830 (= e!321382 (seekKeyOrZeroReturnVacant!0 (x!52306 lt!253500) (index!23257 lt!253500) (index!23257 lt!253500) (select (arr!16852 a!3118) j!142) a!3118 mask!3119))))

(declare-fun d!83625 () Bool)

(declare-fun lt!253498 () SeekEntryResult!5257)

(assert (=> d!83625 (and (or ((_ is Undefined!5257) lt!253498) (not ((_ is Found!5257) lt!253498)) (and (bvsge (index!23256 lt!253498) #b00000000000000000000000000000000) (bvslt (index!23256 lt!253498) (size!17216 a!3118)))) (or ((_ is Undefined!5257) lt!253498) ((_ is Found!5257) lt!253498) (not ((_ is MissingZero!5257) lt!253498)) (and (bvsge (index!23255 lt!253498) #b00000000000000000000000000000000) (bvslt (index!23255 lt!253498) (size!17216 a!3118)))) (or ((_ is Undefined!5257) lt!253498) ((_ is Found!5257) lt!253498) ((_ is MissingZero!5257) lt!253498) (not ((_ is MissingVacant!5257) lt!253498)) (and (bvsge (index!23258 lt!253498) #b00000000000000000000000000000000) (bvslt (index!23258 lt!253498) (size!17216 a!3118)))) (or ((_ is Undefined!5257) lt!253498) (ite ((_ is Found!5257) lt!253498) (= (select (arr!16852 a!3118) (index!23256 lt!253498)) (select (arr!16852 a!3118) j!142)) (ite ((_ is MissingZero!5257) lt!253498) (= (select (arr!16852 a!3118) (index!23255 lt!253498)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5257) lt!253498) (= (select (arr!16852 a!3118) (index!23258 lt!253498)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!321381 () SeekEntryResult!5257)

(assert (=> d!83625 (= lt!253498 e!321381)))

(declare-fun c!64418 () Bool)

(assert (=> d!83625 (= c!64418 (and ((_ is Intermediate!5257) lt!253500) (undefined!6069 lt!253500)))))

(assert (=> d!83625 (= lt!253500 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16852 a!3118) j!142) mask!3119) (select (arr!16852 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!83625 (validMask!0 mask!3119)))

(assert (=> d!83625 (= (seekEntryOrOpen!0 (select (arr!16852 a!3118) j!142) a!3118 mask!3119) lt!253498)))

(declare-fun b!557831 () Bool)

(assert (=> b!557831 (= e!321381 Undefined!5257)))

(declare-fun b!557832 () Bool)

(declare-fun c!64419 () Bool)

(declare-fun lt!253499 () (_ BitVec 64))

(assert (=> b!557832 (= c!64419 (= lt!253499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!321380 () SeekEntryResult!5257)

(assert (=> b!557832 (= e!321380 e!321382)))

(declare-fun b!557833 () Bool)

(assert (=> b!557833 (= e!321380 (Found!5257 (index!23257 lt!253500)))))

(declare-fun b!557834 () Bool)

(assert (=> b!557834 (= e!321381 e!321380)))

(assert (=> b!557834 (= lt!253499 (select (arr!16852 a!3118) (index!23257 lt!253500)))))

(declare-fun c!64417 () Bool)

(assert (=> b!557834 (= c!64417 (= lt!253499 (select (arr!16852 a!3118) j!142)))))

(assert (= (and d!83625 c!64418) b!557831))

(assert (= (and d!83625 (not c!64418)) b!557834))

(assert (= (and b!557834 c!64417) b!557833))

(assert (= (and b!557834 (not c!64417)) b!557832))

(assert (= (and b!557832 c!64419) b!557829))

(assert (= (and b!557832 (not c!64419)) b!557830))

(assert (=> b!557830 m!535661))

(declare-fun m!535861 () Bool)

(assert (=> b!557830 m!535861))

(declare-fun m!535863 () Bool)

(assert (=> d!83625 m!535863))

(declare-fun m!535865 () Bool)

(assert (=> d!83625 m!535865))

(assert (=> d!83625 m!535661))

(assert (=> d!83625 m!535663))

(assert (=> d!83625 m!535677))

(assert (=> d!83625 m!535663))

(assert (=> d!83625 m!535661))

(declare-fun m!535867 () Bool)

(assert (=> d!83625 m!535867))

(declare-fun m!535869 () Bool)

(assert (=> d!83625 m!535869))

(declare-fun m!535871 () Bool)

(assert (=> b!557834 m!535871))

(assert (=> b!557617 d!83625))

(declare-fun b!557867 () Bool)

(declare-fun e!321404 () Bool)

(declare-fun contains!2827 (List!10839 (_ BitVec 64)) Bool)

(assert (=> b!557867 (= e!321404 (contains!2827 Nil!10836 (select (arr!16852 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!557868 () Bool)

(declare-fun e!321402 () Bool)

(declare-fun call!32392 () Bool)

(assert (=> b!557868 (= e!321402 call!32392)))

(declare-fun b!557869 () Bool)

(assert (=> b!557869 (= e!321402 call!32392)))

(declare-fun b!557870 () Bool)

(declare-fun e!321405 () Bool)

(assert (=> b!557870 (= e!321405 e!321402)))

(declare-fun c!64433 () Bool)

(assert (=> b!557870 (= c!64433 (validKeyInArray!0 (select (arr!16852 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!83627 () Bool)

(declare-fun res!349687 () Bool)

(declare-fun e!321403 () Bool)

(assert (=> d!83627 (=> res!349687 e!321403)))

(assert (=> d!83627 (= res!349687 (bvsge #b00000000000000000000000000000000 (size!17216 a!3118)))))

(assert (=> d!83627 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10836) e!321403)))

(declare-fun bm!32389 () Bool)

(assert (=> bm!32389 (= call!32392 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64433 (Cons!10835 (select (arr!16852 a!3118) #b00000000000000000000000000000000) Nil!10836) Nil!10836)))))

(declare-fun b!557871 () Bool)

(assert (=> b!557871 (= e!321403 e!321405)))

(declare-fun res!349686 () Bool)

(assert (=> b!557871 (=> (not res!349686) (not e!321405))))

(assert (=> b!557871 (= res!349686 (not e!321404))))

(declare-fun res!349688 () Bool)

(assert (=> b!557871 (=> (not res!349688) (not e!321404))))

(assert (=> b!557871 (= res!349688 (validKeyInArray!0 (select (arr!16852 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!83627 (not res!349687)) b!557871))

(assert (= (and b!557871 res!349688) b!557867))

(assert (= (and b!557871 res!349686) b!557870))

(assert (= (and b!557870 c!64433) b!557869))

(assert (= (and b!557870 (not c!64433)) b!557868))

(assert (= (or b!557869 b!557868) bm!32389))

(declare-fun m!535873 () Bool)

(assert (=> b!557867 m!535873))

(assert (=> b!557867 m!535873))

(declare-fun m!535877 () Bool)

(assert (=> b!557867 m!535877))

(assert (=> b!557870 m!535873))

(assert (=> b!557870 m!535873))

(declare-fun m!535883 () Bool)

(assert (=> b!557870 m!535883))

(assert (=> bm!32389 m!535873))

(declare-fun m!535889 () Bool)

(assert (=> bm!32389 m!535889))

(assert (=> b!557871 m!535873))

(assert (=> b!557871 m!535873))

(assert (=> b!557871 m!535883))

(assert (=> b!557612 d!83627))

(declare-fun d!83631 () Bool)

(assert (=> d!83631 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!51036 d!83631))

(declare-fun d!83639 () Bool)

(assert (=> d!83639 (= (array_inv!12711 a!3118) (bvsge (size!17216 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!51036 d!83639))

(declare-fun d!83641 () Bool)

(declare-fun res!349701 () Bool)

(declare-fun e!321429 () Bool)

(assert (=> d!83641 (=> res!349701 e!321429)))

(assert (=> d!83641 (= res!349701 (bvsge #b00000000000000000000000000000000 (size!17216 a!3118)))))

(assert (=> d!83641 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!321429)))

(declare-fun b!557904 () Bool)

(declare-fun e!321430 () Bool)

(declare-fun call!32396 () Bool)

(assert (=> b!557904 (= e!321430 call!32396)))

(declare-fun bm!32393 () Bool)

(assert (=> bm!32393 (= call!32396 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!557905 () Bool)

(declare-fun e!321428 () Bool)

(assert (=> b!557905 (= e!321429 e!321428)))

(declare-fun c!64444 () Bool)

(assert (=> b!557905 (= c!64444 (validKeyInArray!0 (select (arr!16852 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!557906 () Bool)

(assert (=> b!557906 (= e!321428 e!321430)))

(declare-fun lt!253528 () (_ BitVec 64))

(assert (=> b!557906 (= lt!253528 (select (arr!16852 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!253530 () Unit!17359)

(assert (=> b!557906 (= lt!253530 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!253528 #b00000000000000000000000000000000))))

(assert (=> b!557906 (arrayContainsKey!0 a!3118 lt!253528 #b00000000000000000000000000000000)))

(declare-fun lt!253529 () Unit!17359)

(assert (=> b!557906 (= lt!253529 lt!253530)))

(declare-fun res!349702 () Bool)

(assert (=> b!557906 (= res!349702 (= (seekEntryOrOpen!0 (select (arr!16852 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5257 #b00000000000000000000000000000000)))))

(assert (=> b!557906 (=> (not res!349702) (not e!321430))))

(declare-fun b!557907 () Bool)

(assert (=> b!557907 (= e!321428 call!32396)))

(assert (= (and d!83641 (not res!349701)) b!557905))

(assert (= (and b!557905 c!64444) b!557906))

(assert (= (and b!557905 (not c!64444)) b!557907))

(assert (= (and b!557906 res!349702) b!557904))

(assert (= (or b!557904 b!557907) bm!32393))

(declare-fun m!535913 () Bool)

(assert (=> bm!32393 m!535913))

(assert (=> b!557905 m!535873))

(assert (=> b!557905 m!535873))

(assert (=> b!557905 m!535883))

(assert (=> b!557906 m!535873))

(declare-fun m!535915 () Bool)

(assert (=> b!557906 m!535915))

(declare-fun m!535917 () Bool)

(assert (=> b!557906 m!535917))

(assert (=> b!557906 m!535873))

(declare-fun m!535919 () Bool)

(assert (=> b!557906 m!535919))

(assert (=> b!557616 d!83641))

(declare-fun d!83643 () Bool)

(assert (=> d!83643 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!557614 d!83643))

(declare-fun d!83645 () Bool)

(declare-fun res!349707 () Bool)

(declare-fun e!321438 () Bool)

(assert (=> d!83645 (=> res!349707 e!321438)))

(assert (=> d!83645 (= res!349707 (= (select (arr!16852 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!83645 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!321438)))

(declare-fun b!557918 () Bool)

(declare-fun e!321439 () Bool)

(assert (=> b!557918 (= e!321438 e!321439)))

(declare-fun res!349708 () Bool)

(assert (=> b!557918 (=> (not res!349708) (not e!321439))))

(assert (=> b!557918 (= res!349708 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17216 a!3118)))))

(declare-fun b!557919 () Bool)

(assert (=> b!557919 (= e!321439 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!83645 (not res!349707)) b!557918))

(assert (= (and b!557918 res!349708) b!557919))

(assert (=> d!83645 m!535873))

(declare-fun m!535937 () Bool)

(assert (=> b!557919 m!535937))

(assert (=> b!557615 d!83645))

(declare-fun d!83651 () Bool)

(assert (=> d!83651 (= (validKeyInArray!0 (select (arr!16852 a!3118) j!142)) (and (not (= (select (arr!16852 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16852 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!557620 d!83651))

(check-sat (not d!83583) (not b!557906) (not b!557905) (not b!557824) (not b!557919) (not b!557705) (not d!83601) (not b!557772) (not b!557867) (not b!557773) (not d!83625) (not b!557870) (not b!557830) (not d!83611) (not bm!32393) (not b!557871) (not bm!32389) (not bm!32378) (not d!83587) (not b!557714))
(check-sat)
