; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121292 () Bool)

(assert start!121292)

(declare-fun b!1409924 () Bool)

(declare-fun res!947533 () Bool)

(declare-fun e!797873 () Bool)

(assert (=> b!1409924 (=> (not res!947533) (not e!797873))))

(declare-datatypes ((array!96348 0))(
  ( (array!96349 (arr!46516 (Array (_ BitVec 32) (_ BitVec 64))) (size!47068 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96348)

(declare-datatypes ((List!33113 0))(
  ( (Nil!33110) (Cons!33109 (h!34375 (_ BitVec 64)) (t!47799 List!33113)) )
))
(declare-fun arrayNoDuplicates!0 (array!96348 (_ BitVec 32) List!33113) Bool)

(assert (=> b!1409924 (= res!947533 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33110))))

(declare-fun res!947536 () Bool)

(assert (=> start!121292 (=> (not res!947536) (not e!797873))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121292 (= res!947536 (validMask!0 mask!2840))))

(assert (=> start!121292 e!797873))

(assert (=> start!121292 true))

(declare-fun array_inv!35749 (array!96348) Bool)

(assert (=> start!121292 (array_inv!35749 a!2901)))

(declare-fun b!1409925 () Bool)

(declare-fun res!947532 () Bool)

(assert (=> b!1409925 (=> (not res!947532) (not e!797873))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1409925 (= res!947532 (and (= (size!47068 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47068 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47068 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1409926 () Bool)

(declare-fun e!797872 () Bool)

(assert (=> b!1409926 (= e!797873 (not e!797872))))

(declare-fun res!947537 () Bool)

(assert (=> b!1409926 (=> res!947537 e!797872)))

(declare-datatypes ((SeekEntryResult!10853 0))(
  ( (MissingZero!10853 (index!45789 (_ BitVec 32))) (Found!10853 (index!45790 (_ BitVec 32))) (Intermediate!10853 (undefined!11665 Bool) (index!45791 (_ BitVec 32)) (x!127377 (_ BitVec 32))) (Undefined!10853) (MissingVacant!10853 (index!45792 (_ BitVec 32))) )
))
(declare-fun lt!620771 () SeekEntryResult!10853)

(get-info :version)

(assert (=> b!1409926 (= res!947537 (or (not ((_ is Intermediate!10853) lt!620771)) (undefined!11665 lt!620771)))))

(declare-fun e!797870 () Bool)

(assert (=> b!1409926 e!797870))

(declare-fun res!947539 () Bool)

(assert (=> b!1409926 (=> (not res!947539) (not e!797870))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96348 (_ BitVec 32)) Bool)

(assert (=> b!1409926 (= res!947539 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47523 0))(
  ( (Unit!47524) )
))
(declare-fun lt!620772 () Unit!47523)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96348 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47523)

(assert (=> b!1409926 (= lt!620772 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!620774 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96348 (_ BitVec 32)) SeekEntryResult!10853)

(assert (=> b!1409926 (= lt!620771 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!620774 (select (arr!46516 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409926 (= lt!620774 (toIndex!0 (select (arr!46516 a!2901) j!112) mask!2840))))

(declare-fun b!1409927 () Bool)

(declare-fun res!947534 () Bool)

(assert (=> b!1409927 (=> (not res!947534) (not e!797873))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409927 (= res!947534 (validKeyInArray!0 (select (arr!46516 a!2901) j!112)))))

(declare-fun b!1409928 () Bool)

(declare-fun res!947535 () Bool)

(assert (=> b!1409928 (=> (not res!947535) (not e!797873))))

(assert (=> b!1409928 (= res!947535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1409929 () Bool)

(declare-fun res!947538 () Bool)

(assert (=> b!1409929 (=> (not res!947538) (not e!797873))))

(assert (=> b!1409929 (= res!947538 (validKeyInArray!0 (select (arr!46516 a!2901) i!1037)))))

(declare-fun lt!620773 () SeekEntryResult!10853)

(declare-fun b!1409930 () Bool)

(assert (=> b!1409930 (= e!797872 (or (= lt!620771 lt!620773) (not ((_ is Intermediate!10853) lt!620773)) (bvslt (x!127377 lt!620771) #b00000000000000000000000000000000) (bvsgt (x!127377 lt!620771) #b01111111111111111111111111111110) (and (bvsge lt!620774 #b00000000000000000000000000000000) (bvslt lt!620774 (size!47068 a!2901)))))))

(assert (=> b!1409930 (= lt!620773 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46516 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46516 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96349 (store (arr!46516 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47068 a!2901)) mask!2840))))

(declare-fun b!1409931 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96348 (_ BitVec 32)) SeekEntryResult!10853)

(assert (=> b!1409931 (= e!797870 (= (seekEntryOrOpen!0 (select (arr!46516 a!2901) j!112) a!2901 mask!2840) (Found!10853 j!112)))))

(assert (= (and start!121292 res!947536) b!1409925))

(assert (= (and b!1409925 res!947532) b!1409929))

(assert (= (and b!1409929 res!947538) b!1409927))

(assert (= (and b!1409927 res!947534) b!1409928))

(assert (= (and b!1409928 res!947535) b!1409924))

(assert (= (and b!1409924 res!947533) b!1409926))

(assert (= (and b!1409926 res!947539) b!1409931))

(assert (= (and b!1409926 (not res!947537)) b!1409930))

(declare-fun m!1299211 () Bool)

(assert (=> start!121292 m!1299211))

(declare-fun m!1299213 () Bool)

(assert (=> start!121292 m!1299213))

(declare-fun m!1299215 () Bool)

(assert (=> b!1409929 m!1299215))

(assert (=> b!1409929 m!1299215))

(declare-fun m!1299217 () Bool)

(assert (=> b!1409929 m!1299217))

(declare-fun m!1299219 () Bool)

(assert (=> b!1409930 m!1299219))

(declare-fun m!1299221 () Bool)

(assert (=> b!1409930 m!1299221))

(assert (=> b!1409930 m!1299221))

(declare-fun m!1299223 () Bool)

(assert (=> b!1409930 m!1299223))

(assert (=> b!1409930 m!1299223))

(assert (=> b!1409930 m!1299221))

(declare-fun m!1299225 () Bool)

(assert (=> b!1409930 m!1299225))

(declare-fun m!1299227 () Bool)

(assert (=> b!1409924 m!1299227))

(declare-fun m!1299229 () Bool)

(assert (=> b!1409931 m!1299229))

(assert (=> b!1409931 m!1299229))

(declare-fun m!1299231 () Bool)

(assert (=> b!1409931 m!1299231))

(assert (=> b!1409926 m!1299229))

(declare-fun m!1299233 () Bool)

(assert (=> b!1409926 m!1299233))

(assert (=> b!1409926 m!1299229))

(declare-fun m!1299235 () Bool)

(assert (=> b!1409926 m!1299235))

(assert (=> b!1409926 m!1299229))

(declare-fun m!1299237 () Bool)

(assert (=> b!1409926 m!1299237))

(declare-fun m!1299239 () Bool)

(assert (=> b!1409926 m!1299239))

(declare-fun m!1299241 () Bool)

(assert (=> b!1409928 m!1299241))

(assert (=> b!1409927 m!1299229))

(assert (=> b!1409927 m!1299229))

(declare-fun m!1299243 () Bool)

(assert (=> b!1409927 m!1299243))

(check-sat (not b!1409930) (not b!1409931) (not b!1409924) (not b!1409928) (not b!1409927) (not b!1409926) (not start!121292) (not b!1409929))
(check-sat)
(get-model)

(declare-fun d!151681 () Bool)

(declare-fun e!797912 () Bool)

(assert (=> d!151681 e!797912))

(declare-fun c!130674 () Bool)

(declare-fun lt!620803 () SeekEntryResult!10853)

(assert (=> d!151681 (= c!130674 (and ((_ is Intermediate!10853) lt!620803) (undefined!11665 lt!620803)))))

(declare-fun e!797908 () SeekEntryResult!10853)

(assert (=> d!151681 (= lt!620803 e!797908)))

(declare-fun c!130673 () Bool)

(assert (=> d!151681 (= c!130673 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!620804 () (_ BitVec 64))

(assert (=> d!151681 (= lt!620804 (select (arr!46516 (array!96349 (store (arr!46516 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47068 a!2901))) (toIndex!0 (select (store (arr!46516 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!151681 (validMask!0 mask!2840)))

(assert (=> d!151681 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46516 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46516 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96349 (store (arr!46516 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47068 a!2901)) mask!2840) lt!620803)))

(declare-fun b!1409998 () Bool)

(declare-fun e!797910 () Bool)

(assert (=> b!1409998 (= e!797912 e!797910)))

(declare-fun res!947595 () Bool)

(assert (=> b!1409998 (= res!947595 (and ((_ is Intermediate!10853) lt!620803) (not (undefined!11665 lt!620803)) (bvslt (x!127377 lt!620803) #b01111111111111111111111111111110) (bvsge (x!127377 lt!620803) #b00000000000000000000000000000000) (bvsge (x!127377 lt!620803) #b00000000000000000000000000000000)))))

(assert (=> b!1409998 (=> (not res!947595) (not e!797910))))

(declare-fun b!1409999 () Bool)

(assert (=> b!1409999 (= e!797912 (bvsge (x!127377 lt!620803) #b01111111111111111111111111111110))))

(declare-fun b!1410000 () Bool)

(assert (=> b!1410000 (and (bvsge (index!45791 lt!620803) #b00000000000000000000000000000000) (bvslt (index!45791 lt!620803) (size!47068 (array!96349 (store (arr!46516 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47068 a!2901)))))))

(declare-fun res!947596 () Bool)

(assert (=> b!1410000 (= res!947596 (= (select (arr!46516 (array!96349 (store (arr!46516 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47068 a!2901))) (index!45791 lt!620803)) (select (store (arr!46516 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(declare-fun e!797911 () Bool)

(assert (=> b!1410000 (=> res!947596 e!797911)))

(assert (=> b!1410000 (= e!797910 e!797911)))

(declare-fun b!1410001 () Bool)

(declare-fun e!797909 () SeekEntryResult!10853)

(assert (=> b!1410001 (= e!797908 e!797909)))

(declare-fun c!130675 () Bool)

(assert (=> b!1410001 (= c!130675 (or (= lt!620804 (select (store (arr!46516 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!620804 lt!620804) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1410002 () Bool)

(assert (=> b!1410002 (= e!797909 (Intermediate!10853 false (toIndex!0 (select (store (arr!46516 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1410003 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410003 (= e!797909 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!46516 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (store (arr!46516 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96349 (store (arr!46516 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47068 a!2901)) mask!2840))))

(declare-fun b!1410004 () Bool)

(assert (=> b!1410004 (and (bvsge (index!45791 lt!620803) #b00000000000000000000000000000000) (bvslt (index!45791 lt!620803) (size!47068 (array!96349 (store (arr!46516 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47068 a!2901)))))))

(assert (=> b!1410004 (= e!797911 (= (select (arr!46516 (array!96349 (store (arr!46516 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47068 a!2901))) (index!45791 lt!620803)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1410005 () Bool)

(assert (=> b!1410005 (and (bvsge (index!45791 lt!620803) #b00000000000000000000000000000000) (bvslt (index!45791 lt!620803) (size!47068 (array!96349 (store (arr!46516 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47068 a!2901)))))))

(declare-fun res!947594 () Bool)

(assert (=> b!1410005 (= res!947594 (= (select (arr!46516 (array!96349 (store (arr!46516 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47068 a!2901))) (index!45791 lt!620803)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1410005 (=> res!947594 e!797911)))

(declare-fun b!1410006 () Bool)

(assert (=> b!1410006 (= e!797908 (Intermediate!10853 true (toIndex!0 (select (store (arr!46516 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(assert (= (and d!151681 c!130673) b!1410006))

(assert (= (and d!151681 (not c!130673)) b!1410001))

(assert (= (and b!1410001 c!130675) b!1410002))

(assert (= (and b!1410001 (not c!130675)) b!1410003))

(assert (= (and d!151681 c!130674) b!1409999))

(assert (= (and d!151681 (not c!130674)) b!1409998))

(assert (= (and b!1409998 res!947595) b!1410000))

(assert (= (and b!1410000 (not res!947596)) b!1410005))

(assert (= (and b!1410005 (not res!947594)) b!1410004))

(declare-fun m!1299313 () Bool)

(assert (=> b!1410004 m!1299313))

(assert (=> b!1410003 m!1299223))

(declare-fun m!1299315 () Bool)

(assert (=> b!1410003 m!1299315))

(assert (=> b!1410003 m!1299315))

(assert (=> b!1410003 m!1299221))

(declare-fun m!1299317 () Bool)

(assert (=> b!1410003 m!1299317))

(assert (=> d!151681 m!1299223))

(declare-fun m!1299319 () Bool)

(assert (=> d!151681 m!1299319))

(assert (=> d!151681 m!1299211))

(assert (=> b!1410005 m!1299313))

(assert (=> b!1410000 m!1299313))

(assert (=> b!1409930 d!151681))

(declare-fun d!151685 () Bool)

(declare-fun lt!620816 () (_ BitVec 32))

(declare-fun lt!620815 () (_ BitVec 32))

(assert (=> d!151685 (= lt!620816 (bvmul (bvxor lt!620815 (bvlshr lt!620815 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151685 (= lt!620815 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46516 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46516 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151685 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!947601 (let ((h!34378 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46516 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46516 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127382 (bvmul (bvxor h!34378 (bvlshr h!34378 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127382 (bvlshr x!127382 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!947601 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!947601 #b00000000000000000000000000000000))))))

(assert (=> d!151685 (= (toIndex!0 (select (store (arr!46516 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!620816 (bvlshr lt!620816 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1409930 d!151685))

(declare-fun d!151691 () Bool)

(declare-fun res!947618 () Bool)

(declare-fun e!797944 () Bool)

(assert (=> d!151691 (=> res!947618 e!797944)))

(assert (=> d!151691 (= res!947618 (bvsge j!112 (size!47068 a!2901)))))

(assert (=> d!151691 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!797944)))

(declare-fun b!1410054 () Bool)

(declare-fun e!797945 () Bool)

(declare-fun call!67019 () Bool)

(assert (=> b!1410054 (= e!797945 call!67019)))

(declare-fun b!1410055 () Bool)

(declare-fun e!797943 () Bool)

(assert (=> b!1410055 (= e!797943 e!797945)))

(declare-fun lt!620840 () (_ BitVec 64))

(assert (=> b!1410055 (= lt!620840 (select (arr!46516 a!2901) j!112))))

(declare-fun lt!620839 () Unit!47523)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96348 (_ BitVec 64) (_ BitVec 32)) Unit!47523)

(assert (=> b!1410055 (= lt!620839 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!620840 j!112))))

(declare-fun arrayContainsKey!0 (array!96348 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1410055 (arrayContainsKey!0 a!2901 lt!620840 #b00000000000000000000000000000000)))

(declare-fun lt!620838 () Unit!47523)

(assert (=> b!1410055 (= lt!620838 lt!620839)))

(declare-fun res!947619 () Bool)

(assert (=> b!1410055 (= res!947619 (= (seekEntryOrOpen!0 (select (arr!46516 a!2901) j!112) a!2901 mask!2840) (Found!10853 j!112)))))

(assert (=> b!1410055 (=> (not res!947619) (not e!797945))))

(declare-fun b!1410056 () Bool)

(assert (=> b!1410056 (= e!797943 call!67019)))

(declare-fun bm!67016 () Bool)

(assert (=> bm!67016 (= call!67019 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1410057 () Bool)

(assert (=> b!1410057 (= e!797944 e!797943)))

(declare-fun c!130690 () Bool)

(assert (=> b!1410057 (= c!130690 (validKeyInArray!0 (select (arr!46516 a!2901) j!112)))))

(assert (= (and d!151691 (not res!947618)) b!1410057))

(assert (= (and b!1410057 c!130690) b!1410055))

(assert (= (and b!1410057 (not c!130690)) b!1410056))

(assert (= (and b!1410055 res!947619) b!1410054))

(assert (= (or b!1410054 b!1410056) bm!67016))

(assert (=> b!1410055 m!1299229))

(declare-fun m!1299341 () Bool)

(assert (=> b!1410055 m!1299341))

(declare-fun m!1299343 () Bool)

(assert (=> b!1410055 m!1299343))

(assert (=> b!1410055 m!1299229))

(assert (=> b!1410055 m!1299231))

(declare-fun m!1299345 () Bool)

(assert (=> bm!67016 m!1299345))

(assert (=> b!1410057 m!1299229))

(assert (=> b!1410057 m!1299229))

(assert (=> b!1410057 m!1299243))

(assert (=> b!1409926 d!151691))

(declare-fun d!151699 () Bool)

(assert (=> d!151699 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!620846 () Unit!47523)

(declare-fun choose!38 (array!96348 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47523)

(assert (=> d!151699 (= lt!620846 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!151699 (validMask!0 mask!2840)))

(assert (=> d!151699 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!620846)))

(declare-fun bs!41083 () Bool)

(assert (= bs!41083 d!151699))

(assert (=> bs!41083 m!1299239))

(declare-fun m!1299357 () Bool)

(assert (=> bs!41083 m!1299357))

(assert (=> bs!41083 m!1299211))

(assert (=> b!1409926 d!151699))

(declare-fun d!151705 () Bool)

(declare-fun e!797965 () Bool)

(assert (=> d!151705 e!797965))

(declare-fun c!130696 () Bool)

(declare-fun lt!620847 () SeekEntryResult!10853)

(assert (=> d!151705 (= c!130696 (and ((_ is Intermediate!10853) lt!620847) (undefined!11665 lt!620847)))))

(declare-fun e!797961 () SeekEntryResult!10853)

(assert (=> d!151705 (= lt!620847 e!797961)))

(declare-fun c!130695 () Bool)

(assert (=> d!151705 (= c!130695 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!620848 () (_ BitVec 64))

(assert (=> d!151705 (= lt!620848 (select (arr!46516 a!2901) lt!620774))))

(assert (=> d!151705 (validMask!0 mask!2840)))

(assert (=> d!151705 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!620774 (select (arr!46516 a!2901) j!112) a!2901 mask!2840) lt!620847)))

(declare-fun b!1410077 () Bool)

(declare-fun e!797963 () Bool)

(assert (=> b!1410077 (= e!797965 e!797963)))

(declare-fun res!947632 () Bool)

(assert (=> b!1410077 (= res!947632 (and ((_ is Intermediate!10853) lt!620847) (not (undefined!11665 lt!620847)) (bvslt (x!127377 lt!620847) #b01111111111111111111111111111110) (bvsge (x!127377 lt!620847) #b00000000000000000000000000000000) (bvsge (x!127377 lt!620847) #b00000000000000000000000000000000)))))

(assert (=> b!1410077 (=> (not res!947632) (not e!797963))))

(declare-fun b!1410078 () Bool)

(assert (=> b!1410078 (= e!797965 (bvsge (x!127377 lt!620847) #b01111111111111111111111111111110))))

(declare-fun b!1410079 () Bool)

(assert (=> b!1410079 (and (bvsge (index!45791 lt!620847) #b00000000000000000000000000000000) (bvslt (index!45791 lt!620847) (size!47068 a!2901)))))

(declare-fun res!947633 () Bool)

(assert (=> b!1410079 (= res!947633 (= (select (arr!46516 a!2901) (index!45791 lt!620847)) (select (arr!46516 a!2901) j!112)))))

(declare-fun e!797964 () Bool)

(assert (=> b!1410079 (=> res!947633 e!797964)))

(assert (=> b!1410079 (= e!797963 e!797964)))

(declare-fun b!1410080 () Bool)

(declare-fun e!797962 () SeekEntryResult!10853)

(assert (=> b!1410080 (= e!797961 e!797962)))

(declare-fun c!130697 () Bool)

(assert (=> b!1410080 (= c!130697 (or (= lt!620848 (select (arr!46516 a!2901) j!112)) (= (bvadd lt!620848 lt!620848) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1410081 () Bool)

(assert (=> b!1410081 (= e!797962 (Intermediate!10853 false lt!620774 #b00000000000000000000000000000000))))

(declare-fun b!1410082 () Bool)

(assert (=> b!1410082 (= e!797962 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!620774 #b00000000000000000000000000000000 mask!2840) (select (arr!46516 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1410083 () Bool)

(assert (=> b!1410083 (and (bvsge (index!45791 lt!620847) #b00000000000000000000000000000000) (bvslt (index!45791 lt!620847) (size!47068 a!2901)))))

(assert (=> b!1410083 (= e!797964 (= (select (arr!46516 a!2901) (index!45791 lt!620847)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1410084 () Bool)

(assert (=> b!1410084 (and (bvsge (index!45791 lt!620847) #b00000000000000000000000000000000) (bvslt (index!45791 lt!620847) (size!47068 a!2901)))))

(declare-fun res!947631 () Bool)

(assert (=> b!1410084 (= res!947631 (= (select (arr!46516 a!2901) (index!45791 lt!620847)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1410084 (=> res!947631 e!797964)))

(declare-fun b!1410085 () Bool)

(assert (=> b!1410085 (= e!797961 (Intermediate!10853 true lt!620774 #b00000000000000000000000000000000))))

(assert (= (and d!151705 c!130695) b!1410085))

(assert (= (and d!151705 (not c!130695)) b!1410080))

(assert (= (and b!1410080 c!130697) b!1410081))

(assert (= (and b!1410080 (not c!130697)) b!1410082))

(assert (= (and d!151705 c!130696) b!1410078))

(assert (= (and d!151705 (not c!130696)) b!1410077))

(assert (= (and b!1410077 res!947632) b!1410079))

(assert (= (and b!1410079 (not res!947633)) b!1410084))

(assert (= (and b!1410084 (not res!947631)) b!1410083))

(declare-fun m!1299359 () Bool)

(assert (=> b!1410083 m!1299359))

(declare-fun m!1299361 () Bool)

(assert (=> b!1410082 m!1299361))

(assert (=> b!1410082 m!1299361))

(assert (=> b!1410082 m!1299229))

(declare-fun m!1299363 () Bool)

(assert (=> b!1410082 m!1299363))

(declare-fun m!1299365 () Bool)

(assert (=> d!151705 m!1299365))

(assert (=> d!151705 m!1299211))

(assert (=> b!1410084 m!1299359))

(assert (=> b!1410079 m!1299359))

(assert (=> b!1409926 d!151705))

(declare-fun d!151707 () Bool)

(declare-fun lt!620850 () (_ BitVec 32))

(declare-fun lt!620849 () (_ BitVec 32))

(assert (=> d!151707 (= lt!620850 (bvmul (bvxor lt!620849 (bvlshr lt!620849 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151707 (= lt!620849 ((_ extract 31 0) (bvand (bvxor (select (arr!46516 a!2901) j!112) (bvlshr (select (arr!46516 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151707 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!947601 (let ((h!34378 ((_ extract 31 0) (bvand (bvxor (select (arr!46516 a!2901) j!112) (bvlshr (select (arr!46516 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127382 (bvmul (bvxor h!34378 (bvlshr h!34378 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127382 (bvlshr x!127382 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!947601 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!947601 #b00000000000000000000000000000000))))))

(assert (=> d!151707 (= (toIndex!0 (select (arr!46516 a!2901) j!112) mask!2840) (bvand (bvxor lt!620850 (bvlshr lt!620850 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1409926 d!151707))

(declare-fun b!1410149 () Bool)

(declare-fun e!798005 () SeekEntryResult!10853)

(declare-fun lt!620875 () SeekEntryResult!10853)

(assert (=> b!1410149 (= e!798005 (Found!10853 (index!45791 lt!620875)))))

(declare-fun d!151709 () Bool)

(declare-fun lt!620873 () SeekEntryResult!10853)

(assert (=> d!151709 (and (or ((_ is Undefined!10853) lt!620873) (not ((_ is Found!10853) lt!620873)) (and (bvsge (index!45790 lt!620873) #b00000000000000000000000000000000) (bvslt (index!45790 lt!620873) (size!47068 a!2901)))) (or ((_ is Undefined!10853) lt!620873) ((_ is Found!10853) lt!620873) (not ((_ is MissingZero!10853) lt!620873)) (and (bvsge (index!45789 lt!620873) #b00000000000000000000000000000000) (bvslt (index!45789 lt!620873) (size!47068 a!2901)))) (or ((_ is Undefined!10853) lt!620873) ((_ is Found!10853) lt!620873) ((_ is MissingZero!10853) lt!620873) (not ((_ is MissingVacant!10853) lt!620873)) (and (bvsge (index!45792 lt!620873) #b00000000000000000000000000000000) (bvslt (index!45792 lt!620873) (size!47068 a!2901)))) (or ((_ is Undefined!10853) lt!620873) (ite ((_ is Found!10853) lt!620873) (= (select (arr!46516 a!2901) (index!45790 lt!620873)) (select (arr!46516 a!2901) j!112)) (ite ((_ is MissingZero!10853) lt!620873) (= (select (arr!46516 a!2901) (index!45789 lt!620873)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10853) lt!620873) (= (select (arr!46516 a!2901) (index!45792 lt!620873)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!798004 () SeekEntryResult!10853)

(assert (=> d!151709 (= lt!620873 e!798004)))

(declare-fun c!130722 () Bool)

(assert (=> d!151709 (= c!130722 (and ((_ is Intermediate!10853) lt!620875) (undefined!11665 lt!620875)))))

(assert (=> d!151709 (= lt!620875 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46516 a!2901) j!112) mask!2840) (select (arr!46516 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!151709 (validMask!0 mask!2840)))

(assert (=> d!151709 (= (seekEntryOrOpen!0 (select (arr!46516 a!2901) j!112) a!2901 mask!2840) lt!620873)))

(declare-fun b!1410150 () Bool)

(assert (=> b!1410150 (= e!798004 Undefined!10853)))

(declare-fun e!798003 () SeekEntryResult!10853)

(declare-fun b!1410151 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96348 (_ BitVec 32)) SeekEntryResult!10853)

(assert (=> b!1410151 (= e!798003 (seekKeyOrZeroReturnVacant!0 (x!127377 lt!620875) (index!45791 lt!620875) (index!45791 lt!620875) (select (arr!46516 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1410152 () Bool)

(declare-fun c!130724 () Bool)

(declare-fun lt!620874 () (_ BitVec 64))

(assert (=> b!1410152 (= c!130724 (= lt!620874 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1410152 (= e!798005 e!798003)))

(declare-fun b!1410153 () Bool)

(assert (=> b!1410153 (= e!798003 (MissingZero!10853 (index!45791 lt!620875)))))

(declare-fun b!1410154 () Bool)

(assert (=> b!1410154 (= e!798004 e!798005)))

(assert (=> b!1410154 (= lt!620874 (select (arr!46516 a!2901) (index!45791 lt!620875)))))

(declare-fun c!130723 () Bool)

(assert (=> b!1410154 (= c!130723 (= lt!620874 (select (arr!46516 a!2901) j!112)))))

(assert (= (and d!151709 c!130722) b!1410150))

(assert (= (and d!151709 (not c!130722)) b!1410154))

(assert (= (and b!1410154 c!130723) b!1410149))

(assert (= (and b!1410154 (not c!130723)) b!1410152))

(assert (= (and b!1410152 c!130724) b!1410153))

(assert (= (and b!1410152 (not c!130724)) b!1410151))

(assert (=> d!151709 m!1299229))

(assert (=> d!151709 m!1299235))

(declare-fun m!1299389 () Bool)

(assert (=> d!151709 m!1299389))

(assert (=> d!151709 m!1299235))

(assert (=> d!151709 m!1299229))

(declare-fun m!1299391 () Bool)

(assert (=> d!151709 m!1299391))

(declare-fun m!1299393 () Bool)

(assert (=> d!151709 m!1299393))

(assert (=> d!151709 m!1299211))

(declare-fun m!1299395 () Bool)

(assert (=> d!151709 m!1299395))

(assert (=> b!1410151 m!1299229))

(declare-fun m!1299397 () Bool)

(assert (=> b!1410151 m!1299397))

(declare-fun m!1299399 () Bool)

(assert (=> b!1410154 m!1299399))

(assert (=> b!1409931 d!151709))

(declare-fun d!151719 () Bool)

(declare-fun res!947649 () Bool)

(declare-fun e!798007 () Bool)

(assert (=> d!151719 (=> res!947649 e!798007)))

(assert (=> d!151719 (= res!947649 (bvsge #b00000000000000000000000000000000 (size!47068 a!2901)))))

(assert (=> d!151719 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!798007)))

(declare-fun b!1410155 () Bool)

(declare-fun e!798008 () Bool)

(declare-fun call!67027 () Bool)

(assert (=> b!1410155 (= e!798008 call!67027)))

(declare-fun b!1410156 () Bool)

(declare-fun e!798006 () Bool)

(assert (=> b!1410156 (= e!798006 e!798008)))

(declare-fun lt!620878 () (_ BitVec 64))

(assert (=> b!1410156 (= lt!620878 (select (arr!46516 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!620877 () Unit!47523)

(assert (=> b!1410156 (= lt!620877 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!620878 #b00000000000000000000000000000000))))

(assert (=> b!1410156 (arrayContainsKey!0 a!2901 lt!620878 #b00000000000000000000000000000000)))

(declare-fun lt!620876 () Unit!47523)

(assert (=> b!1410156 (= lt!620876 lt!620877)))

(declare-fun res!947650 () Bool)

(assert (=> b!1410156 (= res!947650 (= (seekEntryOrOpen!0 (select (arr!46516 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10853 #b00000000000000000000000000000000)))))

(assert (=> b!1410156 (=> (not res!947650) (not e!798008))))

(declare-fun b!1410157 () Bool)

(assert (=> b!1410157 (= e!798006 call!67027)))

(declare-fun bm!67024 () Bool)

(assert (=> bm!67024 (= call!67027 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1410158 () Bool)

(assert (=> b!1410158 (= e!798007 e!798006)))

(declare-fun c!130725 () Bool)

(assert (=> b!1410158 (= c!130725 (validKeyInArray!0 (select (arr!46516 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!151719 (not res!947649)) b!1410158))

(assert (= (and b!1410158 c!130725) b!1410156))

(assert (= (and b!1410158 (not c!130725)) b!1410157))

(assert (= (and b!1410156 res!947650) b!1410155))

(assert (= (or b!1410155 b!1410157) bm!67024))

(declare-fun m!1299401 () Bool)

(assert (=> b!1410156 m!1299401))

(declare-fun m!1299403 () Bool)

(assert (=> b!1410156 m!1299403))

(declare-fun m!1299405 () Bool)

(assert (=> b!1410156 m!1299405))

(assert (=> b!1410156 m!1299401))

(declare-fun m!1299407 () Bool)

(assert (=> b!1410156 m!1299407))

(declare-fun m!1299409 () Bool)

(assert (=> bm!67024 m!1299409))

(assert (=> b!1410158 m!1299401))

(assert (=> b!1410158 m!1299401))

(declare-fun m!1299411 () Bool)

(assert (=> b!1410158 m!1299411))

(assert (=> b!1409928 d!151719))

(declare-fun d!151721 () Bool)

(assert (=> d!151721 (= (validKeyInArray!0 (select (arr!46516 a!2901) j!112)) (and (not (= (select (arr!46516 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46516 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1409927 d!151721))

(declare-fun b!1410178 () Bool)

(declare-fun e!798023 () Bool)

(declare-fun contains!9770 (List!33113 (_ BitVec 64)) Bool)

(assert (=> b!1410178 (= e!798023 (contains!9770 Nil!33110 (select (arr!46516 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1410179 () Bool)

(declare-fun e!798022 () Bool)

(declare-fun e!798025 () Bool)

(assert (=> b!1410179 (= e!798022 e!798025)))

(declare-fun res!947661 () Bool)

(assert (=> b!1410179 (=> (not res!947661) (not e!798025))))

(assert (=> b!1410179 (= res!947661 (not e!798023))))

(declare-fun res!947662 () Bool)

(assert (=> b!1410179 (=> (not res!947662) (not e!798023))))

(assert (=> b!1410179 (= res!947662 (validKeyInArray!0 (select (arr!46516 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!151723 () Bool)

(declare-fun res!947663 () Bool)

(assert (=> d!151723 (=> res!947663 e!798022)))

(assert (=> d!151723 (= res!947663 (bvsge #b00000000000000000000000000000000 (size!47068 a!2901)))))

(assert (=> d!151723 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33110) e!798022)))

(declare-fun b!1410180 () Bool)

(declare-fun e!798024 () Bool)

(declare-fun call!67030 () Bool)

(assert (=> b!1410180 (= e!798024 call!67030)))

(declare-fun bm!67027 () Bool)

(declare-fun c!130731 () Bool)

(assert (=> bm!67027 (= call!67030 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130731 (Cons!33109 (select (arr!46516 a!2901) #b00000000000000000000000000000000) Nil!33110) Nil!33110)))))

(declare-fun b!1410181 () Bool)

(assert (=> b!1410181 (= e!798024 call!67030)))

(declare-fun b!1410182 () Bool)

(assert (=> b!1410182 (= e!798025 e!798024)))

(assert (=> b!1410182 (= c!130731 (validKeyInArray!0 (select (arr!46516 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!151723 (not res!947663)) b!1410179))

(assert (= (and b!1410179 res!947662) b!1410178))

(assert (= (and b!1410179 res!947661) b!1410182))

(assert (= (and b!1410182 c!130731) b!1410181))

(assert (= (and b!1410182 (not c!130731)) b!1410180))

(assert (= (or b!1410181 b!1410180) bm!67027))

(assert (=> b!1410178 m!1299401))

(assert (=> b!1410178 m!1299401))

(declare-fun m!1299421 () Bool)

(assert (=> b!1410178 m!1299421))

(assert (=> b!1410179 m!1299401))

(assert (=> b!1410179 m!1299401))

(assert (=> b!1410179 m!1299411))

(assert (=> bm!67027 m!1299401))

(declare-fun m!1299423 () Bool)

(assert (=> bm!67027 m!1299423))

(assert (=> b!1410182 m!1299401))

(assert (=> b!1410182 m!1299401))

(assert (=> b!1410182 m!1299411))

(assert (=> b!1409924 d!151723))

(declare-fun d!151735 () Bool)

(assert (=> d!151735 (= (validKeyInArray!0 (select (arr!46516 a!2901) i!1037)) (and (not (= (select (arr!46516 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46516 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1409929 d!151735))

(declare-fun d!151737 () Bool)

(assert (=> d!151737 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!121292 d!151737))

(declare-fun d!151741 () Bool)

(assert (=> d!151741 (= (array_inv!35749 a!2901) (bvsge (size!47068 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!121292 d!151741))

(check-sat (not d!151681) (not bm!67027) (not b!1410003) (not b!1410158) (not b!1410082) (not d!151705) (not b!1410057) (not b!1410179) (not d!151709) (not bm!67016) (not b!1410156) (not bm!67024) (not b!1410178) (not b!1410055) (not b!1410151) (not b!1410182) (not d!151699))
(check-sat)
