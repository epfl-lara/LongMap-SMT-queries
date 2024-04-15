; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36070 () Bool)

(assert start!36070)

(declare-fun res!201384 () Bool)

(declare-fun e!221667 () Bool)

(assert (=> start!36070 (=> (not res!201384) (not e!221667))))

(declare-fun i!1487 () (_ BitVec 32))

(declare-datatypes ((array!20397 0))(
  ( (array!20398 (arr!9682 (Array (_ BitVec 32) (_ BitVec 64))) (size!10035 (_ BitVec 32))) )
))
(declare-fun a!4392 () array!20397)

(assert (=> start!36070 (= res!201384 (and (bvsge i!1487 #b00000000000000000000000000000000) (bvslt i!1487 (size!10035 a!4392))))))

(assert (=> start!36070 e!221667))

(assert (=> start!36070 true))

(declare-fun array_inv!7131 (array!20397) Bool)

(assert (=> start!36070 (array_inv!7131 a!4392)))

(declare-fun b!361904 () Bool)

(declare-fun res!201383 () Bool)

(assert (=> b!361904 (=> (not res!201383) (not e!221667))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!361904 (= res!201383 (validKeyInArray!0 (select (arr!9682 a!4392) i!1487)))))

(declare-fun b!361905 () Bool)

(declare-fun res!201385 () Bool)

(assert (=> b!361905 (=> (not res!201385) (not e!221667))))

(assert (=> b!361905 (= res!201385 (bvslt (size!10035 a!4392) #b01111111111111111111111111111111))))

(declare-fun b!361906 () Bool)

(declare-fun arrayCountValidKeys!0 (array!20397 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!361906 (= e!221667 (not (= (arrayCountValidKeys!0 a!4392 i!1487 (bvadd #b00000000000000000000000000000001 i!1487)) #b00000000000000000000000000000001)))))

(assert (= (and start!36070 res!201384) b!361904))

(assert (= (and b!361904 res!201383) b!361905))

(assert (= (and b!361905 res!201385) b!361906))

(declare-fun m!357985 () Bool)

(assert (=> start!36070 m!357985))

(declare-fun m!357987 () Bool)

(assert (=> b!361904 m!357987))

(assert (=> b!361904 m!357987))

(declare-fun m!357989 () Bool)

(assert (=> b!361904 m!357989))

(declare-fun m!357991 () Bool)

(assert (=> b!361906 m!357991))

(check-sat (not b!361904) (not b!361906) (not start!36070))
(check-sat)
(get-model)

(declare-fun d!71797 () Bool)

(assert (=> d!71797 (= (validKeyInArray!0 (select (arr!9682 a!4392) i!1487)) (and (not (= (select (arr!9682 a!4392) i!1487) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!9682 a!4392) i!1487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!361904 d!71797))

(declare-fun d!71799 () Bool)

(declare-fun lt!166392 () (_ BitVec 32))

(assert (=> d!71799 (and (bvsge lt!166392 #b00000000000000000000000000000000) (bvsle lt!166392 (bvsub (size!10035 a!4392) i!1487)))))

(declare-fun e!221688 () (_ BitVec 32))

(assert (=> d!71799 (= lt!166392 e!221688)))

(declare-fun c!53687 () Bool)

(assert (=> d!71799 (= c!53687 (bvsge i!1487 (bvadd #b00000000000000000000000000000001 i!1487)))))

(assert (=> d!71799 (and (bvsle i!1487 (bvadd #b00000000000000000000000000000001 i!1487)) (bvsge i!1487 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1487) (size!10035 a!4392)))))

(assert (=> d!71799 (= (arrayCountValidKeys!0 a!4392 i!1487 (bvadd #b00000000000000000000000000000001 i!1487)) lt!166392)))

(declare-fun b!361943 () Bool)

(declare-fun e!221689 () (_ BitVec 32))

(assert (=> b!361943 (= e!221688 e!221689)))

(declare-fun c!53688 () Bool)

(assert (=> b!361943 (= c!53688 (validKeyInArray!0 (select (arr!9682 a!4392) i!1487)))))

(declare-fun b!361944 () Bool)

(declare-fun call!27181 () (_ BitVec 32))

(assert (=> b!361944 (= e!221689 call!27181)))

(declare-fun b!361945 () Bool)

(assert (=> b!361945 (= e!221689 (bvadd #b00000000000000000000000000000001 call!27181))))

(declare-fun b!361946 () Bool)

(assert (=> b!361946 (= e!221688 #b00000000000000000000000000000000)))

(declare-fun bm!27178 () Bool)

(assert (=> bm!27178 (= call!27181 (arrayCountValidKeys!0 a!4392 (bvadd i!1487 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1487)))))

(assert (= (and d!71799 c!53687) b!361946))

(assert (= (and d!71799 (not c!53687)) b!361943))

(assert (= (and b!361943 c!53688) b!361945))

(assert (= (and b!361943 (not c!53688)) b!361944))

(assert (= (or b!361945 b!361944) bm!27178))

(assert (=> b!361943 m!357987))

(assert (=> b!361943 m!357987))

(assert (=> b!361943 m!357989))

(declare-fun m!358009 () Bool)

(assert (=> bm!27178 m!358009))

(assert (=> b!361906 d!71799))

(declare-fun d!71809 () Bool)

(assert (=> d!71809 (= (array_inv!7131 a!4392) (bvsge (size!10035 a!4392) #b00000000000000000000000000000000))))

(assert (=> start!36070 d!71809))

(check-sat (not bm!27178) (not b!361943))
(check-sat)
(get-model)

(declare-fun d!71817 () Bool)

(declare-fun lt!166396 () (_ BitVec 32))

(assert (=> d!71817 (and (bvsge lt!166396 #b00000000000000000000000000000000) (bvsle lt!166396 (bvsub (size!10035 a!4392) (bvadd i!1487 #b00000000000000000000000000000001))))))

(declare-fun e!221700 () (_ BitVec 32))

(assert (=> d!71817 (= lt!166396 e!221700)))

(declare-fun c!53699 () Bool)

(assert (=> d!71817 (= c!53699 (bvsge (bvadd i!1487 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1487)))))

(assert (=> d!71817 (and (bvsle (bvadd i!1487 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1487)) (bvsge (bvadd i!1487 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1487) (size!10035 a!4392)))))

(assert (=> d!71817 (= (arrayCountValidKeys!0 a!4392 (bvadd i!1487 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1487)) lt!166396)))

(declare-fun b!361965 () Bool)

(declare-fun e!221701 () (_ BitVec 32))

(assert (=> b!361965 (= e!221700 e!221701)))

(declare-fun c!53700 () Bool)

(assert (=> b!361965 (= c!53700 (validKeyInArray!0 (select (arr!9682 a!4392) (bvadd i!1487 #b00000000000000000000000000000001))))))

(declare-fun b!361966 () Bool)

(declare-fun call!27187 () (_ BitVec 32))

(assert (=> b!361966 (= e!221701 call!27187)))

(declare-fun b!361967 () Bool)

(assert (=> b!361967 (= e!221701 (bvadd #b00000000000000000000000000000001 call!27187))))

(declare-fun b!361968 () Bool)

(assert (=> b!361968 (= e!221700 #b00000000000000000000000000000000)))

(declare-fun bm!27184 () Bool)

(assert (=> bm!27184 (= call!27187 (arrayCountValidKeys!0 a!4392 (bvadd i!1487 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1487)))))

(assert (= (and d!71817 c!53699) b!361968))

(assert (= (and d!71817 (not c!53699)) b!361965))

(assert (= (and b!361965 c!53700) b!361967))

(assert (= (and b!361965 (not c!53700)) b!361966))

(assert (= (or b!361967 b!361966) bm!27184))

(declare-fun m!358021 () Bool)

(assert (=> b!361965 m!358021))

(assert (=> b!361965 m!358021))

(declare-fun m!358023 () Bool)

(assert (=> b!361965 m!358023))

(declare-fun m!358025 () Bool)

(assert (=> bm!27184 m!358025))

(assert (=> bm!27178 d!71817))

(assert (=> b!361943 d!71797))

(check-sat (not b!361965) (not bm!27184))
(check-sat)
