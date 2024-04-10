; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106866 () Bool)

(assert start!106866)

(declare-fun b!1267861 () Bool)

(declare-fun res!843969 () Bool)

(declare-fun e!722314 () Bool)

(assert (=> b!1267861 (=> (not res!843969) (not e!722314))))

(declare-datatypes ((B!2096 0))(
  ( (B!2097 (val!16383 Int)) )
))
(declare-datatypes ((tuple2!21284 0))(
  ( (tuple2!21285 (_1!10653 (_ BitVec 64)) (_2!10653 B!2096)) )
))
(declare-datatypes ((List!28375 0))(
  ( (Nil!28372) (Cons!28371 (h!29580 tuple2!21284) (t!41904 List!28375)) )
))
(declare-fun l!874 () List!28375)

(declare-fun key!235 () (_ BitVec 64))

(declare-fun containsKey!691 (List!28375 (_ BitVec 64)) Bool)

(assert (=> b!1267861 (= res!843969 (not (containsKey!691 l!874 key!235)))))

(declare-fun res!843968 () Bool)

(assert (=> start!106866 (=> (not res!843968) (not e!722314))))

(declare-fun isStrictlySorted!832 (List!28375) Bool)

(assert (=> start!106866 (= res!843968 (isStrictlySorted!832 l!874))))

(assert (=> start!106866 e!722314))

(declare-fun e!722313 () Bool)

(assert (=> start!106866 e!722313))

(assert (=> start!106866 true))

(declare-fun b!1267863 () Bool)

(declare-fun removeStrictlySorted!170 (List!28375 (_ BitVec 64)) List!28375)

(assert (=> b!1267863 (= e!722314 (not (= (removeStrictlySorted!170 l!874 key!235) l!874)))))

(declare-fun b!1267862 () Bool)

(declare-fun res!843967 () Bool)

(assert (=> b!1267862 (=> (not res!843967) (not e!722314))))

(assert (=> b!1267862 (= res!843967 (not (is-Cons!28371 l!874)))))

(declare-fun b!1267864 () Bool)

(declare-fun tp_is_empty!32617 () Bool)

(declare-fun tp!96661 () Bool)

(assert (=> b!1267864 (= e!722313 (and tp_is_empty!32617 tp!96661))))

(assert (= (and start!106866 res!843968) b!1267861))

(assert (= (and b!1267861 res!843969) b!1267862))

(assert (= (and b!1267862 res!843967) b!1267863))

(assert (= (and start!106866 (is-Cons!28371 l!874)) b!1267864))

(declare-fun m!1166953 () Bool)

(assert (=> b!1267861 m!1166953))

(declare-fun m!1166955 () Bool)

(assert (=> start!106866 m!1166955))

(declare-fun m!1166957 () Bool)

(assert (=> b!1267863 m!1166957))

(push 1)

(assert (not b!1267861))

(assert (not b!1267864))

(assert (not start!106866))

(assert tp_is_empty!32617)

(assert (not b!1267863))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!139611 () Bool)

(declare-fun res!843992 () Bool)

(declare-fun e!722331 () Bool)

(assert (=> d!139611 (=> res!843992 e!722331)))

(assert (=> d!139611 (= res!843992 (and (is-Cons!28371 l!874) (= (_1!10653 (h!29580 l!874)) key!235)))))

(assert (=> d!139611 (= (containsKey!691 l!874 key!235) e!722331)))

(declare-fun b!1267893 () Bool)

(declare-fun e!722332 () Bool)

(assert (=> b!1267893 (= e!722331 e!722332)))

(declare-fun res!843993 () Bool)

(assert (=> b!1267893 (=> (not res!843993) (not e!722332))))

(assert (=> b!1267893 (= res!843993 (and (or (not (is-Cons!28371 l!874)) (bvsle (_1!10653 (h!29580 l!874)) key!235)) (is-Cons!28371 l!874) (bvslt (_1!10653 (h!29580 l!874)) key!235)))))

(declare-fun b!1267894 () Bool)

(assert (=> b!1267894 (= e!722332 (containsKey!691 (t!41904 l!874) key!235))))

(assert (= (and d!139611 (not res!843992)) b!1267893))

(assert (= (and b!1267893 res!843993) b!1267894))

(declare-fun m!1166971 () Bool)

(assert (=> b!1267894 m!1166971))

(assert (=> b!1267861 d!139611))

(declare-fun d!139615 () Bool)

(declare-fun res!844004 () Bool)

(declare-fun e!722347 () Bool)

(assert (=> d!139615 (=> res!844004 e!722347)))

