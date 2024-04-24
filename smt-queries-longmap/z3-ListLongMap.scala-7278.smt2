; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93162 () Bool)

(assert start!93162)

(declare-fun b!1056357 () Bool)

(declare-fun res!704454 () Bool)

(declare-fun e!600373 () Bool)

(assert (=> b!1056357 (=> (not res!704454) (not e!600373))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1056357 (= res!704454 (validKeyInArray!0 k0!2747))))

(declare-fun b!1056358 () Bool)

(declare-fun res!704453 () Bool)

(assert (=> b!1056358 (=> (not res!704453) (not e!600373))))

(declare-datatypes ((array!66598 0))(
  ( (array!66599 (arr!32023 (Array (_ BitVec 32) (_ BitVec 64))) (size!32560 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66598)

(declare-datatypes ((List!22305 0))(
  ( (Nil!22302) (Cons!22301 (h!23519 (_ BitVec 64)) (t!31604 List!22305)) )
))
(declare-fun arrayNoDuplicates!0 (array!66598 (_ BitVec 32) List!22305) Bool)

(assert (=> b!1056358 (= res!704453 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22302))))

(declare-fun b!1056359 () Bool)

(declare-fun res!704451 () Bool)

(assert (=> b!1056359 (=> (not res!704451) (not e!600373))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1056359 (= res!704451 (= (select (arr!32023 a!3488) i!1381) k0!2747))))

(declare-fun res!704456 () Bool)

(assert (=> start!93162 (=> (not res!704456) (not e!600373))))

(assert (=> start!93162 (= res!704456 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32560 a!3488)) (bvslt (size!32560 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93162 e!600373))

(assert (=> start!93162 true))

(declare-fun array_inv!24805 (array!66598) Bool)

(assert (=> start!93162 (array_inv!24805 a!3488)))

(declare-fun b!1056360 () Bool)

(declare-fun e!600370 () Bool)

(declare-fun e!600366 () Bool)

(assert (=> b!1056360 (= e!600370 e!600366)))

(declare-fun res!704458 () Bool)

(assert (=> b!1056360 (=> res!704458 e!600366)))

(assert (=> b!1056360 (= res!704458 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32560 a!3488)))))

(declare-fun arrayContainsKey!0 (array!66598 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1056360 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!466166 () (_ BitVec 32))

(declare-datatypes ((Unit!34573 0))(
  ( (Unit!34574) )
))
(declare-fun lt!466163 () Unit!34573)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66598 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34573)

(assert (=> b!1056360 (= lt!466163 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!466166 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1056360 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22302)))

(declare-fun lt!466165 () Unit!34573)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66598 (_ BitVec 32) (_ BitVec 32)) Unit!34573)

