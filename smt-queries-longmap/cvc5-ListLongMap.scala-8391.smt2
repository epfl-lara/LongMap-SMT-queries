; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102072 () Bool)

(assert start!102072)

(declare-fun b!1228734 () Bool)

(declare-fun res!817293 () Bool)

(declare-fun e!697435 () Bool)

(assert (=> b!1228734 (=> (not res!817293) (not e!697435))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1228734 (= res!817293 (validKeyInArray!0 k!2913))))

(declare-fun b!1228735 () Bool)

(declare-fun e!697437 () Bool)

(assert (=> b!1228735 (= e!697435 (not e!697437))))

(declare-fun res!817294 () Bool)

(assert (=> b!1228735 (=> res!817294 e!697437)))

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1228735 (= res!817294 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(declare-datatypes ((List!27043 0))(
  ( (Nil!27040) (Cons!27039 (h!28248 (_ BitVec 64)) (t!40506 List!27043)) )
))
(declare-fun lt!559043 () List!27043)

(declare-datatypes ((array!79298 0))(
  ( (array!79299 (arr!38270 (Array (_ BitVec 32) (_ BitVec 64))) (size!38806 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79298)

(assert (=> b!1228735 (= lt!559043 (Cons!27039 (select (arr!38270 a!3806) from!3184) Nil!27040))))

(declare-fun arrayNoDuplicates!0 (array!79298 (_ BitVec 32) List!27043) Bool)

(assert (=> b!1228735 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27040)))

(declare-datatypes ((Unit!40706 0))(
  ( (Unit!40707) )
))
(declare-fun lt!559042 () Unit!40706)

(declare-fun acc!823 () List!27043)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79298 List!27043 List!27043 (_ BitVec 32)) Unit!40706)

(assert (=> b!1228735 (= lt!559042 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27040 from!3184))))

(assert (=> b!1228735 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27039 (select (arr!38270 a!3806) from!3184) acc!823))))

(declare-fun b!1228736 () Bool)

(declare-fun res!817292 () Bool)

(assert (=> b!1228736 (=> (not res!817292) (not e!697435))))

(assert (=> b!1228736 (= res!817292 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38806 a!3806)) (bvslt from!3184 (size!38806 a!3806))))))

(declare-fun b!1228737 () Bool)

(declare-fun res!817299 () Bool)

(assert (=> b!1228737 (=> (not res!817299) (not e!697435))))

