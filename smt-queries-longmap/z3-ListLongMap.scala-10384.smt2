; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122252 () Bool)

(assert start!122252)

(declare-fun b!1417876 () Bool)

(declare-fun res!953589 () Bool)

(declare-fun e!802405 () Bool)

(assert (=> b!1417876 (=> (not res!953589) (not e!802405))))

(declare-datatypes ((array!96815 0))(
  ( (array!96816 (arr!46734 (Array (_ BitVec 32) (_ BitVec 64))) (size!47284 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96815)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417876 (= res!953589 (validKeyInArray!0 (select (arr!46734 a!2831) j!81)))))

(declare-fun b!1417877 () Bool)

(declare-fun res!953590 () Bool)

(assert (=> b!1417877 (=> (not res!953590) (not e!802405))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1417877 (= res!953590 (validKeyInArray!0 (select (arr!46734 a!2831) i!982)))))

(declare-fun b!1417878 () Bool)

(declare-datatypes ((List!33244 0))(
  ( (Nil!33241) (Cons!33240 (h!34533 (_ BitVec 64)) (t!47938 List!33244)) )
))
(declare-fun noDuplicate!2607 (List!33244) Bool)

(assert (=> b!1417878 (= e!802405 (not (noDuplicate!2607 Nil!33241)))))

(declare-fun b!1417879 () Bool)

(declare-fun res!953591 () Bool)

(assert (=> b!1417879 (=> (not res!953591) (not e!802405))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96815 (_ BitVec 32)) Bool)

(assert (=> b!1417879 (= res!953591 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1417880 () Bool)

(declare-fun res!953592 () Bool)

(assert (=> b!1417880 (=> (not res!953592) (not e!802405))))

(assert (=> b!1417880 (= res!953592 (and (bvsle #b00000000000000000000000000000000 (size!47284 a!2831)) (bvslt (size!47284 a!2831) #b01111111111111111111111111111111)))))

(declare-fun b!1417881 () Bool)

(declare-fun res!953588 () Bool)

(assert (=> b!1417881 (=> (not res!953588) (not e!802405))))

(assert (=> b!1417881 (= res!953588 (and (= (size!47284 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47284 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47284 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!953593 () Bool)

(assert (=> start!122252 (=> (not res!953593) (not e!802405))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122252 (= res!953593 (validMask!0 mask!2608))))

(assert (=> start!122252 e!802405))

(assert (=> start!122252 true))

(declare-fun array_inv!35762 (array!96815) Bool)

(assert (=> start!122252 (array_inv!35762 a!2831)))

(assert (= (and start!122252 res!953593) b!1417881))

(assert (= (and b!1417881 res!953588) b!1417877))

(assert (= (and b!1417877 res!953590) b!1417876))

(assert (= (and b!1417876 res!953589) b!1417879))

(assert (= (and b!1417879 res!953591) b!1417880))

(assert (= (and b!1417880 res!953592) b!1417878))

(declare-fun m!1308649 () Bool)

(assert (=> start!122252 m!1308649))

(declare-fun m!1308651 () Bool)

(assert (=> start!122252 m!1308651))

(declare-fun m!1308653 () Bool)

(assert (=> b!1417876 m!1308653))

(assert (=> b!1417876 m!1308653))

(declare-fun m!1308655 () Bool)

(assert (=> b!1417876 m!1308655))

(declare-fun m!1308657 () Bool)

(assert (=> b!1417878 m!1308657))

(declare-fun m!1308659 () Bool)

(assert (=> b!1417879 m!1308659))

(declare-fun m!1308661 () Bool)

(assert (=> b!1417877 m!1308661))

(assert (=> b!1417877 m!1308661))

(declare-fun m!1308663 () Bool)

(assert (=> b!1417877 m!1308663))

(check-sat (not b!1417876) (not b!1417877) (not b!1417879) (not b!1417878) (not start!122252))
(check-sat)
(get-model)

(declare-fun d!152745 () Bool)

(assert (=> d!152745 (= (validKeyInArray!0 (select (arr!46734 a!2831) j!81)) (and (not (= (select (arr!46734 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46734 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1417876 d!152745))

(declare-fun d!152747 () Bool)

(declare-fun res!953616 () Bool)

(declare-fun e!802417 () Bool)

(assert (=> d!152747 (=> res!953616 e!802417)))

(get-info :version)

(assert (=> d!152747 (= res!953616 ((_ is Nil!33241) Nil!33241))))

(assert (=> d!152747 (= (noDuplicate!2607 Nil!33241) e!802417)))

(declare-fun b!1417904 () Bool)

(declare-fun e!802418 () Bool)

(assert (=> b!1417904 (= e!802417 e!802418)))

(declare-fun res!953617 () Bool)

(assert (=> b!1417904 (=> (not res!953617) (not e!802418))))

(declare-fun contains!9832 (List!33244 (_ BitVec 64)) Bool)

(assert (=> b!1417904 (= res!953617 (not (contains!9832 (t!47938 Nil!33241) (h!34533 Nil!33241))))))

(declare-fun b!1417905 () Bool)

(assert (=> b!1417905 (= e!802418 (noDuplicate!2607 (t!47938 Nil!33241)))))

(assert (= (and d!152747 (not res!953616)) b!1417904))

(assert (= (and b!1417904 res!953617) b!1417905))

(declare-fun m!1308681 () Bool)

(assert (=> b!1417904 m!1308681))

(declare-fun m!1308683 () Bool)

(assert (=> b!1417905 m!1308683))

(assert (=> b!1417878 d!152747))

(declare-fun d!152749 () Bool)

(assert (=> d!152749 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!122252 d!152749))

(declare-fun d!152769 () Bool)

(assert (=> d!152769 (= (array_inv!35762 a!2831) (bvsge (size!47284 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!122252 d!152769))

(declare-fun d!152771 () Bool)

(assert (=> d!152771 (= (validKeyInArray!0 (select (arr!46734 a!2831) i!982)) (and (not (= (select (arr!46734 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46734 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1417877 d!152771))

(declare-fun b!1417950 () Bool)

(declare-fun e!802455 () Bool)

(declare-fun e!802457 () Bool)

(assert (=> b!1417950 (= e!802455 e!802457)))

(declare-fun lt!625492 () (_ BitVec 64))

(assert (=> b!1417950 (= lt!625492 (select (arr!46734 a!2831) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48050 0))(
  ( (Unit!48051) )
))
(declare-fun lt!625494 () Unit!48050)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96815 (_ BitVec 64) (_ BitVec 32)) Unit!48050)

(assert (=> b!1417950 (= lt!625494 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!625492 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96815 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1417950 (arrayContainsKey!0 a!2831 lt!625492 #b00000000000000000000000000000000)))

(declare-fun lt!625493 () Unit!48050)

(assert (=> b!1417950 (= lt!625493 lt!625494)))

(declare-fun res!953646 () Bool)

(declare-datatypes ((SeekEntryResult!11038 0))(
  ( (MissingZero!11038 (index!46544 (_ BitVec 32))) (Found!11038 (index!46545 (_ BitVec 32))) (Intermediate!11038 (undefined!11850 Bool) (index!46546 (_ BitVec 32)) (x!128161 (_ BitVec 32))) (Undefined!11038) (MissingVacant!11038 (index!46547 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96815 (_ BitVec 32)) SeekEntryResult!11038)

(assert (=> b!1417950 (= res!953646 (= (seekEntryOrOpen!0 (select (arr!46734 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11038 #b00000000000000000000000000000000)))))

(assert (=> b!1417950 (=> (not res!953646) (not e!802457))))

(declare-fun b!1417952 () Bool)

(declare-fun call!67240 () Bool)

(assert (=> b!1417952 (= e!802455 call!67240)))

(declare-fun bm!67237 () Bool)

(assert (=> bm!67237 (= call!67240 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1417953 () Bool)

(assert (=> b!1417953 (= e!802457 call!67240)))

(declare-fun d!152773 () Bool)

(declare-fun res!953647 () Bool)

(declare-fun e!802456 () Bool)

(assert (=> d!152773 (=> res!953647 e!802456)))

(assert (=> d!152773 (= res!953647 (bvsge #b00000000000000000000000000000000 (size!47284 a!2831)))))

(assert (=> d!152773 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!802456)))

(declare-fun b!1417951 () Bool)

(assert (=> b!1417951 (= e!802456 e!802455)))

(declare-fun c!131634 () Bool)

(assert (=> b!1417951 (= c!131634 (validKeyInArray!0 (select (arr!46734 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!152773 (not res!953647)) b!1417951))

(assert (= (and b!1417951 c!131634) b!1417950))

(assert (= (and b!1417951 (not c!131634)) b!1417952))

(assert (= (and b!1417950 res!953646) b!1417953))

(assert (= (or b!1417953 b!1417952) bm!67237))

(declare-fun m!1308717 () Bool)

(assert (=> b!1417950 m!1308717))

(declare-fun m!1308719 () Bool)

(assert (=> b!1417950 m!1308719))

(declare-fun m!1308721 () Bool)

(assert (=> b!1417950 m!1308721))

(assert (=> b!1417950 m!1308717))

(declare-fun m!1308723 () Bool)

(assert (=> b!1417950 m!1308723))

(declare-fun m!1308725 () Bool)

(assert (=> bm!67237 m!1308725))

(assert (=> b!1417951 m!1308717))

(assert (=> b!1417951 m!1308717))

(declare-fun m!1308727 () Bool)

(assert (=> b!1417951 m!1308727))

(assert (=> b!1417879 d!152773))

(check-sat (not b!1417950) (not b!1417904) (not bm!67237) (not b!1417951) (not b!1417905))
(check-sat)
