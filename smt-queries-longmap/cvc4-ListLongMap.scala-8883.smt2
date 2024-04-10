; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107862 () Bool)

(assert start!107862)

(declare-fun res!847486 () Bool)

(declare-fun e!727663 () Bool)

(assert (=> start!107862 (=> (not res!847486) (not e!727663))))

(declare-datatypes ((B!2172 0))(
  ( (B!2173 (val!16682 Int)) )
))
(declare-datatypes ((tuple2!21446 0))(
  ( (tuple2!21447 (_1!10734 (_ BitVec 64)) (_2!10734 B!2172)) )
))
(declare-datatypes ((List!28608 0))(
  ( (Nil!28605) (Cons!28604 (h!29813 tuple2!21446) (t!42141 List!28608)) )
))
(declare-fun l!595 () List!28608)

(declare-fun isStrictlySorted!860 (List!28608) Bool)

(assert (=> start!107862 (= res!847486 (isStrictlySorted!860 l!595))))

(assert (=> start!107862 e!727663))

(declare-fun e!727662 () Bool)

(assert (=> start!107862 e!727662))

(assert (=> start!107862 true))

(declare-fun b!1274930 () Bool)

(declare-fun e!727661 () Bool)

(declare-fun lt!575310 () List!28608)

(declare-fun key!173 () (_ BitVec 64))

(declare-fun containsKey!705 (List!28608 (_ BitVec 64)) Bool)

(assert (=> b!1274930 (= e!727661 (containsKey!705 lt!575310 key!173))))

(declare-fun b!1274931 () Bool)

(declare-fun tp_is_empty!33215 () Bool)

(declare-fun tp!98063 () Bool)

(assert (=> b!1274931 (= e!727662 (and tp_is_empty!33215 tp!98063))))

(declare-fun b!1274928 () Bool)

(declare-fun res!847484 () Bool)

(assert (=> b!1274928 (=> (not res!847484) (not e!727663))))

(assert (=> b!1274928 (= res!847484 (and (not (= (_1!10734 (h!29813 l!595)) key!173)) (is-Cons!28604 l!595)))))

(declare-fun b!1274929 () Bool)

(assert (=> b!1274929 (= e!727663 e!727661)))

(declare-fun res!847485 () Bool)

(assert (=> b!1274929 (=> res!847485 e!727661)))

(assert (=> b!1274929 (= res!847485 (not (isStrictlySorted!860 lt!575310)))))

(declare-fun $colon$colon!666 (List!28608 tuple2!21446) List!28608)

(declare-fun removeStrictlySorted!184 (List!28608 (_ BitVec 64)) List!28608)

(assert (=> b!1274929 (= lt!575310 ($colon$colon!666 (removeStrictlySorted!184 (t!42141 l!595) key!173) (h!29813 l!595)))))

(assert (= (and start!107862 res!847486) b!1274928))

(assert (= (and b!1274928 res!847484) b!1274929))

(assert (= (and b!1274929 (not res!847485)) b!1274930))

(assert (= (and start!107862 (is-Cons!28604 l!595)) b!1274931))

(declare-fun m!1171413 () Bool)

(assert (=> start!107862 m!1171413))

(declare-fun m!1171415 () Bool)

(assert (=> b!1274930 m!1171415))

(declare-fun m!1171417 () Bool)

(assert (=> b!1274929 m!1171417))

(declare-fun m!1171419 () Bool)

(assert (=> b!1274929 m!1171419))

(assert (=> b!1274929 m!1171419))

(declare-fun m!1171421 () Bool)

(assert (=> b!1274929 m!1171421))

(push 1)

(assert (not b!1274929))

(assert (not b!1274931))

(assert tp_is_empty!33215)

(assert (not b!1274930))

(assert (not start!107862))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!140245 () Bool)

(declare-fun res!847491 () Bool)

(declare-fun e!727668 () Bool)

(assert (=> d!140245 (=> res!847491 e!727668)))

(assert (=> d!140245 (= res!847491 (or (is-Nil!28605 lt!575310) (is-Nil!28605 (t!42141 lt!575310))))))

(assert (=> d!140245 (= (isStrictlySorted!860 lt!575310) e!727668)))

(declare-fun b!1274936 () Bool)

(declare-fun e!727669 () Bool)

(assert (=> b!1274936 (= e!727668 e!727669)))

(declare-fun res!847492 () Bool)

(assert (=> b!1274936 (=> (not res!847492) (not e!727669))))

(assert (=> b!1274936 (= res!847492 (bvslt (_1!10734 (h!29813 lt!575310)) (_1!10734 (h!29813 (t!42141 lt!575310)))))))

