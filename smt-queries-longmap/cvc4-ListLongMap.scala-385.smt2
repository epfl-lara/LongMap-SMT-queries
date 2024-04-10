; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7262 () Bool)

(assert start!7262)

(declare-fun b!46452 () Bool)

(declare-fun res!27139 () Bool)

(declare-fun e!29606 () Bool)

(assert (=> b!46452 (=> (not res!27139) (not e!29606))))

(declare-datatypes ((B!894 0))(
  ( (B!895 (val!1034 Int)) )
))
(declare-datatypes ((tuple2!1716 0))(
  ( (tuple2!1717 (_1!869 (_ BitVec 64)) (_2!869 B!894)) )
))
(declare-datatypes ((List!1252 0))(
  ( (Nil!1249) (Cons!1248 (h!1828 tuple2!1716) (t!4277 List!1252)) )
))
(declare-fun l!812 () List!1252)

(assert (=> b!46452 (= res!27139 (is-Cons!1248 l!812))))

(declare-fun b!46453 () Bool)

(declare-fun res!27141 () Bool)

(assert (=> b!46453 (=> (not res!27141) (not e!29606))))

(declare-fun isStrictlySorted!243 (List!1252) Bool)

(assert (=> b!46453 (= res!27141 (isStrictlySorted!243 (t!4277 l!812)))))

(declare-fun key1!43 () (_ BitVec 64))

(declare-fun b!46454 () Bool)

(declare-fun key2!27 () (_ BitVec 64))

(declare-fun removeStrictlySorted!44 (List!1252 (_ BitVec 64)) List!1252)

(assert (=> b!46454 (= e!29606 (not (= (removeStrictlySorted!44 (removeStrictlySorted!44 l!812 key1!43) key2!27) (removeStrictlySorted!44 (removeStrictlySorted!44 l!812 key2!27) key1!43))))))

(assert (=> b!46454 (= (removeStrictlySorted!44 (removeStrictlySorted!44 (t!4277 l!812) key1!43) key2!27) (removeStrictlySorted!44 (removeStrictlySorted!44 (t!4277 l!812) key2!27) key1!43))))

(declare-datatypes ((Unit!1325 0))(
  ( (Unit!1326) )
))
(declare-fun lt!20305 () Unit!1325)

(declare-fun lemmaRemoveStrictlySortedCommutative!18 (List!1252 (_ BitVec 64) (_ BitVec 64)) Unit!1325)

(assert (=> b!46454 (= lt!20305 (lemmaRemoveStrictlySortedCommutative!18 (t!4277 l!812) key1!43 key2!27))))

(declare-fun res!27140 () Bool)

(assert (=> start!7262 (=> (not res!27140) (not e!29606))))

(assert (=> start!7262 (= res!27140 (isStrictlySorted!243 l!812))))

(assert (=> start!7262 e!29606))

(declare-fun e!29605 () Bool)

(assert (=> start!7262 e!29605))

(assert (=> start!7262 true))

(declare-fun b!46455 () Bool)

(declare-fun tp_is_empty!1991 () Bool)

(declare-fun tp!6143 () Bool)

(assert (=> b!46455 (= e!29605 (and tp_is_empty!1991 tp!6143))))

(assert (= (and start!7262 res!27140) b!46452))

(assert (= (and b!46452 res!27139) b!46453))

(assert (= (and b!46453 res!27141) b!46454))

(assert (= (and start!7262 (is-Cons!1248 l!812)) b!46455))

(declare-fun m!40757 () Bool)

(assert (=> b!46453 m!40757))

(declare-fun m!40759 () Bool)

(assert (=> b!46454 m!40759))

(declare-fun m!40761 () Bool)

(assert (=> b!46454 m!40761))

(declare-fun m!40763 () Bool)

(assert (=> b!46454 m!40763))

(assert (=> b!46454 m!40761))

(declare-fun m!40765 () Bool)

(assert (=> b!46454 m!40765))

(declare-fun m!40767 () Bool)

(assert (=> b!46454 m!40767))

(declare-fun m!40769 () Bool)

(assert (=> b!46454 m!40769))

(assert (=> b!46454 m!40759))

(declare-fun m!40771 () Bool)

(assert (=> b!46454 m!40771))

(declare-fun m!40773 () Bool)

(assert (=> b!46454 m!40773))

(assert (=> b!46454 m!40769))

(declare-fun m!40775 () Bool)

(assert (=> b!46454 m!40775))

(assert (=> b!46454 m!40765))

(declare-fun m!40777 () Bool)

(assert (=> start!7262 m!40777))

(push 1)

(assert (not b!46455))

(assert (not b!46454))

(assert tp_is_empty!1991)

(assert (not start!7262))

(assert (not b!46453))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9095 () Bool)

(declare-fun res!27159 () Bool)

(declare-fun e!29634 () Bool)

(assert (=> d!9095 (=> res!27159 e!29634)))

(assert (=> d!9095 (= res!27159 (or (is-Nil!1249 (t!4277 l!812)) (is-Nil!1249 (t!4277 (t!4277 l!812)))))))

(assert (=> d!9095 (= (isStrictlySorted!243 (t!4277 l!812)) e!29634)))

(declare-fun b!46493 () Bool)

(declare-fun e!29635 () Bool)

(assert (=> b!46493 (= e!29634 e!29635)))

(declare-fun res!27160 () Bool)

(assert (=> b!46493 (=> (not res!27160) (not e!29635))))

(assert (=> b!46493 (= res!27160 (bvslt (_1!869 (h!1828 (t!4277 l!812))) (_1!869 (h!1828 (t!4277 (t!4277 l!812))))))))

(declare-fun b!46494 () Bool)

(assert (=> b!46494 (= e!29635 (isStrictlySorted!243 (t!4277 (t!4277 l!812))))))

(assert (= (and d!9095 (not res!27159)) b!46493))

(assert (= (and b!46493 res!27160) b!46494))

(declare-fun m!40803 () Bool)

(assert (=> b!46494 m!40803))

(assert (=> b!46453 d!9095))

(declare-fun d!9105 () Bool)

(declare-fun e!29675 () Bool)

(assert (=> d!9105 e!29675))

(declare-fun res!27173 () Bool)

(assert (=> d!9105 (=> (not res!27173) (not e!29675))))

(declare-fun lt!20326 () List!1252)

(assert (=> d!9105 (= res!27173 (isStrictlySorted!243 lt!20326))))

(declare-fun e!29677 () List!1252)

