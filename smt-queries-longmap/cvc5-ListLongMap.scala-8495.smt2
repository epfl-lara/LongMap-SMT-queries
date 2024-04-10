; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103512 () Bool)

(assert start!103512)

(declare-fun res!827755 () Bool)

(declare-fun e!703140 () Bool)

(assert (=> start!103512 (=> (not res!827755) (not e!703140))))

(declare-fun a1!66 () (_ BitVec 64))

(declare-fun a2!55 () (_ BitVec 64))

(assert (=> start!103512 (= res!827755 (not (= a1!66 a2!55)))))

(assert (=> start!103512 e!703140))

(assert (=> start!103512 true))

(declare-datatypes ((B!1796 0))(
  ( (B!1797 (val!15660 Int)) )
))
(declare-datatypes ((tuple2!20192 0))(
  ( (tuple2!20193 (_1!10107 (_ BitVec 64)) (_2!10107 B!1796)) )
))
(declare-datatypes ((List!27325 0))(
  ( (Nil!27322) (Cons!27321 (h!28530 tuple2!20192) (t!40788 List!27325)) )
))
(declare-datatypes ((ListLongMap!18161 0))(
  ( (ListLongMap!18162 (toList!9096 List!27325)) )
))
(declare-fun lm!211 () ListLongMap!18161)

(declare-fun e!703139 () Bool)

(declare-fun inv!42773 (ListLongMap!18161) Bool)

(assert (=> start!103512 (and (inv!42773 lm!211) e!703139)))

(declare-fun tp_is_empty!31195 () Bool)

(assert (=> start!103512 tp_is_empty!31195))

(declare-fun b!1240512 () Bool)

(declare-fun res!827754 () Bool)

(assert (=> b!1240512 (=> (not res!827754) (not e!703140))))

(declare-fun isStrictlySorted!733 (List!27325) Bool)

(assert (=> b!1240512 (= res!827754 (isStrictlySorted!733 (toList!9096 lm!211)))))

(declare-fun b!1240513 () Bool)

(declare-fun lt!561928 () tuple2!20192)

(declare-fun -!1985 (ListLongMap!18161 (_ BitVec 64)) ListLongMap!18161)

(declare-fun +!4132 (ListLongMap!18161 tuple2!20192) ListLongMap!18161)

(assert (=> b!1240513 (= e!703140 (not (= (-!1985 (+!4132 lm!211 lt!561928) a2!55) (+!4132 (-!1985 lm!211 a2!55) lt!561928))))))

(declare-fun b1!77 () B!1796)

(assert (=> b!1240513 (= lt!561928 (tuple2!20193 a1!66 b1!77))))

(declare-fun insertStrictlySorted!419 (List!27325 (_ BitVec 64) B!1796) List!27325)

(declare-fun removeStrictlySorted!112 (List!27325 (_ BitVec 64)) List!27325)

(assert (=> b!1240513 (= (insertStrictlySorted!419 (removeStrictlySorted!112 (toList!9096 lm!211) a2!55) a1!66 b1!77) (removeStrictlySorted!112 (insertStrictlySorted!419 (toList!9096 lm!211) a1!66 b1!77) a2!55))))

(declare-datatypes ((Unit!41231 0))(
  ( (Unit!41232) )
))
(declare-fun lt!561929 () Unit!41231)

(declare-fun lemmaInsertAndRemoveStrictlySortedCommutative!1 (List!27325 (_ BitVec 64) B!1796 (_ BitVec 64)) Unit!41231)

(assert (=> b!1240513 (= lt!561929 (lemmaInsertAndRemoveStrictlySortedCommutative!1 (toList!9096 lm!211) a1!66 b1!77 a2!55))))

(declare-fun b!1240514 () Bool)

(declare-fun tp!92537 () Bool)

(assert (=> b!1240514 (= e!703139 tp!92537)))

(assert (= (and start!103512 res!827755) b!1240512))

(assert (= (and b!1240512 res!827754) b!1240513))

(assert (= start!103512 b!1240514))

(declare-fun m!1143763 () Bool)

(assert (=> start!103512 m!1143763))

(declare-fun m!1143765 () Bool)

(assert (=> b!1240512 m!1143765))

(declare-fun m!1143767 () Bool)

(assert (=> b!1240513 m!1143767))

