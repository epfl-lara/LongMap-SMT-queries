; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88138 () Bool)

(assert start!88138)

(declare-fun b!1016814 () Bool)

(assert (=> b!1016814 true))

(assert (=> b!1016814 true))

(declare-fun res!681676 () Bool)

(declare-fun e!572130 () Bool)

(assert (=> start!88138 (=> (not res!681676) (not e!572130))))

(declare-datatypes ((B!1472 0))(
  ( (B!1473 (val!11820 Int)) )
))
(declare-datatypes ((tuple2!15190 0))(
  ( (tuple2!15191 (_1!7606 (_ BitVec 64)) (_2!7606 B!1472)) )
))
(declare-datatypes ((List!21458 0))(
  ( (Nil!21455) (Cons!21454 (h!22661 tuple2!15190) (t!30451 List!21458)) )
))
(declare-fun l!412 () List!21458)

(declare-fun isStrictlySorted!582 (List!21458) Bool)

(assert (=> start!88138 (= res!681676 (isStrictlySorted!582 l!412))))

(assert (=> start!88138 e!572130))

(declare-fun e!572129 () Bool)

(assert (=> start!88138 e!572129))

(declare-fun tp_is_empty!23539 () Bool)

(assert (=> start!88138 tp_is_empty!23539))

(declare-fun b!1016813 () Bool)

(declare-fun res!681677 () Bool)

(assert (=> b!1016813 (=> (not res!681677) (not e!572130))))

(declare-fun value!115 () B!1472)

(get-info :version)

(assert (=> b!1016813 (= res!681677 (and (or (not ((_ is Cons!21454) l!412)) (not (= (_2!7606 (h!22661 l!412)) value!115))) (or (not ((_ is Cons!21454) l!412)) (= (_2!7606 (h!22661 l!412)) value!115)) (not ((_ is Nil!21455) l!412))))))

(declare-datatypes ((List!21459 0))(
  ( (Nil!21456) (Cons!21455 (h!22662 (_ BitVec 64)) (t!30452 List!21459)) )
))
(declare-fun err!111 () List!21459)

(declare-fun lambda!902 () Int)

(declare-fun forall!258 (List!21459 Int) Bool)

(assert (=> b!1016814 (= e!572130 (not (forall!258 err!111 lambda!902)))))

(assert (=> b!1016814 true))

(declare-fun b!1016815 () Bool)

(declare-fun tp!70638 () Bool)

(assert (=> b!1016815 (= e!572129 (and tp_is_empty!23539 tp!70638))))

(assert (= (and start!88138 res!681676) b!1016813))

(assert (= (and b!1016813 res!681677) b!1016814))

(assert (= (and start!88138 ((_ is Cons!21454) l!412)) b!1016815))

(declare-fun m!939227 () Bool)

(assert (=> start!88138 m!939227))

(declare-fun m!939229 () Bool)

(assert (=> b!1016814 m!939229))

(check-sat (not start!88138) (not b!1016814) (not b!1016815) tp_is_empty!23539)
(check-sat)
