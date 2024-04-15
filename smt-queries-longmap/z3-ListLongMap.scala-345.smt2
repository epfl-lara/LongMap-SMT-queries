; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6310 () Bool)

(assert start!6310)

(declare-fun b!42504 () Bool)

(declare-fun res!25287 () Bool)

(declare-fun e!26926 () Bool)

(assert (=> b!42504 (=> res!25287 e!26926)))

(declare-datatypes ((List!1138 0))(
  ( (Nil!1135) (Cons!1134 (h!1711 (_ BitVec 64)) (t!4084 List!1138)) )
))
(declare-fun contains!554 (List!1138 (_ BitVec 64)) Bool)

(assert (=> b!42504 (= res!25287 (contains!554 Nil!1135 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!25286 () Bool)

(declare-fun e!26927 () Bool)

(assert (=> start!6310 (=> (not res!25286) (not e!26927))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6310 (= res!25286 (validMask!0 mask!853))))

(assert (=> start!6310 e!26927))

(assert (=> start!6310 true))

(declare-fun b!42503 () Bool)

(assert (=> b!42503 (= e!26927 (not e!26926))))

(declare-fun res!25288 () Bool)

(assert (=> b!42503 (=> res!25288 e!26926)))

(assert (=> b!42503 (= res!25288 (or (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853))))))

(declare-datatypes ((array!2799 0))(
  ( (array!2800 (arr!1343 (Array (_ BitVec 32) (_ BitVec 64))) (size!1519 (_ BitVec 32))) )
))
(declare-fun lt!17741 () array!2799)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2799 (_ BitVec 32)) Bool)

(assert (=> b!42503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17741 mask!853)))

(declare-datatypes ((Unit!1150 0))(
  ( (Unit!1151) )
))
(declare-fun lt!17739 () Unit!1150)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2799 (_ BitVec 32) (_ BitVec 32)) Unit!1150)

