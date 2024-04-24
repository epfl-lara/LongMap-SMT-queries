; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6242 () Bool)

(assert start!6242)

(declare-fun res!25184 () Bool)

(declare-fun e!26790 () Bool)

(assert (=> start!6242 (=> (not res!25184) (not e!26790))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6242 (= res!25184 (validMask!0 mask!853))))

(assert (=> start!6242 e!26790))

(assert (=> start!6242 true))

(declare-fun b!42316 () Bool)

(assert (=> b!42316 (= e!26790 (not (or (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111) (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))))

(declare-datatypes ((array!2799 0))(
  ( (array!2800 (arr!1343 (Array (_ BitVec 32) (_ BitVec 64))) (size!1513 (_ BitVec 32))) )
))
(declare-fun lt!17542 () array!2799)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2799 (_ BitVec 32)) Bool)

(assert (=> b!42316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17542 mask!853)))

(declare-datatypes ((Unit!1143 0))(
  ( (Unit!1144) )
))
(declare-fun lt!17541 () Unit!1143)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2799 (_ BitVec 32) (_ BitVec 32)) Unit!1143)

(assert (=> b!42316 (= lt!17541 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17542 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2799 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42316 (= (arrayCountValidKeys!0 lt!17542 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17540 () Unit!1143)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2799 (_ BitVec 32) (_ BitVec 32)) Unit!1143)

(assert (=> b!42316 (= lt!17540 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17542 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42316 (= lt!17542 (array!2800 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!6242 res!25184) b!42316))

(declare-fun m!35893 () Bool)

(assert (=> start!6242 m!35893))

(declare-fun m!35895 () Bool)

(assert (=> b!42316 m!35895))

(declare-fun m!35897 () Bool)

(assert (=> b!42316 m!35897))

(declare-fun m!35899 () Bool)

(assert (=> b!42316 m!35899))

(declare-fun m!35901 () Bool)

(assert (=> b!42316 m!35901))

(check-sat (not b!42316) (not start!6242))
(check-sat)
(get-model)

(declare-fun b!42331 () Bool)

(declare-fun e!26805 () Bool)

(declare-fun e!26804 () Bool)

(assert (=> b!42331 (= e!26805 e!26804)))

(declare-fun lt!17569 () (_ BitVec 64))

(assert (=> b!42331 (= lt!17569 (select (arr!1343 lt!17542) #b00000000000000000000000000000000))))

(declare-fun lt!17567 () Unit!1143)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2799 (_ BitVec 64) (_ BitVec 32)) Unit!1143)

(assert (=> b!42331 (= lt!17567 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!17542 lt!17569 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2799 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!42331 (arrayContainsKey!0 lt!17542 lt!17569 #b00000000000000000000000000000000)))

(declare-fun lt!17568 () Unit!1143)

(assert (=> b!42331 (= lt!17568 lt!17567)))

(declare-fun res!25196 () Bool)

(declare-datatypes ((SeekEntryResult!178 0))(
  ( (MissingZero!178 (index!2834 (_ BitVec 32))) (Found!178 (index!2835 (_ BitVec 32))) (Intermediate!178 (undefined!990 Bool) (index!2836 (_ BitVec 32)) (x!8103 (_ BitVec 32))) (Undefined!178) (MissingVacant!178 (index!2837 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2799 (_ BitVec 32)) SeekEntryResult!178)

(assert (=> b!42331 (= res!25196 (= (seekEntryOrOpen!0 (select (arr!1343 lt!17542) #b00000000000000000000000000000000) lt!17542 mask!853) (Found!178 #b00000000000000000000000000000000)))))

(assert (=> b!42331 (=> (not res!25196) (not e!26804))))

(declare-fun d!7665 () Bool)

(declare-fun res!25195 () Bool)

(declare-fun e!26803 () Bool)

(assert (=> d!7665 (=> res!25195 e!26803)))

(assert (=> d!7665 (= res!25195 (bvsge #b00000000000000000000000000000000 (size!1513 lt!17542)))))

(assert (=> d!7665 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17542 mask!853) e!26803)))

(declare-fun b!42332 () Bool)

(assert (=> b!42332 (= e!26803 e!26805)))

(declare-fun c!5317 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!42332 (= c!5317 (validKeyInArray!0 (select (arr!1343 lt!17542) #b00000000000000000000000000000000)))))

(declare-fun b!42333 () Bool)

(declare-fun call!3303 () Bool)

(assert (=> b!42333 (= e!26804 call!3303)))

(declare-fun bm!3300 () Bool)

(assert (=> bm!3300 (= call!3303 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!17542 mask!853))))

(declare-fun b!42334 () Bool)

(assert (=> b!42334 (= e!26805 call!3303)))

(assert (= (and d!7665 (not res!25195)) b!42332))

(assert (= (and b!42332 c!5317) b!42331))

(assert (= (and b!42332 (not c!5317)) b!42334))

(assert (= (and b!42331 res!25196) b!42333))

(assert (= (or b!42333 b!42334) bm!3300))

(declare-fun m!35923 () Bool)

(assert (=> b!42331 m!35923))

(declare-fun m!35925 () Bool)

(assert (=> b!42331 m!35925))

(declare-fun m!35927 () Bool)

(assert (=> b!42331 m!35927))

(assert (=> b!42331 m!35923))

(declare-fun m!35929 () Bool)

(assert (=> b!42331 m!35929))

(assert (=> b!42332 m!35923))

(assert (=> b!42332 m!35923))

(declare-fun m!35931 () Bool)

(assert (=> b!42332 m!35931))

(declare-fun m!35933 () Bool)

(assert (=> bm!3300 m!35933))

(assert (=> b!42316 d!7665))

(declare-fun d!7671 () Bool)

(assert (=> d!7671 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17542 mask!853)))

(declare-fun lt!17572 () Unit!1143)

(declare-fun choose!34 (array!2799 (_ BitVec 32) (_ BitVec 32)) Unit!1143)

(assert (=> d!7671 (= lt!17572 (choose!34 lt!17542 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!7671 (validMask!0 mask!853)))

(assert (=> d!7671 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17542 mask!853 #b00000000000000000000000000000000) lt!17572)))

(declare-fun bs!1866 () Bool)

(assert (= bs!1866 d!7671))

(assert (=> bs!1866 m!35895))

(declare-fun m!35935 () Bool)

(assert (=> bs!1866 m!35935))

(assert (=> bs!1866 m!35893))

(assert (=> b!42316 d!7671))

(declare-fun b!42355 () Bool)

(declare-fun e!26820 () (_ BitVec 32))

(assert (=> b!42355 (= e!26820 #b00000000000000000000000000000000)))

(declare-fun d!7675 () Bool)

(declare-fun lt!17584 () (_ BitVec 32))

(assert (=> d!7675 (and (bvsge lt!17584 #b00000000000000000000000000000000) (bvsle lt!17584 (bvsub (size!1513 lt!17542) #b00000000000000000000000000000000)))))

(assert (=> d!7675 (= lt!17584 e!26820)))

(declare-fun c!5326 () Bool)

(assert (=> d!7675 (= c!5326 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7675 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1513 lt!17542)))))

(assert (=> d!7675 (= (arrayCountValidKeys!0 lt!17542 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17584)))

(declare-fun bm!3306 () Bool)

(declare-fun call!3309 () (_ BitVec 32))

(assert (=> bm!3306 (= call!3309 (arrayCountValidKeys!0 lt!17542 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!42356 () Bool)

(declare-fun e!26819 () (_ BitVec 32))

(assert (=> b!42356 (= e!26820 e!26819)))

(declare-fun c!5325 () Bool)

(assert (=> b!42356 (= c!5325 (validKeyInArray!0 (select (arr!1343 lt!17542) #b00000000000000000000000000000000)))))

(declare-fun b!42357 () Bool)

(assert (=> b!42357 (= e!26819 (bvadd #b00000000000000000000000000000001 call!3309))))

(declare-fun b!42358 () Bool)

(assert (=> b!42358 (= e!26819 call!3309)))

(assert (= (and d!7675 c!5326) b!42355))

(assert (= (and d!7675 (not c!5326)) b!42356))

(assert (= (and b!42356 c!5325) b!42357))

(assert (= (and b!42356 (not c!5325)) b!42358))

(assert (= (or b!42357 b!42358) bm!3306))

(declare-fun m!35949 () Bool)

(assert (=> bm!3306 m!35949))

(assert (=> b!42356 m!35923))

(assert (=> b!42356 m!35923))

(assert (=> b!42356 m!35931))

(assert (=> b!42316 d!7675))

(declare-fun d!7681 () Bool)

(assert (=> d!7681 (= (arrayCountValidKeys!0 lt!17542 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17593 () Unit!1143)

(declare-fun choose!59 (array!2799 (_ BitVec 32) (_ BitVec 32)) Unit!1143)

(assert (=> d!7681 (= lt!17593 (choose!59 lt!17542 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7681 (bvslt (size!1513 lt!17542) #b01111111111111111111111111111111)))

(assert (=> d!7681 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17542 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17593)))

(declare-fun bs!1867 () Bool)

(assert (= bs!1867 d!7681))

(assert (=> bs!1867 m!35899))

(declare-fun m!35951 () Bool)

(assert (=> bs!1867 m!35951))

(assert (=> b!42316 d!7681))

(declare-fun d!7683 () Bool)

(assert (=> d!7683 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6242 d!7683))

(check-sat (not b!42332) (not b!42331) (not bm!3306) (not b!42356) (not bm!3300) (not d!7681) (not d!7671))
(check-sat)
