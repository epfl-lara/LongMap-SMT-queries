; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4850 () Bool)

(assert start!4850)

(declare-fun b_free!1335 () Bool)

(declare-fun b_next!1335 () Bool)

(assert (=> start!4850 (= b_free!1335 (not b_next!1335))))

(declare-fun tp!5489 () Bool)

(declare-fun b_and!2217 () Bool)

(assert (=> start!4850 (= tp!5489 b_and!2217)))

(declare-fun b!37015 () Bool)

(declare-fun e!23407 () Bool)

(declare-fun e!23405 () Bool)

(assert (=> b!37015 (= e!23407 e!23405)))

(declare-fun res!22405 () Bool)

(assert (=> b!37015 (=> (not res!22405) (not e!23405))))

(declare-datatypes ((B!742 0))(
  ( (B!743 (val!871 Int)) )
))
(declare-datatypes ((tuple2!1402 0))(
  ( (tuple2!1403 (_1!712 (_ BitVec 64)) (_2!712 B!742)) )
))
(declare-datatypes ((List!975 0))(
  ( (Nil!972) (Cons!971 (h!1539 tuple2!1402) (t!3736 List!975)) )
))
(declare-datatypes ((ListLongMap!979 0))(
  ( (ListLongMap!980 (toList!505 List!975)) )
))
(declare-fun lt!13665 () ListLongMap!979)

(declare-fun p!304 () Int)

(declare-fun forall!171 (List!975 Int) Bool)

(assert (=> b!37015 (= res!22405 (forall!171 (toList!505 lt!13665) p!304))))

(declare-fun lm!252 () ListLongMap!979)

(declare-fun tail!99 (ListLongMap!979) ListLongMap!979)

(assert (=> b!37015 (= lt!13665 (tail!99 lm!252))))

(declare-fun b!37016 () Bool)

(declare-fun size!1302 (List!975) Int)

(assert (=> b!37016 (= e!23405 (>= (size!1302 (toList!505 lt!13665)) (size!1302 (toList!505 lm!252))))))

(declare-fun b!37017 () Bool)

(declare-fun res!22408 () Bool)

(assert (=> b!37017 (=> (not res!22408) (not e!23405))))

(declare-fun k0!388 () (_ BitVec 64))

(declare-fun contains!456 (ListLongMap!979 (_ BitVec 64)) Bool)

(assert (=> b!37017 (= res!22408 (contains!456 lt!13665 k0!388))))

(declare-fun b!37018 () Bool)

(declare-fun e!23406 () Bool)

(declare-fun tp!5488 () Bool)

(assert (=> b!37018 (= e!23406 tp!5488)))

(declare-fun b!37019 () Bool)

(declare-fun res!22407 () Bool)

(assert (=> b!37019 (=> (not res!22407) (not e!23407))))

(assert (=> b!37019 (= res!22407 (contains!456 lm!252 k0!388))))

(declare-fun b!37020 () Bool)

(declare-fun res!22406 () Bool)

(assert (=> b!37020 (=> (not res!22406) (not e!23407))))

(declare-fun isEmpty!200 (ListLongMap!979) Bool)

(assert (=> b!37020 (= res!22406 (not (isEmpty!200 lm!252)))))

(declare-fun res!22410 () Bool)

(assert (=> start!4850 (=> (not res!22410) (not e!23407))))

(assert (=> start!4850 (= res!22410 (forall!171 (toList!505 lm!252) p!304))))

(assert (=> start!4850 e!23407))

(declare-fun inv!1631 (ListLongMap!979) Bool)

(assert (=> start!4850 (and (inv!1631 lm!252) e!23406)))

(assert (=> start!4850 tp!5489))

(assert (=> start!4850 true))

(declare-fun b!37021 () Bool)

(declare-fun res!22409 () Bool)

(assert (=> b!37021 (=> (not res!22409) (not e!23407))))

(declare-fun head!843 (List!975) tuple2!1402)

(assert (=> b!37021 (= res!22409 (not (= (_1!712 (head!843 (toList!505 lm!252))) k0!388)))))

(assert (= (and start!4850 res!22410) b!37019))

(assert (= (and b!37019 res!22407) b!37020))

(assert (= (and b!37020 res!22406) b!37021))

(assert (= (and b!37021 res!22409) b!37015))

(assert (= (and b!37015 res!22405) b!37017))

(assert (= (and b!37017 res!22408) b!37016))

(assert (= start!4850 b!37018))

(declare-fun m!29843 () Bool)

(assert (=> b!37021 m!29843))

(declare-fun m!29845 () Bool)

(assert (=> start!4850 m!29845))

(declare-fun m!29847 () Bool)

(assert (=> start!4850 m!29847))

(declare-fun m!29849 () Bool)

(assert (=> b!37017 m!29849))

(declare-fun m!29851 () Bool)

(assert (=> b!37015 m!29851))

(declare-fun m!29853 () Bool)