(declare-fun arrayContainsKey!0 (array!79298 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1228737 (= res!817299 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1228738 () Bool)

(declare-fun res!817298 () Bool)

(assert (=> b!1228738 (=> (not res!817298) (not e!697435))))

(declare-fun noDuplicate!1702 (List!27043) Bool)

(assert (=> b!1228738 (= res!817298 (noDuplicate!1702 acc!823))))

(declare-fun b!1228739 () Bool)

(declare-fun res!817300 () Bool)

(assert (=> b!1228739 (=> (not res!817300) (not e!697435))))

(declare-fun contains!7105 (List!27043 (_ BitVec 64)) Bool)

(assert (=> b!1228739 (= res!817300 (not (contains!7105 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!817297 () Bool)

(assert (=> start!102072 (=> (not res!817297) (not e!697435))))

(assert (=> start!102072 (= res!817297 (bvslt (size!38806 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102072 e!697435))

(declare-fun array_inv!29118 (array!79298) Bool)

(assert (=> start!102072 (array_inv!29118 a!3806)))

(assert (=> start!102072 true))

(declare-fun b!1228740 () Bool)

(declare-fun e!697436 () Bool)

(assert (=> b!1228740 (= e!697436 (not (contains!7105 lt!559043 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228741 () Bool)

(assert (=> b!1228741 (= e!697437 e!697436)))

(declare-fun res!817301 () Bool)

(assert (=> b!1228741 (=> (not res!817301) (not e!697436))))

(assert (=> b!1228741 (= res!817301 (not (contains!7105 lt!559043 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228742 () Bool)

(declare-fun res!817296 () Bool)

(assert (=> b!1228742 (=> res!817296 e!697437)))

(assert (=> b!1228742 (= res!817296 (not (noDuplicate!1702 lt!559043)))))

(declare-fun b!1228743 () Bool)

(declare-fun res!817302 () Bool)

(assert (=> b!1228743 (=> (not res!817302) (not e!697435))))

(assert (=> b!1228743 (= res!817302 (not (contains!7105 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228744 () Bool)

(declare-fun res!817303 () Bool)

(assert (=> b!1228744 (=> (not res!817303) (not e!697435))))

(assert (=> b!1228744 (= res!817303 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1228745 () Bool)

(declare-fun res!817295 () Bool)

(assert (=> b!1228745 (=> (not res!817295) (not e!697435))))

(assert (=> b!1228745 (= res!817295 (validKeyInArray!0 (select (arr!38270 a!3806) from!3184)))))

(assert (= (and start!102072 res!817297) b!1228734))

(assert (= (and b!1228734 res!817293) b!1228736))

(assert (= (and b!1228736 res!817292) b!1228738))

(assert (= (and b!1228738 res!817298) b!1228743))

(assert (= (and b!1228743 res!817302) b!1228739))

(assert (= (and b!1228739 res!817300) b!1228737))

(assert (= (and b!1228737 res!817299) b!1228744))

(assert (= (and b!1228744 res!817303) b!1228745))

(assert (= (and b!1228745 res!817295) b!1228735))

(assert (= (and b!1228735 (not res!817294)) b!1228742))

(assert (= (and b!1228742 (not res!817296)) b!1228741))

(assert (= (and b!1228741 res!817301) b!1228740))

(declare-fun m!1133287 () Bool)

(assert (=> b!1228735 m!1133287))

(declare-fun m!1133289 () Bool)

(assert (=> b!1228735 m!1133289))

(declare-fun m!1133291 () Bool)

(assert (=> b!1228735 m!1133291))

(declare-fun m!1133293 () Bool)

(assert (=> b!1228735 m!1133293))

(declare-fun m!1133295 () Bool)

(assert (=> b!1228740 m!1133295))

(declare-fun m!1133297 () Bool)

(assert (=> b!1228742 m!1133297))

(declare-fun m!1133299 () Bool)

(assert (=> start!102072 m!1133299))

(assert (=> b!1228745 m!1133287))

(assert (=> b!1228745 m!1133287))

(declare-fun m!1133301 () Bool)

(assert (=> b!1228745 m!1133301))

(declare-fun m!1133303 () Bool)

(assert (=> b!1228734 m!1133303))

(declare-fun m!1133305 () Bool)

(assert (=> b!1228739 m!1133305))

(declare-fun m!1133307 () Bool)

(assert (=> b!1228737 m!1133307))

(declare-fun m!1133309 () Bool)

(assert (=> b!1228738 m!1133309))

(declare-fun m!1133311 () Bool)

(assert (=> b!1228743 m!1133311))

(declare-fun m!1133313 () Bool)

(assert (=> b!1228744 m!1133313))

(declare-fun m!1133315 () Bool)

(assert (=> b!1228741 m!1133315))

(push 1)

(assert (not b!1228738))

(assert (not b!1228742))

(assert (not b!1228745))

(assert (not b!1228741))

(assert (not b!1228735))

(assert (not start!102072))

(assert (not b!1228744))

(assert (not b!1228737))

(assert (not b!1228739))

(assert (not b!1228740))

(assert (not b!1228734))

(assert (not b!1228743))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!134349 () Bool)

(declare-fun res!817398 () Bool)

(declare-fun e!697486 () Bool)

(assert (=> d!134349 (=> res!817398 e!697486)))

(assert (=> d!134349 (= res!817398 (is-Nil!27040 acc!823))))

(assert (=> d!134349 (= (noDuplicate!1702 acc!823) e!697486)))

(declare-fun b!1228844 () Bool)

(declare-fun e!697487 () Bool)

(assert (=> b!1228844 (= e!697486 e!697487)))

(declare-fun res!817399 () Bool)

(assert (=> b!1228844 (=> (not res!817399) (not e!697487))))

(assert (=> b!1228844 (= res!817399 (not (contains!7105 (t!40506 acc!823) (h!28248 acc!823))))))

(declare-fun b!1228845 () Bool)

(assert (=> b!1228845 (= e!697487 (noDuplicate!1702 (t!40506 acc!823)))))

(assert (= (and d!134349 (not res!817398)) b!1228844))

(assert (= (and b!1228844 res!817399) b!1228845))

(declare-fun m!1133387 () Bool)

(assert (=> b!1228844 m!1133387))

(declare-fun m!1133389 () Bool)

(assert (=> b!1228845 m!1133389))

(assert (=> b!1228738 d!134349))

(declare-fun d!134355 () Bool)

(declare-fun res!817413 () Bool)

(declare-fun e!697502 () Bool)

(assert (=> d!134355 (=> res!817413 e!697502)))

(assert (=> d!134355 (= res!817413 (= (select (arr!38270 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) k!2913))))

(assert (=> d!134355 (= (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)) e!697502)))

(declare-fun b!1228861 () Bool)

(declare-fun e!697503 () Bool)

(assert (=> b!1228861 (= e!697502 e!697503)))

(declare-fun res!817414 () Bool)

(assert (=> b!1228861 (=> (not res!817414) (not e!697503))))

(assert (=> b!1228861 (= res!817414 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38806 a!3806)))))

(declare-fun b!1228862 () Bool)

(assert (=> b!1228862 (= e!697503 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)))))

(assert (= (and d!134355 (not res!817413)) b!1228861))

(assert (= (and b!1228861 res!817414) b!1228862))

(declare-fun m!1133399 () Bool)

(assert (=> d!134355 m!1133399))

(declare-fun m!1133401 () Bool)

(assert (=> b!1228862 m!1133401))

(assert (=> b!1228737 d!134355))

(declare-fun d!134361 () Bool)

(declare-fun lt!559064 () Bool)

(declare-fun content!557 (List!27043) (Set (_ BitVec 64)))

(assert (=> d!134361 (= lt!559064 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!557 lt!559043)))))

(declare-fun e!697520 () Bool)

(assert (=> d!134361 (= lt!559064 e!697520)))

(declare-fun res!817429 () Bool)

(assert (=> d!134361 (=> (not res!817429) (not e!697520))))

(assert (=> d!134361 (= res!817429 (is-Cons!27039 lt!559043))))

(assert (=> d!134361 (= (contains!7105 lt!559043 #b0000000000000000000000000000000000000000000000000000000000000000) lt!559064)))

(declare-fun b!1228882 () Bool)

(declare-fun e!697521 () Bool)

(assert (=> b!1228882 (= e!697520 e!697521)))

(declare-fun res!817428 () Bool)

(assert (=> b!1228882 (=> res!817428 e!697521)))

(assert (=> b!1228882 (= res!817428 (= (h!28248 lt!559043) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228883 () Bool)

(assert (=> b!1228883 (= e!697521 (contains!7105 (t!40506 lt!559043) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134361 res!817429) b!1228882))

(assert (= (and b!1228882 (not res!817428)) b!1228883))

(declare-fun m!1133411 () Bool)

(assert (=> d!134361 m!1133411))

(declare-fun m!1133413 () Bool)

(assert (=> d!134361 m!1133413))

(declare-fun m!1133415 () Bool)

(assert (=> b!1228883 m!1133415))

(assert (=> b!1228741 d!134361))

(declare-fun d!134367 () Bool)

(assert (=> d!134367 (= (array_inv!29118 a!3806) (bvsge (size!38806 a!3806) #b00000000000000000000000000000000))))

(assert (=> start!102072 d!134367))

(declare-fun d!134369 () Bool)

(declare-fun lt!559065 () Bool)

(assert (=> d!134369 (= lt!559065 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!557 lt!559043)))))

(declare-fun e!697522 () Bool)

(assert (=> d!134369 (= lt!559065 e!697522)))

(declare-fun res!817431 () Bool)

(assert (=> d!134369 (=> (not res!817431) (not e!697522))))

(assert (=> d!134369 (= res!817431 (is-Cons!27039 lt!559043))))

(assert (=> d!134369 (= (contains!7105 lt!559043 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559065)))

(declare-fun b!1228884 () Bool)

(declare-fun e!697523 () Bool)

(assert (=> b!1228884 (= e!697522 e!697523)))

(declare-fun res!817430 () Bool)

(assert (=> b!1228884 (=> res!817430 e!697523)))

(assert (=> b!1228884 (= res!817430 (= (h!28248 lt!559043) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228885 () Bool)

(assert (=> b!1228885 (= e!697523 (contains!7105 (t!40506 lt!559043) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134369 res!817431) b!1228884))

(assert (= (and b!1228884 (not res!817430)) b!1228885))

(assert (=> d!134369 m!1133411))

(declare-fun m!1133417 () Bool)

(assert (=> d!134369 m!1133417))

(declare-fun m!1133419 () Bool)

(assert (=> b!1228885 m!1133419))

(assert (=> b!1228740 d!134369))

(declare-fun d!134373 () Bool)

(declare-fun lt!559066 () Bool)

(assert (=> d!134373 (= lt!559066 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!557 acc!823)))))

(declare-fun e!697528 () Bool)

(assert (=> d!134373 (= lt!559066 e!697528)))

(declare-fun res!817436 () Bool)

(assert (=> d!134373 (=> (not res!817436) (not e!697528))))

(assert (=> d!134373 (= res!817436 (is-Cons!27039 acc!823))))

(assert (=> d!134373 (= (contains!7105 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559066)))

(declare-fun b!1228891 () Bool)

(declare-fun e!697529 () Bool)

(assert (=> b!1228891 (= e!697528 e!697529)))

(declare-fun res!817435 () Bool)

(assert (=> b!1228891 (=> res!817435 e!697529)))

(assert (=> b!1228891 (= res!817435 (= (h!28248 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228892 () Bool)

(assert (=> b!1228892 (= e!697529 (contains!7105 (t!40506 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134373 res!817436) b!1228891))

(assert (= (and b!1228891 (not res!817435)) b!1228892))

(declare-fun m!1133421 () Bool)

(assert (=> d!134373 m!1133421))

(declare-fun m!1133423 () Bool)

(assert (=> d!134373 m!1133423))

(declare-fun m!1133425 () Bool)

(assert (=> b!1228892 m!1133425))

(assert (=> b!1228739 d!134373))

(declare-fun b!1228927 () Bool)

(declare-fun e!697560 () Bool)

(declare-fun call!60841 () Bool)

(assert (=> b!1228927 (= e!697560 call!60841)))

(declare-fun c!120592 () Bool)

(declare-fun bm!60838 () Bool)

(assert (=> bm!60838 (= call!60841 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120592 (Cons!27039 (select (arr!38270 a!3806) from!3184) acc!823) acc!823)))))

(declare-fun b!1228928 () Bool)

(assert (=> b!1228928 (= e!697560 call!60841)))

(declare-fun b!1228929 () Bool)

(declare-fun e!697562 () Bool)

(assert (=> b!1228929 (= e!697562 e!697560)))

(assert (=> b!1228929 (= c!120592 (validKeyInArray!0 (select (arr!38270 a!3806) from!3184)))))

(declare-fun b!1228930 () Bool)

(declare-fun e!697561 () Bool)

(assert (=> b!1228930 (= e!697561 (contains!7105 acc!823 (select (arr!38270 a!3806) from!3184)))))

(declare-fun d!134375 () Bool)

(declare-fun res!817463 () Bool)

(declare-fun e!697563 () Bool)

(assert (=> d!134375 (=> res!817463 e!697563)))

(assert (=> d!134375 (= res!817463 (bvsge from!3184 (size!38806 a!3806)))))

(assert (=> d!134375 (= (arrayNoDuplicates!0 a!3806 from!3184 acc!823) e!697563)))

(declare-fun b!1228931 () Bool)

(assert (=> b!1228931 (= e!697563 e!697562)))

(declare-fun res!817465 () Bool)

(assert (=> b!1228931 (=> (not res!817465) (not e!697562))))

(assert (=> b!1228931 (= res!817465 (not e!697561))))

(declare-fun res!817464 () Bool)

(assert (=> b!1228931 (=> (not res!817464) (not e!697561))))

(assert (=> b!1228931 (= res!817464 (validKeyInArray!0 (select (arr!38270 a!3806) from!3184)))))

(assert (= (and d!134375 (not res!817463)) b!1228931))

(assert (= (and b!1228931 res!817464) b!1228930))

(assert (= (and b!1228931 res!817465) b!1228929))

(assert (= (and b!1228929 c!120592) b!1228927))

(assert (= (and b!1228929 (not c!120592)) b!1228928))

(assert (= (or b!1228927 b!1228928) bm!60838))

(assert (=> bm!60838 m!1133287))

(declare-fun m!1133465 () Bool)

(assert (=> bm!60838 m!1133465))

(assert (=> b!1228929 m!1133287))

(assert (=> b!1228929 m!1133287))

(assert (=> b!1228929 m!1133301))

(assert (=> b!1228930 m!1133287))

(assert (=> b!1228930 m!1133287))

(declare-fun m!1133467 () Bool)

(assert (=> b!1228930 m!1133467))

(assert (=> b!1228931 m!1133287))

(assert (=> b!1228931 m!1133287))

(assert (=> b!1228931 m!1133301))

(assert (=> b!1228744 d!134375))

(declare-fun d!134395 () Bool)

(declare-fun lt!559073 () Bool)

(assert (=> d!134395 (= lt!559073 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!557 acc!823)))))

(declare-fun e!697564 () Bool)

(assert (=> d!134395 (= lt!559073 e!697564)))

(declare-fun res!817467 () Bool)

(assert (=> d!134395 (=> (not res!817467) (not e!697564))))

(assert (=> d!134395 (= res!817467 (is-Cons!27039 acc!823))))

(assert (=> d!134395 (= (contains!7105 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000) lt!559073)))

(declare-fun b!1228932 () Bool)

(declare-fun e!697565 () Bool)

(assert (=> b!1228932 (= e!697564 e!697565)))

(declare-fun res!817466 () Bool)

(assert (=> b!1228932 (=> res!817466 e!697565)))

(assert (=> b!1228932 (= res!817466 (= (h!28248 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228933 () Bool)

(assert (=> b!1228933 (= e!697565 (contains!7105 (t!40506 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134395 res!817467) b!1228932))

(assert (= (and b!1228932 (not res!817466)) b!1228933))

(assert (=> d!134395 m!1133421))

(declare-fun m!1133469 () Bool)

(assert (=> d!134395 m!1133469))

(declare-fun m!1133471 () Bool)

(assert (=> b!1228933 m!1133471))

(assert (=> b!1228743 d!134395))

(declare-fun d!134397 () Bool)

(declare-fun res!817468 () Bool)

(declare-fun e!697566 () Bool)

(assert (=> d!134397 (=> res!817468 e!697566)))

(assert (=> d!134397 (= res!817468 (is-Nil!27040 lt!559043))))

(assert (=> d!134397 (= (noDuplicate!1702 lt!559043) e!697566)))

(declare-fun b!1228934 () Bool)

(declare-fun e!697567 () Bool)

(assert (=> b!1228934 (= e!697566 e!697567)))

(declare-fun res!817469 () Bool)

(assert (=> b!1228934 (=> (not res!817469) (not e!697567))))

(assert (=> b!1228934 (= res!817469 (not (contains!7105 (t!40506 lt!559043) (h!28248 lt!559043))))))

(declare-fun b!1228935 () Bool)

(assert (=> b!1228935 (= e!697567 (noDuplicate!1702 (t!40506 lt!559043)))))

(assert (= (and d!134397 (not res!817468)) b!1228934))

(assert (= (and b!1228934 res!817469) b!1228935))

(declare-fun m!1133473 () Bool)

(assert (=> b!1228934 m!1133473))

(declare-fun m!1133475 () Bool)

(assert (=> b!1228935 m!1133475))

(assert (=> b!1228742 d!134397))

(declare-fun b!1228940 () Bool)

(declare-fun e!697572 () Bool)

(declare-fun call!60842 () Bool)

(assert (=> b!1228940 (= e!697572 call!60842)))

(declare-fun c!120593 () Bool)

(declare-fun bm!60839 () Bool)

(assert (=> bm!60839 (= call!60842 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120593 (Cons!27039 (select (arr!38270 a!3806) from!3184) Nil!27040) Nil!27040)))))

(declare-fun b!1228941 () Bool)

(assert (=> b!1228941 (= e!697572 call!60842)))

(declare-fun b!1228942 () Bool)

(declare-fun e!697574 () Bool)

(assert (=> b!1228942 (= e!697574 e!697572)))

(assert (=> b!1228942 (= c!120593 (validKeyInArray!0 (select (arr!38270 a!3806) from!3184)))))

(declare-fun b!1228943 () Bool)

(declare-fun e!697573 () Bool)

(assert (=> b!1228943 (= e!697573 (contains!7105 Nil!27040 (select (arr!38270 a!3806) from!3184)))))

(declare-fun d!134399 () Bool)

(declare-fun res!817474 () Bool)

(declare-fun e!697575 () Bool)

(assert (=> d!134399 (=> res!817474 e!697575)))

(assert (=> d!134399 (= res!817474 (bvsge from!3184 (size!38806 a!3806)))))

(assert (=> d!134399 (= (arrayNoDuplicates!0 a!3806 from!3184 Nil!27040) e!697575)))

(declare-fun b!1228944 () Bool)

(assert (=> b!1228944 (= e!697575 e!697574)))

(declare-fun res!817476 () Bool)

(assert (=> b!1228944 (=> (not res!817476) (not e!697574))))

(assert (=> b!1228944 (= res!817476 (not e!697573))))

(declare-fun res!817475 () Bool)

(assert (=> b!1228944 (=> (not res!817475) (not e!697573))))

(assert (=> b!1228944 (= res!817475 (validKeyInArray!0 (select (arr!38270 a!3806) from!3184)))))

(assert (= (and d!134399 (not res!817474)) b!1228944))

(assert (= (and b!1228944 res!817475) b!1228943))

(assert (= (and b!1228944 res!817476) b!1228942))

(assert (= (and b!1228942 c!120593) b!1228940))

(assert (= (and b!1228942 (not c!120593)) b!1228941))

(assert (= (or b!1228940 b!1228941) bm!60839))

(assert (=> bm!60839 m!1133287))

(declare-fun m!1133477 () Bool)

(assert (=> bm!60839 m!1133477))

(assert (=> b!1228942 m!1133287))

(assert (=> b!1228942 m!1133287))

(assert (=> b!1228942 m!1133301))

(assert (=> b!1228943 m!1133287))

(assert (=> b!1228943 m!1133287))

(declare-fun m!1133479 () Bool)

(assert (=> b!1228943 m!1133479))

(assert (=> b!1228944 m!1133287))

(assert (=> b!1228944 m!1133287))

(assert (=> b!1228944 m!1133301))

(assert (=> b!1228735 d!134399))

(declare-fun d!134401 () Bool)

(assert (=> d!134401 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27040)))

(declare-fun lt!559080 () Unit!40706)

(declare-fun choose!80 (array!79298 List!27043 List!27043 (_ BitVec 32)) Unit!40706)

(assert (=> d!134401 (= lt!559080 (choose!80 a!3806 acc!823 Nil!27040 from!3184))))

(assert (=> d!134401 (bvslt (size!38806 a!3806) #b01111111111111111111111111111111)))

(assert (=> d!134401 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27040 from!3184) lt!559080)))

(declare-fun bs!34543 () Bool)

(assert (= bs!34543 d!134401))

(assert (=> bs!34543 m!1133289))

(declare-fun m!1133495 () Bool)

(assert (=> bs!34543 m!1133495))

(assert (=> b!1228735 d!134401))

(declare-fun b!1228954 () Bool)

(declare-fun e!697584 () Bool)

(declare-fun call!60844 () Bool)

(assert (=> b!1228954 (= e!697584 call!60844)))

(declare-fun bm!60841 () Bool)

(declare-fun c!120595 () Bool)

(assert (=> bm!60841 (= call!60844 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120595 (Cons!27039 (select (arr!38270 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27039 (select (arr!38270 a!3806) from!3184) acc!823)) (Cons!27039 (select (arr!38270 a!3806) from!3184) acc!823))))))

(declare-fun b!1228955 () Bool)

(assert (=> b!1228955 (= e!697584 call!60844)))

(declare-fun b!1228956 () Bool)

(declare-fun e!697586 () Bool)

(assert (=> b!1228956 (= e!697586 e!697584)))

(assert (=> b!1228956 (= c!120595 (validKeyInArray!0 (select (arr!38270 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1228957 () Bool)

(declare-fun e!697585 () Bool)

(assert (=> b!1228957 (= e!697585 (contains!7105 (Cons!27039 (select (arr!38270 a!3806) from!3184) acc!823) (select (arr!38270 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun d!134409 () Bool)

(declare-fun res!817484 () Bool)

(declare-fun e!697587 () Bool)

(assert (=> d!134409 (=> res!817484 e!697587)))

(assert (=> d!134409 (= res!817484 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38806 a!3806)))))

(assert (=> d!134409 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27039 (select (arr!38270 a!3806) from!3184) acc!823)) e!697587)))

(declare-fun b!1228958 () Bool)

(assert (=> b!1228958 (= e!697587 e!697586)))

(declare-fun res!817486 () Bool)

(assert (=> b!1228958 (=> (not res!817486) (not e!697586))))

(assert (=> b!1228958 (= res!817486 (not e!697585))))

(declare-fun res!817485 () Bool)

(assert (=> b!1228958 (=> (not res!817485) (not e!697585))))

(assert (=> b!1228958 (= res!817485 (validKeyInArray!0 (select (arr!38270 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(assert (= (and d!134409 (not res!817484)) b!1228958))

(assert (= (and b!1228958 res!817485) b!1228957))

(assert (= (and b!1228958 res!817486) b!1228956))

(assert (= (and b!1228956 c!120595) b!1228954))

(assert (= (and b!1228956 (not c!120595)) b!1228955))

(assert (= (or b!1228954 b!1228955) bm!60841))

(assert (=> bm!60841 m!1133399))

(declare-fun m!1133497 () Bool)

(assert (=> bm!60841 m!1133497))

(assert (=> b!1228956 m!1133399))

(assert (=> b!1228956 m!1133399))

(declare-fun m!1133499 () Bool)

(assert (=> b!1228956 m!1133499))

(assert (=> b!1228957 m!1133399))

(assert (=> b!1228957 m!1133399))

(declare-fun m!1133501 () Bool)

(assert (=> b!1228957 m!1133501))

(assert (=> b!1228958 m!1133399))

(assert (=> b!1228958 m!1133399))

(assert (=> b!1228958 m!1133499))

(assert (=> b!1228735 d!134409))

(declare-fun d!134411 () Bool)

(assert (=> d!134411 (= (validKeyInArray!0 (select (arr!38270 a!3806) from!3184)) (and (not (= (select (arr!38270 a!3806) from!3184) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38270 a!3806) from!3184) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1228745 d!134411))

(declare-fun d!134415 () Bool)

(assert (=> d!134415 (= (validKeyInArray!0 k!2913) (and (not (= k!2913 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2913 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1228734 d!134415))

(push 1)

(assert (not b!1228956))

(assert (not b!1228862))

(assert (not b!1228929))

(assert (not d!134401))

(assert (not d!134373))

(assert (not b!1228931))

(assert (not b!1228944))

(assert (not b!1228935))

(assert (not b!1228958))

(assert (not b!1228943))

(assert (not b!1228885))

(assert (not d!134395))

(assert (not d!134361))

(assert (not b!1228933))

(assert (not b!1228845))

(assert (not b!1228942))

(assert (not b!1228892))

(assert (not b!1228957))

(assert (not bm!60838))

(assert (not b!1228844))

(assert (not b!1228930))

(assert (not b!1228934))

(assert (not bm!60841))

(assert (not b!1228883))

(assert (not d!134369))

(assert (not bm!60839))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!134463 () Bool)

(declare-fun lt!559092 () Bool)

(assert (=> d!134463 (= lt!559092 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!557 (t!40506 acc!823))))))

(declare-fun e!697640 () Bool)

(assert (=> d!134463 (= lt!559092 e!697640)))

(declare-fun res!817533 () Bool)

(assert (=> d!134463 (=> (not res!817533) (not e!697640))))

(assert (=> d!134463 (= res!817533 (is-Cons!27039 (t!40506 acc!823)))))

(assert (=> d!134463 (= (contains!7105 (t!40506 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000) lt!559092)))

(declare-fun b!1229018 () Bool)

(declare-fun e!697641 () Bool)

(assert (=> b!1229018 (= e!697640 e!697641)))

(declare-fun res!817532 () Bool)

(assert (=> b!1229018 (=> res!817532 e!697641)))

(assert (=> b!1229018 (= res!817532 (= (h!28248 (t!40506 acc!823)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229019 () Bool)

(assert (=> b!1229019 (= e!697641 (contains!7105 (t!40506 (t!40506 acc!823)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134463 res!817533) b!1229018))

(assert (= (and b!1229018 (not res!817532)) b!1229019))

(declare-fun m!1133599 () Bool)

(assert (=> d!134463 m!1133599))

(declare-fun m!1133601 () Bool)

(assert (=> d!134463 m!1133601))

(declare-fun m!1133603 () Bool)

(assert (=> b!1229019 m!1133603))

(assert (=> b!1228933 d!134463))

(declare-fun d!134465 () Bool)

(declare-fun lt!559093 () Bool)

(assert (=> d!134465 (= lt!559093 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!557 (t!40506 acc!823))))))

(declare-fun e!697642 () Bool)

(assert (=> d!134465 (= lt!559093 e!697642)))

(declare-fun res!817535 () Bool)

(assert (=> d!134465 (=> (not res!817535) (not e!697642))))

(assert (=> d!134465 (= res!817535 (is-Cons!27039 (t!40506 acc!823)))))

(assert (=> d!134465 (= (contains!7105 (t!40506 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000) lt!559093)))

(declare-fun b!1229020 () Bool)

(declare-fun e!697643 () Bool)

(assert (=> b!1229020 (= e!697642 e!697643)))

(declare-fun res!817534 () Bool)

(assert (=> b!1229020 (=> res!817534 e!697643)))

(assert (=> b!1229020 (= res!817534 (= (h!28248 (t!40506 acc!823)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229021 () Bool)

(assert (=> b!1229021 (= e!697643 (contains!7105 (t!40506 (t!40506 acc!823)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134465 res!817535) b!1229020))

(assert (= (and b!1229020 (not res!817534)) b!1229021))

(assert (=> d!134465 m!1133599))

(declare-fun m!1133605 () Bool)

(assert (=> d!134465 m!1133605))

(declare-fun m!1133607 () Bool)

(assert (=> b!1229021 m!1133607))

(assert (=> b!1228892 d!134465))

(declare-fun d!134467 () Bool)

(declare-fun lt!559094 () Bool)

(assert (=> d!134467 (= lt!559094 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!557 (t!40506 lt!559043))))))

(declare-fun e!697644 () Bool)

(assert (=> d!134467 (= lt!559094 e!697644)))

(declare-fun res!817537 () Bool)

(assert (=> d!134467 (=> (not res!817537) (not e!697644))))

(assert (=> d!134467 (= res!817537 (is-Cons!27039 (t!40506 lt!559043)))))

(assert (=> d!134467 (= (contains!7105 (t!40506 lt!559043) #b0000000000000000000000000000000000000000000000000000000000000000) lt!559094)))

(declare-fun b!1229022 () Bool)

(declare-fun e!697645 () Bool)

(assert (=> b!1229022 (= e!697644 e!697645)))

(declare-fun res!817536 () Bool)

(assert (=> b!1229022 (=> res!817536 e!697645)))

(assert (=> b!1229022 (= res!817536 (= (h!28248 (t!40506 lt!559043)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229023 () Bool)

(assert (=> b!1229023 (= e!697645 (contains!7105 (t!40506 (t!40506 lt!559043)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134467 res!817537) b!1229022))

(assert (= (and b!1229022 (not res!817536)) b!1229023))

(declare-fun m!1133609 () Bool)

(assert (=> d!134467 m!1133609))

(declare-fun m!1133611 () Bool)

(assert (=> d!134467 m!1133611))

(declare-fun m!1133613 () Bool)

(assert (=> b!1229023 m!1133613))

(assert (=> b!1228883 d!134467))

(declare-fun d!134469 () Bool)

(declare-fun res!817538 () Bool)

(declare-fun e!697646 () Bool)

(assert (=> d!134469 (=> res!817538 e!697646)))

(assert (=> d!134469 (= res!817538 (= (select (arr!38270 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)) k!2913))))

(assert (=> d!134469 (= (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)) e!697646)))

(declare-fun b!1229024 () Bool)

(declare-fun e!697647 () Bool)

(assert (=> b!1229024 (= e!697646 e!697647)))

(declare-fun res!817539 () Bool)

(assert (=> b!1229024 (=> (not res!817539) (not e!697647))))

(assert (=> b!1229024 (= res!817539 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!38806 a!3806)))))

(declare-fun b!1229025 () Bool)

(assert (=> b!1229025 (= e!697647 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!134469 (not res!817538)) b!1229024))

(assert (= (and b!1229024 res!817539) b!1229025))

(declare-fun m!1133615 () Bool)

(assert (=> d!134469 m!1133615))

(declare-fun m!1133617 () Bool)

(assert (=> b!1229025 m!1133617))

(assert (=> b!1228862 d!134469))

(declare-fun b!1229026 () Bool)

(declare-fun e!697648 () Bool)

(declare-fun call!60848 () Bool)

(assert (=> b!1229026 (= e!697648 call!60848)))

(declare-fun bm!60845 () Bool)

(declare-fun c!120603 () Bool)

(assert (=> bm!60845 (= call!60848 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!120603 (Cons!27039 (select (arr!38270 a!3806) (bvadd from!3184 #b00000000000000000000000000000001)) (ite c!120592 (Cons!27039 (select (arr!38270 a!3806) from!3184) acc!823) acc!823)) (ite c!120592 (Cons!27039 (select (arr!38270 a!3806) from!3184) acc!823) acc!823))))))

(declare-fun b!1229027 () Bool)

(assert (=> b!1229027 (= e!697648 call!60848)))

(declare-fun b!1229028 () Bool)

(declare-fun e!697650 () Bool)

(assert (=> b!1229028 (= e!697650 e!697648)))

(assert (=> b!1229028 (= c!120603 (validKeyInArray!0 (select (arr!38270 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun e!697649 () Bool)

(declare-fun b!1229029 () Bool)

(assert (=> b!1229029 (= e!697649 (contains!7105 (ite c!120592 (Cons!27039 (select (arr!38270 a!3806) from!3184) acc!823) acc!823) (select (arr!38270 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun d!134471 () Bool)

(declare-fun res!817540 () Bool)

(declare-fun e!697651 () Bool)

(assert (=> d!134471 (=> res!817540 e!697651)))

(assert (=> d!134471 (= res!817540 (bvsge (bvadd from!3184 #b00000000000000000000000000000001) (size!38806 a!3806)))))

(assert (=> d!134471 (= (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120592 (Cons!27039 (select (arr!38270 a!3806) from!3184) acc!823) acc!823)) e!697651)))

(declare-fun b!1229030 () Bool)

(assert (=> b!1229030 (= e!697651 e!697650)))

(declare-fun res!817542 () Bool)

(assert (=> b!1229030 (=> (not res!817542) (not e!697650))))

(assert (=> b!1229030 (= res!817542 (not e!697649))))

(declare-fun res!817541 () Bool)

(assert (=> b!1229030 (=> (not res!817541) (not e!697649))))

(assert (=> b!1229030 (= res!817541 (validKeyInArray!0 (select (arr!38270 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(assert (= (and d!134471 (not res!817540)) b!1229030))

(assert (= (and b!1229030 res!817541) b!1229029))

(assert (= (and b!1229030 res!817542) b!1229028))

(assert (= (and b!1229028 c!120603) b!1229026))

(assert (= (and b!1229028 (not c!120603)) b!1229027))

(assert (= (or b!1229026 b!1229027) bm!60845))

(declare-fun m!1133619 () Bool)

(assert (=> bm!60845 m!1133619))

(declare-fun m!1133621 () Bool)

(assert (=> bm!60845 m!1133621))

(assert (=> b!1229028 m!1133619))

(assert (=> b!1229028 m!1133619))

(declare-fun m!1133623 () Bool)

(assert (=> b!1229028 m!1133623))

(assert (=> b!1229029 m!1133619))

(assert (=> b!1229029 m!1133619))

(declare-fun m!1133625 () Bool)

(assert (=> b!1229029 m!1133625))

(assert (=> b!1229030 m!1133619))

(assert (=> b!1229030 m!1133619))

(assert (=> b!1229030 m!1133623))

(assert (=> bm!60838 d!134471))

(declare-fun b!1229031 () Bool)

(declare-fun e!697652 () Bool)

(declare-fun call!60849 () Bool)

(assert (=> b!1229031 (= e!697652 call!60849)))

(declare-fun bm!60846 () Bool)

(declare-fun c!120604 () Bool)

(assert (=> bm!60846 (= call!60849 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!120604 (Cons!27039 (select (arr!38270 a!3806) (bvadd from!3184 #b00000000000000000000000000000001)) (ite c!120593 (Cons!27039 (select (arr!38270 a!3806) from!3184) Nil!27040) Nil!27040)) (ite c!120593 (Cons!27039 (select (arr!38270 a!3806) from!3184) Nil!27040) Nil!27040))))))

(declare-fun b!1229032 () Bool)

(assert (=> b!1229032 (= e!697652 call!60849)))

(declare-fun b!1229033 () Bool)

(declare-fun e!697654 () Bool)

(assert (=> b!1229033 (= e!697654 e!697652)))

(assert (=> b!1229033 (= c!120604 (validKeyInArray!0 (select (arr!38270 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun e!697653 () Bool)

(declare-fun b!1229034 () Bool)

(assert (=> b!1229034 (= e!697653 (contains!7105 (ite c!120593 (Cons!27039 (select (arr!38270 a!3806) from!3184) Nil!27040) Nil!27040) (select (arr!38270 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun d!134473 () Bool)

(declare-fun res!817543 () Bool)

(declare-fun e!697655 () Bool)

(assert (=> d!134473 (=> res!817543 e!697655)))

(assert (=> d!134473 (= res!817543 (bvsge (bvadd from!3184 #b00000000000000000000000000000001) (size!38806 a!3806)))))

(assert (=> d!134473 (= (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120593 (Cons!27039 (select (arr!38270 a!3806) from!3184) Nil!27040) Nil!27040)) e!697655)))

(declare-fun b!1229035 () Bool)

(assert (=> b!1229035 (= e!697655 e!697654)))

(declare-fun res!817545 () Bool)

(assert (=> b!1229035 (=> (not res!817545) (not e!697654))))

(assert (=> b!1229035 (= res!817545 (not e!697653))))

(declare-fun res!817544 () Bool)

(assert (=> b!1229035 (=> (not res!817544) (not e!697653))))

(assert (=> b!1229035 (= res!817544 (validKeyInArray!0 (select (arr!38270 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(assert (= (and d!134473 (not res!817543)) b!1229035))

(assert (= (and b!1229035 res!817544) b!1229034))

(assert (= (and b!1229035 res!817545) b!1229033))

(assert (= (and b!1229033 c!120604) b!1229031))

(assert (= (and b!1229033 (not c!120604)) b!1229032))

(assert (= (or b!1229031 b!1229032) bm!60846))

(assert (=> bm!60846 m!1133619))

(declare-fun m!1133627 () Bool)

(assert (=> bm!60846 m!1133627))

(assert (=> b!1229033 m!1133619))

(assert (=> b!1229033 m!1133619))

(assert (=> b!1229033 m!1133623))

(assert (=> b!1229034 m!1133619))

(assert (=> b!1229034 m!1133619))

(declare-fun m!1133629 () Bool)

(assert (=> b!1229034 m!1133629))

(assert (=> b!1229035 m!1133619))

(assert (=> b!1229035 m!1133619))

(assert (=> b!1229035 m!1133623))

(assert (=> bm!60839 d!134473))

(declare-fun d!134475 () Bool)

(declare-fun c!120607 () Bool)

(assert (=> d!134475 (= c!120607 (is-Nil!27040 lt!559043))))

(declare-fun e!697658 () (Set (_ BitVec 64)))

(assert (=> d!134475 (= (content!557 lt!559043) e!697658)))

(declare-fun b!1229040 () Bool)

(assert (=> b!1229040 (= e!697658 (as set.empty (Set (_ BitVec 64))))))

(declare-fun b!1229041 () Bool)

(assert (=> b!1229041 (= e!697658 (set.union (set.insert (h!28248 lt!559043) (as set.empty (Set (_ BitVec 64)))) (content!557 (t!40506 lt!559043))))))

(assert (= (and d!134475 c!120607) b!1229040))

(assert (= (and d!134475 (not c!120607)) b!1229041))

(declare-fun m!1133631 () Bool)

(assert (=> b!1229041 m!1133631))

(assert (=> b!1229041 m!1133609))

(assert (=> d!134369 d!134475))

(declare-fun b!1229042 () Bool)

(declare-fun e!697659 () Bool)

(declare-fun call!60850 () Bool)

(assert (=> b!1229042 (= e!697659 call!60850)))

(declare-fun c!120608 () Bool)

(declare-fun bm!60847 () Bool)

(assert (=> bm!60847 (= call!60850 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!120608 (Cons!27039 (select (arr!38270 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)) (ite c!120595 (Cons!27039 (select (arr!38270 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27039 (select (arr!38270 a!3806) from!3184) acc!823)) (Cons!27039 (select (arr!38270 a!3806) from!3184) acc!823))) (ite c!120595 (Cons!27039 (select (arr!38270 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27039 (select (arr!38270 a!3806) from!3184) acc!823)) (Cons!27039 (select (arr!38270 a!3806) from!3184) acc!823)))))))

(declare-fun b!1229043 () Bool)

(assert (=> b!1229043 (= e!697659 call!60850)))

(declare-fun b!1229044 () Bool)

(declare-fun e!697661 () Bool)

(assert (=> b!1229044 (= e!697661 e!697659)))

(assert (=> b!1229044 (= c!120608 (validKeyInArray!0 (select (arr!38270 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(declare-fun e!697660 () Bool)

(declare-fun b!1229045 () Bool)

(assert (=> b!1229045 (= e!697660 (contains!7105 (ite c!120595 (Cons!27039 (select (arr!38270 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27039 (select (arr!38270 a!3806) from!3184) acc!823)) (Cons!27039 (select (arr!38270 a!3806) from!3184) acc!823)) (select (arr!38270 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