(declare-fun m!1143769 () Bool)

(assert (=> b!1240513 m!1143769))

(declare-fun m!1143771 () Bool)

(assert (=> b!1240513 m!1143771))

(declare-fun m!1143773 () Bool)

(assert (=> b!1240513 m!1143773))

(declare-fun m!1143775 () Bool)

(assert (=> b!1240513 m!1143775))

(assert (=> b!1240513 m!1143767))

(declare-fun m!1143777 () Bool)

(assert (=> b!1240513 m!1143777))

(declare-fun m!1143779 () Bool)

(assert (=> b!1240513 m!1143779))

(assert (=> b!1240513 m!1143777))

(assert (=> b!1240513 m!1143771))

(declare-fun m!1143781 () Bool)

(assert (=> b!1240513 m!1143781))

(declare-fun m!1143783 () Bool)

(assert (=> b!1240513 m!1143783))

(assert (=> b!1240513 m!1143773))

(push 1)

(assert tp_is_empty!31195)

(assert (not b!1240514))

(assert (not b!1240512))

(assert (not b!1240513))

(assert (not start!103512))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!136301 () Bool)

(declare-fun res!827776 () Bool)

(declare-fun e!703161 () Bool)

(assert (=> d!136301 (=> res!827776 e!703161)))

(assert (=> d!136301 (= res!827776 (or (is-Nil!27322 (toList!9096 lm!211)) (is-Nil!27322 (t!40788 (toList!9096 lm!211)))))))

(assert (=> d!136301 (= (isStrictlySorted!733 (toList!9096 lm!211)) e!703161)))

(declare-fun b!1240541 () Bool)

(declare-fun e!703162 () Bool)

(assert (=> b!1240541 (= e!703161 e!703162)))

(declare-fun res!827777 () Bool)

(assert (=> b!1240541 (=> (not res!827777) (not e!703162))))

(assert (=> b!1240541 (= res!827777 (bvslt (_1!10107 (h!28530 (toList!9096 lm!211))) (_1!10107 (h!28530 (t!40788 (toList!9096 lm!211))))))))

(declare-fun b!1240542 () Bool)

(assert (=> b!1240542 (= e!703162 (isStrictlySorted!733 (t!40788 (toList!9096 lm!211))))))

(assert (= (and d!136301 (not res!827776)) b!1240541))

(assert (= (and b!1240541 res!827777) b!1240542))

(declare-fun m!1143829 () Bool)

(assert (=> b!1240542 m!1143829))

(assert (=> b!1240512 d!136301))

(declare-fun bm!61133 () Bool)

(declare-fun call!61137 () List!27325)

(declare-fun call!61138 () List!27325)

(assert (=> bm!61133 (= call!61137 call!61138)))

(declare-fun b!1240577 () Bool)

(declare-fun e!703187 () List!27325)

(declare-fun call!61136 () List!27325)

(assert (=> b!1240577 (= e!703187 call!61136)))

(declare-fun b!1240578 () Bool)

(declare-fun e!703184 () List!27325)

(assert (=> b!1240578 (= e!703184 call!61137)))

(declare-fun e!703188 () Bool)

(declare-fun b!1240579 () Bool)

(declare-fun lt!561956 () List!27325)

(declare-fun contains!7379 (List!27325 tuple2!20192) Bool)

(assert (=> b!1240579 (= e!703188 (contains!7379 lt!561956 (tuple2!20193 a1!66 b1!77)))))

(declare-fun b!1240580 () Bool)

(declare-fun c!121227 () Bool)

(assert (=> b!1240580 (= c!121227 (and (is-Cons!27321 (removeStrictlySorted!112 (toList!9096 lm!211) a2!55)) (bvsgt (_1!10107 (h!28530 (removeStrictlySorted!112 (toList!9096 lm!211) a2!55))) a1!66)))))

(assert (=> b!1240580 (= e!703184 e!703187)))

(declare-fun bm!61134 () Bool)

(declare-fun c!121225 () Bool)

(declare-fun e!703185 () List!27325)

(declare-fun $colon$colon!611 (List!27325 tuple2!20192) List!27325)

(assert (=> bm!61134 (= call!61138 ($colon$colon!611 e!703185 (ite c!121225 (h!28530 (removeStrictlySorted!112 (toList!9096 lm!211) a2!55)) (tuple2!20193 a1!66 b1!77))))))

