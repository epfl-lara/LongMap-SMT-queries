; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4848 () Bool)

(assert start!4848)

(declare-fun b_free!1333 () Bool)

(declare-fun b_next!1333 () Bool)

(assert (=> start!4848 (= b_free!1333 (not b_next!1333))))

(declare-fun tp!5482 () Bool)

(declare-fun b_and!2215 () Bool)

(assert (=> start!4848 (= tp!5482 b_and!2215)))

(declare-fun b!36994 () Bool)

(declare-fun e!23398 () Bool)

(declare-fun e!23396 () Bool)

(assert (=> b!36994 (= e!23398 e!23396)))

(declare-fun res!22389 () Bool)

(assert (=> b!36994 (=> (not res!22389) (not e!23396))))

(declare-datatypes ((B!740 0))(
  ( (B!741 (val!870 Int)) )
))
(declare-datatypes ((tuple2!1400 0))(
  ( (tuple2!1401 (_1!711 (_ BitVec 64)) (_2!711 B!740)) )
))
(declare-datatypes ((List!974 0))(
  ( (Nil!971) (Cons!970 (h!1538 tuple2!1400) (t!3735 List!974)) )
))
(declare-datatypes ((ListLongMap!977 0))(
  ( (ListLongMap!978 (toList!504 List!974)) )
))
(declare-fun lt!13662 () ListLongMap!977)

(declare-fun p!304 () Int)

(declare-fun forall!170 (List!974 Int) Bool)

(assert (=> b!36994 (= res!22389 (forall!170 (toList!504 lt!13662) p!304))))

(declare-fun lm!252 () ListLongMap!977)

(declare-fun tail!98 (ListLongMap!977) ListLongMap!977)

(assert (=> b!36994 (= lt!13662 (tail!98 lm!252))))

(declare-fun b!36995 () Bool)

(declare-fun res!22387 () Bool)

(assert (=> b!36995 (=> (not res!22387) (not e!23396))))

(declare-fun k!388 () (_ BitVec 64))

(declare-fun contains!455 (ListLongMap!977 (_ BitVec 64)) Bool)

(assert (=> b!36995 (= res!22387 (contains!455 lt!13662 k!388))))

(declare-fun res!22391 () Bool)

(assert (=> start!4848 (=> (not res!22391) (not e!23398))))

(assert (=> start!4848 (= res!22391 (forall!170 (toList!504 lm!252) p!304))))

(assert (=> start!4848 e!23398))

(declare-fun e!23397 () Bool)

(declare-fun inv!1630 (ListLongMap!977) Bool)

(assert (=> start!4848 (and (inv!1630 lm!252) e!23397)))

(assert (=> start!4848 tp!5482))

(assert (=> start!4848 true))

(declare-fun b!36996 () Bool)

(declare-fun res!22388 () Bool)

(assert (=> b!36996 (=> (not res!22388) (not e!23398))))

(declare-fun isEmpty!199 (ListLongMap!977) Bool)

(assert (=> b!36996 (= res!22388 (not (isEmpty!199 lm!252)))))

(declare-fun b!36997 () Bool)

(declare-fun res!22392 () Bool)

(assert (=> b!36997 (=> (not res!22392) (not e!23398))))

(declare-fun head!842 (List!974) tuple2!1400)

(assert (=> b!36997 (= res!22392 (not (= (_1!711 (head!842 (toList!504 lm!252))) k!388)))))

(declare-fun b!36998 () Bool)

(declare-fun size!1301 (List!974) Int)

(assert (=> b!36998 (= e!23396 (>= (size!1301 (toList!504 lt!13662)) (size!1301 (toList!504 lm!252))))))

(declare-fun b!36999 () Bool)

(declare-fun res!22390 () Bool)

(assert (=> b!36999 (=> (not res!22390) (not e!23398))))

(assert (=> b!36999 (= res!22390 (contains!455 lm!252 k!388))))

(declare-fun b!37000 () Bool)

(declare-fun tp!5483 () Bool)

(assert (=> b!37000 (= e!23397 tp!5483)))

(assert (= (and start!4848 res!22391) b!36999))

(assert (= (and b!36999 res!22390) b!36996))

(assert (= (and b!36996 res!22388) b!36997))

(assert (= (and b!36997 res!22392) b!36994))

(assert (= (and b!36994 res!22389) b!36995))

(assert (= (and b!36995 res!22387) b!36998))

(assert (= start!4848 b!37000))

(declare-fun m!29823 () Bool)

(assert (=> b!36995 m!29823))

(declare-fun m!29825 () Bool)

(assert (=> b!36998 m!29825))

(declare-fun m!29827 () Bool)

(assert (=> b!36998 m!29827))

(declare-fun m!29829 () Bool)

(assert (=> b!36996 m!29829))

(declare-fun m!29831 () Bool)

(assert (=> start!4848 m!29831))

(declare-fun m!29833 () Bool)

(assert (=> start!4848 m!29833))