(declare-fun b!1274937 () Bool)

(assert (=> b!1274937 (= e!727669 (isStrictlySorted!860 (t!42141 lt!575310)))))

(assert (= (and d!140245 (not res!847491)) b!1274936))

(assert (= (and b!1274936 res!847492) b!1274937))

(declare-fun m!1171423 () Bool)

(assert (=> b!1274937 m!1171423))

(assert (=> b!1274929 d!140245))

(declare-fun d!140249 () Bool)

(assert (=> d!140249 (= ($colon$colon!666 (removeStrictlySorted!184 (t!42141 l!595) key!173) (h!29813 l!595)) (Cons!28604 (h!29813 l!595) (removeStrictlySorted!184 (t!42141 l!595) key!173)))))

(assert (=> b!1274929 d!140249))

(declare-fun b!1274966 () Bool)

(declare-fun e!727696 () List!28608)

(declare-fun e!727694 () List!28608)

(assert (=> b!1274966 (= e!727696 e!727694)))

(declare-fun c!123897 () Bool)

(assert (=> b!1274966 (= c!123897 (and (is-Cons!28604 (t!42141 l!595)) (not (= (_1!10734 (h!29813 (t!42141 l!595))) key!173))))))

(declare-fun b!1274967 () Bool)

(assert (=> b!1274967 (= e!727696 (t!42141 (t!42141 l!595)))))

(declare-fun b!1274968 () Bool)

(assert (=> b!1274968 (= e!727694 ($colon$colon!666 (removeStrictlySorted!184 (t!42141 (t!42141 l!595)) key!173) (h!29813 (t!42141 l!595))))))

(declare-fun d!140251 () Bool)

(declare-fun e!727695 () Bool)

(assert (=> d!140251 e!727695))

(declare-fun res!847513 () Bool)

(assert (=> d!140251 (=> (not res!847513) (not e!727695))))

(declare-fun lt!575313 () List!28608)

(assert (=> d!140251 (= res!847513 (isStrictlySorted!860 lt!575313))))

(assert (=> d!140251 (= lt!575313 e!727696)))

(declare-fun c!123896 () Bool)

(assert (=> d!140251 (= c!123896 (and (is-Cons!28604 (t!42141 l!595)) (= (_1!10734 (h!29813 (t!42141 l!595))) key!173)))))

(assert (=> d!140251 (isStrictlySorted!860 (t!42141 l!595))))

(assert (=> d!140251 (= (removeStrictlySorted!184 (t!42141 l!595) key!173) lt!575313)))

(declare-fun b!1274969 () Bool)

(assert (=> b!1274969 (= e!727694 Nil!28605)))

(declare-fun b!1274970 () Bool)

(assert (=> b!1274970 (= e!727695 (not (containsKey!705 lt!575313 key!173)))))

(assert (= (and d!140251 c!123896) b!1274967))

(assert (= (and d!140251 (not c!123896)) b!1274966))

(assert (= (and b!1274966 c!123897) b!1274968))

(assert (= (and b!1274966 (not c!123897)) b!1274969))

(assert (= (and d!140251 res!847513) b!1274970))

(declare-fun m!1171431 () Bool)

(assert (=> b!1274968 m!1171431))

(assert (=> b!1274968 m!1171431))

(declare-fun m!1171433 () Bool)

(assert (=> b!1274968 m!1171433))

(declare-fun m!1171435 () Bool)

(assert (=> d!140251 m!1171435))

(declare-fun m!1171437 () Bool)

(assert (=> d!140251 m!1171437))

(declare-fun m!1171439 () Bool)

(assert (=> b!1274970 m!1171439))

(assert (=> b!1274929 d!140251))

(declare-fun d!140263 () Bool)

(declare-fun res!847516 () Bool)

(declare-fun e!727699 () Bool)

(assert (=> d!140263 (=> res!847516 e!727699)))

(assert (=> d!140263 (= res!847516 (or (is-Nil!28605 l!595) (is-Nil!28605 (t!42141 l!595))))))

(assert (=> d!140263 (= (isStrictlySorted!860 l!595) e!727699)))

(declare-fun b!1274973 () Bool)

(declare-fun e!727700 () Bool)

(assert (=> b!1274973 (= e!727699 e!727700)))

(declare-fun res!847517 () Bool)

(assert (=> b!1274973 (=> (not res!847517) (not e!727700))))

(assert (=> b!1274973 (= res!847517 (bvslt (_1!10734 (h!29813 l!595)) (_1!10734 (h!29813 (t!42141 l!595)))))))

(declare-fun b!1274974 () Bool)

