; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138318 () Bool)

(assert start!138318)

(declare-fun res!1082542 () Bool)

(declare-fun e!885342 () Bool)

(assert (=> start!138318 (=> (not res!1082542) (not e!885342))))

(declare-datatypes ((B!2846 0))(
  ( (B!2847 (val!19785 Int)) )
))
(declare-datatypes ((tuple2!25798 0))(
  ( (tuple2!25799 (_1!12910 (_ BitVec 64)) (_2!12910 B!2846)) )
))
(declare-datatypes ((List!36937 0))(
  ( (Nil!36934) (Cons!36933 (h!38494 tuple2!25798) (t!51843 List!36937)) )
))
(declare-fun l!548 () List!36937)

(declare-fun isStrictlySorted!1127 (List!36937) Bool)

(assert (=> start!138318 (= res!1082542 (isStrictlySorted!1127 l!548))))

(assert (=> start!138318 e!885342))

(declare-fun e!885343 () Bool)

(assert (=> start!138318 e!885343))

(assert (=> start!138318 true))

(declare-fun b!1585864 () Bool)

(declare-fun res!1082541 () Bool)

(assert (=> b!1585864 (=> (not res!1082541) (not e!885342))))

(declare-fun key!159 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1585864 (= res!1082541 (and (not (= (_1!12910 (h!38494 l!548)) key!159)) ((_ is Cons!36933) l!548)))))

(declare-fun b!1585865 () Bool)

(assert (=> b!1585865 (= e!885342 (not (isStrictlySorted!1127 (t!51843 l!548))))))

(declare-fun b!1585866 () Bool)

(declare-fun tp_is_empty!39379 () Bool)

(declare-fun tp!114932 () Bool)

(assert (=> b!1585866 (= e!885343 (and tp_is_empty!39379 tp!114932))))

(assert (= (and start!138318 res!1082542) b!1585864))

(assert (= (and b!1585864 res!1082541) b!1585865))

(assert (= (and start!138318 ((_ is Cons!36933) l!548)) b!1585866))

(declare-fun m!1455609 () Bool)

(assert (=> start!138318 m!1455609))

(declare-fun m!1455611 () Bool)

(assert (=> b!1585865 m!1455611))

(check-sat (not start!138318) (not b!1585865) (not b!1585866) tp_is_empty!39379)
(check-sat)
(get-model)

(declare-fun d!167945 () Bool)

(declare-fun res!1082559 () Bool)

(declare-fun e!885360 () Bool)

(assert (=> d!167945 (=> res!1082559 e!885360)))

(assert (=> d!167945 (= res!1082559 (or ((_ is Nil!36934) l!548) ((_ is Nil!36934) (t!51843 l!548))))))

(assert (=> d!167945 (= (isStrictlySorted!1127 l!548) e!885360)))

(declare-fun b!1585889 () Bool)

(declare-fun e!885361 () Bool)

(assert (=> b!1585889 (= e!885360 e!885361)))

(declare-fun res!1082560 () Bool)

(assert (=> b!1585889 (=> (not res!1082560) (not e!885361))))

(assert (=> b!1585889 (= res!1082560 (bvslt (_1!12910 (h!38494 l!548)) (_1!12910 (h!38494 (t!51843 l!548)))))))

(declare-fun b!1585890 () Bool)

(assert (=> b!1585890 (= e!885361 (isStrictlySorted!1127 (t!51843 l!548)))))

(assert (= (and d!167945 (not res!1082559)) b!1585889))

(assert (= (and b!1585889 res!1082560) b!1585890))

(assert (=> b!1585890 m!1455611))

(assert (=> start!138318 d!167945))

(declare-fun d!167951 () Bool)

(declare-fun res!1082563 () Bool)

(declare-fun e!885364 () Bool)

(assert (=> d!167951 (=> res!1082563 e!885364)))

(assert (=> d!167951 (= res!1082563 (or ((_ is Nil!36934) (t!51843 l!548)) ((_ is Nil!36934) (t!51843 (t!51843 l!548)))))))

(assert (=> d!167951 (= (isStrictlySorted!1127 (t!51843 l!548)) e!885364)))

(declare-fun b!1585893 () Bool)

(declare-fun e!885365 () Bool)

(assert (=> b!1585893 (= e!885364 e!885365)))

(declare-fun res!1082564 () Bool)

(assert (=> b!1585893 (=> (not res!1082564) (not e!885365))))

(assert (=> b!1585893 (= res!1082564 (bvslt (_1!12910 (h!38494 (t!51843 l!548))) (_1!12910 (h!38494 (t!51843 (t!51843 l!548))))))))

(declare-fun b!1585894 () Bool)

(assert (=> b!1585894 (= e!885365 (isStrictlySorted!1127 (t!51843 (t!51843 l!548))))))

(assert (= (and d!167951 (not res!1082563)) b!1585893))

(assert (= (and b!1585893 res!1082564) b!1585894))

(declare-fun m!1455621 () Bool)

(assert (=> b!1585894 m!1455621))

(assert (=> b!1585865 d!167951))

(declare-fun b!1585903 () Bool)

(declare-fun e!885374 () Bool)

(declare-fun tp!114941 () Bool)

(assert (=> b!1585903 (= e!885374 (and tp_is_empty!39379 tp!114941))))

(assert (=> b!1585866 (= tp!114932 e!885374)))

(assert (= (and b!1585866 ((_ is Cons!36933) (t!51843 l!548))) b!1585903))

(check-sat (not b!1585890) (not b!1585894) (not b!1585903) tp_is_empty!39379)
(check-sat)
