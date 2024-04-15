; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106866 () Bool)

(assert start!106866)

(declare-fun b!1267800 () Bool)

(declare-fun e!722285 () Bool)

(declare-fun tp_is_empty!32617 () Bool)

(declare-fun tp!96662 () Bool)

(assert (=> b!1267800 (= e!722285 (and tp_is_empty!32617 tp!96662))))

(declare-fun res!843942 () Bool)

(declare-fun e!722284 () Bool)

(assert (=> start!106866 (=> (not res!843942) (not e!722284))))

(declare-datatypes ((B!2096 0))(
  ( (B!2097 (val!16383 Int)) )
))
(declare-datatypes ((tuple2!21366 0))(
  ( (tuple2!21367 (_1!10694 (_ BitVec 64)) (_2!10694 B!2096)) )
))
(declare-datatypes ((List!28459 0))(
  ( (Nil!28456) (Cons!28455 (h!29664 tuple2!21366) (t!41980 List!28459)) )
))
(declare-fun l!874 () List!28459)

(declare-fun isStrictlySorted!828 (List!28459) Bool)

(assert (=> start!106866 (= res!843942 (isStrictlySorted!828 l!874))))

(assert (=> start!106866 e!722284))

(assert (=> start!106866 e!722285))

(assert (=> start!106866 true))

(declare-fun b!1267798 () Bool)

(declare-fun res!843940 () Bool)

(assert (=> b!1267798 (=> (not res!843940) (not e!722284))))

(get-info :version)

(assert (=> b!1267798 (= res!843940 (not ((_ is Cons!28455) l!874)))))

(declare-fun b!1267797 () Bool)

(declare-fun res!843941 () Bool)

(assert (=> b!1267797 (=> (not res!843941) (not e!722284))))

(declare-fun key!235 () (_ BitVec 64))

(declare-fun containsKey!689 (List!28459 (_ BitVec 64)) Bool)

(assert (=> b!1267797 (= res!843941 (not (containsKey!689 l!874 key!235)))))

(declare-fun b!1267799 () Bool)

(declare-fun removeStrictlySorted!170 (List!28459 (_ BitVec 64)) List!28459)

(assert (=> b!1267799 (= e!722284 (not (= (removeStrictlySorted!170 l!874 key!235) l!874)))))

(assert (= (and start!106866 res!843942) b!1267797))

(assert (= (and b!1267797 res!843941) b!1267798))

(assert (= (and b!1267798 res!843940) b!1267799))

(assert (= (and start!106866 ((_ is Cons!28455) l!874)) b!1267800))

(declare-fun m!1166453 () Bool)

(assert (=> start!106866 m!1166453))

(declare-fun m!1166455 () Bool)

(assert (=> b!1267797 m!1166455))

(declare-fun m!1166457 () Bool)

(assert (=> b!1267799 m!1166457))

(check-sat (not start!106866) tp_is_empty!32617 (not b!1267799) (not b!1267800) (not b!1267797))
(check-sat)
(get-model)

(declare-fun d!139497 () Bool)

(declare-fun res!843973 () Bool)

(declare-fun e!722310 () Bool)

(assert (=> d!139497 (=> res!843973 e!722310)))

(assert (=> d!139497 (= res!843973 (or ((_ is Nil!28456) l!874) ((_ is Nil!28456) (t!41980 l!874))))))

(assert (=> d!139497 (= (isStrictlySorted!828 l!874) e!722310)))

(declare-fun b!1267837 () Bool)

(declare-fun e!722311 () Bool)

(assert (=> b!1267837 (= e!722310 e!722311)))

(declare-fun res!843974 () Bool)

(assert (=> b!1267837 (=> (not res!843974) (not e!722311))))

(assert (=> b!1267837 (= res!843974 (bvslt (_1!10694 (h!29664 l!874)) (_1!10694 (h!29664 (t!41980 l!874)))))))

(declare-fun b!1267838 () Bool)

(assert (=> b!1267838 (= e!722311 (isStrictlySorted!828 (t!41980 l!874)))))

(assert (= (and d!139497 (not res!843973)) b!1267837))

(assert (= (and b!1267837 res!843974) b!1267838))

(declare-fun m!1166471 () Bool)

(assert (=> b!1267838 m!1166471))

(assert (=> start!106866 d!139497))

(declare-fun b!1267865 () Bool)

(declare-fun e!722334 () List!28459)

(assert (=> b!1267865 (= e!722334 (t!41980 l!874))))

(declare-fun b!1267866 () Bool)

(declare-fun e!722335 () List!28459)

