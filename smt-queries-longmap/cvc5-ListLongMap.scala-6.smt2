; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!184 () Bool)

(assert start!184)

(declare-fun b_free!31 () Bool)

(declare-fun b_next!31 () Bool)

(assert (=> start!184 (= b_free!31 (not b_next!31))))

(declare-fun tp!106 () Bool)

(declare-fun b_and!61 () Bool)

(assert (=> start!184 (= tp!106 b_and!61)))

(declare-fun b!1884 () Bool)

(declare-fun res!4426 () Bool)

(declare-fun e!392 () Bool)

(assert (=> b!1884 (=> (not res!4426) (not e!392))))

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

(declare-fun isEmpty!19 (ListLongMap!35) Bool)

(assert (=> b!1884 (= res!4426 (not (isEmpty!19 lm!258)))))

(declare-fun b!1886 () Bool)

(declare-fun p!318 () Int)

(declare-fun forall!17 (List!24 Int) Bool)

(declare-fun tail!32 (ListLongMap!35) ListLongMap!35)

(assert (=> b!1886 (= e!392 (not (forall!17 (toList!33 (tail!32 lm!258)) p!318)))))

(declare-fun b!1887 () Bool)

(declare-fun e!393 () Bool)

(declare-fun tp!107 () Bool)

(assert (=> b!1887 (= e!393 tp!107)))

(declare-fun b!1885 () Bool)

(declare-fun res!4425 () Bool)

(assert (=> b!1885 (=> (not res!4425) (not e!392))))

(declare-fun k!394 () (_ BitVec 64))

(declare-fun head!746 (List!24) tuple2!30)

(assert (=> b!1885 (= res!4425 (not (= (_1!15 (head!746 (toList!33 lm!258))) k!394)))))

(declare-fun res!4427 () Bool)

(assert (=> start!184 (=> (not res!4427) (not e!392))))

(assert (=> start!184 (= res!4427 (forall!17 (toList!33 lm!258) p!318))))

(assert (=> start!184 e!392))

(declare-fun inv!55 (ListLongMap!35) Bool)

(assert (=> start!184 (and (inv!55 lm!258) e!393)))

(assert (=> start!184 tp!106))

(assert (=> start!184 true))

(assert (= (and start!184 res!4427) b!1884))

(assert (= (and b!1884 res!4426) b!1885))

(assert (= (and b!1885 res!4425) b!1886))

(assert (= start!184 b!1887))

(declare-fun m!531 () Bool)

(assert (=> b!1884 m!531))

(declare-fun m!533 () Bool)

(assert (=> b!1886 m!533))

(declare-fun m!535 () Bool)

(assert (=> b!1886 m!535))

(declare-fun m!537 () Bool)

(assert (=> b!1885 m!537))

(declare-fun m!539 () Bool)

(assert (=> start!184 m!539))

(declare-fun m!541 () Bool)

(assert (=> start!184 m!541))

(push 1)

(assert (not start!184))

(assert (not b!1887))

(assert (not b!1884))

(assert (not b!1886))

(assert b_and!61)

(assert (not b_next!31))

(assert (not b!1885))

(check-sat)

(pop 1)

(push 1)

(assert b_and!61)

(assert (not b_next!31))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!185 () Bool)

(declare-fun res!4454 () Bool)

(declare-fun e!414 () Bool)

(assert (=> d!185 (=> res!4454 e!414)))

(assert (=> d!185 (= res!4454 (is-Nil!21 (toList!33 (tail!32 lm!258))))))

(assert (=> d!185 (= (forall!17 (toList!33 (tail!32 lm!258)) p!318) e!414)))

(declare-fun b!1920 () Bool)

(declare-fun e!415 () Bool)

(assert (=> b!1920 (= e!414 e!415)))

(declare-fun res!4455 () Bool)

(assert (=> b!1920 (=> (not res!4455) (not e!415))))

(declare-fun dynLambda!9 (Int tuple2!30) Bool)

