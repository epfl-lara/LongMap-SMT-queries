; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119364 () Bool)

(assert start!119364)

(declare-fun b!1391520 () Bool)

(declare-fun e!787974 () Bool)

(declare-datatypes ((SeekEntryResult!10279 0))(
  ( (MissingZero!10279 (index!43487 (_ BitVec 32))) (Found!10279 (index!43488 (_ BitVec 32))) (Intermediate!10279 (undefined!11091 Bool) (index!43489 (_ BitVec 32)) (x!125169 (_ BitVec 32))) (Undefined!10279) (MissingVacant!10279 (index!43490 (_ BitVec 32))) )
))
(declare-fun lt!611229 () SeekEntryResult!10279)

(declare-fun mask!2840 () (_ BitVec 32))

(assert (=> b!1391520 (= e!787974 (not (or (not (is-Intermediate!10279 lt!611229)) (undefined!11091 lt!611229) (bvslt mask!2840 #b00000000000000000000000000000000) (bvsle mask!2840 #b00111111111111111111111111111111))))))

(declare-fun e!787976 () Bool)

(assert (=> b!1391520 e!787976))

(declare-fun res!931387 () Bool)

(assert (=> b!1391520 (=> (not res!931387) (not e!787976))))

(declare-datatypes ((array!95199 0))(
  ( (array!95200 (arr!45962 (Array (_ BitVec 32) (_ BitVec 64))) (size!46512 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95199)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95199 (_ BitVec 32)) Bool)

(assert (=> b!1391520 (= res!931387 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46562 0))(
  ( (Unit!46563) )
))
(declare-fun lt!611228 () Unit!46562)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95199 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46562)

(assert (=> b!1391520 (= lt!611228 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95199 (_ BitVec 32)) SeekEntryResult!10279)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391520 (= lt!611229 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45962 a!2901) j!112) mask!2840) (select (arr!45962 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391521 () Bool)

(declare-fun res!931390 () Bool)

(assert (=> b!1391521 (=> (not res!931390) (not e!787974))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1391521 (= res!931390 (validKeyInArray!0 (select (arr!45962 a!2901) j!112)))))

(declare-fun res!931391 () Bool)

(assert (=> start!119364 (=> (not res!931391) (not e!787974))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119364 (= res!931391 (validMask!0 mask!2840))))

(assert (=> start!119364 e!787974))

(assert (=> start!119364 true))

(declare-fun array_inv!34990 (array!95199) Bool)

(assert (=> start!119364 (array_inv!34990 a!2901)))

(declare-fun b!1391522 () Bool)

(declare-fun res!931393 () Bool)

(assert (=> b!1391522 (=> (not res!931393) (not e!787974))))

(assert (=> b!1391522 (= res!931393 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1391523 () Bool)

(declare-fun res!931389 () Bool)

(assert (=> b!1391523 (=> (not res!931389) (not e!787974))))

(declare-datatypes ((List!32481 0))(
  ( (Nil!32478) (Cons!32477 (h!33701 (_ BitVec 64)) (t!47175 List!32481)) )
))
(declare-fun arrayNoDuplicates!0 (array!95199 (_ BitVec 32) List!32481) Bool)

(assert (=> b!1391523 (= res!931389 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32478))))

(declare-fun b!1391524 () Bool)

(declare-fun res!931388 () Bool)

(assert (=> b!1391524 (=> (not res!931388) (not e!787974))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1391524 (= res!931388 (and (= (size!46512 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46512 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46512 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1391525 () Bool)

(declare-fun res!931392 () Bool)

(assert (=> b!1391525 (=> (not res!931392) (not e!787974))))

(assert (=> b!1391525 (= res!931392 (validKeyInArray!0 (select (arr!45962 a!2901) i!1037)))))

(declare-fun b!1391526 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95199 (_ BitVec 32)) SeekEntryResult!10279)

(assert (=> b!1391526 (= e!787976 (= (seekEntryOrOpen!0 (select (arr!45962 a!2901) j!112) a!2901 mask!2840) (Found!10279 j!112)))))

(assert (= (and start!119364 res!931391) b!1391524))

(assert (= (and b!1391524 res!931388) b!1391525))

(assert (= (and b!1391525 res!931392) b!1391521))

(assert (= (and b!1391521 res!931390) b!1391522))

(assert (= (and b!1391522 res!931393) b!1391523))

(assert (= (and b!1391523 res!931389) b!1391520))

(assert (= (and b!1391520 res!931387) b!1391526))

(declare-fun m!1277319 () Bool)

(assert (=> b!1391521 m!1277319))

(assert (=> b!1391521 m!1277319))

(declare-fun m!1277321 () Bool)

(assert (=> b!1391521 m!1277321))

(declare-fun m!1277323 () Bool)

(assert (=> b!1391525 m!1277323))

(assert (=> b!1391525 m!1277323))

(declare-fun m!1277325 () Bool)

(assert (=> b!1391525 m!1277325))

(declare-fun m!1277327 () Bool)

(assert (=> b!1391522 m!1277327))

(assert (=> b!1391520 m!1277319))

(declare-fun m!1277329 () Bool)

(assert (=> b!1391520 m!1277329))

(assert (=> b!1391520 m!1277319))

(declare-fun m!1277331 () Bool)

(assert (=> b!1391520 m!1277331))

(assert (=> b!1391520 m!1277329))

(assert (=> b!1391520 m!1277319))

(declare-fun m!1277333 () Bool)

(assert (=> b!1391520 m!1277333))

(declare-fun m!1277335 () Bool)

(assert (=> b!1391520 m!1277335))

(declare-fun m!1277337 () Bool)

(assert (=> start!119364 m!1277337))

(declare-fun m!1277339 () Bool)

(assert (=> start!119364 m!1277339))

(declare-fun m!1277341 () Bool)

(assert (=> b!1391523 m!1277341))

(assert (=> b!1391526 m!1277319))

(assert (=> b!1391526 m!1277319))

(declare-fun m!1277343 () Bool)

(assert (=> b!1391526 m!1277343))

(push 1)

(assert (not b!1391523))

(assert (not b!1391520))

(assert (not b!1391526))

(assert (not b!1391525))

(assert (not start!119364))

(assert (not b!1391521))

(assert (not b!1391522))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!150351 () Bool)

(assert (=> d!150351 (= (validKeyInArray!0 (select (arr!45962 a!2901) j!112)) (and (not (= (select (arr!45962 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45962 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1391521 d!150351))

(declare-fun b!1391620 () Bool)

(declare-fun c!129532 () Bool)

(declare-fun lt!611265 () (_ BitVec 64))

(assert (=> b!1391620 (= c!129532 (= lt!611265 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!788029 () SeekEntryResult!10279)

(declare-fun e!788030 () SeekEntryResult!10279)

(assert (=> b!1391620 (= e!788029 e!788030)))

(declare-fun b!1391621 () Bool)

(declare-fun lt!611264 () SeekEntryResult!10279)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95199 (_ BitVec 32)) SeekEntryResult!10279)

(assert (=> b!1391621 (= e!788030 (seekKeyOrZeroReturnVacant!0 (x!125169 lt!611264) (index!43489 lt!611264) (index!43489 lt!611264) (select (arr!45962 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391622 () Bool)

(assert (=> b!1391622 (= e!788030 (MissingZero!10279 (index!43489 lt!611264)))))

(declare-fun b!1391623 () Bool)

(declare-fun e!788028 () SeekEntryResult!10279)

(assert (=> b!1391623 (= e!788028 e!788029)))

(assert (=> b!1391623 (= lt!611265 (select (arr!45962 a!2901) (index!43489 lt!611264)))))

(declare-fun c!129533 () Bool)

(assert (=> b!1391623 (= c!129533 (= lt!611265 (select (arr!45962 a!2901) j!112)))))

(declare-fun b!1391624 () Bool)

(assert (=> b!1391624 (= e!788028 Undefined!10279)))

(declare-fun b!1391625 () Bool)

(assert (=> b!1391625 (= e!788029 (Found!10279 (index!43489 lt!611264)))))

(declare-fun d!150353 () Bool)

(declare-fun lt!611263 () SeekEntryResult!10279)

(assert (=> d!150353 (and (or (is-Undefined!10279 lt!611263) (not (is-Found!10279 lt!611263)) (and (bvsge (index!43488 lt!611263) #b00000000000000000000000000000000) (bvslt (index!43488 lt!611263) (size!46512 a!2901)))) (or (is-Undefined!10279 lt!611263) (is-Found!10279 lt!611263) (not (is-MissingZero!10279 lt!611263)) (and (bvsge (index!43487 lt!611263) #b00000000000000000000000000000000) (bvslt (index!43487 lt!611263) (size!46512 a!2901)))) (or (is-Undefined!10279 lt!611263) (is-Found!10279 lt!611263) (is-MissingZero!10279 lt!611263) (not (is-MissingVacant!10279 lt!611263)) (and (bvsge (index!43490 lt!611263) #b00000000000000000000000000000000) (bvslt (index!43490 lt!611263) (size!46512 a!2901)))) (or (is-Undefined!10279 lt!611263) (ite (is-Found!10279 lt!611263) (= (select (arr!45962 a!2901) (index!43488 lt!611263)) (select (arr!45962 a!2901) j!112)) (ite (is-MissingZero!10279 lt!611263) (= (select (arr!45962 a!2901) (index!43487 lt!611263)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10279 lt!611263) (= (select (arr!45962 a!2901) (index!43490 lt!611263)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!150353 (= lt!611263 e!788028)))

(declare-fun c!129534 () Bool)

(assert (=> d!150353 (= c!129534 (and (is-Intermediate!10279 lt!611264) (undefined!11091 lt!611264)))))

(assert (=> d!150353 (= lt!611264 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45962 a!2901) j!112) mask!2840) (select (arr!45962 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!150353 (validMask!0 mask!2840)))

(assert (=> d!150353 (= (seekEntryOrOpen!0 (select (arr!45962 a!2901) j!112) a!2901 mask!2840) lt!611263)))

(assert (= (and d!150353 c!129534) b!1391624))

(assert (= (and d!150353 (not c!129534)) b!1391623))

(assert (= (and b!1391623 c!129533) b!1391625))

(assert (= (and b!1391623 (not c!129533)) b!1391620))

(assert (= (and b!1391620 c!129532) b!1391622))

(assert (= (and b!1391620 (not c!129532)) b!1391621))

(assert (=> b!1391621 m!1277319))

(declare-fun m!1277413 () Bool)

(assert (=> b!1391621 m!1277413))

(declare-fun m!1277415 () Bool)

(assert (=> b!1391623 m!1277415))

(declare-fun m!1277417 () Bool)

(assert (=> d!150353 m!1277417))

(declare-fun m!1277419 () Bool)

(assert (=> d!150353 m!1277419))

(assert (=> d!150353 m!1277319))

(assert (=> d!150353 m!1277329))

(declare-fun m!1277421 () Bool)

(assert (=> d!150353 m!1277421))

(assert (=> d!150353 m!1277329))

(assert (=> d!150353 m!1277319))

(assert (=> d!150353 m!1277333))

(assert (=> d!150353 m!1277337))

(assert (=> b!1391526 d!150353))

(declare-fun d!150365 () Bool)

(assert (=> d!150365 (= (validKeyInArray!0 (select (arr!45962 a!2901) i!1037)) (and (not (= (select (arr!45962 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45962 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1391525 d!150365))

(declare-fun call!66748 () Bool)

(declare-fun bm!66745 () Bool)

(assert (=> bm!66745 (= call!66748 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1391658 () Bool)

(declare-fun e!788050 () Bool)

(assert (=> b!1391658 (= e!788050 call!66748)))

(declare-fun b!1391659 () Bool)

(declare-fun e!788051 () Bool)

(assert (=> b!1391659 (= e!788051 call!66748)))

(declare-fun d!150367 () Bool)

(declare-fun res!931455 () Bool)

(declare-fun e!788049 () Bool)

(assert (=> d!150367 (=> res!931455 e!788049)))

(assert (=> d!150367 (= res!931455 (bvsge j!112 (size!46512 a!2901)))))

(assert (=> d!150367 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!788049)))

(declare-fun b!1391660 () Bool)

(assert (=> b!1391660 (= e!788049 e!788050)))

(declare-fun c!129549 () Bool)

(assert (=> b!1391660 (= c!129549 (validKeyInArray!0 (select (arr!45962 a!2901) j!112)))))

(declare-fun b!1391661 () Bool)

(assert (=> b!1391661 (= e!788050 e!788051)))

(declare-fun lt!611286 () (_ BitVec 64))

(assert (=> b!1391661 (= lt!611286 (select (arr!45962 a!2901) j!112))))

(declare-fun lt!611285 () Unit!46562)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95199 (_ BitVec 64) (_ BitVec 32)) Unit!46562)

(assert (=> b!1391661 (= lt!611285 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!611286 j!112))))

(declare-fun arrayContainsKey!0 (array!95199 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1391661 (arrayContainsKey!0 a!2901 lt!611286 #b00000000000000000000000000000000)))

(declare-fun lt!611284 () Unit!46562)

(assert (=> b!1391661 (= lt!611284 lt!611285)))

(declare-fun res!931456 () Bool)

(assert (=> b!1391661 (= res!931456 (= (seekEntryOrOpen!0 (select (arr!45962 a!2901) j!112) a!2901 mask!2840) (Found!10279 j!112)))))

(assert (=> b!1391661 (=> (not res!931456) (not e!788051))))

(assert (= (and d!150367 (not res!931455)) b!1391660))

(assert (= (and b!1391660 c!129549) b!1391661))

(assert (= (and b!1391660 (not c!129549)) b!1391658))

(assert (= (and b!1391661 res!931456) b!1391659))

(assert (= (or b!1391659 b!1391658) bm!66745))

(declare-fun m!1277449 () Bool)

(assert (=> bm!66745 m!1277449))

