; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4838 () Bool)

(assert start!4838)

(declare-fun b_free!1333 () Bool)

(declare-fun b_next!1333 () Bool)

(assert (=> start!4838 (= b_free!1333 (not b_next!1333))))

(declare-fun tp!5482 () Bool)

(declare-fun b_and!2209 () Bool)

(assert (=> start!4838 (= tp!5482 b_and!2209)))

(declare-fun b!36940 () Bool)

(declare-fun res!22355 () Bool)

(declare-fun e!23354 () Bool)

(assert (=> b!36940 (=> (not res!22355) (not e!23354))))

(declare-datatypes ((B!740 0))(
  ( (B!741 (val!870 Int)) )
))
(declare-datatypes ((tuple2!1404 0))(
  ( (tuple2!1405 (_1!713 (_ BitVec 64)) (_2!713 B!740)) )
))
(declare-datatypes ((List!967 0))(
  ( (Nil!964) (Cons!963 (h!1531 tuple2!1404) (t!3721 List!967)) )
))
(declare-datatypes ((ListLongMap!969 0))(
  ( (ListLongMap!970 (toList!500 List!967)) )
))
(declare-fun lm!252 () ListLongMap!969)

(declare-fun k0!388 () (_ BitVec 64))

(declare-fun contains!452 (ListLongMap!969 (_ BitVec 64)) Bool)

(assert (=> b!36940 (= res!22355 (contains!452 lm!252 k0!388))))

(declare-fun b!36941 () Bool)

(declare-fun e!23355 () Bool)

(declare-fun tp!5483 () Bool)

(assert (=> b!36941 (= e!23355 tp!5483)))

(declare-fun res!22356 () Bool)

(assert (=> start!4838 (=> (not res!22356) (not e!23354))))

(declare-fun p!304 () Int)

(declare-fun forall!170 (List!967 Int) Bool)

(assert (=> start!4838 (= res!22356 (forall!170 (toList!500 lm!252) p!304))))

(assert (=> start!4838 e!23354))

(declare-fun inv!1630 (ListLongMap!969) Bool)

(assert (=> start!4838 (and (inv!1630 lm!252) e!23355)))

(assert (=> start!4838 tp!5482))

(assert (=> start!4838 true))

(declare-fun b!36942 () Bool)

(declare-fun res!22360 () Bool)

(declare-fun e!23353 () Bool)

(assert (=> b!36942 (=> (not res!22360) (not e!23353))))

(declare-fun lt!13658 () ListLongMap!969)

(assert (=> b!36942 (= res!22360 (contains!452 lt!13658 k0!388))))

(declare-fun b!36943 () Bool)

(assert (=> b!36943 (= e!23354 e!23353)))

(declare-fun res!22358 () Bool)

(assert (=> b!36943 (=> (not res!22358) (not e!23353))))

(assert (=> b!36943 (= res!22358 (forall!170 (toList!500 lt!13658) p!304))))

(declare-fun tail!98 (ListLongMap!969) ListLongMap!969)

(assert (=> b!36943 (= lt!13658 (tail!98 lm!252))))

(declare-fun b!36944 () Bool)

(declare-fun res!22357 () Bool)

(assert (=> b!36944 (=> (not res!22357) (not e!23354))))

(declare-fun isEmpty!200 (ListLongMap!969) Bool)

(assert (=> b!36944 (= res!22357 (not (isEmpty!200 lm!252)))))

(declare-fun b!36945 () Bool)

(declare-fun res!22359 () Bool)

(assert (=> b!36945 (=> (not res!22359) (not e!23354))))

(declare-fun head!842 (List!967) tuple2!1404)

(assert (=> b!36945 (= res!22359 (not (= (_1!713 (head!842 (toList!500 lm!252))) k0!388)))))

(declare-fun b!36946 () Bool)

(declare-fun size!1288 (List!967) Int)

(assert (=> b!36946 (= e!23353 (>= (size!1288 (toList!500 lt!13658)) (size!1288 (toList!500 lm!252))))))

(assert (= (and start!4838 res!22356) b!36940))

(assert (= (and b!36940 res!22355) b!36944))

(assert (= (and b!36944 res!22357) b!36945))

(assert (= (and b!36945 res!22359) b!36943))

(assert (= (and b!36943 res!22358) b!36942))

(assert (= (and b!36942 res!22360) b!36946))

(assert (= start!4838 b!36941))

(declare-fun m!29753 () Bool)

(assert (=> b!36945 m!29753))

(declare-fun m!29755 () Bool)

(assert (=> b!36943 m!29755))

(declare-fun m!29757 () Bool)

(assert (=> b!36943 m!29757))

(declare-fun m!29759 () Bool)

(assert (=> start!4838 m!29759))

(declare-fun m!29761 () Bool)

(assert (=> start!4838 m!29761))

(declare-fun m!29763 () Bool)

(assert (=> b!36942 m!29763))

