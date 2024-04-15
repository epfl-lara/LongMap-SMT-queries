; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138270 () Bool)

(assert start!138270)

(declare-fun b!1585533 () Bool)

(declare-fun res!1082913 () Bool)

(declare-fun e!885268 () Bool)

(assert (=> b!1585533 (=> (not res!1082913) (not e!885268))))

(declare-datatypes ((B!3000 0))(
  ( (B!3001 (val!19862 Int)) )
))
(declare-datatypes ((tuple2!25960 0))(
  ( (tuple2!25961 (_1!12991 (_ BitVec 64)) (_2!12991 B!3000)) )
))
(declare-datatypes ((List!37023 0))(
  ( (Nil!37020) (Cons!37019 (h!38563 tuple2!25960) (t!51939 List!37023)) )
))
(declare-fun l!556 () List!37023)

(declare-fun newKey!21 () (_ BitVec 64))

(assert (=> b!1585533 (= res!1082913 (and (or (not (is-Cons!37019 l!556)) (bvsge (_1!12991 (h!38563 l!556)) newKey!21)) (not (= (_1!12991 (h!38563 l!556)) newKey!21)) (is-Cons!37019 l!556) (bvsgt (_1!12991 (h!38563 l!556)) newKey!21)))))

(declare-fun res!1082911 () Bool)

(assert (=> start!138270 (=> (not res!1082911) (not e!885268))))

(declare-fun isStrictlySorted!1202 (List!37023) Bool)

(assert (=> start!138270 (= res!1082911 (isStrictlySorted!1202 l!556))))

(assert (=> start!138270 e!885268))

(declare-fun e!885270 () Bool)

(assert (=> start!138270 e!885270))

(assert (=> start!138270 true))

(declare-fun tp_is_empty!39533 () Bool)

(assert (=> start!138270 tp_is_empty!39533))

(declare-fun b!1585534 () Bool)

(declare-fun res!1082910 () Bool)

(declare-fun e!885269 () Bool)

(assert (=> b!1585534 (=> res!1082910 e!885269)))

(declare-fun lt!677168 () List!37023)

(declare-fun containsKey!1015 (List!37023 (_ BitVec 64)) Bool)

(assert (=> b!1585534 (= res!1082910 (not (containsKey!1015 lt!677168 newKey!21)))))

(declare-fun b!1585535 () Bool)

(declare-fun lt!677167 () tuple2!25960)

(declare-fun contains!10494 (List!37023 tuple2!25960) Bool)

(assert (=> b!1585535 (= e!885269 (not (contains!10494 lt!677168 lt!677167)))))

(declare-fun b!1585536 () Bool)

(assert (=> b!1585536 (= e!885268 e!885269)))

(declare-fun res!1082912 () Bool)

(assert (=> b!1585536 (=> res!1082912 e!885269)))

(assert (=> b!1585536 (= res!1082912 (not (isStrictlySorted!1202 lt!677168)))))

(declare-fun $colon$colon!1052 (List!37023 tuple2!25960) List!37023)

(assert (=> b!1585536 (= lt!677168 ($colon$colon!1052 l!556 lt!677167))))

(declare-fun newValue!21 () B!3000)

(assert (=> b!1585536 (= lt!677167 (tuple2!25961 newKey!21 newValue!21))))

(declare-fun b!1585537 () Bool)

(declare-fun tp!115305 () Bool)

(assert (=> b!1585537 (= e!885270 (and tp_is_empty!39533 tp!115305))))

(assert (= (and start!138270 res!1082911) b!1585533))

(assert (= (and b!1585533 res!1082913) b!1585536))

(assert (= (and b!1585536 (not res!1082912)) b!1585534))

(assert (= (and b!1585534 (not res!1082910)) b!1585535))

(assert (= (and start!138270 (is-Cons!37019 l!556)) b!1585537))

(declare-fun m!1453637 () Bool)

(assert (=> start!138270 m!1453637))

(declare-fun m!1453639 () Bool)

(assert (=> b!1585534 m!1453639))

(declare-fun m!1453641 () Bool)

(assert (=> b!1585535 m!1453641))

(declare-fun m!1453643 () Bool)

(assert (=> b!1585536 m!1453643))

(declare-fun m!1453645 () Bool)

(assert (=> b!1585536 m!1453645))

(push 1)

(assert (not b!1585534))

(assert (not b!1585536))

(assert (not start!138270))

(assert (not b!1585535))

(assert tp_is_empty!39533)

(assert (not b!1585537))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167561 () Bool)

(declare-fun res!1082930 () Bool)

(declare-fun e!885287 () Bool)

(assert (=> d!167561 (=> res!1082930 e!885287)))

(assert (=> d!167561 (= res!1082930 (and (is-Cons!37019 lt!677168) (= (_1!12991 (h!38563 lt!677168)) newKey!21)))))

(assert (=> d!167561 (= (containsKey!1015 lt!677168 newKey!21) e!885287)))

(declare-fun b!1585554 () Bool)

(declare-fun e!885288 () Bool)

(assert (=> b!1585554 (= e!885287 e!885288)))

(declare-fun res!1082931 () Bool)

(assert (=> b!1585554 (=> (not res!1082931) (not e!885288))))

(assert (=> b!1585554 (= res!1082931 (and (or (not (is-Cons!37019 lt!677168)) (bvsle (_1!12991 (h!38563 lt!677168)) newKey!21)) (is-Cons!37019 lt!677168) (bvslt (_1!12991 (h!38563 lt!677168)) newKey!21)))))

(declare-fun b!1585555 () Bool)

