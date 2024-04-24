; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88602 () Bool)

(assert start!88602)

(declare-fun b!1018621 () Bool)

(assert (=> b!1018621 true))

(assert (=> b!1018621 true))

(declare-fun bs!29607 () Bool)

(declare-fun b!1018622 () Bool)

(assert (= bs!29607 (and b!1018622 b!1018621)))

(declare-datatypes ((B!1556 0))(
  ( (B!1557 (val!11862 Int)) )
))
(declare-datatypes ((tuple2!15274 0))(
  ( (tuple2!15275 (_1!7648 (_ BitVec 64)) (_2!7648 B!1556)) )
))
(declare-datatypes ((List!21536 0))(
  ( (Nil!21533) (Cons!21532 (h!22739 tuple2!15274) (t!30529 List!21536)) )
))
(declare-fun l!1114 () List!21536)

(declare-fun newHead!31 () tuple2!15274)

(declare-fun lambda!1108 () Int)

(declare-fun lambda!1109 () Int)

(assert (=> bs!29607 (= (= (Cons!21532 newHead!31 l!1114) l!1114) (= lambda!1109 lambda!1108))))

(assert (=> b!1018622 true))

(assert (=> b!1018622 true))

(assert (=> b!1018622 true))

(declare-fun b!1018618 () Bool)

(declare-fun res!682835 () Bool)

(declare-fun e!573190 () Bool)

(assert (=> b!1018618 (=> (not res!682835) (not e!573190))))

(declare-datatypes ((List!21537 0))(
  ( (Nil!21534) (Cons!21533 (h!22740 (_ BitVec 64)) (t!30530 List!21537)) )
))
(declare-fun keys!40 () List!21537)

(get-info :version)

(assert (=> b!1018618 (= res!682835 (not ((_ is Cons!21533) keys!40)))))

(declare-fun b!1018619 () Bool)

(declare-fun res!682836 () Bool)

(assert (=> b!1018619 (=> (not res!682836) (not e!573190))))

(declare-fun isEmpty!908 (List!21536) Bool)

(assert (=> b!1018619 (= res!682836 (not (isEmpty!908 l!1114)))))

(declare-fun res!682834 () Bool)

(assert (=> start!88602 (=> (not res!682834) (not e!573190))))

(declare-fun isStrictlySorted!618 (List!21536) Bool)

(assert (=> start!88602 (= res!682834 (isStrictlySorted!618 l!1114))))

(assert (=> start!88602 e!573190))

(declare-fun e!573189 () Bool)

(assert (=> start!88602 e!573189))

(assert (=> start!88602 true))

(declare-fun tp_is_empty!23623 () Bool)

(assert (=> start!88602 tp_is_empty!23623))

(declare-fun b!1018620 () Bool)

(declare-fun res!682832 () Bool)

(assert (=> b!1018620 (=> (not res!682832) (not e!573190))))

(declare-fun head!975 (List!21536) tuple2!15274)

(assert (=> b!1018620 (= res!682832 (bvslt (_1!7648 newHead!31) (_1!7648 (head!975 l!1114))))))

(declare-fun res!682833 () Bool)

(assert (=> b!1018621 (=> (not res!682833) (not e!573190))))

(declare-fun forall!294 (List!21537 Int) Bool)

(assert (=> b!1018621 (= res!682833 (forall!294 keys!40 lambda!1108))))

(assert (=> b!1018622 (= e!573190 (not (forall!294 keys!40 lambda!1109)))))

(declare-fun b!1018623 () Bool)

(declare-fun tp!70847 () Bool)

(assert (=> b!1018623 (= e!573189 (and tp_is_empty!23623 tp!70847))))

(assert (= (and start!88602 res!682834) b!1018619))

(assert (= (and b!1018619 res!682836) b!1018621))

(assert (= (and b!1018621 res!682833) b!1018620))

(assert (= (and b!1018620 res!682832) b!1018618))

(assert (= (and b!1018618 res!682835) b!1018622))

(assert (= (and start!88602 ((_ is Cons!21532) l!1114)) b!1018623))

(declare-fun m!940383 () Bool)

(assert (=> b!1018620 m!940383))

(declare-fun m!940385 () Bool)

(assert (=> b!1018622 m!940385))

(declare-fun m!940387 () Bool)

(assert (=> start!88602 m!940387))

(declare-fun m!940389 () Bool)

(assert (=> b!1018619 m!940389))

(declare-fun m!940391 () Bool)

(assert (=> b!1018621 m!940391))

(check-sat (not b!1018620) (not start!88602) (not b!1018621) (not b!1018623) (not b!1018619) (not b!1018622) tp_is_empty!23623)
(check-sat)
(get-model)

(declare-fun d!122041 () Bool)

(declare-fun res!682871 () Bool)

(declare-fun e!573207 () Bool)

(assert (=> d!122041 (=> res!682871 e!573207)))

(assert (=> d!122041 (= res!682871 ((_ is Nil!21534) keys!40))))

(assert (=> d!122041 (= (forall!294 keys!40 lambda!1109) e!573207)))

(declare-fun b!1018682 () Bool)

(declare-fun e!573208 () Bool)

(assert (=> b!1018682 (= e!573207 e!573208)))

(declare-fun res!682872 () Bool)

(assert (=> b!1018682 (=> (not res!682872) (not e!573208))))

(declare-fun dynLambda!1950 (Int (_ BitVec 64)) Bool)

(assert (=> b!1018682 (= res!682872 (dynLambda!1950 lambda!1109 (h!22740 keys!40)))))

(declare-fun b!1018683 () Bool)

(assert (=> b!1018683 (= e!573208 (forall!294 (t!30530 keys!40) lambda!1109))))

(assert (= (and d!122041 (not res!682871)) b!1018682))