(assert (=> b!37015 m!29853))

(declare-fun m!29855 () Bool)

(assert (=> b!37016 m!29855))

(declare-fun m!29857 () Bool)

(assert (=> b!37016 m!29857))

(declare-fun m!29859 () Bool)

(assert (=> b!37020 m!29859))

(declare-fun m!29861 () Bool)

(assert (=> b!37019 m!29861))

(check-sat (not b!37018) (not b!37016) (not b_next!1335) (not b!37015) (not b!37019) (not start!4850) b_and!2217 (not b!37020) (not b!37017) (not b!37021))
(check-sat b_and!2217 (not b_next!1335))
(get-model)

(declare-fun d!5685 () Bool)

(assert (=> d!5685 (= (head!843 (toList!505 lm!252)) (h!1539 (toList!505 lm!252)))))

(assert (=> b!37021 d!5685))

(declare-fun d!5689 () Bool)

(declare-fun lt!13675 () Int)

(assert (=> d!5689 (>= lt!13675 0)))

(declare-fun e!23423 () Int)

(assert (=> d!5689 (= lt!13675 e!23423)))

(declare-fun c!4245 () Bool)

(get-info :version)

(assert (=> d!5689 (= c!4245 ((_ is Nil!972) (toList!505 lt!13665)))))

(assert (=> d!5689 (= (size!1302 (toList!505 lt!13665)) lt!13675)))

(declare-fun b!37055 () Bool)

(assert (=> b!37055 (= e!23423 0)))

(declare-fun b!37056 () Bool)

(assert (=> b!37056 (= e!23423 (+ 1 (size!1302 (t!3736 (toList!505 lt!13665)))))))

(assert (= (and d!5689 c!4245) b!37055))

(assert (= (and d!5689 (not c!4245)) b!37056))

(declare-fun m!29887 () Bool)

(assert (=> b!37056 m!29887))

(assert (=> b!37016 d!5689))

(declare-fun d!5695 () Bool)

(declare-fun lt!13676 () Int)

(assert (=> d!5695 (>= lt!13676 0)))

(declare-fun e!23424 () Int)

(assert (=> d!5695 (= lt!13676 e!23424)))

(declare-fun c!4246 () Bool)

(assert (=> d!5695 (= c!4246 ((_ is Nil!972) (toList!505 lm!252)))))

(assert (=> d!5695 (= (size!1302 (toList!505 lm!252)) lt!13676)))

(declare-fun b!37057 () Bool)

(assert (=> b!37057 (= e!23424 0)))

(declare-fun b!37058 () Bool)

(assert (=> b!37058 (= e!23424 (+ 1 (size!1302 (t!3736 (toList!505 lm!252)))))))

(assert (= (and d!5695 c!4246) b!37057))

(assert (= (and d!5695 (not c!4246)) b!37058))

(declare-fun m!29889 () Bool)

(assert (=> b!37058 m!29889))

(assert (=> b!37016 d!5695))

(declare-fun d!5697 () Bool)

(declare-fun e!23449 () Bool)

(assert (=> d!5697 e!23449))

(declare-fun res!22445 () Bool)

(assert (=> d!5697 (=> res!22445 e!23449)))

(declare-fun lt!13712 () Bool)

(assert (=> d!5697 (= res!22445 (not lt!13712))))

(declare-fun lt!13710 () Bool)

(assert (=> d!5697 (= lt!13712 lt!13710)))

(declare-datatypes ((Unit!841 0))(
  ( (Unit!842) )
))
(declare-fun lt!13711 () Unit!841)

(declare-fun e!23450 () Unit!841)

(assert (=> d!5697 (= lt!13711 e!23450)))

(declare-fun c!4255 () Bool)

(assert (=> d!5697 (= c!4255 lt!13710)))

(declare-fun containsKey!50 (List!975 (_ BitVec 64)) Bool)

(assert (=> d!5697 (= lt!13710 (containsKey!50 (toList!505 lt!13665) k0!388))))

(assert (=> d!5697 (= (contains!456 lt!13665 k0!388) lt!13712)))

(declare-fun b!37091 () Bool)

(declare-fun lt!13709 () Unit!841)

