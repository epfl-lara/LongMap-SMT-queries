; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103516 () Bool)

(assert start!103516)

(declare-fun res!827766 () Bool)

(declare-fun e!703151 () Bool)

(assert (=> start!103516 (=> (not res!827766) (not e!703151))))

(declare-fun a1!66 () (_ BitVec 64))

(declare-fun a2!55 () (_ BitVec 64))

(assert (=> start!103516 (= res!827766 (not (= a1!66 a2!55)))))

(assert (=> start!103516 e!703151))

(assert (=> start!103516 true))

(declare-datatypes ((B!1800 0))(
  ( (B!1801 (val!15662 Int)) )
))
(declare-datatypes ((tuple2!20196 0))(
  ( (tuple2!20197 (_1!10109 (_ BitVec 64)) (_2!10109 B!1800)) )
))
(declare-datatypes ((List!27327 0))(
  ( (Nil!27324) (Cons!27323 (h!28532 tuple2!20196) (t!40790 List!27327)) )
))
(declare-datatypes ((ListLongMap!18165 0))(
  ( (ListLongMap!18166 (toList!9098 List!27327)) )
))
(declare-fun lm!211 () ListLongMap!18165)

(declare-fun e!703152 () Bool)

(declare-fun inv!42775 (ListLongMap!18165) Bool)

(assert (=> start!103516 (and (inv!42775 lm!211) e!703152)))

(declare-fun tp_is_empty!31199 () Bool)

(assert (=> start!103516 tp_is_empty!31199))

(declare-fun b!1240530 () Bool)

(declare-fun res!827767 () Bool)

(assert (=> b!1240530 (=> (not res!827767) (not e!703151))))

(declare-fun isStrictlySorted!735 (List!27327) Bool)

(assert (=> b!1240530 (= res!827767 (isStrictlySorted!735 (toList!9098 lm!211)))))

(declare-fun b!1240531 () Bool)

(declare-fun lt!561941 () tuple2!20196)

(declare-fun -!1987 (ListLongMap!18165 (_ BitVec 64)) ListLongMap!18165)

(declare-fun +!4134 (ListLongMap!18165 tuple2!20196) ListLongMap!18165)

(assert (=> b!1240531 (= e!703151 (not (= (-!1987 (+!4134 lm!211 lt!561941) a2!55) (+!4134 (-!1987 lm!211 a2!55) lt!561941))))))

(declare-fun b1!77 () B!1800)

(assert (=> b!1240531 (= lt!561941 (tuple2!20197 a1!66 b1!77))))

(declare-fun insertStrictlySorted!421 (List!27327 (_ BitVec 64) B!1800) List!27327)

(declare-fun removeStrictlySorted!114 (List!27327 (_ BitVec 64)) List!27327)

(assert (=> b!1240531 (= (insertStrictlySorted!421 (removeStrictlySorted!114 (toList!9098 lm!211) a2!55) a1!66 b1!77) (removeStrictlySorted!114 (insertStrictlySorted!421 (toList!9098 lm!211) a1!66 b1!77) a2!55))))

(declare-datatypes ((Unit!41235 0))(
  ( (Unit!41236) )
))
(declare-fun lt!561940 () Unit!41235)

(declare-fun lemmaInsertAndRemoveStrictlySortedCommutative!3 (List!27327 (_ BitVec 64) B!1800 (_ BitVec 64)) Unit!41235)

(assert (=> b!1240531 (= lt!561940 (lemmaInsertAndRemoveStrictlySortedCommutative!3 (toList!9098 lm!211) a1!66 b1!77 a2!55))))

(declare-fun b!1240532 () Bool)

(declare-fun tp!92543 () Bool)

(assert (=> b!1240532 (= e!703152 tp!92543)))

(assert (= (and start!103516 res!827766) b!1240530))

(assert (= (and b!1240530 res!827767) b!1240531))

(assert (= start!103516 b!1240532))

(declare-fun m!1143807 () Bool)

(assert (=> start!103516 m!1143807))

(declare-fun m!1143809 () Bool)

(assert (=> b!1240530 m!1143809))

(declare-fun m!1143811 () Bool)

(assert (=> b!1240531 m!1143811))

(declare-fun m!1143813 () Bool)

(assert (=> b!1240531 m!1143813))

(declare-fun m!1143815 () Bool)

(assert (=> b!1240531 m!1143815))

(declare-fun m!1143817 () Bool)

(assert (=> b!1240531 m!1143817))

(assert (=> b!1240531 m!1143811))

(declare-fun m!1143819 () Bool)

(assert (=> b!1240531 m!1143819))