(assert (=> d!139615 (= res!844004 (or (is-Nil!28372 l!874) (is-Nil!28372 (t!41904 l!874))))))

(assert (=> d!139615 (= (isStrictlySorted!832 l!874) e!722347)))

(declare-fun b!1267913 () Bool)

(declare-fun e!722348 () Bool)

(assert (=> b!1267913 (= e!722347 e!722348)))

(declare-fun res!844005 () Bool)

(assert (=> b!1267913 (=> (not res!844005) (not e!722348))))

(assert (=> b!1267913 (= res!844005 (bvslt (_1!10653 (h!29580 l!874)) (_1!10653 (h!29580 (t!41904 l!874)))))))

(declare-fun b!1267914 () Bool)

(assert (=> b!1267914 (= e!722348 (isStrictlySorted!832 (t!41904 l!874)))))

(assert (= (and d!139615 (not res!844004)) b!1267913))

(assert (= (and b!1267913 res!844005) b!1267914))

(declare-fun m!1166973 () Bool)

(assert (=> b!1267914 m!1166973))

(assert (=> start!106866 d!139615))

(declare-fun b!1267950 () Bool)

(declare-fun e!722377 () List!28375)

(declare-fun $colon$colon!654 (List!28375 tuple2!21284) List!28375)

(assert (=> b!1267950 (= e!722377 ($colon$colon!654 (removeStrictlySorted!170 (t!41904 l!874) key!235) (h!29580 l!874)))))

(declare-fun b!1267951 () Bool)

(declare-fun e!722375 () List!28375)

(assert (=> b!1267951 (= e!722375 (t!41904 l!874))))

(declare-fun b!1267952 () Bool)

(assert (=> b!1267952 (= e!722375 e!722377)))

(declare-fun c!123617 () Bool)

(assert (=> b!1267952 (= c!123617 (and (is-Cons!28371 l!874) (not (= (_1!10653 (h!29580 l!874)) key!235))))))

(declare-fun d!139617 () Bool)

(declare-fun e!722374 () Bool)

(assert (=> d!139617 e!722374))

(declare-fun res!844021 () Bool)

(assert (=> d!139617 (=> (not res!844021) (not e!722374))))

(declare-fun lt!574381 () List!28375)

(assert (=> d!139617 (= res!844021 (isStrictlySorted!832 lt!574381))))

(assert (=> d!139617 (= lt!574381 e!722375)))

(declare-fun c!123618 () Bool)

(assert (=> d!139617 (= c!123618 (and (is-Cons!28371 l!874) (= (_1!10653 (h!29580 l!874)) key!235)))))

(assert (=> d!139617 (isStrictlySorted!832 l!874)))

(assert (=> d!139617 (= (removeStrictlySorted!170 l!874 key!235) lt!574381)))

(declare-fun b!1267953 () Bool)

(assert (=> b!1267953 (= e!722377 Nil!28372)))

(declare-fun b!1267954 () Bool)

(assert (=> b!1267954 (= e!722374 (not (containsKey!691 lt!574381 key!235)))))

(assert (= (and d!139617 c!123618) b!1267951))

(assert (= (and d!139617 (not c!123618)) b!1267952))

(assert (= (and b!1267952 c!123617) b!1267950))

(assert (= (and b!1267952 (not c!123617)) b!1267953))

(assert (= (and d!139617 res!844021) b!1267954))

(declare-fun m!1166989 () Bool)

(assert (=> b!1267950 m!1166989))

(assert (=> b!1267950 m!1166989))

(declare-fun m!1166991 () Bool)

(assert (=> b!1267950 m!1166991))

(declare-fun m!1166993 () Bool)

(assert (=> d!139617 m!1166993))

(assert (=> d!139617 m!1166955))

(declare-fun m!1166995 () Bool)

(assert (=> b!1267954 m!1166995))

(assert (=> b!1267863 d!139617))

(declare-fun b!1267968 () Bool)

(declare-fun e!722386 () Bool)

(declare-fun tp!96673 () Bool)

(assert (=> b!1267968 (= e!722386 (and tp_is_empty!32617 tp!96673))))

(assert (=> b!1267864 (= tp!96661 e!722386)))

(assert (= (and b!1267864 (is-Cons!28371 (t!41904 l!874))) b!1267968))

(push 1)

(assert tp_is_empty!32617)

(assert (not b!1267968))

(assert (not d!139617))

(assert (not b!1267950))

(assert (not b!1267894))

(assert (not b!1267954))

(assert (not b!1267914))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

