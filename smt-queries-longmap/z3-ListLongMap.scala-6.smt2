; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!184 () Bool)

(assert start!184)

(declare-fun b_free!31 () Bool)

(declare-fun b_next!31 () Bool)

(assert (=> start!184 (= b_free!31 (not b_next!31))))

(declare-fun tp!106 () Bool)

(declare-fun b_and!61 () Bool)

(assert (=> start!184 (= tp!106 b_and!61)))

(declare-fun b!1885 () Bool)

(declare-fun res!4427 () Bool)

(declare-fun e!392 () Bool)

(assert (=> b!1885 (=> (not res!4427) (not e!392))))

(declare-datatypes ((B!266 0))(
  ( (B!267 (val!15 Int)) )
))
(declare-datatypes ((tuple2!30 0))(
  ( (tuple2!31 (_1!15 (_ BitVec 64)) (_2!15 B!266)) )
))
(declare-datatypes ((List!24 0))(
  ( (Nil!21) (Cons!20 (h!586 tuple2!30) (t!2049 List!24)) )
))
(declare-datatypes ((ListLongMap!35 0))(
  ( (ListLongMap!36 (toList!33 List!24)) )
))
(declare-fun lm!258 () ListLongMap!35)

(declare-fun k0!394 () (_ BitVec 64))

(declare-fun head!746 (List!24) tuple2!30)

(assert (=> b!1885 (= res!4427 (not (= (_1!15 (head!746 (toList!33 lm!258))) k0!394)))))

(declare-fun b!1886 () Bool)

(declare-fun p!318 () Int)

(declare-fun forall!17 (List!24 Int) Bool)

(declare-fun tail!32 (ListLongMap!35) ListLongMap!35)

(assert (=> b!1886 (= e!392 (not (forall!17 (toList!33 (tail!32 lm!258)) p!318)))))

(declare-fun res!4425 () Bool)

(assert (=> start!184 (=> (not res!4425) (not e!392))))

(assert (=> start!184 (= res!4425 (forall!17 (toList!33 lm!258) p!318))))

(assert (=> start!184 e!392))

(declare-fun e!393 () Bool)

(declare-fun inv!55 (ListLongMap!35) Bool)

(assert (=> start!184 (and (inv!55 lm!258) e!393)))

(assert (=> start!184 tp!106))

(assert (=> start!184 true))

(declare-fun b!1884 () Bool)

(declare-fun res!4426 () Bool)

(assert (=> b!1884 (=> (not res!4426) (not e!392))))

(declare-fun isEmpty!19 (ListLongMap!35) Bool)

(assert (=> b!1884 (= res!4426 (not (isEmpty!19 lm!258)))))

(declare-fun b!1887 () Bool)

(declare-fun tp!107 () Bool)

(assert (=> b!1887 (= e!393 tp!107)))

(assert (= (and start!184 res!4425) b!1884))

(assert (= (and b!1884 res!4426) b!1885))

(assert (= (and b!1885 res!4427) b!1886))

(assert (= start!184 b!1887))

(declare-fun m!531 () Bool)

(assert (=> b!1885 m!531))

(declare-fun m!533 () Bool)

(assert (=> b!1886 m!533))

(declare-fun m!535 () Bool)

(assert (=> b!1886 m!535))

(declare-fun m!537 () Bool)

(assert (=> start!184 m!537))

(declare-fun m!539 () Bool)

(assert (=> start!184 m!539))

(declare-fun m!541 () Bool)

(assert (=> b!1884 m!541))

(check-sat (not b_next!31) (not b!1886) (not b!1887) (not start!184) (not b!1884) (not b!1885) b_and!61)
(check-sat b_and!61 (not b_next!31))
(get-model)

(declare-fun d!189 () Bool)

(declare-fun res!4460 () Bool)

(declare-fun e!420 () Bool)

(assert (=> d!189 (=> res!4460 e!420)))

(get-info :version)

(assert (=> d!189 (= res!4460 ((_ is Nil!21) (toList!33 (tail!32 lm!258))))))

(assert (=> d!189 (= (forall!17 (toList!33 (tail!32 lm!258)) p!318) e!420)))

