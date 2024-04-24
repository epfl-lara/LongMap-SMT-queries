; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128126 () Bool)

(assert start!128126)

(declare-fun b!1503975 () Bool)

(declare-fun res!1023875 () Bool)

(declare-fun e!841313 () Bool)

(assert (=> b!1503975 (=> (not res!1023875) (not e!841313))))

(declare-datatypes ((array!100321 0))(
  ( (array!100322 (arr!48415 (Array (_ BitVec 32) (_ BitVec 64))) (size!48966 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100321)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503975 (= res!1023875 (validKeyInArray!0 (select (arr!48415 a!2850) i!996)))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun b!1503976 () Bool)

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1503976 (= e!841313 (and (= (select (arr!48415 a!2850) index!625) (select (arr!48415 a!2850) j!87)) (not (= j!87 index!625))))))

(declare-fun b!1503978 () Bool)

(declare-fun res!1023871 () Bool)

(assert (=> b!1503978 (=> (not res!1023871) (not e!841313))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1503978 (= res!1023871 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48966 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48966 a!2850)) (= (select (arr!48415 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48415 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48966 a!2850))))))

(declare-fun b!1503979 () Bool)

(declare-fun res!1023873 () Bool)

(assert (=> b!1503979 (=> (not res!1023873) (not e!841313))))

(declare-datatypes ((List!34894 0))(
  ( (Nil!34891) (Cons!34890 (h!36302 (_ BitVec 64)) (t!49580 List!34894)) )
))
(declare-fun arrayNoDuplicates!0 (array!100321 (_ BitVec 32) List!34894) Bool)

(assert (=> b!1503979 (= res!1023873 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34891))))

(declare-fun b!1503980 () Bool)

(declare-fun res!1023869 () Bool)

(assert (=> b!1503980 (=> (not res!1023869) (not e!841313))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12506 0))(
  ( (MissingZero!12506 (index!52416 (_ BitVec 32))) (Found!12506 (index!52417 (_ BitVec 32))) (Intermediate!12506 (undefined!13318 Bool) (index!52418 (_ BitVec 32)) (x!134305 (_ BitVec 32))) (Undefined!12506) (MissingVacant!12506 (index!52419 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100321 (_ BitVec 32)) SeekEntryResult!12506)

(assert (=> b!1503980 (= res!1023869 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48415 a!2850) j!87) a!2850 mask!2661) (Found!12506 j!87)))))

(declare-fun b!1503977 () Bool)

(declare-fun res!1023870 () Bool)

(assert (=> b!1503977 (=> (not res!1023870) (not e!841313))))

(assert (=> b!1503977 (= res!1023870 (validKeyInArray!0 (select (arr!48415 a!2850) j!87)))))

(declare-fun res!1023868 () Bool)

(assert (=> start!128126 (=> (not res!1023868) (not e!841313))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128126 (= res!1023868 (validMask!0 mask!2661))))

(assert (=> start!128126 e!841313))

(assert (=> start!128126 true))

(declare-fun array_inv!37696 (array!100321) Bool)

(assert (=> start!128126 (array_inv!37696 a!2850)))

(declare-fun b!1503981 () Bool)

(declare-fun res!1023872 () Bool)

(assert (=> b!1503981 (=> (not res!1023872) (not e!841313))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100321 (_ BitVec 32)) Bool)