(declare-fun c!121228 () Bool)

(assert (=> bm!61134 (= c!121228 c!121225)))

(declare-fun c!121226 () Bool)

(declare-fun b!1240582 () Bool)

(assert (=> b!1240582 (= e!703185 (ite c!121226 (t!40788 (removeStrictlySorted!112 (toList!9096 lm!211) a2!55)) (ite c!121227 (Cons!27321 (h!28530 (removeStrictlySorted!112 (toList!9096 lm!211) a2!55)) (t!40788 (removeStrictlySorted!112 (toList!9096 lm!211) a2!55))) Nil!27322)))))

(declare-fun b!1240583 () Bool)

(assert (=> b!1240583 (= e!703185 (insertStrictlySorted!419 (t!40788 (removeStrictlySorted!112 (toList!9096 lm!211) a2!55)) a1!66 b1!77))))

(declare-fun b!1240584 () Bool)

(declare-fun res!827797 () Bool)

(assert (=> b!1240584 (=> (not res!827797) (not e!703188))))

(declare-fun containsKey!597 (List!27325 (_ BitVec 64)) Bool)

(assert (=> b!1240584 (= res!827797 (containsKey!597 lt!561956 a1!66))))

(declare-fun bm!61135 () Bool)

(assert (=> bm!61135 (= call!61136 call!61137)))

(declare-fun b!1240585 () Bool)

(declare-fun e!703186 () List!27325)

(assert (=> b!1240585 (= e!703186 e!703184)))

(assert (=> b!1240585 (= c!121226 (and (is-Cons!27321 (removeStrictlySorted!112 (toList!9096 lm!211) a2!55)) (= (_1!10107 (h!28530 (removeStrictlySorted!112 (toList!9096 lm!211) a2!55))) a1!66)))))

(declare-fun b!1240586 () Bool)

(assert (=> b!1240586 (= e!703186 call!61138)))

(declare-fun d!136305 () Bool)

(assert (=> d!136305 e!703188))

(declare-fun res!827796 () Bool)

(assert (=> d!136305 (=> (not res!827796) (not e!703188))))

(assert (=> d!136305 (= res!827796 (isStrictlySorted!733 lt!561956))))

(assert (=> d!136305 (= lt!561956 e!703186)))

(assert (=> d!136305 (= c!121225 (and (is-Cons!27321 (removeStrictlySorted!112 (toList!9096 lm!211) a2!55)) (bvslt (_1!10107 (h!28530 (removeStrictlySorted!112 (toList!9096 lm!211) a2!55))) a1!66)))))

(assert (=> d!136305 (isStrictlySorted!733 (removeStrictlySorted!112 (toList!9096 lm!211) a2!55))))

(assert (=> d!136305 (= (insertStrictlySorted!419 (removeStrictlySorted!112 (toList!9096 lm!211) a2!55) a1!66 b1!77) lt!561956)))

(declare-fun b!1240581 () Bool)

(assert (=> b!1240581 (= e!703187 call!61136)))

(assert (= (and d!136305 c!121225) b!1240586))

(assert (= (and d!136305 (not c!121225)) b!1240585))

(assert (= (and b!1240585 c!121226) b!1240578))

(assert (= (and b!1240585 (not c!121226)) b!1240580))

(assert (= (and b!1240580 c!121227) b!1240581))

(assert (= (and b!1240580 (not c!121227)) b!1240577))

(assert (= (or b!1240581 b!1240577) bm!61135))

(assert (= (or b!1240578 bm!61135) bm!61133))

(assert (= (or b!1240586 bm!61133) bm!61134))

(assert (= (and bm!61134 c!121228) b!1240583))

(assert (= (and bm!61134 (not c!121228)) b!1240582))

(assert (= (and d!136305 res!827796) b!1240584))

(assert (= (and b!1240584 res!827797) b!1240579))

(declare-fun m!1143847 () Bool)

(assert (=> d!136305 m!1143847))

(assert (=> d!136305 m!1143767))

(declare-fun m!1143849 () Bool)

(assert (=> d!136305 m!1143849))

(declare-fun m!1143851 () Bool)

(assert (=> bm!61134 m!1143851))

(declare-fun m!1143853 () Bool)

(assert (=> b!1240584 m!1143853))

