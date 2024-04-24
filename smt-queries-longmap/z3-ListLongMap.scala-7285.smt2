; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93306 () Bool)

(assert start!93306)

(declare-fun b!1057284 () Bool)

(declare-fun e!601083 () Bool)

(declare-fun e!601082 () Bool)

(assert (=> b!1057284 (= e!601083 (not e!601082))))

(declare-fun res!705297 () Bool)

(assert (=> b!1057284 (=> res!705297 e!601082)))

(declare-fun lt!466522 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1057284 (= res!705297 (or (bvsgt lt!466522 i!1381) (bvsle i!1381 lt!466522)))))

(declare-datatypes ((array!66646 0))(
  ( (array!66647 (arr!32044 (Array (_ BitVec 32) (_ BitVec 64))) (size!32581 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66646)

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1057284 (= (select (store (arr!32044 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466522) k0!2747)))

(declare-fun b!1057285 () Bool)

(declare-fun e!601080 () Bool)

(declare-fun e!601084 () Bool)

(assert (=> b!1057285 (= e!601080 e!601084)))

(declare-fun res!705299 () Bool)

(assert (=> b!1057285 (=> (not res!705299) (not e!601084))))

(declare-fun lt!466523 () array!66646)

(declare-fun arrayContainsKey!0 (array!66646 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1057285 (= res!705299 (arrayContainsKey!0 lt!466523 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1057285 (= lt!466523 (array!66647 (store (arr!32044 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32581 a!3488)))))

(declare-fun res!705294 () Bool)

(assert (=> start!93306 (=> (not res!705294) (not e!601080))))

(assert (=> start!93306 (= res!705294 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32581 a!3488)) (bvslt (size!32581 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93306 e!601080))

(assert (=> start!93306 true))

(declare-fun array_inv!24826 (array!66646) Bool)

(assert (=> start!93306 (array_inv!24826 a!3488)))

(declare-fun b!1057286 () Bool)

(declare-fun res!705293 () Bool)

(assert (=> b!1057286 (=> (not res!705293) (not e!601080))))

(declare-datatypes ((List!22326 0))(
  ( (Nil!22323) (Cons!22322 (h!23540 (_ BitVec 64)) (t!31625 List!22326)) )
))
(declare-fun arrayNoDuplicates!0 (array!66646 (_ BitVec 32) List!22326) Bool)

(assert (=> b!1057286 (= res!705293 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22323))))

(declare-fun b!1057287 () Bool)

(declare-fun res!705295 () Bool)

(assert (=> b!1057287 (=> (not res!705295) (not e!601080))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1057287 (= res!705295 (validKeyInArray!0 k0!2747))))

(declare-fun b!1057288 () Bool)

(assert (=> b!1057288 (= e!601084 e!601083)))

(declare-fun res!705296 () Bool)

(assert (=> b!1057288 (=> (not res!705296) (not e!601083))))

(assert (=> b!1057288 (= res!705296 (not (= lt!466522 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66646 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1057288 (= lt!466522 (arrayScanForKey!0 lt!466523 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1057289 () Bool)

(declare-fun res!705298 () Bool)

(assert (=> b!1057289 (=> (not res!705298) (not e!601080))))

(assert (=> b!1057289 (= res!705298 (= (select (arr!32044 a!3488) i!1381) k0!2747))))

(declare-fun b!1057290 () Bool)

(assert (=> b!1057290 (= e!601082 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(assert (= (and start!93306 res!705294) b!1057286))

(assert (= (and b!1057286 res!705293) b!1057287))

(assert (= (and b!1057287 res!705295) b!1057289))

(assert (= (and b!1057289 res!705298) b!1057285))

(assert (= (and b!1057285 res!705299) b!1057288))

(assert (= (and b!1057288 res!705296) b!1057284))

(assert (= (and b!1057284 (not res!705297)) b!1057290))

(declare-fun m!977621 () Bool)

(assert (=> start!93306 m!977621))

(declare-fun m!977623 () Bool)

(assert (=> b!1057286 m!977623))

(declare-fun m!977625 () Bool)

(assert (=> b!1057285 m!977625))

(declare-fun m!977627 () Bool)

(assert (=> b!1057285 m!977627))

(declare-fun m!977629 () Bool)

(assert (=> b!1057287 m!977629))

(declare-fun m!977631 () Bool)

(assert (=> b!1057290 m!977631))

(declare-fun m!977633 () Bool)

(assert (=> b!1057288 m!977633))

(assert (=> b!1057284 m!977627))

(declare-fun m!977635 () Bool)

(assert (=> b!1057284 m!977635))

(declare-fun m!977637 () Bool)

(assert (=> b!1057289 m!977637))

(check-sat (not b!1057290) (not b!1057287) (not b!1057285) (not b!1057288) (not start!93306) (not b!1057286))
(check-sat)
(get-model)

(declare-fun b!1057343 () Bool)

(declare-fun e!601124 () Bool)

(declare-fun call!44876 () Bool)

(assert (=> b!1057343 (= e!601124 call!44876)))

(declare-fun bm!44873 () Bool)

(declare-fun c!107465 () Bool)

(assert (=> bm!44873 (= call!44876 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107465 (Cons!22322 (select (arr!32044 a!3488) #b00000000000000000000000000000000) Nil!22323) Nil!22323)))))

(declare-fun d!128701 () Bool)

(declare-fun res!705349 () Bool)

(declare-fun e!601126 () Bool)

(assert (=> d!128701 (=> res!705349 e!601126)))

(assert (=> d!128701 (= res!705349 (bvsge #b00000000000000000000000000000000 (size!32581 a!3488)))))

(assert (=> d!128701 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22323) e!601126)))

(declare-fun b!1057344 () Bool)

(declare-fun e!601123 () Bool)

(assert (=> b!1057344 (= e!601123 e!601124)))

(assert (=> b!1057344 (= c!107465 (validKeyInArray!0 (select (arr!32044 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1057345 () Bool)

(assert (=> b!1057345 (= e!601124 call!44876)))

(declare-fun b!1057346 () Bool)

(assert (=> b!1057346 (= e!601126 e!601123)))

(declare-fun res!705348 () Bool)

(assert (=> b!1057346 (=> (not res!705348) (not e!601123))))

(declare-fun e!601125 () Bool)

(assert (=> b!1057346 (= res!705348 (not e!601125))))

(declare-fun res!705350 () Bool)

(assert (=> b!1057346 (=> (not res!705350) (not e!601125))))

(assert (=> b!1057346 (= res!705350 (validKeyInArray!0 (select (arr!32044 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1057347 () Bool)

(declare-fun contains!6214 (List!22326 (_ BitVec 64)) Bool)

(assert (=> b!1057347 (= e!601125 (contains!6214 Nil!22323 (select (arr!32044 a!3488) #b00000000000000000000000000000000)))))

(assert (= (and d!128701 (not res!705349)) b!1057346))

(assert (= (and b!1057346 res!705350) b!1057347))

(assert (= (and b!1057346 res!705348) b!1057344))

(assert (= (and b!1057344 c!107465) b!1057345))

(assert (= (and b!1057344 (not c!107465)) b!1057343))

(assert (= (or b!1057345 b!1057343) bm!44873))

(declare-fun m!977675 () Bool)

(assert (=> bm!44873 m!977675))

(declare-fun m!977677 () Bool)

(assert (=> bm!44873 m!977677))

(assert (=> b!1057344 m!977675))

(assert (=> b!1057344 m!977675))

(declare-fun m!977679 () Bool)

(assert (=> b!1057344 m!977679))

(assert (=> b!1057346 m!977675))

(assert (=> b!1057346 m!977675))

(assert (=> b!1057346 m!977679))

(assert (=> b!1057347 m!977675))

(assert (=> b!1057347 m!977675))

(declare-fun m!977681 () Bool)

(assert (=> b!1057347 m!977681))

(assert (=> b!1057286 d!128701))

(declare-fun d!128705 () Bool)

(assert (=> d!128705 (= (array_inv!24826 a!3488) (bvsge (size!32581 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!93306 d!128705))

(declare-fun d!128707 () Bool)

(declare-fun res!705361 () Bool)

(declare-fun e!601137 () Bool)

(assert (=> d!128707 (=> res!705361 e!601137)))

(assert (=> d!128707 (= res!705361 (= (select (arr!32044 lt!466523) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128707 (= (arrayContainsKey!0 lt!466523 k0!2747 #b00000000000000000000000000000000) e!601137)))

(declare-fun b!1057358 () Bool)

(declare-fun e!601138 () Bool)

(assert (=> b!1057358 (= e!601137 e!601138)))

(declare-fun res!705362 () Bool)

(assert (=> b!1057358 (=> (not res!705362) (not e!601138))))

(assert (=> b!1057358 (= res!705362 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32581 lt!466523)))))

(declare-fun b!1057359 () Bool)

(assert (=> b!1057359 (= e!601138 (arrayContainsKey!0 lt!466523 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128707 (not res!705361)) b!1057358))

(assert (= (and b!1057358 res!705362) b!1057359))

(declare-fun m!977685 () Bool)

(assert (=> d!128707 m!977685))

(declare-fun m!977687 () Bool)

(assert (=> b!1057359 m!977687))

(assert (=> b!1057285 d!128707))

(declare-fun d!128713 () Bool)

(declare-fun res!705363 () Bool)

(declare-fun e!601139 () Bool)

(assert (=> d!128713 (=> res!705363 e!601139)))

(assert (=> d!128713 (= res!705363 (= (select (arr!32044 a!3488) i!1381) k0!2747))))

(assert (=> d!128713 (= (arrayContainsKey!0 a!3488 k0!2747 i!1381) e!601139)))

(declare-fun b!1057360 () Bool)

(declare-fun e!601140 () Bool)

(assert (=> b!1057360 (= e!601139 e!601140)))

(declare-fun res!705364 () Bool)

(assert (=> b!1057360 (=> (not res!705364) (not e!601140))))

(assert (=> b!1057360 (= res!705364 (bvslt (bvadd i!1381 #b00000000000000000000000000000001) (size!32581 a!3488)))))

(declare-fun b!1057361 () Bool)

(assert (=> b!1057361 (= e!601140 (arrayContainsKey!0 a!3488 k0!2747 (bvadd i!1381 #b00000000000000000000000000000001)))))

(assert (= (and d!128713 (not res!705363)) b!1057360))

(assert (= (and b!1057360 res!705364) b!1057361))

(assert (=> d!128713 m!977637))

(declare-fun m!977689 () Bool)

(assert (=> b!1057361 m!977689))

(assert (=> b!1057290 d!128713))

(declare-fun d!128715 () Bool)

(declare-fun lt!466538 () (_ BitVec 32))

(assert (=> d!128715 (and (or (bvslt lt!466538 #b00000000000000000000000000000000) (bvsge lt!466538 (size!32581 lt!466523)) (and (bvsge lt!466538 #b00000000000000000000000000000000) (bvslt lt!466538 (size!32581 lt!466523)))) (bvsge lt!466538 #b00000000000000000000000000000000) (bvslt lt!466538 (size!32581 lt!466523)) (= (select (arr!32044 lt!466523) lt!466538) k0!2747))))

(declare-fun e!601163 () (_ BitVec 32))

(assert (=> d!128715 (= lt!466538 e!601163)))

(declare-fun c!107471 () Bool)

(assert (=> d!128715 (= c!107471 (= (select (arr!32044 lt!466523) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128715 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32581 lt!466523)) (bvslt (size!32581 lt!466523) #b01111111111111111111111111111111))))

(assert (=> d!128715 (= (arrayScanForKey!0 lt!466523 k0!2747 #b00000000000000000000000000000000) lt!466538)))

(declare-fun b!1057389 () Bool)

(assert (=> b!1057389 (= e!601163 #b00000000000000000000000000000000)))

(declare-fun b!1057390 () Bool)

(assert (=> b!1057390 (= e!601163 (arrayScanForKey!0 lt!466523 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128715 c!107471) b!1057389))

(assert (= (and d!128715 (not c!107471)) b!1057390))

(declare-fun m!977705 () Bool)

(assert (=> d!128715 m!977705))

(assert (=> d!128715 m!977685))

(declare-fun m!977707 () Bool)

(assert (=> b!1057390 m!977707))

(assert (=> b!1057288 d!128715))

(declare-fun d!128729 () Bool)

(assert (=> d!128729 (= (validKeyInArray!0 k0!2747) (and (not (= k0!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1057287 d!128729))

(check-sat (not bm!44873) (not b!1057346) (not b!1057344) (not b!1057347) (not b!1057359) (not b!1057390) (not b!1057361))
(check-sat)
