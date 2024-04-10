; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87414 () Bool)

(assert start!87414)

(declare-fun b!1012772 () Bool)

(assert (=> b!1012772 true))

(assert (=> b!1012772 true))

(declare-fun b!1012768 () Bool)

(declare-fun res!680136 () Bool)

(declare-fun e!569717 () Bool)

(assert (=> b!1012768 (=> (not res!680136) (not e!569717))))

(declare-datatypes ((B!1358 0))(
  ( (B!1359 (val!11763 Int)) )
))
(declare-datatypes ((tuple2!15072 0))(
  ( (tuple2!15073 (_1!7547 (_ BitVec 64)) (_2!7547 B!1358)) )
))
(declare-datatypes ((List!21373 0))(
  ( (Nil!21370) (Cons!21369 (h!22567 tuple2!15072) (t!30374 List!21373)) )
))
(declare-fun l!412 () List!21373)

(declare-fun isStrictlySorted!543 (List!21373) Bool)

(assert (=> b!1012768 (= res!680136 (isStrictlySorted!543 (t!30374 l!412)))))

(declare-fun b!1012769 () Bool)

(declare-fun res!680138 () Bool)

(assert (=> b!1012769 (=> (not res!680138) (not e!569717))))

(declare-fun head!926 (List!21373) tuple2!15072)

(assert (=> b!1012769 (= res!680138 (bvslt (_1!7547 (h!22567 l!412)) (_1!7547 (head!926 (t!30374 l!412)))))))

(declare-fun b!1012770 () Bool)

(declare-datatypes ((List!21374 0))(
  ( (Nil!21371) (Cons!21370 (h!22568 (_ BitVec 64)) (t!30375 List!21374)) )
))
(declare-fun lt!447696 () List!21374)

(declare-fun lambda!406 () Int)

(declare-fun forall!218 (List!21374 Int) Bool)

(assert (=> b!1012770 (= e!569717 (not (forall!218 lt!447696 lambda!406)))))

(declare-fun res!680139 () Bool)

(declare-fun e!569719 () Bool)

(assert (=> start!87414 (=> (not res!680139) (not e!569719))))

(assert (=> start!87414 (= res!680139 (isStrictlySorted!543 l!412))))

(assert (=> start!87414 e!569719))

(declare-fun e!569718 () Bool)

(assert (=> start!87414 e!569718))

(declare-fun tp_is_empty!23425 () Bool)

(assert (=> start!87414 tp_is_empty!23425))

(declare-fun b!1012771 () Bool)

(declare-fun tp!70337 () Bool)

(assert (=> b!1012771 (= e!569718 (and tp_is_empty!23425 tp!70337))))

(declare-fun res!680134 () Bool)

(assert (=> b!1012772 (=> (not res!680134) (not e!569717))))

(assert (=> b!1012772 (= res!680134 (forall!218 lt!447696 lambda!406))))

(declare-fun b!1012773 () Bool)

(assert (=> b!1012773 (= e!569719 e!569717)))

(declare-fun res!680135 () Bool)

(assert (=> b!1012773 (=> (not res!680135) (not e!569717))))

(declare-fun isEmpty!798 (List!21374) Bool)

(assert (=> b!1012773 (= res!680135 (not (isEmpty!798 lt!447696)))))

(declare-fun value!115 () B!1358)

(declare-fun getKeysOf!25 (List!21373 B!1358) List!21374)

(assert (=> b!1012773 (= lt!447696 (getKeysOf!25 (t!30374 l!412) value!115))))

(declare-fun b!1012774 () Bool)

(declare-fun res!680137 () Bool)

(assert (=> b!1012774 (=> (not res!680137) (not e!569717))))

(declare-fun isEmpty!799 (List!21373) Bool)

(assert (=> b!1012774 (= res!680137 (not (isEmpty!799 (t!30374 l!412))))))

(declare-fun b!1012775 () Bool)

(declare-fun res!680133 () Bool)

(assert (=> b!1012775 (=> (not res!680133) (not e!569719))))

(assert (=> b!1012775 (= res!680133 (and (not (= (_2!7547 (h!22567 l!412)) value!115)) (is-Cons!21369 l!412)))))

(assert (= (and start!87414 res!680139) b!1012775))

(assert (= (and b!1012775 res!680133) b!1012773))

(assert (= (and b!1012773 res!680135) b!1012768))

(assert (= (and b!1012768 res!680136) b!1012774))

(assert (= (and b!1012774 res!680137) b!1012772))

(assert (= (and b!1012772 res!680134) b!1012769))

(assert (= (and b!1012769 res!680138) b!1012770))

(assert (= (and start!87414 (is-Cons!21369 l!412)) b!1012771))

(declare-fun m!936111 () Bool)

(assert (=> b!1012772 m!936111))

(declare-fun m!936113 () Bool)

(assert (=> b!1012769 m!936113))

(assert (=> b!1012770 m!936111))

(declare-fun m!936115 () Bool)

(assert (=> b!1012768 m!936115))

(declare-fun m!936117 () Bool)

(assert (=> b!1012774 m!936117))

(declare-fun m!936119 () Bool)

(assert (=> start!87414 m!936119))

(declare-fun m!936121 () Bool)

(assert (=> b!1012773 m!936121))

(declare-fun m!936123 () Bool)

(assert (=> b!1012773 m!936123))

(push 1)

(assert (not b!1012768))

(assert (not b!1012773))

(assert tp_is_empty!23425)