(declare-fun b!1926 () Bool)

(declare-fun e!421 () Bool)

(assert (=> b!1926 (= e!420 e!421)))

(declare-fun res!4461 () Bool)

(assert (=> b!1926 (=> (not res!4461) (not e!421))))

(declare-fun dynLambda!10 (Int tuple2!30) Bool)

(assert (=> b!1926 (= res!4461 (dynLambda!10 p!318 (h!586 (toList!33 (tail!32 lm!258)))))))

(declare-fun b!1927 () Bool)

(assert (=> b!1927 (= e!421 (forall!17 (t!2049 (toList!33 (tail!32 lm!258))) p!318))))

(assert (= (and d!189 (not res!4460)) b!1926))

(assert (= (and b!1926 res!4461) b!1927))

(declare-fun b_lambda!63 () Bool)

(assert (=> (not b_lambda!63) (not b!1926)))

(declare-fun t!2055 () Bool)

(declare-fun tb!27 () Bool)

(assert (=> (and start!184 (= p!318 p!318) t!2055) tb!27))

(declare-fun result!45 () Bool)

(assert (=> tb!27 (= result!45 true)))

(assert (=> b!1926 t!2055))

(declare-fun b_and!69 () Bool)

(assert (= b_and!61 (and (=> t!2055 result!45) b_and!69)))

(declare-fun m!573 () Bool)

(assert (=> b!1926 m!573))

(declare-fun m!575 () Bool)

(assert (=> b!1927 m!575))

(assert (=> b!1886 d!189))

(declare-fun d!195 () Bool)

(declare-fun tail!35 (List!24) List!24)

(assert (=> d!195 (= (tail!32 lm!258) (ListLongMap!36 (tail!35 (toList!33 lm!258))))))

(declare-fun bs!53 () Bool)

(assert (= bs!53 d!195))

(declare-fun m!583 () Bool)

(assert (=> bs!53 m!583))

(assert (=> b!1886 d!195))

(declare-fun d!201 () Bool)

(declare-fun res!4466 () Bool)

(declare-fun e!426 () Bool)

(assert (=> d!201 (=> res!4466 e!426)))

(assert (=> d!201 (= res!4466 ((_ is Nil!21) (toList!33 lm!258)))))

(assert (=> d!201 (= (forall!17 (toList!33 lm!258) p!318) e!426)))

(declare-fun b!1932 () Bool)

(declare-fun e!427 () Bool)

(assert (=> b!1932 (= e!426 e!427)))

(declare-fun res!4467 () Bool)

(assert (=> b!1932 (=> (not res!4467) (not e!427))))

(assert (=> b!1932 (= res!4467 (dynLambda!10 p!318 (h!586 (toList!33 lm!258))))))

(declare-fun b!1933 () Bool)

(assert (=> b!1933 (= e!427 (forall!17 (t!2049 (toList!33 lm!258)) p!318))))

(assert (= (and d!201 (not res!4466)) b!1932))

(assert (= (and b!1932 res!4467) b!1933))

(declare-fun b_lambda!69 () Bool)

(assert (=> (not b_lambda!69) (not b!1932)))

(declare-fun t!2061 () Bool)

(declare-fun tb!33 () Bool)

(assert (=> (and start!184 (= p!318 p!318) t!2061) tb!33))

(declare-fun result!51 () Bool)

(assert (=> tb!33 (= result!51 true)))

(assert (=> b!1932 t!2061))

(declare-fun b_and!75 () Bool)

(assert (= b_and!69 (and (=> t!2061 result!51) b_and!75)))

(declare-fun m!591 () Bool)

(assert (=> b!1932 m!591))

(declare-fun m!593 () Bool)

(assert (=> b!1933 m!593))

(assert (=> start!184 d!201))

(declare-fun d!207 () Bool)

(declare-fun isStrictlySorted!7 (List!24) Bool)

(assert (=> d!207 (= (inv!55 lm!258) (isStrictlySorted!7 (toList!33 lm!258)))))

(declare-fun bs!56 () Bool)

(assert (= bs!56 d!207))

(declare-fun m!601 () Bool)

