; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137272 () Bool)

(assert start!137272)

(declare-fun b!1580918 () Bool)

(declare-fun res!1080024 () Bool)

(declare-fun e!882030 () Bool)

(assert (=> b!1580918 (=> (not res!1080024) (not e!882030))))

(declare-datatypes ((B!2682 0))(
  ( (B!2683 (val!19703 Int)) )
))
(declare-datatypes ((tuple2!25548 0))(
  ( (tuple2!25549 (_1!12785 (_ BitVec 64)) (_2!12785 B!2682)) )
))
(declare-datatypes ((List!36823 0))(
  ( (Nil!36820) (Cons!36819 (h!38362 tuple2!25548) (t!51737 List!36823)) )
))
(declare-fun l!1390 () List!36823)

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!927 (List!36823 (_ BitVec 64)) Bool)

(assert (=> b!1580918 (= res!1080024 (containsKey!927 l!1390 key!405))))

(declare-fun b!1580919 () Bool)

(declare-fun res!1080026 () Bool)

(declare-fun e!882032 () Bool)

(assert (=> b!1580919 (=> (not res!1080026) (not e!882032))))

(assert (=> b!1580919 (= res!1080026 (not (containsKey!927 (t!51737 l!1390) key!405)))))

(declare-fun b!1580921 () Bool)

(declare-fun value!194 () B!2682)

(declare-datatypes ((Option!915 0))(
  ( (Some!914 (v!22421 B!2682)) (None!913) )
))
(declare-fun getValueByKey!819 (List!36823 (_ BitVec 64)) Option!915)

(assert (=> b!1580921 (= e!882032 (not (= (getValueByKey!819 l!1390 key!405) (Some!914 value!194))))))

(declare-fun lt!676847 () tuple2!25548)

(declare-fun contains!10495 (List!36823 tuple2!25548) Bool)

(assert (=> b!1580921 (not (contains!10495 (t!51737 l!1390) lt!676847))))

(declare-datatypes ((Unit!52250 0))(
  ( (Unit!52251) )
))
(declare-fun lt!676848 () Unit!52250)

(declare-fun lemmaNotContainsKeyThenNotContainsTuple!6 (List!36823 (_ BitVec 64) B!2682) Unit!52250)

(assert (=> b!1580921 (= lt!676848 (lemmaNotContainsKeyThenNotContainsTuple!6 (t!51737 l!1390) key!405 value!194))))

(declare-fun b!1580922 () Bool)

(declare-fun res!1080028 () Bool)

(assert (=> b!1580922 (=> (not res!1080028) (not e!882032))))

(declare-fun isStrictlySorted!1081 (List!36823) Bool)

(assert (=> b!1580922 (= res!1080028 (isStrictlySorted!1081 (t!51737 l!1390)))))

(declare-fun b!1580923 () Bool)

(declare-fun e!882031 () Bool)

(declare-fun tp_is_empty!39227 () Bool)

(declare-fun tp!114530 () Bool)

(assert (=> b!1580923 (= e!882031 (and tp_is_empty!39227 tp!114530))))

(declare-fun b!1580924 () Bool)

(declare-fun e!882028 () Bool)

(assert (=> b!1580924 (= e!882028 e!882032)))

(declare-fun res!1080030 () Bool)

(assert (=> b!1580924 (=> (not res!1080030) (not e!882032))))

(declare-fun e!882029 () Bool)

(assert (=> b!1580924 (= res!1080030 e!882029)))

(declare-fun res!1080027 () Bool)

(assert (=> b!1580924 (=> res!1080027 e!882029)))

(declare-datatypes ((tuple2!25550 0))(
  ( (tuple2!25551 (_1!12786 tuple2!25548) (_2!12786 List!36823)) )
))
(declare-datatypes ((Option!916 0))(
  ( (Some!915 (v!22422 tuple2!25550)) (None!914) )
))
(declare-fun lt!676846 () Option!916)

(declare-fun isEmpty!1174 (Option!916) Bool)

(assert (=> b!1580924 (= res!1080027 (isEmpty!1174 lt!676846))))

(declare-fun unapply!90 (List!36823) Option!916)

(assert (=> b!1580924 (= lt!676846 (unapply!90 l!1390))))

(declare-fun res!1080029 () Bool)

(assert (=> start!137272 (=> (not res!1080029) (not e!882030))))

(assert (=> start!137272 (= res!1080029 (isStrictlySorted!1081 l!1390))))

