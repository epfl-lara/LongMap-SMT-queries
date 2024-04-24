; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4934 () Bool)

(assert start!4934)

(declare-fun b_free!1339 () Bool)

(declare-fun b_next!1339 () Bool)

(assert (=> start!4934 (= b_free!1339 (not b_next!1339))))

(declare-fun tp!5513 () Bool)

(declare-fun b_and!2235 () Bool)

(assert (=> start!4934 (= tp!5513 b_and!2235)))

(declare-fun b!37213 () Bool)

(declare-fun e!23540 () Bool)

(declare-fun tp!5512 () Bool)

(assert (=> b!37213 (= e!23540 tp!5512)))

(declare-fun b!37214 () Bool)

(declare-fun e!23539 () Bool)

(declare-fun e!23541 () Bool)

(assert (=> b!37214 (= e!23539 e!23541)))

(declare-fun res!22507 () Bool)

(assert (=> b!37214 (=> (not res!22507) (not e!23541))))

(declare-datatypes ((B!746 0))(
  ( (B!747 (val!873 Int)) )
))
(declare-datatypes ((tuple2!1388 0))(
  ( (tuple2!1389 (_1!705 (_ BitVec 64)) (_2!705 B!746)) )
))
(declare-datatypes ((List!963 0))(
  ( (Nil!960) (Cons!959 (h!1527 tuple2!1388) (t!3746 List!963)) )
))
(declare-datatypes ((ListLongMap!959 0))(
  ( (ListLongMap!960 (toList!495 List!963)) )
))
(declare-fun lt!13708 () ListLongMap!959)

(declare-fun p!304 () Int)

(declare-fun forall!173 (List!963 Int) Bool)

(assert (=> b!37214 (= res!22507 (forall!173 (toList!495 lt!13708) p!304))))

(declare-fun lm!252 () ListLongMap!959)

(declare-fun tail!104 (ListLongMap!959) ListLongMap!959)

(assert (=> b!37214 (= lt!13708 (tail!104 lm!252))))

(declare-fun res!22504 () Bool)

(assert (=> start!4934 (=> (not res!22504) (not e!23539))))

(assert (=> start!4934 (= res!22504 (forall!173 (toList!495 lm!252) p!304))))

(assert (=> start!4934 e!23539))

(declare-fun inv!1638 (ListLongMap!959) Bool)

(assert (=> start!4934 (and (inv!1638 lm!252) e!23540)))

(assert (=> start!4934 tp!5513))

(assert (=> start!4934 true))

(declare-fun k0!388 () (_ BitVec 64))

(declare-fun b!37215 () Bool)

(declare-fun dynLambda!171 (Int tuple2!1388) Bool)

(declare-fun apply!46 (ListLongMap!959 (_ BitVec 64)) B!746)

(assert (=> b!37215 (= e!23541 (not (dynLambda!171 p!304 (tuple2!1389 k0!388 (apply!46 lm!252 k0!388)))))))

(assert (=> b!37215 (dynLambda!171 p!304 (tuple2!1389 k0!388 (apply!46 lt!13708 k0!388)))))

(declare-datatypes ((Unit!854 0))(
  ( (Unit!855) )
))
(declare-fun lt!13707 () Unit!854)

(declare-fun applyForall!5 (ListLongMap!959 Int (_ BitVec 64)) Unit!854)

(assert (=> b!37215 (= lt!13707 (applyForall!5 lt!13708 p!304 k0!388))))

(declare-fun b!37216 () Bool)

(declare-fun res!22503 () Bool)

(assert (=> b!37216 (=> (not res!22503) (not e!23539))))

(declare-fun isEmpty!209 (ListLongMap!959) Bool)

(assert (=> b!37216 (= res!22503 (not (isEmpty!209 lm!252)))))

(declare-fun b!37217 () Bool)

(declare-fun res!22505 () Bool)

(assert (=> b!37217 (=> (not res!22505) (not e!23539))))

(declare-fun head!843 (List!963) tuple2!1388)

(assert (=> b!37217 (= res!22505 (not (= (_1!705 (head!843 (toList!495 lm!252))) k0!388)))))

(declare-fun b!37218 () Bool)

(declare-fun res!22508 () Bool)

(assert (=> b!37218 (=> (not res!22508) (not e!23539))))

(declare-fun contains!448 (ListLongMap!959 (_ BitVec 64)) Bool)

(assert (=> b!37218 (= res!22508 (contains!448 lm!252 k0!388))))

(declare-fun b!37219 () Bool)

(declare-fun res!22506 () Bool)

(assert (=> b!37219 (=> (not res!22506) (not e!23541))))

(assert (=> b!37219 (= res!22506 (contains!448 lt!13708 k0!388))))

(assert (= (and start!4934 res!22504) b!37218))

(assert (= (and b!37218 res!22508) b!37216))

(assert (= (and b!37216 res!22503) b!37217))

(assert (= (and b!37217 res!22505) b!37214))

(assert (= (and b!37214 res!22507) b!37219))

(assert (= (and b!37219 res!22506) b!37215))

(assert (= start!4934 b!37213))

(declare-fun b_lambda!1865 () Bool)

(assert (=> (not b_lambda!1865) (not b!37215)))

(declare-fun t!3743 () Bool)

(declare-fun tb!767 () Bool)

