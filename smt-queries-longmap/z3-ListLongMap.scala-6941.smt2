; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87628 () Bool)

(assert start!87628)

(declare-fun b!1013932 () Bool)

(declare-fun e!570486 () Bool)

(declare-fun tp_is_empty!23419 () Bool)

(declare-fun tp!70320 () Bool)

(assert (=> b!1013932 (= e!570486 (and tp_is_empty!23419 tp!70320))))

(declare-fun res!680592 () Bool)

(declare-fun e!570485 () Bool)

(assert (=> start!87628 (=> (not res!680592) (not e!570485))))

(declare-datatypes ((B!1352 0))(
  ( (B!1353 (val!11760 Int)) )
))
(declare-datatypes ((tuple2!15070 0))(
  ( (tuple2!15071 (_1!7546 (_ BitVec 64)) (_2!7546 B!1352)) )
))
(declare-datatypes ((List!21356 0))(
  ( (Nil!21353) (Cons!21352 (h!22559 tuple2!15070) (t!30349 List!21356)) )
))
(declare-fun l!412 () List!21356)

(declare-fun isStrictlySorted!528 (List!21356) Bool)

(assert (=> start!87628 (= res!680592 (isStrictlySorted!528 l!412))))

(assert (=> start!87628 e!570485))

(assert (=> start!87628 e!570486))

(assert (=> start!87628 tp_is_empty!23419))

(declare-fun b!1013929 () Bool)

(declare-fun res!680594 () Bool)

(assert (=> b!1013929 (=> (not res!680594) (not e!570485))))

(declare-fun value!115 () B!1352)

(get-info :version)

(assert (=> b!1013929 (= res!680594 (and (not (= (_2!7546 (h!22559 l!412)) value!115)) ((_ is Cons!21352) l!412)))))

(declare-fun b!1013930 () Bool)

(declare-fun res!680593 () Bool)

(assert (=> b!1013930 (=> (not res!680593) (not e!570485))))

(declare-datatypes ((List!21357 0))(
  ( (Nil!21354) (Cons!21353 (h!22560 (_ BitVec 64)) (t!30350 List!21357)) )
))
(declare-fun isEmpty!800 (List!21357) Bool)

(declare-fun getKeysOf!22 (List!21356 B!1352) List!21357)

(assert (=> b!1013930 (= res!680593 (not (isEmpty!800 (getKeysOf!22 (t!30349 l!412) value!115))))))

(declare-fun b!1013931 () Bool)

(assert (=> b!1013931 (= e!570485 (not (isStrictlySorted!528 (t!30349 l!412))))))

(assert (= (and start!87628 res!680592) b!1013929))

(assert (= (and b!1013929 res!680594) b!1013930))

(assert (= (and b!1013930 res!680593) b!1013931))

(assert (= (and start!87628 ((_ is Cons!21352) l!412)) b!1013932))

(declare-fun m!937727 () Bool)

(assert (=> start!87628 m!937727))

(declare-fun m!937729 () Bool)

(assert (=> b!1013930 m!937729))

(assert (=> b!1013930 m!937729))

(declare-fun m!937731 () Bool)

(assert (=> b!1013930 m!937731))

(declare-fun m!937733 () Bool)

(assert (=> b!1013931 m!937733))

(check-sat (not b!1013930) (not b!1013931) (not b!1013932) (not start!87628) tp_is_empty!23419)
(check-sat)
(get-model)

(declare-fun d!120791 () Bool)

(declare-fun res!680619 () Bool)

(declare-fun e!570505 () Bool)

(assert (=> d!120791 (=> res!680619 e!570505)))

(assert (=> d!120791 (= res!680619 (or ((_ is Nil!21353) (t!30349 l!412)) ((_ is Nil!21353) (t!30349 (t!30349 l!412)))))))

(assert (=> d!120791 (= (isStrictlySorted!528 (t!30349 l!412)) e!570505)))

(declare-fun b!1013963 () Bool)

(declare-fun e!570508 () Bool)

(assert (=> b!1013963 (= e!570505 e!570508)))

(declare-fun res!680621 () Bool)

(assert (=> b!1013963 (=> (not res!680621) (not e!570508))))

(assert (=> b!1013963 (= res!680621 (bvslt (_1!7546 (h!22559 (t!30349 l!412))) (_1!7546 (h!22559 (t!30349 (t!30349 l!412))))))))

(declare-fun b!1013964 () Bool)

(assert (=> b!1013964 (= e!570508 (isStrictlySorted!528 (t!30349 (t!30349 l!412))))))

(assert (= (and d!120791 (not res!680619)) b!1013963))

(assert (= (and b!1013963 res!680621) b!1013964))

(declare-fun m!937751 () Bool)

(assert (=> b!1013964 m!937751))

(assert (=> b!1013931 d!120791))

(declare-fun d!120797 () Bool)

(declare-fun res!680623 () Bool)

(declare-fun e!570509 () Bool)