(declare-fun m!29765 () Bool)

(assert (=> b!36940 m!29765))

(declare-fun m!29767 () Bool)

(assert (=> b!36944 m!29767))

(declare-fun m!29769 () Bool)

(assert (=> b!36946 m!29769))

(declare-fun m!29771 () Bool)

(assert (=> b!36946 m!29771))

(check-sat (not b!36945) (not b!36943) (not b!36946) (not b!36944) (not b_next!1333) (not b!36941) (not b!36942) (not start!4838) (not b!36940) b_and!2209)
(check-sat b_and!2209 (not b_next!1333))
(get-model)

(declare-fun d!5647 () Bool)

(declare-fun res!22401 () Bool)

(declare-fun e!23378 () Bool)

(assert (=> d!5647 (=> res!22401 e!23378)))

(get-info :version)

(assert (=> d!5647 (= res!22401 ((_ is Nil!964) (toList!500 lm!252)))))

(assert (=> d!5647 (= (forall!170 (toList!500 lm!252) p!304) e!23378)))

(declare-fun b!36993 () Bool)

(declare-fun e!23379 () Bool)

(assert (=> b!36993 (= e!23378 e!23379)))

(declare-fun res!22402 () Bool)

(assert (=> b!36993 (=> (not res!22402) (not e!23379))))

(declare-fun dynLambda!171 (Int tuple2!1404) Bool)

(assert (=> b!36993 (= res!22402 (dynLambda!171 p!304 (h!1531 (toList!500 lm!252))))))

(declare-fun b!36994 () Bool)

(assert (=> b!36994 (= e!23379 (forall!170 (t!3721 (toList!500 lm!252)) p!304))))

(assert (= (and d!5647 (not res!22401)) b!36993))

(assert (= (and b!36993 res!22402) b!36994))

(declare-fun b_lambda!1821 () Bool)

(assert (=> (not b_lambda!1821) (not b!36993)))

(declare-fun t!3725 () Bool)

(declare-fun tb!743 () Bool)

(assert (=> (and start!4838 (= p!304 p!304) t!3725) tb!743))

(declare-fun result!1273 () Bool)

(assert (=> tb!743 (= result!1273 true)))

(assert (=> b!36993 t!3725))

(declare-fun b_and!2215 () Bool)

(assert (= b_and!2209 (and (=> t!3725 result!1273) b_and!2215)))

(declare-fun m!29813 () Bool)

(assert (=> b!36993 m!29813))

(declare-fun m!29815 () Bool)

(assert (=> b!36994 m!29815))

(assert (=> start!4838 d!5647))

(declare-fun d!5651 () Bool)

(declare-fun isStrictlySorted!176 (List!967) Bool)

(assert (=> d!5651 (= (inv!1630 lm!252) (isStrictlySorted!176 (toList!500 lm!252)))))

(declare-fun bs!1425 () Bool)

(assert (= bs!1425 d!5651))

(declare-fun m!29817 () Bool)

(assert (=> bs!1425 m!29817))

(assert (=> start!4838 d!5651))

(declare-fun d!5653 () Bool)

(declare-fun e!23406 () Bool)

(assert (=> d!5653 e!23406))

(declare-fun res!22415 () Bool)

(assert (=> d!5653 (=> res!22415 e!23406)))

(declare-fun lt!13705 () Bool)

(assert (=> d!5653 (= res!22415 (not lt!13705))))

(declare-fun lt!13704 () Bool)

(assert (=> d!5653 (= lt!13705 lt!13704)))

(declare-datatypes ((Unit!844 0))(
  ( (Unit!845) )
))
(declare-fun lt!13706 () Unit!844)

(declare-fun e!23407 () Unit!844)

(assert (=> d!5653 (= lt!13706 e!23407)))

(declare-fun c!4242 () Bool)

(assert (=> d!5653 (= c!4242 lt!13704)))

(declare-fun containsKey!49 (List!967 (_ BitVec 64)) Bool)

(assert (=> d!5653 (= lt!13704 (containsKey!49 (toList!500 lt!13658) k0!388))))

(assert (=> d!5653 (= (contains!452 lt!13658 k0!388) lt!13705)))

(declare-fun b!37035 () Bool)

(declare-fun lt!13703 () Unit!844)

