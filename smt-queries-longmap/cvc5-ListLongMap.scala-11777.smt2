; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138718 () Bool)

(assert start!138718)

(declare-fun b!1588244 () Bool)

(declare-fun e!886938 () Bool)

(declare-fun e!886940 () Bool)

(assert (=> b!1588244 (= e!886938 e!886940)))

(declare-fun res!1083876 () Bool)

(assert (=> b!1588244 (=> res!1083876 e!886940)))

(declare-datatypes ((B!2994 0))(
  ( (B!2995 (val!19859 Int)) )
))
(declare-datatypes ((tuple2!25946 0))(
  ( (tuple2!25947 (_1!12984 (_ BitVec 64)) (_2!12984 B!2994)) )
))
(declare-datatypes ((List!37011 0))(
  ( (Nil!37008) (Cons!37007 (h!38568 tuple2!25946) (t!51925 List!37011)) )
))
(declare-fun lt!678335 () List!37011)

(declare-fun isStrictlySorted!1189 (List!37011) Bool)

(assert (=> b!1588244 (= res!1083876 (not (isStrictlySorted!1189 lt!678335)))))

(declare-fun l!556 () List!37011)

(declare-fun lt!678336 () tuple2!25946)

(declare-fun $colon$colon!1039 (List!37011 tuple2!25946) List!37011)

(assert (=> b!1588244 (= lt!678335 ($colon$colon!1039 (t!51925 l!556) lt!678336))))

(declare-fun newKey!21 () (_ BitVec 64))

(declare-fun newValue!21 () B!2994)

(assert (=> b!1588244 (= lt!678336 (tuple2!25947 newKey!21 newValue!21))))

(declare-fun b!1588245 () Bool)

(declare-fun e!886939 () Bool)

(declare-fun tp_is_empty!39527 () Bool)

(declare-fun tp!115288 () Bool)

(assert (=> b!1588245 (= e!886939 (and tp_is_empty!39527 tp!115288))))

(declare-fun b!1588246 () Bool)

(declare-fun contains!10582 (List!37011 tuple2!25946) Bool)

(assert (=> b!1588246 (= e!886940 (not (contains!10582 lt!678335 lt!678336)))))

(declare-fun b!1588247 () Bool)

(declare-fun res!1083873 () Bool)

(assert (=> b!1588247 (=> (not res!1083873) (not e!886938))))

(assert (=> b!1588247 (= res!1083873 (and (bvsge (_1!12984 (h!38568 l!556)) newKey!21) (is-Cons!37007 l!556) (= (_1!12984 (h!38568 l!556)) newKey!21)))))

(declare-fun b!1588248 () Bool)

(declare-fun res!1083875 () Bool)

(assert (=> b!1588248 (=> res!1083875 e!886940)))

(declare-fun containsKey!1015 (List!37011 (_ BitVec 64)) Bool)

(assert (=> b!1588248 (= res!1083875 (not (containsKey!1015 lt!678335 newKey!21)))))

(declare-fun res!1083874 () Bool)

(assert (=> start!138718 (=> (not res!1083874) (not e!886938))))

(assert (=> start!138718 (= res!1083874 (isStrictlySorted!1189 l!556))))

(assert (=> start!138718 e!886938))

(assert (=> start!138718 e!886939))

(assert (=> start!138718 true))

(assert (=> start!138718 tp_is_empty!39527))

(assert (= (and start!138718 res!1083874) b!1588247))

(assert (= (and b!1588247 res!1083873) b!1588244))

(assert (= (and b!1588244 (not res!1083876)) b!1588248))

(assert (= (and b!1588248 (not res!1083875)) b!1588246))

(assert (= (and start!138718 (is-Cons!37007 l!556)) b!1588245))

(declare-fun m!1456781 () Bool)

(assert (=> b!1588244 m!1456781))

(declare-fun m!1456783 () Bool)

(assert (=> b!1588244 m!1456783))

(declare-fun m!1456785 () Bool)

(assert (=> b!1588246 m!1456785))

(declare-fun m!1456787 () Bool)

(assert (=> b!1588248 m!1456787))

(declare-fun m!1456789 () Bool)

(assert (=> start!138718 m!1456789))

(push 1)

(assert (not start!138718))

(assert tp_is_empty!39527)

(assert (not b!1588245))

(assert (not b!1588246))

(assert (not b!1588248))

(assert (not b!1588244))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!168503 () Bool)

(declare-fun res!1083881 () Bool)

(declare-fun e!886945 () Bool)

(assert (=> d!168503 (=> res!1083881 e!886945)))

(assert (=> d!168503 (= res!1083881 (or (is-Nil!37008 lt!678335) (is-Nil!37008 (t!51925 lt!678335))))))

(assert (=> d!168503 (= (isStrictlySorted!1189 lt!678335) e!886945)))

(declare-fun b!1588253 () Bool)

(declare-fun e!886946 () Bool)

(assert (=> b!1588253 (= e!886945 e!886946)))

(declare-fun res!1083882 () Bool)

(assert (=> b!1588253 (=> (not res!1083882) (not e!886946))))

(assert (=> b!1588253 (= res!1083882 (bvslt (_1!12984 (h!38568 lt!678335)) (_1!12984 (h!38568 (t!51925 lt!678335)))))))

(declare-fun b!1588254 () Bool)

(assert (=> b!1588254 (= e!886946 (isStrictlySorted!1189 (t!51925 lt!678335)))))

(assert (= (and d!168503 (not res!1083881)) b!1588253))

(assert (= (and b!1588253 res!1083882) b!1588254))

