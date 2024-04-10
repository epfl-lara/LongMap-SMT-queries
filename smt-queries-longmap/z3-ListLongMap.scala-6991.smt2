; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88614 () Bool)

(assert start!88614)

(declare-fun res!682892 () Bool)

(declare-fun e!573009 () Bool)

(assert (=> start!88614 (=> (not res!682892) (not e!573009))))

(declare-datatypes ((B!1654 0))(
  ( (B!1655 (val!11911 Int)) )
))
(declare-datatypes ((tuple2!15368 0))(
  ( (tuple2!15369 (_1!7695 (_ BitVec 64)) (_2!7695 B!1654)) )
))
(declare-datatypes ((List!21599 0))(
  ( (Nil!21596) (Cons!21595 (h!22793 tuple2!15368) (t!30600 List!21599)) )
))
(declare-fun l!996 () List!21599)

(declare-fun isStrictlySorted!664 (List!21599) Bool)

(assert (=> start!88614 (= res!682892 (isStrictlySorted!664 l!996))))

(assert (=> start!88614 e!573009))

(declare-fun e!573008 () Bool)

(assert (=> start!88614 e!573008))

(assert (=> start!88614 true))

(declare-fun tp_is_empty!23721 () Bool)

(assert (=> start!88614 tp_is_empty!23721))

(declare-fun b!1018389 () Bool)

(declare-fun res!682891 () Bool)

(assert (=> b!1018389 (=> (not res!682891) (not e!573009))))

(declare-fun key!261 () (_ BitVec 64))

(declare-fun containsKey!524 (List!21599 (_ BitVec 64)) Bool)

(assert (=> b!1018389 (= res!682891 (containsKey!524 l!996 key!261))))

(declare-fun b!1018390 () Bool)

(assert (=> b!1018390 (= e!573009 false)))

(declare-fun value!172 () B!1654)

(declare-fun lt!449547 () List!21599)

(declare-fun insertStrictlySorted!345 (List!21599 (_ BitVec 64) B!1654) List!21599)

(assert (=> b!1018390 (= lt!449547 (insertStrictlySorted!345 l!996 key!261 value!172))))

(declare-fun b!1018391 () Bool)

(declare-fun tp!71050 () Bool)

(assert (=> b!1018391 (= e!573008 (and tp_is_empty!23721 tp!71050))))

(assert (= (and start!88614 res!682892) b!1018389))

(assert (= (and b!1018389 res!682891) b!1018390))

(get-info :version)

(assert (= (and start!88614 ((_ is Cons!21595) l!996)) b!1018391))

(declare-fun m!939289 () Bool)

(assert (=> start!88614 m!939289))

(declare-fun m!939291 () Bool)

(assert (=> b!1018389 m!939291))

(declare-fun m!939293 () Bool)

(assert (=> b!1018390 m!939293))

(check-sat (not start!88614) (not b!1018390) tp_is_empty!23721 (not b!1018389) (not b!1018391))
(check-sat)
