; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106746 () Bool)

(assert start!106746)

(declare-fun res!843540 () Bool)

(declare-fun e!721873 () Bool)

(assert (=> start!106746 (=> (not res!843540) (not e!721873))))

(declare-datatypes ((B!2068 0))(
  ( (B!2069 (val!16369 Int)) )
))
(declare-datatypes ((tuple2!21256 0))(
  ( (tuple2!21257 (_1!10639 (_ BitVec 64)) (_2!10639 B!2068)) )
))
(declare-datatypes ((List!28361 0))(
  ( (Nil!28358) (Cons!28357 (h!29566 tuple2!21256) (t!41888 List!28361)) )
))
(declare-fun l!874 () List!28361)

(declare-fun isStrictlySorted!818 (List!28361) Bool)

(assert (=> start!106746 (= res!843540 (isStrictlySorted!818 l!874))))

(assert (=> start!106746 e!721873))

(declare-fun e!721874 () Bool)

(assert (=> start!106746 e!721874))

(assert (=> start!106746 true))

(declare-fun b!1267217 () Bool)

(declare-fun res!843541 () Bool)

(assert (=> b!1267217 (=> (not res!843541) (not e!721873))))

(declare-fun key!235 () (_ BitVec 64))

(declare-fun containsKey!677 (List!28361 (_ BitVec 64)) Bool)

(assert (=> b!1267217 (= res!843541 (not (containsKey!677 l!874 key!235)))))

(declare-fun b!1267218 () Bool)

(declare-fun ListPrimitiveSize!158 (List!28361) Int)

(assert (=> b!1267218 (= e!721873 (< (ListPrimitiveSize!158 l!874) 0))))

(declare-fun b!1267219 () Bool)

(declare-fun tp_is_empty!32589 () Bool)

(declare-fun tp!96572 () Bool)

(assert (=> b!1267219 (= e!721874 (and tp_is_empty!32589 tp!96572))))

(assert (= (and start!106746 res!843540) b!1267217))

(assert (= (and b!1267217 res!843541) b!1267218))

(get-info :version)

(assert (= (and start!106746 ((_ is Cons!28357) l!874)) b!1267219))

(declare-fun m!1166661 () Bool)

(assert (=> start!106746 m!1166661))

(declare-fun m!1166663 () Bool)

(assert (=> b!1267217 m!1166663))

(declare-fun m!1166665 () Bool)

(assert (=> b!1267218 m!1166665))

(check-sat tp_is_empty!32589 (not b!1267217) (not b!1267219) (not b!1267218) (not start!106746))
(check-sat)
(get-model)

(declare-fun d!139425 () Bool)

(declare-fun res!843574 () Bool)

(declare-fun e!721912 () Bool)

(assert (=> d!139425 (=> res!843574 e!721912)))

(assert (=> d!139425 (= res!843574 (and ((_ is Cons!28357) l!874) (= (_1!10639 (h!29566 l!874)) key!235)))))

(assert (=> d!139425 (= (containsKey!677 l!874 key!235) e!721912)))

(declare-fun b!1267265 () Bool)

(declare-fun e!721913 () Bool)

(assert (=> b!1267265 (= e!721912 e!721913)))

(declare-fun res!843575 () Bool)

(assert (=> b!1267265 (=> (not res!843575) (not e!721913))))

(assert (=> b!1267265 (= res!843575 (and (or (not ((_ is Cons!28357) l!874)) (bvsle (_1!10639 (h!29566 l!874)) key!235)) ((_ is Cons!28357) l!874) (bvslt (_1!10639 (h!29566 l!874)) key!235)))))

(declare-fun b!1267266 () Bool)

(assert (=> b!1267266 (= e!721913 (containsKey!677 (t!41888 l!874) key!235))))

(assert (= (and d!139425 (not res!843574)) b!1267265))

(assert (= (and b!1267265 res!843575) b!1267266))

(declare-fun m!1166681 () Bool)

(assert (=> b!1267266 m!1166681))

(assert (=> b!1267217 d!139425))

(declare-fun d!139435 () Bool)

(declare-fun lt!574329 () Int)

(assert (=> d!139435 (>= lt!574329 0)))

(declare-fun e!721925 () Int)

(assert (=> d!139435 (= lt!574329 e!721925)))

(declare-fun c!123562 () Bool)

(assert (=> d!139435 (= c!123562 ((_ is Nil!28358) l!874))))

(assert (=> d!139435 (= (ListPrimitiveSize!158 l!874) lt!574329)))

(declare-fun b!1267285 () Bool)

(assert (=> b!1267285 (= e!721925 0)))

(declare-fun b!1267286 () Bool)

(assert (=> b!1267286 (= e!721925 (+ 1 (ListPrimitiveSize!158 (t!41888 l!874))))))

(assert (= (and d!139435 c!123562) b!1267285))

(assert (= (and d!139435 (not c!123562)) b!1267286))

(declare-fun m!1166687 () Bool)

(assert (=> b!1267286 m!1166687))

(assert (=> b!1267218 d!139435))

(declare-fun d!139437 () Bool)

(declare-fun res!843582 () Bool)

(declare-fun e!721930 () Bool)

(assert (=> d!139437 (=> res!843582 e!721930)))

(assert (=> d!139437 (= res!843582 (or ((_ is Nil!28358) l!874) ((_ is Nil!28358) (t!41888 l!874))))))

