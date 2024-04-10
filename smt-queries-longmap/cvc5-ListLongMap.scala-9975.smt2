; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117768 () Bool)

(assert start!117768)

(declare-fun res!922827 () Bool)

(declare-fun e!782893 () Bool)

(assert (=> start!117768 (=> (not res!922827) (not e!782893))))

(declare-fun to!94 () (_ BitVec 32))

(declare-datatypes ((array!94235 0))(
  ( (array!94236 (arr!45506 (Array (_ BitVec 32) (_ BitVec 64))) (size!46056 (_ BitVec 32))) )
))
(declare-fun a!3464 () array!94235)

(declare-fun from!2839 () (_ BitVec 32))

(assert (=> start!117768 (= res!922827 (and (bvsle from!2839 to!94) (bvsge from!2839 #b00000000000000000000000000000000) (bvsle to!94 (size!46056 a!3464)) (bvslt (size!46056 a!3464) #b01111111111111111111111111111111) (bvslt from!2839 to!94)))))

(assert (=> start!117768 e!782893))

(assert (=> start!117768 true))

(declare-fun array_inv!34534 (array!94235) Bool)

(assert (=> start!117768 (array_inv!34534 a!3464)))

(declare-fun b!1381163 () Bool)

(declare-fun res!922828 () Bool)

(assert (=> b!1381163 (=> (not res!922828) (not e!782893))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381163 (= res!922828 (not (validKeyInArray!0 (select (arr!45506 a!3464) from!2839))))))

(declare-fun lt!608169 () (_ BitVec 32))

(declare-fun b!1381164 () Bool)

(assert (=> b!1381164 (= e!782893 (or (bvslt lt!608169 #b00000000000000000000000000000000) (bvsgt lt!608169 (bvsub (size!46056 a!3464) from!2839))))))

(declare-fun arrayCountValidKeys!0 (array!94235 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1381164 (= lt!608169 (arrayCountValidKeys!0 a!3464 (bvadd #b00000000000000000000000000000001 from!2839) to!94))))

(assert (= (and start!117768 res!922827) b!1381163))

(assert (= (and b!1381163 res!922828) b!1381164))

(declare-fun m!1266387 () Bool)

(assert (=> start!117768 m!1266387))

(declare-fun m!1266389 () Bool)

(assert (=> b!1381163 m!1266389))

(assert (=> b!1381163 m!1266389))

(declare-fun m!1266391 () Bool)

(assert (=> b!1381163 m!1266391))

(declare-fun m!1266393 () Bool)

(assert (=> b!1381164 m!1266393))

(push 1)

(assert (not start!117768))

(assert (not b!1381163))

(assert (not b!1381164))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!149009 () Bool)

(assert (=> d!149009 (= (array_inv!34534 a!3464) (bvsge (size!46056 a!3464) #b00000000000000000000000000000000))))

(assert (=> start!117768 d!149009))

(declare-fun d!149011 () Bool)

(assert (=> d!149011 (= (validKeyInArray!0 (select (arr!45506 a!3464) from!2839)) (and (not (= (select (arr!45506 a!3464) from!2839) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45506 a!3464) from!2839) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1381163 d!149011))

(declare-fun b!1381209 () Bool)

(declare-fun e!782924 () (_ BitVec 32))

(declare-fun e!782923 () (_ BitVec 32))

(assert (=> b!1381209 (= e!782924 e!782923)))

(declare-fun c!128624 () Bool)

(assert (=> b!1381209 (= c!128624 (validKeyInArray!0 (select (arr!45506 a!3464) (bvadd #b00000000000000000000000000000001 from!2839))))))

(declare-fun b!1381210 () Bool)

(declare-fun call!66517 () (_ BitVec 32))

(assert (=> b!1381210 (= e!782923 call!66517)))

(declare-fun b!1381211 () Bool)

(assert (=> b!1381211 (= e!782923 (bvadd #b00000000000000000000000000000001 call!66517))))

(declare-fun bm!66514 () Bool)

(assert (=> bm!66514 (= call!66517 (arrayCountValidKeys!0 a!3464 (bvadd #b00000000000000000000000000000001 from!2839 #b00000000000000000000000000000001) to!94))))

(declare-fun d!149015 () Bool)

(declare-fun lt!608184 () (_ BitVec 32))

(assert (=> d!149015 (and (bvsge lt!608184 #b00000000000000000000000000000000) (bvsle lt!608184 (bvsub (size!46056 a!3464) (bvadd #b00000000000000000000000000000001 from!2839))))))

(assert (=> d!149015 (= lt!608184 e!782924)))

(declare-fun c!128625 () Bool)

(assert (=> d!149015 (= c!128625 (bvsge (bvadd #b00000000000000000000000000000001 from!2839) to!94))))

(assert (=> d!149015 (and (bvsle (bvadd #b00000000000000000000000000000001 from!2839) to!94) (bvsge (bvadd #b00000000000000000000000000000001 from!2839) #b00000000000000000000000000000000) (bvsle to!94 (size!46056 a!3464)))))

(assert (=> d!149015 (= (arrayCountValidKeys!0 a!3464 (bvadd #b00000000000000000000000000000001 from!2839) to!94) lt!608184)))

(declare-fun b!1381212 () Bool)

(assert (=> b!1381212 (= e!782924 #b00000000000000000000000000000000)))

(assert (= (and d!149015 c!128625) b!1381212))

(assert (= (and d!149015 (not c!128625)) b!1381209))

(assert (= (and b!1381209 c!128624) b!1381211))

(assert (= (and b!1381209 (not c!128624)) b!1381210))

(assert (= (or b!1381211 b!1381210) bm!66514))

(declare-fun m!1266423 () Bool)

(assert (=> b!1381209 m!1266423))

(assert (=> b!1381209 m!1266423))

(declare-fun m!1266425 () Bool)

(assert (=> b!1381209 m!1266425))

(declare-fun m!1266427 () Bool)

(assert (=> bm!66514 m!1266427))

(assert (=> b!1381164 d!149015))

(push 1)

(assert (not bm!66514))

(assert (not b!1381209))

(check-sat)