(declare-fun m!29835 () Bool)

(assert (=> b!36994 m!29835))

(declare-fun m!29837 () Bool)

(assert (=> b!36994 m!29837))

(declare-fun m!29839 () Bool)

(assert (=> b!36999 m!29839))

(declare-fun m!29841 () Bool)

(assert (=> b!36997 m!29841))

(push 1)

(assert (not b!36994))

(assert (not b!36996))

(assert (not b!36999))

(assert (not b!36997))

(assert (not b!36995))

(assert (not b_next!1333))

(assert b_and!2215)

(assert (not b!36998))

(assert (not start!4848))

(assert (not b!37000))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2215)

(assert (not b_next!1333))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5687 () Bool)

(declare-fun e!23434 () Bool)

(assert (=> d!5687 e!23434))

(declare-fun res!22433 () Bool)

(assert (=> d!5687 (=> res!22433 e!23434)))

(declare-fun lt!13695 () Bool)

(assert (=> d!5687 (= res!22433 (not lt!13695))))

(declare-fun lt!13696 () Bool)

(assert (=> d!5687 (= lt!13695 lt!13696)))

(declare-datatypes ((Unit!836 0))(
  ( (Unit!837) )
))
(declare-fun lt!13694 () Unit!836)

(declare-fun e!23433 () Unit!836)

(assert (=> d!5687 (= lt!13694 e!23433)))

(declare-fun c!4251 () Bool)

(assert (=> d!5687 (= c!4251 lt!13696)))

(declare-fun containsKey!48 (List!974 (_ BitVec 64)) Bool)

(assert (=> d!5687 (= lt!13696 (containsKey!48 (toList!504 lt!13662) k!388))))

(assert (=> d!5687 (= (contains!455 lt!13662 k!388) lt!13695)))

(declare-fun b!37071 () Bool)

(declare-fun lt!13693 () Unit!836)

