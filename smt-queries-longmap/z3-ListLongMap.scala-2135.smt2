; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36070 () Bool)

(assert start!36070)

(declare-fun res!201509 () Bool)

(declare-fun e!221808 () Bool)

(assert (=> start!36070 (=> (not res!201509) (not e!221808))))

(declare-fun i!1487 () (_ BitVec 32))

(declare-datatypes ((array!20396 0))(
  ( (array!20397 (arr!9681 (Array (_ BitVec 32) (_ BitVec 64))) (size!10033 (_ BitVec 32))) )
))
(declare-fun a!4392 () array!20396)

(assert (=> start!36070 (= res!201509 (and (bvsge i!1487 #b00000000000000000000000000000000) (bvslt i!1487 (size!10033 a!4392))))))

(assert (=> start!36070 e!221808))

(assert (=> start!36070 true))

(declare-fun array_inv!7153 (array!20396) Bool)

(assert (=> start!36070 (array_inv!7153 a!4392)))

(declare-fun b!362126 () Bool)

(declare-fun res!201511 () Bool)

(assert (=> b!362126 (=> (not res!201511) (not e!221808))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362126 (= res!201511 (validKeyInArray!0 (select (arr!9681 a!4392) i!1487)))))

(declare-fun b!362127 () Bool)

(declare-fun res!201510 () Bool)

(assert (=> b!362127 (=> (not res!201510) (not e!221808))))

(assert (=> b!362127 (= res!201510 (bvslt (size!10033 a!4392) #b01111111111111111111111111111111))))

(declare-fun b!362128 () Bool)

(declare-fun arrayCountValidKeys!0 (array!20396 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362128 (= e!221808 (not (= (arrayCountValidKeys!0 a!4392 i!1487 (bvadd #b00000000000000000000000000000001 i!1487)) #b00000000000000000000000000000001)))))

(assert (= (and start!36070 res!201509) b!362126))

(assert (= (and b!362126 res!201511) b!362127))

(assert (= (and b!362127 res!201510) b!362128))

(declare-fun m!358939 () Bool)

(assert (=> start!36070 m!358939))

(declare-fun m!358941 () Bool)

(assert (=> b!362126 m!358941))

(assert (=> b!362126 m!358941))

(declare-fun m!358943 () Bool)

(assert (=> b!362126 m!358943))

(declare-fun m!358945 () Bool)

(assert (=> b!362128 m!358945))

(check-sat (not b!362128) (not start!36070) (not b!362126))
(check-sat)
(get-model)

(declare-fun b!362155 () Bool)

(declare-fun e!221827 () (_ BitVec 32))

(declare-fun call!27191 () (_ BitVec 32))

(assert (=> b!362155 (= e!221827 call!27191)))

(declare-fun b!362156 () Bool)

(declare-fun e!221826 () (_ BitVec 32))

(assert (=> b!362156 (= e!221826 #b00000000000000000000000000000000)))

(declare-fun d!72031 () Bool)

(declare-fun lt!166641 () (_ BitVec 32))

(assert (=> d!72031 (and (bvsge lt!166641 #b00000000000000000000000000000000) (bvsle lt!166641 (bvsub (size!10033 a!4392) i!1487)))))

(assert (=> d!72031 (= lt!166641 e!221826)))

(declare-fun c!53732 () Bool)

(assert (=> d!72031 (= c!53732 (bvsge i!1487 (bvadd #b00000000000000000000000000000001 i!1487)))))

(assert (=> d!72031 (and (bvsle i!1487 (bvadd #b00000000000000000000000000000001 i!1487)) (bvsge i!1487 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1487) (size!10033 a!4392)))))

(assert (=> d!72031 (= (arrayCountValidKeys!0 a!4392 i!1487 (bvadd #b00000000000000000000000000000001 i!1487)) lt!166641)))

(declare-fun b!362157 () Bool)

(assert (=> b!362157 (= e!221826 e!221827)))

(declare-fun c!53731 () Bool)

(assert (=> b!362157 (= c!53731 (validKeyInArray!0 (select (arr!9681 a!4392) i!1487)))))

(declare-fun bm!27188 () Bool)

(assert (=> bm!27188 (= call!27191 (arrayCountValidKeys!0 a!4392 (bvadd i!1487 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1487)))))

(declare-fun b!362158 () Bool)

(assert (=> b!362158 (= e!221827 (bvadd #b00000000000000000000000000000001 call!27191))))

(assert (= (and d!72031 c!53732) b!362156))

(assert (= (and d!72031 (not c!53732)) b!362157))

(assert (= (and b!362157 c!53731) b!362158))

(assert (= (and b!362157 (not c!53731)) b!362155))

(assert (= (or b!362158 b!362155) bm!27188))

(assert (=> b!362157 m!358941))

(assert (=> b!362157 m!358941))

(assert (=> b!362157 m!358943))

(declare-fun m!358963 () Bool)

(assert (=> bm!27188 m!358963))

(assert (=> b!362128 d!72031))

(declare-fun d!72043 () Bool)

(assert (=> d!72043 (= (array_inv!7153 a!4392) (bvsge (size!10033 a!4392) #b00000000000000000000000000000000))))

(assert (=> start!36070 d!72043))

(declare-fun d!72045 () Bool)

(assert (=> d!72045 (= (validKeyInArray!0 (select (arr!9681 a!4392) i!1487)) (and (not (= (select (arr!9681 a!4392) i!1487) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!9681 a!4392) i!1487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!362126 d!72045))

(check-sat (not bm!27188) (not b!362157))
(check-sat)
(get-model)

(declare-fun b!362187 () Bool)

(declare-fun e!221843 () (_ BitVec 32))

(declare-fun call!27199 () (_ BitVec 32))

(assert (=> b!362187 (= e!221843 call!27199)))

(declare-fun b!362188 () Bool)

(declare-fun e!221842 () (_ BitVec 32))

(assert (=> b!362188 (= e!221842 #b00000000000000000000000000000000)))

(declare-fun d!72051 () Bool)

(declare-fun lt!166649 () (_ BitVec 32))

(assert (=> d!72051 (and (bvsge lt!166649 #b00000000000000000000000000000000) (bvsle lt!166649 (bvsub (size!10033 a!4392) (bvadd i!1487 #b00000000000000000000000000000001))))))

(assert (=> d!72051 (= lt!166649 e!221842)))

(declare-fun c!53748 () Bool)

(assert (=> d!72051 (= c!53748 (bvsge (bvadd i!1487 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1487)))))

(assert (=> d!72051 (and (bvsle (bvadd i!1487 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1487)) (bvsge (bvadd i!1487 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1487) (size!10033 a!4392)))))

(assert (=> d!72051 (= (arrayCountValidKeys!0 a!4392 (bvadd i!1487 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1487)) lt!166649)))

(declare-fun b!362189 () Bool)

(assert (=> b!362189 (= e!221842 e!221843)))

(declare-fun c!53747 () Bool)

(assert (=> b!362189 (= c!53747 (validKeyInArray!0 (select (arr!9681 a!4392) (bvadd i!1487 #b00000000000000000000000000000001))))))

(declare-fun bm!27196 () Bool)

(assert (=> bm!27196 (= call!27199 (arrayCountValidKeys!0 a!4392 (bvadd i!1487 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1487)))))

(declare-fun b!362190 () Bool)

(assert (=> b!362190 (= e!221843 (bvadd #b00000000000000000000000000000001 call!27199))))

(assert (= (and d!72051 c!53748) b!362188))

(assert (= (and d!72051 (not c!53748)) b!362189))

(assert (= (and b!362189 c!53747) b!362190))

(assert (= (and b!362189 (not c!53747)) b!362187))

(assert (= (or b!362190 b!362187) bm!27196))

(declare-fun m!358975 () Bool)

(assert (=> b!362189 m!358975))

(assert (=> b!362189 m!358975))

(declare-fun m!358977 () Bool)

(assert (=> b!362189 m!358977))

(declare-fun m!358979 () Bool)

(assert (=> bm!27196 m!358979))

(assert (=> bm!27188 d!72051))

(assert (=> b!362157 d!72045))

(check-sat (not bm!27196) (not b!362189))
(check-sat)
