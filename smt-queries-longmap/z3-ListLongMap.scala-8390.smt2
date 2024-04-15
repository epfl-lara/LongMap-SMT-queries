; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102010 () Bool)

(assert start!102010)

(declare-fun b!1228308 () Bool)

(declare-fun res!816975 () Bool)

(declare-fun e!697141 () Bool)

(assert (=> b!1228308 (=> (not res!816975) (not e!697141))))

(declare-datatypes ((List!27102 0))(
  ( (Nil!27099) (Cons!27098 (h!28307 (_ BitVec 64)) (t!40556 List!27102)) )
))
(declare-fun acc!823 () List!27102)

(declare-fun contains!7074 (List!27102 (_ BitVec 64)) Bool)

(assert (=> b!1228308 (= res!816975 (not (contains!7074 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!816974 () Bool)

(assert (=> start!102010 (=> (not res!816974) (not e!697141))))

(declare-datatypes ((array!79210 0))(
  ( (array!79211 (arr!38228 (Array (_ BitVec 32) (_ BitVec 64))) (size!38766 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79210)

(assert (=> start!102010 (= res!816974 (bvslt (size!38766 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102010 e!697141))

(declare-fun array_inv!29211 (array!79210) Bool)

(assert (=> start!102010 (array_inv!29211 a!3806)))

(assert (=> start!102010 true))

(declare-fun b!1228309 () Bool)

(declare-fun e!697142 () Bool)

(assert (=> b!1228309 (= e!697141 (not e!697142))))

(declare-fun res!816970 () Bool)

(assert (=> b!1228309 (=> res!816970 e!697142)))

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1228309 (= res!816970 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(declare-fun arrayNoDuplicates!0 (array!79210 (_ BitVec 32) List!27102) Bool)

(assert (=> b!1228309 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27099)))

(declare-datatypes ((Unit!40547 0))(
  ( (Unit!40548) )
))
(declare-fun lt!558815 () Unit!40547)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79210 List!27102 List!27102 (_ BitVec 32)) Unit!40547)

(assert (=> b!1228309 (= lt!558815 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27099 from!3184))))

(assert (=> b!1228309 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27098 (select (arr!38228 a!3806) from!3184) acc!823))))

(declare-fun b!1228310 () Bool)

(declare-fun noDuplicate!1717 (List!27102) Bool)

(assert (=> b!1228310 (= e!697142 (noDuplicate!1717 (Cons!27098 (select (arr!38228 a!3806) from!3184) Nil!27099)))))

(declare-fun b!1228311 () Bool)

(declare-fun res!816972 () Bool)

(assert (=> b!1228311 (=> (not res!816972) (not e!697141))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79210 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1228311 (= res!816972 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1228312 () Bool)

(declare-fun res!816971 () Bool)

(assert (=> b!1228312 (=> (not res!816971) (not e!697141))))

(assert (=> b!1228312 (= res!816971 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38766 a!3806)) (bvslt from!3184 (size!38766 a!3806))))))

(declare-fun b!1228313 () Bool)

(declare-fun res!816968 () Bool)

(assert (=> b!1228313 (=> (not res!816968) (not e!697141))))

(assert (=> b!1228313 (= res!816968 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1228314 () Bool)

(declare-fun res!816969 () Bool)

(assert (=> b!1228314 (=> (not res!816969) (not e!697141))))

(assert (=> b!1228314 (= res!816969 (not (contains!7074 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228315 () Bool)

(declare-fun res!816973 () Bool)

(assert (=> b!1228315 (=> (not res!816973) (not e!697141))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1228315 (= res!816973 (validKeyInArray!0 k0!2913))))

(declare-fun b!1228316 () Bool)

(declare-fun res!816977 () Bool)

(assert (=> b!1228316 (=> (not res!816977) (not e!697141))))

(assert (=> b!1228316 (= res!816977 (validKeyInArray!0 (select (arr!38228 a!3806) from!3184)))))

(declare-fun b!1228317 () Bool)

(declare-fun res!816976 () Bool)

(assert (=> b!1228317 (=> (not res!816976) (not e!697141))))

(assert (=> b!1228317 (= res!816976 (noDuplicate!1717 acc!823))))

(assert (= (and start!102010 res!816974) b!1228315))

(assert (= (and b!1228315 res!816973) b!1228312))

(assert (= (and b!1228312 res!816971) b!1228317))

(assert (= (and b!1228317 res!816976) b!1228314))

(assert (= (and b!1228314 res!816969) b!1228308))

(assert (= (and b!1228308 res!816975) b!1228311))

(assert (= (and b!1228311 res!816972) b!1228313))

(assert (= (and b!1228313 res!816968) b!1228316))

(assert (= (and b!1228316 res!816977) b!1228309))

(assert (= (and b!1228309 (not res!816970)) b!1228310))

(declare-fun m!1132395 () Bool)

(assert (=> b!1228316 m!1132395))

(assert (=> b!1228316 m!1132395))

(declare-fun m!1132397 () Bool)

(assert (=> b!1228316 m!1132397))

(declare-fun m!1132399 () Bool)

(assert (=> start!102010 m!1132399))

(declare-fun m!1132401 () Bool)

(assert (=> b!1228313 m!1132401))

(declare-fun m!1132403 () Bool)

(assert (=> b!1228317 m!1132403))

(declare-fun m!1132405 () Bool)

(assert (=> b!1228311 m!1132405))

(declare-fun m!1132407 () Bool)

(assert (=> b!1228308 m!1132407))

(declare-fun m!1132409 () Bool)

(assert (=> b!1228314 m!1132409))

(declare-fun m!1132411 () Bool)

(assert (=> b!1228309 m!1132411))

(declare-fun m!1132413 () Bool)

(assert (=> b!1228309 m!1132413))

(assert (=> b!1228309 m!1132395))

(declare-fun m!1132415 () Bool)

(assert (=> b!1228309 m!1132415))

(assert (=> b!1228310 m!1132395))

(declare-fun m!1132417 () Bool)

(assert (=> b!1228310 m!1132417))

(declare-fun m!1132419 () Bool)

(assert (=> b!1228315 m!1132419))

(check-sat (not b!1228309) (not b!1228314) (not b!1228316) (not b!1228308) (not b!1228313) (not b!1228317) (not b!1228315) (not start!102010) (not b!1228311) (not b!1228310))
(check-sat)
(get-model)

(declare-fun d!134055 () Bool)

(assert (=> d!134055 (= (array_inv!29211 a!3806) (bvsge (size!38766 a!3806) #b00000000000000000000000000000000))))

(assert (=> start!102010 d!134055))

(declare-fun b!1228388 () Bool)

(declare-fun e!697171 () Bool)

(declare-fun e!697172 () Bool)

(assert (=> b!1228388 (= e!697171 e!697172)))

(declare-fun res!817045 () Bool)

(assert (=> b!1228388 (=> (not res!817045) (not e!697172))))

(declare-fun e!697169 () Bool)

(assert (=> b!1228388 (= res!817045 (not e!697169))))

(declare-fun res!817046 () Bool)

(assert (=> b!1228388 (=> (not res!817046) (not e!697169))))

(assert (=> b!1228388 (= res!817046 (validKeyInArray!0 (select (arr!38228 a!3806) from!3184)))))

(declare-fun d!134057 () Bool)

(declare-fun res!817044 () Bool)

(assert (=> d!134057 (=> res!817044 e!697171)))

(assert (=> d!134057 (= res!817044 (bvsge from!3184 (size!38766 a!3806)))))

(assert (=> d!134057 (= (arrayNoDuplicates!0 a!3806 from!3184 Nil!27099) e!697171)))

(declare-fun b!1228389 () Bool)

(assert (=> b!1228389 (= e!697169 (contains!7074 Nil!27099 (select (arr!38228 a!3806) from!3184)))))

(declare-fun b!1228390 () Bool)

(declare-fun e!697170 () Bool)

(declare-fun call!60789 () Bool)

(assert (=> b!1228390 (= e!697170 call!60789)))

(declare-fun b!1228391 () Bool)

(assert (=> b!1228391 (= e!697172 e!697170)))

(declare-fun c!120535 () Bool)

(assert (=> b!1228391 (= c!120535 (validKeyInArray!0 (select (arr!38228 a!3806) from!3184)))))

(declare-fun bm!60786 () Bool)

(assert (=> bm!60786 (= call!60789 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120535 (Cons!27098 (select (arr!38228 a!3806) from!3184) Nil!27099) Nil!27099)))))

(declare-fun b!1228392 () Bool)

(assert (=> b!1228392 (= e!697170 call!60789)))

(assert (= (and d!134057 (not res!817044)) b!1228388))

(assert (= (and b!1228388 res!817046) b!1228389))

(assert (= (and b!1228388 res!817045) b!1228391))

(assert (= (and b!1228391 c!120535) b!1228392))

(assert (= (and b!1228391 (not c!120535)) b!1228390))

(assert (= (or b!1228392 b!1228390) bm!60786))

(assert (=> b!1228388 m!1132395))

(assert (=> b!1228388 m!1132395))

(assert (=> b!1228388 m!1132397))

(assert (=> b!1228389 m!1132395))

(assert (=> b!1228389 m!1132395))

(declare-fun m!1132473 () Bool)

(assert (=> b!1228389 m!1132473))

(assert (=> b!1228391 m!1132395))

(assert (=> b!1228391 m!1132395))

(assert (=> b!1228391 m!1132397))

(assert (=> bm!60786 m!1132395))

(declare-fun m!1132475 () Bool)

(assert (=> bm!60786 m!1132475))

(assert (=> b!1228309 d!134057))

(declare-fun d!134061 () Bool)

(assert (=> d!134061 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27099)))

(declare-fun lt!558826 () Unit!40547)

(declare-fun choose!80 (array!79210 List!27102 List!27102 (_ BitVec 32)) Unit!40547)

(assert (=> d!134061 (= lt!558826 (choose!80 a!3806 acc!823 Nil!27099 from!3184))))

(assert (=> d!134061 (bvslt (size!38766 a!3806) #b01111111111111111111111111111111)))

(assert (=> d!134061 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27099 from!3184) lt!558826)))

(declare-fun bs!34504 () Bool)

(assert (= bs!34504 d!134061))

(assert (=> bs!34504 m!1132411))

(declare-fun m!1132481 () Bool)

(assert (=> bs!34504 m!1132481))

(assert (=> b!1228309 d!134061))

(declare-fun b!1228403 () Bool)

(declare-fun e!697185 () Bool)

(declare-fun e!697186 () Bool)

(assert (=> b!1228403 (= e!697185 e!697186)))

(declare-fun res!817058 () Bool)

(assert (=> b!1228403 (=> (not res!817058) (not e!697186))))

(declare-fun e!697183 () Bool)

(assert (=> b!1228403 (= res!817058 (not e!697183))))

(declare-fun res!817059 () Bool)

(assert (=> b!1228403 (=> (not res!817059) (not e!697183))))

(assert (=> b!1228403 (= res!817059 (validKeyInArray!0 (select (arr!38228 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun d!134067 () Bool)

(declare-fun res!817057 () Bool)

(assert (=> d!134067 (=> res!817057 e!697185)))

(assert (=> d!134067 (= res!817057 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38766 a!3806)))))

(assert (=> d!134067 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27098 (select (arr!38228 a!3806) from!3184) acc!823)) e!697185)))

(declare-fun b!1228404 () Bool)

(assert (=> b!1228404 (= e!697183 (contains!7074 (Cons!27098 (select (arr!38228 a!3806) from!3184) acc!823) (select (arr!38228 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1228405 () Bool)

(declare-fun e!697184 () Bool)

(declare-fun call!60790 () Bool)

(assert (=> b!1228405 (= e!697184 call!60790)))

(declare-fun b!1228406 () Bool)

(assert (=> b!1228406 (= e!697186 e!697184)))

(declare-fun c!120536 () Bool)

(assert (=> b!1228406 (= c!120536 (validKeyInArray!0 (select (arr!38228 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun bm!60787 () Bool)

(assert (=> bm!60787 (= call!60790 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120536 (Cons!27098 (select (arr!38228 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27098 (select (arr!38228 a!3806) from!3184) acc!823)) (Cons!27098 (select (arr!38228 a!3806) from!3184) acc!823))))))

(declare-fun b!1228407 () Bool)

(assert (=> b!1228407 (= e!697184 call!60790)))

(assert (= (and d!134067 (not res!817057)) b!1228403))

(assert (= (and b!1228403 res!817059) b!1228404))

(assert (= (and b!1228403 res!817058) b!1228406))

(assert (= (and b!1228406 c!120536) b!1228407))

(assert (= (and b!1228406 (not c!120536)) b!1228405))

(assert (= (or b!1228407 b!1228405) bm!60787))

(declare-fun m!1132483 () Bool)

(assert (=> b!1228403 m!1132483))

(assert (=> b!1228403 m!1132483))

(declare-fun m!1132485 () Bool)

(assert (=> b!1228403 m!1132485))

(assert (=> b!1228404 m!1132483))

(assert (=> b!1228404 m!1132483))

(declare-fun m!1132487 () Bool)

(assert (=> b!1228404 m!1132487))

(assert (=> b!1228406 m!1132483))

(assert (=> b!1228406 m!1132483))

(assert (=> b!1228406 m!1132485))

(assert (=> bm!60787 m!1132483))

(declare-fun m!1132489 () Bool)

(assert (=> bm!60787 m!1132489))

(assert (=> b!1228309 d!134067))

(declare-fun d!134069 () Bool)

(assert (=> d!134069 (= (validKeyInArray!0 k0!2913) (and (not (= k0!2913 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2913 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1228315 d!134069))

(declare-fun d!134075 () Bool)

(declare-fun res!817076 () Bool)

(declare-fun e!697203 () Bool)

(assert (=> d!134075 (=> res!817076 e!697203)))

(get-info :version)

(assert (=> d!134075 (= res!817076 ((_ is Nil!27099) (Cons!27098 (select (arr!38228 a!3806) from!3184) Nil!27099)))))

(assert (=> d!134075 (= (noDuplicate!1717 (Cons!27098 (select (arr!38228 a!3806) from!3184) Nil!27099)) e!697203)))

(declare-fun b!1228424 () Bool)

(declare-fun e!697204 () Bool)

(assert (=> b!1228424 (= e!697203 e!697204)))

(declare-fun res!817077 () Bool)

(assert (=> b!1228424 (=> (not res!817077) (not e!697204))))

(assert (=> b!1228424 (= res!817077 (not (contains!7074 (t!40556 (Cons!27098 (select (arr!38228 a!3806) from!3184) Nil!27099)) (h!28307 (Cons!27098 (select (arr!38228 a!3806) from!3184) Nil!27099)))))))

(declare-fun b!1228425 () Bool)

(assert (=> b!1228425 (= e!697204 (noDuplicate!1717 (t!40556 (Cons!27098 (select (arr!38228 a!3806) from!3184) Nil!27099))))))

(assert (= (and d!134075 (not res!817076)) b!1228424))

(assert (= (and b!1228424 res!817077) b!1228425))

(declare-fun m!1132501 () Bool)

(assert (=> b!1228424 m!1132501))

(declare-fun m!1132503 () Bool)

(assert (=> b!1228425 m!1132503))

(assert (=> b!1228310 d!134075))

(declare-fun d!134083 () Bool)

(assert (=> d!134083 (= (validKeyInArray!0 (select (arr!38228 a!3806) from!3184)) (and (not (= (select (arr!38228 a!3806) from!3184) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38228 a!3806) from!3184) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1228316 d!134083))

(declare-fun d!134085 () Bool)

(declare-fun res!817092 () Bool)

(declare-fun e!697221 () Bool)

(assert (=> d!134085 (=> res!817092 e!697221)))

(assert (=> d!134085 (= res!817092 (= (select (arr!38228 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) k0!2913))))

(assert (=> d!134085 (= (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)) e!697221)))

(declare-fun b!1228444 () Bool)

(declare-fun e!697222 () Bool)

(assert (=> b!1228444 (= e!697221 e!697222)))

(declare-fun res!817093 () Bool)

(assert (=> b!1228444 (=> (not res!817093) (not e!697222))))

(assert (=> b!1228444 (= res!817093 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38766 a!3806)))))

(declare-fun b!1228445 () Bool)

(assert (=> b!1228445 (= e!697222 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)))))

(assert (= (and d!134085 (not res!817092)) b!1228444))

(assert (= (and b!1228444 res!817093) b!1228445))

(assert (=> d!134085 m!1132483))

(declare-fun m!1132513 () Bool)

(assert (=> b!1228445 m!1132513))

(assert (=> b!1228311 d!134085))

(declare-fun d!134091 () Bool)

(declare-fun res!817098 () Bool)

(declare-fun e!697227 () Bool)

(assert (=> d!134091 (=> res!817098 e!697227)))

(assert (=> d!134091 (= res!817098 ((_ is Nil!27099) acc!823))))

(assert (=> d!134091 (= (noDuplicate!1717 acc!823) e!697227)))

(declare-fun b!1228450 () Bool)

(declare-fun e!697228 () Bool)

(assert (=> b!1228450 (= e!697227 e!697228)))

(declare-fun res!817099 () Bool)

(assert (=> b!1228450 (=> (not res!817099) (not e!697228))))

(assert (=> b!1228450 (= res!817099 (not (contains!7074 (t!40556 acc!823) (h!28307 acc!823))))))

(declare-fun b!1228451 () Bool)

(assert (=> b!1228451 (= e!697228 (noDuplicate!1717 (t!40556 acc!823)))))

(assert (= (and d!134091 (not res!817098)) b!1228450))

(assert (= (and b!1228450 res!817099) b!1228451))

(declare-fun m!1132515 () Bool)

(assert (=> b!1228450 m!1132515))

(declare-fun m!1132517 () Bool)

(assert (=> b!1228451 m!1132517))

(assert (=> b!1228317 d!134091))

(declare-fun b!1228452 () Bool)

(declare-fun e!697231 () Bool)

(declare-fun e!697232 () Bool)

(assert (=> b!1228452 (= e!697231 e!697232)))

(declare-fun res!817101 () Bool)

(assert (=> b!1228452 (=> (not res!817101) (not e!697232))))

(declare-fun e!697229 () Bool)

(assert (=> b!1228452 (= res!817101 (not e!697229))))

(declare-fun res!817102 () Bool)

(assert (=> b!1228452 (=> (not res!817102) (not e!697229))))

(assert (=> b!1228452 (= res!817102 (validKeyInArray!0 (select (arr!38228 a!3806) from!3184)))))

(declare-fun d!134093 () Bool)

(declare-fun res!817100 () Bool)

(assert (=> d!134093 (=> res!817100 e!697231)))

(assert (=> d!134093 (= res!817100 (bvsge from!3184 (size!38766 a!3806)))))

(assert (=> d!134093 (= (arrayNoDuplicates!0 a!3806 from!3184 acc!823) e!697231)))

(declare-fun b!1228453 () Bool)

(assert (=> b!1228453 (= e!697229 (contains!7074 acc!823 (select (arr!38228 a!3806) from!3184)))))

(declare-fun b!1228454 () Bool)

(declare-fun e!697230 () Bool)

(declare-fun call!60793 () Bool)

(assert (=> b!1228454 (= e!697230 call!60793)))

(declare-fun b!1228455 () Bool)

(assert (=> b!1228455 (= e!697232 e!697230)))

(declare-fun c!120539 () Bool)

(assert (=> b!1228455 (= c!120539 (validKeyInArray!0 (select (arr!38228 a!3806) from!3184)))))

(declare-fun bm!60790 () Bool)

(assert (=> bm!60790 (= call!60793 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120539 (Cons!27098 (select (arr!38228 a!3806) from!3184) acc!823) acc!823)))))

(declare-fun b!1228456 () Bool)

(assert (=> b!1228456 (= e!697230 call!60793)))

(assert (= (and d!134093 (not res!817100)) b!1228452))

(assert (= (and b!1228452 res!817102) b!1228453))

(assert (= (and b!1228452 res!817101) b!1228455))

(assert (= (and b!1228455 c!120539) b!1228456))

(assert (= (and b!1228455 (not c!120539)) b!1228454))

(assert (= (or b!1228456 b!1228454) bm!60790))

(assert (=> b!1228452 m!1132395))

(assert (=> b!1228452 m!1132395))

(assert (=> b!1228452 m!1132397))

(assert (=> b!1228453 m!1132395))

(assert (=> b!1228453 m!1132395))

(declare-fun m!1132519 () Bool)

(assert (=> b!1228453 m!1132519))

(assert (=> b!1228455 m!1132395))

(assert (=> b!1228455 m!1132395))

(assert (=> b!1228455 m!1132397))

(assert (=> bm!60790 m!1132395))

(declare-fun m!1132525 () Bool)

(assert (=> bm!60790 m!1132525))

(assert (=> b!1228313 d!134093))

(declare-fun d!134097 () Bool)

(declare-fun lt!558833 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!554 (List!27102) (InoxSet (_ BitVec 64)))

(assert (=> d!134097 (= lt!558833 (select (content!554 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!697254 () Bool)

(assert (=> d!134097 (= lt!558833 e!697254)))

(declare-fun res!817122 () Bool)

(assert (=> d!134097 (=> (not res!817122) (not e!697254))))

(assert (=> d!134097 (= res!817122 ((_ is Cons!27098) acc!823))))

(assert (=> d!134097 (= (contains!7074 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000) lt!558833)))

(declare-fun b!1228480 () Bool)

(declare-fun e!697253 () Bool)

(assert (=> b!1228480 (= e!697254 e!697253)))

(declare-fun res!817123 () Bool)

(assert (=> b!1228480 (=> res!817123 e!697253)))

(assert (=> b!1228480 (= res!817123 (= (h!28307 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228481 () Bool)

(assert (=> b!1228481 (= e!697253 (contains!7074 (t!40556 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134097 res!817122) b!1228480))

(assert (= (and b!1228480 (not res!817123)) b!1228481))

(declare-fun m!1132531 () Bool)

(assert (=> d!134097 m!1132531))

(declare-fun m!1132533 () Bool)

(assert (=> d!134097 m!1132533))

(declare-fun m!1132535 () Bool)

(assert (=> b!1228481 m!1132535))

(assert (=> b!1228308 d!134097))

(declare-fun d!134103 () Bool)

(declare-fun lt!558834 () Bool)

(assert (=> d!134103 (= lt!558834 (select (content!554 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!697258 () Bool)

(assert (=> d!134103 (= lt!558834 e!697258)))

(declare-fun res!817124 () Bool)

(assert (=> d!134103 (=> (not res!817124) (not e!697258))))

(assert (=> d!134103 (= res!817124 ((_ is Cons!27098) acc!823))))

(assert (=> d!134103 (= (contains!7074 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000) lt!558834)))

(declare-fun b!1228484 () Bool)

(declare-fun e!697257 () Bool)

(assert (=> b!1228484 (= e!697258 e!697257)))

(declare-fun res!817125 () Bool)

(assert (=> b!1228484 (=> res!817125 e!697257)))

(assert (=> b!1228484 (= res!817125 (= (h!28307 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228485 () Bool)

(assert (=> b!1228485 (= e!697257 (contains!7074 (t!40556 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134103 res!817124) b!1228484))

(assert (= (and b!1228484 (not res!817125)) b!1228485))

(assert (=> d!134103 m!1132531))

(declare-fun m!1132537 () Bool)

(assert (=> d!134103 m!1132537))

(declare-fun m!1132539 () Bool)

(assert (=> b!1228485 m!1132539))

(assert (=> b!1228314 d!134103))

(check-sat (not b!1228389) (not b!1228452) (not b!1228453) (not d!134103) (not b!1228445) (not b!1228391) (not b!1228451) (not b!1228406) (not b!1228481) (not b!1228485) (not b!1228450) (not bm!60790) (not b!1228403) (not d!134061) (not b!1228455) (not bm!60787) (not d!134097) (not b!1228424) (not b!1228425) (not b!1228388) (not bm!60786) (not b!1228404))
(check-sat)
(get-model)

(declare-fun b!1228519 () Bool)

(declare-fun e!697289 () Bool)

(declare-fun e!697290 () Bool)

(assert (=> b!1228519 (= e!697289 e!697290)))

(declare-fun res!817150 () Bool)

(assert (=> b!1228519 (=> (not res!817150) (not e!697290))))

(declare-fun e!697287 () Bool)

(assert (=> b!1228519 (= res!817150 (not e!697287))))

(declare-fun res!817151 () Bool)

(assert (=> b!1228519 (=> (not res!817151) (not e!697287))))

(assert (=> b!1228519 (= res!817151 (validKeyInArray!0 (select (arr!38228 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(declare-fun d!134127 () Bool)

(declare-fun res!817149 () Bool)

(assert (=> d!134127 (=> res!817149 e!697289)))

(assert (=> d!134127 (= res!817149 (bvsge (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38766 a!3806)))))

(assert (=> d!134127 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120536 (Cons!27098 (select (arr!38228 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27098 (select (arr!38228 a!3806) from!3184) acc!823)) (Cons!27098 (select (arr!38228 a!3806) from!3184) acc!823))) e!697289)))

(declare-fun b!1228520 () Bool)

(assert (=> b!1228520 (= e!697287 (contains!7074 (ite c!120536 (Cons!27098 (select (arr!38228 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27098 (select (arr!38228 a!3806) from!3184) acc!823)) (Cons!27098 (select (arr!38228 a!3806) from!3184) acc!823)) (select (arr!38228 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1228521 () Bool)

(declare-fun e!697288 () Bool)

(declare-fun call!60802 () Bool)

(assert (=> b!1228521 (= e!697288 call!60802)))

(declare-fun b!1228522 () Bool)

(assert (=> b!1228522 (= e!697290 e!697288)))

(declare-fun c!120548 () Bool)

(assert (=> b!1228522 (= c!120548 (validKeyInArray!0 (select (arr!38228 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(declare-fun bm!60799 () Bool)

(assert (=> bm!60799 (= call!60802 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!120548 (Cons!27098 (select (arr!38228 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)) (ite c!120536 (Cons!27098 (select (arr!38228 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27098 (select (arr!38228 a!3806) from!3184) acc!823)) (Cons!27098 (select (arr!38228 a!3806) from!3184) acc!823))) (ite c!120536 (Cons!27098 (select (arr!38228 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27098 (select (arr!38228 a!3806) from!3184) acc!823)) (Cons!27098 (select (arr!38228 a!3806) from!3184) acc!823)))))))

(declare-fun b!1228523 () Bool)

(assert (=> b!1228523 (= e!697288 call!60802)))

(assert (= (and d!134127 (not res!817149)) b!1228519))

(assert (= (and b!1228519 res!817151) b!1228520))

(assert (= (and b!1228519 res!817150) b!1228522))

(assert (= (and b!1228522 c!120548) b!1228523))

(assert (= (and b!1228522 (not c!120548)) b!1228521))

(assert (= (or b!1228523 b!1228521) bm!60799))

(declare-fun m!1132587 () Bool)

(assert (=> b!1228519 m!1132587))

(assert (=> b!1228519 m!1132587))

(declare-fun m!1132589 () Bool)

(assert (=> b!1228519 m!1132589))

(assert (=> b!1228520 m!1132587))

(assert (=> b!1228520 m!1132587))

(declare-fun m!1132591 () Bool)

(assert (=> b!1228520 m!1132591))

(assert (=> b!1228522 m!1132587))

(assert (=> b!1228522 m!1132587))

(assert (=> b!1228522 m!1132589))

(assert (=> bm!60799 m!1132587))

(declare-fun m!1132593 () Bool)

(assert (=> bm!60799 m!1132593))

(assert (=> bm!60787 d!134127))

(declare-fun d!134129 () Bool)

(declare-fun lt!558843 () Bool)

(assert (=> d!134129 (= lt!558843 (select (content!554 (t!40556 acc!823)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!697292 () Bool)

(assert (=> d!134129 (= lt!558843 e!697292)))

(declare-fun res!817152 () Bool)

(assert (=> d!134129 (=> (not res!817152) (not e!697292))))

(assert (=> d!134129 (= res!817152 ((_ is Cons!27098) (t!40556 acc!823)))))

(assert (=> d!134129 (= (contains!7074 (t!40556 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000) lt!558843)))

(declare-fun b!1228524 () Bool)

(declare-fun e!697291 () Bool)

(assert (=> b!1228524 (= e!697292 e!697291)))

(declare-fun res!817153 () Bool)

(assert (=> b!1228524 (=> res!817153 e!697291)))

(assert (=> b!1228524 (= res!817153 (= (h!28307 (t!40556 acc!823)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228525 () Bool)

(assert (=> b!1228525 (= e!697291 (contains!7074 (t!40556 (t!40556 acc!823)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134129 res!817152) b!1228524))

(assert (= (and b!1228524 (not res!817153)) b!1228525))

(declare-fun m!1132595 () Bool)

(assert (=> d!134129 m!1132595))

(declare-fun m!1132597 () Bool)

(assert (=> d!134129 m!1132597))

(declare-fun m!1132599 () Bool)

(assert (=> b!1228525 m!1132599))

(assert (=> b!1228485 d!134129))

(assert (=> b!1228391 d!134083))

(declare-fun d!134131 () Bool)

(declare-fun lt!558844 () Bool)

(assert (=> d!134131 (= lt!558844 (select (content!554 (t!40556 (Cons!27098 (select (arr!38228 a!3806) from!3184) Nil!27099))) (h!28307 (Cons!27098 (select (arr!38228 a!3806) from!3184) Nil!27099))))))

(declare-fun e!697294 () Bool)

(assert (=> d!134131 (= lt!558844 e!697294)))

(declare-fun res!817154 () Bool)

(assert (=> d!134131 (=> (not res!817154) (not e!697294))))

(assert (=> d!134131 (= res!817154 ((_ is Cons!27098) (t!40556 (Cons!27098 (select (arr!38228 a!3806) from!3184) Nil!27099))))))

(assert (=> d!134131 (= (contains!7074 (t!40556 (Cons!27098 (select (arr!38228 a!3806) from!3184) Nil!27099)) (h!28307 (Cons!27098 (select (arr!38228 a!3806) from!3184) Nil!27099))) lt!558844)))

(declare-fun b!1228526 () Bool)

(declare-fun e!697293 () Bool)

(assert (=> b!1228526 (= e!697294 e!697293)))

(declare-fun res!817155 () Bool)

(assert (=> b!1228526 (=> res!817155 e!697293)))

(assert (=> b!1228526 (= res!817155 (= (h!28307 (t!40556 (Cons!27098 (select (arr!38228 a!3806) from!3184) Nil!27099))) (h!28307 (Cons!27098 (select (arr!38228 a!3806) from!3184) Nil!27099))))))

(declare-fun b!1228527 () Bool)

(assert (=> b!1228527 (= e!697293 (contains!7074 (t!40556 (t!40556 (Cons!27098 (select (arr!38228 a!3806) from!3184) Nil!27099))) (h!28307 (Cons!27098 (select (arr!38228 a!3806) from!3184) Nil!27099))))))

(assert (= (and d!134131 res!817154) b!1228526))

(assert (= (and b!1228526 (not res!817155)) b!1228527))

(declare-fun m!1132601 () Bool)

(assert (=> d!134131 m!1132601))

(declare-fun m!1132603 () Bool)

(assert (=> d!134131 m!1132603))

(declare-fun m!1132605 () Bool)

(assert (=> b!1228527 m!1132605))

(assert (=> b!1228424 d!134131))

(declare-fun b!1228528 () Bool)

(declare-fun e!697297 () Bool)

(declare-fun e!697298 () Bool)

(assert (=> b!1228528 (= e!697297 e!697298)))

(declare-fun res!817157 () Bool)

(assert (=> b!1228528 (=> (not res!817157) (not e!697298))))

(declare-fun e!697295 () Bool)

(assert (=> b!1228528 (= res!817157 (not e!697295))))

(declare-fun res!817158 () Bool)

(assert (=> b!1228528 (=> (not res!817158) (not e!697295))))

(assert (=> b!1228528 (= res!817158 (validKeyInArray!0 (select (arr!38228 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun d!134133 () Bool)

(declare-fun res!817156 () Bool)

(assert (=> d!134133 (=> res!817156 e!697297)))

(assert (=> d!134133 (= res!817156 (bvsge (bvadd from!3184 #b00000000000000000000000000000001) (size!38766 a!3806)))))

(assert (=> d!134133 (= (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120539 (Cons!27098 (select (arr!38228 a!3806) from!3184) acc!823) acc!823)) e!697297)))

(declare-fun b!1228529 () Bool)

(assert (=> b!1228529 (= e!697295 (contains!7074 (ite c!120539 (Cons!27098 (select (arr!38228 a!3806) from!3184) acc!823) acc!823) (select (arr!38228 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1228530 () Bool)

(declare-fun e!697296 () Bool)

(declare-fun call!60803 () Bool)

(assert (=> b!1228530 (= e!697296 call!60803)))

(declare-fun b!1228531 () Bool)

(assert (=> b!1228531 (= e!697298 e!697296)))

(declare-fun c!120549 () Bool)

(assert (=> b!1228531 (= c!120549 (validKeyInArray!0 (select (arr!38228 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun bm!60800 () Bool)

(assert (=> bm!60800 (= call!60803 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!120549 (Cons!27098 (select (arr!38228 a!3806) (bvadd from!3184 #b00000000000000000000000000000001)) (ite c!120539 (Cons!27098 (select (arr!38228 a!3806) from!3184) acc!823) acc!823)) (ite c!120539 (Cons!27098 (select (arr!38228 a!3806) from!3184) acc!823) acc!823))))))

(declare-fun b!1228532 () Bool)

(assert (=> b!1228532 (= e!697296 call!60803)))

(assert (= (and d!134133 (not res!817156)) b!1228528))

(assert (= (and b!1228528 res!817158) b!1228529))

(assert (= (and b!1228528 res!817157) b!1228531))

(assert (= (and b!1228531 c!120549) b!1228532))

(assert (= (and b!1228531 (not c!120549)) b!1228530))

(assert (= (or b!1228532 b!1228530) bm!60800))

(declare-fun m!1132607 () Bool)

(assert (=> b!1228528 m!1132607))

(assert (=> b!1228528 m!1132607))

(declare-fun m!1132609 () Bool)

(assert (=> b!1228528 m!1132609))

(assert (=> b!1228529 m!1132607))

(assert (=> b!1228529 m!1132607))

(declare-fun m!1132611 () Bool)

(assert (=> b!1228529 m!1132611))

(assert (=> b!1228531 m!1132607))

(assert (=> b!1228531 m!1132607))

(assert (=> b!1228531 m!1132609))

(assert (=> bm!60800 m!1132607))

(declare-fun m!1132613 () Bool)

(assert (=> bm!60800 m!1132613))

(assert (=> bm!60790 d!134133))

(declare-fun d!134135 () Bool)

(declare-fun lt!558845 () Bool)

(assert (=> d!134135 (= lt!558845 (select (content!554 (t!40556 acc!823)) (h!28307 acc!823)))))

(declare-fun e!697300 () Bool)

(assert (=> d!134135 (= lt!558845 e!697300)))

(declare-fun res!817159 () Bool)

(assert (=> d!134135 (=> (not res!817159) (not e!697300))))

(assert (=> d!134135 (= res!817159 ((_ is Cons!27098) (t!40556 acc!823)))))

(assert (=> d!134135 (= (contains!7074 (t!40556 acc!823) (h!28307 acc!823)) lt!558845)))

(declare-fun b!1228533 () Bool)

(declare-fun e!697299 () Bool)

(assert (=> b!1228533 (= e!697300 e!697299)))

(declare-fun res!817160 () Bool)

(assert (=> b!1228533 (=> res!817160 e!697299)))

(assert (=> b!1228533 (= res!817160 (= (h!28307 (t!40556 acc!823)) (h!28307 acc!823)))))

(declare-fun b!1228534 () Bool)

(assert (=> b!1228534 (= e!697299 (contains!7074 (t!40556 (t!40556 acc!823)) (h!28307 acc!823)))))

(assert (= (and d!134135 res!817159) b!1228533))

(assert (= (and b!1228533 (not res!817160)) b!1228534))

(assert (=> d!134135 m!1132595))

(declare-fun m!1132615 () Bool)

(assert (=> d!134135 m!1132615))

(declare-fun m!1132617 () Bool)

(assert (=> b!1228534 m!1132617))

(assert (=> b!1228450 d!134135))

(declare-fun b!1228535 () Bool)

(declare-fun e!697303 () Bool)

(declare-fun e!697304 () Bool)

(assert (=> b!1228535 (= e!697303 e!697304)))

(declare-fun res!817162 () Bool)

(assert (=> b!1228535 (=> (not res!817162) (not e!697304))))

(declare-fun e!697301 () Bool)

(assert (=> b!1228535 (= res!817162 (not e!697301))))

(declare-fun res!817163 () Bool)

(assert (=> b!1228535 (=> (not res!817163) (not e!697301))))

(assert (=> b!1228535 (= res!817163 (validKeyInArray!0 (select (arr!38228 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun d!134137 () Bool)

(declare-fun res!817161 () Bool)

(assert (=> d!134137 (=> res!817161 e!697303)))

(assert (=> d!134137 (= res!817161 (bvsge (bvadd from!3184 #b00000000000000000000000000000001) (size!38766 a!3806)))))

(assert (=> d!134137 (= (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120535 (Cons!27098 (select (arr!38228 a!3806) from!3184) Nil!27099) Nil!27099)) e!697303)))

(declare-fun b!1228536 () Bool)

(assert (=> b!1228536 (= e!697301 (contains!7074 (ite c!120535 (Cons!27098 (select (arr!38228 a!3806) from!3184) Nil!27099) Nil!27099) (select (arr!38228 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1228537 () Bool)

(declare-fun e!697302 () Bool)

(declare-fun call!60804 () Bool)

(assert (=> b!1228537 (= e!697302 call!60804)))

(declare-fun b!1228538 () Bool)

(assert (=> b!1228538 (= e!697304 e!697302)))

(declare-fun c!120550 () Bool)

(assert (=> b!1228538 (= c!120550 (validKeyInArray!0 (select (arr!38228 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun bm!60801 () Bool)

(assert (=> bm!60801 (= call!60804 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!120550 (Cons!27098 (select (arr!38228 a!3806) (bvadd from!3184 #b00000000000000000000000000000001)) (ite c!120535 (Cons!27098 (select (arr!38228 a!3806) from!3184) Nil!27099) Nil!27099)) (ite c!120535 (Cons!27098 (select (arr!38228 a!3806) from!3184) Nil!27099) Nil!27099))))))

(declare-fun b!1228539 () Bool)

(assert (=> b!1228539 (= e!697302 call!60804)))

(assert (= (and d!134137 (not res!817161)) b!1228535))

(assert (= (and b!1228535 res!817163) b!1228536))

(assert (= (and b!1228535 res!817162) b!1228538))

(assert (= (and b!1228538 c!120550) b!1228539))

(assert (= (and b!1228538 (not c!120550)) b!1228537))

(assert (= (or b!1228539 b!1228537) bm!60801))

(assert (=> b!1228535 m!1132607))

(assert (=> b!1228535 m!1132607))

(assert (=> b!1228535 m!1132609))

(assert (=> b!1228536 m!1132607))

(assert (=> b!1228536 m!1132607))

(declare-fun m!1132619 () Bool)

(assert (=> b!1228536 m!1132619))

(assert (=> b!1228538 m!1132607))

(assert (=> b!1228538 m!1132607))

(assert (=> b!1228538 m!1132609))

(assert (=> bm!60801 m!1132607))

(declare-fun m!1132621 () Bool)

(assert (=> bm!60801 m!1132621))

(assert (=> bm!60786 d!134137))

(declare-fun d!134139 () Bool)

(declare-fun res!817164 () Bool)

(declare-fun e!697305 () Bool)

(assert (=> d!134139 (=> res!817164 e!697305)))

(assert (=> d!134139 (= res!817164 ((_ is Nil!27099) (t!40556 (Cons!27098 (select (arr!38228 a!3806) from!3184) Nil!27099))))))

(assert (=> d!134139 (= (noDuplicate!1717 (t!40556 (Cons!27098 (select (arr!38228 a!3806) from!3184) Nil!27099))) e!697305)))

(declare-fun b!1228540 () Bool)

(declare-fun e!697306 () Bool)

(assert (=> b!1228540 (= e!697305 e!697306)))

(declare-fun res!817165 () Bool)

(assert (=> b!1228540 (=> (not res!817165) (not e!697306))))

(assert (=> b!1228540 (= res!817165 (not (contains!7074 (t!40556 (t!40556 (Cons!27098 (select (arr!38228 a!3806) from!3184) Nil!27099))) (h!28307 (t!40556 (Cons!27098 (select (arr!38228 a!3806) from!3184) Nil!27099))))))))

(declare-fun b!1228541 () Bool)

(assert (=> b!1228541 (= e!697306 (noDuplicate!1717 (t!40556 (t!40556 (Cons!27098 (select (arr!38228 a!3806) from!3184) Nil!27099)))))))

(assert (= (and d!134139 (not res!817164)) b!1228540))

(assert (= (and b!1228540 res!817165) b!1228541))

(declare-fun m!1132623 () Bool)

(assert (=> b!1228540 m!1132623))

(declare-fun m!1132625 () Bool)

(assert (=> b!1228541 m!1132625))

(assert (=> b!1228425 d!134139))

(declare-fun d!134141 () Bool)

(declare-fun res!817166 () Bool)

(declare-fun e!697307 () Bool)

(assert (=> d!134141 (=> res!817166 e!697307)))

(assert (=> d!134141 (= res!817166 (= (select (arr!38228 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)) k0!2913))))

(assert (=> d!134141 (= (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)) e!697307)))

(declare-fun b!1228542 () Bool)

(declare-fun e!697308 () Bool)

(assert (=> b!1228542 (= e!697307 e!697308)))

(declare-fun res!817167 () Bool)

(assert (=> b!1228542 (=> (not res!817167) (not e!697308))))

(assert (=> b!1228542 (= res!817167 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!38766 a!3806)))))

(declare-fun b!1228543 () Bool)

(assert (=> b!1228543 (= e!697308 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!134141 (not res!817166)) b!1228542))

(assert (= (and b!1228542 res!817167) b!1228543))

(assert (=> d!134141 m!1132587))

(declare-fun m!1132627 () Bool)

(assert (=> b!1228543 m!1132627))

(assert (=> b!1228445 d!134141))

(declare-fun d!134143 () Bool)

(declare-fun res!817168 () Bool)

(declare-fun e!697309 () Bool)

(assert (=> d!134143 (=> res!817168 e!697309)))

(assert (=> d!134143 (= res!817168 ((_ is Nil!27099) (t!40556 acc!823)))))

(assert (=> d!134143 (= (noDuplicate!1717 (t!40556 acc!823)) e!697309)))

(declare-fun b!1228544 () Bool)

(declare-fun e!697310 () Bool)

(assert (=> b!1228544 (= e!697309 e!697310)))

(declare-fun res!817169 () Bool)

(assert (=> b!1228544 (=> (not res!817169) (not e!697310))))

(assert (=> b!1228544 (= res!817169 (not (contains!7074 (t!40556 (t!40556 acc!823)) (h!28307 (t!40556 acc!823)))))))

(declare-fun b!1228545 () Bool)

(assert (=> b!1228545 (= e!697310 (noDuplicate!1717 (t!40556 (t!40556 acc!823))))))

(assert (= (and d!134143 (not res!817168)) b!1228544))

(assert (= (and b!1228544 res!817169) b!1228545))

(declare-fun m!1132629 () Bool)

(assert (=> b!1228544 m!1132629))

(declare-fun m!1132631 () Bool)

(assert (=> b!1228545 m!1132631))

(assert (=> b!1228451 d!134143))

(assert (=> b!1228388 d!134083))

(declare-fun lt!558846 () Bool)

(declare-fun d!134145 () Bool)

(assert (=> d!134145 (= lt!558846 (select (content!554 acc!823) (select (arr!38228 a!3806) from!3184)))))

(declare-fun e!697312 () Bool)

(assert (=> d!134145 (= lt!558846 e!697312)))

(declare-fun res!817170 () Bool)

(assert (=> d!134145 (=> (not res!817170) (not e!697312))))

(assert (=> d!134145 (= res!817170 ((_ is Cons!27098) acc!823))))

(assert (=> d!134145 (= (contains!7074 acc!823 (select (arr!38228 a!3806) from!3184)) lt!558846)))

(declare-fun b!1228546 () Bool)

(declare-fun e!697311 () Bool)

(assert (=> b!1228546 (= e!697312 e!697311)))

(declare-fun res!817171 () Bool)

(assert (=> b!1228546 (=> res!817171 e!697311)))

(assert (=> b!1228546 (= res!817171 (= (h!28307 acc!823) (select (arr!38228 a!3806) from!3184)))))

(declare-fun b!1228547 () Bool)

(assert (=> b!1228547 (= e!697311 (contains!7074 (t!40556 acc!823) (select (arr!38228 a!3806) from!3184)))))

(assert (= (and d!134145 res!817170) b!1228546))

(assert (= (and b!1228546 (not res!817171)) b!1228547))

(assert (=> d!134145 m!1132531))

(assert (=> d!134145 m!1132395))

(declare-fun m!1132633 () Bool)

(assert (=> d!134145 m!1132633))

(assert (=> b!1228547 m!1132395))

(declare-fun m!1132635 () Bool)

(assert (=> b!1228547 m!1132635))

(assert (=> b!1228453 d!134145))

(declare-fun d!134147 () Bool)

(declare-fun lt!558847 () Bool)

(assert (=> d!134147 (= lt!558847 (select (content!554 Nil!27099) (select (arr!38228 a!3806) from!3184)))))

(declare-fun e!697314 () Bool)

(assert (=> d!134147 (= lt!558847 e!697314)))

(declare-fun res!817172 () Bool)

(assert (=> d!134147 (=> (not res!817172) (not e!697314))))

(assert (=> d!134147 (= res!817172 ((_ is Cons!27098) Nil!27099))))

(assert (=> d!134147 (= (contains!7074 Nil!27099 (select (arr!38228 a!3806) from!3184)) lt!558847)))

(declare-fun b!1228548 () Bool)

(declare-fun e!697313 () Bool)

(assert (=> b!1228548 (= e!697314 e!697313)))

(declare-fun res!817173 () Bool)

(assert (=> b!1228548 (=> res!817173 e!697313)))

(assert (=> b!1228548 (= res!817173 (= (h!28307 Nil!27099) (select (arr!38228 a!3806) from!3184)))))

(declare-fun b!1228549 () Bool)

(assert (=> b!1228549 (= e!697313 (contains!7074 (t!40556 Nil!27099) (select (arr!38228 a!3806) from!3184)))))

(assert (= (and d!134147 res!817172) b!1228548))

(assert (= (and b!1228548 (not res!817173)) b!1228549))

(declare-fun m!1132637 () Bool)

(assert (=> d!134147 m!1132637))

(assert (=> d!134147 m!1132395))

(declare-fun m!1132639 () Bool)

(assert (=> d!134147 m!1132639))

(assert (=> b!1228549 m!1132395))

(declare-fun m!1132641 () Bool)

(assert (=> b!1228549 m!1132641))

(assert (=> b!1228389 d!134147))

(declare-fun d!134149 () Bool)

(assert (=> d!134149 (= (validKeyInArray!0 (select (arr!38228 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))) (and (not (= (select (arr!38228 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38228 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1228406 d!134149))

(assert (=> d!134061 d!134057))

(declare-fun d!134151 () Bool)

(assert (=> d!134151 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27099)))

(assert (=> d!134151 true))

(declare-fun _$70!74 () Unit!40547)

(assert (=> d!134151 (= (choose!80 a!3806 acc!823 Nil!27099 from!3184) _$70!74)))

(declare-fun bs!34507 () Bool)

(assert (= bs!34507 d!134151))

(assert (=> bs!34507 m!1132411))

(assert (=> d!134061 d!134151))

(assert (=> b!1228455 d!134083))

(declare-fun d!134153 () Bool)

(declare-fun c!120553 () Bool)

(assert (=> d!134153 (= c!120553 ((_ is Nil!27099) acc!823))))

(declare-fun e!697317 () (InoxSet (_ BitVec 64)))

(assert (=> d!134153 (= (content!554 acc!823) e!697317)))

(declare-fun b!1228554 () Bool)

(assert (=> b!1228554 (= e!697317 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!1228555 () Bool)

(assert (=> b!1228555 (= e!697317 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!28307 acc!823) true) (content!554 (t!40556 acc!823))))))

(assert (= (and d!134153 c!120553) b!1228554))

(assert (= (and d!134153 (not c!120553)) b!1228555))

(declare-fun m!1132643 () Bool)

(assert (=> b!1228555 m!1132643))

(assert (=> b!1228555 m!1132595))

(assert (=> d!134103 d!134153))

(assert (=> b!1228403 d!134149))

(declare-fun d!134155 () Bool)

(declare-fun lt!558848 () Bool)

(assert (=> d!134155 (= lt!558848 (select (content!554 (t!40556 acc!823)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!697319 () Bool)

(assert (=> d!134155 (= lt!558848 e!697319)))

(declare-fun res!817174 () Bool)

(assert (=> d!134155 (=> (not res!817174) (not e!697319))))

(assert (=> d!134155 (= res!817174 ((_ is Cons!27098) (t!40556 acc!823)))))

(assert (=> d!134155 (= (contains!7074 (t!40556 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000) lt!558848)))

(declare-fun b!1228556 () Bool)

(declare-fun e!697318 () Bool)

(assert (=> b!1228556 (= e!697319 e!697318)))

(declare-fun res!817175 () Bool)

(assert (=> b!1228556 (=> res!817175 e!697318)))

(assert (=> b!1228556 (= res!817175 (= (h!28307 (t!40556 acc!823)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228557 () Bool)

(assert (=> b!1228557 (= e!697318 (contains!7074 (t!40556 (t!40556 acc!823)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134155 res!817174) b!1228556))

(assert (= (and b!1228556 (not res!817175)) b!1228557))

(assert (=> d!134155 m!1132595))

(declare-fun m!1132645 () Bool)

(assert (=> d!134155 m!1132645))

(declare-fun m!1132647 () Bool)

(assert (=> b!1228557 m!1132647))

(assert (=> b!1228481 d!134155))

(assert (=> b!1228452 d!134083))

(declare-fun lt!558849 () Bool)

(declare-fun d!134157 () Bool)

(assert (=> d!134157 (= lt!558849 (select (content!554 (Cons!27098 (select (arr!38228 a!3806) from!3184) acc!823)) (select (arr!38228 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun e!697321 () Bool)

(assert (=> d!134157 (= lt!558849 e!697321)))

(declare-fun res!817176 () Bool)

(assert (=> d!134157 (=> (not res!817176) (not e!697321))))

(assert (=> d!134157 (= res!817176 ((_ is Cons!27098) (Cons!27098 (select (arr!38228 a!3806) from!3184) acc!823)))))

(assert (=> d!134157 (= (contains!7074 (Cons!27098 (select (arr!38228 a!3806) from!3184) acc!823) (select (arr!38228 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))) lt!558849)))

(declare-fun b!1228558 () Bool)

(declare-fun e!697320 () Bool)

(assert (=> b!1228558 (= e!697321 e!697320)))

(declare-fun res!817177 () Bool)

(assert (=> b!1228558 (=> res!817177 e!697320)))

(assert (=> b!1228558 (= res!817177 (= (h!28307 (Cons!27098 (select (arr!38228 a!3806) from!3184) acc!823)) (select (arr!38228 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1228559 () Bool)

(assert (=> b!1228559 (= e!697320 (contains!7074 (t!40556 (Cons!27098 (select (arr!38228 a!3806) from!3184) acc!823)) (select (arr!38228 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(assert (= (and d!134157 res!817176) b!1228558))

(assert (= (and b!1228558 (not res!817177)) b!1228559))

(declare-fun m!1132649 () Bool)

(assert (=> d!134157 m!1132649))

(assert (=> d!134157 m!1132483))

(declare-fun m!1132651 () Bool)

(assert (=> d!134157 m!1132651))

(assert (=> b!1228559 m!1132483))

(declare-fun m!1132653 () Bool)

(assert (=> b!1228559 m!1132653))

(assert (=> b!1228404 d!134157))

(assert (=> d!134097 d!134153))

(check-sat (not bm!60800) (not d!134129) (not b!1228547) (not b!1228555) (not b!1228529) (not d!134135) (not b!1228541) (not b!1228531) (not b!1228540) (not b!1228543) (not b!1228538) (not d!134151) (not d!134131) (not d!134147) (not b!1228557) (not b!1228519) (not bm!60799) (not b!1228527) (not b!1228535) (not b!1228549) (not b!1228544) (not d!134145) (not b!1228559) (not b!1228522) (not b!1228520) (not d!134157) (not bm!60801) (not b!1228534) (not b!1228525) (not d!134155) (not b!1228528) (not b!1228545) (not b!1228536))
(check-sat)
