; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106870 () Bool)

(assert start!106870)

(declare-fun b!1267885 () Bool)

(declare-fun res!843985 () Bool)

(declare-fun e!722326 () Bool)

(assert (=> b!1267885 (=> (not res!843985) (not e!722326))))

(declare-datatypes ((B!2100 0))(
  ( (B!2101 (val!16385 Int)) )
))
(declare-datatypes ((tuple2!21288 0))(
  ( (tuple2!21289 (_1!10655 (_ BitVec 64)) (_2!10655 B!2100)) )
))
(declare-datatypes ((List!28377 0))(
  ( (Nil!28374) (Cons!28373 (h!29582 tuple2!21288) (t!41906 List!28377)) )
))
(declare-fun l!874 () List!28377)

(declare-fun key!235 () (_ BitVec 64))

(declare-fun containsKey!693 (List!28377 (_ BitVec 64)) Bool)

(assert (=> b!1267885 (= res!843985 (not (containsKey!693 l!874 key!235)))))

(declare-fun b!1267888 () Bool)

(declare-fun e!722325 () Bool)

(declare-fun tp_is_empty!32621 () Bool)

(declare-fun tp!96667 () Bool)

(assert (=> b!1267888 (= e!722325 (and tp_is_empty!32621 tp!96667))))

(declare-fun b!1267887 () Bool)

(declare-fun removeStrictlySorted!172 (List!28377 (_ BitVec 64)) List!28377)

(assert (=> b!1267887 (= e!722326 (not (= (removeStrictlySorted!172 l!874 key!235) l!874)))))

(declare-fun b!1267886 () Bool)

(declare-fun res!843987 () Bool)

(assert (=> b!1267886 (=> (not res!843987) (not e!722326))))

(assert (=> b!1267886 (= res!843987 (not (is-Cons!28373 l!874)))))

(declare-fun res!843986 () Bool)

(assert (=> start!106870 (=> (not res!843986) (not e!722326))))

(declare-fun isStrictlySorted!834 (List!28377) Bool)

(assert (=> start!106870 (= res!843986 (isStrictlySorted!834 l!874))))

(assert (=> start!106870 e!722326))

(assert (=> start!106870 e!722325))

(assert (=> start!106870 true))

(assert (= (and start!106870 res!843986) b!1267885))

(assert (= (and b!1267885 res!843985) b!1267886))

(assert (= (and b!1267886 res!843987) b!1267887))

(assert (= (and start!106870 (is-Cons!28373 l!874)) b!1267888))

(declare-fun m!1166965 () Bool)

(assert (=> b!1267885 m!1166965))

(declare-fun m!1166967 () Bool)

(assert (=> b!1267887 m!1166967))

(declare-fun m!1166969 () Bool)

(assert (=> start!106870 m!1166969))

(push 1)

(assert (not start!106870))

(assert tp_is_empty!32621)

(assert (not b!1267885))

(assert (not b!1267887))

(assert (not b!1267888))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1267915 () Bool)

(declare-fun e!722350 () List!28377)

(assert (=> b!1267915 (= e!722350 (t!41906 l!874))))

(declare-fun d!139609 () Bool)

(declare-fun e!722351 () Bool)

(assert (=> d!139609 e!722351))

(declare-fun res!844006 () Bool)

(assert (=> d!139609 (=> (not res!844006) (not e!722351))))

(declare-fun lt!574376 () List!28377)

(assert (=> d!139609 (= res!844006 (isStrictlySorted!834 lt!574376))))

(assert (=> d!139609 (= lt!574376 e!722350)))

(declare-fun c!123608 () Bool)

(assert (=> d!139609 (= c!123608 (and (is-Cons!28373 l!874) (= (_1!10655 (h!29582 l!874)) key!235)))))

(assert (=> d!139609 (isStrictlySorted!834 l!874)))

(assert (=> d!139609 (= (removeStrictlySorted!172 l!874 key!235) lt!574376)))

(declare-fun b!1267916 () Bool)

(declare-fun e!722349 () List!28377)

(assert (=> b!1267916 (= e!722349 Nil!28374)))

(declare-fun b!1267917 () Bool)

(assert (=> b!1267917 (= e!722351 (not (containsKey!693 lt!574376 key!235)))))

(declare-fun b!1267918 () Bool)

(assert (=> b!1267918 (= e!722350 e!722349)))

(declare-fun c!123607 () Bool)

