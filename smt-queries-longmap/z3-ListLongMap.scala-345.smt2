; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6318 () Bool)

(assert start!6318)

(declare-fun b!42596 () Bool)

(declare-fun res!25326 () Bool)

(declare-fun e!26985 () Bool)

(assert (=> b!42596 (=> res!25326 e!26985)))

(declare-datatypes ((List!1146 0))(
  ( (Nil!1143) (Cons!1142 (h!1719 (_ BitVec 64)) (t!4093 List!1146)) )
))
(declare-fun contains!557 (List!1146 (_ BitVec 64)) Bool)

(assert (=> b!42596 (= res!25326 (contains!557 Nil!1143 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!25323 () Bool)

(declare-fun e!26986 () Bool)

(assert (=> start!6318 (=> (not res!25323) (not e!26986))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6318 (= res!25323 (validMask!0 mask!853))))

(assert (=> start!6318 e!26986))

(assert (=> start!6318 true))

(declare-fun b!42595 () Bool)

(assert (=> b!42595 (= e!26986 (not e!26985))))

(declare-fun res!25325 () Bool)

(assert (=> b!42595 (=> res!25325 e!26985)))

(assert (=> b!42595 (= res!25325 (or (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853))))))

(declare-datatypes ((array!2827 0))(
  ( (array!2828 (arr!1357 (Array (_ BitVec 32) (_ BitVec 64))) (size!1533 (_ BitVec 32))) )
))
(declare-fun lt!17768 () array!2827)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2827 (_ BitVec 32)) Bool)

(assert (=> b!42595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17768 mask!853)))

(declare-datatypes ((Unit!1145 0))(
  ( (Unit!1146) )
))
(declare-fun lt!17767 () Unit!1145)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2827 (_ BitVec 32) (_ BitVec 32)) Unit!1145)

