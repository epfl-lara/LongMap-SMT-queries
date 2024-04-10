; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115310 () Bool)

(assert start!115310)

(declare-fun res!908167 () Bool)

(declare-fun e!773884 () Bool)

(assert (=> start!115310 (=> (not res!908167) (not e!773884))))

(declare-datatypes ((List!31851 0))(
  ( (Nil!31848) (Cons!31847 (h!33056 (_ BitVec 64)) (t!46545 List!31851)) )
))
(declare-datatypes ((tuple2!24394 0))(
  ( (tuple2!24395 (_1!12208 (_ BitVec 64)) (_2!12208 List!31851)) )
))
(declare-datatypes ((Option!792 0))(
  ( (Some!791 (v!21591 tuple2!24394)) (None!790) )
))
(declare-fun lt!601120 () Option!792)

(declare-fun isEmpty!1116 (Option!792) Bool)

(assert (=> start!115310 (= res!908167 (not (isEmpty!1116 lt!601120)))))

(declare-fun l!3677 () List!31851)

(declare-fun unapply!58 (List!31851) Option!792)

(assert (=> start!115310 (= lt!601120 (unapply!58 l!3677))))

(assert (=> start!115310 e!773884))

(assert (=> start!115310 true))

(declare-fun b!1364593 () Bool)

(declare-fun subseq!941 (List!31851 List!31851) Bool)

(assert (=> b!1364593 (= e!773884 (not (subseq!941 l!3677 l!3677)))))

(declare-fun lt!601119 () tuple2!24394)

(assert (=> b!1364593 (subseq!941 (_2!12208 lt!601119) (_2!12208 lt!601119))))

(declare-datatypes ((Unit!45027 0))(
  ( (Unit!45028) )
))
(declare-fun lt!601118 () Unit!45027)

(declare-fun lemmaListSubSeqRefl!0 (List!31851) Unit!45027)

(assert (=> b!1364593 (= lt!601118 (lemmaListSubSeqRefl!0 (_2!12208 lt!601119)))))

(declare-fun get!22717 (Option!792) tuple2!24394)

(assert (=> b!1364593 (= lt!601119 (get!22717 lt!601120))))

(assert (= (and start!115310 res!908167) b!1364593))

(declare-fun m!1249375 () Bool)

(assert (=> start!115310 m!1249375))

(declare-fun m!1249377 () Bool)

(assert (=> start!115310 m!1249377))

(declare-fun m!1249379 () Bool)

(assert (=> b!1364593 m!1249379))

(declare-fun m!1249381 () Bool)

(assert (=> b!1364593 m!1249381))

(declare-fun m!1249383 () Bool)

(assert (=> b!1364593 m!1249383))

(declare-fun m!1249385 () Bool)

(assert (=> b!1364593 m!1249385))

(push 1)

(assert (not b!1364593))

(assert (not start!115310))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1364618 () Bool)

(declare-fun e!773909 () Bool)

(declare-fun e!773912 () Bool)

(assert (=> b!1364618 (= e!773909 e!773912)))

(declare-fun res!908192 () Bool)

(assert (=> b!1364618 (=> (not res!908192) (not e!773912))))

(assert (=> b!1364618 (= res!908192 (is-Cons!31847 l!3677))))

(declare-fun b!1364620 () Bool)

(declare-fun e!773911 () Bool)

(assert (=> b!1364620 (= e!773911 (subseq!941 (t!46545 l!3677) (t!46545 l!3677)))))

(declare-fun d!146509 () Bool)

(declare-fun res!908193 () Bool)

(assert (=> d!146509 (=> res!908193 e!773909)))

(assert (=> d!146509 (= res!908193 (is-Nil!31848 l!3677))))

(assert (=> d!146509 (= (subseq!941 l!3677 l!3677) e!773909)))

(declare-fun b!1364621 () Bool)

(declare-fun e!773910 () Bool)

(assert (=> b!1364621 (= e!773910 (subseq!941 l!3677 (t!46545 l!3677)))))

(declare-fun b!1364619 () Bool)

(assert (=> b!1364619 (= e!773912 e!773910)))

(declare-fun res!908194 () Bool)

(assert (=> b!1364619 (=> res!908194 e!773910)))

(assert (=> b!1364619 (= res!908194 e!773911)))

(declare-fun res!908195 () Bool)

(assert (=> b!1364619 (=> (not res!908195) (not e!773911))))

