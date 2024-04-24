; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6320 () Bool)

(assert start!6320)

(declare-fun res!25289 () Bool)

(declare-fun e!26942 () Bool)

(assert (=> start!6320 (=> (not res!25289) (not e!26942))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6320 (= res!25289 (validMask!0 mask!853))))

(assert (=> start!6320 e!26942))

(assert (=> start!6320 true))

(declare-fun b!42527 () Bool)

(declare-fun res!25287 () Bool)

(declare-fun e!26943 () Bool)

(assert (=> b!42527 (=> res!25287 e!26943)))

(declare-datatypes ((List!1131 0))(
  ( (Nil!1128) (Cons!1127 (h!1704 (_ BitVec 64)) (t!4078 List!1131)) )
))
(declare-fun contains!547 (List!1131 (_ BitVec 64)) Bool)

(assert (=> b!42527 (= res!25287 (contains!547 Nil!1128 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!42528 () Bool)

(declare-fun res!25288 () Bool)

(assert (=> b!42528 (=> res!25288 e!26943)))

(assert (=> b!42528 (= res!25288 (contains!547 Nil!1128 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!42526 () Bool)

(assert (=> b!42526 (= e!26942 (not e!26943))))

(declare-fun res!25286 () Bool)

(assert (=> b!42526 (=> res!25286 e!26943)))

(assert (=> b!42526 (= res!25286 (or (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853))))))

(declare-datatypes ((array!2811 0))(
  ( (array!2812 (arr!1349 (Array (_ BitVec 32) (_ BitVec 64))) (size!1525 (_ BitVec 32))) )
))
(declare-fun lt!17716 () array!2811)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2811 (_ BitVec 32)) Bool)

(assert (=> b!42526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17716 mask!853)))

(declare-datatypes ((Unit!1155 0))(
  ( (Unit!1156) )
))
(declare-fun lt!17714 () Unit!1155)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2811 (_ BitVec 32) (_ BitVec 32)) Unit!1155)

