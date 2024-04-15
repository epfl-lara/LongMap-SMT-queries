; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137196 () Bool)

(assert start!137196)

(declare-fun b!1580444 () Bool)

(declare-fun res!1079760 () Bool)

(declare-fun e!881712 () Bool)

(assert (=> b!1580444 (=> (not res!1079760) (not e!881712))))

(declare-datatypes ((B!2676 0))(
  ( (B!2677 (val!19700 Int)) )
))
(declare-datatypes ((tuple2!25604 0))(
  ( (tuple2!25605 (_1!12813 (_ BitVec 64)) (_2!12813 B!2676)) )
))
(declare-datatypes ((List!36861 0))(
  ( (Nil!36858) (Cons!36857 (h!38401 tuple2!25604) (t!51767 List!36861)) )
))
(declare-fun l!1390 () List!36861)

(declare-fun key!405 () (_ BitVec 64))

(assert (=> b!1580444 (= res!1079760 (and (is-Cons!36857 l!1390) (= (_1!12813 (h!38401 l!1390)) key!405)))))

(declare-fun b!1580445 () Bool)

(declare-fun res!1079759 () Bool)

(declare-fun e!881713 () Bool)

(assert (=> b!1580445 (=> (not res!1079759) (not e!881713))))

(declare-fun containsKey!922 (List!36861 (_ BitVec 64)) Bool)

(assert (=> b!1580445 (= res!1079759 (containsKey!922 l!1390 key!405))))

(declare-fun b!1580446 () Bool)

(declare-fun e!881710 () Bool)

(assert (=> b!1580446 (= e!881710 (containsKey!922 (t!51767 l!1390) key!405))))

(declare-fun b!1580447 () Bool)

(assert (=> b!1580447 (= e!881712 e!881710)))

(declare-fun res!1079762 () Bool)

(assert (=> b!1580447 (=> res!1079762 e!881710)))

(declare-fun isStrictlySorted!1076 (List!36861) Bool)

(assert (=> b!1580447 (= res!1079762 (not (isStrictlySorted!1076 (t!51767 l!1390))))))

(declare-fun b!1580448 () Bool)

(assert (=> b!1580448 (= e!881713 e!881712)))

(declare-fun res!1079757 () Bool)

(assert (=> b!1580448 (=> (not res!1079757) (not e!881712))))

(declare-fun e!881714 () Bool)

(assert (=> b!1580448 (= res!1079757 e!881714)))

(declare-fun res!1079761 () Bool)

(assert (=> b!1580448 (=> res!1079761 e!881714)))

(declare-datatypes ((tuple2!25606 0))(
  ( (tuple2!25607 (_1!12814 tuple2!25604) (_2!12814 List!36861)) )
))
(declare-datatypes ((Option!912 0))(
  ( (Some!911 (v!22409 tuple2!25606)) (None!910) )
))
(declare-fun lt!676529 () Option!912)

(declare-fun isEmpty!1175 (Option!912) Bool)

(assert (=> b!1580448 (= res!1079761 (isEmpty!1175 lt!676529))))

(declare-fun unapply!87 (List!36861) Option!912)

(assert (=> b!1580448 (= lt!676529 (unapply!87 l!1390))))

(declare-fun b!1580449 () Bool)

(declare-fun get!26797 (Option!912) tuple2!25606)

(assert (=> b!1580449 (= e!881714 (not (is-Nil!36858 (_2!12814 (get!26797 lt!676529)))))))

(declare-fun b!1580450 () Bool)

(declare-fun e!881711 () Bool)

(declare-fun tp_is_empty!39221 () Bool)

(declare-fun tp!114513 () Bool)

(assert (=> b!1580450 (= e!881711 (and tp_is_empty!39221 tp!114513))))

(declare-fun b!1580451 () Bool)

(declare-fun res!1079763 () Bool)

(assert (=> b!1580451 (=> (not res!1079763) (not e!881713))))

(declare-fun value!194 () B!2676)

(declare-fun contains!10447 (List!36861 tuple2!25604) Bool)

(assert (=> b!1580451 (= res!1079763 (contains!10447 l!1390 (tuple2!25605 key!405 value!194)))))

(declare-fun res!1079758 () Bool)

(assert (=> start!137196 (=> (not res!1079758) (not e!881713))))

(assert (=> start!137196 (= res!1079758 (isStrictlySorted!1076 l!1390))))

(assert (=> start!137196 e!881713))

(assert (=> start!137196 e!881711))

(assert (=> start!137196 true))

(assert (=> start!137196 tp_is_empty!39221))

(assert (= (and start!137196 res!1079758) b!1580445))

(assert (= (and b!1580445 res!1079759) b!1580451))

(assert (= (and b!1580451 res!1079763) b!1580448))

(assert (= (and b!1580448 (not res!1079761)) b!1580449))

(assert (= (and b!1580448 res!1079757) b!1580444))

(assert (= (and b!1580444 res!1079760) b!1580447))

(assert (= (and b!1580447 (not res!1079762)) b!1580446))

