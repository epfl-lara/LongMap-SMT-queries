; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137774 () Bool)

(assert start!137774)

(declare-fun b!1582735 () Bool)

(declare-fun res!1081325 () Bool)

(declare-fun e!883384 () Bool)

(assert (=> b!1582735 (=> (not res!1081325) (not e!883384))))

(declare-datatypes ((B!2834 0))(
  ( (B!2835 (val!19779 Int)) )
))
(declare-datatypes ((tuple2!25794 0))(
  ( (tuple2!25795 (_1!12908 (_ BitVec 64)) (_2!12908 B!2834)) )
))
(declare-datatypes ((List!36940 0))(
  ( (Nil!36937) (Cons!36936 (h!38480 tuple2!25794) (t!51846 List!36940)) )
))
(declare-fun l!1065 () List!36940)

(declare-fun isStrictlySorted!1131 (List!36940) Bool)

(assert (=> b!1582735 (= res!1081325 (isStrictlySorted!1131 (t!51846 l!1065)))))

(declare-fun b!1582736 () Bool)

(declare-fun res!1081327 () Bool)

(assert (=> b!1582736 (=> (not res!1081327) (not e!883384))))

(declare-fun key!287 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1582736 (= res!1081327 (and ((_ is Cons!36936) l!1065) (not (= (_1!12908 (h!38480 l!1065)) key!287))))))

(declare-fun b!1582737 () Bool)

(declare-fun e!883385 () Bool)

(declare-fun tp_is_empty!39367 () Bool)

(declare-fun tp!114894 () Bool)

(assert (=> b!1582737 (= e!883385 (and tp_is_empty!39367 tp!114894))))

(declare-fun res!1081329 () Bool)

(assert (=> start!137774 (=> (not res!1081329) (not e!883384))))

(assert (=> start!137774 (= res!1081329 (isStrictlySorted!1131 l!1065))))

(assert (=> start!137774 e!883384))

(assert (=> start!137774 e!883385))

(assert (=> start!137774 true))

(declare-fun b!1582738 () Bool)

(declare-fun res!1081328 () Bool)

(assert (=> b!1582738 (=> (not res!1081328) (not e!883384))))

(declare-fun containsKey!977 (List!36940 (_ BitVec 64)) Bool)

(assert (=> b!1582738 (= res!1081328 (containsKey!977 (t!51846 l!1065) key!287))))

(declare-fun b!1582739 () Bool)

(declare-fun res!1081326 () Bool)

(assert (=> b!1582739 (=> (not res!1081326) (not e!883384))))

(assert (=> b!1582739 (= res!1081326 (containsKey!977 l!1065 key!287))))

(declare-fun b!1582740 () Bool)

(declare-datatypes ((Option!943 0))(
  ( (Some!942 (v!22464 B!2834)) (None!941) )
))
(declare-fun isDefined!608 (Option!943) Bool)

(declare-fun getValueByKey!835 (List!36940 (_ BitVec 64)) Option!943)

(assert (=> b!1582740 (= e!883384 (not (isDefined!608 (getValueByKey!835 l!1065 key!287))))))

(assert (=> b!1582740 (isDefined!608 (getValueByKey!835 (t!51846 l!1065) key!287))))

(declare-datatypes ((Unit!52087 0))(
  ( (Unit!52088) )
))
(declare-fun lt!676868 () Unit!52087)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!553 (List!36940 (_ BitVec 64)) Unit!52087)

(assert (=> b!1582740 (= lt!676868 (lemmaContainsKeyImpliesGetValueByKeyDefined!553 (t!51846 l!1065) key!287))))

(assert (= (and start!137774 res!1081329) b!1582739))

(assert (= (and b!1582739 res!1081326) b!1582736))

(assert (= (and b!1582736 res!1081327) b!1582735))

(assert (= (and b!1582735 res!1081325) b!1582738))

(assert (= (and b!1582738 res!1081328) b!1582740))

(assert (= (and start!137774 ((_ is Cons!36936) l!1065)) b!1582737))

(declare-fun m!1452253 () Bool)

(assert (=> b!1582738 m!1452253))

(declare-fun m!1452255 () Bool)

(assert (=> b!1582735 m!1452255))

(declare-fun m!1452257 () Bool)

(assert (=> start!137774 m!1452257))

(declare-fun m!1452259 () Bool)

