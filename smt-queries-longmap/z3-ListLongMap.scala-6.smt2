; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!186 () Bool)

(assert start!186)

(declare-fun b_free!33 () Bool)

(declare-fun b_next!33 () Bool)

(assert (=> start!186 (= b_free!33 (not b_next!33))))

(declare-fun tp!112 () Bool)

(declare-fun b_and!63 () Bool)

(assert (=> start!186 (= tp!112 b_and!63)))

(declare-fun b!1899 () Bool)

(declare-fun e!398 () Bool)

(declare-fun tp!113 () Bool)

(assert (=> b!1899 (= e!398 tp!113)))

(declare-fun b!1896 () Bool)

(declare-fun res!4436 () Bool)

(declare-fun e!399 () Bool)

(assert (=> b!1896 (=> (not res!4436) (not e!399))))

(declare-datatypes ((B!268 0))(
  ( (B!269 (val!16 Int)) )
))
(declare-datatypes ((tuple2!32 0))(
  ( (tuple2!33 (_1!16 (_ BitVec 64)) (_2!16 B!268)) )
))
(declare-datatypes ((List!25 0))(
  ( (Nil!22) (Cons!21 (h!587 tuple2!32) (t!2050 List!25)) )
))
(declare-datatypes ((ListLongMap!37 0))(
  ( (ListLongMap!38 (toList!34 List!25)) )
))
(declare-fun lm!258 () ListLongMap!37)

(declare-fun isEmpty!20 (ListLongMap!37) Bool)

(assert (=> b!1896 (= res!4436 (not (isEmpty!20 lm!258)))))

(declare-fun b!1898 () Bool)

(declare-fun p!318 () Int)

(declare-fun forall!18 (List!25 Int) Bool)

(declare-fun tail!33 (ListLongMap!37) ListLongMap!37)

(assert (=> b!1898 (= e!399 (not (forall!18 (toList!34 (tail!33 lm!258)) p!318)))))

(declare-fun b!1897 () Bool)

(declare-fun res!4434 () Bool)

(assert (=> b!1897 (=> (not res!4434) (not e!399))))

(declare-fun k0!394 () (_ BitVec 64))

(declare-fun head!747 (List!25) tuple2!32)

(assert (=> b!1897 (= res!4434 (not (= (_1!16 (head!747 (toList!34 lm!258))) k0!394)))))

(declare-fun res!4435 () Bool)

(assert (=> start!186 (=> (not res!4435) (not e!399))))

(assert (=> start!186 (= res!4435 (forall!18 (toList!34 lm!258) p!318))))

(assert (=> start!186 e!399))

(declare-fun inv!56 (ListLongMap!37) Bool)

(assert (=> start!186 (and (inv!56 lm!258) e!398)))

(assert (=> start!186 tp!112))

(assert (=> start!186 true))

(assert (= (and start!186 res!4435) b!1896))

(assert (= (and b!1896 res!4436) b!1897))

(assert (= (and b!1897 res!4434) b!1898))

(assert (= start!186 b!1899))

(declare-fun m!543 () Bool)

(assert (=> b!1896 m!543))

(declare-fun m!545 () Bool)

(assert (=> b!1898 m!545))

(declare-fun m!547 () Bool)

(assert (=> b!1898 m!547))

(declare-fun m!549 () Bool)

(assert (=> b!1897 m!549))

(declare-fun m!551 () Bool)

(assert (=> start!186 m!551))

(declare-fun m!553 () Bool)

(assert (=> start!186 m!553))

(check-sat (not b!1899) (not b!1897) (not b!1898) (not b_next!33) (not start!186) (not b!1896) b_and!63)
(check-sat b_and!63 (not b_next!33))
(get-model)

(declare-fun d!187 () Bool)

(declare-fun isEmpty!22 (List!25) Bool)

(assert (=> d!187 (= (isEmpty!20 lm!258) (isEmpty!22 (toList!34 lm!258)))))

(declare-fun bs!51 () Bool)

(assert (= bs!51 d!187))

(declare-fun m!567 () Bool)

(assert (=> bs!51 m!567))

(assert (=> b!1896 d!187))

