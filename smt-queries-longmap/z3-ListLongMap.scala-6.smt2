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

(declare-fun dynLambda!11 (Int tuple2!30) Bool)

(assert (=> b!1926 (= res!4461 (dynLambda!11 p!318 (h!586 (toList!33 (tail!32 lm!258)))))))

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

(declare-fun m!575 () Bool)

(assert (=> b!1926 m!575))

(declare-fun m!577 () Bool)

(assert (=> b!1927 m!577))

(assert (=> b!1886 d!189))

(declare-fun d!197 () Bool)

(declare-fun tail!36 (List!24) List!24)

(assert (=> d!197 (= (tail!32 lm!258) (ListLongMap!36 (tail!36 (toList!33 lm!258))))))

(declare-fun bs!53 () Bool)

(assert (= bs!53 d!197))

(declare-fun m!587 () Bool)

(assert (=> bs!53 m!587))

(assert (=> b!1886 d!197))

(declare-fun d!203 () Bool)

(declare-fun res!4466 () Bool)

(declare-fun e!426 () Bool)

(assert (=> d!203 (=> res!4466 e!426)))

(assert (=> d!203 (= res!4466 ((_ is Nil!21) (toList!33 lm!258)))))

(assert (=> d!203 (= (forall!17 (toList!33 lm!258) p!318) e!426)))

(declare-fun b!1932 () Bool)

(declare-fun e!427 () Bool)

(assert (=> b!1932 (= e!426 e!427)))

(declare-fun res!4467 () Bool)

(assert (=> b!1932 (=> (not res!4467) (not e!427))))

(assert (=> b!1932 (= res!4467 (dynLambda!11 p!318 (h!586 (toList!33 lm!258))))))

(declare-fun b!1933 () Bool)

(assert (=> b!1933 (= e!427 (forall!17 (t!2049 (toList!33 lm!258)) p!318))))

(assert (= (and d!203 (not res!4466)) b!1932))

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

(declare-fun m!589 () Bool)

(assert (=> b!1932 m!589))

(declare-fun m!591 () Bool)

(assert (=> b!1933 m!591))

(assert (=> start!184 d!203))

(declare-fun d!205 () Bool)

(declare-fun isStrictlySorted!9 (List!24) Bool)

(assert (=> d!205 (= (inv!55 lm!258) (isStrictlySorted!9 (toList!33 lm!258)))))

(declare-fun bs!56 () Bool)

(assert (= bs!56 d!205))

(declare-fun m!601 () Bool)

(assert (=> bs!56 m!601))

(assert (=> start!184 d!205))

(declare-fun d!215 () Bool)

(assert (=> d!215 (= (head!746 (toList!33 lm!258)) (h!586 (toList!33 lm!258)))))

(assert (=> b!1885 d!215))

(declare-fun d!217 () Bool)

(declare-fun isEmpty!24 (List!24) Bool)

(assert (=> d!217 (= (isEmpty!19 lm!258) (isEmpty!24 (toList!33 lm!258)))))

(declare-fun bs!59 () Bool)

(assert (= bs!59 d!217))

(declare-fun m!607 () Bool)

(assert (=> bs!59 m!607))

(assert (=> b!1884 d!217))

(declare-fun b!1950 () Bool)

(declare-fun e!438 () Bool)

(declare-fun tp_is_empty!23 () Bool)

(declare-fun tp!128 () Bool)

(assert (=> b!1950 (= e!438 (and tp_is_empty!23 tp!128))))

(assert (=> b!1887 (= tp!107 e!438)))

(assert (= (and b!1887 ((_ is Cons!20) (toList!33 lm!258))) b!1950))

(declare-fun b_lambda!81 () Bool)

(assert (= b_lambda!63 (or (and start!184 b_free!31) b_lambda!81)))

(declare-fun b_lambda!83 () Bool)

(assert (= b_lambda!69 (or (and start!184 b_free!31) b_lambda!83)))

(check-sat (not b!1927) b_and!75 (not d!205) (not b_lambda!83) (not d!217) (not b_lambda!81) (not b!1933) tp_is_empty!23 (not b!1950) (not b_next!31) (not d!197))
(check-sat b_and!75 (not b_next!31))
(get-model)

(declare-fun d!220 () Bool)

(assert (=> d!220 (= (isEmpty!24 (toList!33 lm!258)) ((_ is Nil!21) (toList!33 lm!258)))))

(assert (=> d!217 d!220))

(declare-fun d!223 () Bool)

(declare-fun res!4472 () Bool)

(declare-fun e!441 () Bool)

(assert (=> d!223 (=> res!4472 e!441)))

(assert (=> d!223 (= res!4472 ((_ is Nil!21) (t!2049 (toList!33 (tail!32 lm!258)))))))

(assert (=> d!223 (= (forall!17 (t!2049 (toList!33 (tail!32 lm!258))) p!318) e!441)))

(declare-fun b!1953 () Bool)

(declare-fun e!442 () Bool)

