; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107090 () Bool)

(assert start!107090)

(declare-fun b!1269167 () Bool)

(declare-fun res!844488 () Bool)

(declare-fun e!723160 () Bool)

(assert (=> b!1269167 (=> (not res!844488) (not e!723160))))

(declare-datatypes ((B!2096 0))(
  ( (B!2097 (val!16383 Int)) )
))
(declare-datatypes ((tuple2!21294 0))(
  ( (tuple2!21295 (_1!10658 (_ BitVec 64)) (_2!10658 B!2096)) )
))
(declare-datatypes ((List!28411 0))(
  ( (Nil!28408) (Cons!28407 (h!29625 tuple2!21294) (t!41932 List!28411)) )
))
(declare-fun l!874 () List!28411)

(get-info :version)

(assert (=> b!1269167 (= res!844488 (not ((_ is Cons!28407) l!874)))))

(declare-fun b!1269166 () Bool)

(declare-fun res!844489 () Bool)

(assert (=> b!1269166 (=> (not res!844489) (not e!723160))))

(declare-fun key!235 () (_ BitVec 64))

(declare-fun containsKey!691 (List!28411 (_ BitVec 64)) Bool)

(assert (=> b!1269166 (= res!844489 (not (containsKey!691 l!874 key!235)))))

(declare-fun b!1269168 () Bool)

(declare-fun removeStrictlySorted!169 (List!28411 (_ BitVec 64)) List!28411)

(assert (=> b!1269168 (= e!723160 (not (= (removeStrictlySorted!169 l!874 key!235) l!874)))))

(declare-fun res!844487 () Bool)

(assert (=> start!107090 (=> (not res!844487) (not e!723160))))

(declare-fun isStrictlySorted!820 (List!28411) Bool)

(assert (=> start!107090 (= res!844487 (isStrictlySorted!820 l!874))))

(assert (=> start!107090 e!723160))

(declare-fun e!723161 () Bool)

(assert (=> start!107090 e!723161))

(assert (=> start!107090 true))

(declare-fun b!1269169 () Bool)

(declare-fun tp_is_empty!32617 () Bool)

(declare-fun tp!96661 () Bool)

(assert (=> b!1269169 (= e!723161 (and tp_is_empty!32617 tp!96661))))

(assert (= (and start!107090 res!844487) b!1269166))

(assert (= (and b!1269166 res!844489) b!1269167))

(assert (= (and b!1269167 res!844488) b!1269168))

(assert (= (and start!107090 ((_ is Cons!28407) l!874)) b!1269169))

(declare-fun m!1168565 () Bool)

(assert (=> b!1269166 m!1168565))

(declare-fun m!1168567 () Bool)

(assert (=> b!1269168 m!1168567))

(declare-fun m!1168569 () Bool)

(assert (=> start!107090 m!1168569))

(check-sat (not b!1269169) tp_is_empty!32617 (not start!107090) (not b!1269166) (not b!1269168))
(check-sat)
(get-model)

(declare-fun d!140057 () Bool)

(declare-fun e!723200 () Bool)

(assert (=> d!140057 e!723200))

(declare-fun res!844528 () Bool)

(assert (=> d!140057 (=> (not res!844528) (not e!723200))))

(declare-fun lt!574860 () List!28411)

(assert (=> d!140057 (= res!844528 (isStrictlySorted!820 lt!574860))))

(declare-fun e!723198 () List!28411)

(assert (=> d!140057 (= lt!574860 e!723198)))

(declare-fun c!124007 () Bool)

(assert (=> d!140057 (= c!124007 (and ((_ is Cons!28407) l!874) (= (_1!10658 (h!29625 l!874)) key!235)))))

(assert (=> d!140057 (isStrictlySorted!820 l!874)))

(assert (=> d!140057 (= (removeStrictlySorted!169 l!874 key!235) lt!574860)))

(declare-fun b!1269222 () Bool)

(assert (=> b!1269222 (= e!723198 (t!41932 l!874))))

(declare-fun b!1269223 () Bool)

(declare-fun e!723199 () List!28411)

(assert (=> b!1269223 (= e!723198 e!723199)))

(declare-fun c!124008 () Bool)

(assert (=> b!1269223 (= c!124008 (and ((_ is Cons!28407) l!874) (not (= (_1!10658 (h!29625 l!874)) key!235))))))

(declare-fun b!1269224 () Bool)

(assert (=> b!1269224 (= e!723200 (not (containsKey!691 lt!574860 key!235)))))

(declare-fun b!1269225 () Bool)