(assert (=> (and start!4934 (= p!304 p!304) t!3743) tb!767))

(declare-fun result!1303 () Bool)

(assert (=> tb!767 (= result!1303 true)))

(assert (=> b!37215 t!3743))

(declare-fun b_and!2237 () Bool)

(assert (= b_and!2235 (and (=> t!3743 result!1303) b_and!2237)))

(declare-fun b_lambda!1867 () Bool)

(assert (=> (not b_lambda!1867) (not b!37215)))

(declare-fun t!3745 () Bool)

(declare-fun tb!769 () Bool)

(assert (=> (and start!4934 (= p!304 p!304) t!3745) tb!769))

(declare-fun result!1305 () Bool)

(assert (=> tb!769 (= result!1305 true)))

(assert (=> b!37215 t!3745))

(declare-fun b_and!2239 () Bool)

(assert (= b_and!2237 (and (=> t!3745 result!1305) b_and!2239)))

(declare-fun m!29929 () Bool)

(assert (=> b!37217 m!29929))

(declare-fun m!29931 () Bool)

(assert (=> b!37215 m!29931))

(declare-fun m!29933 () Bool)

(assert (=> b!37215 m!29933))

(declare-fun m!29935 () Bool)

(assert (=> b!37215 m!29935))

(declare-fun m!29937 () Bool)

(assert (=> b!37215 m!29937))

(declare-fun m!29939 () Bool)

(assert (=> b!37215 m!29939))

(declare-fun m!29941 () Bool)

(assert (=> b!37214 m!29941))

(declare-fun m!29943 () Bool)

(assert (=> b!37214 m!29943))

(declare-fun m!29945 () Bool)

(assert (=> b!37218 m!29945))

(declare-fun m!29947 () Bool)

(assert (=> b!37219 m!29947))

(declare-fun m!29949 () Bool)

(assert (=> start!4934 m!29949))

(declare-fun m!29951 () Bool)

(assert (=> start!4934 m!29951))

(declare-fun m!29953 () Bool)

(assert (=> b!37216 m!29953))

(check-sat (not b!37215) (not b!37217) (not b!37216) (not b_next!1339) (not b_lambda!1867) (not b!37218) (not b!37214) (not start!4934) (not b_lambda!1865) (not b!37219) (not b!37213) b_and!2239)
(check-sat b_and!2239 (not b_next!1339))
(get-model)

(declare-fun b_lambda!1885 () Bool)

(assert (= b_lambda!1867 (or (and start!4934 b_free!1339) b_lambda!1885)))

(declare-fun b_lambda!1887 () Bool)

(assert (= b_lambda!1865 (or (and start!4934 b_free!1339) b_lambda!1887)))

(check-sat (not b_lambda!1885) (not b_lambda!1887) (not b!37215) (not b!37217) (not b!37219) (not b!37216) (not b_next!1339) (not b!37218) (not b!37214) (not start!4934) (not b!37213) b_and!2239)
(check-sat b_and!2239 (not b_next!1339))
(get-model)

(declare-fun d!5803 () Bool)

(declare-datatypes ((Option!93 0))(
  ( (Some!92 (v!1961 B!746)) (None!91) )
))
(declare-fun get!635 (Option!93) B!746)

(declare-fun getValueByKey!87 (List!963 (_ BitVec 64)) Option!93)

(assert (=> d!5803 (= (apply!46 lm!252 k0!388) (get!635 (getValueByKey!87 (toList!495 lm!252) k0!388)))))

(declare-fun bs!1443 () Bool)

(assert (= bs!1443 d!5803))

(declare-fun m!30011 () Bool)

(assert (=> bs!1443 m!30011))

(assert (=> bs!1443 m!30011))

(declare-fun m!30013 () Bool)

(assert (=> bs!1443 m!30013))

(assert (=> b!37215 d!5803))

(declare-fun d!5807 () Bool)

(assert (=> d!5807 (= (apply!46 lt!13708 k0!388) (get!635 (getValueByKey!87 (toList!495 lt!13708) k0!388)))))

(declare-fun bs!1445 () Bool)

(assert (= bs!1445 d!5807))

(declare-fun m!30017 () Bool)

(assert (=> bs!1445 m!30017))

(assert (=> bs!1445 m!30017))

(declare-fun m!30019 () Bool)

(assert (=> bs!1445 m!30019))

(assert (=> b!37215 d!5807))

(declare-fun d!5811 () Bool)

(assert (=> d!5811 (dynLambda!171 p!304 (tuple2!1389 k0!388 (apply!46 lt!13708 k0!388)))))

(declare-fun lt!13735 () Unit!854)

(declare-fun choose!232 (ListLongMap!959 Int (_ BitVec 64)) Unit!854)

(assert (=> d!5811 (= lt!13735 (choose!232 lt!13708 p!304 k0!388))))

(declare-fun e!23576 () Bool)

(assert (=> d!5811 e!23576))

(declare-fun res!22558 () Bool)

(assert (=> d!5811 (=> (not res!22558) (not e!23576))))

(assert (=> d!5811 (= res!22558 (forall!173 (toList!495 lt!13708) p!304))))

(assert (=> d!5811 (= (applyForall!5 lt!13708 p!304 k0!388) lt!13735)))

(declare-fun b!37281 () Bool)