(declare-fun m!1143821 () Bool)

(assert (=> b!1240531 m!1143821))

(declare-fun m!1143823 () Bool)

(assert (=> b!1240531 m!1143823))

(assert (=> b!1240531 m!1143823))

(declare-fun m!1143825 () Bool)

(assert (=> b!1240531 m!1143825))

(assert (=> b!1240531 m!1143819))

(assert (=> b!1240531 m!1143817))

(declare-fun m!1143827 () Bool)

(assert (=> b!1240531 m!1143827))

(push 1)

(assert (not b!1240532))

(assert (not b!1240531))

(assert (not start!103516))

(assert tp_is_empty!31199)

(assert (not b!1240530))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!136309 () Bool)

(declare-fun res!827784 () Bool)

(declare-fun e!703169 () Bool)

(assert (=> d!136309 (=> res!827784 e!703169)))

(assert (=> d!136309 (= res!827784 (or (is-Nil!27324 (toList!9098 lm!211)) (is-Nil!27324 (t!40790 (toList!9098 lm!211)))))))

(assert (=> d!136309 (= (isStrictlySorted!735 (toList!9098 lm!211)) e!703169)))

(declare-fun b!1240549 () Bool)

(declare-fun e!703170 () Bool)

(assert (=> b!1240549 (= e!703169 e!703170)))

(declare-fun res!827785 () Bool)

(assert (=> b!1240549 (=> (not res!827785) (not e!703170))))

(assert (=> b!1240549 (= res!827785 (bvslt (_1!10109 (h!28532 (toList!9098 lm!211))) (_1!10109 (h!28532 (t!40790 (toList!9098 lm!211))))))))

(declare-fun b!1240550 () Bool)

(assert (=> b!1240550 (= e!703170 (isStrictlySorted!735 (t!40790 (toList!9098 lm!211))))))

(assert (= (and d!136309 (not res!827784)) b!1240549))

(assert (= (and b!1240549 res!827785) b!1240550))

(declare-fun m!1143833 () Bool)

(assert (=> b!1240550 m!1143833))

(assert (=> b!1240530 d!136309))

(declare-fun b!1240631 () Bool)

(declare-fun e!703212 () List!27327)

(declare-fun call!61153 () List!27327)

(assert (=> b!1240631 (= e!703212 call!61153)))

(declare-fun b!1240632 () Bool)

(declare-fun e!703213 () List!27327)

(declare-fun call!61151 () List!27327)

(assert (=> b!1240632 (= e!703213 call!61151)))

(declare-fun d!136311 () Bool)

(declare-fun e!703211 () Bool)

(assert (=> d!136311 e!703211))

(declare-fun res!827806 () Bool)

(assert (=> d!136311 (=> (not res!827806) (not e!703211))))

(declare-fun lt!561966 () List!27327)

(assert (=> d!136311 (= res!827806 (isStrictlySorted!735 lt!561966))))

(assert (=> d!136311 (= lt!561966 e!703213)))

(declare-fun c!121249 () Bool)

(assert (=> d!136311 (= c!121249 (and (is-Cons!27323 (removeStrictlySorted!114 (toList!9098 lm!211) a2!55)) (bvslt (_1!10109 (h!28532 (removeStrictlySorted!114 (toList!9098 lm!211) a2!55))) a1!66)))))

(assert (=> d!136311 (isStrictlySorted!735 (removeStrictlySorted!114 (toList!9098 lm!211) a2!55))))

(assert (=> d!136311 (= (insertStrictlySorted!421 (removeStrictlySorted!114 (toList!9098 lm!211) a2!55) a1!66 b1!77) lt!561966)))

(declare-fun e!703214 () List!27327)

(declare-fun b!1240633 () Bool)

(assert (=> b!1240633 (= e!703214 (insertStrictlySorted!421 (t!40790 (removeStrictlySorted!114 (toList!9098 lm!211) a2!55)) a1!66 b1!77))))

(declare-fun b!1240634 () Bool)

(declare-fun res!827807 () Bool)

(assert (=> b!1240634 (=> (not res!827807) (not e!703211))))

(declare-fun containsKey!599 (List!27327 (_ BitVec 64)) Bool)

(assert (=> b!1240634 (= res!827807 (containsKey!599 lt!561966 a1!66))))

(declare-fun bm!61148 () Bool)

(declare-fun call!61152 () List!27327)

(assert (=> bm!61148 (= call!61153 call!61152)))

(declare-fun b!1240635 () Bool)

(declare-fun contains!7382 (List!27327 tuple2!20196) Bool)