(assert (=> d!9105 (= lt!20326 e!29677)))

(declare-fun c!6300 () Bool)

(assert (=> d!9105 (= c!6300 (and (is-Cons!1248 (removeStrictlySorted!44 l!812 key2!27)) (= (_1!869 (h!1828 (removeStrictlySorted!44 l!812 key2!27))) key1!43)))))

(assert (=> d!9105 (isStrictlySorted!243 (removeStrictlySorted!44 l!812 key2!27))))

(assert (=> d!9105 (= (removeStrictlySorted!44 (removeStrictlySorted!44 l!812 key2!27) key1!43) lt!20326)))

(declare-fun b!46560 () Bool)

(assert (=> b!46560 (= e!29677 (t!4277 (removeStrictlySorted!44 l!812 key2!27)))))

(declare-fun e!29676 () List!1252)

(declare-fun b!46561 () Bool)

(declare-fun $colon$colon!46 (List!1252 tuple2!1716) List!1252)

(assert (=> b!46561 (= e!29676 ($colon$colon!46 (removeStrictlySorted!44 (t!4277 (removeStrictlySorted!44 l!812 key2!27)) key1!43) (h!1828 (removeStrictlySorted!44 l!812 key2!27))))))

(declare-fun b!46562 () Bool)

(assert (=> b!46562 (= e!29677 e!29676)))

(declare-fun c!6299 () Bool)

(assert (=> b!46562 (= c!6299 (and (is-Cons!1248 (removeStrictlySorted!44 l!812 key2!27)) (not (= (_1!869 (h!1828 (removeStrictlySorted!44 l!812 key2!27))) key1!43))))))

(declare-fun b!46563 () Bool)

(declare-fun containsKey!92 (List!1252 (_ BitVec 64)) Bool)

(assert (=> b!46563 (= e!29675 (not (containsKey!92 lt!20326 key1!43)))))

(declare-fun b!46564 () Bool)

(assert (=> b!46564 (= e!29676 Nil!1249)))

(assert (= (and d!9105 c!6300) b!46560))

(assert (= (and d!9105 (not c!6300)) b!46562))

(assert (= (and b!46562 c!6299) b!46561))

(assert (= (and b!46562 (not c!6299)) b!46564))

(assert (= (and d!9105 res!27173) b!46563))

(declare-fun m!40875 () Bool)

(assert (=> d!9105 m!40875))

(assert (=> d!9105 m!40761))

(declare-fun m!40877 () Bool)

(assert (=> d!9105 m!40877))

(declare-fun m!40879 () Bool)

(assert (=> b!46561 m!40879))

(assert (=> b!46561 m!40879))

(declare-fun m!40881 () Bool)

(assert (=> b!46561 m!40881))

(declare-fun m!40883 () Bool)

(assert (=> b!46563 m!40883))

(assert (=> b!46454 d!9105))

(declare-fun d!9123 () Bool)

(declare-fun e!29678 () Bool)

(assert (=> d!9123 e!29678))

(declare-fun res!27174 () Bool)

(assert (=> d!9123 (=> (not res!27174) (not e!29678))))

(declare-fun lt!20327 () List!1252)

(assert (=> d!9123 (= res!27174 (isStrictlySorted!243 lt!20327))))

(declare-fun e!29680 () List!1252)

(assert (=> d!9123 (= lt!20327 e!29680)))

(declare-fun c!6302 () Bool)

(assert (=> d!9123 (= c!6302 (and (is-Cons!1248 l!812) (= (_1!869 (h!1828 l!812)) key1!43)))))

(assert (=> d!9123 (isStrictlySorted!243 l!812)))

(assert (=> d!9123 (= (removeStrictlySorted!44 l!812 key1!43) lt!20327)))

(declare-fun b!46565 () Bool)

(assert (=> b!46565 (= e!29680 (t!4277 l!812))))

(declare-fun b!46566 () Bool)

(declare-fun e!29679 () List!1252)

(assert (=> b!46566 (= e!29679 ($colon$colon!46 (removeStrictlySorted!44 (t!4277 l!812) key1!43) (h!1828 l!812)))))

(declare-fun b!46567 () Bool)

(assert (=> b!46567 (= e!29680 e!29679)))

(declare-fun c!6301 () Bool)

(assert (=> b!46567 (= c!6301 (and (is-Cons!1248 l!812) (not (= (_1!869 (h!1828 l!812)) key1!43))))))

(declare-fun b!46568 () Bool)

(assert (=> b!46568 (= e!29678 (not (containsKey!92 lt!20327 key1!43)))))

(declare-fun b!46569 () Bool)

(assert (=> b!46569 (= e!29679 Nil!1249)))

(assert (= (and d!9123 c!6302) b!46565))

(assert (= (and d!9123 (not c!6302)) b!46567))

(assert (= (and b!46567 c!6301) b!46566))

(assert (= (and b!46567 (not c!6301)) b!46569))

(assert (= (and d!9123 res!27174) b!46568))

(declare-fun m!40885 () Bool)

(assert (=> d!9123 m!40885))

(assert (=> d!9123 m!40777))

(assert (=> b!46566 m!40765))

(assert (=> b!46566 m!40765))

(declare-fun m!40887 () Bool)

(assert (=> b!46566 m!40887))

(declare-fun m!40889 () Bool)

(assert (=> b!46568 m!40889))

(assert (=> b!46454 d!9123))

(declare-fun d!9125 () Bool)

(declare-fun e!29681 () Bool)

(assert (=> d!9125 e!29681))

(declare-fun res!27175 () Bool)

(assert (=> d!9125 (=> (not res!27175) (not e!29681))))

(declare-fun lt!20330 () List!1252)

(assert (=> d!9125 (= res!27175 (isStrictlySorted!243 lt!20330))))

(declare-fun e!29683 () List!1252)

(assert (=> d!9125 (= lt!20330 e!29683)))

(declare-fun c!6304 () Bool)

(assert (=> d!9125 (= c!6304 (and (is-Cons!1248 l!812) (= (_1!869 (h!1828 l!812)) key2!27)))))

(assert (=> d!9125 (isStrictlySorted!243 l!812)))

(assert (=> d!9125 (= (removeStrictlySorted!44 l!812 key2!27) lt!20330)))

(declare-fun b!46570 () Bool)

(assert (=> b!46570 (= e!29683 (t!4277 l!812))))

(declare-fun b!46571 () Bool)

