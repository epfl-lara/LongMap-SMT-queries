; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88898 () Bool)

(assert start!88898)

(declare-fun b!1020083 () Bool)

(declare-fun res!683745 () Bool)

(declare-fun e!574142 () Bool)

(assert (=> b!1020083 (=> (not res!683745) (not e!574142))))

(declare-datatypes ((B!1712 0))(
  ( (B!1713 (val!11940 Int)) )
))
(declare-datatypes ((tuple2!15506 0))(
  ( (tuple2!15507 (_1!7764 (_ BitVec 64)) (_2!7764 B!1712)) )
))
(declare-datatypes ((List!21663 0))(
  ( (Nil!21660) (Cons!21659 (h!22857 tuple2!15506) (t!30664 List!21663)) )
))
(declare-fun l!1367 () List!21663)

(declare-fun lt!449610 () tuple2!15506)

(get-info :version)

(assert (=> b!1020083 (= res!683745 (and ((_ is Cons!21659) l!1367) (not (= (h!22857 l!1367) lt!449610))))))

(declare-fun b!1020084 () Bool)

(declare-fun res!683749 () Bool)

(assert (=> b!1020084 (=> (not res!683749) (not e!574142))))

(declare-fun contains!5895 (List!21663 tuple2!15506) Bool)

(assert (=> b!1020084 (= res!683749 (contains!5895 (t!30664 l!1367) lt!449610))))

(declare-fun b!1020085 () Bool)

(assert (=> b!1020085 (= e!574142 (not true))))

(declare-fun key!393 () (_ BitVec 64))

(declare-fun containsKey!550 (List!21663 (_ BitVec 64)) Bool)

(assert (=> b!1020085 (containsKey!550 (t!30664 l!1367) key!393)))

(declare-fun value!188 () B!1712)

(declare-datatypes ((Unit!33189 0))(
  ( (Unit!33190) )
))
(declare-fun lt!449611 () Unit!33189)

(declare-fun lemmaContainsTupleThenContainsKey!10 (List!21663 (_ BitVec 64) B!1712) Unit!33189)

(assert (=> b!1020085 (= lt!449611 (lemmaContainsTupleThenContainsKey!10 (t!30664 l!1367) key!393 value!188))))

(declare-fun b!1020087 () Bool)

(declare-fun res!683748 () Bool)

(assert (=> b!1020087 (=> (not res!683748) (not e!574142))))

(declare-fun isStrictlySorted!689 (List!21663) Bool)

(assert (=> b!1020087 (= res!683748 (isStrictlySorted!689 (t!30664 l!1367)))))

(declare-fun b!1020088 () Bool)

(declare-fun e!574140 () Bool)

(assert (=> b!1020088 (= e!574140 e!574142)))

(declare-fun res!683746 () Bool)

(assert (=> b!1020088 (=> (not res!683746) (not e!574142))))

(assert (=> b!1020088 (= res!683746 (contains!5895 l!1367 lt!449610))))

(assert (=> b!1020088 (= lt!449610 (tuple2!15507 key!393 value!188))))

(declare-fun res!683747 () Bool)

(assert (=> start!88898 (=> (not res!683747) (not e!574140))))

(assert (=> start!88898 (= res!683747 (isStrictlySorted!689 l!1367))))

(assert (=> start!88898 e!574140))

(declare-fun e!574141 () Bool)

(assert (=> start!88898 e!574141))

(assert (=> start!88898 true))

(declare-fun tp_is_empty!23779 () Bool)

(assert (=> start!88898 tp_is_empty!23779))

(declare-fun b!1020086 () Bool)

(declare-fun tp!71218 () Bool)

(assert (=> b!1020086 (= e!574141 (and tp_is_empty!23779 tp!71218))))

(assert (= (and start!88898 res!683747) b!1020088))

(assert (= (and b!1020088 res!683746) b!1020083))

(assert (= (and b!1020083 res!683745) b!1020087))

(assert (= (and b!1020087 res!683748) b!1020084))

(assert (= (and b!1020084 res!683749) b!1020085))

(assert (= (and start!88898 ((_ is Cons!21659) l!1367)) b!1020086))

(declare-fun m!939635 () Bool)

(assert (=> b!1020087 m!939635))

(declare-fun m!939637 () Bool)

(assert (=> b!1020088 m!939637))

(declare-fun m!939639 () Bool)

(assert (=> b!1020085 m!939639))

(declare-fun m!939641 () Bool)

(assert (=> b!1020085 m!939641))

(declare-fun m!939643 () Bool)

(assert (=> start!88898 m!939643))

(declare-fun m!939645 () Bool)

(assert (=> b!1020084 m!939645))

(check-sat tp_is_empty!23779 (not b!1020085) (not start!88898) (not b!1020087) (not b!1020084) (not b!1020088) (not b!1020086))
(check-sat)