(assert (=> b!37281 (= e!23576 (contains!448 lt!13708 k0!388))))

(assert (= (and d!5811 res!22558) b!37281))

(declare-fun b_lambda!1893 () Bool)

(assert (=> (not b_lambda!1893) (not d!5811)))

(assert (=> d!5811 t!3745))

(declare-fun b_and!2257 () Bool)

(assert (= b_and!2239 (and (=> t!3745 result!1305) b_and!2257)))

(assert (=> d!5811 m!29939))

(assert (=> d!5811 m!29937))

(declare-fun m!30043 () Bool)

(assert (=> d!5811 m!30043))

(assert (=> d!5811 m!29941))

(assert (=> b!37281 m!29947))

(assert (=> b!37215 d!5811))

(declare-fun d!5823 () Bool)

(declare-fun res!22565 () Bool)

(declare-fun e!23583 () Bool)

(assert (=> d!5823 (=> res!22565 e!23583)))

(get-info :version)

(assert (=> d!5823 (= res!22565 ((_ is Nil!960) (toList!495 lt!13708)))))

(assert (=> d!5823 (= (forall!173 (toList!495 lt!13708) p!304) e!23583)))

(declare-fun b!37288 () Bool)

(declare-fun e!23584 () Bool)

(assert (=> b!37288 (= e!23583 e!23584)))

(declare-fun res!22566 () Bool)

(assert (=> b!37288 (=> (not res!22566) (not e!23584))))

(assert (=> b!37288 (= res!22566 (dynLambda!171 p!304 (h!1527 (toList!495 lt!13708))))))

(declare-fun b!37289 () Bool)

(assert (=> b!37289 (= e!23584 (forall!173 (t!3746 (toList!495 lt!13708)) p!304))))

(assert (= (and d!5823 (not res!22565)) b!37288))

(assert (= (and b!37288 res!22566) b!37289))

(declare-fun b_lambda!1895 () Bool)

(assert (=> (not b_lambda!1895) (not b!37288)))

(declare-fun t!3762 () Bool)

(declare-fun tb!783 () Bool)

(assert (=> (and start!4934 (= p!304 p!304) t!3762) tb!783))

(declare-fun result!1319 () Bool)

(assert (=> tb!783 (= result!1319 true)))

(assert (=> b!37288 t!3762))

(declare-fun b_and!2259 () Bool)

(assert (= b_and!2257 (and (=> t!3762 result!1319) b_and!2259)))

(declare-fun m!30051 () Bool)

(assert (=> b!37288 m!30051))

(declare-fun m!30053 () Bool)

(assert (=> b!37289 m!30053))

(assert (=> b!37214 d!5823))

(declare-fun d!5829 () Bool)

(declare-fun tail!108 (List!963) List!963)

(assert (=> d!5829 (= (tail!104 lm!252) (ListLongMap!960 (tail!108 (toList!495 lm!252))))))

(declare-fun bs!1451 () Bool)

(assert (= bs!1451 d!5829))

(declare-fun m!30057 () Bool)

(assert (=> bs!1451 m!30057))

(assert (=> b!37214 d!5829))

(declare-fun d!5833 () Bool)

(declare-fun e!23609 () Bool)

(assert (=> d!5833 e!23609))

(declare-fun res!22585 () Bool)

(assert (=> d!5833 (=> res!22585 e!23609)))

(declare-fun lt!13767 () Bool)

(assert (=> d!5833 (= res!22585 (not lt!13767))))

(declare-fun lt!13768 () Bool)

(assert (=> d!5833 (= lt!13767 lt!13768)))

(declare-fun lt!13769 () Unit!854)

(declare-fun e!23610 () Unit!854)

(assert (=> d!5833 (= lt!13769 e!23610)))

(declare-fun c!4286 () Bool)

(assert (=> d!5833 (= c!4286 lt!13768)))

(declare-fun containsKey!52 (List!963 (_ BitVec 64)) Bool)

(assert (=> d!5833 (= lt!13768 (containsKey!52 (toList!495 lt!13708) k0!388))))

(assert (=> d!5833 (= (contains!448 lt!13708 k0!388) lt!13767)))

(declare-fun b!37320 () Bool)

(declare-fun lt!13766 () Unit!854)

