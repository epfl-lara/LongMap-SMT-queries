; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87950 () Bool)

(assert start!87950)

(declare-fun b!1015736 () Bool)

(assert (=> b!1015736 true))

(assert (=> b!1015736 true))

(declare-fun b!1015734 () Bool)

(declare-fun e!571400 () Bool)

(declare-datatypes ((List!21495 0))(
  ( (Nil!21492) (Cons!21491 (h!22689 (_ BitVec 64)) (t!30496 List!21495)) )
))
(declare-fun keys!40 () List!21495)

(declare-fun lambda!940 () Int)

(declare-fun forall!266 (List!21495 Int) Bool)

(assert (=> b!1015734 (= e!571400 (forall!266 (t!30496 keys!40) lambda!940))))

(declare-fun res!681311 () Bool)

(declare-fun e!571401 () Bool)

(assert (=> start!87950 (=> (not res!681311) (not e!571401))))

(declare-datatypes ((B!1504 0))(
  ( (B!1505 (val!11836 Int)) )
))
(declare-datatypes ((tuple2!15218 0))(
  ( (tuple2!15219 (_1!7620 (_ BitVec 64)) (_2!7620 B!1504)) )
))
(declare-datatypes ((List!21496 0))(
  ( (Nil!21493) (Cons!21492 (h!22690 tuple2!15218) (t!30497 List!21496)) )
))
(declare-fun l!1114 () List!21496)

(declare-fun isStrictlySorted!604 (List!21496) Bool)

(assert (=> start!87950 (= res!681311 (isStrictlySorted!604 l!1114))))

(assert (=> start!87950 e!571401))

(declare-fun e!571402 () Bool)

(assert (=> start!87950 e!571402))

(assert (=> start!87950 true))

(declare-fun tp_is_empty!23571 () Bool)

(assert (=> start!87950 tp_is_empty!23571))

(declare-fun b!1015735 () Bool)

(assert (=> b!1015735 (= e!571401 (not e!571400))))

(declare-fun res!681310 () Bool)

(assert (=> b!1015735 (=> res!681310 e!571400)))

(assert (=> b!1015735 (= res!681310 (not (forall!266 (t!30496 keys!40) lambda!940)))))

(declare-fun lt!449173 () List!21496)

(declare-datatypes ((Option!590 0))(
  ( (Some!589 (v!14440 B!1504)) (None!588) )
))
(declare-fun isDefined!393 (Option!590) Bool)

(declare-fun getValueByKey!539 (List!21496 (_ BitVec 64)) Option!590)

(assert (=> b!1015735 (isDefined!393 (getValueByKey!539 lt!449173 (h!22689 keys!40)))))

(declare-datatypes ((Unit!33235 0))(
  ( (Unit!33236) )
))
(declare-fun lt!449175 () Unit!33235)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!378 (List!21496 (_ BitVec 64)) Unit!33235)

(assert (=> b!1015735 (= lt!449175 (lemmaContainsKeyImpliesGetValueByKeyDefined!378 lt!449173 (h!22689 keys!40)))))

(declare-fun newHead!31 () tuple2!15218)

(assert (=> b!1015735 (= lt!449173 (Cons!21492 newHead!31 l!1114))))

(declare-fun containsKey!485 (List!21496 (_ BitVec 64)) Bool)

(assert (=> b!1015735 (containsKey!485 l!1114 (h!22689 keys!40))))

(declare-fun lt!449174 () Unit!33235)

(declare-fun lemmaGetValueByKeyIsDefinedImpliesContainsKey!5 (List!21496 (_ BitVec 64)) Unit!33235)

(assert (=> b!1015735 (= lt!449174 (lemmaGetValueByKeyIsDefinedImpliesContainsKey!5 l!1114 (h!22689 keys!40)))))

(declare-fun res!681314 () Bool)

(assert (=> b!1015736 (=> (not res!681314) (not e!571401))))

(assert (=> b!1015736 (= res!681314 (forall!266 keys!40 lambda!940))))

(declare-fun b!1015737 () Bool)

(declare-fun res!681315 () Bool)

(assert (=> b!1015737 (=> (not res!681315) (not e!571401))))

(declare-fun isEmpty!863 (List!21496) Bool)

(assert (=> b!1015737 (= res!681315 (not (isEmpty!863 l!1114)))))

(declare-fun b!1015738 () Bool)

(declare-fun res!681312 () Bool)

(assert (=> b!1015738 (=> (not res!681312) (not e!571401))))

(declare-fun head!953 (List!21496) tuple2!15218)

(assert (=> b!1015738 (= res!681312 (bvslt (_1!7620 newHead!31) (_1!7620 (head!953 l!1114))))))

(declare-fun b!1015739 () Bool)

(declare-fun res!681313 () Bool)

(assert (=> b!1015739 (=> (not res!681313) (not e!571401))))

(get-info :version)

(assert (=> b!1015739 (= res!681313 ((_ is Cons!21491) keys!40))))

(declare-fun b!1015740 () Bool)

(declare-fun tp!70694 () Bool)

(assert (=> b!1015740 (= e!571402 (and tp_is_empty!23571 tp!70694))))

(assert (= (and start!87950 res!681311) b!1015737))

(assert (= (and b!1015737 res!681315) b!1015736))

(assert (= (and b!1015736 res!681314) b!1015738))

(assert (= (and b!1015738 res!681312) b!1015739))

(assert (= (and b!1015739 res!681313) b!1015735))

(assert (= (and b!1015735 (not res!681310)) b!1015734))

(assert (= (and start!87950 ((_ is Cons!21492) l!1114)) b!1015740))

(declare-fun m!937657 () Bool)

(assert (=> b!1015738 m!937657))

(declare-fun m!937659 () Bool)

(assert (=> b!1015735 m!937659))

(declare-fun m!937661 () Bool)

(assert (=> b!1015735 m!937661))

(declare-fun m!937663 () Bool)

(assert (=> b!1015735 m!937663))

(declare-fun m!937665 () Bool)

(assert (=> b!1015735 m!937665))

(declare-fun m!937667 () Bool)

(assert (=> b!1015735 m!937667))

(assert (=> b!1015735 m!937661))

(declare-fun m!937669 () Bool)

(assert (=> b!1015735 m!937669))

(declare-fun m!937671 () Bool)

(assert (=> start!87950 m!937671))

(declare-fun m!937673 () Bool)

(assert (=> b!1015737 m!937673))

(declare-fun m!937675 () Bool)

(assert (=> b!1015736 m!937675))

(assert (=> b!1015734 m!937659))

(check-sat (not b!1015736) tp_is_empty!23571 (not b!1015740) (not start!87950) (not b!1015738) (not b!1015737) (not b!1015734) (not b!1015735))
