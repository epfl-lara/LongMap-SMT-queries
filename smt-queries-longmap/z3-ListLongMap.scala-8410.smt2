; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102278 () Bool)

(assert start!102278)

(declare-fun b!1231051 () Bool)

(declare-fun res!819522 () Bool)

(declare-fun e!698325 () Bool)

(assert (=> b!1231051 (=> (not res!819522) (not e!698325))))

(declare-datatypes ((List!27101 0))(
  ( (Nil!27098) (Cons!27097 (h!28306 (_ BitVec 64)) (t!40564 List!27101)) )
))
(declare-fun acc!823 () List!27101)

(declare-fun contains!7163 (List!27101 (_ BitVec 64)) Bool)

(assert (=> b!1231051 (= res!819522 (not (contains!7163 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231052 () Bool)

(declare-fun res!819513 () Bool)

(assert (=> b!1231052 (=> (not res!819513) (not e!698325))))

(declare-datatypes ((array!79420 0))(
  ( (array!79421 (arr!38328 (Array (_ BitVec 32) (_ BitVec 64))) (size!38864 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79420)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79420 (_ BitVec 32) List!27101) Bool)

(assert (=> b!1231052 (= res!819513 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun res!819515 () Bool)

(assert (=> start!102278 (=> (not res!819515) (not e!698325))))

(assert (=> start!102278 (= res!819515 (bvslt (size!38864 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102278 e!698325))

(declare-fun array_inv!29176 (array!79420) Bool)

(assert (=> start!102278 (array_inv!29176 a!3806)))

(assert (=> start!102278 true))

(declare-fun b!1231053 () Bool)

(declare-fun e!698327 () Bool)

(assert (=> b!1231053 (= e!698327 (not (contains!7163 Nil!27098 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231054 () Bool)

(declare-fun e!698328 () Bool)

(assert (=> b!1231054 (= e!698328 e!698327)))

(declare-fun res!819523 () Bool)

(assert (=> b!1231054 (=> (not res!819523) (not e!698327))))

(assert (=> b!1231054 (= res!819523 (not (contains!7163 Nil!27098 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231055 () Bool)

(declare-fun res!819521 () Bool)

(assert (=> b!1231055 (=> (not res!819521) (not e!698325))))

(assert (=> b!1231055 (= res!819521 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38864 a!3806)) (bvslt from!3184 (size!38864 a!3806))))))

(declare-fun b!1231056 () Bool)

(declare-fun res!819518 () Bool)

(assert (=> b!1231056 (=> (not res!819518) (not e!698325))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79420 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1231056 (= res!819518 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1231057 () Bool)

(declare-fun res!819514 () Bool)

(assert (=> b!1231057 (=> (not res!819514) (not e!698325))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1231057 (= res!819514 (validKeyInArray!0 k0!2913))))

(declare-fun b!1231058 () Bool)

(declare-fun res!819517 () Bool)

(assert (=> b!1231058 (=> (not res!819517) (not e!698325))))

(assert (=> b!1231058 (= res!819517 (not (contains!7163 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231059 () Bool)

(declare-fun res!819516 () Bool)

(assert (=> b!1231059 (=> (not res!819516) (not e!698325))))

(assert (=> b!1231059 (= res!819516 (validKeyInArray!0 (select (arr!38328 a!3806) from!3184)))))

(declare-fun b!1231060 () Bool)

(declare-fun res!819520 () Bool)

(assert (=> b!1231060 (=> (not res!819520) (not e!698325))))

(declare-fun noDuplicate!1760 (List!27101) Bool)

(assert (=> b!1231060 (= res!819520 (noDuplicate!1760 acc!823))))

(declare-fun b!1231061 () Bool)

(assert (=> b!1231061 (= e!698325 (not e!698328))))

(declare-fun res!819519 () Bool)

(assert (=> b!1231061 (=> res!819519 e!698328)))

(assert (=> b!1231061 (= res!819519 (bvsgt from!3184 (size!38864 a!3806)))))

(assert (=> b!1231061 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27097 (select (arr!38328 a!3806) from!3184) acc!823))))

(assert (= (and start!102278 res!819515) b!1231057))

(assert (= (and b!1231057 res!819514) b!1231055))

(assert (= (and b!1231055 res!819521) b!1231060))

(assert (= (and b!1231060 res!819520) b!1231051))

(assert (= (and b!1231051 res!819522) b!1231058))

(assert (= (and b!1231058 res!819517) b!1231056))

(assert (= (and b!1231056 res!819518) b!1231052))

(assert (= (and b!1231052 res!819513) b!1231059))

(assert (= (and b!1231059 res!819516) b!1231061))

(assert (= (and b!1231061 (not res!819519)) b!1231054))

(assert (= (and b!1231054 res!819523) b!1231053))

(declare-fun m!1135291 () Bool)

(assert (=> b!1231061 m!1135291))

(declare-fun m!1135293 () Bool)

(assert (=> b!1231061 m!1135293))

(declare-fun m!1135295 () Bool)

(assert (=> b!1231052 m!1135295))

(declare-fun m!1135297 () Bool)

(assert (=> b!1231056 m!1135297))

(declare-fun m!1135299 () Bool)

(assert (=> b!1231053 m!1135299))

(declare-fun m!1135301 () Bool)

(assert (=> b!1231060 m!1135301))

(declare-fun m!1135303 () Bool)

(assert (=> start!102278 m!1135303))

(assert (=> b!1231059 m!1135291))

(assert (=> b!1231059 m!1135291))

(declare-fun m!1135305 () Bool)

(assert (=> b!1231059 m!1135305))

(declare-fun m!1135307 () Bool)

(assert (=> b!1231058 m!1135307))

(declare-fun m!1135309 () Bool)

(assert (=> b!1231057 m!1135309))

(declare-fun m!1135311 () Bool)

(assert (=> b!1231051 m!1135311))

(declare-fun m!1135313 () Bool)

(assert (=> b!1231054 m!1135313))

(check-sat (not b!1231051) (not b!1231058) (not b!1231054) (not start!102278) (not b!1231053) (not b!1231060) (not b!1231057) (not b!1231056) (not b!1231052) (not b!1231061) (not b!1231059))
(check-sat)
(get-model)

(declare-fun d!134631 () Bool)

(declare-fun lt!559385 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!560 (List!27101) (InoxSet (_ BitVec 64)))

(assert (=> d!134631 (= lt!559385 (select (content!560 Nil!27098) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!698346 () Bool)

(assert (=> d!134631 (= lt!559385 e!698346)))

(declare-fun res!819562 () Bool)

(assert (=> d!134631 (=> (not res!819562) (not e!698346))))

(get-info :version)

(assert (=> d!134631 (= res!819562 ((_ is Cons!27097) Nil!27098))))

(assert (=> d!134631 (= (contains!7163 Nil!27098 #b0000000000000000000000000000000000000000000000000000000000000000) lt!559385)))

(declare-fun b!1231099 () Bool)

(declare-fun e!698345 () Bool)

(assert (=> b!1231099 (= e!698346 e!698345)))

(declare-fun res!819561 () Bool)

(assert (=> b!1231099 (=> res!819561 e!698345)))

(assert (=> b!1231099 (= res!819561 (= (h!28306 Nil!27098) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1231100 () Bool)

(assert (=> b!1231100 (= e!698345 (contains!7163 (t!40564 Nil!27098) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134631 res!819562) b!1231099))

(assert (= (and b!1231099 (not res!819561)) b!1231100))

(declare-fun m!1135339 () Bool)

(assert (=> d!134631 m!1135339))

(declare-fun m!1135341 () Bool)

(assert (=> d!134631 m!1135341))

(declare-fun m!1135343 () Bool)

(assert (=> b!1231100 m!1135343))

(assert (=> b!1231054 d!134631))

(declare-fun d!134633 () Bool)

(assert (=> d!134633 (= (validKeyInArray!0 (select (arr!38328 a!3806) from!3184)) (and (not (= (select (arr!38328 a!3806) from!3184) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38328 a!3806) from!3184) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1231059 d!134633))

(declare-fun d!134637 () Bool)

(declare-fun lt!559386 () Bool)

(assert (=> d!134637 (= lt!559386 (select (content!560 Nil!27098) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!698348 () Bool)

(assert (=> d!134637 (= lt!559386 e!698348)))

(declare-fun res!819564 () Bool)

(assert (=> d!134637 (=> (not res!819564) (not e!698348))))

(assert (=> d!134637 (= res!819564 ((_ is Cons!27097) Nil!27098))))

(assert (=> d!134637 (= (contains!7163 Nil!27098 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559386)))

(declare-fun b!1231101 () Bool)

(declare-fun e!698347 () Bool)

(assert (=> b!1231101 (= e!698348 e!698347)))

(declare-fun res!819563 () Bool)

(assert (=> b!1231101 (=> res!819563 e!698347)))

(assert (=> b!1231101 (= res!819563 (= (h!28306 Nil!27098) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1231102 () Bool)

(assert (=> b!1231102 (= e!698347 (contains!7163 (t!40564 Nil!27098) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134637 res!819564) b!1231101))

(assert (= (and b!1231101 (not res!819563)) b!1231102))

(assert (=> d!134637 m!1135339))

(declare-fun m!1135345 () Bool)

(assert (=> d!134637 m!1135345))

(declare-fun m!1135347 () Bool)

(assert (=> b!1231102 m!1135347))

(assert (=> b!1231053 d!134637))

(declare-fun d!134639 () Bool)

(declare-fun res!819573 () Bool)

(declare-fun e!698357 () Bool)

(assert (=> d!134639 (=> res!819573 e!698357)))

(assert (=> d!134639 (= res!819573 ((_ is Nil!27098) acc!823))))

(assert (=> d!134639 (= (noDuplicate!1760 acc!823) e!698357)))

(declare-fun b!1231111 () Bool)

(declare-fun e!698358 () Bool)

(assert (=> b!1231111 (= e!698357 e!698358)))

(declare-fun res!819574 () Bool)

(assert (=> b!1231111 (=> (not res!819574) (not e!698358))))

(assert (=> b!1231111 (= res!819574 (not (contains!7163 (t!40564 acc!823) (h!28306 acc!823))))))

(declare-fun b!1231112 () Bool)

(assert (=> b!1231112 (= e!698358 (noDuplicate!1760 (t!40564 acc!823)))))

(assert (= (and d!134639 (not res!819573)) b!1231111))

(assert (= (and b!1231111 res!819574) b!1231112))

(declare-fun m!1135349 () Bool)

(assert (=> b!1231111 m!1135349))

(declare-fun m!1135351 () Bool)

(assert (=> b!1231112 m!1135351))

(assert (=> b!1231060 d!134639))

(declare-fun d!134643 () Bool)

(declare-fun lt!559390 () Bool)

(assert (=> d!134643 (= lt!559390 (select (content!560 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!698362 () Bool)

(assert (=> d!134643 (= lt!559390 e!698362)))

(declare-fun res!819578 () Bool)

(assert (=> d!134643 (=> (not res!819578) (not e!698362))))

(assert (=> d!134643 (= res!819578 ((_ is Cons!27097) acc!823))))

(assert (=> d!134643 (= (contains!7163 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000) lt!559390)))

(declare-fun b!1231115 () Bool)

(declare-fun e!698361 () Bool)

(assert (=> b!1231115 (= e!698362 e!698361)))

(declare-fun res!819577 () Bool)

(assert (=> b!1231115 (=> res!819577 e!698361)))

(assert (=> b!1231115 (= res!819577 (= (h!28306 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1231116 () Bool)

(assert (=> b!1231116 (= e!698361 (contains!7163 (t!40564 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134643 res!819578) b!1231115))

(assert (= (and b!1231115 (not res!819577)) b!1231116))

(declare-fun m!1135353 () Bool)

(assert (=> d!134643 m!1135353))

(declare-fun m!1135357 () Bool)

(assert (=> d!134643 m!1135357))

(declare-fun m!1135361 () Bool)

(assert (=> b!1231116 m!1135361))

(assert (=> b!1231051 d!134643))

(declare-fun d!134645 () Bool)

(declare-fun res!819589 () Bool)

(declare-fun e!698375 () Bool)

(assert (=> d!134645 (=> res!819589 e!698375)))

(assert (=> d!134645 (= res!819589 (= (select (arr!38328 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) k0!2913))))

(assert (=> d!134645 (= (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)) e!698375)))

(declare-fun b!1231131 () Bool)

(declare-fun e!698376 () Bool)

(assert (=> b!1231131 (= e!698375 e!698376)))

(declare-fun res!819590 () Bool)

(assert (=> b!1231131 (=> (not res!819590) (not e!698376))))

(assert (=> b!1231131 (= res!819590 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38864 a!3806)))))

(declare-fun b!1231132 () Bool)

(assert (=> b!1231132 (= e!698376 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)))))

(assert (= (and d!134645 (not res!819589)) b!1231131))

(assert (= (and b!1231131 res!819590) b!1231132))

(declare-fun m!1135365 () Bool)

(assert (=> d!134645 m!1135365))

(declare-fun m!1135367 () Bool)

(assert (=> b!1231132 m!1135367))

(assert (=> b!1231056 d!134645))

(declare-fun bm!60872 () Bool)

(declare-fun c!120638 () Bool)

(declare-fun call!60875 () Bool)

(assert (=> bm!60872 (= call!60875 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120638 (Cons!27097 (select (arr!38328 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27097 (select (arr!38328 a!3806) from!3184) acc!823)) (Cons!27097 (select (arr!38328 a!3806) from!3184) acc!823))))))

(declare-fun d!134651 () Bool)

(declare-fun res!819616 () Bool)

(declare-fun e!698411 () Bool)

(assert (=> d!134651 (=> res!819616 e!698411)))

(assert (=> d!134651 (= res!819616 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38864 a!3806)))))

(assert (=> d!134651 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27097 (select (arr!38328 a!3806) from!3184) acc!823)) e!698411)))

(declare-fun b!1231172 () Bool)

(declare-fun e!698409 () Bool)

(declare-fun e!698410 () Bool)

(assert (=> b!1231172 (= e!698409 e!698410)))

(assert (=> b!1231172 (= c!120638 (validKeyInArray!0 (select (arr!38328 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1231173 () Bool)

(assert (=> b!1231173 (= e!698410 call!60875)))

(declare-fun b!1231174 () Bool)

(assert (=> b!1231174 (= e!698410 call!60875)))

(declare-fun b!1231175 () Bool)

(declare-fun e!698412 () Bool)

(assert (=> b!1231175 (= e!698412 (contains!7163 (Cons!27097 (select (arr!38328 a!3806) from!3184) acc!823) (select (arr!38328 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1231176 () Bool)

(assert (=> b!1231176 (= e!698411 e!698409)))

(declare-fun res!819618 () Bool)

(assert (=> b!1231176 (=> (not res!819618) (not e!698409))))

(assert (=> b!1231176 (= res!819618 (not e!698412))))

(declare-fun res!819617 () Bool)

(assert (=> b!1231176 (=> (not res!819617) (not e!698412))))

(assert (=> b!1231176 (= res!819617 (validKeyInArray!0 (select (arr!38328 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(assert (= (and d!134651 (not res!819616)) b!1231176))

(assert (= (and b!1231176 res!819617) b!1231175))

(assert (= (and b!1231176 res!819618) b!1231172))

(assert (= (and b!1231172 c!120638) b!1231173))

(assert (= (and b!1231172 (not c!120638)) b!1231174))

(assert (= (or b!1231173 b!1231174) bm!60872))

(assert (=> bm!60872 m!1135365))

(declare-fun m!1135395 () Bool)

(assert (=> bm!60872 m!1135395))

(assert (=> b!1231172 m!1135365))

(assert (=> b!1231172 m!1135365))

(declare-fun m!1135397 () Bool)

(assert (=> b!1231172 m!1135397))

(assert (=> b!1231175 m!1135365))

(assert (=> b!1231175 m!1135365))

(declare-fun m!1135399 () Bool)

(assert (=> b!1231175 m!1135399))

(assert (=> b!1231176 m!1135365))

(assert (=> b!1231176 m!1135365))

(assert (=> b!1231176 m!1135397))

(assert (=> b!1231061 d!134651))

(declare-fun d!134661 () Bool)

(declare-fun lt!559394 () Bool)

(assert (=> d!134661 (= lt!559394 (select (content!560 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!698420 () Bool)

(assert (=> d!134661 (= lt!559394 e!698420)))

(declare-fun res!819626 () Bool)

(assert (=> d!134661 (=> (not res!819626) (not e!698420))))

(assert (=> d!134661 (= res!819626 ((_ is Cons!27097) acc!823))))

(assert (=> d!134661 (= (contains!7163 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559394)))

(declare-fun b!1231183 () Bool)

(declare-fun e!698419 () Bool)

(assert (=> b!1231183 (= e!698420 e!698419)))

(declare-fun res!819625 () Bool)

(assert (=> b!1231183 (=> res!819625 e!698419)))

(assert (=> b!1231183 (= res!819625 (= (h!28306 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1231184 () Bool)

(assert (=> b!1231184 (= e!698419 (contains!7163 (t!40564 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134661 res!819626) b!1231183))

(assert (= (and b!1231183 (not res!819625)) b!1231184))

(assert (=> d!134661 m!1135353))

(declare-fun m!1135401 () Bool)

(assert (=> d!134661 m!1135401))

(declare-fun m!1135403 () Bool)

(assert (=> b!1231184 m!1135403))

(assert (=> b!1231058 d!134661))

(declare-fun d!134663 () Bool)

(assert (=> d!134663 (= (array_inv!29176 a!3806) (bvsge (size!38864 a!3806) #b00000000000000000000000000000000))))

(assert (=> start!102278 d!134663))

(declare-fun c!120639 () Bool)

(declare-fun bm!60873 () Bool)

(declare-fun call!60876 () Bool)

(assert (=> bm!60873 (= call!60876 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120639 (Cons!27097 (select (arr!38328 a!3806) from!3184) acc!823) acc!823)))))

(declare-fun d!134667 () Bool)

(declare-fun res!819633 () Bool)

(declare-fun e!698429 () Bool)

(assert (=> d!134667 (=> res!819633 e!698429)))

(assert (=> d!134667 (= res!819633 (bvsge from!3184 (size!38864 a!3806)))))

(assert (=> d!134667 (= (arrayNoDuplicates!0 a!3806 from!3184 acc!823) e!698429)))

(declare-fun b!1231191 () Bool)

(declare-fun e!698427 () Bool)

(declare-fun e!698428 () Bool)

(assert (=> b!1231191 (= e!698427 e!698428)))

(assert (=> b!1231191 (= c!120639 (validKeyInArray!0 (select (arr!38328 a!3806) from!3184)))))

(declare-fun b!1231192 () Bool)

(assert (=> b!1231192 (= e!698428 call!60876)))

(declare-fun b!1231193 () Bool)

(assert (=> b!1231193 (= e!698428 call!60876)))

(declare-fun b!1231194 () Bool)

(declare-fun e!698430 () Bool)

(assert (=> b!1231194 (= e!698430 (contains!7163 acc!823 (select (arr!38328 a!3806) from!3184)))))

(declare-fun b!1231195 () Bool)

(assert (=> b!1231195 (= e!698429 e!698427)))

(declare-fun res!819635 () Bool)

(assert (=> b!1231195 (=> (not res!819635) (not e!698427))))

(assert (=> b!1231195 (= res!819635 (not e!698430))))

(declare-fun res!819634 () Bool)

(assert (=> b!1231195 (=> (not res!819634) (not e!698430))))

(assert (=> b!1231195 (= res!819634 (validKeyInArray!0 (select (arr!38328 a!3806) from!3184)))))

(assert (= (and d!134667 (not res!819633)) b!1231195))

(assert (= (and b!1231195 res!819634) b!1231194))

(assert (= (and b!1231195 res!819635) b!1231191))

(assert (= (and b!1231191 c!120639) b!1231192))

(assert (= (and b!1231191 (not c!120639)) b!1231193))

(assert (= (or b!1231192 b!1231193) bm!60873))

(assert (=> bm!60873 m!1135291))

(declare-fun m!1135407 () Bool)

(assert (=> bm!60873 m!1135407))

(assert (=> b!1231191 m!1135291))

(assert (=> b!1231191 m!1135291))

(assert (=> b!1231191 m!1135305))

(assert (=> b!1231194 m!1135291))

(assert (=> b!1231194 m!1135291))

(declare-fun m!1135409 () Bool)

(assert (=> b!1231194 m!1135409))

(assert (=> b!1231195 m!1135291))

(assert (=> b!1231195 m!1135291))

(assert (=> b!1231195 m!1135305))

(assert (=> b!1231052 d!134667))

(declare-fun d!134673 () Bool)

(assert (=> d!134673 (= (validKeyInArray!0 k0!2913) (and (not (= k0!2913 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2913 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1231057 d!134673))

(check-sat (not b!1231175) (not b!1231111) (not b!1231176) (not bm!60873) (not b!1231116) (not d!134643) (not b!1231100) (not b!1231132) (not d!134631) (not d!134637) (not b!1231194) (not b!1231112) (not d!134661) (not b!1231184) (not b!1231191) (not b!1231102) (not bm!60872) (not b!1231195) (not b!1231172))
(check-sat)