(assert (=> b!37035 (= e!23407 lt!13703)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!46 (List!967 (_ BitVec 64)) Unit!844)

(assert (=> b!37035 (= lt!13703 (lemmaContainsKeyImpliesGetValueByKeyDefined!46 (toList!500 lt!13658) k0!388))))

(declare-datatypes ((Option!91 0))(
  ( (Some!90 (v!1959 B!740)) (None!89) )
))
(declare-fun isDefined!47 (Option!91) Bool)

(declare-fun getValueByKey!85 (List!967 (_ BitVec 64)) Option!91)

(assert (=> b!37035 (isDefined!47 (getValueByKey!85 (toList!500 lt!13658) k0!388))))

(declare-fun b!37036 () Bool)

(declare-fun Unit!847 () Unit!844)

(assert (=> b!37036 (= e!23407 Unit!847)))

(declare-fun b!37037 () Bool)

(assert (=> b!37037 (= e!23406 (isDefined!47 (getValueByKey!85 (toList!500 lt!13658) k0!388)))))

(assert (= (and d!5653 c!4242) b!37035))

(assert (= (and d!5653 (not c!4242)) b!37036))

(assert (= (and d!5653 (not res!22415)) b!37037))

(declare-fun m!29839 () Bool)

(assert (=> d!5653 m!29839))

(declare-fun m!29841 () Bool)

(assert (=> b!37035 m!29841))

(declare-fun m!29843 () Bool)

(assert (=> b!37035 m!29843))

(assert (=> b!37035 m!29843))

(declare-fun m!29845 () Bool)

(assert (=> b!37035 m!29845))

(assert (=> b!37037 m!29843))

(assert (=> b!37037 m!29843))

(assert (=> b!37037 m!29845))

(assert (=> b!36942 d!5653))

(declare-fun d!5665 () Bool)

(declare-fun res!22418 () Bool)

(declare-fun e!23410 () Bool)

(assert (=> d!5665 (=> res!22418 e!23410)))

(assert (=> d!5665 (= res!22418 ((_ is Nil!964) (toList!500 lt!13658)))))

(assert (=> d!5665 (= (forall!170 (toList!500 lt!13658) p!304) e!23410)))

(declare-fun b!37040 () Bool)

(declare-fun e!23411 () Bool)

(assert (=> b!37040 (= e!23410 e!23411)))

(declare-fun res!22419 () Bool)

(assert (=> b!37040 (=> (not res!22419) (not e!23411))))

(assert (=> b!37040 (= res!22419 (dynLambda!171 p!304 (h!1531 (toList!500 lt!13658))))))

(declare-fun b!37041 () Bool)

(assert (=> b!37041 (= e!23411 (forall!170 (t!3721 (toList!500 lt!13658)) p!304))))

(assert (= (and d!5665 (not res!22418)) b!37040))

(assert (= (and b!37040 res!22419) b!37041))

(declare-fun b_lambda!1825 () Bool)

(assert (=> (not b_lambda!1825) (not b!37040)))

(declare-fun t!3729 () Bool)

(declare-fun tb!747 () Bool)

(assert (=> (and start!4838 (= p!304 p!304) t!3729) tb!747))

(declare-fun result!1277 () Bool)

(assert (=> tb!747 (= result!1277 true)))

(assert (=> b!37040 t!3729))

(declare-fun b_and!2219 () Bool)

(assert (= b_and!2215 (and (=> t!3729 result!1277) b_and!2219)))

(declare-fun m!29853 () Bool)

(assert (=> b!37040 m!29853))

(declare-fun m!29855 () Bool)

(assert (=> b!37041 m!29855))

(assert (=> b!36943 d!5665))

(declare-fun d!5671 () Bool)

(declare-fun tail!101 (List!967) List!967)

(assert (=> d!5671 (= (tail!98 lm!252) (ListLongMap!970 (tail!101 (toList!500 lm!252))))))

(declare-fun bs!1427 () Bool)

(assert (= bs!1427 d!5671))

(declare-fun m!29861 () Bool)

(assert (=> bs!1427 m!29861))

(assert (=> b!36943 d!5671))

(declare-fun d!5677 () Bool)

(declare-fun isEmpty!203 (List!967) Bool)

(assert (=> d!5677 (= (isEmpty!200 lm!252) (isEmpty!203 (toList!500 lm!252)))))

(declare-fun bs!1428 () Bool)

(assert (= bs!1428 d!5677))

(declare-fun m!29867 () Bool)

(assert (=> bs!1428 m!29867))

(assert (=> b!36944 d!5677))

(declare-fun d!5681 () Bool)

(assert (=> d!5681 (= (head!842 (toList!500 lm!252)) (h!1531 (toList!500 lm!252)))))

(assert (=> b!36945 d!5681))

(declare-fun d!5685 () Bool)

(declare-fun e!23422 () Bool)

(assert (=> d!5685 e!23422))

(declare-fun res!22428 () Bool)

(assert (=> d!5685 (=> res!22428 e!23422)))

(declare-fun lt!13711 () Bool)

(assert (=> d!5685 (= res!22428 (not lt!13711))))

(declare-fun lt!13710 () Bool)

(assert (=> d!5685 (= lt!13711 lt!13710)))

(declare-fun lt!13712 () Unit!844)

(declare-fun e!23423 () Unit!844)

(assert (=> d!5685 (= lt!13712 e!23423)))

(declare-fun c!4245 () Bool)

(assert (=> d!5685 (= c!4245 lt!13710)))

(assert (=> d!5685 (= lt!13710 (containsKey!49 (toList!500 lm!252) k0!388))))

(assert (=> d!5685 (= (contains!452 lm!252 k0!388) lt!13711)))

(declare-fun b!37054 () Bool)

(declare-fun lt!13709 () Unit!844)

(assert (=> b!37054 (= e!23423 lt!13709)))

(assert (=> b!37054 (= lt!13709 (lemmaContainsKeyImpliesGetValueByKeyDefined!46 (toList!500 lm!252) k0!388))))

(assert (=> b!37054 (isDefined!47 (getValueByKey!85 (toList!500 lm!252) k0!388))))

(declare-fun b!37055 () Bool)

(declare-fun Unit!848 () Unit!844)

(assert (=> b!37055 (= e!23423 Unit!848)))

(declare-fun b!37056 () Bool)

(assert (=> b!37056 (= e!23422 (isDefined!47 (getValueByKey!85 (toList!500 lm!252) k0!388)))))

(assert (= (and d!5685 c!4245) b!37054))

(assert (= (and d!5685 (not c!4245)) b!37055))

(assert (= (and d!5685 (not res!22428)) b!37056))

(declare-fun m!29875 () Bool)

(assert (=> d!5685 m!29875))

(declare-fun m!29877 () Bool)

(assert (=> b!37054 m!29877))

(declare-fun m!29879 () Bool)

(assert (=> b!37054 m!29879))

(assert (=> b!37054 m!29879))

(declare-fun m!29881 () Bool)

(assert (=> b!37054 m!29881))

(assert (=> b!37056 m!29879))

(assert (=> b!37056 m!29879))

(assert (=> b!37056 m!29881))

(assert (=> b!36940 d!5685))

(declare-fun d!5689 () Bool)

(declare-fun lt!13723 () Int)

(assert (=> d!5689 (>= lt!13723 0)))

(declare-fun e!23432 () Int)

(assert (=> d!5689 (= lt!13723 e!23432)))

(declare-fun c!4250 () Bool)

(assert (=> d!5689 (= c!4250 ((_ is Nil!964) (toList!500 lt!13658)))))

(assert (=> d!5689 (= (size!1288 (toList!500 lt!13658)) lt!13723)))

(declare-fun b!37071 () Bool)

(assert (=> b!37071 (= e!23432 0)))

(declare-fun b!37072 () Bool)

(assert (=> b!37072 (= e!23432 (+ 1 (size!1288 (t!3721 (toList!500 lt!13658)))))))

(assert (= (and d!5689 c!4250) b!37071))

(assert (= (and d!5689 (not c!4250)) b!37072))

(declare-fun m!29905 () Bool)

(assert (=> b!37072 m!29905))

(assert (=> b!36946 d!5689))

(declare-fun d!5701 () Bool)

(declare-fun lt!13724 () Int)

(assert (=> d!5701 (>= lt!13724 0)))

(declare-fun e!23435 () Int)

(assert (=> d!5701 (= lt!13724 e!23435)))

(declare-fun c!4251 () Bool)

(assert (=> d!5701 (= c!4251 ((_ is Nil!964) (toList!500 lm!252)))))

(assert (=> d!5701 (= (size!1288 (toList!500 lm!252)) lt!13724)))

(declare-fun b!37075 () Bool)

(assert (=> b!37075 (= e!23435 0)))

(declare-fun b!37076 () Bool)

(assert (=> b!37076 (= e!23435 (+ 1 (size!1288 (t!3721 (toList!500 lm!252)))))))

(assert (= (and d!5701 c!4251) b!37075))

(assert (= (and d!5701 (not c!4251)) b!37076))

(declare-fun m!29907 () Bool)

(assert (=> b!37076 m!29907))

(assert (=> b!36946 d!5701))

(declare-fun b!37082 () Bool)

(declare-fun e!23439 () Bool)

(declare-fun tp_is_empty!1665 () Bool)

(declare-fun tp!5501 () Bool)

(assert (=> b!37082 (= e!23439 (and tp_is_empty!1665 tp!5501))))

(assert (=> b!36941 (= tp!5483 e!23439)))

(assert (= (and b!36941 ((_ is Cons!963) (toList!500 lm!252))) b!37082))

(declare-fun b_lambda!1837 () Bool)

(assert (= b_lambda!1821 (or (and start!4838 b_free!1333) b_lambda!1837)))

(declare-fun b_lambda!1839 () Bool)

(assert (= b_lambda!1825 (or (and start!4838 b_free!1333) b_lambda!1839)))

(check-sat (not b!37041) (not b!36994) (not b_lambda!1839) (not d!5653) (not b!37076) (not b!37054) (not d!5671) (not b!37082) b_and!2219 tp_is_empty!1665 (not b_next!1333) (not d!5685) (not d!5651) (not b!37072) (not d!5677) (not b!37056) (not b!37037) (not b!37035) (not b_lambda!1837))
(check-sat b_and!2219 (not b_next!1333))
(get-model)

(declare-fun d!5705 () Bool)

(declare-fun isEmpty!206 (Option!91) Bool)

(assert (=> d!5705 (= (isDefined!47 (getValueByKey!85 (toList!500 lm!252) k0!388)) (not (isEmpty!206 (getValueByKey!85 (toList!500 lm!252) k0!388))))))

(declare-fun bs!1434 () Bool)

(assert (= bs!1434 d!5705))

(assert (=> bs!1434 m!29879))

(declare-fun m!29915 () Bool)

(assert (=> bs!1434 m!29915))

(assert (=> b!37056 d!5705))

(declare-fun b!37097 () Bool)

(declare-fun e!23447 () Option!91)

(declare-fun e!23448 () Option!91)

(assert (=> b!37097 (= e!23447 e!23448)))

(declare-fun c!4257 () Bool)

(assert (=> b!37097 (= c!4257 (and ((_ is Cons!963) (toList!500 lm!252)) (not (= (_1!713 (h!1531 (toList!500 lm!252))) k0!388))))))

(declare-fun b!37098 () Bool)

(assert (=> b!37098 (= e!23448 (getValueByKey!85 (t!3721 (toList!500 lm!252)) k0!388))))

(declare-fun d!5707 () Bool)

(declare-fun c!4256 () Bool)

(assert (=> d!5707 (= c!4256 (and ((_ is Cons!963) (toList!500 lm!252)) (= (_1!713 (h!1531 (toList!500 lm!252))) k0!388)))))

(assert (=> d!5707 (= (getValueByKey!85 (toList!500 lm!252) k0!388) e!23447)))

(declare-fun b!37099 () Bool)

(assert (=> b!37099 (= e!23448 None!89)))

(declare-fun b!37096 () Bool)

(assert (=> b!37096 (= e!23447 (Some!90 (_2!713 (h!1531 (toList!500 lm!252)))))))

(assert (= (and d!5707 c!4256) b!37096))

(assert (= (and d!5707 (not c!4256)) b!37097))

(assert (= (and b!37097 c!4257) b!37098))

(assert (= (and b!37097 (not c!4257)) b!37099))

(declare-fun m!29917 () Bool)

(assert (=> b!37098 m!29917))

(assert (=> b!37056 d!5707))

(declare-fun d!5709 () Bool)

(assert (=> d!5709 (= (tail!101 (toList!500 lm!252)) (t!3721 (toList!500 lm!252)))))

(assert (=> d!5671 d!5709))

(declare-fun d!5711 () Bool)

(declare-fun res!22433 () Bool)

(declare-fun e!23449 () Bool)

(assert (=> d!5711 (=> res!22433 e!23449)))

(assert (=> d!5711 (= res!22433 ((_ is Nil!964) (t!3721 (toList!500 lm!252))))))

(assert (=> d!5711 (= (forall!170 (t!3721 (toList!500 lm!252)) p!304) e!23449)))

(declare-fun b!37100 () Bool)

(declare-fun e!23450 () Bool)

(assert (=> b!37100 (= e!23449 e!23450)))

(declare-fun res!22434 () Bool)

(assert (=> b!37100 (=> (not res!22434) (not e!23450))))

(assert (=> b!37100 (= res!22434 (dynLambda!171 p!304 (h!1531 (t!3721 (toList!500 lm!252)))))))

(declare-fun b!37101 () Bool)

(assert (=> b!37101 (= e!23450 (forall!170 (t!3721 (t!3721 (toList!500 lm!252))) p!304))))

(assert (= (and d!5711 (not res!22433)) b!37100))

(assert (= (and b!37100 res!22434) b!37101))

(declare-fun b_lambda!1845 () Bool)

(assert (=> (not b_lambda!1845) (not b!37100)))

(declare-fun t!3737 () Bool)

(declare-fun tb!755 () Bool)

(assert (=> (and start!4838 (= p!304 p!304) t!3737) tb!755))

(declare-fun result!1291 () Bool)

(assert (=> tb!755 (= result!1291 true)))

(assert (=> b!37100 t!3737))

(declare-fun b_and!2227 () Bool)

(assert (= b_and!2219 (and (=> t!3737 result!1291) b_and!2227)))

(declare-fun m!29919 () Bool)

(assert (=> b!37100 m!29919))

(declare-fun m!29921 () Bool)

(assert (=> b!37101 m!29921))

(assert (=> b!36994 d!5711))

(declare-fun d!5713 () Bool)

(declare-fun res!22439 () Bool)

(declare-fun e!23455 () Bool)

(assert (=> d!5713 (=> res!22439 e!23455)))

(assert (=> d!5713 (= res!22439 (and ((_ is Cons!963) (toList!500 lt!13658)) (= (_1!713 (h!1531 (toList!500 lt!13658))) k0!388)))))

(assert (=> d!5713 (= (containsKey!49 (toList!500 lt!13658) k0!388) e!23455)))

(declare-fun b!37106 () Bool)

(declare-fun e!23456 () Bool)

(assert (=> b!37106 (= e!23455 e!23456)))

(declare-fun res!22440 () Bool)

(assert (=> b!37106 (=> (not res!22440) (not e!23456))))

(assert (=> b!37106 (= res!22440 (and (or (not ((_ is Cons!963) (toList!500 lt!13658))) (bvsle (_1!713 (h!1531 (toList!500 lt!13658))) k0!388)) ((_ is Cons!963) (toList!500 lt!13658)) (bvslt (_1!713 (h!1531 (toList!500 lt!13658))) k0!388)))))

(declare-fun b!37107 () Bool)

(assert (=> b!37107 (= e!23456 (containsKey!49 (t!3721 (toList!500 lt!13658)) k0!388))))

(assert (= (and d!5713 (not res!22439)) b!37106))

(assert (= (and b!37106 res!22440) b!37107))

(declare-fun m!29923 () Bool)

(assert (=> b!37107 m!29923))

(assert (=> d!5653 d!5713))

(declare-fun d!5717 () Bool)

(assert (=> d!5717 (= (isEmpty!203 (toList!500 lm!252)) ((_ is Nil!964) (toList!500 lm!252)))))

(assert (=> d!5677 d!5717))

(declare-fun d!5721 () Bool)

(declare-fun lt!13725 () Int)

(assert (=> d!5721 (>= lt!13725 0)))

(declare-fun e!23459 () Int)

(assert (=> d!5721 (= lt!13725 e!23459)))

(declare-fun c!4258 () Bool)

(assert (=> d!5721 (= c!4258 ((_ is Nil!964) (t!3721 (toList!500 lm!252))))))

(assert (=> d!5721 (= (size!1288 (t!3721 (toList!500 lm!252))) lt!13725)))

(declare-fun b!37110 () Bool)

(assert (=> b!37110 (= e!23459 0)))

(declare-fun b!37111 () Bool)

(assert (=> b!37111 (= e!23459 (+ 1 (size!1288 (t!3721 (t!3721 (toList!500 lm!252))))))))

(assert (= (and d!5721 c!4258) b!37110))

(assert (= (and d!5721 (not c!4258)) b!37111))

(declare-fun m!29929 () Bool)

(assert (=> b!37111 m!29929))

(assert (=> b!37076 d!5721))

(declare-fun d!5723 () Bool)

(assert (=> d!5723 (isDefined!47 (getValueByKey!85 (toList!500 lt!13658) k0!388))))

(declare-fun lt!13729 () Unit!844)

(declare-fun choose!229 (List!967 (_ BitVec 64)) Unit!844)

(assert (=> d!5723 (= lt!13729 (choose!229 (toList!500 lt!13658) k0!388))))

(declare-fun e!23469 () Bool)

(assert (=> d!5723 e!23469))

(declare-fun res!22451 () Bool)

(assert (=> d!5723 (=> (not res!22451) (not e!23469))))

(assert (=> d!5723 (= res!22451 (isStrictlySorted!176 (toList!500 lt!13658)))))

(assert (=> d!5723 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!46 (toList!500 lt!13658) k0!388) lt!13729)))

