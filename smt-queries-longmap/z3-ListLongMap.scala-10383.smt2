; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122222 () Bool)

(assert start!122222)

(declare-fun b!1417790 () Bool)

(declare-fun res!953523 () Bool)

(declare-fun e!802360 () Bool)

(assert (=> b!1417790 (=> (not res!953523) (not e!802360))))

(declare-datatypes ((array!96806 0))(
  ( (array!96807 (arr!46731 (Array (_ BitVec 32) (_ BitVec 64))) (size!47281 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96806)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96806 (_ BitVec 32)) Bool)

(assert (=> b!1417790 (= res!953523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1417791 () Bool)

(declare-fun res!953521 () Bool)

(assert (=> b!1417791 (=> (not res!953521) (not e!802360))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417791 (= res!953521 (validKeyInArray!0 (select (arr!46731 a!2831) j!81)))))

(declare-fun res!953520 () Bool)

(assert (=> start!122222 (=> (not res!953520) (not e!802360))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122222 (= res!953520 (validMask!0 mask!2608))))

(assert (=> start!122222 e!802360))

(assert (=> start!122222 true))

(declare-fun array_inv!35759 (array!96806) Bool)

(assert (=> start!122222 (array_inv!35759 a!2831)))

(declare-fun b!1417792 () Bool)

(assert (=> b!1417792 (= e!802360 (and (bvsle #b00000000000000000000000000000000 (size!47281 a!2831)) (bvsge (size!47281 a!2831) #b01111111111111111111111111111111)))))

(declare-fun b!1417793 () Bool)

(declare-fun res!953522 () Bool)

(assert (=> b!1417793 (=> (not res!953522) (not e!802360))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1417793 (= res!953522 (and (= (size!47281 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47281 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47281 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1417794 () Bool)

(declare-fun res!953524 () Bool)

(assert (=> b!1417794 (=> (not res!953524) (not e!802360))))

(assert (=> b!1417794 (= res!953524 (validKeyInArray!0 (select (arr!46731 a!2831) i!982)))))

(assert (= (and start!122222 res!953520) b!1417793))

(assert (= (and b!1417793 res!953522) b!1417794))

(assert (= (and b!1417794 res!953524) b!1417791))

(assert (= (and b!1417791 res!953521) b!1417790))

(assert (= (and b!1417790 res!953523) b!1417792))

(declare-fun m!1308569 () Bool)

(assert (=> b!1417790 m!1308569))

(declare-fun m!1308571 () Bool)

(assert (=> b!1417791 m!1308571))

(assert (=> b!1417791 m!1308571))

(declare-fun m!1308573 () Bool)

(assert (=> b!1417791 m!1308573))

(declare-fun m!1308575 () Bool)

(assert (=> start!122222 m!1308575))

(declare-fun m!1308577 () Bool)

(assert (=> start!122222 m!1308577))

(declare-fun m!1308579 () Bool)

(assert (=> b!1417794 m!1308579))

(assert (=> b!1417794 m!1308579))

(declare-fun m!1308581 () Bool)

(assert (=> b!1417794 m!1308581))

(check-sat (not start!122222) (not b!1417790) (not b!1417791) (not b!1417794))
(check-sat)
(get-model)

(declare-fun d!152713 () Bool)

(assert (=> d!152713 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!122222 d!152713))

(declare-fun d!152721 () Bool)

(assert (=> d!152721 (= (array_inv!35759 a!2831) (bvsge (size!47281 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!122222 d!152721))

(declare-fun b!1417830 () Bool)

(declare-fun e!802385 () Bool)

(declare-fun e!802383 () Bool)

(assert (=> b!1417830 (= e!802385 e!802383)))

(declare-fun lt!625458 () (_ BitVec 64))

(assert (=> b!1417830 (= lt!625458 (select (arr!46731 a!2831) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48044 0))(
  ( (Unit!48045) )
))
(declare-fun lt!625457 () Unit!48044)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96806 (_ BitVec 64) (_ BitVec 32)) Unit!48044)

(assert (=> b!1417830 (= lt!625457 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!625458 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96806 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1417830 (arrayContainsKey!0 a!2831 lt!625458 #b00000000000000000000000000000000)))

(declare-fun lt!625456 () Unit!48044)

(assert (=> b!1417830 (= lt!625456 lt!625457)))

(declare-fun res!953551 () Bool)

(declare-datatypes ((SeekEntryResult!11035 0))(
  ( (MissingZero!11035 (index!46532 (_ BitVec 32))) (Found!11035 (index!46533 (_ BitVec 32))) (Intermediate!11035 (undefined!11847 Bool) (index!46534 (_ BitVec 32)) (x!128150 (_ BitVec 32))) (Undefined!11035) (MissingVacant!11035 (index!46535 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96806 (_ BitVec 32)) SeekEntryResult!11035)

(assert (=> b!1417830 (= res!953551 (= (seekEntryOrOpen!0 (select (arr!46731 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11035 #b00000000000000000000000000000000)))))

(assert (=> b!1417830 (=> (not res!953551) (not e!802383))))

(declare-fun d!152723 () Bool)

(declare-fun res!953550 () Bool)

(declare-fun e!802384 () Bool)

(assert (=> d!152723 (=> res!953550 e!802384)))

(assert (=> d!152723 (= res!953550 (bvsge #b00000000000000000000000000000000 (size!47281 a!2831)))))

(assert (=> d!152723 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!802384)))

(declare-fun b!1417831 () Bool)

(declare-fun call!67228 () Bool)

(assert (=> b!1417831 (= e!802383 call!67228)))

(declare-fun b!1417832 () Bool)

(assert (=> b!1417832 (= e!802384 e!802385)))

(declare-fun c!131622 () Bool)

(assert (=> b!1417832 (= c!131622 (validKeyInArray!0 (select (arr!46731 a!2831) #b00000000000000000000000000000000)))))

(declare-fun bm!67225 () Bool)

(assert (=> bm!67225 (= call!67228 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1417833 () Bool)

(assert (=> b!1417833 (= e!802385 call!67228)))

(assert (= (and d!152723 (not res!953550)) b!1417832))

(assert (= (and b!1417832 c!131622) b!1417830))

(assert (= (and b!1417832 (not c!131622)) b!1417833))

(assert (= (and b!1417830 res!953551) b!1417831))

(assert (= (or b!1417831 b!1417833) bm!67225))

(declare-fun m!1308609 () Bool)

(assert (=> b!1417830 m!1308609))

(declare-fun m!1308611 () Bool)

(assert (=> b!1417830 m!1308611))

(declare-fun m!1308613 () Bool)

(assert (=> b!1417830 m!1308613))

(assert (=> b!1417830 m!1308609))

(declare-fun m!1308615 () Bool)

(assert (=> b!1417830 m!1308615))

(assert (=> b!1417832 m!1308609))

(assert (=> b!1417832 m!1308609))

(declare-fun m!1308617 () Bool)

(assert (=> b!1417832 m!1308617))

(declare-fun m!1308619 () Bool)

(assert (=> bm!67225 m!1308619))

(assert (=> b!1417790 d!152723))

(declare-fun d!152731 () Bool)

(assert (=> d!152731 (= (validKeyInArray!0 (select (arr!46731 a!2831) j!81)) (and (not (= (select (arr!46731 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46731 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1417791 d!152731))

(declare-fun d!152733 () Bool)

(assert (=> d!152733 (= (validKeyInArray!0 (select (arr!46731 a!2831) i!982)) (and (not (= (select (arr!46731 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46731 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1417794 d!152733))

(check-sat (not b!1417830) (not bm!67225) (not b!1417832))
(check-sat)
