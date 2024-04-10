; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122290 () Bool)

(assert start!122290)

(declare-fun b!1418018 () Bool)

(declare-fun res!953714 () Bool)

(declare-fun e!802484 () Bool)

(assert (=> b!1418018 (=> (not res!953714) (not e!802484))))

(declare-datatypes ((array!96826 0))(
  ( (array!96827 (arr!46738 (Array (_ BitVec 32) (_ BitVec 64))) (size!47288 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96826)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418018 (= res!953714 (validKeyInArray!0 (select (arr!46738 a!2831) i!982)))))

(declare-fun b!1418019 () Bool)

(declare-fun res!953717 () Bool)

(assert (=> b!1418019 (=> (not res!953717) (not e!802484))))

(declare-datatypes ((List!33248 0))(
  ( (Nil!33245) (Cons!33244 (h!34537 (_ BitVec 64)) (t!47942 List!33248)) )
))
(declare-fun noDuplicate!2611 (List!33248) Bool)

(assert (=> b!1418019 (= res!953717 (noDuplicate!2611 Nil!33245))))

(declare-fun b!1418020 () Bool)

(declare-fun res!953713 () Bool)

(assert (=> b!1418020 (=> (not res!953713) (not e!802484))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96826 (_ BitVec 32)) Bool)

(assert (=> b!1418020 (= res!953713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1418021 () Bool)

(declare-fun e!802482 () Bool)

(assert (=> b!1418021 (= e!802484 e!802482)))

(declare-fun res!953719 () Bool)

(assert (=> b!1418021 (=> res!953719 e!802482)))

(declare-fun contains!9836 (List!33248 (_ BitVec 64)) Bool)

(assert (=> b!1418021 (= res!953719 (contains!9836 Nil!33245 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1418022 () Bool)

(declare-fun res!953718 () Bool)

(assert (=> b!1418022 (=> (not res!953718) (not e!802484))))

(assert (=> b!1418022 (= res!953718 (and (bvsle #b00000000000000000000000000000000 (size!47288 a!2831)) (bvslt (size!47288 a!2831) #b01111111111111111111111111111111)))))

(declare-fun b!1418023 () Bool)

(declare-fun res!953712 () Bool)

(assert (=> b!1418023 (=> (not res!953712) (not e!802484))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1418023 (= res!953712 (validKeyInArray!0 (select (arr!46738 a!2831) j!81)))))

(declare-fun b!1418025 () Bool)

(declare-fun res!953716 () Bool)

(assert (=> b!1418025 (=> (not res!953716) (not e!802484))))

(assert (=> b!1418025 (= res!953716 (and (= (size!47288 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47288 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47288 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!953715 () Bool)

(assert (=> start!122290 (=> (not res!953715) (not e!802484))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122290 (= res!953715 (validMask!0 mask!2608))))

(assert (=> start!122290 e!802484))

(assert (=> start!122290 true))

(declare-fun array_inv!35766 (array!96826) Bool)

(assert (=> start!122290 (array_inv!35766 a!2831)))

(declare-fun b!1418024 () Bool)

(assert (=> b!1418024 (= e!802482 (contains!9836 Nil!33245 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!122290 res!953715) b!1418025))

(assert (= (and b!1418025 res!953716) b!1418018))

(assert (= (and b!1418018 res!953714) b!1418023))

(assert (= (and b!1418023 res!953712) b!1418020))

(assert (= (and b!1418020 res!953713) b!1418022))

(assert (= (and b!1418022 res!953718) b!1418019))

(assert (= (and b!1418019 res!953717) b!1418021))

(assert (= (and b!1418021 (not res!953719)) b!1418024))

(declare-fun m!1308769 () Bool)

(assert (=> b!1418021 m!1308769))

(declare-fun m!1308771 () Bool)

(assert (=> b!1418024 m!1308771))

(declare-fun m!1308773 () Bool)

(assert (=> b!1418018 m!1308773))

(assert (=> b!1418018 m!1308773))

(declare-fun m!1308775 () Bool)

(assert (=> b!1418018 m!1308775))

(declare-fun m!1308777 () Bool)

(assert (=> b!1418023 m!1308777))

(assert (=> b!1418023 m!1308777))

(declare-fun m!1308779 () Bool)

(assert (=> b!1418023 m!1308779))

(declare-fun m!1308781 () Bool)

(assert (=> b!1418019 m!1308781))

(declare-fun m!1308783 () Bool)

(assert (=> b!1418020 m!1308783))

(declare-fun m!1308785 () Bool)

(assert (=> start!122290 m!1308785))

(declare-fun m!1308787 () Bool)

(assert (=> start!122290 m!1308787))

(push 1)

(assert (not start!122290))

(assert (not b!1418023))

(assert (not b!1418024))

(assert (not b!1418018))

(assert (not b!1418019))

(assert (not b!1418020))

(assert (not b!1418021))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!152791 () Bool)

(declare-fun lt!625506 () Bool)

(declare-fun content!770 (List!33248) (Set (_ BitVec 64)))

(assert (=> d!152791 (= lt!625506 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!770 Nil!33245)))))

(declare-fun e!802508 () Bool)

(assert (=> d!152791 (= lt!625506 e!802508)))

(declare-fun res!953741 () Bool)

(assert (=> d!152791 (=> (not res!953741) (not e!802508))))

(assert (=> d!152791 (= res!953741 (is-Cons!33244 Nil!33245))))

(assert (=> d!152791 (= (contains!9836 Nil!33245 #b1000000000000000000000000000000000000000000000000000000000000000) lt!625506)))

(declare-fun b!1418050 () Bool)

(declare-fun e!802507 () Bool)

(assert (=> b!1418050 (= e!802508 e!802507)))

(declare-fun res!953740 () Bool)

(assert (=> b!1418050 (=> res!953740 e!802507)))

(assert (=> b!1418050 (= res!953740 (= (h!34537 Nil!33245) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1418051 () Bool)

(assert (=> b!1418051 (= e!802507 (contains!9836 (t!47942 Nil!33245) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!152791 res!953741) b!1418050))

(assert (= (and b!1418050 (not res!953740)) b!1418051))

(declare-fun m!1308799 () Bool)

(assert (=> d!152791 m!1308799))

(declare-fun m!1308801 () Bool)

(assert (=> d!152791 m!1308801))

(declare-fun m!1308803 () Bool)

(assert (=> b!1418051 m!1308803))

(assert (=> b!1418024 d!152791))

(declare-fun d!152797 () Bool)

(assert (=> d!152797 (= (validKeyInArray!0 (select (arr!46738 a!2831) i!982)) (and (not (= (select (arr!46738 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46738 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1418018 d!152797))

(declare-fun d!152799 () Bool)

(assert (=> d!152799 (= (validKeyInArray!0 (select (arr!46738 a!2831) j!81)) (and (not (= (select (arr!46738 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46738 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1418023 d!152799))

(declare-fun b!1418084 () Bool)

(declare-fun e!802535 () Bool)

(declare-fun e!802536 () Bool)

(assert (=> b!1418084 (= e!802535 e!802536)))

(declare-fun c!131643 () Bool)

(assert (=> b!1418084 (= c!131643 (validKeyInArray!0 (select (arr!46738 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1418085 () Bool)

(declare-fun call!67249 () Bool)

(assert (=> b!1418085 (= e!802536 call!67249)))

(declare-fun d!152801 () Bool)

(declare-fun res!953762 () Bool)

(assert (=> d!152801 (=> res!953762 e!802535)))

(assert (=> d!152801 (= res!953762 (bvsge #b00000000000000000000000000000000 (size!47288 a!2831)))))

(assert (=> d!152801 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!802535)))

(declare-fun b!1418086 () Bool)

(declare-fun e!802537 () Bool)

(assert (=> b!1418086 (= e!802537 call!67249)))

(declare-fun bm!67246 () Bool)

(assert (=> bm!67246 (= call!67249 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1418087 () Bool)

(assert (=> b!1418087 (= e!802536 e!802537)))

(declare-fun lt!625527 () (_ BitVec 64))

(assert (=> b!1418087 (= lt!625527 (select (arr!46738 a!2831) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48058 0))(
  ( (Unit!48059) )
))
(declare-fun lt!625528 () Unit!48058)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96826 (_ BitVec 64) (_ BitVec 32)) Unit!48058)

(assert (=> b!1418087 (= lt!625528 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!625527 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96826 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1418087 (arrayContainsKey!0 a!2831 lt!625527 #b00000000000000000000000000000000)))

(declare-fun lt!625526 () Unit!48058)

(assert (=> b!1418087 (= lt!625526 lt!625528)))

(declare-fun res!953763 () Bool)

(declare-datatypes ((SeekEntryResult!11042 0))(
  ( (MissingZero!11042 (index!46560 (_ BitVec 32))) (Found!11042 (index!46561 (_ BitVec 32))) (Intermediate!11042 (undefined!11854 Bool) (index!46562 (_ BitVec 32)) (x!128173 (_ BitVec 32))) (Undefined!11042) (MissingVacant!11042 (index!46563 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96826 (_ BitVec 32)) SeekEntryResult!11042)

(assert (=> b!1418087 (= res!953763 (= (seekEntryOrOpen!0 (select (arr!46738 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11042 #b00000000000000000000000000000000)))))

(assert (=> b!1418087 (=> (not res!953763) (not e!802537))))

(assert (= (and d!152801 (not res!953762)) b!1418084))

