; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93074 () Bool)

(assert start!93074)

(declare-fun b!1055990 () Bool)

(declare-fun res!704806 () Bool)

(declare-fun e!600255 () Bool)

(assert (=> b!1055990 (=> (not res!704806) (not e!600255))))

(declare-datatypes ((array!66599 0))(
  ( (array!66600 (arr!32027 (Array (_ BitVec 32) (_ BitVec 64))) (size!32563 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66599)

(declare-datatypes ((List!22339 0))(
  ( (Nil!22336) (Cons!22335 (h!23544 (_ BitVec 64)) (t!31646 List!22339)) )
))
(declare-fun arrayNoDuplicates!0 (array!66599 (_ BitVec 32) List!22339) Bool)

(assert (=> b!1055990 (= res!704806 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22336))))

(declare-fun b!1055991 () Bool)

(declare-fun res!704807 () Bool)

(assert (=> b!1055991 (=> (not res!704807) (not e!600255))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1055991 (= res!704807 (validKeyInArray!0 k0!2747))))

(declare-fun b!1055992 () Bool)

(declare-fun e!600252 () Bool)

(assert (=> b!1055992 (= e!600255 e!600252)))

(declare-fun res!704804 () Bool)

(assert (=> b!1055992 (=> (not res!704804) (not e!600252))))

(declare-fun lt!466014 () array!66599)

(declare-fun arrayContainsKey!0 (array!66599 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1055992 (= res!704804 (arrayContainsKey!0 lt!466014 k0!2747 #b00000000000000000000000000000000))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1055992 (= lt!466014 (array!66600 (store (arr!32027 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32563 a!3488)))))

(declare-fun b!1055994 () Bool)

(declare-fun e!600256 () Bool)

(assert (=> b!1055994 (= e!600252 e!600256)))

(declare-fun res!704810 () Bool)

(assert (=> b!1055994 (=> (not res!704810) (not e!600256))))

(declare-fun lt!466013 () (_ BitVec 32))

(assert (=> b!1055994 (= res!704810 (not (= lt!466013 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66599 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1055994 (= lt!466013 (arrayScanForKey!0 lt!466014 k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!704805 () Bool)

(assert (=> start!93074 (=> (not res!704805) (not e!600255))))

(assert (=> start!93074 (= res!704805 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32563 a!3488)) (bvslt (size!32563 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93074 e!600255))

(assert (=> start!93074 true))

(declare-fun array_inv!24807 (array!66599) Bool)

(assert (=> start!93074 (array_inv!24807 a!3488)))

(declare-fun e!600254 () Bool)

(declare-fun b!1055993 () Bool)

(assert (=> b!1055993 (= e!600254 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1055995 () Bool)

(declare-fun res!704809 () Bool)

(assert (=> b!1055995 (=> (not res!704809) (not e!600255))))

(assert (=> b!1055995 (= res!704809 (= (select (arr!32027 a!3488) i!1381) k0!2747))))

(declare-fun b!1055996 () Bool)

(assert (=> b!1055996 (= e!600256 (not e!600254))))

(declare-fun res!704808 () Bool)

(assert (=> b!1055996 (=> res!704808 e!600254)))

(assert (=> b!1055996 (= res!704808 (or (bvsgt lt!466013 i!1381) (bvsle i!1381 lt!466013)))))

(assert (=> b!1055996 (= (select (store (arr!32027 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466013) k0!2747)))

(assert (= (and start!93074 res!704805) b!1055990))

(assert (= (and b!1055990 res!704806) b!1055991))

(assert (= (and b!1055991 res!704807) b!1055995))

(assert (= (and b!1055995 res!704809) b!1055992))

(assert (= (and b!1055992 res!704804) b!1055994))

(assert (= (and b!1055994 res!704810) b!1055996))

(assert (= (and b!1055996 (not res!704808)) b!1055993))

(declare-fun m!975971 () Bool)

(assert (=> b!1055995 m!975971))

(declare-fun m!975973 () Bool)

(assert (=> b!1055994 m!975973))

(declare-fun m!975975 () Bool)

(assert (=> start!93074 m!975975))

(declare-fun m!975977 () Bool)

(assert (=> b!1055990 m!975977))

(declare-fun m!975979 () Bool)

(assert (=> b!1055996 m!975979))

(declare-fun m!975981 () Bool)

(assert (=> b!1055996 m!975981))

(declare-fun m!975983 () Bool)

(assert (=> b!1055993 m!975983))

(declare-fun m!975985 () Bool)

(assert (=> b!1055991 m!975985))

(declare-fun m!975987 () Bool)

(assert (=> b!1055992 m!975987))

(assert (=> b!1055992 m!975979))

(check-sat (not b!1055990) (not start!93074) (not b!1055992) (not b!1055994) (not b!1055993) (not b!1055991))
(check-sat)
(get-model)

(declare-fun b!1056028 () Bool)

(declare-fun e!600281 () Bool)

(declare-fun call!44809 () Bool)

(assert (=> b!1056028 (= e!600281 call!44809)))

(declare-fun b!1056029 () Bool)

(declare-fun e!600282 () Bool)

(declare-fun contains!6189 (List!22339 (_ BitVec 64)) Bool)

(assert (=> b!1056029 (= e!600282 (contains!6189 Nil!22336 (select (arr!32027 a!3488) #b00000000000000000000000000000000)))))

(declare-fun bm!44806 () Bool)

(declare-fun c!107055 () Bool)

(assert (=> bm!44806 (= call!44809 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107055 (Cons!22335 (select (arr!32027 a!3488) #b00000000000000000000000000000000) Nil!22336) Nil!22336)))))

(declare-fun b!1056030 () Bool)

(declare-fun e!600280 () Bool)

(declare-fun e!600283 () Bool)

(assert (=> b!1056030 (= e!600280 e!600283)))

(declare-fun res!704840 () Bool)

(assert (=> b!1056030 (=> (not res!704840) (not e!600283))))

(assert (=> b!1056030 (= res!704840 (not e!600282))))

(declare-fun res!704839 () Bool)

(assert (=> b!1056030 (=> (not res!704839) (not e!600282))))

(assert (=> b!1056030 (= res!704839 (validKeyInArray!0 (select (arr!32027 a!3488) #b00000000000000000000000000000000)))))

(declare-fun d!128239 () Bool)

(declare-fun res!704838 () Bool)

(assert (=> d!128239 (=> res!704838 e!600280)))

(assert (=> d!128239 (= res!704838 (bvsge #b00000000000000000000000000000000 (size!32563 a!3488)))))

(assert (=> d!128239 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22336) e!600280)))

(declare-fun b!1056031 () Bool)

(assert (=> b!1056031 (= e!600283 e!600281)))

(assert (=> b!1056031 (= c!107055 (validKeyInArray!0 (select (arr!32027 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1056032 () Bool)

(assert (=> b!1056032 (= e!600281 call!44809)))

(assert (= (and d!128239 (not res!704838)) b!1056030))

(assert (= (and b!1056030 res!704839) b!1056029))

(assert (= (and b!1056030 res!704840) b!1056031))

(assert (= (and b!1056031 c!107055) b!1056032))

(assert (= (and b!1056031 (not c!107055)) b!1056028))

(assert (= (or b!1056032 b!1056028) bm!44806))

(declare-fun m!976007 () Bool)

(assert (=> b!1056029 m!976007))

(assert (=> b!1056029 m!976007))

(declare-fun m!976009 () Bool)

(assert (=> b!1056029 m!976009))

(assert (=> bm!44806 m!976007))

(declare-fun m!976011 () Bool)

(assert (=> bm!44806 m!976011))

(assert (=> b!1056030 m!976007))

(assert (=> b!1056030 m!976007))

(declare-fun m!976013 () Bool)

(assert (=> b!1056030 m!976013))

(assert (=> b!1056031 m!976007))

(assert (=> b!1056031 m!976007))

(assert (=> b!1056031 m!976013))

(assert (=> b!1055990 d!128239))

(declare-fun d!128245 () Bool)

(declare-fun res!704845 () Bool)

(declare-fun e!600288 () Bool)

(assert (=> d!128245 (=> res!704845 e!600288)))

(assert (=> d!128245 (= res!704845 (= (select (arr!32027 a!3488) i!1381) k0!2747))))

(assert (=> d!128245 (= (arrayContainsKey!0 a!3488 k0!2747 i!1381) e!600288)))

(declare-fun b!1056037 () Bool)

(declare-fun e!600289 () Bool)

(assert (=> b!1056037 (= e!600288 e!600289)))

(declare-fun res!704846 () Bool)

(assert (=> b!1056037 (=> (not res!704846) (not e!600289))))

(assert (=> b!1056037 (= res!704846 (bvslt (bvadd i!1381 #b00000000000000000000000000000001) (size!32563 a!3488)))))

(declare-fun b!1056038 () Bool)

(assert (=> b!1056038 (= e!600289 (arrayContainsKey!0 a!3488 k0!2747 (bvadd i!1381 #b00000000000000000000000000000001)))))

(assert (= (and d!128245 (not res!704845)) b!1056037))

(assert (= (and b!1056037 res!704846) b!1056038))

(assert (=> d!128245 m!975971))

(declare-fun m!976015 () Bool)

(assert (=> b!1056038 m!976015))

(assert (=> b!1055993 d!128245))

(declare-fun d!128247 () Bool)

(declare-fun lt!466026 () (_ BitVec 32))

(assert (=> d!128247 (and (or (bvslt lt!466026 #b00000000000000000000000000000000) (bvsge lt!466026 (size!32563 lt!466014)) (and (bvsge lt!466026 #b00000000000000000000000000000000) (bvslt lt!466026 (size!32563 lt!466014)))) (bvsge lt!466026 #b00000000000000000000000000000000) (bvslt lt!466026 (size!32563 lt!466014)) (= (select (arr!32027 lt!466014) lt!466026) k0!2747))))

(declare-fun e!600307 () (_ BitVec 32))

(assert (=> d!128247 (= lt!466026 e!600307)))

(declare-fun c!107063 () Bool)

(assert (=> d!128247 (= c!107063 (= (select (arr!32027 lt!466014) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128247 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32563 lt!466014)) (bvslt (size!32563 lt!466014) #b01111111111111111111111111111111))))

(assert (=> d!128247 (= (arrayScanForKey!0 lt!466014 k0!2747 #b00000000000000000000000000000000) lt!466026)))

(declare-fun b!1056063 () Bool)

(assert (=> b!1056063 (= e!600307 #b00000000000000000000000000000000)))

(declare-fun b!1056064 () Bool)

(assert (=> b!1056064 (= e!600307 (arrayScanForKey!0 lt!466014 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128247 c!107063) b!1056063))

(assert (= (and d!128247 (not c!107063)) b!1056064))

(declare-fun m!976023 () Bool)

(assert (=> d!128247 m!976023))

(declare-fun m!976025 () Bool)

(assert (=> d!128247 m!976025))

(declare-fun m!976027 () Bool)

(assert (=> b!1056064 m!976027))

(assert (=> b!1055994 d!128247))

(declare-fun d!128255 () Bool)

(declare-fun res!704860 () Bool)

(declare-fun e!600312 () Bool)

(assert (=> d!128255 (=> res!704860 e!600312)))

(assert (=> d!128255 (= res!704860 (= (select (arr!32027 lt!466014) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128255 (= (arrayContainsKey!0 lt!466014 k0!2747 #b00000000000000000000000000000000) e!600312)))

(declare-fun b!1056070 () Bool)

(declare-fun e!600313 () Bool)

(assert (=> b!1056070 (= e!600312 e!600313)))

(declare-fun res!704861 () Bool)

(assert (=> b!1056070 (=> (not res!704861) (not e!600313))))

(assert (=> b!1056070 (= res!704861 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32563 lt!466014)))))

(declare-fun b!1056071 () Bool)

(assert (=> b!1056071 (= e!600313 (arrayContainsKey!0 lt!466014 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128255 (not res!704860)) b!1056070))

(assert (= (and b!1056070 res!704861) b!1056071))

(assert (=> d!128255 m!976025))

(declare-fun m!976029 () Bool)

(assert (=> b!1056071 m!976029))

(assert (=> b!1055992 d!128255))

(declare-fun d!128257 () Bool)

(assert (=> d!128257 (= (array_inv!24807 a!3488) (bvsge (size!32563 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!93074 d!128257))

(declare-fun d!128263 () Bool)

(assert (=> d!128263 (= (validKeyInArray!0 k0!2747) (and (not (= k0!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1055991 d!128263))

(check-sat (not b!1056071) (not b!1056030) (not b!1056064) (not bm!44806) (not b!1056029) (not b!1056031) (not b!1056038))
(check-sat)