(assert (= (and b!1018682 res!682872) b!1018683))

(declare-fun b_lambda!15637 () Bool)

(assert (=> (not b_lambda!15637) (not b!1018682)))

(declare-fun m!940413 () Bool)

(assert (=> b!1018682 m!940413))

(declare-fun m!940415 () Bool)

(assert (=> b!1018683 m!940415))

(assert (=> b!1018622 d!122041))

(declare-fun d!122045 () Bool)

(declare-fun res!682885 () Bool)

(declare-fun e!573221 () Bool)

(assert (=> d!122045 (=> res!682885 e!573221)))

(assert (=> d!122045 (= res!682885 (or ((_ is Nil!21533) l!1114) ((_ is Nil!21533) (t!30529 l!1114))))))

(assert (=> d!122045 (= (isStrictlySorted!618 l!1114) e!573221)))

(declare-fun b!1018696 () Bool)

(declare-fun e!573222 () Bool)

(assert (=> b!1018696 (= e!573221 e!573222)))

(declare-fun res!682886 () Bool)

(assert (=> b!1018696 (=> (not res!682886) (not e!573222))))

(assert (=> b!1018696 (= res!682886 (bvslt (_1!7648 (h!22739 l!1114)) (_1!7648 (h!22739 (t!30529 l!1114)))))))

(declare-fun b!1018697 () Bool)

(assert (=> b!1018697 (= e!573222 (isStrictlySorted!618 (t!30529 l!1114)))))

(assert (= (and d!122045 (not res!682885)) b!1018696))

(assert (= (and b!1018696 res!682886) b!1018697))

(declare-fun m!940425 () Bool)

(assert (=> b!1018697 m!940425))

(assert (=> start!88602 d!122045))

(declare-fun d!122055 () Bool)

(declare-fun res!682887 () Bool)

(declare-fun e!573223 () Bool)

(assert (=> d!122055 (=> res!682887 e!573223)))

(assert (=> d!122055 (= res!682887 ((_ is Nil!21534) keys!40))))

(assert (=> d!122055 (= (forall!294 keys!40 lambda!1108) e!573223)))

(declare-fun b!1018698 () Bool)

(declare-fun e!573224 () Bool)

(assert (=> b!1018698 (= e!573223 e!573224)))

(declare-fun res!682888 () Bool)

(assert (=> b!1018698 (=> (not res!682888) (not e!573224))))

(assert (=> b!1018698 (= res!682888 (dynLambda!1950 lambda!1108 (h!22740 keys!40)))))

(declare-fun b!1018699 () Bool)

(assert (=> b!1018699 (= e!573224 (forall!294 (t!30530 keys!40) lambda!1108))))

(assert (= (and d!122055 (not res!682887)) b!1018698))

(assert (= (and b!1018698 res!682888) b!1018699))

(declare-fun b_lambda!15643 () Bool)

(assert (=> (not b_lambda!15643) (not b!1018698)))

(declare-fun m!940427 () Bool)

(assert (=> b!1018698 m!940427))

(declare-fun m!940429 () Bool)

(assert (=> b!1018699 m!940429))

(assert (=> b!1018621 d!122055))

(declare-fun d!122057 () Bool)

(assert (=> d!122057 (= (head!975 l!1114) (h!22739 l!1114))))

(assert (=> b!1018620 d!122057))

(declare-fun d!122059 () Bool)

(assert (=> d!122059 (= (isEmpty!908 l!1114) ((_ is Nil!21533) l!1114))))

(assert (=> b!1018619 d!122059))

(declare-fun b!1018712 () Bool)

(declare-fun e!573233 () Bool)

(declare-fun tp!70856 () Bool)

(assert (=> b!1018712 (= e!573233 (and tp_is_empty!23623 tp!70856))))

(assert (=> b!1018623 (= tp!70847 e!573233)))

(assert (= (and b!1018623 ((_ is Cons!21532) (t!30529 l!1114))) b!1018712))

(declare-fun b_lambda!15645 () Bool)

(assert (= b_lambda!15643 (or b!1018621 b_lambda!15645)))

(declare-fun bs!29610 () Bool)

(declare-fun d!122063 () Bool)

(assert (= bs!29610 (and d!122063 b!1018621)))

(declare-fun value!178 () B!1556)

(declare-datatypes ((Option!611 0))(
  ( (Some!610 (v!14461 B!1556)) (None!609) )
))
(declare-fun getValueByKey!560 (List!21536 (_ BitVec 64)) Option!611)

(assert (=> bs!29610 (= (dynLambda!1950 lambda!1108 (h!22740 keys!40)) (= (getValueByKey!560 l!1114 (h!22740 keys!40)) (Some!610 value!178)))))

(declare-fun m!940433 () Bool)

(assert (=> bs!29610 m!940433))

(assert (=> b!1018698 d!122063))

(declare-fun b_lambda!15647 () Bool)

(assert (= b_lambda!15637 (or b!1018622 b_lambda!15647)))

(declare-fun bs!29611 () Bool)

(declare-fun d!122065 () Bool)

(assert (= bs!29611 (and d!122065 b!1018622)))

(assert (=> bs!29611 (= (dynLambda!1950 lambda!1109 (h!22740 keys!40)) (= (getValueByKey!560 (Cons!21532 newHead!31 l!1114) (h!22740 keys!40)) (Some!610 value!178)))))

(declare-fun m!940435 () Bool)

(assert (=> bs!29611 m!940435))

(assert (=> b!1018682 d!122065))

(check-sat (not b!1018699) (not b!1018683) (not bs!29611) (not b_lambda!15645) (not b!1018712) (not bs!29610) (not b_lambda!15647) (not b!1018697) tp_is_empty!23623)
(check-sat)