(assert (=> b!37071 (= e!23433 lt!13693)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!45 (List!974 (_ BitVec 64)) Unit!836)

(assert (=> b!37071 (= lt!13693 (lemmaContainsKeyImpliesGetValueByKeyDefined!45 (toList!504 lt!13662) k!388))))

(declare-datatypes ((Option!90 0))(
  ( (Some!89 (v!1958 B!740)) (None!88) )
))
(declare-fun isDefined!46 (Option!90) Bool)

(declare-fun getValueByKey!84 (List!974 (_ BitVec 64)) Option!90)

(assert (=> b!37071 (isDefined!46 (getValueByKey!84 (toList!504 lt!13662) k!388))))

(declare-fun b!37072 () Bool)

(declare-fun Unit!838 () Unit!836)

(assert (=> b!37072 (= e!23433 Unit!838)))

(declare-fun b!37073 () Bool)

(assert (=> b!37073 (= e!23434 (isDefined!46 (getValueByKey!84 (toList!504 lt!13662) k!388)))))

(assert (= (and d!5687 c!4251) b!37071))

(assert (= (and d!5687 (not c!4251)) b!37072))

(assert (= (and d!5687 (not res!22433)) b!37073))

(declare-fun m!29891 () Bool)

(assert (=> d!5687 m!29891))

(declare-fun m!29893 () Bool)

(assert (=> b!37071 m!29893))

(declare-fun m!29895 () Bool)

(assert (=> b!37071 m!29895))

(assert (=> b!37071 m!29895))

(declare-fun m!29897 () Bool)

(assert (=> b!37071 m!29897))

(assert (=> b!37073 m!29895))

(assert (=> b!37073 m!29895))

(assert (=> b!37073 m!29897))

(assert (=> b!36995 d!5687))

(declare-fun d!5699 () Bool)

(declare-fun isEmpty!202 (List!974) Bool)

(assert (=> d!5699 (= (isEmpty!199 lm!252) (isEmpty!202 (toList!504 lm!252)))))

(declare-fun bs!1427 () Bool)

(assert (= bs!1427 d!5699))

(declare-fun m!29899 () Bool)

(assert (=> bs!1427 m!29899))

(assert (=> b!36996 d!5699))

(declare-fun d!5701 () Bool)

(declare-fun res!22446 () Bool)

(declare-fun e!23451 () Bool)

(assert (=> d!5701 (=> res!22446 e!23451)))

(assert (=> d!5701 (= res!22446 (is-Nil!971 (toList!504 lm!252)))))

(assert (=> d!5701 (= (forall!170 (toList!504 lm!252) p!304) e!23451)))

(declare-fun b!37094 () Bool)

(declare-fun e!23452 () Bool)

(assert (=> b!37094 (= e!23451 e!23452)))

(declare-fun res!22447 () Bool)

(assert (=> b!37094 (=> (not res!22447) (not e!23452))))

(declare-fun dynLambda!172 (Int tuple2!1400) Bool)

(assert (=> b!37094 (= res!22447 (dynLambda!172 p!304 (h!1538 (toList!504 lm!252))))))

(declare-fun b!37095 () Bool)

(assert (=> b!37095 (= e!23452 (forall!170 (t!3735 (toList!504 lm!252)) p!304))))

(assert (= (and d!5701 (not res!22446)) b!37094))

(assert (= (and b!37094 res!22447) b!37095))

(declare-fun b_lambda!1833 () Bool)

(assert (=> (not b_lambda!1833) (not b!37094)))

(declare-fun t!3739 () Bool)

(declare-fun tb!749 () Bool)

(assert (=> (and start!4848 (= p!304 p!304) t!3739) tb!749))

(declare-fun result!1279 () Bool)

(assert (=> tb!749 (= result!1279 true)))

(assert (=> b!37094 t!3739))

(declare-fun b_and!2221 () Bool)

(assert (= b_and!2215 (and (=> t!3739 result!1279) b_and!2221)))

(declare-fun m!29917 () Bool)

(assert (=> b!37094 m!29917))

(declare-fun m!29919 () Bool)

(assert (=> b!37095 m!29919))

(assert (=> start!4848 d!5701))

(declare-fun d!5707 () Bool)

(declare-fun isStrictlySorted!182 (List!974) Bool)

(assert (=> d!5707 (= (inv!1630 lm!252) (isStrictlySorted!182 (toList!504 lm!252)))))

(declare-fun bs!1428 () Bool)

(assert (= bs!1428 d!5707))

(declare-fun m!29925 () Bool)

(assert (=> bs!1428 m!29925))

(assert (=> start!4848 d!5707))

(declare-fun d!5711 () Bool)

(assert (=> d!5711 (= (head!842 (toList!504 lm!252)) (h!1538 (toList!504 lm!252)))))

(assert (=> b!36997 d!5711))

(declare-fun d!5715 () Bool)

(declare-fun lt!13719 () Int)

(assert (=> d!5715 (>= lt!13719 0)))

(declare-fun e!23467 () Int)

(assert (=> d!5715 (= lt!13719 e!23467)))

(declare-fun c!4259 () Bool)

(assert (=> d!5715 (= c!4259 (is-Nil!971 (toList!504 lt!13662)))))

(assert (=> d!5715 (= (size!1301 (toList!504 lt!13662)) lt!13719)))

(declare-fun b!37113 () Bool)

(assert (=> b!37113 (= e!23467 0)))

(declare-fun b!37114 () Bool)

(assert (=> b!37114 (= e!23467 (+ 1 (size!1301 (t!3735 (toList!504 lt!13662)))))))

(assert (= (and d!5715 c!4259) b!37113))

(assert (= (and d!5715 (not c!4259)) b!37114))

(declare-fun m!29949 () Bool)

(assert (=> b!37114 m!29949))

(assert (=> b!36998 d!5715))

(declare-fun d!5729 () Bool)

(declare-fun lt!13724 () Int)

(assert (=> d!5729 (>= lt!13724 0)))

(declare-fun e!23470 () Int)

(assert (=> d!5729 (= lt!13724 e!23470)))

(declare-fun c!4261 () Bool)

(assert (=> d!5729 (= c!4261 (is-Nil!971 (toList!504 lm!252)))))

(assert (=> d!5729 (= (size!1301 (toList!504 lm!252)) lt!13724)))

(declare-fun b!37118 () Bool)

(assert (=> b!37118 (= e!23470 0)))

(declare-fun b!37119 () Bool)

(assert (=> b!37119 (= e!23470 (+ 1 (size!1301 (t!3735 (toList!504 lm!252)))))))

(assert (= (and d!5729 c!4261) b!37118))

(assert (= (and d!5729 (not c!4261)) b!37119))

(declare-fun m!29955 () Bool)

(assert (=> b!37119 m!29955))

(assert (=> b!36998 d!5729))

(declare-fun d!5731 () Bool)

(declare-fun e!23472 () Bool)

(assert (=> d!5731 e!23472))

(declare-fun res!22460 () Bool)

(assert (=> d!5731 (=> res!22460 e!23472)))

(declare-fun lt!13727 () Bool)

(assert (=> d!5731 (= res!22460 (not lt!13727))))

(declare-fun lt!13728 () Bool)

(assert (=> d!5731 (= lt!13727 lt!13728)))

(declare-fun lt!13726 () Unit!836)

(declare-fun e!23471 () Unit!836)

(assert (=> d!5731 (= lt!13726 e!23471)))

(declare-fun c!4262 () Bool)

(assert (=> d!5731 (= c!4262 lt!13728)))

(assert (=> d!5731 (= lt!13728 (containsKey!48 (toList!504 lm!252) k!388))))

(assert (=> d!5731 (= (contains!455 lm!252 k!388) lt!13727)))

(declare-fun b!37120 () Bool)

(declare-fun lt!13725 () Unit!836)

(assert (=> b!37120 (= e!23471 lt!13725)))

(assert (=> b!37120 (= lt!13725 (lemmaContainsKeyImpliesGetValueByKeyDefined!45 (toList!504 lm!252) k!388))))

(assert (=> b!37120 (isDefined!46 (getValueByKey!84 (toList!504 lm!252) k!388))))

(declare-fun b!37121 () Bool)

(declare-fun Unit!845 () Unit!836)

(assert (=> b!37121 (= e!23471 Unit!845)))

(declare-fun b!37122 () Bool)

(assert (=> b!37122 (= e!23472 (isDefined!46 (getValueByKey!84 (toList!504 lm!252) k!388)))))

(assert (= (and d!5731 c!4262) b!37120))

(assert (= (and d!5731 (not c!4262)) b!37121))

(assert (= (and d!5731 (not res!22460)) b!37122))

(declare-fun m!29963 () Bool)

(assert (=> d!5731 m!29963))

(declare-fun m!29965 () Bool)

(assert (=> b!37120 m!29965))

(declare-fun m!29967 () Bool)

(assert (=> b!37120 m!29967))

(assert (=> b!37120 m!29967))

(declare-fun m!29969 () Bool)

(assert (=> b!37120 m!29969))

(assert (=> b!37122 m!29967))

(assert (=> b!37122 m!29967))

(assert (=> b!37122 m!29969))

(assert (=> b!36999 d!5731))

(declare-fun d!5737 () Bool)

(declare-fun res!22463 () Bool)

(declare-fun e!23475 () Bool)

(assert (=> d!5737 (=> res!22463 e!23475)))

(assert (=> d!5737 (= res!22463 (is-Nil!971 (toList!504 lt!13662)))))

(assert (=> d!5737 (= (forall!170 (toList!504 lt!13662) p!304) e!23475)))

(declare-fun b!37125 () Bool)

(declare-fun e!23476 () Bool)

(assert (=> b!37125 (= e!23475 e!23476)))

(declare-fun res!22464 () Bool)

(assert (=> b!37125 (=> (not res!22464) (not e!23476))))

(assert (=> b!37125 (= res!22464 (dynLambda!172 p!304 (h!1538 (toList!504 lt!13662))))))

(declare-fun b!37126 () Bool)

(assert (=> b!37126 (= e!23476 (forall!170 (t!3735 (toList!504 lt!13662)) p!304))))

(assert (= (and d!5737 (not res!22463)) b!37125))

(assert (= (and b!37125 res!22464) b!37126))

(declare-fun b_lambda!1843 () Bool)

(assert (=> (not b_lambda!1843) (not b!37125)))

(declare-fun t!3749 () Bool)

(declare-fun tb!759 () Bool)

(assert (=> (and start!4848 (= p!304 p!304) t!3749) tb!759))

(declare-fun result!1289 () Bool)

(assert (=> tb!759 (= result!1289 true)))

(assert (=> b!37125 t!3749))

(declare-fun b_and!2231 () Bool)

(assert (= b_and!2221 (and (=> t!3749 result!1289) b_and!2231)))

(declare-fun m!29977 () Bool)

(assert (=> b!37125 m!29977))

(declare-fun m!29979 () Bool)

(assert (=> b!37126 m!29979))

(assert (=> b!36994 d!5737))

(declare-fun d!5741 () Bool)

(declare-fun tail!102 (List!974) List!974)

(assert (=> d!5741 (= (tail!98 lm!252) (ListLongMap!978 (tail!102 (toList!504 lm!252))))))

(declare-fun bs!1435 () Bool)

(assert (= bs!1435 d!5741))

(declare-fun m!29983 () Bool)

(assert (=> bs!1435 m!29983))

(assert (=> b!36994 d!5741))

(declare-fun b!37141 () Bool)

(declare-fun e!23485 () Bool)

(declare-fun tp_is_empty!1667 () Bool)

(declare-fun tp!5504 () Bool)

(assert (=> b!37141 (= e!23485 (and tp_is_empty!1667 tp!5504))))

(assert (=> b!37000 (= tp!5483 e!23485)))

(assert (= (and b!37000 (is-Cons!970 (toList!504 lm!252))) b!37141))

(declare-fun b_lambda!1849 () Bool)

(assert (= b_lambda!1833 (or (and start!4848 b_free!1333) b_lambda!1849)))

(declare-fun b_lambda!1851 () Bool)

(assert (= b_lambda!1843 (or (and start!4848 b_free!1333) b_lambda!1851)))

(push 1)

(assert (not b_lambda!1851))

(assert (not b!37120))

(assert (not b!37095))

(assert (not d!5687))

(assert (not d!5731))

(assert (not d!5707))

(assert (not b_next!1333))

(assert (not b!37119))

(assert tp_is_empty!1667)

(assert (not b!37122))

(assert b_and!2231)

(assert (not d!5741))

(assert (not b!37073))

(assert (not b!37126))

(assert (not b!37071))

(assert (not b!37141))

(assert (not d!5699))

(assert (not b_lambda!1849))

(assert (not b!37114))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2231)

