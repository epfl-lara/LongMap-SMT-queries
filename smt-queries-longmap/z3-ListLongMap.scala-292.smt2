; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4940 () Bool)

(assert start!4940)

(declare-fun b_free!1341 () Bool)

(declare-fun b_next!1341 () Bool)

(assert (=> start!4940 (= b_free!1341 (not b_next!1341))))

(declare-fun tp!5518 () Bool)

(declare-fun b_and!2251 () Bool)

(assert (=> start!4940 (= tp!5518 b_and!2251)))

(declare-fun b!37306 () Bool)

(declare-fun res!22561 () Bool)

(declare-fun e!23600 () Bool)

(assert (=> b!37306 (=> (not res!22561) (not e!23600))))

(declare-datatypes ((B!748 0))(
  ( (B!749 (val!874 Int)) )
))
(declare-datatypes ((tuple2!1408 0))(
  ( (tuple2!1409 (_1!715 (_ BitVec 64)) (_2!715 B!748)) )
))
(declare-datatypes ((List!978 0))(
  ( (Nil!975) (Cons!974 (h!1542 tuple2!1408) (t!3771 List!978)) )
))
(declare-datatypes ((ListLongMap!985 0))(
  ( (ListLongMap!986 (toList!508 List!978)) )
))
(declare-fun lm!252 () ListLongMap!985)

(declare-fun k0!388 () (_ BitVec 64))

(declare-fun head!846 (List!978) tuple2!1408)

(assert (=> b!37306 (= res!22561 (not (= (_1!715 (head!846 (toList!508 lm!252))) k0!388)))))

(declare-fun b!37307 () Bool)

(declare-fun e!23601 () Bool)

(declare-fun p!304 () Int)

(declare-fun dynLambda!176 (Int tuple2!1408) Bool)

(declare-fun apply!47 (ListLongMap!985 (_ BitVec 64)) B!748)

(assert (=> b!37307 (= e!23601 (not (dynLambda!176 p!304 (tuple2!1409 k0!388 (apply!47 lm!252 k0!388)))))))

(declare-fun lt!13757 () ListLongMap!985)

(assert (=> b!37307 (dynLambda!176 p!304 (tuple2!1409 k0!388 (apply!47 lt!13757 k0!388)))))

(declare-datatypes ((Unit!850 0))(
  ( (Unit!851) )
))
(declare-fun lt!13758 () Unit!850)

(declare-fun applyForall!6 (ListLongMap!985 Int (_ BitVec 64)) Unit!850)

(assert (=> b!37307 (= lt!13758 (applyForall!6 lt!13757 p!304 k0!388))))

(declare-fun b!37308 () Bool)

(declare-fun res!22563 () Bool)

(assert (=> b!37308 (=> (not res!22563) (not e!23600))))

(declare-fun isEmpty!209 (ListLongMap!985) Bool)

(assert (=> b!37308 (= res!22563 (not (isEmpty!209 lm!252)))))

(declare-fun b!37309 () Bool)

(declare-fun e!23602 () Bool)

(declare-fun tp!5519 () Bool)

(assert (=> b!37309 (= e!23602 tp!5519)))

(declare-fun res!22566 () Bool)

(assert (=> start!4940 (=> (not res!22566) (not e!23600))))

(declare-fun forall!174 (List!978 Int) Bool)

(assert (=> start!4940 (= res!22566 (forall!174 (toList!508 lm!252) p!304))))

(assert (=> start!4940 e!23600))

(declare-fun inv!1639 (ListLongMap!985) Bool)

(assert (=> start!4940 (and (inv!1639 lm!252) e!23602)))

(assert (=> start!4940 tp!5518))

(assert (=> start!4940 true))

(declare-fun b!37310 () Bool)

(declare-fun res!22565 () Bool)

(assert (=> b!37310 (=> (not res!22565) (not e!23601))))

(declare-fun contains!459 (ListLongMap!985 (_ BitVec 64)) Bool)

(assert (=> b!37310 (= res!22565 (contains!459 lt!13757 k0!388))))

(declare-fun b!37311 () Bool)

(assert (=> b!37311 (= e!23600 e!23601)))

(declare-fun res!22564 () Bool)

(assert (=> b!37311 (=> (not res!22564) (not e!23601))))

(assert (=> b!37311 (= res!22564 (forall!174 (toList!508 lt!13757) p!304))))

(declare-fun tail!105 (ListLongMap!985) ListLongMap!985)

(assert (=> b!37311 (= lt!13757 (tail!105 lm!252))))

(declare-fun b!37312 () Bool)

(declare-fun res!22562 () Bool)

(assert (=> b!37312 (=> (not res!22562) (not e!23600))))

(assert (=> b!37312 (= res!22562 (contains!459 lm!252 k0!388))))

(assert (= (and start!4940 res!22566) b!37312))

(assert (= (and b!37312 res!22562) b!37308))

(assert (= (and b!37308 res!22563) b!37306))

(assert (= (and b!37306 res!22561) b!37311))

(assert (= (and b!37311 res!22564) b!37310))

(assert (= (and b!37310 res!22565) b!37307))

(assert (= start!4940 b!37309))

(declare-fun b_lambda!1885 () Bool)

(assert (=> (not b_lambda!1885) (not b!37307)))

(declare-fun t!3768 () Bool)