(declare-fun e!29682 () List!1252)

(assert (=> b!46571 (= e!29682 ($colon$colon!46 (removeStrictlySorted!44 (t!4277 l!812) key2!27) (h!1828 l!812)))))

(declare-fun b!46572 () Bool)

(assert (=> b!46572 (= e!29683 e!29682)))

(declare-fun c!6303 () Bool)

(assert (=> b!46572 (= c!6303 (and (is-Cons!1248 l!812) (not (= (_1!869 (h!1828 l!812)) key2!27))))))

(declare-fun b!46573 () Bool)

(assert (=> b!46573 (= e!29681 (not (containsKey!92 lt!20330 key2!27)))))

(declare-fun b!46574 () Bool)

(assert (=> b!46574 (= e!29682 Nil!1249)))

(assert (= (and d!9125 c!6304) b!46570))

(assert (= (and d!9125 (not c!6304)) b!46572))

(assert (= (and b!46572 c!6303) b!46571))

(assert (= (and b!46572 (not c!6303)) b!46574))

(assert (= (and d!9125 res!27175) b!46573))

(declare-fun m!40891 () Bool)

(assert (=> d!9125 m!40891))

(assert (=> d!9125 m!40777))

(assert (=> b!46571 m!40759))

(assert (=> b!46571 m!40759))

(declare-fun m!40893 () Bool)

(assert (=> b!46571 m!40893))

(declare-fun m!40895 () Bool)

(assert (=> b!46573 m!40895))

(assert (=> b!46454 d!9125))

(declare-fun d!9127 () Bool)

(assert (=> d!9127 (= (removeStrictlySorted!44 (removeStrictlySorted!44 (t!4277 l!812) key1!43) key2!27) (removeStrictlySorted!44 (removeStrictlySorted!44 (t!4277 l!812) key2!27) key1!43))))

(declare-fun lt!20337 () Unit!1325)

(declare-fun choose!279 (List!1252 (_ BitVec 64) (_ BitVec 64)) Unit!1325)

(assert (=> d!9127 (= lt!20337 (choose!279 (t!4277 l!812) key1!43 key2!27))))

(assert (=> d!9127 (isStrictlySorted!243 (t!4277 l!812))))

(assert (=> d!9127 (= (lemmaRemoveStrictlySortedCommutative!18 (t!4277 l!812) key1!43 key2!27) lt!20337)))

(declare-fun bs!2184 () Bool)

(assert (= bs!2184 d!9127))

(assert (=> bs!2184 m!40757))

(assert (=> bs!2184 m!40759))

(assert (=> bs!2184 m!40771))

(declare-fun m!40927 () Bool)

(assert (=> bs!2184 m!40927))

(assert (=> bs!2184 m!40765))

(assert (=> bs!2184 m!40767))

(assert (=> bs!2184 m!40759))

(assert (=> bs!2184 m!40765))

(assert (=> b!46454 d!9127))

(declare-fun d!9137 () Bool)

(declare-fun e!29696 () Bool)

(assert (=> d!9137 e!29696))

(declare-fun res!27180 () Bool)

(assert (=> d!9137 (=> (not res!27180) (not e!29696))))

(declare-fun lt!20339 () List!1252)

(assert (=> d!9137 (= res!27180 (isStrictlySorted!243 lt!20339))))

(declare-fun e!29698 () List!1252)

(assert (=> d!9137 (= lt!20339 e!29698)))

(declare-fun c!6314 () Bool)

(assert (=> d!9137 (= c!6314 (and (is-Cons!1248 (removeStrictlySorted!44 (t!4277 l!812) key1!43)) (= (_1!869 (h!1828 (removeStrictlySorted!44 (t!4277 l!812) key1!43))) key2!27)))))

(assert (=> d!9137 (isStrictlySorted!243 (removeStrictlySorted!44 (t!4277 l!812) key1!43))))

(assert (=> d!9137 (= (removeStrictlySorted!44 (removeStrictlySorted!44 (t!4277 l!812) key1!43) key2!27) lt!20339)))

(declare-fun b!46595 () Bool)

(assert (=> b!46595 (= e!29698 (t!4277 (removeStrictlySorted!44 (t!4277 l!812) key1!43)))))

(declare-fun b!46596 () Bool)

(declare-fun e!29697 () List!1252)

(assert (=> b!46596 (= e!29697 ($colon$colon!46 (removeStrictlySorted!44 (t!4277 (removeStrictlySorted!44 (t!4277 l!812) key1!43)) key2!27) (h!1828 (removeStrictlySorted!44 (t!4277 l!812) key1!43))))))

(declare-fun b!46597 () Bool)

(assert (=> b!46597 (= e!29698 e!29697)))

(declare-fun c!6313 () Bool)

(assert (=> b!46597 (= c!6313 (and (is-Cons!1248 (removeStrictlySorted!44 (t!4277 l!812) key1!43)) (not (= (_1!869 (h!1828 (removeStrictlySorted!44 (t!4277 l!812) key1!43))) key2!27))))))

(declare-fun b!46598 () Bool)

(assert (=> b!46598 (= e!29696 (not (containsKey!92 lt!20339 key2!27)))))

(declare-fun b!46599 () Bool)

(assert (=> b!46599 (= e!29697 Nil!1249)))

(assert (= (and d!9137 c!6314) b!46595))

(assert (= (and d!9137 (not c!6314)) b!46597))

(assert (= (and b!46597 c!6313) b!46596))

(assert (= (and b!46597 (not c!6313)) b!46599))

(assert (= (and d!9137 res!27180) b!46598))

(declare-fun m!40937 () Bool)

(assert (=> d!9137 m!40937))

(assert (=> d!9137 m!40765))

(declare-fun m!40939 () Bool)

(assert (=> d!9137 m!40939))

(declare-fun m!40941 () Bool)

(assert (=> b!46596 m!40941))

(assert (=> b!46596 m!40941))

(declare-fun m!40943 () Bool)

(assert (=> b!46596 m!40943))

(declare-fun m!40945 () Bool)

(assert (=> b!46598 m!40945))

(assert (=> b!46454 d!9137))

(declare-fun d!9141 () Bool)

(declare-fun e!29702 () Bool)

(assert (=> d!9141 e!29702))

(declare-fun res!27182 () Bool)

(assert (=> d!9141 (=> (not res!27182) (not e!29702))))

(declare-fun lt!20341 () List!1252)

(assert (=> d!9141 (= res!27182 (isStrictlySorted!243 lt!20341))))