(assert (= (and start!137196 (is-Cons!36857 l!1390)) b!1580450))

(declare-fun m!1451151 () Bool)

(assert (=> b!1580448 m!1451151))

(declare-fun m!1451153 () Bool)

(assert (=> b!1580448 m!1451153))

(declare-fun m!1451155 () Bool)

(assert (=> b!1580451 m!1451155))

(declare-fun m!1451157 () Bool)

(assert (=> b!1580449 m!1451157))

(declare-fun m!1451159 () Bool)

(assert (=> b!1580445 m!1451159))

(declare-fun m!1451161 () Bool)

(assert (=> b!1580447 m!1451161))

(declare-fun m!1451163 () Bool)

(assert (=> start!137196 m!1451163))

(declare-fun m!1451165 () Bool)

(assert (=> b!1580446 m!1451165))

(push 1)

(assert (not b!1580450))

(assert (not b!1580447))

(assert tp_is_empty!39221)

(assert (not b!1580446))

(assert (not b!1580451))

(assert (not start!137196))

(assert (not b!1580448))

(assert (not b!1580449))

(assert (not b!1580445))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166273 () Bool)

(assert (=> d!166273 (= (get!26797 lt!676529) (v!22409 lt!676529))))

(assert (=> b!1580449 d!166273))

(declare-fun d!166277 () Bool)

(declare-fun res!1079800 () Bool)

(declare-fun e!881751 () Bool)

(assert (=> d!166277 (=> res!1079800 e!881751)))

(assert (=> d!166277 (= res!1079800 (and (is-Cons!36857 l!1390) (= (_1!12813 (h!38401 l!1390)) key!405)))))

(assert (=> d!166277 (= (containsKey!922 l!1390 key!405) e!881751)))

(declare-fun b!1580488 () Bool)

(declare-fun e!881752 () Bool)

(assert (=> b!1580488 (= e!881751 e!881752)))

(declare-fun res!1079801 () Bool)

(assert (=> b!1580488 (=> (not res!1079801) (not e!881752))))

(assert (=> b!1580488 (= res!1079801 (and (or (not (is-Cons!36857 l!1390)) (bvsle (_1!12813 (h!38401 l!1390)) key!405)) (is-Cons!36857 l!1390) (bvslt (_1!12813 (h!38401 l!1390)) key!405)))))

(declare-fun b!1580489 () Bool)

(assert (=> b!1580489 (= e!881752 (containsKey!922 (t!51767 l!1390) key!405))))

(assert (= (and d!166277 (not res!1079800)) b!1580488))

(assert (= (and b!1580488 res!1079801) b!1580489))

(assert (=> b!1580489 m!1451165))

(assert (=> b!1580445 d!166277))

(declare-fun lt!676538 () Bool)

(declare-fun d!166285 () Bool)

(declare-fun content!827 (List!36861) (Set tuple2!25604))

(assert (=> d!166285 (= lt!676538 (set.member (tuple2!25605 key!405 value!194) (content!827 l!1390)))))

(declare-fun e!881771 () Bool)

(assert (=> d!166285 (= lt!676538 e!881771)))

(declare-fun res!1079816 () Bool)

(assert (=> d!166285 (=> (not res!1079816) (not e!881771))))

(assert (=> d!166285 (= res!1079816 (is-Cons!36857 l!1390))))

(assert (=> d!166285 (= (contains!10447 l!1390 (tuple2!25605 key!405 value!194)) lt!676538)))

(declare-fun b!1580509 () Bool)

(declare-fun e!881770 () Bool)

(assert (=> b!1580509 (= e!881771 e!881770)))

(declare-fun res!1079817 () Bool)

(assert (=> b!1580509 (=> res!1079817 e!881770)))

(assert (=> b!1580509 (= res!1079817 (= (h!38401 l!1390) (tuple2!25605 key!405 value!194)))))

(declare-fun b!1580510 () Bool)

(assert (=> b!1580510 (= e!881770 (contains!10447 (t!51767 l!1390) (tuple2!25605 key!405 value!194)))))

(assert (= (and d!166285 res!1079816) b!1580509))

(assert (= (and b!1580509 (not res!1079817)) b!1580510))

(declare-fun m!1451185 () Bool)

(assert (=> d!166285 m!1451185))

(declare-fun m!1451187 () Bool)

(assert (=> d!166285 m!1451187))

(declare-fun m!1451189 () Bool)

(assert (=> b!1580510 m!1451189))

(assert (=> b!1580451 d!166285))

(declare-fun d!166297 () Bool)

(declare-fun res!1079818 () Bool)

(declare-fun e!881772 () Bool)

(assert (=> d!166297 (=> res!1079818 e!881772)))

(assert (=> d!166297 (= res!1079818 (and (is-Cons!36857 (t!51767 l!1390)) (= (_1!12813 (h!38401 (t!51767 l!1390))) key!405)))))

(assert (=> d!166297 (= (containsKey!922 (t!51767 l!1390) key!405) e!881772)))