(declare-fun tb!777 () Bool)

(assert (=> (and start!4940 (= p!304 p!304) t!3768) tb!777))

(declare-fun result!1313 () Bool)

(assert (=> tb!777 (= result!1313 true)))

(assert (=> b!37307 t!3768))

(declare-fun b_and!2253 () Bool)

(assert (= b_and!2251 (and (=> t!3768 result!1313) b_and!2253)))

(declare-fun b_lambda!1887 () Bool)

(assert (=> (not b_lambda!1887) (not b!37307)))

(declare-fun t!3770 () Bool)

(declare-fun tb!779 () Bool)

(assert (=> (and start!4940 (= p!304 p!304) t!3770) tb!779))

(declare-fun result!1315 () Bool)

(assert (=> tb!779 (= result!1315 true)))

(assert (=> b!37307 t!3770))

(declare-fun b_and!2255 () Bool)

(assert (= b_and!2253 (and (=> t!3770 result!1315) b_and!2255)))

(declare-fun m!30107 () Bool)

(assert (=> b!37312 m!30107))

(declare-fun m!30109 () Bool)

(assert (=> b!37307 m!30109))

(declare-fun m!30111 () Bool)

(assert (=> b!37307 m!30111))

(declare-fun m!30113 () Bool)

(assert (=> b!37307 m!30113))

(declare-fun m!30115 () Bool)

(assert (=> b!37307 m!30115))

(declare-fun m!30117 () Bool)

(assert (=> b!37307 m!30117))

(declare-fun m!30119 () Bool)

(assert (=> b!37310 m!30119))

(declare-fun m!30121 () Bool)

(assert (=> b!37311 m!30121))

(declare-fun m!30123 () Bool)

(assert (=> b!37311 m!30123))

(declare-fun m!30125 () Bool)

(assert (=> b!37308 m!30125))

(declare-fun m!30127 () Bool)

(assert (=> start!4940 m!30127))

(declare-fun m!30129 () Bool)

(assert (=> start!4940 m!30129))

(declare-fun m!30131 () Bool)

(assert (=> b!37306 m!30131))

(check-sat b_and!2255 (not b!37306) (not b!37311) (not b!37309) (not b!37310) (not start!4940) (not b_lambda!1887) (not b!37308) (not b!37307) (not b_lambda!1885) (not b!37312) (not b_next!1341))
(check-sat b_and!2255 (not b_next!1341))
(get-model)

(declare-fun b_lambda!1893 () Bool)

(assert (= b_lambda!1887 (or (and start!4940 b_free!1341) b_lambda!1893)))

(declare-fun b_lambda!1895 () Bool)

(assert (= b_lambda!1885 (or (and start!4940 b_free!1341) b_lambda!1895)))

(check-sat b_and!2255 (not b!37306) (not b!37311) (not b!37309) (not b!37310) (not start!4940) (not b!37308) (not b_lambda!1893) (not b!37307) (not b_next!1341) (not b!37312) (not b_lambda!1895))
(check-sat b_and!2255 (not b_next!1341))
(get-model)

(declare-fun d!5835 () Bool)

(declare-fun res!22589 () Bool)

(declare-fun e!23616 () Bool)

(assert (=> d!5835 (=> res!22589 e!23616)))

(get-info :version)

(assert (=> d!5835 (= res!22589 ((_ is Nil!975) (toList!508 lm!252)))))

(assert (=> d!5835 (= (forall!174 (toList!508 lm!252) p!304) e!23616)))

(declare-fun b!37338 () Bool)

(declare-fun e!23617 () Bool)

(assert (=> b!37338 (= e!23616 e!23617)))

(declare-fun res!22590 () Bool)

(assert (=> b!37338 (=> (not res!22590) (not e!23617))))

(assert (=> b!37338 (= res!22590 (dynLambda!176 p!304 (h!1542 (toList!508 lm!252))))))

(declare-fun b!37339 () Bool)

(assert (=> b!37339 (= e!23617 (forall!174 (t!3771 (toList!508 lm!252)) p!304))))

(assert (= (and d!5835 (not res!22589)) b!37338))

(assert (= (and b!37338 res!22590) b!37339))

(declare-fun b_lambda!1905 () Bool)

(assert (=> (not b_lambda!1905) (not b!37338)))

(declare-fun t!3778 () Bool)

(declare-fun tb!785 () Bool)

(assert (=> (and start!4940 (= p!304 p!304) t!3778) tb!785))

(declare-fun result!1321 () Bool)

(assert (=> tb!785 (= result!1321 true)))

(assert (=> b!37338 t!3778))

(declare-fun b_and!2263 () Bool)

(assert (= b_and!2255 (and (=> t!3778 result!1321) b_and!2263)))

(declare-fun m!30159 () Bool)

(assert (=> b!37338 m!30159))

(declare-fun m!30161 () Bool)

(assert (=> b!37339 m!30161))

(assert (=> start!4940 d!5835))

(declare-fun d!5839 () Bool)

(declare-fun isStrictlySorted!185 (List!978) Bool)

(assert (=> d!5839 (= (inv!1639 lm!252) (isStrictlySorted!185 (toList!508 lm!252)))))

(declare-fun bs!1445 () Bool)

(assert (= bs!1445 d!5839))

(declare-fun m!30163 () Bool)

(assert (=> bs!1445 m!30163))

