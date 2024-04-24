; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138812 () Bool)

(assert start!138812)

(declare-fun b!1588612 () Bool)

(declare-fun res!1084160 () Bool)

(declare-fun e!887242 () Bool)

(assert (=> b!1588612 (=> res!1084160 e!887242)))

(declare-datatypes ((B!3016 0))(
  ( (B!3017 (val!19870 Int)) )
))
(declare-datatypes ((tuple2!25968 0))(
  ( (tuple2!25969 (_1!12995 (_ BitVec 64)) (_2!12995 B!3016)) )
))
(declare-datatypes ((List!37022 0))(
  ( (Nil!37019) (Cons!37018 (h!38579 tuple2!25968) (t!51945 List!37022)) )
))
(declare-fun lt!678405 () List!37022)

(declare-fun newKey!21 () (_ BitVec 64))

(declare-fun containsKey!1023 (List!37022 (_ BitVec 64)) Bool)

(assert (=> b!1588612 (= res!1084160 (not (containsKey!1023 lt!678405 newKey!21)))))

(declare-fun b!1588613 () Bool)

(declare-fun e!887240 () Bool)

(declare-fun tp_is_empty!39549 () Bool)

(declare-fun tp!115353 () Bool)

(assert (=> b!1588613 (= e!887240 (and tp_is_empty!39549 tp!115353))))

(declare-fun b!1588614 () Bool)

(declare-fun newValue!21 () B!3016)

(declare-fun contains!10590 (List!37022 tuple2!25968) Bool)

(assert (=> b!1588614 (= e!887242 (not (contains!10590 lt!678405 (tuple2!25969 newKey!21 newValue!21))))))

(declare-fun res!1084161 () Bool)

(declare-fun e!887241 () Bool)

(assert (=> start!138812 (=> (not res!1084161) (not e!887241))))

(declare-fun l!556 () List!37022)

(declare-fun isStrictlySorted!1200 (List!37022) Bool)

(assert (=> start!138812 (= res!1084161 (isStrictlySorted!1200 l!556))))

(assert (=> start!138812 e!887241))

(declare-fun e!887243 () Bool)

(assert (=> start!138812 e!887243))

(assert (=> start!138812 true))

(assert (=> start!138812 tp_is_empty!39549))

(declare-fun b!1588615 () Bool)

(assert (=> b!1588615 (= e!887241 e!887242)))

(declare-fun res!1084159 () Bool)

(assert (=> b!1588615 (=> res!1084159 e!887242)))

(assert (=> b!1588615 (= res!1084159 (not (isStrictlySorted!1200 lt!678405)))))

(declare-fun err!229 () List!37022)

(assert (=> b!1588615 (= lt!678405 err!229)))

(assert (=> b!1588615 true))

(assert (=> b!1588615 e!887240))

(declare-fun b!1588616 () Bool)

(declare-fun tp!115354 () Bool)

(assert (=> b!1588616 (= e!887243 (and tp_is_empty!39549 tp!115354))))

(declare-fun b!1588617 () Bool)

(declare-fun res!1084158 () Bool)

(assert (=> b!1588617 (=> (not res!1084158) (not e!887241))))

(assert (=> b!1588617 (= res!1084158 (and (or (not (is-Cons!37018 l!556)) (bvsge (_1!12995 (h!38579 l!556)) newKey!21)) (or (not (is-Cons!37018 l!556)) (not (= (_1!12995 (h!38579 l!556)) newKey!21))) (or (not (is-Cons!37018 l!556)) (bvsle (_1!12995 (h!38579 l!556)) newKey!21)) (not (is-Nil!37019 l!556))))))

(assert (= (and start!138812 res!1084161) b!1588617))

(assert (= (and b!1588617 res!1084158) b!1588615))

(assert (= (and b!1588615 (is-Cons!37018 err!229)) b!1588613))

(assert (= (and b!1588615 (not res!1084159)) b!1588612))

(assert (= (and b!1588612 (not res!1084160)) b!1588614))

(assert (= (and start!138812 (is-Cons!37018 l!556)) b!1588616))

(declare-fun m!1456973 () Bool)

(assert (=> b!1588612 m!1456973))

(declare-fun m!1456975 () Bool)

(assert (=> b!1588614 m!1456975))

(declare-fun m!1456977 () Bool)

(assert (=> start!138812 m!1456977))

(declare-fun m!1456979 () Bool)

(assert (=> b!1588615 m!1456979))

(push 1)

(assert (not b!1588613))

(assert (not b!1588616))

(assert (not b!1588612))

(assert (not b!1588615))

(assert (not b!1588614))

(assert tp_is_empty!39549)

(assert (not start!138812))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