(declare-fun d!189 () Bool)

(declare-fun res!4464 () Bool)

(declare-fun e!424 () Bool)

(assert (=> d!189 (=> res!4464 e!424)))

(get-info :version)

(assert (=> d!189 (= res!4464 ((_ is Nil!22) (toList!34 (tail!33 lm!258))))))

(assert (=> d!189 (= (forall!18 (toList!34 (tail!33 lm!258)) p!318) e!424)))

(declare-fun b!1930 () Bool)

(declare-fun e!425 () Bool)

(assert (=> b!1930 (= e!424 e!425)))

(declare-fun res!4465 () Bool)

(assert (=> b!1930 (=> (not res!4465) (not e!425))))

(declare-fun dynLambda!10 (Int tuple2!32) Bool)

(assert (=> b!1930 (= res!4465 (dynLambda!10 p!318 (h!587 (toList!34 (tail!33 lm!258)))))))

(declare-fun b!1931 () Bool)

(assert (=> b!1931 (= e!425 (forall!18 (t!2050 (toList!34 (tail!33 lm!258))) p!318))))

(assert (= (and d!189 (not res!4464)) b!1930))

(assert (= (and b!1930 res!4465) b!1931))

(declare-fun b_lambda!67 () Bool)

(assert (=> (not b_lambda!67) (not b!1930)))

(declare-fun t!2059 () Bool)

(declare-fun tb!31 () Bool)

(assert (=> (and start!186 (= p!318 p!318) t!2059) tb!31))

(declare-fun result!49 () Bool)

(assert (=> tb!31 (= result!49 true)))

(assert (=> b!1930 t!2059))

(declare-fun b_and!73 () Bool)

(assert (= b_and!63 (and (=> t!2059 result!49) b_and!73)))

(declare-fun m!583 () Bool)

(assert (=> b!1930 m!583))

(declare-fun m!585 () Bool)

(assert (=> b!1931 m!585))

(assert (=> b!1898 d!189))

(declare-fun d!199 () Bool)

(declare-fun tail!36 (List!25) List!25)

(assert (=> d!199 (= (tail!33 lm!258) (ListLongMap!38 (tail!36 (toList!34 lm!258))))))

(declare-fun bs!55 () Bool)

(assert (= bs!55 d!199))

(declare-fun m!591 () Bool)

(assert (=> bs!55 m!591))

(assert (=> b!1898 d!199))

(declare-fun d!205 () Bool)

(declare-fun res!4468 () Bool)

(declare-fun e!428 () Bool)

(assert (=> d!205 (=> res!4468 e!428)))

(assert (=> d!205 (= res!4468 ((_ is Nil!22) (toList!34 lm!258)))))

(assert (=> d!205 (= (forall!18 (toList!34 lm!258) p!318) e!428)))

(declare-fun b!1934 () Bool)

(declare-fun e!429 () Bool)

(assert (=> b!1934 (= e!428 e!429)))

(declare-fun res!4469 () Bool)

(assert (=> b!1934 (=> (not res!4469) (not e!429))))

(assert (=> b!1934 (= res!4469 (dynLambda!10 p!318 (h!587 (toList!34 lm!258))))))

(declare-fun b!1935 () Bool)

(assert (=> b!1935 (= e!429 (forall!18 (t!2050 (toList!34 lm!258)) p!318))))

(assert (= (and d!205 (not res!4468)) b!1934))

(assert (= (and b!1934 res!4469) b!1935))

(declare-fun b_lambda!71 () Bool)

(assert (=> (not b_lambda!71) (not b!1934)))

(declare-fun t!2063 () Bool)

(declare-fun tb!35 () Bool)

(assert (=> (and start!186 (= p!318 p!318) t!2063) tb!35))

(declare-fun result!53 () Bool)

(assert (=> tb!35 (= result!53 true)))

(assert (=> b!1934 t!2063))

(declare-fun b_and!77 () Bool)

(assert (= b_and!73 (and (=> t!2063 result!53) b_and!77)))

(declare-fun m!597 () Bool)

(assert (=> b!1934 m!597))

(declare-fun m!599 () Bool)

