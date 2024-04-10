; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6200 () Bool)

(assert start!6200)

(declare-fun res!25179 () Bool)

(declare-fun e!26770 () Bool)

(assert (=> start!6200 (=> (not res!25179) (not e!26770))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6200 (= res!25179 (validMask!0 mask!853))))

(assert (=> start!6200 e!26770))

(assert (=> start!6200 true))

(declare-fun b!42289 () Bool)

(assert (=> b!42289 (= e!26770 (not (bvslt (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111)))))

(declare-datatypes ((array!2805 0))(
  ( (array!2806 (arr!1346 (Array (_ BitVec 32) (_ BitVec 64))) (size!1513 (_ BitVec 32))) )
))
(declare-fun lt!17494 () array!2805)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2805 (_ BitVec 32)) Bool)

(assert (=> b!42289 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17494 mask!853)))

(declare-datatypes ((Unit!1123 0))(
  ( (Unit!1124) )
))
(declare-fun lt!17495 () Unit!1123)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2805 (_ BitVec 32) (_ BitVec 32)) Unit!1123)

(assert (=> b!42289 (= lt!17495 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17494 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2805 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42289 (= (arrayCountValidKeys!0 lt!17494 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17493 () Unit!1123)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2805 (_ BitVec 32) (_ BitVec 32)) Unit!1123)

(assert (=> b!42289 (= lt!17493 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17494 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42289 (= lt!17494 (array!2806 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!6200 res!25179) b!42289))

(declare-fun m!35923 () Bool)

(assert (=> start!6200 m!35923))

(declare-fun m!35925 () Bool)

(assert (=> b!42289 m!35925))

(declare-fun m!35927 () Bool)

(assert (=> b!42289 m!35927))

(declare-fun m!35929 () Bool)

(assert (=> b!42289 m!35929))

(declare-fun m!35931 () Bool)

(assert (=> b!42289 m!35931))

(push 1)

(assert (not start!6200))

(assert (not b!42289))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!7647 () Bool)

(assert (=> d!7647 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6200 d!7647))

(declare-fun b!42310 () Bool)

(declare-fun e!26788 () Bool)

(declare-fun call!3302 () Bool)

(assert (=> b!42310 (= e!26788 call!3302)))

(declare-fun bm!3299 () Bool)

(assert (=> bm!3299 (= call!3302 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!17494 mask!853))))

(declare-fun b!42311 () Bool)

(declare-fun e!26787 () Bool)

(assert (=> b!42311 (= e!26788 e!26787)))

(declare-fun lt!17512 () (_ BitVec 64))

(assert (=> b!42311 (= lt!17512 (select (arr!1346 lt!17494) #b00000000000000000000000000000000))))

(declare-fun lt!17511 () Unit!1123)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2805 (_ BitVec 64) (_ BitVec 32)) Unit!1123)

(assert (=> b!42311 (= lt!17511 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!17494 lt!17512 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2805 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!42311 (arrayContainsKey!0 lt!17494 lt!17512 #b00000000000000000000000000000000)))

(declare-fun lt!17513 () Unit!1123)

(assert (=> b!42311 (= lt!17513 lt!17511)))

(declare-fun res!25191 () Bool)

(declare-datatypes ((SeekEntryResult!182 0))(
  ( (MissingZero!182 (index!2850 (_ BitVec 32))) (Found!182 (index!2851 (_ BitVec 32))) (Intermediate!182 (undefined!994 Bool) (index!2852 (_ BitVec 32)) (x!8091 (_ BitVec 32))) (Undefined!182) (MissingVacant!182 (index!2853 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2805 (_ BitVec 32)) SeekEntryResult!182)

(assert (=> b!42311 (= res!25191 (= (seekEntryOrOpen!0 (select (arr!1346 lt!17494) #b00000000000000000000000000000000) lt!17494 mask!853) (Found!182 #b00000000000000000000000000000000)))))

(assert (=> b!42311 (=> (not res!25191) (not e!26787))))

(declare-fun d!7653 () Bool)

(declare-fun res!25190 () Bool)

(declare-fun e!26786 () Bool)

(assert (=> d!7653 (=> res!25190 e!26786)))

(assert (=> d!7653 (= res!25190 (bvsge #b00000000000000000000000000000000 (size!1513 lt!17494)))))

(assert (=> d!7653 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17494 mask!853) e!26786)))

(declare-fun b!42312 () Bool)

(assert (=> b!42312 (= e!26787 call!3302)))

(declare-fun b!42313 () Bool)

(assert (=> b!42313 (= e!26786 e!26788)))

(declare-fun c!5309 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!42313 (= c!5309 (validKeyInArray!0 (select (arr!1346 lt!17494) #b00000000000000000000000000000000)))))

(assert (= (and d!7653 (not res!25190)) b!42313))

(assert (= (and b!42313 c!5309) b!42311))

(assert (= (and b!42313 (not c!5309)) b!42310))

(assert (= (and b!42311 res!25191) b!42312))

(assert (= (or b!42312 b!42310) bm!3299))

(declare-fun m!35945 () Bool)

(assert (=> bm!3299 m!35945))

(declare-fun m!35947 () Bool)

(assert (=> b!42311 m!35947))

(declare-fun m!35949 () Bool)

(assert (=> b!42311 m!35949))

(declare-fun m!35951 () Bool)

(assert (=> b!42311 m!35951))

(assert (=> b!42311 m!35947))

(declare-fun m!35953 () Bool)

(assert (=> b!42311 m!35953))

(assert (=> b!42313 m!35947))

(assert (=> b!42313 m!35947))

(declare-fun m!35955 () Bool)

(assert (=> b!42313 m!35955))

(assert (=> b!42289 d!7653))

(declare-fun d!7659 () Bool)

(assert (=> d!7659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17494 mask!853)))

(declare-fun lt!17519 () Unit!1123)

(declare-fun choose!34 (array!2805 (_ BitVec 32) (_ BitVec 32)) Unit!1123)

(assert (=> d!7659 (= lt!17519 (choose!34 lt!17494 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!7659 (validMask!0 mask!853)))

(assert (=> d!7659 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17494 mask!853 #b00000000000000000000000000000000) lt!17519)))

(declare-fun bs!1855 () Bool)

(assert (= bs!1855 d!7659))

(assert (=> bs!1855 m!35925))

(declare-fun m!35959 () Bool)

(assert (=> bs!1855 m!35959))

(assert (=> bs!1855 m!35923))

(assert (=> b!42289 d!7659))

(declare-fun b!42346 () Bool)

(declare-fun e!26808 () (_ BitVec 32))

(assert (=> b!42346 (= e!26808 #b00000000000000000000000000000000)))

(declare-fun b!42347 () Bool)

(declare-fun e!26809 () (_ BitVec 32))

(declare-fun call!3311 () (_ BitVec 32))

(assert (=> b!42347 (= e!26809 call!3311)))

(declare-fun bm!3308 () Bool)

(assert (=> bm!3308 (= call!3311 (arrayCountValidKeys!0 lt!17494 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun d!7663 () Bool)

(declare-fun lt!17534 () (_ BitVec 32))

(assert (=> d!7663 (and (bvsge lt!17534 #b00000000000000000000000000000000) (bvsle lt!17534 (bvsub (size!1513 lt!17494) #b00000000000000000000000000000000)))))

(assert (=> d!7663 (= lt!17534 e!26808)))

(declare-fun c!5323 () Bool)

(assert (=> d!7663 (= c!5323 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7663 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1513 lt!17494)))))

(assert (=> d!7663 (= (arrayCountValidKeys!0 lt!17494 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17534)))

(declare-fun b!42348 () Bool)

(assert (=> b!42348 (= e!26808 e!26809)))

(declare-fun c!5324 () Bool)

(assert (=> b!42348 (= c!5324 (validKeyInArray!0 (select (arr!1346 lt!17494) #b00000000000000000000000000000000)))))

(declare-fun b!42349 () Bool)

(assert (=> b!42349 (= e!26809 (bvadd #b00000000000000000000000000000001 call!3311))))

(assert (= (and d!7663 c!5323) b!42346))

(assert (= (and d!7663 (not c!5323)) b!42348))

(assert (= (and b!42348 c!5324) b!42349))

(assert (= (and b!42348 (not c!5324)) b!42347))

(assert (= (or b!42349 b!42347) bm!3308))

(declare-fun m!35975 () Bool)

(assert (=> bm!3308 m!35975))

(assert (=> b!42348 m!35947))

(assert (=> b!42348 m!35947))

(assert (=> b!42348 m!35955))

(assert (=> b!42289 d!7663))

(declare-fun d!7669 () Bool)

(assert (=> d!7669 (= (arrayCountValidKeys!0 lt!17494 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17542 () Unit!1123)

(declare-fun choose!59 (array!2805 (_ BitVec 32) (_ BitVec 32)) Unit!1123)

(assert (=> d!7669 (= lt!17542 (choose!59 lt!17494 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7669 (bvslt (size!1513 lt!17494) #b01111111111111111111111111111111)))

(assert (=> d!7669 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17494 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17542)))

(declare-fun bs!1857 () Bool)

(assert (= bs!1857 d!7669))

(assert (=> bs!1857 m!35929))

(declare-fun m!35979 () Bool)

(assert (=> bs!1857 m!35979))

(assert (=> b!42289 d!7669))

(push 1)

