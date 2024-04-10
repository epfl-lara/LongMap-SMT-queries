; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6320 () Bool)

(assert start!6320)

(declare-fun b!42608 () Bool)

(declare-fun res!25337 () Bool)

(declare-fun e!26992 () Bool)

(assert (=> b!42608 (=> res!25337 e!26992)))

(declare-datatypes ((List!1147 0))(
  ( (Nil!1144) (Cons!1143 (h!1720 (_ BitVec 64)) (t!4094 List!1147)) )
))
(declare-fun contains!558 (List!1147 (_ BitVec 64)) Bool)

(assert (=> b!42608 (= res!25337 (contains!558 Nil!1144 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!42609 () Bool)

(declare-fun res!25336 () Bool)

(assert (=> b!42609 (=> res!25336 e!26992)))

(assert (=> b!42609 (= res!25336 (contains!558 Nil!1144 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!42610 () Bool)

(declare-fun noDuplicate!36 (List!1147) Bool)

(assert (=> b!42610 (= e!26992 (noDuplicate!36 Nil!1144))))

(declare-fun b!42607 () Bool)

(declare-fun e!26991 () Bool)

(assert (=> b!42607 (= e!26991 (not e!26992))))

(declare-fun res!25335 () Bool)

(assert (=> b!42607 (=> res!25335 e!26992)))

(declare-fun mask!853 () (_ BitVec 32))

(assert (=> b!42607 (= res!25335 (or (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853))))))

(declare-datatypes ((array!2829 0))(
  ( (array!2830 (arr!1358 (Array (_ BitVec 32) (_ BitVec 64))) (size!1534 (_ BitVec 32))) )
))
(declare-fun lt!17776 () array!2829)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2829 (_ BitVec 32)) Bool)

(assert (=> b!42607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17776 mask!853)))

(declare-datatypes ((Unit!1147 0))(
  ( (Unit!1148) )
))
(declare-fun lt!17777 () Unit!1147)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2829 (_ BitVec 32) (_ BitVec 32)) Unit!1147)

