; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88114 () Bool)

(assert start!88114)

(declare-fun b!1016706 () Bool)

(assert (=> b!1016706 true))

(assert (=> b!1016706 true))

(declare-fun res!681614 () Bool)

(declare-fun e!572048 () Bool)

(assert (=> start!88114 (=> (not res!681614) (not e!572048))))

(declare-datatypes ((B!1460 0))(
  ( (B!1461 (val!11814 Int)) )
))
(declare-datatypes ((tuple2!15178 0))(
  ( (tuple2!15179 (_1!7600 (_ BitVec 64)) (_2!7600 B!1460)) )
))
(declare-datatypes ((List!21449 0))(
  ( (Nil!21446) (Cons!21445 (h!22652 tuple2!15178) (t!30442 List!21449)) )
))
(declare-fun l!412 () List!21449)

(declare-fun isStrictlySorted!576 (List!21449) Bool)

(assert (=> start!88114 (= res!681614 (isStrictlySorted!576 l!412))))

(assert (=> start!88114 e!572048))

(declare-fun e!572049 () Bool)

(assert (=> start!88114 e!572049))

(declare-fun tp_is_empty!23527 () Bool)

(assert (=> start!88114 tp_is_empty!23527))

(declare-fun b!1016705 () Bool)

(declare-fun res!681613 () Bool)

(assert (=> b!1016705 (=> (not res!681613) (not e!572048))))

(declare-fun value!115 () B!1460)

(get-info :version)

(assert (=> b!1016705 (= res!681613 (and (or (not ((_ is Cons!21445) l!412)) (not (= (_2!7600 (h!22652 l!412)) value!115))) (or (not ((_ is Cons!21445) l!412)) (= (_2!7600 (h!22652 l!412)) value!115)) ((_ is Nil!21446) l!412)))))

(declare-fun lambda!893 () Int)

(declare-datatypes ((List!21450 0))(
  ( (Nil!21447) (Cons!21446 (h!22653 (_ BitVec 64)) (t!30443 List!21450)) )
))
(declare-fun forall!255 (List!21450 Int) Bool)

(assert (=> b!1016706 (= e!572048 (not (forall!255 Nil!21447 lambda!893)))))

(declare-fun b!1016707 () Bool)

(declare-fun tp!70611 () Bool)

(assert (=> b!1016707 (= e!572049 (and tp_is_empty!23527 tp!70611))))

(assert (= (and start!88114 res!681614) b!1016705))

(assert (= (and b!1016705 res!681613) b!1016706))

(assert (= (and start!88114 ((_ is Cons!21445) l!412)) b!1016707))

(declare-fun m!939185 () Bool)

(assert (=> start!88114 m!939185))

(declare-fun m!939187 () Bool)

(assert (=> b!1016706 m!939187))

(check-sat (not start!88114) (not b!1016706) (not b!1016707) tp_is_empty!23527)
(check-sat)
(get-model)

(declare-fun d!121433 () Bool)

(declare-fun res!681631 () Bool)

(declare-fun e!572066 () Bool)

(assert (=> d!121433 (=> res!681631 e!572066)))

(assert (=> d!121433 (= res!681631 (or ((_ is Nil!21446) l!412) ((_ is Nil!21446) (t!30442 l!412))))))

(assert (=> d!121433 (= (isStrictlySorted!576 l!412) e!572066)))

(declare-fun b!1016742 () Bool)

(declare-fun e!572067 () Bool)

(assert (=> b!1016742 (= e!572066 e!572067)))

(declare-fun res!681632 () Bool)

(assert (=> b!1016742 (=> (not res!681632) (not e!572067))))

(assert (=> b!1016742 (= res!681632 (bvslt (_1!7600 (h!22652 l!412)) (_1!7600 (h!22652 (t!30442 l!412)))))))

(declare-fun b!1016743 () Bool)

(assert (=> b!1016743 (= e!572067 (isStrictlySorted!576 (t!30442 l!412)))))

(assert (= (and d!121433 (not res!681631)) b!1016742))

(assert (= (and b!1016742 res!681632) b!1016743))

(declare-fun m!939197 () Bool)

(assert (=> b!1016743 m!939197))

(assert (=> start!88114 d!121433))

(declare-fun d!121435 () Bool)

(declare-fun res!681637 () Bool)

(declare-fun e!572072 () Bool)

(assert (=> d!121435 (=> res!681637 e!572072)))

(assert (=> d!121435 (= res!681637 ((_ is Nil!21447) Nil!21447))))

(assert (=> d!121435 (= (forall!255 Nil!21447 lambda!893) e!572072)))

(declare-fun b!1016748 () Bool)

(declare-fun e!572073 () Bool)

(assert (=> b!1016748 (= e!572072 e!572073)))

(declare-fun res!681638 () Bool)

(assert (=> b!1016748 (=> (not res!681638) (not e!572073))))

(declare-fun dynLambda!1924 (Int (_ BitVec 64)) Bool)

(assert (=> b!1016748 (= res!681638 (dynLambda!1924 lambda!893 (h!22653 Nil!21447)))))

(declare-fun b!1016749 () Bool)

(assert (=> b!1016749 (= e!572073 (forall!255 (t!30443 Nil!21447) lambda!893))))

(assert (= (and d!121435 (not res!681637)) b!1016748))

(assert (= (and b!1016748 res!681638) b!1016749))

(declare-fun b_lambda!15429 () Bool)

(assert (=> (not b_lambda!15429) (not b!1016748)))

(declare-fun m!939199 () Bool)

(assert (=> b!1016748 m!939199))

(declare-fun m!939201 () Bool)

(assert (=> b!1016749 m!939201))

(assert (=> b!1016706 d!121435))

(declare-fun b!1016754 () Bool)

(declare-fun e!572076 () Bool)

(declare-fun tp!70620 () Bool)

(assert (=> b!1016754 (= e!572076 (and tp_is_empty!23527 tp!70620))))

(assert (=> b!1016707 (= tp!70611 e!572076)))

(assert (= (and b!1016707 ((_ is Cons!21445) (t!30442 l!412))) b!1016754))

(declare-fun b_lambda!15431 () Bool)

(assert (= b_lambda!15429 (or b!1016706 b_lambda!15431)))

(declare-fun bs!29456 () Bool)

(declare-fun d!121437 () Bool)

(assert (= bs!29456 (and d!121437 b!1016706)))

(declare-datatypes ((Option!582 0))(
  ( (Some!581 (v!14432 B!1460)) (None!580) )
))
(declare-fun getValueByKey!531 (List!21449 (_ BitVec 64)) Option!582)

(assert (=> bs!29456 (= (dynLambda!1924 lambda!893 (h!22653 Nil!21447)) (= (getValueByKey!531 l!412 (h!22653 Nil!21447)) (Some!581 value!115)))))

(declare-fun m!939203 () Bool)

(assert (=> bs!29456 m!939203))

(assert (=> b!1016748 d!121437))

(check-sat (not b!1016754) (not b!1016749) (not bs!29456) tp_is_empty!23527 (not b_lambda!15431) (not b!1016743))
(check-sat)
