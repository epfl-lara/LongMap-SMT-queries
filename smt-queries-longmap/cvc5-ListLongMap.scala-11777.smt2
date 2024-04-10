; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138332 () Bool)

(assert start!138332)

(declare-fun b!1585939 () Bool)

(declare-fun e!885547 () Bool)

(declare-fun e!885549 () Bool)

(assert (=> b!1585939 (= e!885547 e!885549)))

(declare-fun res!1083115 () Bool)

(assert (=> b!1585939 (=> res!1083115 e!885549)))

(declare-datatypes ((B!3002 0))(
  ( (B!3003 (val!19863 Int)) )
))
(declare-datatypes ((tuple2!25894 0))(
  ( (tuple2!25895 (_1!12958 (_ BitVec 64)) (_2!12958 B!3002)) )
))
(declare-datatypes ((List!36983 0))(
  ( (Nil!36980) (Cons!36979 (h!38522 tuple2!25894) (t!51910 List!36983)) )
))
(declare-fun lt!677465 () List!36983)

(declare-fun isStrictlySorted!1205 (List!36983) Bool)

(assert (=> b!1585939 (= res!1083115 (not (isStrictlySorted!1205 lt!677465)))))

(declare-fun lt!677466 () tuple2!25894)

(declare-fun $colon$colon!1049 (List!36983 tuple2!25894) List!36983)

(assert (=> b!1585939 (= lt!677465 ($colon$colon!1049 Nil!36980 lt!677466))))

(declare-fun newKey!21 () (_ BitVec 64))

(declare-fun newValue!21 () B!3002)

(assert (=> b!1585939 (= lt!677466 (tuple2!25895 newKey!21 newValue!21))))

(declare-fun b!1585940 () Bool)

(declare-fun res!1083114 () Bool)

(assert (=> b!1585940 (=> (not res!1083114) (not e!885547))))

(declare-fun l!556 () List!36983)

(assert (=> b!1585940 (= res!1083114 (and (or (not (is-Cons!36979 l!556)) (bvsge (_1!12958 (h!38522 l!556)) newKey!21)) (or (not (is-Cons!36979 l!556)) (not (= (_1!12958 (h!38522 l!556)) newKey!21))) (or (not (is-Cons!36979 l!556)) (bvsle (_1!12958 (h!38522 l!556)) newKey!21)) (is-Nil!36980 l!556)))))

(declare-fun b!1585941 () Bool)

(declare-fun contains!10541 (List!36983 tuple2!25894) Bool)

(assert (=> b!1585941 (= e!885549 (not (contains!10541 lt!677465 lt!677466)))))

(declare-fun b!1585942 () Bool)

(declare-fun e!885548 () Bool)

(declare-fun tp_is_empty!39535 () Bool)

(declare-fun tp!115317 () Bool)

(assert (=> b!1585942 (= e!885548 (and tp_is_empty!39535 tp!115317))))

(declare-fun res!1083116 () Bool)

(assert (=> start!138332 (=> (not res!1083116) (not e!885547))))

(assert (=> start!138332 (= res!1083116 (isStrictlySorted!1205 l!556))))

(assert (=> start!138332 e!885547))

(assert (=> start!138332 e!885548))

(assert (=> start!138332 true))

(assert (=> start!138332 tp_is_empty!39535))

(declare-fun b!1585943 () Bool)

(declare-fun res!1083113 () Bool)

(assert (=> b!1585943 (=> res!1083113 e!885549)))

(declare-fun containsKey!1018 (List!36983 (_ BitVec 64)) Bool)

(assert (=> b!1585943 (= res!1083113 (not (containsKey!1018 lt!677465 newKey!21)))))

(assert (= (and start!138332 res!1083116) b!1585940))

(assert (= (and b!1585940 res!1083114) b!1585939))

(assert (= (and b!1585939 (not res!1083115)) b!1585943))

(assert (= (and b!1585943 (not res!1083113)) b!1585941))

(assert (= (and start!138332 (is-Cons!36979 l!556)) b!1585942))

(declare-fun m!1454565 () Bool)

(assert (=> b!1585939 m!1454565))

(declare-fun m!1454567 () Bool)

(assert (=> b!1585939 m!1454567))

(declare-fun m!1454569 () Bool)

(assert (=> b!1585941 m!1454569))

(declare-fun m!1454571 () Bool)

(assert (=> start!138332 m!1454571))

(declare-fun m!1454573 () Bool)

(assert (=> b!1585943 m!1454573))

(push 1)

(assert (not b!1585941))

(assert (not start!138332))

(assert (not b!1585939))

(assert tp_is_empty!39535)

(assert (not b!1585942))

(assert (not b!1585943))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167837 () Bool)

(declare-fun lt!677484 () Bool)

(declare-fun content!874 (List!36983) (Set tuple2!25894))

(assert (=> d!167837 (= lt!677484 (set.member lt!677466 (content!874 lt!677465)))))

(declare-fun e!885588 () Bool)

(assert (=> d!167837 (= lt!677484 e!885588)))

(declare-fun res!1083161 () Bool)

(assert (=> d!167837 (=> (not res!1083161) (not e!885588))))

(assert (=> d!167837 (= res!1083161 (is-Cons!36979 lt!677465))))

(assert (=> d!167837 (= (contains!10541 lt!677465 lt!677466) lt!677484)))

(declare-fun b!1585994 () Bool)

(declare-fun e!885589 () Bool)

(assert (=> b!1585994 (= e!885588 e!885589)))

(declare-fun res!1083162 () Bool)

(assert (=> b!1585994 (=> res!1083162 e!885589)))