(assert (=> d!120797 (=> res!680623 e!570509)))

(assert (=> d!120797 (= res!680623 (or ((_ is Nil!21353) l!412) ((_ is Nil!21353) (t!30349 l!412))))))

(assert (=> d!120797 (= (isStrictlySorted!528 l!412) e!570509)))

(declare-fun b!1013967 () Bool)

(declare-fun e!570510 () Bool)

(assert (=> b!1013967 (= e!570509 e!570510)))

(declare-fun res!680624 () Bool)

(assert (=> b!1013967 (=> (not res!680624) (not e!570510))))

(assert (=> b!1013967 (= res!680624 (bvslt (_1!7546 (h!22559 l!412)) (_1!7546 (h!22559 (t!30349 l!412)))))))

(declare-fun b!1013968 () Bool)

(assert (=> b!1013968 (= e!570510 (isStrictlySorted!528 (t!30349 l!412)))))

(assert (= (and d!120797 (not res!680623)) b!1013967))

(assert (= (and b!1013967 res!680624) b!1013968))

(assert (=> b!1013968 m!937733))

(assert (=> start!87628 d!120797))

(declare-fun d!120799 () Bool)

(assert (=> d!120799 (= (isEmpty!800 (getKeysOf!22 (t!30349 l!412) value!115)) ((_ is Nil!21354) (getKeysOf!22 (t!30349 l!412) value!115)))))

(assert (=> b!1013930 d!120799))

(declare-fun b!1014028 () Bool)

(assert (=> b!1014028 true))

(assert (=> b!1014028 true))

(assert (=> b!1014028 true))

(declare-fun bs!28853 () Bool)

(declare-fun b!1014032 () Bool)

(assert (= bs!28853 (and b!1014032 b!1014028)))

(declare-fun lt!448184 () tuple2!15070)

(declare-fun lt!448175 () tuple2!15070)

(declare-fun lambda!393 () Int)

(declare-fun lt!448179 () List!21356)

(declare-fun lambda!396 () Int)

(declare-fun lt!448183 () List!21356)

(assert (=> bs!28853 (= (= (Cons!21352 lt!448184 lt!448179) (Cons!21352 lt!448175 lt!448183)) (= lambda!396 lambda!393))))

(assert (=> b!1014032 true))

(assert (=> b!1014032 true))

(assert (=> b!1014032 true))

(declare-fun bs!28856 () Bool)

(declare-fun d!120801 () Bool)

(assert (= bs!28856 (and d!120801 b!1014028)))

(declare-fun lambda!399 () Int)

(assert (=> bs!28856 (= (= (t!30349 l!412) (Cons!21352 lt!448175 lt!448183)) (= lambda!399 lambda!393))))

(declare-fun bs!28858 () Bool)

(assert (= bs!28858 (and d!120801 b!1014032)))

(assert (=> bs!28858 (= (= (t!30349 l!412) (Cons!21352 lt!448184 lt!448179)) (= lambda!399 lambda!396))))

(assert (=> d!120801 true))

(assert (=> d!120801 true))

(declare-fun b!1014027 () Bool)

(declare-datatypes ((Unit!33075 0))(
  ( (Unit!33076) )
))
(declare-fun lt!448180 () Unit!33075)

(declare-fun e!570547 () Unit!33075)

(assert (=> b!1014027 (= lt!448180 e!570547)))

(declare-fun c!102755 () Bool)

(declare-fun call!42644 () Bool)

(assert (=> b!1014027 (= c!102755 (not call!42644))))

(declare-fun lt!448177 () List!21357)

(declare-fun call!42641 () List!21357)

(assert (=> b!1014027 (= lt!448177 call!42641)))

(declare-fun e!570546 () List!21357)

(assert (=> b!1014027 (= e!570546 call!42641)))

(declare-fun call!42643 () Bool)

(assert (=> b!1014028 call!42643))

(declare-fun lt!448174 () Unit!33075)

(declare-fun call!42642 () Unit!33075)

(assert (=> b!1014028 (= lt!448174 call!42642)))

(assert (=> b!1014028 (= lt!448175 (h!22559 (t!30349 l!412)))))

(declare-fun lt!448173 () List!21357)

(assert (=> b!1014028 (= lt!448173 call!42641)))

(assert (=> b!1014028 (= lt!448183 (t!30349 (t!30349 l!412)))))

(declare-fun e!570548 () Unit!33075)

(assert (=> b!1014028 (= e!570548 lt!448174)))

(declare-fun bm!42638 () Bool)

(declare-fun c!102752 () Bool)

(declare-fun lt!448181 () List!21357)

(declare-fun forall!217 (List!21357 Int) Bool)

(assert (=> bm!42638 (= call!42643 (forall!217 (ite c!102752 lt!448173 lt!448181) (ite c!102752 lambda!393 lambda!396)))))

(declare-fun lt!448182 () List!21357)

(assert (=> d!120801 (forall!217 lt!448182 lambda!399)))