(assert (not b_next!1333))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5749 () Bool)

(declare-fun lt!13729 () Int)

(assert (=> d!5749 (>= lt!13729 0)))

(declare-fun e!23486 () Int)

(assert (=> d!5749 (= lt!13729 e!23486)))

(declare-fun c!4263 () Bool)

(assert (=> d!5749 (= c!4263 (is-Nil!971 (t!3735 (toList!504 lt!13662))))))

(assert (=> d!5749 (= (size!1301 (t!3735 (toList!504 lt!13662))) lt!13729)))

(declare-fun b!37142 () Bool)

(assert (=> b!37142 (= e!23486 0)))

(declare-fun b!37143 () Bool)

(assert (=> b!37143 (= e!23486 (+ 1 (size!1301 (t!3735 (t!3735 (toList!504 lt!13662))))))))

(assert (= (and d!5749 c!4263) b!37142))

(assert (= (and d!5749 (not c!4263)) b!37143))

(declare-fun m!29987 () Bool)

(assert (=> b!37143 m!29987))

(assert (=> b!37114 d!5749))

(declare-fun d!5751 () Bool)

(declare-fun lt!13730 () Int)

(assert (=> d!5751 (>= lt!13730 0)))

(declare-fun e!23487 () Int)

(assert (=> d!5751 (= lt!13730 e!23487)))