(assert (=> b!1269225 (= e!723199 Nil!28408)))

(declare-fun b!1269226 () Bool)

(declare-fun $colon$colon!651 (List!28411 tuple2!21294) List!28411)

(assert (=> b!1269226 (= e!723199 ($colon$colon!651 (removeStrictlySorted!169 (t!41932 l!874) key!235) (h!29625 l!874)))))

(assert (= (and d!140057 c!124007) b!1269222))

(assert (= (and d!140057 (not c!124007)) b!1269223))

(assert (= (and b!1269223 c!124008) b!1269226))

(assert (= (and b!1269223 (not c!124008)) b!1269225))

(assert (= (and d!140057 res!844528) b!1269224))

(declare-fun m!1168589 () Bool)

(assert (=> d!140057 m!1168589))

(assert (=> d!140057 m!1168569))

(declare-fun m!1168591 () Bool)

(assert (=> b!1269224 m!1168591))

(declare-fun m!1168593 () Bool)

(assert (=> b!1269226 m!1168593))

(assert (=> b!1269226 m!1168593))

(declare-fun m!1168595 () Bool)

(assert (=> b!1269226 m!1168595))

(assert (=> b!1269168 d!140057))

(declare-fun d!140069 () Bool)

(declare-fun res!844535 () Bool)

(declare-fun e!723211 () Bool)

(assert (=> d!140069 (=> res!844535 e!723211)))

(assert (=> d!140069 (= res!844535 (or ((_ is Nil!28408) l!874) ((_ is Nil!28408) (t!41932 l!874))))))

(assert (=> d!140069 (= (isStrictlySorted!820 l!874) e!723211)))

(declare-fun b!1269241 () Bool)

(declare-fun e!723212 () Bool)

(assert (=> b!1269241 (= e!723211 e!723212)))

(declare-fun res!844536 () Bool)

(assert (=> b!1269241 (=> (not res!844536) (not e!723212))))

(assert (=> b!1269241 (= res!844536 (bvslt (_1!10658 (h!29625 l!874)) (_1!10658 (h!29625 (t!41932 l!874)))))))

(declare-fun b!1269242 () Bool)

(assert (=> b!1269242 (= e!723212 (isStrictlySorted!820 (t!41932 l!874)))))

(assert (= (and d!140069 (not res!844535)) b!1269241))

(assert (= (and b!1269241 res!844536) b!1269242))

(declare-fun m!1168597 () Bool)

(assert (=> b!1269242 m!1168597))

(assert (=> start!107090 d!140069))

(declare-fun d!140071 () Bool)

(declare-fun res!844548 () Bool)

(declare-fun e!723230 () Bool)

(assert (=> d!140071 (=> res!844548 e!723230)))

(assert (=> d!140071 (= res!844548 (and ((_ is Cons!28407) l!874) (= (_1!10658 (h!29625 l!874)) key!235)))))

(assert (=> d!140071 (= (containsKey!691 l!874 key!235) e!723230)))

(declare-fun b!1269266 () Bool)

(declare-fun e!723231 () Bool)

(assert (=> b!1269266 (= e!723230 e!723231)))

(declare-fun res!844549 () Bool)

(assert (=> b!1269266 (=> (not res!844549) (not e!723231))))

(assert (=> b!1269266 (= res!844549 (and (or (not ((_ is Cons!28407) l!874)) (bvsle (_1!10658 (h!29625 l!874)) key!235)) ((_ is Cons!28407) l!874) (bvslt (_1!10658 (h!29625 l!874)) key!235)))))

(declare-fun b!1269267 () Bool)

(assert (=> b!1269267 (= e!723231 (containsKey!691 (t!41932 l!874) key!235))))

(assert (= (and d!140071 (not res!844548)) b!1269266))

(assert (= (and b!1269266 res!844549) b!1269267))

(declare-fun m!1168607 () Bool)

(assert (=> b!1269267 m!1168607))

(assert (=> b!1269166 d!140071))

(declare-fun b!1269287 () Bool)

(declare-fun e!723243 () Bool)

(declare-fun tp!96672 () Bool)

(assert (=> b!1269287 (= e!723243 (and tp_is_empty!32617 tp!96672))))

(assert (=> b!1269169 (= tp!96661 e!723243)))

(assert (= (and b!1269169 ((_ is Cons!28407) (t!41932 l!874))) b!1269287))

(check-sat tp_is_empty!32617 (not d!140057) (not b!1269287) (not b!1269267) (not b!1269226) (not b!1269224) (not b!1269242))
(check-sat)
