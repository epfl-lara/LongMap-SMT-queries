; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106748 () Bool)

(assert start!106748)

(declare-fun res!843547 () Bool)

(declare-fun e!721880 () Bool)

(assert (=> start!106748 (=> (not res!843547) (not e!721880))))

(declare-datatypes ((B!2070 0))(
  ( (B!2071 (val!16370 Int)) )
))
(declare-datatypes ((tuple2!21258 0))(
  ( (tuple2!21259 (_1!10640 (_ BitVec 64)) (_2!10640 B!2070)) )
))
(declare-datatypes ((List!28362 0))(
  ( (Nil!28359) (Cons!28358 (h!29567 tuple2!21258) (t!41889 List!28362)) )
))
(declare-fun l!874 () List!28362)

(declare-fun isStrictlySorted!819 (List!28362) Bool)

(assert (=> start!106748 (= res!843547 (isStrictlySorted!819 l!874))))

(assert (=> start!106748 e!721880))

(declare-fun e!721879 () Bool)

(assert (=> start!106748 e!721879))

(assert (=> start!106748 true))

(declare-fun b!1267226 () Bool)

(declare-fun res!843546 () Bool)

(assert (=> b!1267226 (=> (not res!843546) (not e!721880))))

(declare-fun key!235 () (_ BitVec 64))

(declare-fun containsKey!678 (List!28362 (_ BitVec 64)) Bool)

(assert (=> b!1267226 (= res!843546 (not (containsKey!678 l!874 key!235)))))

(declare-fun b!1267227 () Bool)

(declare-fun ListPrimitiveSize!159 (List!28362) Int)

(assert (=> b!1267227 (= e!721880 (< (ListPrimitiveSize!159 l!874) 0))))

(declare-fun b!1267228 () Bool)

(declare-fun tp_is_empty!32591 () Bool)

(declare-fun tp!96575 () Bool)

(assert (=> b!1267228 (= e!721879 (and tp_is_empty!32591 tp!96575))))

(assert (= (and start!106748 res!843547) b!1267226))

(assert (= (and b!1267226 res!843546) b!1267227))

(assert (= (and start!106748 (is-Cons!28358 l!874)) b!1267228))

(declare-fun m!1166667 () Bool)

(assert (=> start!106748 m!1166667))

(declare-fun m!1166669 () Bool)

(assert (=> b!1267226 m!1166669))

(declare-fun m!1166671 () Bool)

(assert (=> b!1267227 m!1166671))

(push 1)

(assert (not b!1267227))

(assert (not b!1267228))

(assert (not b!1267226))

(assert (not start!106748))

(assert tp_is_empty!32591)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!139423 () Bool)

(declare-fun res!843556 () Bool)

(declare-fun e!721889 () Bool)

(assert (=> d!139423 (=> res!843556 e!721889)))

(assert (=> d!139423 (= res!843556 (or (is-Nil!28359 l!874) (is-Nil!28359 (t!41889 l!874))))))

(assert (=> d!139423 (= (isStrictlySorted!819 l!874) e!721889)))

(declare-fun b!1267237 () Bool)

(declare-fun e!721890 () Bool)

(assert (=> b!1267237 (= e!721889 e!721890)))

(declare-fun res!843557 () Bool)

(assert (=> b!1267237 (=> (not res!843557) (not e!721890))))

(assert (=> b!1267237 (= res!843557 (bvslt (_1!10640 (h!29567 l!874)) (_1!10640 (h!29567 (t!41889 l!874)))))))

(declare-fun b!1267238 () Bool)

(assert (=> b!1267238 (= e!721890 (isStrictlySorted!819 (t!41889 l!874)))))

(assert (= (and d!139423 (not res!843556)) b!1267237))

(assert (= (and b!1267237 res!843557) b!1267238))

(declare-fun m!1166673 () Bool)

(assert (=> b!1267238 m!1166673))

(assert (=> start!106748 d!139423))

(declare-fun d!139427 () Bool)

(declare-fun res!843568 () Bool)

(declare-fun e!721904 () Bool)

(assert (=> d!139427 (=> res!843568 e!721904)))

(assert (=> d!139427 (= res!843568 (and (is-Cons!28358 l!874) (= (_1!10640 (h!29567 l!874)) key!235)))))

(assert (=> d!139427 (= (containsKey!678 l!874 key!235) e!721904)))

(declare-fun b!1267255 () Bool)

(declare-fun e!721905 () Bool)

(assert (=> b!1267255 (= e!721904 e!721905)))

(declare-fun res!843569 () Bool)

(assert (=> b!1267255 (=> (not res!843569) (not e!721905))))

(assert (=> b!1267255 (= res!843569 (and (or (not (is-Cons!28358 l!874)) (bvsle (_1!10640 (h!29567 l!874)) key!235)) (is-Cons!28358 l!874) (bvslt (_1!10640 (h!29567 l!874)) key!235)))))

(declare-fun b!1267256 () Bool)

(assert (=> b!1267256 (= e!721905 (containsKey!678 (t!41889 l!874) key!235))))

(assert (= (and d!139427 (not res!843568)) b!1267255))

(assert (= (and b!1267255 res!843569) b!1267256))

(declare-fun m!1166679 () Bool)

(assert (=> b!1267256 m!1166679))

(assert (=> b!1267226 d!139427))

(declare-fun d!139433 () Bool)

(declare-fun lt!574326 () Int)

(assert (=> d!139433 (>= lt!574326 0)))

(declare-fun e!721916 () Int)

(assert (=> d!139433 (= lt!574326 e!721916)))

(declare-fun c!123559 () Bool)

(assert (=> d!139433 (= c!123559 (is-Nil!28359 l!874))))

(assert (=> d!139433 (= (ListPrimitiveSize!159 l!874) lt!574326)))

(declare-fun b!1267269 () Bool)

(assert (=> b!1267269 (= e!721916 0)))

(declare-fun b!1267270 () Bool)

(assert (=> b!1267270 (= e!721916 (+ 1 (ListPrimitiveSize!159 (t!41889 l!874))))))

(assert (= (and d!139433 c!123559) b!1267269))

(assert (= (and d!139433 (not c!123559)) b!1267270))

(declare-fun m!1166685 () Bool)

(assert (=> b!1267270 m!1166685))

(assert (=> b!1267227 d!139433))

(declare-fun b!1267280 () Bool)

(declare-fun e!721922 () Bool)

(declare-fun tp!96581 () Bool)

(assert (=> b!1267280 (= e!721922 (and tp_is_empty!32591 tp!96581))))

(assert (=> b!1267228 (= tp!96575 e!721922)))

(assert (= (and b!1267228 (is-Cons!28358 (t!41889 l!874))) b!1267280))

(push 1)

