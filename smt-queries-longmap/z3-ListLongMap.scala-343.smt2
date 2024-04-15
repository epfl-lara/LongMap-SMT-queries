; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6232 () Bool)

(assert start!6232)

(declare-fun res!25183 () Bool)

(declare-fun e!26774 () Bool)

(assert (=> start!6232 (=> (not res!25183) (not e!26774))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6232 (= res!25183 (validMask!0 mask!853))))

(assert (=> start!6232 e!26774))

(assert (=> start!6232 true))

(declare-fun b!42293 () Bool)

(assert (=> b!42293 (= e!26774 (not (or (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111) (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))))

(declare-datatypes ((array!2787 0))(
  ( (array!2788 (arr!1337 (Array (_ BitVec 32) (_ BitVec 64))) (size!1507 (_ BitVec 32))) )
))
(declare-fun lt!17566 () array!2787)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2787 (_ BitVec 32)) Bool)

(assert (=> b!42293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17566 mask!853)))

(declare-datatypes ((Unit!1138 0))(
  ( (Unit!1139) )
))
(declare-fun lt!17565 () Unit!1138)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2787 (_ BitVec 32) (_ BitVec 32)) Unit!1138)

(assert (=> b!42293 (= lt!17565 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17566 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2787 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42293 (= (arrayCountValidKeys!0 lt!17566 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17567 () Unit!1138)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2787 (_ BitVec 32) (_ BitVec 32)) Unit!1138)

(assert (=> b!42293 (= lt!17567 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17566 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42293 (= lt!17566 (array!2788 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!6232 res!25183) b!42293))

(declare-fun m!35921 () Bool)

(assert (=> start!6232 m!35921))

(declare-fun m!35923 () Bool)

(assert (=> b!42293 m!35923))

(declare-fun m!35925 () Bool)

(assert (=> b!42293 m!35925))

(declare-fun m!35927 () Bool)

(assert (=> b!42293 m!35927))

(declare-fun m!35929 () Bool)

(assert (=> b!42293 m!35929))

(check-sat (not start!6232) (not b!42293))
(check-sat)
(get-model)

(declare-fun d!7639 () Bool)

(assert (=> d!7639 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6232 d!7639))

(declare-fun b!42324 () Bool)

(declare-fun e!26800 () Bool)

(declare-fun call!3319 () Bool)

(assert (=> b!42324 (= e!26800 call!3319)))

(declare-fun b!42326 () Bool)

(declare-fun e!26803 () Bool)

(assert (=> b!42326 (= e!26803 e!26800)))

(declare-fun c!5310 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!42326 (= c!5310 (validKeyInArray!0 (select (arr!1337 lt!17566) #b00000000000000000000000000000000)))))

(declare-fun bm!3315 () Bool)

(assert (=> bm!3315 (= call!3319 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!17566 mask!853))))

(declare-fun b!42329 () Bool)

(declare-fun e!26804 () Bool)

(assert (=> b!42329 (= e!26804 call!3319)))

(declare-fun b!42331 () Bool)

(assert (=> b!42331 (= e!26800 e!26804)))

(declare-fun lt!17604 () (_ BitVec 64))

(assert (=> b!42331 (= lt!17604 (select (arr!1337 lt!17566) #b00000000000000000000000000000000))))

(declare-fun lt!17609 () Unit!1138)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2787 (_ BitVec 64) (_ BitVec 32)) Unit!1138)

(assert (=> b!42331 (= lt!17609 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!17566 lt!17604 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2787 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!42331 (arrayContainsKey!0 lt!17566 lt!17604 #b00000000000000000000000000000000)))

(declare-fun lt!17608 () Unit!1138)

(assert (=> b!42331 (= lt!17608 lt!17609)))

(declare-fun res!25203 () Bool)

(declare-datatypes ((SeekEntryResult!189 0))(
  ( (MissingZero!189 (index!2878 (_ BitVec 32))) (Found!189 (index!2879 (_ BitVec 32))) (Intermediate!189 (undefined!1001 Bool) (index!2880 (_ BitVec 32)) (x!8113 (_ BitVec 32))) (Undefined!189) (MissingVacant!189 (index!2881 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2787 (_ BitVec 32)) SeekEntryResult!189)

(assert (=> b!42331 (= res!25203 (= (seekEntryOrOpen!0 (select (arr!1337 lt!17566) #b00000000000000000000000000000000) lt!17566 mask!853) (Found!189 #b00000000000000000000000000000000)))))

(assert (=> b!42331 (=> (not res!25203) (not e!26804))))

(declare-fun d!7645 () Bool)

(declare-fun res!25204 () Bool)

(assert (=> d!7645 (=> res!25204 e!26803)))

(assert (=> d!7645 (= res!25204 (bvsge #b00000000000000000000000000000000 (size!1507 lt!17566)))))

(assert (=> d!7645 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17566 mask!853) e!26803)))

(assert (= (and d!7645 (not res!25204)) b!42326))

(assert (= (and b!42326 c!5310) b!42331))

(assert (= (and b!42326 (not c!5310)) b!42324))

(assert (= (and b!42331 res!25203) b!42329))

(assert (= (or b!42329 b!42324) bm!3315))

(declare-fun m!35951 () Bool)

(assert (=> b!42326 m!35951))

(assert (=> b!42326 m!35951))

(declare-fun m!35953 () Bool)

(assert (=> b!42326 m!35953))

(declare-fun m!35955 () Bool)

(assert (=> bm!3315 m!35955))

(assert (=> b!42331 m!35951))

(declare-fun m!35957 () Bool)

(assert (=> b!42331 m!35957))

(declare-fun m!35959 () Bool)

(assert (=> b!42331 m!35959))

(assert (=> b!42331 m!35951))

(declare-fun m!35963 () Bool)

(assert (=> b!42331 m!35963))

(assert (=> b!42293 d!7645))

(declare-fun d!7647 () Bool)

(assert (=> d!7647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17566 mask!853)))

(declare-fun lt!17615 () Unit!1138)

(declare-fun choose!34 (array!2787 (_ BitVec 32) (_ BitVec 32)) Unit!1138)

(assert (=> d!7647 (= lt!17615 (choose!34 lt!17566 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!7647 (validMask!0 mask!853)))

(assert (=> d!7647 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17566 mask!853 #b00000000000000000000000000000000) lt!17615)))

(declare-fun bs!1864 () Bool)

(assert (= bs!1864 d!7647))

(assert (=> bs!1864 m!35923))

(declare-fun m!35987 () Bool)

(assert (=> bs!1864 m!35987))

(assert (=> bs!1864 m!35921))

(assert (=> b!42293 d!7647))

(declare-fun d!7653 () Bool)

(declare-fun lt!17624 () (_ BitVec 32))

(assert (=> d!7653 (and (bvsge lt!17624 #b00000000000000000000000000000000) (bvsle lt!17624 (bvsub (size!1507 lt!17566) #b00000000000000000000000000000000)))))

(declare-fun e!26812 () (_ BitVec 32))

(assert (=> d!7653 (= lt!17624 e!26812)))

(declare-fun c!5318 () Bool)

(assert (=> d!7653 (= c!5318 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7653 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1507 lt!17566)))))

(assert (=> d!7653 (= (arrayCountValidKeys!0 lt!17566 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17624)))

(declare-fun b!42344 () Bool)

(assert (=> b!42344 (= e!26812 #b00000000000000000000000000000000)))

(declare-fun b!42345 () Bool)

(declare-fun e!26813 () (_ BitVec 32))

(declare-fun call!3323 () (_ BitVec 32))

(assert (=> b!42345 (= e!26813 (bvadd #b00000000000000000000000000000001 call!3323))))

(declare-fun b!42346 () Bool)

(assert (=> b!42346 (= e!26813 call!3323)))

(declare-fun bm!3320 () Bool)

(assert (=> bm!3320 (= call!3323 (arrayCountValidKeys!0 lt!17566 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!42347 () Bool)

(assert (=> b!42347 (= e!26812 e!26813)))

(declare-fun c!5317 () Bool)

(assert (=> b!42347 (= c!5317 (validKeyInArray!0 (select (arr!1337 lt!17566) #b00000000000000000000000000000000)))))

(assert (= (and d!7653 c!5318) b!42344))

(assert (= (and d!7653 (not c!5318)) b!42347))

(assert (= (and b!42347 c!5317) b!42345))

(assert (= (and b!42347 (not c!5317)) b!42346))

(assert (= (or b!42345 b!42346) bm!3320))

(declare-fun m!35993 () Bool)

(assert (=> bm!3320 m!35993))

(assert (=> b!42347 m!35951))

(assert (=> b!42347 m!35951))

(assert (=> b!42347 m!35953))

(assert (=> b!42293 d!7653))

(declare-fun d!7659 () Bool)

(assert (=> d!7659 (= (arrayCountValidKeys!0 lt!17566 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17631 () Unit!1138)

(declare-fun choose!59 (array!2787 (_ BitVec 32) (_ BitVec 32)) Unit!1138)

(assert (=> d!7659 (= lt!17631 (choose!59 lt!17566 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7659 (bvslt (size!1507 lt!17566) #b01111111111111111111111111111111)))

(assert (=> d!7659 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17566 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17631)))

(declare-fun bs!1867 () Bool)

(assert (= bs!1867 d!7659))

(assert (=> bs!1867 m!35927))

(declare-fun m!35995 () Bool)

(assert (=> bs!1867 m!35995))

(assert (=> b!42293 d!7659))

(check-sat (not b!42331) (not bm!3315) (not b!42347) (not d!7659) (not b!42326) (not bm!3320) (not d!7647))
(check-sat)
