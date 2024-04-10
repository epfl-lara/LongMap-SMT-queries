; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6278 () Bool)

(assert start!6278)

(declare-fun res!25259 () Bool)

(declare-fun e!26905 () Bool)

(assert (=> start!6278 (=> (not res!25259) (not e!26905))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6278 (= res!25259 (validMask!0 mask!853))))

(assert (=> start!6278 e!26905))

(assert (=> start!6278 true))

(declare-fun b!42476 () Bool)

(declare-fun e!26904 () Bool)

(assert (=> b!42476 (= e!26905 (not e!26904))))

(declare-fun res!25260 () Bool)

(assert (=> b!42476 (=> res!25260 e!26904)))

(assert (=> b!42476 (= res!25260 (or (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853))))))

(declare-datatypes ((array!2823 0))(
  ( (array!2824 (arr!1355 (Array (_ BitVec 32) (_ BitVec 64))) (size!1528 (_ BitVec 32))) )
))
(declare-fun lt!17684 () array!2823)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2823 (_ BitVec 32)) Bool)

(assert (=> b!42476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17684 mask!853)))

(declare-datatypes ((Unit!1141 0))(
  ( (Unit!1142) )
))
(declare-fun lt!17682 () Unit!1141)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2823 (_ BitVec 32) (_ BitVec 32)) Unit!1141)

