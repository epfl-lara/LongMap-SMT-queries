; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138748 () Bool)

(assert start!138748)

(declare-fun b!1588364 () Bool)

(declare-fun res!1083970 () Bool)

(declare-fun e!887036 () Bool)

(assert (=> b!1588364 (=> (not res!1083970) (not e!887036))))

(declare-datatypes ((B!3000 0))(
  ( (B!3001 (val!19862 Int)) )
))
(declare-datatypes ((tuple2!25952 0))(
  ( (tuple2!25953 (_1!12987 (_ BitVec 64)) (_2!12987 B!3000)) )
))
(declare-datatypes ((List!37014 0))(
  ( (Nil!37011) (Cons!37010 (h!38571 tuple2!25952) (t!51931 List!37014)) )
))
(declare-fun l!556 () List!37014)

(declare-fun newKey!21 () (_ BitVec 64))

(assert (=> b!1588364 (= res!1083970 (and (or (not (is-Cons!37010 l!556)) (bvsge (_1!12987 (h!38571 l!556)) newKey!21)) (not (= (_1!12987 (h!38571 l!556)) newKey!21)) (is-Cons!37010 l!556) (bvsgt (_1!12987 (h!38571 l!556)) newKey!21)))))

(declare-fun b!1588365 () Bool)

(declare-fun res!1083971 () Bool)

(declare-fun e!887035 () Bool)

(assert (=> b!1588365 (=> res!1083971 e!887035)))

(declare-fun lt!678362 () List!37014)

(declare-fun containsKey!1018 (List!37014 (_ BitVec 64)) Bool)

(assert (=> b!1588365 (= res!1083971 (not (containsKey!1018 lt!678362 newKey!21)))))

(declare-fun b!1588366 () Bool)

(declare-fun e!887034 () Bool)

(declare-fun tp_is_empty!39533 () Bool)

(declare-fun tp!115306 () Bool)

(assert (=> b!1588366 (= e!887034 (and tp_is_empty!39533 tp!115306))))

(declare-fun b!1588367 () Bool)

(assert (=> b!1588367 (= e!887036 e!887035)))

(declare-fun res!1083969 () Bool)

(assert (=> b!1588367 (=> res!1083969 e!887035)))

(declare-fun isStrictlySorted!1192 (List!37014) Bool)

(assert (=> b!1588367 (= res!1083969 (not (isStrictlySorted!1192 lt!678362)))))

(declare-fun lt!678363 () tuple2!25952)

(declare-fun $colon$colon!1042 (List!37014 tuple2!25952) List!37014)

(assert (=> b!1588367 (= lt!678362 ($colon$colon!1042 l!556 lt!678363))))

(declare-fun newValue!21 () B!3000)

(assert (=> b!1588367 (= lt!678363 (tuple2!25953 newKey!21 newValue!21))))

(declare-fun res!1083972 () Bool)

(assert (=> start!138748 (=> (not res!1083972) (not e!887036))))

(assert (=> start!138748 (= res!1083972 (isStrictlySorted!1192 l!556))))

(assert (=> start!138748 e!887036))

(assert (=> start!138748 e!887034))

(assert (=> start!138748 true))

(assert (=> start!138748 tp_is_empty!39533))

(declare-fun b!1588368 () Bool)

(declare-fun contains!10585 (List!37014 tuple2!25952) Bool)

(assert (=> b!1588368 (= e!887035 (not (contains!10585 lt!678362 lt!678363)))))

(assert (= (and start!138748 res!1083972) b!1588364))

(assert (= (and b!1588364 res!1083970) b!1588367))

(assert (= (and b!1588367 (not res!1083969)) b!1588365))

(assert (= (and b!1588365 (not res!1083971)) b!1588368))

(assert (= (and start!138748 (is-Cons!37010 l!556)) b!1588366))

(declare-fun m!1456847 () Bool)

(assert (=> b!1588365 m!1456847))

(declare-fun m!1456849 () Bool)

(assert (=> b!1588367 m!1456849))

(declare-fun m!1456851 () Bool)

(assert (=> b!1588367 m!1456851))

(declare-fun m!1456853 () Bool)

(assert (=> start!138748 m!1456853))

(declare-fun m!1456855 () Bool)

(assert (=> b!1588368 m!1456855))

(push 1)

(assert tp_is_empty!39533)

(assert (not b!1588366))

(assert (not b!1588365))

(assert (not b!1588368))

(assert (not b!1588367))

(assert (not start!138748))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!168539 () Bool)

(declare-fun res!1083993 () Bool)

(declare-fun e!887057 () Bool)

(assert (=> d!168539 (=> res!1083993 e!887057)))

(assert (=> d!168539 (= res!1083993 (and (is-Cons!37010 lt!678362) (= (_1!12987 (h!38571 lt!678362)) newKey!21)))))

(assert (=> d!168539 (= (containsKey!1018 lt!678362 newKey!21) e!887057)))

(declare-fun b!1588389 () Bool)

(declare-fun e!887058 () Bool)

(assert (=> b!1588389 (= e!887057 e!887058)))

(declare-fun res!1083994 () Bool)

(assert (=> b!1588389 (=> (not res!1083994) (not e!887058))))

(assert (=> b!1588389 (= res!1083994 (and (or (not (is-Cons!37010 lt!678362)) (bvsle (_1!12987 (h!38571 lt!678362)) newKey!21)) (is-Cons!37010 lt!678362) (bvslt (_1!12987 (h!38571 lt!678362)) newKey!21)))))

(declare-fun b!1588390 () Bool)

