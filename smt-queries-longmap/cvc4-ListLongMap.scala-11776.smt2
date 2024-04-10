; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138306 () Bool)

(assert start!138306)

(declare-fun res!1083043 () Bool)

(declare-fun e!885471 () Bool)

(assert (=> start!138306 (=> (not res!1083043) (not e!885471))))

(declare-datatypes ((B!3000 0))(
  ( (B!3001 (val!19862 Int)) )
))
(declare-datatypes ((tuple2!25892 0))(
  ( (tuple2!25893 (_1!12957 (_ BitVec 64)) (_2!12957 B!3000)) )
))
(declare-datatypes ((List!36982 0))(
  ( (Nil!36979) (Cons!36978 (h!38521 tuple2!25892) (t!51906 List!36982)) )
))
(declare-fun l!556 () List!36982)

(declare-fun isStrictlySorted!1204 (List!36982) Bool)

(assert (=> start!138306 (= res!1083043 (isStrictlySorted!1204 l!556))))

(assert (=> start!138306 e!885471))

(declare-fun e!885469 () Bool)

(assert (=> start!138306 e!885469))

(assert (=> start!138306 true))

(declare-fun tp_is_empty!39533 () Bool)

(assert (=> start!138306 tp_is_empty!39533))

(declare-fun b!1585849 () Bool)

(declare-fun tp!115305 () Bool)

(assert (=> b!1585849 (= e!885469 (and tp_is_empty!39533 tp!115305))))

(declare-fun b!1585850 () Bool)

(declare-fun res!1083044 () Bool)

(assert (=> b!1585850 (=> (not res!1083044) (not e!885471))))

(declare-fun newKey!21 () (_ BitVec 64))

(assert (=> b!1585850 (= res!1083044 (and (or (not (is-Cons!36978 l!556)) (bvsge (_1!12957 (h!38521 l!556)) newKey!21)) (not (= (_1!12957 (h!38521 l!556)) newKey!21)) (is-Cons!36978 l!556) (bvsgt (_1!12957 (h!38521 l!556)) newKey!21)))))

(declare-fun b!1585851 () Bool)

(declare-fun res!1083041 () Bool)

(declare-fun e!885470 () Bool)

(assert (=> b!1585851 (=> res!1083041 e!885470)))

(declare-fun lt!677451 () List!36982)

(declare-fun containsKey!1017 (List!36982 (_ BitVec 64)) Bool)

(assert (=> b!1585851 (= res!1083041 (not (containsKey!1017 lt!677451 newKey!21)))))

(declare-fun b!1585852 () Bool)

(declare-fun lt!677450 () tuple2!25892)

(declare-fun contains!10540 (List!36982 tuple2!25892) Bool)

(assert (=> b!1585852 (= e!885470 (not (contains!10540 lt!677451 lt!677450)))))

(declare-fun b!1585853 () Bool)

(assert (=> b!1585853 (= e!885471 e!885470)))

(declare-fun res!1083042 () Bool)

(assert (=> b!1585853 (=> res!1083042 e!885470)))

(assert (=> b!1585853 (= res!1083042 (not (isStrictlySorted!1204 lt!677451)))))

(declare-fun $colon$colon!1048 (List!36982 tuple2!25892) List!36982)

(assert (=> b!1585853 (= lt!677451 ($colon$colon!1048 l!556 lt!677450))))

(declare-fun newValue!21 () B!3000)

(assert (=> b!1585853 (= lt!677450 (tuple2!25893 newKey!21 newValue!21))))

(assert (= (and start!138306 res!1083043) b!1585850))

(assert (= (and b!1585850 res!1083044) b!1585853))

(assert (= (and b!1585853 (not res!1083042)) b!1585851))

(assert (= (and b!1585851 (not res!1083041)) b!1585852))

(assert (= (and start!138306 (is-Cons!36978 l!556)) b!1585849))

(declare-fun m!1454519 () Bool)

(assert (=> start!138306 m!1454519))

(declare-fun m!1454521 () Bool)

(assert (=> b!1585851 m!1454521))

(declare-fun m!1454523 () Bool)

(assert (=> b!1585852 m!1454523))

(declare-fun m!1454525 () Bool)

(assert (=> b!1585853 m!1454525))

(declare-fun m!1454527 () Bool)

(assert (=> b!1585853 m!1454527))

(push 1)

(assert (not b!1585851))

(assert (not start!138306))

(assert (not b!1585852))

(assert (not b!1585853))

(assert tp_is_empty!39533)

(assert (not b!1585849))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167813 () Bool)

(declare-fun res!1083077 () Bool)

(declare-fun e!885504 () Bool)

(assert (=> d!167813 (=> res!1083077 e!885504)))

(assert (=> d!167813 (= res!1083077 (or (is-Nil!36979 lt!677451) (is-Nil!36979 (t!51906 lt!677451))))))

(assert (=> d!167813 (= (isStrictlySorted!1204 lt!677451) e!885504)))

(declare-fun b!1585886 () Bool)

(declare-fun e!885505 () Bool)

(assert (=> b!1585886 (= e!885504 e!885505)))

(declare-fun res!1083078 () Bool)

(assert (=> b!1585886 (=> (not res!1083078) (not e!885505))))

(assert (=> b!1585886 (= res!1083078 (bvslt (_1!12957 (h!38521 lt!677451)) (_1!12957 (h!38521 (t!51906 lt!677451)))))))

(declare-fun b!1585887 () Bool)

(assert (=> b!1585887 (= e!885505 (isStrictlySorted!1204 (t!51906 lt!677451)))))

(assert (= (and d!167813 (not res!1083077)) b!1585886))