(assert (=> b!1582739 m!1452259))

(declare-fun m!1452261 () Bool)

(assert (=> b!1582740 m!1452261))

(declare-fun m!1452263 () Bool)

(assert (=> b!1582740 m!1452263))

(assert (=> b!1582740 m!1452261))

(declare-fun m!1452265 () Bool)

(assert (=> b!1582740 m!1452265))

(declare-fun m!1452267 () Bool)

(assert (=> b!1582740 m!1452267))

(assert (=> b!1582740 m!1452263))

(declare-fun m!1452269 () Bool)

(assert (=> b!1582740 m!1452269))

(check-sat (not b!1582737) tp_is_empty!39367 (not b!1582735) (not b!1582738) (not b!1582739) (not b!1582740) (not start!137774))
(check-sat)
(get-model)

(declare-fun d!166879 () Bool)

(declare-fun res!1081364 () Bool)

(declare-fun e!883402 () Bool)

(assert (=> d!166879 (=> res!1081364 e!883402)))

(assert (=> d!166879 (= res!1081364 (and ((_ is Cons!36936) l!1065) (= (_1!12908 (h!38480 l!1065)) key!287)))))

(assert (=> d!166879 (= (containsKey!977 l!1065 key!287) e!883402)))

(declare-fun b!1582781 () Bool)

(declare-fun e!883403 () Bool)

(assert (=> b!1582781 (= e!883402 e!883403)))

(declare-fun res!1081365 () Bool)

(assert (=> b!1582781 (=> (not res!1081365) (not e!883403))))

(assert (=> b!1582781 (= res!1081365 (and (or (not ((_ is Cons!36936) l!1065)) (bvsle (_1!12908 (h!38480 l!1065)) key!287)) ((_ is Cons!36936) l!1065) (bvslt (_1!12908 (h!38480 l!1065)) key!287)))))

(declare-fun b!1582782 () Bool)

(assert (=> b!1582782 (= e!883403 (containsKey!977 (t!51846 l!1065) key!287))))

(assert (= (and d!166879 (not res!1081364)) b!1582781))

(assert (= (and b!1582781 res!1081365) b!1582782))

(assert (=> b!1582782 m!1452253))

(assert (=> b!1582739 d!166879))

(declare-fun d!166885 () Bool)

(declare-fun res!1081366 () Bool)

(declare-fun e!883404 () Bool)

(assert (=> d!166885 (=> res!1081366 e!883404)))

(assert (=> d!166885 (= res!1081366 (and ((_ is Cons!36936) (t!51846 l!1065)) (= (_1!12908 (h!38480 (t!51846 l!1065))) key!287)))))

(assert (=> d!166885 (= (containsKey!977 (t!51846 l!1065) key!287) e!883404)))

(declare-fun b!1582783 () Bool)

(declare-fun e!883405 () Bool)

(assert (=> b!1582783 (= e!883404 e!883405)))

(declare-fun res!1081367 () Bool)

(assert (=> b!1582783 (=> (not res!1081367) (not e!883405))))

(assert (=> b!1582783 (= res!1081367 (and (or (not ((_ is Cons!36936) (t!51846 l!1065))) (bvsle (_1!12908 (h!38480 (t!51846 l!1065))) key!287)) ((_ is Cons!36936) (t!51846 l!1065)) (bvslt (_1!12908 (h!38480 (t!51846 l!1065))) key!287)))))

(declare-fun b!1582784 () Bool)

(assert (=> b!1582784 (= e!883405 (containsKey!977 (t!51846 (t!51846 l!1065)) key!287))))

(assert (= (and d!166885 (not res!1081366)) b!1582783))

(assert (= (and b!1582783 res!1081367) b!1582784))

(declare-fun m!1452307 () Bool)

(assert (=> b!1582784 m!1452307))

(assert (=> b!1582738 d!166885))

(declare-fun d!166887 () Bool)

(declare-fun isEmpty!1191 (Option!943) Bool)

(assert (=> d!166887 (= (isDefined!608 (getValueByKey!835 l!1065 key!287)) (not (isEmpty!1191 (getValueByKey!835 l!1065 key!287))))))

(declare-fun bs!45840 () Bool)

(assert (= bs!45840 d!166887))

(assert (=> bs!45840 m!1452261))

(declare-fun m!1452309 () Bool)

(assert (=> bs!45840 m!1452309))

