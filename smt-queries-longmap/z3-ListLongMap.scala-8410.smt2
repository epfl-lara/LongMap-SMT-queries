; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102516 () Bool)

(assert start!102516)

(declare-fun b!1232346 () Bool)

(declare-fun res!820025 () Bool)

(declare-fun e!699181 () Bool)

(assert (=> b!1232346 (=> (not res!820025) (not e!699181))))

(declare-datatypes ((List!27125 0))(
  ( (Nil!27122) (Cons!27121 (h!28339 (_ BitVec 64)) (t!40580 List!27125)) )
))
(declare-fun acc!823 () List!27125)

(declare-fun noDuplicate!1777 (List!27125) Bool)

(assert (=> b!1232346 (= res!820025 (noDuplicate!1777 acc!823))))

(declare-fun b!1232347 () Bool)

(declare-fun res!820017 () Bool)

(assert (=> b!1232347 (=> (not res!820017) (not e!699181))))

(declare-datatypes ((array!79454 0))(
  ( (array!79455 (arr!38339 (Array (_ BitVec 32) (_ BitVec 64))) (size!38876 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79454)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79454 (_ BitVec 32) List!27125) Bool)

(assert (=> b!1232347 (= res!820017 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1232348 () Bool)

(declare-fun res!820016 () Bool)

(assert (=> b!1232348 (=> (not res!820016) (not e!699181))))

(declare-fun contains!7196 (List!27125 (_ BitVec 64)) Bool)

(assert (=> b!1232348 (= res!820016 (not (contains!7196 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1232349 () Bool)

(declare-fun e!699180 () Bool)

(assert (=> b!1232349 (= e!699181 (not e!699180))))

(declare-fun res!820024 () Bool)

(assert (=> b!1232349 (=> res!820024 e!699180)))

(assert (=> b!1232349 (= res!820024 (bvsgt from!3184 (size!38876 a!3806)))))

(assert (=> b!1232349 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27121 (select (arr!38339 a!3806) from!3184) acc!823))))

(declare-fun b!1232351 () Bool)

(declare-fun res!820021 () Bool)

(assert (=> b!1232351 (=> (not res!820021) (not e!699181))))

(assert (=> b!1232351 (= res!820021 (not (contains!7196 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1232352 () Bool)

(declare-fun res!820015 () Bool)

(assert (=> b!1232352 (=> (not res!820015) (not e!699181))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1232352 (= res!820015 (validKeyInArray!0 k0!2913))))

(declare-fun b!1232353 () Bool)

(declare-fun res!820019 () Bool)

(assert (=> b!1232353 (=> (not res!820019) (not e!699181))))

(declare-fun arrayContainsKey!0 (array!79454 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1232353 (= res!820019 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1232354 () Bool)

(declare-fun res!820018 () Bool)

(assert (=> b!1232354 (=> (not res!820018) (not e!699181))))

(assert (=> b!1232354 (= res!820018 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38876 a!3806)) (bvslt from!3184 (size!38876 a!3806))))))

(declare-fun res!820022 () Bool)

(assert (=> start!102516 (=> (not res!820022) (not e!699181))))

(assert (=> start!102516 (= res!820022 (bvslt (size!38876 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102516 e!699181))

(declare-fun array_inv!29277 (array!79454) Bool)

(assert (=> start!102516 (array_inv!29277 a!3806)))

(assert (=> start!102516 true))

(declare-fun b!1232350 () Bool)

(declare-fun res!820023 () Bool)

(assert (=> b!1232350 (=> (not res!820023) (not e!699181))))

(assert (=> b!1232350 (= res!820023 (validKeyInArray!0 (select (arr!38339 a!3806) from!3184)))))

(declare-fun b!1232355 () Bool)

(declare-fun e!699179 () Bool)

(assert (=> b!1232355 (= e!699179 (not (contains!7196 Nil!27122 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1232356 () Bool)

(assert (=> b!1232356 (= e!699180 e!699179)))

(declare-fun res!820020 () Bool)

(assert (=> b!1232356 (=> (not res!820020) (not e!699179))))

(assert (=> b!1232356 (= res!820020 (not (contains!7196 Nil!27122 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102516 res!820022) b!1232352))

(assert (= (and b!1232352 res!820015) b!1232354))

(assert (= (and b!1232354 res!820018) b!1232346))

(assert (= (and b!1232346 res!820025) b!1232351))

(assert (= (and b!1232351 res!820021) b!1232348))

(assert (= (and b!1232348 res!820016) b!1232353))

(assert (= (and b!1232353 res!820019) b!1232347))

(assert (= (and b!1232347 res!820017) b!1232350))

(assert (= (and b!1232350 res!820023) b!1232349))

(assert (= (and b!1232349 (not res!820024)) b!1232356))

(assert (= (and b!1232356 res!820020) b!1232355))

(declare-fun m!1136925 () Bool)

(assert (=> start!102516 m!1136925))

(declare-fun m!1136927 () Bool)

(assert (=> b!1232356 m!1136927))

(declare-fun m!1136929 () Bool)

(assert (=> b!1232352 m!1136929))

(declare-fun m!1136931 () Bool)

(assert (=> b!1232349 m!1136931))

(declare-fun m!1136933 () Bool)

(assert (=> b!1232349 m!1136933))

(assert (=> b!1232350 m!1136931))

(assert (=> b!1232350 m!1136931))

(declare-fun m!1136935 () Bool)

(assert (=> b!1232350 m!1136935))

(declare-fun m!1136937 () Bool)

(assert (=> b!1232346 m!1136937))

(declare-fun m!1136939 () Bool)

(assert (=> b!1232351 m!1136939))

(declare-fun m!1136941 () Bool)

(assert (=> b!1232355 m!1136941))

(declare-fun m!1136943 () Bool)

(assert (=> b!1232348 m!1136943))

(declare-fun m!1136945 () Bool)

(assert (=> b!1232347 m!1136945))

(declare-fun m!1136947 () Bool)

(assert (=> b!1232353 m!1136947))

(check-sat (not b!1232352) (not b!1232347) (not start!102516) (not b!1232350) (not b!1232353) (not b!1232356) (not b!1232348) (not b!1232349) (not b!1232351) (not b!1232355) (not b!1232346))
(check-sat)
(get-model)

(declare-fun b!1232433 () Bool)

(declare-fun e!699218 () Bool)

(declare-fun e!699217 () Bool)

(assert (=> b!1232433 (= e!699218 e!699217)))

(declare-fun c!121035 () Bool)

(assert (=> b!1232433 (= c!121035 (validKeyInArray!0 (select (arr!38339 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1232434 () Bool)

(declare-fun call!60936 () Bool)

(assert (=> b!1232434 (= e!699217 call!60936)))

(declare-fun b!1232435 () Bool)

(declare-fun e!699215 () Bool)

(assert (=> b!1232435 (= e!699215 (contains!7196 (Cons!27121 (select (arr!38339 a!3806) from!3184) acc!823) (select (arr!38339 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1232436 () Bool)

(declare-fun e!699216 () Bool)

(assert (=> b!1232436 (= e!699216 e!699218)))

(declare-fun res!820100 () Bool)

(assert (=> b!1232436 (=> (not res!820100) (not e!699218))))

(assert (=> b!1232436 (= res!820100 (not e!699215))))

(declare-fun res!820098 () Bool)

(assert (=> b!1232436 (=> (not res!820098) (not e!699215))))

(assert (=> b!1232436 (= res!820098 (validKeyInArray!0 (select (arr!38339 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1232437 () Bool)

(assert (=> b!1232437 (= e!699217 call!60936)))

(declare-fun bm!60933 () Bool)

(assert (=> bm!60933 (= call!60936 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!121035 (Cons!27121 (select (arr!38339 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27121 (select (arr!38339 a!3806) from!3184) acc!823)) (Cons!27121 (select (arr!38339 a!3806) from!3184) acc!823))))))

(declare-fun d!135103 () Bool)

(declare-fun res!820099 () Bool)

(assert (=> d!135103 (=> res!820099 e!699216)))

(assert (=> d!135103 (= res!820099 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38876 a!3806)))))

(assert (=> d!135103 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27121 (select (arr!38339 a!3806) from!3184) acc!823)) e!699216)))

(assert (= (and d!135103 (not res!820099)) b!1232436))

(assert (= (and b!1232436 res!820098) b!1232435))

(assert (= (and b!1232436 res!820100) b!1232433))

(assert (= (and b!1232433 c!121035) b!1232437))

(assert (= (and b!1232433 (not c!121035)) b!1232434))

(assert (= (or b!1232437 b!1232434) bm!60933))

(declare-fun m!1136997 () Bool)

(assert (=> b!1232433 m!1136997))

(assert (=> b!1232433 m!1136997))

(declare-fun m!1136999 () Bool)

(assert (=> b!1232433 m!1136999))

(assert (=> b!1232435 m!1136997))

(assert (=> b!1232435 m!1136997))

(declare-fun m!1137001 () Bool)

(assert (=> b!1232435 m!1137001))

(assert (=> b!1232436 m!1136997))

(assert (=> b!1232436 m!1136997))

(assert (=> b!1232436 m!1136999))

(assert (=> bm!60933 m!1136997))

(declare-fun m!1137003 () Bool)

(assert (=> bm!60933 m!1137003))

(assert (=> b!1232349 d!135103))

(declare-fun d!135107 () Bool)

(assert (=> d!135107 (= (array_inv!29277 a!3806) (bvsge (size!38876 a!3806) #b00000000000000000000000000000000))))

(assert (=> start!102516 d!135107))

(declare-fun b!1232438 () Bool)

(declare-fun e!699222 () Bool)

(declare-fun e!699221 () Bool)

(assert (=> b!1232438 (= e!699222 e!699221)))

(declare-fun c!121036 () Bool)

(assert (=> b!1232438 (= c!121036 (validKeyInArray!0 (select (arr!38339 a!3806) from!3184)))))

(declare-fun b!1232439 () Bool)

(declare-fun call!60937 () Bool)

(assert (=> b!1232439 (= e!699221 call!60937)))

(declare-fun e!699219 () Bool)

(declare-fun b!1232440 () Bool)

(assert (=> b!1232440 (= e!699219 (contains!7196 acc!823 (select (arr!38339 a!3806) from!3184)))))

(declare-fun b!1232441 () Bool)

(declare-fun e!699220 () Bool)

(assert (=> b!1232441 (= e!699220 e!699222)))

(declare-fun res!820103 () Bool)

(assert (=> b!1232441 (=> (not res!820103) (not e!699222))))

(assert (=> b!1232441 (= res!820103 (not e!699219))))

(declare-fun res!820101 () Bool)

(assert (=> b!1232441 (=> (not res!820101) (not e!699219))))

(assert (=> b!1232441 (= res!820101 (validKeyInArray!0 (select (arr!38339 a!3806) from!3184)))))

(declare-fun b!1232442 () Bool)

(assert (=> b!1232442 (= e!699221 call!60937)))

(declare-fun bm!60934 () Bool)

(assert (=> bm!60934 (= call!60937 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!121036 (Cons!27121 (select (arr!38339 a!3806) from!3184) acc!823) acc!823)))))

(declare-fun d!135109 () Bool)

(declare-fun res!820102 () Bool)

(assert (=> d!135109 (=> res!820102 e!699220)))

(assert (=> d!135109 (= res!820102 (bvsge from!3184 (size!38876 a!3806)))))

(assert (=> d!135109 (= (arrayNoDuplicates!0 a!3806 from!3184 acc!823) e!699220)))

(assert (= (and d!135109 (not res!820102)) b!1232441))

(assert (= (and b!1232441 res!820101) b!1232440))

(assert (= (and b!1232441 res!820103) b!1232438))

(assert (= (and b!1232438 c!121036) b!1232442))

(assert (= (and b!1232438 (not c!121036)) b!1232439))

(assert (= (or b!1232442 b!1232439) bm!60934))

(assert (=> b!1232438 m!1136931))

(assert (=> b!1232438 m!1136931))

(assert (=> b!1232438 m!1136935))

(assert (=> b!1232440 m!1136931))

(assert (=> b!1232440 m!1136931))

(declare-fun m!1137005 () Bool)

(assert (=> b!1232440 m!1137005))

(assert (=> b!1232441 m!1136931))

(assert (=> b!1232441 m!1136931))

(assert (=> b!1232441 m!1136935))

(assert (=> bm!60934 m!1136931))

(declare-fun m!1137007 () Bool)

(assert (=> bm!60934 m!1137007))

(assert (=> b!1232347 d!135109))

(declare-fun d!135111 () Bool)

(declare-fun lt!559872 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!564 (List!27125) (InoxSet (_ BitVec 64)))

(assert (=> d!135111 (= lt!559872 (select (content!564 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!699236 () Bool)

(assert (=> d!135111 (= lt!559872 e!699236)))

(declare-fun res!820115 () Bool)

(assert (=> d!135111 (=> (not res!820115) (not e!699236))))

(get-info :version)

(assert (=> d!135111 (= res!820115 ((_ is Cons!27121) acc!823))))

(assert (=> d!135111 (= (contains!7196 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559872)))

(declare-fun b!1232457 () Bool)

(declare-fun e!699235 () Bool)

(assert (=> b!1232457 (= e!699236 e!699235)))

(declare-fun res!820114 () Bool)

(assert (=> b!1232457 (=> res!820114 e!699235)))

(assert (=> b!1232457 (= res!820114 (= (h!28339 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1232458 () Bool)

(assert (=> b!1232458 (= e!699235 (contains!7196 (t!40580 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135111 res!820115) b!1232457))

(assert (= (and b!1232457 (not res!820114)) b!1232458))

(declare-fun m!1137009 () Bool)

(assert (=> d!135111 m!1137009))

(declare-fun m!1137011 () Bool)

(assert (=> d!135111 m!1137011))

(declare-fun m!1137013 () Bool)

(assert (=> b!1232458 m!1137013))

(assert (=> b!1232348 d!135111))

(declare-fun d!135113 () Bool)

(declare-fun res!820123 () Bool)

(declare-fun e!699245 () Bool)

(assert (=> d!135113 (=> res!820123 e!699245)))

(assert (=> d!135113 (= res!820123 (= (select (arr!38339 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) k0!2913))))

(assert (=> d!135113 (= (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)) e!699245)))

(declare-fun b!1232468 () Bool)

(declare-fun e!699246 () Bool)

(assert (=> b!1232468 (= e!699245 e!699246)))

(declare-fun res!820124 () Bool)

(assert (=> b!1232468 (=> (not res!820124) (not e!699246))))

(assert (=> b!1232468 (= res!820124 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38876 a!3806)))))

(declare-fun b!1232469 () Bool)

(assert (=> b!1232469 (= e!699246 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)))))

(assert (= (and d!135113 (not res!820123)) b!1232468))

(assert (= (and b!1232468 res!820124) b!1232469))

(assert (=> d!135113 m!1136997))

(declare-fun m!1137023 () Bool)

(assert (=> b!1232469 m!1137023))

(assert (=> b!1232353 d!135113))

(declare-fun d!135117 () Bool)

(declare-fun res!820138 () Bool)

(declare-fun e!699261 () Bool)

(assert (=> d!135117 (=> res!820138 e!699261)))

(assert (=> d!135117 (= res!820138 ((_ is Nil!27122) acc!823))))

(assert (=> d!135117 (= (noDuplicate!1777 acc!823) e!699261)))

(declare-fun b!1232485 () Bool)

(declare-fun e!699262 () Bool)

(assert (=> b!1232485 (= e!699261 e!699262)))

(declare-fun res!820139 () Bool)

(assert (=> b!1232485 (=> (not res!820139) (not e!699262))))

(assert (=> b!1232485 (= res!820139 (not (contains!7196 (t!40580 acc!823) (h!28339 acc!823))))))

(declare-fun b!1232486 () Bool)

(assert (=> b!1232486 (= e!699262 (noDuplicate!1777 (t!40580 acc!823)))))

(assert (= (and d!135117 (not res!820138)) b!1232485))

(assert (= (and b!1232485 res!820139) b!1232486))

(declare-fun m!1137031 () Bool)

(assert (=> b!1232485 m!1137031))

(declare-fun m!1137033 () Bool)

(assert (=> b!1232486 m!1137033))

(assert (=> b!1232346 d!135117))

(declare-fun d!135123 () Bool)

(declare-fun lt!559876 () Bool)

(assert (=> d!135123 (= lt!559876 (select (content!564 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!699264 () Bool)

(assert (=> d!135123 (= lt!559876 e!699264)))

(declare-fun res!820141 () Bool)

(assert (=> d!135123 (=> (not res!820141) (not e!699264))))

(assert (=> d!135123 (= res!820141 ((_ is Cons!27121) acc!823))))

(assert (=> d!135123 (= (contains!7196 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000) lt!559876)))

(declare-fun b!1232487 () Bool)

(declare-fun e!699263 () Bool)

(assert (=> b!1232487 (= e!699264 e!699263)))

(declare-fun res!820140 () Bool)

(assert (=> b!1232487 (=> res!820140 e!699263)))

(assert (=> b!1232487 (= res!820140 (= (h!28339 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1232488 () Bool)

(assert (=> b!1232488 (= e!699263 (contains!7196 (t!40580 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135123 res!820141) b!1232487))

(assert (= (and b!1232487 (not res!820140)) b!1232488))

(assert (=> d!135123 m!1137009))

(declare-fun m!1137037 () Bool)

(assert (=> d!135123 m!1137037))

(declare-fun m!1137039 () Bool)

(assert (=> b!1232488 m!1137039))

(assert (=> b!1232351 d!135123))

(declare-fun d!135125 () Bool)

(assert (=> d!135125 (= (validKeyInArray!0 k0!2913) (and (not (= k0!2913 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2913 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1232352 d!135125))

(declare-fun d!135129 () Bool)

(assert (=> d!135129 (= (validKeyInArray!0 (select (arr!38339 a!3806) from!3184)) (and (not (= (select (arr!38339 a!3806) from!3184) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38339 a!3806) from!3184) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1232350 d!135129))

(declare-fun d!135133 () Bool)

(declare-fun lt!559877 () Bool)

(assert (=> d!135133 (= lt!559877 (select (content!564 Nil!27122) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!699266 () Bool)

(assert (=> d!135133 (= lt!559877 e!699266)))

(declare-fun res!820143 () Bool)

(assert (=> d!135133 (=> (not res!820143) (not e!699266))))

(assert (=> d!135133 (= res!820143 ((_ is Cons!27121) Nil!27122))))

(assert (=> d!135133 (= (contains!7196 Nil!27122 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559877)))

(declare-fun b!1232489 () Bool)

(declare-fun e!699265 () Bool)

(assert (=> b!1232489 (= e!699266 e!699265)))

(declare-fun res!820142 () Bool)

(assert (=> b!1232489 (=> res!820142 e!699265)))

(assert (=> b!1232489 (= res!820142 (= (h!28339 Nil!27122) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1232490 () Bool)

(assert (=> b!1232490 (= e!699265 (contains!7196 (t!40580 Nil!27122) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135133 res!820143) b!1232489))

(assert (= (and b!1232489 (not res!820142)) b!1232490))

(declare-fun m!1137043 () Bool)

(assert (=> d!135133 m!1137043))

(declare-fun m!1137045 () Bool)

(assert (=> d!135133 m!1137045))

(declare-fun m!1137049 () Bool)

(assert (=> b!1232490 m!1137049))

(assert (=> b!1232355 d!135133))

(declare-fun d!135137 () Bool)

(declare-fun lt!559879 () Bool)

(assert (=> d!135137 (= lt!559879 (select (content!564 Nil!27122) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!699270 () Bool)

(assert (=> d!135137 (= lt!559879 e!699270)))

(declare-fun res!820147 () Bool)

(assert (=> d!135137 (=> (not res!820147) (not e!699270))))

(assert (=> d!135137 (= res!820147 ((_ is Cons!27121) Nil!27122))))

(assert (=> d!135137 (= (contains!7196 Nil!27122 #b0000000000000000000000000000000000000000000000000000000000000000) lt!559879)))

(declare-fun b!1232493 () Bool)

(declare-fun e!699269 () Bool)

(assert (=> b!1232493 (= e!699270 e!699269)))

(declare-fun res!820146 () Bool)

(assert (=> b!1232493 (=> res!820146 e!699269)))

(assert (=> b!1232493 (= res!820146 (= (h!28339 Nil!27122) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1232494 () Bool)

(assert (=> b!1232494 (= e!699269 (contains!7196 (t!40580 Nil!27122) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135137 res!820147) b!1232493))

(assert (= (and b!1232493 (not res!820146)) b!1232494))

(assert (=> d!135137 m!1137043))

(declare-fun m!1137055 () Bool)

(assert (=> d!135137 m!1137055))

(declare-fun m!1137057 () Bool)

(assert (=> b!1232494 m!1137057))

(assert (=> b!1232356 d!135137))

(check-sat (not b!1232458) (not b!1232488) (not bm!60934) (not b!1232469) (not d!135111) (not bm!60933) (not b!1232435) (not b!1232436) (not b!1232485) (not d!135133) (not d!135137) (not b!1232438) (not b!1232490) (not b!1232441) (not d!135123) (not b!1232494) (not b!1232433) (not b!1232486) (not b!1232440))
(check-sat)
