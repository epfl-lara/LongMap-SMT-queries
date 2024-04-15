; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137588 () Bool)

(assert start!137588)

(declare-fun b!1582018 () Bool)

(declare-fun res!1080884 () Bool)

(declare-fun e!882854 () Bool)

(assert (=> b!1582018 (=> (not res!1080884) (not e!882854))))

(declare-datatypes ((B!2750 0))(
  ( (B!2751 (val!19737 Int)) )
))
(declare-datatypes ((tuple2!25710 0))(
  ( (tuple2!25711 (_1!12866 (_ BitVec 64)) (_2!12866 B!2750)) )
))
(declare-datatypes ((List!36898 0))(
  ( (Nil!36895) (Cons!36894 (h!38438 tuple2!25710) (t!51804 List!36898)) )
))
(declare-fun l!1356 () List!36898)

(get-info :version)

(assert (=> b!1582018 (= res!1080884 (not ((_ is Nil!36895) l!1356)))))

(declare-fun b!1582017 () Bool)

(declare-fun res!1080883 () Bool)

(assert (=> b!1582017 (=> (not res!1080883) (not e!882854))))

(declare-fun key!387 () (_ BitVec 64))

(declare-fun containsKey!956 (List!36898 (_ BitVec 64)) Bool)

(assert (=> b!1582017 (= res!1080883 (not (containsKey!956 l!1356 key!387)))))

(declare-fun b!1582019 () Bool)

(declare-fun value!184 () B!2750)

(declare-fun contains!10472 (List!36898 tuple2!25710) Bool)

(assert (=> b!1582019 (= e!882854 (contains!10472 l!1356 (tuple2!25711 key!387 value!184)))))

(declare-datatypes ((Unit!52066 0))(
  ( (Unit!52067) )
))
(declare-fun lt!676784 () Unit!52066)

(declare-fun lemmaNotContainsKeyThenNotContainsTuple!7 (List!36898 (_ BitVec 64) B!2750) Unit!52066)

(assert (=> b!1582019 (= lt!676784 (lemmaNotContainsKeyThenNotContainsTuple!7 (t!51804 l!1356) key!387 value!184))))

(declare-fun b!1582020 () Bool)

(declare-fun e!882853 () Bool)

(declare-fun tp_is_empty!39295 () Bool)

(declare-fun tp!114714 () Bool)

(assert (=> b!1582020 (= e!882853 (and tp_is_empty!39295 tp!114714))))

(declare-fun res!1080885 () Bool)

(assert (=> start!137588 (=> (not res!1080885) (not e!882854))))

(declare-fun isStrictlySorted!1110 (List!36898) Bool)

(assert (=> start!137588 (= res!1080885 (isStrictlySorted!1110 l!1356))))

(assert (=> start!137588 e!882854))

(assert (=> start!137588 e!882853))

(assert (=> start!137588 true))

(assert (=> start!137588 tp_is_empty!39295))

(assert (= (and start!137588 res!1080885) b!1582017))

(assert (= (and b!1582017 res!1080883) b!1582018))

(assert (= (and b!1582018 res!1080884) b!1582019))

(assert (= (and start!137588 ((_ is Cons!36894) l!1356)) b!1582020))

(declare-fun m!1451941 () Bool)

(assert (=> b!1582017 m!1451941))

(declare-fun m!1451943 () Bool)

(assert (=> b!1582019 m!1451943))

(declare-fun m!1451945 () Bool)

(assert (=> b!1582019 m!1451945))

(declare-fun m!1451947 () Bool)

(assert (=> start!137588 m!1451947))

(check-sat (not start!137588) (not b!1582020) tp_is_empty!39295 (not b!1582019) (not b!1582017))
(check-sat)
(get-model)

(declare-fun lt!676798 () Bool)

(declare-fun d!166721 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!848 (List!36898) (InoxSet tuple2!25710))

(assert (=> d!166721 (= lt!676798 (select (content!848 l!1356) (tuple2!25711 key!387 value!184)))))

(declare-fun e!882880 () Bool)

(assert (=> d!166721 (= lt!676798 e!882880)))

(declare-fun res!1080919 () Bool)

(assert (=> d!166721 (=> (not res!1080919) (not e!882880))))

(assert (=> d!166721 (= res!1080919 ((_ is Cons!36894) l!1356))))

(assert (=> d!166721 (= (contains!10472 l!1356 (tuple2!25711 key!387 value!184)) lt!676798)))

(declare-fun b!1582057 () Bool)

(declare-fun e!882879 () Bool)

(assert (=> b!1582057 (= e!882880 e!882879)))

(declare-fun res!1080916 () Bool)

(assert (=> b!1582057 (=> res!1080916 e!882879)))

(assert (=> b!1582057 (= res!1080916 (= (h!38438 l!1356) (tuple2!25711 key!387 value!184)))))

(declare-fun b!1582059 () Bool)

(assert (=> b!1582059 (= e!882879 (contains!10472 (t!51804 l!1356) (tuple2!25711 key!387 value!184)))))

(assert (= (and d!166721 res!1080919) b!1582057))

(assert (= (and b!1582057 (not res!1080916)) b!1582059))