(declare-fun b!37122 () Bool)

(assert (=> b!37122 (= e!23469 (containsKey!49 (toList!500 lt!13658) k0!388))))

(assert (= (and d!5723 res!22451) b!37122))

(assert (=> d!5723 m!29843))

(assert (=> d!5723 m!29843))

(assert (=> d!5723 m!29845))

(declare-fun m!29935 () Bool)

(assert (=> d!5723 m!29935))

(declare-fun m!29937 () Bool)

(assert (=> d!5723 m!29937))

(assert (=> b!37122 m!29839))

(assert (=> b!37035 d!5723))

(declare-fun d!5729 () Bool)

(assert (=> d!5729 (= (isDefined!47 (getValueByKey!85 (toList!500 lt!13658) k0!388)) (not (isEmpty!206 (getValueByKey!85 (toList!500 lt!13658) k0!388))))))

(declare-fun bs!1435 () Bool)

(assert (= bs!1435 d!5729))

(assert (=> bs!1435 m!29843))

(declare-fun m!29939 () Bool)

(assert (=> bs!1435 m!29939))

(assert (=> b!37035 d!5729))

(declare-fun b!37124 () Bool)

(declare-fun e!23470 () Option!91)

(declare-fun e!23471 () Option!91)

(assert (=> b!37124 (= e!23470 e!23471)))