(assert (=> start!4940 d!5839))

(declare-fun d!5841 () Bool)

(declare-fun res!22591 () Bool)

(declare-fun e!23618 () Bool)

(assert (=> d!5841 (=> res!22591 e!23618)))

(assert (=> d!5841 (= res!22591 ((_ is Nil!975) (toList!508 lt!13757)))))

(assert (=> d!5841 (= (forall!174 (toList!508 lt!13757) p!304) e!23618)))

(declare-fun b!37340 () Bool)

(declare-fun e!23619 () Bool)

(assert (=> b!37340 (= e!23618 e!23619)))

(declare-fun res!22592 () Bool)

(assert (=> b!37340 (=> (not res!22592) (not e!23619))))

(assert (=> b!37340 (= res!22592 (dynLambda!176 p!304 (h!1542 (toList!508 lt!13757))))))

(declare-fun b!37341 () Bool)

(assert (=> b!37341 (= e!23619 (forall!174 (t!3771 (toList!508 lt!13757)) p!304))))

(assert (= (and d!5841 (not res!22591)) b!37340))

(assert (= (and b!37340 res!22592) b!37341))

(declare-fun b_lambda!1907 () Bool)

(assert (=> (not b_lambda!1907) (not b!37340)))

(declare-fun t!3780 () Bool)

(declare-fun tb!787 () Bool)

(assert (=> (and start!4940 (= p!304 p!304) t!3780) tb!787))

(declare-fun result!1323 () Bool)

(assert (=> tb!787 (= result!1323 true)))

(assert (=> b!37340 t!3780))

(declare-fun b_and!2265 () Bool)

(assert (= b_and!2263 (and (=> t!3780 result!1323) b_and!2265)))

(declare-fun m!30165 () Bool)

(assert (=> b!37340 m!30165))

(declare-fun m!30167 () Bool)

(assert (=> b!37341 m!30167))

(assert (=> b!37311 d!5841))

(declare-fun d!5843 () Bool)

(declare-fun tail!107 (List!978) List!978)

(assert (=> d!5843 (= (tail!105 lm!252) (ListLongMap!986 (tail!107 (toList!508 lm!252))))))

(declare-fun bs!1446 () Bool)

(assert (= bs!1446 d!5843))

(declare-fun m!30169 () Bool)

(assert (=> bs!1446 m!30169))

(assert (=> b!37311 d!5843))

(declare-fun d!5845 () Bool)

(declare-fun e!23633 () Bool)

(assert (=> d!5845 e!23633))

(declare-fun res!22599 () Bool)

(assert (=> d!5845 (=> res!22599 e!23633)))

(declare-fun lt!13790 () Bool)

(assert (=> d!5845 (= res!22599 (not lt!13790))))

(declare-fun lt!13792 () Bool)

(assert (=> d!5845 (= lt!13790 lt!13792)))

(declare-fun lt!13789 () Unit!850)

(declare-fun e!23632 () Unit!850)

(assert (=> d!5845 (= lt!13789 e!23632)))

(declare-fun c!4299 () Bool)

(assert (=> d!5845 (= c!4299 lt!13792)))

(declare-fun containsKey!52 (List!978 (_ BitVec 64)) Bool)

(assert (=> d!5845 (= lt!13792 (containsKey!52 (toList!508 lt!13757) k0!388))))

(assert (=> d!5845 (= (contains!459 lt!13757 k0!388) lt!13790)))

(declare-fun b!37360 () Bool)

(declare-fun lt!13791 () Unit!850)