(assert (=> b!1240635 (= e!703211 (contains!7382 lt!561966 (tuple2!20197 a1!66 b1!77)))))

(declare-fun c!121250 () Bool)

(declare-fun c!121248 () Bool)

(declare-fun b!1240636 () Bool)

(assert (=> b!1240636 (= e!703214 (ite c!121248 (t!40790 (removeStrictlySorted!114 (toList!9098 lm!211) a2!55)) (ite c!121250 (Cons!27323 (h!28532 (removeStrictlySorted!114 (toList!9098 lm!211) a2!55)) (t!40790 (removeStrictlySorted!114 (toList!9098 lm!211) a2!55))) Nil!27324)))))

(declare-fun bm!61149 () Bool)

(assert (=> bm!61149 (= call!61152 call!61151)))

(declare-fun b!1240637 () Bool)

(assert (=> b!1240637 (= c!121250 (and (is-Cons!27323 (removeStrictlySorted!114 (toList!9098 lm!211) a2!55)) (bvsgt (_1!10109 (h!28532 (removeStrictlySorted!114 (toList!9098 lm!211) a2!55))) a1!66)))))

(declare-fun e!703215 () List!27327)

(assert (=> b!1240637 (= e!703215 e!703212)))

(declare-fun b!1240638 () Bool)

(assert (=> b!1240638 (= e!703213 e!703215)))

(assert (=> b!1240638 (= c!121248 (and (is-Cons!27323 (removeStrictlySorted!114 (toList!9098 lm!211) a2!55)) (= (_1!10109 (h!28532 (removeStrictlySorted!114 (toList!9098 lm!211) a2!55))) a1!66)))))

(declare-fun b!1240639 () Bool)

(assert (=> b!1240639 (= e!703215 call!61152)))

(declare-fun bm!61150 () Bool)

(declare-fun $colon$colon!613 (List!27327 tuple2!20196) List!27327)

(assert (=> bm!61150 (= call!61151 ($colon$colon!613 e!703214 (ite c!121249 (h!28532 (removeStrictlySorted!114 (toList!9098 lm!211) a2!55)) (tuple2!20197 a1!66 b1!77))))))

(declare-fun c!121247 () Bool)

(assert (=> bm!61150 (= c!121247 c!121249)))

(declare-fun b!1240640 () Bool)

(assert (=> b!1240640 (= e!703212 call!61153)))

(assert (= (and d!136311 c!121249) b!1240632))

(assert (= (and d!136311 (not c!121249)) b!1240638))

(assert (= (and b!1240638 c!121248) b!1240639))

(assert (= (and b!1240638 (not c!121248)) b!1240637))

(assert (= (and b!1240637 c!121250) b!1240631))

(assert (= (and b!1240637 (not c!121250)) b!1240640))

(assert (= (or b!1240631 b!1240640) bm!61148))

(assert (= (or b!1240639 bm!61148) bm!61149))

(assert (= (or b!1240632 bm!61149) bm!61150))

(assert (= (and bm!61150 c!121247) b!1240633))

(assert (= (and bm!61150 (not c!121247)) b!1240636))

(assert (= (and d!136311 res!827806) b!1240634))

(assert (= (and b!1240634 res!827807) b!1240635))

(declare-fun m!1143861 () Bool)

(assert (=> b!1240633 m!1143861))

(declare-fun m!1143863 () Bool)

(assert (=> b!1240634 m!1143863))

(declare-fun m!1143865 () Bool)

(assert (=> d!136311 m!1143865))

(assert (=> d!136311 m!1143811))

(declare-fun m!1143867 () Bool)

(assert (=> d!136311 m!1143867))

(declare-fun m!1143869 () Bool)

(assert (=> b!1240635 m!1143869))

(declare-fun m!1143871 () Bool)

(assert (=> bm!61150 m!1143871))

(assert (=> b!1240531 d!136311))

(declare-fun d!136319 () Bool)

(declare-fun lt!561972 () ListLongMap!18165)

(declare-fun contains!7383 (ListLongMap!18165 (_ BitVec 64)) Bool)

(assert (=> d!136319 (not (contains!7383 lt!561972 a2!55))))

(assert (=> d!136319 (= lt!561972 (ListLongMap!18166 (removeStrictlySorted!114 (toList!9098 lm!211) a2!55)))))

(assert (=> d!136319 (= (-!1987 lm!211 a2!55) lt!561972)))

(declare-fun bs!34914 () Bool)

(assert (= bs!34914 d!136319))

(declare-fun m!1143903 () Bool)

(assert (=> bs!34914 m!1143903))