(assert (=> b!1274974 (= e!727700 (isStrictlySorted!860 (t!42141 l!595)))))

(assert (= (and d!140263 (not res!847516)) b!1274973))

(assert (= (and b!1274973 res!847517) b!1274974))

(assert (=> b!1274974 m!1171437))

(assert (=> start!107862 d!140263))

(declare-fun d!140265 () Bool)

(declare-fun res!847524 () Bool)

(declare-fun e!727711 () Bool)

(assert (=> d!140265 (=> res!847524 e!727711)))

(assert (=> d!140265 (= res!847524 (and (is-Cons!28604 lt!575310) (= (_1!10734 (h!29813 lt!575310)) key!173)))))

(assert (=> d!140265 (= (containsKey!705 lt!575310 key!173) e!727711)))

(declare-fun b!1274989 () Bool)

(declare-fun e!727712 () Bool)

(assert (=> b!1274989 (= e!727711 e!727712)))

(declare-fun res!847525 () Bool)

(assert (=> b!1274989 (=> (not res!847525) (not e!727712))))

(assert (=> b!1274989 (= res!847525 (and (or (not (is-Cons!28604 lt!575310)) (bvsle (_1!10734 (h!29813 lt!575310)) key!173)) (is-Cons!28604 lt!575310) (bvslt (_1!10734 (h!29813 lt!575310)) key!173)))))

(declare-fun b!1274990 () Bool)

(assert (=> b!1274990 (= e!727712 (containsKey!705 (t!42141 lt!575310) key!173))))

(assert (= (and d!140265 (not res!847524)) b!1274989))

(assert (= (and b!1274989 res!847525) b!1274990))

(declare-fun m!1171443 () Bool)

(assert (=> b!1274990 m!1171443))

(assert (=> b!1274930 d!140265))

(declare-fun b!1274995 () Bool)

(declare-fun e!727715 () Bool)

(declare-fun tp!98066 () Bool)

(assert (=> b!1274995 (= e!727715 (and tp_is_empty!33215 tp!98066))))

(assert (=> b!1274931 (= tp!98063 e!727715)))

(assert (= (and b!1274931 (is-Cons!28604 (t!42141 l!595))) b!1274995))

(push 1)

(assert (not b!1274937))

(assert (not b!1274974))

(assert (not b!1274968))

(assert (not d!140251))

(assert tp_is_empty!33215)

(assert (not b!1274990))

(assert (not b!1274995))

(assert (not b!1274970))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!140303 () Bool)

(declare-fun res!847560 () Bool)

(declare-fun e!727770 () Bool)

(assert (=> d!140303 (=> res!847560 e!727770)))

(assert (=> d!140303 (= res!847560 (or (is-Nil!28605 (t!42141 l!595)) (is-Nil!28605 (t!42141 (t!42141 l!595)))))))

(assert (=> d!140303 (= (isStrictlySorted!860 (t!42141 l!595)) e!727770)))

(declare-fun b!1275066 () Bool)

(declare-fun e!727771 () Bool)

(assert (=> b!1275066 (= e!727770 e!727771)))

(declare-fun res!847561 () Bool)

(assert (=> b!1275066 (=> (not res!847561) (not e!727771))))

(assert (=> b!1275066 (= res!847561 (bvslt (_1!10734 (h!29813 (t!42141 l!595))) (_1!10734 (h!29813 (t!42141 (t!42141 l!595))))))))

(declare-fun b!1275067 () Bool)

(assert (=> b!1275067 (= e!727771 (isStrictlySorted!860 (t!42141 (t!42141 l!595))))))

(assert (= (and d!140303 (not res!847560)) b!1275066))

(assert (= (and b!1275066 res!847561) b!1275067))

(declare-fun m!1171501 () Bool)

(assert (=> b!1275067 m!1171501))

(assert (=> b!1274974 d!140303))

(declare-fun d!140305 () Bool)

(assert (=> d!140305 (= ($colon$colon!666 (removeStrictlySorted!184 (t!42141 (t!42141 l!595)) key!173) (h!29813 (t!42141 l!595))) (Cons!28604 (h!29813 (t!42141 l!595)) (removeStrictlySorted!184 (t!42141 (t!42141 l!595)) key!173)))))

(assert (=> b!1274968 d!140305))

(declare-fun b!1275068 () Bool)

(declare-fun e!727774 () List!28608)

(declare-fun e!727772 () List!28608)

(assert (=> b!1275068 (= e!727774 e!727772)))

(declare-fun c!123915 () Bool)