(assert (=> start!137272 e!882030))

(assert (=> start!137272 e!882031))

(assert (=> start!137272 true))

(assert (=> start!137272 tp_is_empty!39227))

(declare-fun b!1580920 () Bool)

(assert (=> b!1580920 (= e!882030 e!882028)))

(declare-fun res!1080023 () Bool)

(assert (=> b!1580920 (=> (not res!1080023) (not e!882028))))

(assert (=> b!1580920 (= res!1080023 (contains!10495 l!1390 lt!676847))))

(assert (=> b!1580920 (= lt!676847 (tuple2!25549 key!405 value!194))))

(declare-fun b!1580925 () Bool)

(declare-fun get!26805 (Option!916) tuple2!25550)

(assert (=> b!1580925 (= e!882029 (not (is-Nil!36820 (_2!12786 (get!26805 lt!676846)))))))

(declare-fun b!1580926 () Bool)

(declare-fun res!1080025 () Bool)

(assert (=> b!1580926 (=> (not res!1080025) (not e!882032))))

(assert (=> b!1580926 (= res!1080025 (and (is-Cons!36819 l!1390) (= (_1!12785 (h!38362 l!1390)) key!405)))))

(assert (= (and start!137272 res!1080029) b!1580918))

(assert (= (and b!1580918 res!1080024) b!1580920))

(assert (= (and b!1580920 res!1080023) b!1580924))

(assert (= (and b!1580924 (not res!1080027)) b!1580925))

(assert (= (and b!1580924 res!1080030) b!1580926))

(assert (= (and b!1580926 res!1080025) b!1580922))

(assert (= (and b!1580922 res!1080028) b!1580919))

(assert (= (and b!1580919 res!1080026) b!1580921))

(assert (= (and start!137272 (is-Cons!36819 l!1390)) b!1580923))

(declare-fun m!1452121 () Bool)

(assert (=> b!1580922 m!1452121))

(declare-fun m!1452123 () Bool)

(assert (=> b!1580925 m!1452123))

(declare-fun m!1452125 () Bool)

(assert (=> b!1580924 m!1452125))

(declare-fun m!1452127 () Bool)

(assert (=> b!1580924 m!1452127))

(declare-fun m!1452129 () Bool)

(assert (=> start!137272 m!1452129))

(declare-fun m!1452131 () Bool)

(assert (=> b!1580921 m!1452131))

(declare-fun m!1452133 () Bool)

(assert (=> b!1580921 m!1452133))

(declare-fun m!1452135 () Bool)

(assert (=> b!1580921 m!1452135))

(declare-fun m!1452137 () Bool)

(assert (=> b!1580920 m!1452137))

(declare-fun m!1452139 () Bool)

(assert (=> b!1580918 m!1452139))

(declare-fun m!1452141 () Bool)

(assert (=> b!1580919 m!1452141))

(push 1)

(assert (not b!1580924))

(assert (not b!1580921))

(assert (not b!1580919))

(assert tp_is_empty!39227)

(assert (not b!1580923))

(assert (not b!1580922))

(assert (not b!1580920))

(assert (not b!1580918))

(assert (not b!1580925))

(assert (not start!137272))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166553 () Bool)

(declare-fun lt!676856 () Bool)

(declare-fun content!841 (List!36823) (Set tuple2!25548))

(assert (=> d!166553 (= lt!676856 (member lt!676847 (content!841 l!1390)))))

(declare-fun e!882054 () Bool)

(assert (=> d!166553 (= lt!676856 e!882054)))

(declare-fun res!1080051 () Bool)

(assert (=> d!166553 (=> (not res!1080051) (not e!882054))))

(assert (=> d!166553 (= res!1080051 (is-Cons!36819 l!1390))))

(assert (=> d!166553 (= (contains!10495 l!1390 lt!676847) lt!676856)))

(declare-fun b!1580947 () Bool)

(declare-fun e!882053 () Bool)

(assert (=> b!1580947 (= e!882054 e!882053)))

(declare-fun res!1080052 () Bool)

(assert (=> b!1580947 (=> res!1080052 e!882053)))

(assert (=> b!1580947 (= res!1080052 (= (h!38362 l!1390) lt!676847))))

(declare-fun b!1580948 () Bool)

(assert (=> b!1580948 (= e!882053 (contains!10495 (t!51737 l!1390) lt!676847))))