(declare-fun b!1580511 () Bool)

(declare-fun e!881773 () Bool)

(assert (=> b!1580511 (= e!881772 e!881773)))

(declare-fun res!1079819 () Bool)

(assert (=> b!1580511 (=> (not res!1079819) (not e!881773))))

(assert (=> b!1580511 (= res!1079819 (and (or (not (is-Cons!36857 (t!51767 l!1390))) (bvsle (_1!12813 (h!38401 (t!51767 l!1390))) key!405)) (is-Cons!36857 (t!51767 l!1390)) (bvslt (_1!12813 (h!38401 (t!51767 l!1390))) key!405)))))

(declare-fun b!1580512 () Bool)

(assert (=> b!1580512 (= e!881773 (containsKey!922 (t!51767 (t!51767 l!1390)) key!405))))

(assert (= (and d!166297 (not res!1079818)) b!1580511))

(assert (= (and b!1580511 res!1079819) b!1580512))

(declare-fun m!1451191 () Bool)

(assert (=> b!1580512 m!1451191))

(assert (=> b!1580446 d!166297))

(declare-fun d!166301 () Bool)

(declare-fun res!1079826 () Bool)

(declare-fun e!881783 () Bool)

(assert (=> d!166301 (=> res!1079826 e!881783)))

(assert (=> d!166301 (= res!1079826 (or (is-Nil!36858 l!1390) (is-Nil!36858 (t!51767 l!1390))))))

(assert (=> d!166301 (= (isStrictlySorted!1076 l!1390) e!881783)))

(declare-fun b!1580524 () Bool)

(declare-fun e!881784 () Bool)

(assert (=> b!1580524 (= e!881783 e!881784)))

(declare-fun res!1079827 () Bool)

(assert (=> b!1580524 (=> (not res!1079827) (not e!881784))))

(assert (=> b!1580524 (= res!1079827 (bvslt (_1!12813 (h!38401 l!1390)) (_1!12813 (h!38401 (t!51767 l!1390)))))))

(declare-fun b!1580525 () Bool)

(assert (=> b!1580525 (= e!881784 (isStrictlySorted!1076 (t!51767 l!1390)))))

(assert (= (and d!166301 (not res!1079826)) b!1580524))

(assert (= (and b!1580524 res!1079827) b!1580525))

(assert (=> b!1580525 m!1451161))

(assert (=> start!137196 d!166301))

(declare-fun d!166303 () Bool)

(declare-fun res!1079828 () Bool)

(declare-fun e!881785 () Bool)

(assert (=> d!166303 (=> res!1079828 e!881785)))

(assert (=> d!166303 (= res!1079828 (or (is-Nil!36858 (t!51767 l!1390)) (is-Nil!36858 (t!51767 (t!51767 l!1390)))))))

(assert (=> d!166303 (= (isStrictlySorted!1076 (t!51767 l!1390)) e!881785)))

(declare-fun b!1580526 () Bool)

(declare-fun e!881786 () Bool)

(assert (=> b!1580526 (= e!881785 e!881786)))

(declare-fun res!1079829 () Bool)

(assert (=> b!1580526 (=> (not res!1079829) (not e!881786))))

(assert (=> b!1580526 (= res!1079829 (bvslt (_1!12813 (h!38401 (t!51767 l!1390))) (_1!12813 (h!38401 (t!51767 (t!51767 l!1390))))))))

(declare-fun b!1580527 () Bool)

(assert (=> b!1580527 (= e!881786 (isStrictlySorted!1076 (t!51767 (t!51767 l!1390))))))

(assert (= (and d!166303 (not res!1079828)) b!1580526))

(assert (= (and b!1580526 res!1079829) b!1580527))

(declare-fun m!1451195 () Bool)

(assert (=> b!1580527 m!1451195))

(assert (=> b!1580447 d!166303))

(declare-fun d!166305 () Bool)

(assert (=> d!166305 (= (isEmpty!1175 lt!676529) (not (is-Some!911 lt!676529)))))

(assert (=> b!1580448 d!166305))

(declare-fun d!166307 () Bool)

(assert (=> d!166307 (= (unapply!87 l!1390) (ite (is-Nil!36858 l!1390) None!910 (Some!911 (tuple2!25607 (h!38401 l!1390) (t!51767 l!1390)))))))

(assert (=> b!1580448 d!166307))

(declare-fun b!1580532 () Bool)

(declare-fun e!881789 () Bool)

(declare-fun tp!114522 () Bool)

(assert (=> b!1580532 (= e!881789 (and tp_is_empty!39221 tp!114522))))

(assert (=> b!1580450 (= tp!114513 e!881789)))

(assert (= (and b!1580450 (is-Cons!36857 (t!51767 l!1390))) b!1580532))

(push 1)

(assert (not b!1580512))

(assert (not d!166285))

(assert tp_is_empty!39221)

(assert (not b!1580532))

(assert (not b!1580527))

(assert (not b!1580525))

(assert (not b!1580489))

(assert (not b!1580510))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