(declare-fun c!4264 () Bool)

(assert (=> d!5751 (= c!4264 (is-Nil!971 (t!3735 (toList!504 lm!252))))))

(assert (=> d!5751 (= (size!1301 (t!3735 (toList!504 lm!252))) lt!13730)))

(declare-fun b!37144 () Bool)

(assert (=> b!37144 (= e!23487 0)))

(declare-fun b!37145 () Bool)

(assert (=> b!37145 (= e!23487 (+ 1 (size!1301 (t!3735 (t!3735 (toList!504 lm!252))))))))

(assert (= (and d!5751 c!4264) b!37144))

(assert (= (and d!5751 (not c!4264)) b!37145))

(declare-fun m!29989 () Bool)

(assert (=> b!37145 m!29989))

(assert (=> b!37119 d!5751))

(declare-fun d!5753 () Bool)

(declare-fun res!22469 () Bool)

(declare-fun e!23498 () Bool)

(assert (=> d!5753 (=> res!22469 e!23498)))

(assert (=> d!5753 (= res!22469 (and (is-Cons!970 (toList!504 lt!13662)) (= (_1!711 (h!1538 (toList!504 lt!13662))) k!388)))))

(assert (=> d!5753 (= (containsKey!48 (toList!504 lt!13662) k!388) e!23498)))

(declare-fun b!37162 () Bool)

(declare-fun e!23499 () Bool)

(assert (=> b!37162 (= e!23498 e!23499)))

(declare-fun res!22470 () Bool)

(assert (=> b!37162 (=> (not res!22470) (not e!23499))))

(assert (=> b!37162 (= res!22470 (and (or (not (is-Cons!970 (toList!504 lt!13662))) (bvsle (_1!711 (h!1538 (toList!504 lt!13662))) k!388)) (is-Cons!970 (toList!504 lt!13662)) (bvslt (_1!711 (h!1538 (toList!504 lt!13662))) k!388)))))

(declare-fun b!37163 () Bool)

(assert (=> b!37163 (= e!23499 (containsKey!48 (t!3735 (toList!504 lt!13662)) k!388))))

(assert (= (and d!5753 (not res!22469)) b!37162))

(assert (= (and b!37162 res!22470) b!37163))

(declare-fun m!29991 () Bool)

(assert (=> b!37163 m!29991))

(assert (=> d!5687 d!5753))

(declare-fun d!5755 () Bool)

(assert (=> d!5755 (= (tail!102 (toList!504 lm!252)) (t!3735 (toList!504 lm!252)))))

(assert (=> d!5741 d!5755))

(declare-fun d!5759 () Bool)

(declare-fun res!22473 () Bool)

(declare-fun e!23502 () Bool)

(assert (=> d!5759 (=> res!22473 e!23502)))

(assert (=> d!5759 (= res!22473 (is-Nil!971 (t!3735 (toList!504 lm!252))))))

(assert (=> d!5759 (= (forall!170 (t!3735 (toList!504 lm!252)) p!304) e!23502)))

(declare-fun b!37166 () Bool)

(declare-fun e!23503 () Bool)

(assert (=> b!37166 (= e!23502 e!23503)))

(declare-fun res!22474 () Bool)

(assert (=> b!37166 (=> (not res!22474) (not e!23503))))

(assert (=> b!37166 (= res!22474 (dynLambda!172 p!304 (h!1538 (t!3735 (toList!504 lm!252)))))))

(declare-fun b!37167 () Bool)

(assert (=> b!37167 (= e!23503 (forall!170 (t!3735 (t!3735 (toList!504 lm!252))) p!304))))