(assert (=> bs!34914 m!1143811))

(assert (=> b!1240531 d!136319))

(declare-fun d!136327 () Bool)

(declare-fun e!703260 () Bool)

(assert (=> d!136327 e!703260))

(declare-fun res!827836 () Bool)

(assert (=> d!136327 (=> (not res!827836) (not e!703260))))

(declare-fun lt!562014 () ListLongMap!18165)

(assert (=> d!136327 (= res!827836 (contains!7383 lt!562014 (_1!10109 lt!561941)))))

(declare-fun lt!562012 () List!27327)

(assert (=> d!136327 (= lt!562014 (ListLongMap!18166 lt!562012))))

(declare-fun lt!562015 () Unit!41235)

(declare-fun lt!562013 () Unit!41235)

(assert (=> d!136327 (= lt!562015 lt!562013)))

(declare-datatypes ((Option!702 0))(
  ( (Some!701 (v!18372 B!1800)) (None!700) )
))
(declare-fun getValueByKey!651 (List!27327 (_ BitVec 64)) Option!702)

(assert (=> d!136327 (= (getValueByKey!651 lt!562012 (_1!10109 lt!561941)) (Some!701 (_2!10109 lt!561941)))))

(declare-fun lemmaContainsTupThenGetReturnValue!328 (List!27327 (_ BitVec 64) B!1800) Unit!41235)

(assert (=> d!136327 (= lt!562013 (lemmaContainsTupThenGetReturnValue!328 lt!562012 (_1!10109 lt!561941) (_2!10109 lt!561941)))))

(assert (=> d!136327 (= lt!562012 (insertStrictlySorted!421 (toList!9098 lm!211) (_1!10109 lt!561941) (_2!10109 lt!561941)))))

(assert (=> d!136327 (= (+!4134 lm!211 lt!561941) lt!562014)))

(declare-fun b!1240721 () Bool)

(declare-fun res!827837 () Bool)

(assert (=> b!1240721 (=> (not res!827837) (not e!703260))))

(assert (=> b!1240721 (= res!827837 (= (getValueByKey!651 (toList!9098 lt!562014) (_1!10109 lt!561941)) (Some!701 (_2!10109 lt!561941))))))

(declare-fun b!1240722 () Bool)

(assert (=> b!1240722 (= e!703260 (contains!7382 (toList!9098 lt!562014) lt!561941))))

(assert (= (and d!136327 res!827836) b!1240721))

(assert (= (and b!1240721 res!827837) b!1240722))

(declare-fun m!1143989 () Bool)

(assert (=> d!136327 m!1143989))

(declare-fun m!1143991 () Bool)

(assert (=> d!136327 m!1143991))

(declare-fun m!1143993 () Bool)

(assert (=> d!136327 m!1143993))

(declare-fun m!1143995 () Bool)

(assert (=> d!136327 m!1143995))

(declare-fun m!1143997 () Bool)

(assert (=> b!1240721 m!1143997))

(declare-fun m!1143999 () Bool)

(assert (=> b!1240722 m!1143999))

(assert (=> b!1240531 d!136327))

(declare-fun b!1240743 () Bool)

(declare-fun e!703274 () List!27327)

(assert (=> b!1240743 (= e!703274 Nil!27324)))

(declare-fun b!1240745 () Bool)

(declare-fun e!703275 () List!27327)

(assert (=> b!1240745 (= e!703275 e!703274)))

(declare-fun c!121282 () Bool)

(assert (=> b!1240745 (= c!121282 (and (is-Cons!27323 (insertStrictlySorted!421 (toList!9098 lm!211) a1!66 b1!77)) (not (= (_1!10109 (h!28532 (insertStrictlySorted!421 (toList!9098 lm!211) a1!66 b1!77))) a2!55))))))

(declare-fun b!1240746 () Bool)

(assert (=> b!1240746 (= e!703275 (t!40790 (insertStrictlySorted!421 (toList!9098 lm!211) a1!66 b1!77)))))

(declare-fun b!1240747 () Bool)

(assert (=> b!1240747 (= e!703274 ($colon$colon!613 (removeStrictlySorted!114 (t!40790 (insertStrictlySorted!421 (toList!9098 lm!211) a1!66 b1!77)) a2!55) (h!28532 (insertStrictlySorted!421 (toList!9098 lm!211) a1!66 b1!77))))))

(declare-fun b!1240744 () Bool)

(declare-fun e!703273 () Bool)

(declare-fun lt!562024 () List!27327)

(assert (=> b!1240744 (= e!703273 (not (containsKey!599 lt!562024 a2!55)))))

