; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127694 () Bool)

(assert start!127694)

(declare-fun b!1499501 () Bool)

(declare-fun e!839783 () Bool)

(declare-datatypes ((List!34726 0))(
  ( (Nil!34723) (Cons!34722 (h!36134 (_ BitVec 64)) (t!49412 List!34726)) )
))
(declare-fun noDuplicate!2635 (List!34726) Bool)

(assert (=> b!1499501 (= e!839783 (not (noDuplicate!2635 Nil!34723)))))

(declare-fun b!1499503 () Bool)

(declare-fun res!1019516 () Bool)

(assert (=> b!1499503 (=> (not res!1019516) (not e!839783))))

(declare-datatypes ((array!99977 0))(
  ( (array!99978 (arr!48247 (Array (_ BitVec 32) (_ BitVec 64))) (size!48798 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99977)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499503 (= res!1019516 (validKeyInArray!0 (select (arr!48247 a!2850) i!996)))))

(declare-fun b!1499504 () Bool)

(declare-fun res!1019519 () Bool)

(assert (=> b!1499504 (=> (not res!1019519) (not e!839783))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1499504 (= res!1019519 (and (= (size!48798 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48798 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48798 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1499505 () Bool)

(declare-fun res!1019518 () Bool)

(assert (=> b!1499505 (=> (not res!1019518) (not e!839783))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99977 (_ BitVec 32)) Bool)

(assert (=> b!1499505 (= res!1019518 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1499506 () Bool)

(declare-fun res!1019517 () Bool)

(assert (=> b!1499506 (=> (not res!1019517) (not e!839783))))

(assert (=> b!1499506 (= res!1019517 (and (bvsle #b00000000000000000000000000000000 (size!48798 a!2850)) (bvslt (size!48798 a!2850) #b01111111111111111111111111111111)))))

(declare-fun b!1499502 () Bool)

(declare-fun res!1019514 () Bool)

(assert (=> b!1499502 (=> (not res!1019514) (not e!839783))))

(assert (=> b!1499502 (= res!1019514 (validKeyInArray!0 (select (arr!48247 a!2850) j!87)))))

(declare-fun res!1019515 () Bool)

(assert (=> start!127694 (=> (not res!1019515) (not e!839783))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127694 (= res!1019515 (validMask!0 mask!2661))))

(assert (=> start!127694 e!839783))

(assert (=> start!127694 true))

(declare-fun array_inv!37528 (array!99977) Bool)

(assert (=> start!127694 (array_inv!37528 a!2850)))

(assert (= (and start!127694 res!1019515) b!1499504))

(assert (= (and b!1499504 res!1019519) b!1499503))

(assert (= (and b!1499503 res!1019516) b!1499502))

(assert (= (and b!1499502 res!1019514) b!1499505))

(assert (= (and b!1499505 res!1019518) b!1499506))

(assert (= (and b!1499506 res!1019517) b!1499501))

(declare-fun m!1382601 () Bool)

(assert (=> b!1499501 m!1382601))

(declare-fun m!1382603 () Bool)

(assert (=> b!1499502 m!1382603))

(assert (=> b!1499502 m!1382603))

(declare-fun m!1382605 () Bool)

(assert (=> b!1499502 m!1382605))

(declare-fun m!1382607 () Bool)

(assert (=> b!1499505 m!1382607))

(declare-fun m!1382609 () Bool)

(assert (=> start!127694 m!1382609))

(declare-fun m!1382611 () Bool)

(assert (=> start!127694 m!1382611))

(declare-fun m!1382613 () Bool)

(assert (=> b!1499503 m!1382613))

(assert (=> b!1499503 m!1382613))

(declare-fun m!1382615 () Bool)

(assert (=> b!1499503 m!1382615))

(check-sat (not start!127694) (not b!1499501) (not b!1499505) (not b!1499502) (not b!1499503))
(check-sat)
(get-model)

(declare-fun d!157941 () Bool)

(declare-fun res!1019561 () Bool)

(declare-fun e!839805 () Bool)

(assert (=> d!157941 (=> res!1019561 e!839805)))

(assert (=> d!157941 (= res!1019561 (bvsge #b00000000000000000000000000000000 (size!48798 a!2850)))))

(assert (=> d!157941 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661) e!839805)))

(declare-fun b!1499551 () Bool)

(declare-fun e!839803 () Bool)

(declare-fun call!68142 () Bool)

(assert (=> b!1499551 (= e!839803 call!68142)))

(declare-fun b!1499552 () Bool)

(assert (=> b!1499552 (= e!839805 e!839803)))

(declare-fun c!139540 () Bool)

(assert (=> b!1499552 (= c!139540 (validKeyInArray!0 (select (arr!48247 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1499553 () Bool)

(declare-fun e!839804 () Bool)

(assert (=> b!1499553 (= e!839803 e!839804)))

(declare-fun lt!653178 () (_ BitVec 64))

(assert (=> b!1499553 (= lt!653178 (select (arr!48247 a!2850) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50125 0))(
  ( (Unit!50126) )
))
(declare-fun lt!653176 () Unit!50125)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99977 (_ BitVec 64) (_ BitVec 32)) Unit!50125)

(assert (=> b!1499553 (= lt!653176 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2850 lt!653178 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99977 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1499553 (arrayContainsKey!0 a!2850 lt!653178 #b00000000000000000000000000000000)))

(declare-fun lt!653177 () Unit!50125)

(assert (=> b!1499553 (= lt!653177 lt!653176)))

(declare-fun res!1019560 () Bool)

(declare-datatypes ((SeekEntryResult!12376 0))(
  ( (MissingZero!12376 (index!51896 (_ BitVec 32))) (Found!12376 (index!51897 (_ BitVec 32))) (Intermediate!12376 (undefined!13188 Bool) (index!51898 (_ BitVec 32)) (x!133724 (_ BitVec 32))) (Undefined!12376) (MissingVacant!12376 (index!51899 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99977 (_ BitVec 32)) SeekEntryResult!12376)

(assert (=> b!1499553 (= res!1019560 (= (seekEntryOrOpen!0 (select (arr!48247 a!2850) #b00000000000000000000000000000000) a!2850 mask!2661) (Found!12376 #b00000000000000000000000000000000)))))

(assert (=> b!1499553 (=> (not res!1019560) (not e!839804))))

(declare-fun bm!68139 () Bool)

(assert (=> bm!68139 (= call!68142 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2850 mask!2661))))

(declare-fun b!1499554 () Bool)

(assert (=> b!1499554 (= e!839804 call!68142)))

(assert (= (and d!157941 (not res!1019561)) b!1499552))

(assert (= (and b!1499552 c!139540) b!1499553))

(assert (= (and b!1499552 (not c!139540)) b!1499551))

(assert (= (and b!1499553 res!1019560) b!1499554))

(assert (= (or b!1499554 b!1499551) bm!68139))

(declare-fun m!1382649 () Bool)

(assert (=> b!1499552 m!1382649))

(assert (=> b!1499552 m!1382649))

(declare-fun m!1382651 () Bool)

(assert (=> b!1499552 m!1382651))

(assert (=> b!1499553 m!1382649))

(declare-fun m!1382653 () Bool)

(assert (=> b!1499553 m!1382653))

(declare-fun m!1382655 () Bool)

(assert (=> b!1499553 m!1382655))

(assert (=> b!1499553 m!1382649))

(declare-fun m!1382657 () Bool)

(assert (=> b!1499553 m!1382657))

(declare-fun m!1382659 () Bool)

(assert (=> bm!68139 m!1382659))

(assert (=> b!1499505 d!157941))

(declare-fun d!157945 () Bool)

(assert (=> d!157945 (= (validMask!0 mask!2661) (and (or (= mask!2661 #b00000000000000000000000000000111) (= mask!2661 #b00000000000000000000000000001111) (= mask!2661 #b00000000000000000000000000011111) (= mask!2661 #b00000000000000000000000000111111) (= mask!2661 #b00000000000000000000000001111111) (= mask!2661 #b00000000000000000000000011111111) (= mask!2661 #b00000000000000000000000111111111) (= mask!2661 #b00000000000000000000001111111111) (= mask!2661 #b00000000000000000000011111111111) (= mask!2661 #b00000000000000000000111111111111) (= mask!2661 #b00000000000000000001111111111111) (= mask!2661 #b00000000000000000011111111111111) (= mask!2661 #b00000000000000000111111111111111) (= mask!2661 #b00000000000000001111111111111111) (= mask!2661 #b00000000000000011111111111111111) (= mask!2661 #b00000000000000111111111111111111) (= mask!2661 #b00000000000001111111111111111111) (= mask!2661 #b00000000000011111111111111111111) (= mask!2661 #b00000000000111111111111111111111) (= mask!2661 #b00000000001111111111111111111111) (= mask!2661 #b00000000011111111111111111111111) (= mask!2661 #b00000000111111111111111111111111) (= mask!2661 #b00000001111111111111111111111111) (= mask!2661 #b00000011111111111111111111111111) (= mask!2661 #b00000111111111111111111111111111) (= mask!2661 #b00001111111111111111111111111111) (= mask!2661 #b00011111111111111111111111111111) (= mask!2661 #b00111111111111111111111111111111)) (bvsle mask!2661 #b00111111111111111111111111111111)))))

(assert (=> start!127694 d!157945))

(declare-fun d!157953 () Bool)

(assert (=> d!157953 (= (array_inv!37528 a!2850) (bvsge (size!48798 a!2850) #b00000000000000000000000000000000))))

(assert (=> start!127694 d!157953))

(declare-fun d!157955 () Bool)

(declare-fun res!1019566 () Bool)

(declare-fun e!839810 () Bool)

(assert (=> d!157955 (=> res!1019566 e!839810)))

(get-info :version)

(assert (=> d!157955 (= res!1019566 ((_ is Nil!34723) Nil!34723))))

(assert (=> d!157955 (= (noDuplicate!2635 Nil!34723) e!839810)))

(declare-fun b!1499559 () Bool)

(declare-fun e!839811 () Bool)

(assert (=> b!1499559 (= e!839810 e!839811)))

(declare-fun res!1019567 () Bool)

(assert (=> b!1499559 (=> (not res!1019567) (not e!839811))))

(declare-fun contains!9984 (List!34726 (_ BitVec 64)) Bool)

(assert (=> b!1499559 (= res!1019567 (not (contains!9984 (t!49412 Nil!34723) (h!36134 Nil!34723))))))

(declare-fun b!1499560 () Bool)

(assert (=> b!1499560 (= e!839811 (noDuplicate!2635 (t!49412 Nil!34723)))))

(assert (= (and d!157955 (not res!1019566)) b!1499559))

(assert (= (and b!1499559 res!1019567) b!1499560))

(declare-fun m!1382661 () Bool)

(assert (=> b!1499559 m!1382661))

(declare-fun m!1382663 () Bool)

(assert (=> b!1499560 m!1382663))

(assert (=> b!1499501 d!157955))

(declare-fun d!157963 () Bool)

(assert (=> d!157963 (= (validKeyInArray!0 (select (arr!48247 a!2850) i!996)) (and (not (= (select (arr!48247 a!2850) i!996) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48247 a!2850) i!996) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1499503 d!157963))

(declare-fun d!157965 () Bool)

(assert (=> d!157965 (= (validKeyInArray!0 (select (arr!48247 a!2850) j!87)) (and (not (= (select (arr!48247 a!2850) j!87) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48247 a!2850) j!87) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1499502 d!157965))

(check-sat (not b!1499559) (not b!1499552) (not b!1499560) (not bm!68139) (not b!1499553))
(check-sat)
