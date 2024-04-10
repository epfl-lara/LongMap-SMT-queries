; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119050 () Bool)

(assert start!119050)

(declare-fun b!1389298 () Bool)

(declare-fun res!929495 () Bool)

(declare-fun e!786959 () Bool)

(assert (=> b!1389298 (=> (not res!929495) (not e!786959))))

(declare-datatypes ((array!95020 0))(
  ( (array!95021 (arr!45877 (Array (_ BitVec 32) (_ BitVec 64))) (size!46427 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95020)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389298 (= res!929495 (validKeyInArray!0 (select (arr!45877 a!2901) i!1037)))))

(declare-fun b!1389300 () Bool)

(declare-fun res!929497 () Bool)

(assert (=> b!1389300 (=> (not res!929497) (not e!786959))))

(declare-datatypes ((List!32396 0))(
  ( (Nil!32393) (Cons!32392 (h!33607 (_ BitVec 64)) (t!47090 List!32396)) )
))
(declare-fun arrayNoDuplicates!0 (array!95020 (_ BitVec 32) List!32396) Bool)

(assert (=> b!1389300 (= res!929497 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32393))))

(declare-fun b!1389301 () Bool)

(declare-fun res!929493 () Bool)

(assert (=> b!1389301 (=> (not res!929493) (not e!786959))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95020 (_ BitVec 32)) Bool)

(assert (=> b!1389301 (= res!929493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389302 () Bool)

(declare-fun res!929494 () Bool)

(assert (=> b!1389302 (=> (not res!929494) (not e!786959))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1389302 (= res!929494 (and (= (size!46427 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46427 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46427 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389303 () Bool)

(declare-fun res!929496 () Bool)

(assert (=> b!1389303 (=> (not res!929496) (not e!786959))))

(assert (=> b!1389303 (= res!929496 (validKeyInArray!0 (select (arr!45877 a!2901) j!112)))))

(declare-fun res!929492 () Bool)

(assert (=> start!119050 (=> (not res!929492) (not e!786959))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119050 (= res!929492 (validMask!0 mask!2840))))

(assert (=> start!119050 e!786959))

(assert (=> start!119050 true))

(declare-fun array_inv!34905 (array!95020) Bool)

(assert (=> start!119050 (array_inv!34905 a!2901)))

(declare-fun b!1389299 () Bool)

(declare-fun lt!610512 () (_ BitVec 32))

(assert (=> b!1389299 (= e!786959 (and (bvsge mask!2840 #b00000000000000000000000000000000) (or (bvslt lt!610512 #b00000000000000000000000000000000) (bvsge lt!610512 (bvadd #b00000000000000000000000000000001 mask!2840)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389299 (= lt!610512 (toIndex!0 (select (arr!45877 a!2901) j!112) mask!2840))))

(assert (= (and start!119050 res!929492) b!1389302))

(assert (= (and b!1389302 res!929494) b!1389298))

(assert (= (and b!1389298 res!929495) b!1389303))

(assert (= (and b!1389303 res!929496) b!1389301))

(assert (= (and b!1389301 res!929493) b!1389300))

(assert (= (and b!1389300 res!929497) b!1389299))

(declare-fun m!1274973 () Bool)

(assert (=> b!1389299 m!1274973))

(assert (=> b!1389299 m!1274973))

(declare-fun m!1274975 () Bool)

(assert (=> b!1389299 m!1274975))

(declare-fun m!1274977 () Bool)

(assert (=> start!119050 m!1274977))

(declare-fun m!1274979 () Bool)

(assert (=> start!119050 m!1274979))

(declare-fun m!1274981 () Bool)

(assert (=> b!1389298 m!1274981))

(assert (=> b!1389298 m!1274981))

(declare-fun m!1274983 () Bool)

(assert (=> b!1389298 m!1274983))

(assert (=> b!1389303 m!1274973))

(assert (=> b!1389303 m!1274973))

(declare-fun m!1274985 () Bool)

(assert (=> b!1389303 m!1274985))

(declare-fun m!1274987 () Bool)

(assert (=> b!1389301 m!1274987))

(declare-fun m!1274989 () Bool)

(assert (=> b!1389300 m!1274989))

(push 1)

(assert (not b!1389298))

(assert (not start!119050))

(assert (not b!1389300))

(assert (not b!1389301))

(assert (not b!1389299))

(assert (not b!1389303))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!150123 () Bool)

(declare-fun res!929511 () Bool)

(declare-fun e!786977 () Bool)

(assert (=> d!150123 (=> res!929511 e!786977)))

(assert (=> d!150123 (= res!929511 (bvsge #b00000000000000000000000000000000 (size!46427 a!2901)))))

(assert (=> d!150123 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32393) e!786977)))

(declare-fun b!1389322 () Bool)

(declare-fun e!786974 () Bool)

(declare-fun call!66684 () Bool)

(assert (=> b!1389322 (= e!786974 call!66684)))

(declare-fun b!1389323 () Bool)

(assert (=> b!1389323 (= e!786974 call!66684)))

(declare-fun b!1389324 () Bool)

(declare-fun e!786976 () Bool)

(declare-fun contains!9759 (List!32396 (_ BitVec 64)) Bool)

(assert (=> b!1389324 (= e!786976 (contains!9759 Nil!32393 (select (arr!45877 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1389325 () Bool)

(declare-fun e!786975 () Bool)

(assert (=> b!1389325 (= e!786975 e!786974)))

(declare-fun c!129350 () Bool)

(assert (=> b!1389325 (= c!129350 (validKeyInArray!0 (select (arr!45877 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66681 () Bool)

(assert (=> bm!66681 (= call!66684 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129350 (Cons!32392 (select (arr!45877 a!2901) #b00000000000000000000000000000000) Nil!32393) Nil!32393)))))

(declare-fun b!1389326 () Bool)

(assert (=> b!1389326 (= e!786977 e!786975)))

(declare-fun res!929510 () Bool)

(assert (=> b!1389326 (=> (not res!929510) (not e!786975))))

(assert (=> b!1389326 (= res!929510 (not e!786976))))

(declare-fun res!929509 () Bool)

(assert (=> b!1389326 (=> (not res!929509) (not e!786976))))

(assert (=> b!1389326 (= res!929509 (validKeyInArray!0 (select (arr!45877 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!150123 (not res!929511)) b!1389326))

(assert (= (and b!1389326 res!929509) b!1389324))

(assert (= (and b!1389326 res!929510) b!1389325))

(assert (= (and b!1389325 c!129350) b!1389322))

(assert (= (and b!1389325 (not c!129350)) b!1389323))

(assert (= (or b!1389322 b!1389323) bm!66681))

(declare-fun m!1274991 () Bool)

(assert (=> b!1389324 m!1274991))

(assert (=> b!1389324 m!1274991))

(declare-fun m!1274993 () Bool)

(assert (=> b!1389324 m!1274993))

(assert (=> b!1389325 m!1274991))

(assert (=> b!1389325 m!1274991))

(declare-fun m!1274995 () Bool)

(assert (=> b!1389325 m!1274995))

(assert (=> bm!66681 m!1274991))

(declare-fun m!1274997 () Bool)

(assert (=> bm!66681 m!1274997))

(assert (=> b!1389326 m!1274991))

(assert (=> b!1389326 m!1274991))

(assert (=> b!1389326 m!1274995))

(assert (=> b!1389300 d!150123))

(declare-fun d!150133 () Bool)

(assert (=> d!150133 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!119050 d!150133))

(declare-fun d!150139 () Bool)

(assert (=> d!150139 (= (array_inv!34905 a!2901) (bvsge (size!46427 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!119050 d!150139))

(declare-fun b!1389366 () Bool)

(declare-fun e!787008 () Bool)

(declare-fun call!66694 () Bool)

(assert (=> b!1389366 (= e!787008 call!66694)))

(declare-fun b!1389367 () Bool)

(declare-fun e!787010 () Bool)

(assert (=> b!1389367 (= e!787010 call!66694)))

(declare-fun d!150141 () Bool)

(declare-fun res!929535 () Bool)

(declare-fun e!787009 () Bool)

(assert (=> d!150141 (=> res!929535 e!787009)))

(assert (=> d!150141 (= res!929535 (bvsge #b00000000000000000000000000000000 (size!46427 a!2901)))))

(assert (=> d!150141 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!787009)))

(declare-fun b!1389368 () Bool)

(assert (=> b!1389368 (= e!787009 e!787010)))

(declare-fun c!129360 () Bool)

(assert (=> b!1389368 (= c!129360 (validKeyInArray!0 (select (arr!45877 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1389369 () Bool)

(assert (=> b!1389369 (= e!787010 e!787008)))

(declare-fun lt!610549 () (_ BitVec 64))

(assert (=> b!1389369 (= lt!610549 (select (arr!45877 a!2901) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!46434 0))(
  ( (Unit!46435) )
))
(declare-fun lt!610551 () Unit!46434)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95020 (_ BitVec 64) (_ BitVec 32)) Unit!46434)

(assert (=> b!1389369 (= lt!610551 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!610549 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!95020 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1389369 (arrayContainsKey!0 a!2901 lt!610549 #b00000000000000000000000000000000)))

(declare-fun lt!610550 () Unit!46434)

(assert (=> b!1389369 (= lt!610550 lt!610551)))

(declare-fun res!929534 () Bool)

(declare-datatypes ((SeekEntryResult!10200 0))(
  ( (MissingZero!10200 (index!43171 (_ BitVec 32))) (Found!10200 (index!43172 (_ BitVec 32))) (Intermediate!10200 (undefined!11012 Bool) (index!43173 (_ BitVec 32)) (x!124846 (_ BitVec 32))) (Undefined!10200) (MissingVacant!10200 (index!43174 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95020 (_ BitVec 32)) SeekEntryResult!10200)

(assert (=> b!1389369 (= res!929534 (= (seekEntryOrOpen!0 (select (arr!45877 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10200 #b00000000000000000000000000000000)))))

(assert (=> b!1389369 (=> (not res!929534) (not e!787008))))

(declare-fun bm!66691 () Bool)

(assert (=> bm!66691 (= call!66694 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(assert (= (and d!150141 (not res!929535)) b!1389368))

(assert (= (and b!1389368 c!129360) b!1389369))

(assert (= (and b!1389368 (not c!129360)) b!1389367))

(assert (= (and b!1389369 res!929534) b!1389366))

(assert (= (or b!1389366 b!1389367) bm!66691))

(assert (=> b!1389368 m!1274991))

(assert (=> b!1389368 m!1274991))

(assert (=> b!1389368 m!1274995))

(assert (=> b!1389369 m!1274991))

(declare-fun m!1275027 () Bool)

(assert (=> b!1389369 m!1275027))

(declare-fun m!1275029 () Bool)

(assert (=> b!1389369 m!1275029))

(assert (=> b!1389369 m!1274991))

(declare-fun m!1275031 () Bool)

(assert (=> b!1389369 m!1275031))

(declare-fun m!1275033 () Bool)

(assert (=> bm!66691 m!1275033))

(assert (=> b!1389301 d!150141))

(declare-fun d!150149 () Bool)

(declare-fun lt!610557 () (_ BitVec 32))

(declare-fun lt!610556 () (_ BitVec 32))

(assert (=> d!150149 (= lt!610557 (bvmul (bvxor lt!610556 (bvlshr lt!610556 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150149 (= lt!610556 ((_ extract 31 0) (bvand (bvxor (select (arr!45877 a!2901) j!112) (bvlshr (select (arr!45877 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150149 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!929542 (let ((h!33610 ((_ extract 31 0) (bvand (bvxor (select (arr!45877 a!2901) j!112) (bvlshr (select (arr!45877 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!124843 (bvmul (bvxor h!33610 (bvlshr h!33610 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!124843 (bvlshr x!124843 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!929542 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!929542 #b00000000000000000000000000000000))))))

(assert (=> d!150149 (= (toIndex!0 (select (arr!45877 a!2901) j!112) mask!2840) (bvand (bvxor lt!610557 (bvlshr lt!610557 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1389299 d!150149))

(declare-fun d!150153 () Bool)

(assert (=> d!150153 (= (validKeyInArray!0 (select (arr!45877 a!2901) j!112)) (and (not (= (select (arr!45877 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45877 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1389303 d!150153))

(declare-fun d!150155 () Bool)

(assert (=> d!150155 (= (validKeyInArray!0 (select (arr!45877 a!2901) i!1037)) (and (not (= (select (arr!45877 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45877 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1389298 d!150155))

(push 1)

(assert (not b!1389326))

(assert (not b!1389325))

(assert (not bm!66691))

(assert (not b!1389324))

(assert (not b!1389369))

(assert (not b!1389368))

(assert (not bm!66681))

(check-sat)