(declare-fun m!1143855 () Bool)

(assert (=> b!1240579 m!1143855))

(declare-fun m!1143857 () Bool)

(assert (=> b!1240583 m!1143857))

(assert (=> b!1240513 d!136305))

(declare-fun d!136315 () Bool)

(declare-fun lt!561963 () ListLongMap!18161)

(declare-fun contains!7381 (ListLongMap!18161 (_ BitVec 64)) Bool)

(assert (=> d!136315 (not (contains!7381 lt!561963 a2!55))))

(assert (=> d!136315 (= lt!561963 (ListLongMap!18162 (removeStrictlySorted!112 (toList!9096 lm!211) a2!55)))))

(assert (=> d!136315 (= (-!1985 lm!211 a2!55) lt!561963)))

(declare-fun bs!34913 () Bool)

(assert (= bs!34913 d!136315))

(declare-fun m!1143859 () Bool)

(assert (=> bs!34913 m!1143859))

(assert (=> bs!34913 m!1143767))

(assert (=> b!1240513 d!136315))

(declare-fun e!703225 () List!27325)

(declare-fun b!1240657 () Bool)

(assert (=> b!1240657 (= e!703225 (t!40788 (insertStrictlySorted!419 (toList!9096 lm!211) a1!66 b1!77)))))

(declare-fun b!1240658 () Bool)

(declare-fun e!703227 () List!27325)

(assert (=> b!1240658 (= e!703227 Nil!27322)))

(declare-fun b!1240659 () Bool)

(assert (=> b!1240659 (= e!703227 ($colon$colon!611 (removeStrictlySorted!112 (t!40788 (insertStrictlySorted!419 (toList!9096 lm!211) a1!66 b1!77)) a2!55) (h!28530 (insertStrictlySorted!419 (toList!9096 lm!211) a1!66 b1!77))))))

(declare-fun b!1240660 () Bool)

(assert (=> b!1240660 (= e!703225 e!703227)))

(declare-fun c!121257 () Bool)

(assert (=> b!1240660 (= c!121257 (and (is-Cons!27321 (insertStrictlySorted!419 (toList!9096 lm!211) a1!66 b1!77)) (not (= (_1!10107 (h!28530 (insertStrictlySorted!419 (toList!9096 lm!211) a1!66 b1!77))) a2!55))))))

(declare-fun d!136317 () Bool)

(declare-fun e!703226 () Bool)

(assert (=> d!136317 e!703226))

(declare-fun res!827812 () Bool)

(assert (=> d!136317 (=> (not res!827812) (not e!703226))))

(declare-fun lt!561968 () List!27325)

(assert (=> d!136317 (= res!827812 (isStrictlySorted!733 lt!561968))))

(assert (=> d!136317 (= lt!561968 e!703225)))

(declare-fun c!121258 () Bool)

(assert (=> d!136317 (= c!121258 (and (is-Cons!27321 (insertStrictlySorted!419 (toList!9096 lm!211) a1!66 b1!77)) (= (_1!10107 (h!28530 (insertStrictlySorted!419 (toList!9096 lm!211) a1!66 b1!77))) a2!55)))))

(assert (=> d!136317 (isStrictlySorted!733 (insertStrictlySorted!419 (toList!9096 lm!211) a1!66 b1!77))))

(assert (=> d!136317 (= (removeStrictlySorted!112 (insertStrictlySorted!419 (toList!9096 lm!211) a1!66 b1!77) a2!55) lt!561968)))

(declare-fun b!1240661 () Bool)

(assert (=> b!1240661 (= e!703226 (not (containsKey!597 lt!561968 a2!55)))))

(assert (= (and d!136317 c!121258) b!1240657))

(assert (= (and d!136317 (not c!121258)) b!1240660))

(assert (= (and b!1240660 c!121257) b!1240659))

(assert (= (and b!1240660 (not c!121257)) b!1240658))

(assert (= (and d!136317 res!827812) b!1240661))

(declare-fun m!1143883 () Bool)

(assert (=> b!1240659 m!1143883))

(assert (=> b!1240659 m!1143883))

(declare-fun m!1143887 () Bool)

(assert (=> b!1240659 m!1143887))

(declare-fun m!1143889 () Bool)

(assert (=> d!136317 m!1143889))

(assert (=> d!136317 m!1143771))

