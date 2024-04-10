; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6276 () Bool)

(assert start!6276)

(declare-fun res!25251 () Bool)

(declare-fun e!26896 () Bool)

(assert (=> start!6276 (=> (not res!25251) (not e!26896))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6276 (= res!25251 (validMask!0 mask!853))))

(assert (=> start!6276 e!26896))

(assert (=> start!6276 true))

(declare-fun b!42467 () Bool)

(declare-fun e!26895 () Bool)

(assert (=> b!42467 (= e!26896 (not e!26895))))

(declare-fun res!25250 () Bool)

(assert (=> b!42467 (=> res!25250 e!26895)))

(assert (=> b!42467 (= res!25250 (or (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853))))))

(declare-datatypes ((array!2821 0))(
  ( (array!2822 (arr!1354 (Array (_ BitVec 32) (_ BitVec 64))) (size!1527 (_ BitVec 32))) )
))
(declare-fun lt!17673 () array!2821)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2821 (_ BitVec 32)) Bool)

(assert (=> b!42467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17673 mask!853)))

(declare-datatypes ((Unit!1139 0))(
  ( (Unit!1140) )
))
(declare-fun lt!17675 () Unit!1139)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2821 (_ BitVec 32) (_ BitVec 32)) Unit!1139)

(assert (=> b!42467 (= lt!17675 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17673 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2821 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42467 (= (arrayCountValidKeys!0 lt!17673 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17674 () Unit!1139)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2821 (_ BitVec 32) (_ BitVec 32)) Unit!1139)

(assert (=> b!42467 (= lt!17674 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17673 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42467 (= lt!17673 (array!2822 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!42468 () Bool)

(declare-fun e!26894 () Bool)

(assert (=> b!42468 (= e!26895 e!26894)))

(declare-fun res!25249 () Bool)

(assert (=> b!42468 (=> (not res!25249) (not e!26894))))

(declare-datatypes ((List!1143 0))(
  ( (Nil!1140) (Cons!1139 (h!1716 (_ BitVec 64)) (t!4090 List!1143)) )
))
(declare-fun contains!554 (List!1143 (_ BitVec 64)) Bool)

(assert (=> b!42468 (= res!25249 (not (contains!554 Nil!1140 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!42469 () Bool)

(assert (=> b!42469 (= e!26894 (not (contains!554 Nil!1140 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!6276 res!25251) b!42467))

(assert (= (and b!42467 (not res!25250)) b!42468))

(assert (= (and b!42468 res!25249) b!42469))

(declare-fun m!36115 () Bool)

(assert (=> start!6276 m!36115))

(declare-fun m!36117 () Bool)

(assert (=> b!42467 m!36117))

(declare-fun m!36119 () Bool)

(assert (=> b!42467 m!36119))

(declare-fun m!36121 () Bool)

(assert (=> b!42467 m!36121))

(declare-fun m!36123 () Bool)

(assert (=> b!42467 m!36123))

(declare-fun m!36125 () Bool)

(assert (=> b!42468 m!36125))

(declare-fun m!36127 () Bool)

(assert (=> b!42469 m!36127))

(check-sat (not b!42469) (not b!42468) (not b!42467) (not start!6276))
(check-sat)
(get-model)

(declare-fun d!7711 () Bool)

(declare-fun lt!17689 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!34 (List!1143) (InoxSet (_ BitVec 64)))

(assert (=> d!7711 (= lt!17689 (select (content!34 Nil!1140) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!26914 () Bool)

(assert (=> d!7711 (= lt!17689 e!26914)))

(declare-fun res!25270 () Bool)

(assert (=> d!7711 (=> (not res!25270) (not e!26914))))

(get-info :version)

(assert (=> d!7711 (= res!25270 ((_ is Cons!1139) Nil!1140))))

(assert (=> d!7711 (= (contains!554 Nil!1140 #b1000000000000000000000000000000000000000000000000000000000000000) lt!17689)))

(declare-fun b!42487 () Bool)

(declare-fun e!26915 () Bool)

(assert (=> b!42487 (= e!26914 e!26915)))

(declare-fun res!25269 () Bool)

(assert (=> b!42487 (=> res!25269 e!26915)))

(assert (=> b!42487 (= res!25269 (= (h!1716 Nil!1140) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!42488 () Bool)

(assert (=> b!42488 (= e!26915 (contains!554 (t!4090 Nil!1140) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!7711 res!25270) b!42487))

(assert (= (and b!42487 (not res!25269)) b!42488))

(declare-fun m!36143 () Bool)

(assert (=> d!7711 m!36143))

(declare-fun m!36145 () Bool)

(assert (=> d!7711 m!36145))

(declare-fun m!36147 () Bool)

(assert (=> b!42488 m!36147))

(assert (=> b!42469 d!7711))

(declare-fun d!7717 () Bool)

(declare-fun lt!17690 () Bool)

(assert (=> d!7717 (= lt!17690 (select (content!34 Nil!1140) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!26916 () Bool)

(assert (=> d!7717 (= lt!17690 e!26916)))

(declare-fun res!25272 () Bool)

(assert (=> d!7717 (=> (not res!25272) (not e!26916))))

(assert (=> d!7717 (= res!25272 ((_ is Cons!1139) Nil!1140))))

(assert (=> d!7717 (= (contains!554 Nil!1140 #b0000000000000000000000000000000000000000000000000000000000000000) lt!17690)))

(declare-fun b!42489 () Bool)

(declare-fun e!26917 () Bool)

(assert (=> b!42489 (= e!26916 e!26917)))

(declare-fun res!25271 () Bool)

(assert (=> b!42489 (=> res!25271 e!26917)))

(assert (=> b!42489 (= res!25271 (= (h!1716 Nil!1140) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!42490 () Bool)

(assert (=> b!42490 (= e!26917 (contains!554 (t!4090 Nil!1140) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!7717 res!25272) b!42489))

(assert (= (and b!42489 (not res!25271)) b!42490))

(assert (=> d!7717 m!36143))

(declare-fun m!36149 () Bool)

(assert (=> d!7717 m!36149))

(declare-fun m!36151 () Bool)

(assert (=> b!42490 m!36151))

(assert (=> b!42468 d!7717))

(declare-fun b!42523 () Bool)

(declare-fun e!26949 () Bool)

(declare-fun e!26948 () Bool)

(assert (=> b!42523 (= e!26949 e!26948)))

(declare-fun c!5363 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!42523 (= c!5363 (validKeyInArray!0 (select (arr!1354 lt!17673) #b00000000000000000000000000000000)))))

(declare-fun b!42524 () Bool)

(declare-fun call!3338 () Bool)

(assert (=> b!42524 (= e!26948 call!3338)))

(declare-fun b!42525 () Bool)

(declare-fun e!26947 () Bool)

(assert (=> b!42525 (= e!26948 e!26947)))

(declare-fun lt!17712 () (_ BitVec 64))

(assert (=> b!42525 (= lt!17712 (select (arr!1354 lt!17673) #b00000000000000000000000000000000))))

(declare-fun lt!17714 () Unit!1139)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2821 (_ BitVec 64) (_ BitVec 32)) Unit!1139)

(assert (=> b!42525 (= lt!17714 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!17673 lt!17712 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2821 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!42525 (arrayContainsKey!0 lt!17673 lt!17712 #b00000000000000000000000000000000)))

(declare-fun lt!17713 () Unit!1139)

(assert (=> b!42525 (= lt!17713 lt!17714)))

(declare-fun res!25295 () Bool)

(declare-datatypes ((SeekEntryResult!188 0))(
  ( (MissingZero!188 (index!2874 (_ BitVec 32))) (Found!188 (index!2875 (_ BitVec 32))) (Intermediate!188 (undefined!1000 Bool) (index!2876 (_ BitVec 32)) (x!8121 (_ BitVec 32))) (Undefined!188) (MissingVacant!188 (index!2877 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2821 (_ BitVec 32)) SeekEntryResult!188)

(assert (=> b!42525 (= res!25295 (= (seekEntryOrOpen!0 (select (arr!1354 lt!17673) #b00000000000000000000000000000000) lt!17673 mask!853) (Found!188 #b00000000000000000000000000000000)))))

(assert (=> b!42525 (=> (not res!25295) (not e!26947))))

(declare-fun bm!3335 () Bool)

(assert (=> bm!3335 (= call!3338 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!17673 mask!853))))

(declare-fun d!7719 () Bool)

(declare-fun res!25298 () Bool)

(assert (=> d!7719 (=> res!25298 e!26949)))

(assert (=> d!7719 (= res!25298 (bvsge #b00000000000000000000000000000000 (size!1527 lt!17673)))))

(assert (=> d!7719 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17673 mask!853) e!26949)))

(declare-fun b!42526 () Bool)

(assert (=> b!42526 (= e!26947 call!3338)))

(assert (= (and d!7719 (not res!25298)) b!42523))

(assert (= (and b!42523 c!5363) b!42525))

(assert (= (and b!42523 (not c!5363)) b!42524))

(assert (= (and b!42525 res!25295) b!42526))

(assert (= (or b!42526 b!42524) bm!3335))

(declare-fun m!36185 () Bool)

(assert (=> b!42523 m!36185))

(assert (=> b!42523 m!36185))

(declare-fun m!36187 () Bool)

(assert (=> b!42523 m!36187))

(assert (=> b!42525 m!36185))

(declare-fun m!36189 () Bool)

(assert (=> b!42525 m!36189))

(declare-fun m!36191 () Bool)

(assert (=> b!42525 m!36191))

(assert (=> b!42525 m!36185))

(declare-fun m!36193 () Bool)

(assert (=> b!42525 m!36193))

(declare-fun m!36195 () Bool)

(assert (=> bm!3335 m!36195))

(assert (=> b!42467 d!7719))

(declare-fun d!7731 () Bool)

(assert (=> d!7731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17673 mask!853)))

(declare-fun lt!17729 () Unit!1139)

(declare-fun choose!34 (array!2821 (_ BitVec 32) (_ BitVec 32)) Unit!1139)

(assert (=> d!7731 (= lt!17729 (choose!34 lt!17673 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!7731 (validMask!0 mask!853)))

(assert (=> d!7731 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17673 mask!853 #b00000000000000000000000000000000) lt!17729)))

(declare-fun bs!1876 () Bool)

(assert (= bs!1876 d!7731))

(assert (=> bs!1876 m!36117))

(declare-fun m!36211 () Bool)

(assert (=> bs!1876 m!36211))

(assert (=> bs!1876 m!36115))

(assert (=> b!42467 d!7731))

(declare-fun b!42559 () Bool)

(declare-fun e!26968 () (_ BitVec 32))

(assert (=> b!42559 (= e!26968 #b00000000000000000000000000000000)))

(declare-fun b!42560 () Bool)

(declare-fun e!26967 () (_ BitVec 32))

(declare-fun call!3347 () (_ BitVec 32))

(assert (=> b!42560 (= e!26967 (bvadd #b00000000000000000000000000000001 call!3347))))

(declare-fun d!7737 () Bool)

(declare-fun lt!17738 () (_ BitVec 32))

(assert (=> d!7737 (and (bvsge lt!17738 #b00000000000000000000000000000000) (bvsle lt!17738 (bvsub (size!1527 lt!17673) #b00000000000000000000000000000000)))))

(assert (=> d!7737 (= lt!17738 e!26968)))

(declare-fun c!5377 () Bool)

(assert (=> d!7737 (= c!5377 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7737 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1527 lt!17673)))))

(assert (=> d!7737 (= (arrayCountValidKeys!0 lt!17673 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17738)))

(declare-fun b!42561 () Bool)

(assert (=> b!42561 (= e!26968 e!26967)))

(declare-fun c!5378 () Bool)

(assert (=> b!42561 (= c!5378 (validKeyInArray!0 (select (arr!1354 lt!17673) #b00000000000000000000000000000000)))))

(declare-fun b!42562 () Bool)

(assert (=> b!42562 (= e!26967 call!3347)))

(declare-fun bm!3344 () Bool)

(assert (=> bm!3344 (= call!3347 (arrayCountValidKeys!0 lt!17673 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and d!7737 c!5377) b!42559))

(assert (= (and d!7737 (not c!5377)) b!42561))

(assert (= (and b!42561 c!5378) b!42560))

(assert (= (and b!42561 (not c!5378)) b!42562))

(assert (= (or b!42560 b!42562) bm!3344))

(assert (=> b!42561 m!36185))

(assert (=> b!42561 m!36185))

(assert (=> b!42561 m!36187))

(declare-fun m!36217 () Bool)

(assert (=> bm!3344 m!36217))

(assert (=> b!42467 d!7737))

(declare-fun d!7743 () Bool)

(assert (=> d!7743 (= (arrayCountValidKeys!0 lt!17673 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17746 () Unit!1139)

(declare-fun choose!59 (array!2821 (_ BitVec 32) (_ BitVec 32)) Unit!1139)

(assert (=> d!7743 (= lt!17746 (choose!59 lt!17673 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7743 (bvslt (size!1527 lt!17673) #b01111111111111111111111111111111)))

(assert (=> d!7743 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17673 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17746)))

(declare-fun bs!1879 () Bool)

(assert (= bs!1879 d!7743))

(assert (=> bs!1879 m!36121))

(declare-fun m!36221 () Bool)

(assert (=> bs!1879 m!36221))

(assert (=> b!42467 d!7743))

(declare-fun d!7747 () Bool)

(assert (=> d!7747 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6276 d!7747))

(check-sat (not bm!3335) (not bm!3344) (not b!42523) (not b!42525) (not b!42488) (not d!7743) (not d!7731) (not b!42490) (not b!42561) (not d!7711) (not d!7717))
(check-sat)