(assert (=> b!1056360 (= lt!466165 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1056361 () Bool)

(declare-fun noDuplicate!1561 (List!22305) Bool)

(assert (=> b!1056361 (= e!600366 (noDuplicate!1561 Nil!22302))))

(declare-fun b!1056362 () Bool)

(declare-fun e!600368 () Bool)

(declare-fun e!600372 () Bool)

(assert (=> b!1056362 (= e!600368 e!600372)))

(declare-fun res!704450 () Bool)

(assert (=> b!1056362 (=> (not res!704450) (not e!600372))))

(assert (=> b!1056362 (= res!704450 (not (= lt!466166 i!1381)))))

(declare-fun lt!466164 () array!66598)

(declare-fun arrayScanForKey!0 (array!66598 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1056362 (= lt!466166 (arrayScanForKey!0 lt!466164 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1056363 () Bool)

(declare-fun e!600369 () Bool)

(assert (=> b!1056363 (= e!600369 (arrayContainsKey!0 a!3488 k0!2747 lt!466166))))

(declare-fun b!1056364 () Bool)

(assert (=> b!1056364 (= e!600372 (not e!600370))))

(declare-fun res!704459 () Bool)

(assert (=> b!1056364 (=> res!704459 e!600370)))

(assert (=> b!1056364 (= res!704459 (bvsle lt!466166 i!1381))))

(declare-fun e!600371 () Bool)

(assert (=> b!1056364 e!600371))

(declare-fun res!704452 () Bool)

(assert (=> b!1056364 (=> (not res!704452) (not e!600371))))

(assert (=> b!1056364 (= res!704452 (= (select (store (arr!32023 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466166) k0!2747))))

(declare-fun b!1056365 () Bool)

(assert (=> b!1056365 (= e!600373 e!600368)))

(declare-fun res!704455 () Bool)

(assert (=> b!1056365 (=> (not res!704455) (not e!600368))))

(assert (=> b!1056365 (= res!704455 (arrayContainsKey!0 lt!466164 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1056365 (= lt!466164 (array!66599 (store (arr!32023 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32560 a!3488)))))

(declare-fun b!1056366 () Bool)

(assert (=> b!1056366 (= e!600371 e!600369)))

(declare-fun res!704457 () Bool)

(assert (=> b!1056366 (=> res!704457 e!600369)))

(assert (=> b!1056366 (= res!704457 (bvsle lt!466166 i!1381))))

(assert (= (and start!93162 res!704456) b!1056358))

(assert (= (and b!1056358 res!704453) b!1056357))

(assert (= (and b!1056357 res!704454) b!1056359))

(assert (= (and b!1056359 res!704451) b!1056365))

(assert (= (and b!1056365 res!704455) b!1056362))

(assert (= (and b!1056362 res!704450) b!1056364))

(assert (= (and b!1056364 res!704452) b!1056366))

(assert (= (and b!1056366 (not res!704457)) b!1056363))

(assert (= (and b!1056364 (not res!704459)) b!1056360))

(assert (= (and b!1056360 (not res!704458)) b!1056361))

(declare-fun m!976739 () Bool)

(assert (=> start!93162 m!976739))

(declare-fun m!976741 () Bool)

(assert (=> b!1056362 m!976741))

(declare-fun m!976743 () Bool)

(assert (=> b!1056364 m!976743))

(declare-fun m!976745 () Bool)

(assert (=> b!1056364 m!976745))

(declare-fun m!976747 () Bool)

(assert (=> b!1056363 m!976747))

(declare-fun m!976749 () Bool)

(assert (=> b!1056365 m!976749))

(assert (=> b!1056365 m!976743))

(declare-fun m!976751 () Bool)

(assert (=> b!1056361 m!976751))

(declare-fun m!976753 () Bool)

(assert (=> b!1056360 m!976753))

(declare-fun m!976755 () Bool)

(assert (=> b!1056360 m!976755))

(declare-fun m!976757 () Bool)

(assert (=> b!1056360 m!976757))

(declare-fun m!976759 () Bool)

(assert (=> b!1056360 m!976759))

(declare-fun m!976761 () Bool)

(assert (=> b!1056358 m!976761))

(declare-fun m!976763 () Bool)

(assert (=> b!1056359 m!976763))

(declare-fun m!976765 () Bool)

(assert (=> b!1056357 m!976765))

(check-sat (not b!1056362) (not b!1056360) (not b!1056361) (not b!1056363) (not b!1056357) (not b!1056365) (not b!1056358) (not start!93162))
(check-sat)
(get-model)

(declare-fun d!128543 () Bool)

(declare-fun res!704524 () Bool)

(declare-fun e!600426 () Bool)

(assert (=> d!128543 (=> res!704524 e!600426)))

(assert (=> d!128543 (= res!704524 (= (select (arr!32023 lt!466164) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128543 (= (arrayContainsKey!0 lt!466164 k0!2747 #b00000000000000000000000000000000) e!600426)))

(declare-fun b!1056431 () Bool)

(declare-fun e!600427 () Bool)

(assert (=> b!1056431 (= e!600426 e!600427)))

(declare-fun res!704525 () Bool)

(assert (=> b!1056431 (=> (not res!704525) (not e!600427))))

(assert (=> b!1056431 (= res!704525 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32560 lt!466164)))))

(declare-fun b!1056432 () Bool)

(assert (=> b!1056432 (= e!600427 (arrayContainsKey!0 lt!466164 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128543 (not res!704524)) b!1056431))

(assert (= (and b!1056431 res!704525) b!1056432))

(declare-fun m!976823 () Bool)

(assert (=> d!128543 m!976823))

(declare-fun m!976825 () Bool)

(assert (=> b!1056432 m!976825))

(assert (=> b!1056365 d!128543))

(declare-fun d!128545 () Bool)

(declare-fun res!704526 () Bool)

(declare-fun e!600428 () Bool)

(assert (=> d!128545 (=> res!704526 e!600428)))

(assert (=> d!128545 (= res!704526 (= (select (arr!32023 a!3488) lt!466166) k0!2747))))

(assert (=> d!128545 (= (arrayContainsKey!0 a!3488 k0!2747 lt!466166) e!600428)))

(declare-fun b!1056433 () Bool)

(declare-fun e!600429 () Bool)

(assert (=> b!1056433 (= e!600428 e!600429)))

(declare-fun res!704527 () Bool)

(assert (=> b!1056433 (=> (not res!704527) (not e!600429))))

(assert (=> b!1056433 (= res!704527 (bvslt (bvadd lt!466166 #b00000000000000000000000000000001) (size!32560 a!3488)))))

(declare-fun b!1056434 () Bool)

(assert (=> b!1056434 (= e!600429 (arrayContainsKey!0 a!3488 k0!2747 (bvadd lt!466166 #b00000000000000000000000000000001)))))

(assert (= (and d!128545 (not res!704526)) b!1056433))

(assert (= (and b!1056433 res!704527) b!1056434))

(declare-fun m!976827 () Bool)

(assert (=> d!128545 m!976827))

(declare-fun m!976829 () Bool)

(assert (=> b!1056434 m!976829))

(assert (=> b!1056363 d!128545))

(declare-fun b!1056445 () Bool)

(declare-fun e!600440 () Bool)

(declare-fun e!600439 () Bool)

(assert (=> b!1056445 (= e!600440 e!600439)))

(declare-fun c!107423 () Bool)

(assert (=> b!1056445 (= c!107423 (validKeyInArray!0 (select (arr!32023 a!3488) #b00000000000000000000000000000000)))))

(declare-fun bm!44849 () Bool)

(declare-fun call!44852 () Bool)

(assert (=> bm!44849 (= call!44852 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107423 (Cons!22301 (select (arr!32023 a!3488) #b00000000000000000000000000000000) Nil!22302) Nil!22302)))))

(declare-fun d!128547 () Bool)

(declare-fun res!704536 () Bool)

(declare-fun e!600438 () Bool)

(assert (=> d!128547 (=> res!704536 e!600438)))

(assert (=> d!128547 (= res!704536 (bvsge #b00000000000000000000000000000000 (size!32560 a!3488)))))

(assert (=> d!128547 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22302) e!600438)))

(declare-fun b!1056446 () Bool)

(declare-fun e!600441 () Bool)

(declare-fun contains!6203 (List!22305 (_ BitVec 64)) Bool)

(assert (=> b!1056446 (= e!600441 (contains!6203 Nil!22302 (select (arr!32023 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1056447 () Bool)

(assert (=> b!1056447 (= e!600439 call!44852)))

(declare-fun b!1056448 () Bool)

(assert (=> b!1056448 (= e!600439 call!44852)))

(declare-fun b!1056449 () Bool)

(assert (=> b!1056449 (= e!600438 e!600440)))

(declare-fun res!704534 () Bool)

(assert (=> b!1056449 (=> (not res!704534) (not e!600440))))

(assert (=> b!1056449 (= res!704534 (not e!600441))))

(declare-fun res!704535 () Bool)

(assert (=> b!1056449 (=> (not res!704535) (not e!600441))))

(assert (=> b!1056449 (= res!704535 (validKeyInArray!0 (select (arr!32023 a!3488) #b00000000000000000000000000000000)))))

(assert (= (and d!128547 (not res!704536)) b!1056449))

(assert (= (and b!1056449 res!704535) b!1056446))

(assert (= (and b!1056449 res!704534) b!1056445))

(assert (= (and b!1056445 c!107423) b!1056448))

(assert (= (and b!1056445 (not c!107423)) b!1056447))

(assert (= (or b!1056448 b!1056447) bm!44849))

(declare-fun m!976831 () Bool)

(assert (=> b!1056445 m!976831))

(assert (=> b!1056445 m!976831))

(declare-fun m!976833 () Bool)

(assert (=> b!1056445 m!976833))

(assert (=> bm!44849 m!976831))

(declare-fun m!976835 () Bool)

(assert (=> bm!44849 m!976835))

(assert (=> b!1056446 m!976831))

(assert (=> b!1056446 m!976831))

(declare-fun m!976837 () Bool)

(assert (=> b!1056446 m!976837))

(assert (=> b!1056449 m!976831))

(assert (=> b!1056449 m!976831))

(assert (=> b!1056449 m!976833))

(assert (=> b!1056358 d!128547))

(declare-fun d!128551 () Bool)

(assert (=> d!128551 (= (validKeyInArray!0 k0!2747) (and (not (= k0!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1056357 d!128551))

(declare-fun d!128553 () Bool)

(declare-fun lt!466196 () (_ BitVec 32))

(assert (=> d!128553 (and (or (bvslt lt!466196 #b00000000000000000000000000000000) (bvsge lt!466196 (size!32560 lt!466164)) (and (bvsge lt!466196 #b00000000000000000000000000000000) (bvslt lt!466196 (size!32560 lt!466164)))) (bvsge lt!466196 #b00000000000000000000000000000000) (bvslt lt!466196 (size!32560 lt!466164)) (= (select (arr!32023 lt!466164) lt!466196) k0!2747))))

(declare-fun e!600450 () (_ BitVec 32))

(assert (=> d!128553 (= lt!466196 e!600450)))

(declare-fun c!107426 () Bool)

(assert (=> d!128553 (= c!107426 (= (select (arr!32023 lt!466164) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128553 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32560 lt!466164)) (bvslt (size!32560 lt!466164) #b01111111111111111111111111111111))))

(assert (=> d!128553 (= (arrayScanForKey!0 lt!466164 k0!2747 #b00000000000000000000000000000000) lt!466196)))

(declare-fun b!1056460 () Bool)

(assert (=> b!1056460 (= e!600450 #b00000000000000000000000000000000)))

(declare-fun b!1056461 () Bool)

(assert (=> b!1056461 (= e!600450 (arrayScanForKey!0 lt!466164 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128553 c!107426) b!1056460))

(assert (= (and d!128553 (not c!107426)) b!1056461))

(declare-fun m!976845 () Bool)

(assert (=> d!128553 m!976845))

(assert (=> d!128553 m!976823))

(declare-fun m!976847 () Bool)

(assert (=> b!1056461 m!976847))

(assert (=> b!1056362 d!128553))

(declare-fun d!128561 () Bool)

(declare-fun res!704543 () Bool)

(declare-fun e!600451 () Bool)

(assert (=> d!128561 (=> res!704543 e!600451)))

(assert (=> d!128561 (= res!704543 (= (select (arr!32023 a!3488) (bvadd #b00000000000000000000000000000001 i!1381)) k0!2747))))

(assert (=> d!128561 (= (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381)) e!600451)))

(declare-fun b!1056462 () Bool)

(declare-fun e!600452 () Bool)

(assert (=> b!1056462 (= e!600451 e!600452)))

(declare-fun res!704544 () Bool)

(assert (=> b!1056462 (=> (not res!704544) (not e!600452))))

(assert (=> b!1056462 (= res!704544 (bvslt (bvadd #b00000000000000000000000000000001 i!1381 #b00000000000000000000000000000001) (size!32560 a!3488)))))

(declare-fun b!1056463 () Bool)

(assert (=> b!1056463 (= e!600452 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381 #b00000000000000000000000000000001)))))

(assert (= (and d!128561 (not res!704543)) b!1056462))

(assert (= (and b!1056462 res!704544) b!1056463))

(declare-fun m!976849 () Bool)

(assert (=> d!128561 m!976849))

(declare-fun m!976851 () Bool)

(assert (=> b!1056463 m!976851))

(assert (=> b!1056360 d!128561))

(declare-fun d!128563 () Bool)

(assert (=> d!128563 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!466199 () Unit!34573)

(declare-fun choose!114 (array!66598 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34573)

(assert (=> d!128563 (= lt!466199 (choose!114 a!3488 k0!2747 lt!466166 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> d!128563 (bvsge lt!466166 #b00000000000000000000000000000000)))

(assert (=> d!128563 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!466166 (bvadd #b00000000000000000000000000000001 i!1381)) lt!466199)))

(declare-fun bs!30946 () Bool)

(assert (= bs!30946 d!128563))

(assert (=> bs!30946 m!976753))

(declare-fun m!976853 () Bool)

(assert (=> bs!30946 m!976853))

(assert (=> b!1056360 d!128563))

(declare-fun b!1056466 () Bool)

(declare-fun e!600457 () Bool)

(declare-fun e!600456 () Bool)

(assert (=> b!1056466 (= e!600457 e!600456)))

(declare-fun c!107427 () Bool)

(assert (=> b!1056466 (= c!107427 (validKeyInArray!0 (select (arr!32023 a!3488) i!1381)))))

(declare-fun bm!44850 () Bool)

(declare-fun call!44853 () Bool)

(assert (=> bm!44850 (= call!44853 (arrayNoDuplicates!0 a!3488 (bvadd i!1381 #b00000000000000000000000000000001) (ite c!107427 (Cons!22301 (select (arr!32023 a!3488) i!1381) Nil!22302) Nil!22302)))))

(declare-fun d!128565 () Bool)

(declare-fun res!704549 () Bool)

(declare-fun e!600455 () Bool)

(assert (=> d!128565 (=> res!704549 e!600455)))

(assert (=> d!128565 (= res!704549 (bvsge i!1381 (size!32560 a!3488)))))

(assert (=> d!128565 (= (arrayNoDuplicates!0 a!3488 i!1381 Nil!22302) e!600455)))

(declare-fun b!1056467 () Bool)

(declare-fun e!600458 () Bool)

(assert (=> b!1056467 (= e!600458 (contains!6203 Nil!22302 (select (arr!32023 a!3488) i!1381)))))

(declare-fun b!1056468 () Bool)

(assert (=> b!1056468 (= e!600456 call!44853)))

(declare-fun b!1056469 () Bool)

(assert (=> b!1056469 (= e!600456 call!44853)))

(declare-fun b!1056470 () Bool)

(assert (=> b!1056470 (= e!600455 e!600457)))

(declare-fun res!704547 () Bool)

(assert (=> b!1056470 (=> (not res!704547) (not e!600457))))

(assert (=> b!1056470 (= res!704547 (not e!600458))))

(declare-fun res!704548 () Bool)

(assert (=> b!1056470 (=> (not res!704548) (not e!600458))))

(assert (=> b!1056470 (= res!704548 (validKeyInArray!0 (select (arr!32023 a!3488) i!1381)))))

(assert (= (and d!128565 (not res!704549)) b!1056470))

(assert (= (and b!1056470 res!704548) b!1056467))

(assert (= (and b!1056470 res!704547) b!1056466))

(assert (= (and b!1056466 c!107427) b!1056469))

(assert (= (and b!1056466 (not c!107427)) b!1056468))

(assert (= (or b!1056469 b!1056468) bm!44850))

(assert (=> b!1056466 m!976763))

(assert (=> b!1056466 m!976763))

(declare-fun m!976855 () Bool)

(assert (=> b!1056466 m!976855))

(assert (=> bm!44850 m!976763))

(declare-fun m!976857 () Bool)

(assert (=> bm!44850 m!976857))

(assert (=> b!1056467 m!976763))

(assert (=> b!1056467 m!976763))

(declare-fun m!976859 () Bool)

(assert (=> b!1056467 m!976859))

(assert (=> b!1056470 m!976763))

(assert (=> b!1056470 m!976763))

(assert (=> b!1056470 m!976855))

(assert (=> b!1056360 d!128565))

(declare-fun d!128567 () Bool)

(assert (=> d!128567 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22302)))

(declare-fun lt!466202 () Unit!34573)

(declare-fun choose!39 (array!66598 (_ BitVec 32) (_ BitVec 32)) Unit!34573)

(assert (=> d!128567 (= lt!466202 (choose!39 a!3488 #b00000000000000000000000000000000 i!1381))))

(assert (=> d!128567 (bvslt (size!32560 a!3488) #b01111111111111111111111111111111)))

(assert (=> d!128567 (= (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381) lt!466202)))

(declare-fun bs!30947 () Bool)

(assert (= bs!30947 d!128567))

(assert (=> bs!30947 m!976757))

(declare-fun m!976861 () Bool)

(assert (=> bs!30947 m!976861))

(assert (=> b!1056360 d!128567))

(declare-fun d!128569 () Bool)

(declare-fun res!704567 () Bool)

(declare-fun e!600481 () Bool)

(assert (=> d!128569 (=> res!704567 e!600481)))

(get-info :version)

(assert (=> d!128569 (= res!704567 ((_ is Nil!22302) Nil!22302))))

(assert (=> d!128569 (= (noDuplicate!1561 Nil!22302) e!600481)))

(declare-fun b!1056498 () Bool)

(declare-fun e!600482 () Bool)

(assert (=> b!1056498 (= e!600481 e!600482)))

(declare-fun res!704568 () Bool)

(assert (=> b!1056498 (=> (not res!704568) (not e!600482))))

(assert (=> b!1056498 (= res!704568 (not (contains!6203 (t!31604 Nil!22302) (h!23519 Nil!22302))))))

(declare-fun b!1056499 () Bool)

(assert (=> b!1056499 (= e!600482 (noDuplicate!1561 (t!31604 Nil!22302)))))

(assert (= (and d!128569 (not res!704567)) b!1056498))

(assert (= (and b!1056498 res!704568) b!1056499))

(declare-fun m!976867 () Bool)

(assert (=> b!1056498 m!976867))

(declare-fun m!976871 () Bool)

(assert (=> b!1056499 m!976871))

(assert (=> b!1056361 d!128569))

(declare-fun d!128571 () Bool)

(assert (=> d!128571 (= (array_inv!24805 a!3488) (bvsge (size!32560 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!93162 d!128571))

(check-sat (not d!128567) (not b!1056498) (not b!1056461) (not b!1056499) (not bm!44849) (not b!1056463) (not b!1056432) (not b!1056449) (not b!1056445) (not b!1056434) (not b!1056467) (not bm!44850) (not b!1056470) (not d!128563) (not b!1056446) (not b!1056466))
(check-sat)
