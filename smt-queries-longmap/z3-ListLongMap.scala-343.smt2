; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6240 () Bool)

(assert start!6240)

(declare-fun res!25212 () Bool)

(declare-fun e!26830 () Bool)

(assert (=> start!6240 (=> (not res!25212) (not e!26830))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6240 (= res!25212 (validMask!0 mask!853))))

(assert (=> start!6240 e!26830))

(assert (=> start!6240 true))

(declare-fun b!42376 () Bool)

(assert (=> b!42376 (= e!26830 (not (or (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111) (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))))

(declare-datatypes ((array!2815 0))(
  ( (array!2816 (arr!1351 (Array (_ BitVec 32) (_ BitVec 64))) (size!1521 (_ BitVec 32))) )
))
(declare-fun lt!17592 () array!2815)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2815 (_ BitVec 32)) Bool)

(assert (=> b!42376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17592 mask!853)))

(declare-datatypes ((Unit!1133 0))(
  ( (Unit!1134) )
))
(declare-fun lt!17594 () Unit!1133)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2815 (_ BitVec 32) (_ BitVec 32)) Unit!1133)

(assert (=> b!42376 (= lt!17594 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17592 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2815 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42376 (= (arrayCountValidKeys!0 lt!17592 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17593 () Unit!1133)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2815 (_ BitVec 32) (_ BitVec 32)) Unit!1133)

(assert (=> b!42376 (= lt!17593 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17592 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42376 (= lt!17592 (array!2816 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!6240 res!25212) b!42376))

(declare-fun m!36027 () Bool)

(assert (=> start!6240 m!36027))

(declare-fun m!36029 () Bool)

(assert (=> b!42376 m!36029))

(declare-fun m!36031 () Bool)

(assert (=> b!42376 m!36031))

(declare-fun m!36033 () Bool)

(assert (=> b!42376 m!36033))

(declare-fun m!36035 () Bool)

(assert (=> b!42376 m!36035))

(check-sat (not start!6240) (not b!42376))
(check-sat)
(get-model)

(declare-fun d!7679 () Bool)

(assert (=> d!7679 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6240 d!7679))

(declare-fun bm!3320 () Bool)

(declare-fun call!3323 () Bool)

(assert (=> bm!3320 (= call!3323 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!17592 mask!853))))

(declare-fun b!42412 () Bool)

(declare-fun e!26860 () Bool)

(declare-fun e!26859 () Bool)

(assert (=> b!42412 (= e!26860 e!26859)))

(declare-fun lt!17635 () (_ BitVec 64))

(assert (=> b!42412 (= lt!17635 (select (arr!1351 lt!17592) #b00000000000000000000000000000000))))

(declare-fun lt!17636 () Unit!1133)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2815 (_ BitVec 64) (_ BitVec 32)) Unit!1133)

(assert (=> b!42412 (= lt!17636 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!17592 lt!17635 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2815 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!42412 (arrayContainsKey!0 lt!17592 lt!17635 #b00000000000000000000000000000000)))

(declare-fun lt!17634 () Unit!1133)

(assert (=> b!42412 (= lt!17634 lt!17636)))

(declare-fun res!25233 () Bool)

(declare-datatypes ((SeekEntryResult!184 0))(
  ( (MissingZero!184 (index!2858 (_ BitVec 32))) (Found!184 (index!2859 (_ BitVec 32))) (Intermediate!184 (undefined!996 Bool) (index!2860 (_ BitVec 32)) (x!8109 (_ BitVec 32))) (Undefined!184) (MissingVacant!184 (index!2861 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2815 (_ BitVec 32)) SeekEntryResult!184)

(assert (=> b!42412 (= res!25233 (= (seekEntryOrOpen!0 (select (arr!1351 lt!17592) #b00000000000000000000000000000000) lt!17592 mask!853) (Found!184 #b00000000000000000000000000000000)))))

(assert (=> b!42412 (=> (not res!25233) (not e!26859))))

(declare-fun b!42413 () Bool)

(assert (=> b!42413 (= e!26860 call!3323)))

(declare-fun b!42414 () Bool)

(declare-fun e!26858 () Bool)

(assert (=> b!42414 (= e!26858 e!26860)))

(declare-fun c!5339 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!42414 (= c!5339 (validKeyInArray!0 (select (arr!1351 lt!17592) #b00000000000000000000000000000000)))))

(declare-fun d!7685 () Bool)

(declare-fun res!25232 () Bool)

(assert (=> d!7685 (=> res!25232 e!26858)))

(assert (=> d!7685 (= res!25232 (bvsge #b00000000000000000000000000000000 (size!1521 lt!17592)))))

(assert (=> d!7685 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17592 mask!853) e!26858)))

(declare-fun b!42415 () Bool)

(assert (=> b!42415 (= e!26859 call!3323)))

(assert (= (and d!7685 (not res!25232)) b!42414))

(assert (= (and b!42414 c!5339) b!42412))

(assert (= (and b!42414 (not c!5339)) b!42413))

(assert (= (and b!42412 res!25233) b!42415))

(assert (= (or b!42415 b!42413) bm!3320))

(declare-fun m!36075 () Bool)

(assert (=> bm!3320 m!36075))

(declare-fun m!36077 () Bool)

(assert (=> b!42412 m!36077))

(declare-fun m!36079 () Bool)

(assert (=> b!42412 m!36079))

(declare-fun m!36081 () Bool)

(assert (=> b!42412 m!36081))

(assert (=> b!42412 m!36077))

(declare-fun m!36083 () Bool)

(assert (=> b!42412 m!36083))

(assert (=> b!42414 m!36077))

(assert (=> b!42414 m!36077))

(declare-fun m!36085 () Bool)

(assert (=> b!42414 m!36085))

(assert (=> b!42376 d!7685))

(declare-fun d!7695 () Bool)

(assert (=> d!7695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17592 mask!853)))

(declare-fun lt!17644 () Unit!1133)

(declare-fun choose!34 (array!2815 (_ BitVec 32) (_ BitVec 32)) Unit!1133)

(assert (=> d!7695 (= lt!17644 (choose!34 lt!17592 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!7695 (validMask!0 mask!853)))

(assert (=> d!7695 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17592 mask!853 #b00000000000000000000000000000000) lt!17644)))

(declare-fun bs!1868 () Bool)

(assert (= bs!1868 d!7695))

(assert (=> bs!1868 m!36029))

(declare-fun m!36089 () Bool)

(assert (=> bs!1868 m!36089))

(assert (=> bs!1868 m!36027))

(assert (=> b!42376 d!7695))

(declare-fun bm!3329 () Bool)

(declare-fun call!3332 () (_ BitVec 32))

(assert (=> bm!3329 (= call!3332 (arrayCountValidKeys!0 lt!17592 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!42448 () Bool)

(declare-fun e!26877 () (_ BitVec 32))

(assert (=> b!42448 (= e!26877 (bvadd #b00000000000000000000000000000001 call!3332))))

(declare-fun b!42449 () Bool)

(assert (=> b!42449 (= e!26877 call!3332)))

(declare-fun d!7699 () Bool)

(declare-fun lt!17654 () (_ BitVec 32))

(assert (=> d!7699 (and (bvsge lt!17654 #b00000000000000000000000000000000) (bvsle lt!17654 (bvsub (size!1521 lt!17592) #b00000000000000000000000000000000)))))

(declare-fun e!26878 () (_ BitVec 32))

(assert (=> d!7699 (= lt!17654 e!26878)))

(declare-fun c!5356 () Bool)

(assert (=> d!7699 (= c!5356 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7699 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1521 lt!17592)))))

(assert (=> d!7699 (= (arrayCountValidKeys!0 lt!17592 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17654)))

(declare-fun b!42450 () Bool)

(assert (=> b!42450 (= e!26878 #b00000000000000000000000000000000)))

(declare-fun b!42451 () Bool)

(assert (=> b!42451 (= e!26878 e!26877)))

(declare-fun c!5357 () Bool)

(assert (=> b!42451 (= c!5357 (validKeyInArray!0 (select (arr!1351 lt!17592) #b00000000000000000000000000000000)))))

(assert (= (and d!7699 c!5356) b!42450))

(assert (= (and d!7699 (not c!5356)) b!42451))

(assert (= (and b!42451 c!5357) b!42448))

(assert (= (and b!42451 (not c!5357)) b!42449))

(assert (= (or b!42448 b!42449) bm!3329))

(declare-fun m!36097 () Bool)

(assert (=> bm!3329 m!36097))

(assert (=> b!42451 m!36077))

(assert (=> b!42451 m!36077))

(assert (=> b!42451 m!36085))

(assert (=> b!42376 d!7699))

(declare-fun d!7707 () Bool)

(assert (=> d!7707 (= (arrayCountValidKeys!0 lt!17592 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17657 () Unit!1133)

(declare-fun choose!59 (array!2815 (_ BitVec 32) (_ BitVec 32)) Unit!1133)

(assert (=> d!7707 (= lt!17657 (choose!59 lt!17592 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7707 (bvslt (size!1521 lt!17592) #b01111111111111111111111111111111)))

(assert (=> d!7707 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17592 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17657)))

(declare-fun bs!1871 () Bool)

(assert (= bs!1871 d!7707))

(assert (=> bs!1871 m!36033))

(declare-fun m!36099 () Bool)

(assert (=> bs!1871 m!36099))

(assert (=> b!42376 d!7707))

(check-sat (not b!42412) (not b!42451) (not b!42414) (not d!7695) (not bm!3320) (not bm!3329) (not d!7707))
(check-sat)