(assert (=> b!37360 (= e!23632 lt!13791)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!49 (List!978 (_ BitVec 64)) Unit!850)

(assert (=> b!37360 (= lt!13791 (lemmaContainsKeyImpliesGetValueByKeyDefined!49 (toList!508 lt!13757) k0!388))))

(declare-datatypes ((Option!94 0))(
  ( (Some!93 (v!1962 B!748)) (None!92) )
))
(declare-fun isDefined!50 (Option!94) Bool)

(declare-fun getValueByKey!88 (List!978 (_ BitVec 64)) Option!94)

(assert (=> b!37360 (isDefined!50 (getValueByKey!88 (toList!508 lt!13757) k0!388))))

(declare-fun b!37361 () Bool)

(declare-fun Unit!855 () Unit!850)

(assert (=> b!37361 (= e!23632 Unit!855)))

(declare-fun b!37362 () Bool)

(assert (=> b!37362 (= e!23633 (isDefined!50 (getValueByKey!88 (toList!508 lt!13757) k0!388)))))

(assert (= (and d!5845 c!4299) b!37360))

(assert (= (and d!5845 (not c!4299)) b!37361))

(assert (= (and d!5845 (not res!22599)) b!37362))

(declare-fun m!30191 () Bool)

(assert (=> d!5845 m!30191))

(declare-fun m!30193 () Bool)

(assert (=> b!37360 m!30193))

(declare-fun m!30195 () Bool)

(assert (=> b!37360 m!30195))

(assert (=> b!37360 m!30195))

(declare-fun m!30197 () Bool)

(assert (=> b!37360 m!30197))

(assert (=> b!37362 m!30195))

(assert (=> b!37362 m!30195))

(assert (=> b!37362 m!30197))

(assert (=> b!37310 d!5845))

(declare-fun d!5859 () Bool)

(declare-fun isEmpty!212 (List!978) Bool)

(assert (=> d!5859 (= (isEmpty!209 lm!252) (isEmpty!212 (toList!508 lm!252)))))

(declare-fun bs!1449 () Bool)

(assert (= bs!1449 d!5859))

(declare-fun m!30199 () Bool)

(assert (=> bs!1449 m!30199))

(assert (=> b!37308 d!5859))

(declare-fun d!5861 () Bool)

(declare-fun e!23643 () Bool)

(assert (=> d!5861 e!23643))

(declare-fun res!22606 () Bool)

(assert (=> d!5861 (=> res!22606 e!23643)))

(declare-fun lt!13802 () Bool)

(assert (=> d!5861 (= res!22606 (not lt!13802))))

(declare-fun lt!13804 () Bool)

(assert (=> d!5861 (= lt!13802 lt!13804)))

(declare-fun lt!13801 () Unit!850)

(declare-fun e!23642 () Unit!850)

(assert (=> d!5861 (= lt!13801 e!23642)))

(declare-fun c!4302 () Bool)

(assert (=> d!5861 (= c!4302 lt!13804)))

(assert (=> d!5861 (= lt!13804 (containsKey!52 (toList!508 lm!252) k0!388))))

(assert (=> d!5861 (= (contains!459 lm!252 k0!388) lt!13802)))

(declare-fun b!37373 () Bool)

(declare-fun lt!13803 () Unit!850)

(assert (=> b!37373 (= e!23642 lt!13803)))

(assert (=> b!37373 (= lt!13803 (lemmaContainsKeyImpliesGetValueByKeyDefined!49 (toList!508 lm!252) k0!388))))

(assert (=> b!37373 (isDefined!50 (getValueByKey!88 (toList!508 lm!252) k0!388))))

(declare-fun b!37374 () Bool)

(declare-fun Unit!857 () Unit!850)

(assert (=> b!37374 (= e!23642 Unit!857)))

(declare-fun b!37375 () Bool)

(assert (=> b!37375 (= e!23643 (isDefined!50 (getValueByKey!88 (toList!508 lm!252) k0!388)))))

(assert (= (and d!5861 c!4302) b!37373))

(assert (= (and d!5861 (not c!4302)) b!37374))

(assert (= (and d!5861 (not res!22606)) b!37375))

(declare-fun m!30201 () Bool)

(assert (=> d!5861 m!30201))

(declare-fun m!30203 () Bool)

(assert (=> b!37373 m!30203))

(declare-fun m!30205 () Bool)

(assert (=> b!37373 m!30205))

(assert (=> b!37373 m!30205))

(declare-fun m!30207 () Bool)

(assert (=> b!37373 m!30207))

(assert (=> b!37375 m!30205))

(assert (=> b!37375 m!30205))

(assert (=> b!37375 m!30207))

(assert (=> b!37312 d!5861))

(declare-fun d!5863 () Bool)

(declare-fun get!635 (Option!94) B!748)

(assert (=> d!5863 (= (apply!47 lm!252 k0!388) (get!635 (getValueByKey!88 (toList!508 lm!252) k0!388)))))

(declare-fun bs!1450 () Bool)

(assert (= bs!1450 d!5863))

(assert (=> bs!1450 m!30205))

(assert (=> bs!1450 m!30205))

(declare-fun m!30229 () Bool)

(assert (=> bs!1450 m!30229))

(assert (=> b!37307 d!5863))

(declare-fun d!5871 () Bool)

(assert (=> d!5871 (= (apply!47 lt!13757 k0!388) (get!635 (getValueByKey!88 (toList!508 lt!13757) k0!388)))))

(declare-fun bs!1451 () Bool)

(assert (= bs!1451 d!5871))

(assert (=> bs!1451 m!30195))

(assert (=> bs!1451 m!30195))

(declare-fun m!30231 () Bool)

(assert (=> bs!1451 m!30231))

(assert (=> b!37307 d!5871))

(declare-fun d!5873 () Bool)

(assert (=> d!5873 (dynLambda!176 p!304 (tuple2!1409 k0!388 (apply!47 lt!13757 k0!388)))))

(declare-fun lt!13815 () Unit!850)

(declare-fun choose!232 (ListLongMap!985 Int (_ BitVec 64)) Unit!850)

(assert (=> d!5873 (= lt!13815 (choose!232 lt!13757 p!304 k0!388))))

(declare-fun e!23660 () Bool)

(assert (=> d!5873 e!23660))

(declare-fun res!22621 () Bool)

(assert (=> d!5873 (=> (not res!22621) (not e!23660))))

(assert (=> d!5873 (= res!22621 (forall!174 (toList!508 lt!13757) p!304))))

(assert (=> d!5873 (= (applyForall!6 lt!13757 p!304 k0!388) lt!13815)))

(declare-fun b!37394 () Bool)

(assert (=> b!37394 (= e!23660 (contains!459 lt!13757 k0!388))))

(assert (= (and d!5873 res!22621) b!37394))

(declare-fun b_lambda!1915 () Bool)

(assert (=> (not b_lambda!1915) (not d!5873)))

(assert (=> d!5873 t!3770))

(declare-fun b_and!2273 () Bool)

(assert (= b_and!2265 (and (=> t!3770 result!1315) b_and!2273)))

(assert (=> d!5873 m!30115))

(assert (=> d!5873 m!30109))

(declare-fun m!30255 () Bool)

(assert (=> d!5873 m!30255))

(assert (=> d!5873 m!30121))

(assert (=> b!37394 m!30119))

(assert (=> b!37307 d!5873))

(declare-fun d!5893 () Bool)

(assert (=> d!5893 (= (head!846 (toList!508 lm!252)) (h!1542 (toList!508 lm!252)))))

(assert (=> b!37306 d!5893))

(declare-fun b!37401 () Bool)

(declare-fun e!23665 () Bool)

(declare-fun tp_is_empty!1669 () Bool)

(declare-fun tp!5528 () Bool)

(assert (=> b!37401 (= e!23665 (and tp_is_empty!1669 tp!5528))))

(assert (=> b!37309 (= tp!5519 e!23665)))

(assert (= (and b!37309 ((_ is Cons!974) (toList!508 lm!252))) b!37401))

(declare-fun b_lambda!1917 () Bool)

(assert (= b_lambda!1915 (or (and start!4940 b_free!1341) b_lambda!1917)))

(declare-fun b_lambda!1919 () Bool)

(assert (= b_lambda!1905 (or (and start!4940 b_free!1341) b_lambda!1919)))

(declare-fun b_lambda!1921 () Bool)

(assert (= b_lambda!1907 (or (and start!4940 b_free!1341) b_lambda!1921)))

(check-sat (not b!37373) (not d!5859) (not d!5871) (not d!5839) b_and!2273 (not d!5873) (not b!37341) (not d!5861) (not d!5843) (not b_lambda!1895) (not b_next!1341) (not b_lambda!1919) (not b!37362) (not d!5845) (not b!37375) (not b!37360) (not b!37401) (not b_lambda!1893) (not b!37339) tp_is_empty!1669 (not b_lambda!1917) (not b!37394) (not b_lambda!1921) (not d!5863))
(check-sat b_and!2273 (not b_next!1341))
(get-model)

(declare-fun d!5901 () Bool)

(assert (=> d!5901 (= (tail!107 (toList!508 lm!252)) (t!3771 (toList!508 lm!252)))))

(assert (=> d!5843 d!5901))

(declare-fun d!5903 () Bool)

(assert (=> d!5903 (= (get!635 (getValueByKey!88 (toList!508 lt!13757) k0!388)) (v!1962 (getValueByKey!88 (toList!508 lt!13757) k0!388)))))

(assert (=> d!5871 d!5903))

(declare-fun b!37429 () Bool)

(declare-fun e!23683 () Option!94)

(assert (=> b!37429 (= e!23683 None!92)))

(declare-fun b!37427 () Bool)

(declare-fun e!23682 () Option!94)

(assert (=> b!37427 (= e!23682 e!23683)))

(declare-fun c!4310 () Bool)

(assert (=> b!37427 (= c!4310 (and ((_ is Cons!974) (toList!508 lt!13757)) (not (= (_1!715 (h!1542 (toList!508 lt!13757))) k0!388))))))

(declare-fun b!37428 () Bool)

(assert (=> b!37428 (= e!23683 (getValueByKey!88 (t!3771 (toList!508 lt!13757)) k0!388))))

(declare-fun b!37426 () Bool)

(assert (=> b!37426 (= e!23682 (Some!93 (_2!715 (h!1542 (toList!508 lt!13757)))))))

(declare-fun d!5905 () Bool)

(declare-fun c!4309 () Bool)

(assert (=> d!5905 (= c!4309 (and ((_ is Cons!974) (toList!508 lt!13757)) (= (_1!715 (h!1542 (toList!508 lt!13757))) k0!388)))))

(assert (=> d!5905 (= (getValueByKey!88 (toList!508 lt!13757) k0!388) e!23682)))

(assert (= (and d!5905 c!4309) b!37426))

(assert (= (and d!5905 (not c!4309)) b!37427))

(assert (= (and b!37427 c!4310) b!37428))

(assert (= (and b!37427 (not c!4310)) b!37429))

(declare-fun m!30267 () Bool)

(assert (=> b!37428 m!30267))

(assert (=> d!5871 d!5905))

(declare-fun d!5907 () Bool)

(declare-fun res!22634 () Bool)

(declare-fun e!23688 () Bool)

(assert (=> d!5907 (=> res!22634 e!23688)))

(assert (=> d!5907 (= res!22634 (and ((_ is Cons!974) (toList!508 lm!252)) (= (_1!715 (h!1542 (toList!508 lm!252))) k0!388)))))

(assert (=> d!5907 (= (containsKey!52 (toList!508 lm!252) k0!388) e!23688)))

(declare-fun b!37434 () Bool)

(declare-fun e!23689 () Bool)

(assert (=> b!37434 (= e!23688 e!23689)))

(declare-fun res!22635 () Bool)

(assert (=> b!37434 (=> (not res!22635) (not e!23689))))

(assert (=> b!37434 (= res!22635 (and (or (not ((_ is Cons!974) (toList!508 lm!252))) (bvsle (_1!715 (h!1542 (toList!508 lm!252))) k0!388)) ((_ is Cons!974) (toList!508 lm!252)) (bvslt (_1!715 (h!1542 (toList!508 lm!252))) k0!388)))))

(declare-fun b!37435 () Bool)

(assert (=> b!37435 (= e!23689 (containsKey!52 (t!3771 (toList!508 lm!252)) k0!388))))

(assert (= (and d!5907 (not res!22634)) b!37434))

(assert (= (and b!37434 res!22635) b!37435))

(declare-fun m!30269 () Bool)

(assert (=> b!37435 m!30269))

(assert (=> d!5861 d!5907))

(declare-fun d!5909 () Bool)

(assert (=> d!5909 (isDefined!50 (getValueByKey!88 (toList!508 lt!13757) k0!388))))

(declare-fun lt!13824 () Unit!850)

(declare-fun choose!235 (List!978 (_ BitVec 64)) Unit!850)

(assert (=> d!5909 (= lt!13824 (choose!235 (toList!508 lt!13757) k0!388))))

(declare-fun e!23692 () Bool)

(assert (=> d!5909 e!23692))

(declare-fun res!22638 () Bool)

(assert (=> d!5909 (=> (not res!22638) (not e!23692))))

(assert (=> d!5909 (= res!22638 (isStrictlySorted!185 (toList!508 lt!13757)))))

(assert (=> d!5909 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!49 (toList!508 lt!13757) k0!388) lt!13824)))

