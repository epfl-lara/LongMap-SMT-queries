; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75090 () Bool)

(assert start!75090)

(declare-fun b!885280 () Bool)

(declare-fun e!492695 () Bool)

(declare-fun tp_is_empty!17757 () Bool)

(declare-fun tp!54242 () Bool)

(assert (=> b!885280 (= e!492695 (and tp_is_empty!17757 tp!54242))))

(declare-fun b!885279 () Bool)

(declare-fun e!492696 () Bool)

(assert (=> b!885279 (= e!492696 (not true))))

(declare-datatypes ((B!1246 0))(
  ( (B!1247 (val!8929 Int)) )
))
(declare-fun v2!16 () B!1246)

(declare-fun key1!49 () (_ BitVec 64))

(declare-fun v1!38 () B!1246)

(declare-datatypes ((tuple2!11852 0))(
  ( (tuple2!11853 (_1!5937 (_ BitVec 64)) (_2!5937 B!1246)) )
))
(declare-datatypes ((List!17645 0))(
  ( (Nil!17642) (Cons!17641 (h!18772 tuple2!11852) (t!24922 List!17645)) )
))
(declare-fun l!906 () List!17645)

(declare-fun insertStrictlySorted!286 (List!17645 (_ BitVec 64) B!1246) List!17645)

(assert (=> b!885279 (= (insertStrictlySorted!286 (insertStrictlySorted!286 (t!24922 l!906) key1!49 v1!38) key1!49 v2!16) (insertStrictlySorted!286 (t!24922 l!906) key1!49 v2!16))))

(declare-datatypes ((Unit!30224 0))(
  ( (Unit!30225) )
))
(declare-fun lt!400987 () Unit!30224)

(declare-fun lemmaInsertStrictlySortedErasesIfSameKey!5 (List!17645 (_ BitVec 64) B!1246 B!1246) Unit!30224)

(assert (=> b!885279 (= lt!400987 (lemmaInsertStrictlySortedErasesIfSameKey!5 (t!24922 l!906) key1!49 v1!38 v2!16))))

(declare-fun res!601277 () Bool)

(assert (=> start!75090 (=> (not res!601277) (not e!492696))))

(declare-fun isStrictlySorted!469 (List!17645) Bool)

(assert (=> start!75090 (= res!601277 (isStrictlySorted!469 l!906))))

(assert (=> start!75090 e!492696))

(assert (=> start!75090 e!492695))

(assert (=> start!75090 true))

(assert (=> start!75090 tp_is_empty!17757))

(declare-fun b!885277 () Bool)

(declare-fun res!601278 () Bool)

(assert (=> b!885277 (=> (not res!601278) (not e!492696))))

(get-info :version)

(assert (=> b!885277 (= res!601278 (and ((_ is Cons!17641) l!906) (bvslt (_1!5937 (h!18772 l!906)) key1!49)))))

(declare-fun b!885278 () Bool)

(declare-fun res!601279 () Bool)

(assert (=> b!885278 (=> (not res!601279) (not e!492696))))

(assert (=> b!885278 (= res!601279 (isStrictlySorted!469 (t!24922 l!906)))))

(assert (= (and start!75090 res!601277) b!885277))

(assert (= (and b!885277 res!601278) b!885278))

(assert (= (and b!885278 res!601279) b!885279))

(assert (= (and start!75090 ((_ is Cons!17641) l!906)) b!885280))

(declare-fun m!825535 () Bool)

(assert (=> b!885279 m!825535))

(assert (=> b!885279 m!825535))

(declare-fun m!825537 () Bool)

(assert (=> b!885279 m!825537))

(declare-fun m!825539 () Bool)

(assert (=> b!885279 m!825539))

(declare-fun m!825541 () Bool)

(assert (=> b!885279 m!825541))

(declare-fun m!825543 () Bool)

(assert (=> start!75090 m!825543))

(declare-fun m!825545 () Bool)

(assert (=> b!885278 m!825545))

(check-sat tp_is_empty!17757 (not b!885279) (not b!885280) (not start!75090) (not b!885278))
(check-sat)
