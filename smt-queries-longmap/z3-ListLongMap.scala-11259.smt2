; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131720 () Bool)

(assert start!131720)

(declare-fun b!1542203 () Bool)

(declare-fun res!1057428 () Bool)

(declare-fun e!857924 () Bool)

(assert (=> b!1542203 (=> (not res!1057428) (not e!857924))))

(declare-datatypes ((array!102414 0))(
  ( (array!102415 (arr!49411 (Array (_ BitVec 32) (_ BitVec 64))) (size!49962 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102414)

(declare-datatypes ((List!35872 0))(
  ( (Nil!35869) (Cons!35868 (h!37331 (_ BitVec 64)) (t!50558 List!35872)) )
))
(declare-fun arrayNoDuplicates!0 (array!102414 (_ BitVec 32) List!35872) Bool)

(assert (=> b!1542203 (= res!1057428 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35869))))

(declare-fun res!1057434 () Bool)

(assert (=> start!131720 (=> (not res!1057434) (not e!857924))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131720 (= res!1057434 (validMask!0 mask!2480))))

(assert (=> start!131720 e!857924))

(assert (=> start!131720 true))

(declare-fun array_inv!38692 (array!102414) Bool)

(assert (=> start!131720 (array_inv!38692 a!2792)))

(declare-fun b!1542204 () Bool)

(declare-fun res!1057426 () Bool)

(assert (=> b!1542204 (=> (not res!1057426) (not e!857924))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1542204 (= res!1057426 (validKeyInArray!0 (select (arr!49411 a!2792) j!64)))))

(declare-fun b!1542205 () Bool)

(declare-fun res!1057433 () Bool)

(assert (=> b!1542205 (=> (not res!1057433) (not e!857924))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1542205 (= res!1057433 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49962 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49962 a!2792)) (= (select (arr!49411 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1542206 () Bool)

(declare-fun res!1057430 () Bool)

(declare-fun e!857926 () Bool)

(assert (=> b!1542206 (=> (not res!1057430) (not e!857926))))

(assert (=> b!1542206 (= res!1057430 (not (= (select (arr!49411 a!2792) index!463) (select (arr!49411 a!2792) j!64))))))

(declare-fun b!1542207 () Bool)

(declare-fun res!1057427 () Bool)

(assert (=> b!1542207 (=> (not res!1057427) (not e!857924))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1542207 (= res!1057427 (and (= (size!49962 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49962 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49962 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1542208 () Bool)

(declare-fun res!1057425 () Bool)

(assert (=> b!1542208 (=> (not res!1057425) (not e!857924))))

(assert (=> b!1542208 (= res!1057425 (validKeyInArray!0 (select (arr!49411 a!2792) i!951)))))

(declare-fun b!1542209 () Bool)

(declare-fun res!1057431 () Bool)

(assert (=> b!1542209 (=> (not res!1057431) (not e!857924))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102414 (_ BitVec 32)) Bool)

(assert (=> b!1542209 (= res!1057431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-datatypes ((SeekEntryResult!13432 0))(
  ( (MissingZero!13432 (index!56123 (_ BitVec 32))) (Found!13432 (index!56124 (_ BitVec 32))) (Intermediate!13432 (undefined!14244 Bool) (index!56125 (_ BitVec 32)) (x!138066 (_ BitVec 32))) (Undefined!13432) (MissingVacant!13432 (index!56126 (_ BitVec 32))) )
))
(declare-fun lt!666036 () SeekEntryResult!13432)

(declare-fun lt!666035 () (_ BitVec 32))

(declare-fun b!1542210 () Bool)

(declare-fun e!857925 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102414 (_ BitVec 32)) SeekEntryResult!13432)

(assert (=> b!1542210 (= e!857925 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!666035 vacantIndex!5 (select (arr!49411 a!2792) j!64) a!2792 mask!2480) lt!666036)))))

(declare-fun b!1542211 () Bool)

(assert (=> b!1542211 (= e!857926 e!857925)))

(declare-fun res!1057429 () Bool)

(assert (=> b!1542211 (=> (not res!1057429) (not e!857925))))

(assert (=> b!1542211 (= res!1057429 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!666035 #b00000000000000000000000000000000) (bvslt lt!666035 (size!49962 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1542211 (= lt!666035 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1542212 () Bool)

(assert (=> b!1542212 (= e!857924 e!857926)))

(declare-fun res!1057432 () Bool)

(assert (=> b!1542212 (=> (not res!1057432) (not e!857926))))

(assert (=> b!1542212 (= res!1057432 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49411 a!2792) j!64) a!2792 mask!2480) lt!666036))))

(assert (=> b!1542212 (= lt!666036 (Found!13432 j!64))))

(assert (= (and start!131720 res!1057434) b!1542207))

(assert (= (and b!1542207 res!1057427) b!1542208))

(assert (= (and b!1542208 res!1057425) b!1542204))

(assert (= (and b!1542204 res!1057426) b!1542209))

(assert (= (and b!1542209 res!1057431) b!1542203))

(assert (= (and b!1542203 res!1057428) b!1542205))

(assert (= (and b!1542205 res!1057433) b!1542212))

(assert (= (and b!1542212 res!1057432) b!1542206))

(assert (= (and b!1542206 res!1057430) b!1542211))

(assert (= (and b!1542211 res!1057429) b!1542210))

(declare-fun m!1424201 () Bool)

(assert (=> b!1542212 m!1424201))

(assert (=> b!1542212 m!1424201))

(declare-fun m!1424203 () Bool)

(assert (=> b!1542212 m!1424203))

(declare-fun m!1424205 () Bool)

(assert (=> b!1542203 m!1424205))

(assert (=> b!1542210 m!1424201))

(assert (=> b!1542210 m!1424201))

(declare-fun m!1424207 () Bool)

(assert (=> b!1542210 m!1424207))

(declare-fun m!1424209 () Bool)

(assert (=> b!1542211 m!1424209))

(declare-fun m!1424211 () Bool)

(assert (=> b!1542208 m!1424211))

(assert (=> b!1542208 m!1424211))

(declare-fun m!1424213 () Bool)

(assert (=> b!1542208 m!1424213))

(assert (=> b!1542204 m!1424201))

(assert (=> b!1542204 m!1424201))

(declare-fun m!1424215 () Bool)

(assert (=> b!1542204 m!1424215))

(declare-fun m!1424217 () Bool)

(assert (=> start!131720 m!1424217))

(declare-fun m!1424219 () Bool)

(assert (=> start!131720 m!1424219))

(declare-fun m!1424221 () Bool)

(assert (=> b!1542206 m!1424221))

(assert (=> b!1542206 m!1424201))

(declare-fun m!1424223 () Bool)

(assert (=> b!1542205 m!1424223))

(declare-fun m!1424225 () Bool)

(assert (=> b!1542209 m!1424225))

(check-sat (not b!1542212) (not start!131720) (not b!1542211) (not b!1542209) (not b!1542204) (not b!1542203) (not b!1542208) (not b!1542210))
(check-sat)
(get-model)

(declare-fun b!1542285 () Bool)

(declare-fun c!141965 () Bool)

(declare-fun lt!666054 () (_ BitVec 64))

(assert (=> b!1542285 (= c!141965 (= lt!666054 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!857959 () SeekEntryResult!13432)

(declare-fun e!857958 () SeekEntryResult!13432)

(assert (=> b!1542285 (= e!857959 e!857958)))

(declare-fun b!1542287 () Bool)

(assert (=> b!1542287 (= e!857959 (Found!13432 index!463))))

(declare-fun b!1542288 () Bool)

(declare-fun e!857957 () SeekEntryResult!13432)

(assert (=> b!1542288 (= e!857957 Undefined!13432)))

(declare-fun b!1542289 () Bool)

(assert (=> b!1542289 (= e!857957 e!857959)))

(declare-fun c!141967 () Bool)

(assert (=> b!1542289 (= c!141967 (= lt!666054 (select (arr!49411 a!2792) j!64)))))

(declare-fun b!1542290 () Bool)

(assert (=> b!1542290 (= e!857958 (seekKeyOrZeroReturnVacant!0 (bvadd x!510 #b00000000000000000000000000000001) (nextIndex!0 index!463 (bvadd x!510 #b00000000000000000000000000000001) mask!2480) vacantIndex!5 (select (arr!49411 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1542286 () Bool)

(assert (=> b!1542286 (= e!857958 (MissingVacant!13432 vacantIndex!5))))

(declare-fun d!161179 () Bool)

(declare-fun lt!666053 () SeekEntryResult!13432)

(get-info :version)

(assert (=> d!161179 (and (or ((_ is Undefined!13432) lt!666053) (not ((_ is Found!13432) lt!666053)) (and (bvsge (index!56124 lt!666053) #b00000000000000000000000000000000) (bvslt (index!56124 lt!666053) (size!49962 a!2792)))) (or ((_ is Undefined!13432) lt!666053) ((_ is Found!13432) lt!666053) (not ((_ is MissingVacant!13432) lt!666053)) (not (= (index!56126 lt!666053) vacantIndex!5)) (and (bvsge (index!56126 lt!666053) #b00000000000000000000000000000000) (bvslt (index!56126 lt!666053) (size!49962 a!2792)))) (or ((_ is Undefined!13432) lt!666053) (ite ((_ is Found!13432) lt!666053) (= (select (arr!49411 a!2792) (index!56124 lt!666053)) (select (arr!49411 a!2792) j!64)) (and ((_ is MissingVacant!13432) lt!666053) (= (index!56126 lt!666053) vacantIndex!5) (= (select (arr!49411 a!2792) (index!56126 lt!666053)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!161179 (= lt!666053 e!857957)))

(declare-fun c!141966 () Bool)

(assert (=> d!161179 (= c!141966 (bvsge x!510 #b01111111111111111111111111111110))))

(assert (=> d!161179 (= lt!666054 (select (arr!49411 a!2792) index!463))))

(assert (=> d!161179 (validMask!0 mask!2480)))

(assert (=> d!161179 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49411 a!2792) j!64) a!2792 mask!2480) lt!666053)))

(assert (= (and d!161179 c!141966) b!1542288))

(assert (= (and d!161179 (not c!141966)) b!1542289))

(assert (= (and b!1542289 c!141967) b!1542287))

(assert (= (and b!1542289 (not c!141967)) b!1542285))

(assert (= (and b!1542285 c!141965) b!1542286))

(assert (= (and b!1542285 (not c!141965)) b!1542290))

(declare-fun m!1424279 () Bool)

(assert (=> b!1542290 m!1424279))

(assert (=> b!1542290 m!1424279))

(assert (=> b!1542290 m!1424201))

(declare-fun m!1424281 () Bool)

(assert (=> b!1542290 m!1424281))

(declare-fun m!1424283 () Bool)

(assert (=> d!161179 m!1424283))

(declare-fun m!1424285 () Bool)

(assert (=> d!161179 m!1424285))

(assert (=> d!161179 m!1424221))

(assert (=> d!161179 m!1424217))

(assert (=> b!1542212 d!161179))

(declare-fun d!161181 () Bool)

(declare-fun lt!666057 () (_ BitVec 32))

(assert (=> d!161181 (and (bvsge lt!666057 #b00000000000000000000000000000000) (bvslt lt!666057 (bvadd mask!2480 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!161181 (= lt!666057 (choose!52 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(assert (=> d!161181 (validMask!0 mask!2480)))

(assert (=> d!161181 (= (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480) lt!666057)))

(declare-fun bs!44224 () Bool)

(assert (= bs!44224 d!161181))

(declare-fun m!1424287 () Bool)

(assert (=> bs!44224 m!1424287))

(assert (=> bs!44224 m!1424217))

(assert (=> b!1542211 d!161181))

(declare-fun d!161183 () Bool)

(assert (=> d!161183 (= (validKeyInArray!0 (select (arr!49411 a!2792) j!64)) (and (not (= (select (arr!49411 a!2792) j!64) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49411 a!2792) j!64) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1542204 d!161183))

(declare-fun b!1542291 () Bool)

(declare-fun c!141968 () Bool)

(declare-fun lt!666059 () (_ BitVec 64))

(assert (=> b!1542291 (= c!141968 (= lt!666059 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!857962 () SeekEntryResult!13432)

(declare-fun e!857961 () SeekEntryResult!13432)

(assert (=> b!1542291 (= e!857962 e!857961)))

(declare-fun b!1542293 () Bool)

(assert (=> b!1542293 (= e!857962 (Found!13432 lt!666035))))

(declare-fun b!1542294 () Bool)

(declare-fun e!857960 () SeekEntryResult!13432)

(assert (=> b!1542294 (= e!857960 Undefined!13432)))

(declare-fun b!1542295 () Bool)

(assert (=> b!1542295 (= e!857960 e!857962)))

(declare-fun c!141970 () Bool)

(assert (=> b!1542295 (= c!141970 (= lt!666059 (select (arr!49411 a!2792) j!64)))))

(declare-fun b!1542296 () Bool)

(assert (=> b!1542296 (= e!857961 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510 #b00000000000000000000000000000001) (nextIndex!0 lt!666035 (bvadd #b00000000000000000000000000000001 x!510 #b00000000000000000000000000000001) mask!2480) vacantIndex!5 (select (arr!49411 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1542292 () Bool)

(assert (=> b!1542292 (= e!857961 (MissingVacant!13432 vacantIndex!5))))

(declare-fun lt!666058 () SeekEntryResult!13432)

(declare-fun d!161185 () Bool)

(assert (=> d!161185 (and (or ((_ is Undefined!13432) lt!666058) (not ((_ is Found!13432) lt!666058)) (and (bvsge (index!56124 lt!666058) #b00000000000000000000000000000000) (bvslt (index!56124 lt!666058) (size!49962 a!2792)))) (or ((_ is Undefined!13432) lt!666058) ((_ is Found!13432) lt!666058) (not ((_ is MissingVacant!13432) lt!666058)) (not (= (index!56126 lt!666058) vacantIndex!5)) (and (bvsge (index!56126 lt!666058) #b00000000000000000000000000000000) (bvslt (index!56126 lt!666058) (size!49962 a!2792)))) (or ((_ is Undefined!13432) lt!666058) (ite ((_ is Found!13432) lt!666058) (= (select (arr!49411 a!2792) (index!56124 lt!666058)) (select (arr!49411 a!2792) j!64)) (and ((_ is MissingVacant!13432) lt!666058) (= (index!56126 lt!666058) vacantIndex!5) (= (select (arr!49411 a!2792) (index!56126 lt!666058)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!161185 (= lt!666058 e!857960)))

(declare-fun c!141969 () Bool)

(assert (=> d!161185 (= c!141969 (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110))))

(assert (=> d!161185 (= lt!666059 (select (arr!49411 a!2792) lt!666035))))

(assert (=> d!161185 (validMask!0 mask!2480)))

(assert (=> d!161185 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!666035 vacantIndex!5 (select (arr!49411 a!2792) j!64) a!2792 mask!2480) lt!666058)))

(assert (= (and d!161185 c!141969) b!1542294))

(assert (= (and d!161185 (not c!141969)) b!1542295))

(assert (= (and b!1542295 c!141970) b!1542293))

(assert (= (and b!1542295 (not c!141970)) b!1542291))

(assert (= (and b!1542291 c!141968) b!1542292))

(assert (= (and b!1542291 (not c!141968)) b!1542296))

(declare-fun m!1424289 () Bool)

(assert (=> b!1542296 m!1424289))

(assert (=> b!1542296 m!1424289))

(assert (=> b!1542296 m!1424201))

(declare-fun m!1424291 () Bool)

(assert (=> b!1542296 m!1424291))

(declare-fun m!1424293 () Bool)

(assert (=> d!161185 m!1424293))

(declare-fun m!1424295 () Bool)

(assert (=> d!161185 m!1424295))

(declare-fun m!1424297 () Bool)

(assert (=> d!161185 m!1424297))

(assert (=> d!161185 m!1424217))

(assert (=> b!1542210 d!161185))

(declare-fun b!1542307 () Bool)

(declare-fun e!857974 () Bool)

(declare-fun e!857972 () Bool)

(assert (=> b!1542307 (= e!857974 e!857972)))

(declare-fun c!141973 () Bool)

(assert (=> b!1542307 (= c!141973 (validKeyInArray!0 (select (arr!49411 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1542308 () Bool)

(declare-fun call!68787 () Bool)

(assert (=> b!1542308 (= e!857972 call!68787)))

(declare-fun b!1542309 () Bool)

(declare-fun e!857973 () Bool)

(declare-fun contains!10066 (List!35872 (_ BitVec 64)) Bool)

(assert (=> b!1542309 (= e!857973 (contains!10066 Nil!35869 (select (arr!49411 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1542310 () Bool)

(assert (=> b!1542310 (= e!857972 call!68787)))

(declare-fun b!1542311 () Bool)

(declare-fun e!857971 () Bool)

(assert (=> b!1542311 (= e!857971 e!857974)))

(declare-fun res!1057501 () Bool)

(assert (=> b!1542311 (=> (not res!1057501) (not e!857974))))

(assert (=> b!1542311 (= res!1057501 (not e!857973))))

(declare-fun res!1057503 () Bool)

(assert (=> b!1542311 (=> (not res!1057503) (not e!857973))))

(assert (=> b!1542311 (= res!1057503 (validKeyInArray!0 (select (arr!49411 a!2792) #b00000000000000000000000000000000)))))

(declare-fun d!161187 () Bool)

(declare-fun res!1057502 () Bool)

(assert (=> d!161187 (=> res!1057502 e!857971)))

(assert (=> d!161187 (= res!1057502 (bvsge #b00000000000000000000000000000000 (size!49962 a!2792)))))

(assert (=> d!161187 (= (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35869) e!857971)))

(declare-fun bm!68784 () Bool)

(assert (=> bm!68784 (= call!68787 (arrayNoDuplicates!0 a!2792 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!141973 (Cons!35868 (select (arr!49411 a!2792) #b00000000000000000000000000000000) Nil!35869) Nil!35869)))))

(assert (= (and d!161187 (not res!1057502)) b!1542311))

(assert (= (and b!1542311 res!1057503) b!1542309))

(assert (= (and b!1542311 res!1057501) b!1542307))

(assert (= (and b!1542307 c!141973) b!1542310))

(assert (= (and b!1542307 (not c!141973)) b!1542308))

(assert (= (or b!1542310 b!1542308) bm!68784))

(declare-fun m!1424299 () Bool)

(assert (=> b!1542307 m!1424299))

(assert (=> b!1542307 m!1424299))

(declare-fun m!1424301 () Bool)

(assert (=> b!1542307 m!1424301))

(assert (=> b!1542309 m!1424299))

(assert (=> b!1542309 m!1424299))

(declare-fun m!1424303 () Bool)

(assert (=> b!1542309 m!1424303))

(assert (=> b!1542311 m!1424299))

(assert (=> b!1542311 m!1424299))

(assert (=> b!1542311 m!1424301))

(assert (=> bm!68784 m!1424299))

(declare-fun m!1424305 () Bool)

(assert (=> bm!68784 m!1424305))

(assert (=> b!1542203 d!161187))

(declare-fun d!161191 () Bool)

(assert (=> d!161191 (= (validKeyInArray!0 (select (arr!49411 a!2792) i!951)) (and (not (= (select (arr!49411 a!2792) i!951) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49411 a!2792) i!951) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1542208 d!161191))

(declare-fun b!1542320 () Bool)

(declare-fun e!857982 () Bool)

(declare-fun e!857983 () Bool)

(assert (=> b!1542320 (= e!857982 e!857983)))

(declare-fun c!141976 () Bool)

(assert (=> b!1542320 (= c!141976 (validKeyInArray!0 (select (arr!49411 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1542321 () Bool)

(declare-fun e!857981 () Bool)

(assert (=> b!1542321 (= e!857983 e!857981)))

(declare-fun lt!666068 () (_ BitVec 64))

(assert (=> b!1542321 (= lt!666068 (select (arr!49411 a!2792) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51345 0))(
  ( (Unit!51346) )
))
(declare-fun lt!666066 () Unit!51345)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!102414 (_ BitVec 64) (_ BitVec 32)) Unit!51345)

(assert (=> b!1542321 (= lt!666066 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2792 lt!666068 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!102414 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1542321 (arrayContainsKey!0 a!2792 lt!666068 #b00000000000000000000000000000000)))

(declare-fun lt!666067 () Unit!51345)

(assert (=> b!1542321 (= lt!666067 lt!666066)))

(declare-fun res!1057508 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!102414 (_ BitVec 32)) SeekEntryResult!13432)

(assert (=> b!1542321 (= res!1057508 (= (seekEntryOrOpen!0 (select (arr!49411 a!2792) #b00000000000000000000000000000000) a!2792 mask!2480) (Found!13432 #b00000000000000000000000000000000)))))

(assert (=> b!1542321 (=> (not res!1057508) (not e!857981))))

(declare-fun bm!68787 () Bool)

(declare-fun call!68790 () Bool)

(assert (=> bm!68787 (= call!68790 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2792 mask!2480))))

(declare-fun b!1542323 () Bool)

(assert (=> b!1542323 (= e!857983 call!68790)))

(declare-fun d!161193 () Bool)

(declare-fun res!1057509 () Bool)

(assert (=> d!161193 (=> res!1057509 e!857982)))

(assert (=> d!161193 (= res!1057509 (bvsge #b00000000000000000000000000000000 (size!49962 a!2792)))))

(assert (=> d!161193 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480) e!857982)))

(declare-fun b!1542322 () Bool)

(assert (=> b!1542322 (= e!857981 call!68790)))

(assert (= (and d!161193 (not res!1057509)) b!1542320))

(assert (= (and b!1542320 c!141976) b!1542321))

(assert (= (and b!1542320 (not c!141976)) b!1542323))

(assert (= (and b!1542321 res!1057508) b!1542322))

(assert (= (or b!1542322 b!1542323) bm!68787))

(assert (=> b!1542320 m!1424299))

(assert (=> b!1542320 m!1424299))

(assert (=> b!1542320 m!1424301))

(assert (=> b!1542321 m!1424299))

(declare-fun m!1424307 () Bool)

(assert (=> b!1542321 m!1424307))

(declare-fun m!1424309 () Bool)

(assert (=> b!1542321 m!1424309))

(assert (=> b!1542321 m!1424299))

(declare-fun m!1424311 () Bool)

(assert (=> b!1542321 m!1424311))

(declare-fun m!1424313 () Bool)

(assert (=> bm!68787 m!1424313))

(assert (=> b!1542209 d!161193))

(declare-fun d!161197 () Bool)

(assert (=> d!161197 (= (validMask!0 mask!2480) (and (or (= mask!2480 #b00000000000000000000000000000111) (= mask!2480 #b00000000000000000000000000001111) (= mask!2480 #b00000000000000000000000000011111) (= mask!2480 #b00000000000000000000000000111111) (= mask!2480 #b00000000000000000000000001111111) (= mask!2480 #b00000000000000000000000011111111) (= mask!2480 #b00000000000000000000000111111111) (= mask!2480 #b00000000000000000000001111111111) (= mask!2480 #b00000000000000000000011111111111) (= mask!2480 #b00000000000000000000111111111111) (= mask!2480 #b00000000000000000001111111111111) (= mask!2480 #b00000000000000000011111111111111) (= mask!2480 #b00000000000000000111111111111111) (= mask!2480 #b00000000000000001111111111111111) (= mask!2480 #b00000000000000011111111111111111) (= mask!2480 #b00000000000000111111111111111111) (= mask!2480 #b00000000000001111111111111111111) (= mask!2480 #b00000000000011111111111111111111) (= mask!2480 #b00000000000111111111111111111111) (= mask!2480 #b00000000001111111111111111111111) (= mask!2480 #b00000000011111111111111111111111) (= mask!2480 #b00000000111111111111111111111111) (= mask!2480 #b00000001111111111111111111111111) (= mask!2480 #b00000011111111111111111111111111) (= mask!2480 #b00000111111111111111111111111111) (= mask!2480 #b00001111111111111111111111111111) (= mask!2480 #b00011111111111111111111111111111) (= mask!2480 #b00111111111111111111111111111111)) (bvsle mask!2480 #b00111111111111111111111111111111)))))

(assert (=> start!131720 d!161197))

(declare-fun d!161205 () Bool)

(assert (=> d!161205 (= (array_inv!38692 a!2792) (bvsge (size!49962 a!2792) #b00000000000000000000000000000000))))

(assert (=> start!131720 d!161205))

(check-sat (not d!161185) (not bm!68787) (not bm!68784) (not b!1542296) (not b!1542320) (not b!1542309) (not d!161181) (not b!1542290) (not b!1542307) (not b!1542311) (not b!1542321) (not d!161179))
(check-sat)
