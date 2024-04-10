; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92792 () Bool)

(assert start!92792)

(declare-fun b!1054047 () Bool)

(declare-fun e!598744 () Bool)

(declare-fun e!598749 () Bool)

(assert (=> b!1054047 (= e!598744 e!598749)))

(declare-fun res!703035 () Bool)

(assert (=> b!1054047 (=> (not res!703035) (not e!598749))))

(declare-fun lt!465297 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1054047 (= res!703035 (not (= lt!465297 i!1381)))))

(declare-datatypes ((array!66485 0))(
  ( (array!66486 (arr!31976 (Array (_ BitVec 32) (_ BitVec 64))) (size!32512 (_ BitVec 32))) )
))
(declare-fun lt!465296 () array!66485)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66485 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054047 (= lt!465297 (arrayScanForKey!0 lt!465296 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1054048 () Bool)

(declare-fun e!598750 () Bool)

(declare-fun e!598748 () Bool)

(assert (=> b!1054048 (= e!598750 e!598748)))

(declare-fun res!703032 () Bool)

(assert (=> b!1054048 (=> res!703032 e!598748)))

(assert (=> b!1054048 (= res!703032 (bvsle lt!465297 i!1381))))

(declare-fun b!1054049 () Bool)

(declare-fun e!598747 () Bool)

(declare-fun a!3488 () array!66485)

(assert (=> b!1054049 (= e!598747 (or (bvslt lt!465297 #b00000000000000000000000000000000) (bvslt lt!465297 (size!32512 a!3488))))))

(declare-datatypes ((List!22288 0))(
  ( (Nil!22285) (Cons!22284 (h!23493 (_ BitVec 64)) (t!31595 List!22288)) )
))
(declare-fun arrayNoDuplicates!0 (array!66485 (_ BitVec 32) List!22288) Bool)

(assert (=> b!1054049 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22285)))

(declare-datatypes ((Unit!34510 0))(
  ( (Unit!34511) )
))
(declare-fun lt!465295 () Unit!34510)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66485 (_ BitVec 32) (_ BitVec 32)) Unit!34510)

(assert (=> b!1054049 (= lt!465295 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1054050 () Bool)

(assert (=> b!1054050 (= e!598749 (not e!598747))))

(declare-fun res!703036 () Bool)

(assert (=> b!1054050 (=> res!703036 e!598747)))

(assert (=> b!1054050 (= res!703036 (bvsle lt!465297 i!1381))))

(assert (=> b!1054050 e!598750))

(declare-fun res!703030 () Bool)

(assert (=> b!1054050 (=> (not res!703030) (not e!598750))))

(assert (=> b!1054050 (= res!703030 (= (select (store (arr!31976 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465297) k0!2747))))

(declare-fun b!1054051 () Bool)

(declare-fun res!703033 () Bool)

(declare-fun e!598746 () Bool)

(assert (=> b!1054051 (=> (not res!703033) (not e!598746))))

(assert (=> b!1054051 (= res!703033 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22285))))

(declare-fun b!1054052 () Bool)

(assert (=> b!1054052 (= e!598746 e!598744)))

(declare-fun res!703034 () Bool)

(assert (=> b!1054052 (=> (not res!703034) (not e!598744))))

(declare-fun arrayContainsKey!0 (array!66485 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054052 (= res!703034 (arrayContainsKey!0 lt!465296 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1054052 (= lt!465296 (array!66486 (store (arr!31976 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32512 a!3488)))))

(declare-fun b!1054053 () Bool)

(assert (=> b!1054053 (= e!598748 (arrayContainsKey!0 a!3488 k0!2747 lt!465297))))

(declare-fun res!703037 () Bool)

(assert (=> start!92792 (=> (not res!703037) (not e!598746))))

(assert (=> start!92792 (= res!703037 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32512 a!3488)) (bvslt (size!32512 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92792 e!598746))

(assert (=> start!92792 true))

(declare-fun array_inv!24756 (array!66485) Bool)

(assert (=> start!92792 (array_inv!24756 a!3488)))

(declare-fun b!1054054 () Bool)

(declare-fun res!703031 () Bool)

(assert (=> b!1054054 (=> (not res!703031) (not e!598746))))

(assert (=> b!1054054 (= res!703031 (= (select (arr!31976 a!3488) i!1381) k0!2747))))

(declare-fun b!1054055 () Bool)

(declare-fun res!703029 () Bool)

(assert (=> b!1054055 (=> (not res!703029) (not e!598746))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054055 (= res!703029 (validKeyInArray!0 k0!2747))))

(assert (= (and start!92792 res!703037) b!1054051))

(assert (= (and b!1054051 res!703033) b!1054055))

(assert (= (and b!1054055 res!703029) b!1054054))

(assert (= (and b!1054054 res!703031) b!1054052))

(assert (= (and b!1054052 res!703034) b!1054047))

(assert (= (and b!1054047 res!703035) b!1054050))

(assert (= (and b!1054050 res!703030) b!1054048))

(assert (= (and b!1054048 (not res!703032)) b!1054053))

(assert (= (and b!1054050 (not res!703036)) b!1054049))

(declare-fun m!974187 () Bool)

(assert (=> b!1054052 m!974187))

(declare-fun m!974189 () Bool)

(assert (=> b!1054052 m!974189))

(declare-fun m!974191 () Bool)

(assert (=> b!1054049 m!974191))

(declare-fun m!974193 () Bool)

(assert (=> b!1054049 m!974193))

(declare-fun m!974195 () Bool)

(assert (=> b!1054051 m!974195))

(declare-fun m!974197 () Bool)

(assert (=> b!1054055 m!974197))

(declare-fun m!974199 () Bool)

(assert (=> start!92792 m!974199))

(assert (=> b!1054050 m!974189))

(declare-fun m!974201 () Bool)

(assert (=> b!1054050 m!974201))

(declare-fun m!974203 () Bool)

(assert (=> b!1054054 m!974203))

(declare-fun m!974205 () Bool)

(assert (=> b!1054047 m!974205))

(declare-fun m!974207 () Bool)

(assert (=> b!1054053 m!974207))

(check-sat (not b!1054047) (not start!92792) (not b!1054055) (not b!1054049) (not b!1054052) (not b!1054053) (not b!1054051))
(check-sat)
(get-model)

(declare-fun b!1054093 () Bool)

(declare-fun e!598783 () Bool)

(declare-fun call!44761 () Bool)

(assert (=> b!1054093 (= e!598783 call!44761)))

(declare-fun b!1054094 () Bool)

(declare-fun e!598781 () Bool)

(assert (=> b!1054094 (= e!598781 e!598783)))

(declare-fun c!106971 () Bool)

(assert (=> b!1054094 (= c!106971 (validKeyInArray!0 (select (arr!31976 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1054095 () Bool)

(declare-fun e!598780 () Bool)

(declare-fun contains!6171 (List!22288 (_ BitVec 64)) Bool)

(assert (=> b!1054095 (= e!598780 (contains!6171 Nil!22285 (select (arr!31976 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1054096 () Bool)

(declare-fun e!598782 () Bool)

(assert (=> b!1054096 (= e!598782 e!598781)))

(declare-fun res!703073 () Bool)

(assert (=> b!1054096 (=> (not res!703073) (not e!598781))))

(assert (=> b!1054096 (= res!703073 (not e!598780))))

(declare-fun res!703071 () Bool)

(assert (=> b!1054096 (=> (not res!703071) (not e!598780))))

(assert (=> b!1054096 (= res!703071 (validKeyInArray!0 (select (arr!31976 a!3488) #b00000000000000000000000000000000)))))

(declare-fun bm!44758 () Bool)

(assert (=> bm!44758 (= call!44761 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106971 (Cons!22284 (select (arr!31976 a!3488) #b00000000000000000000000000000000) Nil!22285) Nil!22285)))))

(declare-fun d!127953 () Bool)

(declare-fun res!703072 () Bool)

(assert (=> d!127953 (=> res!703072 e!598782)))

(assert (=> d!127953 (= res!703072 (bvsge #b00000000000000000000000000000000 (size!32512 a!3488)))))

(assert (=> d!127953 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22285) e!598782)))

(declare-fun b!1054097 () Bool)

(assert (=> b!1054097 (= e!598783 call!44761)))

(assert (= (and d!127953 (not res!703072)) b!1054096))

(assert (= (and b!1054096 res!703071) b!1054095))

(assert (= (and b!1054096 res!703073) b!1054094))

(assert (= (and b!1054094 c!106971) b!1054097))

(assert (= (and b!1054094 (not c!106971)) b!1054093))

(assert (= (or b!1054097 b!1054093) bm!44758))

(declare-fun m!974231 () Bool)

(assert (=> b!1054094 m!974231))

(assert (=> b!1054094 m!974231))

(declare-fun m!974233 () Bool)

(assert (=> b!1054094 m!974233))

(assert (=> b!1054095 m!974231))

(assert (=> b!1054095 m!974231))

(declare-fun m!974235 () Bool)

(assert (=> b!1054095 m!974235))

(assert (=> b!1054096 m!974231))

(assert (=> b!1054096 m!974231))

(assert (=> b!1054096 m!974233))

(assert (=> bm!44758 m!974231))

(declare-fun m!974237 () Bool)

(assert (=> bm!44758 m!974237))

(assert (=> b!1054051 d!127953))

(declare-fun d!127955 () Bool)

(assert (=> d!127955 (= (array_inv!24756 a!3488) (bvsge (size!32512 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!92792 d!127955))

(declare-fun d!127957 () Bool)

(declare-fun res!703078 () Bool)

(declare-fun e!598788 () Bool)

(assert (=> d!127957 (=> res!703078 e!598788)))

(assert (=> d!127957 (= res!703078 (= (select (arr!31976 lt!465296) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!127957 (= (arrayContainsKey!0 lt!465296 k0!2747 #b00000000000000000000000000000000) e!598788)))

(declare-fun b!1054102 () Bool)

(declare-fun e!598789 () Bool)

(assert (=> b!1054102 (= e!598788 e!598789)))

(declare-fun res!703079 () Bool)

(assert (=> b!1054102 (=> (not res!703079) (not e!598789))))

(assert (=> b!1054102 (= res!703079 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32512 lt!465296)))))

(declare-fun b!1054103 () Bool)

(assert (=> b!1054103 (= e!598789 (arrayContainsKey!0 lt!465296 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127957 (not res!703078)) b!1054102))

(assert (= (and b!1054102 res!703079) b!1054103))

(declare-fun m!974239 () Bool)

(assert (=> d!127957 m!974239))

(declare-fun m!974241 () Bool)

(assert (=> b!1054103 m!974241))

(assert (=> b!1054052 d!127957))

(declare-fun d!127963 () Bool)

(declare-fun lt!465309 () (_ BitVec 32))

(assert (=> d!127963 (and (or (bvslt lt!465309 #b00000000000000000000000000000000) (bvsge lt!465309 (size!32512 lt!465296)) (and (bvsge lt!465309 #b00000000000000000000000000000000) (bvslt lt!465309 (size!32512 lt!465296)))) (bvsge lt!465309 #b00000000000000000000000000000000) (bvslt lt!465309 (size!32512 lt!465296)) (= (select (arr!31976 lt!465296) lt!465309) k0!2747))))

(declare-fun e!598810 () (_ BitVec 32))

(assert (=> d!127963 (= lt!465309 e!598810)))

(declare-fun c!106977 () Bool)

(assert (=> d!127963 (= c!106977 (= (select (arr!31976 lt!465296) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!127963 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32512 lt!465296)) (bvslt (size!32512 lt!465296) #b01111111111111111111111111111111))))

(assert (=> d!127963 (= (arrayScanForKey!0 lt!465296 k0!2747 #b00000000000000000000000000000000) lt!465309)))

(declare-fun b!1054129 () Bool)

(assert (=> b!1054129 (= e!598810 #b00000000000000000000000000000000)))

(declare-fun b!1054130 () Bool)

(assert (=> b!1054130 (= e!598810 (arrayScanForKey!0 lt!465296 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127963 c!106977) b!1054129))

(assert (= (and d!127963 (not c!106977)) b!1054130))

(declare-fun m!974247 () Bool)

(assert (=> d!127963 m!974247))

(assert (=> d!127963 m!974239))

(declare-fun m!974249 () Bool)

(assert (=> b!1054130 m!974249))

(assert (=> b!1054047 d!127963))

(declare-fun d!127969 () Bool)

(declare-fun res!703095 () Bool)

(declare-fun e!598811 () Bool)

(assert (=> d!127969 (=> res!703095 e!598811)))

(assert (=> d!127969 (= res!703095 (= (select (arr!31976 a!3488) lt!465297) k0!2747))))

(assert (=> d!127969 (= (arrayContainsKey!0 a!3488 k0!2747 lt!465297) e!598811)))

(declare-fun b!1054131 () Bool)

(declare-fun e!598812 () Bool)

(assert (=> b!1054131 (= e!598811 e!598812)))

(declare-fun res!703096 () Bool)

(assert (=> b!1054131 (=> (not res!703096) (not e!598812))))

(assert (=> b!1054131 (= res!703096 (bvslt (bvadd lt!465297 #b00000000000000000000000000000001) (size!32512 a!3488)))))

(declare-fun b!1054132 () Bool)

(assert (=> b!1054132 (= e!598812 (arrayContainsKey!0 a!3488 k0!2747 (bvadd lt!465297 #b00000000000000000000000000000001)))))

(assert (= (and d!127969 (not res!703095)) b!1054131))

(assert (= (and b!1054131 res!703096) b!1054132))

(declare-fun m!974257 () Bool)

(assert (=> d!127969 m!974257))

(declare-fun m!974259 () Bool)

(assert (=> b!1054132 m!974259))

(assert (=> b!1054053 d!127969))

(declare-fun b!1054133 () Bool)

(declare-fun e!598816 () Bool)

(declare-fun call!44765 () Bool)

(assert (=> b!1054133 (= e!598816 call!44765)))

(declare-fun b!1054134 () Bool)

(declare-fun e!598814 () Bool)

(assert (=> b!1054134 (= e!598814 e!598816)))

(declare-fun c!106978 () Bool)

(assert (=> b!1054134 (= c!106978 (validKeyInArray!0 (select (arr!31976 a!3488) i!1381)))))

(declare-fun b!1054135 () Bool)

(declare-fun e!598813 () Bool)

(assert (=> b!1054135 (= e!598813 (contains!6171 Nil!22285 (select (arr!31976 a!3488) i!1381)))))

(declare-fun b!1054136 () Bool)

(declare-fun e!598815 () Bool)

(assert (=> b!1054136 (= e!598815 e!598814)))

(declare-fun res!703099 () Bool)

(assert (=> b!1054136 (=> (not res!703099) (not e!598814))))

(assert (=> b!1054136 (= res!703099 (not e!598813))))

(declare-fun res!703097 () Bool)

(assert (=> b!1054136 (=> (not res!703097) (not e!598813))))

(assert (=> b!1054136 (= res!703097 (validKeyInArray!0 (select (arr!31976 a!3488) i!1381)))))

(declare-fun bm!44762 () Bool)

(assert (=> bm!44762 (= call!44765 (arrayNoDuplicates!0 a!3488 (bvadd i!1381 #b00000000000000000000000000000001) (ite c!106978 (Cons!22284 (select (arr!31976 a!3488) i!1381) Nil!22285) Nil!22285)))))

(declare-fun d!127971 () Bool)

(declare-fun res!703098 () Bool)

(assert (=> d!127971 (=> res!703098 e!598815)))

(assert (=> d!127971 (= res!703098 (bvsge i!1381 (size!32512 a!3488)))))

(assert (=> d!127971 (= (arrayNoDuplicates!0 a!3488 i!1381 Nil!22285) e!598815)))

(declare-fun b!1054137 () Bool)

(assert (=> b!1054137 (= e!598816 call!44765)))

(assert (= (and d!127971 (not res!703098)) b!1054136))

(assert (= (and b!1054136 res!703097) b!1054135))

(assert (= (and b!1054136 res!703099) b!1054134))

(assert (= (and b!1054134 c!106978) b!1054137))

(assert (= (and b!1054134 (not c!106978)) b!1054133))

(assert (= (or b!1054137 b!1054133) bm!44762))

(assert (=> b!1054134 m!974203))

(assert (=> b!1054134 m!974203))

(declare-fun m!974261 () Bool)

(assert (=> b!1054134 m!974261))

(assert (=> b!1054135 m!974203))

(assert (=> b!1054135 m!974203))

(declare-fun m!974263 () Bool)

(assert (=> b!1054135 m!974263))

(assert (=> b!1054136 m!974203))

(assert (=> b!1054136 m!974203))

(assert (=> b!1054136 m!974261))

(assert (=> bm!44762 m!974203))

(declare-fun m!974265 () Bool)

(assert (=> bm!44762 m!974265))

(assert (=> b!1054049 d!127971))

(declare-fun d!127975 () Bool)

(assert (=> d!127975 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22285)))

(declare-fun lt!465315 () Unit!34510)

(declare-fun choose!39 (array!66485 (_ BitVec 32) (_ BitVec 32)) Unit!34510)

(assert (=> d!127975 (= lt!465315 (choose!39 a!3488 #b00000000000000000000000000000000 i!1381))))

(assert (=> d!127975 (bvslt (size!32512 a!3488) #b01111111111111111111111111111111)))

(assert (=> d!127975 (= (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381) lt!465315)))

(declare-fun bs!30887 () Bool)

(assert (= bs!30887 d!127975))

(assert (=> bs!30887 m!974191))

(declare-fun m!974269 () Bool)

(assert (=> bs!30887 m!974269))

(assert (=> b!1054049 d!127975))

(declare-fun d!127979 () Bool)

(assert (=> d!127979 (= (validKeyInArray!0 k0!2747) (and (not (= k0!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1054055 d!127979))

(check-sat (not b!1054094) (not b!1054130) (not b!1054134) (not bm!44758) (not b!1054095) (not d!127975) (not b!1054103) (not b!1054096) (not b!1054135) (not bm!44762) (not b!1054132) (not b!1054136))
(check-sat)