(assert (=> b!1267918 (= c!123607 (and (is-Cons!28373 l!874) (not (= (_1!10655 (h!29582 l!874)) key!235))))))

(declare-fun b!1267919 () Bool)

(declare-fun $colon$colon!653 (List!28377 tuple2!21288) List!28377)

(assert (=> b!1267919 (= e!722349 ($colon$colon!653 (removeStrictlySorted!172 (t!41906 l!874) key!235) (h!29582 l!874)))))

(assert (= (and d!139609 c!123608) b!1267915))

(assert (= (and d!139609 (not c!123608)) b!1267918))

(assert (= (and b!1267918 c!123607) b!1267919))

(assert (= (and b!1267918 (not c!123607)) b!1267916))

(assert (= (and d!139609 res!844006) b!1267917))

(declare-fun m!1166975 () Bool)

(assert (=> d!139609 m!1166975))

(assert (=> d!139609 m!1166969))

(declare-fun m!1166977 () Bool)

(assert (=> b!1267917 m!1166977))

(declare-fun m!1166979 () Bool)

(assert (=> b!1267919 m!1166979))

(assert (=> b!1267919 m!1166979))

(declare-fun m!1166981 () Bool)

(assert (=> b!1267919 m!1166981))

(assert (=> b!1267887 d!139609))

(declare-fun d!139619 () Bool)

(declare-fun res!844013 () Bool)

(declare-fun e!722358 () Bool)

(assert (=> d!139619 (=> res!844013 e!722358)))

(assert (=> d!139619 (= res!844013 (and (is-Cons!28373 l!874) (= (_1!10655 (h!29582 l!874)) key!235)))))

(assert (=> d!139619 (= (containsKey!693 l!874 key!235) e!722358)))

(declare-fun b!1267926 () Bool)

(declare-fun e!722359 () Bool)

(assert (=> b!1267926 (= e!722358 e!722359)))

(declare-fun res!844014 () Bool)

(assert (=> b!1267926 (=> (not res!844014) (not e!722359))))

(assert (=> b!1267926 (= res!844014 (and (or (not (is-Cons!28373 l!874)) (bvsle (_1!10655 (h!29582 l!874)) key!235)) (is-Cons!28373 l!874) (bvslt (_1!10655 (h!29582 l!874)) key!235)))))

(declare-fun b!1267927 () Bool)

(assert (=> b!1267927 (= e!722359 (containsKey!693 (t!41906 l!874) key!235))))

(assert (= (and d!139619 (not res!844013)) b!1267926))

(assert (= (and b!1267926 res!844014) b!1267927))

(declare-fun m!1166985 () Bool)

(assert (=> b!1267927 m!1166985))

(assert (=> b!1267885 d!139619))

(declare-fun d!139623 () Bool)

(declare-fun res!844022 () Bool)

(declare-fun e!722376 () Bool)

(assert (=> d!139623 (=> res!844022 e!722376)))

(assert (=> d!139623 (= res!844022 (or (is-Nil!28374 l!874) (is-Nil!28374 (t!41906 l!874))))))

(assert (=> d!139623 (= (isStrictlySorted!834 l!874) e!722376)))

(declare-fun b!1267955 () Bool)

(declare-fun e!722378 () Bool)

(assert (=> b!1267955 (= e!722376 e!722378)))

(declare-fun res!844023 () Bool)

(assert (=> b!1267955 (=> (not res!844023) (not e!722378))))

(assert (=> b!1267955 (= res!844023 (bvslt (_1!10655 (h!29582 l!874)) (_1!10655 (h!29582 (t!41906 l!874)))))))

(declare-fun b!1267956 () Bool)

(assert (=> b!1267956 (= e!722378 (isStrictlySorted!834 (t!41906 l!874)))))

(assert (= (and d!139623 (not res!844022)) b!1267955))

(assert (= (and b!1267955 res!844023) b!1267956))

(declare-fun m!1166987 () Bool)

(assert (=> b!1267956 m!1166987))

(assert (=> start!106870 d!139623))

(declare-fun b!1267967 () Bool)

(declare-fun e!722385 () Bool)

(declare-fun tp!96672 () Bool)

(assert (=> b!1267967 (= e!722385 (and tp_is_empty!32621 tp!96672))))

(assert (=> b!1267888 (= tp!96667 e!722385)))

(assert (= (and b!1267888 (is-Cons!28373 (t!41906 l!874))) b!1267967))

(push 1)