(assert (= (and d!5759 (not res!22473)) b!37166))

(assert (= (and b!37166 res!22474) b!37167))

(declare-fun b_lambda!1859 () Bool)

(assert (=> (not b_lambda!1859) (not b!37166)))

(declare-fun t!3753 () Bool)

(declare-fun tb!763 () Bool)

(assert (=> (and start!4848 (= p!304 p!304) t!3753) tb!763))

(declare-fun result!1299 () Bool)

(assert (=> tb!763 (= result!1299 true)))

(assert (=> b!37166 t!3753))

(declare-fun b_and!2235 () Bool)

(assert (= b_and!2231 (and (=> t!3753 result!1299) b_and!2235)))

(declare-fun m!29999 () Bool)

(assert (=> b!37166 m!29999))

(declare-fun m!30001 () Bool)

(assert (=> b!37167 m!30001))

(assert (=> b!37095 d!5759))

(declare-fun d!5763 () Bool)

(declare-fun isEmpty!206 (Option!90) Bool)

(assert (=> d!5763 (= (isDefined!46 (getValueByKey!84 (toList!504 lm!252) k!388)) (not (isEmpty!206 (getValueByKey!84 (toList!504 lm!252) k!388))))))

(declare-fun bs!1437 () Bool)

(assert (= bs!1437 d!5763))

(assert (=> bs!1437 m!29967))

(declare-fun m!30005 () Bool)

(assert (=> bs!1437 m!30005))

(assert (=> b!37122 d!5763))

(declare-fun b!37181 () Bool)

(declare-fun e!23511 () Option!90)

(declare-fun e!23512 () Option!90)

(assert (=> b!37181 (= e!23511 e!23512)))

(declare-fun c!4277 () Bool)

(assert (=> b!37181 (= c!4277 (and (is-Cons!970 (toList!504 lm!252)) (not (= (_1!711 (h!1538 (toList!504 lm!252))) k!388))))))

(declare-fun b!37182 () Bool)

(assert (=> b!37182 (= e!23512 (getValueByKey!84 (t!3735 (toList!504 lm!252)) k!388))))

(declare-fun b!37180 () Bool)

(assert (=> b!37180 (= e!23511 (Some!89 (_2!711 (h!1538 (toList!504 lm!252)))))))

(declare-fun d!5767 () Bool)

(declare-fun c!4276 () Bool)

(assert (=> d!5767 (= c!4276 (and (is-Cons!970 (toList!504 lm!252)) (= (_1!711 (h!1538 (toList!504 lm!252))) k!388)))))

(assert (=> d!5767 (= (getValueByKey!84 (toList!504 lm!252) k!388) e!23511)))

(declare-fun b!37183 () Bool)

(assert (=> b!37183 (= e!23512 None!88)))

(assert (= (and d!5767 c!4276) b!37180))

(assert (= (and d!5767 (not c!4276)) b!37181))

(assert (= (and b!37181 c!4277) b!37182))

(assert (= (and b!37181 (not c!4277)) b!37183))

(declare-fun m!30011 () Bool)

(assert (=> b!37182 m!30011))

(assert (=> b!37122 d!5767))

(declare-fun d!5773 () Bool)

(assert (=> d!5773 (isDefined!46 (getValueByKey!84 (toList!504 lt!13662) k!388))))

(declare-fun lt!13735 () Unit!836)

(declare-fun choose!230 (List!974 (_ BitVec 64)) Unit!836)

(assert (=> d!5773 (= lt!13735 (choose!230 (toList!504 lt!13662) k!388))))

(declare-fun e!23522 () Bool)

(assert (=> d!5773 e!23522))

(declare-fun res!22485 () Bool)

(assert (=> d!5773 (=> (not res!22485) (not e!23522))))

(assert (=> d!5773 (= res!22485 (isStrictlySorted!182 (toList!504 lt!13662)))))

(assert (=> d!5773 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!45 (toList!504 lt!13662) k!388) lt!13735)))

(declare-fun b!37194 () Bool)

(assert (=> b!37194 (= e!23522 (containsKey!48 (toList!504 lt!13662) k!388))))

(assert (= (and d!5773 res!22485) b!37194))

(assert (=> d!5773 m!29895))

(assert (=> d!5773 m!29895))

(assert (=> d!5773 m!29897))

(declare-fun m!30017 () Bool)

(assert (=> d!5773 m!30017))

(declare-fun m!30019 () Bool)

(assert (=> d!5773 m!30019))

(assert (=> b!37194 m!29891))

(assert (=> b!37071 d!5773))

(declare-fun d!5783 () Bool)

(assert (=> d!5783 (= (isDefined!46 (getValueByKey!84 (toList!504 lt!13662) k!388)) (not (isEmpty!206 (getValueByKey!84 (toList!504 lt!13662) k!388))))))

(declare-fun bs!1438 () Bool)

