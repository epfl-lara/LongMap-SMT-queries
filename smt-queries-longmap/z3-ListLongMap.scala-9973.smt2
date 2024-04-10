; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117740 () Bool)

(assert start!117740)

(declare-fun res!922798 () Bool)

(declare-fun e!782846 () Bool)

(assert (=> start!117740 (=> (not res!922798) (not e!782846))))

(declare-fun from!2839 () (_ BitVec 32))

(declare-fun to!94 () (_ BitVec 32))

(declare-datatypes ((array!94222 0))(
  ( (array!94223 (arr!45501 (Array (_ BitVec 32) (_ BitVec 64))) (size!46051 (_ BitVec 32))) )
))
(declare-fun a!3464 () array!94222)

(assert (=> start!117740 (= res!922798 (and (bvsle from!2839 to!94) (bvsge from!2839 #b00000000000000000000000000000000) (bvsle to!94 (size!46051 a!3464)) (bvslt (size!46051 a!3464) #b01111111111111111111111111111111) (bvslt from!2839 to!94)))))

(assert (=> start!117740 e!782846))

(assert (=> start!117740 true))

(declare-fun array_inv!34529 (array!94222) Bool)

(assert (=> start!117740 (array_inv!34529 a!3464)))

(declare-fun b!1381097 () Bool)

(declare-fun res!922797 () Bool)

(assert (=> b!1381097 (=> (not res!922797) (not e!782846))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381097 (= res!922797 (validKeyInArray!0 (select (arr!45501 a!3464) from!2839)))))

(declare-fun b!1381098 () Bool)

(declare-fun lt!608154 () (_ BitVec 32))

(assert (=> b!1381098 (= e!782846 (or (bvslt lt!608154 #b00000000000000000000000000000000) (bvsgt lt!608154 (bvsub (size!46051 a!3464) from!2839))))))

(declare-fun arrayCountValidKeys!0 (array!94222 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1381098 (= lt!608154 (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!3464 (bvadd #b00000000000000000000000000000001 from!2839) to!94)))))

(assert (= (and start!117740 res!922798) b!1381097))

(assert (= (and b!1381097 res!922797) b!1381098))

(declare-fun m!1266335 () Bool)

(assert (=> start!117740 m!1266335))

(declare-fun m!1266337 () Bool)

(assert (=> b!1381097 m!1266337))

(assert (=> b!1381097 m!1266337))

(declare-fun m!1266339 () Bool)

(assert (=> b!1381097 m!1266339))

(declare-fun m!1266341 () Bool)

(assert (=> b!1381098 m!1266341))

(check-sat (not b!1381097) (not b!1381098) (not start!117740))
(check-sat)
(get-model)

(declare-fun d!148983 () Bool)

(assert (=> d!148983 (= (validKeyInArray!0 (select (arr!45501 a!3464) from!2839)) (and (not (= (select (arr!45501 a!3464) from!2839) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45501 a!3464) from!2839) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1381097 d!148983))

(declare-fun b!1381113 () Bool)

(declare-fun e!782857 () (_ BitVec 32))

(declare-fun call!66502 () (_ BitVec 32))

(assert (=> b!1381113 (= e!782857 (bvadd #b00000000000000000000000000000001 call!66502))))

(declare-fun b!1381114 () Bool)

(assert (=> b!1381114 (= e!782857 call!66502)))

(declare-fun bm!66499 () Bool)

(assert (=> bm!66499 (= call!66502 (arrayCountValidKeys!0 a!3464 (bvadd #b00000000000000000000000000000001 from!2839 #b00000000000000000000000000000001) to!94))))

(declare-fun b!1381115 () Bool)

(declare-fun e!782858 () (_ BitVec 32))

(assert (=> b!1381115 (= e!782858 e!782857)))

(declare-fun c!128595 () Bool)

(assert (=> b!1381115 (= c!128595 (validKeyInArray!0 (select (arr!45501 a!3464) (bvadd #b00000000000000000000000000000001 from!2839))))))

(declare-fun d!148985 () Bool)

(declare-fun lt!608160 () (_ BitVec 32))

(assert (=> d!148985 (and (bvsge lt!608160 #b00000000000000000000000000000000) (bvsle lt!608160 (bvsub (size!46051 a!3464) (bvadd #b00000000000000000000000000000001 from!2839))))))

(assert (=> d!148985 (= lt!608160 e!782858)))

(declare-fun c!128594 () Bool)

(assert (=> d!148985 (= c!128594 (bvsge (bvadd #b00000000000000000000000000000001 from!2839) to!94))))

(assert (=> d!148985 (and (bvsle (bvadd #b00000000000000000000000000000001 from!2839) to!94) (bvsge (bvadd #b00000000000000000000000000000001 from!2839) #b00000000000000000000000000000000) (bvsle to!94 (size!46051 a!3464)))))

(assert (=> d!148985 (= (arrayCountValidKeys!0 a!3464 (bvadd #b00000000000000000000000000000001 from!2839) to!94) lt!608160)))

(declare-fun b!1381116 () Bool)

(assert (=> b!1381116 (= e!782858 #b00000000000000000000000000000000)))

(assert (= (and d!148985 c!128594) b!1381116))

(assert (= (and d!148985 (not c!128594)) b!1381115))

(assert (= (and b!1381115 c!128595) b!1381113))

(assert (= (and b!1381115 (not c!128595)) b!1381114))

(assert (= (or b!1381113 b!1381114) bm!66499))

(declare-fun m!1266351 () Bool)

(assert (=> bm!66499 m!1266351))

(declare-fun m!1266353 () Bool)

(assert (=> b!1381115 m!1266353))

(assert (=> b!1381115 m!1266353))

(declare-fun m!1266355 () Bool)

(assert (=> b!1381115 m!1266355))

(assert (=> b!1381098 d!148985))

(declare-fun d!148991 () Bool)

(assert (=> d!148991 (= (array_inv!34529 a!3464) (bvsge (size!46051 a!3464) #b00000000000000000000000000000000))))

(assert (=> start!117740 d!148991))

(check-sat (not bm!66499) (not b!1381115))
(check-sat)