(assert (=> b!37091 (= e!23450 lt!13709)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!47 (List!975 (_ BitVec 64)) Unit!841)

(assert (=> b!37091 (= lt!13709 (lemmaContainsKeyImpliesGetValueByKeyDefined!47 (toList!505 lt!13665) k0!388))))

(declare-datatypes ((Option!92 0))(
  ( (Some!91 (v!1960 B!742)) (None!90) )
))
(declare-fun isDefined!48 (Option!92) Bool)

(declare-fun getValueByKey!85 (List!975 (_ BitVec 64)) Option!92)

(assert (=> b!37091 (isDefined!48 (getValueByKey!85 (toList!505 lt!13665) k0!388))))

(declare-fun b!37092 () Bool)

(declare-fun Unit!843 () Unit!841)

(assert (=> b!37092 (= e!23450 Unit!843)))

(declare-fun b!37093 () Bool)

(assert (=> b!37093 (= e!23449 (isDefined!48 (getValueByKey!85 (toList!505 lt!13665) k0!388)))))

(assert (= (and d!5697 c!4255) b!37091))

(assert (= (and d!5697 (not c!4255)) b!37092))

(assert (= (and d!5697 (not res!22445)) b!37093))

(declare-fun m!29909 () Bool)

(assert (=> d!5697 m!29909))

(declare-fun m!29911 () Bool)

(assert (=> b!37091 m!29911))

(declare-fun m!29913 () Bool)

(assert (=> b!37091 m!29913))

(assert (=> b!37091 m!29913))

(declare-fun m!29915 () Bool)

(assert (=> b!37091 m!29915))

(assert (=> b!37093 m!29913))

(assert (=> b!37093 m!29913))

(assert (=> b!37093 m!29915))

(assert (=> b!37017 d!5697))

(declare-fun d!5705 () Bool)

(declare-fun res!22456 () Bool)

(declare-fun e!23461 () Bool)

(assert (=> d!5705 (=> res!22456 e!23461)))

(assert (=> d!5705 (= res!22456 ((_ is Nil!972) (toList!505 lm!252)))))

(assert (=> d!5705 (= (forall!171 (toList!505 lm!252) p!304) e!23461)))

(declare-fun b!37104 () Bool)

(declare-fun e!23462 () Bool)

(assert (=> b!37104 (= e!23461 e!23462)))

(declare-fun res!22457 () Bool)

(assert (=> b!37104 (=> (not res!22457) (not e!23462))))

(declare-fun dynLambda!173 (Int tuple2!1402) Bool)

(assert (=> b!37104 (= res!22457 (dynLambda!173 p!304 (h!1539 (toList!505 lm!252))))))

(declare-fun b!37105 () Bool)

(assert (=> b!37105 (= e!23462 (forall!171 (t!3736 (toList!505 lm!252)) p!304))))

(assert (= (and d!5705 (not res!22456)) b!37104))

(assert (= (and b!37104 res!22457) b!37105))

(declare-fun b_lambda!1839 () Bool)

(assert (=> (not b_lambda!1839) (not b!37104)))

(declare-fun t!3745 () Bool)

(declare-fun tb!755 () Bool)

(assert (=> (and start!4850 (= p!304 p!304) t!3745) tb!755))

(declare-fun result!1285 () Bool)

(assert (=> tb!755 (= result!1285 true)))

(assert (=> b!37104 t!3745))

(declare-fun b_and!2227 () Bool)

(assert (= b_and!2217 (and (=> t!3745 result!1285) b_and!2227)))

(declare-fun m!29933 () Bool)

(assert (=> b!37104 m!29933))

(declare-fun m!29935 () Bool)

(assert (=> b!37105 m!29935))

(assert (=> start!4850 d!5705))

(declare-fun d!5719 () Bool)

(declare-fun isStrictlySorted!183 (List!975) Bool)

(assert (=> d!5719 (= (inv!1631 lm!252) (isStrictlySorted!183 (toList!505 lm!252)))))

(declare-fun bs!1430 () Bool)

(assert (= bs!1430 d!5719))

(declare-fun m!29937 () Bool)

(assert (=> bs!1430 m!29937))

(assert (=> start!4850 d!5719))

(declare-fun d!5721 () Bool)

(declare-fun e!23465 () Bool)

(assert (=> d!5721 e!23465))

(declare-fun res!22458 () Bool)

(assert (=> d!5721 (=> res!22458 e!23465)))

(declare-fun lt!13718 () Bool)

(assert (=> d!5721 (= res!22458 (not lt!13718))))

(declare-fun lt!13716 () Bool)

(assert (=> d!5721 (= lt!13718 lt!13716)))

(declare-fun lt!13717 () Unit!841)

(declare-fun e!23466 () Unit!841)

(assert (=> d!5721 (= lt!13717 e!23466)))

(declare-fun c!4258 () Bool)

(assert (=> d!5721 (= c!4258 lt!13716)))

(assert (=> d!5721 (= lt!13716 (containsKey!50 (toList!505 lm!252) k0!388))))

(assert (=> d!5721 (= (contains!456 lm!252 k0!388) lt!13718)))

(declare-fun b!37110 () Bool)

(declare-fun lt!13715 () Unit!841)

(assert (=> b!37110 (= e!23466 lt!13715)))

(assert (=> b!37110 (= lt!13715 (lemmaContainsKeyImpliesGetValueByKeyDefined!47 (toList!505 lm!252) k0!388))))

(assert (=> b!37110 (isDefined!48 (getValueByKey!85 (toList!505 lm!252) k0!388))))

(declare-fun b!37111 () Bool)

(declare-fun Unit!846 () Unit!841)

(assert (=> b!37111 (= e!23466 Unit!846)))

(declare-fun b!37112 () Bool)

(assert (=> b!37112 (= e!23465 (isDefined!48 (getValueByKey!85 (toList!505 lm!252) k0!388)))))

(assert (= (and d!5721 c!4258) b!37110))

(assert (= (and d!5721 (not c!4258)) b!37111))

(assert (= (and d!5721 (not res!22458)) b!37112))

(declare-fun m!29941 () Bool)

(assert (=> d!5721 m!29941))

(declare-fun m!29943 () Bool)

(assert (=> b!37110 m!29943))

(declare-fun m!29945 () Bool)

(assert (=> b!37110 m!29945))

(assert (=> b!37110 m!29945))

(declare-fun m!29947 () Bool)

(assert (=> b!37110 m!29947))

(assert (=> b!37112 m!29945))

(assert (=> b!37112 m!29945))

(assert (=> b!37112 m!29947))

(assert (=> b!37019 d!5721))

(declare-fun d!5725 () Bool)

(declare-fun isEmpty!203 (List!975) Bool)

(assert (=> d!5725 (= (isEmpty!200 lm!252) (isEmpty!203 (toList!505 lm!252)))))

(declare-fun bs!1432 () Bool)

(assert (= bs!1432 d!5725))

(declare-fun m!29961 () Bool)

(assert (=> bs!1432 m!29961))

(assert (=> b!37020 d!5725))

(declare-fun d!5735 () Bool)

(declare-fun res!22461 () Bool)

(declare-fun e!23473 () Bool)

(assert (=> d!5735 (=> res!22461 e!23473)))

(assert (=> d!5735 (= res!22461 ((_ is Nil!972) (toList!505 lt!13665)))))

(assert (=> d!5735 (= (forall!171 (toList!505 lt!13665) p!304) e!23473)))

(declare-fun b!37123 () Bool)

(declare-fun e!23474 () Bool)

(assert (=> b!37123 (= e!23473 e!23474)))

(declare-fun res!22462 () Bool)

(assert (=> b!37123 (=> (not res!22462) (not e!23474))))

(assert (=> b!37123 (= res!22462 (dynLambda!173 p!304 (h!1539 (toList!505 lt!13665))))))

(declare-fun b!37124 () Bool)

(assert (=> b!37124 (= e!23474 (forall!171 (t!3736 (toList!505 lt!13665)) p!304))))

(assert (= (and d!5735 (not res!22461)) b!37123))

(assert (= (and b!37123 res!22462) b!37124))

(declare-fun b_lambda!1841 () Bool)

(assert (=> (not b_lambda!1841) (not b!37123)))

(declare-fun t!3747 () Bool)

(declare-fun tb!757 () Bool)

(assert (=> (and start!4850 (= p!304 p!304) t!3747) tb!757))

(declare-fun result!1287 () Bool)

(assert (=> tb!757 (= result!1287 true)))

(assert (=> b!37123 t!3747))

(declare-fun b_and!2229 () Bool)

(assert (= b_and!2227 (and (=> t!3747 result!1287) b_and!2229)))

(declare-fun m!29971 () Bool)

(assert (=> b!37123 m!29971))

(declare-fun m!29973 () Bool)

(assert (=> b!37124 m!29973))

(assert (=> b!37015 d!5735))

(declare-fun d!5739 () Bool)

(declare-fun tail!103 (List!975) List!975)

(assert (=> d!5739 (= (tail!99 lm!252) (ListLongMap!980 (tail!103 (toList!505 lm!252))))))

(declare-fun bs!1434 () Bool)

(assert (= bs!1434 d!5739))

(declare-fun m!29981 () Bool)

(assert (=> bs!1434 m!29981))

(assert (=> b!37015 d!5739))

(declare-fun b!37140 () Bool)

(declare-fun e!23484 () Bool)

(declare-fun tp_is_empty!1665 () Bool)

(declare-fun tp!5503 () Bool)

(assert (=> b!37140 (= e!23484 (and tp_is_empty!1665 tp!5503))))

(assert (=> b!37018 (= tp!5488 e!23484)))

(assert (= (and b!37018 ((_ is Cons!971) (toList!505 lm!252))) b!37140))

(declare-fun b_lambda!1853 () Bool)

(assert (= b_lambda!1839 (or (and start!4850 b_free!1335) b_lambda!1853)))

(declare-fun b_lambda!1855 () Bool)

(assert (= b_lambda!1841 (or (and start!4850 b_free!1335) b_lambda!1855)))

(check-sat (not b!37056) (not b!37105) (not d!5719) (not b!37124) (not b_next!1335) (not b!37140) (not b!37058) b_and!2229 (not b!37093) (not b!37091) tp_is_empty!1665 (not b!37110) (not d!5739) (not b!37112) (not d!5697) (not d!5721) (not b_lambda!1853) (not d!5725) (not b_lambda!1855))
(check-sat b_and!2229 (not b_next!1335))
(get-model)

(declare-fun d!5743 () Bool)

(assert (=> d!5743 (= (tail!103 (toList!505 lm!252)) (t!3736 (toList!505 lm!252)))))

(assert (=> d!5739 d!5743))

(declare-fun d!5745 () Bool)

(declare-fun isEmpty!205 (Option!92) Bool)

(assert (=> d!5745 (= (isDefined!48 (getValueByKey!85 (toList!505 lm!252) k0!388)) (not (isEmpty!205 (getValueByKey!85 (toList!505 lm!252) k0!388))))))

(declare-fun bs!1436 () Bool)

(assert (= bs!1436 d!5745))

(assert (=> bs!1436 m!29945))

(declare-fun m!29985 () Bool)

(assert (=> bs!1436 m!29985))

(assert (=> b!37112 d!5745))

(declare-fun d!5747 () Bool)

(declare-fun c!4269 () Bool)

(assert (=> d!5747 (= c!4269 (and ((_ is Cons!971) (toList!505 lm!252)) (= (_1!712 (h!1539 (toList!505 lm!252))) k0!388)))))

(declare-fun e!23496 () Option!92)

(assert (=> d!5747 (= (getValueByKey!85 (toList!505 lm!252) k0!388) e!23496)))

(declare-fun b!37161 () Bool)

(declare-fun e!23497 () Option!92)

(assert (=> b!37161 (= e!23497 None!90)))

(declare-fun b!37160 () Bool)

(assert (=> b!37160 (= e!23497 (getValueByKey!85 (t!3736 (toList!505 lm!252)) k0!388))))

(declare-fun b!37159 () Bool)

(assert (=> b!37159 (= e!23496 e!23497)))

(declare-fun c!4270 () Bool)

(assert (=> b!37159 (= c!4270 (and ((_ is Cons!971) (toList!505 lm!252)) (not (= (_1!712 (h!1539 (toList!505 lm!252))) k0!388))))))

(declare-fun b!37158 () Bool)

(assert (=> b!37158 (= e!23496 (Some!91 (_2!712 (h!1539 (toList!505 lm!252)))))))

(assert (= (and d!5747 c!4269) b!37158))

(assert (= (and d!5747 (not c!4269)) b!37159))

(assert (= (and b!37159 c!4270) b!37160))

(assert (= (and b!37159 (not c!4270)) b!37161))

(declare-fun m!29993 () Bool)

(assert (=> b!37160 m!29993))

(assert (=> b!37112 d!5747))

(declare-fun d!5757 () Bool)

(declare-fun res!22471 () Bool)

(declare-fun e!23500 () Bool)

(assert (=> d!5757 (=> res!22471 e!23500)))

(assert (=> d!5757 (= res!22471 ((_ is Nil!972) (t!3736 (toList!505 lm!252))))))

(assert (=> d!5757 (= (forall!171 (t!3736 (toList!505 lm!252)) p!304) e!23500)))

(declare-fun b!37164 () Bool)

(declare-fun e!23501 () Bool)

(assert (=> b!37164 (= e!23500 e!23501)))

(declare-fun res!22472 () Bool)

(assert (=> b!37164 (=> (not res!22472) (not e!23501))))

(assert (=> b!37164 (= res!22472 (dynLambda!173 p!304 (h!1539 (t!3736 (toList!505 lm!252)))))))

(declare-fun b!37165 () Bool)

(assert (=> b!37165 (= e!23501 (forall!171 (t!3736 (t!3736 (toList!505 lm!252))) p!304))))

(assert (= (and d!5757 (not res!22471)) b!37164))

(assert (= (and b!37164 res!22472) b!37165))

(declare-fun b_lambda!1857 () Bool)

(assert (=> (not b_lambda!1857) (not b!37164)))

(declare-fun t!3751 () Bool)

(declare-fun tb!761 () Bool)

(assert (=> (and start!4850 (= p!304 p!304) t!3751) tb!761))

(declare-fun result!1297 () Bool)

(assert (=> tb!761 (= result!1297 true)))

(assert (=> b!37164 t!3751))

(declare-fun b_and!2233 () Bool)

(assert (= b_and!2229 (and (=> t!3751 result!1297) b_and!2233)))

(declare-fun m!29995 () Bool)

(assert (=> b!37164 m!29995))

(declare-fun m!29997 () Bool)

(assert (=> b!37165 m!29997))

(assert (=> b!37105 d!5757))

(declare-fun d!5761 () Bool)

(declare-fun lt!13731 () Int)

(assert (=> d!5761 (>= lt!13731 0)))

(declare-fun e!23504 () Int)

(assert (=> d!5761 (= lt!13731 e!23504)))

(declare-fun c!4271 () Bool)

(assert (=> d!5761 (= c!4271 ((_ is Nil!972) (t!3736 (toList!505 lm!252))))))

(assert (=> d!5761 (= (size!1302 (t!3736 (toList!505 lm!252))) lt!13731)))

(declare-fun b!37168 () Bool)

(assert (=> b!37168 (= e!23504 0)))

(declare-fun b!37169 () Bool)

(assert (=> b!37169 (= e!23504 (+ 1 (size!1302 (t!3736 (t!3736 (toList!505 lm!252))))))))

(assert (= (and d!5761 c!4271) b!37168))

(assert (= (and d!5761 (not c!4271)) b!37169))

(declare-fun m!30003 () Bool)

(assert (=> b!37169 m!30003))

(assert (=> b!37058 d!5761))

(declare-fun d!5765 () Bool)

(declare-fun res!22475 () Bool)

(declare-fun e!23505 () Bool)

(assert (=> d!5765 (=> res!22475 e!23505)))

(assert (=> d!5765 (= res!22475 ((_ is Nil!972) (t!3736 (toList!505 lt!13665))))))

(assert (=> d!5765 (= (forall!171 (t!3736 (toList!505 lt!13665)) p!304) e!23505)))

(declare-fun b!37170 () Bool)

(declare-fun e!23506 () Bool)

(assert (=> b!37170 (= e!23505 e!23506)))

(declare-fun res!22476 () Bool)

(assert (=> b!37170 (=> (not res!22476) (not e!23506))))

(assert (=> b!37170 (= res!22476 (dynLambda!173 p!304 (h!1539 (t!3736 (toList!505 lt!13665)))))))

(declare-fun b!37171 () Bool)

(assert (=> b!37171 (= e!23506 (forall!171 (t!3736 (t!3736 (toList!505 lt!13665))) p!304))))

(assert (= (and d!5765 (not res!22475)) b!37170))

(assert (= (and b!37170 res!22476) b!37171))

(declare-fun b_lambda!1861 () Bool)

(assert (=> (not b_lambda!1861) (not b!37170)))

(declare-fun t!3755 () Bool)

(declare-fun tb!765 () Bool)

(assert (=> (and start!4850 (= p!304 p!304) t!3755) tb!765))

(declare-fun result!1301 () Bool)

(assert (=> tb!765 (= result!1301 true)))

(assert (=> b!37170 t!3755))

(declare-fun b_and!2237 () Bool)

(assert (= b_and!2233 (and (=> t!3755 result!1301) b_and!2237)))

(declare-fun m!30007 () Bool)

(assert (=> b!37170 m!30007))

(declare-fun m!30009 () Bool)

(assert (=> b!37171 m!30009))

(assert (=> b!37124 d!5765))

(declare-fun d!5769 () Bool)

(assert (=> d!5769 (= (isEmpty!203 (toList!505 lm!252)) ((_ is Nil!972) (toList!505 lm!252)))))

(assert (=> d!5725 d!5769))

(declare-fun d!5771 () Bool)

(declare-fun res!22481 () Bool)

(declare-fun e!23517 () Bool)

(assert (=> d!5771 (=> res!22481 e!23517)))

(assert (=> d!5771 (= res!22481 (or ((_ is Nil!972) (toList!505 lm!252)) ((_ is Nil!972) (t!3736 (toList!505 lm!252)))))))

(assert (=> d!5771 (= (isStrictlySorted!183 (toList!505 lm!252)) e!23517)))

(declare-fun b!37188 () Bool)

(declare-fun e!23518 () Bool)

(assert (=> b!37188 (= e!23517 e!23518)))

(declare-fun res!22482 () Bool)

(assert (=> b!37188 (=> (not res!22482) (not e!23518))))

(assert (=> b!37188 (= res!22482 (bvslt (_1!712 (h!1539 (toList!505 lm!252))) (_1!712 (h!1539 (t!3736 (toList!505 lm!252))))))))

(declare-fun b!37189 () Bool)

(assert (=> b!37189 (= e!23518 (isStrictlySorted!183 (t!3736 (toList!505 lm!252))))))

(assert (= (and d!5771 (not res!22481)) b!37188))

(assert (= (and b!37188 res!22482) b!37189))

(declare-fun m!30013 () Bool)

(assert (=> b!37189 m!30013))

(assert (=> d!5719 d!5771))

(declare-fun d!5779 () Bool)

(declare-fun lt!13732 () Int)

(assert (=> d!5779 (>= lt!13732 0)))

(declare-fun e!23521 () Int)

(assert (=> d!5779 (= lt!13732 e!23521)))

(declare-fun c!4278 () Bool)

(assert (=> d!5779 (= c!4278 ((_ is Nil!972) (t!3736 (toList!505 lt!13665))))))

(assert (=> d!5779 (= (size!1302 (t!3736 (toList!505 lt!13665))) lt!13732)))

(declare-fun b!37192 () Bool)

(assert (=> b!37192 (= e!23521 0)))

(declare-fun b!37193 () Bool)

(assert (=> b!37193 (= e!23521 (+ 1 (size!1302 (t!3736 (t!3736 (toList!505 lt!13665))))))))

(assert (= (and d!5779 c!4278) b!37192))

(assert (= (and d!5779 (not c!4278)) b!37193))

(declare-fun m!30015 () Bool)

(assert (=> b!37193 m!30015))

(assert (=> b!37056 d!5779))

(declare-fun d!5781 () Bool)

(assert (=> d!5781 (isDefined!48 (getValueByKey!85 (toList!505 lt!13665) k0!388))))

(declare-fun lt!13741 () Unit!841)

(declare-fun choose!231 (List!975 (_ BitVec 64)) Unit!841)

(assert (=> d!5781 (= lt!13741 (choose!231 (toList!505 lt!13665) k0!388))))

(declare-fun e!23536 () Bool)

(assert (=> d!5781 e!23536))

(declare-fun res!22497 () Bool)

(assert (=> d!5781 (=> (not res!22497) (not e!23536))))

(assert (=> d!5781 (= res!22497 (isStrictlySorted!183 (toList!505 lt!13665)))))

(assert (=> d!5781 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!47 (toList!505 lt!13665) k0!388) lt!13741)))