(assert (=> b!1582740 d!166887))

(declare-fun b!1582808 () Bool)

(declare-fun e!883424 () Option!943)

(declare-fun e!883425 () Option!943)

(assert (=> b!1582808 (= e!883424 e!883425)))

(declare-fun c!146600 () Bool)

(assert (=> b!1582808 (= c!146600 (and ((_ is Cons!36936) l!1065) (not (= (_1!12908 (h!38480 l!1065)) key!287))))))

(declare-fun b!1582807 () Bool)

(assert (=> b!1582807 (= e!883424 (Some!942 (_2!12908 (h!38480 l!1065))))))

(declare-fun d!166889 () Bool)

(declare-fun c!146599 () Bool)

(assert (=> d!166889 (= c!146599 (and ((_ is Cons!36936) l!1065) (= (_1!12908 (h!38480 l!1065)) key!287)))))

(assert (=> d!166889 (= (getValueByKey!835 l!1065 key!287) e!883424)))

(declare-fun b!1582810 () Bool)

(assert (=> b!1582810 (= e!883425 None!941)))

(declare-fun b!1582809 () Bool)

(assert (=> b!1582809 (= e!883425 (getValueByKey!835 (t!51846 l!1065) key!287))))

(assert (= (and d!166889 c!146599) b!1582807))

(assert (= (and d!166889 (not c!146599)) b!1582808))

(assert (= (and b!1582808 c!146600) b!1582809))

(assert (= (and b!1582808 (not c!146600)) b!1582810))

(assert (=> b!1582809 m!1452263))

(assert (=> b!1582740 d!166889))

(declare-fun b!1582812 () Bool)

(declare-fun e!883426 () Option!943)

(declare-fun e!883427 () Option!943)

(assert (=> b!1582812 (= e!883426 e!883427)))

(declare-fun c!146602 () Bool)

(assert (=> b!1582812 (= c!146602 (and ((_ is Cons!36936) (t!51846 l!1065)) (not (= (_1!12908 (h!38480 (t!51846 l!1065))) key!287))))))

(declare-fun b!1582811 () Bool)

(assert (=> b!1582811 (= e!883426 (Some!942 (_2!12908 (h!38480 (t!51846 l!1065)))))))

(declare-fun d!166897 () Bool)

(declare-fun c!146601 () Bool)

(assert (=> d!166897 (= c!146601 (and ((_ is Cons!36936) (t!51846 l!1065)) (= (_1!12908 (h!38480 (t!51846 l!1065))) key!287)))))

(assert (=> d!166897 (= (getValueByKey!835 (t!51846 l!1065) key!287) e!883426)))

(declare-fun b!1582814 () Bool)

(assert (=> b!1582814 (= e!883427 None!941)))

(declare-fun b!1582813 () Bool)

(assert (=> b!1582813 (= e!883427 (getValueByKey!835 (t!51846 (t!51846 l!1065)) key!287))))

(assert (= (and d!166897 c!146601) b!1582811))

(assert (= (and d!166897 (not c!146601)) b!1582812))

(assert (= (and b!1582812 c!146602) b!1582813))

(assert (= (and b!1582812 (not c!146602)) b!1582814))

(declare-fun m!1452315 () Bool)

(assert (=> b!1582813 m!1452315))

(assert (=> b!1582740 d!166897))

(declare-fun d!166899 () Bool)

(assert (=> d!166899 (= (isDefined!608 (getValueByKey!835 (t!51846 l!1065) key!287)) (not (isEmpty!1191 (getValueByKey!835 (t!51846 l!1065) key!287))))))

(declare-fun bs!45841 () Bool)

(assert (= bs!45841 d!166899))

(assert (=> bs!45841 m!1452263))

(declare-fun m!1452317 () Bool)

(assert (=> bs!45841 m!1452317))

(assert (=> b!1582740 d!166899))

(declare-fun d!166901 () Bool)

(assert (=> d!166901 (isDefined!608 (getValueByKey!835 (t!51846 l!1065) key!287))))

(declare-fun lt!676877 () Unit!52087)

(declare-fun choose!2113 (List!36940 (_ BitVec 64)) Unit!52087)

(assert (=> d!166901 (= lt!676877 (choose!2113 (t!51846 l!1065) key!287))))

(declare-fun e!883440 () Bool)

(assert (=> d!166901 e!883440))

