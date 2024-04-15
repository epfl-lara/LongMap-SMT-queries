; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102202 () Bool)

(assert start!102202)

(declare-fun b!1230340 () Bool)

(declare-fun res!818869 () Bool)

(declare-fun e!698059 () Bool)

(assert (=> b!1230340 (=> (not res!818869) (not e!698059))))

(declare-datatypes ((List!27144 0))(
  ( (Nil!27141) (Cons!27140 (h!28349 (_ BitVec 64)) (t!40598 List!27144)) )
))
(declare-fun acc!823 () List!27144)

(declare-fun contains!7116 (List!27144 (_ BitVec 64)) Bool)

(assert (=> b!1230340 (= res!818869 (not (contains!7116 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230341 () Bool)

(declare-fun res!818866 () Bool)

(assert (=> b!1230341 (=> (not res!818866) (not e!698059))))

(declare-fun noDuplicate!1759 (List!27144) Bool)

(assert (=> b!1230341 (= res!818866 (noDuplicate!1759 acc!823))))

(declare-fun b!1230342 () Bool)

(declare-fun res!818862 () Bool)

(assert (=> b!1230342 (=> (not res!818862) (not e!698059))))

(declare-datatypes ((array!79300 0))(
  ( (array!79301 (arr!38270 (Array (_ BitVec 32) (_ BitVec 64))) (size!38808 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79300)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1230342 (= res!818862 (validKeyInArray!0 (select (arr!38270 a!3806) from!3184)))))

(declare-fun b!1230343 () Bool)

(declare-fun res!818867 () Bool)

(assert (=> b!1230343 (=> (not res!818867) (not e!698059))))

(assert (=> b!1230343 (= res!818867 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38808 a!3806)) (bvslt from!3184 (size!38808 a!3806))))))

(declare-fun b!1230344 () Bool)

(declare-fun res!818863 () Bool)

(assert (=> b!1230344 (=> (not res!818863) (not e!698059))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79300 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1230344 (= res!818863 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1230345 () Bool)

(declare-fun res!818870 () Bool)

(assert (=> b!1230345 (=> (not res!818870) (not e!698059))))

(declare-fun arrayNoDuplicates!0 (array!79300 (_ BitVec 32) List!27144) Bool)

(assert (=> b!1230345 (= res!818870 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1230346 () Bool)

(assert (=> b!1230346 (= e!698059 (not (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27140 (select (arr!38270 a!3806) from!3184) acc!823))))))

(declare-fun b!1230347 () Bool)

(declare-fun res!818868 () Bool)

(assert (=> b!1230347 (=> (not res!818868) (not e!698059))))

(assert (=> b!1230347 (= res!818868 (not (contains!7116 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!818864 () Bool)

(assert (=> start!102202 (=> (not res!818864) (not e!698059))))

(assert (=> start!102202 (= res!818864 (bvslt (size!38808 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102202 e!698059))

(declare-fun array_inv!29253 (array!79300) Bool)

(assert (=> start!102202 (array_inv!29253 a!3806)))

(assert (=> start!102202 true))

(declare-fun b!1230348 () Bool)

(declare-fun res!818865 () Bool)

(assert (=> b!1230348 (=> (not res!818865) (not e!698059))))

(assert (=> b!1230348 (= res!818865 (validKeyInArray!0 k0!2913))))

(assert (= (and start!102202 res!818864) b!1230348))

(assert (= (and b!1230348 res!818865) b!1230343))

(assert (= (and b!1230343 res!818867) b!1230341))

(assert (= (and b!1230341 res!818866) b!1230340))

(assert (= (and b!1230340 res!818869) b!1230347))

(assert (= (and b!1230347 res!818868) b!1230344))

(assert (= (and b!1230344 res!818863) b!1230345))

(assert (= (and b!1230345 res!818870) b!1230342))

(assert (= (and b!1230342 res!818862) b!1230346))

(declare-fun m!1134327 () Bool)

(assert (=> b!1230342 m!1134327))

(assert (=> b!1230342 m!1134327))

(declare-fun m!1134329 () Bool)

(assert (=> b!1230342 m!1134329))

(declare-fun m!1134331 () Bool)

(assert (=> b!1230344 m!1134331))

(declare-fun m!1134333 () Bool)

(assert (=> b!1230341 m!1134333))

(assert (=> b!1230346 m!1134327))

(declare-fun m!1134335 () Bool)

(assert (=> b!1230346 m!1134335))

(declare-fun m!1134337 () Bool)

(assert (=> b!1230340 m!1134337))

(declare-fun m!1134339 () Bool)

(assert (=> start!102202 m!1134339))

(declare-fun m!1134341 () Bool)

(assert (=> b!1230348 m!1134341))

(declare-fun m!1134343 () Bool)

(assert (=> b!1230345 m!1134343))

(declare-fun m!1134345 () Bool)

(assert (=> b!1230347 m!1134345))

(check-sat (not b!1230348) (not b!1230344) (not start!102202) (not b!1230347) (not b!1230340) (not b!1230341) (not b!1230342) (not b!1230346) (not b!1230345))
(check-sat)
(get-model)

(declare-fun d!134449 () Bool)

(declare-fun res!818929 () Bool)

(declare-fun e!698077 () Bool)

(assert (=> d!134449 (=> res!818929 e!698077)))

(assert (=> d!134449 (= res!818929 (= (select (arr!38270 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) k0!2913))))

(assert (=> d!134449 (= (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)) e!698077)))

(declare-fun b!1230407 () Bool)

(declare-fun e!698078 () Bool)

(assert (=> b!1230407 (= e!698077 e!698078)))

(declare-fun res!818930 () Bool)

(assert (=> b!1230407 (=> (not res!818930) (not e!698078))))

(assert (=> b!1230407 (= res!818930 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38808 a!3806)))))

(declare-fun b!1230408 () Bool)

(assert (=> b!1230408 (= e!698078 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)))))

(assert (= (and d!134449 (not res!818929)) b!1230407))

(assert (= (and b!1230407 res!818930) b!1230408))

(declare-fun m!1134387 () Bool)

(assert (=> d!134449 m!1134387))

(declare-fun m!1134389 () Bool)

(assert (=> b!1230408 m!1134389))

(assert (=> b!1230344 d!134449))

(declare-fun d!134451 () Bool)

(assert (=> d!134451 (= (validKeyInArray!0 k0!2913) (and (not (= k0!2913 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2913 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1230348 d!134451))

(declare-fun d!134453 () Bool)

(assert (=> d!134453 (= (validKeyInArray!0 (select (arr!38270 a!3806) from!3184)) (and (not (= (select (arr!38270 a!3806) from!3184) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38270 a!3806) from!3184) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1230342 d!134453))

(declare-fun d!134455 () Bool)

(assert (=> d!134455 (= (array_inv!29253 a!3806) (bvsge (size!38808 a!3806) #b00000000000000000000000000000000))))

(assert (=> start!102202 d!134455))

(declare-fun d!134457 () Bool)

(declare-fun lt!559199 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!558 (List!27144) (InoxSet (_ BitVec 64)))

(assert (=> d!134457 (= lt!559199 (select (content!558 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!698084 () Bool)

(assert (=> d!134457 (= lt!559199 e!698084)))

(declare-fun res!818936 () Bool)

(assert (=> d!134457 (=> (not res!818936) (not e!698084))))

(get-info :version)

(assert (=> d!134457 (= res!818936 ((_ is Cons!27140) acc!823))))

(assert (=> d!134457 (= (contains!7116 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559199)))

(declare-fun b!1230413 () Bool)

(declare-fun e!698083 () Bool)

(assert (=> b!1230413 (= e!698084 e!698083)))

(declare-fun res!818935 () Bool)

(assert (=> b!1230413 (=> res!818935 e!698083)))

(assert (=> b!1230413 (= res!818935 (= (h!28349 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1230414 () Bool)

(assert (=> b!1230414 (= e!698083 (contains!7116 (t!40598 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134457 res!818936) b!1230413))

(assert (= (and b!1230413 (not res!818935)) b!1230414))

(declare-fun m!1134391 () Bool)

(assert (=> d!134457 m!1134391))

(declare-fun m!1134393 () Bool)

(assert (=> d!134457 m!1134393))

(declare-fun m!1134395 () Bool)

(assert (=> b!1230414 m!1134395))

(assert (=> b!1230347 d!134457))

(declare-fun call!60843 () Bool)

(declare-fun bm!60840 () Bool)

(declare-fun c!120610 () Bool)

(assert (=> bm!60840 (= call!60843 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120610 (Cons!27140 (select (arr!38270 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27140 (select (arr!38270 a!3806) from!3184) acc!823)) (Cons!27140 (select (arr!38270 a!3806) from!3184) acc!823))))))

(declare-fun b!1230455 () Bool)

(declare-fun e!698120 () Bool)

(assert (=> b!1230455 (= e!698120 call!60843)))

(declare-fun e!698117 () Bool)

(declare-fun b!1230456 () Bool)

(assert (=> b!1230456 (= e!698117 (contains!7116 (Cons!27140 (select (arr!38270 a!3806) from!3184) acc!823) (select (arr!38270 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1230457 () Bool)

(assert (=> b!1230457 (= e!698120 call!60843)))

(declare-fun b!1230458 () Bool)

(declare-fun e!698119 () Bool)

(declare-fun e!698118 () Bool)

(assert (=> b!1230458 (= e!698119 e!698118)))

(declare-fun res!818962 () Bool)

(assert (=> b!1230458 (=> (not res!818962) (not e!698118))))

(assert (=> b!1230458 (= res!818962 (not e!698117))))

(declare-fun res!818963 () Bool)

(assert (=> b!1230458 (=> (not res!818963) (not e!698117))))

(assert (=> b!1230458 (= res!818963 (validKeyInArray!0 (select (arr!38270 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1230459 () Bool)

(assert (=> b!1230459 (= e!698118 e!698120)))

(assert (=> b!1230459 (= c!120610 (validKeyInArray!0 (select (arr!38270 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun d!134461 () Bool)

(declare-fun res!818961 () Bool)

(assert (=> d!134461 (=> res!818961 e!698119)))

(assert (=> d!134461 (= res!818961 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38808 a!3806)))))

(assert (=> d!134461 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27140 (select (arr!38270 a!3806) from!3184) acc!823)) e!698119)))

(assert (= (and d!134461 (not res!818961)) b!1230458))

(assert (= (and b!1230458 res!818963) b!1230456))

(assert (= (and b!1230458 res!818962) b!1230459))

(assert (= (and b!1230459 c!120610) b!1230455))

(assert (= (and b!1230459 (not c!120610)) b!1230457))

(assert (= (or b!1230455 b!1230457) bm!60840))

(assert (=> bm!60840 m!1134387))

(declare-fun m!1134405 () Bool)

(assert (=> bm!60840 m!1134405))

(assert (=> b!1230456 m!1134387))

(assert (=> b!1230456 m!1134387))

(declare-fun m!1134407 () Bool)

(assert (=> b!1230456 m!1134407))

(assert (=> b!1230458 m!1134387))

(assert (=> b!1230458 m!1134387))

(declare-fun m!1134409 () Bool)

(assert (=> b!1230458 m!1134409))

(assert (=> b!1230459 m!1134387))

(assert (=> b!1230459 m!1134387))

(assert (=> b!1230459 m!1134409))

(assert (=> b!1230346 d!134461))

(declare-fun d!134471 () Bool)

(declare-fun res!818983 () Bool)

(declare-fun e!698141 () Bool)

(assert (=> d!134471 (=> res!818983 e!698141)))

(assert (=> d!134471 (= res!818983 ((_ is Nil!27141) acc!823))))

(assert (=> d!134471 (= (noDuplicate!1759 acc!823) e!698141)))

(declare-fun b!1230481 () Bool)

(declare-fun e!698142 () Bool)

(assert (=> b!1230481 (= e!698141 e!698142)))

(declare-fun res!818984 () Bool)

(assert (=> b!1230481 (=> (not res!818984) (not e!698142))))

(assert (=> b!1230481 (= res!818984 (not (contains!7116 (t!40598 acc!823) (h!28349 acc!823))))))

(declare-fun b!1230482 () Bool)

(assert (=> b!1230482 (= e!698142 (noDuplicate!1759 (t!40598 acc!823)))))

(assert (= (and d!134471 (not res!818983)) b!1230481))

(assert (= (and b!1230481 res!818984) b!1230482))

(declare-fun m!1134421 () Bool)

(assert (=> b!1230481 m!1134421))

(declare-fun m!1134423 () Bool)

(assert (=> b!1230482 m!1134423))

(assert (=> b!1230341 d!134471))

(declare-fun d!134481 () Bool)

(declare-fun lt!559203 () Bool)

(assert (=> d!134481 (= lt!559203 (select (content!558 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!698144 () Bool)

(assert (=> d!134481 (= lt!559203 e!698144)))

(declare-fun res!818986 () Bool)

(assert (=> d!134481 (=> (not res!818986) (not e!698144))))

(assert (=> d!134481 (= res!818986 ((_ is Cons!27140) acc!823))))

(assert (=> d!134481 (= (contains!7116 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000) lt!559203)))

(declare-fun b!1230483 () Bool)

(declare-fun e!698143 () Bool)

(assert (=> b!1230483 (= e!698144 e!698143)))

(declare-fun res!818985 () Bool)

(assert (=> b!1230483 (=> res!818985 e!698143)))

(assert (=> b!1230483 (= res!818985 (= (h!28349 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1230484 () Bool)

(assert (=> b!1230484 (= e!698143 (contains!7116 (t!40598 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134481 res!818986) b!1230483))

(assert (= (and b!1230483 (not res!818985)) b!1230484))

(assert (=> d!134481 m!1134391))

(declare-fun m!1134429 () Bool)

(assert (=> d!134481 m!1134429))

(declare-fun m!1134431 () Bool)

(assert (=> b!1230484 m!1134431))

(assert (=> b!1230340 d!134481))

(declare-fun call!60845 () Bool)

(declare-fun bm!60842 () Bool)

(declare-fun c!120612 () Bool)

(assert (=> bm!60842 (= call!60845 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120612 (Cons!27140 (select (arr!38270 a!3806) from!3184) acc!823) acc!823)))))

(declare-fun b!1230485 () Bool)

(declare-fun e!698148 () Bool)

(assert (=> b!1230485 (= e!698148 call!60845)))

(declare-fun b!1230486 () Bool)

(declare-fun e!698145 () Bool)

(assert (=> b!1230486 (= e!698145 (contains!7116 acc!823 (select (arr!38270 a!3806) from!3184)))))

(declare-fun b!1230487 () Bool)

(assert (=> b!1230487 (= e!698148 call!60845)))

(declare-fun b!1230488 () Bool)

(declare-fun e!698147 () Bool)

(declare-fun e!698146 () Bool)

(assert (=> b!1230488 (= e!698147 e!698146)))

(declare-fun res!818988 () Bool)

(assert (=> b!1230488 (=> (not res!818988) (not e!698146))))

(assert (=> b!1230488 (= res!818988 (not e!698145))))

(declare-fun res!818989 () Bool)

(assert (=> b!1230488 (=> (not res!818989) (not e!698145))))

(assert (=> b!1230488 (= res!818989 (validKeyInArray!0 (select (arr!38270 a!3806) from!3184)))))

(declare-fun b!1230489 () Bool)

(assert (=> b!1230489 (= e!698146 e!698148)))

(assert (=> b!1230489 (= c!120612 (validKeyInArray!0 (select (arr!38270 a!3806) from!3184)))))

(declare-fun d!134483 () Bool)

(declare-fun res!818987 () Bool)

(assert (=> d!134483 (=> res!818987 e!698147)))

(assert (=> d!134483 (= res!818987 (bvsge from!3184 (size!38808 a!3806)))))

(assert (=> d!134483 (= (arrayNoDuplicates!0 a!3806 from!3184 acc!823) e!698147)))

(assert (= (and d!134483 (not res!818987)) b!1230488))

(assert (= (and b!1230488 res!818989) b!1230486))

(assert (= (and b!1230488 res!818988) b!1230489))

(assert (= (and b!1230489 c!120612) b!1230485))

(assert (= (and b!1230489 (not c!120612)) b!1230487))

(assert (= (or b!1230485 b!1230487) bm!60842))

(assert (=> bm!60842 m!1134327))

(declare-fun m!1134441 () Bool)

(assert (=> bm!60842 m!1134441))

(assert (=> b!1230486 m!1134327))

(assert (=> b!1230486 m!1134327))

(declare-fun m!1134443 () Bool)

(assert (=> b!1230486 m!1134443))

(assert (=> b!1230488 m!1134327))

(assert (=> b!1230488 m!1134327))

(assert (=> b!1230488 m!1134329))

(assert (=> b!1230489 m!1134327))

(assert (=> b!1230489 m!1134327))

(assert (=> b!1230489 m!1134329))

(assert (=> b!1230345 d!134483))

(check-sat (not bm!60840) (not d!134481) (not b!1230459) (not b!1230456) (not b!1230488) (not b!1230458) (not bm!60842) (not d!134457) (not b!1230408) (not b!1230486) (not b!1230484) (not b!1230489) (not b!1230482) (not b!1230481) (not b!1230414))
(check-sat)
