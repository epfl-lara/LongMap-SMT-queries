; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107032 () Bool)

(assert start!107032)

(declare-fun res!844299 () Bool)

(declare-fun e!722942 () Bool)

(assert (=> start!107032 (=> (not res!844299) (not e!722942))))

(declare-datatypes ((B!2088 0))(
  ( (B!2089 (val!16379 Int)) )
))
(declare-datatypes ((tuple2!21286 0))(
  ( (tuple2!21287 (_1!10654 (_ BitVec 64)) (_2!10654 B!2088)) )
))
(declare-datatypes ((List!28407 0))(
  ( (Nil!28404) (Cons!28403 (h!29621 tuple2!21286) (t!41926 List!28407)) )
))
(declare-fun l!874 () List!28407)

(declare-fun isStrictlySorted!816 (List!28407) Bool)

(assert (=> start!107032 (= res!844299 (isStrictlySorted!816 l!874))))

(assert (=> start!107032 e!722942))

(declare-fun e!722943 () Bool)

(assert (=> start!107032 e!722943))

(assert (=> start!107032 true))

(declare-fun b!1268852 () Bool)

(declare-fun res!844301 () Bool)

(assert (=> b!1268852 (=> (not res!844301) (not e!722942))))

(declare-fun key!235 () (_ BitVec 64))

(declare-fun containsKey!687 (List!28407 (_ BitVec 64)) Bool)

(assert (=> b!1268852 (= res!844301 (not (containsKey!687 l!874 key!235)))))

(declare-fun b!1268853 () Bool)

(declare-fun tp_is_empty!32609 () Bool)

(declare-fun tp!96629 () Bool)

(assert (=> b!1268853 (= e!722943 (and tp_is_empty!32609 tp!96629))))

(declare-fun b!1268854 () Bool)

(declare-fun res!844300 () Bool)

(assert (=> b!1268854 (=> (not res!844300) (not e!722942))))

(assert (=> b!1268854 (= res!844300 (isStrictlySorted!816 (t!41926 l!874)))))

(declare-fun b!1268855 () Bool)

(declare-fun ListPrimitiveSize!162 (List!28407) Int)

(assert (=> b!1268855 (= e!722942 (>= (ListPrimitiveSize!162 (t!41926 l!874)) (ListPrimitiveSize!162 l!874)))))

(declare-fun b!1268856 () Bool)

(declare-fun res!844298 () Bool)

(assert (=> b!1268856 (=> (not res!844298) (not e!722942))))

(assert (=> b!1268856 (= res!844298 (is-Cons!28403 l!874))))

(declare-fun b!1268857 () Bool)

(declare-fun res!844297 () Bool)

(assert (=> b!1268857 (=> (not res!844297) (not e!722942))))

(assert (=> b!1268857 (= res!844297 (not (containsKey!687 (t!41926 l!874) key!235)))))

(assert (= (and start!107032 res!844299) b!1268852))

(assert (= (and b!1268852 res!844301) b!1268856))

(assert (= (and b!1268856 res!844298) b!1268854))

(assert (= (and b!1268854 res!844300) b!1268857))

(assert (= (and b!1268857 res!844297) b!1268855))

(assert (= (and start!107032 (is-Cons!28403 l!874)) b!1268853))

(declare-fun m!1168393 () Bool)

(assert (=> b!1268854 m!1168393))

(declare-fun m!1168395 () Bool)

(assert (=> b!1268857 m!1168395))

(declare-fun m!1168397 () Bool)

(assert (=> b!1268855 m!1168397))

(declare-fun m!1168399 () Bool)

(assert (=> b!1268855 m!1168399))

(declare-fun m!1168401 () Bool)

(assert (=> b!1268852 m!1168401))

(declare-fun m!1168403 () Bool)

(assert (=> start!107032 m!1168403))

(push 1)

(assert tp_is_empty!32609)

(assert (not b!1268855))

(assert (not b!1268854))

(assert (not b!1268857))

(assert (not b!1268853))

(assert (not b!1268852))

(assert (not start!107032))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!139939 () Bool)

(declare-fun res!844320 () Bool)

