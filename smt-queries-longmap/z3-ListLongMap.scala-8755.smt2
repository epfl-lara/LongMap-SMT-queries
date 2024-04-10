; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106272 () Bool)

(assert start!106272)

(declare-fun b!1264703 () Bool)

(declare-fun res!842227 () Bool)

(declare-fun e!720206 () Bool)

(assert (=> b!1264703 (=> (not res!842227) (not e!720206))))

(declare-datatypes ((B!1924 0))(
  ( (B!1925 (val!16297 Int)) )
))
(declare-datatypes ((tuple2!21112 0))(
  ( (tuple2!21113 (_1!10567 (_ BitVec 64)) (_2!10567 B!1924)) )
))
(declare-datatypes ((List!28289 0))(
  ( (Nil!28286) (Cons!28285 (h!29494 tuple2!21112) (t!41810 List!28289)) )
))
(declare-datatypes ((ListLongMap!18985 0))(
  ( (ListLongMap!18986 (toList!9508 List!28289)) )
))
(declare-fun lm!212 () ListLongMap!18985)

(declare-fun a1!67 () (_ BitVec 64))

(declare-fun containsKey!635 (List!28289 (_ BitVec 64)) Bool)

(assert (=> b!1264703 (= res!842227 (not (containsKey!635 (toList!9508 lm!212) a1!67)))))

(declare-fun b!1264704 () Bool)

(declare-fun b1!78 () B!1924)

(declare-fun -!2153 (ListLongMap!18985 (_ BitVec 64)) ListLongMap!18985)

(declare-fun +!4266 (ListLongMap!18985 tuple2!21112) ListLongMap!18985)

(assert (=> b!1264704 (= e!720206 (not (= (-!2153 (+!4266 lm!212 (tuple2!21113 a1!67 b1!78)) a1!67) lm!212)))))

(declare-fun removeStrictlySorted!147 (List!28289 (_ BitVec 64)) List!28289)

(declare-fun insertStrictlySorted!454 (List!28289 (_ BitVec 64) B!1924) List!28289)

(assert (=> b!1264704 (= (removeStrictlySorted!147 (insertStrictlySorted!454 (toList!9508 lm!212) a1!67 b1!78) a1!67) (toList!9508 lm!212))))

(declare-datatypes ((Unit!42164 0))(
  ( (Unit!42165) )
))
(declare-fun lt!573882 () Unit!42164)

(declare-fun lemmaInsertStrictlySortedThenRemoveIsSame!2 (List!28289 (_ BitVec 64) B!1924) Unit!42164)

(assert (=> b!1264704 (= lt!573882 (lemmaInsertStrictlySortedThenRemoveIsSame!2 (toList!9508 lm!212) a1!67 b1!78))))

(declare-fun res!842226 () Bool)

(assert (=> start!106272 (=> (not res!842226) (not e!720206))))

(declare-fun contains!7629 (ListLongMap!18985 (_ BitVec 64)) Bool)

(assert (=> start!106272 (= res!842226 (not (contains!7629 lm!212 a1!67)))))

(assert (=> start!106272 e!720206))

(declare-fun e!720205 () Bool)

(declare-fun inv!44089 (ListLongMap!18985) Bool)

(assert (=> start!106272 (and (inv!44089 lm!212) e!720205)))

(assert (=> start!106272 true))

(declare-fun tp_is_empty!32457 () Bool)

(assert (=> start!106272 tp_is_empty!32457))

(declare-fun b!1264702 () Bool)

(declare-fun res!842225 () Bool)

(assert (=> b!1264702 (=> (not res!842225) (not e!720206))))

(declare-fun isStrictlySorted!776 (List!28289) Bool)

(assert (=> b!1264702 (= res!842225 (isStrictlySorted!776 (toList!9508 lm!212)))))

(declare-fun b!1264705 () Bool)

(declare-fun tp!96242 () Bool)

(assert (=> b!1264705 (= e!720205 tp!96242)))

(assert (= (and start!106272 res!842226) b!1264702))

(assert (= (and b!1264702 res!842225) b!1264703))

(assert (= (and b!1264703 res!842227) b!1264704))

(assert (= start!106272 b!1264705))

(declare-fun m!1165191 () Bool)

(assert (=> b!1264703 m!1165191))

(declare-fun m!1165193 () Bool)

(assert (=> b!1264704 m!1165193))

(declare-fun m!1165195 () Bool)

(assert (=> b!1264704 m!1165195))

