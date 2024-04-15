; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127346 () Bool)

(assert start!127346)

(declare-fun b!1497392 () Bool)

(declare-fun res!1018710 () Bool)

(declare-fun e!838477 () Bool)

(assert (=> b!1497392 (=> (not res!1018710) (not e!838477))))

(declare-datatypes ((array!99802 0))(
  ( (array!99803 (arr!48166 (Array (_ BitVec 32) (_ BitVec 64))) (size!48718 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99802)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1497392 (= res!1018710 (validKeyInArray!0 (select (arr!48166 a!2850) i!996)))))

(declare-fun b!1497393 () Bool)

(declare-fun res!1018711 () Bool)

(assert (=> b!1497393 (=> (not res!1018711) (not e!838477))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1497393 (= res!1018711 (and (= (size!48718 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48718 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48718 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1497394 () Bool)

(declare-fun res!1018713 () Bool)

(assert (=> b!1497394 (=> (not res!1018713) (not e!838477))))

(assert (=> b!1497394 (= res!1018713 (validKeyInArray!0 (select (arr!48166 a!2850) j!87)))))

(declare-fun b!1497395 () Bool)

(assert (=> b!1497395 (= e!838477 (and (bvsle #b00000000000000000000000000000000 (size!48718 a!2850)) (bvsge (size!48718 a!2850) #b01111111111111111111111111111111)))))

(declare-fun res!1018712 () Bool)

(assert (=> start!127346 (=> (not res!1018712) (not e!838477))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127346 (= res!1018712 (validMask!0 mask!2661))))

(assert (=> start!127346 e!838477))

(assert (=> start!127346 true))

(declare-fun array_inv!37399 (array!99802) Bool)

(assert (=> start!127346 (array_inv!37399 a!2850)))

(declare-fun b!1497396 () Bool)

(declare-fun res!1018714 () Bool)

(assert (=> b!1497396 (=> (not res!1018714) (not e!838477))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99802 (_ BitVec 32)) Bool)

(assert (=> b!1497396 (= res!1018714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!127346 res!1018712) b!1497393))

(assert (= (and b!1497393 res!1018711) b!1497392))

(assert (= (and b!1497392 res!1018710) b!1497394))

(assert (= (and b!1497394 res!1018713) b!1497396))

(assert (= (and b!1497396 res!1018714) b!1497395))

(declare-fun m!1379943 () Bool)

(assert (=> b!1497392 m!1379943))

(assert (=> b!1497392 m!1379943))

(declare-fun m!1379945 () Bool)

(assert (=> b!1497392 m!1379945))

(declare-fun m!1379947 () Bool)

(assert (=> b!1497394 m!1379947))

(assert (=> b!1497394 m!1379947))

(declare-fun m!1379949 () Bool)

(assert (=> b!1497394 m!1379949))

(declare-fun m!1379951 () Bool)

(assert (=> start!127346 m!1379951))

(declare-fun m!1379953 () Bool)

(assert (=> start!127346 m!1379953))

(declare-fun m!1379955 () Bool)

(assert (=> b!1497396 m!1379955))

(check-sat (not start!127346) (not b!1497392) (not b!1497396) (not b!1497394))
(check-sat)
(get-model)

(declare-fun d!157185 () Bool)

(assert (=> d!157185 (= (validMask!0 mask!2661) (and (or (= mask!2661 #b00000000000000000000000000000111) (= mask!2661 #b00000000000000000000000000001111) (= mask!2661 #b00000000000000000000000000011111) (= mask!2661 #b00000000000000000000000000111111) (= mask!2661 #b00000000000000000000000001111111) (= mask!2661 #b00000000000000000000000011111111) (= mask!2661 #b00000000000000000000000111111111) (= mask!2661 #b00000000000000000000001111111111) (= mask!2661 #b00000000000000000000011111111111) (= mask!2661 #b00000000000000000000111111111111) (= mask!2661 #b00000000000000000001111111111111) (= mask!2661 #b00000000000000000011111111111111) (= mask!2661 #b00000000000000000111111111111111) (= mask!2661 #b00000000000000001111111111111111) (= mask!2661 #b00000000000000011111111111111111) (= mask!2661 #b00000000000000111111111111111111) (= mask!2661 #b00000000000001111111111111111111) (= mask!2661 #b00000000000011111111111111111111) (= mask!2661 #b00000000000111111111111111111111) (= mask!2661 #b00000000001111111111111111111111) (= mask!2661 #b00000000011111111111111111111111) (= mask!2661 #b00000000111111111111111111111111) (= mask!2661 #b00000001111111111111111111111111) (= mask!2661 #b00000011111111111111111111111111) (= mask!2661 #b00000111111111111111111111111111) (= mask!2661 #b00001111111111111111111111111111) (= mask!2661 #b00011111111111111111111111111111) (= mask!2661 #b00111111111111111111111111111111)) (bvsle mask!2661 #b00111111111111111111111111111111)))))

(assert (=> start!127346 d!157185))

(declare-fun d!157197 () Bool)

(assert (=> d!157197 (= (array_inv!37399 a!2850) (bvsge (size!48718 a!2850) #b00000000000000000000000000000000))))

(assert (=> start!127346 d!157197))

(declare-fun d!157199 () Bool)

(assert (=> d!157199 (= (validKeyInArray!0 (select (arr!48166 a!2850) i!996)) (and (not (= (select (arr!48166 a!2850) i!996) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48166 a!2850) i!996) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1497392 d!157199))

(declare-fun b!1497447 () Bool)

(declare-fun e!838506 () Bool)

(declare-fun call!68012 () Bool)

(assert (=> b!1497447 (= e!838506 call!68012)))

(declare-fun b!1497448 () Bool)

(declare-fun e!838508 () Bool)

(assert (=> b!1497448 (= e!838508 call!68012)))

(declare-fun b!1497449 () Bool)

(assert (=> b!1497449 (= e!838506 e!838508)))

(declare-fun lt!652243 () (_ BitVec 64))

(assert (=> b!1497449 (= lt!652243 (select (arr!48166 a!2850) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50033 0))(
  ( (Unit!50034) )
))
(declare-fun lt!652242 () Unit!50033)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99802 (_ BitVec 64) (_ BitVec 32)) Unit!50033)

(assert (=> b!1497449 (= lt!652242 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2850 lt!652243 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99802 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1497449 (arrayContainsKey!0 a!2850 lt!652243 #b00000000000000000000000000000000)))

(declare-fun lt!652244 () Unit!50033)

(assert (=> b!1497449 (= lt!652244 lt!652242)))

(declare-fun res!1018755 () Bool)

(declare-datatypes ((SeekEntryResult!12426 0))(
  ( (MissingZero!12426 (index!52096 (_ BitVec 32))) (Found!12426 (index!52097 (_ BitVec 32))) (Intermediate!12426 (undefined!13238 Bool) (index!52098 (_ BitVec 32)) (x!133727 (_ BitVec 32))) (Undefined!12426) (MissingVacant!12426 (index!52099 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99802 (_ BitVec 32)) SeekEntryResult!12426)

(assert (=> b!1497449 (= res!1018755 (= (seekEntryOrOpen!0 (select (arr!48166 a!2850) #b00000000000000000000000000000000) a!2850 mask!2661) (Found!12426 #b00000000000000000000000000000000)))))

(assert (=> b!1497449 (=> (not res!1018755) (not e!838508))))

(declare-fun b!1497450 () Bool)

(declare-fun e!838507 () Bool)

(assert (=> b!1497450 (= e!838507 e!838506)))

(declare-fun c!138883 () Bool)

(assert (=> b!1497450 (= c!138883 (validKeyInArray!0 (select (arr!48166 a!2850) #b00000000000000000000000000000000)))))

(declare-fun bm!68009 () Bool)

(assert (=> bm!68009 (= call!68012 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2850 mask!2661))))

(declare-fun d!157201 () Bool)

(declare-fun res!1018756 () Bool)

(assert (=> d!157201 (=> res!1018756 e!838507)))

(assert (=> d!157201 (= res!1018756 (bvsge #b00000000000000000000000000000000 (size!48718 a!2850)))))

(assert (=> d!157201 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661) e!838507)))

(assert (= (and d!157201 (not res!1018756)) b!1497450))

(assert (= (and b!1497450 c!138883) b!1497449))

(assert (= (and b!1497450 (not c!138883)) b!1497447))

(assert (= (and b!1497449 res!1018755) b!1497448))

(assert (= (or b!1497448 b!1497447) bm!68009))

(declare-fun m!1379997 () Bool)

(assert (=> b!1497449 m!1379997))

(declare-fun m!1379999 () Bool)

(assert (=> b!1497449 m!1379999))

(declare-fun m!1380001 () Bool)

(assert (=> b!1497449 m!1380001))

(assert (=> b!1497449 m!1379997))

(declare-fun m!1380003 () Bool)

(assert (=> b!1497449 m!1380003))

(assert (=> b!1497450 m!1379997))

(assert (=> b!1497450 m!1379997))

(declare-fun m!1380005 () Bool)

(assert (=> b!1497450 m!1380005))

(declare-fun m!1380007 () Bool)

(assert (=> bm!68009 m!1380007))

(assert (=> b!1497396 d!157201))

(declare-fun d!157213 () Bool)

(assert (=> d!157213 (= (validKeyInArray!0 (select (arr!48166 a!2850) j!87)) (and (not (= (select (arr!48166 a!2850) j!87) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48166 a!2850) j!87) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1497394 d!157213))

(check-sat (not bm!68009) (not b!1497450) (not b!1497449))
(check-sat)