(declare-fun e!29704 () List!1252)

(assert (=> d!9141 (= lt!20341 e!29704)))

(declare-fun c!6318 () Bool)

(assert (=> d!9141 (= c!6318 (and (is-Cons!1248 (t!4277 l!812)) (= (_1!869 (h!1828 (t!4277 l!812))) key1!43)))))

(assert (=> d!9141 (isStrictlySorted!243 (t!4277 l!812))))

(assert (=> d!9141 (= (removeStrictlySorted!44 (t!4277 l!812) key1!43) lt!20341)))

(declare-fun b!46605 () Bool)

(assert (=> b!46605 (= e!29704 (t!4277 (t!4277 l!812)))))

(declare-fun b!46606 () Bool)

(declare-fun e!29703 () List!1252)

(assert (=> b!46606 (= e!29703 ($colon$colon!46 (removeStrictlySorted!44 (t!4277 (t!4277 l!812)) key1!43) (h!1828 (t!4277 l!812))))))

(declare-fun b!46607 () Bool)

(assert (=> b!46607 (= e!29704 e!29703)))

(declare-fun c!6317 () Bool)

(assert (=> b!46607 (= c!6317 (and (is-Cons!1248 (t!4277 l!812)) (not (= (_1!869 (h!1828 (t!4277 l!812))) key1!43))))))

(declare-fun b!46608 () Bool)

(assert (=> b!46608 (= e!29702 (not (containsKey!92 lt!20341 key1!43)))))

(declare-fun b!46609 () Bool)

(assert (=> b!46609 (= e!29703 Nil!1249)))

(assert (= (and d!9141 c!6318) b!46605))

(assert (= (and d!9141 (not c!6318)) b!46607))

(assert (= (and b!46607 c!6317) b!46606))

(assert (= (and b!46607 (not c!6317)) b!46609))

(assert (= (and d!9141 res!27182) b!46608))

(declare-fun m!40957 () Bool)

(assert (=> d!9141 m!40957))

(assert (=> d!9141 m!40757))

(declare-fun m!40959 () Bool)

(assert (=> b!46606 m!40959))

(assert (=> b!46606 m!40959))

(declare-fun m!40961 () Bool)

(assert (=> b!46606 m!40961))

(declare-fun m!40963 () Bool)

(assert (=> b!46608 m!40963))

(assert (=> b!46454 d!9141))

(declare-fun d!9145 () Bool)

(declare-fun e!29705 () Bool)

(assert (=> d!9145 e!29705))

(declare-fun res!27183 () Bool)

(assert (=> d!9145 (=> (not res!27183) (not e!29705))))

(declare-fun lt!20342 () List!1252)

(assert (=> d!9145 (= res!27183 (isStrictlySorted!243 lt!20342))))

(declare-fun e!29707 () List!1252)

(assert (=> d!9145 (= lt!20342 e!29707)))

(declare-fun c!6320 () Bool)

(assert (=> d!9145 (= c!6320 (and (is-Cons!1248 (removeStrictlySorted!44 (t!4277 l!812) key2!27)) (= (_1!869 (h!1828 (removeStrictlySorted!44 (t!4277 l!812) key2!27))) key1!43)))))

(assert (=> d!9145 (isStrictlySorted!243 (removeStrictlySorted!44 (t!4277 l!812) key2!27))))

(assert (=> d!9145 (= (removeStrictlySorted!44 (removeStrictlySorted!44 (t!4277 l!812) key2!27) key1!43) lt!20342)))

(declare-fun b!46610 () Bool)

(assert (=> b!46610 (= e!29707 (t!4277 (removeStrictlySorted!44 (t!4277 l!812) key2!27)))))

(declare-fun e!29706 () List!1252)

(declare-fun b!46611 () Bool)

(assert (=> b!46611 (= e!29706 ($colon$colon!46 (removeStrictlySorted!44 (t!4277 (removeStrictlySorted!44 (t!4277 l!812) key2!27)) key1!43) (h!1828 (removeStrictlySorted!44 (t!4277 l!812) key2!27))))))

(declare-fun b!46612 () Bool)

(assert (=> b!46612 (= e!29707 e!29706)))

(declare-fun c!6319 () Bool)

(assert (=> b!46612 (= c!6319 (and (is-Cons!1248 (removeStrictlySorted!44 (t!4277 l!812) key2!27)) (not (= (_1!869 (h!1828 (removeStrictlySorted!44 (t!4277 l!812) key2!27))) key1!43))))))

(declare-fun b!46613 () Bool)

(assert (=> b!46613 (= e!29705 (not (containsKey!92 lt!20342 key1!43)))))

(declare-fun b!46614 () Bool)

(assert (=> b!46614 (= e!29706 Nil!1249)))

(assert (= (and d!9145 c!6320) b!46610))

(assert (= (and d!9145 (not c!6320)) b!46612))

(assert (= (and b!46612 c!6319) b!46611))

(assert (= (and b!46612 (not c!6319)) b!46614))

(assert (= (and d!9145 res!27183) b!46613))

(declare-fun m!40965 () Bool)

(assert (=> d!9145 m!40965))

(assert (=> d!9145 m!40759))

(declare-fun m!40967 () Bool)

(assert (=> d!9145 m!40967))

(declare-fun m!40969 () Bool)

(assert (=> b!46611 m!40969))

(assert (=> b!46611 m!40969))

(declare-fun m!40971 () Bool)

(assert (=> b!46611 m!40971))

(declare-fun m!40973 () Bool)

(assert (=> b!46613 m!40973))

(assert (=> b!46454 d!9145))

(declare-fun d!9147 () Bool)

(declare-fun e!29708 () Bool)

(assert (=> d!9147 e!29708))

(declare-fun res!27184 () Bool)

(assert (=> d!9147 (=> (not res!27184) (not e!29708))))

(declare-fun lt!20343 () List!1252)

(assert (=> d!9147 (= res!27184 (isStrictlySorted!243 lt!20343))))

(declare-fun e!29710 () List!1252)

(assert (=> d!9147 (= lt!20343 e!29710)))

(declare-fun c!6322 () Bool)

(assert (=> d!9147 (= c!6322 (and (is-Cons!1248 (t!4277 l!812)) (= (_1!869 (h!1828 (t!4277 l!812))) key2!27)))))

(assert (=> d!9147 (isStrictlySorted!243 (t!4277 l!812))))