(declare-fun m!1165197 () Bool)

(assert (=> b!1264704 m!1165197))

(declare-fun m!1165199 () Bool)

(assert (=> b!1264704 m!1165199))

(assert (=> b!1264704 m!1165199))

(declare-fun m!1165201 () Bool)

(assert (=> b!1264704 m!1165201))

(assert (=> b!1264704 m!1165193))

(declare-fun m!1165203 () Bool)

(assert (=> start!106272 m!1165203))

(declare-fun m!1165205 () Bool)

(assert (=> start!106272 m!1165205))

(declare-fun m!1165207 () Bool)

(assert (=> b!1264702 m!1165207))

(check-sat (not b!1264703) (not b!1264704) (not b!1264705) (not b!1264702) (not start!106272) tp_is_empty!32457)
(check-sat)
(get-model)

(declare-fun d!138783 () Bool)

(declare-fun res!842241 () Bool)

(declare-fun e!720219 () Bool)

(assert (=> d!138783 (=> res!842241 e!720219)))

(get-info :version)

(assert (=> d!138783 (= res!842241 (and ((_ is Cons!28285) (toList!9508 lm!212)) (= (_1!10567 (h!29494 (toList!9508 lm!212))) a1!67)))))

(assert (=> d!138783 (= (containsKey!635 (toList!9508 lm!212) a1!67) e!720219)))

(declare-fun b!1264726 () Bool)

(declare-fun e!720220 () Bool)

(assert (=> b!1264726 (= e!720219 e!720220)))

(declare-fun res!842242 () Bool)

(assert (=> b!1264726 (=> (not res!842242) (not e!720220))))

(assert (=> b!1264726 (= res!842242 (and (or (not ((_ is Cons!28285) (toList!9508 lm!212))) (bvsle (_1!10567 (h!29494 (toList!9508 lm!212))) a1!67)) ((_ is Cons!28285) (toList!9508 lm!212)) (bvslt (_1!10567 (h!29494 (toList!9508 lm!212))) a1!67)))))

(declare-fun b!1264727 () Bool)

(assert (=> b!1264727 (= e!720220 (containsKey!635 (t!41810 (toList!9508 lm!212)) a1!67))))

(assert (= (and d!138783 (not res!842241)) b!1264726))

(assert (= (and b!1264726 res!842242) b!1264727))

(declare-fun m!1165229 () Bool)

(assert (=> b!1264727 m!1165229))

(assert (=> b!1264703 d!138783))

(declare-fun d!138785 () Bool)

(declare-fun e!720244 () Bool)

(assert (=> d!138785 e!720244))

(declare-fun res!842257 () Bool)

(assert (=> d!138785 (=> res!842257 e!720244)))

(declare-fun lt!573918 () Bool)

(assert (=> d!138785 (= res!842257 (not lt!573918))))

(declare-fun lt!573917 () Bool)

(assert (=> d!138785 (= lt!573918 lt!573917)))

(declare-fun lt!573916 () Unit!42164)

(declare-fun e!720245 () Unit!42164)

(assert (=> d!138785 (= lt!573916 e!720245)))

(declare-fun c!123166 () Bool)

(assert (=> d!138785 (= c!123166 lt!573917)))

(assert (=> d!138785 (= lt!573917 (containsKey!635 (toList!9508 lm!212) a1!67))))

(assert (=> d!138785 (= (contains!7629 lm!212 a1!67) lt!573918)))

(declare-fun b!1264760 () Bool)

(declare-fun lt!573915 () Unit!42164)

