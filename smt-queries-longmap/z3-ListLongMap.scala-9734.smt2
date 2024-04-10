; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115312 () Bool)

(assert start!115312)

(declare-fun res!908170 () Bool)

(declare-fun e!773887 () Bool)

(assert (=> start!115312 (=> (not res!908170) (not e!773887))))

(declare-datatypes ((List!31852 0))(
  ( (Nil!31849) (Cons!31848 (h!33057 (_ BitVec 64)) (t!46546 List!31852)) )
))
(declare-datatypes ((tuple2!24396 0))(
  ( (tuple2!24397 (_1!12209 (_ BitVec 64)) (_2!12209 List!31852)) )
))
(declare-datatypes ((Option!793 0))(
  ( (Some!792 (v!21592 tuple2!24396)) (None!791) )
))
(declare-fun lt!601127 () Option!793)

(declare-fun isEmpty!1117 (Option!793) Bool)

(assert (=> start!115312 (= res!908170 (not (isEmpty!1117 lt!601127)))))

(declare-fun l!3677 () List!31852)

(declare-fun unapply!59 (List!31852) Option!793)

(assert (=> start!115312 (= lt!601127 (unapply!59 l!3677))))

(assert (=> start!115312 e!773887))

(assert (=> start!115312 true))

(declare-fun b!1364596 () Bool)

(declare-fun subseq!942 (List!31852 List!31852) Bool)

(assert (=> b!1364596 (= e!773887 (not (subseq!942 l!3677 l!3677)))))

(declare-fun lt!601128 () tuple2!24396)

(assert (=> b!1364596 (subseq!942 (_2!12209 lt!601128) (_2!12209 lt!601128))))

(declare-datatypes ((Unit!45029 0))(
  ( (Unit!45030) )
))
(declare-fun lt!601129 () Unit!45029)

(declare-fun lemmaListSubSeqRefl!0 (List!31852) Unit!45029)

(assert (=> b!1364596 (= lt!601129 (lemmaListSubSeqRefl!0 (_2!12209 lt!601128)))))

(declare-fun get!22718 (Option!793) tuple2!24396)

(assert (=> b!1364596 (= lt!601128 (get!22718 lt!601127))))

(assert (= (and start!115312 res!908170) b!1364596))

(declare-fun m!1249387 () Bool)

(assert (=> start!115312 m!1249387))

(declare-fun m!1249389 () Bool)

(assert (=> start!115312 m!1249389))

(declare-fun m!1249391 () Bool)

(assert (=> b!1364596 m!1249391))

(declare-fun m!1249393 () Bool)

(assert (=> b!1364596 m!1249393))

(declare-fun m!1249395 () Bool)

(assert (=> b!1364596 m!1249395))

(declare-fun m!1249397 () Bool)

(assert (=> b!1364596 m!1249397))

(check-sat (not start!115312) (not b!1364596))
(check-sat)
(get-model)

(declare-fun d!146508 () Bool)

(get-info :version)

(assert (=> d!146508 (= (isEmpty!1117 lt!601127) (not ((_ is Some!792) lt!601127)))))

(assert (=> start!115312 d!146508))

(declare-fun d!146513 () Bool)

(assert (=> d!146513 (= (unapply!59 l!3677) (ite ((_ is Nil!31849) l!3677) None!791 (Some!792 (tuple2!24397 (h!33057 l!3677) (t!46546 l!3677)))))))

(assert (=> start!115312 d!146513))

(declare-fun b!1364641 () Bool)

(declare-fun e!773931 () Bool)

(declare-fun e!773932 () Bool)

(assert (=> b!1364641 (= e!773931 e!773932)))

(declare-fun res!908216 () Bool)

(assert (=> b!1364641 (=> res!908216 e!773932)))

(declare-fun e!773933 () Bool)

(assert (=> b!1364641 (= res!908216 e!773933)))

(declare-fun res!908217 () Bool)

(assert (=> b!1364641 (=> (not res!908217) (not e!773933))))

(assert (=> b!1364641 (= res!908217 (= (h!33057 l!3677) (h!33057 l!3677)))))

(declare-fun b!1364640 () Bool)

(declare-fun e!773934 () Bool)

(assert (=> b!1364640 (= e!773934 e!773931)))

(declare-fun res!908214 () Bool)

(assert (=> b!1364640 (=> (not res!908214) (not e!773931))))

(assert (=> b!1364640 (= res!908214 ((_ is Cons!31848) l!3677))))

(declare-fun d!146515 () Bool)

(declare-fun res!908215 () Bool)