(declare-fun c!4261 () Bool)

(assert (=> b!37124 (= c!4261 (and ((_ is Cons!963) (toList!500 lt!13658)) (not (= (_1!713 (h!1531 (toList!500 lt!13658))) k0!388))))))

(declare-fun b!37125 () Bool)

(assert (=> b!37125 (= e!23471 (getValueByKey!85 (t!3721 (toList!500 lt!13658)) k0!388))))

(declare-fun d!5733 () Bool)

(declare-fun c!4260 () Bool)

(assert (=> d!5733 (= c!4260 (and ((_ is Cons!963) (toList!500 lt!13658)) (= (_1!713 (h!1531 (toList!500 lt!13658))) k0!388)))))

(assert (=> d!5733 (= (getValueByKey!85 (toList!500 lt!13658) k0!388) e!23470)))

(declare-fun b!37126 () Bool)

(assert (=> b!37126 (= e!23471 None!89)))

(declare-fun b!37123 () Bool)

(assert (=> b!37123 (= e!23470 (Some!90 (_2!713 (h!1531 (toList!500 lt!13658)))))))

(assert (= (and d!5733 c!4260) b!37123))

(assert (= (and d!5733 (not c!4260)) b!37124))

(assert (= (and b!37124 c!4261) b!37125))

(assert (= (and b!37124 (not c!4261)) b!37126))