(declare-fun m!1456791 () Bool)

(assert (=> b!1588254 m!1456791))

(assert (=> b!1588244 d!168503))

(declare-fun d!168505 () Bool)

(assert (=> d!168505 (= ($colon$colon!1039 (t!51925 l!556) lt!678336) (Cons!37007 lt!678336 (t!51925 l!556)))))

(assert (=> b!1588244 d!168505))

(declare-fun d!168507 () Bool)

(declare-fun res!1083883 () Bool)

(declare-fun e!886947 () Bool)

(assert (=> d!168507 (=> res!1083883 e!886947)))

(assert (=> d!168507 (= res!1083883 (or (is-Nil!37008 l!556) (is-Nil!37008 (t!51925 l!556))))))

(assert (=> d!168507 (= (isStrictlySorted!1189 l!556) e!886947)))

(declare-fun b!1588255 () Bool)

(declare-fun e!886948 () Bool)

(assert (=> b!1588255 (= e!886947 e!886948)))

(declare-fun res!1083884 () Bool)

(assert (=> b!1588255 (=> (not res!1083884) (not e!886948))))

(assert (=> b!1588255 (= res!1083884 (bvslt (_1!12984 (h!38568 l!556)) (_1!12984 (h!38568 (t!51925 l!556)))))))

(declare-fun b!1588256 () Bool)

(assert (=> b!1588256 (= e!886948 (isStrictlySorted!1189 (t!51925 l!556)))))

(assert (= (and d!168507 (not res!1083883)) b!1588255))

(assert (= (and b!1588255 res!1083884) b!1588256))

(declare-fun m!1456793 () Bool)

(assert (=> b!1588256 m!1456793))

(assert (=> start!138718 d!168507))

(declare-fun d!168509 () Bool)

(declare-fun res!1083893 () Bool)

(declare-fun e!886957 () Bool)

(assert (=> d!168509 (=> res!1083893 e!886957)))

(assert (=> d!168509 (= res!1083893 (and (is-Cons!37007 lt!678335) (= (_1!12984 (h!38568 lt!678335)) newKey!21)))))

(assert (=> d!168509 (= (containsKey!1015 lt!678335 newKey!21) e!886957)))

(declare-fun b!1588265 () Bool)

(declare-fun e!886958 () Bool)

(assert (=> b!1588265 (= e!886957 e!886958)))

(declare-fun res!1083894 () Bool)

(assert (=> b!1588265 (=> (not res!1083894) (not e!886958))))

(assert (=> b!1588265 (= res!1083894 (and (or (not (is-Cons!37007 lt!678335)) (bvsle (_1!12984 (h!38568 lt!678335)) newKey!21)) (is-Cons!37007 lt!678335) (bvslt (_1!12984 (h!38568 lt!678335)) newKey!21)))))

(declare-fun b!1588266 () Bool)

(assert (=> b!1588266 (= e!886958 (containsKey!1015 (t!51925 lt!678335) newKey!21))))

(assert (= (and d!168509 (not res!1083893)) b!1588265))

(assert (= (and b!1588265 res!1083894) b!1588266))

(declare-fun m!1456795 () Bool)

(assert (=> b!1588266 m!1456795))

(assert (=> b!1588248 d!168509))

(declare-fun d!168513 () Bool)

(declare-fun lt!678339 () Bool)

(declare-fun content!854 (List!37011) (Set tuple2!25946))

(assert (=> d!168513 (= lt!678339 (set.member lt!678336 (content!854 lt!678335)))))

(declare-fun e!886978 () Bool)

(assert (=> d!168513 (= lt!678339 e!886978)))

(declare-fun res!1083913 () Bool)

(assert (=> d!168513 (=> (not res!1083913) (not e!886978))))

(assert (=> d!168513 (= res!1083913 (is-Cons!37007 lt!678335))))

(assert (=> d!168513 (= (contains!10582 lt!678335 lt!678336) lt!678339)))

(declare-fun b!1588285 () Bool)

(declare-fun e!886977 () Bool)

(assert (=> b!1588285 (= e!886978 e!886977)))

(declare-fun res!1083914 () Bool)

(assert (=> b!1588285 (=> res!1083914 e!886977)))

(assert (=> b!1588285 (= res!1083914 (= (h!38568 lt!678335) lt!678336))))

(declare-fun b!1588286 () Bool)

(assert (=> b!1588286 (= e!886977 (contains!10582 (t!51925 lt!678335) lt!678336))))

(assert (= (and d!168513 res!1083913) b!1588285))

(assert (= (and b!1588285 (not res!1083914)) b!1588286))

(declare-fun m!1456803 () Bool)

(assert (=> d!168513 m!1456803))

(declare-fun m!1456805 () Bool)

(assert (=> d!168513 m!1456805))

(declare-fun m!1456807 () Bool)

(assert (=> b!1588286 m!1456807))

(assert (=> b!1588246 d!168513))

(declare-fun b!1588291 () Bool)

(declare-fun e!886981 () Bool)

(declare-fun tp!115291 () Bool)

(assert (=> b!1588291 (= e!886981 (and tp_is_empty!39527 tp!115291))))

(assert (=> b!1588245 (= tp!115288 e!886981)))

(assert (= (and b!1588245 (is-Cons!37007 (t!51925 l!556))) b!1588291))

(push 1)

(assert (not b!1588286))

(assert (not b!1588266))

(assert (not b!1588291))

(assert tp_is_empty!39527)

(assert (not b!1588256))

(assert (not b!1588254))

(assert (not d!168513))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