(declare-fun b!37210 () Bool)

(assert (=> b!37210 (= e!23536 (containsKey!50 (toList!505 lt!13665) k0!388))))

(assert (= (and d!5781 res!22497) b!37210))

(assert (=> d!5781 m!29913))

(assert (=> d!5781 m!29913))

(assert (=> d!5781 m!29915))

(declare-fun m!30031 () Bool)

(assert (=> d!5781 m!30031))

(declare-fun m!30033 () Bool)

(assert (=> d!5781 m!30033))

(assert (=> b!37210 m!29909))

(assert (=> b!37091 d!5781))

(declare-fun d!5795 () Bool)

(assert (=> d!5795 (= (isDefined!48 (getValueByKey!85 (toList!505 lt!13665) k0!388)) (not (isEmpty!205 (getValueByKey!85 (toList!505 lt!13665) k0!388))))))

(declare-fun bs!1440 () Bool)

(assert (= bs!1440 d!5795))

(assert (=> bs!1440 m!29913))

(declare-fun m!30037 () Bool)

(assert (=> bs!1440 m!30037))

(assert (=> b!37091 d!5795))

(declare-fun d!5799 () Bool)

(declare-fun c!4285 () Bool)

(assert (=> d!5799 (= c!4285 (and ((_ is Cons!971) (toList!505 lt!13665)) (= (_1!712 (h!1539 (toList!505 lt!13665))) k0!388)))))