(declare-fun m!29941 () Bool)

(assert (=> b!37125 m!29941))

(assert (=> b!37035 d!5733))

(declare-fun d!5735 () Bool)

(declare-fun res!22462 () Bool)

(declare-fun e!23482 () Bool)

(assert (=> d!5735 (=> res!22462 e!23482)))

(assert (=> d!5735 (= res!22462 (or ((_ is Nil!964) (toList!500 lm!252)) ((_ is Nil!964) (t!3721 (toList!500 lm!252)))))))

(assert (=> d!5735 (= (isStrictlySorted!176 (toList!500 lm!252)) e!23482)))

(declare-fun b!37137 () Bool)

(declare-fun e!23483 () Bool)

(assert (=> b!37137 (= e!23482 e!23483)))

(declare-fun res!22463 () Bool)

(assert (=> b!37137 (=> (not res!22463) (not e!23483))))

(assert (=> b!37137 (= res!22463 (bvslt (_1!713 (h!1531 (toList!500 lm!252))) (_1!713 (h!1531 (t!3721 (toList!500 lm!252))))))))

(declare-fun b!37138 () Bool)

(assert (=> b!37138 (= e!23483 (isStrictlySorted!176 (t!3721 (toList!500 lm!252))))))

(assert (= (and d!5735 (not res!22462)) b!37137))

