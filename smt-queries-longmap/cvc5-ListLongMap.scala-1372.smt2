; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27030 () Bool)

(assert start!27030)

(declare-fun b!279551 () Bool)

(declare-fun res!142710 () Bool)

(declare-fun e!178226 () Bool)

(assert (=> b!279551 (=> (not res!142710) (not e!178226))))

(declare-datatypes ((array!13899 0))(
  ( (array!13900 (arr!6593 (Array (_ BitVec 32) (_ BitVec 64))) (size!6945 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13899)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!279551 (= res!142710 (validKeyInArray!0 (select (arr!6593 a!3325) startIndex!26)))))

(declare-fun b!279552 () Bool)

(declare-fun k!2581 () (_ BitVec 64))

(declare-datatypes ((List!4401 0))(
  ( (Nil!4398) (Cons!4397 (h!5067 (_ BitVec 64)) (t!9483 List!4401)) )
))
(declare-fun contains!1973 (List!4401 (_ BitVec 64)) Bool)

(assert (=> b!279552 (= e!178226 (contains!1973 Nil!4398 k!2581))))

(declare-fun b!279553 () Bool)

(declare-fun res!142722 () Bool)

(declare-fun e!178224 () Bool)

(assert (=> b!279553 (=> (not res!142722) (not e!178224))))

(declare-fun arrayContainsKey!0 (array!13899 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!279553 (= res!142722 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!279554 () Bool)

(assert (=> b!279554 (= e!178224 e!178226)))

(declare-fun res!142715 () Bool)

(assert (=> b!279554 (=> (not res!142715) (not e!178226))))

(declare-datatypes ((SeekEntryResult!1751 0))(
  ( (MissingZero!1751 (index!9174 (_ BitVec 32))) (Found!1751 (index!9175 (_ BitVec 32))) (Intermediate!1751 (undefined!2563 Bool) (index!9176 (_ BitVec 32)) (x!27421 (_ BitVec 32))) (Undefined!1751) (MissingVacant!1751 (index!9177 (_ BitVec 32))) )
))
(declare-fun lt!138658 () SeekEntryResult!1751)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!279554 (= res!142715 (or (= lt!138658 (MissingZero!1751 i!1267)) (= lt!138658 (MissingVacant!1751 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13899 (_ BitVec 32)) SeekEntryResult!1751)

(assert (=> b!279554 (= lt!138658 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!279555 () Bool)

(declare-fun res!142711 () Bool)

(assert (=> b!279555 (=> (not res!142711) (not e!178224))))

(assert (=> b!279555 (= res!142711 (validKeyInArray!0 k!2581))))

(declare-fun b!279556 () Bool)

(declare-fun res!142712 () Bool)

(assert (=> b!279556 (=> (not res!142712) (not e!178226))))

(assert (=> b!279556 (= res!142712 (not (contains!1973 Nil!4398 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!279557 () Bool)

(declare-fun res!142719 () Bool)

(assert (=> b!279557 (=> (not res!142719) (not e!178226))))

(assert (=> b!279557 (= res!142719 (and (bvslt (size!6945 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6945 a!3325))))))

(declare-fun res!142721 () Bool)

(assert (=> start!27030 (=> (not res!142721) (not e!178224))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27030 (= res!142721 (validMask!0 mask!3868))))

(assert (=> start!27030 e!178224))

(declare-fun array_inv!4556 (array!13899) Bool)

(assert (=> start!27030 (array_inv!4556 a!3325)))

(assert (=> start!27030 true))

(declare-fun b!279558 () Bool)

(declare-fun res!142716 () Bool)

(assert (=> b!279558 (=> (not res!142716) (not e!178226))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13899 (_ BitVec 32)) Bool)

(assert (=> b!279558 (= res!142716 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!279559 () Bool)

(declare-fun res!142720 () Bool)

(assert (=> b!279559 (=> (not res!142720) (not e!178226))))

(assert (=> b!279559 (= res!142720 (not (contains!1973 Nil!4398 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!279560 () Bool)

(declare-fun res!142713 () Bool)

(assert (=> b!279560 (=> (not res!142713) (not e!178226))))

(assert (=> b!279560 (= res!142713 (not (= startIndex!26 i!1267)))))

(declare-fun b!279561 () Bool)

(declare-fun res!142718 () Bool)

(assert (=> b!279561 (=> (not res!142718) (not e!178224))))

(assert (=> b!279561 (= res!142718 (and (= (size!6945 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6945 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6945 a!3325))))))

(declare-fun b!279562 () Bool)

(declare-fun res!142714 () Bool)

(assert (=> b!279562 (=> (not res!142714) (not e!178226))))

(declare-fun noDuplicate!155 (List!4401) Bool)

(assert (=> b!279562 (= res!142714 (noDuplicate!155 Nil!4398))))

(declare-fun b!279563 () Bool)

(declare-fun res!142717 () Bool)

(assert (=> b!279563 (=> (not res!142717) (not e!178224))))

(declare-fun arrayNoDuplicates!0 (array!13899 (_ BitVec 32) List!4401) Bool)

(assert (=> b!279563 (= res!142717 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4398))))

(assert (= (and start!27030 res!142721) b!279561))

(assert (= (and b!279561 res!142718) b!279555))

(assert (= (and b!279555 res!142711) b!279563))

(assert (= (and b!279563 res!142717) b!279553))

(assert (= (and b!279553 res!142722) b!279554))

(assert (= (and b!279554 res!142715) b!279558))

(assert (= (and b!279558 res!142716) b!279560))

(assert (= (and b!279560 res!142713) b!279551))

(assert (= (and b!279551 res!142710) b!279557))

(assert (= (and b!279557 res!142719) b!279562))

(assert (= (and b!279562 res!142714) b!279559))

(assert (= (and b!279559 res!142720) b!279556))

(assert (= (and b!279556 res!142712) b!279552))

(declare-fun m!294261 () Bool)

(assert (=> b!279563 m!294261))

(declare-fun m!294263 () Bool)

(assert (=> start!27030 m!294263))

(declare-fun m!294265 () Bool)

(assert (=> start!27030 m!294265))

(declare-fun m!294267 () Bool)

(assert (=> b!279556 m!294267))

(declare-fun m!294269 () Bool)

(assert (=> b!279559 m!294269))

(declare-fun m!294271 () Bool)

(assert (=> b!279558 m!294271))

(declare-fun m!294273 () Bool)

(assert (=> b!279562 m!294273))

(declare-fun m!294275 () Bool)

(assert (=> b!279552 m!294275))

(declare-fun m!294277 () Bool)

(assert (=> b!279555 m!294277))

(declare-fun m!294279 () Bool)

(assert (=> b!279551 m!294279))

(assert (=> b!279551 m!294279))

(declare-fun m!294281 () Bool)

(assert (=> b!279551 m!294281))

(declare-fun m!294283 () Bool)

(assert (=> b!279554 m!294283))

(declare-fun m!294285 () Bool)

(assert (=> b!279553 m!294285))

(push 1)

(assert (not b!279556))

(assert (not start!27030))

(assert (not b!279563))

(assert (not b!279559))

(assert (not b!279552))

(assert (not b!279558))

(assert (not b!279562))

(assert (not b!279551))

(assert (not b!279553))

(assert (not b!279555))

(assert (not b!279554))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!65111 () Bool)

(declare-fun res!142805 () Bool)

(declare-fun e!178255 () Bool)

(assert (=> d!65111 (=> res!142805 e!178255)))

(assert (=> d!65111 (= res!142805 (= (select (arr!6593 a!3325) #b00000000000000000000000000000000) k!2581))))

(assert (=> d!65111 (= (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000) e!178255)))

(declare-fun b!279658 () Bool)

(declare-fun e!178256 () Bool)

(assert (=> b!279658 (= e!178255 e!178256)))

(declare-fun res!142806 () Bool)

(assert (=> b!279658 (=> (not res!142806) (not e!178256))))

(assert (=> b!279658 (= res!142806 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6945 a!3325)))))

(declare-fun b!279659 () Bool)

(assert (=> b!279659 (= e!178256 (arrayContainsKey!0 a!3325 k!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65111 (not res!142805)) b!279658))

(assert (= (and b!279658 res!142806) b!279659))

(declare-fun m!294339 () Bool)

(assert (=> d!65111 m!294339))

(declare-fun m!294341 () Bool)

(assert (=> b!279659 m!294341))

(assert (=> b!279553 d!65111))

(declare-fun d!65113 () Bool)

(assert (=> d!65113 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!27030 d!65113))

(declare-fun d!65121 () Bool)

(assert (=> d!65121 (= (array_inv!4556 a!3325) (bvsge (size!6945 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!27030 d!65121))

(declare-fun b!279714 () Bool)

(declare-fun e!178295 () Bool)

(declare-fun e!178296 () Bool)

(assert (=> b!279714 (= e!178295 e!178296)))

(declare-fun c!45996 () Bool)

(assert (=> b!279714 (= c!45996 (validKeyInArray!0 (select (arr!6593 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!279715 () Bool)

(declare-fun e!178294 () Bool)

(assert (=> b!279715 (= e!178294 (contains!1973 Nil!4398 (select (arr!6593 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!279716 () Bool)

(declare-fun call!25447 () Bool)

(assert (=> b!279716 (= e!178296 call!25447)))

(declare-fun b!279717 () Bool)

(declare-fun e!178297 () Bool)

(assert (=> b!279717 (= e!178297 e!178295)))

(declare-fun res!142827 () Bool)

(assert (=> b!279717 (=> (not res!142827) (not e!178295))))

(assert (=> b!279717 (= res!142827 (not e!178294))))

(declare-fun res!142829 () Bool)

(assert (=> b!279717 (=> (not res!142829) (not e!178294))))

(assert (=> b!279717 (= res!142829 (validKeyInArray!0 (select (arr!6593 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!279718 () Bool)

(assert (=> b!279718 (= e!178296 call!25447)))

(declare-fun d!65123 () Bool)

(declare-fun res!142828 () Bool)

(assert (=> d!65123 (=> res!142828 e!178297)))

(assert (=> d!65123 (= res!142828 (bvsge #b00000000000000000000000000000000 (size!6945 a!3325)))))

(assert (=> d!65123 (= (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4398) e!178297)))

(declare-fun bm!25444 () Bool)

(assert (=> bm!25444 (= call!25447 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!45996 (Cons!4397 (select (arr!6593 a!3325) #b00000000000000000000000000000000) Nil!4398) Nil!4398)))))

(assert (= (and d!65123 (not res!142828)) b!279717))

(assert (= (and b!279717 res!142829) b!279715))

(assert (= (and b!279717 res!142827) b!279714))

(assert (= (and b!279714 c!45996) b!279718))

(assert (= (and b!279714 (not c!45996)) b!279716))

(assert (= (or b!279718 b!279716) bm!25444))

(assert (=> b!279714 m!294339))

(assert (=> b!279714 m!294339))

(declare-fun m!294393 () Bool)

(assert (=> b!279714 m!294393))

(assert (=> b!279715 m!294339))

(assert (=> b!279715 m!294339))

(declare-fun m!294395 () Bool)

(assert (=> b!279715 m!294395))

(assert (=> b!279717 m!294339))

(assert (=> b!279717 m!294339))

(assert (=> b!279717 m!294393))

(assert (=> bm!25444 m!294339))

(declare-fun m!294397 () Bool)

(assert (=> bm!25444 m!294397))

(assert (=> b!279563 d!65123))

(declare-fun b!279748 () Bool)

(declare-fun e!178324 () Bool)

(declare-fun call!25453 () Bool)

(assert (=> b!279748 (= e!178324 call!25453)))

(declare-fun b!279749 () Bool)

(declare-fun e!178322 () Bool)

(assert (=> b!279749 (= e!178322 e!178324)))

(declare-fun lt!138703 () (_ BitVec 64))

(assert (=> b!279749 (= lt!138703 (select (arr!6593 a!3325) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!8820 0))(
  ( (Unit!8821) )
))
(declare-fun lt!138702 () Unit!8820)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!13899 (_ BitVec 64) (_ BitVec 32)) Unit!8820)

(assert (=> b!279749 (= lt!138702 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!138703 #b00000000000000000000000000000000))))

(assert (=> b!279749 (arrayContainsKey!0 a!3325 lt!138703 #b00000000000000000000000000000000)))

(declare-fun lt!138704 () Unit!8820)

(assert (=> b!279749 (= lt!138704 lt!138702)))

(declare-fun res!142849 () Bool)

(assert (=> b!279749 (= res!142849 (= (seekEntryOrOpen!0 (select (arr!6593 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) (Found!1751 #b00000000000000000000000000000000)))))

(assert (=> b!279749 (=> (not res!142849) (not e!178324))))

(declare-fun bm!25450 () Bool)

(assert (=> bm!25450 (= call!25453 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun d!65129 () Bool)

(declare-fun res!142850 () Bool)

(declare-fun e!178323 () Bool)

(assert (=> d!65129 (=> res!142850 e!178323)))

(assert (=> d!65129 (= res!142850 (bvsge #b00000000000000000000000000000000 (size!6945 a!3325)))))

(assert (=> d!65129 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868) e!178323)))

(declare-fun b!279750 () Bool)

(assert (=> b!279750 (= e!178322 call!25453)))

(declare-fun b!279751 () Bool)

(assert (=> b!279751 (= e!178323 e!178322)))

(declare-fun c!46002 () Bool)

(assert (=> b!279751 (= c!46002 (validKeyInArray!0 (select (arr!6593 a!3325) #b00000000000000000000000000000000)))))

(assert (= (and d!65129 (not res!142850)) b!279751))

(assert (= (and b!279751 c!46002) b!279749))

(assert (= (and b!279751 (not c!46002)) b!279750))

(assert (= (and b!279749 res!142849) b!279748))

(assert (= (or b!279748 b!279750) bm!25450))

(assert (=> b!279749 m!294339))

(declare-fun m!294409 () Bool)

(assert (=> b!279749 m!294409))

(declare-fun m!294411 () Bool)

(assert (=> b!279749 m!294411))

(assert (=> b!279749 m!294339))

(declare-fun m!294413 () Bool)

(assert (=> b!279749 m!294413))

(declare-fun m!294415 () Bool)

(assert (=> bm!25450 m!294415))

(assert (=> b!279751 m!294339))

(assert (=> b!279751 m!294339))

(assert (=> b!279751 m!294393))

(assert (=> b!279558 d!65129))

(declare-fun d!65139 () Bool)

(declare-fun lt!138712 () Bool)

(declare-fun content!190 (List!4401) (Set (_ BitVec 64)))

(assert (=> d!65139 (= lt!138712 (set.member k!2581 (content!190 Nil!4398)))))

(declare-fun e!178343 () Bool)

(assert (=> d!65139 (= lt!138712 e!178343)))

(declare-fun res!142870 () Bool)

(assert (=> d!65139 (=> (not res!142870) (not e!178343))))

(assert (=> d!65139 (= res!142870 (is-Cons!4397 Nil!4398))))

(assert (=> d!65139 (= (contains!1973 Nil!4398 k!2581) lt!138712)))

(declare-fun b!279770 () Bool)

(declare-fun e!178344 () Bool)

(assert (=> b!279770 (= e!178343 e!178344)))

(declare-fun res!142869 () Bool)

(assert (=> b!279770 (=> res!142869 e!178344)))

(assert (=> b!279770 (= res!142869 (= (h!5067 Nil!4398) k!2581))))

(declare-fun b!279771 () Bool)

(assert (=> b!279771 (= e!178344 (contains!1973 (t!9483 Nil!4398) k!2581))))

(assert (= (and d!65139 res!142870) b!279770))

(assert (= (and b!279770 (not res!142869)) b!279771))

(declare-fun m!294431 () Bool)

(assert (=> d!65139 m!294431))

(declare-fun m!294433 () Bool)

(assert (=> d!65139 m!294433))

(declare-fun m!294435 () Bool)

(assert (=> b!279771 m!294435))

(assert (=> b!279552 d!65139))

(declare-fun d!65151 () Bool)

(assert (=> d!65151 (= (validKeyInArray!0 (select (arr!6593 a!3325) startIndex!26)) (and (not (= (select (arr!6593 a!3325) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6593 a!3325) startIndex!26) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!279551 d!65151))

(declare-fun d!65155 () Bool)

(declare-fun res!142877 () Bool)

(declare-fun e!178351 () Bool)

(assert (=> d!65155 (=> res!142877 e!178351)))

(assert (=> d!65155 (= res!142877 (is-Nil!4398 Nil!4398))))

(assert (=> d!65155 (= (noDuplicate!155 Nil!4398) e!178351)))

(declare-fun b!279778 () Bool)

(declare-fun e!178352 () Bool)

(assert (=> b!279778 (= e!178351 e!178352)))

(declare-fun res!142878 () Bool)

(assert (=> b!279778 (=> (not res!142878) (not e!178352))))

(assert (=> b!279778 (= res!142878 (not (contains!1973 (t!9483 Nil!4398) (h!5067 Nil!4398))))))