(assert (=> b!42607 (= lt!17777 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17776 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2829 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42607 (= (arrayCountValidKeys!0 lt!17776 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17775 () Unit!1147)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2829 (_ BitVec 32) (_ BitVec 32)) Unit!1147)

(assert (=> b!42607 (= lt!17775 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17776 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42607 (= lt!17776 (array!2830 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun res!25338 () Bool)

(assert (=> start!6320 (=> (not res!25338) (not e!26991))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6320 (= res!25338 (validMask!0 mask!853))))

(assert (=> start!6320 e!26991))

(assert (=> start!6320 true))

(assert (= (and start!6320 res!25338) b!42607))

(assert (= (and b!42607 (not res!25335)) b!42608))

(assert (= (and b!42608 (not res!25337)) b!42609))

(assert (= (and b!42609 (not res!25336)) b!42610))

(declare-fun m!36259 () Bool)

(assert (=> b!42610 m!36259))

(declare-fun m!36261 () Bool)

(assert (=> start!6320 m!36261))

(declare-fun m!36263 () Bool)

(assert (=> b!42607 m!36263))

(declare-fun m!36265 () Bool)

(assert (=> b!42607 m!36265))

(declare-fun m!36267 () Bool)

(assert (=> b!42607 m!36267))

(declare-fun m!36269 () Bool)

(assert (=> b!42607 m!36269))

(declare-fun m!36271 () Bool)

(assert (=> b!42608 m!36271))

(declare-fun m!36273 () Bool)

(assert (=> b!42609 m!36273))

(push 1)

(assert (not b!42610))

(assert (not b!42609))

(assert (not b!42608))

(assert (not start!6320))

(assert (not b!42607))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun bm!3352 () Bool)

(declare-fun call!3355 () Bool)

(assert (=> bm!3352 (= call!3355 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!17776 mask!853))))

(declare-fun b!42639 () Bool)

(declare-fun e!27019 () Bool)

(assert (=> b!42639 (= e!27019 call!3355)))

(declare-fun d!7759 () Bool)

(declare-fun res!25359 () Bool)

(declare-fun e!27017 () Bool)

(assert (=> d!7759 (=> res!25359 e!27017)))

(assert (=> d!7759 (= res!25359 (bvsge #b00000000000000000000000000000000 (size!1534 lt!17776)))))

(assert (=> d!7759 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17776 mask!853) e!27017)))

(declare-fun b!42640 () Bool)

(declare-fun e!27018 () Bool)

(assert (=> b!42640 (= e!27018 call!3355)))

(declare-fun b!42641 () Bool)

(assert (=> b!42641 (= e!27017 e!27018)))

(declare-fun c!5389 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!42641 (= c!5389 (validKeyInArray!0 (select (arr!1358 lt!17776) #b00000000000000000000000000000000)))))

(declare-fun b!42642 () Bool)

(assert (=> b!42642 (= e!27018 e!27019)))

(declare-fun lt!17798 () (_ BitVec 64))

(assert (=> b!42642 (= lt!17798 (select (arr!1358 lt!17776) #b00000000000000000000000000000000))))

(declare-fun lt!17797 () Unit!1147)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2829 (_ BitVec 64) (_ BitVec 32)) Unit!1147)

(assert (=> b!42642 (= lt!17797 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!17776 lt!17798 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2829 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!42642 (arrayContainsKey!0 lt!17776 lt!17798 #b00000000000000000000000000000000)))

(declare-fun lt!17796 () Unit!1147)

(assert (=> b!42642 (= lt!17796 lt!17797)))

(declare-fun res!25360 () Bool)

(declare-datatypes ((SeekEntryResult!192 0))(
  ( (MissingZero!192 (index!2890 (_ BitVec 32))) (Found!192 (index!2891 (_ BitVec 32))) (Intermediate!192 (undefined!1004 Bool) (index!2892 (_ BitVec 32)) (x!8133 (_ BitVec 32))) (Undefined!192) (MissingVacant!192 (index!2893 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2829 (_ BitVec 32)) SeekEntryResult!192)

(assert (=> b!42642 (= res!25360 (= (seekEntryOrOpen!0 (select (arr!1358 lt!17776) #b00000000000000000000000000000000) lt!17776 mask!853) (Found!192 #b00000000000000000000000000000000)))))

(assert (=> b!42642 (=> (not res!25360) (not e!27019))))

(assert (= (and d!7759 (not res!25359)) b!42641))

(assert (= (and b!42641 c!5389) b!42642))

(assert (= (and b!42641 (not c!5389)) b!42640))

(assert (= (and b!42642 res!25360) b!42639))

(assert (= (or b!42639 b!42640) bm!3352))

(declare-fun m!36287 () Bool)

(assert (=> bm!3352 m!36287))

(declare-fun m!36289 () Bool)

(assert (=> b!42641 m!36289))

(assert (=> b!42641 m!36289))

(declare-fun m!36291 () Bool)

(assert (=> b!42641 m!36291))

(assert (=> b!42642 m!36289))

(declare-fun m!36293 () Bool)

(assert (=> b!42642 m!36293))

(declare-fun m!36295 () Bool)

(assert (=> b!42642 m!36295))

(assert (=> b!42642 m!36289))

(declare-fun m!36297 () Bool)

(assert (=> b!42642 m!36297))

(assert (=> b!42607 d!7759))

(declare-fun d!7767 () Bool)

(assert (=> d!7767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17776 mask!853)))

(declare-fun lt!17804 () Unit!1147)

(declare-fun choose!34 (array!2829 (_ BitVec 32) (_ BitVec 32)) Unit!1147)

(assert (=> d!7767 (= lt!17804 (choose!34 lt!17776 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!7767 (validMask!0 mask!853)))

(assert (=> d!7767 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17776 mask!853 #b00000000000000000000000000000000) lt!17804)))

(declare-fun bs!1884 () Bool)

(assert (= bs!1884 d!7767))

(assert (=> bs!1884 m!36263))

(declare-fun m!36311 () Bool)

(assert (=> bs!1884 m!36311))

(assert (=> bs!1884 m!36261))

(assert (=> b!42607 d!7767))

(declare-fun bm!3361 () Bool)

(declare-fun call!3364 () (_ BitVec 32))

(assert (=> bm!3361 (= call!3364 (arrayCountValidKeys!0 lt!17776 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!42675 () Bool)

(declare-fun e!27040 () (_ BitVec 32))

(assert (=> b!42675 (= e!27040 call!3364)))

(declare-fun b!42676 () Bool)

(assert (=> b!42676 (= e!27040 (bvadd #b00000000000000000000000000000001 call!3364))))

(declare-fun b!42677 () Bool)

(declare-fun e!27041 () (_ BitVec 32))

(assert (=> b!42677 (= e!27041 e!27040)))

(declare-fun c!5402 () Bool)

(assert (=> b!42677 (= c!5402 (validKeyInArray!0 (select (arr!1358 lt!17776) #b00000000000000000000000000000000)))))

(declare-fun b!42678 () Bool)

(assert (=> b!42678 (= e!27041 #b00000000000000000000000000000000)))

(declare-fun d!7771 () Bool)

(declare-fun lt!17821 () (_ BitVec 32))

(assert (=> d!7771 (and (bvsge lt!17821 #b00000000000000000000000000000000) (bvsle lt!17821 (bvsub (size!1534 lt!17776) #b00000000000000000000000000000000)))))

(assert (=> d!7771 (= lt!17821 e!27041)))

(declare-fun c!5403 () Bool)

(assert (=> d!7771 (= c!5403 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7771 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1534 lt!17776)))))

(assert (=> d!7771 (= (arrayCountValidKeys!0 lt!17776 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17821)))

(assert (= (and d!7771 c!5403) b!42678))

(assert (= (and d!7771 (not c!5403)) b!42677))

(assert (= (and b!42677 c!5402) b!42676))

(assert (= (and b!42677 (not c!5402)) b!42675))

(assert (= (or b!42676 b!42675) bm!3361))

(declare-fun m!36327 () Bool)

(assert (=> bm!3361 m!36327))

(assert (=> b!42677 m!36289))

(assert (=> b!42677 m!36289))

(assert (=> b!42677 m!36291))

(assert (=> b!42607 d!7771))

(declare-fun d!7777 () Bool)

(assert (=> d!7777 (= (arrayCountValidKeys!0 lt!17776 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17827 () Unit!1147)

(declare-fun choose!59 (array!2829 (_ BitVec 32) (_ BitVec 32)) Unit!1147)

(assert (=> d!7777 (= lt!17827 (choose!59 lt!17776 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7777 (bvslt (size!1534 lt!17776) #b01111111111111111111111111111111)))

(assert (=> d!7777 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17776 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17827)))

(declare-fun bs!1886 () Bool)

(assert (= bs!1886 d!7777))

(assert (=> bs!1886 m!36267))

(declare-fun m!36331 () Bool)

(assert (=> bs!1886 m!36331))

(assert (=> b!42607 d!7777))

(declare-fun d!7781 () Bool)

(declare-fun res!25377 () Bool)

(declare-fun e!27052 () Bool)

(assert (=> d!7781 (=> res!25377 e!27052)))

(assert (=> d!7781 (= res!25377 (is-Nil!1144 Nil!1144))))

(assert (=> d!7781 (= (noDuplicate!36 Nil!1144) e!27052)))

(declare-fun b!42691 () Bool)

(declare-fun e!27053 () Bool)

(assert (=> b!42691 (= e!27052 e!27053)))

(declare-fun res!25378 () Bool)

(assert (=> b!42691 (=> (not res!25378) (not e!27053))))

(assert (=> b!42691 (= res!25378 (not (contains!558 (t!4094 Nil!1144) (h!1720 Nil!1144))))))

(declare-fun b!42692 () Bool)

(assert (=> b!42692 (= e!27053 (noDuplicate!36 (t!4094 Nil!1144)))))

(assert (= (and d!7781 (not res!25377)) b!42691))

(assert (= (and b!42691 res!25378) b!42692))

(declare-fun m!36337 () Bool)

(assert (=> b!42691 m!36337))

(declare-fun m!36339 () Bool)

(assert (=> b!42692 m!36339))

(assert (=> b!42610 d!7781))

(declare-fun d!7787 () Bool)

(declare-fun lt!17837 () Bool)

(declare-fun content!38 (List!1147) (Set (_ BitVec 64)))

(assert (=> d!7787 (= lt!17837 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!38 Nil!1144)))))

(declare-fun e!27066 () Bool)

(assert (=> d!7787 (= lt!17837 e!27066)))

(declare-fun res!25387 () Bool)

(assert (=> d!7787 (=> (not res!25387) (not e!27066))))

(assert (=> d!7787 (= res!25387 (is-Cons!1143 Nil!1144))))

(assert (=> d!7787 (= (contains!558 Nil!1144 #b1000000000000000000000000000000000000000000000000000000000000000) lt!17837)))

(declare-fun b!42709 () Bool)

(declare-fun e!27067 () Bool)

(assert (=> b!42709 (= e!27066 e!27067)))

(declare-fun res!25388 () Bool)

(assert (=> b!42709 (=> res!25388 e!27067)))

(assert (=> b!42709 (= res!25388 (= (h!1720 Nil!1144) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!42710 () Bool)

(assert (=> b!42710 (= e!27067 (contains!558 (t!4094 Nil!1144) #b1000000000000000000000000000000000000000000000000000000000000000))))

