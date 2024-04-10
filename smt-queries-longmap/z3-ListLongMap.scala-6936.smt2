; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87314 () Bool)

(assert start!87314)

(declare-fun b!1012051 () Bool)

(assert (=> b!1012051 true))

(assert (=> b!1012051 true))

(declare-fun b!1012049 () Bool)

(declare-fun e!569324 () Bool)

(declare-fun e!569326 () Bool)

(assert (=> b!1012049 (= e!569324 e!569326)))

(declare-fun res!679857 () Bool)

(assert (=> b!1012049 (=> (not res!679857) (not e!569326))))

(declare-datatypes ((List!21342 0))(
  ( (Nil!21339) (Cons!21338 (h!22536 (_ BitVec 64)) (t!30343 List!21342)) )
))
(declare-fun lt!447294 () List!21342)

(declare-fun isEmpty!779 (List!21342) Bool)

(assert (=> b!1012049 (= res!679857 (not (isEmpty!779 lt!447294)))))

(declare-datatypes ((B!1324 0))(
  ( (B!1325 (val!11746 Int)) )
))
(declare-datatypes ((tuple2!15038 0))(
  ( (tuple2!15039 (_1!7530 (_ BitVec 64)) (_2!7530 B!1324)) )
))
(declare-datatypes ((List!21343 0))(
  ( (Nil!21340) (Cons!21339 (h!22537 tuple2!15038) (t!30344 List!21343)) )
))
(declare-fun l!412 () List!21343)

(declare-fun value!115 () B!1324)

(declare-fun getKeysOf!11 (List!21343 B!1324) List!21342)

(assert (=> b!1012049 (= lt!447294 (getKeysOf!11 (t!30344 l!412) value!115))))

(declare-fun b!1012050 () Bool)

(declare-fun res!679852 () Bool)

(assert (=> b!1012050 (=> (not res!679852) (not e!569324))))

(get-info :version)

(assert (=> b!1012050 (= res!679852 (and ((_ is Cons!21339) l!412) (= (_2!7530 (h!22537 l!412)) value!115)))))

(declare-fun res!679854 () Bool)

(assert (=> b!1012051 (=> (not res!679854) (not e!569326))))

(declare-fun lambda!279 () Int)

(declare-fun forall!205 (List!21342 Int) Bool)

(assert (=> b!1012051 (= res!679854 (forall!205 lt!447294 lambda!279))))

(declare-fun res!679856 () Bool)

(assert (=> start!87314 (=> (not res!679856) (not e!569324))))

(declare-fun isStrictlySorted!526 (List!21343) Bool)

(assert (=> start!87314 (= res!679856 (isStrictlySorted!526 l!412))))

(assert (=> start!87314 e!569324))

(declare-fun e!569325 () Bool)

(assert (=> start!87314 e!569325))

(declare-fun tp_is_empty!23391 () Bool)

(assert (=> start!87314 tp_is_empty!23391))

(declare-fun b!1012052 () Bool)

(declare-fun tp!70250 () Bool)

(assert (=> b!1012052 (= e!569325 (and tp_is_empty!23391 tp!70250))))

(declare-fun b!1012053 () Bool)

(declare-fun res!679855 () Bool)

(assert (=> b!1012053 (=> (not res!679855) (not e!569326))))

(declare-fun isEmpty!780 (List!21343) Bool)

(assert (=> b!1012053 (= res!679855 (not (isEmpty!780 (t!30344 l!412))))))

(declare-fun b!1012054 () Bool)

(assert (=> b!1012054 (= e!569326 (not (forall!205 lt!447294 lambda!279)))))

(declare-fun b!1012055 () Bool)

(declare-fun res!679851 () Bool)

(assert (=> b!1012055 (=> (not res!679851) (not e!569326))))

(assert (=> b!1012055 (= res!679851 (isStrictlySorted!526 (t!30344 l!412)))))

(declare-fun b!1012056 () Bool)

(declare-fun res!679853 () Bool)

(assert (=> b!1012056 (=> (not res!679853) (not e!569326))))

(declare-fun head!921 (List!21343) tuple2!15038)

(assert (=> b!1012056 (= res!679853 (bvslt (_1!7530 (h!22537 l!412)) (_1!7530 (head!921 (t!30344 l!412)))))))

(assert (= (and start!87314 res!679856) b!1012050))

(assert (= (and b!1012050 res!679852) b!1012049))

(assert (= (and b!1012049 res!679857) b!1012055))

(assert (= (and b!1012055 res!679851) b!1012053))

(assert (= (and b!1012053 res!679855) b!1012051))

(assert (= (and b!1012051 res!679854) b!1012056))

(assert (= (and b!1012056 res!679853) b!1012054))

(assert (= (and start!87314 ((_ is Cons!21339) l!412)) b!1012052))

(declare-fun m!935811 () Bool)

(assert (=> b!1012055 m!935811))

(declare-fun m!935813 () Bool)

(assert (=> b!1012049 m!935813))

(declare-fun m!935815 () Bool)

(assert (=> b!1012049 m!935815))

(declare-fun m!935817 () Bool)

(assert (=> b!1012051 m!935817))

(assert (=> b!1012054 m!935817))

(declare-fun m!935819 () Bool)

(assert (=> start!87314 m!935819))

(declare-fun m!935821 () Bool)

(assert (=> b!1012053 m!935821))

(declare-fun m!935823 () Bool)

(assert (=> b!1012056 m!935823))

(check-sat (not b!1012051) (not b!1012052) (not b!1012054) tp_is_empty!23391 (not start!87314) (not b!1012053) (not b!1012055) (not b!1012056) (not b!1012049))
(check-sat)
