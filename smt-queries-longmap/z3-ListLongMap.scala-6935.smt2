; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87290 () Bool)

(assert start!87290)

(declare-fun b!1011861 () Bool)

(declare-fun res!679780 () Bool)

(declare-fun e!569233 () Bool)

(assert (=> b!1011861 (=> (not res!679780) (not e!569233))))

(declare-datatypes ((B!1318 0))(
  ( (B!1319 (val!11743 Int)) )
))
(declare-datatypes ((tuple2!15032 0))(
  ( (tuple2!15033 (_1!7527 (_ BitVec 64)) (_2!7527 B!1318)) )
))
(declare-datatypes ((List!21336 0))(
  ( (Nil!21333) (Cons!21332 (h!22530 tuple2!15032) (t!30337 List!21336)) )
))
(declare-fun l!412 () List!21336)

(declare-fun value!115 () B!1318)

(declare-datatypes ((List!21337 0))(
  ( (Nil!21334) (Cons!21333 (h!22531 (_ BitVec 64)) (t!30338 List!21337)) )
))
(declare-fun isEmpty!775 (List!21337) Bool)

(declare-fun getKeysOf!8 (List!21336 B!1318) List!21337)

(assert (=> b!1011861 (= res!679780 (not (isEmpty!775 (getKeysOf!8 (t!30337 l!412) value!115))))))

(declare-fun b!1011860 () Bool)

(declare-fun res!679782 () Bool)

(assert (=> b!1011860 (=> (not res!679782) (not e!569233))))

(get-info :version)

(assert (=> b!1011860 (= res!679782 (and ((_ is Cons!21332) l!412) (= (_2!7527 (h!22530 l!412)) value!115)))))

(declare-fun res!679781 () Bool)

(assert (=> start!87290 (=> (not res!679781) (not e!569233))))

(declare-fun isStrictlySorted!523 (List!21336) Bool)

(assert (=> start!87290 (= res!679781 (isStrictlySorted!523 l!412))))

(assert (=> start!87290 e!569233))

(declare-fun e!569232 () Bool)

(assert (=> start!87290 e!569232))

(declare-fun tp_is_empty!23385 () Bool)

(assert (=> start!87290 tp_is_empty!23385))

(declare-fun b!1011863 () Bool)

(declare-fun tp!70232 () Bool)

(assert (=> b!1011863 (= e!569232 (and tp_is_empty!23385 tp!70232))))

(declare-fun b!1011862 () Bool)

(assert (=> b!1011862 (= e!569233 (not (isStrictlySorted!523 (t!30337 l!412))))))

(assert (= (and start!87290 res!679781) b!1011860))

(assert (= (and b!1011860 res!679782) b!1011861))

(assert (= (and b!1011861 res!679780) b!1011862))

(assert (= (and start!87290 ((_ is Cons!21332) l!412)) b!1011863))

(declare-fun m!935765 () Bool)

(assert (=> b!1011861 m!935765))

(assert (=> b!1011861 m!935765))

(declare-fun m!935767 () Bool)

(assert (=> b!1011861 m!935767))

(declare-fun m!935769 () Bool)

(assert (=> start!87290 m!935769))

(declare-fun m!935771 () Bool)

(assert (=> b!1011862 m!935771))

(check-sat (not start!87290) (not b!1011863) tp_is_empty!23385 (not b!1011862) (not b!1011861))
(check-sat)
(get-model)