(assert (=> b!1364619 (= res!908195 (= (h!33056 l!3677) (h!33056 l!3677)))))

(assert (= (and d!146509 (not res!908193)) b!1364618))

(assert (= (and b!1364618 res!908192) b!1364619))

(assert (= (and b!1364619 res!908195) b!1364620))

(assert (= (and b!1364619 (not res!908194)) b!1364621))

(declare-fun m!1249411 () Bool)

(assert (=> b!1364620 m!1249411))

(declare-fun m!1249413 () Bool)

(assert (=> b!1364621 m!1249413))

(assert (=> b!1364593 d!146509))

(declare-fun b!1364632 () Bool)

(declare-fun e!773923 () Bool)

(declare-fun e!773926 () Bool)

(assert (=> b!1364632 (= e!773923 e!773926)))

(declare-fun res!908206 () Bool)

(assert (=> b!1364632 (=> (not res!908206) (not e!773926))))

(assert (=> b!1364632 (= res!908206 (is-Cons!31847 (_2!12208 lt!601119)))))

(declare-fun b!1364634 () Bool)

(declare-fun e!773925 () Bool)

(assert (=> b!1364634 (= e!773925 (subseq!941 (t!46545 (_2!12208 lt!601119)) (t!46545 (_2!12208 lt!601119))))))

(declare-fun d!146517 () Bool)

(declare-fun res!908207 () Bool)

(assert (=> d!146517 (=> res!908207 e!773923)))

(assert (=> d!146517 (= res!908207 (is-Nil!31848 (_2!12208 lt!601119)))))

(assert (=> d!146517 (= (subseq!941 (_2!12208 lt!601119) (_2!12208 lt!601119)) e!773923)))

(declare-fun b!1364635 () Bool)

(declare-fun e!773924 () Bool)

(assert (=> b!1364635 (= e!773924 (subseq!941 (_2!12208 lt!601119) (t!46545 (_2!12208 lt!601119))))))

(declare-fun b!1364633 () Bool)

(assert (=> b!1364633 (= e!773926 e!773924)))

(declare-fun res!908208 () Bool)

(assert (=> b!1364633 (=> res!908208 e!773924)))

(assert (=> b!1364633 (= res!908208 e!773925)))

(declare-fun res!908209 () Bool)

(assert (=> b!1364633 (=> (not res!908209) (not e!773925))))

(assert (=> b!1364633 (= res!908209 (= (h!33056 (_2!12208 lt!601119)) (h!33056 (_2!12208 lt!601119))))))

(assert (= (and d!146517 (not res!908207)) b!1364632))

(assert (= (and b!1364632 res!908206) b!1364633))

(assert (= (and b!1364633 res!908209) b!1364634))

(assert (= (and b!1364633 (not res!908208)) b!1364635))

(declare-fun m!1249419 () Bool)

(assert (=> b!1364634 m!1249419))

(declare-fun m!1249421 () Bool)

(assert (=> b!1364635 m!1249421))

(assert (=> b!1364593 d!146517))

(declare-fun d!146521 () Bool)

(assert (=> d!146521 (subseq!941 (_2!12208 lt!601119) (_2!12208 lt!601119))))

(declare-fun lt!601143 () Unit!45027)

(declare-fun choose!36 (List!31851) Unit!45027)

(assert (=> d!146521 (= lt!601143 (choose!36 (_2!12208 lt!601119)))))

(assert (=> d!146521 (= (lemmaListSubSeqRefl!0 (_2!12208 lt!601119)) lt!601143)))

(declare-fun bs!39150 () Bool)

(assert (= bs!39150 d!146521))

(assert (=> bs!39150 m!1249381))

(declare-fun m!1249431 () Bool)

(assert (=> bs!39150 m!1249431))

(assert (=> b!1364593 d!146521))

(declare-fun d!146527 () Bool)

(assert (=> d!146527 (= (get!22717 lt!601120) (v!21591 lt!601120))))

(assert (=> b!1364593 d!146527))

(declare-fun d!146533 () Bool)

(assert (=> d!146533 (= (isEmpty!1116 lt!601120) (not (is-Some!791 lt!601120)))))

(assert (=> start!115310 d!146533))

(declare-fun d!146537 () Bool)

(assert (=> d!146537 (= (unapply!58 l!3677) (ite (is-Nil!31848 l!3677) None!790 (Some!791 (tuple2!24395 (h!33056 l!3677) (t!46545 l!3677)))))))

(assert (=> start!115310 d!146537))

(push 1)