(assert (= (and b!37137 res!22463) b!37138))

(declare-fun m!29953 () Bool)

(assert (=> b!37138 m!29953))

(assert (=> d!5651 d!5735))

(assert (=> b!37037 d!5729))

(assert (=> b!37037 d!5733))

(declare-fun d!5743 () Bool)

(declare-fun res!22464 () Bool)

(declare-fun e!23484 () Bool)

(assert (=> d!5743 (=> res!22464 e!23484)))

(assert (=> d!5743 (= res!22464 ((_ is Nil!964) (t!3721 (toList!500 lt!13658))))))

(assert (=> d!5743 (= (forall!170 (t!3721 (toList!500 lt!13658)) p!304) e!23484)))

(declare-fun b!37139 () Bool)

(declare-fun e!23485 () Bool)

(assert (=> b!37139 (= e!23484 e!23485)))

(declare-fun res!22465 () Bool)

(assert (=> b!37139 (=> (not res!22465) (not e!23485))))

(assert (=> b!37139 (= res!22465 (dynLambda!171 p!304 (h!1531 (t!3721 (toList!500 lt!13658)))))))

(declare-fun b!37140 () Bool)

(assert (=> b!37140 (= e!23485 (forall!170 (t!3721 (t!3721 (toList!500 lt!13658))) p!304))))

(assert (= (and d!5743 (not res!22464)) b!37139))

(assert (= (and b!37139 res!22465) b!37140))

(declare-fun b_lambda!1849 () Bool)

(assert (=> (not b_lambda!1849) (not b!37139)))

(declare-fun t!3741 () Bool)

(declare-fun tb!759 () Bool)

(assert (=> (and start!4838 (= p!304 p!304) t!3741) tb!759))

(declare-fun result!1295 () Bool)

(assert (=> tb!759 (= result!1295 true)))

(assert (=> b!37139 t!3741))

(declare-fun b_and!2231 () Bool)

(assert (= b_and!2227 (and (=> t!3741 result!1295) b_and!2231)))

(declare-fun m!29957 () Bool)

(assert (=> b!37139 m!29957))

(declare-fun m!29959 () Bool)

(assert (=> b!37140 m!29959))

(assert (=> b!37041 d!5743))

(declare-fun d!5747 () Bool)

(declare-fun lt!13736 () Int)

(assert (=> d!5747 (>= lt!13736 0)))

(declare-fun e!23486 () Int)

(assert (=> d!5747 (= lt!13736 e!23486)))

(declare-fun c!4262 () Bool)