(declare-fun m!1143891 () Bool)

(assert (=> d!136317 m!1143891))

(declare-fun m!1143893 () Bool)

(assert (=> b!1240661 m!1143893))

(assert (=> b!1240513 d!136317))

(declare-fun b!1240662 () Bool)

(declare-fun e!703228 () List!27325)

(assert (=> b!1240662 (= e!703228 (t!40788 (toList!9096 lm!211)))))

(declare-fun b!1240663 () Bool)

(declare-fun e!703230 () List!27325)

(assert (=> b!1240663 (= e!703230 Nil!27322)))

(declare-fun b!1240664 () Bool)

(assert (=> b!1240664 (= e!703230 ($colon$colon!611 (removeStrictlySorted!112 (t!40788 (toList!9096 lm!211)) a2!55) (h!28530 (toList!9096 lm!211))))))

(declare-fun b!1240665 () Bool)

(assert (=> b!1240665 (= e!703228 e!703230)))

(declare-fun c!121259 () Bool)

(assert (=> b!1240665 (= c!121259 (and (is-Cons!27321 (toList!9096 lm!211)) (not (= (_1!10107 (h!28530 (toList!9096 lm!211))) a2!55))))))

(declare-fun d!136323 () Bool)

(declare-fun e!703229 () Bool)

(assert (=> d!136323 e!703229))

(declare-fun res!827813 () Bool)

(assert (=> d!136323 (=> (not res!827813) (not e!703229))))

(declare-fun lt!561969 () List!27325)

(assert (=> d!136323 (= res!827813 (isStrictlySorted!733 lt!561969))))

(assert (=> d!136323 (= lt!561969 e!703228)))

(declare-fun c!121260 () Bool)

(assert (=> d!136323 (= c!121260 (and (is-Cons!27321 (toList!9096 lm!211)) (= (_1!10107 (h!28530 (toList!9096 lm!211))) a2!55)))))

(assert (=> d!136323 (isStrictlySorted!733 (toList!9096 lm!211))))

(assert (=> d!136323 (= (removeStrictlySorted!112 (toList!9096 lm!211) a2!55) lt!561969)))

(declare-fun b!1240666 () Bool)

(assert (=> b!1240666 (= e!703229 (not (containsKey!597 lt!561969 a2!55)))))

(assert (= (and d!136323 c!121260) b!1240662))

(assert (= (and d!136323 (not c!121260)) b!1240665))

(assert (= (and b!1240665 c!121259) b!1240664))

(assert (= (and b!1240665 (not c!121259)) b!1240663))

(assert (= (and d!136323 res!827813) b!1240666))

(declare-fun m!1143895 () Bool)

(assert (=> b!1240664 m!1143895))

(assert (=> b!1240664 m!1143895))

(declare-fun m!1143897 () Bool)

(assert (=> b!1240664 m!1143897))

(declare-fun m!1143899 () Bool)

(assert (=> d!136323 m!1143899))

(assert (=> d!136323 m!1143765))

(declare-fun m!1143901 () Bool)

(assert (=> b!1240666 m!1143901))

(assert (=> b!1240513 d!136323))

(declare-fun d!136325 () Bool)

(declare-fun e!703242 () Bool)

(assert (=> d!136325 e!703242))

(declare-fun res!827821 () Bool)

(assert (=> d!136325 (=> (not res!827821) (not e!703242))))

(declare-fun lt!561990 () ListLongMap!18161)

(assert (=> d!136325 (= res!827821 (contains!7381 lt!561990 (_1!10107 lt!561928)))))

(declare-fun lt!561988 () List!27325)

(assert (=> d!136325 (= lt!561990 (ListLongMap!18162 lt!561988))))

(declare-fun lt!561989 () Unit!41231)

(declare-fun lt!561987 () Unit!41231)

(assert (=> d!136325 (= lt!561989 lt!561987)))

(declare-datatypes ((Option!701 0))(
  ( (Some!700 (v!18371 B!1796)) (None!699) )
))
(declare-fun getValueByKey!650 (List!27325 (_ BitVec 64)) Option!701)

(assert (=> d!136325 (= (getValueByKey!650 lt!561988 (_1!10107 lt!561928)) (Some!700 (_2!10107 lt!561928)))))