(assert (=> b!1267866 (= e!722335 Nil!28456)))

(declare-fun b!1267867 () Bool)

(assert (=> b!1267867 (= e!722334 e!722335)))

(declare-fun c!123591 () Bool)

(assert (=> b!1267867 (= c!123591 (and ((_ is Cons!28455) l!874) (not (= (_1!10694 (h!29664 l!874)) key!235))))))

(declare-fun d!139503 () Bool)

(declare-fun e!722336 () Bool)

(assert (=> d!139503 e!722336))

(declare-fun res!843993 () Bool)

(assert (=> d!139503 (=> (not res!843993) (not e!722336))))

(declare-fun lt!574198 () List!28459)

(assert (=> d!139503 (= res!843993 (isStrictlySorted!828 lt!574198))))

(assert (=> d!139503 (= lt!574198 e!722334)))

(declare-fun c!123592 () Bool)

(assert (=> d!139503 (= c!123592 (and ((_ is Cons!28455) l!874) (= (_1!10694 (h!29664 l!874)) key!235)))))

(assert (=> d!139503 (isStrictlySorted!828 l!874)))

(assert (=> d!139503 (= (removeStrictlySorted!170 l!874 key!235) lt!574198)))

(declare-fun b!1267868 () Bool)

(assert (=> b!1267868 (= e!722336 (not (containsKey!689 lt!574198 key!235)))))

(declare-fun b!1267869 () Bool)

(declare-fun $colon$colon!654 (List!28459 tuple2!21366) List!28459)

(assert (=> b!1267869 (= e!722335 ($colon$colon!654 (removeStrictlySorted!170 (t!41980 l!874) key!235) (h!29664 l!874)))))

(assert (= (and d!139503 c!123592) b!1267865))

(assert (= (and d!139503 (not c!123592)) b!1267867))

(assert (= (and b!1267867 c!123591) b!1267869))

(assert (= (and b!1267867 (not c!123591)) b!1267866))

(assert (= (and d!139503 res!843993) b!1267868))

(declare-fun m!1166481 () Bool)

(assert (=> d!139503 m!1166481))

(assert (=> d!139503 m!1166453))

(declare-fun m!1166483 () Bool)

(assert (=> b!1267868 m!1166483))

(declare-fun m!1166485 () Bool)

(assert (=> b!1267869 m!1166485))

(assert (=> b!1267869 m!1166485))

(declare-fun m!1166487 () Bool)

(assert (=> b!1267869 m!1166487))

(assert (=> b!1267799 d!139503))

(declare-fun d!139513 () Bool)

(declare-fun res!844002 () Bool)

(declare-fun e!722354 () Bool)

(assert (=> d!139513 (=> res!844002 e!722354)))

(assert (=> d!139513 (= res!844002 (and ((_ is Cons!28455) l!874) (= (_1!10694 (h!29664 l!874)) key!235)))))

(assert (=> d!139513 (= (containsKey!689 l!874 key!235) e!722354)))

(declare-fun b!1267894 () Bool)

(declare-fun e!722355 () Bool)

(assert (=> b!1267894 (= e!722354 e!722355)))

(declare-fun res!844004 () Bool)

(assert (=> b!1267894 (=> (not res!844004) (not e!722355))))

(assert (=> b!1267894 (= res!844004 (and (or (not ((_ is Cons!28455) l!874)) (bvsle (_1!10694 (h!29664 l!874)) key!235)) ((_ is Cons!28455) l!874) (bvslt (_1!10694 (h!29664 l!874)) key!235)))))

(declare-fun b!1267896 () Bool)

(assert (=> b!1267896 (= e!722355 (containsKey!689 (t!41980 l!874) key!235))))

(assert (= (and d!139513 (not res!844002)) b!1267894))

(assert (= (and b!1267894 res!844004) b!1267896))

(declare-fun m!1166489 () Bool)

(assert (=> b!1267896 m!1166489))

(assert (=> b!1267797 d!139513))

(declare-fun b!1267916 () Bool)

(declare-fun e!722365 () Bool)

(declare-fun tp!96673 () Bool)

(assert (=> b!1267916 (= e!722365 (and tp_is_empty!32617 tp!96673))))

(assert (=> b!1267800 (= tp!96662 e!722365)))

(assert (= (and b!1267800 ((_ is Cons!28455) (t!41980 l!874))) b!1267916))

(check-sat (not b!1267916) tp_is_empty!32617 (not b!1267896) (not b!1267868) (not b!1267869) (not d!139503) (not b!1267838))
(check-sat)