(assert (=> b!37320 (= e!23610 lt!13766)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!49 (List!963 (_ BitVec 64)) Unit!854)

(assert (=> b!37320 (= lt!13766 (lemmaContainsKeyImpliesGetValueByKeyDefined!49 (toList!495 lt!13708) k0!388))))

(declare-fun isDefined!50 (Option!93) Bool)

(assert (=> b!37320 (isDefined!50 (getValueByKey!87 (toList!495 lt!13708) k0!388))))

(declare-fun b!37321 () Bool)

(declare-fun Unit!861 () Unit!854)

(assert (=> b!37321 (= e!23610 Unit!861)))

(declare-fun b!37322 () Bool)

(assert (=> b!37322 (= e!23609 (isDefined!50 (getValueByKey!87 (toList!495 lt!13708) k0!388)))))

(assert (= (and d!5833 c!4286) b!37320))

(assert (= (and d!5833 (not c!4286)) b!37321))

(assert (= (and d!5833 (not res!22585)) b!37322))

(declare-fun m!30085 () Bool)

(assert (=> d!5833 m!30085))

(declare-fun m!30087 () Bool)

(assert (=> b!37320 m!30087))

(assert (=> b!37320 m!30017))

(assert (=> b!37320 m!30017))

(declare-fun m!30089 () Bool)

(assert (=> b!37320 m!30089))

(assert (=> b!37322 m!30017))

(assert (=> b!37322 m!30017))

(assert (=> b!37322 m!30089))

(assert (=> b!37219 d!5833))

(declare-fun d!5851 () Bool)

(declare-fun e!23613 () Bool)

(assert (=> d!5851 e!23613))

(declare-fun res!22587 () Bool)

(assert (=> d!5851 (=> res!22587 e!23613)))

(declare-fun lt!13775 () Bool)

(assert (=> d!5851 (= res!22587 (not lt!13775))))

(declare-fun lt!13776 () Bool)

(assert (=> d!5851 (= lt!13775 lt!13776)))

(declare-fun lt!13777 () Unit!854)

(declare-fun e!23614 () Unit!854)

(assert (=> d!5851 (= lt!13777 e!23614)))

(declare-fun c!4288 () Bool)

(assert (=> d!5851 (= c!4288 lt!13776)))

(assert (=> d!5851 (= lt!13776 (containsKey!52 (toList!495 lm!252) k0!388))))

(assert (=> d!5851 (= (contains!448 lm!252 k0!388) lt!13775)))

(declare-fun b!37326 () Bool)

(declare-fun lt!13774 () Unit!854)

(assert (=> b!37326 (= e!23614 lt!13774)))

(assert (=> b!37326 (= lt!13774 (lemmaContainsKeyImpliesGetValueByKeyDefined!49 (toList!495 lm!252) k0!388))))

(assert (=> b!37326 (isDefined!50 (getValueByKey!87 (toList!495 lm!252) k0!388))))

(declare-fun b!37327 () Bool)

(declare-fun Unit!863 () Unit!854)

(assert (=> b!37327 (= e!23614 Unit!863)))

(declare-fun b!37328 () Bool)

(assert (=> b!37328 (= e!23613 (isDefined!50 (getValueByKey!87 (toList!495 lm!252) k0!388)))))

(assert (= (and d!5851 c!4288) b!37326))

(assert (= (and d!5851 (not c!4288)) b!37327))

(assert (= (and d!5851 (not res!22587)) b!37328))

(declare-fun m!30097 () Bool)

(assert (=> d!5851 m!30097))

(declare-fun m!30099 () Bool)

(assert (=> b!37326 m!30099))

(assert (=> b!37326 m!30011))

(assert (=> b!37326 m!30011))

(declare-fun m!30101 () Bool)

(assert (=> b!37326 m!30101))

(assert (=> b!37328 m!30011))

(assert (=> b!37328 m!30011))

(assert (=> b!37328 m!30101))

(assert (=> b!37218 d!5851))

(declare-fun d!5857 () Bool)

(declare-fun res!22588 () Bool)

(declare-fun e!23615 () Bool)

(assert (=> d!5857 (=> res!22588 e!23615)))

(assert (=> d!5857 (= res!22588 ((_ is Nil!960) (toList!495 lm!252)))))

(assert (=> d!5857 (= (forall!173 (toList!495 lm!252) p!304) e!23615)))

(declare-fun b!37329 () Bool)

(declare-fun e!23616 () Bool)

(assert (=> b!37329 (= e!23615 e!23616)))

(declare-fun res!22589 () Bool)

(assert (=> b!37329 (=> (not res!22589) (not e!23616))))

(assert (=> b!37329 (= res!22589 (dynLambda!171 p!304 (h!1527 (toList!495 lm!252))))))

(declare-fun b!37330 () Bool)

(assert (=> b!37330 (= e!23616 (forall!173 (t!3746 (toList!495 lm!252)) p!304))))

(assert (= (and d!5857 (not res!22588)) b!37329))

(assert (= (and b!37329 res!22589) b!37330))

(declare-fun b_lambda!1905 () Bool)

(assert (=> (not b_lambda!1905) (not b!37329)))

(declare-fun t!3768 () Bool)

(declare-fun tb!789 () Bool)

(assert (=> (and start!4934 (= p!304 p!304) t!3768) tb!789))

(declare-fun result!1325 () Bool)

(assert (=> tb!789 (= result!1325 true)))

(assert (=> b!37329 t!3768))

(declare-fun b_and!2269 () Bool)

(assert (= b_and!2259 (and (=> t!3768 result!1325) b_and!2269)))

(declare-fun m!30103 () Bool)

(assert (=> b!37329 m!30103))

(declare-fun m!30105 () Bool)

(assert (=> b!37330 m!30105))

(assert (=> start!4934 d!5857))

(declare-fun d!5859 () Bool)

(declare-fun isStrictlySorted!174 (List!963) Bool)

(assert (=> d!5859 (= (inv!1638 lm!252) (isStrictlySorted!174 (toList!495 lm!252)))))

(declare-fun bs!1456 () Bool)

(assert (= bs!1456 d!5859))

(declare-fun m!30111 () Bool)

(assert (=> bs!1456 m!30111))

(assert (=> start!4934 d!5859))

(declare-fun d!5861 () Bool)

(assert (=> d!5861 (= (head!843 (toList!495 lm!252)) (h!1527 (toList!495 lm!252)))))

(assert (=> b!37217 d!5861))

(declare-fun d!5863 () Bool)

(declare-fun isEmpty!212 (List!963) Bool)

(assert (=> d!5863 (= (isEmpty!209 lm!252) (isEmpty!212 (toList!495 lm!252)))))

(declare-fun bs!1457 () Bool)

(assert (= bs!1457 d!5863))

(declare-fun m!30113 () Bool)

(assert (=> bs!1457 m!30113))

(assert (=> b!37216 d!5863))

(declare-fun b!37345 () Bool)

(declare-fun e!23625 () Bool)

(declare-fun tp_is_empty!1673 () Bool)

(declare-fun tp!5534 () Bool)

(assert (=> b!37345 (= e!23625 (and tp_is_empty!1673 tp!5534))))

(assert (=> b!37213 (= tp!5512 e!23625)))

(assert (= (and b!37213 ((_ is Cons!959) (toList!495 lm!252))) b!37345))

(declare-fun b_lambda!1919 () Bool)

(assert (= b_lambda!1893 (or (and start!4934 b_free!1339) b_lambda!1919)))

(declare-fun b_lambda!1921 () Bool)

(assert (= b_lambda!1895 (or (and start!4934 b_free!1339) b_lambda!1921)))

(declare-fun b_lambda!1923 () Bool)

(assert (= b_lambda!1905 (or (and start!4934 b_free!1339) b_lambda!1923)))

(check-sat (not b_lambda!1921) (not b!37320) (not b_lambda!1885) (not b!37281) (not b!37326) (not b!37289) (not d!5829) (not d!5859) (not d!5811) (not d!5833) (not b!37322) (not b!37328) (not b_next!1339) b_and!2269 (not b_lambda!1919) (not d!5803) (not b_lambda!1887) (not b_lambda!1923) (not b!37345) tp_is_empty!1673 (not d!5807) (not b!37330) (not d!5863) (not d!5851))
(check-sat b_and!2269 (not b_next!1339))
(get-model)

(declare-fun d!5865 () Bool)

(assert (=> d!5865 (isDefined!50 (getValueByKey!87 (toList!495 lm!252) k0!388))))

(declare-fun lt!13780 () Unit!854)

(declare-fun choose!235 (List!963 (_ BitVec 64)) Unit!854)

(assert (=> d!5865 (= lt!13780 (choose!235 (toList!495 lm!252) k0!388))))

(declare-fun e!23628 () Bool)

(assert (=> d!5865 e!23628))

(declare-fun res!22592 () Bool)

(assert (=> d!5865 (=> (not res!22592) (not e!23628))))

(assert (=> d!5865 (= res!22592 (isStrictlySorted!174 (toList!495 lm!252)))))

(assert (=> d!5865 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!49 (toList!495 lm!252) k0!388) lt!13780)))

