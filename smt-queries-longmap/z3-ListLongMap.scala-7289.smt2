; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93128 () Bool)

(assert start!93128)

(declare-fun b!1056361 () Bool)

(declare-fun res!705139 () Bool)

(declare-fun e!600538 () Bool)

(assert (=> b!1056361 (=> (not res!705139) (not e!600538))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1056361 (= res!705139 (validKeyInArray!0 k0!2747))))

(declare-fun b!1056362 () Bool)

(declare-fun e!600536 () Bool)

(declare-fun e!600535 () Bool)

(assert (=> b!1056362 (= e!600536 e!600535)))

(declare-fun res!705143 () Bool)

(assert (=> b!1056362 (=> (not res!705143) (not e!600535))))

(declare-fun lt!466094 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1056362 (= res!705143 (not (= lt!466094 i!1381)))))

(declare-datatypes ((array!66626 0))(
  ( (array!66627 (arr!32039 (Array (_ BitVec 32) (_ BitVec 64))) (size!32575 (_ BitVec 32))) )
))
(declare-fun lt!466095 () array!66626)

(declare-fun arrayScanForKey!0 (array!66626 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1056362 (= lt!466094 (arrayScanForKey!0 lt!466095 k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!705140 () Bool)

(assert (=> start!93128 (=> (not res!705140) (not e!600538))))

(declare-fun a!3488 () array!66626)

(assert (=> start!93128 (= res!705140 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32575 a!3488)) (bvslt (size!32575 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93128 e!600538))

(assert (=> start!93128 true))

(declare-fun array_inv!24819 (array!66626) Bool)

(assert (=> start!93128 (array_inv!24819 a!3488)))

(declare-fun b!1056363 () Bool)

(declare-fun res!705146 () Bool)

(assert (=> b!1056363 (=> (not res!705146) (not e!600538))))

(declare-datatypes ((List!22351 0))(
  ( (Nil!22348) (Cons!22347 (h!23556 (_ BitVec 64)) (t!31658 List!22351)) )
))
(declare-fun arrayNoDuplicates!0 (array!66626 (_ BitVec 32) List!22351) Bool)

(assert (=> b!1056363 (= res!705146 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22348))))

(declare-fun b!1056364 () Bool)

(declare-fun e!600534 () Bool)

(declare-fun e!600537 () Bool)

(assert (=> b!1056364 (= e!600534 e!600537)))

(declare-fun res!705141 () Bool)

(assert (=> b!1056364 (=> res!705141 e!600537)))

(assert (=> b!1056364 (= res!705141 (or (bvsgt lt!466094 i!1381) (bvsle i!1381 lt!466094)))))

(declare-fun b!1056365 () Bool)

(assert (=> b!1056365 (= e!600535 (not (or (bvsgt lt!466094 i!1381) (bvsle i!1381 lt!466094) (bvsgt #b00000000000000000000000000000000 (size!32575 a!3488)) (and (bvsge lt!466094 #b00000000000000000000000000000000) (bvsle lt!466094 (size!32575 a!3488))))))))

(assert (=> b!1056365 e!600534))

(declare-fun res!705142 () Bool)

(assert (=> b!1056365 (=> (not res!705142) (not e!600534))))

(assert (=> b!1056365 (= res!705142 (= (select (store (arr!32039 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466094) k0!2747))))

(declare-fun b!1056366 () Bool)

(declare-fun res!705145 () Bool)

(assert (=> b!1056366 (=> (not res!705145) (not e!600538))))

(assert (=> b!1056366 (= res!705145 (= (select (arr!32039 a!3488) i!1381) k0!2747))))

(declare-fun b!1056367 () Bool)

(assert (=> b!1056367 (= e!600538 e!600536)))

(declare-fun res!705144 () Bool)

(assert (=> b!1056367 (=> (not res!705144) (not e!600536))))

(declare-fun arrayContainsKey!0 (array!66626 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1056367 (= res!705144 (arrayContainsKey!0 lt!466095 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1056367 (= lt!466095 (array!66627 (store (arr!32039 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32575 a!3488)))))

(declare-fun b!1056368 () Bool)

(assert (=> b!1056368 (= e!600537 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(assert (= (and start!93128 res!705140) b!1056363))

(assert (= (and b!1056363 res!705146) b!1056361))

(assert (= (and b!1056361 res!705139) b!1056366))

(assert (= (and b!1056366 res!705145) b!1056367))

(assert (= (and b!1056367 res!705144) b!1056362))

(assert (= (and b!1056362 res!705143) b!1056365))

(assert (= (and b!1056365 res!705142) b!1056364))

(assert (= (and b!1056364 (not res!705141)) b!1056368))

(declare-fun m!976241 () Bool)

(assert (=> b!1056366 m!976241))

(declare-fun m!976243 () Bool)

(assert (=> b!1056365 m!976243))

(declare-fun m!976245 () Bool)

(assert (=> b!1056365 m!976245))

(declare-fun m!976247 () Bool)

(assert (=> start!93128 m!976247))

(declare-fun m!976249 () Bool)

(assert (=> b!1056362 m!976249))

(declare-fun m!976251 () Bool)

(assert (=> b!1056368 m!976251))

(declare-fun m!976253 () Bool)

(assert (=> b!1056361 m!976253))

(declare-fun m!976255 () Bool)

(assert (=> b!1056363 m!976255))

(declare-fun m!976257 () Bool)

(assert (=> b!1056367 m!976257))

(assert (=> b!1056367 m!976243))

(check-sat (not start!93128) (not b!1056362) (not b!1056368) (not b!1056361) (not b!1056367) (not b!1056363))
(check-sat)
(get-model)

(declare-fun d!128283 () Bool)

(assert (=> d!128283 (= (array_inv!24819 a!3488) (bvsge (size!32575 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!93128 d!128283))

(declare-fun d!128285 () Bool)

(declare-fun res!705175 () Bool)

(declare-fun e!600561 () Bool)

(assert (=> d!128285 (=> res!705175 e!600561)))

(assert (=> d!128285 (= res!705175 (= (select (arr!32039 lt!466095) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128285 (= (arrayContainsKey!0 lt!466095 k0!2747 #b00000000000000000000000000000000) e!600561)))

(declare-fun b!1056397 () Bool)

(declare-fun e!600562 () Bool)

(assert (=> b!1056397 (= e!600561 e!600562)))

(declare-fun res!705176 () Bool)

(assert (=> b!1056397 (=> (not res!705176) (not e!600562))))

(assert (=> b!1056397 (= res!705176 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32575 lt!466095)))))

(declare-fun b!1056398 () Bool)

(assert (=> b!1056398 (= e!600562 (arrayContainsKey!0 lt!466095 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128285 (not res!705175)) b!1056397))

(assert (= (and b!1056397 res!705176) b!1056398))

(declare-fun m!976277 () Bool)

(assert (=> d!128285 m!976277))

(declare-fun m!976279 () Bool)

(assert (=> b!1056398 m!976279))

(assert (=> b!1056367 d!128285))

(declare-fun d!128287 () Bool)

(assert (=> d!128287 (= (validKeyInArray!0 k0!2747) (and (not (= k0!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1056361 d!128287))

(declare-fun d!128289 () Bool)

(declare-fun res!705184 () Bool)

(declare-fun e!600574 () Bool)

(assert (=> d!128289 (=> res!705184 e!600574)))

(assert (=> d!128289 (= res!705184 (bvsge #b00000000000000000000000000000000 (size!32575 a!3488)))))

(assert (=> d!128289 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22348) e!600574)))

(declare-fun bm!44815 () Bool)

(declare-fun call!44818 () Bool)

(declare-fun c!107073 () Bool)

(assert (=> bm!44815 (= call!44818 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107073 (Cons!22347 (select (arr!32039 a!3488) #b00000000000000000000000000000000) Nil!22348) Nil!22348)))))

(declare-fun b!1056409 () Bool)

(declare-fun e!600571 () Bool)

(declare-fun e!600572 () Bool)

(assert (=> b!1056409 (= e!600571 e!600572)))

(assert (=> b!1056409 (= c!107073 (validKeyInArray!0 (select (arr!32039 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1056410 () Bool)

(declare-fun e!600573 () Bool)

(declare-fun contains!6192 (List!22351 (_ BitVec 64)) Bool)

(assert (=> b!1056410 (= e!600573 (contains!6192 Nil!22348 (select (arr!32039 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1056411 () Bool)

(assert (=> b!1056411 (= e!600574 e!600571)))

(declare-fun res!705183 () Bool)

(assert (=> b!1056411 (=> (not res!705183) (not e!600571))))

(assert (=> b!1056411 (= res!705183 (not e!600573))))

(declare-fun res!705185 () Bool)

(assert (=> b!1056411 (=> (not res!705185) (not e!600573))))

(assert (=> b!1056411 (= res!705185 (validKeyInArray!0 (select (arr!32039 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1056412 () Bool)

(assert (=> b!1056412 (= e!600572 call!44818)))

(declare-fun b!1056413 () Bool)

(assert (=> b!1056413 (= e!600572 call!44818)))

(assert (= (and d!128289 (not res!705184)) b!1056411))

(assert (= (and b!1056411 res!705185) b!1056410))

(assert (= (and b!1056411 res!705183) b!1056409))

(assert (= (and b!1056409 c!107073) b!1056413))

(assert (= (and b!1056409 (not c!107073)) b!1056412))

(assert (= (or b!1056413 b!1056412) bm!44815))

(declare-fun m!976281 () Bool)

(assert (=> bm!44815 m!976281))

(declare-fun m!976283 () Bool)

(assert (=> bm!44815 m!976283))

(assert (=> b!1056409 m!976281))

(assert (=> b!1056409 m!976281))

(declare-fun m!976285 () Bool)

(assert (=> b!1056409 m!976285))

(assert (=> b!1056410 m!976281))

(assert (=> b!1056410 m!976281))

(declare-fun m!976287 () Bool)

(assert (=> b!1056410 m!976287))

(assert (=> b!1056411 m!976281))

(assert (=> b!1056411 m!976281))

(assert (=> b!1056411 m!976285))

(assert (=> b!1056363 d!128289))

(declare-fun d!128293 () Bool)

(declare-fun res!705186 () Bool)

(declare-fun e!600575 () Bool)

(assert (=> d!128293 (=> res!705186 e!600575)))

(assert (=> d!128293 (= res!705186 (= (select (arr!32039 a!3488) i!1381) k0!2747))))

(assert (=> d!128293 (= (arrayContainsKey!0 a!3488 k0!2747 i!1381) e!600575)))

(declare-fun b!1056414 () Bool)

(declare-fun e!600576 () Bool)

(assert (=> b!1056414 (= e!600575 e!600576)))

(declare-fun res!705187 () Bool)

(assert (=> b!1056414 (=> (not res!705187) (not e!600576))))

(assert (=> b!1056414 (= res!705187 (bvslt (bvadd i!1381 #b00000000000000000000000000000001) (size!32575 a!3488)))))

(declare-fun b!1056415 () Bool)

(assert (=> b!1056415 (= e!600576 (arrayContainsKey!0 a!3488 k0!2747 (bvadd i!1381 #b00000000000000000000000000000001)))))

(assert (= (and d!128293 (not res!705186)) b!1056414))

(assert (= (and b!1056414 res!705187) b!1056415))

(assert (=> d!128293 m!976241))

(declare-fun m!976289 () Bool)

(assert (=> b!1056415 m!976289))

(assert (=> b!1056368 d!128293))

(declare-fun d!128295 () Bool)

(declare-fun lt!466104 () (_ BitVec 32))

(assert (=> d!128295 (and (or (bvslt lt!466104 #b00000000000000000000000000000000) (bvsge lt!466104 (size!32575 lt!466095)) (and (bvsge lt!466104 #b00000000000000000000000000000000) (bvslt lt!466104 (size!32575 lt!466095)))) (bvsge lt!466104 #b00000000000000000000000000000000) (bvslt lt!466104 (size!32575 lt!466095)) (= (select (arr!32039 lt!466095) lt!466104) k0!2747))))

(declare-fun e!600587 () (_ BitVec 32))

(assert (=> d!128295 (= lt!466104 e!600587)))

(declare-fun c!107076 () Bool)

(assert (=> d!128295 (= c!107076 (= (select (arr!32039 lt!466095) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128295 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32575 lt!466095)) (bvslt (size!32575 lt!466095) #b01111111111111111111111111111111))))

(assert (=> d!128295 (= (arrayScanForKey!0 lt!466095 k0!2747 #b00000000000000000000000000000000) lt!466104)))

(declare-fun b!1056428 () Bool)

(assert (=> b!1056428 (= e!600587 #b00000000000000000000000000000000)))

(declare-fun b!1056429 () Bool)

(assert (=> b!1056429 (= e!600587 (arrayScanForKey!0 lt!466095 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128295 c!107076) b!1056428))

(assert (= (and d!128295 (not c!107076)) b!1056429))

(declare-fun m!976295 () Bool)

(assert (=> d!128295 m!976295))

(assert (=> d!128295 m!976277))

(declare-fun m!976297 () Bool)

(assert (=> b!1056429 m!976297))

(assert (=> b!1056362 d!128295))

(check-sat (not b!1056410) (not bm!44815) (not b!1056411) (not b!1056398) (not b!1056409) (not b!1056415) (not b!1056429))
(check-sat)