(declare-fun e!23544 () Option!92)

(assert (=> d!5799 (= (getValueByKey!85 (toList!505 lt!13665) k0!388) e!23544)))

(declare-fun b!37225 () Bool)

(declare-fun e!23545 () Option!92)

(assert (=> b!37225 (= e!23545 None!90)))

(declare-fun b!37224 () Bool)

(assert (=> b!37224 (= e!23545 (getValueByKey!85 (t!3736 (toList!505 lt!13665)) k0!388))))

(declare-fun b!37223 () Bool)

(assert (=> b!37223 (= e!23544 e!23545)))

(declare-fun c!4286 () Bool)

(assert (=> b!37223 (= c!4286 (and ((_ is Cons!971) (toList!505 lt!13665)) (not (= (_1!712 (h!1539 (toList!505 lt!13665))) k0!388))))))

(declare-fun b!37222 () Bool)

(assert (=> b!37222 (= e!23544 (Some!91 (_2!712 (h!1539 (toList!505 lt!13665)))))))

(assert (= (and d!5799 c!4285) b!37222))

(assert (= (and d!5799 (not c!4285)) b!37223))

(assert (= (and b!37223 c!4286) b!37224))

(assert (= (and b!37223 (not c!4286)) b!37225))

(declare-fun m!30041 () Bool)