(assert (=> b!1588390 (= e!887058 (containsKey!1018 (t!51931 lt!678362) newKey!21))))

(assert (= (and d!168539 (not res!1083993)) b!1588389))

(assert (= (and b!1588389 res!1083994) b!1588390))

(declare-fun m!1456867 () Bool)

(assert (=> b!1588390 m!1456867))

(assert (=> b!1588365 d!168539))

(declare-fun d!168545 () Bool)

(declare-fun res!1084003 () Bool)

(declare-fun e!887070 () Bool)

(assert (=> d!168545 (=> res!1084003 e!887070)))

(assert (=> d!168545 (= res!1084003 (or (is-Nil!37011 l!556) (is-Nil!37011 (t!51931 l!556))))))

(assert (=> d!168545 (= (isStrictlySorted!1192 l!556) e!887070)))

(declare-fun b!1588404 () Bool)

(declare-fun e!887071 () Bool)

(assert (=> b!1588404 (= e!887070 e!887071)))

(declare-fun res!1084004 () Bool)

(assert (=> b!1588404 (=> (not res!1084004) (not e!887071))))

(assert (=> b!1588404 (= res!1084004 (bvslt (_1!12987 (h!38571 l!556)) (_1!12987 (h!38571 (t!51931 l!556)))))))

(declare-fun b!1588405 () Bool)

(assert (=> b!1588405 (= e!887071 (isStrictlySorted!1192 (t!51931 l!556)))))

(assert (= (and d!168545 (not res!1084003)) b!1588404))

(assert (= (and b!1588404 res!1084004) b!1588405))

(declare-fun m!1456871 () Bool)

(assert (=> b!1588405 m!1456871))

(assert (=> start!138748 d!168545))

(declare-fun d!168549 () Bool)

(declare-fun lt!678369 () Bool)

(declare-fun content!858 (List!37014) (Set tuple2!25952))

(assert (=> d!168549 (= lt!678369 (set.member lt!678363 (content!858 lt!678362)))))

(declare-fun e!887076 () Bool)

(assert (=> d!168549 (= lt!678369 e!887076)))

(declare-fun res!1084010 () Bool)

(assert (=> d!168549 (=> (not res!1084010) (not e!887076))))

(assert (=> d!168549 (= res!1084010 (is-Cons!37010 lt!678362))))

(assert (=> d!168549 (= (contains!10585 lt!678362 lt!678363) lt!678369)))

(declare-fun b!1588410 () Bool)

(declare-fun e!887077 () Bool)

(assert (=> b!1588410 (= e!887076 e!887077)))

(declare-fun res!1084009 () Bool)

(assert (=> b!1588410 (=> res!1084009 e!887077)))

(assert (=> b!1588410 (= res!1084009 (= (h!38571 lt!678362) lt!678363))))

(declare-fun b!1588411 () Bool)

(assert (=> b!1588411 (= e!887077 (contains!10585 (t!51931 lt!678362) lt!678363))))

(assert (= (and d!168549 res!1084010) b!1588410))

(assert (= (and b!1588410 (not res!1084009)) b!1588411))

(declare-fun m!1456873 () Bool)

(assert (=> d!168549 m!1456873))

(declare-fun m!1456875 () Bool)

(assert (=> d!168549 m!1456875))

(declare-fun m!1456877 () Bool)

(assert (=> b!1588411 m!1456877))

(assert (=> b!1588368 d!168549))

(declare-fun d!168551 () Bool)

(declare-fun res!1084011 () Bool)

(declare-fun e!887078 () Bool)

(assert (=> d!168551 (=> res!1084011 e!887078)))

(assert (=> d!168551 (= res!1084011 (or (is-Nil!37011 lt!678362) (is-Nil!37011 (t!51931 lt!678362))))))

(assert (=> d!168551 (= (isStrictlySorted!1192 lt!678362) e!887078)))

(declare-fun b!1588412 () Bool)

(declare-fun e!887079 () Bool)

(assert (=> b!1588412 (= e!887078 e!887079)))

(declare-fun res!1084012 () Bool)

(assert (=> b!1588412 (=> (not res!1084012) (not e!887079))))

(assert (=> b!1588412 (= res!1084012 (bvslt (_1!12987 (h!38571 lt!678362)) (_1!12987 (h!38571 (t!51931 lt!678362)))))))

(declare-fun b!1588413 () Bool)

(assert (=> b!1588413 (= e!887079 (isStrictlySorted!1192 (t!51931 lt!678362)))))

(assert (= (and d!168551 (not res!1084011)) b!1588412))

(assert (= (and b!1588412 res!1084012) b!1588413))

(declare-fun m!1456879 () Bool)

(assert (=> b!1588413 m!1456879))

(assert (=> b!1588367 d!168551))

(declare-fun d!168553 () Bool)

(assert (=> d!168553 (= ($colon$colon!1042 l!556 lt!678363) (Cons!37010 lt!678363 l!556))))

(assert (=> b!1588367 d!168553))

(declare-fun b!1588418 () Bool)

(declare-fun e!887082 () Bool)

(declare-fun tp!115312 () Bool)

(assert (=> b!1588418 (= e!887082 (and tp_is_empty!39533 tp!115312))))

(assert (=> b!1588366 (= tp!115306 e!887082)))

(assert (= (and b!1588366 (is-Cons!37010 (t!51931 l!556))) b!1588418))

(push 1)

(assert (not b!1588413))

(assert tp_is_empty!39533)

(assert (not b!1588405))

(assert (not b!1588418))

(assert (not d!168549))

(assert (not b!1588390))

(assert (not b!1588411))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

