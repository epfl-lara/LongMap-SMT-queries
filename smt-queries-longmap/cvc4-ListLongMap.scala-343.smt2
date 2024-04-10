; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6242 () Bool)

(assert start!6242)

(declare-fun res!25215 () Bool)

(declare-fun e!26833 () Bool)

(assert (=> start!6242 (=> (not res!25215) (not e!26833))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6242 (= res!25215 (validMask!0 mask!853))))

(assert (=> start!6242 e!26833))

(assert (=> start!6242 true))

(declare-fun b!42379 () Bool)

(assert (=> b!42379 (= e!26833 (not (or (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111) (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))))

(declare-datatypes ((array!2817 0))(
  ( (array!2818 (arr!1352 (Array (_ BitVec 32) (_ BitVec 64))) (size!1522 (_ BitVec 32))) )
))
(declare-fun lt!17602 () array!2817)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2817 (_ BitVec 32)) Bool)

(assert (=> b!42379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17602 mask!853)))

(declare-datatypes ((Unit!1135 0))(
  ( (Unit!1136) )
))
(declare-fun lt!17601 () Unit!1135)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2817 (_ BitVec 32) (_ BitVec 32)) Unit!1135)

(assert (=> b!42379 (= lt!17601 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17602 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2817 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42379 (= (arrayCountValidKeys!0 lt!17602 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17603 () Unit!1135)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2817 (_ BitVec 32) (_ BitVec 32)) Unit!1135)

(assert (=> b!42379 (= lt!17603 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17602 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42379 (= lt!17602 (array!2818 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!6242 res!25215) b!42379))

(declare-fun m!36037 () Bool)

(assert (=> start!6242 m!36037))

(declare-fun m!36039 () Bool)

(assert (=> b!42379 m!36039))

(declare-fun m!36041 () Bool)

(assert (=> b!42379 m!36041))

(declare-fun m!36043 () Bool)

(assert (=> b!42379 m!36043))

(declare-fun m!36045 () Bool)

(assert (=> b!42379 m!36045))

(push 1)

(assert (not b!42379))

(assert (not start!6242))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun bm!3317 () Bool)

(declare-fun call!3320 () Bool)

(assert (=> bm!3317 (= call!3320 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!17602 mask!853))))

(declare-fun b!42400 () Bool)

(declare-fun e!26850 () Bool)

(assert (=> b!42400 (= e!26850 call!3320)))

(declare-fun d!7683 () Bool)

(declare-fun res!25226 () Bool)

(declare-fun e!26851 () Bool)

(assert (=> d!7683 (=> res!25226 e!26851)))

(assert (=> d!7683 (= res!25226 (bvsge #b00000000000000000000000000000000 (size!1522 lt!17602)))))

(assert (=> d!7683 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17602 mask!853) e!26851)))

(declare-fun b!42401 () Bool)

(declare-fun e!26849 () Bool)

(assert (=> b!42401 (= e!26849 call!3320)))

(declare-fun b!42402 () Bool)

(assert (=> b!42402 (= e!26850 e!26849)))

(declare-fun lt!17620 () (_ BitVec 64))

(assert (=> b!42402 (= lt!17620 (select (arr!1352 lt!17602) #b00000000000000000000000000000000))))

(declare-fun lt!17621 () Unit!1135)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2817 (_ BitVec 64) (_ BitVec 32)) Unit!1135)

(assert (=> b!42402 (= lt!17621 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!17602 lt!17620 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2817 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!42402 (arrayContainsKey!0 lt!17602 lt!17620 #b00000000000000000000000000000000)))

(declare-fun lt!17619 () Unit!1135)

(assert (=> b!42402 (= lt!17619 lt!17621)))

(declare-fun res!25227 () Bool)

(declare-datatypes ((SeekEntryResult!186 0))(
  ( (MissingZero!186 (index!2866 (_ BitVec 32))) (Found!186 (index!2867 (_ BitVec 32))) (Intermediate!186 (undefined!998 Bool) (index!2868 (_ BitVec 32)) (x!8111 (_ BitVec 32))) (Undefined!186) (MissingVacant!186 (index!2869 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2817 (_ BitVec 32)) SeekEntryResult!186)

(assert (=> b!42402 (= res!25227 (= (seekEntryOrOpen!0 (select (arr!1352 lt!17602) #b00000000000000000000000000000000) lt!17602 mask!853) (Found!186 #b00000000000000000000000000000000)))))

(assert (=> b!42402 (=> (not res!25227) (not e!26849))))

(declare-fun b!42403 () Bool)

(assert (=> b!42403 (= e!26851 e!26850)))

(declare-fun c!5336 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!42403 (= c!5336 (validKeyInArray!0 (select (arr!1352 lt!17602) #b00000000000000000000000000000000)))))

(assert (= (and d!7683 (not res!25226)) b!42403))

(assert (= (and b!42403 c!5336) b!42402))

(assert (= (and b!42403 (not c!5336)) b!42400))

(assert (= (and b!42402 res!25227) b!42401))

(assert (= (or b!42401 b!42400) bm!3317))

(declare-fun m!36059 () Bool)

(assert (=> bm!3317 m!36059))

(declare-fun m!36061 () Bool)

(assert (=> b!42402 m!36061))

(declare-fun m!36063 () Bool)

(assert (=> b!42402 m!36063))

(declare-fun m!36065 () Bool)

(assert (=> b!42402 m!36065))

(assert (=> b!42402 m!36061))

(declare-fun m!36067 () Bool)

(assert (=> b!42402 m!36067))

(assert (=> b!42403 m!36061))

(assert (=> b!42403 m!36061))

(declare-fun m!36069 () Bool)

(assert (=> b!42403 m!36069))

(assert (=> b!42379 d!7683))

(declare-fun d!7689 () Bool)

(assert (=> d!7689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17602 mask!853)))

(declare-fun lt!17633 () Unit!1135)

(declare-fun choose!34 (array!2817 (_ BitVec 32) (_ BitVec 32)) Unit!1135)

(assert (=> d!7689 (= lt!17633 (choose!34 lt!17602 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!7689 (validMask!0 mask!853)))

(assert (=> d!7689 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17602 mask!853 #b00000000000000000000000000000000) lt!17633)))

(declare-fun bs!1867 () Bool)

(assert (= bs!1867 d!7689))

(assert (=> bs!1867 m!36039))

(declare-fun m!36073 () Bool)

(assert (=> bs!1867 m!36073))

(assert (=> bs!1867 m!36037))

(assert (=> b!42379 d!7689))

(declare-fun d!7693 () Bool)

(declare-fun lt!17645 () (_ BitVec 32))

(assert (=> d!7693 (and (bvsge lt!17645 #b00000000000000000000000000000000) (bvsle lt!17645 (bvsub (size!1522 lt!17602) #b00000000000000000000000000000000)))))

(declare-fun e!26871 () (_ BitVec 32))

(assert (=> d!7693 (= lt!17645 e!26871)))

(declare-fun c!5350 () Bool)

(assert (=> d!7693 (= c!5350 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7693 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1522 lt!17602)))))

(assert (=> d!7693 (= (arrayCountValidKeys!0 lt!17602 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17645)))

(declare-fun b!42436 () Bool)

(assert (=> b!42436 (= e!26871 #b00000000000000000000000000000000)))

(declare-fun b!42437 () Bool)

(declare-fun e!26872 () (_ BitVec 32))

(declare-fun call!3329 () (_ BitVec 32))

(assert (=> b!42437 (= e!26872 call!3329)))

(declare-fun b!42438 () Bool)

(assert (=> b!42438 (= e!26872 (bvadd #b00000000000000000000000000000001 call!3329))))

(declare-fun bm!3326 () Bool)

(assert (=> bm!3326 (= call!3329 (arrayCountValidKeys!0 lt!17602 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!42439 () Bool)

(assert (=> b!42439 (= e!26871 e!26872)))

(declare-fun c!5351 () Bool)

(assert (=> b!42439 (= c!5351 (validKeyInArray!0 (select (arr!1352 lt!17602) #b00000000000000000000000000000000)))))

(assert (= (and d!7693 c!5350) b!42436))

(assert (= (and d!7693 (not c!5350)) b!42439))

(assert (= (and b!42439 c!5351) b!42438))

(assert (= (and b!42439 (not c!5351)) b!42437))

(assert (= (or b!42438 b!42437) bm!3326))

(declare-fun m!36091 () Bool)

(assert (=> bm!3326 m!36091))

(assert (=> b!42439 m!36061))

(assert (=> b!42439 m!36061))

(assert (=> b!42439 m!36069))

(assert (=> b!42379 d!7693))

(declare-fun d!7701 () Bool)

(assert (=> d!7701 (= (arrayCountValidKeys!0 lt!17602 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17651 () Unit!1135)

(declare-fun choose!59 (array!2817 (_ BitVec 32) (_ BitVec 32)) Unit!1135)