(assert (=> b!42476 (= lt!17682 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17684 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2823 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42476 (= (arrayCountValidKeys!0 lt!17684 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17683 () Unit!1141)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2823 (_ BitVec 32) (_ BitVec 32)) Unit!1141)

(assert (=> b!42476 (= lt!17683 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17684 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42476 (= lt!17684 (array!2824 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!42477 () Bool)

(declare-fun e!26903 () Bool)

(assert (=> b!42477 (= e!26904 e!26903)))

(declare-fun res!25258 () Bool)

(assert (=> b!42477 (=> (not res!25258) (not e!26903))))

(declare-datatypes ((List!1144 0))(
  ( (Nil!1141) (Cons!1140 (h!1717 (_ BitVec 64)) (t!4091 List!1144)) )
))
(declare-fun contains!555 (List!1144 (_ BitVec 64)) Bool)

(assert (=> b!42477 (= res!25258 (not (contains!555 Nil!1141 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!42478 () Bool)

(assert (=> b!42478 (= e!26903 (not (contains!555 Nil!1141 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!6278 res!25259) b!42476))

(assert (= (and b!42476 (not res!25260)) b!42477))

(assert (= (and b!42477 res!25258) b!42478))

(declare-fun m!36129 () Bool)

(assert (=> start!6278 m!36129))

(declare-fun m!36131 () Bool)

(assert (=> b!42476 m!36131))

(declare-fun m!36133 () Bool)

(assert (=> b!42476 m!36133))

(declare-fun m!36135 () Bool)

(assert (=> b!42476 m!36135))

(declare-fun m!36137 () Bool)

(assert (=> b!42476 m!36137))

(declare-fun m!36139 () Bool)

(assert (=> b!42477 m!36139))

(declare-fun m!36141 () Bool)

(assert (=> b!42478 m!36141))

(push 1)

(assert (not b!42478))

(assert (not b!42477))

(assert (not b!42476))

(assert (not start!6278))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!7715 () Bool)

(declare-fun lt!17695 () Bool)

(declare-fun content!35 (List!1144) (Set (_ BitVec 64)))

(assert (=> d!7715 (= lt!17695 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!35 Nil!1141)))))

(declare-fun e!26927 () Bool)

(assert (=> d!7715 (= lt!17695 e!26927)))

(declare-fun res!25281 () Bool)

(assert (=> d!7715 (=> (not res!25281) (not e!26927))))

(assert (=> d!7715 (= res!25281 (is-Cons!1140 Nil!1141))))

(assert (=> d!7715 (= (contains!555 Nil!1141 #b1000000000000000000000000000000000000000000000000000000000000000) lt!17695)))

(declare-fun b!42499 () Bool)

(declare-fun e!26926 () Bool)

(assert (=> b!42499 (= e!26927 e!26926)))

(declare-fun res!25282 () Bool)

(assert (=> b!42499 (=> res!25282 e!26926)))

(assert (=> b!42499 (= res!25282 (= (h!1717 Nil!1141) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!42500 () Bool)

(assert (=> b!42500 (= e!26926 (contains!555 (t!4091 Nil!1141) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!7715 res!25281) b!42499))

(assert (= (and b!42499 (not res!25282)) b!42500))

(declare-fun m!36163 () Bool)

(assert (=> d!7715 m!36163))

(declare-fun m!36165 () Bool)

(assert (=> d!7715 m!36165))

(declare-fun m!36167 () Bool)

(assert (=> b!42500 m!36167))

(assert (=> b!42478 d!7715))

(declare-fun d!7725 () Bool)

(declare-fun lt!17696 () Bool)

(assert (=> d!7725 (= lt!17696 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!35 Nil!1141)))))

(declare-fun e!26929 () Bool)

(assert (=> d!7725 (= lt!17696 e!26929)))

(declare-fun res!25283 () Bool)

(assert (=> d!7725 (=> (not res!25283) (not e!26929))))

(assert (=> d!7725 (= res!25283 (is-Cons!1140 Nil!1141))))

(assert (=> d!7725 (= (contains!555 Nil!1141 #b0000000000000000000000000000000000000000000000000000000000000000) lt!17696)))

(declare-fun b!42501 () Bool)

(declare-fun e!26928 () Bool)

(assert (=> b!42501 (= e!26929 e!26928)))

(declare-fun res!25284 () Bool)

(assert (=> b!42501 (=> res!25284 e!26928)))

(assert (=> b!42501 (= res!25284 (= (h!1717 Nil!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!42502 () Bool)

(assert (=> b!42502 (= e!26928 (contains!555 (t!4091 Nil!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!7725 res!25283) b!42501))

(assert (= (and b!42501 (not res!25284)) b!42502))

(assert (=> d!7725 m!36163))

(declare-fun m!36169 () Bool)

(assert (=> d!7725 m!36169))

(declare-fun m!36171 () Bool)

(assert (=> b!42502 m!36171))

(assert (=> b!42477 d!7725))

(declare-fun bm!3338 () Bool)

(declare-fun call!3341 () Bool)

(assert (=> bm!3338 (= call!3341 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!17684 mask!853))))

(declare-fun b!42535 () Bool)

(declare-fun e!26956 () Bool)

(assert (=> b!42535 (= e!26956 call!3341)))

(declare-fun b!42536 () Bool)

(declare-fun e!26954 () Bool)

(assert (=> b!42536 (= e!26954 call!3341)))

(declare-fun b!42537 () Bool)

(declare-fun e!26955 () Bool)

(assert (=> b!42537 (= e!26955 e!26956)))

(declare-fun c!5366 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!42537 (= c!5366 (validKeyInArray!0 (select (arr!1355 lt!17684) #b00000000000000000000000000000000)))))

(declare-fun b!42538 () Bool)

(assert (=> b!42538 (= e!26956 e!26954)))

(declare-fun lt!17726 () (_ BitVec 64))

(assert (=> b!42538 (= lt!17726 (select (arr!1355 lt!17684) #b00000000000000000000000000000000))))

(declare-fun lt!17724 () Unit!1141)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2823 (_ BitVec 64) (_ BitVec 32)) Unit!1141)

(assert (=> b!42538 (= lt!17724 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!17684 lt!17726 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2823 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!42538 (arrayContainsKey!0 lt!17684 lt!17726 #b00000000000000000000000000000000)))

(declare-fun lt!17725 () Unit!1141)

(assert (=> b!42538 (= lt!17725 lt!17724)))

(declare-fun res!25301 () Bool)

(declare-datatypes ((SeekEntryResult!189 0))(
  ( (MissingZero!189 (index!2878 (_ BitVec 32))) (Found!189 (index!2879 (_ BitVec 32))) (Intermediate!189 (undefined!1001 Bool) (index!2880 (_ BitVec 32)) (x!8122 (_ BitVec 32))) (Undefined!189) (MissingVacant!189 (index!2881 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2823 (_ BitVec 32)) SeekEntryResult!189)

(assert (=> b!42538 (= res!25301 (= (seekEntryOrOpen!0 (select (arr!1355 lt!17684) #b00000000000000000000000000000000) lt!17684 mask!853) (Found!189 #b00000000000000000000000000000000)))))

(assert (=> b!42538 (=> (not res!25301) (not e!26954))))

(declare-fun d!7727 () Bool)

(declare-fun res!25302 () Bool)

(assert (=> d!7727 (=> res!25302 e!26955)))

(assert (=> d!7727 (= res!25302 (bvsge #b00000000000000000000000000000000 (size!1528 lt!17684)))))

(assert (=> d!7727 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17684 mask!853) e!26955)))

(assert (= (and d!7727 (not res!25302)) b!42537))

(assert (= (and b!42537 c!5366) b!42538))

(assert (= (and b!42537 (not c!5366)) b!42535))

(assert (= (and b!42538 res!25301) b!42536))

(assert (= (or b!42536 b!42535) bm!3338))

(declare-fun m!36199 () Bool)

(assert (=> bm!3338 m!36199))

(declare-fun m!36201 () Bool)

(assert (=> b!42537 m!36201))

(assert (=> b!42537 m!36201))

(declare-fun m!36203 () Bool)

(assert (=> b!42537 m!36203))

(assert (=> b!42538 m!36201))

(declare-fun m!36205 () Bool)

(assert (=> b!42538 m!36205))

(declare-fun m!36207 () Bool)

(assert (=> b!42538 m!36207))

(assert (=> b!42538 m!36201))

(declare-fun m!36209 () Bool)

(assert (=> b!42538 m!36209))

(assert (=> b!42476 d!7727))

(declare-fun d!7735 () Bool)

(assert (=> d!7735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17684 mask!853)))

(declare-fun lt!17734 () Unit!1141)

(declare-fun choose!34 (array!2823 (_ BitVec 32) (_ BitVec 32)) Unit!1141)

(assert (=> d!7735 (= lt!17734 (choose!34 lt!17684 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!7735 (validMask!0 mask!853)))

(assert (=> d!7735 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17684 mask!853 #b00000000000000000000000000000000) lt!17734)))

(declare-fun bs!1877 () Bool)

(assert (= bs!1877 d!7735))

(assert (=> bs!1877 m!36131))

(declare-fun m!36213 () Bool)

(assert (=> bs!1877 m!36213))

(assert (=> bs!1877 m!36129))

(assert (=> b!42476 d!7735))

(declare-fun b!42571 () Bool)

(declare-fun e!26974 () (_ BitVec 32))

(declare-fun e!26973 () (_ BitVec 32))

(assert (=> b!42571 (= e!26974 e!26973)))

(declare-fun c!5384 () Bool)

(assert (=> b!42571 (= c!5384 (validKeyInArray!0 (select (arr!1355 lt!17684) #b00000000000000000000000000000000)))))

(declare-fun d!7739 () Bool)

(declare-fun lt!17747 () (_ BitVec 32))

(assert (=> d!7739 (and (bvsge lt!17747 #b00000000000000000000000000000000) (bvsle lt!17747 (bvsub (size!1528 lt!17684) #b00000000000000000000000000000000)))))

(assert (=> d!7739 (= lt!17747 e!26974)))

(declare-fun c!5383 () Bool)

(assert (=> d!7739 (= c!5383 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7739 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1528 lt!17684)))))

(assert (=> d!7739 (= (arrayCountValidKeys!0 lt!17684 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17747)))

(declare-fun b!42572 () Bool)

(declare-fun call!3350 () (_ BitVec 32))

(assert (=> b!42572 (= e!26973 (bvadd #b00000000000000000000000000000001 call!3350))))

(declare-fun b!42573 () Bool)

(assert (=> b!42573 (= e!26974 