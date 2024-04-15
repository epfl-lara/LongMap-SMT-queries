; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87942 () Bool)

(assert start!87942)

(declare-fun b!1015515 () Bool)

(assert (=> b!1015515 true))

(assert (=> b!1015515 true))

(declare-fun b!1015511 () Bool)

(declare-fun e!571294 () Bool)

(assert (=> b!1015511 (= e!571294 (not true))))

(declare-datatypes ((B!1496 0))(
  ( (B!1497 (val!11832 Int)) )
))
(declare-datatypes ((tuple2!15290 0))(
  ( (tuple2!15291 (_1!7656 (_ BitVec 64)) (_2!7656 B!1496)) )
))
(declare-datatypes ((List!21522 0))(
  ( (Nil!21519) (Cons!21518 (h!22716 tuple2!15290) (t!30514 List!21522)) )
))
(declare-fun l!1114 () List!21522)

(declare-datatypes ((List!21523 0))(
  ( (Nil!21520) (Cons!21519 (h!22717 (_ BitVec 64)) (t!30515 List!21523)) )
))
(declare-fun keys!40 () List!21523)

(declare-fun containsKey!481 (List!21522 (_ BitVec 64)) Bool)

(assert (=> b!1015511 (containsKey!481 l!1114 (h!22717 keys!40))))

(declare-datatypes ((Unit!33123 0))(
  ( (Unit!33124) )
))
(declare-fun lt!448951 () Unit!33123)

(declare-fun lemmaGetValueByKeyIsDefinedImpliesContainsKey!1 (List!21522 (_ BitVec 64)) Unit!33123)

(assert (=> b!1015511 (= lt!448951 (lemmaGetValueByKeyIsDefinedImpliesContainsKey!1 l!1114 (h!22717 keys!40)))))

(declare-fun res!681188 () Bool)

(assert (=> start!87942 (=> (not res!681188) (not e!571294))))

(declare-fun isStrictlySorted!596 (List!21522) Bool)

(assert (=> start!87942 (= res!681188 (isStrictlySorted!596 l!1114))))

(assert (=> start!87942 e!571294))

(declare-fun e!571295 () Bool)

(assert (=> start!87942 e!571295))

(assert (=> start!87942 true))

(declare-fun tp_is_empty!23563 () Bool)

(assert (=> start!87942 tp_is_empty!23563))

(declare-fun b!1015512 () Bool)

(declare-fun res!681184 () Bool)

(assert (=> b!1015512 (=> (not res!681184) (not e!571294))))

(get-info :version)

(assert (=> b!1015512 (= res!681184 ((_ is Cons!21519) keys!40))))

(declare-fun b!1015513 () Bool)

(declare-fun res!681186 () Bool)

(assert (=> b!1015513 (=> (not res!681186) (not e!571294))))

(declare-fun newHead!31 () tuple2!15290)

(declare-fun head!948 (List!21522) tuple2!15290)

(assert (=> b!1015513 (= res!681186 (bvslt (_1!7656 newHead!31) (_1!7656 (head!948 l!1114))))))

(declare-fun b!1015514 () Bool)

(declare-fun tp!70683 () Bool)

(assert (=> b!1015514 (= e!571295 (and tp_is_empty!23563 tp!70683))))

(declare-fun res!681187 () Bool)

(assert (=> b!1015515 (=> (not res!681187) (not e!571294))))

(declare-fun lambda!920 () Int)

(declare-fun forall!266 (List!21523 Int) Bool)

(assert (=> b!1015515 (= res!681187 (forall!266 keys!40 lambda!920))))

(declare-fun b!1015516 () Bool)

(declare-fun res!681185 () Bool)

(assert (=> b!1015516 (=> (not res!681185) (not e!571294))))

(declare-fun isEmpty!865 (List!21522) Bool)

(assert (=> b!1015516 (= res!681185 (not (isEmpty!865 l!1114)))))

(assert (= (and start!87942 res!681188) b!1015516))

(assert (= (and b!1015516 res!681185) b!1015515))

(assert (= (and b!1015515 res!681187) b!1015513))

(assert (= (and b!1015513 res!681186) b!1015512))

(assert (= (and b!1015512 res!681184) b!1015511))

(assert (= (and start!87942 ((_ is Cons!21518) l!1114)) b!1015514))

(declare-fun m!936997 () Bool)

(assert (=> b!1015513 m!936997))

(declare-fun m!936999 () Bool)

(assert (=> start!87942 m!936999))

(declare-fun m!937001 () Bool)

(assert (=> b!1015511 m!937001))

(declare-fun m!937003 () Bool)

(assert (=> b!1015511 m!937003))

(declare-fun m!937005 () Bool)

(assert (=> b!1015516 m!937005))

(declare-fun m!937007 () Bool)

(assert (=> b!1015515 m!937007))

(check-sat (not start!87942) tp_is_empty!23563 (not b!1015513) (not b!1015515) (not b!1015516) (not b!1015514) (not b!1015511))
(check-sat)