(assert (=> b!1953 (= e!441 e!442)))

(declare-fun res!4473 () Bool)

(assert (=> b!1953 (=> (not res!4473) (not e!442))))

(assert (=> b!1953 (= res!4473 (dynLambda!11 p!318 (h!586 (t!2049 (toList!33 (tail!32 lm!258))))))))

(declare-fun b!1954 () Bool)

(assert (=> b!1954 (= e!442 (forall!17 (t!2049 (t!2049 (toList!33 (tail!32 lm!258)))) p!318))))

(assert (= (and d!223 (not res!4472)) b!1953))

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

(assert (=> b!1927 d!223))

(declare-fun d!227 () Bool)

(declare-fun res!4476 () Bool)

(declare-fun e!445 () Bool)

(assert (=> d!227 (=> res!4476 e!445)))

(assert (=> d!227 (= res!4476 ((_ is Nil!21) (t!2049 (toList!33 lm!258))))))

(assert (=> d!227 (= (forall!17 (t!2049 (toList!33 lm!258)) p!318) e!445)))

(declare-fun b!1957 () Bool)

(declare-fun e!446 () Bool)

(assert (=> b!1957 (= e!445 e!446)))

(declare-fun res!4477 () Bool)

(assert (=> b!1957 (=> (not res!4477) (not e!446))))

(assert (=> b!1957 (= res!4477 (dynLambda!11 p!318 (h!586 (t!2049 (toList!33 lm!258)))))))

(declare-fun b!1958 () Bool)

(assert (=> b!1958 (= e!446 (forall!17 (t!2049 (t!2049 (toList!33 lm!258))) p!318))))

(assert (= (and d!227 (not res!4476)) b!1957))

(assert (= (and b!1957 res!4477) b!1958))

(declare-fun b_lambda!91 () Bool)

(assert (=> (not b_lambda!91) (not b!1957)))

(declare-fun t!2071 () Bool)

(declare-fun tb!43 () Bool)

(assert (=> (and start!184 (= p!318 p!318) t!2071) tb!43))

(declare-fun result!67 () Bool)

(assert (=> tb!43 (= result!67 true)))

(assert (=> b!1957 t!2071))

(declare-fun b_and!85 () Bool)

(assert (= b_and!81 (and (=> t!2071 result!67) b_and!85)))

(declare-fun m!621 () Bool)

(assert (=> b!1957 m!621))

(declare-fun m!623 () Bool)

(assert (=> b!1958 m!623))

(assert (=> b!1933 d!227))

(declare-fun d!231 () Bool)

(declare-fun res!4492 () Bool)

(declare-fun e!461 () Bool)

(assert (=> d!231 (=> res!4492 e!461)))

(assert (=> d!231 (= res!4492 (or ((_ is Nil!21) (toList!33 lm!258)) ((_ is Nil!21) (t!2049 (toList!33 lm!258)))))))

(assert (=> d!231 (= (isStrictlySorted!9 (toList!33 lm!258)) e!461)))

(declare-fun b!1973 () Bool)

(declare-fun e!462 () Bool)

(assert (=> b!1973 (= e!461 e!462)))

(declare-fun res!4493 () Bool)

(assert (=> b!1973 (=> (not res!4493) (not e!462))))

(assert (=> b!1973 (= res!4493 (bvslt (_1!15 (h!586 (toList!33 lm!258))) (_1!15 (h!586 (t!2049 (toList!33 lm!258))))))))

(declare-fun b!1974 () Bool)

(assert (=> b!1974 (= e!462 (isStrictlySorted!9 (t!2049 (toList!33 lm!258))))))

(assert (= (and d!231 (not res!4492)) b!1973))

(assert (= (and b!1973 res!4493) b!1974))

(declare-fun m!627 () Bool)

(assert (=> b!1974 m!627))

(assert (=> d!205 d!231))

(declare-fun d!239 () Bool)

(assert (=> d!239 (= (tail!36 (toList!33 lm!258)) (t!2049 (toList!33 lm!258)))))

(assert (=> d!197 d!239))

(declare-fun b!1977 () Bool)

(declare-fun e!465 () Bool)

(declare-fun tp!129 () Bool)

(assert (=> b!1977 (= e!465 (and tp_is_empty!23 tp!129))))

(assert (=> b!1950 (= tp!128 e!465)))

(assert (= (and b!1950 ((_ is Cons!20) (t!2049 (toList!33 lm!258)))) b!1977))

(declare-fun b_lambda!93 () Bool)

(assert (= b_lambda!87 (or (and start!184 b_free!31) b_lambda!93)))

(declare-fun b_lambda!95 () Bool)

(assert (= b_lambda!91 (or (and start!184 b_free!31) b_lambda!95)))

(check-sat (not b_next!31) (not b!1977) (not b_lambda!83) (not b!1974) (not b_lambda!81) (not b_lambda!93) (not b_lambda!95) tp_is_empty!23 (not b!1954) (not b!1958) b_and!85)
(check-sat b_and!85 (not b_next!31))
