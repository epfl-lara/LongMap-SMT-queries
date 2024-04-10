; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137768 () Bool)

(assert start!137768)

(declare-fun b!1582812 () Bool)

(declare-fun res!1081290 () Bool)

(declare-fun e!883422 () Bool)

(assert (=> b!1582812 (=> (not res!1081290) (not e!883422))))

(declare-datatypes ((B!2824 0))(
  ( (B!2825 (val!19774 Int)) )
))
(declare-datatypes ((tuple2!25716 0))(
  ( (tuple2!25717 (_1!12869 (_ BitVec 64)) (_2!12869 B!2824)) )
))
(declare-datatypes ((List!36894 0))(
  ( (Nil!36891) (Cons!36890 (h!38433 tuple2!25716) (t!51808 List!36894)) )
))
(declare-fun l!1065 () List!36894)

(declare-fun key!287 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1582812 (= res!1081290 (and ((_ is Cons!36890) l!1065) (not (= (_1!12869 (h!38433 l!1065)) key!287))))))

(declare-fun b!1582813 () Bool)

(declare-fun e!883424 () Bool)

(assert (=> b!1582813 (= e!883422 e!883424)))

(declare-fun res!1081287 () Bool)

(assert (=> b!1582813 (=> res!1081287 e!883424)))

(declare-fun isStrictlySorted!1128 (List!36894) Bool)

(assert (=> b!1582813 (= res!1081287 (not (isStrictlySorted!1128 (t!51808 l!1065))))))

(declare-fun res!1081288 () Bool)

(assert (=> start!137768 (=> (not res!1081288) (not e!883422))))

(assert (=> start!137768 (= res!1081288 (isStrictlySorted!1128 l!1065))))

(assert (=> start!137768 e!883422))

(declare-fun e!883423 () Bool)

(assert (=> start!137768 e!883423))

(assert (=> start!137768 true))

(declare-fun b!1582814 () Bool)

(declare-fun tp_is_empty!39357 () Bool)

(declare-fun tp!114860 () Bool)

(assert (=> b!1582814 (= e!883423 (and tp_is_empty!39357 tp!114860))))

(declare-fun b!1582815 () Bool)

(declare-fun res!1081289 () Bool)

(assert (=> b!1582815 (=> (not res!1081289) (not e!883422))))

(declare-fun containsKey!974 (List!36894 (_ BitVec 64)) Bool)

(assert (=> b!1582815 (= res!1081289 (containsKey!974 l!1065 key!287))))

(declare-fun b!1582816 () Bool)

(assert (=> b!1582816 (= e!883424 (not (containsKey!974 (t!51808 l!1065) key!287)))))

(assert (= (and start!137768 res!1081288) b!1582815))

(assert (= (and b!1582815 res!1081289) b!1582812))

(assert (= (and b!1582812 res!1081290) b!1582813))

(assert (= (and b!1582813 (not res!1081287)) b!1582816))

(assert (= (and start!137768 ((_ is Cons!36890) l!1065)) b!1582814))

(declare-fun m!1453051 () Bool)

(assert (=> b!1582813 m!1453051))

(declare-fun m!1453053 () Bool)

(assert (=> start!137768 m!1453053))

(declare-fun m!1453055 () Bool)

(assert (=> b!1582815 m!1453055))

(declare-fun m!1453057 () Bool)

(assert (=> b!1582816 m!1453057))

(check-sat (not b!1582813) (not b!1582816) (not start!137768) (not b!1582814) (not b!1582815) tp_is_empty!39357)
(check-sat)
(get-model)

(declare-fun d!167053 () Bool)

(declare-fun res!1081307 () Bool)

(declare-fun e!883438 () Bool)

(assert (=> d!167053 (=> res!1081307 e!883438)))

(assert (=> d!167053 (= res!1081307 (or ((_ is Nil!36891) l!1065) ((_ is Nil!36891) (t!51808 l!1065))))))

(assert (=> d!167053 (= (isStrictlySorted!1128 l!1065) e!883438)))

(declare-fun b!1582836 () Bool)

(declare-fun e!883439 () Bool)

(assert (=> b!1582836 (= e!883438 e!883439)))

(declare-fun res!1081308 () Bool)

(assert (=> b!1582836 (=> (not res!1081308) (not e!883439))))

(assert (=> b!1582836 (= res!1081308 (bvslt (_1!12869 (h!38433 l!1065)) (_1!12869 (h!38433 (t!51808 l!1065)))))))

(declare-fun b!1582837 () Bool)

(assert (=> b!1582837 (= e!883439 (isStrictlySorted!1128 (t!51808 l!1065)))))

(assert (= (and d!167053 (not res!1081307)) b!1582836))

(assert (= (and b!1582836 res!1081308) b!1582837))

(assert (=> b!1582837 m!1453051))

(assert (=> start!137768 d!167053))

(declare-fun d!167057 () Bool)

(declare-fun res!1081309 () Bool)