(assert (=> d!5747 (= c!4262 ((_ is Nil!964) (t!3721 (toList!500 lt!13658))))))

(assert (=> d!5747 (= (size!1288 (t!3721 (toList!500 lt!13658))) lt!13736)))

(declare-fun b!37141 () Bool)

(assert (=> b!37141 (= e!23486 0)))

(declare-fun b!37142 () Bool)

(assert (=> b!37142 (= e!23486 (+ 1 (size!1288 (t!3721 (t!3721 (toList!500 lt!13658))))))))

(assert (= (and d!5747 c!4262) b!37141))

(assert (= (and d!5747 (not c!4262)) b!37142))

(declare-fun m!29961 () Bool)

(assert (=> b!37142 m!29961))

(assert (=> b!37072 d!5747))

(declare-fun d!5749 () Bool)

(declare-fun res!22466 () Bool)

(declare-fun e!23489 () Bool)

(assert (=> d!5749 (=> res!22466 e!23489)))

(assert (=> d!5749 (= res!22466 (and ((_ is Cons!963) (toList!500 lm!252)) (= (_1!713 (h!1531 (toList!500 lm!252))) k0!388)))))

(assert (=> d!5749 (= (containsKey!49 (toList!500 lm!252) k0!388) e!23489)))

(declare-fun b!37147 () Bool)

(declare-fun e!23490 () Bool)

(assert (=> b!37147 (= e!23489 e!23490)))

(declare-fun res!22467 () Bool)

(assert (=> b!37147 (=> (not res!22467) (not e!23490))))

(assert (=> b!37147 (= res!22467 (and (or (not ((_ is Cons!963) (toList!500 lm!252))) (bvsle (_1!713 (h!1531 (toList!500 lm!252))) k0!388)) ((_ is Cons!963) (toList!500 lm!252)) (bvslt (_1!713 (h!1531 (toList!500 lm!252))) k0!388)))))

(declare-fun b!37148 () Bool)

(assert (=> b!37148 (= e!23490 (containsKey!49 (t!3721 (toList!500 lm!252)) k0!388))))

(assert (= (and d!5749 (not res!22466)) b!37147))

(assert (= (and b!37147 res!22467) b!37148))

(declare-fun m!29963 () Bool)

(assert (=> b!37148 m!29963))

(assert (=> d!5685 d!5749))

(declare-fun d!5751 () Bool)

(assert (=> d!5751 (isDefined!47 (getValueByKey!85 (toList!500 lm!252) k0!388))))

(declare-fun lt!13737 () Unit!844)

(assert (=> d!5751 (= lt!13737 (choose!229 (toList!500 lm!252) k0!388))))

(declare-fun e!23493 () Bool)

(assert (=> d!5751 e!23493))

(declare-fun res!22468 () Bool)

(assert (=> d!5751 (=> (not res!22468) (not e!23493))))

(assert (=> d!5751 (= res!22468 (isStrictlySorted!176 (toList!500 lm!252)))))

(assert (=> d!5751 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!46 (toList!500 lm!252) k0!388) lt!13737)))

(declare-fun b!37153 () Bool)

(assert (=> b!37153 (= e!23493 (containsKey!49 (toList!500 lm!252) k0!388))))

(assert (= (and d!5751 res!22468) b!37153))

(assert (=> d!5751 m!29879))

(assert (=> d!5751 m!29879))

(assert (=> d!5751 m!29881))

(declare-fun m!29965 () Bool)

(assert (=> d!5751 m!29965))

(assert (=> d!5751 m!29817))

(assert (=> b!37153 m!29875))

(assert (=> b!37054 d!5751))

(assert (=> b!37054 d!5705))

(assert (=> b!37054 d!5707))

(declare-fun b!37154 () Bool)

(declare-fun e!23494 () Bool)

(declare-fun tp!5505 () Bool)

(assert (=> b!37154 (= e!23494 (and tp_is_empty!1665 tp!5505))))

(assert (=> b!37082 (= tp!5501 e!23494)))

(assert (= (and b!37082 ((_ is Cons!963) (t!3721 (toList!500 lm!252)))) b!37154))

(declare-fun b_lambda!1851 () Bool)

(assert (= b_lambda!1845 (or (and start!4838 b_free!1333) b_lambda!1851)))

(declare-fun b_lambda!1853 () Bool)

(assert (= b_lambda!1849 (or (and start!4838 b_free!1333) b_lambda!1853)))

(check-sat (not b!37138) (not b!37122) (not b!37140) tp_is_empty!1665 (not b!37111) (not b_lambda!1839) (not b!37148) (not d!5729) b_and!2231 (not b!37142) (not b_lambda!1837) (not d!5751) (not b_lambda!1853) (not b!37098) (not b!37154) (not b_next!1333) (not d!5705) (not b!37125) (not b!37101) (not b!37153) (not b!37107) (not d!5723) (not b_lambda!1851))
(check-sat b_and!2231 (not b_next!1333))
