; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122576 () Bool)

(assert start!122576)

(declare-fun res!954596 () Bool)

(declare-fun e!803450 () Bool)

(assert (=> start!122576 (=> (not res!954596) (not e!803450))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122576 (= res!954596 (validMask!0 mask!2608))))

(assert (=> start!122576 e!803450))

(assert (=> start!122576 true))

(declare-datatypes ((array!96974 0))(
  ( (array!96975 (arr!46807 (Array (_ BitVec 32) (_ BitVec 64))) (size!47358 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96974)

(declare-fun array_inv!36088 (array!96974) Bool)

(assert (=> start!122576 (array_inv!36088 a!2831)))

(declare-fun b!1419636 () Bool)

(declare-fun lt!625988 () (_ BitVec 32))

(assert (=> b!1419636 (= e!803450 (and (bvsge mask!2608 #b00000000000000000000000000000000) (or (bvslt lt!625988 #b00000000000000000000000000000000) (bvsge lt!625988 (bvadd #b00000000000000000000000000000001 mask!2608)))))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419636 (= lt!625988 (toIndex!0 (select (arr!46807 a!2831) j!81) mask!2608))))

(declare-fun b!1419637 () Bool)

(declare-fun res!954595 () Bool)

(assert (=> b!1419637 (=> (not res!954595) (not e!803450))))

(declare-datatypes ((List!33304 0))(
  ( (Nil!33301) (Cons!33300 (h!34601 (_ BitVec 64)) (t!47990 List!33304)) )
))
(declare-fun arrayNoDuplicates!0 (array!96974 (_ BitVec 32) List!33304) Bool)

(assert (=> b!1419637 (= res!954595 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33301))))

(declare-fun b!1419638 () Bool)

(declare-fun res!954598 () Bool)

(assert (=> b!1419638 (=> (not res!954598) (not e!803450))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96974 (_ BitVec 32)) Bool)

(assert (=> b!1419638 (= res!954598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1419639 () Bool)

(declare-fun res!954597 () Bool)

(assert (=> b!1419639 (=> (not res!954597) (not e!803450))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1419639 (= res!954597 (and (= (size!47358 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47358 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47358 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1419640 () Bool)

(declare-fun res!954593 () Bool)

(assert (=> b!1419640 (=> (not res!954593) (not e!803450))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419640 (= res!954593 (validKeyInArray!0 (select (arr!46807 a!2831) i!982)))))

(declare-fun b!1419641 () Bool)

(declare-fun res!954592 () Bool)

(assert (=> b!1419641 (=> (not res!954592) (not e!803450))))

(assert (=> b!1419641 (= res!954592 (validKeyInArray!0 (select (arr!46807 a!2831) j!81)))))

(declare-fun b!1419642 () Bool)

(declare-fun res!954594 () Bool)

(assert (=> b!1419642 (=> (not res!954594) (not e!803450))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1419642 (= res!954594 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47358 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47358 a!2831))))))

(assert (= (and start!122576 res!954596) b!1419639))

(assert (= (and b!1419639 res!954597) b!1419640))

(assert (= (and b!1419640 res!954593) b!1419641))

(assert (= (and b!1419641 res!954592) b!1419638))

(assert (= (and b!1419638 res!954598) b!1419637))

(assert (= (and b!1419637 res!954595) b!1419642))

(assert (= (and b!1419642 res!954594) b!1419636))

(declare-fun m!1310541 () Bool)

(assert (=> b!1419641 m!1310541))

(assert (=> b!1419641 m!1310541))

(declare-fun m!1310543 () Bool)

(assert (=> b!1419641 m!1310543))

(declare-fun m!1310545 () Bool)

(assert (=> b!1419640 m!1310545))

(assert (=> b!1419640 m!1310545))

(declare-fun m!1310547 () Bool)

(assert (=> b!1419640 m!1310547))

(declare-fun m!1310549 () Bool)

(assert (=> b!1419638 m!1310549))

(declare-fun m!1310551 () Bool)

(assert (=> b!1419637 m!1310551))

(declare-fun m!1310553 () Bool)

(assert (=> start!122576 m!1310553))

(declare-fun m!1310555 () Bool)

(assert (=> start!122576 m!1310555))

(assert (=> b!1419636 m!1310541))

(assert (=> b!1419636 m!1310541))

(declare-fun m!1310557 () Bool)

(assert (=> b!1419636 m!1310557))

(check-sat (not b!1419636) (not b!1419637) (not b!1419641) (not b!1419640) (not b!1419638) (not start!122576))
(check-sat)
(get-model)

(declare-fun b!1419693 () Bool)

(declare-fun e!803469 () Bool)

(declare-fun e!803470 () Bool)

(assert (=> b!1419693 (= e!803469 e!803470)))

(declare-fun lt!626003 () (_ BitVec 64))

(assert (=> b!1419693 (= lt!626003 (select (arr!46807 a!2831) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48005 0))(
  ( (Unit!48006) )
))
(declare-fun lt!626002 () Unit!48005)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96974 (_ BitVec 64) (_ BitVec 32)) Unit!48005)

(assert (=> b!1419693 (= lt!626002 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!626003 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96974 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1419693 (arrayContainsKey!0 a!2831 lt!626003 #b00000000000000000000000000000000)))

(declare-fun lt!626001 () Unit!48005)

(assert (=> b!1419693 (= lt!626001 lt!626002)))

(declare-fun res!954646 () Bool)

(declare-datatypes ((SeekEntryResult!11000 0))(
  ( (MissingZero!11000 (index!46392 (_ BitVec 32))) (Found!11000 (index!46393 (_ BitVec 32))) (Intermediate!11000 (undefined!11812 Bool) (index!46394 (_ BitVec 32)) (x!128200 (_ BitVec 32))) (Undefined!11000) (MissingVacant!11000 (index!46395 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96974 (_ BitVec 32)) SeekEntryResult!11000)

(assert (=> b!1419693 (= res!954646 (= (seekEntryOrOpen!0 (select (arr!46807 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11000 #b00000000000000000000000000000000)))))

(assert (=> b!1419693 (=> (not res!954646) (not e!803470))))

(declare-fun b!1419694 () Bool)

(declare-fun call!67329 () Bool)

(assert (=> b!1419694 (= e!803469 call!67329)))

(declare-fun b!1419695 () Bool)

(declare-fun e!803471 () Bool)

(assert (=> b!1419695 (= e!803471 e!803469)))

(declare-fun c!132013 () Bool)

(assert (=> b!1419695 (= c!132013 (validKeyInArray!0 (select (arr!46807 a!2831) #b00000000000000000000000000000000)))))

(declare-fun bm!67326 () Bool)

(assert (=> bm!67326 (= call!67329 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun d!153223 () Bool)

(declare-fun res!954645 () Bool)

(assert (=> d!153223 (=> res!954645 e!803471)))

(assert (=> d!153223 (= res!954645 (bvsge #b00000000000000000000000000000000 (size!47358 a!2831)))))

(assert (=> d!153223 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!803471)))

(declare-fun b!1419696 () Bool)

(assert (=> b!1419696 (= e!803470 call!67329)))

(assert (= (and d!153223 (not res!954645)) b!1419695))

(assert (= (and b!1419695 c!132013) b!1419693))

(assert (= (and b!1419695 (not c!132013)) b!1419694))

(assert (= (and b!1419693 res!954646) b!1419696))

(assert (= (or b!1419696 b!1419694) bm!67326))

(declare-fun m!1310595 () Bool)

(assert (=> b!1419693 m!1310595))

(declare-fun m!1310597 () Bool)

(assert (=> b!1419693 m!1310597))

(declare-fun m!1310599 () Bool)

(assert (=> b!1419693 m!1310599))

(assert (=> b!1419693 m!1310595))

(declare-fun m!1310601 () Bool)

(assert (=> b!1419693 m!1310601))

(assert (=> b!1419695 m!1310595))

(assert (=> b!1419695 m!1310595))

(declare-fun m!1310603 () Bool)

(assert (=> b!1419695 m!1310603))

(declare-fun m!1310605 () Bool)

(assert (=> bm!67326 m!1310605))

(assert (=> b!1419638 d!153223))

(declare-fun b!1419707 () Bool)

(declare-fun e!803483 () Bool)

(declare-fun e!803482 () Bool)

(assert (=> b!1419707 (= e!803483 e!803482)))

(declare-fun c!132016 () Bool)

(assert (=> b!1419707 (= c!132016 (validKeyInArray!0 (select (arr!46807 a!2831) #b00000000000000000000000000000000)))))

(declare-fun d!153225 () Bool)

(declare-fun res!954654 () Bool)

(declare-fun e!803481 () Bool)

(assert (=> d!153225 (=> res!954654 e!803481)))

(assert (=> d!153225 (= res!954654 (bvsge #b00000000000000000000000000000000 (size!47358 a!2831)))))

(assert (=> d!153225 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33301) e!803481)))

(declare-fun bm!67329 () Bool)

(declare-fun call!67332 () Bool)

(assert (=> bm!67329 (= call!67332 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132016 (Cons!33300 (select (arr!46807 a!2831) #b00000000000000000000000000000000) Nil!33301) Nil!33301)))))

(declare-fun b!1419708 () Bool)

(assert (=> b!1419708 (= e!803482 call!67332)))

(declare-fun b!1419709 () Bool)

(assert (=> b!1419709 (= e!803481 e!803483)))

(declare-fun res!954653 () Bool)

(assert (=> b!1419709 (=> (not res!954653) (not e!803483))))

(declare-fun e!803480 () Bool)

(assert (=> b!1419709 (= res!954653 (not e!803480))))

(declare-fun res!954655 () Bool)

(assert (=> b!1419709 (=> (not res!954655) (not e!803480))))

(assert (=> b!1419709 (= res!954655 (validKeyInArray!0 (select (arr!46807 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1419710 () Bool)

(declare-fun contains!9881 (List!33304 (_ BitVec 64)) Bool)

(assert (=> b!1419710 (= e!803480 (contains!9881 Nil!33301 (select (arr!46807 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1419711 () Bool)

(assert (=> b!1419711 (= e!803482 call!67332)))

(assert (= (and d!153225 (not res!954654)) b!1419709))

(assert (= (and b!1419709 res!954655) b!1419710))

(assert (= (and b!1419709 res!954653) b!1419707))

(assert (= (and b!1419707 c!132016) b!1419708))

(assert (= (and b!1419707 (not c!132016)) b!1419711))

(assert (= (or b!1419708 b!1419711) bm!67329))

(assert (=> b!1419707 m!1310595))

(assert (=> b!1419707 m!1310595))

(assert (=> b!1419707 m!1310603))

(assert (=> bm!67329 m!1310595))

(declare-fun m!1310607 () Bool)

(assert (=> bm!67329 m!1310607))

(assert (=> b!1419709 m!1310595))

(assert (=> b!1419709 m!1310595))

(assert (=> b!1419709 m!1310603))

(assert (=> b!1419710 m!1310595))

(assert (=> b!1419710 m!1310595))

(declare-fun m!1310609 () Bool)

(assert (=> b!1419710 m!1310609))

(assert (=> b!1419637 d!153225))

(declare-fun d!153227 () Bool)

(assert (=> d!153227 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!122576 d!153227))

(declare-fun d!153229 () Bool)

(assert (=> d!153229 (= (array_inv!36088 a!2831) (bvsge (size!47358 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!122576 d!153229))

(declare-fun d!153231 () Bool)

(assert (=> d!153231 (= (validKeyInArray!0 (select (arr!46807 a!2831) i!982)) (and (not (= (select (arr!46807 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46807 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1419640 d!153231))

(declare-fun d!153233 () Bool)

(assert (=> d!153233 (= (validKeyInArray!0 (select (arr!46807 a!2831) j!81)) (and (not (= (select (arr!46807 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46807 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1419641 d!153233))

(declare-fun d!153235 () Bool)

(declare-fun lt!626009 () (_ BitVec 32))

(declare-fun lt!626008 () (_ BitVec 32))

(assert (=> d!153235 (= lt!626009 (bvmul (bvxor lt!626008 (bvlshr lt!626008 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153235 (= lt!626008 ((_ extract 31 0) (bvand (bvxor (select (arr!46807 a!2831) j!81) (bvlshr (select (arr!46807 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153235 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!954656 (let ((h!34604 ((_ extract 31 0) (bvand (bvxor (select (arr!46807 a!2831) j!81) (bvlshr (select (arr!46807 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!128198 (bvmul (bvxor h!34604 (bvlshr h!34604 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!128198 (bvlshr x!128198 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!954656 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!954656 #b00000000000000000000000000000000))))))

(assert (=> d!153235 (= (toIndex!0 (select (arr!46807 a!2831) j!81) mask!2608) (bvand (bvxor lt!626009 (bvlshr lt!626009 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1419636 d!153235))

(check-sat (not b!1419709) (not b!1419710) (not b!1419693) (not bm!67329) (not b!1419695) (not bm!67326) (not b!1419707))
(check-sat)