(declare-fun lemmaContainsTupThenGetReturnValue!327 (List!27325 (_ BitVec 64) B!1796) Unit!41231)

(assert (=> d!136325 (= lt!561987 (lemmaContainsTupThenGetReturnValue!327 lt!561988 (_1!10107 lt!561928) (_2!10107 lt!561928)))))

(assert (=> d!136325 (= lt!561988 (insertStrictlySorted!419 (toList!9096 (-!1985 lm!211 a2!55)) (_1!10107 lt!561928) (_2!10107 lt!561928)))))

(assert (=> d!136325 (= (+!4132 (-!1985 lm!211 a2!55) lt!561928) lt!561990)))

(declare-fun b!1240686 () Bool)

(declare-fun res!827822 () Bool)

(assert (=> b!1240686 (=> (not res!827822) (not e!703242))))

(assert (=> b!1240686 (= res!827822 (= (getValueByKey!650 (toList!9096 lt!561990) (_1!10107 lt!561928)) (Some!700 (_2!10107 lt!561928))))))

(declare-fun b!1240687 () Bool)

(assert (=> b!1240687 (= e!703242 (contains!7379 (toList!9096 lt!561990) lt!561928))))

(assert (= (and d!136325 res!827821) b!1240686))

(assert (= (and b!1240686 res!827822) b!1240687))

(declare-fun m!1143915 () Bool)

(assert (=> d!136325 m!1143915))

(declare-fun m!1143917 () Bool)

(assert (=> d!136325 m!1143917))

(declare-fun m!1143921 () Bool)

(assert (=> d!136325 m!1143921))

(declare-fun m!1143923 () Bool)

(assert (=> d!136325 m!1143923))

(declare-fun m!1143925 () Bool)

(assert (=> b!1240686 m!1143925))

(declare-fun m!1143927 () Bool)

(assert (=> b!1240687 m!1143927))

(assert (=> b!1240513 d!136325))

(declare-fun d!136333 () Bool)

(declare-fun lt!562000 () ListLongMap!18161)

(assert (=> d!136333 (not (contains!7381 lt!562000 a2!55))))

(assert (=> d!136333 (= lt!562000 (ListLongMap!18162 (removeStrictlySorted!112 (toList!9096 (+!4132 lm!211 lt!561928)) a2!55)))))

(assert (=> d!136333 (= (-!1985 (+!4132 lm!211 lt!561928) a2!55) lt!562000)))

(declare-fun bs!34916 () Bool)

(assert (= bs!34916 d!136333))

(declare-fun m!1143929 () Bool)

(assert (=> bs!34916 m!1143929))

(declare-fun m!1143931 () Bool)

(assert (=> bs!34916 m!1143931))

(assert (=> b!1240513 d!136333))

(declare-fun d!136335 () Bool)

(declare-fun e!703248 () Bool)

(assert (=> d!136335 e!703248))

(declare-fun res!827828 () Bool)

(assert (=> d!136335 (=> (not res!827828) (not e!703248))))

(declare-fun lt!562004 () ListLongMap!18161)

(assert (=> d!136335 (= res!827828 (contains!7381 lt!562004 (_1!10107 lt!561928)))))

(declare-fun lt!562002 () List!27325)

(assert (=> d!136335 (= lt!562004 (ListLongMap!18162 lt!562002))))

(declare-fun lt!562003 () Unit!41231)

(declare-fun lt!562001 () Unit!41231)

(assert (=> d!136335 (= lt!562003 lt!562001)))

(assert (=> d!136335 (= (getValueByKey!650 lt!562002 (_1!10107 lt!561928)) (Some!700 (_2!10107 lt!561928)))))

(assert (=> d!136335 (= lt!562001 (lemmaContainsTupThenGetReturnValue!327 lt!562002 (_1!10107 lt!561928) (_2!10107 lt!561928)))))

(assert (=> d!136335 (= lt!562002 (insertStrictlySorted!419 (toList!9096 lm!211) (_1!10107 lt!561928) (_2!10107 lt!561928)))))

(assert (=> d!136335 (= (+!4132 lm!211 lt!561928) lt!562004)))

(declare-fun b!1240697 () Bool)

(declare-fun res!827829 () Bool)

(assert (=> b!1240697 (=> (not res!827829) (not e!703248))))

