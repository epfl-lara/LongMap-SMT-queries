; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36086 () Bool)

(assert start!36086)

(declare-fun res!201522 () Bool)

(declare-fun e!221849 () Bool)

(assert (=> start!36086 (=> (not res!201522) (not e!221849))))

(declare-fun i!1487 () (_ BitVec 32))

(declare-datatypes ((array!20417 0))(
  ( (array!20418 (arr!9692 (Array (_ BitVec 32) (_ BitVec 64))) (size!10044 (_ BitVec 32))) )
))
(declare-fun a!4392 () array!20417)

(assert (=> start!36086 (= res!201522 (and (bvsge i!1487 #b00000000000000000000000000000000) (bvslt i!1487 (size!10044 a!4392))))))

(assert (=> start!36086 e!221849))

(assert (=> start!36086 true))

(declare-fun array_inv!7134 (array!20417) Bool)

(assert (=> start!36086 (array_inv!7134 a!4392)))

(declare-fun b!362188 () Bool)

(declare-fun res!201521 () Bool)

(assert (=> b!362188 (=> (not res!201521) (not e!221849))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362188 (= res!201521 (validKeyInArray!0 (select (arr!9692 a!4392) i!1487)))))

(declare-fun b!362189 () Bool)

(declare-fun res!201523 () Bool)

(assert (=> b!362189 (=> (not res!201523) (not e!221849))))

(assert (=> b!362189 (= res!201523 (bvslt (size!10044 a!4392) #b01111111111111111111111111111111))))

(declare-fun b!362190 () Bool)

(declare-fun arrayCountValidKeys!0 (array!20417 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362190 (= e!221849 (not (= (arrayCountValidKeys!0 a!4392 i!1487 (bvadd #b00000000000000000000000000000001 i!1487)) #b00000000000000000000000000000001)))))

(assert (= (and start!36086 res!201522) b!362188))

(assert (= (and b!362188 res!201521) b!362189))

(assert (= (and b!362189 res!201523) b!362190))

(declare-fun m!358723 () Bool)

(assert (=> start!36086 m!358723))

(declare-fun m!358725 () Bool)

(assert (=> b!362188 m!358725))

(assert (=> b!362188 m!358725))

(declare-fun m!358727 () Bool)

(assert (=> b!362188 m!358727))

(declare-fun m!358729 () Bool)

(assert (=> b!362190 m!358729))

(check-sat (not start!36086) (not b!362188) (not b!362190))
(check-sat)
(get-model)

(declare-fun d!72003 () Bool)

(assert (=> d!72003 (= (array_inv!7134 a!4392) (bvsge (size!10044 a!4392) #b00000000000000000000000000000000))))

(assert (=> start!36086 d!72003))

(declare-fun d!72005 () Bool)

(assert (=> d!72005 (= (validKeyInArray!0 (select (arr!9692 a!4392) i!1487)) (and (not (= (select (arr!9692 a!4392) i!1487) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!9692 a!4392) i!1487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!362188 d!72005))

(declare-fun b!362216 () Bool)

(declare-fun e!221865 () (_ BitVec 32))

(declare-fun call!27207 () (_ BitVec 32))

(assert (=> b!362216 (= e!221865 (bvadd #b00000000000000000000000000000001 call!27207))))

(declare-fun b!362217 () Bool)

(assert (=> b!362217 (= e!221865 call!27207)))

(declare-fun d!72007 () Bool)

(declare-fun lt!166625 () (_ BitVec 32))

(assert (=> d!72007 (and (bvsge lt!166625 #b00000000000000000000000000000000) (bvsle lt!166625 (bvsub (size!10044 a!4392) i!1487)))))

(declare-fun e!221864 () (_ BitVec 32))

(assert (=> d!72007 (= lt!166625 e!221864)))

(declare-fun c!53760 () Bool)

(assert (=> d!72007 (= c!53760 (bvsge i!1487 (bvadd #b00000000000000000000000000000001 i!1487)))))

(assert (=> d!72007 (and (bvsle i!1487 (bvadd #b00000000000000000000000000000001 i!1487)) (bvsge i!1487 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1487) (size!10044 a!4392)))))

(assert (=> d!72007 (= (arrayCountValidKeys!0 a!4392 i!1487 (bvadd #b00000000000000000000000000000001 i!1487)) lt!166625)))

(declare-fun b!362218 () Bool)

(assert (=> b!362218 (= e!221864 #b00000000000000000000000000000000)))

(declare-fun b!362219 () Bool)

(assert (=> b!362219 (= e!221864 e!221865)))

(declare-fun c!53761 () Bool)

(assert (=> b!362219 (= c!53761 (validKeyInArray!0 (select (arr!9692 a!4392) i!1487)))))

(declare-fun bm!27204 () Bool)

(assert (=> bm!27204 (= call!27207 (arrayCountValidKeys!0 a!4392 (bvadd i!1487 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1487)))))

(assert (= (and d!72007 c!53760) b!362218))

(assert (= (and d!72007 (not c!53760)) b!362219))

(assert (= (and b!362219 c!53761) b!362216))

(assert (= (and b!362219 (not c!53761)) b!362217))

(assert (= (or b!362216 b!362217) bm!27204))

(assert (=> b!362219 m!358725))

(assert (=> b!362219 m!358725))

(assert (=> b!362219 m!358727))

(declare-fun m!358739 () Bool)

(assert (=> bm!27204 m!358739))

(assert (=> b!362190 d!72007))

(check-sat (not bm!27204) (not b!362219))
(check-sat)
(get-model)

(declare-fun b!362236 () Bool)

(declare-fun e!221875 () (_ BitVec 32))

(declare-fun call!27212 () (_ BitVec 32))

(assert (=> b!362236 (= e!221875 (bvadd #b00000000000000000000000000000001 call!27212))))

(declare-fun b!362237 () Bool)

(assert (=> b!362237 (= e!221875 call!27212)))

(declare-fun d!72021 () Bool)

(declare-fun lt!166630 () (_ BitVec 32))

(assert (=> d!72021 (and (bvsge lt!166630 #b00000000000000000000000000000000) (bvsle lt!166630 (bvsub (size!10044 a!4392) (bvadd i!1487 #b00000000000000000000000000000001))))))

(declare-fun e!221874 () (_ BitVec 32))

(assert (=> d!72021 (= lt!166630 e!221874)))

(declare-fun c!53770 () Bool)

(assert (=> d!72021 (= c!53770 (bvsge (bvadd i!1487 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1487)))))

(assert (=> d!72021 (and (bvsle (bvadd i!1487 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1487)) (bvsge (bvadd i!1487 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1487) (size!10044 a!4392)))))

(assert (=> d!72021 (= (arrayCountValidKeys!0 a!4392 (bvadd i!1487 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1487)) lt!166630)))

(declare-fun b!362238 () Bool)

(assert (=> b!362238 (= e!221874 #b00000000000000000000000000000000)))

(declare-fun b!362239 () Bool)

(assert (=> b!362239 (= e!221874 e!221875)))

(declare-fun c!53771 () Bool)

(assert (=> b!362239 (= c!53771 (validKeyInArray!0 (select (arr!9692 a!4392) (bvadd i!1487 #b00000000000000000000000000000001))))))

(declare-fun bm!27209 () Bool)

(assert (=> bm!27209 (= call!27212 (arrayCountValidKeys!0 a!4392 (bvadd i!1487 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1487)))))

(assert (= (and d!72021 c!53770) b!362238))

(assert (= (and d!72021 (not c!53770)) b!362239))

(assert (= (and b!362239 c!53771) b!362236))

(assert (= (and b!362239 (not c!53771)) b!362237))

(assert (= (or b!362236 b!362237) bm!27209))

(declare-fun m!358745 () Bool)

(assert (=> b!362239 m!358745))

(assert (=> b!362239 m!358745))

(declare-fun m!358747 () Bool)

(assert (=> b!362239 m!358747))

(declare-fun m!358749 () Bool)

(assert (=> bm!27209 m!358749))

(assert (=> bm!27204 d!72021))

(assert (=> b!362219 d!72005))

(check-sat (not bm!27209) (not b!362239))
(check-sat)