(declare-fun b!37348 () Bool)

(assert (=> b!37348 (= e!23628 (containsKey!52 (toList!495 lm!252) k0!388))))

(assert (= (and d!5865 res!22592) b!37348))

(assert (=> d!5865 m!30011))

(assert (=> d!5865 m!30011))

(assert (=> d!5865 m!30101))

(declare-fun m!30115 () Bool)

(assert (=> d!5865 m!30115))

(assert (=> d!5865 m!30111))

(assert (=> b!37348 m!30097))

(assert (=> b!37326 d!5865))

(declare-fun d!5867 () Bool)

(declare-fun isEmpty!215 (Option!93) Bool)

(assert (=> d!5867 (= (isDefined!50 (getValueByKey!87 (toList!495 lm!252) k0!388)) (not (isEmpty!215 (getValueByKey!87 (toList!495 lm!252) k0!388))))))

(declare-fun bs!1458 () Bool)

(assert (= bs!1458 d!5867))

(assert (=> bs!1458 m!30011))

(declare-fun m!30117 () Bool)

(assert (=> bs!1458 m!30117))

(assert (=> b!37326 d!5867))

(declare-fun b!37358 () Bool)

(declare-fun e!23633 () Option!93)

(declare-fun e!23634 () Option!93)

(assert (=> b!37358 (= e!23633 e!23634)))

(declare-fun c!4294 () Bool)

(assert (=> b!37358 (= c!4294 (and ((_ is Cons!959) (toList!495 lm!252)) (not (= (_1!705 (h!1527 (toList!495 lm!252))) k0!388))))))

(declare-fun b!37357 () Bool)

(assert (=> b!37357 (= e!23633 (Some!92 (_2!705 (h!1527 (toList!495 lm!252)))))))

(declare-fun b!37359 () Bool)

(assert (=> b!37359 (= e!23634 (getValueByKey!87 (t!3746 (toList!495 lm!252)) k0!388))))

(declare-fun d!5869 () Bool)

(declare-fun c!4293 () Bool)

(assert (=> d!5869 (= c!4293 (and ((_ is Cons!959) (toList!495 lm!252)) (= (_1!705 (h!1527 (toList!495 lm!252))) k0!388)))))

(assert (=> d!5869 (= (getValueByKey!87 (toList!495 lm!252) k0!388) e!23633)))

(declare-fun b!37360 () Bool)

(assert (=> b!37360 (= e!23634 None!91)))

(assert (= (and d!5869 c!4293) b!37357))