(declare-fun d!136349 () Bool)

(assert (=> d!136349 e!703273))

(declare-fun res!827840 () Bool)

(assert (=> d!136349 (=> (not res!827840) (not e!703273))))

(assert (=> d!136349 (= res!827840 (isStrictlySorted!735 lt!562024))))

(assert (=> d!136349 (= lt!562024 e!703275)))

(declare-fun c!121281 () Bool)

(assert (=> d!136349 (= c!121281 (and (is-Cons!27323 (insertStrictlySorted!421 (toList!9098 lm!211) a1!66 b1!77)) (= (_1!10109 (h!28532 (insertStrictlySorted!421 (toList!9098 lm!211) a1!66 b1!77))) a2!55)))))

(assert (=> d!136349 (isStrictlySorted!735 (insertStrictlySorted!421 (toList!9098 lm!211) a1!66 b1!77))))

(assert (=> d!136349 (= (removeStrictlySorted!114 (insertStrictlySorted!421 (toList!9098 lm!211) a1!66 b1!77) a2!55) lt!562024)))

(assert (= (and d!136349 c!121281) b!1240746))

(assert (= (and d!136349 (not c!121281)) b!1240745))

(assert (= (and b!1240745 c!121282) b!1240747))

(assert (= (and b!1240745 (not c!121282)) b!1240743))

(assert (= (and d!136349 res!827840) b!1240744))

(declare-fun m!1144005 () Bool)

(assert (=> b!1240747 m!1144005))

(assert (=> b!1240747 m!1144005))

(declare-fun m!1144007 () Bool)

(assert (=> b!1240747 m!1144007))

(declare-fun m!1144009 () Bool)

(assert (=> b!1240744 m!1144009))

(declare-fun m!1144011 () Bool)

(assert (=> d!136349 m!1144011))

(assert (=> d!136349 m!1143817))

(declare-fun m!1144013 () Bool)

(assert (=> d!136349 m!1144013))

(assert (=> b!1240531 d!136349))

(declare-fun b!1240748 () Bool)

(declare-fun e!703277 () List!27327)

(assert (=> b!1240748 (= e!703277 Nil!27324)))

(declare-fun b!1240750 () Bool)

(declare-fun e!703278 () List!27327)

(assert (=> b!1240750 (= e!703278 e!703277)))

(declare-fun c!121284 () Bool)

(assert (=> b!1240750 (= c!121284 (and (is-Cons!27323 (toList!9098 lm!211)) (not (= (_1!10109 (h!28532 (toList!9098 lm!211))) a2!55))))))

(declare-fun b!1240751 () Bool)

(assert (=> b!1240751 (= e!703278 (t!40790 (toList!9098 lm!211)))))

(declare-fun b!1240752 () Bool)

(assert (=> b!1240752 (= e!703277 ($colon$colon!613 (removeStrictlySorted!114 (t!40790 (toList!9098 lm!211)) a2!55) (h!28532 (toList!9098 lm!211))))))

(declare-fun b!1240749 () Bool)

(declare-fun e!703276 () Bool)

(declare-fun lt!562025 () List!27327)

(assert (=> b!1240749 (= e!703276 (not (containsKey!599 lt!562025 a2!55)))))

(declare-fun d!136355 () Bool)

(assert (=> d!136355 e!703276))

(declare-fun res!827841 () Bool)

(assert (=> d!136355 (=> (not res!827841) (not e!703276))))

(assert (=> d!136355 (= res!827841 (isStrictlySorted!735 lt!562025))))

(assert (=> d!136355 (= lt!562025 e!703278)))

(declare-fun c!121283 () Bool)

(assert (=> d!136355 (= c!121283 (and (is-Cons!27323 (toList!9098 lm!211)) (= (_1!10109 (h!28532 (toList!9098 lm!211))) a2!55)))))

(assert (=> d!136355 (isStrictlySorted!735 (toList!9098 lm!211))))

(assert (=> d!136355 (= (removeStrictlySorted!114 (toList!9098 lm!211) a2!55) lt!562025)))

(assert (= (and d!136355 c!121283) b!1240751))

(assert (= (and d!136355 (not c!121283)) b!1240750))

(assert (= (and b!1240750 c!121284) b!1240752))

(assert (= (and b!1240750 (not c!121284)) b!1240748))

(assert (= (and d!136355 res!827841) b!1240749))

(declare-fun m!1144015 () Bool)

(assert (=> b!1240752 m!1144015))

(assert (=> b!1240752 m!1144015))

(declare-fun m!1144017 () Bool)

(assert (=> b!1240752 m!1144017))