(assert (=> b!1920 (= res!4455 (dynLambda!9 p!318 (h!586 (toList!33 (tail!32 lm!258)))))))

(declare-fun b!1921 () Bool)

(assert (=> b!1921 (= e!415 (forall!17 (t!2049 (toList!33 (tail!32 lm!258))) p!318))))

(assert (= (and d!185 (not res!4454)) b!1920))

(assert (= (and b!1920 res!4455) b!1921))

(declare-fun b_lambda!61 () Bool)

(assert (=> (not b_lambda!61) (not b!1920)))

(declare-fun t!2053 () Bool)

(declare-fun tb!25 () Bool)

(assert (=> (and start!184 (= p!318 p!318) t!2053) tb!25))

(declare-fun result!43 () Bool)

(assert (=> tb!25 (= result!43 true)))

(assert (=> b!1920 t!2053))

(declare-fun b_and!67 () Bool)

(assert (= b_and!61 (and (=> t!2053 result!43) b_and!67)))

(declare-fun m!569 () Bool)

(assert (=> b!1920 m!569))

(declare-fun m!571 () Bool)

(assert (=> b!1921 m!571))

(assert (=> b!1886 d!185))

(declare-fun d!191 () Bool)

(declare-fun tail!35 (List!24) List!24)

(assert (=> d!191 (= (tail!32 lm!258) (ListLongMap!36 (tail!35 (toList!33 lm!258))))))

(declare-fun bs!52 () Bool)

(assert (= bs!52 d!191))

(declare-fun m!577 () Bool)

(assert (=> bs!52 m!577))

(assert (=> b!1886 d!191))

(declare-fun d!195 () Bool)

(declare-fun res!4462 () Bool)

(declare-fun e!422 () Bool)

(assert (=> d!195 (=> res!4462 e!422)))

(assert (=> d!195 (= res!4462 (is-Nil!21 (toList!33 lm!258)))))

(assert (=> d!195 (= (forall!17 (toList!33 lm!258) p!318) e!422)))

(declare-fun b!1928 () Bool)

(declare-fun e!423 () Bool)

(assert (=> b!1928 (= e!422 e!423)))

(declare-fun res!4463 () Bool)

(assert (=> b!1928 (=> (not res!4463) (not e!423))))

(assert (=> b!1928 (= res!4463 (dynLambda!9 p!318 (h!586 (toList!33 lm!258))))))

(declare-fun b!1929 () Bool)

(assert (=> b!1929 (= e!423 (forall!17 (t!2049 (toList!33 lm!258)) p!318))))

(assert (= (and d!195 (not res!4462)) b!1928))

(assert (= (and b!1928 res!4463) b!1929))

(declare-fun b_lambda!65 () Bool)

(assert (=> (not b_lambda!65) (not b!1928)))

(declare-fun t!2057 () Bool)

(declare-fun tb!29 () Bool)

(assert (=> (and start!184 (= p!318 p!318) t!2057) tb!29))

(declare-fun result!47 () Bool)

(assert (=> tb!29 (= result!47 true)))

(assert (=> b!1928 t!2057))

(declare-fun b_and!71 () Bool)

(assert (= b_and!67 (and (=> t!2057 result!47) b_and!71)))

(declare-fun m!579 () Bool)

(assert (=> b!1928 m!579))

(declare-fun m!581 () Bool)

(assert (=> b!1929 m!581))

(assert (=> start!184 d!195))

(declare-fun d!197 () Bool)

(declare-fun isStrictlySorted!7 (List!24) Bool)

(assert (=> d!197 (= (inv!55 lm!258) (isStrictlySorted!7 (toList!33 lm!258)))))

(declare-fun bs!54 () Bool)

(assert (= bs!54 d!197))

(declare-fun m!589 () Bool)

(assert (=> bs!54 m!589))

(assert (=> start!184 d!197))

(declare-fun d!203 () Bool)

(assert (=> d!203 (= (head!746 (toList!33 lm!258)) (h!586 (toList!33 lm!258)))))

