; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102018 () Bool)

(assert start!102018)

(declare-fun b!1228447 () Bool)

(declare-fun e!697220 () Bool)

(declare-datatypes ((array!79291 0))(
  ( (array!79292 (arr!38268 (Array (_ BitVec 32) (_ BitVec 64))) (size!38804 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79291)

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((List!27041 0))(
  ( (Nil!27038) (Cons!27037 (h!28246 (_ BitVec 64)) (t!40504 List!27041)) )
))
(declare-fun noDuplicate!1700 (List!27041) Bool)

(assert (=> b!1228447 (= e!697220 (noDuplicate!1700 (Cons!27037 (select (arr!38268 a!3806) from!3184) Nil!27038)))))

(declare-fun b!1228448 () Bool)

(declare-fun res!817063 () Bool)

(declare-fun e!697218 () Bool)

(assert (=> b!1228448 (=> (not res!817063) (not e!697218))))

(declare-fun acc!823 () List!27041)

(declare-fun arrayNoDuplicates!0 (array!79291 (_ BitVec 32) List!27041) Bool)

(assert (=> b!1228448 (= res!817063 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1228449 () Bool)

(declare-fun res!817059 () Bool)

(assert (=> b!1228449 (=> (not res!817059) (not e!697218))))

(declare-fun contains!7103 (List!27041 (_ BitVec 64)) Bool)

(assert (=> b!1228449 (= res!817059 (not (contains!7103 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228450 () Bool)

(declare-fun res!817060 () Bool)

(assert (=> b!1228450 (=> (not res!817060) (not e!697218))))

(assert (=> b!1228450 (= res!817060 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38804 a!3806)) (bvslt from!3184 (size!38804 a!3806))))))

(declare-fun b!1228451 () Bool)

(declare-fun res!817067 () Bool)

(assert (=> b!1228451 (=> (not res!817067) (not e!697218))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1228451 (= res!817067 (validKeyInArray!0 (select (arr!38268 a!3806) from!3184)))))

(declare-fun b!1228452 () Bool)

(declare-fun res!817065 () Bool)

(assert (=> b!1228452 (=> (not res!817065) (not e!697218))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79291 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1228452 (= res!817065 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1228454 () Bool)

(declare-fun res!817062 () Bool)

(assert (=> b!1228454 (=> (not res!817062) (not e!697218))))

(assert (=> b!1228454 (= res!817062 (validKeyInArray!0 k0!2913))))

(declare-fun b!1228455 () Bool)

(assert (=> b!1228455 (= e!697218 (not e!697220))))

(declare-fun res!817061 () Bool)

(assert (=> b!1228455 (=> res!817061 e!697220)))

(assert (=> b!1228455 (= res!817061 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1228455 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27038)))

(declare-datatypes ((Unit!40702 0))(
  ( (Unit!40703) )
))
(declare-fun lt!558999 () Unit!40702)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79291 List!27041 List!27041 (_ BitVec 32)) Unit!40702)

(assert (=> b!1228455 (= lt!558999 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27038 from!3184))))

(assert (=> b!1228455 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27037 (select (arr!38268 a!3806) from!3184) acc!823))))

(declare-fun b!1228456 () Bool)

(declare-fun res!817066 () Bool)

(assert (=> b!1228456 (=> (not res!817066) (not e!697218))))

(assert (=> b!1228456 (= res!817066 (not (contains!7103 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!817068 () Bool)

(assert (=> start!102018 (=> (not res!817068) (not e!697218))))

(assert (=> start!102018 (= res!817068 (bvslt (size!38804 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102018 e!697218))

(declare-fun array_inv!29116 (array!79291) Bool)

(assert (=> start!102018 (array_inv!29116 a!3806)))

(assert (=> start!102018 true))

(declare-fun b!1228453 () Bool)

(declare-fun res!817064 () Bool)

(assert (=> b!1228453 (=> (not res!817064) (not e!697218))))

(assert (=> b!1228453 (= res!817064 (noDuplicate!1700 acc!823))))

(assert (= (and start!102018 res!817068) b!1228454))

(assert (= (and b!1228454 res!817062) b!1228450))

(assert (= (and b!1228450 res!817060) b!1228453))

(assert (= (and b!1228453 res!817064) b!1228449))

(assert (= (and b!1228449 res!817059) b!1228456))

(assert (= (and b!1228456 res!817066) b!1228452))

(assert (= (and b!1228452 res!817065) b!1228448))

(assert (= (and b!1228448 res!817063) b!1228451))

(assert (= (and b!1228451 res!817067) b!1228455))

(assert (= (and b!1228455 (not res!817061)) b!1228447))

(declare-fun m!1132985 () Bool)

(assert (=> b!1228453 m!1132985))

(declare-fun m!1132987 () Bool)

(assert (=> b!1228454 m!1132987))

(declare-fun m!1132989 () Bool)

(assert (=> b!1228455 m!1132989))

(declare-fun m!1132991 () Bool)

(assert (=> b!1228455 m!1132991))

(declare-fun m!1132993 () Bool)

(assert (=> b!1228455 m!1132993))

(declare-fun m!1132995 () Bool)

(assert (=> b!1228455 m!1132995))

(declare-fun m!1132997 () Bool)

(assert (=> start!102018 m!1132997))

(declare-fun m!1132999 () Bool)

(assert (=> b!1228452 m!1132999))

(declare-fun m!1133001 () Bool)

(assert (=> b!1228456 m!1133001))

(assert (=> b!1228451 m!1132993))

(assert (=> b!1228451 m!1132993))

(declare-fun m!1133003 () Bool)

(assert (=> b!1228451 m!1133003))

(declare-fun m!1133005 () Bool)

(assert (=> b!1228449 m!1133005))

(assert (=> b!1228447 m!1132993))

(declare-fun m!1133007 () Bool)

(assert (=> b!1228447 m!1133007))

(declare-fun m!1133009 () Bool)

(assert (=> b!1228448 m!1133009))

(check-sat (not start!102018) (not b!1228452) (not b!1228447) (not b!1228455) (not b!1228453) (not b!1228448) (not b!1228449) (not b!1228456) (not b!1228451) (not b!1228454))
(check-sat)
(get-model)

(declare-fun d!134203 () Bool)

(assert (=> d!134203 (= (validKeyInArray!0 k0!2913) (and (not (= k0!2913 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2913 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1228454 d!134203))

(declare-fun d!134205 () Bool)

(assert (=> d!134205 (= (array_inv!29116 a!3806) (bvsge (size!38804 a!3806) #b00000000000000000000000000000000))))

(assert (=> start!102018 d!134205))

(declare-fun b!1228497 () Bool)

(declare-fun e!697238 () Bool)

(declare-fun e!697239 () Bool)

(assert (=> b!1228497 (= e!697238 e!697239)))

(declare-fun res!817106 () Bool)

(assert (=> b!1228497 (=> (not res!817106) (not e!697239))))

(declare-fun e!697241 () Bool)

(assert (=> b!1228497 (= res!817106 (not e!697241))))

(declare-fun res!817107 () Bool)

(assert (=> b!1228497 (=> (not res!817107) (not e!697241))))

(assert (=> b!1228497 (= res!817107 (validKeyInArray!0 (select (arr!38268 a!3806) from!3184)))))

(declare-fun b!1228498 () Bool)

(declare-fun e!697240 () Bool)

(declare-fun call!60811 () Bool)

(assert (=> b!1228498 (= e!697240 call!60811)))

(declare-fun b!1228499 () Bool)

(assert (=> b!1228499 (= e!697240 call!60811)))

(declare-fun c!120556 () Bool)

(declare-fun bm!60808 () Bool)

(assert (=> bm!60808 (= call!60811 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120556 (Cons!27037 (select (arr!38268 a!3806) from!3184) acc!823) acc!823)))))

(declare-fun d!134207 () Bool)

(declare-fun res!817105 () Bool)

(assert (=> d!134207 (=> res!817105 e!697238)))

(assert (=> d!134207 (= res!817105 (bvsge from!3184 (size!38804 a!3806)))))

(assert (=> d!134207 (= (arrayNoDuplicates!0 a!3806 from!3184 acc!823) e!697238)))

(declare-fun b!1228500 () Bool)

(assert (=> b!1228500 (= e!697239 e!697240)))

(assert (=> b!1228500 (= c!120556 (validKeyInArray!0 (select (arr!38268 a!3806) from!3184)))))

(declare-fun b!1228501 () Bool)

(assert (=> b!1228501 (= e!697241 (contains!7103 acc!823 (select (arr!38268 a!3806) from!3184)))))

(assert (= (and d!134207 (not res!817105)) b!1228497))

(assert (= (and b!1228497 res!817107) b!1228501))

(assert (= (and b!1228497 res!817106) b!1228500))

(assert (= (and b!1228500 c!120556) b!1228499))

(assert (= (and b!1228500 (not c!120556)) b!1228498))

(assert (= (or b!1228499 b!1228498) bm!60808))

(assert (=> b!1228497 m!1132993))

(assert (=> b!1228497 m!1132993))

(assert (=> b!1228497 m!1133003))

(assert (=> bm!60808 m!1132993))

(declare-fun m!1133037 () Bool)

(assert (=> bm!60808 m!1133037))

(assert (=> b!1228500 m!1132993))

(assert (=> b!1228500 m!1132993))

(assert (=> b!1228500 m!1133003))

(assert (=> b!1228501 m!1132993))

(assert (=> b!1228501 m!1132993))

(declare-fun m!1133039 () Bool)

(assert (=> b!1228501 m!1133039))

(assert (=> b!1228448 d!134207))

(declare-fun d!134213 () Bool)

(declare-fun res!817118 () Bool)

(declare-fun e!697252 () Bool)

(assert (=> d!134213 (=> res!817118 e!697252)))

(get-info :version)

(assert (=> d!134213 (= res!817118 ((_ is Nil!27038) acc!823))))

(assert (=> d!134213 (= (noDuplicate!1700 acc!823) e!697252)))

(declare-fun b!1228512 () Bool)

(declare-fun e!697253 () Bool)

(assert (=> b!1228512 (= e!697252 e!697253)))

(declare-fun res!817119 () Bool)

(assert (=> b!1228512 (=> (not res!817119) (not e!697253))))

(assert (=> b!1228512 (= res!817119 (not (contains!7103 (t!40504 acc!823) (h!28246 acc!823))))))

(declare-fun b!1228513 () Bool)

(assert (=> b!1228513 (= e!697253 (noDuplicate!1700 (t!40504 acc!823)))))

(assert (= (and d!134213 (not res!817118)) b!1228512))

(assert (= (and b!1228512 res!817119) b!1228513))

(declare-fun m!1133045 () Bool)

(assert (=> b!1228512 m!1133045))

(declare-fun m!1133047 () Bool)

(assert (=> b!1228513 m!1133047))

(assert (=> b!1228453 d!134213))

(declare-fun d!134219 () Bool)

(declare-fun res!817120 () Bool)

(declare-fun e!697254 () Bool)

(assert (=> d!134219 (=> res!817120 e!697254)))

(assert (=> d!134219 (= res!817120 ((_ is Nil!27038) (Cons!27037 (select (arr!38268 a!3806) from!3184) Nil!27038)))))

(assert (=> d!134219 (= (noDuplicate!1700 (Cons!27037 (select (arr!38268 a!3806) from!3184) Nil!27038)) e!697254)))

(declare-fun b!1228514 () Bool)

(declare-fun e!697255 () Bool)

(assert (=> b!1228514 (= e!697254 e!697255)))

(declare-fun res!817121 () Bool)

(assert (=> b!1228514 (=> (not res!817121) (not e!697255))))

(assert (=> b!1228514 (= res!817121 (not (contains!7103 (t!40504 (Cons!27037 (select (arr!38268 a!3806) from!3184) Nil!27038)) (h!28246 (Cons!27037 (select (arr!38268 a!3806) from!3184) Nil!27038)))))))

(declare-fun b!1228515 () Bool)

(assert (=> b!1228515 (= e!697255 (noDuplicate!1700 (t!40504 (Cons!27037 (select (arr!38268 a!3806) from!3184) Nil!27038))))))

(assert (= (and d!134219 (not res!817120)) b!1228514))

(assert (= (and b!1228514 res!817121) b!1228515))

(declare-fun m!1133049 () Bool)

(assert (=> b!1228514 m!1133049))

(declare-fun m!1133051 () Bool)

(assert (=> b!1228515 m!1133051))

(assert (=> b!1228447 d!134219))

(declare-fun d!134221 () Bool)

(declare-fun res!817138 () Bool)

(declare-fun e!697272 () Bool)

(assert (=> d!134221 (=> res!817138 e!697272)))

(assert (=> d!134221 (= res!817138 (= (select (arr!38268 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) k0!2913))))

(assert (=> d!134221 (= (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)) e!697272)))

(declare-fun b!1228535 () Bool)

(declare-fun e!697273 () Bool)

(assert (=> b!1228535 (= e!697272 e!697273)))

(declare-fun res!817139 () Bool)

(assert (=> b!1228535 (=> (not res!817139) (not e!697273))))

(assert (=> b!1228535 (= res!817139 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38804 a!3806)))))

(declare-fun b!1228536 () Bool)

(assert (=> b!1228536 (= e!697273 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)))))

(assert (= (and d!134221 (not res!817138)) b!1228535))

(assert (= (and b!1228535 res!817139) b!1228536))

(declare-fun m!1133057 () Bool)

(assert (=> d!134221 m!1133057))

(declare-fun m!1133059 () Bool)

(assert (=> b!1228536 m!1133059))

(assert (=> b!1228452 d!134221))

(declare-fun d!134225 () Bool)

(assert (=> d!134225 (= (validKeyInArray!0 (select (arr!38268 a!3806) from!3184)) (and (not (= (select (arr!38268 a!3806) from!3184) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38268 a!3806) from!3184) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1228451 d!134225))

(declare-fun d!134227 () Bool)

(declare-fun lt!559007 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!553 (List!27041) (InoxSet (_ BitVec 64)))

(assert (=> d!134227 (= lt!559007 (select (content!553 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!697289 () Bool)

(assert (=> d!134227 (= lt!559007 e!697289)))

(declare-fun res!817152 () Bool)

(assert (=> d!134227 (=> (not res!817152) (not e!697289))))

(assert (=> d!134227 (= res!817152 ((_ is Cons!27037) acc!823))))

(assert (=> d!134227 (= (contains!7103 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559007)))

(declare-fun b!1228551 () Bool)

(declare-fun e!697288 () Bool)

(assert (=> b!1228551 (= e!697289 e!697288)))

(declare-fun res!817151 () Bool)

(assert (=> b!1228551 (=> res!817151 e!697288)))

(assert (=> b!1228551 (= res!817151 (= (h!28246 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228552 () Bool)

(assert (=> b!1228552 (= e!697288 (contains!7103 (t!40504 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134227 res!817152) b!1228551))

(assert (= (and b!1228551 (not res!817151)) b!1228552))

(declare-fun m!1133065 () Bool)

(assert (=> d!134227 m!1133065))

(declare-fun m!1133067 () Bool)

(assert (=> d!134227 m!1133067))

(declare-fun m!1133069 () Bool)

(assert (=> b!1228552 m!1133069))

(assert (=> b!1228456 d!134227))

(declare-fun b!1228555 () Bool)

(declare-fun e!697292 () Bool)

(declare-fun e!697293 () Bool)

(assert (=> b!1228555 (= e!697292 e!697293)))

(declare-fun res!817156 () Bool)

(assert (=> b!1228555 (=> (not res!817156) (not e!697293))))

(declare-fun e!697295 () Bool)

(assert (=> b!1228555 (= res!817156 (not e!697295))))

(declare-fun res!817157 () Bool)

(assert (=> b!1228555 (=> (not res!817157) (not e!697295))))

(assert (=> b!1228555 (= res!817157 (validKeyInArray!0 (select (arr!38268 a!3806) from!3184)))))

(declare-fun b!1228556 () Bool)

(declare-fun e!697294 () Bool)

(declare-fun call!60815 () Bool)

(assert (=> b!1228556 (= e!697294 call!60815)))

(declare-fun b!1228557 () Bool)

(assert (=> b!1228557 (= e!697294 call!60815)))

(declare-fun bm!60812 () Bool)

(declare-fun c!120560 () Bool)

(assert (=> bm!60812 (= call!60815 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120560 (Cons!27037 (select (arr!38268 a!3806) from!3184) Nil!27038) Nil!27038)))))

(declare-fun d!134235 () Bool)

(declare-fun res!817155 () Bool)

(assert (=> d!134235 (=> res!817155 e!697292)))

(assert (=> d!134235 (= res!817155 (bvsge from!3184 (size!38804 a!3806)))))

(assert (=> d!134235 (= (arrayNoDuplicates!0 a!3806 from!3184 Nil!27038) e!697292)))

(declare-fun b!1228558 () Bool)

(assert (=> b!1228558 (= e!697293 e!697294)))

(assert (=> b!1228558 (= c!120560 (validKeyInArray!0 (select (arr!38268 a!3806) from!3184)))))

(declare-fun b!1228559 () Bool)

(assert (=> b!1228559 (= e!697295 (contains!7103 Nil!27038 (select (arr!38268 a!3806) from!3184)))))

(assert (= (and d!134235 (not res!817155)) b!1228555))

(assert (= (and b!1228555 res!817157) b!1228559))

(assert (= (and b!1228555 res!817156) b!1228558))

(assert (= (and b!1228558 c!120560) b!1228557))

(assert (= (and b!1228558 (not c!120560)) b!1228556))

(assert (= (or b!1228557 b!1228556) bm!60812))

(assert (=> b!1228555 m!1132993))

(assert (=> b!1228555 m!1132993))

(assert (=> b!1228555 m!1133003))

(assert (=> bm!60812 m!1132993))

(declare-fun m!1133077 () Bool)

(assert (=> bm!60812 m!1133077))

(assert (=> b!1228558 m!1132993))

(assert (=> b!1228558 m!1132993))

(assert (=> b!1228558 m!1133003))

(assert (=> b!1228559 m!1132993))

(assert (=> b!1228559 m!1132993))

(declare-fun m!1133079 () Bool)

(assert (=> b!1228559 m!1133079))

(assert (=> b!1228455 d!134235))

(declare-fun d!134241 () Bool)

(assert (=> d!134241 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27038)))

(declare-fun lt!559012 () Unit!40702)

(declare-fun choose!80 (array!79291 List!27041 List!27041 (_ BitVec 32)) Unit!40702)

(assert (=> d!134241 (= lt!559012 (choose!80 a!3806 acc!823 Nil!27038 from!3184))))

(assert (=> d!134241 (bvslt (size!38804 a!3806) #b01111111111111111111111111111111)))

(assert (=> d!134241 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27038 from!3184) lt!559012)))

(declare-fun bs!34533 () Bool)

(assert (= bs!34533 d!134241))

(assert (=> bs!34533 m!1132989))

(declare-fun m!1133097 () Bool)

(assert (=> bs!34533 m!1133097))

(assert (=> b!1228455 d!134241))

(declare-fun b!1228576 () Bool)

(declare-fun e!697312 () Bool)

(declare-fun e!697313 () Bool)

(assert (=> b!1228576 (= e!697312 e!697313)))

(declare-fun res!817175 () Bool)

(assert (=> b!1228576 (=> (not res!817175) (not e!697313))))

(declare-fun e!697315 () Bool)

(assert (=> b!1228576 (= res!817175 (not e!697315))))

(declare-fun res!817176 () Bool)

(assert (=> b!1228576 (=> (not res!817176) (not e!697315))))

(assert (=> b!1228576 (= res!817176 (validKeyInArray!0 (select (arr!38268 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1228577 () Bool)

(declare-fun e!697314 () Bool)

(declare-fun call!60816 () Bool)

(assert (=> b!1228577 (= e!697314 call!60816)))

(declare-fun b!1228578 () Bool)

(assert (=> b!1228578 (= e!697314 call!60816)))

(declare-fun c!120561 () Bool)

(declare-fun bm!60813 () Bool)

(assert (=> bm!60813 (= call!60816 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120561 (Cons!27037 (select (arr!38268 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27037 (select (arr!38268 a!3806) from!3184) acc!823)) (Cons!27037 (select (arr!38268 a!3806) from!3184) acc!823))))))

(declare-fun d!134251 () Bool)

(declare-fun res!817174 () Bool)

(assert (=> d!134251 (=> res!817174 e!697312)))

(assert (=> d!134251 (= res!817174 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38804 a!3806)))))

(assert (=> d!134251 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27037 (select (arr!38268 a!3806) from!3184) acc!823)) e!697312)))

(declare-fun b!1228579 () Bool)

(assert (=> b!1228579 (= e!697313 e!697314)))

(assert (=> b!1228579 (= c!120561 (validKeyInArray!0 (select (arr!38268 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1228580 () Bool)

(assert (=> b!1228580 (= e!697315 (contains!7103 (Cons!27037 (select (arr!38268 a!3806) from!3184) acc!823) (select (arr!38268 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(assert (= (and d!134251 (not res!817174)) b!1228576))

(assert (= (and b!1228576 res!817176) b!1228580))

(assert (= (and b!1228576 res!817175) b!1228579))

(assert (= (and b!1228579 c!120561) b!1228578))

(assert (= (and b!1228579 (not c!120561)) b!1228577))

(assert (= (or b!1228578 b!1228577) bm!60813))

(assert (=> b!1228576 m!1133057))

(assert (=> b!1228576 m!1133057))

(declare-fun m!1133099 () Bool)

(assert (=> b!1228576 m!1133099))

(assert (=> bm!60813 m!1133057))

(declare-fun m!1133101 () Bool)

(assert (=> bm!60813 m!1133101))

(assert (=> b!1228579 m!1133057))

(assert (=> b!1228579 m!1133057))

(assert (=> b!1228579 m!1133099))

(assert (=> b!1228580 m!1133057))

(assert (=> b!1228580 m!1133057))

(declare-fun m!1133103 () Bool)

(assert (=> b!1228580 m!1133103))

(assert (=> b!1228455 d!134251))

(declare-fun d!134255 () Bool)

(declare-fun lt!559015 () Bool)

(assert (=> d!134255 (= lt!559015 (select (content!553 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!697319 () Bool)

(assert (=> d!134255 (= lt!559015 e!697319)))

(declare-fun res!817180 () Bool)

(assert (=> d!134255 (=> (not res!817180) (not e!697319))))

(assert (=> d!134255 (= res!817180 ((_ is Cons!27037) acc!823))))

(assert (=> d!134255 (= (contains!7103 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000) lt!559015)))

(declare-fun b!1228583 () Bool)

(declare-fun e!697318 () Bool)

(assert (=> b!1228583 (= e!697319 e!697318)))

(declare-fun res!817179 () Bool)

(assert (=> b!1228583 (=> res!817179 e!697318)))

(assert (=> b!1228583 (= res!817179 (= (h!28246 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228584 () Bool)

(assert (=> b!1228584 (= e!697318 (contains!7103 (t!40504 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134255 res!817180) b!1228583))

(assert (= (and b!1228583 (not res!817179)) b!1228584))

(assert (=> d!134255 m!1133065))

(declare-fun m!1133105 () Bool)

(assert (=> d!134255 m!1133105))

(declare-fun m!1133107 () Bool)

(assert (=> b!1228584 m!1133107))

(assert (=> b!1228449 d!134255))

(check-sat (not b!1228513) (not bm!60808) (not bm!60813) (not b!1228552) (not b!1228514) (not d!134255) (not b!1228559) (not b!1228576) (not b!1228500) (not b!1228497) (not b!1228501) (not b!1228515) (not b!1228536) (not b!1228512) (not b!1228558) (not b!1228579) (not b!1228555) (not bm!60812) (not b!1228580) (not d!134241) (not b!1228584) (not d!134227))
(check-sat)
(get-model)

(declare-fun lt!559024 () Bool)

(declare-fun d!134275 () Bool)

(assert (=> d!134275 (= lt!559024 (select (content!553 acc!823) (select (arr!38268 a!3806) from!3184)))))

(declare-fun e!697357 () Bool)

(assert (=> d!134275 (= lt!559024 e!697357)))

(declare-fun res!817211 () Bool)

(assert (=> d!134275 (=> (not res!817211) (not e!697357))))

(assert (=> d!134275 (= res!817211 ((_ is Cons!27037) acc!823))))

(assert (=> d!134275 (= (contains!7103 acc!823 (select (arr!38268 a!3806) from!3184)) lt!559024)))

(declare-fun b!1228628 () Bool)

(declare-fun e!697356 () Bool)

(assert (=> b!1228628 (= e!697357 e!697356)))

(declare-fun res!817210 () Bool)

(assert (=> b!1228628 (=> res!817210 e!697356)))

(assert (=> b!1228628 (= res!817210 (= (h!28246 acc!823) (select (arr!38268 a!3806) from!3184)))))

(declare-fun b!1228629 () Bool)

(assert (=> b!1228629 (= e!697356 (contains!7103 (t!40504 acc!823) (select (arr!38268 a!3806) from!3184)))))

(assert (= (and d!134275 res!817211) b!1228628))

(assert (= (and b!1228628 (not res!817210)) b!1228629))

(assert (=> d!134275 m!1133065))

(assert (=> d!134275 m!1132993))

(declare-fun m!1133151 () Bool)

(assert (=> d!134275 m!1133151))

(assert (=> b!1228629 m!1132993))

(declare-fun m!1133153 () Bool)

(assert (=> b!1228629 m!1133153))

(assert (=> b!1228501 d!134275))

(assert (=> b!1228500 d!134225))

(assert (=> b!1228555 d!134225))

(declare-fun lt!559025 () Bool)

(declare-fun d!134277 () Bool)

(assert (=> d!134277 (= lt!559025 (select (content!553 (Cons!27037 (select (arr!38268 a!3806) from!3184) acc!823)) (select (arr!38268 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun e!697359 () Bool)

(assert (=> d!134277 (= lt!559025 e!697359)))

(declare-fun res!817213 () Bool)

(assert (=> d!134277 (=> (not res!817213) (not e!697359))))

(assert (=> d!134277 (= res!817213 ((_ is Cons!27037) (Cons!27037 (select (arr!38268 a!3806) from!3184) acc!823)))))

(assert (=> d!134277 (= (contains!7103 (Cons!27037 (select (arr!38268 a!3806) from!3184) acc!823) (select (arr!38268 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))) lt!559025)))

(declare-fun b!1228630 () Bool)

(declare-fun e!697358 () Bool)

(assert (=> b!1228630 (= e!697359 e!697358)))

(declare-fun res!817212 () Bool)

(assert (=> b!1228630 (=> res!817212 e!697358)))

(assert (=> b!1228630 (= res!817212 (= (h!28246 (Cons!27037 (select (arr!38268 a!3806) from!3184) acc!823)) (select (arr!38268 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1228631 () Bool)

(assert (=> b!1228631 (= e!697358 (contains!7103 (t!40504 (Cons!27037 (select (arr!38268 a!3806) from!3184) acc!823)) (select (arr!38268 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(assert (= (and d!134277 res!817213) b!1228630))

(assert (= (and b!1228630 (not res!817212)) b!1228631))

(declare-fun m!1133155 () Bool)

(assert (=> d!134277 m!1133155))

(assert (=> d!134277 m!1133057))

(declare-fun m!1133157 () Bool)

(assert (=> d!134277 m!1133157))

(assert (=> b!1228631 m!1133057))

(declare-fun m!1133159 () Bool)

(assert (=> b!1228631 m!1133159))

(assert (=> b!1228580 d!134277))

(declare-fun d!134279 () Bool)

(declare-fun lt!559026 () Bool)

(assert (=> d!134279 (= lt!559026 (select (content!553 Nil!27038) (select (arr!38268 a!3806) from!3184)))))

(declare-fun e!697361 () Bool)

(assert (=> d!134279 (= lt!559026 e!697361)))

(declare-fun res!817215 () Bool)

(assert (=> d!134279 (=> (not res!817215) (not e!697361))))

(assert (=> d!134279 (= res!817215 ((_ is Cons!27037) Nil!27038))))

(assert (=> d!134279 (= (contains!7103 Nil!27038 (select (arr!38268 a!3806) from!3184)) lt!559026)))

(declare-fun b!1228632 () Bool)

(declare-fun e!697360 () Bool)

(assert (=> b!1228632 (= e!697361 e!697360)))

(declare-fun res!817214 () Bool)

(assert (=> b!1228632 (=> res!817214 e!697360)))

(assert (=> b!1228632 (= res!817214 (= (h!28246 Nil!27038) (select (arr!38268 a!3806) from!3184)))))

(declare-fun b!1228633 () Bool)

(assert (=> b!1228633 (= e!697360 (contains!7103 (t!40504 Nil!27038) (select (arr!38268 a!3806) from!3184)))))

(assert (= (and d!134279 res!817215) b!1228632))

(assert (= (and b!1228632 (not res!817214)) b!1228633))

(declare-fun m!1133161 () Bool)

(assert (=> d!134279 m!1133161))

(assert (=> d!134279 m!1132993))

(declare-fun m!1133163 () Bool)

(assert (=> d!134279 m!1133163))

(assert (=> b!1228633 m!1132993))

(declare-fun m!1133165 () Bool)

(assert (=> b!1228633 m!1133165))

(assert (=> b!1228559 d!134279))

(assert (=> b!1228558 d!134225))

(declare-fun b!1228634 () Bool)

(declare-fun e!697362 () Bool)

(declare-fun e!697363 () Bool)

(assert (=> b!1228634 (= e!697362 e!697363)))

(declare-fun res!817217 () Bool)

(assert (=> b!1228634 (=> (not res!817217) (not e!697363))))

(declare-fun e!697365 () Bool)

(assert (=> b!1228634 (= res!817217 (not e!697365))))

(declare-fun res!817218 () Bool)

(assert (=> b!1228634 (=> (not res!817218) (not e!697365))))

(assert (=> b!1228634 (= res!817218 (validKeyInArray!0 (select (arr!38268 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1228635 () Bool)

(declare-fun e!697364 () Bool)

(declare-fun call!60824 () Bool)

(assert (=> b!1228635 (= e!697364 call!60824)))

(declare-fun b!1228636 () Bool)

(assert (=> b!1228636 (= e!697364 call!60824)))

(declare-fun c!120569 () Bool)

(declare-fun bm!60821 () Bool)

(assert (=> bm!60821 (= call!60824 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!120569 (Cons!27037 (select (arr!38268 a!3806) (bvadd from!3184 #b00000000000000000000000000000001)) (ite c!120560 (Cons!27037 (select (arr!38268 a!3806) from!3184) Nil!27038) Nil!27038)) (ite c!120560 (Cons!27037 (select (arr!38268 a!3806) from!3184) Nil!27038) Nil!27038))))))

(declare-fun d!134281 () Bool)

(declare-fun res!817216 () Bool)

(assert (=> d!134281 (=> res!817216 e!697362)))

(assert (=> d!134281 (= res!817216 (bvsge (bvadd from!3184 #b00000000000000000000000000000001) (size!38804 a!3806)))))

(assert (=> d!134281 (= (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120560 (Cons!27037 (select (arr!38268 a!3806) from!3184) Nil!27038) Nil!27038)) e!697362)))

(declare-fun b!1228637 () Bool)

(assert (=> b!1228637 (= e!697363 e!697364)))

(assert (=> b!1228637 (= c!120569 (validKeyInArray!0 (select (arr!38268 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1228638 () Bool)

(assert (=> b!1228638 (= e!697365 (contains!7103 (ite c!120560 (Cons!27037 (select (arr!38268 a!3806) from!3184) Nil!27038) Nil!27038) (select (arr!38268 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(assert (= (and d!134281 (not res!817216)) b!1228634))

(assert (= (and b!1228634 res!817218) b!1228638))

(assert (= (and b!1228634 res!817217) b!1228637))

(assert (= (and b!1228637 c!120569) b!1228636))

(assert (= (and b!1228637 (not c!120569)) b!1228635))

(assert (= (or b!1228636 b!1228635) bm!60821))

(declare-fun m!1133167 () Bool)

(assert (=> b!1228634 m!1133167))

(assert (=> b!1228634 m!1133167))

(declare-fun m!1133169 () Bool)

(assert (=> b!1228634 m!1133169))

(assert (=> bm!60821 m!1133167))

(declare-fun m!1133171 () Bool)

(assert (=> bm!60821 m!1133171))

(assert (=> b!1228637 m!1133167))

(assert (=> b!1228637 m!1133167))

(assert (=> b!1228637 m!1133169))

(assert (=> b!1228638 m!1133167))

(assert (=> b!1228638 m!1133167))

(declare-fun m!1133173 () Bool)

(assert (=> b!1228638 m!1133173))

(assert (=> bm!60812 d!134281))

(declare-fun d!134283 () Bool)

(declare-fun lt!559027 () Bool)

(assert (=> d!134283 (= lt!559027 (select (content!553 (t!40504 acc!823)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!697367 () Bool)

(assert (=> d!134283 (= lt!559027 e!697367)))

(declare-fun res!817220 () Bool)

(assert (=> d!134283 (=> (not res!817220) (not e!697367))))

(assert (=> d!134283 (= res!817220 ((_ is Cons!27037) (t!40504 acc!823)))))

(assert (=> d!134283 (= (contains!7103 (t!40504 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000) lt!559027)))

(declare-fun b!1228639 () Bool)

(declare-fun e!697366 () Bool)

(assert (=> b!1228639 (= e!697367 e!697366)))

(declare-fun res!817219 () Bool)

(assert (=> b!1228639 (=> res!817219 e!697366)))

(assert (=> b!1228639 (= res!817219 (= (h!28246 (t!40504 acc!823)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228640 () Bool)

(assert (=> b!1228640 (= e!697366 (contains!7103 (t!40504 (t!40504 acc!823)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134283 res!817220) b!1228639))

(assert (= (and b!1228639 (not res!817219)) b!1228640))

(declare-fun m!1133175 () Bool)

(assert (=> d!134283 m!1133175))

(declare-fun m!1133177 () Bool)

(assert (=> d!134283 m!1133177))

(declare-fun m!1133179 () Bool)

(assert (=> b!1228640 m!1133179))

(assert (=> b!1228584 d!134283))

(assert (=> b!1228497 d!134225))

(declare-fun d!134285 () Bool)

(declare-fun lt!559028 () Bool)

(assert (=> d!134285 (= lt!559028 (select (content!553 (t!40504 acc!823)) (h!28246 acc!823)))))

(declare-fun e!697369 () Bool)

(assert (=> d!134285 (= lt!559028 e!697369)))

(declare-fun res!817222 () Bool)

(assert (=> d!134285 (=> (not res!817222) (not e!697369))))

(assert (=> d!134285 (= res!817222 ((_ is Cons!27037) (t!40504 acc!823)))))

(assert (=> d!134285 (= (contains!7103 (t!40504 acc!823) (h!28246 acc!823)) lt!559028)))

(declare-fun b!1228641 () Bool)

(declare-fun e!697368 () Bool)

(assert (=> b!1228641 (= e!697369 e!697368)))

(declare-fun res!817221 () Bool)

(assert (=> b!1228641 (=> res!817221 e!697368)))

(assert (=> b!1228641 (= res!817221 (= (h!28246 (t!40504 acc!823)) (h!28246 acc!823)))))

(declare-fun b!1228642 () Bool)

(assert (=> b!1228642 (= e!697368 (contains!7103 (t!40504 (t!40504 acc!823)) (h!28246 acc!823)))))

(assert (= (and d!134285 res!817222) b!1228641))

(assert (= (and b!1228641 (not res!817221)) b!1228642))

(assert (=> d!134285 m!1133175))

(declare-fun m!1133181 () Bool)

(assert (=> d!134285 m!1133181))

(declare-fun m!1133183 () Bool)

(assert (=> b!1228642 m!1133183))

(assert (=> b!1228512 d!134285))

(declare-fun d!134287 () Bool)

(declare-fun c!120572 () Bool)

(assert (=> d!134287 (= c!120572 ((_ is Nil!27038) acc!823))))

(declare-fun e!697372 () (InoxSet (_ BitVec 64)))

(assert (=> d!134287 (= (content!553 acc!823) e!697372)))

(declare-fun b!1228647 () Bool)

(assert (=> b!1228647 (= e!697372 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!1228648 () Bool)

(assert (=> b!1228648 (= e!697372 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!28246 acc!823) true) (content!553 (t!40504 acc!823))))))

(assert (= (and d!134287 c!120572) b!1228647))

(assert (= (and d!134287 (not c!120572)) b!1228648))

(declare-fun m!1133185 () Bool)

(assert (=> b!1228648 m!1133185))

(assert (=> b!1228648 m!1133175))

(assert (=> d!134227 d!134287))

(assert (=> d!134241 d!134235))

(declare-fun d!134289 () Bool)

(assert (=> d!134289 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27038)))

(assert (=> d!134289 true))

(declare-fun _$70!74 () Unit!40702)

(assert (=> d!134289 (= (choose!80 a!3806 acc!823 Nil!27038 from!3184) _$70!74)))

(declare-fun bs!34536 () Bool)

(assert (= bs!34536 d!134289))

(assert (=> bs!34536 m!1132989))

(assert (=> d!134241 d!134289))

(declare-fun d!134291 () Bool)

(assert (=> d!134291 (= (validKeyInArray!0 (select (arr!38268 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))) (and (not (= (select (arr!38268 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38268 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1228576 d!134291))

(assert (=> d!134255 d!134287))

(declare-fun b!1228649 () Bool)

(declare-fun e!697373 () Bool)

(declare-fun e!697374 () Bool)

(assert (=> b!1228649 (= e!697373 e!697374)))

(declare-fun res!817224 () Bool)

(assert (=> b!1228649 (=> (not res!817224) (not e!697374))))

(declare-fun e!697376 () Bool)

(assert (=> b!1228649 (= res!817224 (not e!697376))))

(declare-fun res!817225 () Bool)

(assert (=> b!1228649 (=> (not res!817225) (not e!697376))))

(assert (=> b!1228649 (= res!817225 (validKeyInArray!0 (select (arr!38268 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1228650 () Bool)

(declare-fun e!697375 () Bool)

(declare-fun call!60825 () Bool)

(assert (=> b!1228650 (= e!697375 call!60825)))

(declare-fun b!1228651 () Bool)

(assert (=> b!1228651 (= e!697375 call!60825)))

(declare-fun bm!60822 () Bool)

(declare-fun c!120573 () Bool)

(assert (=> bm!60822 (= call!60825 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!120573 (Cons!27037 (select (arr!38268 a!3806) (bvadd from!3184 #b00000000000000000000000000000001)) (ite c!120556 (Cons!27037 (select (arr!38268 a!3806) from!3184) acc!823) acc!823)) (ite c!120556 (Cons!27037 (select (arr!38268 a!3806) from!3184) acc!823) acc!823))))))

(declare-fun d!134293 () Bool)

(declare-fun res!817223 () Bool)

(assert (=> d!134293 (=> res!817223 e!697373)))

(assert (=> d!134293 (= res!817223 (bvsge (bvadd from!3184 #b00000000000000000000000000000001) (size!38804 a!3806)))))

(assert (=> d!134293 (= (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120556 (Cons!27037 (select (arr!38268 a!3806) from!3184) acc!823) acc!823)) e!697373)))

(declare-fun b!1228652 () Bool)

(assert (=> b!1228652 (= e!697374 e!697375)))

(assert (=> b!1228652 (= c!120573 (validKeyInArray!0 (select (arr!38268 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1228653 () Bool)

(assert (=> b!1228653 (= e!697376 (contains!7103 (ite c!120556 (Cons!27037 (select (arr!38268 a!3806) from!3184) acc!823) acc!823) (select (arr!38268 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(assert (= (and d!134293 (not res!817223)) b!1228649))

(assert (= (and b!1228649 res!817225) b!1228653))

(assert (= (and b!1228649 res!817224) b!1228652))

(assert (= (and b!1228652 c!120573) b!1228651))

(assert (= (and b!1228652 (not c!120573)) b!1228650))

(assert (= (or b!1228651 b!1228650) bm!60822))

(assert (=> b!1228649 m!1133167))

(assert (=> b!1228649 m!1133167))

(assert (=> b!1228649 m!1133169))

(assert (=> bm!60822 m!1133167))

(declare-fun m!1133187 () Bool)

(assert (=> bm!60822 m!1133187))

(assert (=> b!1228652 m!1133167))

(assert (=> b!1228652 m!1133167))

(assert (=> b!1228652 m!1133169))

(assert (=> b!1228653 m!1133167))

(assert (=> b!1228653 m!1133167))

(declare-fun m!1133189 () Bool)

(assert (=> b!1228653 m!1133189))

(assert (=> bm!60808 d!134293))

(declare-fun d!134295 () Bool)

(declare-fun res!817226 () Bool)

(declare-fun e!697377 () Bool)

(assert (=> d!134295 (=> res!817226 e!697377)))

(assert (=> d!134295 (= res!817226 (= (select (arr!38268 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)) k0!2913))))

(assert (=> d!134295 (= (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)) e!697377)))

(declare-fun b!1228654 () Bool)

(declare-fun e!697378 () Bool)

(assert (=> b!1228654 (= e!697377 e!697378)))

(declare-fun res!817227 () Bool)

(assert (=> b!1228654 (=> (not res!817227) (not e!697378))))

(assert (=> b!1228654 (= res!817227 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!38804 a!3806)))))

(declare-fun b!1228655 () Bool)

(assert (=> b!1228655 (= e!697378 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!134295 (not res!817226)) b!1228654))

(assert (= (and b!1228654 res!817227) b!1228655))

(declare-fun m!1133191 () Bool)

(assert (=> d!134295 m!1133191))

(declare-fun m!1133193 () Bool)

(assert (=> b!1228655 m!1133193))

(assert (=> b!1228536 d!134295))

(assert (=> b!1228579 d!134291))

(declare-fun d!134297 () Bool)

(declare-fun res!817228 () Bool)

(declare-fun e!697379 () Bool)

(assert (=> d!134297 (=> res!817228 e!697379)))

(assert (=> d!134297 (= res!817228 ((_ is Nil!27038) (t!40504 (Cons!27037 (select (arr!38268 a!3806) from!3184) Nil!27038))))))

(assert (=> d!134297 (= (noDuplicate!1700 (t!40504 (Cons!27037 (select (arr!38268 a!3806) from!3184) Nil!27038))) e!697379)))

(declare-fun b!1228656 () Bool)

(declare-fun e!697380 () Bool)

(assert (=> b!1228656 (= e!697379 e!697380)))

(declare-fun res!817229 () Bool)

(assert (=> b!1228656 (=> (not res!817229) (not e!697380))))

(assert (=> b!1228656 (= res!817229 (not (contains!7103 (t!40504 (t!40504 (Cons!27037 (select (arr!38268 a!3806) from!3184) Nil!27038))) (h!28246 (t!40504 (Cons!27037 (select (arr!38268 a!3806) from!3184) Nil!27038))))))))

(declare-fun b!1228657 () Bool)

(assert (=> b!1228657 (= e!697380 (noDuplicate!1700 (t!40504 (t!40504 (Cons!27037 (select (arr!38268 a!3806) from!3184) Nil!27038)))))))

(assert (= (and d!134297 (not res!817228)) b!1228656))

(assert (= (and b!1228656 res!817229) b!1228657))

(declare-fun m!1133195 () Bool)

(assert (=> b!1228656 m!1133195))

(declare-fun m!1133197 () Bool)

(assert (=> b!1228657 m!1133197))

(assert (=> b!1228515 d!134297))

(declare-fun d!134299 () Bool)

(declare-fun lt!559029 () Bool)

(assert (=> d!134299 (= lt!559029 (select (content!553 (t!40504 acc!823)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!697382 () Bool)

(assert (=> d!134299 (= lt!559029 e!697382)))

(declare-fun res!817231 () Bool)

(assert (=> d!134299 (=> (not res!817231) (not e!697382))))

(assert (=> d!134299 (= res!817231 ((_ is Cons!27037) (t!40504 acc!823)))))

(assert (=> d!134299 (= (contains!7103 (t!40504 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000) lt!559029)))

(declare-fun b!1228658 () Bool)

(declare-fun e!697381 () Bool)

(assert (=> b!1228658 (= e!697382 e!697381)))

(declare-fun res!817230 () Bool)

(assert (=> b!1228658 (=> res!817230 e!697381)))

(assert (=> b!1228658 (= res!817230 (= (h!28246 (t!40504 acc!823)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228659 () Bool)

(assert (=> b!1228659 (= e!697381 (contains!7103 (t!40504 (t!40504 acc!823)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134299 res!817231) b!1228658))

(assert (= (and b!1228658 (not res!817230)) b!1228659))

(assert (=> d!134299 m!1133175))

(declare-fun m!1133199 () Bool)

(assert (=> d!134299 m!1133199))

(declare-fun m!1133201 () Bool)

(assert (=> b!1228659 m!1133201))

(assert (=> b!1228552 d!134299))

(declare-fun b!1228660 () Bool)

(declare-fun e!697383 () Bool)

(declare-fun e!697384 () Bool)

(assert (=> b!1228660 (= e!697383 e!697384)))

(declare-fun res!817233 () Bool)

(assert (=> b!1228660 (=> (not res!817233) (not e!697384))))

(declare-fun e!697386 () Bool)

(assert (=> b!1228660 (= res!817233 (not e!697386))))

(declare-fun res!817234 () Bool)

(assert (=> b!1228660 (=> (not res!817234) (not e!697386))))

(assert (=> b!1228660 (= res!817234 (validKeyInArray!0 (select (arr!38268 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1228661 () Bool)

(declare-fun e!697385 () Bool)

(declare-fun call!60826 () Bool)

(assert (=> b!1228661 (= e!697385 call!60826)))

(declare-fun b!1228662 () Bool)

(assert (=> b!1228662 (= e!697385 call!60826)))

(declare-fun bm!60823 () Bool)

(declare-fun c!120574 () Bool)

(assert (=> bm!60823 (= call!60826 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!120574 (Cons!27037 (select (arr!38268 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)) (ite c!120561 (Cons!27037 (select (arr!38268 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27037 (select (arr!38268 a!3806) from!3184) acc!823)) (Cons!27037 (select (arr!38268 a!3806) from!3184) acc!823))) (ite c!120561 (Cons!27037 (select (arr!38268 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27037 (select (arr!38268 a!3806) from!3184) acc!823)) (Cons!27037 (select (arr!38268 a!3806) from!3184) acc!823)))))))

(declare-fun d!134301 () Bool)

(declare-fun res!817232 () Bool)

(assert (=> d!134301 (=> res!817232 e!697383)))

(assert (=> d!134301 (= res!817232 (bvsge (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38804 a!3806)))))

(assert (=> d!134301 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120561 (Cons!27037 (select (arr!38268 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27037 (select (arr!38268 a!3806) from!3184) acc!823)) (Cons!27037 (select (arr!38268 a!3806) from!3184) acc!823))) e!697383)))

(declare-fun b!1228663 () Bool)

(assert (=> b!1228663 (= e!697384 e!697385)))

(assert (=> b!1228663 (= c!120574 (validKeyInArray!0 (select (arr!38268 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1228664 () Bool)

(assert (=> b!1228664 (= e!697386 (contains!7103 (ite c!120561 (Cons!27037 (select (arr!38268 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27037 (select (arr!38268 a!3806) from!3184) acc!823)) (Cons!27037 (select (arr!38268 a!3806) from!3184) acc!823)) (select (arr!38268 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(assert (= (and d!134301 (not res!817232)) b!1228660))

(assert (= (and b!1228660 res!817234) b!1228664))

(assert (= (and b!1228660 res!817233) b!1228663))

(assert (= (and b!1228663 c!120574) b!1228662))

(assert (= (and b!1228663 (not c!120574)) b!1228661))

(assert (= (or b!1228662 b!1228661) bm!60823))

(assert (=> b!1228660 m!1133191))

(assert (=> b!1228660 m!1133191))

(declare-fun m!1133203 () Bool)

(assert (=> b!1228660 m!1133203))

(assert (=> bm!60823 m!1133191))

(declare-fun m!1133205 () Bool)

(assert (=> bm!60823 m!1133205))

(assert (=> b!1228663 m!1133191))

(assert (=> b!1228663 m!1133191))

(assert (=> b!1228663 m!1133203))

(assert (=> b!1228664 m!1133191))

(assert (=> b!1228664 m!1133191))

(declare-fun m!1133207 () Bool)

(assert (=> b!1228664 m!1133207))

(assert (=> bm!60813 d!134301))

(declare-fun d!134303 () Bool)

(declare-fun lt!559030 () Bool)

(assert (=> d!134303 (= lt!559030 (select (content!553 (t!40504 (Cons!27037 (select (arr!38268 a!3806) from!3184) Nil!27038))) (h!28246 (Cons!27037 (select (arr!38268 a!3806) from!3184) Nil!27038))))))

(declare-fun e!697388 () Bool)

(assert (=> d!134303 (= lt!559030 e!697388)))

(declare-fun res!817236 () Bool)

(assert (=> d!134303 (=> (not res!817236) (not e!697388))))

(assert (=> d!134303 (= res!817236 ((_ is Cons!27037) (t!40504 (Cons!27037 (select (arr!38268 a!3806) from!3184) Nil!27038))))))

(assert (=> d!134303 (= (contains!7103 (t!40504 (Cons!27037 (select (arr!38268 a!3806) from!3184) Nil!27038)) (h!28246 (Cons!27037 (select (arr!38268 a!3806) from!3184) Nil!27038))) lt!559030)))

(declare-fun b!1228665 () Bool)

(declare-fun e!697387 () Bool)

(assert (=> b!1228665 (= e!697388 e!697387)))

(declare-fun res!817235 () Bool)

(assert (=> b!1228665 (=> res!817235 e!697387)))

(assert (=> b!1228665 (= res!817235 (= (h!28246 (t!40504 (Cons!27037 (select (arr!38268 a!3806) from!3184) Nil!27038))) (h!28246 (Cons!27037 (select (arr!38268 a!3806) from!3184) Nil!27038))))))

(declare-fun b!1228666 () Bool)

(assert (=> b!1228666 (= e!697387 (contains!7103 (t!40504 (t!40504 (Cons!27037 (select (arr!38268 a!3806) from!3184) Nil!27038))) (h!28246 (Cons!27037 (select (arr!38268 a!3806) from!3184) Nil!27038))))))

(assert (= (and d!134303 res!817236) b!1228665))

(assert (= (and b!1228665 (not res!817235)) b!1228666))

(declare-fun m!1133209 () Bool)

(assert (=> d!134303 m!1133209))

(declare-fun m!1133211 () Bool)

(assert (=> d!134303 m!1133211))

(declare-fun m!1133213 () Bool)

(assert (=> b!1228666 m!1133213))

(assert (=> b!1228514 d!134303))

(declare-fun d!134305 () Bool)

(declare-fun res!817237 () Bool)

(declare-fun e!697389 () Bool)

(assert (=> d!134305 (=> res!817237 e!697389)))

(assert (=> d!134305 (= res!817237 ((_ is Nil!27038) (t!40504 acc!823)))))

(assert (=> d!134305 (= (noDuplicate!1700 (t!40504 acc!823)) e!697389)))

(declare-fun b!1228667 () Bool)

(declare-fun e!697390 () Bool)

(assert (=> b!1228667 (= e!697389 e!697390)))

(declare-fun res!817238 () Bool)

(assert (=> b!1228667 (=> (not res!817238) (not e!697390))))

(assert (=> b!1228667 (= res!817238 (not (contains!7103 (t!40504 (t!40504 acc!823)) (h!28246 (t!40504 acc!823)))))))

(declare-fun b!1228668 () Bool)

(assert (=> b!1228668 (= e!697390 (noDuplicate!1700 (t!40504 (t!40504 acc!823))))))

(assert (= (and d!134305 (not res!817237)) b!1228667))

(assert (= (and b!1228667 res!817238) b!1228668))

(declare-fun m!1133215 () Bool)

(assert (=> b!1228667 m!1133215))

(declare-fun m!1133217 () Bool)

(assert (=> b!1228668 m!1133217))

(assert (=> b!1228513 d!134305))

(check-sat (not b!1228660) (not b!1228638) (not b!1228663) (not d!134275) (not b!1228666) (not d!134303) (not d!134277) (not d!134279) (not b!1228664) (not bm!60823) (not b!1228633) (not b!1228640) (not b!1228642) (not d!134289) (not d!134285) (not b!1228668) (not b!1228649) (not b!1228657) (not b!1228653) (not b!1228667) (not b!1228652) (not b!1228659) (not b!1228631) (not b!1228656) (not bm!60822) (not d!134299) (not b!1228655) (not bm!60821) (not b!1228634) (not b!1228629) (not d!134283) (not b!1228648) (not b!1228637))
(check-sat)
