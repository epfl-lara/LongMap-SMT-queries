; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6278 () Bool)

(assert start!6278)

(declare-fun res!25216 () Bool)

(declare-fun e!26850 () Bool)

(assert (=> start!6278 (=> (not res!25216) (not e!26850))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6278 (= res!25216 (validMask!0 mask!853))))

(assert (=> start!6278 e!26850))

(assert (=> start!6278 true))

(declare-fun b!42401 () Bool)

(declare-fun e!26849 () Bool)

(assert (=> b!42401 (= e!26850 (not e!26849))))

(declare-fun res!25217 () Bool)

(assert (=> b!42401 (=> res!25217 e!26849)))

(assert (=> b!42401 (= res!25217 (or (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853))))))

(declare-datatypes ((array!2805 0))(
  ( (array!2806 (arr!1346 (Array (_ BitVec 32) (_ BitVec 64))) (size!1519 (_ BitVec 32))) )
))
(declare-fun lt!17622 () array!2805)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2805 (_ BitVec 32)) Bool)

(assert (=> b!42401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17622 mask!853)))

(declare-datatypes ((Unit!1149 0))(
  ( (Unit!1150) )
))
(declare-fun lt!17623 () Unit!1149)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2805 (_ BitVec 32) (_ BitVec 32)) Unit!1149)

