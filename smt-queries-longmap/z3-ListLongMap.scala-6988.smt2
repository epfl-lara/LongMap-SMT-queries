; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88592 () Bool)

(assert start!88592)

(declare-fun res!682738 () Bool)

(declare-fun e!572852 () Bool)

(assert (=> start!88592 (=> (not res!682738) (not e!572852))))

(declare-datatypes ((B!1634 0))(
  ( (B!1635 (val!11901 Int)) )
))
(declare-datatypes ((tuple2!15428 0))(
  ( (tuple2!15429 (_1!7725 (_ BitVec 64)) (_2!7725 B!1634)) )
))
(declare-datatypes ((List!21624 0))(
  ( (Nil!21621) (Cons!21620 (h!22818 tuple2!15428) (t!30616 List!21624)) )
))
(declare-fun l!996 () List!21624)

(declare-fun isStrictlySorted!650 (List!21624) Bool)

(assert (=> start!88592 (= res!682738 (isStrictlySorted!650 l!996))))

(assert (=> start!88592 e!572852))

(declare-fun e!572851 () Bool)

(assert (=> start!88592 e!572851))

(assert (=> start!88592 true))

(declare-fun tp_is_empty!23701 () Bool)

(assert (=> start!88592 tp_is_empty!23701))

(declare-fun b!1018127 () Bool)

(declare-fun res!682737 () Bool)

(assert (=> b!1018127 (=> (not res!682737) (not e!572852))))

(declare-fun key!261 () (_ BitVec 64))

(declare-fun containsKey!514 (List!21624 (_ BitVec 64)) Bool)

(assert (=> b!1018127 (= res!682737 (containsKey!514 l!996 key!261))))

(declare-fun b!1018128 () Bool)

(assert (=> b!1018128 (= e!572852 false)))

(declare-fun value!172 () B!1634)

(declare-fun lt!449308 () List!21624)

(declare-fun insertStrictlySorted!336 (List!21624 (_ BitVec 64) B!1634) List!21624)

(assert (=> b!1018128 (= lt!449308 (insertStrictlySorted!336 l!996 key!261 value!172))))

(declare-fun b!1018129 () Bool)

(declare-fun tp!71020 () Bool)

(assert (=> b!1018129 (= e!572851 (and tp_is_empty!23701 tp!71020))))

(assert (= (and start!88592 res!682738) b!1018127))

(assert (= (and b!1018127 res!682737) b!1018128))

(get-info :version)

(assert (= (and start!88592 ((_ is Cons!21620) l!996)) b!1018129))

(declare-fun m!938575 () Bool)

(assert (=> start!88592 m!938575))

(declare-fun m!938577 () Bool)

(assert (=> b!1018127 m!938577))

(declare-fun m!938579 () Bool)

(assert (=> b!1018128 m!938579))

(check-sat (not start!88592) (not b!1018128) (not b!1018129) tp_is_empty!23701 (not b!1018127))
(check-sat)
