; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92214 () Bool)

(assert start!92214)

(declare-fun b!1048275 () Bool)

(declare-fun res!697438 () Bool)

(declare-fun e!594544 () Bool)

(assert (=> b!1048275 (=> (not res!697438) (not e!594544))))

(declare-datatypes ((array!66042 0))(
  ( (array!66043 (arr!31762 (Array (_ BitVec 32) (_ BitVec 64))) (size!32298 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66042)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1048275 (= res!697438 (= (select (arr!31762 a!3488) i!1381) k!2747))))

(declare-fun b!1048276 () Bool)

(declare-fun e!594546 () Bool)

(declare-fun e!594545 () Bool)

(assert (=> b!1048276 (= e!594546 e!594545)))

(declare-fun res!697437 () Bool)

(assert (=> b!1048276 (=> (not res!697437) (not e!594545))))

(declare-fun lt!463160 () (_ BitVec 32))

(assert (=> b!1048276 (= res!697437 (not (= lt!463160 i!1381)))))

(declare-fun lt!463161 () array!66042)

(declare-fun arrayScanForKey!0 (array!66042 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1048276 (= lt!463160 (arrayScanForKey!0 lt!463161 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1048277 () Bool)

(declare-fun res!697439 () Bool)

(assert (=> b!1048277 (=> (not res!697439) (not e!594544))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048277 (= res!697439 (validKeyInArray!0 k!2747))))

(declare-fun b!1048278 () Bool)

(assert (=> b!1048278 (= e!594544 e!594546)))

(declare-fun res!697441 () Bool)

(assert (=> b!1048278 (=> (not res!697441) (not e!594546))))

(declare-fun arrayContainsKey!0 (array!66042 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048278 (= res!697441 (arrayContainsKey!0 lt!463161 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1048278 (= lt!463161 (array!66043 (store (arr!31762 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32298 a!3488)))))

(declare-fun b!1048279 () Bool)

(assert (=> b!1048279 (= e!594545 (not (or (bvsle lt!463160 i!1381) (bvslt lt!463160 #b00000000000000000000000000000000) (bvslt lt!463160 (size!32298 a!3488)))))))

(assert (=> b!1048279 (= (select (store (arr!31762 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463160) k!2747)))

(declare-fun b!1048280 () Bool)

(declare-fun res!697442 () Bool)

(assert (=> b!1048280 (=> (not res!697442) (not e!594544))))

(declare-datatypes ((List!22074 0))(
  ( (Nil!22071) (Cons!22070 (h!23279 (_ BitVec 64)) (t!31381 List!22074)) )
))
(declare-fun arrayNoDuplicates!0 (array!66042 (_ BitVec 32) List!22074) Bool)

(assert (=> b!1048280 (= res!697442 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22071))))

(declare-fun res!697440 () Bool)

(assert (=> start!92214 (=> (not res!697440) (not e!594544))))

(assert (=> start!92214 (= res!697440 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32298 a!3488)) (bvslt (size!32298 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92214 e!594544))

(assert (=> start!92214 true))

(declare-fun array_inv!24542 (array!66042) Bool)

(assert (=> start!92214 (array_inv!24542 a!3488)))

(assert (= (and start!92214 res!697440) b!1048280))

(assert (= (and b!1048280 res!697442) b!1048277))

(assert (= (and b!1048277 res!697439) b!1048275))

(assert (= (and b!1048275 res!697438) b!1048278))

(assert (= (and b!1048278 res!697441) b!1048276))

(assert (= (and b!1048276 res!697437) b!1048279))

(declare-fun m!969287 () Bool)

(assert (=> b!1048278 m!969287))

(declare-fun m!969289 () Bool)

(assert (=> b!1048278 m!969289))

(declare-fun m!969291 () Bool)

(assert (=> b!1048275 m!969291))

(assert (=> b!1048279 m!969289))

(declare-fun m!969293 () Bool)

(assert (=> b!1048279 m!969293))

(declare-fun m!969295 () Bool)

(assert (=> b!1048280 m!969295))

(declare-fun m!969297 () Bool)

(assert (=> b!1048277 m!969297))

(declare-fun m!969299 () Bool)

(assert (=> start!92214 m!969299))

(declare-fun m!969301 () Bool)

(assert (=> b!1048276 m!969301))

(push 1)

(assert (not b!1048278))

(assert (not start!92214))

(assert (not b!1048277))

(assert (not b!1048276))

(assert (not b!1048280))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!127659 () Bool)

(declare-fun res!697492 () Bool)

(declare-fun e!594588 () Bool)

(assert (=> d!127659 (=> res!697492 e!594588)))

(assert (=> d!127659 (= res!697492 (= (select (arr!31762 lt!463161) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!127659 (= (arrayContainsKey!0 lt!463161 k!2747 #b00000000000000000000000000000000) e!594588)))

(declare-fun b!1048336 () Bool)

(declare-fun e!594589 () Bool)

(assert (=> b!1048336 (= e!594588 e!594589)))

(declare-fun res!697493 () Bool)

(assert (=> b!1048336 (=> (not res!697493) (not e!594589))))

(assert (=> b!1048336 (= res!697493 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32298 lt!463161)))))

(declare-fun b!1048337 () Bool)

(assert (=> b!1048337 (= e!594589 (arrayContainsKey!0 lt!463161 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127659 (not res!697492)) b!1048336))

(assert (= (and b!1048336 res!697493) b!1048337))

(declare-fun m!969343 () Bool)

(assert (=> d!127659 m!969343))

(declare-fun m!969345 () Bool)

(assert (=> b!1048337 m!969345))

(assert (=> b!1048278 d!127659))

(declare-fun d!127665 () Bool)

(assert (=> d!127665 (= (array_inv!24542 a!3488) (bvsge (size!32298 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!92214 d!127665))

(declare-fun b!1048354 () Bool)

(declare-fun e!594603 () Bool)

(declare-fun contains!6104 (List!22074 (_ BitVec 64)) Bool)

(assert (=> b!1048354 (= e!594603 (contains!6104 Nil!22071 (select (arr!31762 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1048355 () Bool)

(declare-fun e!594605 () Bool)

(declare-fun e!594606 () Bool)

(assert (=> b!1048355 (= e!594605 e!594606)))

(declare-fun c!106887 () Bool)

(assert (=> b!1048355 (= c!106887 (validKeyInArray!0 (select (arr!31762 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1048356 () Bool)

(declare-fun call!44719 () Bool)

(assert (=> b!1048356 (= e!594606 call!44719)))

(declare-fun d!127667 () Bool)

(declare-fun res!697504 () Bool)

(declare-fun e!594604 () Bool)

(assert (=> d!127667 (=> res!697504 e!594604)))

(assert (=> d!127667 (= res!697504 (bvsge #b00000000000000000000000000000000 (size!32298 a!3488)))))

(assert (=> d!127667 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22071) e!594604)))

(declare-fun bm!44716 () Bool)

(assert (=> bm!44716 (= call!44719 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106887 (Cons!22070 (select (arr!31762 a!3488) #b00000000000000000000000000000000) Nil!22071) Nil!22071)))))

(declare-fun b!1048359 () Bool)

(assert (=> b!1048359 (= e!594604 e!594605)))

(declare-fun res!697502 () Bool)

(assert (=> b!1048359 (=> (not res!697502) (not e!594605))))

(assert (=> b!1048359 (= res!697502 (not e!594603))))

(declare-fun res!697503 () Bool)

(assert (=> b!1048359 (=> (not res!697503) (not e!594603))))

(assert (=> b!1048359 (= res!697503 (validKeyInArray!0 (select (arr!31762 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1048360 () Bool)

(assert (=> b!1048360 (= e!594606 call!44719)))

(assert (= (and d!127667 (not res!697504)) b!1048359))

(assert (= (and b!1048359 res!697503) b!1048354))

(assert (= (and b!1048359 res!697502) b!1048355))

(assert (= (and b!1048355 c!106887) b!1048360))

(assert (= (and b!1048355 (not c!106887)) b!1048356))

(assert (= (or b!1048360 b!1048356) bm!44716))

(declare-fun m!969353 () Bool)

(assert (=> b!1048354 m!969353))

(assert (=> b!1048354 m!969353))

(declare-fun m!969355 () Bool)

(assert (=> b!1048354 m!969355))

(assert (=> b!1048355 m!969353))

(assert (=> b!1048355 m!969353))

(declare-fun m!969357 () Bool)

(assert (=> b!1048355 m!969357))

(assert (=> bm!44716 m!969353))

(declare-fun m!969359 () Bool)

(assert (=> bm!44716 m!969359))

(assert (=> b!1048359 m!969353))

(assert (=> b!1048359 m!969353))

(assert (=> b!1048359 m!969357))

(assert (=> b!1048280 d!127667))

(declare-fun d!127677 () Bool)

(assert (=> d!127677 (= (validKeyInArray!0 k!2747) (and (not (= k!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1048277 d!127677))

(declare-fun d!127679 () Bool)

(declare-fun lt!463179 () (_ BitVec 32))

(assert (=> d!127679 (and (or (bvslt lt!463179 #b00000000000000000000000000000000) (bvsge lt!463179 (size!32298 lt!463161)) (and (bvsge lt!463179 #b00000000000000000000000000000000) (bvslt lt!463179 (size!32298 lt!463161)))) (bvsge lt!463179 #b00000000000000000000000000000000) (bvslt lt!463179 (size!32298 lt!463161)) (= (select (arr!31762 lt!463161) lt!463179) k!2747))))

(declare-fun e!594625 () (_ BitVec 32))

(assert (=> d!127679 (= lt!463179 e!594625)))

(declare-fun c!106893 () Bool)

(assert (=> d!127679 (= c!106893 (= (select (arr!31762 lt!463161) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!127679 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32298 lt!463161)) (bvslt (size!32298 lt!463161) #b01111111111111111111111111111111))))

(assert (=> d!127679 (= (arrayScanForKey!0 lt!463161 k!2747 #b00000000000000000000000000000000) lt!463179)))

(declare-fun b!1048384 () Bool)

(assert (=> b!1048384 (= e!594625 #b00000000000000000000000000000000)))

(declare-fun b!1048385 () Bool)

(assert (=> b!1048385 (= e!594625 (arrayScanForKey!0 lt!463161 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127679 c!106893) b!1048384))

(assert (= (and d!127679 (not c!106893)) b!1048385))

(declare-fun m!969371 () Bool)

(assert (=> d!127679 m!969371))

(assert (=> d!127679 m!969343))

(declare-fun m!969373 () Bool)

(assert (=> b!1048385 m!969373))

(assert (=> b!1048276 d!127679))

(push 1)

(assert (not bm!44716))

(assert (not b!1048359))

(assert (not b!1048385))

(assert (not b!1048354))

(assert (not b!1048355))

(assert (not b!1048337))

(check-sat)

(pop 1)

(push 1)

(check-sat)