(assert (=> b!42401 (= lt!17623 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17622 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2805 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42401 (= (arrayCountValidKeys!0 lt!17622 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17621 () Unit!1149)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2805 (_ BitVec 32) (_ BitVec 32)) Unit!1149)

(assert (=> b!42401 (= lt!17621 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17622 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42401 (= lt!17622 (array!2806 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!42402 () Bool)

(declare-fun e!26848 () Bool)

(assert (=> b!42402 (= e!26849 e!26848)))

(declare-fun res!25215 () Bool)

(assert (=> b!42402 (=> (not res!25215) (not e!26848))))

(declare-datatypes ((List!1128 0))(
  ( (Nil!1125) (Cons!1124 (h!1701 (_ BitVec 64)) (t!4075 List!1128)) )
))
(declare-fun contains!544 (List!1128 (_ BitVec 64)) Bool)

(assert (=> b!42402 (= res!25215 (not (contains!544 Nil!1125 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!42403 () Bool)

(assert (=> b!42403 (= e!26848 (not (contains!544 Nil!1125 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!6278 res!25216) b!42401))

(assert (= (and b!42401 (not res!25217)) b!42402))

(assert (= (and b!42402 res!25215) b!42403))

(declare-fun m!35977 () Bool)

(assert (=> start!6278 m!35977))

(declare-fun m!35979 () Bool)

(assert (=> b!42401 m!35979))

(declare-fun m!35981 () Bool)

(assert (=> b!42401 m!35981))

(declare-fun m!35983 () Bool)

(assert (=> b!42401 m!35983))

(declare-fun m!35985 () Bool)

(assert (=> b!42401 m!35985))

(declare-fun m!35987 () Bool)

(assert (=> b!42402 m!35987))

(declare-fun m!35989 () Bool)

(assert (=> b!42403 m!35989))

(check-sat (not b!42403) (not b!42402) (not b!42401) (not start!6278))
(check-sat)
(get-model)

(declare-fun d!7697 () Bool)

(declare-fun lt!17644 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!34 (List!1128) (InoxSet (_ BitVec 64)))

(assert (=> d!7697 (= lt!17644 (select (content!34 Nil!1125) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!26874 () Bool)

(assert (=> d!7697 (= lt!17644 e!26874)))

(declare-fun res!25240 () Bool)

(assert (=> d!7697 (=> (not res!25240) (not e!26874))))

(get-info :version)

(assert (=> d!7697 (= res!25240 ((_ is Cons!1124) Nil!1125))))

(assert (=> d!7697 (= (contains!544 Nil!1125 #b1000000000000000000000000000000000000000000000000000000000000000) lt!17644)))

(declare-fun b!42426 () Bool)

(declare-fun e!26873 () Bool)

(assert (=> b!42426 (= e!26874 e!26873)))

(declare-fun res!25241 () Bool)

(assert (=> b!42426 (=> res!25241 e!26873)))

(assert (=> b!42426 (= res!25241 (= (h!1701 Nil!1125) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!42427 () Bool)

(assert (=> b!42427 (= e!26873 (contains!544 (t!4075 Nil!1125) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!7697 res!25240) b!42426))

(assert (= (and b!42426 (not res!25241)) b!42427))

(declare-fun m!36019 () Bool)

(assert (=> d!7697 m!36019))

(declare-fun m!36021 () Bool)

(assert (=> d!7697 m!36021))

(declare-fun m!36023 () Bool)

(assert (=> b!42427 m!36023))

(assert (=> b!42403 d!7697))

(declare-fun d!7703 () Bool)

(declare-fun lt!17645 () Bool)

(assert (=> d!7703 (= lt!17645 (select (content!34 Nil!1125) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!26876 () Bool)

(assert (=> d!7703 (= lt!17645 e!26876)))

(declare-fun res!25242 () Bool)

(assert (=> d!7703 (=> (not res!25242) (not e!26876))))

(assert (=> d!7703 (= res!25242 ((_ is Cons!1124) Nil!1125))))

(assert (=> d!7703 (= (contains!544 Nil!1125 #b0000000000000000000000000000000000000000000000000000000000000000) lt!17645)))

(declare-fun b!42428 () Bool)

(declare-fun e!26875 () Bool)

(assert (=> b!42428 (= e!26876 e!26875)))

(declare-fun res!25243 () Bool)

(assert (=> b!42428 (=> res!25243 e!26875)))

(assert (=> b!42428 (= res!25243 (= (h!1701 Nil!1125) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!42429 () Bool)

(assert (=> b!42429 (= e!26875 (contains!544 (t!4075 Nil!1125) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!7703 res!25242) b!42428))

(assert (= (and b!42428 (not res!25243)) b!42429))

(assert (=> d!7703 m!36019))

(declare-fun m!36025 () Bool)

(assert (=> d!7703 m!36025))

(declare-fun m!36027 () Bool)

(assert (=> b!42429 m!36027))

(assert (=> b!42402 d!7703))

(declare-fun b!42466 () Bool)

(declare-fun e!26910 () Bool)

(declare-fun call!3321 () Bool)

(assert (=> b!42466 (= e!26910 call!3321)))

(declare-fun b!42467 () Bool)

(declare-fun e!26909 () Bool)

(assert (=> b!42467 (= e!26910 e!26909)))

(declare-fun lt!17673 () (_ BitVec 64))

(assert (=> b!42467 (= lt!17673 (select (arr!1346 lt!17622) #b00000000000000000000000000000000))))

(declare-fun lt!17672 () Unit!1149)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2805 (_ BitVec 64) (_ BitVec 32)) Unit!1149)

(assert (=> b!42467 (= lt!17672 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!17622 lt!17673 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2805 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!42467 (arrayContainsKey!0 lt!17622 lt!17673 #b00000000000000000000000000000000)))

(declare-fun lt!17674 () Unit!1149)

(assert (=> b!42467 (= lt!17674 lt!17672)))

(declare-fun res!25270 () Bool)

(declare-datatypes ((SeekEntryResult!181 0))(
  ( (MissingZero!181 (index!2846 (_ BitVec 32))) (Found!181 (index!2847 (_ BitVec 32))) (Intermediate!181 (undefined!993 Bool) (index!2848 (_ BitVec 32)) (x!8114 (_ BitVec 32))) (Undefined!181) (MissingVacant!181 (index!2849 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2805 (_ BitVec 32)) SeekEntryResult!181)

(assert (=> b!42467 (= res!25270 (= (seekEntryOrOpen!0 (select (arr!1346 lt!17622) #b00000000000000000000000000000000) lt!17622 mask!853) (Found!181 #b00000000000000000000000000000000)))))

(assert (=> b!42467 (=> (not res!25270) (not e!26909))))

(declare-fun d!7705 () Bool)

(declare-fun res!25271 () Bool)

(declare-fun e!26911 () Bool)

(assert (=> d!7705 (=> res!25271 e!26911)))

(assert (=> d!7705 (= res!25271 (bvsge #b00000000000000000000000000000000 (size!1519 lt!17622)))))

(assert (=> d!7705 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17622 mask!853) e!26911)))

(declare-fun bm!3318 () Bool)

(assert (=> bm!3318 (= call!3321 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!17622 mask!853))))

(declare-fun b!42468 () Bool)

(assert (=> b!42468 (= e!26909 call!3321)))

(declare-fun b!42469 () Bool)

(assert (=> b!42469 (= e!26911 e!26910)))

(declare-fun c!5348 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!42469 (= c!5348 (validKeyInArray!0 (select (arr!1346 lt!17622) #b00000000000000000000000000000000)))))

(assert (= (and d!7705 (not res!25271)) b!42469))

(assert (= (and b!42469 c!5348) b!42467))

(assert (= (and b!42469 (not c!5348)) b!42466))

(assert (= (and b!42467 res!25270) b!42468))

(assert (= (or b!42468 b!42466) bm!3318))

(declare-fun m!36049 () Bool)

(assert (=> b!42467 m!36049))

(declare-fun m!36051 () Bool)

(assert (=> b!42467 m!36051))

(declare-fun m!36053 () Bool)

(assert (=> b!42467 m!36053))

(assert (=> b!42467 m!36049))

(declare-fun m!36055 () Bool)

(assert (=> b!42467 m!36055))

(declare-fun m!36057 () Bool)

(assert (=> bm!3318 m!36057))

(assert (=> b!42469 m!36049))

(assert (=> b!42469 m!36049))

(declare-fun m!36059 () Bool)

(assert (=> b!42469 m!36059))

(assert (=> b!42401 d!7705))

(declare-fun d!7715 () Bool)

(assert (=> d!7715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17622 mask!853)))

(declare-fun lt!17683 () Unit!1149)

(declare-fun choose!34 (array!2805 (_ BitVec 32) (_ BitVec 32)) Unit!1149)

(assert (=> d!7715 (= lt!17683 (choose!34 lt!17622 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!7715 (validMask!0 mask!853)))

(assert (=> d!7715 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17622 mask!853 #b00000000000000000000000000000000) lt!17683)))

(declare-fun bs!1875 () Bool)

(assert (= bs!1875 d!7715))

(assert (=> bs!1875 m!35979))

(declare-fun m!36085 () Bool)

(assert (=> bs!1875 m!36085))

(assert (=> bs!1875 m!35977))

(assert (=> b!42401 d!7715))

(declare-fun b!42490 () Bool)

(declare-fun e!26925 () (_ BitVec 32))

(declare-fun call!3330 () (_ BitVec 32))

(assert (=> b!42490 (= e!26925 (bvadd #b00000000000000000000000000000001 call!3330))))

(declare-fun bm!3327 () Bool)

(assert (=> bm!3327 (= call!3330 (arrayCountValidKeys!0 lt!17622 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!42491 () Bool)

(declare-fun e!26924 () (_ BitVec 32))

(assert (=> b!42491 (= e!26924 e!26925)))

(declare-fun c!5356 () Bool)

(assert (=> b!42491 (= c!5356 (validKeyInArray!0 (select (arr!1346 lt!17622) #b00000000000000000000000000000000)))))

(declare-fun b!42493 () Bool)

(assert (=> b!42493 (= e!26924 #b00000000000000000000000000000000)))

(declare-fun d!7721 () Bool)

(declare-fun lt!17692 () (_ BitVec 32))

(assert (=> d!7721 (and (bvsge lt!17692 #b00000000000000000000000000000000) (bvsle lt!17692 (bvsub (size!1519 lt!17622) #b00000000000000000000000000000000)))))

(assert (=> d!7721 (= lt!17692 e!26924)))

(declare-fun c!5355 () Bool)

(assert (=> d!7721 (= c!5355 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7721 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1519 lt!17622)))))

(assert (=> d!7721 (= (arrayCountValidKeys!0 lt!17622 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17692)))

(declare-fun b!42492 () Bool)

(assert (=> b!42492 (= e!26925 call!3330)))

(assert (= (and d!7721 c!5355) b!42493))

(assert (= (and d!7721 (not c!5355)) b!42491))

(assert (= (and b!42491 c!5356) b!42490))

(assert (= (and b!42491 (not c!5356)) b!42492))

(assert (= (or b!42490 b!42492) bm!3327))

(declare-fun m!36091 () Bool)

(assert (=> bm!3327 m!36091))

(assert (=> b!42491 m!36049))

(assert (=> b!42491 m!36049))

(assert (=> b!42491 m!36059))

(assert (=> b!42401 d!7721))

(declare-fun d!7727 () Bool)

(assert (=> d!7727 (= (arrayCountValidKeys!0 lt!17622 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17699 () Unit!1149)

(declare-fun choose!59 (array!2805 (_ BitVec 32) (_ BitVec 32)) Unit!1149)

(assert (=> d!7727 (= lt!17699 (choose!59 lt!17622 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7727 (bvslt (size!1519 lt!17622) #b01111111111111111111111111111111)))

(assert (=> d!7727 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17622 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17699)))

(declare-fun bs!1878 () Bool)

(assert (= bs!1878 d!7727))

(assert (=> bs!1878 m!35983))

(declare-fun m!36093 () Bool)

(assert (=> bs!1878 m!36093))

(assert (=> b!42401 d!7727))

(declare-fun d!7729 () Bool)

(assert (=> d!7729 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6278 d!7729))

(check-sat (not bm!3327) (not d!7703) (not b!42427) (not d!7727) (not d!7697) (not b!42467) (not d!7715) (not bm!3318) (not b!42429) (not b!42469) (not b!42491))
(check-sat)
