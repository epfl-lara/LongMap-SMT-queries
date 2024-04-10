; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131250 () Bool)

(assert start!131250)

(declare-fun b!1539441 () Bool)

(declare-fun res!1056335 () Bool)

(declare-fun e!856279 () Bool)

(assert (=> b!1539441 (=> (not res!1056335) (not e!856279))))

(declare-datatypes ((array!102276 0))(
  ( (array!102277 (arr!49351 (Array (_ BitVec 32) (_ BitVec 64))) (size!49901 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102276)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1539441 (= res!1056335 (and (= (size!49901 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49901 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49901 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1539442 () Bool)

(declare-fun res!1056332 () Bool)

(assert (=> b!1539442 (=> (not res!1056332) (not e!856279))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1539442 (= res!1056332 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49901 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49901 a!2792)) (= (select (arr!49351 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1056330 () Bool)

(assert (=> start!131250 (=> (not res!1056330) (not e!856279))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131250 (= res!1056330 (validMask!0 mask!2480))))

(assert (=> start!131250 e!856279))

(assert (=> start!131250 true))

(declare-fun array_inv!38379 (array!102276) Bool)

(assert (=> start!131250 (array_inv!38379 a!2792)))

(declare-fun b!1539443 () Bool)

(declare-fun res!1056331 () Bool)

(assert (=> b!1539443 (=> (not res!1056331) (not e!856279))))

(declare-datatypes ((SeekEntryResult!13477 0))(
  ( (MissingZero!13477 (index!56303 (_ BitVec 32))) (Found!13477 (index!56304 (_ BitVec 32))) (Intermediate!13477 (undefined!14289 Bool) (index!56305 (_ BitVec 32)) (x!138032 (_ BitVec 32))) (Undefined!13477) (MissingVacant!13477 (index!56306 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102276 (_ BitVec 32)) SeekEntryResult!13477)

(assert (=> b!1539443 (= res!1056331 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49351 a!2792) j!64) a!2792 mask!2480) (Found!13477 j!64)))))

(declare-fun b!1539444 () Bool)

(declare-fun res!1056329 () Bool)

(assert (=> b!1539444 (=> (not res!1056329) (not e!856279))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1539444 (= res!1056329 (validKeyInArray!0 (select (arr!49351 a!2792) j!64)))))

(declare-fun lt!665050 () (_ BitVec 32))

(declare-fun b!1539445 () Bool)

(assert (=> b!1539445 (= e!856279 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (or (bvslt lt!665050 #b00000000000000000000000000000000) (bvsge lt!665050 (size!49901 a!2792)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1539445 (= lt!665050 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1539446 () Bool)

(declare-fun res!1056334 () Bool)

(assert (=> b!1539446 (=> (not res!1056334) (not e!856279))))

(assert (=> b!1539446 (= res!1056334 (validKeyInArray!0 (select (arr!49351 a!2792) i!951)))))

(declare-fun b!1539447 () Bool)

(declare-fun res!1056333 () Bool)

(assert (=> b!1539447 (=> (not res!1056333) (not e!856279))))

(declare-datatypes ((List!35825 0))(
  ( (Nil!35822) (Cons!35821 (h!37266 (_ BitVec 64)) (t!50519 List!35825)) )
))
(declare-fun arrayNoDuplicates!0 (array!102276 (_ BitVec 32) List!35825) Bool)

(assert (=> b!1539447 (= res!1056333 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35822))))

(declare-fun b!1539448 () Bool)

(declare-fun res!1056336 () Bool)

(assert (=> b!1539448 (=> (not res!1056336) (not e!856279))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102276 (_ BitVec 32)) Bool)

(assert (=> b!1539448 (= res!1056336 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1539449 () Bool)

(declare-fun res!1056337 () Bool)

(assert (=> b!1539449 (=> (not res!1056337) (not e!856279))))

(assert (=> b!1539449 (= res!1056337 (not (= (select (arr!49351 a!2792) index!463) (select (arr!49351 a!2792) j!64))))))

(assert (= (and start!131250 res!1056330) b!1539441))

(assert (= (and b!1539441 res!1056335) b!1539446))

(assert (= (and b!1539446 res!1056334) b!1539444))

(assert (= (and b!1539444 res!1056329) b!1539448))

(assert (= (and b!1539448 res!1056336) b!1539447))

(assert (= (and b!1539447 res!1056333) b!1539442))

(assert (= (and b!1539442 res!1056332) b!1539443))

(assert (= (and b!1539443 res!1056331) b!1539449))

(assert (= (and b!1539449 res!1056337) b!1539445))

(declare-fun m!1421715 () Bool)

(assert (=> b!1539447 m!1421715))

(declare-fun m!1421717 () Bool)

(assert (=> b!1539442 m!1421717))

(declare-fun m!1421719 () Bool)

(assert (=> b!1539444 m!1421719))

(assert (=> b!1539444 m!1421719))

(declare-fun m!1421721 () Bool)

(assert (=> b!1539444 m!1421721))

(declare-fun m!1421723 () Bool)

(assert (=> b!1539445 m!1421723))

(declare-fun m!1421725 () Bool)

(assert (=> b!1539448 m!1421725))

(declare-fun m!1421727 () Bool)

(assert (=> start!131250 m!1421727))

(declare-fun m!1421729 () Bool)

(assert (=> start!131250 m!1421729))

(declare-fun m!1421731 () Bool)

(assert (=> b!1539446 m!1421731))

(assert (=> b!1539446 m!1421731))

(declare-fun m!1421733 () Bool)

(assert (=> b!1539446 m!1421733))

(assert (=> b!1539443 m!1421719))

(assert (=> b!1539443 m!1421719))

(declare-fun m!1421735 () Bool)

(assert (=> b!1539443 m!1421735))

(declare-fun m!1421737 () Bool)

(assert (=> b!1539449 m!1421737))

(assert (=> b!1539449 m!1421719))

(push 1)

(assert (not start!131250))

(assert (not b!1539448))

(assert (not b!1539447))

(assert (not b!1539445))

(assert (not b!1539444))

(assert (not b!1539446))

(assert (not b!1539443))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1539512 () Bool)

(declare-fun e!856325 () Bool)

(declare-fun contains!10014 (List!35825 (_ BitVec 64)) Bool)

(assert (=> b!1539512 (= e!856325 (contains!10014 Nil!35822 (select (arr!49351 a!2792) #b00000000000000000000000000000000)))))

(declare-fun d!160441 () Bool)

(declare-fun res!1056364 () Bool)

(declare-fun e!856326 () Bool)

(assert (=> d!160441 (=> res!1056364 e!856326)))

(assert (=> d!160441 (= res!1056364 (bvsge #b00000000000000000000000000000000 (size!49901 a!2792)))))

(assert (=> d!160441 (= (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35822) e!856326)))

(declare-fun b!1539513 () Bool)

(declare-fun e!856323 () Bool)

(declare-fun call!68625 () Bool)

(assert (=> b!1539513 (= e!856323 call!68625)))

(declare-fun b!1539514 () Bool)

(declare-fun e!856324 () Bool)

(assert (=> b!1539514 (= e!856324 e!856323)))

(declare-fun c!141133 () Bool)

(assert (=> b!1539514 (= c!141133 (validKeyInArray!0 (select (arr!49351 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1539515 () Bool)

(assert (=> b!1539515 (= e!856323 call!68625)))

(declare-fun bm!68622 () Bool)

(assert (=> bm!68622 (= call!68625 (arrayNoDuplicates!0 a!2792 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!141133 (Cons!35821 (select (arr!49351 a!2792) #b00000000000000000000000000000000) Nil!35822) Nil!35822)))))

(declare-fun b!1539516 () Bool)

(assert (=> b!1539516 (= e!856326 e!856324)))

(declare-fun res!1056362 () Bool)

(assert (=> b!1539516 (=> (not res!1056362) (not e!856324))))

(assert (=> b!1539516 (= res!1056362 (not e!856325))))

(declare-fun res!1056363 () Bool)

(assert (=> b!1539516 (=> (not res!1056363) (not e!856325))))

(assert (=> b!1539516 (= res!1056363 (validKeyInArray!0 (select (arr!49351 a!2792) #b00000000000000000000000000000000)))))

(assert (= (and d!160441 (not res!1056364)) b!1539516))

(assert (= (and b!1539516 res!1056363) b!1539512))

(assert (= (and b!1539516 res!1056362) b!1539514))

(assert (= (and b!1539514 c!141133) b!1539513))

(assert (= (and b!1539514 (not c!141133)) b!1539515))

(assert (= (or b!1539513 b!1539515) bm!68622))

(declare-fun m!1421773 () Bool)

(assert (=> b!1539512 m!1421773))

(assert (=> b!1539512 m!1421773))

(declare-fun m!1421775 () Bool)

(assert (=> b!1539512 m!1421775))

(assert (=> b!1539514 m!1421773))

(assert (=> b!1539514 m!1421773))

(declare-fun m!1421777 () Bool)

(assert (=> b!1539514 m!1421777))

(assert (=> bm!68622 m!1421773))

(declare-fun m!1421779 () Bool)

(assert (=> bm!68622 m!1421779))

(assert (=> b!1539516 m!1421773))

(assert (=> b!1539516 m!1421773))

(assert (=> b!1539516 m!1421777))

(assert (=> b!1539447 d!160441))

(declare-fun d!160447 () Bool)

(declare-fun res!1056373 () Bool)

(declare-fun e!856338 () Bool)

(assert (=> d!160447 (=> res!1056373 e!856338)))

(assert (=> d!160447 (= res!1056373 (bvsge #b00000000000000000000000000000000 (size!49901 a!2792)))))

(assert (=> d!160447 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480) e!856338)))

(declare-fun b!1539530 () Bool)

(declare-fun e!856339 () Bool)

(assert (=> b!1539530 (= e!856338 e!856339)))

(declare-fun c!141137 () Bool)

(assert (=> b!1539530 (= c!141137 (validKeyInArray!0 (select (arr!49351 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1539531 () Bool)

(declare-fun call!68631 () Bool)

(assert (=> b!1539531 (= e!856339 call!68631)))

(declare-fun b!1539532 () Bool)

(declare-fun e!856337 () Bool)

(assert (=> b!1539532 (= e!856337 call!68631)))

(declare-fun b!1539533 () Bool)

(assert (=> b!1539533 (= e!856339 e!856337)))

(declare-fun lt!665089 () (_ BitVec 64))

(assert (=> b!1539533 (= lt!665089 (select (arr!49351 a!2792) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51414 0))(
  ( (Unit!51415) )
))
(declare-fun lt!665087 () Unit!51414)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!102276 (_ BitVec 64) (_ BitVec 32)) Unit!51414)

(assert (=> b!1539533 (= lt!665087 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2792 lt!665089 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!102276 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1539533 (arrayContainsKey!0 a!2792 lt!665089 #b00000000000000000000000000000000)))

(declare-fun lt!665088 () Unit!51414)

(assert (=> b!1539533 (= lt!665088 lt!665087)))

(declare-fun res!1056372 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!102276 (_ BitVec 32)) SeekEntryResult!13477)

(assert (=> b!1539533 (= res!1056372 (= (seekEntryOrOpen!0 (select (arr!49351 a!2792) #b00000000000000000000000000000000) a!2792 mask!2480) (Found!13477 #b00000000000000000000000000000000)))))

(assert (=> b!1539533 (=> (not res!1056372) (not e!856337))))

(declare-fun bm!68628 () Bool)

(assert (=> bm!68628 (= call!68631 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2792 mask!2480))))

(assert (= (and d!160447 (not res!1056373)) b!1539530))

(assert (= (and b!1539530 c!141137) b!1539533))

(assert (= (and b!1539530 (not c!141137)) b!1539531))

(assert (= (and b!1539533 res!1056372) b!1539532))

(assert (= (or b!1539532 b!1539531) bm!68628))

(assert (=> b!1539530 m!1421773))

(assert (=> b!1539530 m!1421773))

(assert (=> b!1539530 m!1421777))

(assert (=> b!1539533 m!1421773))

(declare-fun m!1421785 () Bool)

(assert (=> b!1539533 m!1421785))

