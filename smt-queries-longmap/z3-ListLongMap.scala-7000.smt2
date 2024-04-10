; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88896 () Bool)

(assert start!88896)

(declare-fun res!683786 () Bool)

(declare-fun e!574210 () Bool)

(assert (=> start!88896 (=> (not res!683786) (not e!574210))))

(declare-datatypes ((B!1708 0))(
  ( (B!1709 (val!11938 Int)) )
))
(declare-datatypes ((tuple2!15422 0))(
  ( (tuple2!15423 (_1!7722 (_ BitVec 64)) (_2!7722 B!1708)) )
))
(declare-datatypes ((List!21626 0))(
  ( (Nil!21623) (Cons!21622 (h!22820 tuple2!15422) (t!30636 List!21626)) )
))
(declare-fun l!1367 () List!21626)

(declare-fun isStrictlySorted!691 (List!21626) Bool)

(assert (=> start!88896 (= res!683786 (isStrictlySorted!691 l!1367))))

(assert (=> start!88896 e!574210))

(declare-fun e!574211 () Bool)

(assert (=> start!88896 e!574211))

(assert (=> start!88896 true))

(declare-fun tp_is_empty!23775 () Bool)

(assert (=> start!88896 tp_is_empty!23775))

(declare-fun b!1020196 () Bool)

(declare-fun res!683787 () Bool)

(declare-fun e!574212 () Bool)

(assert (=> b!1020196 (=> (not res!683787) (not e!574212))))

(assert (=> b!1020196 (= res!683787 (isStrictlySorted!691 (t!30636 l!1367)))))

(declare-fun b!1020197 () Bool)

(assert (=> b!1020197 (= e!574212 false)))

(declare-fun lt!449799 () Bool)

(declare-fun lt!449798 () tuple2!15422)

(declare-fun contains!5917 (List!21626 tuple2!15422) Bool)

(assert (=> b!1020197 (= lt!449799 (contains!5917 (t!30636 l!1367) lt!449798))))

(declare-fun b!1020198 () Bool)

(declare-fun tp!71212 () Bool)

(assert (=> b!1020198 (= e!574211 (and tp_is_empty!23775 tp!71212))))

(declare-fun b!1020199 () Bool)

(assert (=> b!1020199 (= e!574210 e!574212)))

(declare-fun res!683789 () Bool)

(assert (=> b!1020199 (=> (not res!683789) (not e!574212))))

(assert (=> b!1020199 (= res!683789 (contains!5917 l!1367 lt!449798))))

(declare-fun key!393 () (_ BitVec 64))

(declare-fun value!188 () B!1708)

(assert (=> b!1020199 (= lt!449798 (tuple2!15423 key!393 value!188))))

(declare-fun b!1020200 () Bool)

(declare-fun res!683788 () Bool)

(assert (=> b!1020200 (=> (not res!683788) (not e!574212))))

(get-info :version)

(assert (=> b!1020200 (= res!683788 (and ((_ is Cons!21622) l!1367) (not (= (h!22820 l!1367) lt!449798))))))

(assert (= (and start!88896 res!683786) b!1020199))

(assert (= (and b!1020199 res!683789) b!1020200))

(assert (= (and b!1020200 res!683788) b!1020196))

(assert (= (and b!1020196 res!683787) b!1020197))

(assert (= (and start!88896 ((_ is Cons!21622) l!1367)) b!1020198))

(declare-fun m!940239 () Bool)

(assert (=> start!88896 m!940239))

(declare-fun m!940241 () Bool)

(assert (=> b!1020196 m!940241))

(declare-fun m!940243 () Bool)

(assert (=> b!1020197 m!940243))

(declare-fun m!940245 () Bool)

(assert (=> b!1020199 m!940245))

(check-sat (not b!1020199) (not b!1020197) (not b!1020198) tp_is_empty!23775 (not start!88896) (not b!1020196))
(check-sat)
