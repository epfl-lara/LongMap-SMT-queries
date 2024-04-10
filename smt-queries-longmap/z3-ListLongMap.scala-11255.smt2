; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131200 () Bool)

(assert start!131200)

(declare-fun b!1539198 () Bool)

(declare-fun e!856164 () Bool)

(declare-fun x!510 () (_ BitVec 32))

(assert (=> b!1539198 (= e!856164 (or (bvslt (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110)))))

(declare-fun lt!664984 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1539198 (= lt!664984 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun res!1056179 () Bool)

(assert (=> start!131200 (=> (not res!1056179) (not e!856164))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131200 (= res!1056179 (validMask!0 mask!2480))))

(assert (=> start!131200 e!856164))

(assert (=> start!131200 true))

(declare-datatypes ((array!102265 0))(
  ( (array!102266 (arr!49347 (Array (_ BitVec 32) (_ BitVec 64))) (size!49897 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102265)

(declare-fun array_inv!38375 (array!102265) Bool)

(assert (=> start!131200 (array_inv!38375 a!2792)))

(declare-fun b!1539199 () Bool)

(declare-fun res!1056180 () Bool)

(assert (=> b!1539199 (=> (not res!1056180) (not e!856164))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102265 (_ BitVec 32)) Bool)

(assert (=> b!1539199 (= res!1056180 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1539200 () Bool)

(declare-fun res!1056178 () Bool)

(assert (=> b!1539200 (=> (not res!1056178) (not e!856164))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1539200 (= res!1056178 (not (= (select (arr!49347 a!2792) index!463) (select (arr!49347 a!2792) j!64))))))

(declare-fun b!1539201 () Bool)

(declare-fun res!1056177 () Bool)

(assert (=> b!1539201 (=> (not res!1056177) (not e!856164))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13473 0))(
  ( (MissingZero!13473 (index!56287 (_ BitVec 32))) (Found!13473 (index!56288 (_ BitVec 32))) (Intermediate!13473 (undefined!14285 Bool) (index!56289 (_ BitVec 32)) (x!138014 (_ BitVec 32))) (Undefined!13473) (MissingVacant!13473 (index!56290 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102265 (_ BitVec 32)) SeekEntryResult!13473)

(assert (=> b!1539201 (= res!1056177 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49347 a!2792) j!64) a!2792 mask!2480) (Found!13473 j!64)))))

(declare-fun b!1539202 () Bool)

(declare-fun res!1056176 () Bool)

(assert (=> b!1539202 (=> (not res!1056176) (not e!856164))))

(declare-datatypes ((List!35821 0))(
  ( (Nil!35818) (Cons!35817 (h!37262 (_ BitVec 64)) (t!50515 List!35821)) )
))
(declare-fun arrayNoDuplicates!0 (array!102265 (_ BitVec 32) List!35821) Bool)

(assert (=> b!1539202 (= res!1056176 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35818))))

(declare-fun b!1539203 () Bool)

(declare-fun res!1056182 () Bool)

(assert (=> b!1539203 (=> (not res!1056182) (not e!856164))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1539203 (= res!1056182 (and (= (size!49897 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49897 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49897 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1539204 () Bool)

(declare-fun res!1056184 () Bool)

(assert (=> b!1539204 (=> (not res!1056184) (not e!856164))))

(assert (=> b!1539204 (= res!1056184 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49897 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49897 a!2792)) (= (select (arr!49347 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1539205 () Bool)

(declare-fun res!1056183 () Bool)

(assert (=> b!1539205 (=> (not res!1056183) (not e!856164))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1539205 (= res!1056183 (validKeyInArray!0 (select (arr!49347 a!2792) j!64)))))

(declare-fun b!1539206 () Bool)

(declare-fun res!1056181 () Bool)

(assert (=> b!1539206 (=> (not res!1056181) (not e!856164))))

(assert (=> b!1539206 (= res!1056181 (validKeyInArray!0 (select (arr!49347 a!2792) i!951)))))

(assert (= (and start!131200 res!1056179) b!1539203))

(assert (= (and b!1539203 res!1056182) b!1539206))

(assert (= (and b!1539206 res!1056181) b!1539205))

(assert (= (and b!1539205 res!1056183) b!1539199))

(assert (= (and b!1539199 res!1056180) b!1539202))

(assert (= (and b!1539202 res!1056176) b!1539204))

(assert (= (and b!1539204 res!1056184) b!1539201))

(assert (= (and b!1539201 res!1056177) b!1539200))

(assert (= (and b!1539200 res!1056178) b!1539198))

(declare-fun m!1421547 () Bool)

(assert (=> start!131200 m!1421547))

(declare-fun m!1421549 () Bool)

(assert (=> start!131200 m!1421549))

(declare-fun m!1421551 () Bool)

(assert (=> b!1539200 m!1421551))

(declare-fun m!1421553 () Bool)

(assert (=> b!1539200 m!1421553))

(assert (=> b!1539205 m!1421553))

(assert (=> b!1539205 m!1421553))

(declare-fun m!1421555 () Bool)

(assert (=> b!1539205 m!1421555))

(declare-fun m!1421557 () Bool)

(assert (=> b!1539199 m!1421557))

(declare-fun m!1421559 () Bool)

(assert (=> b!1539198 m!1421559))

(assert (=> b!1539201 m!1421553))

(assert (=> b!1539201 m!1421553))

(declare-fun m!1421561 () Bool)

(assert (=> b!1539201 m!1421561))

(declare-fun m!1421563 () Bool)

(assert (=> b!1539204 m!1421563))

(declare-fun m!1421565 () Bool)

(assert (=> b!1539206 m!1421565))

(assert (=> b!1539206 m!1421565))

(declare-fun m!1421567 () Bool)

(assert (=> b!1539206 m!1421567))

(declare-fun m!1421569 () Bool)

(assert (=> b!1539202 m!1421569))

(check-sat (not b!1539205) (not b!1539206) (not b!1539198) (not b!1539202) (not start!131200) (not b!1539199) (not b!1539201))
(check-sat)
(get-model)

(declare-fun d!160373 () Bool)

(assert (=> d!160373 (= (validMask!0 mask!2480) (and (or (= mask!2480 #b00000000000000000000000000000111) (= mask!2480 #b00000000000000000000000000001111) (= mask!2480 #b00000000000000000000000000011111) (= mask!2480 #b00000000000000000000000000111111) (= mask!2480 #b00000000000000000000000001111111) (= mask!2480 #b00000000000000000000000011111111) (= mask!2480 #b00000000000000000000000111111111) (= mask!2480 #b00000000000000000000001111111111) (= mask!2480 #b00000000000000000000011111111111) (= mask!2480 #b00000000000000000000111111111111) (= mask!2480 #b00000000000000000001111111111111) (= mask!2480 #b00000000000000000011111111111111) (= mask!2480 #b00000000000000000111111111111111) (= mask!2480 #b00000000000000001111111111111111) (= mask!2480 #b00000000000000011111111111111111) (= mask!2480 #b00000000000000111111111111111111) (= mask!2480 #b00000000000001111111111111111111) (= mask!2480 #b00000000000011111111111111111111) (= mask!2480 #b00000000000111111111111111111111) (= mask!2480 #b00000000001111111111111111111111) (= mask!2480 #b00000000011111111111111111111111) (= mask!2480 #b00000000111111111111111111111111) (= mask!2480 #b00000001111111111111111111111111) (= mask!2480 #b00000011111111111111111111111111) (= mask!2480 #b00000111111111111111111111111111) (= mask!2480 #b00001111111111111111111111111111) (= mask!2480 #b00011111111111111111111111111111) (= mask!2480 #b00111111111111111111111111111111)) (bvsle mask!2480 #b00111111111111111111111111111111)))))

(assert (=> start!131200 d!160373))

(declare-fun d!160375 () Bool)

(assert (=> d!160375 (= (array_inv!38375 a!2792) (bvsge (size!49897 a!2792) #b00000000000000000000000000000000))))

(assert (=> start!131200 d!160375))

(declare-fun d!160377 () Bool)

(assert (=> d!160377 (= (validKeyInArray!0 (select (arr!49347 a!2792) i!951)) (and (not (= (select (arr!49347 a!2792) i!951) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49347 a!2792) i!951) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1539206 d!160377))

(declare-fun e!856179 () SeekEntryResult!13473)

(declare-fun b!1539246 () Bool)

(assert (=> b!1539246 (= e!856179 (seekKeyOrZeroReturnVacant!0 (bvadd x!510 #b00000000000000000000000000000001) (nextIndex!0 index!463 x!510 mask!2480) vacantIndex!5 (select (arr!49347 a!2792) j!64) a!2792 mask!2480))))

(declare-fun lt!664995 () SeekEntryResult!13473)

(declare-fun d!160379 () Bool)

(get-info :version)

(assert (=> d!160379 (and (or ((_ is Undefined!13473) lt!664995) (not ((_ is Found!13473) lt!664995)) (and (bvsge (index!56288 lt!664995) #b00000000000000000000000000000000) (bvslt (index!56288 lt!664995) (size!49897 a!2792)))) (or ((_ is Undefined!13473) lt!664995) ((_ is Found!13473) lt!664995) (not ((_ is MissingVacant!13473) lt!664995)) (not (= (index!56290 lt!664995) vacantIndex!5)) (and (bvsge (index!56290 lt!664995) #b00000000000000000000000000000000) (bvslt (index!56290 lt!664995) (size!49897 a!2792)))) (or ((_ is Undefined!13473) lt!664995) (ite ((_ is Found!13473) lt!664995) (= (select (arr!49347 a!2792) (index!56288 lt!664995)) (select (arr!49347 a!2792) j!64)) (and ((_ is MissingVacant!13473) lt!664995) (= (index!56290 lt!664995) vacantIndex!5) (= (select (arr!49347 a!2792) (index!56290 lt!664995)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!856178 () SeekEntryResult!13473)

(assert (=> d!160379 (= lt!664995 e!856178)))

(declare-fun c!141075 () Bool)

(assert (=> d!160379 (= c!141075 (bvsge x!510 #b01111111111111111111111111111110))))

(declare-fun lt!664996 () (_ BitVec 64))

(assert (=> d!160379 (= lt!664996 (select (arr!49347 a!2792) index!463))))

(assert (=> d!160379 (validMask!0 mask!2480)))

(assert (=> d!160379 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49347 a!2792) j!64) a!2792 mask!2480) lt!664995)))

(declare-fun b!1539247 () Bool)

(declare-fun e!856180 () SeekEntryResult!13473)

(assert (=> b!1539247 (= e!856178 e!856180)))

(declare-fun c!141076 () Bool)

(assert (=> b!1539247 (= c!141076 (= lt!664996 (select (arr!49347 a!2792) j!64)))))

(declare-fun b!1539248 () Bool)

(declare-fun c!141077 () Bool)

(assert (=> b!1539248 (= c!141077 (= lt!664996 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1539248 (= e!856180 e!856179)))

(declare-fun b!1539249 () Bool)

(assert (=> b!1539249 (= e!856178 Undefined!13473)))

(declare-fun b!1539250 () Bool)

(assert (=> b!1539250 (= e!856179 (MissingVacant!13473 vacantIndex!5))))

(declare-fun b!1539251 () Bool)

(assert (=> b!1539251 (= e!856180 (Found!13473 index!463))))

(assert (= (and d!160379 c!141075) b!1539249))

(assert (= (and d!160379 (not c!141075)) b!1539247))

(assert (= (and b!1539247 c!141076) b!1539251))

(assert (= (and b!1539247 (not c!141076)) b!1539248))

(assert (= (and b!1539248 c!141077) b!1539250))

(assert (= (and b!1539248 (not c!141077)) b!1539246))

(assert (=> b!1539246 m!1421559))

(assert (=> b!1539246 m!1421559))

(assert (=> b!1539246 m!1421553))

(declare-fun m!1421597 () Bool)

(assert (=> b!1539246 m!1421597))

(declare-fun m!1421599 () Bool)

(assert (=> d!160379 m!1421599))

(declare-fun m!1421601 () Bool)

(assert (=> d!160379 m!1421601))

(assert (=> d!160379 m!1421551))

(assert (=> d!160379 m!1421547))

(assert (=> b!1539201 d!160379))

(declare-fun b!1539262 () Bool)

(declare-fun e!856190 () Bool)

(declare-fun call!68601 () Bool)

(assert (=> b!1539262 (= e!856190 call!68601)))

(declare-fun bm!68598 () Bool)

(declare-fun c!141080 () Bool)

(assert (=> bm!68598 (= call!68601 (arrayNoDuplicates!0 a!2792 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!141080 (Cons!35817 (select (arr!49347 a!2792) #b00000000000000000000000000000000) Nil!35818) Nil!35818)))))

(declare-fun b!1539263 () Bool)

(assert (=> b!1539263 (= e!856190 call!68601)))

(declare-fun d!160391 () Bool)

(declare-fun res!1056219 () Bool)

(declare-fun e!856191 () Bool)

(assert (=> d!160391 (=> res!1056219 e!856191)))

(assert (=> d!160391 (= res!1056219 (bvsge #b00000000000000000000000000000000 (size!49897 a!2792)))))

(assert (=> d!160391 (= (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35818) e!856191)))

(declare-fun b!1539264 () Bool)

(declare-fun e!856192 () Bool)

(declare-fun contains!10012 (List!35821 (_ BitVec 64)) Bool)

(assert (=> b!1539264 (= e!856192 (contains!10012 Nil!35818 (select (arr!49347 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1539265 () Bool)

(declare-fun e!856189 () Bool)

(assert (=> b!1539265 (= e!856191 e!856189)))

(declare-fun res!1056218 () Bool)

(assert (=> b!1539265 (=> (not res!1056218) (not e!856189))))

(assert (=> b!1539265 (= res!1056218 (not e!856192))))

(declare-fun res!1056220 () Bool)

(assert (=> b!1539265 (=> (not res!1056220) (not e!856192))))

(assert (=> b!1539265 (= res!1056220 (validKeyInArray!0 (select (arr!49347 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1539266 () Bool)

(assert (=> b!1539266 (= e!856189 e!856190)))

(assert (=> b!1539266 (= c!141080 (validKeyInArray!0 (select (arr!49347 a!2792) #b00000000000000000000000000000000)))))

(assert (= (and d!160391 (not res!1056219)) b!1539265))

(assert (= (and b!1539265 res!1056220) b!1539264))

(assert (= (and b!1539265 res!1056218) b!1539266))

(assert (= (and b!1539266 c!141080) b!1539262))

(assert (= (and b!1539266 (not c!141080)) b!1539263))

(assert (= (or b!1539262 b!1539263) bm!68598))

(declare-fun m!1421603 () Bool)

(assert (=> bm!68598 m!1421603))

(declare-fun m!1421605 () Bool)

(assert (=> bm!68598 m!1421605))

(assert (=> b!1539264 m!1421603))

(assert (=> b!1539264 m!1421603))

(declare-fun m!1421607 () Bool)

(assert (=> b!1539264 m!1421607))

(assert (=> b!1539265 m!1421603))

(assert (=> b!1539265 m!1421603))

(declare-fun m!1421609 () Bool)

(assert (=> b!1539265 m!1421609))

(assert (=> b!1539266 m!1421603))

(assert (=> b!1539266 m!1421603))

(assert (=> b!1539266 m!1421609))

(assert (=> b!1539202 d!160391))

(declare-fun b!1539291 () Bool)

(declare-fun e!856211 () Bool)

(declare-fun call!68607 () Bool)

(assert (=> b!1539291 (= e!856211 call!68607)))

(declare-fun b!1539292 () Bool)

(declare-fun e!856210 () Bool)

(assert (=> b!1539292 (= e!856210 call!68607)))

(declare-fun b!1539293 () Bool)

(declare-fun e!856212 () Bool)

(assert (=> b!1539293 (= e!856212 e!856210)))

(declare-fun c!141088 () Bool)

(assert (=> b!1539293 (= c!141088 (validKeyInArray!0 (select (arr!49347 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1539294 () Bool)

(assert (=> b!1539294 (= e!856210 e!856211)))

(declare-fun lt!665018 () (_ BitVec 64))

(assert (=> b!1539294 (= lt!665018 (select (arr!49347 a!2792) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51406 0))(
  ( (Unit!51407) )
))
(declare-fun lt!665016 () Unit!51406)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!102265 (_ BitVec 64) (_ BitVec 32)) Unit!51406)

(assert (=> b!1539294 (= lt!665016 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2792 lt!665018 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!102265 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1539294 (arrayContainsKey!0 a!2792 lt!665018 #b00000000000000000000000000000000)))

(declare-fun lt!665017 () Unit!51406)

(assert (=> b!1539294 (= lt!665017 lt!665016)))

(declare-fun res!1056231 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!102265 (_ BitVec 32)) SeekEntryResult!13473)

(assert (=> b!1539294 (= res!1056231 (= (seekEntryOrOpen!0 (select (arr!49347 a!2792) #b00000000000000000000000000000000) a!2792 mask!2480) (Found!13473 #b00000000000000000000000000000000)))))

(assert (=> b!1539294 (=> (not res!1056231) (not e!856211))))

(declare-fun d!160403 () Bool)

(declare-fun res!1056232 () Bool)

(assert (=> d!160403 (=> res!1056232 e!856212)))

(assert (=> d!160403 (= res!1056232 (bvsge #b00000000000000000000000000000000 (size!49897 a!2792)))))

(assert (=> d!160403 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480) e!856212)))

(declare-fun bm!68604 () Bool)

(assert (=> bm!68604 (= call!68607 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2792 mask!2480))))

(assert (= (and d!160403 (not res!1056232)) b!1539293))

(assert (= (and b!1539293 c!141088) b!1539294))

(assert (= (and b!1539293 (not c!141088)) b!1539292))

(assert (= (and b!1539294 res!1056231) b!1539291))

(assert (= (or b!1539291 b!1539292) bm!68604))

(assert (=> b!1539293 m!1421603))

(assert (=> b!1539293 m!1421603))

(assert (=> b!1539293 m!1421609))

(assert (=> b!1539294 m!1421603))

(declare-fun m!1421623 () Bool)

(assert (=> b!1539294 m!1421623))

(declare-fun m!1421625 () Bool)

(assert (=> b!1539294 m!1421625))

(assert (=> b!1539294 m!1421603))

(declare-fun m!1421627 () Bool)

(assert (=> b!1539294 m!1421627))

(declare-fun m!1421629 () Bool)

(assert (=> bm!68604 m!1421629))

(assert (=> b!1539199 d!160403))

(declare-fun d!160409 () Bool)

(declare-fun lt!665021 () (_ BitVec 32))

(assert (=> d!160409 (and (bvsge lt!665021 #b00000000000000000000000000000000) (bvslt lt!665021 (bvadd mask!2480 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!160409 (= lt!665021 (choose!52 index!463 x!510 mask!2480))))

(assert (=> d!160409 (validMask!0 mask!2480)))

(assert (=> d!160409 (= (nextIndex!0 index!463 x!510 mask!2480) lt!665021)))

(declare-fun bs!44189 () Bool)

(assert (= bs!44189 d!160409))

(declare-fun m!1421631 () Bool)

(assert (=> bs!44189 m!1421631))

(assert (=> bs!44189 m!1421547))

(assert (=> b!1539198 d!160409))

(declare-fun d!160411 () Bool)

(assert (=> d!160411 (= (validKeyInArray!0 (select (arr!49347 a!2792) j!64)) (and (not (= (select (arr!49347 a!2792) j!64) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49347 a!2792) j!64) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1539205 d!160411))

(check-sat (not b!1539265) (not d!160379) (not bm!68598) (not b!1539264) (not b!1539293) (not d!160409) (not b!1539246) (not bm!68604) (not b!1539294) (not b!1539266))
(check-sat)