(assert (= (and d!5869 (not c!4293)) b!37358))

(assert (= (and b!37358 c!4294) b!37359))

(assert (= (and b!37358 (not c!4294)) b!37360))

(declare-fun m!30119 () Bool)

(assert (=> b!37359 m!30119))

(assert (=> b!37326 d!5869))

(declare-fun d!5871 () Bool)

(declare-fun res!22597 () Bool)

(declare-fun e!23639 () Bool)

(assert (=> d!5871 (=> res!22597 e!23639)))

(assert (=> d!5871 (= res!22597 (and ((_ is Cons!959) (toList!495 lt!13708)) (= (_1!705 (h!1527 (toList!495 lt!13708))) k0!388)))))

(assert (=> d!5871 (= (containsKey!52 (toList!495 lt!13708) k0!388) e!23639)))

(declare-fun b!37365 () Bool)

(declare-fun e!23640 () Bool)

(assert (=> b!37365 (= e!23639 e!23640)))

(declare-fun res!22598 () Bool)

(assert (=> b!37365 (=> (not res!22598) (not e!23640))))

(assert (=> b!37365 (= res!22598 (and (or (not ((_ is Cons!959) (toList!495 lt!13708))) (bvsle (_1!705 (h!1527 (toList!495 lt!13708))) k0!388)) ((_ is Cons!959) (toList!495 lt!13708)) (bvslt (_1!705 (h!1527 (toList!495 lt!13708))) k0!388)))))

(declare-fun b!37366 () Bool)

(assert (=> b!37366 (= e!23640 (containsKey!52 (t!3746 (toList!495 lt!13708)) k0!388))))

(assert (= (and d!5871 (not res!22597)) b!37365))

(assert (= (and b!37365 res!22598) b!37366))

(declare-fun m!30121 () Bool)

(assert (=> b!37366 m!30121))

(assert (=> d!5833 d!5871))

(declare-fun d!5875 () Bool)

(declare-fun res!22599 () Bool)

(declare-fun e!23641 () Bool)

(assert (=> d!5875 (=> res!22599 e!23641)))

(assert (=> d!5875 (= res!22599 (and ((_ is Cons!959) (toList!495 lm!252)) (= (_1!705 (h!1527 (toList!495 lm!252))) k0!388)))))

(assert (=> d!5875 (= (containsKey!52 (toList!495 lm!252) k0!388) e!23641)))

(declare-fun b!37367 () Bool)

(declare-fun e!23642 () Bool)

(assert (=> b!37367 (= e!23641 e!23642)))

(declare-fun res!22600 () Bool)

(assert (=> b!37367 (=> (not res!22600) (not e!23642))))

(assert (=> b!37367 (= res!22600 (and (or (not ((_ is Cons!959) (toList!495 lm!252))) (bvsle (_1!705 (h!1527 (toList!495 lm!252))) k0!388)) ((_ is Cons!959) (toList!495 lm!252)) (bvslt (_1!705 (h!1527 (toList!495 lm!252))) k0!388)))))

(declare-fun b!37368 () Bool)

(assert (=> b!37368 (= e!23642 (containsKey!52 (t!3746 (toList!495 lm!252)) k0!388))))

(assert (= (and d!5875 (not res!22599)) b!37367))

(assert (= (and b!37367 res!22600) b!37368))

(declare-fun m!30123 () Bool)

(assert (=> b!37368 m!30123))

(assert (=> d!5851 d!5875))

(declare-fun d!5877 () Bool)

(assert (=> d!5877 (= (isDefined!50 (getValueByKey!87 (toList!495 lt!13708) k0!388)) (not (isEmpty!215 (getValueByKey!87 (toList!495 lt!13708) k0!388))))))

(declare-fun bs!1459 () Bool)

(assert (= bs!1459 d!5877))

(assert (=> bs!1459 m!30017))

(declare-fun m!30125 () Bool)

(assert (=> bs!1459 m!30125))

(assert (=> b!37322 d!5877))

(declare-fun b!37370 () Bool)

(declare-fun e!23643 () Option!93)

(declare-fun e!23644 () Option!93)

(assert (=> b!37370 (= e!23643 e!23644)))

(declare-fun c!4296 () Bool)

(assert (=> b!37370 (= c!4296 (and ((_ is Cons!959) (toList!495 lt!13708)) (not (= (_1!705 (h!1527 (toList!495 lt!13708))) k0!388))))))

(declare-fun b!37369 () Bool)

(assert (=> b!37369 (= e!23643 (Some!92 (_2!705 (h!1527 (toList!495 lt!13708)))))))

(declare-fun b!37371 () Bool)

(assert (=> b!37371 (= e!23644 (getValueByKey!87 (t!3746 (toList!495 lt!13708)) k0!388))))

(declare-fun d!5879 () Bool)

(declare-fun c!4295 () Bool)

(assert (=> d!5879 (= c!4295 (and ((_ is Cons!959) (toList!495 lt!13708)) (= (_1!705 (h!1527 (toList!495 lt!13708))) k0!388)))))

(assert (=> d!5879 (= (getValueByKey!87 (toList!495 lt!13708) k0!388) e!23643)))

(declare-fun b!37372 () Bool)

(assert (=> b!37372 (= e!23644 None!91)))

(assert (= (and d!5879 c!4295) b!37369))