(assert (=> b!42595 (= lt!17767 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17768 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2827 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42595 (= (arrayCountValidKeys!0 lt!17768 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17766 () Unit!1145)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2827 (_ BitVec 32) (_ BitVec 32)) Unit!1145)

(assert (=> b!42595 (= lt!17766 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17768 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42595 (= lt!17768 (array!2828 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!42598 () Bool)

(declare-fun noDuplicate!35 (List!1146) Bool)

(assert (=> b!42598 (= e!26985 (noDuplicate!35 Nil!1143))))

(declare-fun b!42597 () Bool)

(declare-fun res!25324 () Bool)

(assert (=> b!42597 (=> res!25324 e!26985)))

(assert (=> b!42597 (= res!25324 (contains!557 Nil!1143 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!6318 res!25323) b!42595))

(assert (= (and b!42595 (not res!25325)) b!42596))

(assert (= (and b!42596 (not res!25326)) b!42597))

(assert (= (and b!42597 (not res!25324)) b!42598))

(declare-fun m!36243 () Bool)

(assert (=> start!6318 m!36243))

(declare-fun m!36245 () Bool)

(assert (=> b!42596 m!36245))

(declare-fun m!36247 () Bool)

(assert (=> b!42598 m!36247))

(declare-fun m!36249 () Bool)

(assert (=> b!42597 m!36249))

(declare-fun m!36251 () Bool)

(assert (=> b!42595 m!36251))

(declare-fun m!36253 () Bool)

(assert (=> b!42595 m!36253))

(declare-fun m!36255 () Bool)

(assert (=> b!42595 m!36255))

(declare-fun m!36257 () Bool)

(assert (=> b!42595 m!36257))

(check-sat (not start!6318) (not b!42596) (not b!42598) (not b!42597) (not b!42595))
(check-sat)
(get-model)

(declare-fun d!7755 () Bool)

(declare-fun lt!17780 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!36 (List!1146) (InoxSet (_ BitVec 64)))

(assert (=> d!7755 (= lt!17780 (select (content!36 Nil!1143) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!26998 () Bool)

(assert (=> d!7755 (= lt!17780 e!26998)))

(declare-fun res!25344 () Bool)

(assert (=> d!7755 (=> (not res!25344) (not e!26998))))

(get-info :version)

(assert (=> d!7755 (= res!25344 ((_ is Cons!1142) Nil!1143))))

(assert (=> d!7755 (= (contains!557 Nil!1143 #b0000000000000000000000000000000000000000000000000000000000000000) lt!17780)))

(declare-fun b!42615 () Bool)

(declare-fun e!26997 () Bool)

(assert (=> b!42615 (= e!26998 e!26997)))

(declare-fun res!25343 () Bool)

(assert (=> b!42615 (=> res!25343 e!26997)))

(assert (=> b!42615 (= res!25343 (= (h!1719 Nil!1143) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!42616 () Bool)

(assert (=> b!42616 (= e!26997 (contains!557 (t!4093 Nil!1143) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!7755 res!25344) b!42615))

(assert (= (and b!42615 (not res!25343)) b!42616))

(declare-fun m!36275 () Bool)

(assert (=> d!7755 m!36275))

(declare-fun m!36277 () Bool)

(assert (=> d!7755 m!36277))

(declare-fun m!36279 () Bool)

(assert (=> b!42616 m!36279))

(assert (=> b!42596 d!7755))

(declare-fun b!42643 () Bool)

(declare-fun e!27021 () Bool)

(declare-fun e!27020 () Bool)

(assert (=> b!42643 (= e!27021 e!27020)))

(declare-fun lt!17800 () (_ BitVec 64))

(assert (=> b!42643 (= lt!17800 (select (arr!1357 lt!17768) #b00000000000000000000000000000000))))

(declare-fun lt!17799 () Unit!1145)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2827 (_ BitVec 64) (_ BitVec 32)) Unit!1145)

(assert (=> b!42643 (= lt!17799 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!17768 lt!17800 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2827 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!42643 (arrayContainsKey!0 lt!17768 lt!17800 #b00000000000000000000000000000000)))

(declare-fun lt!17801 () Unit!1145)

(assert (=> b!42643 (= lt!17801 lt!17799)))

(declare-fun res!25361 () Bool)

(declare-datatypes ((SeekEntryResult!190 0))(
  ( (MissingZero!190 (index!2882 (_ BitVec 32))) (Found!190 (index!2883 (_ BitVec 32))) (Intermediate!190 (undefined!1002 Bool) (index!2884 (_ BitVec 32)) (x!8131 (_ BitVec 32))) (Undefined!190) (MissingVacant!190 (index!2885 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2827 (_ BitVec 32)) SeekEntryResult!190)

(assert (=> b!42643 (= res!25361 (= (seekEntryOrOpen!0 (select (arr!1357 lt!17768) #b00000000000000000000000000000000) lt!17768 mask!853) (Found!190 #b00000000000000000000000000000000)))))

(assert (=> b!42643 (=> (not res!25361) (not e!27020))))

(declare-fun bm!3353 () Bool)

(declare-fun call!3356 () Bool)

(assert (=> bm!3353 (= call!3356 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!17768 mask!853))))

(declare-fun b!42644 () Bool)

(assert (=> b!42644 (= e!27020 call!3356)))

(declare-fun b!42645 () Bool)

(assert (=> b!42645 (= e!27021 call!3356)))

(declare-fun b!42646 () Bool)

(declare-fun e!27022 () Bool)

(assert (=> b!42646 (= e!27022 e!27021)))

(declare-fun c!5390 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!42646 (= c!5390 (validKeyInArray!0 (select (arr!1357 lt!17768) #b00000000000000000000000000000000)))))

(declare-fun d!7761 () Bool)

(declare-fun res!25362 () Bool)

(assert (=> d!7761 (=> res!25362 e!27022)))

(assert (=> d!7761 (= res!25362 (bvsge #b00000000000000000000000000000000 (size!1533 lt!17768)))))

(assert (=> d!7761 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17768 mask!853) e!27022)))

(assert (= (and d!7761 (not res!25362)) b!42646))

(assert (= (and b!42646 c!5390) b!42643))

(assert (= (and b!42646 (not c!5390)) b!42645))

(assert (= (and b!42643 res!25361) b!42644))

(assert (= (or b!42644 b!42645) bm!3353))

(declare-fun m!36299 () Bool)

(assert (=> b!42643 m!36299))

(declare-fun m!36301 () Bool)

(assert (=> b!42643 m!36301))

(declare-fun m!36303 () Bool)

(assert (=> b!42643 m!36303))

(assert (=> b!42643 m!36299))

(declare-fun m!36305 () Bool)

(assert (=> b!42643 m!36305))

(declare-fun m!36307 () Bool)

(assert (=> bm!3353 m!36307))

(assert (=> b!42646 m!36299))

(assert (=> b!42646 m!36299))

(declare-fun m!36309 () Bool)

(assert (=> b!42646 m!36309))

(assert (=> b!42595 d!7761))

(declare-fun d!7769 () Bool)

(assert (=> d!7769 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17768 mask!853)))

(declare-fun lt!17807 () Unit!1145)

(declare-fun choose!34 (array!2827 (_ BitVec 32) (_ BitVec 32)) Unit!1145)

(assert (=> d!7769 (= lt!17807 (choose!34 lt!17768 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!7769 (validMask!0 mask!853)))

(assert (=> d!7769 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17768 mask!853 #b00000000000000000000000000000000) lt!17807)))

(declare-fun bs!1885 () Bool)

(assert (= bs!1885 d!7769))

(assert (=> bs!1885 m!36251))

(declare-fun m!36313 () Bool)

(assert (=> bs!1885 m!36313))

(assert (=> bs!1885 m!36243))

(assert (=> b!42595 d!7769))

(declare-fun bm!3362 () Bool)

(declare-fun call!3365 () (_ BitVec 32))

(assert (=> bm!3362 (= call!3365 (arrayCountValidKeys!0 lt!17768 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!42679 () Bool)

(declare-fun e!27043 () (_ BitVec 32))

(declare-fun e!27042 () (_ BitVec 32))

(assert (=> b!42679 (= e!27043 e!27042)))

(declare-fun c!5404 () Bool)

(assert (=> b!42679 (= c!5404 (validKeyInArray!0 (select (arr!1357 lt!17768) #b00000000000000000000000000000000)))))

(declare-fun b!42680 () Bool)

(assert (=> b!42680 (= e!27042 call!3365)))

(declare-fun b!42681 () Bool)

(assert (=> b!42681 (= e!27043 #b00000000000000000000000000000000)))

(declare-fun b!42682 () Bool)

(assert (=> b!42682 (= e!27042 (bvadd #b00000000000000000000000000000001 call!3365))))

(declare-fun d!7773 () Bool)

(declare-fun lt!17822 () (_ BitVec 32))

(assert (=> d!7773 (and (bvsge lt!17822 #b00000000000000000000000000000000) (bvsle lt!17822 (bvsub (size!1533 lt!17768) #b00000000000000000000000000000000)))))

(assert (=> d!7773 (= lt!17822 e!27043)))

(declare-fun c!5405 () Bool)

(assert (=> d!7773 (= c!5405 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7773 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1533 lt!17768)))))

(assert (=> d!7773 (= (arrayCountValidKeys!0 lt!17768 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17822)))

(assert (= (and d!7773 c!5405) b!42681))

(assert (= (and d!7773 (not c!5405)) b!42679))

(assert (= (and b!42679 c!5404) b!42682))

(assert (= (and b!42679 (not c!5404)) b!42680))

(assert (= (or b!42682 b!42680) bm!3362))

(declare-fun m!36329 () Bool)

(assert (=> bm!3362 m!36329))

(assert (=> b!42679 m!36299))

(assert (=> b!42679 m!36299))

(assert (=> b!42679 m!36309))

(assert (=> b!42595 d!7773))

(declare-fun d!7779 () Bool)

(assert (=> d!7779 (= (arrayCountValidKeys!0 lt!17768 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17830 () Unit!1145)

(declare-fun choose!59 (array!2827 (_ BitVec 32) (_ BitVec 32)) Unit!1145)

(assert (=> d!7779 (= lt!17830 (choose!59 lt!17768 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7779 (bvslt (size!1533 lt!17768) #b01111111111111111111111111111111)))

(assert (=> d!7779 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17768 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17830)))

(declare-fun bs!1887 () Bool)

(assert (= bs!1887 d!7779))

(assert (=> bs!1887 m!36255))

(declare-fun m!36333 () Bool)

(assert (=> bs!1887 m!36333))

(assert (=> b!42595 d!7779))

(declare-fun d!7783 () Bool)

(declare-fun res!25379 () Bool)

(declare-fun e!27054 () Bool)

(assert (=> d!7783 (=> res!25379 e!27054)))

(assert (=> d!7783 (= res!25379 ((_ is Nil!1143) Nil!1143))))

(assert (=> d!7783 (= (noDuplicate!35 Nil!1143) e!27054)))

(declare-fun b!42693 () Bool)

(declare-fun e!27055 () Bool)

(assert (=> b!42693 (= e!27054 e!27055)))

(declare-fun res!25380 () Bool)

(assert (=> b!42693 (=> (not res!25380) (not e!27055))))

(assert (=> b!42693 (= res!25380 (not (contains!557 (t!4093 Nil!1143) (h!1719 Nil!1143))))))

(declare-fun b!42694 () Bool)

(assert (=> b!42694 (= e!27055 (noDuplicate!35 (t!4093 Nil!1143)))))

(assert (= (and d!7783 (not res!25379)) b!42693))

(assert (= (and b!42693 res!25380) b!42694))

(declare-fun m!36341 () Bool)

(assert (=> b!42693 m!36341))

(declare-fun m!36343 () Bool)

(assert (=> b!42694 m!36343))

(assert (=> b!42598 d!7783))

(declare-fun d!7789 () Bool)

(declare-fun lt!17832 () Bool)

(assert (=> d!7789 (= lt!17832 (select (content!36 Nil!1143) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!27057 () Bool)

(assert (=> d!7789 (= lt!17832 e!27057)))

(declare-fun res!25382 () Bool)

(assert (=> d!7789 (=> (not res!25382) (not e!27057))))

(assert (=> d!7789 (= res!25382 ((_ is Cons!1142) Nil!1143))))

(assert (=> d!7789 (= (contains!557 Nil!1143 #b1000000000000000000000000000000000000000000000000000000000000000) lt!17832)))

(declare-fun b!42695 () Bool)

(declare-fun e!27056 () Bool)

(assert (=> b!42695 (= e!27057 e!27056)))

(declare-fun res!25381 () Bool)

(assert (=> b!42695 (=> res!25381 e!27056)))

(assert (=> b!42695 (= res!25381 (= (h!1719 Nil!1143) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!42696 () Bool)

(assert (=> b!42696 (= e!27056 (contains!557 (t!4093 Nil!1143) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!7789 res!25382) b!42695))

(assert (= (and b!42695 (not res!25381)) b!42696))

(assert (=> d!7789 m!36275))

(declare-fun m!36345 () Bool)

(assert (=> d!7789 m!36345))

(declare-fun m!36347 () Bool)

(assert (=> b!42696 m!36347))

(assert (=> b!42597 d!7789))

(declare-fun d!7791 () Bool)

(assert (=> d!7791 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6318 d!7791))

(check-sat (not b!42696) (not b!42694) (not d!7779) (not bm!3353) (not d!7769) (not b!42679) (not d!7789) (not b!42616) (not d!7755) (not b!42646) (not b!42693) (not b!42643) (not bm!3362))
(check-sat)