(assert (=> b!1885 d!203))

(declare-fun d!207 () Bool)

(declare-fun isEmpty!23 (List!24) Bool)

(assert (=> d!207 (= (isEmpty!19 lm!258) (isEmpty!23 (toList!33 lm!258)))))

(declare-fun bs!56 () Bool)

(assert (= bs!56 d!207))

(declare-fun m!601 () Bool)

(assert (=> bs!56 m!601))

(assert (=> b!1884 d!207))

(declare-fun b!1940 () Bool)

(declare-fun e!432 () Bool)

(declare-fun tp_is_empty!19 () Bool)

(declare-fun tp!122 () Bool)

(assert (=> b!1940 (= e!432 (and tp_is_empty!19 tp!122))))

(assert (=> b!1887 (= tp!107 e!432)))

(assert (= (and b!1887 (is-Cons!20 (toList!33 lm!258))) b!1940))

(declare-fun b_lambda!73 () Bool)

(assert (= b_lambda!65 (or (and start!184 b_free!31) b_lambda!73)))

(declare-fun b_lambda!75 () Bool)

(assert (= b_lambda!61 (or (and start!184 b_free!31) b_lambda!75)))

(push 1)

(assert tp_is_empty!19)

(assert (not b_lambda!75))

(assert (not d!197))

(assert (not b_lambda!73))

(assert b_and!71)

(assert (not b_next!31))

(assert (not b!1940))

(assert (not d!207))

(assert (not b!1929))

(assert (not d!191))

(assert (not b!1921))

(check-sat)

(pop 1)

(push 1)

(assert b_and!71)

(assert (not b_next!31))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!219 () Bool)

(declare-fun res!4470 () Bool)

(declare-fun e!439 () Bool)

(assert (=> d!219 (=> res!4470 e!439)))

(assert (=> d!219 (= res!4470 (is-Nil!21 (t!2049 (toList!33 lm!258))))))

(assert (=> d!219 (= (forall!17 (t!2049 (toList!33 lm!258)) p!318) e!439)))

(declare-fun b!1951 () Bool)

(declare-fun e!440 () Bool)

(assert (=> b!1951 (= e!439 e!440)))

(declare-fun res!4471 () Bool)

(assert (=> b!1951 (=> (not res!4471) (not e!440))))

(assert (=> b!1951 (= res!4471 (dynLambda!9 p!318 (h!586 (t!2049 (toList!33 lm!258)))))))

(declare-fun b!1952 () Bool)

(assert (=> b!1952 (= e!440 (forall!17 (t!2049 (t!2049 (toList!33 lm!258))) p!318))))

(assert (= (and d!219 (not res!4470)) b!1951))

(assert (= (and b!1951 res!4471) b!1952))

(declare-fun b_lambda!87 () Bool)

(assert (=> (not b_lambda!87) (not b!1951)))

(declare-fun t!2067 () Bool)

(declare-fun tb!39 () Bool)

(assert (=> (and start!184 (= p!318 p!318) t!2067) tb!39))

(declare-fun result!63 () Bool)

(assert (=> tb!39 (= result!63 true)))

(assert (=> b!1951 t!2067))

(declare-fun b_and!81 () Bool)

(assert (= b_and!71 (and (=> t!2067 result!63) b_and!81)))

(declare-fun m!613 () Bool)

(assert (=> b!1951 m!613))

(declare-fun m!615 () Bool)

(assert (=> b!1952 m!615))

(assert (=> b!1929 d!219))

(declare-fun d!225 () Bool)

(declare-fun res!4482 () Bool)

(declare-fun e!451 () Bool)

(assert (=> d!225 (=> res!4482 e!451)))

(assert (=> d!225 (= res!4482 (or (is-Nil!21 (toList!33 lm!258)) (is-Nil!21 (t!2049 (toList!33 lm!258)))))))

(assert (=> d!225 (= (isStrictlySorted!7 (toList!33 lm!258)) e!451)))

