; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119440 () Bool)

(assert start!119440)

(declare-fun b!1391972 () Bool)

(declare-fun res!931744 () Bool)

(declare-fun e!788229 () Bool)

(assert (=> b!1391972 (=> (not res!931744) (not e!788229))))

(declare-datatypes ((array!95177 0))(
  ( (array!95178 (arr!45950 (Array (_ BitVec 32) (_ BitVec 64))) (size!46502 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95177)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1391972 (= res!931744 (validKeyInArray!0 (select (arr!45950 a!2901) j!112)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!788230 () Bool)

(declare-fun b!1391973 () Bool)

(declare-datatypes ((SeekEntryResult!10293 0))(
  ( (MissingZero!10293 (index!43543 (_ BitVec 32))) (Found!10293 (index!43544 (_ BitVec 32))) (Intermediate!10293 (undefined!11105 Bool) (index!43545 (_ BitVec 32)) (x!125218 (_ BitVec 32))) (Undefined!10293) (MissingVacant!10293 (index!43546 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95177 (_ BitVec 32)) SeekEntryResult!10293)

(assert (=> b!1391973 (= e!788230 (= (seekEntryOrOpen!0 (select (arr!45950 a!2901) j!112) a!2901 mask!2840) (Found!10293 j!112)))))

(declare-fun b!1391974 () Bool)

(declare-fun res!931747 () Bool)

(assert (=> b!1391974 (=> (not res!931747) (not e!788229))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1391974 (= res!931747 (and (= (size!46502 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46502 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46502 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1391975 () Bool)

(declare-fun res!931749 () Bool)

(assert (=> b!1391975 (=> (not res!931749) (not e!788229))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95177 (_ BitVec 32)) Bool)

(assert (=> b!1391975 (= res!931749 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!931750 () Bool)

(assert (=> start!119440 (=> (not res!931750) (not e!788229))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119440 (= res!931750 (validMask!0 mask!2840))))

(assert (=> start!119440 e!788229))

(assert (=> start!119440 true))

(declare-fun array_inv!35183 (array!95177) Bool)

(assert (=> start!119440 (array_inv!35183 a!2901)))

(declare-fun b!1391976 () Bool)

(declare-fun res!931745 () Bool)

(assert (=> b!1391976 (=> (not res!931745) (not e!788229))))

(declare-datatypes ((List!32547 0))(
  ( (Nil!32544) (Cons!32543 (h!33770 (_ BitVec 64)) (t!47233 List!32547)) )
))
(declare-fun arrayNoDuplicates!0 (array!95177 (_ BitVec 32) List!32547) Bool)

(assert (=> b!1391976 (= res!931745 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32544))))

(declare-fun b!1391977 () Bool)

(declare-fun e!788231 () Bool)

(assert (=> b!1391977 (= e!788229 (not e!788231))))

(declare-fun res!931748 () Bool)

(assert (=> b!1391977 (=> res!931748 e!788231)))

(declare-fun lt!611258 () SeekEntryResult!10293)

(assert (=> b!1391977 (= res!931748 (or (not (is-Intermediate!10293 lt!611258)) (undefined!11105 lt!611258)))))

(assert (=> b!1391977 e!788230))

(declare-fun res!931743 () Bool)

(assert (=> b!1391977 (=> (not res!931743) (not e!788230))))

(assert (=> b!1391977 (= res!931743 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46433 0))(
  ( (Unit!46434) )
))
(declare-fun lt!611256 () Unit!46433)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95177 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46433)

(assert (=> b!1391977 (= lt!611256 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95177 (_ BitVec 32)) SeekEntryResult!10293)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391977 (= lt!611258 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45950 a!2901) j!112) mask!2840) (select (arr!45950 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391978 () Bool)

(declare-fun res!931746 () Bool)

(assert (=> b!1391978 (=> (not res!931746) (not e!788229))))

(assert (=> b!1391978 (= res!931746 (validKeyInArray!0 (select (arr!45950 a!2901) i!1037)))))

(declare-fun b!1391979 () Bool)

(declare-fun lt!611257 () (_ BitVec 32))

(assert (=> b!1391979 (= e!788231 (or (bvslt mask!2840 #b00000000000000000000000000000000) (and (bvsge lt!611257 #b00000000000000000000000000000000) (bvslt lt!611257 (bvadd #b00000000000000000000000000000001 mask!2840)))))))

(assert (=> b!1391979 (= lt!611257 (toIndex!0 (select (store (arr!45950 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(assert (= (and start!119440 res!931750) b!1391974))

(assert (= (and b!1391974 res!931747) b!1391978))

(assert (= (and b!1391978 res!931746) b!1391972))

(assert (= (and b!1391972 res!931744) b!1391975))

(assert (= (and b!1391975 res!931749) b!1391976))

(assert (= (and b!1391976 res!931745) b!1391977))

(assert (= (and b!1391977 res!931743) b!1391973))

(assert (= (and b!1391977 (not res!931748)) b!1391979))

(declare-fun m!1277307 () Bool)

(assert (=> b!1391975 m!1277307))

(declare-fun m!1277309 () Bool)

(assert (=> b!1391978 m!1277309))

(assert (=> b!1391978 m!1277309))

(declare-fun m!1277311 () Bool)

(assert (=> b!1391978 m!1277311))

(declare-fun m!1277313 () Bool)

(assert (=> b!1391976 m!1277313))

(declare-fun m!1277315 () Bool)

(assert (=> b!1391972 m!1277315))

(assert (=> b!1391972 m!1277315))

(declare-fun m!1277317 () Bool)

(assert (=> b!1391972 m!1277317))

(assert (=> b!1391973 m!1277315))

(assert (=> b!1391973 m!1277315))

(declare-fun m!1277319 () Bool)

(assert (=> b!1391973 m!1277319))

(declare-fun m!1277321 () Bool)

(assert (=> b!1391979 m!1277321))

(declare-fun m!1277323 () Bool)

(assert (=> b!1391979 m!1277323))

(assert (=> b!1391979 m!1277323))

(declare-fun m!1277325 () Bool)

(assert (=> b!1391979 m!1277325))

(assert (=> b!1391977 m!1277315))

(declare-fun m!1277327 () Bool)

(assert (=> b!1391977 m!1277327))

(assert (=> b!1391977 m!1277315))

(declare-fun m!1277329 () Bool)

(assert (=> b!1391977 m!1277329))

(assert (=> b!1391977 m!1277327))

(assert (=> b!1391977 m!1277315))

(declare-fun m!1277331 () Bool)

(assert (=> b!1391977 m!1277331))

(declare-fun m!1277333 () Bool)

(assert (=> b!1391977 m!1277333))

(declare-fun m!1277335 () Bool)

(assert (=> start!119440 m!1277335))

(declare-fun m!1277337 () Bool)

(assert (=> start!119440 m!1277337))

(push 1)

(assert (not b!1391976))

(assert (not b!1391975))

(assert (not b!1391978))

(assert (not b!1391973))

(assert (not b!1391979))

(assert (not start!119440))

(assert (not b!1391972))

(assert (not b!1391977))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun bm!66743 () Bool)

(declare-fun call!66746 () Bool)

(assert (=> bm!66743 (= call!66746 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1392024 () Bool)

(declare-fun e!788261 () Bool)

(declare-fun e!788259 () Bool)

(assert (=> b!1392024 (= e!788261 e!788259)))

(declare-fun lt!611285 () (_ BitVec 64))

(assert (=> b!1392024 (= lt!611285 (select (arr!45950 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!611286 () Unit!46433)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95177 (_ BitVec 64) (_ BitVec 32)) Unit!46433)

(assert (=> b!1392024 (= lt!611286 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!611285 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!95177 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1392024 (arrayContainsKey!0 a!2901 lt!611285 #b00000000000000000000000000000000)))

(declare-fun lt!611287 () Unit!46433)

(assert (=> b!1392024 (= lt!611287 lt!611286)))

(declare-fun res!931785 () Bool)

(assert (=> b!1392024 (= res!931785 (= (seekEntryOrOpen!0 (select (arr!45950 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10293 #b00000000000000000000000000000000)))))

(assert (=> b!1392024 (=> (not res!931785) (not e!788259))))

(declare-fun b!1392025 () Bool)

(declare-fun e!788260 () Bool)

(assert (=> b!1392025 (= e!788260 e!788261)))

(declare-fun c!129571 () Bool)

(assert (=> b!1392025 (= c!129571 (validKeyInArray!0 (select (arr!45950 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!150305 () Bool)

(declare-fun res!931786 () Bool)

(assert (=> d!150305 (=> res!931786 e!788260)))

(assert (=> d!150305 (= res!931786 (bvsge #b00000000000000000000000000000000 (size!46502 a!2901)))))

(assert (=> d!150305 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!788260)))

(declare-fun b!1392026 () Bool)

(assert (=> b!1392026 (= e!788259 call!66746)))

(declare-fun b!1392027 () Bool)

(assert (=> b!1392027 (= e!788261 call!66746)))

(assert (= (and d!150305 (not res!931786)) b!1392025))

(assert (= (and b!1392025 c!129571) b!1392024))

(assert (= (and b!1392025 (not c!129571)) b!1392027))

(assert (= (and b!1392024 res!931785) b!1392026))

(assert (= (or b!1392026 b!1392027) bm!66743))

(declare-fun m!1277377 () Bool)

(assert (=> bm!66743 m!1277377))

(declare-fun m!1277379 () Bool)

(assert (=> b!1392024 m!1277379))

(declare-fun m!1277381 () Bool)

(assert (=> b!1392024 m!1277381))

(declare-fun m!1277383 () Bool)

(assert (=> b!1392024 m!1277383))

(assert (=> b!1392024 m!1277379))

(declare-fun m!1277387 () Bool)

(assert (=> b!1392024 m!1277387))

(assert (=> b!1392025 m!1277379))

(assert (=> b!1392025 m!1277379))

(declare-fun m!1277389 () Bool)

(assert (=> b!1392025 m!1277389))

(assert (=> b!1391975 d!150305))

(declare-fun b!1392088 () Bool)

(declare-fun e!788297 () SeekEntryResult!10293)

(assert (=> b!1392088 (= e!788297 Undefined!10293)))

(declare-fun d!150311 () Bool)

(declare-fun lt!611317 () SeekEntryResult!10293)

(assert (=> d!150311 (and (or (is-Undefined!10293 lt!611317) (not (is-Found!10293 lt!611317)) (and (bvsge (index!43544 lt!611317) #b00000000000000000000000000000000) (bvslt (index!43544 lt!611317) (size!46502 a!2901)))) (or (is-Undefined!10293 lt!611317) (is-Found!10293 lt!611317) (not (is-MissingZero!10293 lt!611317)) (and (bvsge (index!43543 lt!611317) #b00000000000000000000000000000000) (bvslt (index!43543 lt!611317) (size!46502 a!2901)))) (or (is-Undefined!10293 lt!611317) (is-Found!10293 lt!611317) (is-MissingZero!10293 lt!611317) (not (is-MissingVacant!10293 lt!611317)) (and (bvsge (index!43546 lt!611317) #b00000000000000000000000000000000) (bvslt (index!43546 lt!611317) (size!46502 a!2901)))) (or (is-Undefined!10293 lt!611317) (ite (is-Found!10293 lt!611317) (= (select (arr!45950 a!2901) (index!43544 lt!611317)) (select (arr!45950 a!2901) j!112)) (ite (is-MissingZero!10293 lt!611317) (= (select (arr!45950 a!2901) (index!43543 lt!611317)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10293 lt!611317) (= (select (arr!45950 a!2901) (index!43546 lt!611317)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!150311 (= lt!611317 e!788297)))

(declare-fun c!129598 () Bool)

(declare-fun lt!611318 () SeekEntryResult!10293)

(assert (=> d!150311 (= c!129598 (and (is-Intermediate!10293 lt!611318) (undefined!11105 lt!611318)))))

(assert (=> d!150311 (= lt!611318 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45950 a!2901) j!112) mask!2840) (select (arr!45950 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!150311 (validMask!0 mask!2840)))

(assert (=> d!150311 (= (seekEntryOrOpen!0 (select (arr!45950 a!2901) j!112) a!2901 mask!2840) lt!611317)))

(declare-fun e!788298 () SeekEntryResult!10293)

(declare-fun b!1392089 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95177 (_ BitVec 32)) SeekEntryResult!10293)

(assert (=> b!1392089 (= e!788298 (seekKeyOrZeroReturnVacant!0 (x!125218 lt!611318) (index!43545 lt!611318) (index!43545 lt!611318) (select (arr!45950 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1392090 () Bool)

(assert (=> b!1392090 (= e!788298 (MissingZero!10293 (index!43545 lt!611318)))))

(declare-fun b!1392091 () Bool)

(declare-fun e!788296 () SeekEntryResult!10293)

(assert (=> b!1392091 (= e!788296 (Found!10293 (index!43545 lt!611318)))))

(declare-fun b!1392092 () Bool)

(assert (=> b!1392092 (= e!788297 e!788296)))

(declare-fun lt!611319 () (_ BitVec 64))

(assert (=> b!1392092 (= lt!611319 (select (arr!45950 a!2901) (index!43545 lt!611318)))))

(declare-fun c!129597 () Bool)

(assert (=> b!1392092 (= c!129597 (= lt!611319 (select (arr!45950 a!2901) j!112)))))

(declare-fun b!1392093 () Bool)

(declare-fun c!129596 () Bool)

(assert (=> b!1392093 (= c!129596 (= lt!611319 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1392093 (= e!788296 e!788298)))

(assert (= (and d!150311 c!129598) b!1392088))

(assert (= (and d!150311 (not c!129598)) b!1392092))

(assert (= (and b!1392092 c!129597) b!1392091))

(assert (= (and b!1392092 (not c!129597)) b!1392093))

(assert (= (and b!1392093 c!129596) b!1392090))

(assert (= (and b!1392093 (not c!129596)) b!1392089))

(declare-fun m!1277407 () Bool)

(assert (=> d!150311 m!1277407))

(assert (=> d!150311 m!1277335))

(declare-fun m!1277409 () Bool)

(assert (=> d!150311 m!1277409))

(declare-fun m!1277411 () Bool)

(assert (=> d!150311 m!1277411))

(assert (=> d!150311 m!1277327))

(assert (=> d!150311 m!1277315))

(assert (=> d!150311 m!1277331))

(assert (=> d!150311 m!1277315))

(assert (=> d!150311 m!1277327))

(assert (=> b!1392089 m!1277315))

(declare-fun m!1277413 () Bool)

(assert (=> b!1392089 m!1277413))

(declare-fun m!1277415 () Bool)

(assert (=> b!1392092 m!1277415))

(assert (=> b!1391973 d!150311))

(declare-fun d!150317 () Bool)

(declare-fun lt!611334 () (_ BitVec 32))

(declare-fun lt!611333 () (_ BitVec 32))

(assert (=> d!150317 (= lt!611334 (bvmul (bvxor lt!611333 (bvlshr lt!611333 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150317 (= lt!611333 ((_ extract 31 0) (bvand (bvxor (select (store (arr!45950 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!45950 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150317 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!931802 (let ((h!33772 ((_ extract 31 0) (bvand (bvxor (select (store (arr!45950 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!45950 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125221 (bvmul (bvxor h!33772 (bvlshr h!33772 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125221 (bvlshr x!125221 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!931802 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!931802 #b00000000000000000000000000000000))))))

(assert (=> d!150317 (= (toIndex!0 (select (store (arr!45950 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!611334 (bvlshr lt!611334 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1391979 d!150317))

(declare-fun d!150323 () Bool)

(assert (=> d!150323 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!119440 d!150323))

(declare-fun d!150329 () Bool)

(assert (=> d!150329 (= (array_inv!35183 a!2901) (bvsge (size!46502 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!119440 d!150329))

(declare-fun call!66753 () Bool)

(declare-fun bm!66750 () Bool)

(assert (=> bm!66750 (= call!66753 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1392118 () Bool)

(declare-fun e!788318 () Bool)

(declare-fun e!788316 () Bool)

(assert (=> b!1392118 (= e!788318 e!788316)))

(declare-fun lt!611337 () (_ BitVec 64))

(assert (=> b!1392118 (= lt!611337 (select (arr!45950 a!2901) j!112))))

(declare-fun lt!611338 () Unit!46433)

(assert (=> b!1392118 (= lt!611338 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!611337 j!112))))

(assert (=> b!1392118 (arrayContainsKey!0 a!2901 lt!611337 #b00000000000000000000000000000000)))

(declare-fun lt!611339 () Unit!46433)

(assert (=> b!1392118 (= lt!611339 lt!611338)))

(declare-fun res!931813 () Bool)

(assert (=> b!1392118 (= res!931813 (= (seekEntryOrOpen!0 (select (arr!45950 a!2901) j!112) a!2901 mask!2840) (Found!10293 j!112)))))

(assert (=> b!1392118 (=> (not res!931813) (not e!788316))))

(declare-fun b!1392119 () Bool)

(declare-fun e!788317 () Bool)

(assert (=> b!1392119 (= e!788317 e!788318)))

(declare-fun c!129605 () Bool)

(assert (=> b!1392119 (= c!129605 (validKeyInArray!0 (select (arr!45950 a!2901) j!112)))))

(declare-fun d!150331 () Bool)

(declare-fun res!931814 () Bool)

(assert (=> d!150331 (=> res!931814 e!788317)))

(assert (=> d!150331 (= res!931814 (bvsge j!112 (size!46502 a!2901)))))

(assert (=> d!150331 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!788317)))

(declare-fun b!1392120 () Bool)

(assert (=> b!1392120 (= e!788316 call!66753)))

(declare-fun b!1392121 () Bool)

(assert (=> b!1392121 (= e!788318 call!66753)))

(assert (= (and d!150331 (not res!931814)) b!1392119))

(assert (= (and b!1392119 c!129605) b!1392118))

(assert (= (and b!1392119 (not c!129605)) b!1392121))

(assert (= (and b!1392118 res!931813) b!1392120))

(assert (= (or b!1392120 b!1392121) bm!66750))

(declare-fun m!1277435 () Bool)

(assert (=> bm!66750 m!1277435))

(assert (=> b!1392118 m!1277315))

(declare-fun m!1277437 () Bool)

(assert (=> b!1392118 m!1277437))

(declare-fun m!1277439 () Bool)

(assert (=> b!1392118 m!1277439))

(assert (=> b!1392118 m!1277315))

(assert (=> b!1392118 m!1277319))

(assert (=> b!1392119 m!1277315))

(assert (=> b!1392119 m!1277315))

(assert (=> b!1392119 m!1277317))

(assert (=> b!1391977 d!150331))

(declare-fun d!150333 () Bool)

(assert (=> d!150333 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!611346 () Unit!46433)

(declare-fun choose!38 (array!95177 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46433)

(assert (=> d!150333 (= lt!611346 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!150333 (validMask!0 mask!2840)))

(assert (=> d!150333 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!611346)))

(declare-fun bs!40473 () Bool)

(assert (= bs!40473 d!150333))

(assert (=> bs!40473 m!1277333))

(declare-fun m!1277441 () Bool)

(assert (=> bs!40473 m!1277441))

(assert (=> bs!40473 m!1277335))

(assert (=> b!1391977 d!150333))

(declare-fun e!788370 () SeekEntryResult!10293)

(declare-fun b!1392202 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1392202 (= e!788370 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!45950 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!45950 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1392203 () Bool)

(declare-fun e!788368 () Bool)

(declare-fun e!788371 () Bool)

(assert (=> b!1392203 (= e!788368 e!788371)))

(declare-fun res!931844 () Bool)

(declare-fun lt!611375 () SeekEntryResult!10293)

(assert (=> b!1392203 (= res!931844 (and (is-Intermediate!10293 lt!611375) (not (undefined!11105 lt!611375)) (bvslt (x!125218 lt!611375) #b01111111111111111111111111111110) (bvsge (x!125218 lt!611375) #b00000000000000000000000000000000) (bvsge (x!125218 lt!611375) #b00000000000000000000000000000000)))))

(assert (=> b!1392203 (=> (not res!931844) (not e!788371))))

(declare-fun b!1392204 () Bool)

(assert (=> b!1392204 (and (bvsge (index!43545 lt!611375) #b00000000000000000000000000000000) (bvslt (index!43545 lt!611375) (size!46502 a!2901)))))

(declare-fun e!788369 () Bool)

(assert (=> b!1392204 (= e!788369 (= (select (arr!45950 a!2901) (index!43545 lt!611375)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1392205 () Bool)

(assert (=> b!1392205 (and (bvsge (index!43545 lt!611375) #b00000000000000000000000000000000) (bvslt (index!43545 lt!611375) (size!46502 a!2901)))))

(declare-fun res!931845 () Bool)

(assert (=> b!1392205 (= res!931845 (= (select (arr!45950 a!2901) (index!43545 lt!611375)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1392205 (=> res!931845 e!788369)))

(declare-fun b!1392206 () Bool)

(declare-fun e!788372 () SeekEntryResult!10293)

(assert (=> b!1392206 (= e!788372 (Intermediate!10293 true (toIndex!0 (select (arr!45950 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1392207 () Bool)

(assert (=> b!1392207 (= e!788370 (Intermediate!10293 false (toIndex!0 (select (arr!45950 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun d!150335 () Bool)

(assert (=> d!150335 e!788368))

(declare-fun c!129634 () Bool)

(assert (=> d!150335 (= c!129634 (and (is-Intermediate!10293 lt!611375) (undefined!11105 lt!611375)))))

(assert (=> d!150335 (= lt!611375 e!788372)))

(declare-fun c!129633 () Bool)

(assert (=> d!150335 (= c!129633 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!611376 () (_ BitVec 64))

(assert (=> d!150335 (= lt!611376 (select (arr!45950 a!2901) (toIndex!0 (select (arr!45950 a!2901) j!112) mask!2840)))))

(assert (=> d!150335 (validMask!0 mask!2840)))

(assert (=> d!150335 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45950 a!2901) j!112) mask!2840) (select (arr!45950 a!2901) j!112) a!2901 mask!2840) lt!611375)))

(declare-fun b!1392208 () Bool)

(assert (=> b!1392208 (and (bvsge (index!43545 lt!611375) #b00000000000000000000000000000000) (bvslt (index!43545 lt!611375) (size!46502 a!2901)))))

(declare-fun res!931846 () Bool)

(assert (=> b!1392208 (= res!931846 (= (select (arr!45950 a!2901) (index!43545 lt!611375)) (select (arr!45950 a!2901) j!112)))))

(assert (=> b!1392208 (=> res!931846 e!788369)))

(assert (=> b!1392208 (= e!788371 e!788369)))

(declare-fun b!1392209 () Bool)

(assert (=> b!1392209 (= e!788372 e!788370)))

(declare-fun c!129632 () Bool)

(assert (=> b!1392209 (= c!129632 (or (= lt!611376 (select (arr!45950 a!2901) j!112)) (= (bvadd lt!611376 lt!611376) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1392210 () Bool)

(assert (=> b!1392210 (= e!788368 (bvsge (x!125218 lt!611375) #b01111111111111111111111111111110))))

(assert (= (and d!150335 c!129633) b!1392206))

(assert (= (and d!150335 (not c!129633)) b!1392209))

(assert (= (and b!1392209 c!129632) b!1392207))

(assert (= (and b!1392209 (not c!129632)) b!1392202))

(assert (= (and d!150335 c!129634) b!1392210))

(assert (= (and d!150335 (not c!129634)) b!1392203))

(assert (= (and b!1392203 res!931844) b!1392208))

(assert (= (and b!1392208 (not res!931846)) b!1392205))

(assert (= (and b!1392205 (not res!931845)) b!1392204))

(declare-fun m!1277475 () Bool)

(assert (=> b!1392208 m!1277475))

(assert (=> b!1392204 m!1277475))

(assert (=> b!1392205 m!1277475))

(assert (=> b!1392202 m!1277327))

(declare-fun m!1277477 () Bool)

(assert (=> b!1392202 m!1277477))

(assert (=> b!1392202 m!1277477))

(assert (=> b!1392202 m!1277315))

(declare-fun m!1277479 () Bool)

(assert (=> b!1392202 m!1277479))

(assert (=> d!150335 m!1277327))

(declare-fun m!1277481 () Bool)

(assert (=> d!150335 m!1277481))

(assert (=> d!150335 m!1277335))

(assert (=> b!1391977 d!150335))

(declare-fun d!150355 () Bool)

(declare-fun lt!611378 () (_ BitVec 32))

(declare-fun lt!611377 () (_ BitVec 32))

(assert (=> d!150355 (= lt!611378 (bvmul (bvxor lt!611377 (bvlshr lt!611377 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150355 (= lt!611377 ((_ extract 31 0) (bvand (bvxor (select (arr!45950 a!2901) j!112) (bvlshr (select (arr!45950 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150355 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!931802 (let ((h!33772 ((_ extract 31 0) (bvand (bvxor (select (arr!45950 a!2901) j!112) (bvlshr (select (arr!45950 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125221 (bvmul (bvxor h!33772 (bvlshr h!33772 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125221 (bvlshr x!125221 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!931802 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!931802 #b00000000000000000000000000000000))))))

(assert (=> d!150355 (= (toIndex!0 (select (arr!45950 a!2901) j!112) mask!2840) (bvand (bvxor lt!611378 (bvlshr lt!611378 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1391977 d!150355))

(declare-fun d!150357 () Bool)

(assert (=> d!150357 (= (validKeyInArray!0 (select (arr!45950 a!2901) j!112)) (and (not (= (select (arr!45950 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45950 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1391972 d!150357))

(declare-fun d!150359 () Bool)

(assert (=> d!150359 (= (validKeyInArray!0 (select (arr!45950 a!2901) i!1037)) (and (not (= (select (arr!45950 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45950 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1391978 d!150359))

(declare-fun b!1392227 () Bool)

(declare-fun e!788385 () Bool)

(declare-fun call!66761 () Bool)

(assert (=> b!1392227 (= e!788385 call!66761)))

(declare-fun b!1392228 () Bool)

(declare-fun e!788386 () Bool)

(assert (=> b!1392228 (= e!788386 e!788385)))

(declare-fun c!129640 () Bool)

(assert (=> b!1392228 (= c!129640 (validKeyInArray!0 (select (arr!45950 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1392229 () Bool)

(declare-fun e!788384 () Bool)

(declare-fun contains!9733 (List!32547 (_ BitVec 64)) Bool)

(assert (=> b!1392229 (= e!788384 (contains!9733 Nil!32544 (select (arr!45950 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!150361 () Bool)

(declare-fun res!931853 () Bool)

(declare-fun e!788387 () Bool)

(assert (=> d!150361 (=> res!931853 e!788387)))

(assert (=> d!150361 (= res!931853 (bvsge #b00000000000000000000000000000000 (size!46502 a!2901)))))

(assert (=> d!150361 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32544) e!788387)))

(declare-fun bm!66758 () Bool)

(assert (=> bm!66758 (= call!66761 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129640 (Cons!32543 (select (arr!45950 a!2901) #b00000000000000000000000000000000) Nil!32544) Nil!32544)))))

(declare-fun b!1392230 () Bool)

(assert (=> b!1392230 (= e!788387 e!788386)))

(declare-fun res!931854 () Bool)

(assert (=> b!1392230 (=> (not res!931854) (not e!788386))))

(assert (=> b!1392230 (= res!931854 (not e!788384))))

(declare-fun res!931855 () Bool)

(assert (=> b!1392230 (=> (not res!931855) (not e!788384))))

(assert (=> b!1392230 (= res!931855 (validKeyInArray!0 (select (arr!45950 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1392231 () Bool)

(assert (=> b!1392231 (= e!788385 call!66761)))

(assert (= (and d!150361 (not res!931853)) b!1392230))

(assert (= (and b!1392230 res!931855) b!1392229))

(assert (= (and b!1392230 res!931854) b!1392228))

(assert (= (and b!1392228 c!129640) b!1392227))

(assert (= (and b!1392228 (not c!129640)) b!1392231))

(assert (= (or b!1392227 b!1392231) bm!66758))

(assert (=> b!1392228 m!1277379))

(assert (=> b!1392228 m!1277379))

(assert (=> b!1392228 m!1277389))

(assert (=> b!1392229 m!1277379))

(assert (=> b!1392229 m!1277379))

(declare-fun m!1277493 () Bool)

(assert (=> b!1392229 m!1277493))

(assert (=> bm!66758 m!1277379))

(declare-fun m!1277495 () Bool)

(assert (=> bm!66758 m!1277495))

(assert (=> b!1392230 m!1277379))

(assert (=> b!1392230 m!1277379))

(assert (=> b!1392230 m!1277389))

(assert (=> b!1391976 d!150361))

(push 1)

(assert (not b!1392229))

(assert (not b!1392202))

(assert (not b!1392025))

(assert (not bm!66743))

(assert (not b!1392118))

(assert (not b!1392119))

(assert (not bm!66750))

(assert (not b!1392230))

(assert (not d!150335))

(assert (not b!1392228))

(assert (not b!1392024))

(assert (not bm!66758))

(assert (not b!1392089))

(assert (not d!150333))

(assert (not d!150311))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

