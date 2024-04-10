; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93130 () Bool)

(assert start!93130)

(declare-fun b!1056385 () Bool)

(declare-datatypes ((array!66628 0))(
  ( (array!66629 (arr!32040 (Array (_ BitVec 32) (_ BitVec 64))) (size!32576 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66628)

(declare-fun e!600552 () Bool)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66628 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1056385 (= e!600552 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1056386 () Bool)

(declare-fun e!600554 () Bool)

(declare-fun e!600553 () Bool)

(assert (=> b!1056386 (= e!600554 e!600553)))

(declare-fun res!705168 () Bool)

(assert (=> b!1056386 (=> (not res!705168) (not e!600553))))

(declare-fun lt!466100 () (_ BitVec 32))

(assert (=> b!1056386 (= res!705168 (not (= lt!466100 i!1381)))))

(declare-fun lt!466101 () array!66628)

(declare-fun arrayScanForKey!0 (array!66628 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1056386 (= lt!466100 (arrayScanForKey!0 lt!466101 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1056387 () Bool)

(declare-fun e!600555 () Bool)

(assert (=> b!1056387 (= e!600555 e!600554)))

(declare-fun res!705166 () Bool)

(assert (=> b!1056387 (=> (not res!705166) (not e!600554))))

(assert (=> b!1056387 (= res!705166 (arrayContainsKey!0 lt!466101 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1056387 (= lt!466101 (array!66629 (store (arr!32040 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32576 a!3488)))))

(declare-fun b!1056388 () Bool)

(declare-fun res!705170 () Bool)

(assert (=> b!1056388 (=> (not res!705170) (not e!600555))))

(declare-datatypes ((List!22352 0))(
  ( (Nil!22349) (Cons!22348 (h!23557 (_ BitVec 64)) (t!31659 List!22352)) )
))
(declare-fun arrayNoDuplicates!0 (array!66628 (_ BitVec 32) List!22352) Bool)

(assert (=> b!1056388 (= res!705170 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22349))))

(declare-fun res!705163 () Bool)

(assert (=> start!93130 (=> (not res!705163) (not e!600555))))

(assert (=> start!93130 (= res!705163 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32576 a!3488)) (bvslt (size!32576 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93130 e!600555))

(assert (=> start!93130 true))

(declare-fun array_inv!24820 (array!66628) Bool)

(assert (=> start!93130 (array_inv!24820 a!3488)))

(declare-fun b!1056389 () Bool)

(assert (=> b!1056389 (= e!600553 (not (or (bvsgt lt!466100 i!1381) (bvsle i!1381 lt!466100) (bvsgt #b00000000000000000000000000000000 (size!32576 a!3488)) (and (bvsge lt!466100 #b00000000000000000000000000000000) (bvsle lt!466100 (size!32576 a!3488))))))))

(declare-fun e!600551 () Bool)

(assert (=> b!1056389 e!600551))

(declare-fun res!705167 () Bool)

(assert (=> b!1056389 (=> (not res!705167) (not e!600551))))

(assert (=> b!1056389 (= res!705167 (= (select (store (arr!32040 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466100) k!2747))))

(declare-fun b!1056390 () Bool)

(declare-fun res!705164 () Bool)

(assert (=> b!1056390 (=> (not res!705164) (not e!600555))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1056390 (= res!705164 (validKeyInArray!0 k!2747))))

(declare-fun b!1056391 () Bool)

(assert (=> b!1056391 (= e!600551 e!600552)))

(declare-fun res!705165 () Bool)

(assert (=> b!1056391 (=> res!705165 e!600552)))

(assert (=> b!1056391 (= res!705165 (or (bvsgt lt!466100 i!1381) (bvsle i!1381 lt!466100)))))

(declare-fun b!1056392 () Bool)

(declare-fun res!705169 () Bool)

(assert (=> b!1056392 (=> (not res!705169) (not e!600555))))

(assert (=> b!1056392 (= res!705169 (= (select (arr!32040 a!3488) i!1381) k!2747))))

(assert (= (and start!93130 res!705163) b!1056388))

(assert (= (and b!1056388 res!705170) b!1056390))

(assert (= (and b!1056390 res!705164) b!1056392))

(assert (= (and b!1056392 res!705169) b!1056387))

(assert (= (and b!1056387 res!705166) b!1056386))

(assert (= (and b!1056386 res!705168) b!1056389))

(assert (= (and b!1056389 res!705167) b!1056391))

(assert (= (and b!1056391 (not res!705165)) b!1056385))

(declare-fun m!976259 () Bool)

(assert (=> b!1056389 m!976259))

(declare-fun m!976261 () Bool)

(assert (=> b!1056389 m!976261))

(declare-fun m!976263 () Bool)

(assert (=> start!93130 m!976263))

(declare-fun m!976265 () Bool)

(assert (=> b!1056390 m!976265))

(declare-fun m!976267 () Bool)

(assert (=> b!1056387 m!976267))

(assert (=> b!1056387 m!976259))

(declare-fun m!976269 () Bool)

(assert (=> b!1056392 m!976269))

(declare-fun m!976271 () Bool)

(assert (=> b!1056386 m!976271))

(declare-fun m!976273 () Bool)

(assert (=> b!1056385 m!976273))

(declare-fun m!976275 () Bool)

(assert (=> b!1056388 m!976275))

(push 1)

(assert (not b!1056388))

(assert (not start!93130))

(assert (not b!1056385))

(assert (not b!1056386))

(assert (not b!1056390))

(assert (not b!1056387))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!128303 () Bool)

(declare-fun res!705207 () Bool)

(declare-fun e!600602 () Bool)

(assert (=> d!128303 (=> res!705207 e!600602)))

(assert (=> d!128303 (= res!705207 (= (select (arr!32040 lt!466101) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!128303 (= (arrayContainsKey!0 lt!466101 k!2747 #b00000000000000000000000000000000) e!600602)))

(declare-fun b!1056447 () Bool)

(declare-fun e!600603 () Bool)

(assert (=> b!1056447 (= e!600602 e!600603)))

(declare-fun res!705208 () Bool)

(assert (=> b!1056447 (=> (not res!705208) (not e!600603))))

(assert (=> b!1056447 (= res!705208 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32576 lt!466101)))))

(declare-fun b!1056448 () Bool)

(assert (=> b!1056448 (= e!600603 (arrayContainsKey!0 lt!466101 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128303 (not res!705207)) b!1056447))

(assert (= (and b!1056447 res!705208) b!1056448))

(declare-fun m!976299 () Bool)

(assert (=> d!128303 m!976299))

(declare-fun m!976301 () Bool)

(assert (=> b!1056448 m!976301))

(assert (=> b!1056387 d!128303))

(declare-fun b!1056463 () Bool)

(declare-fun e!600616 () Bool)

(declare-fun e!600617 () Bool)

(assert (=> b!1056463 (= e!600616 e!600617)))

(declare-fun res!705216 () Bool)

(assert (=> b!1056463 (=> (not res!705216) (not e!600617))))

(declare-fun e!600615 () Bool)

(assert (=> b!1056463 (= res!705216 (not e!600615))))

(declare-fun res!705217 () Bool)

(assert (=> b!1056463 (=> (not res!705217) (not e!600615))))

(assert (=> b!1056463 (= res!705217 (validKeyInArray!0 (select (arr!32040 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1056464 () Bool)

(declare-fun e!600614 () Bool)

(declare-fun call!44824 () Bool)

(assert (=> b!1056464 (= e!600614 call!44824)))

(declare-fun d!128305 () Bool)

(declare-fun res!705215 () Bool)

(assert (=> d!128305 (=> res!705215 e!600616)))

(assert (=> d!128305 (= res!705215 (bvsge #b00000000000000000000000000000000 (size!32576 a!3488)))))

(assert (=> d!128305 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22349) e!600616)))

(declare-fun b!1056465 () Bool)

(assert (=> b!1056465 (= e!600614 call!44824)))

(declare-fun b!1056466 () Bool)

(assert (=> b!1056466 (= e!600617 e!600614)))

(declare-fun c!107084 () Bool)

(assert (=> b!1056466 (= c!107084 (validKeyInArray!0 (select (arr!32040 a!3488) #b00000000000000000000000000000000)))))

(declare-fun bm!44821 () Bool)

(assert (=> bm!44821 (= call!44824 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107084 (Cons!22348 (select (arr!32040 a!3488) #b00000000000000000000000000000000) Nil!22349) Nil!22349)))))

(declare-fun b!1056467 () Bool)

(declare-fun contains!6194 (List!22352 (_ BitVec 64)) Bool)

(assert (=> b!1056467 (= e!600615 (contains!6194 Nil!22349 (select (arr!32040 a!3488) #b00000000000000000000000000000000)))))

(assert (= (and d!128305 (not res!705215)) b!1056463))

(assert (= (and b!1056463 res!705217) b!1056467))

(assert (= (and b!1056463 res!705216) b!1056466))

(assert (= (and b!1056466 c!107084) b!1056465))

(assert (= (and b!1056466 (not c!107084)) b!1056464))

(assert (= (or b!1056465 b!1056464) bm!44821))

(declare-fun m!976311 () Bool)

(assert (=> b!1056463 m!976311))

(assert (=> b!1056463 m!976311))

(declare-fun m!976313 () Bool)

(assert (=> b!1056463 m!976313))

(assert (=> b!1056466 m!976311))

(assert (=> b!1056466 m!976311))

(assert (=> b!1056466 m!976313))

(assert (=> bm!44821 m!976311))

(declare-fun m!976315 () Bool)

(assert (=> bm!44821 m!976315))

(assert (=> b!1056467 m!976311))

(assert (=> b!1056467 m!976311))

(declare-fun m!976319 () Bool)

(assert (=> b!1056467 m!976319))

(assert (=> b!1056388 d!128305))

(declare-fun d!128309 () Bool)

(declare-fun res!705218 () Bool)

(declare-fun e!600619 () Bool)

(assert (=> d!128309 (=> res!705218 e!600619)))

(assert (=> d!128309 (= res!705218 (= (select (arr!32040 a!3488) i!1381) k!2747))))

(assert (=> d!128309 (= (arrayContainsKey!0 a!3488 k!2747 i!1381) e!600619)))

(declare-fun b!1056470 () Bool)

(declare-fun e!600620 () Bool)

(assert (=> b!1056470 (= e!600619 e!600620)))

(declare-fun res!705219 () Bool)

(assert (=> b!1056470 (=> (not res!705219) (not e!600620))))

(assert (=> b!1056470 (= res!705219 (bvslt (bvadd i!1381 #b00000000000000000000000000000001) (size!32576 a!3488)))))

(declare-fun b!1056471 () Bool)

(assert (=> b!1056471 (= e!600620 (arrayContainsKey!0 a!3488 k!2747 (bvadd i!1381 #b00000000000000000000000000000001)))))

(assert (= (and d!128309 (not res!705218)) b!1056470))

(assert (= (and b!1056470 res!705219) b!1056471))

(assert (=> d!128309 m!976269))

(declare-fun m!976323 () Bool)

(assert (=> b!1056471 m!976323))

(assert (=> b!1056385 d!128309))

(declare-fun d!128313 () Bool)

(assert (=> d!128313 (= (validKeyInArray!0 k!2747) (and (not (= k!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1056390 d!128313))

(declare-fun d!128315 () Bool)

(assert (=> d!128315 (= (array_inv!24820 a!3488) (bvsge (size!32576 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!93130 d!128315))

(declare-fun d!128317 () Bool)

(declare-fun lt!466110 () (_ BitVec 32))

(assert (=> d!128317 (and (or (bvslt lt!466110 #b00000000000000000000000000000000) (bvsge lt!466110 (size!32576 lt!466101)) (and (bvsge lt!466110 #b00000000000000000000000000000000) (bvslt lt!466110 (size!32576 lt!466101)))) (bvsge lt!466110 #b00000000000000000000000000000000) (bvslt lt!466110 (size!32576 lt!466101)) (= (select (arr!32040 lt!466101) lt!466110) k!2747))))

(declare-fun e!600625 () (_ BitVec 32))

(assert (=> d!128317 (= lt!466110 e!600625)))

(declare-fun c!107088 () Bool)

(assert (=> d!128317 (= c!107088 (= (select (arr!32040 lt!466101) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!128317 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32576 lt!466101)) (bvslt (size!32576 lt!466101) #b01111111111111111111111111111111))))

(assert (=> d!128317 (= (arrayScanForKey!0 lt!466101 k!2747 #b00000000000000000000000000000000) lt!466110)))

(declare-fun b!1056478 () Bool)

(assert (=> b!1056478 (= e!600625 #b00000000000000000000000000000000)))

(declare-fun b!1056479 () Bool)

(assert (=> b!1056479 (= e!600625 (arrayScanForKey!0 lt!466101 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128317 c!107088) b!1056478))

(assert (= (and d!128317 (not c!107088)) b!1056479))

(declare-fun m!976327 () Bool)

(assert (=> d!128317 m!976327))

(assert (=> d!128317 m!976299))

(declare-fun m!976329 () Bool)

(assert (=> b!1056479 m!976329))

(assert (=> b!1056386 d!128317))

(push 1)