(assert (=> b!1240697 (= res!827829 (= (getValueByKey!650 (toList!9096 lt!562004) (_1!10107 lt!561928)) (Some!700 (_2!10107 lt!561928))))))

(declare-fun b!1240698 () Bool)

(assert (=> b!1240698 (= e!703248 (contains!7379 (toList!9096 lt!562004) lt!561928))))

(assert (= (and d!136335 res!827828) b!1240697))

(assert (= (and b!1240697 res!827829) b!1240698))

(declare-fun m!1143941 () Bool)

(assert (=> d!136335 m!1143941))

(declare-fun m!1143943 () Bool)

(assert (=> d!136335 m!1143943))

(declare-fun m!1143945 () Bool)

(assert (=> d!136335 m!1143945))

(declare-fun m!1143947 () Bool)

(assert (=> d!136335 m!1143947))

(declare-fun m!1143949 () Bool)

(assert (=> b!1240697 m!1143949))

(declare-fun m!1143951 () Bool)

(assert (=> b!1240698 m!1143951))

(assert (=> b!1240513 d!136335))

(declare-fun bm!61154 () Bool)

(declare-fun call!61158 () List!27325)

(declare-fun call!61159 () List!27325)

(assert (=> bm!61154 (= call!61158 call!61159)))

(declare-fun b!1240701 () Bool)

(declare-fun e!703253 () List!27325)

(declare-fun call!61157 () List!27325)

(assert (=> b!1240701 (= e!703253 call!61157)))

(declare-fun b!1240702 () Bool)

(declare-fun e!703250 () List!27325)

(assert (=> b!1240702 (= e!703250 call!61158)))

(declare-fun b!1240703 () Bool)

(declare-fun lt!562009 () List!27325)

(declare-fun e!703254 () Bool)

(assert (=> b!1240703 (= e!703254 (contains!7379 lt!562009 (tuple2!20193 a1!66 b1!77)))))

(declare-fun b!1240704 () Bool)

(declare-fun c!121271 () Bool)

(assert (=> b!1240704 (= c!121271 (and (is-Cons!27321 (toList!9096 lm!211)) (bvsgt (_1!10107 (h!28530 (toList!9096 lm!211))) a1!66)))))

(assert (=> b!1240704 (= e!703250 e!703253)))

(declare-fun c!121269 () Bool)

(declare-fun bm!61155 () Bool)

(declare-fun e!703251 () List!27325)

(assert (=> bm!61155 (= call!61159 ($colon$colon!611 e!703251 (ite c!121269 (h!28530 (toList!9096 lm!211)) (tuple2!20193 a1!66 b1!77))))))

(declare-fun c!121272 () Bool)

(assert (=> bm!61155 (= c!121272 c!121269)))

(declare-fun b!1240706 () Bool)

(declare-fun c!121270 () Bool)

(assert (=> b!1240706 (= e!703251 (ite c!121270 (t!40788 (toList!9096 lm!211)) (ite c!121271 (Cons!27321 (h!28530 (toList!9096 lm!211)) (t!40788 (toList!9096 lm!211))) Nil!27322)))))

(declare-fun b!1240707 () Bool)

(assert (=> b!1240707 (= e!703251 (insertStrictlySorted!419 (t!40788 (toList!9096 lm!211)) a1!66 b1!77))))

(declare-fun b!1240708 () Bool)

(declare-fun res!827833 () Bool)

(assert (=> b!1240708 (=> (not res!827833) (not e!703254))))

(assert (=> b!1240708 (= res!827833 (containsKey!597 lt!562009 a1!66))))

(declare-fun bm!61156 () Bool)

(assert (=> bm!61156 (= call!61157 call!61158)))

(declare-fun b!1240709 () Bool)

(declare-fun e!703252 () List!27325)

(assert (=> b!1240709 (= e!703252 e!703250)))

(assert (=> b!1240709 (= c!121270 (and (is-Cons!27321 (toList!9096 lm!211)) (= (_1!10107 (h!28530 (toList!9096 lm!211))) a1!66)))))

(declare-fun b!1240710 () Bool)

(assert (=> b!1240710 (= e!703252 call!61159)))

(declare-fun d!136339 () Bool)

(assert (=> d!136339 e!703254))

(declare-fun res!827832 () Bool)

(assert (=> d!136339 (=> (not res!827832) (not e!703254))))