(assert (=> d!9147 (= (removeStrictlySorted!44 (t!4277 l!812) key2!27) lt!20343)))

(declare-fun b!46615 () Bool)

(assert (=> b!46615 (= e!29710 (t!4277 (t!4277 l!812)))))

(declare-fun b!46616 () Bool)

(declare-fun e!29709 () List!1252)

(assert (=> b!46616 (= e!29709 ($colon$colon!46 (removeStrictlySorted!44 (t!4277 (t!4277 l!812)) key2!27) (h!1828 (t!4277 l!812))))))

(declare-fun b!46617 () Bool)

(assert (=> b!46617 (= e!29710 e!29709)))

(declare-fun c!6321 () Bool)

(assert (=> b!46617 (= c!6321 (and (is-Cons!1248 (t!4277 l!812)) (not (= (_1!869 (h!1828 (t!4277 l!812))) key2!27))))))

(declare-fun b!46618 () Bool)

(assert (=> b!46618 (= e!29708 (not (containsKey!92 lt!20343 key2!27)))))

(declare-fun b!46619 () Bool)

(assert (=> b!46619 (= e!29709 Nil!1249)))

(assert (= (and d!9147 c!6322) b!46615))

(assert (= (and d!9147 (not c!6322)) b!46617))

(assert (= (and b!46617 c!6321) b!46616))

(assert (= (and b!46617 (not c!6321)) b!46619))

(assert (= (and d!9147 res!27184) b!46618))

(declare-fun m!40975 () Bool)

(assert (=> d!9147 m!40975))

(assert (=> d!9147 m!40757))

(declare-fun m!40977 () Bool)

(assert (=> b!46616 m!40977))

(assert (=> b!46616 m!40977))

(declare-fun m!40979 () Bool)

(assert (=> b!46616 m!40979))

(declare-fun m!40981 () Bool)

(assert (=> b!46618 m!40981))

(assert (=> b!46454 d!9147))

(declare-fun d!9149 () Bool)

(declare-fun e!29715 () Bool)

(assert (=> d!9149 e!29715))

(declare-fun res!27189 () Bool)

(assert (=> d!9149 (=> (not res!27189) (not e!29715))))

(declare-fun lt!20344 () List!1252)

(assert (=> d!9149 (= res!27189 (isStrictlySorted!243 lt!20344))))

(declare-fun e!29717 () List!1252)

(assert (=> d!9149 (= lt!20344 e!29717)))

(declare-fun c!6324 () Bool)

(assert (=> d!9149 (= c!6324 (and (is-Cons!1248 (removeStrictlySorted!44 l!812 key1!43)) (= (_1!869 (h!1828 (removeStrictlySorted!44 l!812 key1!43))) key2!27)))))

(assert (=> d!9149 (isStrictlySorted!243 (removeStrictlySorted!44 l!812 key1!43))))

(assert (=> d!9149 (= (removeStrictlySorted!44 (removeStrictlySorted!44 l!812 key1!43) key2!27) lt!20344)))

(declare-fun b!46624 () Bool)

(assert (=> b!46624 (= e!29717 (t!4277 (removeStrictlySorted!44 l!812 key1!43)))))

(declare-fun b!46625 () Bool)

(declare-fun e!29716 () List!1252)

(assert (=> b!46625 (= e!29716 ($colon$colon!46 (removeStrictlySorted!44 (t!4277 (removeStrictlySorted!44 l!812 key1!43)) key2!27) (h!1828 (removeStrictlySorted!44 l!812 key1!43))))))

(declare-fun b!46626 () Bool)

(assert (=> b!46626 (= e!29717 e!29716)))

(declare-fun c!6323 () Bool)

(assert (=> b!46626 (= c!6323 (and (is-Cons!1248 (removeStrictlySorted!44 l!812 key1!43)) (not (= (_1!869 (h!1828 (removeStrictlySorted!44 l!812 key1!43))) key2!27))))))

(declare-fun b!46627 () Bool)

(assert (=> b!46627 (= e!29715 (not (containsKey!92 lt!20344 key2!27)))))

(declare-fun b!46628 () Bool)

(assert (=> b!46628 (= e!29716 Nil!1249)))

(assert (= (and d!9149 c!6324) b!46624))

(assert (= (and d!9149 (not c!6324)) b!46626))

(assert (= (and b!46626 c!6323) b!46625))

(assert (= (and b!46626 (not c!6323)) b!46628))

(assert (= (and d!9149 res!27189) b!46627))

(declare-fun m!40983 () Bool)

(assert (=> d!9149 m!40983))

(assert (=> d!9149 m!40769))

(declare-fun m!40985 () Bool)

(assert (=> d!9149 m!40985))

(declare-fun m!40987 () Bool)

(assert (=> b!46625 m!40987))

(assert (=> b!46625 m!40987))

(declare-fun m!40989 () Bool)

(assert (=> b!46625 m!40989))

(declare-fun m!40991 () Bool)

(assert (=> b!46627 m!40991))

(assert (=> b!46454 d!9149))

(declare-fun d!9153 () Bool)

(declare-fun res!27194 () Bool)

(declare-fun e!29722 () Bool)

(assert (=> d!9153 (=> res!27194 e!29722)))

(assert (=> d!9153 (= res!27194 (or (is-Nil!1249 l!812) (is-Nil!1249 (t!4277 l!812))))))

(assert (=> d!9153 (= (isStrictlySorted!243 l!812) e!29722)))

(declare-fun b!46633 () Bool)

(declare-fun e!29723 () Bool)

(assert (=> b!46633 (= e!29722 e!29723)))

(declare-fun res!27195 () Bool)

(assert (=> b!46633 (=> (not res!27195) (not e!29723))))

(assert (=> b!46633 (= res!27195 (bvslt (_1!869 (h!1828 l!812)) (_1!869 (h!1828 (t!4277 l!812)))))))

(declare-fun b!46634 () Bool)

(assert (=> b!46634 (= e!29723 (isStrictlySorted!243 (t!4277 l!812)))))

(assert (= (and d!9153 (not res!27194)) b!46633))

(assert (= (and b!46633 res!27195) b!46634))

(assert (=> b!46634 m!40757))

(assert (=> start!7262 d!9153))

(declare-fun b!46644 () Bool)

(declare-fun e!29729 () Bool)

(declare-fun tp!6152 () Bool)

(assert (=> b!46644 (= e!29729 (and tp_is_empty!1991 tp!6152))))

(assert (=> b!46455 (= tp!6143 e!29729)))

