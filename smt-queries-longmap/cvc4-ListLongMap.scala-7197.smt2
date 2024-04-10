; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92218 () Bool)

(assert start!92218)

(declare-fun b!1048311 () Bool)

(declare-fun res!697476 () Bool)

(declare-fun e!594568 () Bool)

(assert (=> b!1048311 (=> (not res!697476) (not e!594568))))

(declare-datatypes ((array!66046 0))(
  ( (array!66047 (arr!31764 (Array (_ BitVec 32) (_ BitVec 64))) (size!32300 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66046)

(declare-datatypes ((List!22076 0))(
  ( (Nil!22073) (Cons!22072 (h!23281 (_ BitVec 64)) (t!31383 List!22076)) )
))
(declare-fun arrayNoDuplicates!0 (array!66046 (_ BitVec 32) List!22076) Bool)

(assert (=> b!1048311 (= res!697476 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22073))))

(declare-fun b!1048312 () Bool)

(declare-fun e!594570 () Bool)

(assert (=> b!1048312 (= e!594568 e!594570)))

(declare-fun res!697475 () Bool)

(assert (=> b!1048312 (=> (not res!697475) (not e!594570))))

(declare-fun lt!463172 () array!66046)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66046 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048312 (= res!697475 (arrayContainsKey!0 lt!463172 k!2747 #b00000000000000000000000000000000))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1048312 (= lt!463172 (array!66047 (store (arr!31764 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32300 a!3488)))))

(declare-fun b!1048313 () Bool)

(declare-fun res!697477 () Bool)

(assert (=> b!1048313 (=> (not res!697477) (not e!594568))))

(assert (=> b!1048313 (= res!697477 (= (select (arr!31764 a!3488) i!1381) k!2747))))

(declare-fun b!1048314 () Bool)

(declare-fun e!594569 () Bool)

(assert (=> b!1048314 (= e!594570 e!594569)))

(declare-fun res!697473 () Bool)

(assert (=> b!1048314 (=> (not res!697473) (not e!594569))))

(declare-fun lt!463173 () (_ BitVec 32))

(assert (=> b!1048314 (= res!697473 (not (= lt!463173 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66046 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1048314 (= lt!463173 (arrayScanForKey!0 lt!463172 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1048316 () Bool)

(assert (=> b!1048316 (= e!594569 (not (or (bvsle lt!463173 i!1381) (bvslt lt!463173 #b00000000000000000000000000000000) (bvslt lt!463173 (size!32300 a!3488)))))))

(assert (=> b!1048316 (= (select (store (arr!31764 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463173) k!2747)))

(declare-fun res!697478 () Bool)

(assert (=> start!92218 (=> (not res!697478) (not e!594568))))

(assert (=> start!92218 (= res!697478 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32300 a!3488)) (bvslt (size!32300 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92218 e!594568))

(assert (=> start!92218 true))

(declare-fun array_inv!24544 (array!66046) Bool)

(assert (=> start!92218 (array_inv!24544 a!3488)))

(declare-fun b!1048315 () Bool)

(declare-fun res!697474 () Bool)

(assert (=> b!1048315 (=> (not res!697474) (not e!594568))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048315 (= res!697474 (validKeyInArray!0 k!2747))))

(assert (= (and start!92218 res!697478) b!1048311))

(assert (= (and b!1048311 res!697476) b!1048315))

(assert (= (and b!1048315 res!697474) b!1048313))

(assert (= (and b!1048313 res!697477) b!1048312))

(assert (= (and b!1048312 res!697475) b!1048314))

(assert (= (and b!1048314 res!697473) b!1048316))

(declare-fun m!969319 () Bool)

(assert (=> b!1048314 m!969319))

(declare-fun m!969321 () Bool)

(assert (=> b!1048315 m!969321))

(declare-fun m!969323 () Bool)

(assert (=> start!92218 m!969323))

(declare-fun m!969325 () Bool)

(assert (=> b!1048313 m!969325))

(declare-fun m!969327 () Bool)

(assert (=> b!1048316 m!969327))

(declare-fun m!969329 () Bool)

(assert (=> b!1048316 m!969329))

(declare-fun m!969331 () Bool)

(assert (=> b!1048311 m!969331))

(declare-fun m!969333 () Bool)

(assert (=> b!1048312 m!969333))

(assert (=> b!1048312 m!969327))

(push 1)

(assert (not b!1048314))

(assert (not b!1048315))

(assert (not b!1048312))

(assert (not start!92218))

(assert (not b!1048311))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!127669 () Bool)

(assert (=> d!127669 (= (validKeyInArray!0 k!2747) (and (not (= k!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1048315 d!127669))

(declare-fun d!127671 () Bool)

(assert (=> d!127671 (= (array_inv!24544 a!3488) (bvsge (size!32300 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!92218 d!127671))

(declare-fun b!1048375 () Bool)

(declare-fun e!594622 () Bool)

(declare-fun call!44722 () Bool)

(assert (=> b!1048375 (= e!594622 call!44722)))

(declare-fun b!1048376 () Bool)

(declare-fun e!594621 () Bool)

(declare-fun contains!6105 (List!22076 (_ BitVec 64)) Bool)

(assert (=> b!1048376 (= e!594621 (contains!6105 Nil!22073 (select (arr!31764 a!3488) #b00000000000000000000000000000000)))))

(declare-fun d!127673 () Bool)

(declare-fun res!697516 () Bool)

(declare-fun e!594620 () Bool)

(assert (=> d!127673 (=> res!697516 e!594620)))

(assert (=> d!127673 (= res!697516 (bvsge #b00000000000000000000000000000000 (size!32300 a!3488)))))

(assert (=> d!127673 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22073) e!594620)))

(declare-fun b!1048377 () Bool)

(declare-fun e!594619 () Bool)

(assert (=> b!1048377 (= e!594620 e!594619)))

(declare-fun res!697517 () Bool)

(assert (=> b!1048377 (=> (not res!697517) (not e!594619))))

(assert (=> b!1048377 (= res!697517 (not e!594621))))

(declare-fun res!697515 () Bool)

(assert (=> b!1048377 (=> (not res!697515) (not e!594621))))

(assert (=> b!1048377 (= res!697515 (validKeyInArray!0 (select (arr!31764 a!3488) #b00000000000000000000000000000000)))))

(declare-fun bm!44719 () Bool)

(declare-fun c!106890 () Bool)

(assert (=> bm!44719 (= call!44722 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106890 (Cons!22072 (select (arr!31764 a!3488) #b00000000000000000000000000000000) Nil!22073) Nil!22073)))))

(declare-fun b!1048378 () Bool)

(assert (=> b!1048378 (= e!594622 call!44722)))

(declare-fun b!1048379 () Bool)

(assert (=> b!1048379 (= e!594619 e!594622)))

(assert (=> b!1048379 (= c!106890 (validKeyInArray!0 (select (arr!31764 a!3488) #b00000000000000000000000000000000)))))

(assert (= (and d!127673 (not res!697516)) b!1048377))

(assert (= (and b!1048377 res!697515) b!1048376))

(assert (= (and b!1048377 res!697517) b!1048379))

(assert (= (and b!1048379 c!106890) b!1048378))

(assert (= (and b!1048379 (not c!106890)) b!1048375))

(assert (= (or b!1048378 b!1048375) bm!44719))

(declare-fun m!969363 () Bool)

(assert (=> b!1048376 m!969363))

(assert (=> b!1048376 m!969363))

(declare-fun m!969365 () Bool)

(assert (=> b!1048376 m!969365))

(assert (=> b!1048377 m!969363))

(assert (=> b!1048377 m!969363))

(declare-fun m!969367 () Bool)

(assert (=> b!1048377 m!969367))

(assert (=> bm!44719 m!969363))

(declare-fun m!969369 () Bool)

(assert (=> bm!44719 m!969369))

(assert (=> b!1048379 m!969363))

(assert (=> b!1048379 m!969363))

(assert (=> b!1048379 m!969367))

(assert (=> b!1048311 d!127673))

(declare-fun d!127681 () Bool)

(declare-fun res!697522 () Bool)

(declare-fun e!594630 () Bool)

(assert (=> d!127681 (=> res!697522 e!594630)))

(assert (=> d!127681 (= res!697522 (= (select (arr!31764 lt!463172) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!127681 (= (arrayContainsKey!0 lt!463172 k!2747 #b00000000000000000000000000000000) e!594630)))

(declare-fun b!1048390 () Bool)

(declare-fun e!594631 () Bool)

(assert (=> b!1048390 (= e!594630 e!594631)))

(declare-fun res!697523 () Bool)

(assert (=> b!1048390 (=> (not res!697523) (not e!594631))))

(assert (=> b!1048390 (= res!697523 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32300 lt!463172)))))

(declare-fun b!1048391 () Bool)

(assert (=> b!1048391 (= e!594631 (arrayContainsKey!0 lt!463172 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127681 (not res!697522)) b!1048390))

(assert (= (and b!1048390 res!697523) b!1048391))

(declare-fun m!969375 () Bool)

(assert (=> d!127681 m!969375))

(declare-fun m!969377 () Bool)

(assert (=> b!1048391 m!969377))

(assert (=> b!1048312 d!127681))

(declare-fun d!127683 () Bool)

(declare-fun lt!463182 () (_ BitVec 32))

(assert (=> d!127683 (and (or (bvslt lt!463182 #b00000000000000000000000000000000) (bvsge lt!463182 (size!32300 lt!463172)) (and (bvsge lt!463182 #b00000000000000000000000000000000) (bvslt lt!463182 (size!32300 lt!463172)))) (bvsge lt!463182 #b00000000000000000000000000000000) (bvslt lt!463182 (size!32300 lt!463172)) (= (select (arr!31764 lt!463172) lt!463182) k!2747))))

(declare-fun e!594634 () (_ BitVec 32))

(assert (=> d!127683 (= lt!463182 e!594634)))

(declare-fun c!106896 () Bool)

(assert (=> d!127683 (= c!106896 (= (select (arr!31764 lt!463172) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!127683 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32300 lt!463172)) (bvslt (size!32300 lt!463172) #b01111111111111111111111111111111))))

(assert (=> d!127683 (= (arrayScanForKey!0 lt!463172 k!2747 #b00000000000000000000000000000000) lt!463182)))

(declare-fun b!1048396 () Bool)

(assert (=> b!1048396 (= e!594634 #b00000000000000000000000000000000)))

(declare-fun b!1048397 () Bool)

(assert (=> b!1048397 (= e!594634 (arrayScanForKey!0 lt!463172 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127683 c!106896) b!1048396))

(assert (= (and d!127683 (not c!106896)) b!1048397))

(declare-fun m!969379 () Bool)

(assert (=> d!127683 m!969379))

(assert (=> d!127683 m!969375))

(declare-fun m!969381 () Bool)

(assert (=> b!1048397 m!969381))

(assert (=> b!1048314 d!127683))

(push 1)

(assert (not b!1048377))

(assert (not b!1048391))

(assert (not b!1048397))

(assert (not b!1048376))

(assert (not b!1048379))

(assert (not bm!44719))

(check-sat)

(pop 1)

(push 1)

(check-sat)

