; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61966 () Bool)

(assert start!61966)

(declare-fun b!693200 () Bool)

(declare-fun e!394424 () Bool)

(declare-datatypes ((List!13131 0))(
  ( (Nil!13128) (Cons!13127 (h!14172 (_ BitVec 64)) (t!19407 List!13131)) )
))
(declare-fun lt!316717 () List!13131)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3708 (List!13131 (_ BitVec 64)) Bool)

(assert (=> b!693200 (= e!394424 (contains!3708 lt!316717 k0!2843))))

(declare-fun b!693201 () Bool)

(declare-fun res!457374 () Bool)

(declare-fun e!394427 () Bool)

(assert (=> b!693201 (=> (not res!457374) (not e!394427))))

(declare-datatypes ((array!39852 0))(
  ( (array!39853 (arr!19090 (Array (_ BitVec 32) (_ BitVec 64))) (size!19475 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39852)

(declare-fun arrayNoDuplicates!0 (array!39852 (_ BitVec 32) List!13131) Bool)

(assert (=> b!693201 (= res!457374 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13128))))

(declare-fun b!693202 () Bool)

(declare-fun res!457363 () Bool)

(assert (=> b!693202 (=> (not res!457363) (not e!394427))))

(declare-fun e!394426 () Bool)

(assert (=> b!693202 (= res!457363 e!394426)))

(declare-fun res!457354 () Bool)

(assert (=> b!693202 (=> res!457354 e!394426)))

(declare-fun e!394428 () Bool)

(assert (=> b!693202 (= res!457354 e!394428)))

(declare-fun res!457368 () Bool)

(assert (=> b!693202 (=> (not res!457368) (not e!394428))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!693202 (= res!457368 (bvsgt from!3004 i!1382))))

(declare-fun b!693203 () Bool)

(declare-fun res!457376 () Bool)

(assert (=> b!693203 (=> (not res!457376) (not e!394427))))

(declare-fun acc!681 () List!13131)

(assert (=> b!693203 (= res!457376 (not (contains!3708 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693204 () Bool)

(declare-fun res!457357 () Bool)

(assert (=> b!693204 (=> (not res!457357) (not e!394427))))

(assert (=> b!693204 (= res!457357 (not (contains!3708 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693205 () Bool)

(declare-fun res!457370 () Bool)

(assert (=> b!693205 (=> (not res!457370) (not e!394427))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!693205 (= res!457370 (validKeyInArray!0 (select (arr!19090 a!3626) from!3004)))))

(declare-fun b!693206 () Bool)

(declare-fun e!394425 () Bool)

(assert (=> b!693206 (= e!394427 e!394425)))

(declare-fun res!457373 () Bool)

(assert (=> b!693206 (=> (not res!457373) (not e!394425))))

(assert (=> b!693206 (= res!457373 (not (= (select (arr!19090 a!3626) from!3004) k0!2843)))))

(declare-datatypes ((Unit!24478 0))(
  ( (Unit!24479) )
))
(declare-fun lt!316718 () Unit!24478)

(declare-fun e!394431 () Unit!24478)

(assert (=> b!693206 (= lt!316718 e!394431)))

(declare-fun c!78290 () Bool)

(assert (=> b!693206 (= c!78290 (= (select (arr!19090 a!3626) from!3004) k0!2843))))

(declare-fun b!693207 () Bool)

(declare-fun Unit!24480 () Unit!24478)

(assert (=> b!693207 (= e!394431 Unit!24480)))

(declare-fun b!693208 () Bool)

(declare-fun Unit!24481 () Unit!24478)

(assert (=> b!693208 (= e!394431 Unit!24481)))

(declare-fun arrayContainsKey!0 (array!39852 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!693208 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!316720 () Unit!24478)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39852 (_ BitVec 64) (_ BitVec 32)) Unit!24478)

(assert (=> b!693208 (= lt!316720 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!693208 false))

(declare-fun b!693209 () Bool)

(declare-fun res!457362 () Bool)

(assert (=> b!693209 (=> (not res!457362) (not e!394427))))

(declare-fun noDuplicate!955 (List!13131) Bool)

(assert (=> b!693209 (= res!457362 (noDuplicate!955 acc!681))))

(declare-fun b!693210 () Bool)

(declare-fun res!457358 () Bool)

(declare-fun e!394434 () Bool)

(assert (=> b!693210 (=> (not res!457358) (not e!394434))))

(assert (=> b!693210 (= res!457358 (noDuplicate!955 lt!316717))))

(declare-fun b!693211 () Bool)

(assert (=> b!693211 (= e!394428 (contains!3708 acc!681 k0!2843))))

(declare-fun b!693212 () Bool)

(declare-fun e!394433 () Bool)

(declare-fun e!394430 () Bool)

(assert (=> b!693212 (= e!394433 e!394430)))

(declare-fun res!457369 () Bool)

(assert (=> b!693212 (=> (not res!457369) (not e!394430))))

(assert (=> b!693212 (= res!457369 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!693213 () Bool)

(declare-fun res!457361 () Bool)

(assert (=> b!693213 (=> (not res!457361) (not e!394427))))

(assert (=> b!693213 (= res!457361 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!693214 () Bool)

(declare-fun res!457375 () Bool)

(assert (=> b!693214 (=> (not res!457375) (not e!394427))))

(assert (=> b!693214 (= res!457375 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19475 a!3626))))))

(declare-fun b!693215 () Bool)

(declare-fun res!457356 () Bool)

(assert (=> b!693215 (=> (not res!457356) (not e!394434))))

(assert (=> b!693215 (= res!457356 (not (contains!3708 lt!316717 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693216 () Bool)

(declare-fun res!457367 () Bool)

(assert (=> b!693216 (=> (not res!457367) (not e!394427))))

(assert (=> b!693216 (= res!457367 (validKeyInArray!0 k0!2843))))

(declare-fun b!693217 () Bool)

(declare-fun res!457366 () Bool)

(assert (=> b!693217 (=> (not res!457366) (not e!394434))))

(assert (=> b!693217 (= res!457366 (not (contains!3708 lt!316717 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693218 () Bool)

(declare-fun e!394429 () Bool)

(assert (=> b!693218 (= e!394429 (not (contains!3708 acc!681 k0!2843)))))

(declare-fun b!693219 () Bool)

(declare-fun res!457360 () Bool)

(assert (=> b!693219 (=> (not res!457360) (not e!394427))))

(assert (=> b!693219 (= res!457360 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!693220 () Bool)

(assert (=> b!693220 (= e!394426 e!394429)))

(declare-fun res!457372 () Bool)

(assert (=> b!693220 (=> (not res!457372) (not e!394429))))

(assert (=> b!693220 (= res!457372 (bvsle from!3004 i!1382))))

(declare-fun b!693221 () Bool)

(assert (=> b!693221 (= e!394434 false)))

(declare-fun lt!316719 () Bool)

(assert (=> b!693221 (= lt!316719 e!394433)))

(declare-fun res!457359 () Bool)

(assert (=> b!693221 (=> res!457359 e!394433)))

(assert (=> b!693221 (= res!457359 e!394424)))

(declare-fun res!457364 () Bool)

(assert (=> b!693221 (=> (not res!457364) (not e!394424))))

(assert (=> b!693221 (= res!457364 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!693222 () Bool)

(assert (=> b!693222 (= e!394425 e!394434)))

(declare-fun res!457365 () Bool)

(assert (=> b!693222 (=> (not res!457365) (not e!394434))))

(assert (=> b!693222 (= res!457365 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!420 (List!13131 (_ BitVec 64)) List!13131)

(assert (=> b!693222 (= lt!316717 ($colon$colon!420 acc!681 (select (arr!19090 a!3626) from!3004)))))

(declare-fun res!457355 () Bool)

(assert (=> start!61966 (=> (not res!457355) (not e!394427))))

(assert (=> start!61966 (= res!457355 (and (bvslt (size!19475 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19475 a!3626))))))

(assert (=> start!61966 e!394427))

(assert (=> start!61966 true))

(declare-fun array_inv!14886 (array!39852) Bool)

(assert (=> start!61966 (array_inv!14886 a!3626)))

(declare-fun b!693223 () Bool)

(declare-fun res!457371 () Bool)

(assert (=> b!693223 (=> (not res!457371) (not e!394427))))

(assert (=> b!693223 (= res!457371 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19475 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!693224 () Bool)

(assert (=> b!693224 (= e!394430 (not (contains!3708 lt!316717 k0!2843)))))

(assert (= (and start!61966 res!457355) b!693209))

(assert (= (and b!693209 res!457362) b!693204))

(assert (= (and b!693204 res!457357) b!693203))

(assert (= (and b!693203 res!457376) b!693202))

(assert (= (and b!693202 res!457368) b!693211))

(assert (= (and b!693202 (not res!457354)) b!693220))

(assert (= (and b!693220 res!457372) b!693218))

(assert (= (and b!693202 res!457363) b!693201))

(assert (= (and b!693201 res!457374) b!693213))

(assert (= (and b!693213 res!457361) b!693214))

(assert (= (and b!693214 res!457375) b!693216))

(assert (= (and b!693216 res!457367) b!693219))

(assert (= (and b!693219 res!457360) b!693223))

(assert (= (and b!693223 res!457371) b!693205))

(assert (= (and b!693205 res!457370) b!693206))

(assert (= (and b!693206 c!78290) b!693208))

(assert (= (and b!693206 (not c!78290)) b!693207))

(assert (= (and b!693206 res!457373) b!693222))

(assert (= (and b!693222 res!457365) b!693210))

(assert (= (and b!693210 res!457358) b!693217))

(assert (= (and b!693217 res!457366) b!693215))

(assert (= (and b!693215 res!457356) b!693221))

(assert (= (and b!693221 res!457364) b!693200))

(assert (= (and b!693221 (not res!457359)) b!693212))

(assert (= (and b!693212 res!457369) b!693224))

(declare-fun m!655565 () Bool)

(assert (=> b!693224 m!655565))

(assert (=> b!693200 m!655565))

(declare-fun m!655567 () Bool)

(assert (=> start!61966 m!655567))

(declare-fun m!655569 () Bool)

(assert (=> b!693205 m!655569))

(assert (=> b!693205 m!655569))

(declare-fun m!655571 () Bool)

(assert (=> b!693205 m!655571))

(assert (=> b!693222 m!655569))

(assert (=> b!693222 m!655569))

(declare-fun m!655573 () Bool)

(assert (=> b!693222 m!655573))

(declare-fun m!655575 () Bool)

(assert (=> b!693208 m!655575))

(declare-fun m!655577 () Bool)

(assert (=> b!693208 m!655577))

(declare-fun m!655579 () Bool)

(assert (=> b!693203 m!655579))

(declare-fun m!655581 () Bool)

(assert (=> b!693211 m!655581))

(declare-fun m!655583 () Bool)

(assert (=> b!693209 m!655583))

(declare-fun m!655585 () Bool)

(assert (=> b!693217 m!655585))

(declare-fun m!655587 () Bool)

(assert (=> b!693216 m!655587))

(declare-fun m!655589 () Bool)

(assert (=> b!693213 m!655589))

(assert (=> b!693206 m!655569))

(declare-fun m!655591 () Bool)

(assert (=> b!693201 m!655591))

(declare-fun m!655593 () Bool)

(assert (=> b!693215 m!655593))

(declare-fun m!655595 () Bool)

(assert (=> b!693210 m!655595))

(declare-fun m!655597 () Bool)

(assert (=> b!693219 m!655597))

(assert (=> b!693218 m!655581))

(declare-fun m!655599 () Bool)

(assert (=> b!693204 m!655599))

(check-sat (not b!693222) (not b!693224) (not b!693205) (not b!693203) (not b!693216) (not start!61966) (not b!693204) (not b!693210) (not b!693200) (not b!693215) (not b!693209) (not b!693218) (not b!693201) (not b!693208) (not b!693217) (not b!693213) (not b!693219) (not b!693211))
(check-sat)