(declare-fun e!722962 () Bool)

(assert (=> d!139939 (=> res!844320 e!722962)))

(assert (=> d!139939 (= res!844320 (and (is-Cons!28403 (t!41926 l!874)) (= (_1!10654 (h!29621 (t!41926 l!874))) key!235)))))

(assert (=> d!139939 (= (containsKey!687 (t!41926 l!874) key!235) e!722962)))

(declare-fun b!1268876 () Bool)

(declare-fun e!722963 () Bool)

(assert (=> b!1268876 (= e!722962 e!722963)))

(declare-fun res!844321 () Bool)

(assert (=> b!1268876 (=> (not res!844321) (not e!722963))))

(assert (=> b!1268876 (= res!844321 (and (or (not (is-Cons!28403 (t!41926 l!874))) (bvsle (_1!10654 (h!29621 (t!41926 l!874))) key!235)) (is-Cons!28403 (t!41926 l!874)) (bvslt (_1!10654 (h!29621 (t!41926 l!874))) key!235)))))

(declare-fun b!1268877 () Bool)

(assert (=> b!1268877 (= e!722963 (containsKey!687 (t!41926 (t!41926 l!874)) key!235))))

(assert (= (and d!139939 (not res!844320)) b!1268876))

(assert (= (and b!1268876 res!844321) b!1268877))

(declare-fun m!1168409 () Bool)

(assert (=> b!1268877 m!1168409))

(assert (=> b!1268857 d!139939))

(declare-fun d!139947 () Bool)

(declare-fun res!844322 () Bool)

(declare-fun e!722964 () Bool)

(assert (=> d!139947 (=> res!844322 e!722964)))

(assert (=> d!139947 (= res!844322 (and (is-Cons!28403 l!874) (= (_1!10654 (h!29621 l!874)) key!235)))))

(assert (=> d!139947 (= (containsKey!687 l!874 key!235) e!722964)))

(declare-fun b!1268878 () Bool)

(declare-fun e!722965 () Bool)

(assert (=> b!1268878 (= e!722964 e!722965)))

(declare-fun res!844323 () Bool)

(assert (=> b!1268878 (=> (not res!844323) (not e!722965))))

(assert (=> b!1268878 (= res!844323 (and (or (not (is-Cons!28403 l!874)) (bvsle (_1!10654 (h!29621 l!874)) key!235)) (is-Cons!28403 l!874) (bvslt (_1!10654 (h!29621 l!874)) key!235)))))

(declare-fun b!1268879 () Bool)

(assert (=> b!1268879 (= e!722965 (containsKey!687 (t!41926 l!874) key!235))))

(assert (= (and d!139947 (not res!844322)) b!1268878))

(assert (= (and b!1268878 res!844323) b!1268879))

(assert (=> b!1268879 m!1168395))

(assert (=> b!1268852 d!139947))

(declare-fun d!139949 () Bool)

(declare-fun res!844342 () Bool)

(declare-fun e!722984 () Bool)

(assert (=> d!139949 (=> res!844342 e!722984)))

(assert (=> d!139949 (= res!844342 (or (is-Nil!28404 (t!41926 l!874)) (is-Nil!28404 (t!41926 (t!41926 l!874)))))))

(assert (=> d!139949 (= (isStrictlySorted!816 (t!41926 l!874)) e!722984)))

(declare-fun b!1268898 () Bool)

(declare-fun e!722985 () Bool)

(assert (=> b!1268898 (= e!722984 e!722985)))

(declare-fun res!844343 () Bool)

(assert (=> b!1268898 (=> (not res!844343) (not e!722985))))

(assert (=> b!1268898 (= res!844343 (bvslt (_1!10654 (h!29621 (t!41926 l!874))) (_1!10654 (h!29621 (t!41926 (t!41926 l!874))))))))

(declare-fun b!1268899 () Bool)

(assert (=> b!1268899 (= e!722985 (isStrictlySorted!816 (t!41926 (t!41926 l!874))))))

(assert (= (and d!139949 (not res!844342)) b!1268898))

(assert (= (and b!1268898 res!844343) b!1268899))