(declare-fun b!1963 () Bool)

(declare-fun e!452 () Bool)

(assert (=> b!1963 (= e!451 e!452)))

(declare-fun res!4483 () Bool)

(assert (=> b!1963 (=> (not res!4483) (not e!452))))

(assert (=> b!1963 (= res!4483 (bvslt (_1!15 (h!586 (toList!33 lm!258))) (_1!15 (h!586 (t!2049 (toList!33 lm!258))))))))

(declare-fun b!1964 () Bool)

(assert (=> b!1964 (= e!452 (isStrictlySorted!7 (t!2049 (toList!33 lm!258))))))

(assert (= (and d!225 (not res!4482)) b!1963))

(assert (= (and b!1963 res!4483) b!1964))

(declare-fun m!617 () Bool)

(assert (=> b!1964 m!617))

(assert (=> d!197 d!225))

(declare-fun d!227 () Bool)

(assert (=> d!227 (= (isEmpty!23 (toList!33 lm!258)) (is-Nil!21 (toList!33 lm!258)))))

(assert (=> d!207 d!227))

(declare-fun d!229 () Bool)

(declare-fun res!4486 () Bool)

(declare-fun e!455 () Bool)

(assert (=> d!229 (=> res!4486 e!455)))

(assert (=> d!229 (= res!4486 (is-Nil!21 (t!2049 (toList!33 (tail!32 lm!258)))))))

(assert (=> d!229 (= (forall!17 (t!2049 (toList!33 (tail!32 lm!258))) p!318) e!455)))

(declare-fun b!1967 () Bool)

(declare-fun e!456 () Bool)

(assert (=> b!1967 (= e!455 e!456)))

(declare-fun res!4487 () Bool)

(assert (=> b!1967 (=> (not res!4487) (not e!456))))

(assert (=> b!1967 (= res!4487 (dynLambda!9 p!318 (h!586 (t!2049 (toList!33 (tail!32 lm!258))))))))

(declare-fun b!1968 () Bool)

(assert (=> b!1968 (= e!456 (forall!17 (t!2049 (t!2049 (toList!33 (tail!32 lm!258)))) p!318))))

(assert (= (and d!229 (not res!4486)) b!1967))

(assert (= (and b!1967 res!4487) b!1968))

(declare-fun b_lambda!89 () Bool)

(assert (=> (not b_lambda!89) (not b!1967)))

(declare-fun t!2069 () Bool)

(declare-fun tb!41 () Bool)

(assert (=> (and start!184 (= p!318 p!318) t!2069) tb!41))

(declare-fun result!65 () Bool)

(assert (=> tb!41 (= result!65 true)))

(assert (=> b!1967 t!2069))

(declare-fun b_and!83 () Bool)

(assert (= b_and!81 (and (=> t!2069 result!65) b_and!83)))

(declare-fun m!621 () Bool)

(assert (=> b!1967 m!621))

(declare-fun m!623 () Bool)

(assert (=> b!1968 m!623))

(assert (=> b!1921 d!229))

(declare-fun d!233 () Bool)

(assert (=> d!233 (= (tail!35 (toList!33 lm!258)) (t!2049 (toList!33 lm!258)))))

(assert (=> d!191 d!233))

(declare-fun b!1971 () Bool)

(declare-fun e!459 () Bool)

(declare-fun tp!129 () Bool)

(assert (=> b!1971 (= e!459 (and tp_is_empty!19 tp!129))))

(assert (=> b!1940 (= tp!122 e!459)))

(assert (= (and b!1940 (is-Cons!20 (t!2049 (toList!33 lm!258)))) b!1971))

(declare-fun b_lambda!93 () Bool)

(assert (= b_lambda!87 (or (and start!184 b_free!31) b_lambda!93)))

(declare-fun b_lambda!95 () Bool)

(assert (= b_lambda!89 (or (and start!184 b_free!31) b_lambda!95)))

(push 1)