(assert (=> b!1264760 (= e!720245 lt!573915)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!444 (List!28289 (_ BitVec 64)) Unit!42164)

(assert (=> b!1264760 (= lt!573915 (lemmaContainsKeyImpliesGetValueByKeyDefined!444 (toList!9508 lm!212) a1!67))))

(declare-datatypes ((Option!728 0))(
  ( (Some!727 (v!19005 B!1924)) (None!726) )
))
(declare-fun isDefined!483 (Option!728) Bool)

(declare-fun getValueByKey!676 (List!28289 (_ BitVec 64)) Option!728)

(assert (=> b!1264760 (isDefined!483 (getValueByKey!676 (toList!9508 lm!212) a1!67))))

(declare-fun b!1264761 () Bool)

(declare-fun Unit!42169 () Unit!42164)

(assert (=> b!1264761 (= e!720245 Unit!42169)))

(declare-fun b!1264762 () Bool)

(assert (=> b!1264762 (= e!720244 (isDefined!483 (getValueByKey!676 (toList!9508 lm!212) a1!67)))))

(assert (= (and d!138785 c!123166) b!1264760))

(assert (= (and d!138785 (not c!123166)) b!1264761))

(assert (= (and d!138785 (not res!842257)) b!1264762))

(assert (=> d!138785 m!1165191))

(declare-fun m!1165245 () Bool)

(assert (=> b!1264760 m!1165245))

(declare-fun m!1165249 () Bool)

(assert (=> b!1264760 m!1165249))

(assert (=> b!1264760 m!1165249))

(declare-fun m!1165255 () Bool)

(assert (=> b!1264760 m!1165255))

(assert (=> b!1264762 m!1165249))

(assert (=> b!1264762 m!1165249))

(assert (=> b!1264762 m!1165255))

(assert (=> start!106272 d!138785))

(declare-fun d!138799 () Bool)

(assert (=> d!138799 (= (inv!44089 lm!212) (isStrictlySorted!776 (toList!9508 lm!212)))))

(declare-fun bs!35789 () Bool)

(assert (= bs!35789 d!138799))

(assert (=> bs!35789 m!1165207))

(assert (=> start!106272 d!138799))

(declare-fun d!138801 () Bool)

(declare-fun res!842264 () Bool)

(declare-fun e!720256 () Bool)

(assert (=> d!138801 (=> res!842264 e!720256)))

(assert (=> d!138801 (= res!842264 (or ((_ is Nil!28286) (toList!9508 lm!212)) ((_ is Nil!28286) (t!41810 (toList!9508 lm!212)))))))

(assert (=> d!138801 (= (isStrictlySorted!776 (toList!9508 lm!212)) e!720256)))

(declare-fun b!1264777 () Bool)

(declare-fun e!720257 () Bool)

(assert (=> b!1264777 (= e!720256 e!720257)))

(declare-fun res!842265 () Bool)

(assert (=> b!1264777 (=> (not res!842265) (not e!720257))))

(assert (=> b!1264777 (= res!842265 (bvslt (_1!10567 (h!29494 (toList!9508 lm!212))) (_1!10567 (h!29494 (t!41810 (toList!9508 lm!212))))))))

(declare-fun b!1264778 () Bool)

(assert (=> b!1264778 (= e!720257 (isStrictlySorted!776 (t!41810 (toList!9508 lm!212))))))

(assert (= (and d!138801 (not res!842264)) b!1264777))

(assert (= (and b!1264777 res!842265) b!1264778))

(declare-fun m!1165257 () Bool)

(assert (=> b!1264778 m!1165257))

(assert (=> b!1264702 d!138801))

(declare-fun d!138803 () Bool)

(assert (=> d!138803 (= (removeStrictlySorted!147 (insertStrictlySorted!454 (toList!9508 lm!212) a1!67 b1!78) a1!67) (toList!9508 lm!212))))

(declare-fun lt!573932 () Unit!42164)

(declare-fun choose!1882 (List!28289 (_ BitVec 64) B!1924) Unit!42164)

(assert (=> d!138803 (= lt!573932 (choose!1882 (toList!9508 lm!212) a1!67 b1!78))))

(assert (=> d!138803 (isStrictlySorted!776 (toList!9508 lm!212))))

(assert (=> d!138803 (= (lemmaInsertStrictlySortedThenRemoveIsSame!2 (toList!9508 lm!212) a1!67 b1!78) lt!573932)))

(declare-fun bs!35790 () Bool)

(assert (= bs!35790 d!138803))

(assert (=> bs!35790 m!1165199))

(assert (=> bs!35790 m!1165199))

(assert (=> bs!35790 m!1165201))

(declare-fun m!1165269 () Bool)

(assert (=> bs!35790 m!1165269))

(assert (=> bs!35790 m!1165207))

(assert (=> b!1264704 d!138803))

(declare-fun b!1264806 () Bool)

(declare-fun e!720273 () List!28289)

(assert (=> b!1264806 (= e!720273 Nil!28286)))

(declare-fun d!138807 () Bool)

(declare-fun e!720275 () Bool)

(assert (=> d!138807 e!720275))

(declare-fun res!842281 () Bool)

(assert (=> d!138807 (=> (not res!842281) (not e!720275))))

(declare-fun lt!573957 () List!28289)

(assert (=> d!138807 (= res!842281 (isStrictlySorted!776 lt!573957))))

(declare-fun e!720274 () List!28289)

(assert (=> d!138807 (= lt!573957 e!720274)))

(declare-fun c!123177 () Bool)

(assert (=> d!138807 (= c!123177 (and ((_ is Cons!28285) (insertStrictlySorted!454 (toList!9508 lm!212) a1!67 b1!78)) (= (_1!10567 (h!29494 (insertStrictlySorted!454 (toList!9508 lm!212) a1!67 b1!78))) a1!67)))))

(assert (=> d!138807 (isStrictlySorted!776 (insertStrictlySorted!454 (toList!9508 lm!212) a1!67 b1!78))))

(assert (=> d!138807 (= (removeStrictlySorted!147 (insertStrictlySorted!454 (toList!9508 lm!212) a1!67 b1!78) a1!67) lt!573957)))

(declare-fun b!1264807 () Bool)

(assert (=> b!1264807 (= e!720274 e!720273)))

(declare-fun c!123178 () Bool)

(assert (=> b!1264807 (= c!123178 (and ((_ is Cons!28285) (insertStrictlySorted!454 (toList!9508 lm!212) a1!67 b1!78)) (not (= (_1!10567 (h!29494 (insertStrictlySorted!454 (toList!9508 lm!212) a1!67 b1!78))) a1!67))))))

(declare-fun b!1264808 () Bool)

(assert (=> b!1264808 (= e!720274 (t!41810 (insertStrictlySorted!454 (toList!9508 lm!212) a1!67 b1!78)))))

(declare-fun b!1264809 () Bool)

(assert (=> b!1264809 (= e!720275 (not (containsKey!635 lt!573957 a1!67)))))

(declare-fun b!1264810 () Bool)

(declare-fun $colon$colon!634 (List!28289 tuple2!21112) List!28289)

(assert (=> b!1264810 (= e!720273 ($colon$colon!634 (removeStrictlySorted!147 (t!41810 (insertStrictlySorted!454 (toList!9508 lm!212) a1!67 b1!78)) a1!67) (h!29494 (insertStrictlySorted!454 (toList!9508 lm!212) a1!67 b1!78))))))

(assert (= (and d!138807 c!123177) b!1264808))

(assert (= (and d!138807 (not c!123177)) b!1264807))

(assert (= (and b!1264807 c!123178) b!1264810))

(assert (= (and b!1264807 (not c!123178)) b!1264806))

(assert (= (and d!138807 res!842281) b!1264809))

(declare-fun m!1165303 () Bool)

(assert (=> d!138807 m!1165303))

(assert (=> d!138807 m!1165199))

(declare-fun m!1165305 () Bool)

(assert (=> d!138807 m!1165305))

(declare-fun m!1165307 () Bool)

(assert (=> b!1264809 m!1165307))

(declare-fun m!1165309 () Bool)

(assert (=> b!1264810 m!1165309))

(assert (=> b!1264810 m!1165309))

(declare-fun m!1165311 () Bool)

(assert (=> b!1264810 m!1165311))

(assert (=> b!1264704 d!138807))

(declare-fun d!138817 () Bool)

(declare-fun e!720298 () Bool)

(assert (=> d!138817 e!720298))

(declare-fun res!842294 () Bool)

(assert (=> d!138817 (=> (not res!842294) (not e!720298))))

(declare-fun lt!573971 () ListLongMap!18985)

(assert (=> d!138817 (= res!842294 (contains!7629 lt!573971 (_1!10567 (tuple2!21113 a1!67 b1!78))))))

(declare-fun lt!573973 () List!28289)

(assert (=> d!138817 (= lt!573971 (ListLongMap!18986 lt!573973))))

(declare-fun lt!573970 () Unit!42164)

(declare-fun lt!573972 () Unit!42164)

(assert (=> d!138817 (= lt!573970 lt!573972)))

(assert (=> d!138817 (= (getValueByKey!676 lt!573973 (_1!10567 (tuple2!21113 a1!67 b1!78))) (Some!727 (_2!10567 (tuple2!21113 a1!67 b1!78))))))

(declare-fun lemmaContainsTupThenGetReturnValue!341 (List!28289 (_ BitVec 64) B!1924) Unit!42164)

(assert (=> d!138817 (= lt!573972 (lemmaContainsTupThenGetReturnValue!341 lt!573973 (_1!10567 (tuple2!21113 a1!67 b1!78)) (_2!10567 (tuple2!21113 a1!67 b1!78))))))

(assert (=> d!138817 (= lt!573973 (insertStrictlySorted!454 (toList!9508 lm!212) (_1!10567 (tuple2!21113 a1!67 b1!78)) (_2!10567 (tuple2!21113 a1!67 b1!78))))))

(assert (=> d!138817 (= (+!4266 lm!212 (tuple2!21113 a1!67 b1!78)) lt!573971)))

(declare-fun b!1264855 () Bool)

(declare-fun res!842295 () Bool)

(assert (=> b!1264855 (=> (not res!842295) (not e!720298))))

(assert (=> b!1264855 (= res!842295 (= (getValueByKey!676 (toList!9508 lt!573971) (_1!10567 (tuple2!21113 a1!67 b1!78))) (Some!727 (_2!10567 (tuple2!21113 a1!67 b1!78)))))))

(declare-fun b!1264856 () Bool)

(declare-fun contains!7633 (List!28289 tuple2!21112) Bool)

(assert (=> b!1264856 (= e!720298 (contains!7633 (toList!9508 lt!573971) (tuple2!21113 a1!67 b1!78)))))

(assert (= (and d!138817 res!842294) b!1264855))

(assert (= (and b!1264855 res!842295) b!1264856))

(declare-fun m!1165313 () Bool)

(assert (=> d!138817 m!1165313))

(declare-fun m!1165315 () Bool)

(assert (=> d!138817 m!1165315))

(declare-fun m!1165317 () Bool)

(assert (=> d!138817 m!1165317))

(declare-fun m!1165319 () Bool)

(assert (=> d!138817 m!1165319))

(declare-fun m!1165321 () Bool)

(assert (=> b!1264855 m!1165321))

(declare-fun m!1165323 () Bool)

(assert (=> b!1264856 m!1165323))

(assert (=> b!1264704 d!138817))

(declare-fun d!138819 () Bool)

(declare-fun lt!573978 () ListLongMap!18985)

(assert (=> d!138819 (not (contains!7629 lt!573978 a1!67))))

(assert (=> d!138819 (= lt!573978 (ListLongMap!18986 (removeStrictlySorted!147 (toList!9508 (+!4266 lm!212 (tuple2!21113 a1!67 b1!78))) a1!67)))))

(assert (=> d!138819 (= (-!2153 (+!4266 lm!212 (tuple2!21113 a1!67 b1!78)) a1!67) lt!573978)))

(declare-fun bs!35793 () Bool)

(assert (= bs!35793 d!138819))

(declare-fun m!1165335 () Bool)

(assert (=> bs!35793 m!1165335))

(declare-fun m!1165337 () Bool)

(assert (=> bs!35793 m!1165337))

(assert (=> b!1264704 d!138819))

(declare-fun bm!62354 () Bool)

(declare-fun call!62358 () List!28289)

(declare-fun call!62359 () List!28289)

(assert (=> bm!62354 (= call!62358 call!62359)))

(declare-fun bm!62355 () Bool)

(declare-fun call!62357 () List!28289)

(assert (=> bm!62355 (= call!62359 call!62357)))

(declare-fun c!123216 () Bool)

(declare-fun e!720348 () List!28289)

(declare-fun bm!62356 () Bool)

(assert (=> bm!62356 (= call!62357 ($colon$colon!634 e!720348 (ite c!123216 (h!29494 (toList!9508 lm!212)) (tuple2!21113 a1!67 b1!78))))))

(declare-fun c!123215 () Bool)

(assert (=> bm!62356 (= c!123215 c!123216)))

(declare-fun b!1264927 () Bool)

(declare-fun res!842323 () Bool)

(declare-fun e!720346 () Bool)

(assert (=> b!1264927 (=> (not res!842323) (not e!720346))))

(declare-fun lt!573993 () List!28289)

(assert (=> b!1264927 (= res!842323 (containsKey!635 lt!573993 a1!67))))

(declare-fun b!1264928 () Bool)

(declare-fun e!720344 () List!28289)

(assert (=> b!1264928 (= e!720344 call!62358)))

(declare-fun b!1264929 () Bool)

(assert (=> b!1264929 (= e!720348 (insertStrictlySorted!454 (t!41810 (toList!9508 lm!212)) a1!67 b1!78))))

(declare-fun b!1264930 () Bool)

(declare-fun c!123217 () Bool)

(assert (=> b!1264930 (= c!123217 (and ((_ is Cons!28285) (toList!9508 lm!212)) (bvsgt (_1!10567 (h!29494 (toList!9508 lm!212))) a1!67)))))

(declare-fun e!720347 () List!28289)

(assert (=> b!1264930 (= e!720347 e!720344)))

(declare-fun d!138823 () Bool)

(assert (=> d!138823 e!720346))

(declare-fun res!842324 () Bool)

(assert (=> d!138823 (=> (not res!842324) (not e!720346))))

(assert (=> d!138823 (= res!842324 (isStrictlySorted!776 lt!573993))))

(declare-fun e!720345 () List!28289)

(assert (=> d!138823 (= lt!573993 e!720345)))

(assert (=> d!138823 (= c!123216 (and ((_ is Cons!28285) (toList!9508 lm!212)) (bvslt (_1!10567 (h!29494 (toList!9508 lm!212))) a1!67)))))

(assert (=> d!138823 (isStrictlySorted!776 (toList!9508 lm!212))))

(assert (=> d!138823 (= (insertStrictlySorted!454 (toList!9508 lm!212) a1!67 b1!78) lt!573993)))

(declare-fun b!1264931 () Bool)

(assert (=> b!1264931 (= e!720345 e!720347)))

(declare-fun c!123214 () Bool)

(assert (=> b!1264931 (= c!123214 (and ((_ is Cons!28285) (toList!9508 lm!212)) (= (_1!10567 (h!29494 (toList!9508 lm!212))) a1!67)))))

(declare-fun b!1264932 () Bool)

(assert (=> b!1264932 (= e!720346 (contains!7633 lt!573993 (tuple2!21113 a1!67 b1!78)))))

(declare-fun b!1264933 () Bool)

(assert (=> b!1264933 (= e!720345 call!62357)))

(declare-fun b!1264934 () Bool)

(assert (=> b!1264934 (= e!720347 call!62359)))

(declare-fun b!1264935 () Bool)

(assert (=> b!1264935 (= e!720344 call!62358)))

(declare-fun b!1264936 () Bool)

(assert (=> b!1264936 (= e!720348 (ite c!123214 (t!41810 (toList!9508 lm!212)) (ite c!123217 (Cons!28285 (h!29494 (toList!9508 lm!212)) (t!41810 (toList!9508 lm!212))) Nil!28286)))))

(assert (= (and d!138823 c!123216) b!1264933))

(assert (= (and d!138823 (not c!123216)) b!1264931))

(assert (= (and b!1264931 c!123214) b!1264934))

(assert (= (and b!1264931 (not c!123214)) b!1264930))

(assert (= (and b!1264930 c!123217) b!1264928))

(assert (= (and b!1264930 (not c!123217)) b!1264935))

(assert (= (or b!1264928 b!1264935) bm!62354))

(assert (= (or b!1264934 bm!62354) bm!62355))

(assert (= (or b!1264933 bm!62355) bm!62356))

(assert (= (and bm!62356 c!123215) b!1264929))

(assert (= (and bm!62356 (not c!123215)) b!1264936))

(assert (= (and d!138823 res!842324) b!1264927))

(assert (= (and b!1264927 res!842323) b!1264932))

(declare-fun m!1165359 () Bool)

(assert (=> b!1264927 m!1165359))

(declare-fun m!1165361 () Bool)

(assert (=> b!1264929 m!1165361))

(declare-fun m!1165363 () Bool)

(assert (=> b!1264932 m!1165363))

(declare-fun m!1165365 () Bool)

(assert (=> bm!62356 m!1165365))

(declare-fun m!1165369 () Bool)

(assert (=> d!138823 m!1165369))

(assert (=> d!138823 m!1165207))

(assert (=> b!1264704 d!138823))

(declare-fun b!1264948 () Bool)

(declare-fun e!720356 () Bool)

(declare-fun tp!96254 () Bool)

(assert (=> b!1264948 (= e!720356 (and tp_is_empty!32457 tp!96254))))

(assert (=> b!1264705 (= tp!96242 e!720356)))

(assert (= (and b!1264705 ((_ is Cons!28285) (toList!9508 lm!212))) b!1264948))

(check-sat (not b!1264760) (not b!1264809) (not d!138785) (not d!138807) (not b!1264932) (not d!138803) (not b!1264927) (not b!1264856) (not b!1264948) (not bm!62356) (not d!138819) tp_is_empty!32457 (not b!1264855) (not b!1264727) (not b!1264762) (not b!1264778) (not d!138823) (not b!1264810) (not d!138817) (not d!138799) (not b!1264929))
(check-sat)