(declare-fun e!883440 () Bool)

(assert (=> d!167057 (=> res!1081309 e!883440)))

(assert (=> d!167057 (= res!1081309 (or ((_ is Nil!36891) (t!51808 l!1065)) ((_ is Nil!36891) (t!51808 (t!51808 l!1065)))))))

(assert (=> d!167057 (= (isStrictlySorted!1128 (t!51808 l!1065)) e!883440)))

(declare-fun b!1582838 () Bool)

(declare-fun e!883441 () Bool)

(assert (=> b!1582838 (= e!883440 e!883441)))

(declare-fun res!1081310 () Bool)

(assert (=> b!1582838 (=> (not res!1081310) (not e!883441))))

(assert (=> b!1582838 (= res!1081310 (bvslt (_1!12869 (h!38433 (t!51808 l!1065))) (_1!12869 (h!38433 (t!51808 (t!51808 l!1065))))))))

(declare-fun b!1582839 () Bool)

(assert (=> b!1582839 (= e!883441 (isStrictlySorted!1128 (t!51808 (t!51808 l!1065))))))

(assert (= (and d!167057 (not res!1081309)) b!1582838))

(assert (= (and b!1582838 res!1081310) b!1582839))

(declare-fun m!1453067 () Bool)

(assert (=> b!1582839 m!1453067))

(assert (=> b!1582813 d!167057))

(declare-fun d!167059 () Bool)

(declare-fun res!1081327 () Bool)

(declare-fun e!883458 () Bool)

(assert (=> d!167059 (=> res!1081327 e!883458)))

(assert (=> d!167059 (= res!1081327 (and ((_ is Cons!36890) l!1065) (= (_1!12869 (h!38433 l!1065)) key!287)))))

(assert (=> d!167059 (= (containsKey!974 l!1065 key!287) e!883458)))

(declare-fun b!1582856 () Bool)

(declare-fun e!883459 () Bool)

(assert (=> b!1582856 (= e!883458 e!883459)))

(declare-fun res!1081328 () Bool)

(assert (=> b!1582856 (=> (not res!1081328) (not e!883459))))

(assert (=> b!1582856 (= res!1081328 (and (or (not ((_ is Cons!36890) l!1065)) (bvsle (_1!12869 (h!38433 l!1065)) key!287)) ((_ is Cons!36890) l!1065) (bvslt (_1!12869 (h!38433 l!1065)) key!287)))))

(declare-fun b!1582857 () Bool)

(assert (=> b!1582857 (= e!883459 (containsKey!974 (t!51808 l!1065) key!287))))

(assert (= (and d!167059 (not res!1081327)) b!1582856))

(assert (= (and b!1582856 res!1081328) b!1582857))

(assert (=> b!1582857 m!1453057))

(assert (=> b!1582815 d!167059))

(declare-fun d!167069 () Bool)

(declare-fun res!1081333 () Bool)

(declare-fun e!883464 () Bool)

(assert (=> d!167069 (=> res!1081333 e!883464)))

(assert (=> d!167069 (= res!1081333 (and ((_ is Cons!36890) (t!51808 l!1065)) (= (_1!12869 (h!38433 (t!51808 l!1065))) key!287)))))

(assert (=> d!167069 (= (containsKey!974 (t!51808 l!1065) key!287) e!883464)))

(declare-fun b!1582862 () Bool)

(declare-fun e!883465 () Bool)

(assert (=> b!1582862 (= e!883464 e!883465)))

(declare-fun res!1081334 () Bool)

(assert (=> b!1582862 (=> (not res!1081334) (not e!883465))))

(assert (=> b!1582862 (= res!1081334 (and (or (not ((_ is Cons!36890) (t!51808 l!1065))) (bvsle (_1!12869 (h!38433 (t!51808 l!1065))) key!287)) ((_ is Cons!36890) (t!51808 l!1065)) (bvslt (_1!12869 (h!38433 (t!51808 l!1065))) key!287)))))

(declare-fun b!1582863 () Bool)

(assert (=> b!1582863 (= e!883465 (containsKey!974 (t!51808 (t!51808 l!1065)) key!287))))

(assert (= (and d!167069 (not res!1081333)) b!1582862))

(assert (= (and b!1582862 res!1081334) b!1582863))

(declare-fun m!1453073 () Bool)

(assert (=> b!1582863 m!1453073))

(assert (=> b!1582816 d!167069))

(declare-fun b!1582872 () Bool)

(declare-fun e!883472 () Bool)

(declare-fun tp!114866 () Bool)

(assert (=> b!1582872 (= e!883472 (and tp_is_empty!39357 tp!114866))))

(assert (=> b!1582814 (= tp!114860 e!883472)))

(assert (= (and b!1582814 ((_ is Cons!36890) (t!51808 l!1065))) b!1582872))

(check-sat (not b!1582857) (not b!1582863) (not b!1582839) (not b!1582872) tp_is_empty!39357 (not b!1582837))
(check-sat)
