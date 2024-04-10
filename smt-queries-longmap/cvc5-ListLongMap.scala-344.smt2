; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6274 () Bool)

(assert start!6274)

(declare-fun res!25240 () Bool)

(declare-fun e!26887 () Bool)

(assert (=> start!6274 (=> (not res!25240) (not e!26887))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6274 (= res!25240 (validMask!0 mask!853))))

(assert (=> start!6274 e!26887))

(assert (=> start!6274 true))

(declare-fun b!42458 () Bool)

(declare-fun e!26885 () Bool)

(assert (=> b!42458 (= e!26887 (not e!26885))))

(declare-fun res!25242 () Bool)

(assert (=> b!42458 (=> res!25242 e!26885)))

(assert (=> b!42458 (= res!25242 (or (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853))))))

(declare-datatypes ((array!2819 0))(
  ( (array!2820 (arr!1353 (Array (_ BitVec 32) (_ BitVec 64))) (size!1526 (_ BitVec 32))) )
))
(declare-fun lt!17665 () array!2819)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2819 (_ BitVec 32)) Bool)

(assert (=> b!42458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17665 mask!853)))

(declare-datatypes ((Unit!1137 0))(
  ( (Unit!1138) )
))
(declare-fun lt!17664 () Unit!1137)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2819 (_ BitVec 32) (_ BitVec 32)) Unit!1137)