(declare-fun b!37438 () Bool)

(assert (=> b!37438 (= e!23692 (containsKey!52 (toList!508 lt!13757) k0!388))))

(assert (= (and d!5909 res!22638) b!37438))

(assert (=> d!5909 m!30195))

(assert (=> d!5909 m!30195))

(assert (=> d!5909 m!30197))

(declare-fun m!30271 () Bool)

(assert (=> d!5909 m!30271))

(declare-fun m!30273 () Bool)

(assert (=> d!5909 m!30273))

(assert (=> b!37438 m!30191))

(assert (=> b!37360 d!5909))

(declare-fun d!5911 () Bool)

(declare-fun isEmpty!214 (Option!94) Bool)

(assert (=> d!5911 (= (isDefined!50 (getValueByKey!88 (toList!508 lt!13757) k0!388)) (not (isEmpty!214 (getValueByKey!88 (toList!508 lt!13757) k0!388))))))

(declare-fun bs!1460 () Bool)

(assert (= bs!1460 d!5911))

(assert (=> bs!1460 m!30195))

(declare-fun m!30275 () Bool)

(assert (=> bs!1460 m!30275))

(assert (=> b!37360 d!5911))

(assert (=> b!37360 d!5905))

(declare-fun d!5913 () Bool)

(assert (=> d!5913 (= (isDefined!50 (getValueByKey!88 (toList!508 lm!252) k0!388)) (not (isEmpty!214 (getValueByKey!88 (toList!508 lm!252) k0!388))))))