(assert (=> d!136339 (= res!827832 (isStrictlySorted!733 lt!562009))))

(assert (=> d!136339 (= lt!562009 e!703252)))

(assert (=> d!136339 (= c!121269 (and (is-Cons!27321 (toList!9096 lm!211)) (bvslt (_1!10107 (h!28530 (toList!9096 lm!211))) a1!66)))))

(assert (=> d!136339 (isStrictlySorted!733 (toList!9096 lm!211))))

(assert (=> d!136339 (= (insertStrictlySorted!419 (toList!9096 lm!211) a1!66 b1!77) lt!562009)))

(declare-fun b!1240705 () Bool)

(assert (=> b!1240705 (= e!703253 call!61157)))

(assert (= (and d!136339 c!121269) b!1240710))

(assert (= (and d!136339 (not c!121269)) b!1240709))

(assert (= (and b!1240709 c!121270) b!1240702))

(assert (= (and b!1240709 (not c!121270)) b!1240704))

(assert (= (and b!1240704 c!121271) b!1240705))

(assert (= (and b!1240704 (not c!121271)) b!1240701))

(assert (= (or b!1240705 b!1240701) bm!61156))

(assert (= (or b!1240702 bm!61156) bm!61154))

(assert (= (or b!1240710 bm!61154) bm!61155))

(assert (= (and bm!61155 c!121272) b!1240707))

(assert (= (and bm!61155 (not c!121272)) b!1240706))

(assert (= (and d!136339 res!827832) b!1240708))

(assert (= (and b!1240708 res!827833) b!1240703))

(declare-fun m!1143969 () Bool)

(assert (=> d!136339 m!1143969))

(assert (=> d!136339 m!1143765))

(declare-fun m!1143971 () Bool)

(assert (=> bm!61155 m!1143971))

(declare-fun m!1143973 () Bool)

(assert (=> b!1240708 m!1143973))

(declare-fun m!1143975 () Bool)

(assert (=> b!1240703 m!1143975))

(declare-fun m!1143977 () Bool)

(assert (=> b!1240707 m!1143977))

(assert (=> b!1240513 d!136339))

(declare-fun d!136345 () Bool)

(assert (=> d!136345 (= (insertStrictlySorted!419 (removeStrictlySorted!112 (toList!9096 lm!211) a2!55) a1!66 b1!77) (removeStrictlySorted!112 (insertStrictlySorted!419 (toList!9096 lm!211) a1!66 b1!77) a2!55))))

(declare-fun lt!562020 () Unit!41231)

(declare-fun choose!1832 (List!27325 (_ BitVec 64) B!1796 (_ BitVec 64)) Unit!41231)

(assert (=> d!136345 (= lt!562020 (choose!1832 (toList!9096 lm!211) a1!66 b1!77 a2!55))))

(assert (=> d!136345 (not (= a1!66 a2!55))))

(assert (=> d!136345 (= (lemmaInsertAndRemoveStrictlySortedCommutative!1 (toList!9096 lm!211) a1!66 b1!77 a2!55) lt!562020)))

(declare-fun bs!34918 () Bool)

(assert (= bs!34918 d!136345))

(assert (=> bs!34918 m!1143767))

(assert (=> bs!34918 m!1143769))

(assert (=> bs!34918 m!1143767))

(declare-fun m!1144001 () Bool)

(assert (=> bs!34918 m!1144001))

(assert (=> bs!34918 m!1143771))

(assert (=> bs!34918 m!1143781))

(assert (=> bs!34918 m!1143771))

(assert (=> b!1240513 d!136345))

(declare-fun d!136351 () Bool)

(assert (=> d!136351 (= (inv!42773 lm!211) (isStrictlySorted!733 (toList!9096 lm!211)))))

(declare-fun bs!34920 () Bool)

(assert (= bs!34920 d!136351))

(assert (=> bs!34920 m!1143765))

(assert (=> start!103512 d!136351))

(declare-fun b!1240727 () Bool)

(declare-fun e!703263 () Bool)

(declare-fun tp!92546 () Bool)

(assert (=> b!1240727 (= e!703263 (and tp_is_empty!31195 tp!92546))))

(assert (=> b!1240514 (= tp!92537 e!703263)))

(assert (= (and b!1240514 (is-Cons!27321 (toList!9096 lm!211))) b!1240727))

(push 1)