(assert (=> b!42458 (= lt!17664 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17665 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2819 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42458 (= (arrayCountValidKeys!0 lt!17665 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17666 () Unit!1137)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2819 (_ BitVec 32) (_ BitVec 32)) Unit!1137)

(assert (=> b!42458 (= lt!17666 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17665 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42458 (= lt!17665 (array!2820 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!42459 () Bool)

(declare-fun e!26886 () Bool)

(assert (=> b!42459 (= e!26885 e!26886)))

(declare-fun res!25241 () Bool)

(assert (=> b!42459 (=> (not res!25241) (not e!26886))))

(declare-datatypes ((List!1142 0))(
  ( (Nil!1139) (Cons!1138 (h!1715 (_ BitVec 64)) (t!4089 List!1142)) )
))
(declare-fun contains!553 (List!1142 (_ BitVec 64)) Bool)

(assert (=> b!42459 (= res!25241 (not (contains!553 Nil!1139 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!42460 () Bool)

(assert (=> b!42460 (= e!26886 (not (contains!553 Nil!1139 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!6274 res!25240) b!42458))

(assert (= (and b!42458 (not res!25242)) b!42459))

(assert (= (and b!42459 res!25241) b!42460))

(declare-fun m!36101 () Bool)

(assert (=> start!6274 m!36101))

(declare-fun m!36103 () Bool)

(assert (=> b!42458 m!36103))

(declare-fun m!36105 () Bool)

(assert (=> b!42458 m!36105))

(declare-fun m!36107 () Bool)

(assert (=> b!42458 m!36107))

(declare-fun m!36109 () Bool)

(assert (=> b!42458 m!36109))

(declare-fun m!36111 () Bool)

(assert (=> b!42459 m!36111))

(declare-fun m!36113 () Bool)

(assert (=> b!42460 m!36113))

(push 1)

(assert (not b!42460))

(assert (not b!42459))

(assert (not b!42458))

(assert (not start!6274))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!7713 () Bool)

(declare-fun lt!17691 () Bool)

(declare-fun content!33 (List!1142) (Set (_ BitVec 64)))

(assert (=> d!7713 (= lt!17691 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!33 Nil!1139)))))

(declare-fun e!26918 () Bool)

(assert (=> d!7713 (= lt!17691 e!26918)))

(declare-fun res!25273 () Bool)

(assert (=> d!7713 (=> (not res!25273) (not e!26918))))

(assert (=> d!7713 (= res!25273 (is-Cons!1138 Nil!1139))))

(assert (=> d!7713 (= (contains!553 Nil!1139 #b1000000000000000000000000000000000000000000000000000000000000000) lt!17691)))

(declare-fun b!42491 () Bool)

(declare-fun e!26919 () Bool)

(assert (=> b!42491 (= e!26918 e!26919)))

(declare-fun res!25274 () Bool)

(assert (=> b!42491 (=> res!25274 e!26919)))

(assert (=> b!42491 (= res!25274 (= (h!1715 Nil!1139) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!42492 () Bool)

(assert (=> b!42492 (= e!26919 (contains!553 (t!4089 Nil!1139) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!7713 res!25273) b!42491))

(assert (= (and b!42491 (not res!25274)) b!42492))

(declare-fun m!36153 () Bool)

(assert (=> d!7713 m!36153))

(declare-fun m!36155 () Bool)

(assert (=> d!7713 m!36155))

(declare-fun m!36157 () Bool)

(assert (=> b!42492 m!36157))

(assert (=> b!42460 d!7713))

(declare-fun d!7721 () Bool)

(declare-fun lt!17692 () Bool)

(assert (=> d!7721 (= lt!17692 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!33 Nil!1139)))))

(declare-fun e!26920 () Bool)

(assert (=> d!7721 (= lt!17692 e!26920)))

(declare-fun res!25275 () Bool)

(assert (=> d!7721 (=> (not res!25275) (not e!26920))))

(assert (=> d!7721 (= res!25275 (is-Cons!1138 Nil!1139))))

(assert (=> d!7721 (= (contains!553 Nil!1139 #b0000000000000000000000000000000000000000000000000000000000000000) lt!17692)))

(declare-fun b!42493 () Bool)

(declare-fun e!26921 () Bool)

(assert (=> b!42493 (= e!26920 e!26921)))

(declare-fun res!25276 () Bool)

(assert (=> b!42493 (=> res!25276 e!26921)))

(assert (=> b!42493 (= res!25276 (= (h!1715 Nil!1139) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!42494 () Bool)

(assert (=> b!42494 (= e!26921 (contains!553 (t!4089 Nil!1139) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!7721 res!25275) b!42493))

(assert (= (and b!42493 (not res!25276)) b!42494))

(assert (=> d!7721 m!36153))

(declare-fun m!36159 () Bool)

(assert (=> d!7721 m!36159))

(declare-fun m!36161 () Bool)

(assert (=> b!42494 m!36161))

(assert (=> b!42459 d!7721))

(declare-fun d!7723 () Bool)

(declare-fun res!25293 () Bool)

(declare-fun e!26943 () Bool)

(assert (=> d!7723 (=> res!25293 e!26943)))

(assert (=> d!7723 (= res!25293 (bvsge #b00000000000000000000000000000000 (size!1526 lt!17665)))))

(assert (=> d!7723 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17665 mask!853) e!26943)))

(declare-fun b!42519 () Bool)

(declare-fun e!26944 () Bool)

(assert (=> b!42519 (= e!26943 e!26944)))

(declare-fun c!5362 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!42519 (= c!5362 (validKeyInArray!0 (select (arr!1353 lt!17665) #b00000000000000000000000000000000)))))

(declare-fun b!42520 () Bool)

(declare-fun e!26942 () Bool)

(declare-fun call!3337 () Bool)

(assert (=> b!42520 (= e!26942 call!3337)))

(declare-fun bm!3334 () Bool)

(assert (=> bm!3334 (= call!3337 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!17665 mask!853))))

(declare-fun b!42521 () Bool)

(assert (=> b!42521 (= e!26944 call!3337)))

(declare-fun b!42522 () Bool)

(assert (=> b!42522 (= e!26944 e!26942)))

(declare-fun lt!17709 () (_ BitVec 64))

(assert (=> b!42522 (= lt!17709 (select (arr!1353 lt!17665) #b00000000000000000000000000000000))))

(declare-fun lt!17711 () Unit!1137)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2819 (_ BitVec 64) (_ BitVec 32)) Unit!1137)

(assert (=> b!42522 (= lt!17711 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!17665 lt!17709 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2819 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!42522 (arrayContainsKey!0 lt!17665 lt!17709 #b00000000000000000000000000000000)))

(declare-fun lt!17710 () Unit!1137)

(assert (=> b!42522 (= lt!17710 lt!17711)))

(declare-fun res!25294 () Bool)

(declare-datatypes ((SeekEntryResult!187 0))(
  ( (MissingZero!187 (index!2870 (_ BitVec 32))) (Found!187 (index!2871 (_ BitVec 32))) (Intermediate!187 (undefined!999 Bool) (index!2872 (_ BitVec 32)) (x!8120 (_ BitVec 32))) (Undefined!187) (MissingVacant!187 (index!2873 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2819 (_ BitVec 32)) SeekEntryResult!187)

(assert (=> b!42522 (= res!25294 (= (seekEntryOrOpen!0 (select (arr!1353 lt!17665) #b00000000000000000000000000000000) lt!17665 mask!853) (Found!187 #b00000000000000000000000000000000)))))

(assert (=> b!42522 (=> (not res!25294) (not e!26942))))

(assert (= (and d!7723 (not res!25293)) b!42519))

(assert (= (and b!42519 c!5362) b!42522))

(assert (= (and b!42519 (not c!5362)) b!42521))

(assert (= (and b!42522 res!25294) b!42520))

(assert (= (or b!42520 b!42521) bm!3334))

(declare-fun m!36173 () Bool)

(assert (=> b!42519 m!36173))

(assert (=> b!42519 m!36173))

(declare-fun m!36175 () Bool)

(assert (=> b!42519 m!36175))

(declare-fun m!36177 () Bool)

(assert (=> bm!3334 m!36177))

(assert (=> b!42522 m!36173))

(declare-fun m!36179 () Bool)

(assert (=> b!42522 m!36179))

(declare-fun m!36181 () Bool)

(assert (=> b!42522 m!36181))

(assert (=> b!42522 m!36173))

(declare-fun m!36183 () Bool)

(assert (=> b!42522 m!36183))

(assert (=> b!42458 d!7723))

(declare-fun d!7729 () Bool)

(assert (=> d!7729 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17665 mask!853)))

(declare-fun lt!17723 () Unit!1137)

(declare-fun choose!34 (array!2819 (_ BitVec 32) (_ BitVec 32)) Unit!1137)

(assert (=> d!7729 (= lt!17723 (choose!34 lt!17665 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!7729 (validMask!0 mask!853)))

(assert (=> d!7729 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17665 mask!853 #b00000000000000000000000000000000) lt!17723)))

(declare-fun bs!1875 () Bool)

(assert (= bs!1875 d!7729))

(assert (=> bs!1875 m!36103))

(declare-fun m!36197 () Bool)

(assert (=> bs!1875 m!36197))

(assert (=> bs!1875 m!36101))

(assert (=> b!42458 d!7729))

(declare-fun b!42555 () Bool)

(declare-fun e!26966 () (_ BitVec 32))

(declare-fun e!26965 () (_ BitVec 32))

(assert (=> b!42555 (= e!26966 e!26965)))

(declare-fun c!5375 () Bool)

(assert (=> b!42555 (= c!5375 (validKeyInArray!0 (select (arr!1353 lt!17665) #b00000000000000000000000000000000)))))

(declare-fun d!7733 () Bool)

(declare-fun lt!17737 () (_ BitVec 32))

(assert (=> d!7733 (and (bvsge lt!17737 #b00000000000000000000000000000000) (bvsle lt!17737 (bvsub (size!1526 lt!17665) #b00000000000000000000000000000000)))))

(assert (=> d!7733 (= lt!17737 e!26966)))

(declare-fun c!5376 () Bool)

(assert (=> d!7733 (= c!5376 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7733 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1526 lt!17665)))))

(assert (=> d!7733 (= (arrayCountValidKeys!0 lt!17665 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17737)))

(declare-fun b!42556 () Bool)

(declare-fun call!3346 () (_ BitVec 32))

(assert (=> b!42556 (= e!26965 (bvadd #b00000000000000000000000000000001 call!3346))))

(declare-fun bm!3343 () Bool)

(assert (=> bm!3343 (= call!3346 (arrayCountValidKeys!0 lt!17665 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!42557 () Bool)

(assert (=> b!42557 (= e!26966 #b00000000000000000000000000000000)))

(declare-fun b!42558 () Bool)

(assert (=> b!42558 (= e!26965 call!3346)))

(assert (= (and d!7733 c!5376) b!42557))

(assert (= (and d!7733 (not c!5376)) b!42555))

(assert (= (and b!42555 c!5375) b!42556))

(assert (= (and b!42555 (not c!5375)) b!42558))

(assert (= (or b!42556 b!42558) bm!3343))

(assert (=> b!42555 m!36173))

(assert (=> b!42555 m!36173))

(assert (=> b!42555 m!36175))

(declare-fun m!36215 () Bool)

(assert (=> bm!3343 m!36215))

(assert (=> b!42458 d!7733))

(declare-fun d!7741 () Bool)

(assert (=> d!7741 (= (arrayCountValidKeys!0 lt!17665 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17743 () Unit!1137)

(declare-fun choose!59 (array!2819 (_ BitVec 32) (_ BitVec 32)) Unit!1137)

(assert (=> d!7741 (= lt!17743 (choose!59 lt!17665 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7741 (bvslt (size!1526 lt!17665) #b01111111111111111111111111111111)))

(assert (=> d!7741 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17665 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17743)))

(declare-fun bs!1878 () Bool)

(assert (= bs!1878 d!7741))

(assert (=> bs!1878 m!36107))

(declare-fun m!36219 () Bool)

(assert (=> bs!1878 m!36219))

(assert (=> b!42458 d!7741))

(declare-fun d!7745 () Bool)

(assert (=> d!7745 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6274 d!7745))

(push 1)