(declare-fun bs!1461 () Bool)

(assert (= bs!1461 d!5913))

(assert (=> bs!1461 m!30205))

(declare-fun m!30277 () Bool)

(assert (=> bs!1461 m!30277))

(assert (=> b!37375 d!5913))

(declare-fun b!37442 () Bool)

(declare-fun e!23694 () Option!94)

(assert (=> b!37442 (= e!23694 None!92)))

(declare-fun b!37440 () Bool)

(declare-fun e!23693 () Option!94)

(assert (=> b!37440 (= e!23693 e!23694)))

(declare-fun c!4312 () Bool)

(assert (=> b!37440 (= c!4312 (and ((_ is Cons!974) (toList!508 lm!252)) (not (= (_1!715 (h!1542 (toList!508 lm!252))) k0!388))))))

(declare-fun b!37441 () Bool)

(assert (=> b!37441 (= e!23694 (getValueByKey!88 (t!3771 (toList!508 lm!252)) k0!388))))

(declare-fun b!37439 () Bool)

(assert (=> b!37439 (= e!23693 (Some!93 (_2!715 (h!1542 (toList!508 lm!252)))))))

(declare-fun d!5915 () Bool)

(declare-fun c!4311 () Bool)

(assert (=> d!5915 (= c!4311 (and ((_ is Cons!974) (toList!508 lm!252)) (= (_1!715 (h!1542 (toList!508 lm!252))) k0!388)))))

(assert (=> d!5915 (= (getValueByKey!88 (toList!508 lm!252) k0!388) e!23693)))

(assert (= (and d!5915 c!4311) b!37439))

(assert (= (and d!5915 (not c!4311)) b!37440))

(assert (= (and b!37440 c!4312) b!37441))

(assert (= (and b!37440 (not c!4312)) b!37442))

(declare-fun m!30279 () Bool)

(assert (=> b!37441 m!30279))

(assert (=> b!37375 d!5915))

(declare-fun d!5917 () Bool)

(assert (=> d!5917 (= (get!635 (getValueByKey!88 (toList!508 lm!252) k0!388)) (v!1962 (getValueByKey!88 (toList!508 lm!252) k0!388)))))

(assert (=> d!5863 d!5917))

(assert (=> d!5863 d!5915))

(assert (=> d!5873 d!5871))

(declare-fun d!5919 () Bool)

(assert (=> d!5919 (dynLambda!176 p!304 (tuple2!1409 k0!388 (apply!47 lt!13757 k0!388)))))

(assert (=> d!5919 true))

(declare-fun _$37!23 () Unit!850)

