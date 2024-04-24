; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51870 () Bool)

(assert start!51870)

(declare-fun b!566962 () Bool)

(declare-fun res!357625 () Bool)

(declare-fun e!326300 () Bool)

(assert (=> b!566962 (=> (not res!357625) (not e!326300))))

(declare-datatypes ((array!35568 0))(
  ( (array!35569 (arr!17080 (Array (_ BitVec 32) (_ BitVec 64))) (size!17444 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35568)

(declare-datatypes ((List!11067 0))(
  ( (Nil!11064) (Cons!11063 (h!12075 (_ BitVec 64)) (t!17287 List!11067)) )
))
(declare-fun arrayNoDuplicates!0 (array!35568 (_ BitVec 32) List!11067) Bool)

(assert (=> b!566962 (= res!357625 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11064))))

(declare-fun b!566964 () Bool)

(declare-fun res!357628 () Bool)

(declare-fun e!326301 () Bool)

(assert (=> b!566964 (=> (not res!357628) (not e!326301))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!566964 (= res!357628 (validKeyInArray!0 (select (arr!17080 a!3118) j!142)))))

(declare-fun b!566965 () Bool)

(declare-fun res!357631 () Bool)

(assert (=> b!566965 (=> (not res!357631) (not e!326300))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35568 (_ BitVec 32)) Bool)

(assert (=> b!566965 (= res!357631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!566966 () Bool)

(declare-fun e!326304 () Bool)

(declare-datatypes ((SeekEntryResult!5485 0))(
  ( (MissingZero!5485 (index!24167 (_ BitVec 32))) (Found!5485 (index!24168 (_ BitVec 32))) (Intermediate!5485 (undefined!6297 Bool) (index!24169 (_ BitVec 32)) (x!53187 (_ BitVec 32))) (Undefined!5485) (MissingVacant!5485 (index!24170 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35568 (_ BitVec 32)) SeekEntryResult!5485)

(assert (=> b!566966 (= e!326304 (= (seekEntryOrOpen!0 (select (arr!17080 a!3118) j!142) a!3118 mask!3119) (Found!5485 j!142)))))

(declare-fun b!566967 () Bool)

(declare-fun e!326302 () Bool)

(declare-fun lt!258400 () SeekEntryResult!5485)

(get-info :version)

(assert (=> b!566967 (= e!326302 (not (or (not ((_ is Intermediate!5485) lt!258400)) (undefined!6297 lt!258400) (and (bvsge (index!24169 lt!258400) #b00000000000000000000000000000000) (bvslt (index!24169 lt!258400) (size!17444 a!3118))))))))

(assert (=> b!566967 e!326304))

(declare-fun res!357626 () Bool)

(assert (=> b!566967 (=> (not res!357626) (not e!326304))))

(assert (=> b!566967 (= res!357626 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17743 0))(
  ( (Unit!17744) )
))
(declare-fun lt!258401 () Unit!17743)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35568 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17743)

(assert (=> b!566967 (= lt!258401 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!566968 () Bool)

(assert (=> b!566968 (= e!326300 e!326302)))

(declare-fun res!357633 () Bool)

(assert (=> b!566968 (=> (not res!357633) (not e!326302))))

(declare-fun lt!258403 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35568 (_ BitVec 32)) SeekEntryResult!5485)

(assert (=> b!566968 (= res!357633 (= lt!258400 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258403 (select (store (arr!17080 a!3118) i!1132 k0!1914) j!142) (array!35569 (store (arr!17080 a!3118) i!1132 k0!1914) (size!17444 a!3118)) mask!3119)))))

(declare-fun lt!258399 () (_ BitVec 32))

(assert (=> b!566968 (= lt!258400 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258399 (select (arr!17080 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!566968 (= lt!258403 (toIndex!0 (select (store (arr!17080 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!566968 (= lt!258399 (toIndex!0 (select (arr!17080 a!3118) j!142) mask!3119))))

(declare-fun b!566969 () Bool)

(declare-fun res!357634 () Bool)

(assert (=> b!566969 (=> (not res!357634) (not e!326301))))

(assert (=> b!566969 (= res!357634 (and (= (size!17444 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17444 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17444 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!566970 () Bool)

(assert (=> b!566970 (= e!326301 e!326300)))

(declare-fun res!357627 () Bool)

(assert (=> b!566970 (=> (not res!357627) (not e!326300))))

(declare-fun lt!258402 () SeekEntryResult!5485)

(assert (=> b!566970 (= res!357627 (or (= lt!258402 (MissingZero!5485 i!1132)) (= lt!258402 (MissingVacant!5485 i!1132))))))

(assert (=> b!566970 (= lt!258402 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!566971 () Bool)

(declare-fun res!357630 () Bool)

(assert (=> b!566971 (=> (not res!357630) (not e!326301))))

(assert (=> b!566971 (= res!357630 (validKeyInArray!0 k0!1914))))

(declare-fun res!357632 () Bool)

(assert (=> start!51870 (=> (not res!357632) (not e!326301))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51870 (= res!357632 (validMask!0 mask!3119))))

(assert (=> start!51870 e!326301))

(assert (=> start!51870 true))

(declare-fun array_inv!12939 (array!35568) Bool)

(assert (=> start!51870 (array_inv!12939 a!3118)))

(declare-fun b!566963 () Bool)

(declare-fun res!357629 () Bool)

(assert (=> b!566963 (=> (not res!357629) (not e!326301))))

(declare-fun arrayContainsKey!0 (array!35568 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!566963 (= res!357629 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!51870 res!357632) b!566969))

(assert (= (and b!566969 res!357634) b!566964))

(assert (= (and b!566964 res!357628) b!566971))

(assert (= (and b!566971 res!357630) b!566963))

(assert (= (and b!566963 res!357629) b!566970))

(assert (= (and b!566970 res!357627) b!566965))

(assert (= (and b!566965 res!357631) b!566962))

(assert (= (and b!566962 res!357625) b!566968))

(assert (= (and b!566968 res!357633) b!566967))

(assert (= (and b!566967 res!357626) b!566966))

(declare-fun m!545699 () Bool)

(assert (=> b!566964 m!545699))

(assert (=> b!566964 m!545699))

(declare-fun m!545701 () Bool)

(assert (=> b!566964 m!545701))

(declare-fun m!545703 () Bool)

(assert (=> b!566967 m!545703))

(declare-fun m!545705 () Bool)

(assert (=> b!566967 m!545705))

(declare-fun m!545707 () Bool)

(assert (=> b!566962 m!545707))

(declare-fun m!545709 () Bool)

(assert (=> b!566970 m!545709))

(assert (=> b!566966 m!545699))

(assert (=> b!566966 m!545699))

(declare-fun m!545711 () Bool)

(assert (=> b!566966 m!545711))

(declare-fun m!545713 () Bool)

(assert (=> b!566965 m!545713))

(declare-fun m!545715 () Bool)

(assert (=> start!51870 m!545715))

(declare-fun m!545717 () Bool)

(assert (=> start!51870 m!545717))

(assert (=> b!566968 m!545699))

(declare-fun m!545719 () Bool)

(assert (=> b!566968 m!545719))

(assert (=> b!566968 m!545699))

(declare-fun m!545721 () Bool)

(assert (=> b!566968 m!545721))

(declare-fun m!545723 () Bool)

(assert (=> b!566968 m!545723))

(assert (=> b!566968 m!545721))

(assert (=> b!566968 m!545699))

(declare-fun m!545725 () Bool)

(assert (=> b!566968 m!545725))

(declare-fun m!545727 () Bool)

(assert (=> b!566968 m!545727))

(assert (=> b!566968 m!545721))

(declare-fun m!545729 () Bool)

(assert (=> b!566968 m!545729))

(declare-fun m!545731 () Bool)

(assert (=> b!566971 m!545731))

(declare-fun m!545733 () Bool)

(assert (=> b!566963 m!545733))

(check-sat (not b!566971) (not b!566966) (not b!566968) (not b!566970) (not start!51870) (not b!566967) (not b!566962) (not b!566965) (not b!566964) (not b!566963))
(check-sat)
(get-model)

(declare-fun b!567040 () Bool)

(declare-fun e!326341 () Bool)

(declare-fun call!32505 () Bool)

(assert (=> b!567040 (= e!326341 call!32505)))

(declare-fun b!567041 () Bool)

(declare-fun e!326343 () Bool)

(assert (=> b!567041 (= e!326343 call!32505)))

(declare-fun b!567042 () Bool)

(assert (=> b!567042 (= e!326343 e!326341)))

(declare-fun lt!258442 () (_ BitVec 64))

(assert (=> b!567042 (= lt!258442 (select (arr!17080 a!3118) j!142))))

(declare-fun lt!258441 () Unit!17743)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35568 (_ BitVec 64) (_ BitVec 32)) Unit!17743)

(assert (=> b!567042 (= lt!258441 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!258442 j!142))))

(assert (=> b!567042 (arrayContainsKey!0 a!3118 lt!258442 #b00000000000000000000000000000000)))

(declare-fun lt!258440 () Unit!17743)

(assert (=> b!567042 (= lt!258440 lt!258441)))

(declare-fun res!357699 () Bool)

(assert (=> b!567042 (= res!357699 (= (seekEntryOrOpen!0 (select (arr!17080 a!3118) j!142) a!3118 mask!3119) (Found!5485 j!142)))))

(assert (=> b!567042 (=> (not res!357699) (not e!326341))))

(declare-fun b!567043 () Bool)

(declare-fun e!326342 () Bool)

(assert (=> b!567043 (= e!326342 e!326343)))

(declare-fun c!65021 () Bool)

(assert (=> b!567043 (= c!65021 (validKeyInArray!0 (select (arr!17080 a!3118) j!142)))))

(declare-fun d!84299 () Bool)

(declare-fun res!357700 () Bool)

(assert (=> d!84299 (=> res!357700 e!326342)))

(assert (=> d!84299 (= res!357700 (bvsge j!142 (size!17444 a!3118)))))

(assert (=> d!84299 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!326342)))

(declare-fun bm!32502 () Bool)

(assert (=> bm!32502 (= call!32505 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!84299 (not res!357700)) b!567043))

(assert (= (and b!567043 c!65021) b!567042))

(assert (= (and b!567043 (not c!65021)) b!567041))

(assert (= (and b!567042 res!357699) b!567040))

(assert (= (or b!567040 b!567041) bm!32502))

(assert (=> b!567042 m!545699))

(declare-fun m!545807 () Bool)

(assert (=> b!567042 m!545807))

(declare-fun m!545809 () Bool)

(assert (=> b!567042 m!545809))

(assert (=> b!567042 m!545699))

(assert (=> b!567042 m!545711))

(assert (=> b!567043 m!545699))

(assert (=> b!567043 m!545699))

(assert (=> b!567043 m!545701))

(declare-fun m!545811 () Bool)

(assert (=> bm!32502 m!545811))

(assert (=> b!566967 d!84299))

(declare-fun d!84305 () Bool)

(assert (=> d!84305 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!258445 () Unit!17743)

(declare-fun choose!38 (array!35568 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17743)

(assert (=> d!84305 (= lt!258445 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!84305 (validMask!0 mask!3119)))

(assert (=> d!84305 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!258445)))

(declare-fun bs!17621 () Bool)

(assert (= bs!17621 d!84305))

(assert (=> bs!17621 m!545703))

(declare-fun m!545813 () Bool)

(assert (=> bs!17621 m!545813))

(assert (=> bs!17621 m!545715))

(assert (=> b!566967 d!84305))

(declare-fun d!84307 () Bool)

(declare-fun res!357707 () Bool)

(declare-fun e!326355 () Bool)

(assert (=> d!84307 (=> res!357707 e!326355)))

(assert (=> d!84307 (= res!357707 (bvsge #b00000000000000000000000000000000 (size!17444 a!3118)))))

(assert (=> d!84307 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11064) e!326355)))

(declare-fun b!567054 () Bool)

(declare-fun e!326352 () Bool)

(declare-fun call!32508 () Bool)

(assert (=> b!567054 (= e!326352 call!32508)))

(declare-fun b!567055 () Bool)

(declare-fun e!326354 () Bool)

(assert (=> b!567055 (= e!326355 e!326354)))

(declare-fun res!357709 () Bool)

(assert (=> b!567055 (=> (not res!357709) (not e!326354))))

(declare-fun e!326353 () Bool)

(assert (=> b!567055 (= res!357709 (not e!326353))))

(declare-fun res!357708 () Bool)

(assert (=> b!567055 (=> (not res!357708) (not e!326353))))

(assert (=> b!567055 (= res!357708 (validKeyInArray!0 (select (arr!17080 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!567056 () Bool)

(assert (=> b!567056 (= e!326352 call!32508)))

(declare-fun b!567057 () Bool)

(declare-fun contains!2841 (List!11067 (_ BitVec 64)) Bool)

(assert (=> b!567057 (= e!326353 (contains!2841 Nil!11064 (select (arr!17080 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32505 () Bool)

(declare-fun c!65024 () Bool)

(assert (=> bm!32505 (= call!32508 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!65024 (Cons!11063 (select (arr!17080 a!3118) #b00000000000000000000000000000000) Nil!11064) Nil!11064)))))

(declare-fun b!567058 () Bool)

(assert (=> b!567058 (= e!326354 e!326352)))

(assert (=> b!567058 (= c!65024 (validKeyInArray!0 (select (arr!17080 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!84307 (not res!357707)) b!567055))

(assert (= (and b!567055 res!357708) b!567057))

(assert (= (and b!567055 res!357709) b!567058))

(assert (= (and b!567058 c!65024) b!567056))

(assert (= (and b!567058 (not c!65024)) b!567054))

(assert (= (or b!567056 b!567054) bm!32505))

(declare-fun m!545815 () Bool)

(assert (=> b!567055 m!545815))

(assert (=> b!567055 m!545815))

(declare-fun m!545817 () Bool)

(assert (=> b!567055 m!545817))

(assert (=> b!567057 m!545815))

(assert (=> b!567057 m!545815))

(declare-fun m!545819 () Bool)

(assert (=> b!567057 m!545819))

(assert (=> bm!32505 m!545815))

(declare-fun m!545821 () Bool)

(assert (=> bm!32505 m!545821))

(assert (=> b!567058 m!545815))

(assert (=> b!567058 m!545815))

(assert (=> b!567058 m!545817))

(assert (=> b!566962 d!84307))

(declare-fun b!567143 () Bool)

(declare-fun lt!258479 () SeekEntryResult!5485)

(assert (=> b!567143 (and (bvsge (index!24169 lt!258479) #b00000000000000000000000000000000) (bvslt (index!24169 lt!258479) (size!17444 (array!35569 (store (arr!17080 a!3118) i!1132 k0!1914) (size!17444 a!3118)))))))

(declare-fun res!357751 () Bool)

(assert (=> b!567143 (= res!357751 (= (select (arr!17080 (array!35569 (store (arr!17080 a!3118) i!1132 k0!1914) (size!17444 a!3118))) (index!24169 lt!258479)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!326413 () Bool)

(assert (=> b!567143 (=> res!357751 e!326413)))

(declare-fun b!567144 () Bool)

(declare-fun e!326414 () SeekEntryResult!5485)

(declare-fun e!326411 () SeekEntryResult!5485)

(assert (=> b!567144 (= e!326414 e!326411)))

(declare-fun c!65048 () Bool)

(declare-fun lt!258478 () (_ BitVec 64))

(assert (=> b!567144 (= c!65048 (or (= lt!258478 (select (store (arr!17080 a!3118) i!1132 k0!1914) j!142)) (= (bvadd lt!258478 lt!258478) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!567145 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!567145 (= e!326411 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!258403 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) (select (store (arr!17080 a!3118) i!1132 k0!1914) j!142) (array!35569 (store (arr!17080 a!3118) i!1132 k0!1914) (size!17444 a!3118)) mask!3119))))

(declare-fun b!567146 () Bool)

(assert (=> b!567146 (and (bvsge (index!24169 lt!258479) #b00000000000000000000000000000000) (bvslt (index!24169 lt!258479) (size!17444 (array!35569 (store (arr!17080 a!3118) i!1132 k0!1914) (size!17444 a!3118)))))))

(declare-fun res!357749 () Bool)

(assert (=> b!567146 (= res!357749 (= (select (arr!17080 (array!35569 (store (arr!17080 a!3118) i!1132 k0!1914) (size!17444 a!3118))) (index!24169 lt!258479)) (select (store (arr!17080 a!3118) i!1132 k0!1914) j!142)))))

(assert (=> b!567146 (=> res!357749 e!326413)))

(declare-fun e!326412 () Bool)

(assert (=> b!567146 (= e!326412 e!326413)))

(declare-fun b!567147 () Bool)

(declare-fun e!326415 () Bool)

(assert (=> b!567147 (= e!326415 e!326412)))

(declare-fun res!357750 () Bool)

(assert (=> b!567147 (= res!357750 (and ((_ is Intermediate!5485) lt!258479) (not (undefined!6297 lt!258479)) (bvslt (x!53187 lt!258479) #b01111111111111111111111111111110) (bvsge (x!53187 lt!258479) #b00000000000000000000000000000000) (bvsge (x!53187 lt!258479) #b00000000000000000000000000000000)))))

(assert (=> b!567147 (=> (not res!357750) (not e!326412))))

(declare-fun b!567148 () Bool)

(assert (=> b!567148 (= e!326414 (Intermediate!5485 true lt!258403 #b00000000000000000000000000000000))))

(declare-fun b!567149 () Bool)

(assert (=> b!567149 (and (bvsge (index!24169 lt!258479) #b00000000000000000000000000000000) (bvslt (index!24169 lt!258479) (size!17444 (array!35569 (store (arr!17080 a!3118) i!1132 k0!1914) (size!17444 a!3118)))))))

(assert (=> b!567149 (= e!326413 (= (select (arr!17080 (array!35569 (store (arr!17080 a!3118) i!1132 k0!1914) (size!17444 a!3118))) (index!24169 lt!258479)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!84313 () Bool)

(assert (=> d!84313 e!326415))

(declare-fun c!65050 () Bool)

(assert (=> d!84313 (= c!65050 (and ((_ is Intermediate!5485) lt!258479) (undefined!6297 lt!258479)))))

(assert (=> d!84313 (= lt!258479 e!326414)))

(declare-fun c!65049 () Bool)

(assert (=> d!84313 (= c!65049 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84313 (= lt!258478 (select (arr!17080 (array!35569 (store (arr!17080 a!3118) i!1132 k0!1914) (size!17444 a!3118))) lt!258403))))

(assert (=> d!84313 (validMask!0 mask!3119)))

(assert (=> d!84313 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258403 (select (store (arr!17080 a!3118) i!1132 k0!1914) j!142) (array!35569 (store (arr!17080 a!3118) i!1132 k0!1914) (size!17444 a!3118)) mask!3119) lt!258479)))

(declare-fun b!567150 () Bool)

(assert (=> b!567150 (= e!326415 (bvsge (x!53187 lt!258479) #b01111111111111111111111111111110))))

(declare-fun b!567151 () Bool)

(assert (=> b!567151 (= e!326411 (Intermediate!5485 false lt!258403 #b00000000000000000000000000000000))))

(assert (= (and d!84313 c!65049) b!567148))

(assert (= (and d!84313 (not c!65049)) b!567144))

(assert (= (and b!567144 c!65048) b!567151))

(assert (= (and b!567144 (not c!65048)) b!567145))

(assert (= (and d!84313 c!65050) b!567150))

(assert (= (and d!84313 (not c!65050)) b!567147))

(assert (= (and b!567147 res!357750) b!567146))

(assert (= (and b!567146 (not res!357749)) b!567143))

(assert (= (and b!567143 (not res!357751)) b!567149))

(declare-fun m!545855 () Bool)

(assert (=> d!84313 m!545855))

(assert (=> d!84313 m!545715))

(declare-fun m!545857 () Bool)

(assert (=> b!567149 m!545857))

(assert (=> b!567143 m!545857))

(assert (=> b!567146 m!545857))

(declare-fun m!545859 () Bool)

(assert (=> b!567145 m!545859))

(assert (=> b!567145 m!545859))

(assert (=> b!567145 m!545721))

(declare-fun m!545861 () Bool)

(assert (=> b!567145 m!545861))

(assert (=> b!566968 d!84313))

(declare-fun b!567154 () Bool)

(declare-fun lt!258487 () SeekEntryResult!5485)

(assert (=> b!567154 (and (bvsge (index!24169 lt!258487) #b00000000000000000000000000000000) (bvslt (index!24169 lt!258487) (size!17444 a!3118)))))

(declare-fun res!357756 () Bool)

(assert (=> b!567154 (= res!357756 (= (select (arr!17080 a!3118) (index!24169 lt!258487)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!326420 () Bool)

(assert (=> b!567154 (=> res!357756 e!326420)))

(declare-fun b!567155 () Bool)

(declare-fun e!326421 () SeekEntryResult!5485)

(declare-fun e!326418 () SeekEntryResult!5485)

(assert (=> b!567155 (= e!326421 e!326418)))

(declare-fun c!65051 () Bool)

(declare-fun lt!258486 () (_ BitVec 64))

(assert (=> b!567155 (= c!65051 (or (= lt!258486 (select (arr!17080 a!3118) j!142)) (= (bvadd lt!258486 lt!258486) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!567156 () Bool)

(assert (=> b!567156 (= e!326418 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!258399 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) (select (arr!17080 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!567157 () Bool)

(assert (=> b!567157 (and (bvsge (index!24169 lt!258487) #b00000000000000000000000000000000) (bvslt (index!24169 lt!258487) (size!17444 a!3118)))))

(declare-fun res!357754 () Bool)

(assert (=> b!567157 (= res!357754 (= (select (arr!17080 a!3118) (index!24169 lt!258487)) (select (arr!17080 a!3118) j!142)))))

(assert (=> b!567157 (=> res!357754 e!326420)))

(declare-fun e!326419 () Bool)

(assert (=> b!567157 (= e!326419 e!326420)))

(declare-fun b!567158 () Bool)

(declare-fun e!326422 () Bool)

(assert (=> b!567158 (= e!326422 e!326419)))

(declare-fun res!357755 () Bool)

(assert (=> b!567158 (= res!357755 (and ((_ is Intermediate!5485) lt!258487) (not (undefined!6297 lt!258487)) (bvslt (x!53187 lt!258487) #b01111111111111111111111111111110) (bvsge (x!53187 lt!258487) #b00000000000000000000000000000000) (bvsge (x!53187 lt!258487) #b00000000000000000000000000000000)))))

(assert (=> b!567158 (=> (not res!357755) (not e!326419))))

(declare-fun b!567159 () Bool)

(assert (=> b!567159 (= e!326421 (Intermediate!5485 true lt!258399 #b00000000000000000000000000000000))))

(declare-fun b!567160 () Bool)

(assert (=> b!567160 (and (bvsge (index!24169 lt!258487) #b00000000000000000000000000000000) (bvslt (index!24169 lt!258487) (size!17444 a!3118)))))

(assert (=> b!567160 (= e!326420 (= (select (arr!17080 a!3118) (index!24169 lt!258487)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!84333 () Bool)

(assert (=> d!84333 e!326422))

(declare-fun c!65053 () Bool)

(assert (=> d!84333 (= c!65053 (and ((_ is Intermediate!5485) lt!258487) (undefined!6297 lt!258487)))))

(assert (=> d!84333 (= lt!258487 e!326421)))

(declare-fun c!65052 () Bool)

(assert (=> d!84333 (= c!65052 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84333 (= lt!258486 (select (arr!17080 a!3118) lt!258399))))

(assert (=> d!84333 (validMask!0 mask!3119)))

(assert (=> d!84333 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258399 (select (arr!17080 a!3118) j!142) a!3118 mask!3119) lt!258487)))

(declare-fun b!567161 () Bool)

(assert (=> b!567161 (= e!326422 (bvsge (x!53187 lt!258487) #b01111111111111111111111111111110))))

(declare-fun b!567162 () Bool)

(assert (=> b!567162 (= e!326418 (Intermediate!5485 false lt!258399 #b00000000000000000000000000000000))))

(assert (= (and d!84333 c!65052) b!567159))

(assert (= (and d!84333 (not c!65052)) b!567155))

(assert (= (and b!567155 c!65051) b!567162))

(assert (= (and b!567155 (not c!65051)) b!567156))

(assert (= (and d!84333 c!65053) b!567161))

(assert (= (and d!84333 (not c!65053)) b!567158))

(assert (= (and b!567158 res!357755) b!567157))

(assert (= (and b!567157 (not res!357754)) b!567154))

(assert (= (and b!567154 (not res!357756)) b!567160))

(declare-fun m!545863 () Bool)

(assert (=> d!84333 m!545863))

(assert (=> d!84333 m!545715))

(declare-fun m!545865 () Bool)

(assert (=> b!567160 m!545865))

(assert (=> b!567154 m!545865))

(assert (=> b!567157 m!545865))

(declare-fun m!545867 () Bool)

(assert (=> b!567156 m!545867))

(assert (=> b!567156 m!545867))

(assert (=> b!567156 m!545699))

(declare-fun m!545869 () Bool)

(assert (=> b!567156 m!545869))

(assert (=> b!566968 d!84333))

(declare-fun d!84337 () Bool)

(declare-fun lt!258496 () (_ BitVec 32))

(declare-fun lt!258495 () (_ BitVec 32))

(assert (=> d!84337 (= lt!258496 (bvmul (bvxor lt!258495 (bvlshr lt!258495 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84337 (= lt!258495 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17080 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!17080 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84337 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!357757 (let ((h!12079 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17080 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!17080 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53193 (bvmul (bvxor h!12079 (bvlshr h!12079 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53193 (bvlshr x!53193 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!357757 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!357757 #b00000000000000000000000000000000))))))

(assert (=> d!84337 (= (toIndex!0 (select (store (arr!17080 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvand (bvxor lt!258496 (bvlshr lt!258496 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!566968 d!84337))

(declare-fun d!84341 () Bool)

(declare-fun lt!258500 () (_ BitVec 32))

(declare-fun lt!258499 () (_ BitVec 32))

(assert (=> d!84341 (= lt!258500 (bvmul (bvxor lt!258499 (bvlshr lt!258499 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84341 (= lt!258499 ((_ extract 31 0) (bvand (bvxor (select (arr!17080 a!3118) j!142) (bvlshr (select (arr!17080 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84341 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!357757 (let ((h!12079 ((_ extract 31 0) (bvand (bvxor (select (arr!17080 a!3118) j!142) (bvlshr (select (arr!17080 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53193 (bvmul (bvxor h!12079 (bvlshr h!12079 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53193 (bvlshr x!53193 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!357757 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!357757 #b00000000000000000000000000000000))))))

(assert (=> d!84341 (= (toIndex!0 (select (arr!17080 a!3118) j!142) mask!3119) (bvand (bvxor lt!258500 (bvlshr lt!258500 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!566968 d!84341))

(declare-fun d!84343 () Bool)

(declare-fun res!357764 () Bool)

(declare-fun e!326430 () Bool)

(assert (=> d!84343 (=> res!357764 e!326430)))

(assert (=> d!84343 (= res!357764 (= (select (arr!17080 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!84343 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!326430)))

(declare-fun b!567171 () Bool)

(declare-fun e!326431 () Bool)

(assert (=> b!567171 (= e!326430 e!326431)))

(declare-fun res!357765 () Bool)

(assert (=> b!567171 (=> (not res!357765) (not e!326431))))

(assert (=> b!567171 (= res!357765 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17444 a!3118)))))

(declare-fun b!567172 () Bool)

(assert (=> b!567172 (= e!326431 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!84343 (not res!357764)) b!567171))

(assert (= (and b!567171 res!357765) b!567172))

(assert (=> d!84343 m!545815))

(declare-fun m!545879 () Bool)

(assert (=> b!567172 m!545879))

(assert (=> b!566963 d!84343))

(declare-fun d!84347 () Bool)

(assert (=> d!84347 (= (validKeyInArray!0 (select (arr!17080 a!3118) j!142)) (and (not (= (select (arr!17080 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17080 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!566964 d!84347))

(declare-fun b!567231 () Bool)

(declare-fun e!326463 () SeekEntryResult!5485)

(assert (=> b!567231 (= e!326463 Undefined!5485)))

(declare-fun d!84349 () Bool)

(declare-fun lt!258532 () SeekEntryResult!5485)

(assert (=> d!84349 (and (or ((_ is Undefined!5485) lt!258532) (not ((_ is Found!5485) lt!258532)) (and (bvsge (index!24168 lt!258532) #b00000000000000000000000000000000) (bvslt (index!24168 lt!258532) (size!17444 a!3118)))) (or ((_ is Undefined!5485) lt!258532) ((_ is Found!5485) lt!258532) (not ((_ is MissingZero!5485) lt!258532)) (and (bvsge (index!24167 lt!258532) #b00000000000000000000000000000000) (bvslt (index!24167 lt!258532) (size!17444 a!3118)))) (or ((_ is Undefined!5485) lt!258532) ((_ is Found!5485) lt!258532) ((_ is MissingZero!5485) lt!258532) (not ((_ is MissingVacant!5485) lt!258532)) (and (bvsge (index!24170 lt!258532) #b00000000000000000000000000000000) (bvslt (index!24170 lt!258532) (size!17444 a!3118)))) (or ((_ is Undefined!5485) lt!258532) (ite ((_ is Found!5485) lt!258532) (= (select (arr!17080 a!3118) (index!24168 lt!258532)) k0!1914) (ite ((_ is MissingZero!5485) lt!258532) (= (select (arr!17080 a!3118) (index!24167 lt!258532)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5485) lt!258532) (= (select (arr!17080 a!3118) (index!24170 lt!258532)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84349 (= lt!258532 e!326463)))

(declare-fun c!65085 () Bool)

(declare-fun lt!258533 () SeekEntryResult!5485)

(assert (=> d!84349 (= c!65085 (and ((_ is Intermediate!5485) lt!258533) (undefined!6297 lt!258533)))))

(assert (=> d!84349 (= lt!258533 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!84349 (validMask!0 mask!3119)))

(assert (=> d!84349 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!258532)))

(declare-fun b!567232 () Bool)

(declare-fun e!326464 () SeekEntryResult!5485)

(assert (=> b!567232 (= e!326464 (Found!5485 (index!24169 lt!258533)))))

(declare-fun e!326462 () SeekEntryResult!5485)

(declare-fun b!567233 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35568 (_ BitVec 32)) SeekEntryResult!5485)

(assert (=> b!567233 (= e!326462 (seekKeyOrZeroReturnVacant!0 (x!53187 lt!258533) (index!24169 lt!258533) (index!24169 lt!258533) k0!1914 a!3118 mask!3119))))

(declare-fun b!567234 () Bool)

(assert (=> b!567234 (= e!326463 e!326464)))

(declare-fun lt!258534 () (_ BitVec 64))

(assert (=> b!567234 (= lt!258534 (select (arr!17080 a!3118) (index!24169 lt!258533)))))

(declare-fun c!65084 () Bool)

(assert (=> b!567234 (= c!65084 (= lt!258534 k0!1914))))

(declare-fun b!567235 () Bool)

(declare-fun c!65083 () Bool)

(assert (=> b!567235 (= c!65083 (= lt!258534 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!567235 (= e!326464 e!326462)))

(declare-fun b!567236 () Bool)

(assert (=> b!567236 (= e!326462 (MissingZero!5485 (index!24169 lt!258533)))))

(assert (= (and d!84349 c!65085) b!567231))

(assert (= (and d!84349 (not c!65085)) b!567234))

(assert (= (and b!567234 c!65084) b!567232))

(assert (= (and b!567234 (not c!65084)) b!567235))

(assert (= (and b!567235 c!65083) b!567236))

(assert (= (and b!567235 (not c!65083)) b!567233))

(declare-fun m!545931 () Bool)

(assert (=> d!84349 m!545931))

(assert (=> d!84349 m!545715))

(assert (=> d!84349 m!545931))

(declare-fun m!545933 () Bool)

(assert (=> d!84349 m!545933))

(declare-fun m!545935 () Bool)

(assert (=> d!84349 m!545935))

(declare-fun m!545937 () Bool)

(assert (=> d!84349 m!545937))

(declare-fun m!545939 () Bool)

(assert (=> d!84349 m!545939))

(declare-fun m!545941 () Bool)

(assert (=> b!567233 m!545941))

(declare-fun m!545943 () Bool)

(assert (=> b!567234 m!545943))

(assert (=> b!566970 d!84349))

(declare-fun b!567237 () Bool)

(declare-fun e!326465 () Bool)

(declare-fun call!32516 () Bool)

(assert (=> b!567237 (= e!326465 call!32516)))

(declare-fun b!567238 () Bool)

(declare-fun e!326467 () Bool)

(assert (=> b!567238 (= e!326467 call!32516)))

(declare-fun b!567239 () Bool)

(assert (=> b!567239 (= e!326467 e!326465)))

(declare-fun lt!258537 () (_ BitVec 64))

(assert (=> b!567239 (= lt!258537 (select (arr!17080 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!258536 () Unit!17743)

(assert (=> b!567239 (= lt!258536 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!258537 #b00000000000000000000000000000000))))

(assert (=> b!567239 (arrayContainsKey!0 a!3118 lt!258537 #b00000000000000000000000000000000)))

(declare-fun lt!258535 () Unit!17743)

(assert (=> b!567239 (= lt!258535 lt!258536)))

(declare-fun res!357768 () Bool)

(assert (=> b!567239 (= res!357768 (= (seekEntryOrOpen!0 (select (arr!17080 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5485 #b00000000000000000000000000000000)))))

(assert (=> b!567239 (=> (not res!357768) (not e!326465))))

(declare-fun b!567240 () Bool)

(declare-fun e!326466 () Bool)

(assert (=> b!567240 (= e!326466 e!326467)))

(declare-fun c!65086 () Bool)

(assert (=> b!567240 (= c!65086 (validKeyInArray!0 (select (arr!17080 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!84361 () Bool)

(declare-fun res!357769 () Bool)

(assert (=> d!84361 (=> res!357769 e!326466)))

(assert (=> d!84361 (= res!357769 (bvsge #b00000000000000000000000000000000 (size!17444 a!3118)))))

(assert (=> d!84361 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!326466)))

(declare-fun bm!32513 () Bool)

(assert (=> bm!32513 (= call!32516 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!84361 (not res!357769)) b!567240))

(assert (= (and b!567240 c!65086) b!567239))

(assert (= (and b!567240 (not c!65086)) b!567238))

(assert (= (and b!567239 res!357768) b!567237))

(assert (= (or b!567237 b!567238) bm!32513))

(assert (=> b!567239 m!545815))

(declare-fun m!545945 () Bool)

(assert (=> b!567239 m!545945))

(declare-fun m!545947 () Bool)

(assert (=> b!567239 m!545947))

(assert (=> b!567239 m!545815))

(declare-fun m!545949 () Bool)

(assert (=> b!567239 m!545949))

(assert (=> b!567240 m!545815))

(assert (=> b!567240 m!545815))

(assert (=> b!567240 m!545817))

(declare-fun m!545951 () Bool)

(assert (=> bm!32513 m!545951))

(assert (=> b!566965 d!84361))

(declare-fun d!84363 () Bool)

(assert (=> d!84363 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!566971 d!84363))

(declare-fun b!567241 () Bool)

(declare-fun e!326469 () SeekEntryResult!5485)

(assert (=> b!567241 (= e!326469 Undefined!5485)))

(declare-fun d!84365 () Bool)

(declare-fun lt!258538 () SeekEntryResult!5485)

(assert (=> d!84365 (and (or ((_ is Undefined!5485) lt!258538) (not ((_ is Found!5485) lt!258538)) (and (bvsge (index!24168 lt!258538) #b00000000000000000000000000000000) (bvslt (index!24168 lt!258538) (size!17444 a!3118)))) (or ((_ is Undefined!5485) lt!258538) ((_ is Found!5485) lt!258538) (not ((_ is MissingZero!5485) lt!258538)) (and (bvsge (index!24167 lt!258538) #b00000000000000000000000000000000) (bvslt (index!24167 lt!258538) (size!17444 a!3118)))) (or ((_ is Undefined!5485) lt!258538) ((_ is Found!5485) lt!258538) ((_ is MissingZero!5485) lt!258538) (not ((_ is MissingVacant!5485) lt!258538)) (and (bvsge (index!24170 lt!258538) #b00000000000000000000000000000000) (bvslt (index!24170 lt!258538) (size!17444 a!3118)))) (or ((_ is Undefined!5485) lt!258538) (ite ((_ is Found!5485) lt!258538) (= (select (arr!17080 a!3118) (index!24168 lt!258538)) (select (arr!17080 a!3118) j!142)) (ite ((_ is MissingZero!5485) lt!258538) (= (select (arr!17080 a!3118) (index!24167 lt!258538)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5485) lt!258538) (= (select (arr!17080 a!3118) (index!24170 lt!258538)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84365 (= lt!258538 e!326469)))

(declare-fun c!65089 () Bool)

(declare-fun lt!258539 () SeekEntryResult!5485)

(assert (=> d!84365 (= c!65089 (and ((_ is Intermediate!5485) lt!258539) (undefined!6297 lt!258539)))))

(assert (=> d!84365 (= lt!258539 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17080 a!3118) j!142) mask!3119) (select (arr!17080 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!84365 (validMask!0 mask!3119)))

(assert (=> d!84365 (= (seekEntryOrOpen!0 (select (arr!17080 a!3118) j!142) a!3118 mask!3119) lt!258538)))

(declare-fun b!567242 () Bool)

(declare-fun e!326470 () SeekEntryResult!5485)

(assert (=> b!567242 (= e!326470 (Found!5485 (index!24169 lt!258539)))))

(declare-fun b!567243 () Bool)

(declare-fun e!326468 () SeekEntryResult!5485)

(assert (=> b!567243 (= e!326468 (seekKeyOrZeroReturnVacant!0 (x!53187 lt!258539) (index!24169 lt!258539) (index!24169 lt!258539) (select (arr!17080 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!567244 () Bool)

(assert (=> b!567244 (= e!326469 e!326470)))

(declare-fun lt!258540 () (_ BitVec 64))

(assert (=> b!567244 (= lt!258540 (select (arr!17080 a!3118) (index!24169 lt!258539)))))

(declare-fun c!65088 () Bool)

(assert (=> b!567244 (= c!65088 (= lt!258540 (select (arr!17080 a!3118) j!142)))))

(declare-fun b!567245 () Bool)

(declare-fun c!65087 () Bool)

(assert (=> b!567245 (= c!65087 (= lt!258540 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!567245 (= e!326470 e!326468)))

(declare-fun b!567246 () Bool)

(assert (=> b!567246 (= e!326468 (MissingZero!5485 (index!24169 lt!258539)))))

(assert (= (and d!84365 c!65089) b!567241))

(assert (= (and d!84365 (not c!65089)) b!567244))

(assert (= (and b!567244 c!65088) b!567242))

(assert (= (and b!567244 (not c!65088)) b!567245))

(assert (= (and b!567245 c!65087) b!567246))

(assert (= (and b!567245 (not c!65087)) b!567243))

(assert (=> d!84365 m!545699))

(assert (=> d!84365 m!545719))

(assert (=> d!84365 m!545715))

(assert (=> d!84365 m!545719))

(assert (=> d!84365 m!545699))

(declare-fun m!545953 () Bool)

(assert (=> d!84365 m!545953))

(declare-fun m!545955 () Bool)

(assert (=> d!84365 m!545955))

(declare-fun m!545957 () Bool)

(assert (=> d!84365 m!545957))

(declare-fun m!545959 () Bool)

(assert (=> d!84365 m!545959))

(assert (=> b!567243 m!545699))

(declare-fun m!545961 () Bool)

(assert (=> b!567243 m!545961))

(declare-fun m!545963 () Bool)

(assert (=> b!567244 m!545963))

(assert (=> b!566966 d!84365))

(declare-fun d!84367 () Bool)

(assert (=> d!84367 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!51870 d!84367))

(declare-fun d!84371 () Bool)

(assert (=> d!84371 (= (array_inv!12939 a!3118) (bvsge (size!17444 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!51870 d!84371))

(check-sat (not b!567043) (not b!567243) (not b!567156) (not d!84333) (not b!567055) (not bm!32513) (not d!84365) (not d!84349) (not b!567145) (not bm!32502) (not b!567057) (not d!84313) (not b!567058) (not b!567233) (not b!567172) (not d!84305) (not b!567240) (not bm!32505) (not b!567042) (not b!567239))
(check-sat)
