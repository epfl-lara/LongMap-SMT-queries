; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115314 () Bool)

(assert start!115314)

(declare-fun res!908173 () Bool)

(declare-fun e!773890 () Bool)

(assert (=> start!115314 (=> (not res!908173) (not e!773890))))

(declare-datatypes ((List!31853 0))(
  ( (Nil!31850) (Cons!31849 (h!33058 (_ BitVec 64)) (t!46547 List!31853)) )
))
(declare-datatypes ((tuple2!24398 0))(
  ( (tuple2!24399 (_1!12210 (_ BitVec 64)) (_2!12210 List!31853)) )
))
(declare-datatypes ((Option!794 0))(
  ( (Some!793 (v!21593 tuple2!24398)) (None!792) )
))
(declare-fun lt!601138 () Option!794)

(declare-fun isEmpty!1118 (Option!794) Bool)

(assert (=> start!115314 (= res!908173 (not (isEmpty!1118 lt!601138)))))

(declare-fun l!3677 () List!31853)

(declare-fun unapply!60 (List!31853) Option!794)

(assert (=> start!115314 (= lt!601138 (unapply!60 l!3677))))

(assert (=> start!115314 e!773890))

(assert (=> start!115314 true))

(declare-fun b!1364599 () Bool)

(declare-fun subseq!943 (List!31853 List!31853) Bool)

(assert (=> b!1364599 (= e!773890 (not (subseq!943 l!3677 l!3677)))))

(declare-fun lt!601137 () tuple2!24398)

(assert (=> b!1364599 (subseq!943 (_2!12210 lt!601137) (_2!12210 lt!601137))))

(declare-datatypes ((Unit!45031 0))(
  ( (Unit!45032) )
))
(declare-fun lt!601136 () Unit!45031)

(declare-fun lemmaListSubSeqRefl!0 (List!31853) Unit!45031)

(assert (=> b!1364599 (= lt!601136 (lemmaListSubSeqRefl!0 (_2!12210 lt!601137)))))

(declare-fun get!22719 (Option!794) tuple2!24398)

(assert (=> b!1364599 (= lt!601137 (get!22719 lt!601138))))

(assert (= (and start!115314 res!908173) b!1364599))

(declare-fun m!1249399 () Bool)

(assert (=> start!115314 m!1249399))

(declare-fun m!1249401 () Bool)

(assert (=> start!115314 m!1249401))

(declare-fun m!1249403 () Bool)

(assert (=> b!1364599 m!1249403))

(declare-fun m!1249405 () Bool)

(assert (=> b!1364599 m!1249405))

(declare-fun m!1249407 () Bool)

(assert (=> b!1364599 m!1249407))

(declare-fun m!1249409 () Bool)

(assert (=> b!1364599 m!1249409))

(push 1)

(assert (not b!1364599))

(assert (not start!115314))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!146511 () Bool)

(declare-fun res!908201 () Bool)

(declare-fun e!773919 () Bool)

(assert (=> d!146511 (=> res!908201 e!773919)))

(assert (=> d!146511 (= res!908201 (is-Nil!31850 l!3677))))

(assert (=> d!146511 (= (subseq!943 l!3677 l!3677) e!773919)))

(declare-fun b!1364626 () Bool)

(declare-fun e!773918 () Bool)

(assert (=> b!1364626 (= e!773918 (subseq!943 (t!46547 l!3677) (t!46547 l!3677)))))

(declare-fun b!1364625 () Bool)

(declare-fun e!773917 () Bool)

(declare-fun e!773920 () Bool)

(assert (=> b!1364625 (= e!773917 e!773920)))

(declare-fun res!908200 () Bool)

(assert (=> b!1364625 (=> res!908200 e!773920)))

(assert (=> b!1364625 (= res!908200 e!773918)))

(declare-fun res!908203 () Bool)

(assert (=> b!1364625 (=> (not res!908203) (not e!773918))))

(assert (=> b!1364625 (= res!908203 (= (h!33058 l!3677) (h!33058 l!3677)))))

(declare-fun b!1364627 () Bool)

(assert (=> b!1364627 (= e!773920 (subseq!943 l!3677 (t!46547 l!3677)))))

(declare-fun b!1364624 () Bool)

(assert (=> b!1364624 (= e!773919 e!773917)))

(declare-fun res!908202 () Bool)

(assert (=> b!1364624 (=> (not res!908202) (not e!773917))))

(assert (=> b!1364624 (= res!908202 (is-Cons!31849 l!3677))))

(assert (= (and d!146511 (not res!908201)) b!1364624))

(assert (= (and b!1364624 res!908202) b!1364625))

(assert (= (and b!1364625 res!908203) b!1364626))

(assert (= (and b!1364625 (not res!908200)) b!1364627))

(declare-fun m!1249415 () Bool)

(assert (=> b!1364626 m!1249415))

(declare-fun m!1249417 () Bool)

(assert (=> b!1364627 m!1249417))

(assert (=> b!1364599 d!146511))

(declare-fun d!146519 () Bool)

(declare-fun res!908211 () Bool)

(declare-fun e!773929 () Bool)

(assert (=> d!146519 (=> res!908211 e!773929)))

(assert (=> d!146519 (= res!908211 (is-Nil!31850 (_2!12210 lt!601137)))))

(assert (=> d!146519 (= (subseq!943 (_2!12210 lt!601137) (_2!12210 lt!601137)) e!773929)))

(declare-fun b!1364638 () Bool)

(declare-fun e!773928 () Bool)

(assert (=> b!1364638 (= e!773928 (subseq!943 (t!46547 (_2!12210 lt!601137)) (t!46547 (_2!12210 lt!601137))))))

(declare-fun b!1364637 () Bool)

(declare-fun e!773927 () Bool)

(declare-fun e!773930 () Bool)

(assert (=> b!1364637 (= e!773927 e!773930)))

(declare-fun res!908210 () Bool)

(assert (=> b!1364637 (=> res!908210 e!773930)))

(assert (=> b!1364637 (= res!908210 e!773928)))

(declare-fun res!908213 () Bool)

(assert (=> b!1364637 (=> (not res!908213) (not e!773928))))

(assert (=> b!1364637 (= res!908213 (= (h!33058 (_2!12210 lt!601137)) (h!33058 (_2!12210 lt!601137))))))

(declare-fun b!1364639 () Bool)

(assert (=> b!1364639 (= e!773930 (subseq!943 (_2!12210 lt!601137) (t!46547 (_2!12210 lt!601137))))))

(declare-fun b!1364636 () Bool)

(assert (=> b!1364636 (= e!773929 e!773927)))

(declare-fun res!908212 () Bool)

(assert (=> b!1364636 (=> (not res!908212) (not e!773927))))

(assert (=> b!1364636 (= res!908212 (is-Cons!31849 (_2!12210 lt!601137)))))

(assert (= (and d!146519 (not res!908211)) b!1364636))

(assert (= (and b!1364636 res!908212) b!1364637))

(assert (= (and b!1364637 res!908213) b!1364638))

(assert (= (and b!1364637 (not res!908210)) b!1364639))

(declare-fun m!1249423 () Bool)

(assert (=> b!1364638 m!1249423))

(declare-fun m!1249425 () Bool)

(assert (=> b!1364639 m!1249425))

(assert (=> b!1364599 d!146519))

(declare-fun d!146523 () Bool)

(assert (=> d!146523 (subseq!943 (_2!12210 lt!601137) (_2!12210 lt!601137))))

(declare-fun lt!601144 () Unit!45031)