(assert (=> d!5919 (= (choose!232 lt!13757 p!304 k0!388) _$37!23)))

(declare-fun b_lambda!1941 () Bool)

(assert (=> (not b_lambda!1941) (not d!5919)))

(assert (=> d!5919 t!3770))

(declare-fun b_and!2281 () Bool)

(assert (= b_and!2273 (and (=> t!3770 result!1315) b_and!2281)))

(assert (=> d!5919 m!30115))

(assert (=> d!5919 m!30109))

(assert (=> d!5873 d!5919))

(assert (=> d!5873 d!5841))

(declare-fun d!5921 () Bool)

(assert (=> d!5921 (isDefined!50 (getValueByKey!88 (toList!508 lm!252) k0!388))))

(declare-fun lt!13825 () Unit!850)

(assert (=> d!5921 (= lt!13825 (choose!235 (toList!508 lm!252) k0!388))))

(declare-fun e!23695 () Bool)

(assert (=> d!5921 e!23695))

(declare-fun res!22639 () Bool)

(assert (=> d!5921 (=> (not res!22639) (not e!23695))))

(assert (=> d!5921 (= res!22639 (isStrictlySorted!185 (toList!508 lm!252)))))

(assert (=> d!5921 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!49 (toList!508 lm!252) k0!388) lt!13825)))

(declare-fun b!37443 () Bool)

(assert (=> b!37443 (= e!23695 (containsKey!52 (toList!508 lm!252) k0!388))))

(assert (= (and d!5921 res!22639) b!37443))

(assert (=> d!5921 m!30205))

(assert (=> d!5921 m!30205))

(assert (=> d!5921 m!30207))

(declare-fun m!30281 () Bool)

(assert (=> d!5921 m!30281))

(assert (=> d!5921 m!30163))

(assert (=> b!37443 m!30201))

(assert (=> b!37373 d!5921))

(assert (=> b!37373 d!5913))

(assert (=> b!37373 d!5915))

(declare-fun d!5923 () Bool)

(declare-fun res!22640 () Bool)

(declare-fun e!23696 () Bool)

(assert (=> d!5923 (=> res!22640 e!23696)))

(assert (=> d!5923 (= res!22640 ((_ is Nil!975) (t!3771 (toList!508 lt!13757))))))

(assert (=> d!5923 (= (forall!174 (t!3771 (toList!508 lt!13757)) p!304) e!23696)))

(declare-fun b!37444 () Bool)

(declare-fun e!23697 () Bool)

(assert (=> b!37444 (= e!23696 e!23697)))

(declare-fun res!22641 () Bool)

(assert (=> b!37444 (=> (not res!22641) (not e!23697))))

(assert (=> b!37444 (= res!22641 (dynLambda!176 p!304 (h!1542 (t!3771 (toList!508 lt!13757)))))))

(declare-fun b!37445 () Bool)

(assert (=> b!37445 (= e!23697 (forall!174 (t!3771 (t!3771 (toList!508 lt!13757))) p!304))))

(assert (= (and d!5923 (not res!22640)) b!37444))

(assert (= (and b!37444 res!22641) b!37445))

(declare-fun b_lambda!1943 () Bool)

(assert (=> (not b_lambda!1943) (not b!37444)))

(declare-fun t!3790 () Bool)

(declare-fun tb!797 () Bool)

(assert (=> (and start!4940 (= p!304 p!304) t!3790) tb!797))

(declare-fun result!1339 () Bool)

(assert (=> tb!797 (= result!1339 true)))

(assert (=> b!37444 t!3790))

(declare-fun b_and!2283 () Bool)

(assert (= b_and!2281 (and (=> t!3790 result!1339) b_and!2283)))

(declare-fun m!30283 () Bool)

(assert (=> b!37444 m!30283))

(declare-fun m!30285 () Bool)

(assert (=> b!37445 m!30285))

(assert (=> b!37341 d!5923))

(declare-fun d!5925 () Bool)

(declare-fun res!22642 () Bool)

(declare-fun e!23698 () Bool)

(assert (=> d!5925 (=> res!22642 e!23698)))

(assert (=> d!5925 (= res!22642 ((_ is Nil!975) (t!3771 (toList!508 lm!252))))))

(assert (=> d!5925 (= (forall!174 (t!3771 (toList!508 lm!252)) p!304) e!23698)))

(declare-fun b!37446 () Bool)

(declare-fun e!23699 () Bool)

(assert (=> b!37446 (= e!23698 e!23699)))

(declare-fun res!22643 () Bool)

(assert (=> b!37446 (=> (not res!22643) (not e!23699))))

(assert (=> b!37446 (= res!22643 (dynLambda!176 p!304 (h!1542 (t!3771 (toList!508 lm!252)))))))

(declare-fun b!37447 () Bool)

(assert (=> b!37447 (= e!23699 (forall!174 (t!3771 (t!3771 (toList!508 lm!252))) p!304))))

(assert (= (and d!5925 (not res!22642)) b!37446))

(assert (= (and b!37446 res!22643) b!37447))

(declare-fun b_lambda!1945 () Bool)

(assert (=> (not b_lambda!1945) (not b!37446)))

(declare-fun t!3792 () Bool)

(declare-fun tb!799 () Bool)

(assert (=> (and start!4940 (= p!304 p!304) t!3792) tb!799))

