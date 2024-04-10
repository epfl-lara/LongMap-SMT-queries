; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88596 () Bool)

(assert start!88596)

(declare-fun res!682811 () Bool)

(declare-fun e!572946 () Bool)

(assert (=> start!88596 (=> (not res!682811) (not e!572946))))

(declare-datatypes ((B!1636 0))(
  ( (B!1637 (val!11902 Int)) )
))
(declare-datatypes ((tuple2!15350 0))(
  ( (tuple2!15351 (_1!7686 (_ BitVec 64)) (_2!7686 B!1636)) )
))
(declare-datatypes ((List!21590 0))(
  ( (Nil!21587) (Cons!21586 (h!22784 tuple2!15350) (t!30591 List!21590)) )
))
(declare-fun l!996 () List!21590)

(declare-fun isStrictlySorted!655 (List!21590) Bool)

(assert (=> start!88596 (= res!682811 (isStrictlySorted!655 l!996))))

(assert (=> start!88596 e!572946))

(declare-fun e!572945 () Bool)

(assert (=> start!88596 e!572945))

(assert (=> start!88596 true))

(declare-fun tp_is_empty!23703 () Bool)

(assert (=> start!88596 tp_is_empty!23703))

(declare-fun b!1018281 () Bool)

(declare-fun res!682810 () Bool)

(assert (=> b!1018281 (=> (not res!682810) (not e!572946))))

(declare-fun key!261 () (_ BitVec 64))

(declare-fun containsKey!515 (List!21590 (_ BitVec 64)) Bool)

(assert (=> b!1018281 (= res!682810 (containsKey!515 l!996 key!261))))

(declare-fun b!1018282 () Bool)

(assert (=> b!1018282 (= e!572946 false)))

(declare-fun value!172 () B!1636)

(declare-fun lt!449511 () List!21590)

(declare-fun insertStrictlySorted!336 (List!21590 (_ BitVec 64) B!1636) List!21590)

(assert (=> b!1018282 (= lt!449511 (insertStrictlySorted!336 l!996 key!261 value!172))))

(declare-fun b!1018283 () Bool)

(declare-fun tp!71023 () Bool)

(assert (=> b!1018283 (= e!572945 (and tp_is_empty!23703 tp!71023))))

(assert (= (and start!88596 res!682811) b!1018281))

(assert (= (and b!1018281 res!682810) b!1018282))

(get-info :version)

(assert (= (and start!88596 ((_ is Cons!21586) l!996)) b!1018283))

(declare-fun m!939199 () Bool)

(assert (=> start!88596 m!939199))

(declare-fun m!939201 () Bool)

(assert (=> b!1018281 m!939201))

(declare-fun m!939203 () Bool)

(assert (=> b!1018282 m!939203))

(check-sat (not b!1018283) tp_is_empty!23703 (not start!88596) (not b!1018281) (not b!1018282))
(check-sat)