(assert (= (and d!166553 res!1080051) b!1580947))

(assert (= (and b!1580947 (not res!1080052)) b!1580948))

(declare-fun m!1452147 () Bool)

(assert (=> d!166553 m!1452147))

(declare-fun m!1452149 () Bool)

(assert (=> d!166553 m!1452149))

(assert (=> b!1580948 m!1452133))

(assert (=> b!1580920 d!166553))

(declare-fun d!166559 () Bool)

(assert (=> d!166559 (= (get!26805 lt!676846) (v!22422 lt!676846))))

(assert (=> b!1580925 d!166559))

(declare-fun d!166561 () Bool)

(declare-fun res!1080065 () Bool)

(declare-fun e!882073 () Bool)

(assert (=> d!166561 (=> res!1080065 e!882073)))

(assert (=> d!166561 (= res!1080065 (or (is-Nil!36820 l!1390) (is-Nil!36820 (t!51737 l!1390))))))

(assert (=> d!166561 (= (isStrictlySorted!1081 l!1390) e!882073)))

(declare-fun b!1580973 () Bool)

(declare-fun e!882074 () Bool)

(assert (=> b!1580973 (= e!882073 e!882074)))

(declare-fun res!1080066 () Bool)

(assert (=> b!1580973 (=> (not res!1080066) (not e!882074))))

(assert (=> b!1580973 (= res!1080066 (bvslt (_1!12785 (h!38362 l!1390)) (_1!12785 (h!38362 (t!51737 l!1390)))))))

(declare-fun b!1580974 () Bool)

(assert (=> b!1580974 (= e!882074 (isStrictlySorted!1081 (t!51737 l!1390)))))

(assert (= (and d!166561 (not res!1080065)) b!1580973))

(assert (= (and b!1580973 res!1080066) b!1580974))

(assert (=> b!1580974 m!1452121))

(assert (=> start!137272 d!166561))

(declare-fun d!166569 () Bool)

(assert (=> d!166569 (= (isEmpty!1174 lt!676846) (not (is-Some!915 lt!676846)))))

(assert (=> b!1580924 d!166569))

(declare-fun d!166573 () Bool)

(assert (=> d!166573 (= (unapply!90 l!1390) (ite (is-Nil!36820 l!1390) None!914 (Some!915 (tuple2!25551 (h!38362 l!1390) (t!51737 l!1390)))))))

(assert (=> b!1580924 d!166573))

(declare-fun d!166577 () Bool)

(declare-fun res!1080078 () Bool)

(declare-fun e!882090 () Bool)

(assert (=> d!166577 (=> res!1080078 e!882090)))

(assert (=> d!166577 (= res!1080078 (and (is-Cons!36819 (t!51737 l!1390)) (= (_1!12785 (h!38362 (t!51737 l!1390))) key!405)))))

(assert (=> d!166577 (= (containsKey!927 (t!51737 l!1390) key!405) e!882090)))

(declare-fun b!1580994 () Bool)

(declare-fun e!882091 () Bool)

(assert (=> b!1580994 (= e!882090 e!882091)))

(declare-fun res!1080079 () Bool)

(assert (=> b!1580994 (=> (not res!1080079) (not e!882091))))

(assert (=> b!1580994 (= res!1080079 (and (or (not (is-Cons!36819 (t!51737 l!1390))) (bvsle (_1!12785 (h!38362 (t!51737 l!1390))) key!405)) (is-Cons!36819 (t!51737 l!1390)) (bvslt (_1!12785 (h!38362 (t!51737 l!1390))) key!405)))))

(declare-fun b!1580995 () Bool)

(assert (=> b!1580995 (= e!882091 (containsKey!927 (t!51737 (t!51737 l!1390)) key!405))))

(assert (= (and d!166577 (not res!1080078)) b!1580994))

(assert (= (and b!1580994 res!1080079) b!1580995))

(declare-fun m!1452171 () Bool)

(assert (=> b!1580995 m!1452171))

(assert (=> b!1580919 d!166577))

(declare-fun d!166589 () Bool)

(declare-fun res!1080080 () Bool)

(declare-fun e!882092 () Bool)

(assert (=> d!166589 (=> res!1080080 e!882092)))

(assert (=> d!166589 (= res!1080080 (and (is-Cons!36819 l!1390) (= (_1!12785 (h!38362 l!1390)) key!405)))))

(assert (=> d!166589 (= (containsKey!927 l!1390 key!405) e!882092)))

