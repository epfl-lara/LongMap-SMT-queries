; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87276 () Bool)

(assert start!87276)

(declare-fun res!679667 () Bool)

(declare-fun e!569099 () Bool)

(assert (=> start!87276 (=> (not res!679667) (not e!569099))))

(declare-datatypes ((B!1310 0))(
  ( (B!1311 (val!11739 Int)) )
))
(declare-datatypes ((tuple2!15104 0))(
  ( (tuple2!15105 (_1!7563 (_ BitVec 64)) (_2!7563 B!1310)) )
))
(declare-datatypes ((List!21366 0))(
  ( (Nil!21363) (Cons!21362 (h!22560 tuple2!15104) (t!30358 List!21366)) )
))
(declare-fun l!412 () List!21366)

(declare-fun isStrictlySorted!515 (List!21366) Bool)

(assert (=> start!87276 (= res!679667 (isStrictlySorted!515 l!412))))

(assert (=> start!87276 e!569099))

(declare-fun e!569098 () Bool)

(assert (=> start!87276 e!569098))

(declare-fun tp_is_empty!23377 () Bool)

(assert (=> start!87276 tp_is_empty!23377))

(declare-fun b!1011650 () Bool)

(declare-fun res!679666 () Bool)

(assert (=> b!1011650 (=> (not res!679666) (not e!569099))))

(declare-fun value!115 () B!1310)

(get-info :version)

(assert (=> b!1011650 (= res!679666 (and ((_ is Cons!21362) l!412) (= (_2!7563 (h!22560 l!412)) value!115)))))

(declare-fun b!1011651 () Bool)

(assert (=> b!1011651 (= e!569099 (not (isStrictlySorted!515 (t!30358 l!412))))))

(declare-fun b!1011652 () Bool)

(declare-fun tp!70212 () Bool)

(assert (=> b!1011652 (= e!569098 (and tp_is_empty!23377 tp!70212))))

(assert (= (and start!87276 res!679667) b!1011650))

(assert (= (and b!1011650 res!679666) b!1011651))

(assert (= (and start!87276 ((_ is Cons!21362) l!412)) b!1011652))

(declare-fun m!935101 () Bool)

(assert (=> start!87276 m!935101))

(declare-fun m!935103 () Bool)

(assert (=> b!1011651 m!935103))

(check-sat (not b!1011651) (not start!87276) (not b!1011652) tp_is_empty!23377)
(check-sat)
(get-model)

(declare-fun d!120055 () Bool)

(declare-fun res!679692 () Bool)

(declare-fun e!569124 () Bool)

(assert (=> d!120055 (=> res!679692 e!569124)))

(assert (=> d!120055 (= res!679692 (or ((_ is Nil!21363) (t!30358 l!412)) ((_ is Nil!21363) (t!30358 (t!30358 l!412)))))))

(assert (=> d!120055 (= (isStrictlySorted!515 (t!30358 l!412)) e!569124)))

(declare-fun b!1011683 () Bool)

(declare-fun e!569125 () Bool)

(assert (=> b!1011683 (= e!569124 e!569125)))

(declare-fun res!679693 () Bool)

(assert (=> b!1011683 (=> (not res!679693) (not e!569125))))

(assert (=> b!1011683 (= res!679693 (bvslt (_1!7563 (h!22560 (t!30358 l!412))) (_1!7563 (h!22560 (t!30358 (t!30358 l!412))))))))

(declare-fun b!1011684 () Bool)

(assert (=> b!1011684 (= e!569125 (isStrictlySorted!515 (t!30358 (t!30358 l!412))))))

(assert (= (and d!120055 (not res!679692)) b!1011683))

(assert (= (and b!1011683 res!679693) b!1011684))

(declare-fun m!935113 () Bool)

(assert (=> b!1011684 m!935113))

(assert (=> b!1011651 d!120055))

(declare-fun d!120061 () Bool)

(declare-fun res!679696 () Bool)

(declare-fun e!569128 () Bool)

(assert (=> d!120061 (=> res!679696 e!569128)))

(assert (=> d!120061 (= res!679696 (or ((_ is Nil!21363) l!412) ((_ is Nil!21363) (t!30358 l!412))))))

(assert (=> d!120061 (= (isStrictlySorted!515 l!412) e!569128)))

(declare-fun b!1011687 () Bool)

(declare-fun e!569129 () Bool)

(assert (=> b!1011687 (= e!569128 e!569129)))

(declare-fun res!679697 () Bool)

(assert (=> b!1011687 (=> (not res!679697) (not e!569129))))

(assert (=> b!1011687 (= res!679697 (bvslt (_1!7563 (h!22560 l!412)) (_1!7563 (h!22560 (t!30358 l!412)))))))

(declare-fun b!1011688 () Bool)

(assert (=> b!1011688 (= e!569129 (isStrictlySorted!515 (t!30358 l!412)))))

(assert (= (and d!120061 (not res!679696)) b!1011687))

(assert (= (and b!1011687 res!679697) b!1011688))

(assert (=> b!1011688 m!935103))

(assert (=> start!87276 d!120061))

(declare-fun b!1011707 () Bool)

(declare-fun e!569142 () Bool)

(declare-fun tp!70225 () Bool)

(assert (=> b!1011707 (= e!569142 (and tp_is_empty!23377 tp!70225))))

(assert (=> b!1011652 (= tp!70212 e!569142)))

(assert (= (and b!1011652 ((_ is Cons!21362) (t!30358 l!412))) b!1011707))

(check-sat (not b!1011688) (not b!1011684) (not b!1011707) tp_is_empty!23377)
(check-sat)