(assert (=> b!37224 m!30041))

(assert (=> b!37091 d!5799))

(declare-fun d!5803 () Bool)

(declare-fun res!22513 () Bool)

(declare-fun e!23561 () Bool)

(assert (=> d!5803 (=> res!22513 e!23561)))

(assert (=> d!5803 (= res!22513 (and ((_ is Cons!971) (toList!505 lm!252)) (= (_1!712 (h!1539 (toList!505 lm!252))) k0!388)))))

(assert (=> d!5803 (= (containsKey!50 (toList!505 lm!252) k0!388) e!23561)))

(declare-fun b!37243 () Bool)

(declare-fun e!23562 () Bool)

(assert (=> b!37243 (= e!23561 e!23562)))

(declare-fun res!22514 () Bool)

(assert (=> b!37243 (=> (not res!22514) (not e!23562))))

(assert (=> b!37243 (= res!22514 (and (or (not ((_ is Cons!971) (toList!505 lm!252))) (bvsle (_1!712 (h!1539 (toList!505 lm!252))) k0!388)) ((_ is Cons!971) (toList!505 lm!252)) (bvslt (_1!712 (h!1539 (toList!505 lm!252))) k0!388)))))

(declare-fun b!37244 () Bool)

(assert (=> b!37244 (= e!23562 (containsKey!50 (t!3736 (toList!505 lm!252)) k0!388))))