(declare-fun m!1168413 () Bool)

(assert (=> b!1268899 m!1168413))

(assert (=> b!1268854 d!139949))

(declare-fun d!139957 () Bool)

(declare-fun lt!574822 () Int)

(assert (=> d!139957 (>= lt!574822 0)))

(declare-fun e!722998 () Int)

(assert (=> d!139957 (= lt!574822 e!722998)))

(declare-fun c!123971 () Bool)

(assert (=> d!139957 (= c!123971 (is-Nil!28404 (t!41926 l!874)))))

(assert (=> d!139957 (= (ListPrimitiveSize!162 (t!41926 l!874)) lt!574822)))

(declare-fun b!1268920 () Bool)

(assert (=> b!1268920 (= e!722998 0)))

(declare-fun b!1268921 () Bool)

(assert (=> b!1268921 (= e!722998 (+ 1 (ListPrimitiveSize!162 (t!41926 (t!41926 l!874)))))))

(assert (= (and d!139957 c!123971) b!1268920))

(assert (= (and d!139957 (not c!123971)) b!1268921))

(declare-fun m!1168419 () Bool)

(assert (=> b!1268921 m!1168419))

(assert (=> b!1268855 d!139957))

(declare-fun d!139965 () Bool)

(declare-fun lt!574824 () Int)

(assert (=> d!139965 (>= lt!574824 0)))

(declare-fun e!723000 () Int)

(assert (=> d!139965 (= lt!574824 e!723000)))

(declare-fun c!123973 () Bool)

(assert (=> d!139965 (= c!123973 (is-Nil!28404 l!874))))

(assert (=> d!139965 (= (ListPrimitiveSize!162 l!874) lt!574824)))

(declare-fun b!1268924 () Bool)

(assert (=> b!1268924 (= e!723000 0)))

(declare-fun b!1268925 () Bool)

(assert (=> b!1268925 (= e!723000 (+ 1 (ListPrimitiveSize!162 (t!41926 l!874))))))

(assert (= (and d!139965 c!123973) b!1268924))

(assert (= (and d!139965 (not c!123973)) b!1268925))

(assert (=> b!1268925 m!1168397))

(assert (=> b!1268855 d!139965))

(declare-fun d!139969 () Bool)

(declare-fun res!844348 () Bool)

(declare-fun e!723004 () Bool)

(assert (=> d!139969 (=> res!844348 e!723004)))

(assert (=> d!139969 (= res!844348 (or (is-Nil!28404 l!874) (is-Nil!28404 (t!41926 l!874))))))

(assert (=> d!139969 (= (isStrictlySorted!816 l!874) e!723004)))

(declare-fun b!1268932 () Bool)

(declare-fun e!723005 () Bool)

(assert (=> b!1268932 (= e!723004 e!723005)))

(declare-fun res!844349 () Bool)

(assert (=> b!1268932 (=> (not res!844349) (not e!723005))))

(assert (=> b!1268932 (= res!844349 (bvslt (_1!10654 (h!29621 l!874)) (_1!10654 (h!29621 (t!41926 l!874)))))))

(declare-fun b!1268933 () Bool)

(assert (=> b!1268933 (= e!723005 (isStrictlySorted!816 (t!41926 l!874)))))

(assert (= (and d!139969 (not res!844348)) b!1268932))

(assert (= (and b!1268932 res!844349) b!1268933))

(assert (=> b!1268933 m!1168393))

(assert (=> start!107032 d!139969))

(declare-fun b!1268944 () Bool)

(declare-fun e!723012 () Bool)

(declare-fun tp!96638 () Bool)

(assert (=> b!1268944 (= e!723012 (and tp_is_empty!32609 tp!96638))))

(assert (=> b!1268853 (= tp!96629 e!723012)))

(assert (= (and b!1268853 (is-Cons!28403 (t!41926 l!874))) b!1268944))

(push 1)

(assert (not b!1268933))

(assert (not b!1268944))

(assert (not b!1268879))

(assert tp_is_empty!32609)

(assert (not b!1268877))

(assert (not b!1268899))

(assert (not b!1268921))

(assert (not b!1268925))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