(declare-fun b!1580996 () Bool)

(declare-fun e!882093 () Bool)

(assert (=> b!1580996 (= e!882092 e!882093)))

(declare-fun res!1080081 () Bool)

(assert (=> b!1580996 (=> (not res!1080081) (not e!882093))))

(assert (=> b!1580996 (= res!1080081 (and (or (not (is-Cons!36819 l!1390)) (bvsle (_1!12785 (h!38362 l!1390)) key!405)) (is-Cons!36819 l!1390) (bvslt (_1!12785 (h!38362 l!1390)) key!405)))))

(declare-fun b!1580997 () Bool)

(assert (=> b!1580997 (= e!882093 (containsKey!927 (t!51737 l!1390) key!405))))

(assert (= (and d!166589 (not res!1080080)) b!1580996))

(assert (= (and b!1580996 res!1080081) b!1580997))

(assert (=> b!1580997 m!1452141))

(assert (=> b!1580918 d!166589))

(declare-fun b!1581022 () Bool)

(declare-fun e!882111 () Option!915)

(assert (=> b!1581022 (= e!882111 (getValueByKey!819 (t!51737 l!1390) key!405))))

(declare-fun b!1581021 () Bool)

(declare-fun e!882110 () Option!915)

(assert (=> b!1581021 (= e!882110 e!882111)))

(declare-fun c!146578 () Bool)

(assert (=> b!1581021 (= c!146578 (and (is-Cons!36819 l!1390) (not (= (_1!12785 (h!38362 l!1390)) key!405))))))

(declare-fun d!166591 () Bool)

(declare-fun c!146577 () Bool)

(assert (=> d!166591 (= c!146577 (and (is-Cons!36819 l!1390) (= (_1!12785 (h!38362 l!1390)) key!405)))))

(assert (=> d!166591 (= (getValueByKey!819 l!1390 key!405) e!882110)))

(declare-fun b!1581020 () Bool)

(assert (=> b!1581020 (= e!882110 (Some!914 (_2!12785 (h!38362 l!1390))))))

(declare-fun b!1581023 () Bool)

(assert (=> b!1581023 (= e!882111 None!913)))

(assert (= (and d!166591 c!146577) b!1581020))

(assert (= (and d!166591 (not c!146577)) b!1581021))

(assert (= (and b!1581021 c!146578) b!1581022))

(assert (= (and b!1581021 (not c!146578)) b!1581023))

(declare-fun m!1452183 () Bool)

(assert (=> b!1581022 m!1452183))

(assert (=> b!1580921 d!166591))

(declare-fun d!166603 () Bool)

(declare-fun lt!676865 () Bool)

(assert (=> d!166603 (= lt!676865 (member lt!676847 (content!841 (t!51737 l!1390))))))

(declare-fun e!882115 () Bool)

(assert (=> d!166603 (= lt!676865 e!882115)))

(declare-fun res!1080094 () Bool)

(assert (=> d!166603 (=> (not res!1080094) (not e!882115))))

(assert (=> d!166603 (= res!1080094 (is-Cons!36819 (t!51737 l!1390)))))

(assert (=> d!166603 (= (contains!10495 (t!51737 l!1390) lt!676847) lt!676865)))

(declare-fun b!1581026 () Bool)

(declare-fun e!882114 () Bool)

(assert (=> b!1581026 (= e!882115 e!882114)))

(declare-fun res!1080095 () Bool)

(assert (=> b!1581026 (=> res!1080095 e!882114)))

(assert (=> b!1581026 (= res!1080095 (= (h!38362 (t!51737 l!1390)) lt!676847))))

(declare-fun b!1581027 () Bool)

(assert (=> b!1581027 (= e!882114 (contains!10495 (t!51737 (t!51737 l!1390)) lt!676847))))

(assert (= (and d!166603 res!1080094) b!1581026))

(assert (= (and b!1581026 (not res!1080095)) b!1581027))

(declare-fun m!1452185 () Bool)

(assert (=> d!166603 m!1452185))

(declare-fun m!1452187 () Bool)

(assert (=> d!166603 m!1452187))

(declare-fun m!1452189 () Bool)

(assert (=> b!1581027 m!1452189))

(assert (=> b!1580921 d!166603))

(declare-fun d!166605 () Bool)

(assert (=> d!166605 (not (contains!10495 (t!51737 l!1390) (tuple2!25549 key!405 value!194)))))