(assert (=> bs!56 m!601))

(assert (=> start!184 d!207))

(declare-fun d!213 () Bool)

(assert (=> d!213 (= (head!746 (toList!33 lm!258)) (h!586 (toList!33 lm!258)))))

(assert (=> b!1885 d!213))

(declare-fun d!217 () Bool)

(declare-fun isEmpty!23 (List!24) Bool)

(assert (=> d!217 (= (isEmpty!19 lm!258) (isEmpty!23 (toList!33 lm!258)))))

(declare-fun bs!58 () Bool)

(assert (= bs!58 d!217))

(declare-fun m!605 () Bool)

(assert (=> bs!58 m!605))

(assert (=> b!1884 d!217))

(declare-fun b!1949 () Bool)

(declare-fun e!437 () Bool)

(declare-fun tp_is_empty!21 () Bool)

(declare-fun tp!127 () Bool)

(assert (=> b!1949 (= e!437 (and tp_is_empty!21 tp!127))))

(assert (=> b!1887 (= tp!107 e!437)))

(assert (= (and b!1887 ((_ is Cons!20) (toList!33 lm!258))) b!1949))

(declare-fun b_lambda!77 () Bool)

(assert (= b_lambda!63 (or (and start!184 b_free!31) b_lambda!77)))

(declare-fun b_lambda!79 () Bool)

(assert (= b_lambda!69 (or (and start!184 b_free!31) b_lambda!79)))

(check-sat tp_is_empty!21 (not b_next!31) (not b!1927) (not b!1933) (not d!207) (not b_lambda!79) (not b_lambda!77) (not d!217) b_and!75 (not d!195) (not b!1949))
(check-sat b_and!75 (not b_next!31))
(get-model)

(declare-fun d!219 () Bool)

(assert (=> d!219 (= (isEmpty!23 (toList!33 lm!258)) ((_ is Nil!21) (toList!33 lm!258)))))

(assert (=> d!217 d!219))

(declare-fun d!223 () Bool)

(assert (=> d!223 (= (tail!35 (toList!33 lm!258)) (t!2049 (toList!33 lm!258)))))

(assert (=> d!195 d!223))

(declare-fun d!227 () Bool)

(declare-fun res!4472 () Bool)

(declare-fun e!441 () Bool)

(assert (=> d!227 (=> res!4472 e!441)))

(assert (=> d!227 (= res!4472 ((_ is Nil!21) (t!2049 (toList!33 (tail!32 lm!258)))))))

(assert (=> d!227 (= (forall!17 (t!2049 (toList!33 (tail!32 lm!258))) p!318) e!441)))

(declare-fun b!1953 () Bool)

(declare-fun e!442 () Bool)

(assert (=> b!1953 (= e!441 e!442)))

(declare-fun res!4473 () Bool)

(assert (=> b!1953 (=> (not res!4473) (not e!442))))

(assert (=> b!1953 (= res!4473 (dynLambda!10 p!318 (h!586 (t!2049 (toList!33 (tail!32 lm!258))))))))

(declare-fun b!1954 () Bool)

(assert (=> b!1954 (= e!442 (forall!17 (t!2049 (t!2049 (toList!33 (tail!32 lm!258)))) p!318))))

(assert (= (and d!227 (not res!4472)) b!1953))

(assert (= (and b!1953 res!4473) b!1954))

(declare-fun b_lambda!87 () Bool)

(assert (=> (not b_lambda!87) (not b!1953)))

(declare-fun t!2067 () Bool)

(declare-fun tb!39 () Bool)

(assert (=> (and start!184 (= p!318 p!318) t!2067) tb!39))

(declare-fun result!63 () Bool)

(assert (=> tb!39 (= result!63 true)))

(assert (=> b!1953 t!2067))

(declare-fun b_and!81 () Bool)

(assert (= b_and!75 (and (=> t!2067 result!63) b_and!81)))

(declare-fun m!613 () Bool)

(assert (=> b!1953 m!613))

(declare-fun m!615 () Bool)

(assert (=> b!1954 m!615))

(assert (=> b!1927 d!227))

(declare-fun d!231 () Bool)