(assert (=> b!1503981 (= res!1023872 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503982 () Bool)

(declare-fun res!1023874 () Bool)

(assert (=> b!1503982 (=> (not res!1023874) (not e!841313))))

(assert (=> b!1503982 (= res!1023874 (and (= (size!48966 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48966 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48966 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!128126 res!1023868) b!1503982))

(assert (= (and b!1503982 res!1023874) b!1503975))

(assert (= (and b!1503975 res!1023875) b!1503977))

(assert (= (and b!1503977 res!1023870) b!1503981))

(assert (= (and b!1503981 res!1023872) b!1503979))

(assert (= (and b!1503979 res!1023873) b!1503978))

(assert (= (and b!1503978 res!1023871) b!1503980))

(assert (= (and b!1503980 res!1023869) b!1503976))

(declare-fun m!1387231 () Bool)

(assert (=> b!1503981 m!1387231))

(declare-fun m!1387233 () Bool)

(assert (=> b!1503977 m!1387233))

(assert (=> b!1503977 m!1387233))

(declare-fun m!1387235 () Bool)

(assert (=> b!1503977 m!1387235))

(declare-fun m!1387237 () Bool)

(assert (=> b!1503979 m!1387237))

(declare-fun m!1387239 () Bool)

(assert (=> b!1503976 m!1387239))

(assert (=> b!1503976 m!1387233))

(declare-fun m!1387241 () Bool)

(assert (=> b!1503978 m!1387241))

(declare-fun m!1387243 () Bool)

(assert (=> b!1503978 m!1387243))

(declare-fun m!1387245 () Bool)

(assert (=> b!1503978 m!1387245))

(declare-fun m!1387247 () Bool)

(assert (=> start!128126 m!1387247))

(declare-fun m!1387249 () Bool)

(assert (=> start!128126 m!1387249))

(declare-fun m!1387251 () Bool)

(assert (=> b!1503975 m!1387251))

(assert (=> b!1503975 m!1387251))

(declare-fun m!1387253 () Bool)

(assert (=> b!1503975 m!1387253))

(assert (=> b!1503980 m!1387233))

(assert (=> b!1503980 m!1387233))

(declare-fun m!1387255 () Bool)

(assert (=> b!1503980 m!1387255))

(check-sat (not start!128126) (not b!1503980) (not b!1503979) (not b!1503975) (not b!1503981) (not b!1503977))
(check-sat)
(get-model)

(declare-fun b!1504041 () Bool)

(declare-fun e!841336 () Bool)

(declare-fun e!841338 () Bool)

(assert (=> b!1504041 (= e!841336 e!841338)))

(declare-fun c!139600 () Bool)

(assert (=> b!1504041 (= c!139600 (validKeyInArray!0 (select (arr!48415 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1504043 () Bool)

(declare-fun call!68175 () Bool)

(assert (=> b!1504043 (= e!841338 call!68175)))

(declare-fun b!1504044 () Bool)

(assert (=> b!1504044 (= e!841338 call!68175)))

(declare-fun b!1504042 () Bool)

(declare-fun e!841337 () Bool)

(assert (=> b!1504042 (= e!841337 e!841336)))

(declare-fun res!1023932 () Bool)

(assert (=> b!1504042 (=> (not res!1023932) (not e!841336))))

(declare-fun e!841335 () Bool)

(assert (=> b!1504042 (= res!1023932 (not e!841335))))

(declare-fun res!1023930 () Bool)

(assert (=> b!1504042 (=> (not res!1023930) (not e!841335))))

(assert (=> b!1504042 (= res!1023930 (validKeyInArray!0 (select (arr!48415 a!2850) #b00000000000000000000000000000000)))))

(declare-fun d!158173 () Bool)

(declare-fun res!1023931 () Bool)

(assert (=> d!158173 (=> res!1023931 e!841337)))

(assert (=> d!158173 (= res!1023931 (bvsge #b00000000000000000000000000000000 (size!48966 a!2850)))))

(assert (=> d!158173 (= (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34891) e!841337)))

(declare-fun bm!68172 () Bool)

(assert (=> bm!68172 (= call!68175 (arrayNoDuplicates!0 a!2850 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139600 (Cons!34890 (select (arr!48415 a!2850) #b00000000000000000000000000000000) Nil!34891) Nil!34891)))))

(declare-fun b!1504045 () Bool)

(declare-fun contains!9989 (List!34894 (_ BitVec 64)) Bool)

(assert (=> b!1504045 (= e!841335 (contains!9989 Nil!34891 (select (arr!48415 a!2850) #b00000000000000000000000000000000)))))

(assert (= (and d!158173 (not res!1023931)) b!1504042))

(assert (= (and b!1504042 res!1023930) b!1504045))

(assert (= (and b!1504042 res!1023932) b!1504041))

(assert (= (and b!1504041 c!139600) b!1504044))

(assert (= (and b!1504041 (not c!139600)) b!1504043))

(assert (= (or b!1504044 b!1504043) bm!68172))

(declare-fun m!1387309 () Bool)

(assert (=> b!1504041 m!1387309))

(assert (=> b!1504041 m!1387309))

(declare-fun m!1387311 () Bool)

(assert (=> b!1504041 m!1387311))

(assert (=> b!1504042 m!1387309))

(assert (=> b!1504042 m!1387309))

(assert (=> b!1504042 m!1387311))

(assert (=> bm!68172 m!1387309))

(declare-fun m!1387313 () Bool)

(assert (=> bm!68172 m!1387313))

(assert (=> b!1504045 m!1387309))

(assert (=> b!1504045 m!1387309))

(declare-fun m!1387315 () Bool)

(assert (=> b!1504045 m!1387315))

(assert (=> b!1503979 d!158173))

(declare-fun b!1504058 () Bool)

(declare-fun e!841347 () SeekEntryResult!12506)

(declare-fun e!841346 () SeekEntryResult!12506)

(assert (=> b!1504058 (= e!841347 e!841346)))

(declare-fun c!139607 () Bool)

(declare-fun lt!653987 () (_ BitVec 64))

(assert (=> b!1504058 (= c!139607 (= lt!653987 (select (arr!48415 a!2850) j!87)))))

(declare-fun b!1504059 () Bool)

(declare-fun c!139609 () Bool)

(assert (=> b!1504059 (= c!139609 (= lt!653987 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!841345 () SeekEntryResult!12506)

(assert (=> b!1504059 (= e!841346 e!841345)))

(declare-fun b!1504061 () Bool)

(assert (=> b!1504061 (= e!841347 Undefined!12506)))

(declare-fun b!1504060 () Bool)

(assert (=> b!1504060 (= e!841346 (Found!12506 index!625))))

(declare-fun lt!653988 () SeekEntryResult!12506)

(declare-fun d!158175 () Bool)

(get-info :version)

(assert (=> d!158175 (and (or ((_ is Undefined!12506) lt!653988) (not ((_ is Found!12506) lt!653988)) (and (bvsge (index!52417 lt!653988) #b00000000000000000000000000000000) (bvslt (index!52417 lt!653988) (size!48966 a!2850)))) (or ((_ is Undefined!12506) lt!653988) ((_ is Found!12506) lt!653988) (not ((_ is MissingVacant!12506) lt!653988)) (not (= (index!52419 lt!653988) vacantBefore!10)) (and (bvsge (index!52419 lt!653988) #b00000000000000000000000000000000) (bvslt (index!52419 lt!653988) (size!48966 a!2850)))) (or ((_ is Undefined!12506) lt!653988) (ite ((_ is Found!12506) lt!653988) (= (select (arr!48415 a!2850) (index!52417 lt!653988)) (select (arr!48415 a!2850) j!87)) (and ((_ is MissingVacant!12506) lt!653988) (= (index!52419 lt!653988) vacantBefore!10) (= (select (arr!48415 a!2850) (index!52419 lt!653988)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!158175 (= lt!653988 e!841347)))

(declare-fun c!139608 () Bool)

(assert (=> d!158175 (= c!139608 (bvsge x!647 #b01111111111111111111111111111110))))

(assert (=> d!158175 (= lt!653987 (select (arr!48415 a!2850) index!625))))

(assert (=> d!158175 (validMask!0 mask!2661)))

(assert (=> d!158175 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48415 a!2850) j!87) a!2850 mask!2661) lt!653988)))

(declare-fun b!1504062 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1504062 (= e!841345 (seekKeyOrZeroReturnVacant!0 (bvadd x!647 #b00000000000000000000000000000001) (nextIndex!0 index!625 (bvadd x!647 #b00000000000000000000000000000001) mask!2661) vacantBefore!10 (select (arr!48415 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1504063 () Bool)

(assert (=> b!1504063 (= e!841345 (MissingVacant!12506 vacantBefore!10))))

(assert (= (and d!158175 c!139608) b!1504061))

(assert (= (and d!158175 (not c!139608)) b!1504058))

(assert (= (and b!1504058 c!139607) b!1504060))

(assert (= (and b!1504058 (not c!139607)) b!1504059))

(assert (= (and b!1504059 c!139609) b!1504063))

(assert (= (and b!1504059 (not c!139609)) b!1504062))

(declare-fun m!1387317 () Bool)

(assert (=> d!158175 m!1387317))

(declare-fun m!1387319 () Bool)

(assert (=> d!158175 m!1387319))

(assert (=> d!158175 m!1387239))

(assert (=> d!158175 m!1387247))

(declare-fun m!1387321 () Bool)

(assert (=> b!1504062 m!1387321))

(assert (=> b!1504062 m!1387321))

(assert (=> b!1504062 m!1387233))

(declare-fun m!1387323 () Bool)

(assert (=> b!1504062 m!1387323))

(assert (=> b!1503980 d!158175))

(declare-fun d!158181 () Bool)

(assert (=> d!158181 (= (validKeyInArray!0 (select (arr!48415 a!2850) i!996)) (and (not (= (select (arr!48415 a!2850) i!996) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48415 a!2850) i!996) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1503975 d!158181))

(declare-fun d!158183 () Bool)

(declare-fun res!1023948 () Bool)

(declare-fun e!841371 () Bool)

(assert (=> d!158183 (=> res!1023948 e!841371)))

(assert (=> d!158183 (= res!1023948 (bvsge #b00000000000000000000000000000000 (size!48966 a!2850)))))

(assert (=> d!158183 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661) e!841371)))

(declare-fun b!1504092 () Bool)

(declare-fun e!841370 () Bool)

(assert (=> b!1504092 (= e!841371 e!841370)))

(declare-fun c!139617 () Bool)

(assert (=> b!1504092 (= c!139617 (validKeyInArray!0 (select (arr!48415 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1504093 () Bool)

(declare-fun e!841369 () Bool)

(assert (=> b!1504093 (= e!841370 e!841369)))

(declare-fun lt!654010 () (_ BitVec 64))

(assert (=> b!1504093 (= lt!654010 (select (arr!48415 a!2850) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50185 0))(
  ( (Unit!50186) )
))
(declare-fun lt!654012 () Unit!50185)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100321 (_ BitVec 64) (_ BitVec 32)) Unit!50185)

(assert (=> b!1504093 (= lt!654012 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2850 lt!654010 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100321 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1504093 (arrayContainsKey!0 a!2850 lt!654010 #b00000000000000000000000000000000)))

(declare-fun lt!654011 () Unit!50185)

(assert (=> b!1504093 (= lt!654011 lt!654012)))

(declare-fun res!1023947 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100321 (_ BitVec 32)) SeekEntryResult!12506)

(assert (=> b!1504093 (= res!1023947 (= (seekEntryOrOpen!0 (select (arr!48415 a!2850) #b00000000000000000000000000000000) a!2850 mask!2661) (Found!12506 #b00000000000000000000000000000000)))))

(assert (=> b!1504093 (=> (not res!1023947) (not e!841369))))

(declare-fun bm!68180 () Bool)

(declare-fun call!68183 () Bool)

(assert (=> bm!68180 (= call!68183 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2850 mask!2661))))

(declare-fun b!1504094 () Bool)

(assert (=> b!1504094 (= e!841370 call!68183)))

(declare-fun b!1504095 () Bool)

(assert (=> b!1504095 (= e!841369 call!68183)))

(assert (= (and d!158183 (not res!1023948)) b!1504092))

(assert (= (and b!1504092 c!139617) b!1504093))

(assert (= (and b!1504092 (not c!139617)) b!1504094))

(assert (= (and b!1504093 res!1023947) b!1504095))

(assert (= (or b!1504095 b!1504094) bm!68180))

(assert (=> b!1504092 m!1387309))

(assert (=> b!1504092 m!1387309))

(assert (=> b!1504092 m!1387311))

(assert (=> b!1504093 m!1387309))

(declare-fun m!1387337 () Bool)

(assert (=> b!1504093 m!1387337))

(declare-fun m!1387339 () Bool)

(assert (=> b!1504093 m!1387339))

(assert (=> b!1504093 m!1387309))

(declare-fun m!1387341 () Bool)

(assert (=> b!1504093 m!1387341))

(declare-fun m!1387343 () Bool)

(assert (=> bm!68180 m!1387343))

(assert (=> b!1503981 d!158183))

(declare-fun d!158193 () Bool)

(assert (=> d!158193 (= (validMask!0 mask!2661) (and (or (= mask!2661 #b00000000000000000000000000000111) (= mask!2661 #b00000000000000000000000000001111) (= mask!2661 #b00000000000000000000000000011111) (= mask!2661 #b00000000000000000000000000111111) (= mask!2661 #b00000000000000000000000001111111) (= mask!2661 #b00000000000000000000000011111111) (= mask!2661 #b00000000000000000000000111111111) (= mask!2661 #b00000000000000000000001111111111) (= mask!2661 #b00000000000000000000011111111111) (= mask!2661 #b00000000000000000000111111111111) (= mask!2661 #b00000000000000000001111111111111) (= mask!2661 #b00000000000000000011111111111111) (= mask!2661 #b00000000000000000111111111111111) (= mask!2661 #b00000000000000001111111111111111) (= mask!2661 #b00000000000000011111111111111111) (= mask!2661 #b00000000000000111111111111111111) (= mask!2661 #b00000000000001111111111111111111) (= mask!2661 #b00000000000011111111111111111111) (= mask!2661 #b00000000000111111111111111111111) (= mask!2661 #b00000000001111111111111111111111) (= mask!2661 #b00000000011111111111111111111111) (= mask!2661 #b00000000111111111111111111111111) (= mask!2661 #b00000001111111111111111111111111) (= mask!2661 #b00000011111111111111111111111111) (= mask!2661 #b00000111111111111111111111111111) (= mask!2661 #b00001111111111111111111111111111) (= mask!2661 #b00011111111111111111111111111111) (= mask!2661 #b00111111111111111111111111111111)) (bvsle mask!2661 #b00111111111111111111111111111111)))))

(assert (=> start!128126 d!158193))

(declare-fun d!158197 () Bool)

(assert (=> d!158197 (= (array_inv!37696 a!2850) (bvsge (size!48966 a!2850) #b00000000000000000000000000000000))))

(assert (=> start!128126 d!158197))

(declare-fun d!158199 () Bool)

(assert (=> d!158199 (= (validKeyInArray!0 (select (arr!48415 a!2850) j!87)) (and (not (= (select (arr!48415 a!2850) j!87) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48415 a!2850) j!87) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1503977 d!158199))

(check-sat (not b!1504041) (not b!1504042) (not b!1504093) (not b!1504062) (not bm!68172) (not bm!68180) (not b!1504045) (not d!158175) (not b!1504092))
(check-sat)