(assert (= (and d!5879 (not c!4295)) b!37370))

(assert (= (and b!37370 c!4296) b!37371))

(assert (= (and b!37370 (not c!4296)) b!37372))

(declare-fun m!30127 () Bool)

(assert (=> b!37371 m!30127))

(assert (=> b!37322 d!5879))

(assert (=> d!5811 d!5807))

(declare-fun d!5881 () Bool)

(assert (=> d!5881 (dynLambda!171 p!304 (tuple2!1389 k0!388 (apply!46 lt!13708 k0!388)))))

(assert (=> d!5881 true))

(declare-fun _$37!23 () Unit!854)

(assert (=> d!5881 (= (choose!232 lt!13708 p!304 k0!388) _$37!23)))

(declare-fun b_lambda!1925 () Bool)

(assert (=> (not b_lambda!1925) (not d!5881)))

(assert (=> d!5881 t!3745))

(declare-fun b_and!2271 () Bool)

(assert (= b_and!2269 (and (=> t!3745 result!1305) b_and!2271)))

(assert (=> d!5881 m!29939))

(assert (=> d!5881 m!29937))

(assert (=> d!5811 d!5881))

(assert (=> d!5811 d!5823))

(declare-fun d!5883 () Bool)

(assert (=> d!5883 (= (tail!108 (toList!495 lm!252)) (t!3746 (toList!495 lm!252)))))

(assert (=> d!5829 d!5883))

(assert (=> b!37281 d!5833))

(declare-fun d!5885 () Bool)

(assert (=> d!5885 (isDefined!50 (getValueByKey!87 (toList!495 lt!13708) k0!388))))

(declare-fun lt!13783 () Unit!854)

(assert (=> d!5885 (= lt!13783 (choose!235 (toList!495 lt!13708) k0!388))))

(declare-fun e!23647 () Bool)

(assert (=> d!5885 e!23647))

(declare-fun res!22603 () Bool)

(assert (=> d!5885 (=> (not res!22603) (not e!23647))))

(assert (=> d!5885 (= res!22603 (isStrictlySorted!174 (toList!495 lt!13708)))))

(assert (=> d!5885 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!49 (toList!495 lt!13708) k0!388) lt!13783)))

(declare-fun b!37375 () Bool)

(assert (=> b!37375 (= e!23647 (containsKey!52 (toList!495 lt!13708) k0!388))))

(assert (= (and d!5885 res!22603) b!37375))

(assert (=> d!5885 m!30017))

(assert (=> d!5885 m!30017))

(assert (=> d!5885 m!30089))

(declare-fun m!30129 () Bool)

(assert (=> d!5885 m!30129))

(declare-fun m!30131 () Bool)

(assert (=> d!5885 m!30131))

(assert (=> b!37375 m!30085))

(assert (=> b!37320 d!5885))

(assert (=> b!37320 d!5877))

(assert (=> b!37320 d!5879))

(declare-fun d!5887 () Bool)

(assert (=> d!5887 (= (isEmpty!212 (toList!495 lm!252)) ((_ is Nil!960) (toList!495 lm!252)))))

(assert (=> d!5863 d!5887))

(declare-fun d!5891 () Bool)

(declare-fun res!22609 () Bool)

(declare-fun e!23653 () Bool)

(assert (=> d!5891 (=> res!22609 e!23653)))

(assert (=> d!5891 (= res!22609 (or ((_ is Nil!960) (toList!495 lm!252)) ((_ is Nil!960) (t!3746 (toList!495 lm!252)))))))

(assert (=> d!5891 (= (isStrictlySorted!174 (toList!495 lm!252)) e!23653)))

(declare-fun b!37381 () Bool)

(declare-fun e!23654 () Bool)

(assert (=> b!37381 (= e!23653 e!23654)))

(declare-fun res!22610 () Bool)

(assert (=> b!37381 (=> (not res!22610) (not e!23654))))

(assert (=> b!37381 (= res!22610 (bvslt (_1!705 (h!1527 (toList!495 lm!252))) (_1!705 (h!1527 (t!3746 (toList!495 lm!252))))))))

(declare-fun b!37382 () Bool)

(assert (=> b!37382 (= e!23654 (isStrictlySorted!174 (t!3746 (toList!495 lm!252))))))

(assert (= (and d!5891 (not res!22609)) b!37381))

(assert (= (and b!37381 res!22610) b!37382))

(declare-fun m!30139 () Bool)

(assert (=> b!37382 m!30139))

(assert (=> d!5859 d!5891))

(declare-fun d!5895 () Bool)

(declare-fun res!22611 () Bool)

(declare-fun e!23655 () Bool)

(assert (=> d!5895 (=> res!22611 e!23655)))

(assert (=> d!5895 (= res!22611 ((_ is Nil!960) (t!3746 (toList!495 lm!252))))))

(assert (=> d!5895 (= (forall!173 (t!3746 (toList!495 lm!252)) p!304) e!23655)))

(declare-fun b!37383 () Bool)

(declare-fun e!23656 () Bool)

(assert (=> b!37383 (= e!23655 e!23656)))

(declare-fun res!22612 () Bool)

(assert (=> b!37383 (=> (not res!22612) (not e!23656))))

(assert (=> b!37383 (= res!22612 (dynLambda!171 p!304 (h!1527 (t!3746 (toList!495 lm!252)))))))