(declare-fun m!1451966 () Bool)

(assert (=> d!166721 m!1451966))

(declare-fun m!1451971 () Bool)

(assert (=> d!166721 m!1451971))

(declare-fun m!1451975 () Bool)

(assert (=> b!1582059 m!1451975))

(assert (=> b!1582019 d!166721))

(declare-fun d!166727 () Bool)

(assert (=> d!166727 (not (contains!10472 (t!51804 l!1356) (tuple2!25711 key!387 value!184)))))

(declare-fun lt!676807 () Unit!52066)

(declare-fun choose!2110 (List!36898 (_ BitVec 64) B!2750) Unit!52066)

(assert (=> d!166727 (= lt!676807 (choose!2110 (t!51804 l!1356) key!387 value!184))))

(declare-fun e!882892 () Bool)

(assert (=> d!166727 e!882892))

(declare-fun res!1080929 () Bool)

(assert (=> d!166727 (=> (not res!1080929) (not e!882892))))

(assert (=> d!166727 (= res!1080929 (isStrictlySorted!1110 (t!51804 l!1356)))))

(assert (=> d!166727 (= (lemmaNotContainsKeyThenNotContainsTuple!7 (t!51804 l!1356) key!387 value!184) lt!676807)))

(declare-fun b!1582070 () Bool)

(assert (=> b!1582070 (= e!882892 (not (containsKey!956 (t!51804 l!1356) key!387)))))

(assert (= (and d!166727 res!1080929) b!1582070))

(assert (=> d!166727 m!1451975))

(declare-fun m!1451983 () Bool)

(assert (=> d!166727 m!1451983))

(declare-fun m!1451987 () Bool)

(assert (=> d!166727 m!1451987))

(declare-fun m!1451991 () Bool)

(assert (=> b!1582070 m!1451991))

(assert (=> b!1582019 d!166727))

(declare-fun d!166731 () Bool)

(declare-fun res!1080943 () Bool)

(declare-fun e!882906 () Bool)

(assert (=> d!166731 (=> res!1080943 e!882906)))

(assert (=> d!166731 (= res!1080943 (and ((_ is Cons!36894) l!1356) (= (_1!12866 (h!38438 l!1356)) key!387)))))

(assert (=> d!166731 (= (containsKey!956 l!1356 key!387) e!882906)))

(declare-fun b!1582084 () Bool)

(declare-fun e!882907 () Bool)

(assert (=> b!1582084 (= e!882906 e!882907)))

(declare-fun res!1080944 () Bool)

(assert (=> b!1582084 (=> (not res!1080944) (not e!882907))))

(assert (=> b!1582084 (= res!1080944 (and (or (not ((_ is Cons!36894) l!1356)) (bvsle (_1!12866 (h!38438 l!1356)) key!387)) ((_ is Cons!36894) l!1356) (bvslt (_1!12866 (h!38438 l!1356)) key!387)))))

(declare-fun b!1582085 () Bool)

(assert (=> b!1582085 (= e!882907 (containsKey!956 (t!51804 l!1356) key!387))))

(assert (= (and d!166731 (not res!1080943)) b!1582084))

(assert (= (and b!1582084 res!1080944) b!1582085))

(assert (=> b!1582085 m!1451991))

(assert (=> b!1582017 d!166731))

(declare-fun d!166737 () Bool)

(declare-fun res!1080961 () Bool)

(declare-fun e!882924 () Bool)

(assert (=> d!166737 (=> res!1080961 e!882924)))

(assert (=> d!166737 (= res!1080961 (or ((_ is Nil!36895) l!1356) ((_ is Nil!36895) (t!51804 l!1356))))))

(assert (=> d!166737 (= (isStrictlySorted!1110 l!1356) e!882924)))

(declare-fun b!1582102 () Bool)

(declare-fun e!882925 () Bool)

(assert (=> b!1582102 (= e!882924 e!882925)))

(declare-fun res!1080962 () Bool)

(assert (=> b!1582102 (=> (not res!1080962) (not e!882925))))

(assert (=> b!1582102 (= res!1080962 (bvslt (_1!12866 (h!38438 l!1356)) (_1!12866 (h!38438 (t!51804 l!1356)))))))

(declare-fun b!1582103 () Bool)

(assert (=> b!1582103 (= e!882925 (isStrictlySorted!1110 (t!51804 l!1356)))))

(assert (= (and d!166737 (not res!1080961)) b!1582102))

(assert (= (and b!1582102 res!1080962) b!1582103))

(assert (=> b!1582103 m!1451987))

(assert (=> start!137588 d!166737))

(declare-fun b!1582121 () Bool)

(declare-fun e!882937 () Bool)

(declare-fun tp!114728 () Bool)

(assert (=> b!1582121 (= e!882937 (and tp_is_empty!39295 tp!114728))))

(assert (=> b!1582020 (= tp!114714 e!882937)))

(assert (= (and b!1582020 ((_ is Cons!36894) (t!51804 l!1356))) b!1582121))

(check-sat (not b!1582103) (not b!1582070) tp_is_empty!39295 (not b!1582085) (not b!1582059) (not d!166721) (not d!166727) (not b!1582121))
(check-sat)