(assert (=> b!1585994 (= res!1083162 (= (h!38522 lt!677465) lt!677466))))

(declare-fun b!1585995 () Bool)

(assert (=> b!1585995 (= e!885589 (contains!10541 (t!51910 lt!677465) lt!677466))))

(assert (= (and d!167837 res!1083161) b!1585994))

(assert (= (and b!1585994 (not res!1083162)) b!1585995))

(declare-fun m!1454603 () Bool)

(assert (=> d!167837 m!1454603))

(declare-fun m!1454605 () Bool)

(assert (=> d!167837 m!1454605))

(declare-fun m!1454607 () Bool)

(assert (=> b!1585995 m!1454607))

(assert (=> b!1585941 d!167837))

(declare-fun d!167845 () Bool)

(declare-fun res!1083175 () Bool)

(declare-fun e!885602 () Bool)

(assert (=> d!167845 (=> res!1083175 e!885602)))

(assert (=> d!167845 (= res!1083175 (and (is-Cons!36979 lt!677465) (= (_1!12958 (h!38522 lt!677465)) newKey!21)))))

(assert (=> d!167845 (= (containsKey!1018 lt!677465 newKey!21) e!885602)))

(declare-fun b!1586008 () Bool)

(declare-fun e!885603 () Bool)

(assert (=> b!1586008 (= e!885602 e!885603)))

(declare-fun res!1083176 () Bool)

(assert (=> b!1586008 (=> (not res!1083176) (not e!885603))))

(assert (=> b!1586008 (= res!1083176 (and (or (not (is-Cons!36979 lt!677465)) (bvsle (_1!12958 (h!38522 lt!677465)) newKey!21)) (is-Cons!36979 lt!677465) (bvslt (_1!12958 (h!38522 lt!677465)) newKey!21)))))

(declare-fun b!1586009 () Bool)

(assert (=> b!1586009 (= e!885603 (containsKey!1018 (t!51910 lt!677465) newKey!21))))

(assert (= (and d!167845 (not res!1083175)) b!1586008))

(assert (= (and b!1586008 res!1083176) b!1586009))

(declare-fun m!1454613 () Bool)

(assert (=> b!1586009 m!1454613))

(assert (=> b!1585943 d!167845))

(declare-fun d!167853 () Bool)

(declare-fun res!1083193 () Bool)

(declare-fun e!885623 () Bool)

(assert (=> d!167853 (=> res!1083193 e!885623)))

(assert (=> d!167853 (= res!1083193 (or (is-Nil!36980 l!556) (is-Nil!36980 (t!51910 l!556))))))

(assert (=> d!167853 (= (isStrictlySorted!1205 l!556) e!885623)))

(declare-fun b!1586031 () Bool)

(declare-fun e!885624 () Bool)

(assert (=> b!1586031 (= e!885623 e!885624)))

(declare-fun res!1083194 () Bool)

(assert (=> b!1586031 (=> (not res!1083194) (not e!885624))))

(assert (=> b!1586031 (= res!1083194 (bvslt (_1!12958 (h!38522 l!556)) (_1!12958 (h!38522 (t!51910 l!556)))))))

(declare-fun b!1586032 () Bool)

(assert (=> b!1586032 (= e!885624 (isStrictlySorted!1205 (t!51910 l!556)))))

(assert (= (and d!167853 (not res!1083193)) b!1586031))

(assert (= (and b!1586031 res!1083194) b!1586032))

(declare-fun m!1454619 () Bool)

(assert (=> b!1586032 m!1454619))

(assert (=> start!138332 d!167853))

(declare-fun d!167857 () Bool)

(declare-fun res!1083197 () Bool)

(declare-fun e!885627 () Bool)

(assert (=> d!167857 (=> res!1083197 e!885627)))

(assert (=> d!167857 (= res!1083197 (or (is-Nil!36980 lt!677465) (is-Nil!36980 (t!51910 lt!677465))))))

(assert (=> d!167857 (= (isStrictlySorted!1205 lt!677465) e!885627)))

(declare-fun b!1586035 () Bool)

(declare-fun e!885628 () Bool)

(assert (=> b!1586035 (= e!885627 e!885628)))

(declare-fun res!1083198 () Bool)

(assert (=> b!1586035 (=> (not res!1083198) (not e!885628))))

(assert (=> b!1586035 (= res!1083198 (bvslt (_1!12958 (h!38522 lt!677465)) (_1!12958 (h!38522 (t!51910 lt!677465)))))))

(declare-fun b!1586036 () Bool)

(assert (=> b!1586036 (= e!885628 (isStrictlySorted!1205 (t!51910 lt!677465)))))

(assert (= (and d!167857 (not res!1083197)) b!1586035))

(assert (= (and b!1586035 res!1083198) b!1586036))

(declare-fun m!1454627 () Bool)

(assert (=> b!1586036 m!1454627))

(assert (=> b!1585939 d!167857))

(declare-fun d!167861 () Bool)

(assert (=> d!167861 (= ($colon$colon!1049 Nil!36980 lt!677466) (Cons!36979 lt!677466 Nil!36980))))

(assert (=> b!1585939 d!167861))

(declare-fun b!1586048 () Bool)

(declare-fun e!885636 () Bool)

(declare-fun tp!115332 () Bool)

(assert (=> b!1586048 (= e!885636 (and tp_is_empty!39535 tp!115332))))

(assert (=> b!1585942 (= tp!115317 e!885636)))

(assert (= (and b!1585942 (is-Cons!36979 (t!51910 l!556))) b!1586048))

(push 1)