(assert (=> b!1275068 (= c!123915 (and (is-Cons!28604 (t!42141 (t!42141 l!595))) (not (= (_1!10734 (h!29813 (t!42141 (t!42141 l!595)))) key!173))))))

(declare-fun b!1275069 () Bool)

(assert (=> b!1275069 (= e!727774 (t!42141 (t!42141 (t!42141 l!595))))))

(declare-fun b!1275070 () Bool)

(assert (=> b!1275070 (= e!727772 ($colon$colon!666 (removeStrictlySorted!184 (t!42141 (t!42141 (t!42141 l!595))) key!173) (h!29813 (t!42141 (t!42141 l!595)))))))

(declare-fun d!140307 () Bool)

(declare-fun e!727773 () Bool)

(assert (=> d!140307 e!727773))

(declare-fun res!847562 () Bool)

(assert (=> d!140307 (=> (not res!847562) (not e!727773))))

(declare-fun lt!575322 () List!28608)

(assert (=> d!140307 (= res!847562 (isStrictlySorted!860 lt!575322))))

(assert (=> d!140307 (= lt!575322 e!727774)))

(declare-fun c!123914 () Bool)

(assert (=> d!140307 (= c!123914 (and (is-Cons!28604 (t!42141 (t!42141 l!595))) (= (_1!10734 (h!29813 (t!42141 (t!42141 l!595)))) key!173)))))

(assert (=> d!140307 (isStrictlySorted!860 (t!42141 (t!42141 l!595)))))

(assert (=> d!140307 (= (removeStrictlySorted!184 (t!42141 (t!42141 l!595)) key!173) lt!575322)))

(declare-fun b!1275071 () Bool)

(assert (=> b!1275071 (= e!727772 Nil!28605)))

(declare-fun b!1275072 () Bool)

(assert (=> b!1275072 (= e!727773 (not (containsKey!705 lt!575322 key!173)))))

(assert (= (and d!140307 c!123914) b!1275069))

(assert (= (and d!140307 (not c!123914)) b!1275068))

(assert (= (and b!1275068 c!123915) b!1275070))

(assert (= (and b!1275068 (not c!123915)) b!1275071))

(assert (= (and d!140307 res!847562) b!1275072))

(declare-fun m!1171503 () Bool)

(assert (=> b!1275070 m!1171503))

(assert (=> b!1275070 m!1171503))

(declare-fun m!1171505 () Bool)

(assert (=> b!1275070 m!1171505))

(declare-fun m!1171507 () Bool)

(assert (=> d!140307 m!1171507))

(assert (=> d!140307 m!1171501))

(declare-fun m!1171509 () Bool)

(assert (=> b!1275072 m!1171509))

(assert (=> b!1274968 d!140307))

(declare-fun d!140309 () Bool)

(declare-fun res!847563 () Bool)

(declare-fun e!727775 () Bool)

(assert (=> d!140309 (=> res!847563 e!727775)))

(assert (=> d!140309 (= res!847563 (or (is-Nil!28605 lt!575313) (is-Nil!28605 (t!42141 lt!575313))))))

(assert (=> d!140309 (= (isStrictlySorted!860 lt!575313) e!727775)))

(declare-fun b!1275073 () Bool)

(declare-fun e!727776 () Bool)

(assert (=> b!1275073 (= e!727775 e!727776)))

(declare-fun res!847564 () Bool)

(assert (=> b!1275073 (=> (not res!847564) (not e!727776))))

(assert (=> b!1275073 (= res!847564 (bvslt (_1!10734 (h!29813 lt!575313)) (_1!10734 (h!29813 (t!42141 lt!575313)))))))

(declare-fun b!1275074 () Bool)

(assert (=> b!1275074 (= e!727776 (isStrictlySorted!860 (t!42141 lt!575313)))))

(assert (= (and d!140309 (not res!847563)) b!1275073))

(assert (= (and b!1275073 res!847564) b!1275074))

(declare-fun m!1171511 () Bool)

(assert (=> b!1275074 m!1171511))

(assert (=> d!140251 d!140309))

(assert (=> d!140251 d!140303))

(declare-fun d!140311 () Bool)

(declare-fun res!847565 () Bool)

(declare-fun e!727777 () Bool)

(assert (=> d!140311 (=> res!847565 e!727777)))

(assert (=> d!140311 (= res!847565 (and (is-Cons!28604 lt!575313) (= (_1!10734 (h!29813 lt!575313)) key!173)))))

(assert (=> d!140311 (= (containsKey!705 lt!575313 key!173) e!727777)))

(declare-fun b!1275075 () Bool)

(declare-fun e!727778 () Bool)

(assert (=> b!1275075 (= e!727777 e!727778)))