(assert (= (and b!46455 (is-Cons!1248 (t!4277 l!812))) b!46644))

(push 1)

(assert (not b!46568))

(assert (not d!9145))

(assert (not b!46598))

(assert (not d!9149))

(assert (not d!9141))

(assert (not b!46596))

(assert (not b!46625))

(assert (not b!46566))

(assert (not b!46627))

(assert (not b!46608))

(assert (not d!9123))

(assert (not b!46618))

(assert (not b!46611))

(assert (not b!46571))

(assert tp_is_empty!1991)

(assert (not d!9105))

(assert (not b!46634))

(assert (not b!46573))

(assert (not b!46613))

(assert (not d!9127))

(assert (not b!46561))

(assert (not b!46494))

(assert (not d!9125))

(assert (not b!46644))

(assert (not d!9137))

(assert (not b!46606))

(assert (not d!9147))

(assert (not b!46563))

(assert (not b!46616))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9299 () Bool)

(declare-fun res!27304 () Bool)

(declare-fun e!29864 () Bool)

(assert (=> d!9299 (=> res!27304 e!29864)))

(assert (=> d!9299 (= res!27304 (and (is-Cons!1248 lt!20344) (= (_1!869 (h!1828 lt!20344)) key2!27)))))

(assert (=> d!9299 (= (containsKey!92 lt!20344 key2!27) e!29864)))

(declare-fun b!46803 () Bool)

(declare-fun e!29865 () Bool)

(assert (=> b!46803 (= e!29864 e!29865)))

(declare-fun res!27305 () Bool)

(assert (=> b!46803 (=> (not res!27305) (not e!29865))))

(assert (=> b!46803 (= res!27305 (and (or (not (is-Cons!1248 lt!20344)) (bvsle (_1!869 (h!1828 lt!20344)) key2!27)) (is-Cons!1248 lt!20344) (bvslt (_1!869 (h!1828 lt!20344)) key2!27)))))

(declare-fun b!46804 () Bool)

(assert (=> b!46804 (= e!29865 (containsKey!92 (t!4277 lt!20344) key2!27))))

(assert (= (and d!9299 (not res!27304)) b!46803))

(assert (= (and b!46803 res!27305) b!46804))

(declare-fun m!41175 () Bool)

(assert (=> b!46804 m!41175))

(assert (=> b!46627 d!9299))

(declare-fun d!9301 () Bool)

(declare-fun res!27306 () Bool)

(declare-fun e!29866 () Bool)

(assert (=> d!9301 (=> res!27306 e!29866)))

(assert (=> d!9301 (= res!27306 (or (is-Nil!1249 lt!20341) (is-Nil!1249 (t!4277 lt!20341))))))

(assert (=> d!9301 (= (isStrictlySorted!243 lt!20341) e!29866)))

(declare-fun b!46805 () Bool)

(declare-fun e!29867 () Bool)

(assert (=> b!46805 (= e!29866 e!29867)))

(declare-fun res!27307 () Bool)

(assert (=> b!46805 (=> (not res!27307) (not e!29867))))

(assert (=> b!46805 (= res!27307 (bvslt (_1!869 (h!1828 lt!20341)) (_1!869 (h!1828 (t!4277 lt!20341)))))))

(declare-fun b!46806 () Bool)

(assert (=> b!46806 (= e!29867 (isStrictlySorted!243 (t!4277 lt!20341)))))

(assert (= (and d!9301 (not res!27306)) b!46805))

(assert (= (and b!46805 res!27307) b!46806))

(declare-fun m!41177 () Bool)

(assert (=> b!46806 m!41177))

(assert (=> d!9141 d!9301))

(assert (=> d!9141 d!9095))

(declare-fun d!9303 () Bool)

(declare-fun res!27308 () Bool)

(declare-fun e!29868 () Bool)

(assert (=> d!9303 (=> res!27308 e!29868)))

(assert (=> d!9303 (= res!27308 (or (is-Nil!1249 lt!20339) (is-Nil!1249 (t!4277 lt!20339))))))

(assert (=> d!9303 (= (isStrictlySorted!243 lt!20339) e!29868)))

(declare-fun b!46807 () Bool)

(declare-fun e!29869 () Bool)

(assert (=> b!46807 (= e!29868 e!29869)))

(declare-fun res!27309 () Bool)

(assert (=> b!46807 (=> (not res!27309) (not e!29869))))

(assert (=> b!46807 (= res!27309 (bvslt (_1!869 (h!1828 lt!20339)) (_1!869 (h!1828 (t!4277 lt!20339)))))))

(declare-fun b!46808 () Bool)

(assert (=> b!46808 (= e!29869 (isStrictlySorted!243 (t!4277 lt!20339)))))

(assert (= (and d!9303 (not res!27308)) b!46807))

(assert (= (and b!46807 res!27309) b!46808))

(declare-fun m!41179 () Bool)

(assert (=> b!46808 m!41179))

(assert (=> d!9137 d!9303))

(declare-fun d!9305 () Bool)

(declare-fun res!27310 () Bool)

(declare-fun e!29870 () Bool)

(assert (=> d!9305 (=> res!27310 e!29870)))

(assert (=> d!9305 (= res!27310 (or (is-Nil!1249 (removeStrictlySorted!44 (t!4277 l!812) key1!43)) (is-Nil!1249 (t!4277 (removeStrictlySorted!44 (t!4277 l!812) key1!43)))))))

(assert (=> d!9305 (= (isStrictlySorted!243 (removeStrictlySorted!44 (t!4277 l!812) key1!43)) e!29870)))

(declare-fun b!46809 () Bool)

(declare-fun e!29871 () Bool)

(assert (=> b!46809 (= e!29870 e!29871)))

(declare-fun res!27311 () Bool)

(assert (=> b!46809 (=> (not res!27311) (not e!29871))))

(assert (=> b!46809 (= res!27311 (bvslt (_1!869 (h!1828 (removeStrictlySorted!44 (t!4277 l!812) key1!43))) (_1!869 (h!1828 (t!4277 (removeStrictlySorted!44 (t!4277 l!812) key1!43))))))))

(declare-fun b!46810 () Bool)

(assert (=> b!46810 (= e!29871 (isStrictlySorted!243 (t!4277 (removeStrictlySorted!44 (t!4277 l!812) key1!43))))))

(assert (= (and d!9305 (not res!27310)) b!46809))

(assert (= (and b!46809 res!27311) b!46810))