(declare-fun result!1341 () Bool)

(assert (=> tb!799 (= result!1341 true)))

(assert (=> b!37446 t!3792))

(declare-fun b_and!2285 () Bool)

(assert (= b_and!2283 (and (=> t!3792 result!1341) b_and!2285)))

(declare-fun m!30287 () Bool)

(assert (=> b!37446 m!30287))

(declare-fun m!30289 () Bool)

(assert (=> b!37447 m!30289))

(assert (=> b!37339 d!5925))

(assert (=> b!37394 d!5845))

(declare-fun d!5927 () Bool)

(declare-fun res!22644 () Bool)

(declare-fun e!23700 () Bool)

(assert (=> d!5927 (=> res!22644 e!23700)))

(assert (=> d!5927 (= res!22644 (and ((_ is Cons!974) (toList!508 lt!13757)) (= (_1!715 (h!1542 (toList!508 lt!13757))) k0!388)))))

(assert (=> d!5927 (= (containsKey!52 (toList!508 lt!13757) k0!388) e!23700)))

(declare-fun b!37448 () Bool)

(declare-fun e!23701 () Bool)

(assert (=> b!37448 (= e!23700 e!23701)))

(declare-fun res!22645 () Bool)

(assert (=> b!37448 (=> (not res!22645) (not e!23701))))

(assert (=> b!37448 (= res!22645 (and (or (not ((_ is Cons!974) (toList!508 lt!13757))) (bvsle (_1!715 (h!1542 (toList!508 lt!13757))) k0!388)) ((_ is Cons!974) (toList!508 lt!13757)) (bvslt (_1!715 (h!1542 (toList!508 lt!13757))) k0!388)))))

(declare-fun b!37449 () Bool)

(assert (=> b!37449 (= e!23701 (containsKey!52 (t!3771 (toList!508 lt!13757)) k0!388))))

(assert (= (and d!5927 (not res!22644)) b!37448))

(assert (= (and b!37448 res!22645) b!37449))

(declare-fun m!30291 () Bool)

(assert (=> b!37449 m!30291))

(assert (=> d!5845 d!5927))

(declare-fun d!5929 () Bool)

(declare-fun res!22650 () Bool)

(declare-fun e!23706 () Bool)

(assert (=> d!5929 (=> res!22650 e!23706)))

(assert (=> d!5929 (= res!22650 (or ((_ is Nil!975) (toList!508 lm!252)) ((_ is Nil!975) (t!3771 (toList!508 lm!252)))))))

(assert (=> d!5929 (= (isStrictlySorted!185 (toList!508 lm!252)) e!23706)))

(declare-fun b!37454 () Bool)

(declare-fun e!23707 () Bool)

(assert (=> b!37454 (= e!23706 e!23707)))

(declare-fun res!22651 () Bool)

(assert (=> b!37454 (=> (not res!22651) (not e!23707))))

(assert (=> b!37454 (= res!22651 (bvslt (_1!715 (h!1542 (toList!508 lm!252))) (_1!715 (h!1542 (t!3771 (toList!508 lm!252))))))))

(declare-fun b!37455 () Bool)

(assert (=> b!37455 (= e!23707 (isStrictlySorted!185 (t!3771 (toList!508 lm!252))))))

(assert (= (and d!5929 (not res!22650)) b!37454))

(assert (= (and b!37454 res!22651) b!37455))

(declare-fun m!30293 () Bool)

(assert (=> b!37455 m!30293))

(assert (=> d!5839 d!5929))

(declare-fun d!5931 () Bool)

(assert (=> d!5931 (= (isEmpty!212 (toList!508 lm!252)) ((_ is Nil!975) (toList!508 lm!252)))))

(assert (=> d!5859 d!5931))

(assert (=> b!37362 d!5911))

(assert (=> b!37362 d!5905))

(declare-fun b!37456 () Bool)

(declare-fun e!23708 () Bool)

(declare-fun tp!5535 () Bool)

(assert (=> b!37456 (= e!23708 (and tp_is_empty!1669 tp!5535))))

(assert (=> b!37401 (= tp!5528 e!23708)))

(assert (= (and b!37401 ((_ is Cons!974) (t!3771 (toList!508 lm!252)))) b!37456))

(declare-fun b_lambda!1947 () Bool)

(assert (= b_lambda!1945 (or (and start!4940 b_free!1341) b_lambda!1947)))

(declare-fun b_lambda!1949 () Bool)

(assert (= b_lambda!1943 (or (and start!4940 b_free!1341) b_lambda!1949)))

(declare-fun b_lambda!1951 () Bool)

(assert (= b_lambda!1941 (or (and start!4940 b_free!1341) b_lambda!1951)))

(check-sat (not b!37441) (not b!37438) (not b!37449) (not b!37435) (not b_lambda!1895) (not b_lambda!1951) (not b!37456) (not d!5913) (not b_lambda!1947) (not b_lambda!1949) (not d!5909) (not b_lambda!1919) (not d!5921) (not b_lambda!1893) (not b!37445) tp_is_empty!1669 (not d!5919) (not b_lambda!1917) (not d!5911) (not b!37455) (not b!37428) (not b!37443) (not b_next!1341) b_and!2285 (not b!37447) (not b_lambda!1921))
(check-sat b_and!2285 (not b_next!1341))