(assert (= (and d!5803 (not res!22513)) b!37243))

(assert (= (and b!37243 res!22514) b!37244))

(declare-fun m!30053 () Bool)

(assert (=> b!37244 m!30053))

(assert (=> d!5721 d!5803))

(declare-fun d!5811 () Bool)

(declare-fun res!22517 () Bool)

(declare-fun e!23565 () Bool)

(assert (=> d!5811 (=> res!22517 e!23565)))

(assert (=> d!5811 (= res!22517 (and ((_ is Cons!971) (toList!505 lt!13665)) (= (_1!712 (h!1539 (toList!505 lt!13665))) k0!388)))))

(assert (=> d!5811 (= (containsKey!50 (toList!505 lt!13665) k0!388) e!23565)))

(declare-fun b!37247 () Bool)

(declare-fun e!23566 () Bool)

(assert (=> b!37247 (= e!23565 e!23566)))

(declare-fun res!22518 () Bool)

(assert (=> b!37247 (=> (not res!22518) (not e!23566))))

(assert (=> b!37247 (= res!22518 (and (or (not ((_ is Cons!971) (toList!505 lt!13665))) (bvsle (_1!712 (h!1539 (toList!505 lt!13665))) k0!388)) ((_ is Cons!971) (toList!505 lt!13665)) (bvslt (_1!712 (h!1539 (toList!505 lt!13665))) k0!388)))))