(assert (=> b!1935 m!599))

(assert (=> start!186 d!205))

(declare-fun d!211 () Bool)

(declare-fun isStrictlySorted!9 (List!25) Bool)

(assert (=> d!211 (= (inv!56 lm!258) (isStrictlySorted!9 (toList!34 lm!258)))))

(declare-fun bs!58 () Bool)

(assert (= bs!58 d!211))

(declare-fun m!605 () Bool)

(assert (=> bs!58 m!605))

(assert (=> start!186 d!211))

(declare-fun d!215 () Bool)

(assert (=> d!215 (= (head!747 (toList!34 lm!258)) (h!587 (toList!34 lm!258)))))

(assert (=> b!1897 d!215))

(declare-fun b!1945 () Bool)

(declare-fun e!435 () Bool)

(declare-fun tp_is_empty!21 () Bool)

(declare-fun tp!125 () Bool)

(assert (=> b!1945 (= e!435 (and tp_is_empty!21 tp!125))))

(assert (=> b!1899 (= tp!113 e!435)))

(assert (= (and b!1899 ((_ is Cons!21) (toList!34 lm!258))) b!1945))

(declare-fun b_lambda!77 () Bool)

(assert (= b_lambda!71 (or (and start!186 b_free!33) b_lambda!77)))

(declare-fun b_lambda!79 () Bool)

(assert (= b_lambda!67 (or (and start!186 b_free!33) b_lambda!79)))

(check-sat tp_is_empty!21 (not b_lambda!77) (not d!199) (not b_lambda!79) (not b_next!33) (not b!1935) b_and!77 (not b!1931) (not b!1945) (not d!211) (not d!187))
(check-sat b_and!77 (not b_next!33))
(get-model)

(declare-fun d!221 () Bool)

(declare-fun res!4472 () Bool)

(declare-fun e!441 () Bool)

(assert (=> d!221 (=> res!4472 e!441)))

(assert (=> d!221 (= res!4472 ((_ is Nil!22) (t!2050 (toList!34 (tail!33 lm!258)))))))

(assert (=> d!221 (= (forall!18 (t!2050 (toList!34 (tail!33 lm!258))) p!318) e!441)))

(declare-fun b!1953 () Bool)

(declare-fun e!442 () Bool)

(assert (=> b!1953 (= e!441 e!442)))

(declare-fun res!4473 () Bool)

(assert (=> b!1953 (=> (not res!4473) (not e!442))))

(assert (=> b!1953 (= res!4473 (dynLambda!10 p!318 (h!587 (t!2050 (toList!34 (tail!33 lm!258))))))))

(declare-fun b!1954 () Bool)

(assert (=> b!1954 (= e!442 (forall!18 (t!2050 (t!2050 (toList!34 (tail!33 lm!258)))) p!318))))

(assert (= (and d!221 (not res!4472)) b!1953))

(assert (= (and b!1953 res!4473) b!1954))

(declare-fun b_lambda!86 () Bool)

(assert (=> (not b_lambda!86) (not b!1953)))

(declare-fun t!2065 () Bool)

(declare-fun tb!37 () Bool)

(assert (=> (and start!186 (= p!318 p!318) t!2065) tb!37))

(declare-fun result!61 () Bool)

(assert (=> tb!37 (= result!61 true)))

(assert (=> b!1953 t!2065))

(declare-fun b_and!79 () Bool)

(assert (= b_and!77 (and (=> t!2065 result!61) b_and!79)))

(declare-fun m!609 () Bool)

(assert (=> b!1953 m!609))

(declare-fun m!612 () Bool)

(assert (=> b!1954 m!612))

(assert (=> b!1931 d!221))

(declare-fun d!223 () Bool)

(declare-fun res!4484 () Bool)

(declare-fun e!453 () Bool)

(assert (=> d!223 (=> res!4484 e!453)))

(assert (=> d!223 (= res!4484 (or ((_ is Nil!22) (toList!34 lm!258)) ((_ is Nil!22) (t!2050 (toList!34 lm!258)))))))

(assert (=> d!223 (= (isStrictlySorted!9 (toList!34 lm!258)) e!453)))