(declare-fun e!570545 () List!21357)

(assert (=> d!120801 (= lt!448182 e!570545)))

(assert (=> d!120801 (= c!102752 (and ((_ is Cons!21352) (t!30349 l!412)) (= (_2!7546 (h!22559 (t!30349 l!412))) value!115)))))

(assert (=> d!120801 (isStrictlySorted!528 (t!30349 l!412))))

(assert (=> d!120801 (= (getKeysOf!22 (t!30349 l!412) value!115) lt!448182)))

(declare-fun b!1014029 () Bool)

(assert (=> b!1014029 (= e!570545 e!570546)))

(declare-fun c!102754 () Bool)

(assert (=> b!1014029 (= c!102754 (and ((_ is Cons!21352) (t!30349 l!412)) (not (= (_2!7546 (h!22559 (t!30349 l!412))) value!115))))))

(declare-fun bm!42639 () Bool)

(assert (=> bm!42639 (= call!42644 (isEmpty!800 call!42641))))

(declare-fun b!1014030 () Bool)

(declare-fun Unit!33082 () Unit!33075)

(assert (=> b!1014030 (= e!570548 Unit!33082)))

(declare-fun bm!42640 () Bool)

(assert (=> bm!42640 (= call!42641 (getKeysOf!22 (t!30349 (t!30349 l!412)) value!115))))

(declare-fun b!1014031 () Bool)

(assert (=> b!1014031 (= e!570546 Nil!21354)))

(declare-fun lt!448178 () Unit!33075)

(assert (=> b!1014032 (= e!570547 lt!448178)))

(assert (=> b!1014032 (= lt!448179 (t!30349 (t!30349 l!412)))))

(assert (=> b!1014032 (= lt!448181 call!42641)))

(assert (=> b!1014032 (= lt!448184 (h!22559 (t!30349 l!412)))))

(assert (=> b!1014032 (= lt!448178 call!42642)))

(assert (=> b!1014032 call!42643))

(declare-fun bm!42641 () Bool)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!16 (List!21356 List!21357 B!1352 tuple2!15070) Unit!33075)

(assert (=> bm!42641 (= call!42642 (lemmaForallGetValueByKeySameWithASmallerHead!16 (ite c!102752 lt!448183 lt!448179) (ite c!102752 lt!448173 lt!448181) value!115 (ite c!102752 lt!448175 lt!448184)))))

(declare-fun b!1014033 () Bool)

(assert (=> b!1014033 (= e!570545 (Cons!21353 (_1!7546 (h!22559 (t!30349 l!412))) call!42641))))

(declare-fun c!102753 () Bool)

(assert (=> b!1014033 (= c!102753 (not call!42644))))

(declare-fun lt!448176 () Unit!33075)

(assert (=> b!1014033 (= lt!448176 e!570548)))

(declare-fun b!1014034 () Bool)

(declare-fun Unit!33084 () Unit!33075)

(assert (=> b!1014034 (= e!570547 Unit!33084)))

(assert (= (and d!120801 c!102752) b!1014033))

(assert (= (and d!120801 (not c!102752)) b!1014029))

(assert (= (and b!1014033 c!102753) b!1014028))

(assert (= (and b!1014033 (not c!102753)) b!1014030))

(assert (= (and b!1014029 c!102754) b!1014027))

(assert (= (and b!1014029 (not c!102754)) b!1014031))

(assert (= (and b!1014027 c!102755) b!1014032))

(assert (= (and b!1014027 (not c!102755)) b!1014034))

(assert (= (or b!1014028 b!1014032) bm!42641))

(assert (= (or b!1014028 b!1014032) bm!42638))

(assert (= (or b!1014033 b!1014028 b!1014027 b!1014032) bm!42640))

(assert (= (or b!1014033 b!1014027) bm!42639))

(declare-fun m!937761 () Bool)

(assert (=> bm!42638 m!937761))

(declare-fun m!937763 () Bool)

(assert (=> bm!42639 m!937763))

(declare-fun m!937765 () Bool)

(assert (=> bm!42640 m!937765))

(declare-fun m!937771 () Bool)

(assert (=> bm!42641 m!937771))

(declare-fun m!937775 () Bool)

(assert (=> d!120801 m!937775))

(assert (=> d!120801 m!937733))

(assert (=> b!1013930 d!120801))

(declare-fun b!1014078 () Bool)

(declare-fun e!570562 () Bool)

(declare-fun tp!70332 () Bool)

(assert (=> b!1014078 (= e!570562 (and tp_is_empty!23419 tp!70332))))

(assert (=> b!1013932 (= tp!70320 e!570562)))

(assert (= (and b!1013932 ((_ is Cons!21352) (t!30349 l!412))) b!1014078))

(check-sat (not b!1013968) (not bm!42639) (not b!1014078) (not d!120801) (not bm!42638) (not b!1013964) (not bm!42641) (not bm!42640) tp_is_empty!23419)
(check-sat)