(assert (=> b!42503 (= lt!17739 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17741 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2799 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42503 (= (arrayCountValidKeys!0 lt!17741 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17740 () Unit!1150)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2799 (_ BitVec 32) (_ BitVec 32)) Unit!1150)

(assert (=> b!42503 (= lt!17740 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17741 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42503 (= lt!17741 (array!2800 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!42506 () Bool)

(declare-fun noDuplicate!32 (List!1138) Bool)

(assert (=> b!42506 (= e!26926 (noDuplicate!32 Nil!1135))))

(declare-fun b!42505 () Bool)

(declare-fun res!25285 () Bool)

(assert (=> b!42505 (=> res!25285 e!26926)))

(assert (=> b!42505 (= res!25285 (contains!554 Nil!1135 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!6310 res!25286) b!42503))

(assert (= (and b!42503 (not res!25288)) b!42504))

(assert (= (and b!42504 (not res!25287)) b!42505))

(assert (= (and b!42505 (not res!25285)) b!42506))

(declare-fun m!36131 () Bool)

(assert (=> b!42503 m!36131))

(declare-fun m!36133 () Bool)

(assert (=> b!42503 m!36133))

(declare-fun m!36135 () Bool)

(assert (=> b!42503 m!36135))

(declare-fun m!36137 () Bool)

(assert (=> b!42503 m!36137))

(declare-fun m!36139 () Bool)

(assert (=> b!42505 m!36139))

(declare-fun m!36141 () Bool)

(assert (=> start!6310 m!36141))

(declare-fun m!36143 () Bool)

(assert (=> b!42504 m!36143))

(declare-fun m!36145 () Bool)

(assert (=> b!42506 m!36145))

(check-sat (not b!42503) (not b!42506) (not b!42504) (not start!6310) (not b!42505))
(check-sat)
(get-model)

(declare-fun d!7715 () Bool)

(declare-fun lt!17762 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!37 (List!1138) (InoxSet (_ BitVec 64)))

(assert (=> d!7715 (= lt!17762 (select (content!37 Nil!1135) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!26945 () Bool)

(assert (=> d!7715 (= lt!17762 e!26945)))

(declare-fun res!25318 () Bool)

(assert (=> d!7715 (=> (not res!25318) (not e!26945))))

(get-info :version)

(assert (=> d!7715 (= res!25318 ((_ is Cons!1134) Nil!1135))))

(assert (=> d!7715 (= (contains!554 Nil!1135 #b1000000000000000000000000000000000000000000000000000000000000000) lt!17762)))

(declare-fun b!42535 () Bool)

(declare-fun e!26944 () Bool)

(assert (=> b!42535 (= e!26945 e!26944)))

(declare-fun res!25317 () Bool)

(assert (=> b!42535 (=> res!25317 e!26944)))

(assert (=> b!42535 (= res!25317 (= (h!1711 Nil!1135) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!42536 () Bool)

(assert (=> b!42536 (= e!26944 (contains!554 (t!4084 Nil!1135) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!7715 res!25318) b!42535))

(assert (= (and b!42535 (not res!25317)) b!42536))

(declare-fun m!36179 () Bool)

(assert (=> d!7715 m!36179))

(declare-fun m!36181 () Bool)

(assert (=> d!7715 m!36181))

(declare-fun m!36183 () Bool)

(assert (=> b!42536 m!36183))

(assert (=> b!42505 d!7715))

(declare-fun d!7721 () Bool)

(declare-fun lt!17763 () Bool)

(assert (=> d!7721 (= lt!17763 (select (content!37 Nil!1135) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!26947 () Bool)

(assert (=> d!7721 (= lt!17763 e!26947)))

(declare-fun res!25320 () Bool)

(assert (=> d!7721 (=> (not res!25320) (not e!26947))))

(assert (=> d!7721 (= res!25320 ((_ is Cons!1134) Nil!1135))))

(assert (=> d!7721 (= (contains!554 Nil!1135 #b0000000000000000000000000000000000000000000000000000000000000000) lt!17763)))

(declare-fun b!42537 () Bool)

(declare-fun e!26946 () Bool)

(assert (=> b!42537 (= e!26947 e!26946)))

(declare-fun res!25319 () Bool)

(assert (=> b!42537 (=> res!25319 e!26946)))

(assert (=> b!42537 (= res!25319 (= (h!1711 Nil!1135) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!42538 () Bool)

(assert (=> b!42538 (= e!26946 (contains!554 (t!4084 Nil!1135) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!7721 res!25320) b!42537))

(assert (= (and b!42537 (not res!25319)) b!42538))

(assert (=> d!7721 m!36179))

(declare-fun m!36185 () Bool)

(assert (=> d!7721 m!36185))

(declare-fun m!36187 () Bool)

(assert (=> b!42538 m!36187))

(assert (=> b!42504 d!7721))

(declare-fun d!7723 () Bool)

(assert (=> d!7723 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6310 d!7723))

(declare-fun b!42585 () Bool)

(declare-fun e!26983 () Bool)

(declare-fun e!26981 () Bool)

(assert (=> b!42585 (= e!26983 e!26981)))

(declare-fun c!5371 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!42585 (= c!5371 (validKeyInArray!0 (select (arr!1343 lt!17741) #b00000000000000000000000000000000)))))

(declare-fun b!42586 () Bool)

(declare-fun call!3358 () Bool)

(assert (=> b!42586 (= e!26981 call!3358)))

(declare-fun b!42587 () Bool)

(declare-fun e!26982 () Bool)

(assert (=> b!42587 (= e!26982 call!3358)))

(declare-fun b!42588 () Bool)

(assert (=> b!42588 (= e!26981 e!26982)))

(declare-fun lt!17794 () (_ BitVec 64))

(assert (=> b!42588 (= lt!17794 (select (arr!1343 lt!17741) #b00000000000000000000000000000000))))

(declare-fun lt!17796 () Unit!1150)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2799 (_ BitVec 64) (_ BitVec 32)) Unit!1150)

(assert (=> b!42588 (= lt!17796 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!17741 lt!17794 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2799 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!42588 (arrayContainsKey!0 lt!17741 lt!17794 #b00000000000000000000000000000000)))

(declare-fun lt!17795 () Unit!1150)

(assert (=> b!42588 (= lt!17795 lt!17796)))

(declare-fun res!25342 () Bool)

(declare-datatypes ((SeekEntryResult!194 0))(
  ( (MissingZero!194 (index!2898 (_ BitVec 32))) (Found!194 (index!2899 (_ BitVec 32))) (Intermediate!194 (undefined!1006 Bool) (index!2900 (_ BitVec 32)) (x!8134 (_ BitVec 32))) (Undefined!194) (MissingVacant!194 (index!2901 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2799 (_ BitVec 32)) SeekEntryResult!194)

(assert (=> b!42588 (= res!25342 (= (seekEntryOrOpen!0 (select (arr!1343 lt!17741) #b00000000000000000000000000000000) lt!17741 mask!853) (Found!194 #b00000000000000000000000000000000)))))

(assert (=> b!42588 (=> (not res!25342) (not e!26982))))

(declare-fun d!7729 () Bool)

(declare-fun res!25341 () Bool)

(assert (=> d!7729 (=> res!25341 e!26983)))

(assert (=> d!7729 (= res!25341 (bvsge #b00000000000000000000000000000000 (size!1519 lt!17741)))))

(assert (=> d!7729 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17741 mask!853) e!26983)))

(declare-fun bm!3355 () Bool)

(assert (=> bm!3355 (= call!3358 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!17741 mask!853))))

(assert (= (and d!7729 (not res!25341)) b!42585))

(assert (= (and b!42585 c!5371) b!42588))

(assert (= (and b!42585 (not c!5371)) b!42586))

(assert (= (and b!42588 res!25342) b!42587))

(assert (= (or b!42587 b!42586) bm!3355))

(declare-fun m!36211 () Bool)

(assert (=> b!42585 m!36211))

(assert (=> b!42585 m!36211))

(declare-fun m!36213 () Bool)

(assert (=> b!42585 m!36213))

(assert (=> b!42588 m!36211))

(declare-fun m!36215 () Bool)

(assert (=> b!42588 m!36215))

(declare-fun m!36217 () Bool)

(assert (=> b!42588 m!36217))

(assert (=> b!42588 m!36211))

(declare-fun m!36219 () Bool)

(assert (=> b!42588 m!36219))

(declare-fun m!36221 () Bool)

(assert (=> bm!3355 m!36221))

(assert (=> b!42503 d!7729))

(declare-fun d!7737 () Bool)

(assert (=> d!7737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17741 mask!853)))

(declare-fun lt!17805 () Unit!1150)

(declare-fun choose!34 (array!2799 (_ BitVec 32) (_ BitVec 32)) Unit!1150)

(assert (=> d!7737 (= lt!17805 (choose!34 lt!17741 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!7737 (validMask!0 mask!853)))

(assert (=> d!7737 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17741 mask!853 #b00000000000000000000000000000000) lt!17805)))

(declare-fun bs!1884 () Bool)

(assert (= bs!1884 d!7737))

(assert (=> bs!1884 m!36131))

(declare-fun m!36241 () Bool)

(assert (=> bs!1884 m!36241))

(assert (=> bs!1884 m!36141))

(assert (=> b!42503 d!7737))

(declare-fun b!42623 () Bool)

(declare-fun e!27010 () (_ BitVec 32))

(declare-fun call!3364 () (_ BitVec 32))

(assert (=> b!42623 (= e!27010 (bvadd #b00000000000000000000000000000001 call!3364))))

(declare-fun b!42624 () Bool)

(assert (=> b!42624 (= e!27010 call!3364)))

(declare-fun bm!3361 () Bool)

(assert (=> bm!3361 (= call!3364 (arrayCountValidKeys!0 lt!17741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!42625 () Bool)

(declare-fun e!27009 () (_ BitVec 32))

(assert (=> b!42625 (= e!27009 #b00000000000000000000000000000000)))

(declare-fun b!42626 () Bool)

(assert (=> b!42626 (= e!27009 e!27010)))

(declare-fun c!5382 () Bool)

(assert (=> b!42626 (= c!5382 (validKeyInArray!0 (select (arr!1343 lt!17741) #b00000000000000000000000000000000)))))

(declare-fun d!7745 () Bool)

(declare-fun lt!17817 () (_ BitVec 32))

(assert (=> d!7745 (and (bvsge lt!17817 #b00000000000000000000000000000000) (bvsle lt!17817 (bvsub (size!1519 lt!17741) #b00000000000000000000000000000000)))))

(assert (=> d!7745 (= lt!17817 e!27009)))

(declare-fun c!5381 () Bool)

(assert (=> d!7745 (= c!5381 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7745 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1519 lt!17741)))))

(assert (=> d!7745 (= (arrayCountValidKeys!0 lt!17741 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17817)))

(assert (= (and d!7745 c!5381) b!42625))

(assert (= (and d!7745 (not c!5381)) b!42626))

(assert (= (and b!42626 c!5382) b!42623))

(assert (= (and b!42626 (not c!5382)) b!42624))

(assert (= (or b!42623 b!42624) bm!3361))

(declare-fun m!36255 () Bool)

(assert (=> bm!3361 m!36255))

(assert (=> b!42626 m!36211))

(assert (=> b!42626 m!36211))

(assert (=> b!42626 m!36213))

(assert (=> b!42503 d!7745))

(declare-fun d!7753 () Bool)

(assert (=> d!7753 (= (arrayCountValidKeys!0 lt!17741 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17821 () Unit!1150)

(declare-fun choose!59 (array!2799 (_ BitVec 32) (_ BitVec 32)) Unit!1150)

(assert (=> d!7753 (= lt!17821 (choose!59 lt!17741 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7753 (bvslt (size!1519 lt!17741) #b01111111111111111111111111111111)))

(assert (=> d!7753 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17741 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17821)))

(declare-fun bs!1886 () Bool)

(assert (= bs!1886 d!7753))

(assert (=> bs!1886 m!36135))

(declare-fun m!36259 () Bool)

(assert (=> bs!1886 m!36259))

(assert (=> b!42503 d!7753))

(declare-fun d!7757 () Bool)

(declare-fun res!25363 () Bool)

(declare-fun e!27017 () Bool)

(assert (=> d!7757 (=> res!25363 e!27017)))

(assert (=> d!7757 (= res!25363 ((_ is Nil!1135) Nil!1135))))

(assert (=> d!7757 (= (noDuplicate!32 Nil!1135) e!27017)))

(declare-fun b!42635 () Bool)

(declare-fun e!27018 () Bool)

(assert (=> b!42635 (= e!27017 e!27018)))

(declare-fun res!25364 () Bool)

(assert (=> b!42635 (=> (not res!25364) (not e!27018))))

(assert (=> b!42635 (= res!25364 (not (contains!554 (t!4084 Nil!1135) (h!1711 Nil!1135))))))

(declare-fun b!42636 () Bool)

(assert (=> b!42636 (= e!27018 (noDuplicate!32 (t!4084 Nil!1135)))))

(assert (= (and d!7757 (not res!25363)) b!42635))

(assert (= (and b!42635 res!25364) b!42636))

(declare-fun m!36263 () Bool)

(assert (=> b!42635 m!36263))

(declare-fun m!36265 () Bool)

(assert (=> b!42636 m!36265))

(assert (=> b!42506 d!7757))

(check-sat (not b!42626) (not b!42585) (not b!42538) (not d!7721) (not d!7715) (not bm!3361) (not b!42636) (not b!42536) (not b!42635) (not b!42588) (not d!7753) (not d!7737) (not bm!3355))
(check-sat)