(assert (=> d!146515 (=> res!908215 e!773934)))

(assert (=> d!146515 (= res!908215 ((_ is Nil!31849) l!3677))))

(assert (=> d!146515 (= (subseq!942 l!3677 l!3677) e!773934)))

(declare-fun b!1364643 () Bool)

(assert (=> b!1364643 (= e!773932 (subseq!942 l!3677 (t!46546 l!3677)))))

(declare-fun b!1364642 () Bool)

(assert (=> b!1364642 (= e!773933 (subseq!942 (t!46546 l!3677) (t!46546 l!3677)))))

(assert (= (and d!146515 (not res!908215)) b!1364640))

(assert (= (and b!1364640 res!908214) b!1364641))

(assert (= (and b!1364641 res!908217) b!1364642))

(assert (= (and b!1364641 (not res!908216)) b!1364643))

(declare-fun m!1249427 () Bool)

(assert (=> b!1364643 m!1249427))

(declare-fun m!1249429 () Bool)

(assert (=> b!1364642 m!1249429))

(assert (=> b!1364596 d!146515))

(declare-fun b!1364645 () Bool)

(declare-fun e!773935 () Bool)

(declare-fun e!773936 () Bool)

(assert (=> b!1364645 (= e!773935 e!773936)))

(declare-fun res!908220 () Bool)

(assert (=> b!1364645 (=> res!908220 e!773936)))

(declare-fun e!773937 () Bool)

(assert (=> b!1364645 (= res!908220 e!773937)))

(declare-fun res!908221 () Bool)

(assert (=> b!1364645 (=> (not res!908221) (not e!773937))))

(assert (=> b!1364645 (= res!908221 (= (h!33057 (_2!12209 lt!601128)) (h!33057 (_2!12209 lt!601128))))))

(declare-fun b!1364644 () Bool)

(declare-fun e!773938 () Bool)

(assert (=> b!1364644 (= e!773938 e!773935)))

(declare-fun res!908218 () Bool)

(assert (=> b!1364644 (=> (not res!908218) (not e!773935))))

(assert (=> b!1364644 (= res!908218 ((_ is Cons!31848) (_2!12209 lt!601128)))))

(declare-fun d!146525 () Bool)

(declare-fun res!908219 () Bool)

(assert (=> d!146525 (=> res!908219 e!773938)))

(assert (=> d!146525 (= res!908219 ((_ is Nil!31849) (_2!12209 lt!601128)))))

(assert (=> d!146525 (= (subseq!942 (_2!12209 lt!601128) (_2!12209 lt!601128)) e!773938)))

(declare-fun b!1364647 () Bool)

(assert (=> b!1364647 (= e!773936 (subseq!942 (_2!12209 lt!601128) (t!46546 (_2!12209 lt!601128))))))

(declare-fun b!1364646 () Bool)

(assert (=> b!1364646 (= e!773937 (subseq!942 (t!46546 (_2!12209 lt!601128)) (t!46546 (_2!12209 lt!601128))))))

(assert (= (and d!146525 (not res!908219)) b!1364644))

(assert (= (and b!1364644 res!908218) b!1364645))

(assert (= (and b!1364645 res!908221) b!1364646))

(assert (= (and b!1364645 (not res!908220)) b!1364647))

(declare-fun m!1249435 () Bool)

(assert (=> b!1364647 m!1249435))

(declare-fun m!1249437 () Bool)

(assert (=> b!1364646 m!1249437))

(assert (=> b!1364596 d!146525))

(declare-fun d!146531 () Bool)

(assert (=> d!146531 (subseq!942 (_2!12209 lt!601128) (_2!12209 lt!601128))))

(declare-fun lt!601147 () Unit!45029)

(declare-fun choose!36 (List!31852) Unit!45029)

(assert (=> d!146531 (= lt!601147 (choose!36 (_2!12209 lt!601128)))))

(assert (=> d!146531 (= (lemmaListSubSeqRefl!0 (_2!12209 lt!601128)) lt!601147)))

(declare-fun bs!39152 () Bool)

(assert (= bs!39152 d!146531))

(assert (=> bs!39152 m!1249393))

(declare-fun m!1249439 () Bool)

(assert (=> bs!39152 m!1249439))

(assert (=> b!1364596 d!146531))

(declare-fun d!146541 () Bool)

(assert (=> d!146541 (= (get!22718 lt!601127) (v!21592 lt!601127))))

(assert (=> b!1364596 d!146541))

(check-sat (not b!1364647) (not b!1364646) (not d!146531) (not b!1364643) (not b!1364642))
(check-sat)