(assert (= bs!1438 d!5783))

(assert (=> bs!1438 m!29895))

(declare-fun m!30021 () Bool)

(assert (=> bs!1438 m!30021))

(assert (=> b!37071 d!5783))

(declare-fun b!37198 () Bool)

(declare-fun e!23525 () Option!90)

(declare-fun e!23526 () Option!90)

(assert (=> b!37198 (= e!23525 e!23526)))

(declare-fun c!4280 () Bool)

(assert (=> b!37198 (= c!4280 (and (is-Cons!970 (toList!504 lt!13662)) (not (= (_1!711 (h!1538 (toList!504 lt!13662))) k!388))))))

(declare-fun b!37199 () Bool)

(assert (=> b!37199 (= e!23526 (getValueByKey!84 (t!3735 (toList!504 lt!13662)) k!388))))

(declare-fun b!37197 () Bool)

(assert (=> b!37197 (= e!23525 (Some!89 (_2!711 (h!1538 (toList!504 lt!13662)))))))

(declare-fun d!5785 () Bool)

(declare-fun c!4279 () Bool)

(assert (=> d!5785 (= c!4279 (and (is-Cons!970 (toList!504 lt!13662)) (= (_1!711 (h!1538 (toList!504 lt!13662))) k!388)))))

(assert (=> d!5785 (= (getValueByKey!84 (toList!504 lt!13662) k!388) e!23525)))

(declare-fun b!37200 () Bool)

(assert (=> b!37200 (= e!23526 None!88)))

(assert (= (and d!5785 c!4279) b!37197))

(assert (= (and d!5785 (not c!4279)) b!37198))

(assert (= (and b!37198 c!4280) b!37199))

(assert (= (and b!37198 (not c!4280)) b!37200))

(declare-fun m!30023 () Bool)

(assert (=> b!37199 m!30023))

(assert (=> b!37071 d!5785))

(declare-fun d!5787 () Bool)

(declare-fun res!22495 () Bool)

(declare-fun e!23534 () Bool)

(assert (=> d!5787 (=> res!22495 e!23534)))

(assert (=> d!5787 (= res!22495 (or (is-Nil!971 (toList!504 lm!252)) (is-Nil!971 (t!3735 (toList!504 lm!252)))))))

(assert (=> d!5787 (= (isStrictlySorted!182 (toList!504 lm!252)) e!23534)))

(declare-fun b!37208 () Bool)

(declare-fun e!23535 () Bool)

(assert (=> b!37208 (= e!23534 e!23535)))

(declare-fun res!22496 () Bool)

(assert (=> b!37208 (=> (not res!22496) (not e!23535))))

(assert (=> b!37208 (= res!22496 (bvslt (_1!711 (h!1538 (toList!504 lm!252))) (_1!711 (h!1538 (t!3735 (toList!504 lm!252))))))))

(declare-fun b!37209 () Bool)

(assert (=> b!37209 (= e!23535 (isStrictlySorted!182 (t!3735 (toList!504 lm!252))))))

(assert (= (and d!5787 (not res!22495)) b!37208))

(assert (= (and b!37208 res!22496) b!37209))

(declare-fun m!30029 () Bool)

(assert (=> b!37209 m!30029))

(assert (=> d!5707 d!5787))

(declare-fun d!5793 () Bool)

(assert (=> d!5793 (isDefined!46 (getValueByKey!84 (toList!504 lm!252) k!388))))

(declare-fun lt!13742 () Unit!836)

(assert (=> d!5793 (= lt!13742 (choose!230 (toList!504 lm!252) k!388))))

(declare-fun e!23537 () Bool)

(assert (=> d!5793 e!23537))

(declare-fun res!22498 () Bool)

(assert (=> d!5793 (=> (not res!22498) (not e!23537))))

(assert (=> d!5793 (= res!22498 (isStrictlySorted!182 (toList!504 lm!252)))))

(assert (=> d!5793 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!45 (toList!504 lm!252) k!388) lt!13742)))

(declare-fun b!37211 () Bool)

(assert (=> b!37211 (= e!23537 (containsKey!48 (toList!504 lm!252) k!388))))

(assert (= (and d!5793 res!22498) b!37211))

(assert (=> d!5793 m!29967))

(assert (=> d!5793 m!29967))

(assert (=> d!5793 m!29969))

(declare-fun m!30035 () Bool)

(assert (=> d!5793 m!30035))

(assert (=> d!5793 m!29925))

(assert (=> b!37211 m!29963))

(assert (=> b!37120 d!5793))

(assert (=> b!37120 d!5763))

(assert (=> b!37120 d!5767))

(declare-fun d!5797 () Bool)

(declare-fun res!22499 () Bool)

(declare-fun e!23542 () Bool)

(assert (=> d!5797 (=> res!22499 e!23542)))

(assert (=> d!5797 (= res!22499 (and (is-Cons!970 (toList!504 lm!252)) (= (_1!711 (h!1538 (toList!504 lm!252))) k!388)))))