(assert (=> b!1585555 (= e!885288 (containsKey!1015 (t!51939 lt!677168) newKey!21))))

(assert (= (and d!167561 (not res!1082930)) b!1585554))

(assert (= (and b!1585554 res!1082931) b!1585555))

(declare-fun m!1453651 () Bool)

(assert (=> b!1585555 m!1453651))

(assert (=> b!1585534 d!167561))

(declare-fun d!167569 () Bool)

(declare-fun lt!677174 () Bool)

(declare-fun content!861 (List!37023) (Set tuple2!25960))

(assert (=> d!167569 (= lt!677174 (set.member lt!677167 (content!861 lt!677168)))))

(declare-fun e!885305 () Bool)

(assert (=> d!167569 (= lt!677174 e!885305)))

(declare-fun res!1082944 () Bool)

(assert (=> d!167569 (=> (not res!1082944) (not e!885305))))

(assert (=> d!167569 (= res!1082944 (is-Cons!37019 lt!677168))))

(assert (=> d!167569 (= (contains!10494 lt!677168 lt!677167) lt!677174)))

(declare-fun b!1585573 () Bool)

(declare-fun e!885304 () Bool)

(assert (=> b!1585573 (= e!885305 e!885304)))

(declare-fun res!1082945 () Bool)

(assert (=> b!1585573 (=> res!1082945 e!885304)))

(assert (=> b!1585573 (= res!1082945 (= (h!38563 lt!677168) lt!677167))))

(declare-fun b!1585574 () Bool)

(assert (=> b!1585574 (= e!885304 (contains!10494 (t!51939 lt!677168) lt!677167))))

(assert (= (and d!167569 res!1082944) b!1585573))

(assert (= (and b!1585573 (not res!1082945)) b!1585574))

(declare-fun m!1453661 () Bool)

(assert (=> d!167569 m!1453661))

(declare-fun m!1453663 () Bool)

(assert (=> d!167569 m!1453663))

(declare-fun m!1453665 () Bool)

(assert (=> b!1585574 m!1453665))

(assert (=> b!1585535 d!167569))

(declare-fun d!167575 () Bool)

(declare-fun res!1082956 () Bool)

(declare-fun e!885316 () Bool)

(assert (=> d!167575 (=> res!1082956 e!885316)))

(assert (=> d!167575 (= res!1082956 (or (is-Nil!37020 lt!677168) (is-Nil!37020 (t!51939 lt!677168))))))

(assert (=> d!167575 (= (isStrictlySorted!1202 lt!677168) e!885316)))

(declare-fun b!1585585 () Bool)

(declare-fun e!885317 () Bool)

(assert (=> b!1585585 (= e!885316 e!885317)))

(declare-fun res!1082957 () Bool)

(assert (=> b!1585585 (=> (not res!1082957) (not e!885317))))

(assert (=> b!1585585 (= res!1082957 (bvslt (_1!12991 (h!38563 lt!677168)) (_1!12991 (h!38563 (t!51939 lt!677168)))))))

(declare-fun b!1585586 () Bool)

(assert (=> b!1585586 (= e!885317 (isStrictlySorted!1202 (t!51939 lt!677168)))))

(assert (= (and d!167575 (not res!1082956)) b!1585585))

(assert (= (and b!1585585 res!1082957) b!1585586))

(declare-fun m!1453669 () Bool)

(assert (=> b!1585586 m!1453669))

(assert (=> b!1585536 d!167575))

(declare-fun d!167579 () Bool)

(assert (=> d!167579 (= ($colon$colon!1052 l!556 lt!677167) (Cons!37019 lt!677167 l!556))))

(assert (=> b!1585536 d!167579))

(declare-fun d!167581 () Bool)

(declare-fun res!1082958 () Bool)

(declare-fun e!885318 () Bool)

(assert (=> d!167581 (=> res!1082958 e!885318)))

(assert (=> d!167581 (= res!1082958 (or (is-Nil!37020 l!556) (is-Nil!37020 (t!51939 l!556))))))

(assert (=> d!167581 (= (isStrictlySorted!1202 l!556) e!885318)))

(declare-fun b!1585587 () Bool)

(declare-fun e!885319 () Bool)

(assert (=> b!1585587 (= e!885318 e!885319)))

(declare-fun res!1082959 () Bool)

(assert (=> b!1585587 (=> (not res!1082959) (not e!885319))))

(assert (=> b!1585587 (= res!1082959 (bvslt (_1!12991 (h!38563 l!556)) (_1!12991 (h!38563 (t!51939 l!556)))))))

(declare-fun b!1585588 () Bool)

(assert (=> b!1585588 (= e!885319 (isStrictlySorted!1202 (t!51939 l!556)))))

(assert (= (and d!167581 (not res!1082958)) b!1585587))

(assert (= (and b!1585587 res!1082959) b!1585588))

(declare-fun m!1453671 () Bool)

(assert (=> b!1585588 m!1453671))

(assert (=> start!138270 d!167581))

(declare-fun b!1585597 () Bool)

(declare-fun e!885326 () Bool)

(declare-fun tp!115311 () Bool)

(assert (=> b!1585597 (= e!885326 (and tp_is_empty!39533 tp!115311))))

(assert (=> b!1585537 (= tp!115305 e!885326)))

(assert (= (and b!1585537 (is-Cons!37019 (t!51939 l!556))) b!1585597))

(push 1)

(assert (not b!1585555))

(assert (not b!1585586))

(assert (not b!1585574))

(assert (not d!167569))

(assert (not b!1585588))

(assert tp_is_empty!39533)

(assert (not b!1585597))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