(declare-fun b!37384 () Bool)

(assert (=> b!37384 (= e!23656 (forall!173 (t!3746 (t!3746 (toList!495 lm!252))) p!304))))

(assert (= (and d!5895 (not res!22611)) b!37383))

(assert (= (and b!37383 res!22612) b!37384))

(declare-fun b_lambda!1927 () Bool)

(assert (=> (not b_lambda!1927) (not b!37383)))

(declare-fun t!3770 () Bool)

(declare-fun tb!791 () Bool)

(assert (=> (and start!4934 (= p!304 p!304) t!3770) tb!791))

(declare-fun result!1333 () Bool)

(assert (=> tb!791 (= result!1333 true)))

(assert (=> b!37383 t!3770))

(declare-fun b_and!2273 () Bool)

(assert (= b_and!2271 (and (=> t!3770 result!1333) b_and!2273)))

(declare-fun m!30141 () Bool)

(assert (=> b!37383 m!30141))

(declare-fun m!30143 () Bool)

(assert (=> b!37384 m!30143))

(assert (=> b!37330 d!5895))

(declare-fun d!5899 () Bool)

(assert (=> d!5899 (= (get!635 (getValueByKey!87 (toList!495 lm!252) k0!388)) (v!1961 (getValueByKey!87 (toList!495 lm!252) k0!388)))))

(assert (=> d!5803 d!5899))

(assert (=> d!5803 d!5869))

(declare-fun d!5901 () Bool)

(declare-fun res!22613 () Bool)

(declare-fun e!23661 () Bool)

(assert (=> d!5901 (=> res!22613 e!23661)))

(assert (=> d!5901 (= res!22613 ((_ is Nil!960) (t!3746 (toList!495 lt!13708))))))

(assert (=> d!5901 (= (forall!173 (t!3746 (toList!495 lt!13708)) p!304) e!23661)))

(declare-fun b!37393 () Bool)

(declare-fun e!23662 () Bool)

(assert (=> b!37393 (= e!23661 e!23662)))

(declare-fun res!22614 () Bool)

(assert (=> b!37393 (=> (not res!22614) (not e!23662))))

(assert (=> b!37393 (= res!22614 (dynLambda!171 p!304 (h!1527 (t!3746 (toList!495 lt!13708)))))))

(declare-fun b!37394 () Bool)

(assert (=> b!37394 (= e!23662 (forall!173 (t!3746 (t!3746 (toList!495 lt!13708))) p!304))))

(assert (= (and d!5901 (not res!22613)) b!37393))

(assert (= (and b!37393 res!22614) b!37394))

(declare-fun b_lambda!1929 () Bool)

(assert (=> (not b_lambda!1929) (not b!37393)))

(declare-fun t!3772 () Bool)

(declare-fun tb!793 () Bool)

(assert (=> (and start!4934 (= p!304 p!304) t!3772) tb!793))

(declare-fun result!1335 () Bool)

(assert (=> tb!793 (= result!1335 true)))

(assert (=> b!37393 t!3772))

(declare-fun b_and!2275 () Bool)

(assert (= b_and!2273 (and (=> t!3772 result!1335) b_and!2275)))

(declare-fun m!30145 () Bool)

(assert (=> b!37393 m!30145))

(declare-fun m!30147 () Bool)

(assert (=> b!37394 m!30147))

(assert (=> b!37289 d!5901))

(assert (=> b!37328 d!5867))

(assert (=> b!37328 d!5869))

(declare-fun d!5903 () Bool)

(assert (=> d!5903 (= (get!635 (getValueByKey!87 (toList!495 lt!13708) k0!388)) (v!1961 (getValueByKey!87 (toList!495 lt!13708) k0!388)))))

(assert (=> d!5807 d!5903))

(assert (=> d!5807 d!5879))

(declare-fun b!37395 () Bool)

(declare-fun e!23663 () Bool)

(declare-fun tp!5535 () Bool)

(assert (=> b!37395 (= e!23663 (and tp_is_empty!1673 tp!5535))))

(assert (=> b!37345 (= tp!5534 e!23663)))

(assert (= (and b!37345 ((_ is Cons!959) (t!3746 (toList!495 lm!252)))) b!37395))

(declare-fun b_lambda!1933 () Bool)

(assert (= b_lambda!1925 (or (and start!4934 b_free!1339) b_lambda!1933)))

(declare-fun b_lambda!1935 () Bool)

(assert (= b_lambda!1929 (or (and start!4934 b_free!1339) b_lambda!1935)))

(declare-fun b_lambda!1937 () Bool)

(assert (= b_lambda!1927 (or (and start!4934 b_free!1339) b_lambda!1937)))

(check-sat (not b!37368) (not b_lambda!1885) (not d!5867) (not b!37394) (not b_lambda!1935) tp_is_empty!1673 (not b!37371) (not b!37359) (not b_lambda!1921) (not b!37382) (not b_lambda!1887) (not b_lambda!1923) b_and!2275 (not b!37348) (not b!37395) (not d!5885) (not b!37375) (not d!5881) (not d!5865) (not b_next!1339) (not b!37384) (not b_lambda!1933) (not d!5877) (not b_lambda!1937) (not b_lambda!1919) (not b!37366))
(check-sat b_and!2275 (not b_next!1339))