(declare-fun res!1081394 () Bool)

(assert (=> d!166901 (=> (not res!1081394) (not e!883440))))

(assert (=> d!166901 (= res!1081394 (isStrictlySorted!1131 (t!51846 l!1065)))))

(assert (=> d!166901 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!553 (t!51846 l!1065) key!287) lt!676877)))

(declare-fun b!1582827 () Bool)

(assert (=> b!1582827 (= e!883440 (containsKey!977 (t!51846 l!1065) key!287))))

(assert (= (and d!166901 res!1081394) b!1582827))

(assert (=> d!166901 m!1452263))

(assert (=> d!166901 m!1452263))

(assert (=> d!166901 m!1452269))

(declare-fun m!1452321 () Bool)

(assert (=> d!166901 m!1452321))

(assert (=> d!166901 m!1452255))

(assert (=> b!1582827 m!1452253))

(assert (=> b!1582740 d!166901))

(declare-fun d!166905 () Bool)

(declare-fun res!1081403 () Bool)

(declare-fun e!883449 () Bool)

(assert (=> d!166905 (=> res!1081403 e!883449)))

(assert (=> d!166905 (= res!1081403 (or ((_ is Nil!36937) (t!51846 l!1065)) ((_ is Nil!36937) (t!51846 (t!51846 l!1065)))))))

(assert (=> d!166905 (= (isStrictlySorted!1131 (t!51846 l!1065)) e!883449)))

(declare-fun b!1582836 () Bool)

(declare-fun e!883450 () Bool)

(assert (=> b!1582836 (= e!883449 e!883450)))

(declare-fun res!1081404 () Bool)

(assert (=> b!1582836 (=> (not res!1081404) (not e!883450))))

(assert (=> b!1582836 (= res!1081404 (bvslt (_1!12908 (h!38480 (t!51846 l!1065))) (_1!12908 (h!38480 (t!51846 (t!51846 l!1065))))))))

(declare-fun b!1582837 () Bool)

(assert (=> b!1582837 (= e!883450 (isStrictlySorted!1131 (t!51846 (t!51846 l!1065))))))

(assert (= (and d!166905 (not res!1081403)) b!1582836))

(assert (= (and b!1582836 res!1081404) b!1582837))

(declare-fun m!1452329 () Bool)

(assert (=> b!1582837 m!1452329))

(assert (=> b!1582735 d!166905))

(declare-fun d!166915 () Bool)

(declare-fun res!1081405 () Bool)

(declare-fun e!883451 () Bool)

(assert (=> d!166915 (=> res!1081405 e!883451)))

(assert (=> d!166915 (= res!1081405 (or ((_ is Nil!36937) l!1065) ((_ is Nil!36937) (t!51846 l!1065))))))

(assert (=> d!166915 (= (isStrictlySorted!1131 l!1065) e!883451)))

(declare-fun b!1582838 () Bool)

(declare-fun e!883452 () Bool)

(assert (=> b!1582838 (= e!883451 e!883452)))

(declare-fun res!1081406 () Bool)

(assert (=> b!1582838 (=> (not res!1081406) (not e!883452))))

(assert (=> b!1582838 (= res!1081406 (bvslt (_1!12908 (h!38480 l!1065)) (_1!12908 (h!38480 (t!51846 l!1065)))))))

(declare-fun b!1582839 () Bool)

(assert (=> b!1582839 (= e!883452 (isStrictlySorted!1131 (t!51846 l!1065)))))

(assert (= (and d!166915 (not res!1081405)) b!1582838))

(assert (= (and b!1582838 res!1081406) b!1582839))

(assert (=> b!1582839 m!1452255))

(assert (=> start!137774 d!166915))

(declare-fun b!1582852 () Bool)

(declare-fun e!883459 () Bool)

(declare-fun tp!114903 () Bool)

(assert (=> b!1582852 (= e!883459 (and tp_is_empty!39367 tp!114903))))

(assert (=> b!1582737 (= tp!114894 e!883459)))

(assert (= (and b!1582737 ((_ is Cons!36936) (t!51846 l!1065))) b!1582852))

(check-sat tp_is_empty!39367 (not d!166899) (not d!166901) (not d!166887) (not b!1582852) (not b!1582782) (not b!1582813) (not b!1582839) (not b!1582827) (not b!1582837) (not b!1582784) (not b!1582809))
(check-sat)