(declare-fun m!41181 () Bool)

(assert (=> b!46810 m!41181))

(assert (=> d!9137 d!9305))

(declare-fun d!9307 () Bool)

(assert (=> d!9307 (= ($colon$colon!46 (removeStrictlySorted!44 (t!4277 (removeStrictlySorted!44 l!812 key1!43)) key2!27) (h!1828 (removeStrictlySorted!44 l!812 key1!43))) (Cons!1248 (h!1828 (removeStrictlySorted!44 l!812 key1!43)) (removeStrictlySorted!44 (t!4277 (removeStrictlySorted!44 l!812 key1!43)) key2!27)))))

(assert (=> b!46625 d!9307))

(declare-fun d!9309 () Bool)

(declare-fun e!29872 () Bool)

(assert (=> d!9309 e!29872))

(declare-fun res!27312 () Bool)

(assert (=> d!9309 (=> (not res!27312) (not e!29872))))

(declare-fun lt!20357 () List!1252)

(assert (=> d!9309 (= res!27312 (isStrictlySorted!243 lt!20357))))

(declare-fun e!29874 () List!1252)

(assert (=> d!9309 (= lt!20357 e!29874)))

(declare-fun c!6350 () Bool)

(assert (=> d!9309 (= c!6350 (and (is-Cons!1248 (t!4277 (removeStrictlySorted!44 l!812 key1!43))) (= (_1!869 (h!1828 (t!4277 (removeStrictlySorted!44 l!812 key1!43)))) key2!27)))))

(assert (=> d!9309 (isStrictlySorted!243 (t!4277 (removeStrictlySorted!44 l!812 key1!43)))))

(assert (=> d!9309 (= (removeStrictlySorted!44 (t!4277 (removeStrictlySorted!44 l!812 key1!43)) key2!27) lt!20357)))

(declare-fun b!46811 () Bool)

(assert (=> b!46811 (= e!29874 (t!4277 (t!4277 (removeStrictlySorted!44 l!812 key1!43))))))

(declare-fun b!46812 () Bool)

(declare-fun e!29873 () List!1252)

(assert (=> b!46812 (= e!29873 ($colon$colon!46 (removeStrictlySorted!44 (t!4277 (t!4277 (removeStrictlySorted!44 l!812 key1!43))) key2!27) (h!1828 (t!4277 (removeStrictlySorted!44 l!812 key1!43)))))))

(declare-fun b!46813 () Bool)

(assert (=> b!46813 (= e!29874 e!29873)))

(declare-fun c!6349 () Bool)

(assert (=> b!46813 (= c!6349 (and (is-Cons!1248 (t!4277 (removeStrictlySorted!44 l!812 key1!43))) (not (= (_1!869 (h!1828 (t!4277 (removeStrictlySorted!44 l!812 key1!43)))) key2!27))))))

(declare-fun b!46814 () Bool)

(assert (=> b!46814 (= e!29872 (not (containsKey!92 lt!20357 key2!27)))))

(declare-fun b!46815 () Bool)

(assert (=> b!46815 (= e!29873 Nil!1249)))

(assert (= (and d!9309 c!6350) b!46811))

(assert (= (and d!9309 (not c!6350)) b!46813))

(assert (= (and b!46813 c!6349) b!46812))

(assert (= (and b!46813 (not c!6349)) b!46815))

(assert (= (and d!9309 res!27312) b!46814))

(declare-fun m!41183 () Bool)

(assert (=> d!9309 m!41183))

(declare-fun m!41185 () Bool)

(assert (=> d!9309 m!41185))

(declare-fun m!41187 () Bool)

(assert (=> b!46812 m!41187))

(assert (=> b!46812 m!41187))

(declare-fun m!41189 () Bool)

(assert (=> b!46812 m!41189))

(declare-fun m!41191 () Bool)

(assert (=> b!46814 m!41191))

(assert (=> b!46625 d!9309))

(declare-fun d!9311 () Bool)

(declare-fun res!27313 () Bool)

(declare-fun e!29875 () Bool)

(assert (=> d!9311 (=> res!27313 e!29875)))

(assert (=> d!9311 (= res!27313 (or (is-Nil!1249 lt!20327) (is-Nil!1249 (t!4277 lt!20327))))))

(assert (=> d!9311 (= (isStrictlySorted!243 lt!20327) e!29875)))

(declare-fun b!46816 () Bool)

(declare-fun e!29876 () Bool)

(assert (=> b!46816 (= e!29875 e!29876)))

(declare-fun res!27314 () Bool)

(assert (=> b!46816 (=> (not res!27314) (not e!29876))))

(assert (=> b!46816 (= res!27314 (bvslt (_1!869 (h!1828 lt!20327)) (_1!869 (h!1828 (t!4277 lt!20327)))))))

(declare-fun b!46817 () Bool)

(assert (=> b!46817 (= e!29876 (isStrictlySorted!243 (t!4277 lt!20327)))))

(assert (= (and d!9311 (not res!27313)) b!46816))

(assert (= (and b!46816 res!27314) b!46817))

(declare-fun m!41193 () Bool)

(assert (=> b!46817 m!41193))

(assert (=> d!9123 d!9311))

(assert (=> d!9123 d!9153))

(declare-fun d!9313 () Bool)

(declare-fun res!27315 () Bool)

(declare-fun e!29877 () Bool)

(assert (=> d!9313 (=> res!27315 e!29877)))

(assert (=> d!9313 (= res!27315 (or (is-Nil!1249 (t!4277 (t!4277 l!812))) (is-Nil!1249 (t!4277 (t!4277 (t!4277 l!812))))))))

(assert (=> d!9313 (= (isStrictlySorted!243 (t!4277 (t!4277 l!812))) e!29877)))

(declare-fun b!46818 () Bool)

(declare-fun e!29878 () Bool)

(assert (=> b!46818 (= e!29877 e!29878)))

(declare-fun res!27316 () Bool)

(assert (=> b!46818 (=> (not res!27316) (not e!29878))))

(assert (=> b!46818 (= res!27316 (bvslt (_1!869 (h!1828 (t!4277 (t!4277 l!812)))) (_1!869 (h!1828 (t!4277 (t!4277 (t!4277 l!812)))))))))

(declare-fun b!46819 () Bool)

(assert (=> b!46819 (= e!29878 (isStrictlySorted!243 (t!4277 (t!4277 (t!4277 l!812)))))))

(assert (= (and d!9313 (not res!27315)) b!46818))

