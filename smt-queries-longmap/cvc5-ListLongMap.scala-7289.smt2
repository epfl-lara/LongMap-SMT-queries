; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93126 () Bool)

(assert start!93126)

(declare-fun b!1056337 () Bool)

(declare-fun e!600516 () Bool)

(declare-datatypes ((array!66624 0))(
  ( (array!66625 (arr!32038 (Array (_ BitVec 32) (_ BitVec 64))) (size!32574 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66624)

(declare-fun lt!466088 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1056337 (= e!600516 (not (or (bvsgt lt!466088 i!1381) (bvsle i!1381 lt!466088) (bvsgt #b00000000000000000000000000000000 (size!32574 a!3488)) (and (bvsge lt!466088 #b00000000000000000000000000000000) (bvsle lt!466088 (size!32574 a!3488))))))))

(declare-fun e!600520 () Bool)

(assert (=> b!1056337 e!600520))

(declare-fun res!705116 () Bool)

(assert (=> b!1056337 (=> (not res!705116) (not e!600520))))

(declare-fun k!2747 () (_ BitVec 64))

(assert (=> b!1056337 (= res!705116 (= (select (store (arr!32038 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466088) k!2747))))

(declare-fun b!1056339 () Bool)

(declare-fun e!600515 () Bool)

(assert (=> b!1056339 (= e!600515 e!600516)))

(declare-fun res!705121 () Bool)

(assert (=> b!1056339 (=> (not res!705121) (not e!600516))))

(assert (=> b!1056339 (= res!705121 (not (= lt!466088 i!1381)))))

(declare-fun lt!466089 () array!66624)

(declare-fun arrayScanForKey!0 (array!66624 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1056339 (= lt!466088 (arrayScanForKey!0 lt!466089 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1056340 () Bool)

(declare-fun e!600518 () Bool)

(assert (=> b!1056340 (= e!600518 e!600515)))

(declare-fun res!705115 () Bool)

(assert (=> b!1056340 (=> (not res!705115) (not e!600515))))

(declare-fun arrayContainsKey!0 (array!66624 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1056340 (= res!705115 (arrayContainsKey!0 lt!466089 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1056340 (= lt!466089 (array!66625 (store (arr!32038 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32574 a!3488)))))

(declare-fun b!1056341 () Bool)

(declare-fun e!600519 () Bool)

(assert (=> b!1056341 (= e!600520 e!600519)))

(declare-fun res!705122 () Bool)

(assert (=> b!1056341 (=> res!705122 e!600519)))

(assert (=> b!1056341 (= res!705122 (or (bvsgt lt!466088 i!1381) (bvsle i!1381 lt!466088)))))

(declare-fun b!1056342 () Bool)

(declare-fun res!705119 () Bool)

(assert (=> b!1056342 (=> (not res!705119) (not e!600518))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1056342 (= res!705119 (validKeyInArray!0 k!2747))))

(declare-fun b!1056338 () Bool)

(declare-fun res!705120 () Bool)

(assert (=> b!1056338 (=> (not res!705120) (not e!600518))))

(declare-datatypes ((List!22350 0))(
  ( (Nil!22347) (Cons!22346 (h!23555 (_ BitVec 64)) (t!31657 List!22350)) )
))
(declare-fun arrayNoDuplicates!0 (array!66624 (_ BitVec 32) List!22350) Bool)

(assert (=> b!1056338 (= res!705120 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22347))))

(declare-fun res!705118 () Bool)

(assert (=> start!93126 (=> (not res!705118) (not e!600518))))

(assert (=> start!93126 (= res!705118 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32574 a!3488)) (bvslt (size!32574 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93126 e!600518))

(assert (=> start!93126 true))

(declare-fun array_inv!24818 (array!66624) Bool)

(assert (=> start!93126 (array_inv!24818 a!3488)))

(declare-fun b!1056343 () Bool)

(declare-fun res!705117 () Bool)

(assert (=> b!1056343 (=> (not res!705117) (not e!600518))))

(assert (=> b!1056343 (= res!705117 (= (select (arr!32038 a!3488) i!1381) k!2747))))

(declare-fun b!1056344 () Bool)

(assert (=> b!1056344 (= e!600519 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(assert (= (and start!93126 res!705118) b!1056338))

(assert (= (and b!1056338 res!705120) b!1056342))

(assert (= (and b!1056342 res!705119) b!1056343))

(assert (= (and b!1056343 res!705117) b!1056340))

(assert (= (and b!1056340 res!705115) b!1056339))

(assert (= (and b!1056339 res!705121) b!1056337))

(assert (= (and b!1056337 res!705116) b!1056341))

(assert (= (and b!1056341 (not res!705122)) b!1056344))

(declare-fun m!976223 () Bool)

(assert (=> start!93126 m!976223))

(declare-fun m!976225 () Bool)

(assert (=> b!1056337 m!976225))

(declare-fun m!976227 () Bool)

(assert (=> b!1056337 m!976227))

(declare-fun m!976229 () Bool)

(assert (=> b!1056339 m!976229))

(declare-fun m!976231 () Bool)

(assert (=> b!1056342 m!976231))

(declare-fun m!976233 () Bool)

(assert (=> b!1056343 m!976233))

(declare-fun m!976235 () Bool)

(assert (=> b!1056344 m!976235))

(declare-fun m!976237 () Bool)

(assert (=> b!1056338 m!976237))

(declare-fun m!976239 () Bool)

(assert (=> b!1056340 m!976239))

(assert (=> b!1056340 m!976225))

(push 1)

(assert (not b!1056340))

(assert (not b!1056338))

(assert (not b!1056339))

(assert (not b!1056342))

(assert (not b!1056344))

(assert (not start!93126))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!128291 () Bool)

(declare-fun res!705192 () Bool)

(declare-fun e!600581 () Bool)

(assert (=> d!128291 (=> res!705192 e!600581)))

(assert (=> d!128291 (= res!705192 (= (select (arr!32038 lt!466089) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!128291 (= (arrayContainsKey!0 lt!466089 k!2747 #b00000000000000000000000000000000) e!600581)))

(declare-fun b!1056420 () Bool)

(declare-fun e!600582 () Bool)

(assert (=> b!1056420 (= e!600581 e!600582)))

(declare-fun res!705193 () Bool)

(assert (=> b!1056420 (=> (not res!705193) (not e!600582))))

(assert (=> b!1056420 (= res!705193 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32574 lt!466089)))))

(declare-fun b!1056421 () Bool)

(assert (=> b!1056421 (= e!600582 (arrayContainsKey!0 lt!466089 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128291 (not res!705192)) b!1056420))

(assert (= (and b!1056420 res!705193) b!1056421))

(declare-fun m!976291 () Bool)

(assert (=> d!128291 m!976291))

(declare-fun m!976293 () Bool)

(assert (=> b!1056421 m!976293))

(assert (=> b!1056340 d!128291))

(declare-fun d!128297 () Bool)

(assert (=> d!128297 (= (validKeyInArray!0 k!2747) (and (not (= k!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1056342 d!128297))

(declare-fun d!128299 () Bool)

(assert (=> d!128299 (= (array_inv!24818 a!3488) (bvsge (size!32574 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!93126 d!128299))

(declare-fun b!1056442 () Bool)

(declare-fun e!600598 () Bool)

(declare-fun contains!6193 (List!22350 (_ BitVec 64)) Bool)

(assert (=> b!1056442 (= e!600598 (contains!6193 Nil!22347 (select (arr!32038 a!3488) #b00000000000000000000000000000000)))))

(declare-fun bm!44818 () Bool)

(declare-fun call!44821 () Bool)

(declare-fun c!107079 () Bool)

(assert (=> bm!44818 (= call!44821 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107079 (Cons!22346 (select (arr!32038 a!3488) #b00000000000000000000000000000000) Nil!22347) Nil!22347)))))

(declare-fun b!1056443 () Bool)

(declare-fun e!600600 () Bool)

(declare-fun e!600599 () Bool)

(assert (=> b!1056443 (= e!600600 e!600599)))

(declare-fun res!705205 () Bool)

(assert (=> b!1056443 (=> (not res!705205) (not e!600599))))

(assert (=> b!1056443 (= res!705205 (not e!600598))))

(declare-fun res!705204 () Bool)

(assert (=> b!1056443 (=> (not res!705204) (not e!600598))))

(assert (=> b!1056443 (= res!705204 (validKeyInArray!0 (select (arr!32038 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1056444 () Bool)

(declare-fun e!600601 () Bool)

(assert (=> b!1056444 (= e!600599 e!600601)))

(assert (=> b!1056444 (= c!107079 (validKeyInArray!0 (select (arr!32038 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1056445 () Bool)

(assert (=> b!1056445 (= e!600601 call!44821)))

(declare-fun d!128301 () Bool)

(declare-fun res!705206 () Bool)

(assert (=> d!128301 (=> res!705206 e!600600)))

(assert (=> d!128301 (= res!705206 (bvsge #b00000000000000000000000000000000 (size!32574 a!3488)))))

(assert (=> d!128301 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22347) e!600600)))

(declare-fun b!1056446 () Bool)

(assert (=> b!1056446 (= e!600601 call!44821)))

(assert (= (and d!128301 (not res!705206)) b!1056443))

(assert (= (and b!1056443 res!705204) b!1056442))

(assert (= (and b!1056443 res!705205) b!1056444))

(assert (= (and b!1056444 c!107079) b!1056446))

(assert (= (and b!1056444 (not c!107079)) b!1056445))

(assert (= (or b!1056446 b!1056445) bm!44818))

(declare-fun m!976303 () Bool)

(assert (=> b!1056442 m!976303))

(assert (=> b!1056442 m!976303))

(declare-fun m!976305 () Bool)

(assert (=> b!1056442 m!976305))

(assert (=> bm!44818 m!976303))

(declare-fun m!976307 () Bool)

(assert (=> bm!44818 m!976307))

(assert (=> b!1056443 m!976303))

(assert (=> b!1056443 m!976303))

(declare-fun m!976309 () Bool)

(assert (=> b!1056443 m!976309))

(assert (=> b!1056444 m!976303))

(assert (=> b!1056444 m!976303))

(assert (=> b!1056444 m!976309))

(assert (=> b!1056338 d!128301))

(declare-fun d!128307 () Bool)

(declare-fun lt!466107 () (_ BitVec 32))

(assert (=> d!128307 (and (or (bvslt lt!466107 #b00000000000000000000000000000000) (bvsge lt!466107 (size!32574 lt!466089)) (and (bvsge lt!466107 #b00000000000000000000000000000000) (bvslt lt!466107 (size!32574 lt!466089)))) (bvsge lt!466107 #b00000000000000000000000000000000) (bvslt lt!466107 (size!32574 lt!466089)) (= (select (arr!32038 lt!466089) lt!466107) k!2747))))

(declare-fun e!600618 () (_ BitVec 32))

(assert (=> d!128307 (= lt!466107 e!600618)))

(declare-fun c!107085 () Bool)

(assert (=> d!128307 (= c!107085 (= (select (arr!32038 lt!466089) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!128307 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32574 lt!466089)) (bvslt (size!32574 lt!466089) #b01111111111111111111111111111111))))

(assert (=> d!128307 (= (arrayScanForKey!0 lt!466089 k!2747 #b00000000000000000000000000000000) lt!466107)))

(declare-fun b!1056468 () Bool)

(assert (=> b!1056468 (= e!600618 #b00000000000000000000000000000000)))

(declare-fun b!1056469 () Bool)

(assert (=> b!1056469 (= e!600618 (arrayScanForKey!0 lt!466089 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128307 c!107085) b!1056468))

(assert (= (and d!128307 (not c!107085)) b!1056469))

(declare-fun m!976317 () Bool)

(assert (=> d!128307 m!976317))

(assert (=> d!128307 m!976291))

(declare-fun m!976321 () Bool)

(assert (=> b!1056469 m!976321))

(assert (=> b!1056339 d!128307))

(declare-fun d!128311 () Bool)

(declare-fun res!705220 () Bool)

(declare-fun e!600621 () Bool)

(assert (=> d!128311 (=> res!705220 e!600621)))

(assert (=> d!128311 (= res!705220 (= (select (arr!32038 a!3488) i!1381) k!2747))))

(assert (=> d!128311 (= (arrayContainsKey!0 a!3488 k!2747 i!1381) e!600621)))

(declare-fun b!1056472 () Bool)

(declare-fun e!600622 () Bool)

(assert (=> b!1056472 (= e!600621 e!600622)))

(declare-fun res!705221 () Bool)

(assert (=> b!1056472 (=> (not res!705221) (not e!600622))))

(assert (=> b!1056472 (= res!705221 (bvslt (bvadd i!1381 #b00000000000000000000000000000001) (size!32574 a!3488)))))

(declare-fun b!1056473 () Bool)

(assert (=> b!1056473 (= e!600622 (arrayContainsKey!0 a!3488 k!2747 (bvadd i!1381 #b00000000000000000000000000000001)))))

(assert (= (and d!128311 (not res!705220)) b!1056472))

(assert (= (and b!1056472 res!705221) b!1056473))

(assert (=> d!128311 m!976233))

(declare-fun m!976325 () Bool)

(assert (=> b!1056473 m!976325))

(assert (=> b!1056344 d!128311))

(push 1)

(assert (not b!1056442))

(assert (not b!1056421))

(assert (not b!1056443))

(assert (not b!1056444))

(assert (not b!1056469))

(assert (not b!1056473))

(assert (not bm!44818))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