(declare-fun res!4474 () Bool)

(declare-fun e!443 () Bool)

(assert (=> d!231 (=> res!4474 e!443)))

(assert (=> d!231 (= res!4474 ((_ is Nil!21) (t!2049 (toList!33 lm!258))))))

(assert (=> d!231 (= (forall!17 (t!2049 (toList!33 lm!258)) p!318) e!443)))

(declare-fun b!1955 () Bool)

(declare-fun e!444 () Bool)

(assert (=> b!1955 (= e!443 e!444)))

(declare-fun res!4475 () Bool)

(assert (=> b!1955 (=> (not res!4475) (not e!444))))

(assert (=> b!1955 (= res!4475 (dynLambda!10 p!318 (h!586 (t!2049 (toList!33 lm!258)))))))

(declare-fun b!1956 () Bool)

(assert (=> b!1956 (= e!444 (forall!17 (t!2049 (t!2049 (toList!33 lm!258))) p!318))))

(assert (= (and d!231 (not res!4474)) b!1955))

(assert (= (and b!1955 res!4475) b!1956))

(declare-fun b_lambda!89 () Bool)

(assert (=> (not b_lambda!89) (not b!1955)))

(declare-fun t!2069 () Bool)

(declare-fun tb!41 () Bool)

(assert (=> (and start!184 (= p!318 p!318) t!2069) tb!41))

(declare-fun result!65 () Bool)

(assert (=> tb!41 (= result!65 true)))

(assert (=> b!1955 t!2069))

(declare-fun b_and!83 () Bool)

(assert (= b_and!81 (and (=> t!2069 result!65) b_and!83)))

(declare-fun m!617 () Bool)

(assert (=> b!1955 m!617))

(declare-fun m!619 () Bool)

(assert (=> b!1956 m!619))

(assert (=> b!1933 d!231))

(declare-fun d!233 () Bool)

(declare-fun res!4488 () Bool)

(declare-fun e!458 () Bool)

(assert (=> d!233 (=> res!4488 e!458)))

(assert (=> d!233 (= res!4488 (or ((_ is Nil!21) (toList!33 lm!258)) ((_ is Nil!21) (t!2049 (toList!33 lm!258)))))))

(assert (=> d!233 (= (isStrictlySorted!7 (toList!33 lm!258)) e!458)))

(declare-fun b!1970 () Bool)

(declare-fun e!459 () Bool)

(assert (=> b!1970 (= e!458 e!459)))

(declare-fun res!4489 () Bool)

(assert (=> b!1970 (=> (not res!4489) (not e!459))))

(assert (=> b!1970 (= res!4489 (bvslt (_1!15 (h!586 (toList!33 lm!258))) (_1!15 (h!586 (t!2049 (toList!33 lm!258))))))))

(declare-fun b!1971 () Bool)

(assert (=> b!1971 (= e!459 (isStrictlySorted!7 (t!2049 (toList!33 lm!258))))))

(assert (= (and d!233 (not res!4488)) b!1970))

(assert (= (and b!1970 res!4489) b!1971))

(declare-fun m!627 () Bool)

(assert (=> b!1971 m!627))

(assert (=> d!207 d!233))

(declare-fun b!1974 () Bool)

(declare-fun e!462 () Bool)

(declare-fun tp!130 () Bool)

(assert (=> b!1974 (= e!462 (and tp_is_empty!21 tp!130))))

(assert (=> b!1949 (= tp!127 e!462)))

(assert (= (and b!1949 ((_ is Cons!20) (t!2049 (toList!33 lm!258)))) b!1974))

(declare-fun b_lambda!99 () Bool)

(assert (= b_lambda!87 (or (and start!184 b_free!31) b_lambda!99)))

(declare-fun b_lambda!101 () Bool)

(assert (= b_lambda!89 (or (and start!184 b_free!31) b_lambda!101)))

(check-sat tp_is_empty!21 (not b_next!31) (not b!1956) b_and!83 (not b_lambda!99) (not b!1971) (not b!1954) (not b_lambda!101) (not b_lambda!79) (not b_lambda!77) (not b!1974))
(check-sat b_and!83 (not b_next!31))
