; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51922 () Bool)

(assert start!51922)

(declare-fun b!567623 () Bool)

(declare-fun res!358210 () Bool)

(declare-fun e!326598 () Bool)

(assert (=> b!567623 (=> (not res!358210) (not e!326598))))

(declare-datatypes ((array!35616 0))(
  ( (array!35617 (arr!17104 (Array (_ BitVec 32) (_ BitVec 64))) (size!17468 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35616)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35616 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!567623 (= res!358210 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!567624 () Bool)

(declare-fun e!326597 () Bool)

(assert (=> b!567624 (= e!326598 e!326597)))

(declare-fun res!358217 () Bool)

(assert (=> b!567624 (=> (not res!358217) (not e!326597))))

(declare-datatypes ((SeekEntryResult!5553 0))(
  ( (MissingZero!5553 (index!24439 (_ BitVec 32))) (Found!5553 (index!24440 (_ BitVec 32))) (Intermediate!5553 (undefined!6365 Bool) (index!24441 (_ BitVec 32)) (x!53306 (_ BitVec 32))) (Undefined!5553) (MissingVacant!5553 (index!24442 (_ BitVec 32))) )
))
(declare-fun lt!258584 () SeekEntryResult!5553)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!567624 (= res!358217 (or (= lt!258584 (MissingZero!5553 i!1132)) (= lt!258584 (MissingVacant!5553 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35616 (_ BitVec 32)) SeekEntryResult!5553)

(assert (=> b!567624 (= lt!258584 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!567625 () Bool)

(declare-fun res!358208 () Bool)

(assert (=> b!567625 (=> (not res!358208) (not e!326598))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!567625 (= res!358208 (validKeyInArray!0 (select (arr!17104 a!3118) j!142)))))

(declare-fun b!567626 () Bool)

(declare-fun res!358213 () Bool)

(assert (=> b!567626 (=> (not res!358213) (not e!326597))))

(declare-datatypes ((List!11184 0))(
  ( (Nil!11181) (Cons!11180 (h!12192 (_ BitVec 64)) (t!17412 List!11184)) )
))
(declare-fun arrayNoDuplicates!0 (array!35616 (_ BitVec 32) List!11184) Bool)

(assert (=> b!567626 (= res!358213 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11181))))

(declare-fun b!567627 () Bool)

(declare-fun res!358211 () Bool)

(assert (=> b!567627 (=> (not res!358211) (not e!326598))))

(assert (=> b!567627 (= res!358211 (validKeyInArray!0 k0!1914))))

(declare-fun b!567628 () Bool)

(declare-fun e!326599 () Bool)

(assert (=> b!567628 (= e!326597 e!326599)))

(declare-fun res!358212 () Bool)

(assert (=> b!567628 (=> (not res!358212) (not e!326599))))

(declare-fun lt!258587 () SeekEntryResult!5553)

(declare-fun lt!258586 () array!35616)

(declare-fun lt!258582 () (_ BitVec 64))

(declare-fun lt!258589 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35616 (_ BitVec 32)) SeekEntryResult!5553)

(assert (=> b!567628 (= res!358212 (= lt!258587 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258589 lt!258582 lt!258586 mask!3119)))))

(declare-fun lt!258585 () (_ BitVec 32))

(assert (=> b!567628 (= lt!258587 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258585 (select (arr!17104 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!567628 (= lt!258589 (toIndex!0 lt!258582 mask!3119))))

(assert (=> b!567628 (= lt!258582 (select (store (arr!17104 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!567628 (= lt!258585 (toIndex!0 (select (arr!17104 a!3118) j!142) mask!3119))))

(assert (=> b!567628 (= lt!258586 (array!35617 (store (arr!17104 a!3118) i!1132 k0!1914) (size!17468 a!3118)))))

(declare-fun b!567629 () Bool)

(declare-fun lt!258583 () SeekEntryResult!5553)

(declare-fun e!326600 () Bool)

(assert (=> b!567629 (= e!326600 (= lt!258583 (seekEntryOrOpen!0 lt!258582 lt!258586 mask!3119)))))

(declare-fun b!567631 () Bool)

(declare-fun res!358209 () Bool)

(assert (=> b!567631 (=> (not res!358209) (not e!326597))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35616 (_ BitVec 32)) Bool)

(assert (=> b!567631 (= res!358209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!567632 () Bool)

(assert (=> b!567632 (= e!326599 (not e!326600))))

(declare-fun res!358215 () Bool)

(assert (=> b!567632 (=> res!358215 e!326600)))

(get-info :version)

(assert (=> b!567632 (= res!358215 (or (undefined!6365 lt!258587) (not ((_ is Intermediate!5553) lt!258587)) (not (= (select (arr!17104 a!3118) (index!24441 lt!258587)) (select (arr!17104 a!3118) j!142)))))))

(assert (=> b!567632 (= lt!258583 (Found!5553 j!142))))

(assert (=> b!567632 (= lt!258583 (seekEntryOrOpen!0 (select (arr!17104 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!567632 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17808 0))(
  ( (Unit!17809) )
))
(declare-fun lt!258588 () Unit!17808)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35616 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17808)

(assert (=> b!567632 (= lt!258588 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!358214 () Bool)

(assert (=> start!51922 (=> (not res!358214) (not e!326598))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51922 (= res!358214 (validMask!0 mask!3119))))

(assert (=> start!51922 e!326598))

(assert (=> start!51922 true))

(declare-fun array_inv!12900 (array!35616) Bool)

(assert (=> start!51922 (array_inv!12900 a!3118)))

(declare-fun b!567630 () Bool)

(declare-fun res!358216 () Bool)

(assert (=> b!567630 (=> (not res!358216) (not e!326598))))

(assert (=> b!567630 (= res!358216 (and (= (size!17468 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17468 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17468 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!51922 res!358214) b!567630))

(assert (= (and b!567630 res!358216) b!567625))

(assert (= (and b!567625 res!358208) b!567627))

(assert (= (and b!567627 res!358211) b!567623))

(assert (= (and b!567623 res!358210) b!567624))

(assert (= (and b!567624 res!358217) b!567631))

(assert (= (and b!567631 res!358209) b!567626))

(assert (= (and b!567626 res!358213) b!567628))

(assert (= (and b!567628 res!358212) b!567632))

(assert (= (and b!567632 (not res!358215)) b!567629))

(declare-fun m!546253 () Bool)

(assert (=> b!567623 m!546253))

(declare-fun m!546255 () Bool)

(assert (=> b!567626 m!546255))

(declare-fun m!546257 () Bool)

(assert (=> b!567632 m!546257))

(declare-fun m!546259 () Bool)

(assert (=> b!567632 m!546259))

(declare-fun m!546261 () Bool)

(assert (=> b!567632 m!546261))

(declare-fun m!546263 () Bool)

(assert (=> b!567632 m!546263))

(assert (=> b!567632 m!546257))

(declare-fun m!546265 () Bool)

(assert (=> b!567632 m!546265))

(declare-fun m!546267 () Bool)

(assert (=> start!51922 m!546267))

(declare-fun m!546269 () Bool)

(assert (=> start!51922 m!546269))

(assert (=> b!567628 m!546257))

(declare-fun m!546271 () Bool)

(assert (=> b!567628 m!546271))

(declare-fun m!546273 () Bool)

(assert (=> b!567628 m!546273))

(assert (=> b!567628 m!546257))

(declare-fun m!546275 () Bool)

(assert (=> b!567628 m!546275))

(declare-fun m!546277 () Bool)

(assert (=> b!567628 m!546277))

(declare-fun m!546279 () Bool)

(assert (=> b!567628 m!546279))

(assert (=> b!567628 m!546257))

(declare-fun m!546281 () Bool)

(assert (=> b!567628 m!546281))

(declare-fun m!546283 () Bool)

(assert (=> b!567631 m!546283))

(declare-fun m!546285 () Bool)

(assert (=> b!567624 m!546285))

(assert (=> b!567625 m!546257))

(assert (=> b!567625 m!546257))

(declare-fun m!546287 () Bool)

(assert (=> b!567625 m!546287))

(declare-fun m!546289 () Bool)

(assert (=> b!567627 m!546289))

(declare-fun m!546291 () Bool)

(assert (=> b!567629 m!546291))

(check-sat (not b!567629) (not b!567625) (not b!567631) (not b!567628) (not b!567624) (not b!567632) (not b!567627) (not b!567623) (not start!51922) (not b!567626))
(check-sat)
(get-model)

(declare-fun d!84291 () Bool)

(declare-fun res!358254 () Bool)

(declare-fun e!326626 () Bool)

(assert (=> d!84291 (=> res!358254 e!326626)))

(assert (=> d!84291 (= res!358254 (bvsge #b00000000000000000000000000000000 (size!17468 a!3118)))))

(assert (=> d!84291 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11181) e!326626)))

(declare-fun b!567673 () Bool)

(declare-fun e!326628 () Bool)

(declare-fun contains!2871 (List!11184 (_ BitVec 64)) Bool)

(assert (=> b!567673 (= e!326628 (contains!2871 Nil!11181 (select (arr!17104 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!567674 () Bool)

(declare-fun e!326625 () Bool)

(declare-fun call!32522 () Bool)

(assert (=> b!567674 (= e!326625 call!32522)))

(declare-fun b!567675 () Bool)

(declare-fun e!326627 () Bool)

(assert (=> b!567675 (= e!326626 e!326627)))

(declare-fun res!358256 () Bool)

(assert (=> b!567675 (=> (not res!358256) (not e!326627))))

(assert (=> b!567675 (= res!358256 (not e!326628))))

(declare-fun res!358255 () Bool)

(assert (=> b!567675 (=> (not res!358255) (not e!326628))))

(assert (=> b!567675 (= res!358255 (validKeyInArray!0 (select (arr!17104 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!567676 () Bool)

(assert (=> b!567676 (= e!326627 e!326625)))

(declare-fun c!65060 () Bool)

(assert (=> b!567676 (= c!65060 (validKeyInArray!0 (select (arr!17104 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32519 () Bool)

(assert (=> bm!32519 (= call!32522 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!65060 (Cons!11180 (select (arr!17104 a!3118) #b00000000000000000000000000000000) Nil!11181) Nil!11181)))))

(declare-fun b!567677 () Bool)

(assert (=> b!567677 (= e!326625 call!32522)))

(assert (= (and d!84291 (not res!358254)) b!567675))

(assert (= (and b!567675 res!358255) b!567673))

(assert (= (and b!567675 res!358256) b!567676))

(assert (= (and b!567676 c!65060) b!567674))

(assert (= (and b!567676 (not c!65060)) b!567677))

(assert (= (or b!567674 b!567677) bm!32519))

(declare-fun m!546333 () Bool)

(assert (=> b!567673 m!546333))

(assert (=> b!567673 m!546333))

(declare-fun m!546335 () Bool)

(assert (=> b!567673 m!546335))

(assert (=> b!567675 m!546333))

(assert (=> b!567675 m!546333))

(declare-fun m!546337 () Bool)

(assert (=> b!567675 m!546337))

(assert (=> b!567676 m!546333))

(assert (=> b!567676 m!546333))

(assert (=> b!567676 m!546337))

(assert (=> bm!32519 m!546333))

(declare-fun m!546339 () Bool)

(assert (=> bm!32519 m!546339))

(assert (=> b!567626 d!84291))

(declare-fun b!567692 () Bool)

(declare-fun e!326641 () Bool)

(declare-fun e!326642 () Bool)

(assert (=> b!567692 (= e!326641 e!326642)))

(declare-fun c!65063 () Bool)

(assert (=> b!567692 (= c!65063 (validKeyInArray!0 (select (arr!17104 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!84293 () Bool)

(declare-fun res!358267 () Bool)

(assert (=> d!84293 (=> res!358267 e!326641)))

(assert (=> d!84293 (= res!358267 (bvsge #b00000000000000000000000000000000 (size!17468 a!3118)))))

(assert (=> d!84293 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!326641)))

(declare-fun bm!32522 () Bool)

(declare-fun call!32525 () Bool)

(assert (=> bm!32522 (= call!32525 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!567693 () Bool)

(declare-fun e!326643 () Bool)

(assert (=> b!567693 (= e!326642 e!326643)))

(declare-fun lt!258621 () (_ BitVec 64))

(assert (=> b!567693 (= lt!258621 (select (arr!17104 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!258620 () Unit!17808)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35616 (_ BitVec 64) (_ BitVec 32)) Unit!17808)

(assert (=> b!567693 (= lt!258620 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!258621 #b00000000000000000000000000000000))))

(assert (=> b!567693 (arrayContainsKey!0 a!3118 lt!258621 #b00000000000000000000000000000000)))

(declare-fun lt!258622 () Unit!17808)

(assert (=> b!567693 (= lt!258622 lt!258620)))

(declare-fun res!358268 () Bool)

(assert (=> b!567693 (= res!358268 (= (seekEntryOrOpen!0 (select (arr!17104 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5553 #b00000000000000000000000000000000)))))

(assert (=> b!567693 (=> (not res!358268) (not e!326643))))

(declare-fun b!567694 () Bool)

(assert (=> b!567694 (= e!326642 call!32525)))

(declare-fun b!567695 () Bool)

(assert (=> b!567695 (= e!326643 call!32525)))

(assert (= (and d!84293 (not res!358267)) b!567692))

(assert (= (and b!567692 c!65063) b!567693))

(assert (= (and b!567692 (not c!65063)) b!567694))

(assert (= (and b!567693 res!358268) b!567695))

(assert (= (or b!567695 b!567694) bm!32522))

(assert (=> b!567692 m!546333))

(assert (=> b!567692 m!546333))

(assert (=> b!567692 m!546337))

(declare-fun m!546345 () Bool)

(assert (=> bm!32522 m!546345))

(assert (=> b!567693 m!546333))

(declare-fun m!546347 () Bool)

(assert (=> b!567693 m!546347))

(declare-fun m!546349 () Bool)

(assert (=> b!567693 m!546349))

(assert (=> b!567693 m!546333))

(declare-fun m!546351 () Bool)

(assert (=> b!567693 m!546351))

(assert (=> b!567631 d!84293))

(declare-fun d!84303 () Bool)

(assert (=> d!84303 (= (validKeyInArray!0 (select (arr!17104 a!3118) j!142)) (and (not (= (select (arr!17104 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17104 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!567625 d!84303))

(declare-fun d!84305 () Bool)

(assert (=> d!84305 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!567627 d!84305))

(declare-fun b!567726 () Bool)

(declare-fun e!326660 () SeekEntryResult!5553)

(declare-fun lt!258639 () SeekEntryResult!5553)

(assert (=> b!567726 (= e!326660 (Found!5553 (index!24441 lt!258639)))))

(declare-fun b!567727 () Bool)

(declare-fun c!65079 () Bool)

(declare-fun lt!258640 () (_ BitVec 64))

(assert (=> b!567727 (= c!65079 (= lt!258640 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!326659 () SeekEntryResult!5553)

(assert (=> b!567727 (= e!326660 e!326659)))

(declare-fun b!567728 () Bool)

(declare-fun e!326661 () SeekEntryResult!5553)

(assert (=> b!567728 (= e!326661 e!326660)))

(assert (=> b!567728 (= lt!258640 (select (arr!17104 a!3118) (index!24441 lt!258639)))))

(declare-fun c!65080 () Bool)

(assert (=> b!567728 (= c!65080 (= lt!258640 (select (arr!17104 a!3118) j!142)))))

(declare-fun b!567729 () Bool)

(assert (=> b!567729 (= e!326661 Undefined!5553)))

(declare-fun b!567731 () Bool)

(assert (=> b!567731 (= e!326659 (MissingZero!5553 (index!24441 lt!258639)))))

(declare-fun b!567730 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35616 (_ BitVec 32)) SeekEntryResult!5553)

(assert (=> b!567730 (= e!326659 (seekKeyOrZeroReturnVacant!0 (x!53306 lt!258639) (index!24441 lt!258639) (index!24441 lt!258639) (select (arr!17104 a!3118) j!142) a!3118 mask!3119))))

(declare-fun d!84307 () Bool)

(declare-fun lt!258638 () SeekEntryResult!5553)

(assert (=> d!84307 (and (or ((_ is Undefined!5553) lt!258638) (not ((_ is Found!5553) lt!258638)) (and (bvsge (index!24440 lt!258638) #b00000000000000000000000000000000) (bvslt (index!24440 lt!258638) (size!17468 a!3118)))) (or ((_ is Undefined!5553) lt!258638) ((_ is Found!5553) lt!258638) (not ((_ is MissingZero!5553) lt!258638)) (and (bvsge (index!24439 lt!258638) #b00000000000000000000000000000000) (bvslt (index!24439 lt!258638) (size!17468 a!3118)))) (or ((_ is Undefined!5553) lt!258638) ((_ is Found!5553) lt!258638) ((_ is MissingZero!5553) lt!258638) (not ((_ is MissingVacant!5553) lt!258638)) (and (bvsge (index!24442 lt!258638) #b00000000000000000000000000000000) (bvslt (index!24442 lt!258638) (size!17468 a!3118)))) (or ((_ is Undefined!5553) lt!258638) (ite ((_ is Found!5553) lt!258638) (= (select (arr!17104 a!3118) (index!24440 lt!258638)) (select (arr!17104 a!3118) j!142)) (ite ((_ is MissingZero!5553) lt!258638) (= (select (arr!17104 a!3118) (index!24439 lt!258638)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5553) lt!258638) (= (select (arr!17104 a!3118) (index!24442 lt!258638)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84307 (= lt!258638 e!326661)))

(declare-fun c!65081 () Bool)

(assert (=> d!84307 (= c!65081 (and ((_ is Intermediate!5553) lt!258639) (undefined!6365 lt!258639)))))

(assert (=> d!84307 (= lt!258639 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17104 a!3118) j!142) mask!3119) (select (arr!17104 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!84307 (validMask!0 mask!3119)))

(assert (=> d!84307 (= (seekEntryOrOpen!0 (select (arr!17104 a!3118) j!142) a!3118 mask!3119) lt!258638)))

(assert (= (and d!84307 c!65081) b!567729))

(assert (= (and d!84307 (not c!65081)) b!567728))

(assert (= (and b!567728 c!65080) b!567726))

(assert (= (and b!567728 (not c!65080)) b!567727))

(assert (= (and b!567727 c!65079) b!567731))

(assert (= (and b!567727 (not c!65079)) b!567730))

(declare-fun m!546365 () Bool)

(assert (=> b!567728 m!546365))

(assert (=> b!567730 m!546257))

(declare-fun m!546367 () Bool)

(assert (=> b!567730 m!546367))

(assert (=> d!84307 m!546257))

(assert (=> d!84307 m!546271))

(assert (=> d!84307 m!546267))

(declare-fun m!546369 () Bool)

(assert (=> d!84307 m!546369))

(assert (=> d!84307 m!546271))

(assert (=> d!84307 m!546257))

(declare-fun m!546371 () Bool)

(assert (=> d!84307 m!546371))

(declare-fun m!546373 () Bool)

(assert (=> d!84307 m!546373))

(declare-fun m!546375 () Bool)

(assert (=> d!84307 m!546375))

(assert (=> b!567632 d!84307))

(declare-fun b!567740 () Bool)

(declare-fun e!326666 () Bool)

(declare-fun e!326667 () Bool)

(assert (=> b!567740 (= e!326666 e!326667)))

(declare-fun c!65086 () Bool)

(assert (=> b!567740 (= c!65086 (validKeyInArray!0 (select (arr!17104 a!3118) j!142)))))

(declare-fun d!84313 () Bool)

(declare-fun res!358269 () Bool)

(assert (=> d!84313 (=> res!358269 e!326666)))

(assert (=> d!84313 (= res!358269 (bvsge j!142 (size!17468 a!3118)))))

(assert (=> d!84313 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!326666)))

(declare-fun bm!32523 () Bool)

(declare-fun call!32526 () Bool)

(assert (=> bm!32523 (= call!32526 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!567741 () Bool)

(declare-fun e!326668 () Bool)

(assert (=> b!567741 (= e!326667 e!326668)))

(declare-fun lt!258646 () (_ BitVec 64))

(assert (=> b!567741 (= lt!258646 (select (arr!17104 a!3118) j!142))))

(declare-fun lt!258645 () Unit!17808)

(assert (=> b!567741 (= lt!258645 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!258646 j!142))))

(assert (=> b!567741 (arrayContainsKey!0 a!3118 lt!258646 #b00000000000000000000000000000000)))

(declare-fun lt!258647 () Unit!17808)

(assert (=> b!567741 (= lt!258647 lt!258645)))

(declare-fun res!358270 () Bool)

(assert (=> b!567741 (= res!358270 (= (seekEntryOrOpen!0 (select (arr!17104 a!3118) j!142) a!3118 mask!3119) (Found!5553 j!142)))))

(assert (=> b!567741 (=> (not res!358270) (not e!326668))))

(declare-fun b!567742 () Bool)

(assert (=> b!567742 (= e!326667 call!32526)))

(declare-fun b!567743 () Bool)

(assert (=> b!567743 (= e!326668 call!32526)))

(assert (= (and d!84313 (not res!358269)) b!567740))

(assert (= (and b!567740 c!65086) b!567741))

(assert (= (and b!567740 (not c!65086)) b!567742))

(assert (= (and b!567741 res!358270) b!567743))

(assert (= (or b!567743 b!567742) bm!32523))

(assert (=> b!567740 m!546257))

(assert (=> b!567740 m!546257))

(assert (=> b!567740 m!546287))

(declare-fun m!546377 () Bool)

(assert (=> bm!32523 m!546377))

(assert (=> b!567741 m!546257))

(declare-fun m!546379 () Bool)

(assert (=> b!567741 m!546379))

(declare-fun m!546381 () Bool)

(assert (=> b!567741 m!546381))

(assert (=> b!567741 m!546257))

(assert (=> b!567741 m!546265))

(assert (=> b!567632 d!84313))

(declare-fun d!84315 () Bool)

(assert (=> d!84315 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!258652 () Unit!17808)

(declare-fun choose!38 (array!35616 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17808)

(assert (=> d!84315 (= lt!258652 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!84315 (validMask!0 mask!3119)))

(assert (=> d!84315 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!258652)))

(declare-fun bs!17623 () Bool)

(assert (= bs!17623 d!84315))

(assert (=> bs!17623 m!546259))

(declare-fun m!546383 () Bool)

(assert (=> bs!17623 m!546383))

(assert (=> bs!17623 m!546267))

(assert (=> b!567632 d!84315))

(declare-fun d!84319 () Bool)

(assert (=> d!84319 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!51922 d!84319))

(declare-fun d!84331 () Bool)

(assert (=> d!84331 (= (array_inv!12900 a!3118) (bvsge (size!17468 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!51922 d!84331))

(declare-fun d!84333 () Bool)

(declare-fun res!358294 () Bool)

(declare-fun e!326697 () Bool)

(assert (=> d!84333 (=> res!358294 e!326697)))

(assert (=> d!84333 (= res!358294 (= (select (arr!17104 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!84333 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!326697)))

(declare-fun b!567786 () Bool)

(declare-fun e!326698 () Bool)

(assert (=> b!567786 (= e!326697 e!326698)))

(declare-fun res!358295 () Bool)

(assert (=> b!567786 (=> (not res!358295) (not e!326698))))

(assert (=> b!567786 (= res!358295 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17468 a!3118)))))

(declare-fun b!567787 () Bool)

(assert (=> b!567787 (= e!326698 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!84333 (not res!358294)) b!567786))

(assert (= (and b!567786 res!358295) b!567787))

(assert (=> d!84333 m!546333))

(declare-fun m!546401 () Bool)

(assert (=> b!567787 m!546401))

(assert (=> b!567623 d!84333))

(declare-fun b!567865 () Bool)

(declare-fun e!326743 () SeekEntryResult!5553)

(declare-fun e!326742 () SeekEntryResult!5553)

(assert (=> b!567865 (= e!326743 e!326742)))

(declare-fun c!65127 () Bool)

(declare-fun lt!258693 () (_ BitVec 64))

(assert (=> b!567865 (= c!65127 (or (= lt!258693 lt!258582) (= (bvadd lt!258693 lt!258693) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!567866 () Bool)

(assert (=> b!567866 (= e!326742 (Intermediate!5553 false lt!258589 #b00000000000000000000000000000000))))

(declare-fun b!567867 () Bool)

(declare-fun lt!258692 () SeekEntryResult!5553)

(assert (=> b!567867 (and (bvsge (index!24441 lt!258692) #b00000000000000000000000000000000) (bvslt (index!24441 lt!258692) (size!17468 lt!258586)))))

(declare-fun e!326745 () Bool)

(assert (=> b!567867 (= e!326745 (= (select (arr!17104 lt!258586) (index!24441 lt!258692)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!567868 () Bool)

(assert (=> b!567868 (= e!326743 (Intermediate!5553 true lt!258589 #b00000000000000000000000000000000))))

(declare-fun b!567869 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!567869 (= e!326742 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!258589 #b00000000000000000000000000000000 mask!3119) lt!258582 lt!258586 mask!3119))))

(declare-fun d!84335 () Bool)

(declare-fun e!326744 () Bool)

(assert (=> d!84335 e!326744))

(declare-fun c!65126 () Bool)

(assert (=> d!84335 (= c!65126 (and ((_ is Intermediate!5553) lt!258692) (undefined!6365 lt!258692)))))

(assert (=> d!84335 (= lt!258692 e!326743)))

(declare-fun c!65125 () Bool)

(assert (=> d!84335 (= c!65125 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84335 (= lt!258693 (select (arr!17104 lt!258586) lt!258589))))

(assert (=> d!84335 (validMask!0 mask!3119)))

(assert (=> d!84335 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258589 lt!258582 lt!258586 mask!3119) lt!258692)))

(declare-fun b!567870 () Bool)

(declare-fun e!326746 () Bool)

(assert (=> b!567870 (= e!326744 e!326746)))

(declare-fun res!358320 () Bool)

(assert (=> b!567870 (= res!358320 (and ((_ is Intermediate!5553) lt!258692) (not (undefined!6365 lt!258692)) (bvslt (x!53306 lt!258692) #b01111111111111111111111111111110) (bvsge (x!53306 lt!258692) #b00000000000000000000000000000000) (bvsge (x!53306 lt!258692) #b00000000000000000000000000000000)))))

(assert (=> b!567870 (=> (not res!358320) (not e!326746))))

(declare-fun b!567871 () Bool)

(assert (=> b!567871 (and (bvsge (index!24441 lt!258692) #b00000000000000000000000000000000) (bvslt (index!24441 lt!258692) (size!17468 lt!258586)))))

(declare-fun res!358319 () Bool)

(assert (=> b!567871 (= res!358319 (= (select (arr!17104 lt!258586) (index!24441 lt!258692)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!567871 (=> res!358319 e!326745)))

(declare-fun b!567872 () Bool)

(assert (=> b!567872 (= e!326744 (bvsge (x!53306 lt!258692) #b01111111111111111111111111111110))))

(declare-fun b!567873 () Bool)

(assert (=> b!567873 (and (bvsge (index!24441 lt!258692) #b00000000000000000000000000000000) (bvslt (index!24441 lt!258692) (size!17468 lt!258586)))))

(declare-fun res!358318 () Bool)

(assert (=> b!567873 (= res!358318 (= (select (arr!17104 lt!258586) (index!24441 lt!258692)) lt!258582))))

(assert (=> b!567873 (=> res!358318 e!326745)))

(assert (=> b!567873 (= e!326746 e!326745)))

(assert (= (and d!84335 c!65125) b!567868))

(assert (= (and d!84335 (not c!65125)) b!567865))

(assert (= (and b!567865 c!65127) b!567866))

(assert (= (and b!567865 (not c!65127)) b!567869))

(assert (= (and d!84335 c!65126) b!567872))

(assert (= (and d!84335 (not c!65126)) b!567870))

(assert (= (and b!567870 res!358320) b!567873))

(assert (= (and b!567873 (not res!358318)) b!567871))

(assert (= (and b!567871 (not res!358319)) b!567867))

(declare-fun m!546439 () Bool)

(assert (=> b!567869 m!546439))

(assert (=> b!567869 m!546439))

(declare-fun m!546441 () Bool)

(assert (=> b!567869 m!546441))

(declare-fun m!546443 () Bool)

(assert (=> d!84335 m!546443))

(assert (=> d!84335 m!546267))

(declare-fun m!546445 () Bool)

(assert (=> b!567873 m!546445))

(assert (=> b!567871 m!546445))

(assert (=> b!567867 m!546445))

(assert (=> b!567628 d!84335))

(declare-fun b!567874 () Bool)

(declare-fun e!326748 () SeekEntryResult!5553)

(declare-fun e!326747 () SeekEntryResult!5553)

(assert (=> b!567874 (= e!326748 e!326747)))

(declare-fun lt!258695 () (_ BitVec 64))

(declare-fun c!65130 () Bool)

(assert (=> b!567874 (= c!65130 (or (= lt!258695 (select (arr!17104 a!3118) j!142)) (= (bvadd lt!258695 lt!258695) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!567875 () Bool)

(assert (=> b!567875 (= e!326747 (Intermediate!5553 false lt!258585 #b00000000000000000000000000000000))))

(declare-fun b!567876 () Bool)

(declare-fun lt!258694 () SeekEntryResult!5553)

(assert (=> b!567876 (and (bvsge (index!24441 lt!258694) #b00000000000000000000000000000000) (bvslt (index!24441 lt!258694) (size!17468 a!3118)))))

(declare-fun e!326750 () Bool)

(assert (=> b!567876 (= e!326750 (= (select (arr!17104 a!3118) (index!24441 lt!258694)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!567877 () Bool)

(assert (=> b!567877 (= e!326748 (Intermediate!5553 true lt!258585 #b00000000000000000000000000000000))))

(declare-fun b!567878 () Bool)

(assert (=> b!567878 (= e!326747 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!258585 #b00000000000000000000000000000000 mask!3119) (select (arr!17104 a!3118) j!142) a!3118 mask!3119))))

(declare-fun d!84349 () Bool)

(declare-fun e!326749 () Bool)

(assert (=> d!84349 e!326749))

(declare-fun c!65129 () Bool)

(assert (=> d!84349 (= c!65129 (and ((_ is Intermediate!5553) lt!258694) (undefined!6365 lt!258694)))))

(assert (=> d!84349 (= lt!258694 e!326748)))

(declare-fun c!65128 () Bool)

(assert (=> d!84349 (= c!65128 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84349 (= lt!258695 (select (arr!17104 a!3118) lt!258585))))

(assert (=> d!84349 (validMask!0 mask!3119)))

(assert (=> d!84349 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258585 (select (arr!17104 a!3118) j!142) a!3118 mask!3119) lt!258694)))

(declare-fun b!567879 () Bool)

(declare-fun e!326751 () Bool)

(assert (=> b!567879 (= e!326749 e!326751)))

(declare-fun res!358323 () Bool)

(assert (=> b!567879 (= res!358323 (and ((_ is Intermediate!5553) lt!258694) (not (undefined!6365 lt!258694)) (bvslt (x!53306 lt!258694) #b01111111111111111111111111111110) (bvsge (x!53306 lt!258694) #b00000000000000000000000000000000) (bvsge (x!53306 lt!258694) #b00000000000000000000000000000000)))))

(assert (=> b!567879 (=> (not res!358323) (not e!326751))))

(declare-fun b!567880 () Bool)

(assert (=> b!567880 (and (bvsge (index!24441 lt!258694) #b00000000000000000000000000000000) (bvslt (index!24441 lt!258694) (size!17468 a!3118)))))

(declare-fun res!358322 () Bool)

(assert (=> b!567880 (= res!358322 (= (select (arr!17104 a!3118) (index!24441 lt!258694)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!567880 (=> res!358322 e!326750)))

(declare-fun b!567881 () Bool)

(assert (=> b!567881 (= e!326749 (bvsge (x!53306 lt!258694) #b01111111111111111111111111111110))))

(declare-fun b!567882 () Bool)

(assert (=> b!567882 (and (bvsge (index!24441 lt!258694) #b00000000000000000000000000000000) (bvslt (index!24441 lt!258694) (size!17468 a!3118)))))

(declare-fun res!358321 () Bool)

(assert (=> b!567882 (= res!358321 (= (select (arr!17104 a!3118) (index!24441 lt!258694)) (select (arr!17104 a!3118) j!142)))))

(assert (=> b!567882 (=> res!358321 e!326750)))

(assert (=> b!567882 (= e!326751 e!326750)))

(assert (= (and d!84349 c!65128) b!567877))

(assert (= (and d!84349 (not c!65128)) b!567874))

(assert (= (and b!567874 c!65130) b!567875))

(assert (= (and b!567874 (not c!65130)) b!567878))

(assert (= (and d!84349 c!65129) b!567881))

(assert (= (and d!84349 (not c!65129)) b!567879))

(assert (= (and b!567879 res!358323) b!567882))

(assert (= (and b!567882 (not res!358321)) b!567880))

(assert (= (and b!567880 (not res!358322)) b!567876))

(declare-fun m!546447 () Bool)

(assert (=> b!567878 m!546447))

(assert (=> b!567878 m!546447))

(assert (=> b!567878 m!546257))

(declare-fun m!546451 () Bool)

(assert (=> b!567878 m!546451))

(declare-fun m!546455 () Bool)

(assert (=> d!84349 m!546455))

(assert (=> d!84349 m!546267))

(declare-fun m!546457 () Bool)

(assert (=> b!567882 m!546457))

(assert (=> b!567880 m!546457))

(assert (=> b!567876 m!546457))

(assert (=> b!567628 d!84349))

(declare-fun d!84351 () Bool)

(declare-fun lt!258713 () (_ BitVec 32))

(declare-fun lt!258712 () (_ BitVec 32))

(assert (=> d!84351 (= lt!258713 (bvmul (bvxor lt!258712 (bvlshr lt!258712 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84351 (= lt!258712 ((_ extract 31 0) (bvand (bvxor lt!258582 (bvlshr lt!258582 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84351 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!358328 (let ((h!12196 ((_ extract 31 0) (bvand (bvxor lt!258582 (bvlshr lt!258582 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53313 (bvmul (bvxor h!12196 (bvlshr h!12196 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53313 (bvlshr x!53313 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!358328 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!358328 #b00000000000000000000000000000000))))))

(assert (=> d!84351 (= (toIndex!0 lt!258582 mask!3119) (bvand (bvxor lt!258713 (bvlshr lt!258713 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!567628 d!84351))

(declare-fun d!84357 () Bool)

(declare-fun lt!258715 () (_ BitVec 32))

(declare-fun lt!258714 () (_ BitVec 32))

(assert (=> d!84357 (= lt!258715 (bvmul (bvxor lt!258714 (bvlshr lt!258714 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84357 (= lt!258714 ((_ extract 31 0) (bvand (bvxor (select (arr!17104 a!3118) j!142) (bvlshr (select (arr!17104 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84357 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!358328 (let ((h!12196 ((_ extract 31 0) (bvand (bvxor (select (arr!17104 a!3118) j!142) (bvlshr (select (arr!17104 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53313 (bvmul (bvxor h!12196 (bvlshr h!12196 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53313 (bvlshr x!53313 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!358328 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!358328 #b00000000000000000000000000000000))))))

(assert (=> d!84357 (= (toIndex!0 (select (arr!17104 a!3118) j!142) mask!3119) (bvand (bvxor lt!258715 (bvlshr lt!258715 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!567628 d!84357))

(declare-fun b!567901 () Bool)

(declare-fun e!326765 () SeekEntryResult!5553)

(declare-fun lt!258717 () SeekEntryResult!5553)

(assert (=> b!567901 (= e!326765 (Found!5553 (index!24441 lt!258717)))))

(declare-fun b!567902 () Bool)

(declare-fun c!65137 () Bool)

(declare-fun lt!258718 () (_ BitVec 64))

(assert (=> b!567902 (= c!65137 (= lt!258718 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!326764 () SeekEntryResult!5553)

(assert (=> b!567902 (= e!326765 e!326764)))

(declare-fun b!567903 () Bool)

(declare-fun e!326766 () SeekEntryResult!5553)

(assert (=> b!567903 (= e!326766 e!326765)))

(assert (=> b!567903 (= lt!258718 (select (arr!17104 a!3118) (index!24441 lt!258717)))))

(declare-fun c!65138 () Bool)

(assert (=> b!567903 (= c!65138 (= lt!258718 k0!1914))))

(declare-fun b!567904 () Bool)

(assert (=> b!567904 (= e!326766 Undefined!5553)))

(declare-fun b!567906 () Bool)

(assert (=> b!567906 (= e!326764 (MissingZero!5553 (index!24441 lt!258717)))))

(declare-fun b!567905 () Bool)

(assert (=> b!567905 (= e!326764 (seekKeyOrZeroReturnVacant!0 (x!53306 lt!258717) (index!24441 lt!258717) (index!24441 lt!258717) k0!1914 a!3118 mask!3119))))

(declare-fun d!84359 () Bool)

(declare-fun lt!258716 () SeekEntryResult!5553)

(assert (=> d!84359 (and (or ((_ is Undefined!5553) lt!258716) (not ((_ is Found!5553) lt!258716)) (and (bvsge (index!24440 lt!258716) #b00000000000000000000000000000000) (bvslt (index!24440 lt!258716) (size!17468 a!3118)))) (or ((_ is Undefined!5553) lt!258716) ((_ is Found!5553) lt!258716) (not ((_ is MissingZero!5553) lt!258716)) (and (bvsge (index!24439 lt!258716) #b00000000000000000000000000000000) (bvslt (index!24439 lt!258716) (size!17468 a!3118)))) (or ((_ is Undefined!5553) lt!258716) ((_ is Found!5553) lt!258716) ((_ is MissingZero!5553) lt!258716) (not ((_ is MissingVacant!5553) lt!258716)) (and (bvsge (index!24442 lt!258716) #b00000000000000000000000000000000) (bvslt (index!24442 lt!258716) (size!17468 a!3118)))) (or ((_ is Undefined!5553) lt!258716) (ite ((_ is Found!5553) lt!258716) (= (select (arr!17104 a!3118) (index!24440 lt!258716)) k0!1914) (ite ((_ is MissingZero!5553) lt!258716) (= (select (arr!17104 a!3118) (index!24439 lt!258716)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5553) lt!258716) (= (select (arr!17104 a!3118) (index!24442 lt!258716)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84359 (= lt!258716 e!326766)))

(declare-fun c!65139 () Bool)

(assert (=> d!84359 (= c!65139 (and ((_ is Intermediate!5553) lt!258717) (undefined!6365 lt!258717)))))

(assert (=> d!84359 (= lt!258717 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!84359 (validMask!0 mask!3119)))

(assert (=> d!84359 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!258716)))

(assert (= (and d!84359 c!65139) b!567904))

(assert (= (and d!84359 (not c!65139)) b!567903))

(assert (= (and b!567903 c!65138) b!567901))

(assert (= (and b!567903 (not c!65138)) b!567902))

(assert (= (and b!567902 c!65137) b!567906))

(assert (= (and b!567902 (not c!65137)) b!567905))

(declare-fun m!546473 () Bool)

(assert (=> b!567903 m!546473))

(declare-fun m!546475 () Bool)

(assert (=> b!567905 m!546475))

(declare-fun m!546477 () Bool)

(assert (=> d!84359 m!546477))

(assert (=> d!84359 m!546267))

(declare-fun m!546479 () Bool)

(assert (=> d!84359 m!546479))

(assert (=> d!84359 m!546477))

(declare-fun m!546481 () Bool)

(assert (=> d!84359 m!546481))

(declare-fun m!546483 () Bool)

(assert (=> d!84359 m!546483))

(declare-fun m!546485 () Bool)

(assert (=> d!84359 m!546485))

(assert (=> b!567624 d!84359))

(declare-fun b!567915 () Bool)

(declare-fun e!326774 () SeekEntryResult!5553)

(declare-fun lt!258726 () SeekEntryResult!5553)

(assert (=> b!567915 (= e!326774 (Found!5553 (index!24441 lt!258726)))))

(declare-fun b!567916 () Bool)

(declare-fun c!65142 () Bool)

(declare-fun lt!258727 () (_ BitVec 64))

(assert (=> b!567916 (= c!65142 (= lt!258727 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!326773 () SeekEntryResult!5553)

(assert (=> b!567916 (= e!326774 e!326773)))

(declare-fun b!567917 () Bool)

(declare-fun e!326775 () SeekEntryResult!5553)

(assert (=> b!567917 (= e!326775 e!326774)))

(assert (=> b!567917 (= lt!258727 (select (arr!17104 lt!258586) (index!24441 lt!258726)))))

(declare-fun c!65143 () Bool)

(assert (=> b!567917 (= c!65143 (= lt!258727 lt!258582))))

(declare-fun b!567918 () Bool)

(assert (=> b!567918 (= e!326775 Undefined!5553)))

(declare-fun b!567920 () Bool)

(assert (=> b!567920 (= e!326773 (MissingZero!5553 (index!24441 lt!258726)))))

(declare-fun b!567919 () Bool)

(assert (=> b!567919 (= e!326773 (seekKeyOrZeroReturnVacant!0 (x!53306 lt!258726) (index!24441 lt!258726) (index!24441 lt!258726) lt!258582 lt!258586 mask!3119))))

(declare-fun d!84361 () Bool)

(declare-fun lt!258725 () SeekEntryResult!5553)

(assert (=> d!84361 (and (or ((_ is Undefined!5553) lt!258725) (not ((_ is Found!5553) lt!258725)) (and (bvsge (index!24440 lt!258725) #b00000000000000000000000000000000) (bvslt (index!24440 lt!258725) (size!17468 lt!258586)))) (or ((_ is Undefined!5553) lt!258725) ((_ is Found!5553) lt!258725) (not ((_ is MissingZero!5553) lt!258725)) (and (bvsge (index!24439 lt!258725) #b00000000000000000000000000000000) (bvslt (index!24439 lt!258725) (size!17468 lt!258586)))) (or ((_ is Undefined!5553) lt!258725) ((_ is Found!5553) lt!258725) ((_ is MissingZero!5553) lt!258725) (not ((_ is MissingVacant!5553) lt!258725)) (and (bvsge (index!24442 lt!258725) #b00000000000000000000000000000000) (bvslt (index!24442 lt!258725) (size!17468 lt!258586)))) (or ((_ is Undefined!5553) lt!258725) (ite ((_ is Found!5553) lt!258725) (= (select (arr!17104 lt!258586) (index!24440 lt!258725)) lt!258582) (ite ((_ is MissingZero!5553) lt!258725) (= (select (arr!17104 lt!258586) (index!24439 lt!258725)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5553) lt!258725) (= (select (arr!17104 lt!258586) (index!24442 lt!258725)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84361 (= lt!258725 e!326775)))

(declare-fun c!65144 () Bool)

(assert (=> d!84361 (= c!65144 (and ((_ is Intermediate!5553) lt!258726) (undefined!6365 lt!258726)))))

(assert (=> d!84361 (= lt!258726 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!258582 mask!3119) lt!258582 lt!258586 mask!3119))))

(assert (=> d!84361 (validMask!0 mask!3119)))

(assert (=> d!84361 (= (seekEntryOrOpen!0 lt!258582 lt!258586 mask!3119) lt!258725)))

(assert (= (and d!84361 c!65144) b!567918))

(assert (= (and d!84361 (not c!65144)) b!567917))

(assert (= (and b!567917 c!65143) b!567915))

(assert (= (and b!567917 (not c!65143)) b!567916))

(assert (= (and b!567916 c!65142) b!567920))

(assert (= (and b!567916 (not c!65142)) b!567919))

(declare-fun m!546487 () Bool)

(assert (=> b!567917 m!546487))

(declare-fun m!546489 () Bool)

(assert (=> b!567919 m!546489))

(assert (=> d!84361 m!546273))

(assert (=> d!84361 m!546267))

(declare-fun m!546491 () Bool)

(assert (=> d!84361 m!546491))

(assert (=> d!84361 m!546273))

(declare-fun m!546493 () Bool)

(assert (=> d!84361 m!546493))

(declare-fun m!546495 () Bool)

(assert (=> d!84361 m!546495))

(declare-fun m!546497 () Bool)

(assert (=> d!84361 m!546497))

(assert (=> b!567629 d!84361))

(check-sat (not bm!32522) (not bm!32523) (not b!567741) (not d!84361) (not b!567905) (not d!84349) (not b!567675) (not b!567740) (not b!567693) (not b!567676) (not b!567692) (not b!567919) (not d!84359) (not d!84307) (not d!84315) (not b!567730) (not b!567787) (not b!567673) (not d!84335) (not b!567869) (not bm!32519) (not b!567878))
(check-sat)