(declare-fun res!847566 () Bool)

(assert (=> b!1275075 (=> (not res!847566) (not e!727778))))

(assert (=> b!1275075 (= res!847566 (and (or (not (is-Cons!28604 lt!575313)) (bvsle (_1!10734 (h!29813 lt!575313)) key!173)) (is-Cons!28604 lt!575313) (bvslt (_1!10734 (h!29813 lt!575313)) key!173)))))

(declare-fun b!1275076 () Bool)

(assert (=> b!1275076 (= e!727778 (containsKey!705 (t!42141 lt!575313) key!173))))

(assert (= (and d!140311 (not res!847565)) b!1275075))

(assert (= (and b!1275075 res!847566) b!1275076))

(declare-fun m!1171513 () Bool)

(assert (=> b!1275076 m!1171513))

(assert (=> b!1274970 d!140311))

(declare-fun d!140313 () Bool)

(declare-fun res!847567 () Bool)

(declare-fun e!727779 () Bool)

(assert (=> d!140313 (=> res!847567 e!727779)))

(assert (=> d!140313 (= res!847567 (or (is-Nil!28605 (t!42141 lt!575310)) (is-Nil!28605 (t!42141 (t!42141 lt!575310)))))))

(assert (=> d!140313 (= (isStrictlySorted!860 (t!42141 lt!575310)) e!727779)))

(declare-fun b!1275077 () Bool)

(declare-fun e!727780 () Bool)

(assert (=> b!1275077 (= e!727779 e!727780)))

(declare-fun res!847568 () Bool)

(assert (=> b!1275077 (=> (not res!847568) (not e!727780))))

(assert (=> b!1275077 (= res!847568 (bvslt (_1!10734 (h!29813 (t!42141 lt!575310))) (_1!10734 (h!29813 (t!42141 (t!42141 lt!575310))))))))

(declare-fun b!1275078 () Bool)

(assert (=> b!1275078 (= e!727780 (isStrictlySorted!860 (t!42141 (t!42141 lt!575310))))))

(assert (= (and d!140313 (not res!847567)) b!1275077))

(assert (= (and b!1275077 res!847568) b!1275078))

(declare-fun m!1171515 () Bool)

(assert (=> b!1275078 m!1171515))

(assert (=> b!1274937 d!140313))

(declare-fun d!140315 () Bool)

(declare-fun res!847569 () Bool)

(declare-fun e!727781 () Bool)

(assert (=> d!140315 (=> res!847569 e!727781)))

(assert (=> d!140315 (= res!847569 (and (is-Cons!28604 (t!42141 lt!575310)) (= (_1!10734 (h!29813 (t!42141 lt!575310))) key!173)))))

(assert (=> d!140315 (= (containsKey!705 (t!42141 lt!575310) key!173) e!727781)))

(declare-fun b!1275079 () Bool)

(declare-fun e!727782 () Bool)

(assert (=> b!1275079 (= e!727781 e!727782)))

(declare-fun res!847570 () Bool)

(assert (=> b!1275079 (=> (not res!847570) (not e!727782))))

(assert (=> b!1275079 (= res!847570 (and (or (not (is-Cons!28604 (t!42141 lt!575310))) (bvsle (_1!10734 (h!29813 (t!42141 lt!575310))) key!173)) (is-Cons!28604 (t!42141 lt!575310)) (bvslt (_1!10734 (h!29813 (t!42141 lt!575310))) key!173)))))

(declare-fun b!1275080 () Bool)

(assert (=> b!1275080 (= e!727782 (containsKey!705 (t!42141 (t!42141 lt!575310)) key!173))))

(assert (= (and d!140315 (not res!847569)) b!1275079))

(assert (= (and b!1275079 res!847570) b!1275080))

(declare-fun m!1171517 () Bool)

(assert (=> b!1275080 m!1171517))

(assert (=> b!1274990 d!140315))

(declare-fun b!1275081 () Bool)

(declare-fun e!727783 () Bool)

(declare-fun tp!98075 () Bool)

(assert (=> b!1275081 (= e!727783 (and tp_is_empty!33215 tp!98075))))

(assert (=> b!1274995 (= tp!98066 e!727783)))

(assert (= (and b!1274995 (is-Cons!28604 (t!42141 (t!42141 l!595)))) b!1275081))

(push 1)

(assert (not d!140307))

(assert (not b!1275072))

(assert (not b!1275081))

(assert (not b!1275076))

(assert (not b!1275074))

(assert tp_is_empty!33215)

(assert (not b!1275070))

(assert (not b!1275080))

(assert (not b!1275078))

(assert (not b!1275067))

(check-sat)

