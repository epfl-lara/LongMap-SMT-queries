; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130584 () Bool)

(assert start!130584)

(declare-fun res!1049572 () Bool)

(declare-fun e!853716 () Bool)

(assert (=> start!130584 (=> (not res!1049572) (not e!853716))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130584 (= res!1049572 (validMask!0 mask!2480))))

(assert (=> start!130584 e!853716))

(assert (=> start!130584 true))

(declare-datatypes ((array!101713 0))(
  ( (array!101714 (arr!49075 (Array (_ BitVec 32) (_ BitVec 64))) (size!49627 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101713)

(declare-fun array_inv!38308 (array!101713) Bool)

(assert (=> start!130584 (array_inv!38308 a!2792)))

(declare-fun b!1532280 () Bool)

(declare-fun res!1049570 () Bool)

(assert (=> b!1532280 (=> (not res!1049570) (not e!853716))))

(assert (=> b!1532280 (= res!1049570 (and (bvsle #b00000000000000000000000000000000 (size!49627 a!2792)) (bvslt (size!49627 a!2792) #b01111111111111111111111111111111)))))

(declare-fun b!1532281 () Bool)

(declare-fun res!1049575 () Bool)

(assert (=> b!1532281 (=> (not res!1049575) (not e!853716))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1532281 (= res!1049575 (and (= (size!49627 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49627 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49627 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1532282 () Bool)

(declare-fun e!853715 () Bool)

(assert (=> b!1532282 (= e!853716 e!853715)))

(declare-fun res!1049571 () Bool)

(assert (=> b!1532282 (=> res!1049571 e!853715)))

(declare-datatypes ((List!35627 0))(
  ( (Nil!35624) (Cons!35623 (h!37069 (_ BitVec 64)) (t!50313 List!35627)) )
))
(declare-fun contains!9970 (List!35627 (_ BitVec 64)) Bool)

(assert (=> b!1532282 (= res!1049571 (contains!9970 Nil!35624 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1532283 () Bool)

(declare-fun res!1049568 () Bool)

(assert (=> b!1532283 (=> (not res!1049568) (not e!853716))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101713 (_ BitVec 32)) Bool)

(assert (=> b!1532283 (= res!1049568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1532284 () Bool)

(assert (=> b!1532284 (= e!853715 (contains!9970 Nil!35624 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1532285 () Bool)

(declare-fun res!1049573 () Bool)

(assert (=> b!1532285 (=> (not res!1049573) (not e!853716))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532285 (= res!1049573 (validKeyInArray!0 (select (arr!49075 a!2792) j!64)))))

(declare-fun b!1532286 () Bool)

(declare-fun res!1049574 () Bool)

(assert (=> b!1532286 (=> (not res!1049574) (not e!853716))))

(assert (=> b!1532286 (= res!1049574 (validKeyInArray!0 (select (arr!49075 a!2792) i!951)))))

(declare-fun b!1532287 () Bool)

(declare-fun res!1049569 () Bool)

(assert (=> b!1532287 (=> (not res!1049569) (not e!853716))))

(declare-fun noDuplicate!2655 (List!35627) Bool)

(assert (=> b!1532287 (= res!1049569 (noDuplicate!2655 Nil!35624))))

(assert (= (and start!130584 res!1049572) b!1532281))

(assert (= (and b!1532281 res!1049575) b!1532286))

(assert (= (and b!1532286 res!1049574) b!1532285))

(assert (= (and b!1532285 res!1049573) b!1532283))

(assert (= (and b!1532283 res!1049568) b!1532280))

(assert (= (and b!1532280 res!1049570) b!1532287))

(assert (= (and b!1532287 res!1049569) b!1532282))

(assert (= (and b!1532282 (not res!1049571)) b!1532284))

(declare-fun m!1414409 () Bool)

(assert (=> start!130584 m!1414409))

(declare-fun m!1414411 () Bool)

(assert (=> start!130584 m!1414411))

(declare-fun m!1414413 () Bool)

(assert (=> b!1532286 m!1414413))

(assert (=> b!1532286 m!1414413))

(declare-fun m!1414415 () Bool)

(assert (=> b!1532286 m!1414415))

(declare-fun m!1414417 () Bool)

(assert (=> b!1532285 m!1414417))

(assert (=> b!1532285 m!1414417))

(declare-fun m!1414419 () Bool)

(assert (=> b!1532285 m!1414419))

(declare-fun m!1414421 () Bool)

(assert (=> b!1532283 m!1414421))

(declare-fun m!1414423 () Bool)

(assert (=> b!1532284 m!1414423))

(declare-fun m!1414425 () Bool)

(assert (=> b!1532287 m!1414425))

(declare-fun m!1414427 () Bool)

(assert (=> b!1532282 m!1414427))

(check-sat (not b!1532287) (not b!1532285) (not b!1532283) (not start!130584) (not b!1532284) (not b!1532282) (not b!1532286))
(check-sat)
(get-model)

(declare-fun d!159859 () Bool)

(assert (=> d!159859 (= (validKeyInArray!0 (select (arr!49075 a!2792) j!64)) (and (not (= (select (arr!49075 a!2792) j!64) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49075 a!2792) j!64) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1532285 d!159859))

(declare-fun d!159861 () Bool)

(declare-fun lt!663408 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!779 (List!35627) (InoxSet (_ BitVec 64)))

(assert (=> d!159861 (= lt!663408 (select (content!779 Nil!35624) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!853741 () Bool)

(assert (=> d!159861 (= lt!663408 e!853741)))

(declare-fun res!1049629 () Bool)

(assert (=> d!159861 (=> (not res!1049629) (not e!853741))))

(get-info :version)

(assert (=> d!159861 (= res!1049629 ((_ is Cons!35623) Nil!35624))))

(assert (=> d!159861 (= (contains!9970 Nil!35624 #b1000000000000000000000000000000000000000000000000000000000000000) lt!663408)))

(declare-fun b!1532340 () Bool)

(declare-fun e!853740 () Bool)

(assert (=> b!1532340 (= e!853741 e!853740)))

(declare-fun res!1049628 () Bool)

(assert (=> b!1532340 (=> res!1049628 e!853740)))

(assert (=> b!1532340 (= res!1049628 (= (h!37069 Nil!35624) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1532341 () Bool)

(assert (=> b!1532341 (= e!853740 (contains!9970 (t!50313 Nil!35624) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!159861 res!1049629) b!1532340))

(assert (= (and b!1532340 (not res!1049628)) b!1532341))

(declare-fun m!1414469 () Bool)

(assert (=> d!159861 m!1414469))

(declare-fun m!1414471 () Bool)

(assert (=> d!159861 m!1414471))

(declare-fun m!1414473 () Bool)

(assert (=> b!1532341 m!1414473))

(assert (=> b!1532284 d!159861))

(declare-fun d!159863 () Bool)

(assert (=> d!159863 (= (validKeyInArray!0 (select (arr!49075 a!2792) i!951)) (and (not (= (select (arr!49075 a!2792) i!951) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49075 a!2792) i!951) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1532286 d!159863))

(declare-fun d!159865 () Bool)

(declare-fun lt!663409 () Bool)

(assert (=> d!159865 (= lt!663409 (select (content!779 Nil!35624) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!853743 () Bool)

(assert (=> d!159865 (= lt!663409 e!853743)))

(declare-fun res!1049631 () Bool)

(assert (=> d!159865 (=> (not res!1049631) (not e!853743))))

(assert (=> d!159865 (= res!1049631 ((_ is Cons!35623) Nil!35624))))

(assert (=> d!159865 (= (contains!9970 Nil!35624 #b0000000000000000000000000000000000000000000000000000000000000000) lt!663409)))

(declare-fun b!1532342 () Bool)

(declare-fun e!853742 () Bool)

(assert (=> b!1532342 (= e!853743 e!853742)))

(declare-fun res!1049630 () Bool)

(assert (=> b!1532342 (=> res!1049630 e!853742)))

(assert (=> b!1532342 (= res!1049630 (= (h!37069 Nil!35624) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1532343 () Bool)

(assert (=> b!1532343 (= e!853742 (contains!9970 (t!50313 Nil!35624) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!159865 res!1049631) b!1532342))

(assert (= (and b!1532342 (not res!1049630)) b!1532343))

(assert (=> d!159865 m!1414469))

(declare-fun m!1414475 () Bool)

(assert (=> d!159865 m!1414475))

(declare-fun m!1414477 () Bool)

(assert (=> b!1532343 m!1414477))

(assert (=> b!1532282 d!159865))

(declare-fun d!159869 () Bool)

(declare-fun res!1049640 () Bool)

(declare-fun e!853752 () Bool)

(assert (=> d!159869 (=> res!1049640 e!853752)))

(assert (=> d!159869 (= res!1049640 ((_ is Nil!35624) Nil!35624))))

(assert (=> d!159869 (= (noDuplicate!2655 Nil!35624) e!853752)))

(declare-fun b!1532352 () Bool)

(declare-fun e!853753 () Bool)

(assert (=> b!1532352 (= e!853752 e!853753)))

(declare-fun res!1049641 () Bool)

(assert (=> b!1532352 (=> (not res!1049641) (not e!853753))))

(assert (=> b!1532352 (= res!1049641 (not (contains!9970 (t!50313 Nil!35624) (h!37069 Nil!35624))))))

(declare-fun b!1532353 () Bool)

(assert (=> b!1532353 (= e!853753 (noDuplicate!2655 (t!50313 Nil!35624)))))

(assert (= (and d!159869 (not res!1049640)) b!1532352))

(assert (= (and b!1532352 res!1049641) b!1532353))

(declare-fun m!1414479 () Bool)

(assert (=> b!1532352 m!1414479))

(declare-fun m!1414481 () Bool)

(assert (=> b!1532353 m!1414481))

(assert (=> b!1532287 d!159869))

(declare-fun d!159873 () Bool)

(assert (=> d!159873 (= (validMask!0 mask!2480) (and (or (= mask!2480 #b00000000000000000000000000000111) (= mask!2480 #b00000000000000000000000000001111) (= mask!2480 #b00000000000000000000000000011111) (= mask!2480 #b00000000000000000000000000111111) (= mask!2480 #b00000000000000000000000001111111) (= mask!2480 #b00000000000000000000000011111111) (= mask!2480 #b00000000000000000000000111111111) (= mask!2480 #b00000000000000000000001111111111) (= mask!2480 #b00000000000000000000011111111111) (= mask!2480 #b00000000000000000000111111111111) (= mask!2480 #b00000000000000000001111111111111) (= mask!2480 #b00000000000000000011111111111111) (= mask!2480 #b00000000000000000111111111111111) (= mask!2480 #b00000000000000001111111111111111) (= mask!2480 #b00000000000000011111111111111111) (= mask!2480 #b00000000000000111111111111111111) (= mask!2480 #b00000000000001111111111111111111) (= mask!2480 #b00000000000011111111111111111111) (= mask!2480 #b00000000000111111111111111111111) (= mask!2480 #b00000000001111111111111111111111) (= mask!2480 #b00000000011111111111111111111111) (= mask!2480 #b00000000111111111111111111111111) (= mask!2480 #b00000001111111111111111111111111) (= mask!2480 #b00000011111111111111111111111111) (= mask!2480 #b00000111111111111111111111111111) (= mask!2480 #b00001111111111111111111111111111) (= mask!2480 #b00011111111111111111111111111111) (= mask!2480 #b00111111111111111111111111111111)) (bvsle mask!2480 #b00111111111111111111111111111111)))))

(assert (=> start!130584 d!159873))

(declare-fun d!159881 () Bool)

(assert (=> d!159881 (= (array_inv!38308 a!2792) (bvsge (size!49627 a!2792) #b00000000000000000000000000000000))))

(assert (=> start!130584 d!159881))

(declare-fun b!1532398 () Bool)

(declare-fun e!853791 () Bool)

(declare-fun e!853793 () Bool)

(assert (=> b!1532398 (= e!853791 e!853793)))

(declare-fun lt!663438 () (_ BitVec 64))

(assert (=> b!1532398 (= lt!663438 (select (arr!49075 a!2792) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51135 0))(
  ( (Unit!51136) )
))
(declare-fun lt!663439 () Unit!51135)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101713 (_ BitVec 64) (_ BitVec 32)) Unit!51135)

(assert (=> b!1532398 (= lt!663439 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2792 lt!663438 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!101713 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1532398 (arrayContainsKey!0 a!2792 lt!663438 #b00000000000000000000000000000000)))

(declare-fun lt!663440 () Unit!51135)

(assert (=> b!1532398 (= lt!663440 lt!663439)))

(declare-fun res!1049673 () Bool)

(declare-datatypes ((SeekEntryResult!13256 0))(
  ( (MissingZero!13256 (index!55419 (_ BitVec 32))) (Found!13256 (index!55420 (_ BitVec 32))) (Intermediate!13256 (undefined!14068 Bool) (index!55421 (_ BitVec 32)) (x!137133 (_ BitVec 32))) (Undefined!13256) (MissingVacant!13256 (index!55422 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101713 (_ BitVec 32)) SeekEntryResult!13256)

(assert (=> b!1532398 (= res!1049673 (= (seekEntryOrOpen!0 (select (arr!49075 a!2792) #b00000000000000000000000000000000) a!2792 mask!2480) (Found!13256 #b00000000000000000000000000000000)))))

(assert (=> b!1532398 (=> (not res!1049673) (not e!853793))))

(declare-fun b!1532399 () Bool)

(declare-fun call!68544 () Bool)

(assert (=> b!1532399 (= e!853791 call!68544)))

(declare-fun d!159883 () Bool)

(declare-fun res!1049672 () Bool)

(declare-fun e!853792 () Bool)

(assert (=> d!159883 (=> res!1049672 e!853792)))

(assert (=> d!159883 (= res!1049672 (bvsge #b00000000000000000000000000000000 (size!49627 a!2792)))))

(assert (=> d!159883 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480) e!853792)))

(declare-fun b!1532400 () Bool)

(assert (=> b!1532400 (= e!853793 call!68544)))

(declare-fun b!1532401 () Bool)

(assert (=> b!1532401 (= e!853792 e!853791)))

(declare-fun c!140924 () Bool)

(assert (=> b!1532401 (= c!140924 (validKeyInArray!0 (select (arr!49075 a!2792) #b00000000000000000000000000000000)))))

(declare-fun bm!68541 () Bool)

(assert (=> bm!68541 (= call!68544 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2792 mask!2480))))

(assert (= (and d!159883 (not res!1049672)) b!1532401))

(assert (= (and b!1532401 c!140924) b!1532398))

(assert (= (and b!1532401 (not c!140924)) b!1532399))

(assert (= (and b!1532398 res!1049673) b!1532400))

(assert (= (or b!1532400 b!1532399) bm!68541))

(declare-fun m!1414515 () Bool)

(assert (=> b!1532398 m!1414515))

(declare-fun m!1414517 () Bool)

(assert (=> b!1532398 m!1414517))

(declare-fun m!1414519 () Bool)

(assert (=> b!1532398 m!1414519))

(assert (=> b!1532398 m!1414515))

(declare-fun m!1414521 () Bool)

(assert (=> b!1532398 m!1414521))

(assert (=> b!1532401 m!1414515))

(assert (=> b!1532401 m!1414515))

(declare-fun m!1414523 () Bool)

(assert (=> b!1532401 m!1414523))

(declare-fun m!1414525 () Bool)

(assert (=> bm!68541 m!1414525))

(assert (=> b!1532283 d!159883))

(check-sat (not bm!68541) (not b!1532353) (not b!1532398) (not b!1532341) (not b!1532343) (not b!1532352) (not d!159861) (not b!1532401) (not d!159865))
(check-sat)