(assert (=> b!42526 (= lt!17714 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17716 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2811 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42526 (= (arrayCountValidKeys!0 lt!17716 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17715 () Unit!1155)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2811 (_ BitVec 32) (_ BitVec 32)) Unit!1155)

(assert (=> b!42526 (= lt!17715 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17716 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42526 (= lt!17716 (array!2812 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!42529 () Bool)

(declare-fun noDuplicate!30 (List!1131) Bool)

(assert (=> b!42529 (= e!26943 (noDuplicate!30 Nil!1128))))

(assert (= (and start!6320 res!25289) b!42526))

(assert (= (and b!42526 (not res!25286)) b!42527))

(assert (= (and b!42527 (not res!25287)) b!42528))

(assert (= (and b!42528 (not res!25288)) b!42529))

(declare-fun m!36103 () Bool)

(assert (=> b!42529 m!36103))

(declare-fun m!36105 () Bool)

(assert (=> start!6320 m!36105))

(declare-fun m!36107 () Bool)

(assert (=> b!42528 m!36107))

(declare-fun m!36109 () Bool)

(assert (=> b!42526 m!36109))

(declare-fun m!36111 () Bool)

(assert (=> b!42526 m!36111))

(declare-fun m!36113 () Bool)

(assert (=> b!42526 m!36113))

(declare-fun m!36115 () Bool)

(assert (=> b!42526 m!36115))

(declare-fun m!36117 () Bool)

(assert (=> b!42527 m!36117))

(check-sat (not b!42527) (not start!6320) (not b!42528) (not b!42529) (not b!42526))
(check-sat)
(get-model)

(declare-fun d!7741 () Bool)

(declare-fun lt!17737 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!37 (List!1131) (InoxSet (_ BitVec 64)))

(assert (=> d!7741 (= lt!17737 (select (content!37 Nil!1128) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!26960 () Bool)

(assert (=> d!7741 (= lt!17737 e!26960)))

(declare-fun res!25319 () Bool)

(assert (=> d!7741 (=> (not res!25319) (not e!26960))))

(get-info :version)

(assert (=> d!7741 (= res!25319 ((_ is Cons!1127) Nil!1128))))

(assert (=> d!7741 (= (contains!547 Nil!1128 #b1000000000000000000000000000000000000000000000000000000000000000) lt!17737)))

(declare-fun b!42558 () Bool)

(declare-fun e!26961 () Bool)

(assert (=> b!42558 (= e!26960 e!26961)))

(declare-fun res!25318 () Bool)

(assert (=> b!42558 (=> res!25318 e!26961)))

(assert (=> b!42558 (= res!25318 (= (h!1704 Nil!1128) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!42559 () Bool)

(assert (=> b!42559 (= e!26961 (contains!547 (t!4078 Nil!1128) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!7741 res!25319) b!42558))

(assert (= (and b!42558 (not res!25318)) b!42559))

(declare-fun m!36151 () Bool)

(assert (=> d!7741 m!36151))

(declare-fun m!36153 () Bool)

(assert (=> d!7741 m!36153))

(declare-fun m!36155 () Bool)

(assert (=> b!42559 m!36155))

(assert (=> b!42528 d!7741))

(declare-fun d!7747 () Bool)

(assert (=> d!7747 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6320 d!7747))

(declare-fun d!7753 () Bool)

(declare-fun lt!17747 () Bool)

(assert (=> d!7753 (= lt!17747 (select (content!37 Nil!1128) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!26971 () Bool)

(assert (=> d!7753 (= lt!17747 e!26971)))

(declare-fun res!25327 () Bool)

(assert (=> d!7753 (=> (not res!25327) (not e!26971))))

(assert (=> d!7753 (= res!25327 ((_ is Cons!1127) Nil!1128))))

(assert (=> d!7753 (= (contains!547 Nil!1128 #b0000000000000000000000000000000000000000000000000000000000000000) lt!17747)))

(declare-fun b!42572 () Bool)

(declare-fun e!26972 () Bool)

(assert (=> b!42572 (= e!26971 e!26972)))

(declare-fun res!25326 () Bool)

(assert (=> b!42572 (=> res!25326 e!26972)))

(assert (=> b!42572 (= res!25326 (= (h!1704 Nil!1128) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!42573 () Bool)

(assert (=> b!42573 (= e!26972 (contains!547 (t!4078 Nil!1128) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!7753 res!25327) b!42572))

(assert (= (and b!42572 (not res!25326)) b!42573))

(assert (=> d!7753 m!36151))

(declare-fun m!36169 () Bool)

(assert (=> d!7753 m!36169))

(declare-fun m!36171 () Bool)

(assert (=> b!42573 m!36171))

(assert (=> b!42527 d!7753))

(declare-fun b!42608 () Bool)

(declare-fun e!26997 () Bool)

(declare-fun call!3347 () Bool)

(assert (=> b!42608 (= e!26997 call!3347)))

(declare-fun bm!3344 () Bool)

(assert (=> bm!3344 (= call!3347 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!17716 mask!853))))

(declare-fun d!7755 () Bool)

(declare-fun res!25343 () Bool)

(declare-fun e!26998 () Bool)

(assert (=> d!7755 (=> res!25343 e!26998)))

(assert (=> d!7755 (= res!25343 (bvsge #b00000000000000000000000000000000 (size!1525 lt!17716)))))

(assert (=> d!7755 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17716 mask!853) e!26998)))

(declare-fun b!42609 () Bool)

(declare-fun e!26999 () Bool)

(assert (=> b!42609 (= e!26999 e!26997)))

(declare-fun lt!17770 () (_ BitVec 64))

(assert (=> b!42609 (= lt!17770 (select (arr!1349 lt!17716) #b00000000000000000000000000000000))))

(declare-fun lt!17771 () Unit!1155)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2811 (_ BitVec 64) (_ BitVec 32)) Unit!1155)

(assert (=> b!42609 (= lt!17771 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!17716 lt!17770 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2811 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!42609 (arrayContainsKey!0 lt!17716 lt!17770 #b00000000000000000000000000000000)))

(declare-fun lt!17769 () Unit!1155)

(assert (=> b!42609 (= lt!17769 lt!17771)))

(declare-fun res!25342 () Bool)

(declare-datatypes ((SeekEntryResult!185 0))(
  ( (MissingZero!185 (index!2862 (_ BitVec 32))) (Found!185 (index!2863 (_ BitVec 32))) (Intermediate!185 (undefined!997 Bool) (index!2864 (_ BitVec 32)) (x!8126 (_ BitVec 32))) (Undefined!185) (MissingVacant!185 (index!2865 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2811 (_ BitVec 32)) SeekEntryResult!185)

(assert (=> b!42609 (= res!25342 (= (seekEntryOrOpen!0 (select (arr!1349 lt!17716) #b00000000000000000000000000000000) lt!17716 mask!853) (Found!185 #b00000000000000000000000000000000)))))

(assert (=> b!42609 (=> (not res!25342) (not e!26997))))

(declare-fun b!42610 () Bool)

(assert (=> b!42610 (= e!26999 call!3347)))

(declare-fun b!42611 () Bool)

(assert (=> b!42611 (= e!26998 e!26999)))

(declare-fun c!5382 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!42611 (= c!5382 (validKeyInArray!0 (select (arr!1349 lt!17716) #b00000000000000000000000000000000)))))

(assert (= (and d!7755 (not res!25343)) b!42611))

(assert (= (and b!42611 c!5382) b!42609))

(assert (= (and b!42611 (not c!5382)) b!42610))

(assert (= (and b!42609 res!25342) b!42608))

(assert (= (or b!42608 b!42610) bm!3344))

(declare-fun m!36183 () Bool)

(assert (=> bm!3344 m!36183))

(declare-fun m!36185 () Bool)

(assert (=> b!42609 m!36185))

(declare-fun m!36187 () Bool)

(assert (=> b!42609 m!36187))

(declare-fun m!36189 () Bool)

(assert (=> b!42609 m!36189))

(assert (=> b!42609 m!36185))

(declare-fun m!36191 () Bool)

(assert (=> b!42609 m!36191))

(assert (=> b!42611 m!36185))

(assert (=> b!42611 m!36185))

(declare-fun m!36193 () Bool)

(assert (=> b!42611 m!36193))

(assert (=> b!42526 d!7755))

(declare-fun d!7763 () Bool)

(assert (=> d!7763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17716 mask!853)))

(declare-fun lt!17780 () Unit!1155)

(declare-fun choose!34 (array!2811 (_ BitVec 32) (_ BitVec 32)) Unit!1155)

(assert (=> d!7763 (= lt!17780 (choose!34 lt!17716 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!7763 (validMask!0 mask!853)))

(assert (=> d!7763 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17716 mask!853 #b00000000000000000000000000000000) lt!17780)))

(declare-fun bs!1886 () Bool)

(assert (= bs!1886 d!7763))

(assert (=> bs!1886 m!36109))

(declare-fun m!36213 () Bool)

(assert (=> bs!1886 m!36213))

(assert (=> bs!1886 m!36105))

(assert (=> b!42526 d!7763))

(declare-fun d!7771 () Bool)

(declare-fun lt!17792 () (_ BitVec 32))

(assert (=> d!7771 (and (bvsge lt!17792 #b00000000000000000000000000000000) (bvsle lt!17792 (bvsub (size!1525 lt!17716) #b00000000000000000000000000000000)))))

(declare-fun e!27026 () (_ BitVec 32))

(assert (=> d!7771 (= lt!17792 e!27026)))

(declare-fun c!5393 () Bool)

(assert (=> d!7771 (= c!5393 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7771 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1525 lt!17716)))))

(assert (=> d!7771 (= (arrayCountValidKeys!0 lt!17716 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17792)))

(declare-fun bm!3350 () Bool)

(declare-fun call!3353 () (_ BitVec 32))

(assert (=> bm!3350 (= call!3353 (arrayCountValidKeys!0 lt!17716 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!42646 () Bool)

(declare-fun e!27025 () (_ BitVec 32))

(assert (=> b!42646 (= e!27025 (bvadd #b00000000000000000000000000000001 call!3353))))

(declare-fun b!42647 () Bool)

(assert (=> b!42647 (= e!27025 call!3353)))

(declare-fun b!42648 () Bool)

(assert (=> b!42648 (= e!27026 e!27025)))

(declare-fun c!5392 () Bool)

(assert (=> b!42648 (= c!5392 (validKeyInArray!0 (select (arr!1349 lt!17716) #b00000000000000000000000000000000)))))

(declare-fun b!42649 () Bool)

(assert (=> b!42649 (= e!27026 #b00000000000000000000000000000000)))

(assert (= (and d!7771 c!5393) b!42649))

(assert (= (and d!7771 (not c!5393)) b!42648))

(assert (= (and b!42648 c!5392) b!42646))

(assert (= (and b!42648 (not c!5392)) b!42647))

(assert (= (or b!42646 b!42647) bm!3350))

(declare-fun m!36227 () Bool)

(assert (=> bm!3350 m!36227))

(assert (=> b!42648 m!36185))

(assert (=> b!42648 m!36185))

(assert (=> b!42648 m!36193))

(assert (=> b!42526 d!7771))

(declare-fun d!7779 () Bool)

(assert (=> d!7779 (= (arrayCountValidKeys!0 lt!17716 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17796 () Unit!1155)

(declare-fun choose!59 (array!2811 (_ BitVec 32) (_ BitVec 32)) Unit!1155)

(assert (=> d!7779 (= lt!17796 (choose!59 lt!17716 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7779 (bvslt (size!1525 lt!17716) #b01111111111111111111111111111111)))

(assert (=> d!7779 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17716 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17796)))

(declare-fun bs!1888 () Bool)

(assert (= bs!1888 d!7779))

(assert (=> bs!1888 m!36113))

(declare-fun m!36231 () Bool)

(assert (=> bs!1888 m!36231))

(assert (=> b!42526 d!7779))

(declare-fun d!7783 () Bool)

(declare-fun res!25364 () Bool)

(declare-fun e!27033 () Bool)

(assert (=> d!7783 (=> res!25364 e!27033)))

(assert (=> d!7783 (= res!25364 ((_ is Nil!1128) Nil!1128))))

(assert (=> d!7783 (= (noDuplicate!30 Nil!1128) e!27033)))

(declare-fun b!42658 () Bool)

(declare-fun e!27034 () Bool)

(assert (=> b!42658 (= e!27033 e!27034)))

(declare-fun res!25365 () Bool)

(assert (=> b!42658 (=> (not res!25365) (not e!27034))))

(assert (=> b!42658 (= res!25365 (not (contains!547 (t!4078 Nil!1128) (h!1704 Nil!1128))))))

(declare-fun b!42659 () Bool)

(assert (=> b!42659 (= e!27034 (noDuplicate!30 (t!4078 Nil!1128)))))

(assert (= (and d!7783 (not res!25364)) b!42658))

(assert (= (and b!42658 res!25365) b!42659))

(declare-fun m!36235 () Bool)

(assert (=> b!42658 m!36235))

(declare-fun m!36237 () Bool)

(assert (=> b!42659 m!36237))

(assert (=> b!42529 d!7783))

(check-sat (not b!42648) (not b!42573) (not b!42659) (not b!42609) (not b!42611) (not bm!3350) (not b!42559) (not d!7741) (not d!7763) (not d!7753) (not d!7779) (not bm!3344) (not b!42658))
(check-sat)