(assert (= (and b!46818 res!27316) b!46819))

(declare-fun m!41195 () Bool)

(assert (=> b!46819 m!41195))

(assert (=> b!46494 d!9313))

(declare-fun d!9315 () Bool)

(declare-fun res!27317 () Bool)

(declare-fun e!29879 () Bool)

(assert (=> d!9315 (=> res!27317 e!29879)))

(assert (=> d!9315 (= res!27317 (and (is-Cons!1248 lt!20326) (= (_1!869 (h!1828 lt!20326)) key1!43)))))

(assert (=> d!9315 (= (containsKey!92 lt!20326 key1!43) e!29879)))

(declare-fun b!46820 () Bool)

(declare-fun e!29880 () Bool)

(assert (=> b!46820 (= e!29879 e!29880)))

(declare-fun res!27318 () Bool)

(assert (=> b!46820 (=> (not res!27318) (not e!29880))))

(assert (=> b!46820 (= res!27318 (and (or (not (is-Cons!1248 lt!20326)) (bvsle (_1!869 (h!1828 lt!20326)) key1!43)) (is-Cons!1248 lt!20326) (bvslt (_1!869 (h!1828 lt!20326)) key1!43)))))

(declare-fun b!46821 () Bool)

(assert (=> b!46821 (= e!29880 (containsKey!92 (t!4277 lt!20326) key1!43))))

(assert (= (and d!9315 (not res!27317)) b!46820))

(assert (= (and b!46820 res!27318) b!46821))

(declare-fun m!41197 () Bool)

(assert (=> b!46821 m!41197))

(assert (=> b!46563 d!9315))

(declare-fun d!9317 () Bool)

(assert (=> d!9317 (= ($colon$colon!46 (removeStrictlySorted!44 (t!4277 (removeStrictlySorted!44 (t!4277 l!812) key2!27)) key1!43) (h!1828 (removeStrictlySorted!44 (t!4277 l!812) key2!27))) (Cons!1248 (h!1828 (removeStrictlySorted!44 (t!4277 l!812) key2!27)) (removeStrictlySorted!44 (t!4277 (removeStrictlySorted!44 (t!4277 l!812) key2!27)) key1!43)))))

(assert (=> b!46611 d!9317))

(declare-fun d!9319 () Bool)

(declare-fun e!29881 () Bool)

(assert (=> d!9319 e!29881))

(declare-fun res!27319 () Bool)

(assert (=> d!9319 (=> (not res!27319) (not e!29881))))

(declare-fun lt!20358 () List!1252)

(assert (=> d!9319 (= res!27319 (isStrictlySorted!243 lt!20358))))

(declare-fun e!29883 () List!1252)

(assert (=> d!9319 (= lt!20358 e!29883)))

(declare-fun c!6352 () Bool)

(assert (=> d!9319 (= c!6352 (and (is-Cons!1248 (t!4277 (removeStrictlySorted!44 (t!4277 l!812) key2!27))) (= (_1!869 (h!1828 (t!4277 (removeStrictlySorted!44 (t!4277 l!812) key2!27)))) key1!43)))))

(assert (=> d!9319 (isStrictlySorted!243 (t!4277 (removeStrictlySorted!44 (t!4277 l!812) key2!27)))))

(assert (=> d!9319 (= (removeStrictlySorted!44 (t!4277 (removeStrictlySorted!44 (t!4277 l!812) key2!27)) key1!43) lt!20358)))

(declare-fun b!46822 () Bool)

(assert (=> b!46822 (= e!29883 (t!4277 (t!4277 (removeStrictlySorted!44 (t!4277 l!812) key2!27))))))

(declare-fun e!29882 () List!1252)

(declare-fun b!46823 () Bool)

(assert (=> b!46823 (= e!29882 ($colon$colon!46 (removeStrictlySorted!44 (t!4277 (t!4277 (removeStrictlySorted!44 (t!4277 l!812) key2!27))) key1!43) (h!1828 (t!4277 (removeStrictlySorted!44 (t!4277 l!812) key2!27)))))))

(declare-fun b!46824 () Bool)

(assert (=> b!46824 (= e!29883 e!29882)))

(declare-fun c!6351 () Bool)

(assert (=> b!46824 (= c!6351 (and (is-Cons!1248 (t!4277 (removeStrictlySorted!44 (t!4277 l!812) key2!27))) (not (= (_1!869 (h!1828 (t!4277 (removeStrictlySorted!44 (t!4277 l!812) key2!27)))) key1!43))))))

(declare-fun b!46825 () Bool)

(assert (=> b!46825 (= e!29881 (not (containsKey!92 lt!20358 key1!43)))))

(declare-fun b!46826 () Bool)

(assert (=> b!46826 (= e!29882 Nil!1249)))

(assert (= (and d!9319 c!6352) b!46822))

(assert (= (and d!9319 (not c!6352)) b!46824))

(assert (= (and b!46824 c!6351) b!46823))

(assert (= (and b!46824 (not c!6351)) b!46826))

(assert (= (and d!9319 res!27319) b!46825))

(declare-fun m!41199 () Bool)

(assert (=> d!9319 m!41199))

(declare-fun m!41201 () Bool)

(assert (=> d!9319 m!41201))

(declare-fun m!41203 () Bool)

(assert (=> b!46823 m!41203))

(assert (=> b!46823 m!41203))

(declare-fun m!41205 () Bool)

(assert (=> b!46823 m!41205))

(declare-fun m!41207 () Bool)

(assert (=> b!46825 m!41207))

(assert (=> b!46611 d!9319))

(declare-fun d!9321 () Bool)

(declare-fun res!27320 () Bool)

(declare-fun e!29884 () Bool)

(assert (=> d!9321 (=> res!27320 e!29884)))

(assert (=> d!9321 (= res!27320 (or (is-Nil!1249 lt!20330) (is-Nil!1249 (t!4277 lt!20330))))))

(assert (=> d!9321 (= (isStrictlySorted!243 lt!20330) e!29884)))

(declare-fun b!46827 () Bool)

(declare-fun e!29885 () Bool)

(assert (=> b!46827 (= e!29884 e!29885)))

(declare-fun res!27321 () Bool)

(assert (=> b!46827 (=> (not res!27321) (not e!29885))))

(assert (=> b!46827 (= res!27321 (bvslt (_1!869 (h!1828 lt!20330)) (_1!869 (h!1828 (t!4277 lt!20330)))))))