(assert (= (and b!1585886 res!1083078) b!1585887))

(declare-fun m!1454545 () Bool)

(assert (=> b!1585887 m!1454545))

(assert (=> b!1585853 d!167813))

(declare-fun d!167821 () Bool)

(assert (=> d!167821 (= ($colon$colon!1048 l!556 lt!677450) (Cons!36978 lt!677450 l!556))))

(assert (=> b!1585853 d!167821))

(declare-fun d!167823 () Bool)

(declare-fun res!1083079 () Bool)

(declare-fun e!885509 () Bool)

(assert (=> d!167823 (=> res!1083079 e!885509)))

(assert (=> d!167823 (= res!1083079 (or (is-Nil!36979 l!556) (is-Nil!36979 (t!51906 l!556))))))

(assert (=> d!167823 (= (isStrictlySorted!1204 l!556) e!885509)))

(declare-fun b!1585893 () Bool)

(declare-fun e!885510 () Bool)

(assert (=> b!1585893 (= e!885509 e!885510)))

(declare-fun res!1083080 () Bool)

(assert (=> b!1585893 (=> (not res!1083080) (not e!885510))))

(assert (=> b!1585893 (= res!1083080 (bvslt (_1!12957 (h!38521 l!556)) (_1!12957 (h!38521 (t!51906 l!556)))))))

(declare-fun b!1585894 () Bool)

(assert (=> b!1585894 (= e!885510 (isStrictlySorted!1204 (t!51906 l!556)))))

(assert (= (and d!167823 (not res!1083079)) b!1585893))

(assert (= (and b!1585893 res!1083080) b!1585894))

(declare-fun m!1454547 () Bool)

(assert (=> b!1585894 m!1454547))

(assert (=> start!138306 d!167823))

(declare-fun d!167825 () Bool)

(declare-fun res!1083091 () Bool)

(declare-fun e!885521 () Bool)

(assert (=> d!167825 (=> res!1083091 e!885521)))

(assert (=> d!167825 (= res!1083091 (and (is-Cons!36978 lt!677451) (= (_1!12957 (h!38521 lt!677451)) newKey!21)))))

(assert (=> d!167825 (= (containsKey!1017 lt!677451 newKey!21) e!885521)))

(declare-fun b!1585905 () Bool)

(declare-fun e!885522 () Bool)

(assert (=> b!1585905 (= e!885521 e!885522)))

(declare-fun res!1083092 () Bool)

(assert (=> b!1585905 (=> (not res!1083092) (not e!885522))))

(assert (=> b!1585905 (= res!1083092 (and (or (not (is-Cons!36978 lt!677451)) (bvsle (_1!12957 (h!38521 lt!677451)) newKey!21)) (is-Cons!36978 lt!677451) (bvslt (_1!12957 (h!38521 lt!677451)) newKey!21)))))

(declare-fun b!1585906 () Bool)

(assert (=> b!1585906 (= e!885522 (containsKey!1017 (t!51906 lt!677451) newKey!21))))

(assert (= (and d!167825 (not res!1083091)) b!1585905))

(assert (= (and b!1585905 res!1083092) b!1585906))

(declare-fun m!1454555 () Bool)

(assert (=> b!1585906 m!1454555))

(assert (=> b!1585851 d!167825))

(declare-fun d!167829 () Bool)

(declare-fun lt!677460 () Bool)

(declare-fun content!872 (List!36982) (Set tuple2!25892))

(assert (=> d!167829 (= lt!677460 (member lt!677450 (content!872 lt!677451)))))

(declare-fun e!885537 () Bool)

(assert (=> d!167829 (= lt!677460 e!885537)))

(declare-fun res!1083104 () Bool)

(assert (=> d!167829 (=> (not res!1083104) (not e!885537))))

(assert (=> d!167829 (= res!1083104 (is-Cons!36978 lt!677451))))

(assert (=> d!167829 (= (contains!10540 lt!677451 lt!677450) lt!677460)))

(declare-fun b!1585922 () Bool)

(declare-fun e!885536 () Bool)

(assert (=> b!1585922 (= e!885537 e!885536)))

(declare-fun res!1083103 () Bool)

(assert (=> b!1585922 (=> res!1083103 e!885536)))

(assert (=> b!1585922 (= res!1083103 (= (h!38521 lt!677451) lt!677450))))

(declare-fun b!1585923 () Bool)

(assert (=> b!1585923 (= e!885536 (contains!10540 (t!51906 lt!677451) lt!677450))))

(assert (= (and d!167829 res!1083104) b!1585922))

(assert (= (and b!1585922 (not res!1083103)) b!1585923))

(declare-fun m!1454559 () Bool)

(assert (=> d!167829 m!1454559))

(declare-fun m!1454561 () Bool)

(assert (=> d!167829 m!1454561))

(declare-fun m!1454563 () Bool)

(assert (=> b!1585923 m!1454563))

(assert (=> b!1585852 d!167829))

(declare-fun b!1585928 () Bool)

(declare-fun e!885540 () Bool)

(declare-fun tp!115314 () Bool)

(assert (=> b!1585928 (= e!885540 (and tp_is_empty!39533 tp!115314))))

(assert (=> b!1585849 (= tp!115305 e!885540)))

(assert (= (and b!1585849 (is-Cons!36978 (t!51906 l!556))) b!1585928))

(push 1)

(assert (not b!1585923))

(assert (not b!1585928))

(assert (not b!1585887))

(assert (not d!167829))

(assert (not b!1585894))

(assert (not b!1585906))

(assert tp_is_empty!39533)

(check-sat)

