; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92984 () Bool)

(assert start!92984)

(declare-fun b!1055298 () Bool)

(declare-fun e!599736 () Bool)

(declare-datatypes ((List!22321 0))(
  ( (Nil!22318) (Cons!22317 (h!23526 (_ BitVec 64)) (t!31628 List!22321)) )
))
(declare-fun contains!6181 (List!22321 (_ BitVec 64)) Bool)

(assert (=> b!1055298 (= e!599736 (not (contains!6181 Nil!22318 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1055300 () Bool)

(declare-fun res!704157 () Bool)

(declare-fun e!599730 () Bool)

(assert (=> b!1055300 (=> (not res!704157) (not e!599730))))

(declare-datatypes ((array!66560 0))(
  ( (array!66561 (arr!32009 (Array (_ BitVec 32) (_ BitVec 64))) (size!32545 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66560)

(declare-fun arrayNoDuplicates!0 (array!66560 (_ BitVec 32) List!22321) Bool)

(assert (=> b!1055300 (= res!704157 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22318))))

(declare-fun b!1055301 () Bool)

(declare-fun e!599733 () Bool)

(declare-fun e!599729 () Bool)

(assert (=> b!1055301 (= e!599733 e!599729)))

(declare-fun res!704156 () Bool)

(assert (=> b!1055301 (=> res!704156 e!599729)))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1055301 (= res!704156 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32545 a!3488)))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66560 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1055301 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!465725 () (_ BitVec 32))

(declare-datatypes ((Unit!34576 0))(
  ( (Unit!34577) )
))
(declare-fun lt!465723 () Unit!34576)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66560 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34576)

(assert (=> b!1055301 (= lt!465723 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!465725 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1055301 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22318)))

(declare-fun lt!465724 () Unit!34576)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66560 (_ BitVec 32) (_ BitVec 32)) Unit!34576)

(assert (=> b!1055301 (= lt!465724 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun res!704164 () Bool)

(assert (=> start!92984 (=> (not res!704164) (not e!599730))))

(assert (=> start!92984 (= res!704164 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32545 a!3488)) (bvslt (size!32545 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92984 e!599730))

(assert (=> start!92984 true))

(declare-fun array_inv!24789 (array!66560) Bool)

(assert (=> start!92984 (array_inv!24789 a!3488)))

(declare-fun b!1055299 () Bool)

(declare-fun res!704163 () Bool)

(assert (=> b!1055299 (=> res!704163 e!599729)))

(declare-fun noDuplicate!1549 (List!22321) Bool)

(assert (=> b!1055299 (= res!704163 (not (noDuplicate!1549 Nil!22318)))))

(declare-fun e!599731 () Bool)

(declare-fun b!1055302 () Bool)

(assert (=> b!1055302 (= e!599731 (arrayContainsKey!0 a!3488 k0!2747 lt!465725))))

(declare-fun b!1055303 () Bool)

(declare-fun e!599737 () Bool)

(assert (=> b!1055303 (= e!599737 e!599731)))

(declare-fun res!704154 () Bool)

(assert (=> b!1055303 (=> res!704154 e!599731)))

(assert (=> b!1055303 (= res!704154 (bvsle lt!465725 i!1381))))

(declare-fun b!1055304 () Bool)

(declare-fun res!704155 () Bool)

(assert (=> b!1055304 (=> (not res!704155) (not e!599730))))

(assert (=> b!1055304 (= res!704155 (= (select (arr!32009 a!3488) i!1381) k0!2747))))

(declare-fun b!1055305 () Bool)

(declare-fun res!704159 () Bool)

(assert (=> b!1055305 (=> (not res!704159) (not e!599730))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1055305 (= res!704159 (validKeyInArray!0 k0!2747))))

(declare-fun b!1055306 () Bool)

(declare-fun e!599734 () Bool)

(declare-fun e!599732 () Bool)

(assert (=> b!1055306 (= e!599734 e!599732)))

(declare-fun res!704160 () Bool)

(assert (=> b!1055306 (=> (not res!704160) (not e!599732))))

(assert (=> b!1055306 (= res!704160 (not (= lt!465725 i!1381)))))

(declare-fun lt!465726 () array!66560)

(declare-fun arrayScanForKey!0 (array!66560 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1055306 (= lt!465725 (arrayScanForKey!0 lt!465726 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1055307 () Bool)

(assert (=> b!1055307 (= e!599729 e!599736)))

(declare-fun res!704161 () Bool)

(assert (=> b!1055307 (=> (not res!704161) (not e!599736))))

(assert (=> b!1055307 (= res!704161 (not (contains!6181 Nil!22318 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1055308 () Bool)

(assert (=> b!1055308 (= e!599730 e!599734)))

(declare-fun res!704165 () Bool)

(assert (=> b!1055308 (=> (not res!704165) (not e!599734))))

(assert (=> b!1055308 (= res!704165 (arrayContainsKey!0 lt!465726 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1055308 (= lt!465726 (array!66561 (store (arr!32009 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32545 a!3488)))))

(declare-fun b!1055309 () Bool)

(assert (=> b!1055309 (= e!599732 (not e!599733))))

(declare-fun res!704158 () Bool)

(assert (=> b!1055309 (=> res!704158 e!599733)))

(assert (=> b!1055309 (= res!704158 (bvsle lt!465725 i!1381))))

(assert (=> b!1055309 e!599737))

(declare-fun res!704162 () Bool)

(assert (=> b!1055309 (=> (not res!704162) (not e!599737))))

(assert (=> b!1055309 (= res!704162 (= (select (store (arr!32009 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465725) k0!2747))))

(assert (= (and start!92984 res!704164) b!1055300))

(assert (= (and b!1055300 res!704157) b!1055305))

(assert (= (and b!1055305 res!704159) b!1055304))

(assert (= (and b!1055304 res!704155) b!1055308))

(assert (= (and b!1055308 res!704165) b!1055306))

(assert (= (and b!1055306 res!704160) b!1055309))

(assert (= (and b!1055309 res!704162) b!1055303))

(assert (= (and b!1055303 (not res!704154)) b!1055302))

(assert (= (and b!1055309 (not res!704158)) b!1055301))

(assert (= (and b!1055301 (not res!704156)) b!1055299))

(assert (= (and b!1055299 (not res!704163)) b!1055307))

(assert (= (and b!1055307 res!704161) b!1055298))

(declare-fun m!975301 () Bool)

(assert (=> b!1055306 m!975301))

(declare-fun m!975303 () Bool)

(assert (=> b!1055301 m!975303))

(declare-fun m!975305 () Bool)

(assert (=> b!1055301 m!975305))

(declare-fun m!975307 () Bool)

(assert (=> b!1055301 m!975307))

(declare-fun m!975309 () Bool)

(assert (=> b!1055301 m!975309))

(declare-fun m!975311 () Bool)

(assert (=> b!1055302 m!975311))

(declare-fun m!975313 () Bool)

(assert (=> b!1055304 m!975313))

(declare-fun m!975315 () Bool)

(assert (=> b!1055308 m!975315))

(declare-fun m!975317 () Bool)

(assert (=> b!1055308 m!975317))

(declare-fun m!975319 () Bool)

(assert (=> b!1055300 m!975319))

(declare-fun m!975321 () Bool)

(assert (=> b!1055299 m!975321))

(declare-fun m!975323 () Bool)

(assert (=> b!1055305 m!975323))

(assert (=> b!1055309 m!975317))

(declare-fun m!975325 () Bool)

(assert (=> b!1055309 m!975325))

(declare-fun m!975327 () Bool)

(assert (=> start!92984 m!975327))

(declare-fun m!975329 () Bool)

(assert (=> b!1055307 m!975329))

(declare-fun m!975331 () Bool)

(assert (=> b!1055298 m!975331))

(check-sat (not b!1055308) (not b!1055302) (not b!1055306) (not b!1055298) (not b!1055299) (not b!1055305) (not start!92984) (not b!1055300) (not b!1055301) (not b!1055307))
(check-sat)
(get-model)

(declare-fun bm!44794 () Bool)

(declare-fun call!44797 () Bool)

(declare-fun c!107034 () Bool)

(assert (=> bm!44794 (= call!44797 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107034 (Cons!22317 (select (arr!32009 a!3488) #b00000000000000000000000000000000) Nil!22318) Nil!22318)))))

(declare-fun d!128149 () Bool)

(declare-fun res!704209 () Bool)

(declare-fun e!599776 () Bool)

(assert (=> d!128149 (=> res!704209 e!599776)))

(assert (=> d!128149 (= res!704209 (bvsge #b00000000000000000000000000000000 (size!32545 a!3488)))))

(assert (=> d!128149 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22318) e!599776)))

(declare-fun b!1055356 () Bool)

(declare-fun e!599775 () Bool)

(assert (=> b!1055356 (= e!599775 call!44797)))

(declare-fun b!1055357 () Bool)

(assert (=> b!1055357 (= e!599775 call!44797)))

(declare-fun b!1055358 () Bool)

(declare-fun e!599774 () Bool)

(assert (=> b!1055358 (= e!599774 e!599775)))

(assert (=> b!1055358 (= c!107034 (validKeyInArray!0 (select (arr!32009 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1055359 () Bool)

(declare-fun e!599773 () Bool)

(assert (=> b!1055359 (= e!599773 (contains!6181 Nil!22318 (select (arr!32009 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1055360 () Bool)

(assert (=> b!1055360 (= e!599776 e!599774)))

(declare-fun res!704208 () Bool)

(assert (=> b!1055360 (=> (not res!704208) (not e!599774))))

(assert (=> b!1055360 (= res!704208 (not e!599773))))

(declare-fun res!704210 () Bool)

(assert (=> b!1055360 (=> (not res!704210) (not e!599773))))

(assert (=> b!1055360 (= res!704210 (validKeyInArray!0 (select (arr!32009 a!3488) #b00000000000000000000000000000000)))))

(assert (= (and d!128149 (not res!704209)) b!1055360))

(assert (= (and b!1055360 res!704210) b!1055359))

(assert (= (and b!1055360 res!704208) b!1055358))

(assert (= (and b!1055358 c!107034) b!1055356))

(assert (= (and b!1055358 (not c!107034)) b!1055357))

(assert (= (or b!1055356 b!1055357) bm!44794))

(declare-fun m!975365 () Bool)

(assert (=> bm!44794 m!975365))

(declare-fun m!975367 () Bool)

(assert (=> bm!44794 m!975367))

(assert (=> b!1055358 m!975365))

(assert (=> b!1055358 m!975365))

(declare-fun m!975369 () Bool)

(assert (=> b!1055358 m!975369))

(assert (=> b!1055359 m!975365))

(assert (=> b!1055359 m!975365))

(declare-fun m!975371 () Bool)

(assert (=> b!1055359 m!975371))

(assert (=> b!1055360 m!975365))

(assert (=> b!1055360 m!975365))

(assert (=> b!1055360 m!975369))

(assert (=> b!1055300 d!128149))

(declare-fun d!128151 () Bool)

(declare-fun res!704219 () Bool)

(declare-fun e!599785 () Bool)

(assert (=> d!128151 (=> res!704219 e!599785)))

(assert (=> d!128151 (= res!704219 (= (select (arr!32009 a!3488) (bvadd #b00000000000000000000000000000001 i!1381)) k0!2747))))

(assert (=> d!128151 (= (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381)) e!599785)))

(declare-fun b!1055369 () Bool)

(declare-fun e!599786 () Bool)

(assert (=> b!1055369 (= e!599785 e!599786)))

(declare-fun res!704220 () Bool)

(assert (=> b!1055369 (=> (not res!704220) (not e!599786))))

(assert (=> b!1055369 (= res!704220 (bvslt (bvadd #b00000000000000000000000000000001 i!1381 #b00000000000000000000000000000001) (size!32545 a!3488)))))

(declare-fun b!1055370 () Bool)

(assert (=> b!1055370 (= e!599786 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381 #b00000000000000000000000000000001)))))

(assert (= (and d!128151 (not res!704219)) b!1055369))

(assert (= (and b!1055369 res!704220) b!1055370))

(declare-fun m!975373 () Bool)

(assert (=> d!128151 m!975373))

(declare-fun m!975375 () Bool)

(assert (=> b!1055370 m!975375))

(assert (=> b!1055301 d!128151))

(declare-fun d!128157 () Bool)

(assert (=> d!128157 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!465744 () Unit!34576)

(declare-fun choose!114 (array!66560 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34576)

(assert (=> d!128157 (= lt!465744 (choose!114 a!3488 k0!2747 lt!465725 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> d!128157 (bvsge lt!465725 #b00000000000000000000000000000000)))

(assert (=> d!128157 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!465725 (bvadd #b00000000000000000000000000000001 i!1381)) lt!465744)))

(declare-fun bs!30935 () Bool)

(assert (= bs!30935 d!128157))

(assert (=> bs!30935 m!975303))

(declare-fun m!975383 () Bool)

(assert (=> bs!30935 m!975383))

(assert (=> b!1055301 d!128157))

(declare-fun c!107035 () Bool)

(declare-fun bm!44795 () Bool)

(declare-fun call!44798 () Bool)

(assert (=> bm!44795 (= call!44798 (arrayNoDuplicates!0 a!3488 (bvadd i!1381 #b00000000000000000000000000000001) (ite c!107035 (Cons!22317 (select (arr!32009 a!3488) i!1381) Nil!22318) Nil!22318)))))

(declare-fun d!128163 () Bool)

(declare-fun res!704224 () Bool)

(declare-fun e!599792 () Bool)

(assert (=> d!128163 (=> res!704224 e!599792)))

(assert (=> d!128163 (= res!704224 (bvsge i!1381 (size!32545 a!3488)))))

(assert (=> d!128163 (= (arrayNoDuplicates!0 a!3488 i!1381 Nil!22318) e!599792)))

(declare-fun b!1055373 () Bool)

(declare-fun e!599791 () Bool)

(assert (=> b!1055373 (= e!599791 call!44798)))

(declare-fun b!1055374 () Bool)

(assert (=> b!1055374 (= e!599791 call!44798)))

(declare-fun b!1055375 () Bool)

(declare-fun e!599790 () Bool)

(assert (=> b!1055375 (= e!599790 e!599791)))

(assert (=> b!1055375 (= c!107035 (validKeyInArray!0 (select (arr!32009 a!3488) i!1381)))))

(declare-fun b!1055376 () Bool)

(declare-fun e!599789 () Bool)

(assert (=> b!1055376 (= e!599789 (contains!6181 Nil!22318 (select (arr!32009 a!3488) i!1381)))))

(declare-fun b!1055377 () Bool)

(assert (=> b!1055377 (= e!599792 e!599790)))

(declare-fun res!704223 () Bool)

(assert (=> b!1055377 (=> (not res!704223) (not e!599790))))

(assert (=> b!1055377 (= res!704223 (not e!599789))))

(declare-fun res!704225 () Bool)

(assert (=> b!1055377 (=> (not res!704225) (not e!599789))))

(assert (=> b!1055377 (= res!704225 (validKeyInArray!0 (select (arr!32009 a!3488) i!1381)))))

(assert (= (and d!128163 (not res!704224)) b!1055377))

(assert (= (and b!1055377 res!704225) b!1055376))

(assert (= (and b!1055377 res!704223) b!1055375))

(assert (= (and b!1055375 c!107035) b!1055373))

(assert (= (and b!1055375 (not c!107035)) b!1055374))

(assert (= (or b!1055373 b!1055374) bm!44795))

(assert (=> bm!44795 m!975313))

(declare-fun m!975385 () Bool)

(assert (=> bm!44795 m!975385))

(assert (=> b!1055375 m!975313))

(assert (=> b!1055375 m!975313))

(declare-fun m!975387 () Bool)

(assert (=> b!1055375 m!975387))

(assert (=> b!1055376 m!975313))

(assert (=> b!1055376 m!975313))

(declare-fun m!975389 () Bool)

(assert (=> b!1055376 m!975389))

(assert (=> b!1055377 m!975313))

(assert (=> b!1055377 m!975313))

(assert (=> b!1055377 m!975387))

(assert (=> b!1055301 d!128163))

(declare-fun d!128165 () Bool)

(assert (=> d!128165 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22318)))

(declare-fun lt!465747 () Unit!34576)

(declare-fun choose!39 (array!66560 (_ BitVec 32) (_ BitVec 32)) Unit!34576)

(assert (=> d!128165 (= lt!465747 (choose!39 a!3488 #b00000000000000000000000000000000 i!1381))))

(assert (=> d!128165 (bvslt (size!32545 a!3488) #b01111111111111111111111111111111)))

(assert (=> d!128165 (= (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381) lt!465747)))

(declare-fun bs!30936 () Bool)

(assert (= bs!30936 d!128165))

(assert (=> bs!30936 m!975307))

(declare-fun m!975397 () Bool)

(assert (=> bs!30936 m!975397))

(assert (=> b!1055301 d!128165))

(declare-fun d!128169 () Bool)

(declare-fun lt!465756 () (_ BitVec 32))

(assert (=> d!128169 (and (or (bvslt lt!465756 #b00000000000000000000000000000000) (bvsge lt!465756 (size!32545 lt!465726)) (and (bvsge lt!465756 #b00000000000000000000000000000000) (bvslt lt!465756 (size!32545 lt!465726)))) (bvsge lt!465756 #b00000000000000000000000000000000) (bvslt lt!465756 (size!32545 lt!465726)) (= (select (arr!32009 lt!465726) lt!465756) k0!2747))))

(declare-fun e!599815 () (_ BitVec 32))

(assert (=> d!128169 (= lt!465756 e!599815)))

(declare-fun c!107041 () Bool)

(assert (=> d!128169 (= c!107041 (= (select (arr!32009 lt!465726) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128169 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32545 lt!465726)) (bvslt (size!32545 lt!465726) #b01111111111111111111111111111111))))

(assert (=> d!128169 (= (arrayScanForKey!0 lt!465726 k0!2747 #b00000000000000000000000000000000) lt!465756)))

(declare-fun b!1055405 () Bool)

(assert (=> b!1055405 (= e!599815 #b00000000000000000000000000000000)))

(declare-fun b!1055406 () Bool)

(assert (=> b!1055406 (= e!599815 (arrayScanForKey!0 lt!465726 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128169 c!107041) b!1055405))

(assert (= (and d!128169 (not c!107041)) b!1055406))

(declare-fun m!975411 () Bool)

(assert (=> d!128169 m!975411))

(declare-fun m!975413 () Bool)

(assert (=> d!128169 m!975413))

(declare-fun m!975415 () Bool)

(assert (=> b!1055406 m!975415))

(assert (=> b!1055306 d!128169))

(declare-fun d!128179 () Bool)

(declare-fun lt!465761 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!530 (List!22321) (InoxSet (_ BitVec 64)))

(assert (=> d!128179 (= lt!465761 (select (content!530 Nil!22318) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!599835 () Bool)

(assert (=> d!128179 (= lt!465761 e!599835)))

(declare-fun res!704257 () Bool)

(assert (=> d!128179 (=> (not res!704257) (not e!599835))))

(get-info :version)

(assert (=> d!128179 (= res!704257 ((_ is Cons!22317) Nil!22318))))

(assert (=> d!128179 (= (contains!6181 Nil!22318 #b0000000000000000000000000000000000000000000000000000000000000000) lt!465761)))

(declare-fun b!1055430 () Bool)

(declare-fun e!599834 () Bool)

(assert (=> b!1055430 (= e!599835 e!599834)))

(declare-fun res!704256 () Bool)

(assert (=> b!1055430 (=> res!704256 e!599834)))

(assert (=> b!1055430 (= res!704256 (= (h!23526 Nil!22318) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1055431 () Bool)

(assert (=> b!1055431 (= e!599834 (contains!6181 (t!31628 Nil!22318) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!128179 res!704257) b!1055430))

(assert (= (and b!1055430 (not res!704256)) b!1055431))

(declare-fun m!975421 () Bool)

(assert (=> d!128179 m!975421))

(declare-fun m!975423 () Bool)

(assert (=> d!128179 m!975423))

(declare-fun m!975425 () Bool)

(assert (=> b!1055431 m!975425))

(assert (=> b!1055307 d!128179))

(declare-fun d!128181 () Bool)

(declare-fun res!704258 () Bool)

(declare-fun e!599836 () Bool)

(assert (=> d!128181 (=> res!704258 e!599836)))

(assert (=> d!128181 (= res!704258 (= (select (arr!32009 a!3488) lt!465725) k0!2747))))

(assert (=> d!128181 (= (arrayContainsKey!0 a!3488 k0!2747 lt!465725) e!599836)))

(declare-fun b!1055432 () Bool)

(declare-fun e!599837 () Bool)

(assert (=> b!1055432 (= e!599836 e!599837)))

(declare-fun res!704259 () Bool)

(assert (=> b!1055432 (=> (not res!704259) (not e!599837))))

(assert (=> b!1055432 (= res!704259 (bvslt (bvadd lt!465725 #b00000000000000000000000000000001) (size!32545 a!3488)))))

(declare-fun b!1055433 () Bool)

(assert (=> b!1055433 (= e!599837 (arrayContainsKey!0 a!3488 k0!2747 (bvadd lt!465725 #b00000000000000000000000000000001)))))

(assert (= (and d!128181 (not res!704258)) b!1055432))

(assert (= (and b!1055432 res!704259) b!1055433))

(declare-fun m!975431 () Bool)

(assert (=> d!128181 m!975431))

(declare-fun m!975433 () Bool)

(assert (=> b!1055433 m!975433))

(assert (=> b!1055302 d!128181))

(declare-fun d!128185 () Bool)

(declare-fun res!704260 () Bool)

(declare-fun e!599838 () Bool)

(assert (=> d!128185 (=> res!704260 e!599838)))

(assert (=> d!128185 (= res!704260 (= (select (arr!32009 lt!465726) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128185 (= (arrayContainsKey!0 lt!465726 k0!2747 #b00000000000000000000000000000000) e!599838)))

(declare-fun b!1055434 () Bool)

(declare-fun e!599839 () Bool)

(assert (=> b!1055434 (= e!599838 e!599839)))

(declare-fun res!704261 () Bool)

(assert (=> b!1055434 (=> (not res!704261) (not e!599839))))

(assert (=> b!1055434 (= res!704261 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32545 lt!465726)))))

(declare-fun b!1055435 () Bool)

(assert (=> b!1055435 (= e!599839 (arrayContainsKey!0 lt!465726 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128185 (not res!704260)) b!1055434))

(assert (= (and b!1055434 res!704261) b!1055435))

(assert (=> d!128185 m!975413))

(declare-fun m!975435 () Bool)

(assert (=> b!1055435 m!975435))

(assert (=> b!1055308 d!128185))

(declare-fun d!128187 () Bool)

(declare-fun lt!465763 () Bool)

(assert (=> d!128187 (= lt!465763 (select (content!530 Nil!22318) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!599842 () Bool)

(assert (=> d!128187 (= lt!465763 e!599842)))

(declare-fun res!704263 () Bool)

(assert (=> d!128187 (=> (not res!704263) (not e!599842))))

(assert (=> d!128187 (= res!704263 ((_ is Cons!22317) Nil!22318))))

(assert (=> d!128187 (= (contains!6181 Nil!22318 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465763)))

(declare-fun b!1055438 () Bool)

(declare-fun e!599841 () Bool)

(assert (=> b!1055438 (= e!599842 e!599841)))

(declare-fun res!704262 () Bool)

(assert (=> b!1055438 (=> res!704262 e!599841)))

(assert (=> b!1055438 (= res!704262 (= (h!23526 Nil!22318) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1055439 () Bool)

(assert (=> b!1055439 (= e!599841 (contains!6181 (t!31628 Nil!22318) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!128187 res!704263) b!1055438))

(assert (= (and b!1055438 (not res!704262)) b!1055439))

(assert (=> d!128187 m!975421))

(declare-fun m!975441 () Bool)

(assert (=> d!128187 m!975441))

(declare-fun m!975443 () Bool)

(assert (=> b!1055439 m!975443))

(assert (=> b!1055298 d!128187))

(declare-fun d!128191 () Bool)

(declare-fun res!704281 () Bool)

(declare-fun e!599861 () Bool)

(assert (=> d!128191 (=> res!704281 e!599861)))

(assert (=> d!128191 (= res!704281 ((_ is Nil!22318) Nil!22318))))

(assert (=> d!128191 (= (noDuplicate!1549 Nil!22318) e!599861)))

(declare-fun b!1055459 () Bool)

(declare-fun e!599862 () Bool)

(assert (=> b!1055459 (= e!599861 e!599862)))

(declare-fun res!704282 () Bool)

(assert (=> b!1055459 (=> (not res!704282) (not e!599862))))

(assert (=> b!1055459 (= res!704282 (not (contains!6181 (t!31628 Nil!22318) (h!23526 Nil!22318))))))

(declare-fun b!1055460 () Bool)

(assert (=> b!1055460 (= e!599862 (noDuplicate!1549 (t!31628 Nil!22318)))))

(assert (= (and d!128191 (not res!704281)) b!1055459))

(assert (= (and b!1055459 res!704282) b!1055460))

(declare-fun m!975465 () Bool)

(assert (=> b!1055459 m!975465))

(declare-fun m!975467 () Bool)

(assert (=> b!1055460 m!975467))

(assert (=> b!1055299 d!128191))

(declare-fun d!128203 () Bool)

(assert (=> d!128203 (= (validKeyInArray!0 k0!2747) (and (not (= k0!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1055305 d!128203))

(declare-fun d!128205 () Bool)

(assert (=> d!128205 (= (array_inv!24789 a!3488) (bvsge (size!32545 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!92984 d!128205))

(check-sat (not d!128179) (not b!1055406) (not b!1055358) (not bm!44795) (not b!1055460) (not b!1055370) (not b!1055439) (not b!1055375) (not d!128165) (not b!1055435) (not b!1055359) (not b!1055431) (not d!128187) (not b!1055376) (not bm!44794) (not b!1055377) (not b!1055459) (not d!128157) (not b!1055360) (not b!1055433))
(check-sat)
