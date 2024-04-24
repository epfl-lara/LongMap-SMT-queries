; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6200 () Bool)

(assert start!6200)

(declare-fun res!25148 () Bool)

(declare-fun e!26727 () Bool)

(assert (=> start!6200 (=> (not res!25148) (not e!26727))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6200 (= res!25148 (validMask!0 mask!853))))

(assert (=> start!6200 e!26727))

(assert (=> start!6200 true))

(declare-fun b!42226 () Bool)

(assert (=> b!42226 (= e!26727 (not (bvslt (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111)))))

(declare-datatypes ((array!2787 0))(
  ( (array!2788 (arr!1337 (Array (_ BitVec 32) (_ BitVec 64))) (size!1504 (_ BitVec 32))) )
))
(declare-fun lt!17433 () array!2787)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2787 (_ BitVec 32)) Bool)

(assert (=> b!42226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17433 mask!853)))

(declare-datatypes ((Unit!1131 0))(
  ( (Unit!1132) )
))
(declare-fun lt!17432 () Unit!1131)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2787 (_ BitVec 32) (_ BitVec 32)) Unit!1131)

(assert (=> b!42226 (= lt!17432 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17433 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2787 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42226 (= (arrayCountValidKeys!0 lt!17433 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17434 () Unit!1131)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2787 (_ BitVec 32) (_ BitVec 32)) Unit!1131)

(assert (=> b!42226 (= lt!17434 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17433 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42226 (= lt!17433 (array!2788 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!6200 res!25148) b!42226))

(declare-fun m!35779 () Bool)

(assert (=> start!6200 m!35779))

(declare-fun m!35781 () Bool)

(assert (=> b!42226 m!35781))

(declare-fun m!35783 () Bool)

(assert (=> b!42226 m!35783))

(declare-fun m!35785 () Bool)

(assert (=> b!42226 m!35785))

(declare-fun m!35787 () Bool)

(assert (=> b!42226 m!35787))

(check-sat (not start!6200) (not b!42226))
(check-sat)
(get-model)

(declare-fun d!7631 () Bool)

(assert (=> d!7631 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6200 d!7631))

(declare-fun b!42261 () Bool)

(declare-fun e!26755 () Bool)

(declare-fun e!26756 () Bool)

(assert (=> b!42261 (= e!26755 e!26756)))

(declare-fun c!5295 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!42261 (= c!5295 (validKeyInArray!0 (select (arr!1337 lt!17433) #b00000000000000000000000000000000)))))

(declare-fun b!42262 () Bool)

(declare-fun call!3288 () Bool)

(assert (=> b!42262 (= e!26756 call!3288)))

(declare-fun b!42263 () Bool)

(declare-fun e!26757 () Bool)

(assert (=> b!42263 (= e!26757 call!3288)))

(declare-fun b!42264 () Bool)

(assert (=> b!42264 (= e!26756 e!26757)))

(declare-fun lt!17478 () (_ BitVec 64))

(assert (=> b!42264 (= lt!17478 (select (arr!1337 lt!17433) #b00000000000000000000000000000000))))

(declare-fun lt!17477 () Unit!1131)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2787 (_ BitVec 64) (_ BitVec 32)) Unit!1131)

(assert (=> b!42264 (= lt!17477 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!17433 lt!17478 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2787 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!42264 (arrayContainsKey!0 lt!17433 lt!17478 #b00000000000000000000000000000000)))

(declare-fun lt!17479 () Unit!1131)

(assert (=> b!42264 (= lt!17479 lt!17477)))

(declare-fun res!25169 () Bool)

(declare-datatypes ((SeekEntryResult!176 0))(
  ( (MissingZero!176 (index!2826 (_ BitVec 32))) (Found!176 (index!2827 (_ BitVec 32))) (Intermediate!176 (undefined!988 Bool) (index!2828 (_ BitVec 32)) (x!8085 (_ BitVec 32))) (Undefined!176) (MissingVacant!176 (index!2829 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2787 (_ BitVec 32)) SeekEntryResult!176)

(assert (=> b!42264 (= res!25169 (= (seekEntryOrOpen!0 (select (arr!1337 lt!17433) #b00000000000000000000000000000000) lt!17433 mask!853) (Found!176 #b00000000000000000000000000000000)))))

(assert (=> b!42264 (=> (not res!25169) (not e!26757))))

(declare-fun d!7637 () Bool)

(declare-fun res!25170 () Bool)

(assert (=> d!7637 (=> res!25170 e!26755)))

(assert (=> d!7637 (= res!25170 (bvsge #b00000000000000000000000000000000 (size!1504 lt!17433)))))

(assert (=> d!7637 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17433 mask!853) e!26755)))

(declare-fun bm!3285 () Bool)

(assert (=> bm!3285 (= call!3288 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!17433 mask!853))))

(assert (= (and d!7637 (not res!25170)) b!42261))

(assert (= (and b!42261 c!5295) b!42264))

(assert (= (and b!42261 (not c!5295)) b!42262))

(assert (= (and b!42264 res!25169) b!42263))

(assert (= (or b!42263 b!42262) bm!3285))

(declare-fun m!35823 () Bool)

(assert (=> b!42261 m!35823))

(assert (=> b!42261 m!35823))

(declare-fun m!35825 () Bool)

(assert (=> b!42261 m!35825))

(assert (=> b!42264 m!35823))

(declare-fun m!35827 () Bool)

(assert (=> b!42264 m!35827))

(declare-fun m!35829 () Bool)

(assert (=> b!42264 m!35829))

(assert (=> b!42264 m!35823))

(declare-fun m!35831 () Bool)

(assert (=> b!42264 m!35831))

(declare-fun m!35833 () Bool)

(assert (=> bm!3285 m!35833))

(assert (=> b!42226 d!7637))

(declare-fun d!7645 () Bool)

(assert (=> d!7645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17433 mask!853)))

(declare-fun lt!17488 () Unit!1131)

(declare-fun choose!34 (array!2787 (_ BitVec 32) (_ BitVec 32)) Unit!1131)

(assert (=> d!7645 (= lt!17488 (choose!34 lt!17433 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!7645 (validMask!0 mask!853)))

(assert (=> d!7645 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17433 mask!853 #b00000000000000000000000000000000) lt!17488)))

(declare-fun bs!1855 () Bool)

(assert (= bs!1855 d!7645))

(assert (=> bs!1855 m!35781))

(declare-fun m!35849 () Bool)

(assert (=> bs!1855 m!35849))

(assert (=> bs!1855 m!35779))

(assert (=> b!42226 d!7645))

(declare-fun b!42289 () Bool)

(declare-fun e!26771 () (_ BitVec 32))

(declare-fun call!3297 () (_ BitVec 32))

(assert (=> b!42289 (= e!26771 (bvadd #b00000000000000000000000000000001 call!3297))))

(declare-fun bm!3294 () Bool)

(assert (=> bm!3294 (= call!3297 (arrayCountValidKeys!0 lt!17433 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun d!7651 () Bool)

(declare-fun lt!17497 () (_ BitVec 32))

(assert (=> d!7651 (and (bvsge lt!17497 #b00000000000000000000000000000000) (bvsle lt!17497 (bvsub (size!1504 lt!17433) #b00000000000000000000000000000000)))))

(declare-fun e!26772 () (_ BitVec 32))

(assert (=> d!7651 (= lt!17497 e!26772)))

(declare-fun c!5308 () Bool)

(assert (=> d!7651 (= c!5308 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7651 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1504 lt!17433)))))

(assert (=> d!7651 (= (arrayCountValidKeys!0 lt!17433 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17497)))

(declare-fun b!42290 () Bool)

(assert (=> b!42290 (= e!26772 #b00000000000000000000000000000000)))

(declare-fun b!42291 () Bool)

(assert (=> b!42291 (= e!26771 call!3297)))

(declare-fun b!42292 () Bool)

(assert (=> b!42292 (= e!26772 e!26771)))

(declare-fun c!5307 () Bool)

(assert (=> b!42292 (= c!5307 (validKeyInArray!0 (select (arr!1337 lt!17433) #b00000000000000000000000000000000)))))

(assert (= (and d!7651 c!5308) b!42290))

(assert (= (and d!7651 (not c!5308)) b!42292))

(assert (= (and b!42292 c!5307) b!42289))

(assert (= (and b!42292 (not c!5307)) b!42291))

(assert (= (or b!42289 b!42291) bm!3294))

(declare-fun m!35855 () Bool)

(assert (=> bm!3294 m!35855))

(assert (=> b!42292 m!35823))

(assert (=> b!42292 m!35823))

(assert (=> b!42292 m!35825))

(assert (=> b!42226 d!7651))

(declare-fun d!7657 () Bool)

(assert (=> d!7657 (= (arrayCountValidKeys!0 lt!17433 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17502 () Unit!1131)

(declare-fun choose!59 (array!2787 (_ BitVec 32) (_ BitVec 32)) Unit!1131)

(assert (=> d!7657 (= lt!17502 (choose!59 lt!17433 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7657 (bvslt (size!1504 lt!17433) #b01111111111111111111111111111111)))

(assert (=> d!7657 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17433 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17502)))

(declare-fun bs!1858 () Bool)

(assert (= bs!1858 d!7657))

(assert (=> bs!1858 m!35785))

(declare-fun m!35857 () Bool)

(assert (=> bs!1858 m!35857))

(assert (=> b!42226 d!7657))

(check-sat (not b!42264) (not d!7657) (not b!42292) (not bm!3294) (not d!7645) (not bm!3285) (not b!42261))
(check-sat)
