; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106868 () Bool)

(assert start!106868)

(declare-fun b!1267873 () Bool)

(declare-fun res!843976 () Bool)

(declare-fun e!722319 () Bool)

(assert (=> b!1267873 (=> (not res!843976) (not e!722319))))

(declare-datatypes ((B!2098 0))(
  ( (B!2099 (val!16384 Int)) )
))
(declare-datatypes ((tuple2!21286 0))(
  ( (tuple2!21287 (_1!10654 (_ BitVec 64)) (_2!10654 B!2098)) )
))
(declare-datatypes ((List!28376 0))(
  ( (Nil!28373) (Cons!28372 (h!29581 tuple2!21286) (t!41905 List!28376)) )
))
(declare-fun l!874 () List!28376)

(declare-fun key!235 () (_ BitVec 64))

(declare-fun containsKey!692 (List!28376 (_ BitVec 64)) Bool)

(assert (=> b!1267873 (= res!843976 (not (containsKey!692 l!874 key!235)))))

(declare-fun b!1267875 () Bool)

(declare-fun removeStrictlySorted!171 (List!28376 (_ BitVec 64)) List!28376)

(assert (=> b!1267875 (= e!722319 (not (= (removeStrictlySorted!171 l!874 key!235) l!874)))))

(declare-fun b!1267876 () Bool)

(declare-fun e!722320 () Bool)

(declare-fun tp_is_empty!32619 () Bool)

(declare-fun tp!96664 () Bool)

(assert (=> b!1267876 (= e!722320 (and tp_is_empty!32619 tp!96664))))

(declare-fun res!843978 () Bool)

(assert (=> start!106868 (=> (not res!843978) (not e!722319))))

(declare-fun isStrictlySorted!833 (List!28376) Bool)

(assert (=> start!106868 (= res!843978 (isStrictlySorted!833 l!874))))

(assert (=> start!106868 e!722319))

(assert (=> start!106868 e!722320))

(assert (=> start!106868 true))

(declare-fun b!1267874 () Bool)

(declare-fun res!843977 () Bool)

(assert (=> b!1267874 (=> (not res!843977) (not e!722319))))

(get-info :version)

(assert (=> b!1267874 (= res!843977 (not ((_ is Cons!28372) l!874)))))

(assert (= (and start!106868 res!843978) b!1267873))

(assert (= (and b!1267873 res!843976) b!1267874))

(assert (= (and b!1267874 res!843977) b!1267875))

(assert (= (and start!106868 ((_ is Cons!28372) l!874)) b!1267876))

(declare-fun m!1166959 () Bool)

(assert (=> b!1267873 m!1166959))

(declare-fun m!1166961 () Bool)

(assert (=> b!1267875 m!1166961))

(declare-fun m!1166963 () Bool)

(assert (=> start!106868 m!1166963))

(check-sat (not b!1267875) (not start!106868) tp_is_empty!32619 (not b!1267873) (not b!1267876))
(check-sat)
(get-model)

(declare-fun d!139613 () Bool)

(declare-fun res!844007 () Bool)

(declare-fun e!722352 () Bool)

(assert (=> d!139613 (=> res!844007 e!722352)))

(assert (=> d!139613 (= res!844007 (or ((_ is Nil!28373) l!874) ((_ is Nil!28373) (t!41905 l!874))))))

(assert (=> d!139613 (= (isStrictlySorted!833 l!874) e!722352)))

(declare-fun b!1267920 () Bool)

(declare-fun e!722353 () Bool)

(assert (=> b!1267920 (= e!722352 e!722353)))

(declare-fun res!844008 () Bool)

(assert (=> b!1267920 (=> (not res!844008) (not e!722353))))

(assert (=> b!1267920 (= res!844008 (bvslt (_1!10654 (h!29581 l!874)) (_1!10654 (h!29581 (t!41905 l!874)))))))

(declare-fun b!1267921 () Bool)

(assert (=> b!1267921 (= e!722353 (isStrictlySorted!833 (t!41905 l!874)))))

(assert (= (and d!139613 (not res!844007)) b!1267920))

(assert (= (and b!1267920 res!844008) b!1267921))

(declare-fun m!1166983 () Bool)

(assert (=> b!1267921 m!1166983))

(assert (=> start!106868 d!139613))

(declare-fun b!1267969 () Bool)

(declare-fun e!722387 () List!28376)

(declare-fun e!722388 () List!28376)

(assert (=> b!1267969 (= e!722387 e!722388)))

(declare-fun c!123620 () Bool)

(assert (=> b!1267969 (= c!123620 (and ((_ is Cons!28372) l!874) (not (= (_1!10654 (h!29581 l!874)) key!235))))))

(declare-fun b!1267970 () Bool)

(declare-fun e!722389 () Bool)

(declare-fun lt!574382 () List!28376)

(assert (=> b!1267970 (= e!722389 (not (containsKey!692 lt!574382 key!235)))))

(declare-fun d!139621 () Bool)

(assert (=> d!139621 e!722389))

(declare-fun res!844026 () Bool)

(assert (=> d!139621 (=> (not res!844026) (not e!722389))))

(assert (=> d!139621 (= res!844026 (isStrictlySorted!833 lt!574382))))

(assert (=> d!139621 (= lt!574382 e!722387)))

(declare-fun c!123619 () Bool)

(assert (=> d!139621 (= c!123619 (and ((_ is Cons!28372) l!874) (= (_1!10654 (h!29581 l!874)) key!235)))))

(assert (=> d!139621 (isStrictlySorted!833 l!874)))

(assert (=> d!139621 (= (removeStrictlySorted!171 l!874 key!235) lt!574382)))

(declare-fun b!1267971 () Bool)

(assert (=> b!1267971 (= e!722388 Nil!28373)))

(declare-fun b!1267972 () Bool)

(declare-fun $colon$colon!655 (List!28376 tuple2!21286) List!28376)

(assert (=> b!1267972 (= e!722388 ($colon$colon!655 (removeStrictlySorted!171 (t!41905 l!874) key!235) (h!29581 l!874)))))

(declare-fun b!1267973 () Bool)

(assert (=> b!1267973 (= e!722387 (t!41905 l!874))))

(assert (= (and d!139621 c!123619) b!1267973))

(assert (= (and d!139621 (not c!123619)) b!1267969))

(assert (= (and b!1267969 c!123620) b!1267972))

(assert (= (and b!1267969 (not c!123620)) b!1267971))

(assert (= (and d!139621 res!844026) b!1267970))

(declare-fun m!1166997 () Bool)

(assert (=> b!1267970 m!1166997))

(declare-fun m!1166999 () Bool)

(assert (=> d!139621 m!1166999))

(assert (=> d!139621 m!1166963))

(declare-fun m!1167001 () Bool)

(assert (=> b!1267972 m!1167001))

(assert (=> b!1267972 m!1167001))

(declare-fun m!1167003 () Bool)

(assert (=> b!1267972 m!1167003))

(assert (=> b!1267875 d!139621))

(declare-fun d!139625 () Bool)