(declare-fun b!37248 () Bool)

(assert (=> b!37248 (= e!23566 (containsKey!50 (t!3736 (toList!505 lt!13665)) k0!388))))

(assert (= (and d!5811 (not res!22517)) b!37247))

(assert (= (and b!37247 res!22518) b!37248))

(declare-fun m!30057 () Bool)

(assert (=> b!37248 m!30057))

(assert (=> d!5697 d!5811))

(assert (=> b!37093 d!5795))

(assert (=> b!37093 d!5799))

(declare-fun d!5815 () Bool)

(assert (=> d!5815 (isDefined!48 (getValueByKey!85 (toList!505 lm!252) k0!388))))

(declare-fun lt!13743 () Unit!841)

(assert (=> d!5815 (= lt!13743 (choose!231 (toList!505 lm!252) k0!388))))

(declare-fun e!23567 () Bool)

(assert (=> d!5815 e!23567))

(declare-fun res!22519 () Bool)

(assert (=> d!5815 (=> (not res!22519) (not e!23567))))

(assert (=> d!5815 (= res!22519 (isStrictlySorted!183 (toList!505 lm!252)))))

(assert (=> d!5815 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!47 (toList!505 lm!252) k0!388) lt!13743)))

(declare-fun b!37249 () Bool)

(assert (=> b!37249 (= e!23567 (containsKey!50 (toList!505 lm!252) k0!388))))

(assert (= (and d!5815 res!22519) b!37249))

(assert (=> d!5815 m!29945))

(assert (=> d!5815 m!29945))

(assert (=> d!5815 m!29947))

(declare-fun m!30059 () Bool)

(assert (=> d!5815 m!30059))

(assert (=> d!5815 m!29937))

(assert (=> b!37249 m!29941))

(assert (=> b!37110 d!5815))

(assert (=> b!37110 d!5745))

(assert (=> b!37110 d!5747))

(declare-fun b!37252 () Bool)

(declare-fun e!23569 () Bool)

(declare-fun tp!5506 () Bool)

(assert (=> b!37252 (= e!23569 (and tp_is_empty!1665 tp!5506))))

(assert (=> b!37140 (= tp!5503 e!23569)))

(assert (= (and b!37140 ((_ is Cons!971) (t!3736 (toList!505 lm!252)))) b!37252))

(declare-fun b_lambda!1871 () Bool)

(assert (= b_lambda!1861 (or (and start!4850 b_free!1335) b_lambda!1871)))

(declare-fun b_lambda!1873 () Bool)

(assert (= b_lambda!1857 (or (and start!4850 b_free!1335) b_lambda!1873)))

(check-sat (not b!37193) (not d!5795) (not b_next!1335) b_and!2237 (not b!37224) (not b!37210) (not b!37244) (not d!5781) (not b!37171) (not b!37165) (not b!37189) (not b!37169) (not b!37160) (not b!37252) (not b_lambda!1873) (not b_lambda!1853) (not b!37248) (not b!37249) (not d!5745) (not b_lambda!1855) (not b_lambda!1871) tp_is_empty!1665 (not d!5815))
(check-sat b_and!2237 (not b_next!1335))
