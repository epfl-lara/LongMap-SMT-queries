; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6198 () Bool)

(assert start!6198)

(declare-fun res!25176 () Bool)

(declare-fun e!26767 () Bool)

(assert (=> start!6198 (=> (not res!25176) (not e!26767))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6198 (= res!25176 (validMask!0 mask!853))))

(assert (=> start!6198 e!26767))

(assert (=> start!6198 true))

(declare-fun b!42286 () Bool)

(assert (=> b!42286 (= e!26767 (not (bvslt (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111)))))

(declare-datatypes ((array!2803 0))(
  ( (array!2804 (arr!1345 (Array (_ BitVec 32) (_ BitVec 64))) (size!1512 (_ BitVec 32))) )
))
(declare-fun lt!17484 () array!2803)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2803 (_ BitVec 32)) Bool)

(assert (=> b!42286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17484 mask!853)))

(declare-datatypes ((Unit!1121 0))(
  ( (Unit!1122) )
))
(declare-fun lt!17486 () Unit!1121)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2803 (_ BitVec 32) (_ BitVec 32)) Unit!1121)

(assert (=> b!42286 (= lt!17486 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17484 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2803 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42286 (= (arrayCountValidKeys!0 lt!17484 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17485 () Unit!1121)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2803 (_ BitVec 32) (_ BitVec 32)) Unit!1121)

(assert (=> b!42286 (= lt!17485 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17484 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42286 (= lt!17484 (array!2804 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!6198 res!25176) b!42286))

(declare-fun m!35913 () Bool)

(assert (=> start!6198 m!35913))

(declare-fun m!35915 () Bool)

(assert (=> b!42286 m!35915))

(declare-fun m!35917 () Bool)

(assert (=> b!42286 m!35917))

(declare-fun m!35919 () Bool)

(assert (=> b!42286 m!35919))

(declare-fun m!35921 () Bool)

(assert (=> b!42286 m!35921))

(check-sat (not start!6198) (not b!42286))
(check-sat)
(get-model)

(declare-fun d!7649 () Bool)

(assert (=> d!7649 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6198 d!7649))

(declare-fun b!42338 () Bool)

(declare-fun e!26803 () Bool)

(declare-fun call!3309 () Bool)

(assert (=> b!42338 (= e!26803 call!3309)))

(declare-fun d!7655 () Bool)

(declare-fun res!25197 () Bool)

(declare-fun e!26804 () Bool)

(assert (=> d!7655 (=> res!25197 e!26804)))

(assert (=> d!7655 (= res!25197 (bvsge #b00000000000000000000000000000000 (size!1512 lt!17484)))))

(assert (=> d!7655 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17484 mask!853) e!26804)))

(declare-fun bm!3306 () Bool)

(assert (=> bm!3306 (= call!3309 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!17484 mask!853))))

(declare-fun b!42339 () Bool)

(declare-fun e!26805 () Bool)

(assert (=> b!42339 (= e!26803 e!26805)))

(declare-fun lt!17530 () (_ BitVec 64))

(assert (=> b!42339 (= lt!17530 (select (arr!1345 lt!17484) #b00000000000000000000000000000000))))

(declare-fun lt!17531 () Unit!1121)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2803 (_ BitVec 64) (_ BitVec 32)) Unit!1121)

(assert (=> b!42339 (= lt!17531 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!17484 lt!17530 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2803 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!42339 (arrayContainsKey!0 lt!17484 lt!17530 #b00000000000000000000000000000000)))

(declare-fun lt!17532 () Unit!1121)

(assert (=> b!42339 (= lt!17532 lt!17531)))

(declare-fun res!25196 () Bool)

(declare-datatypes ((SeekEntryResult!183 0))(
  ( (MissingZero!183 (index!2854 (_ BitVec 32))) (Found!183 (index!2855 (_ BitVec 32))) (Intermediate!183 (undefined!995 Bool) (index!2856 (_ BitVec 32)) (x!8092 (_ BitVec 32))) (Undefined!183) (MissingVacant!183 (index!2857 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2803 (_ BitVec 32)) SeekEntryResult!183)

(assert (=> b!42339 (= res!25196 (= (seekEntryOrOpen!0 (select (arr!1345 lt!17484) #b00000000000000000000000000000000) lt!17484 mask!853) (Found!183 #b00000000000000000000000000000000)))))

(assert (=> b!42339 (=> (not res!25196) (not e!26805))))

(declare-fun b!42340 () Bool)

(assert (=> b!42340 (= e!26804 e!26803)))

(declare-fun c!5320 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!42340 (= c!5320 (validKeyInArray!0 (select (arr!1345 lt!17484) #b00000000000000000000000000000000)))))

(declare-fun b!42341 () Bool)

(assert (=> b!42341 (= e!26805 call!3309)))

(assert (= (and d!7655 (not res!25197)) b!42340))

(assert (= (and b!42340 c!5320) b!42339))

(assert (= (and b!42340 (not c!5320)) b!42338))

(assert (= (and b!42339 res!25196) b!42341))

(assert (= (or b!42341 b!42338) bm!3306))

(declare-fun m!35961 () Bool)

(assert (=> bm!3306 m!35961))

(declare-fun m!35963 () Bool)

(assert (=> b!42339 m!35963))

(declare-fun m!35965 () Bool)

(assert (=> b!42339 m!35965))

(declare-fun m!35967 () Bool)

(assert (=> b!42339 m!35967))

(assert (=> b!42339 m!35963))

(declare-fun m!35969 () Bool)

(assert (=> b!42339 m!35969))

(assert (=> b!42340 m!35963))

(assert (=> b!42340 m!35963))

(declare-fun m!35971 () Bool)

(assert (=> b!42340 m!35971))

(assert (=> b!42286 d!7655))

(declare-fun d!7665 () Bool)

(assert (=> d!7665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17484 mask!853)))

(declare-fun lt!17543 () Unit!1121)

(declare-fun choose!34 (array!2803 (_ BitVec 32) (_ BitVec 32)) Unit!1121)

(assert (=> d!7665 (= lt!17543 (choose!34 lt!17484 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!7665 (validMask!0 mask!853)))

(assert (=> d!7665 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17484 mask!853 #b00000000000000000000000000000000) lt!17543)))

(declare-fun bs!1858 () Bool)

(assert (= bs!1858 d!7665))

(assert (=> bs!1858 m!35915))

(declare-fun m!35981 () Bool)

(assert (=> bs!1858 m!35981))

(assert (=> bs!1858 m!35913))

(assert (=> b!42286 d!7665))

(declare-fun b!42358 () Bool)

(declare-fun e!26814 () (_ BitVec 32))

(declare-fun e!26815 () (_ BitVec 32))

(assert (=> b!42358 (= e!26814 e!26815)))

(declare-fun c!5329 () Bool)

(assert (=> b!42358 (= c!5329 (validKeyInArray!0 (select (arr!1345 lt!17484) #b00000000000000000000000000000000)))))

(declare-fun b!42359 () Bool)

(assert (=> b!42359 (= e!26814 #b00000000000000000000000000000000)))

(declare-fun b!42360 () Bool)

(declare-fun call!3314 () (_ BitVec 32))

(assert (=> b!42360 (= e!26815 (bvadd #b00000000000000000000000000000001 call!3314))))

(declare-fun bm!3311 () Bool)

(assert (=> bm!3311 (= call!3314 (arrayCountValidKeys!0 lt!17484 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun d!7671 () Bool)

(declare-fun lt!17546 () (_ BitVec 32))

(assert (=> d!7671 (and (bvsge lt!17546 #b00000000000000000000000000000000) (bvsle lt!17546 (bvsub (size!1512 lt!17484) #b00000000000000000000000000000000)))))

(assert (=> d!7671 (= lt!17546 e!26814)))

(declare-fun c!5330 () Bool)

(assert (=> d!7671 (= c!5330 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7671 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1512 lt!17484)))))

(assert (=> d!7671 (= (arrayCountValidKeys!0 lt!17484 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17546)))

(declare-fun b!42361 () Bool)

(assert (=> b!42361 (= e!26815 call!3314)))

(assert (= (and d!7671 c!5330) b!42359))

(assert (= (and d!7671 (not c!5330)) b!42358))

(assert (= (and b!42358 c!5329) b!42360))

(assert (= (and b!42358 (not c!5329)) b!42361))

(assert (= (or b!42360 b!42361) bm!3311))

(assert (=> b!42358 m!35963))

(assert (=> b!42358 m!35963))

(assert (=> b!42358 m!35971))

(declare-fun m!35983 () Bool)

(assert (=> bm!3311 m!35983))

(assert (=> b!42286 d!7671))

(declare-fun d!7673 () Bool)

(assert (=> d!7673 (= (arrayCountValidKeys!0 lt!17484 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17549 () Unit!1121)

(declare-fun choose!59 (array!2803 (_ BitVec 32) (_ BitVec 32)) Unit!1121)

(assert (=> d!7673 (= lt!17549 (choose!59 lt!17484 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7673 (bvslt (size!1512 lt!17484) #b01111111111111111111111111111111)))

(assert (=> d!7673 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17484 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17549)))

(declare-fun bs!1859 () Bool)

(assert (= bs!1859 d!7673))

(assert (=> bs!1859 m!35919))

(declare-fun m!35985 () Bool)

(assert (=> bs!1859 m!35985))

(assert (=> b!42286 d!7673))

(check-sat (not b!42358) (not d!7673) (not d!7665) (not b!42340) (not bm!3311) (not b!42339) (not bm!3306))
(check-sat)