(assert (=> d!5797 (= (containsKey!48 (toList!504 lm!252) k!388) e!23542)))

(declare-fun b!37220 () Bool)

(declare-fun e!23543 () Bool)

(assert (=> b!37220 (= e!23542 e!23543)))

(declare-fun res!22500 () Bool)

(assert (=> b!37220 (=> (not res!22500) (not e!23543))))

(assert (=> b!37220 (= res!22500 (and (or (not (is-Cons!970 (toList!504 lm!252))) (bvsle (_1!711 (h!1538 (toList!504 lm!252))) k!388)) (is-Cons!970 (toList!504 lm!252)) (bvslt (_1!711 (h!1538 (toList!504 lm!252))) k!388)))))

(declare-fun b!37221 () Bool)

(assert (=> b!37221 (= e!23543 (containsKey!48 (t!3735 (toList!504 lm!252)) k!388))))

(assert (= (and d!5797 (not res!22499)) b!37220))

(assert (= (and b!37220 res!22500) b!37221))

(declare-fun m!30039 () Bool)

(assert (=> b!37221 m!30039))

(assert (=> d!5731 d!5797))

(declare-fun d!5801 () Bool)

(assert (=> d!5801 (= (isEmpty!202 (toList!504 lm!252)) (is-Nil!971 (toList!504 lm!252)))))

(assert (=> d!5699 d!5801))

(declare-fun d!5805 () Bool)

(declare-fun res!22501 () Bool)

(declare-fun e!23546 () Bool)

(assert (=> d!5805 (=> res!22501 e!23546)))

(assert (=> d!5805 (= res!22501 (is-Nil!971 (t!3735 (toList!504 lt!13662))))))

(assert (=> d!5805 (= (forall!170 (t!3735 (toList!504 lt!13662)) p!304) e!23546)))

(declare-fun b!37226 () Bool)

(declare-fun e!23547 () Bool)

(assert (=> b!37226 (= e!23546 e!23547)))

(declare-fun res!22502 () Bool)

(assert (=> b!37226 (=> (not res!22502) (not e!23547))))

(assert (=> b!37226 (= res!22502 (dynLambda!172 p!304 (h!1538 (t!3735 (toList!504 lt!13662)))))))

(declare-fun b!37227 () Bool)

(assert (=> b!37227 (= e!23547 (forall!170 (t!3735 (t!3735 (toList!504 lt!13662))) p!304))))

(assert (= (and d!5805 (not res!22501)) b!37226))

(assert (= (and b!37226 res!22502) b!37227))

(declare-fun b_lambda!1863 () Bool)

(assert (=> (not b_lambda!1863) (not b!37226)))

(declare-fun t!3757 () Bool)

(declare-fun tb!767 () Bool)

(assert (=> (and start!4848 (= p!304 p!304) t!3757) tb!767))

(declare-fun result!1303 () Bool)

(assert (=> tb!767 (= result!1303 true)))

(assert (=> b!37226 t!3757))

(declare-fun b_and!2239 () Bool)

(assert (= b_and!2235 (and (=> t!3757 result!1303) b_and!2239)))

(declare-fun m!30043 () Bool)

(assert (=> b!37226 m!30043))

(declare-fun m!30045 () Bool)

(assert (=> b!37227 m!30045))

(assert (=> b!37126 d!5805))

(assert (=> b!37073 d!5783))

(assert (=> b!37073 d!5785))

(declare-fun b!37232 () Bool)

(declare-fun e!23550 () Bool)

(declare-fun tp!5505 () Bool)

(assert (=> b!37232 (= e!23550 (and tp_is_empty!1667 tp!5505))))

(assert (=> b!37141 (= tp!5504 e!23550)))

(assert (= (and b!37141 (is-Cons!970 (t!3735 (toList!504 lm!252)))) b!37232))

(declare-fun b_lambda!1865 () Bool)

(assert (= b_lambda!1863 (or (and start!4848 b_free!1333) b_lambda!1865)))

(declare-fun b_lambda!1869 () Bool)

(assert (= b_lambda!1859 (or (and start!4848 b_free!1333) b_lambda!1869)))

(push 1)

(assert (not b!37232))

(assert (not d!5763))

(assert b_and!2239)

(assert (not b!37163))

(assert (not b!37221))

(assert (not b!37194))

(assert (not d!5773))

(assert (not b!37143))

(assert (not b_lambda!1851))

(assert (not b!37211))

(assert (not b!37209))

(assert (not b!37182))

(assert (not d!5793))

(assert (not d!5783))

(assert (not b_lambda!1865))

(assert (not b!37145))

(assert (not b_next!1333))

(assert (not b_lambda!1869))

(assert (not b!37227))

(assert (not b!37199))

(assert tp_is_empty!1667)

(assert (not b_lambda!1849))

(assert (not b!37167))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2239)

(assert (not b_next!1333))

(check-sat)

(pop 1)

