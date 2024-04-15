; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93250 () Bool)

(assert start!93250)

(declare-fun b!1057169 () Bool)

(declare-fun e!601193 () Bool)

(declare-fun e!601191 () Bool)

(assert (=> b!1057169 (= e!601193 (not e!601191))))

(declare-fun res!705955 () Bool)

(assert (=> b!1057169 (=> res!705955 e!601191)))

(declare-fun lt!466213 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1057169 (= res!705955 (or (bvsgt lt!466213 i!1381) (bvsle i!1381 lt!466213)))))

(declare-fun e!601188 () Bool)

(assert (=> b!1057169 e!601188))

(declare-fun res!705957 () Bool)

(assert (=> b!1057169 (=> (not res!705957) (not e!601188))))

(declare-datatypes ((array!66629 0))(
  ( (array!66630 (arr!32037 (Array (_ BitVec 32) (_ BitVec 64))) (size!32575 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66629)

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1057169 (= res!705957 (= (select (store (arr!32037 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466213) k0!2747))))

(declare-fun b!1057170 () Bool)

(declare-fun e!601194 () Bool)

(assert (=> b!1057170 (= e!601188 e!601194)))

(declare-fun res!705954 () Bool)

(assert (=> b!1057170 (=> res!705954 e!601194)))

(assert (=> b!1057170 (= res!705954 (or (bvsgt lt!466213 i!1381) (bvsle i!1381 lt!466213)))))

(declare-fun b!1057171 () Bool)

(assert (=> b!1057171 (= e!601191 (bvsge lt!466213 #b00000000000000000000000000000000))))

(declare-fun lt!466211 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66629 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1057171 (arrayContainsKey!0 a!3488 k0!2747 lt!466211)))

(declare-datatypes ((Unit!34529 0))(
  ( (Unit!34530) )
))
(declare-fun lt!466209 () Unit!34529)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66629 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34529)

(assert (=> b!1057171 (= lt!466209 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!466211))))

(assert (=> b!1057171 (= lt!466211 (bvadd #b00000000000000000000000000000001 lt!466213))))

(declare-datatypes ((List!22408 0))(
  ( (Nil!22405) (Cons!22404 (h!23613 (_ BitVec 64)) (t!31706 List!22408)) )
))
(declare-fun arrayNoDuplicates!0 (array!66629 (_ BitVec 32) List!22408) Bool)

(assert (=> b!1057171 (arrayNoDuplicates!0 a!3488 lt!466213 Nil!22405)))

(declare-fun lt!466210 () Unit!34529)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66629 (_ BitVec 32) (_ BitVec 32)) Unit!34529)

(assert (=> b!1057171 (= lt!466210 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466213))))

(declare-fun res!705958 () Bool)

(declare-fun e!601192 () Bool)

(assert (=> start!93250 (=> (not res!705958) (not e!601192))))

(assert (=> start!93250 (= res!705958 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32575 a!3488)) (bvslt (size!32575 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93250 e!601192))

(assert (=> start!93250 true))

(declare-fun array_inv!24820 (array!66629) Bool)

(assert (=> start!93250 (array_inv!24820 a!3488)))

(declare-fun b!1057172 () Bool)

(assert (=> b!1057172 (= e!601194 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1057173 () Bool)

(declare-fun e!601189 () Bool)

(assert (=> b!1057173 (= e!601189 e!601193)))

(declare-fun res!705959 () Bool)

(assert (=> b!1057173 (=> (not res!705959) (not e!601193))))

(assert (=> b!1057173 (= res!705959 (not (= lt!466213 i!1381)))))

(declare-fun lt!466212 () array!66629)

(declare-fun arrayScanForKey!0 (array!66629 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1057173 (= lt!466213 (arrayScanForKey!0 lt!466212 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1057174 () Bool)

(declare-fun res!705953 () Bool)

(assert (=> b!1057174 (=> (not res!705953) (not e!601192))))

(assert (=> b!1057174 (= res!705953 (= (select (arr!32037 a!3488) i!1381) k0!2747))))

(declare-fun b!1057175 () Bool)

(declare-fun res!705961 () Bool)

(assert (=> b!1057175 (=> (not res!705961) (not e!601192))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1057175 (= res!705961 (validKeyInArray!0 k0!2747))))

(declare-fun b!1057176 () Bool)

(assert (=> b!1057176 (= e!601192 e!601189)))

(declare-fun res!705960 () Bool)

(assert (=> b!1057176 (=> (not res!705960) (not e!601189))))

(assert (=> b!1057176 (= res!705960 (arrayContainsKey!0 lt!466212 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1057176 (= lt!466212 (array!66630 (store (arr!32037 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32575 a!3488)))))

(declare-fun b!1057177 () Bool)

(declare-fun res!705956 () Bool)

(assert (=> b!1057177 (=> (not res!705956) (not e!601192))))

(assert (=> b!1057177 (= res!705956 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22405))))

(assert (= (and start!93250 res!705958) b!1057177))

(assert (= (and b!1057177 res!705956) b!1057175))

(assert (= (and b!1057175 res!705961) b!1057174))

(assert (= (and b!1057174 res!705953) b!1057176))

(assert (= (and b!1057176 res!705960) b!1057173))

(assert (= (and b!1057173 res!705959) b!1057169))

(assert (= (and b!1057169 res!705957) b!1057170))

(assert (= (and b!1057170 (not res!705954)) b!1057172))

(assert (= (and b!1057169 (not res!705955)) b!1057171))

(declare-fun m!976397 () Bool)

(assert (=> start!93250 m!976397))

(declare-fun m!976399 () Bool)

(assert (=> b!1057177 m!976399))

(declare-fun m!976401 () Bool)

(assert (=> b!1057173 m!976401))

(declare-fun m!976403 () Bool)

(assert (=> b!1057169 m!976403))

(declare-fun m!976405 () Bool)

(assert (=> b!1057169 m!976405))

(declare-fun m!976407 () Bool)

(assert (=> b!1057175 m!976407))

(declare-fun m!976409 () Bool)

(assert (=> b!1057174 m!976409))

(declare-fun m!976411 () Bool)

(assert (=> b!1057176 m!976411))

(assert (=> b!1057176 m!976403))

(declare-fun m!976413 () Bool)

(assert (=> b!1057172 m!976413))

(declare-fun m!976415 () Bool)

(assert (=> b!1057171 m!976415))

(declare-fun m!976417 () Bool)

(assert (=> b!1057171 m!976417))

(declare-fun m!976419 () Bool)

(assert (=> b!1057171 m!976419))

(declare-fun m!976421 () Bool)

(assert (=> b!1057171 m!976421))

(check-sat (not b!1057177) (not b!1057176) (not b!1057171) (not b!1057173) (not b!1057172) (not start!93250) (not b!1057175))
(check-sat)
(get-model)

(declare-fun d!128237 () Bool)

(assert (=> d!128237 (= (array_inv!24820 a!3488) (bvsge (size!32575 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!93250 d!128237))

(declare-fun d!128239 () Bool)

(declare-fun res!706020 () Bool)

(declare-fun e!601241 () Bool)

(assert (=> d!128239 (=> res!706020 e!601241)))

(assert (=> d!128239 (= res!706020 (= (select (arr!32037 a!3488) i!1381) k0!2747))))

(assert (=> d!128239 (= (arrayContainsKey!0 a!3488 k0!2747 i!1381) e!601241)))

(declare-fun b!1057236 () Bool)

(declare-fun e!601242 () Bool)

(assert (=> b!1057236 (= e!601241 e!601242)))

(declare-fun res!706021 () Bool)

(assert (=> b!1057236 (=> (not res!706021) (not e!601242))))

(assert (=> b!1057236 (= res!706021 (bvslt (bvadd i!1381 #b00000000000000000000000000000001) (size!32575 a!3488)))))

(declare-fun b!1057237 () Bool)

(assert (=> b!1057237 (= e!601242 (arrayContainsKey!0 a!3488 k0!2747 (bvadd i!1381 #b00000000000000000000000000000001)))))

(assert (= (and d!128239 (not res!706020)) b!1057236))

(assert (= (and b!1057236 res!706021) b!1057237))

(assert (=> d!128239 m!976409))

(declare-fun m!976475 () Bool)

(assert (=> b!1057237 m!976475))

(assert (=> b!1057172 d!128239))

(declare-fun bm!44813 () Bool)

(declare-fun call!44816 () Bool)

(declare-fun c!107073 () Bool)

(assert (=> bm!44813 (= call!44816 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107073 (Cons!22404 (select (arr!32037 a!3488) #b00000000000000000000000000000000) Nil!22405) Nil!22405)))))

(declare-fun b!1057249 () Bool)

(declare-fun e!601252 () Bool)

(declare-fun e!601251 () Bool)

(assert (=> b!1057249 (= e!601252 e!601251)))

(declare-fun res!706030 () Bool)

(assert (=> b!1057249 (=> (not res!706030) (not e!601251))))

(declare-fun e!601254 () Bool)

(assert (=> b!1057249 (= res!706030 (not e!601254))))

(declare-fun res!706029 () Bool)

(assert (=> b!1057249 (=> (not res!706029) (not e!601254))))

(assert (=> b!1057249 (= res!706029 (validKeyInArray!0 (select (arr!32037 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1057250 () Bool)

(declare-fun e!601253 () Bool)

(assert (=> b!1057250 (= e!601253 call!44816)))

(declare-fun b!1057251 () Bool)

(assert (=> b!1057251 (= e!601251 e!601253)))

(assert (=> b!1057251 (= c!107073 (validKeyInArray!0 (select (arr!32037 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1057252 () Bool)

(declare-fun contains!6166 (List!22408 (_ BitVec 64)) Bool)

(assert (=> b!1057252 (= e!601254 (contains!6166 Nil!22405 (select (arr!32037 a!3488) #b00000000000000000000000000000000)))))

(declare-fun d!128241 () Bool)

(declare-fun res!706028 () Bool)

(assert (=> d!128241 (=> res!706028 e!601252)))

(assert (=> d!128241 (= res!706028 (bvsge #b00000000000000000000000000000000 (size!32575 a!3488)))))

(assert (=> d!128241 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22405) e!601252)))

(declare-fun b!1057248 () Bool)

(assert (=> b!1057248 (= e!601253 call!44816)))

(assert (= (and d!128241 (not res!706028)) b!1057249))

(assert (= (and b!1057249 res!706029) b!1057252))

(assert (= (and b!1057249 res!706030) b!1057251))

(assert (= (and b!1057251 c!107073) b!1057250))

(assert (= (and b!1057251 (not c!107073)) b!1057248))

(assert (= (or b!1057250 b!1057248) bm!44813))

(declare-fun m!976477 () Bool)

(assert (=> bm!44813 m!976477))

(declare-fun m!976479 () Bool)

(assert (=> bm!44813 m!976479))

(assert (=> b!1057249 m!976477))

(assert (=> b!1057249 m!976477))

(declare-fun m!976481 () Bool)

(assert (=> b!1057249 m!976481))

(assert (=> b!1057251 m!976477))

(assert (=> b!1057251 m!976477))

(assert (=> b!1057251 m!976481))

(assert (=> b!1057252 m!976477))

(assert (=> b!1057252 m!976477))

(declare-fun m!976483 () Bool)

(assert (=> b!1057252 m!976483))

(assert (=> b!1057177 d!128241))

(declare-fun d!128243 () Bool)

(declare-fun res!706031 () Bool)

(declare-fun e!601255 () Bool)

(assert (=> d!128243 (=> res!706031 e!601255)))

(assert (=> d!128243 (= res!706031 (= (select (arr!32037 a!3488) lt!466211) k0!2747))))

(assert (=> d!128243 (= (arrayContainsKey!0 a!3488 k0!2747 lt!466211) e!601255)))

(declare-fun b!1057253 () Bool)

(declare-fun e!601256 () Bool)

(assert (=> b!1057253 (= e!601255 e!601256)))

(declare-fun res!706032 () Bool)

(assert (=> b!1057253 (=> (not res!706032) (not e!601256))))

(assert (=> b!1057253 (= res!706032 (bvslt (bvadd lt!466211 #b00000000000000000000000000000001) (size!32575 a!3488)))))

(declare-fun b!1057254 () Bool)

(assert (=> b!1057254 (= e!601256 (arrayContainsKey!0 a!3488 k0!2747 (bvadd lt!466211 #b00000000000000000000000000000001)))))

(assert (= (and d!128243 (not res!706031)) b!1057253))

(assert (= (and b!1057253 res!706032) b!1057254))

(declare-fun m!976485 () Bool)

(assert (=> d!128243 m!976485))

(declare-fun m!976487 () Bool)

(assert (=> b!1057254 m!976487))

(assert (=> b!1057171 d!128243))

(declare-fun d!128245 () Bool)

(assert (=> d!128245 (arrayContainsKey!0 a!3488 k0!2747 lt!466211)))

(declare-fun lt!466246 () Unit!34529)

(declare-fun choose!114 (array!66629 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34529)

(assert (=> d!128245 (= lt!466246 (choose!114 a!3488 k0!2747 i!1381 lt!466211))))

(assert (=> d!128245 (bvsge i!1381 #b00000000000000000000000000000000)))

(assert (=> d!128245 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!466211) lt!466246)))

(declare-fun bs!30974 () Bool)

(assert (= bs!30974 d!128245))

(assert (=> bs!30974 m!976415))

(declare-fun m!976489 () Bool)

(assert (=> bs!30974 m!976489))

(assert (=> b!1057171 d!128245))

(declare-fun bm!44814 () Bool)

(declare-fun call!44817 () Bool)

(declare-fun c!107074 () Bool)

(assert (=> bm!44814 (= call!44817 (arrayNoDuplicates!0 a!3488 (bvadd lt!466213 #b00000000000000000000000000000001) (ite c!107074 (Cons!22404 (select (arr!32037 a!3488) lt!466213) Nil!22405) Nil!22405)))))

(declare-fun b!1057256 () Bool)

(declare-fun e!601258 () Bool)

(declare-fun e!601257 () Bool)

(assert (=> b!1057256 (= e!601258 e!601257)))

(declare-fun res!706035 () Bool)

(assert (=> b!1057256 (=> (not res!706035) (not e!601257))))

(declare-fun e!601260 () Bool)

(assert (=> b!1057256 (= res!706035 (not e!601260))))

(declare-fun res!706034 () Bool)

(assert (=> b!1057256 (=> (not res!706034) (not e!601260))))

(assert (=> b!1057256 (= res!706034 (validKeyInArray!0 (select (arr!32037 a!3488) lt!466213)))))

(declare-fun b!1057257 () Bool)

(declare-fun e!601259 () Bool)

(assert (=> b!1057257 (= e!601259 call!44817)))

(declare-fun b!1057258 () Bool)

(assert (=> b!1057258 (= e!601257 e!601259)))

(assert (=> b!1057258 (= c!107074 (validKeyInArray!0 (select (arr!32037 a!3488) lt!466213)))))

(declare-fun b!1057259 () Bool)

(assert (=> b!1057259 (= e!601260 (contains!6166 Nil!22405 (select (arr!32037 a!3488) lt!466213)))))

(declare-fun d!128249 () Bool)

(declare-fun res!706033 () Bool)

(assert (=> d!128249 (=> res!706033 e!601258)))

(assert (=> d!128249 (= res!706033 (bvsge lt!466213 (size!32575 a!3488)))))

(assert (=> d!128249 (= (arrayNoDuplicates!0 a!3488 lt!466213 Nil!22405) e!601258)))

(declare-fun b!1057255 () Bool)

(assert (=> b!1057255 (= e!601259 call!44817)))

(assert (= (and d!128249 (not res!706033)) b!1057256))

(assert (= (and b!1057256 res!706034) b!1057259))

(assert (= (and b!1057256 res!706035) b!1057258))

(assert (= (and b!1057258 c!107074) b!1057257))

(assert (= (and b!1057258 (not c!107074)) b!1057255))

(assert (= (or b!1057257 b!1057255) bm!44814))

(declare-fun m!976491 () Bool)

(assert (=> bm!44814 m!976491))

(declare-fun m!976493 () Bool)

(assert (=> bm!44814 m!976493))

(assert (=> b!1057256 m!976491))

(assert (=> b!1057256 m!976491))

(declare-fun m!976495 () Bool)

(assert (=> b!1057256 m!976495))

(assert (=> b!1057258 m!976491))

(assert (=> b!1057258 m!976491))

(assert (=> b!1057258 m!976495))

(assert (=> b!1057259 m!976491))

(assert (=> b!1057259 m!976491))

(declare-fun m!976497 () Bool)

(assert (=> b!1057259 m!976497))

(assert (=> b!1057171 d!128249))

(declare-fun d!128251 () Bool)

(assert (=> d!128251 (arrayNoDuplicates!0 a!3488 lt!466213 Nil!22405)))

(declare-fun lt!466249 () Unit!34529)

(declare-fun choose!39 (array!66629 (_ BitVec 32) (_ BitVec 32)) Unit!34529)

(assert (=> d!128251 (= lt!466249 (choose!39 a!3488 #b00000000000000000000000000000000 lt!466213))))

(assert (=> d!128251 (bvslt (size!32575 a!3488) #b01111111111111111111111111111111)))

(assert (=> d!128251 (= (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466213) lt!466249)))

(declare-fun bs!30975 () Bool)

(assert (= bs!30975 d!128251))

(assert (=> bs!30975 m!976419))

(declare-fun m!976499 () Bool)

(assert (=> bs!30975 m!976499))

(assert (=> b!1057171 d!128251))

(declare-fun d!128255 () Bool)

(declare-fun res!706042 () Bool)

(declare-fun e!601269 () Bool)

(assert (=> d!128255 (=> res!706042 e!601269)))

(assert (=> d!128255 (= res!706042 (= (select (arr!32037 lt!466212) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128255 (= (arrayContainsKey!0 lt!466212 k0!2747 #b00000000000000000000000000000000) e!601269)))

(declare-fun b!1057270 () Bool)

(declare-fun e!601270 () Bool)

(assert (=> b!1057270 (= e!601269 e!601270)))

(declare-fun res!706043 () Bool)

(assert (=> b!1057270 (=> (not res!706043) (not e!601270))))

(assert (=> b!1057270 (= res!706043 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32575 lt!466212)))))

(declare-fun b!1057271 () Bool)

(assert (=> b!1057271 (= e!601270 (arrayContainsKey!0 lt!466212 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128255 (not res!706042)) b!1057270))

(assert (= (and b!1057270 res!706043) b!1057271))

(declare-fun m!976501 () Bool)

(assert (=> d!128255 m!976501))

(declare-fun m!976503 () Bool)

(assert (=> b!1057271 m!976503))

(assert (=> b!1057176 d!128255))

(declare-fun d!128257 () Bool)

(assert (=> d!128257 (= (validKeyInArray!0 k0!2747) (and (not (= k0!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1057175 d!128257))

(declare-fun d!128259 () Bool)

(declare-fun lt!466255 () (_ BitVec 32))

(assert (=> d!128259 (and (or (bvslt lt!466255 #b00000000000000000000000000000000) (bvsge lt!466255 (size!32575 lt!466212)) (and (bvsge lt!466255 #b00000000000000000000000000000000) (bvslt lt!466255 (size!32575 lt!466212)))) (bvsge lt!466255 #b00000000000000000000000000000000) (bvslt lt!466255 (size!32575 lt!466212)) (= (select (arr!32037 lt!466212) lt!466255) k0!2747))))

(declare-fun e!601293 () (_ BitVec 32))

(assert (=> d!128259 (= lt!466255 e!601293)))

(declare-fun c!107080 () Bool)

(assert (=> d!128259 (= c!107080 (= (select (arr!32037 lt!466212) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128259 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32575 lt!466212)) (bvslt (size!32575 lt!466212) #b01111111111111111111111111111111))))

(assert (=> d!128259 (= (arrayScanForKey!0 lt!466212 k0!2747 #b00000000000000000000000000000000) lt!466255)))

(declare-fun b!1057297 () Bool)

(assert (=> b!1057297 (= e!601293 #b00000000000000000000000000000000)))

(declare-fun b!1057298 () Bool)

(assert (=> b!1057298 (= e!601293 (arrayScanForKey!0 lt!466212 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128259 c!107080) b!1057297))

(assert (= (and d!128259 (not c!107080)) b!1057298))

(declare-fun m!976527 () Bool)

(assert (=> d!128259 m!976527))

(assert (=> d!128259 m!976501))

(declare-fun m!976529 () Bool)

(assert (=> b!1057298 m!976529))

(assert (=> b!1057173 d!128259))

(check-sat (not b!1057252) (not bm!44813) (not b!1057256) (not d!128245) (not b!1057271) (not bm!44814) (not d!128251) (not b!1057237) (not b!1057254) (not b!1057249) (not b!1057258) (not b!1057251) (not b!1057259) (not b!1057298))
(check-sat)
