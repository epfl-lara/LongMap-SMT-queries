; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89140 () Bool)

(assert start!89140)

(declare-fun res!684359 () Bool)

(declare-fun e!575100 () Bool)

(assert (=> start!89140 (=> (not res!684359) (not e!575100))))

(declare-datatypes ((B!1718 0))(
  ( (B!1719 (val!11943 Int)) )
))
(declare-datatypes ((tuple2!15436 0))(
  ( (tuple2!15437 (_1!7729 (_ BitVec 64)) (_2!7729 B!1718)) )
))
(declare-datatypes ((List!21620 0))(
  ( (Nil!21617) (Cons!21616 (h!22823 tuple2!15436) (t!30622 List!21620)) )
))
(declare-fun l!1367 () List!21620)

(declare-fun isStrictlySorted!684 (List!21620) Bool)

(assert (=> start!89140 (= res!684359 (isStrictlySorted!684 l!1367))))

(assert (=> start!89140 e!575100))

(declare-fun e!575099 () Bool)

(assert (=> start!89140 e!575099))

(assert (=> start!89140 true))

(declare-fun tp_is_empty!23785 () Bool)

(assert (=> start!89140 tp_is_empty!23785))

(declare-fun b!1021595 () Bool)

(assert (=> b!1021595 (= e!575100 false)))

(declare-fun value!188 () B!1718)

(declare-fun key!393 () (_ BitVec 64))

(declare-fun lt!450341 () Bool)

(declare-fun contains!5945 (List!21620 tuple2!15436) Bool)

(assert (=> b!1021595 (= lt!450341 (contains!5945 l!1367 (tuple2!15437 key!393 value!188)))))

(declare-fun b!1021596 () Bool)

(declare-fun tp!71227 () Bool)

(assert (=> b!1021596 (= e!575099 (and tp_is_empty!23785 tp!71227))))

(assert (= (and start!89140 res!684359) b!1021595))

(get-info :version)

(assert (= (and start!89140 ((_ is Cons!21616) l!1367)) b!1021596))

(declare-fun m!941955 () Bool)

(assert (=> start!89140 m!941955))

(declare-fun m!941957 () Bool)

(assert (=> b!1021595 m!941957))

(check-sat (not b!1021595) (not start!89140) (not b!1021596) tp_is_empty!23785)
(check-sat)