(declare-fun b!1965 () Bool)

(declare-fun e!454 () Bool)

(assert (=> b!1965 (= e!453 e!454)))

(declare-fun res!4485 () Bool)

(assert (=> b!1965 (=> (not res!4485) (not e!454))))

(assert (=> b!1965 (= res!4485 (bvslt (_1!16 (h!587 (toList!34 lm!258))) (_1!16 (h!587 (t!2050 (toList!34 lm!258))))))))

(declare-fun b!1966 () Bool)

(assert (=> b!1966 (= e!454 (isStrictlySorted!9 (t!2050 (toList!34 lm!258))))))

(assert (= (and d!223 (not res!4484)) b!1965))

(assert (= (and b!1965 res!4485) b!1966))

(declare-fun m!619 () Bool)

(assert (=> b!1966 m!619))

(assert (=> d!211 d!223))

(declare-fun d!231 () Bool)

(declare-fun res!4488 () Bool)

(declare-fun e!457 () Bool)

(assert (=> d!231 (=> res!4488 e!457)))

(assert (=> d!231 (= res!4488 ((_ is Nil!22) (t!2050 (toList!34 lm!258))))))

(assert (=> d!231 (= (forall!18 (t!2050 (toList!34 lm!258)) p!318) e!457)))

(declare-fun b!1969 () Bool)

(declare-fun e!458 () Bool)

(assert (=> b!1969 (= e!457 e!458)))

(declare-fun res!4489 () Bool)

(assert (=> b!1969 (=> (not res!4489) (not e!458))))

(assert (=> b!1969 (= res!4489 (dynLambda!10 p!318 (h!587 (t!2050 (toList!34 lm!258)))))))

(declare-fun b!1970 () Bool)

(assert (=> b!1970 (= e!458 (forall!18 (t!2050 (t!2050 (toList!34 lm!258))) p!318))))

(assert (= (and d!231 (not res!4488)) b!1969))

(assert (= (and b!1969 res!4489) b!1970))

(declare-fun b_lambda!91 () Bool)

(assert (=> (not b_lambda!91) (not b!1969)))

(declare-fun t!2071 () Bool)

(declare-fun tb!43 () Bool)

(assert (=> (and start!186 (= p!318 p!318) t!2071) tb!43))

(declare-fun result!67 () Bool)

(assert (=> tb!43 (= result!67 true)))

(assert (=> b!1969 t!2071))

(declare-fun b_and!85 () Bool)

(assert (= b_and!79 (and (=> t!2071 result!67) b_and!85)))

(declare-fun m!625 () Bool)

(assert (=> b!1969 m!625))

(declare-fun m!627 () Bool)

(assert (=> b!1970 m!627))

(assert (=> b!1935 d!231))

(declare-fun d!235 () Bool)

(assert (=> d!235 (= (isEmpty!22 (toList!34 lm!258)) ((_ is Nil!22) (toList!34 lm!258)))))

(assert (=> d!187 d!235))

(declare-fun d!237 () Bool)

(assert (=> d!237 (= (tail!36 (toList!34 lm!258)) (t!2050 (toList!34 lm!258)))))

(assert (=> d!199 d!237))

(declare-fun b!1972 () Bool)

(declare-fun e!460 () Bool)

(declare-fun tp!130 () Bool)

(assert (=> b!1972 (= e!460 (and tp_is_empty!21 tp!130))))

(assert (=> b!1945 (= tp!125 e!460)))

(assert (= (and b!1945 ((_ is Cons!21) (t!2050 (toList!34 lm!258)))) b!1972))

(declare-fun b_lambda!97 () Bool)

(assert (= b_lambda!86 (or (and start!186 b_free!33) b_lambda!97)))

(declare-fun b_lambda!99 () Bool)

(assert (= b_lambda!91 (or (and start!186 b_free!33) b_lambda!99)))

(check-sat (not b!1966) (not b!1954) tp_is_empty!21 (not b!1970) b_and!85 (not b_lambda!99) (not b_lambda!77) (not b_lambda!79) (not b_next!33) (not b_lambda!97) (not b!1972))
(check-sat b_and!85 (not b_next!33))
