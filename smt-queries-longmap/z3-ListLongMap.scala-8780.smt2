; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106764 () Bool)

(assert start!106764)

(declare-fun b!1267226 () Bool)

(declare-fun e!721894 () Bool)

(declare-datatypes ((B!2072 0))(
  ( (B!2073 (val!16371 Int)) )
))
(declare-datatypes ((tuple2!21342 0))(
  ( (tuple2!21343 (_1!10682 (_ BitVec 64)) (_2!10682 B!2072)) )
))
(declare-datatypes ((List!28447 0))(
  ( (Nil!28444) (Cons!28443 (h!29652 tuple2!21342) (t!41965 List!28447)) )
))
(declare-fun l!874 () List!28447)

(declare-fun isStrictlySorted!816 (List!28447) Bool)

(assert (=> b!1267226 (= e!721894 (not (isStrictlySorted!816 (t!41965 l!874))))))

(declare-fun res!843551 () Bool)

(assert (=> start!106764 (=> (not res!843551) (not e!721894))))

(assert (=> start!106764 (= res!843551 (isStrictlySorted!816 l!874))))

(assert (=> start!106764 e!721894))

(declare-fun e!721895 () Bool)

(assert (=> start!106764 e!721895))

(assert (=> start!106764 true))

(declare-fun b!1267227 () Bool)

(declare-fun tp_is_empty!32593 () Bool)

(declare-fun tp!96587 () Bool)

(assert (=> b!1267227 (= e!721895 (and tp_is_empty!32593 tp!96587))))

(declare-fun b!1267225 () Bool)

(declare-fun res!843550 () Bool)

(assert (=> b!1267225 (=> (not res!843550) (not e!721894))))

(get-info :version)

(assert (=> b!1267225 (= res!843550 ((_ is Cons!28443) l!874))))

(declare-fun b!1267224 () Bool)

(declare-fun res!843552 () Bool)

(assert (=> b!1267224 (=> (not res!843552) (not e!721894))))

(declare-fun key!235 () (_ BitVec 64))

(declare-fun containsKey!677 (List!28447 (_ BitVec 64)) Bool)

(assert (=> b!1267224 (= res!843552 (not (containsKey!677 l!874 key!235)))))

(assert (= (and start!106764 res!843551) b!1267224))

(assert (= (and b!1267224 res!843552) b!1267225))

(assert (= (and b!1267225 res!843550) b!1267226))

(assert (= (and start!106764 ((_ is Cons!28443) l!874)) b!1267227))

(declare-fun m!1166171 () Bool)

(assert (=> b!1267226 m!1166171))

(declare-fun m!1166173 () Bool)

(assert (=> start!106764 m!1166173))

(declare-fun m!1166175 () Bool)

(assert (=> b!1267224 m!1166175))

(check-sat (not b!1267224) (not b!1267226) (not b!1267227) (not start!106764) tp_is_empty!32593)
(check-sat)
(get-model)

(declare-fun d!139311 () Bool)

(declare-fun res!843585 () Bool)

(declare-fun e!721922 () Bool)

(assert (=> d!139311 (=> res!843585 e!721922)))

(assert (=> d!139311 (= res!843585 (and ((_ is Cons!28443) l!874) (= (_1!10682 (h!29652 l!874)) key!235)))))

(assert (=> d!139311 (= (containsKey!677 l!874 key!235) e!721922)))

(declare-fun b!1267266 () Bool)

(declare-fun e!721923 () Bool)

(assert (=> b!1267266 (= e!721922 e!721923)))

(declare-fun res!843586 () Bool)

(assert (=> b!1267266 (=> (not res!843586) (not e!721923))))

(assert (=> b!1267266 (= res!843586 (and (or (not ((_ is Cons!28443) l!874)) (bvsle (_1!10682 (h!29652 l!874)) key!235)) ((_ is Cons!28443) l!874) (bvslt (_1!10682 (h!29652 l!874)) key!235)))))

(declare-fun b!1267267 () Bool)

(assert (=> b!1267267 (= e!721923 (containsKey!677 (t!41965 l!874) key!235))))

(assert (= (and d!139311 (not res!843585)) b!1267266))

(assert (= (and b!1267266 res!843586) b!1267267))

(declare-fun m!1166189 () Bool)

(assert (=> b!1267267 m!1166189))

(assert (=> b!1267224 d!139311))

(declare-fun d!139317 () Bool)

(declare-fun res!843603 () Bool)

(declare-fun e!721940 () Bool)

(assert (=> d!139317 (=> res!843603 e!721940)))

(assert (=> d!139317 (= res!843603 (or ((_ is Nil!28444) (t!41965 l!874)) ((_ is Nil!28444) (t!41965 (t!41965 l!874)))))))

(assert (=> d!139317 (= (isStrictlySorted!816 (t!41965 l!874)) e!721940)))

(declare-fun b!1267284 () Bool)

(declare-fun e!721941 () Bool)

(assert (=> b!1267284 (= e!721940 e!721941)))

(declare-fun res!843604 () Bool)

(assert (=> b!1267284 (=> (not res!843604) (not e!721941))))

(assert (=> b!1267284 (= res!843604 (bvslt (_1!10682 (h!29652 (t!41965 l!874))) (_1!10682 (h!29652 (t!41965 (t!41965 l!874))))))))

(declare-fun b!1267285 () Bool)

(assert (=> b!1267285 (= e!721941 (isStrictlySorted!816 (t!41965 (t!41965 l!874))))))

(assert (= (and d!139317 (not res!843603)) b!1267284))

(assert (= (and b!1267284 res!843604) b!1267285))

(declare-fun m!1166195 () Bool)

(assert (=> b!1267285 m!1166195))

(assert (=> b!1267226 d!139317))

(declare-fun d!139323 () Bool)

(declare-fun res!843608 () Bool)

(declare-fun e!721945 () Bool)

(assert (=> d!139323 (=> res!843608 e!721945)))

(assert (=> d!139323 (= res!843608 (or ((_ is Nil!28444) l!874) ((_ is Nil!28444) (t!41965 l!874))))))

(assert (=> d!139323 (= (isStrictlySorted!816 l!874) e!721945)))

(declare-fun b!1267289 () Bool)

(declare-fun e!721947 () Bool)

(assert (=> b!1267289 (= e!721945 e!721947)))

(declare-fun res!843610 () Bool)

(assert (=> b!1267289 (=> (not res!843610) (not e!721947))))

(assert (=> b!1267289 (= res!843610 (bvslt (_1!10682 (h!29652 l!874)) (_1!10682 (h!29652 (t!41965 l!874)))))))

(declare-fun b!1267291 () Bool)

(assert (=> b!1267291 (= e!721947 (isStrictlySorted!816 (t!41965 l!874)))))

(assert (= (and d!139323 (not res!843608)) b!1267289))

(assert (= (and b!1267289 res!843610) b!1267291))

(assert (=> b!1267291 m!1166171))

(assert (=> start!106764 d!139323))

(declare-fun b!1267307 () Bool)

(declare-fun e!721957 () Bool)

(declare-fun tp!96601 () Bool)

(assert (=> b!1267307 (= e!721957 (and tp_is_empty!32593 tp!96601))))

(assert (=> b!1267227 (= tp!96587 e!721957)))

(assert (= (and b!1267227 ((_ is Cons!28443) (t!41965 l!874))) b!1267307))

(check-sat (not b!1267291) tp_is_empty!32593 (not b!1267267) (not b!1267285) (not b!1267307))
(check-sat)
