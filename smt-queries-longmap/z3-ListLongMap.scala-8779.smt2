; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106968 () Bool)

(assert start!106968)

(declare-fun res!844055 () Bool)

(declare-fun e!722714 () Bool)

(assert (=> start!106968 (=> (not res!844055) (not e!722714))))

(declare-datatypes ((B!2066 0))(
  ( (B!2067 (val!16368 Int)) )
))
(declare-datatypes ((tuple2!21264 0))(
  ( (tuple2!21265 (_1!10643 (_ BitVec 64)) (_2!10643 B!2066)) )
))
(declare-datatypes ((List!28396 0))(
  ( (Nil!28393) (Cons!28392 (h!29610 tuple2!21264) (t!41915 List!28396)) )
))
(declare-fun l!874 () List!28396)

(declare-fun isStrictlySorted!805 (List!28396) Bool)

(assert (=> start!106968 (= res!844055 (isStrictlySorted!805 l!874))))

(assert (=> start!106968 e!722714))

(declare-fun e!722715 () Bool)

(assert (=> start!106968 e!722715))

(assert (=> start!106968 true))

(declare-fun b!1268513 () Bool)

(declare-fun res!844054 () Bool)

(assert (=> b!1268513 (=> (not res!844054) (not e!722714))))

(declare-fun key!235 () (_ BitVec 64))

(declare-fun containsKey!676 (List!28396 (_ BitVec 64)) Bool)

(assert (=> b!1268513 (= res!844054 (not (containsKey!676 l!874 key!235)))))

(declare-fun b!1268514 () Bool)

(declare-fun ListPrimitiveSize!157 (List!28396) Int)

(assert (=> b!1268514 (= e!722714 (< (ListPrimitiveSize!157 l!874) 0))))

(declare-fun b!1268515 () Bool)

(declare-fun tp_is_empty!32587 () Bool)

(declare-fun tp!96569 () Bool)

(assert (=> b!1268515 (= e!722715 (and tp_is_empty!32587 tp!96569))))

(assert (= (and start!106968 res!844055) b!1268513))

(assert (= (and b!1268513 res!844054) b!1268514))

(get-info :version)

(assert (= (and start!106968 ((_ is Cons!28392) l!874)) b!1268515))

(declare-fun m!1168267 () Bool)

(assert (=> start!106968 m!1168267))

(declare-fun m!1168269 () Bool)

(assert (=> b!1268513 m!1168269))

(declare-fun m!1168271 () Bool)

(assert (=> b!1268514 m!1168271))

(check-sat (not start!106968) tp_is_empty!32587 (not b!1268515) (not b!1268514) (not b!1268513))
(check-sat)
(get-model)

(declare-fun d!139869 () Bool)

(declare-fun lt!574807 () Int)

(assert (=> d!139869 (>= lt!574807 0)))

(declare-fun e!722738 () Int)

(assert (=> d!139869 (= lt!574807 e!722738)))

(declare-fun c!123956 () Bool)

(assert (=> d!139869 (= c!123956 ((_ is Nil!28393) l!874))))

(assert (=> d!139869 (= (ListPrimitiveSize!157 l!874) lt!574807)))

(declare-fun b!1268544 () Bool)

(assert (=> b!1268544 (= e!722738 0)))

(declare-fun b!1268545 () Bool)

(assert (=> b!1268545 (= e!722738 (+ 1 (ListPrimitiveSize!157 (t!41915 l!874))))))

(assert (= (and d!139869 c!123956) b!1268544))

(assert (= (and d!139869 (not c!123956)) b!1268545))

(declare-fun m!1168285 () Bool)

(assert (=> b!1268545 m!1168285))

(assert (=> b!1268514 d!139869))

(declare-fun d!139875 () Bool)

(declare-fun res!844088 () Bool)

(declare-fun e!722753 () Bool)

(assert (=> d!139875 (=> res!844088 e!722753)))

(assert (=> d!139875 (= res!844088 (and ((_ is Cons!28392) l!874) (= (_1!10643 (h!29610 l!874)) key!235)))))

(assert (=> d!139875 (= (containsKey!676 l!874 key!235) e!722753)))

(declare-fun b!1268564 () Bool)

(declare-fun e!722754 () Bool)

(assert (=> b!1268564 (= e!722753 e!722754)))

(declare-fun res!844089 () Bool)

(assert (=> b!1268564 (=> (not res!844089) (not e!722754))))

(assert (=> b!1268564 (= res!844089 (and (or (not ((_ is Cons!28392) l!874)) (bvsle (_1!10643 (h!29610 l!874)) key!235)) ((_ is Cons!28392) l!874) (bvslt (_1!10643 (h!29610 l!874)) key!235)))))

(declare-fun b!1268565 () Bool)

(assert (=> b!1268565 (= e!722754 (containsKey!676 (t!41915 l!874) key!235))))

(assert (= (and d!139875 (not res!844088)) b!1268564))

(assert (= (and b!1268564 res!844089) b!1268565))

(declare-fun m!1168291 () Bool)

(assert (=> b!1268565 m!1168291))

(assert (=> b!1268513 d!139875))

(declare-fun d!139881 () Bool)

(declare-fun res!844100 () Bool)

(declare-fun e!722768 () Bool)

(assert (=> d!139881 (=> res!844100 e!722768)))

(assert (=> d!139881 (= res!844100 (or ((_ is Nil!28393) l!874) ((_ is Nil!28393) (t!41915 l!874))))))

(assert (=> d!139881 (= (isStrictlySorted!805 l!874) e!722768)))

(declare-fun b!1268582 () Bool)

(declare-fun e!722769 () Bool)

(assert (=> b!1268582 (= e!722768 e!722769)))

(declare-fun res!844101 () Bool)

(assert (=> b!1268582 (=> (not res!844101) (not e!722769))))

(assert (=> b!1268582 (= res!844101 (bvslt (_1!10643 (h!29610 l!874)) (_1!10643 (h!29610 (t!41915 l!874)))))))

(declare-fun b!1268583 () Bool)

(assert (=> b!1268583 (= e!722769 (isStrictlySorted!805 (t!41915 l!874)))))

(assert (= (and d!139881 (not res!844100)) b!1268582))

(assert (= (and b!1268582 res!844101) b!1268583))

(declare-fun m!1168297 () Bool)

(assert (=> b!1268583 m!1168297))

(assert (=> start!106968 d!139881))

(declare-fun b!1268600 () Bool)

(declare-fun e!722779 () Bool)

(declare-fun tp!96580 () Bool)

(assert (=> b!1268600 (= e!722779 (and tp_is_empty!32587 tp!96580))))

(assert (=> b!1268515 (= tp!96569 e!722779)))

(assert (= (and b!1268515 ((_ is Cons!28392) (t!41915 l!874))) b!1268600))

(check-sat (not b!1268545) tp_is_empty!32587 (not b!1268600) (not b!1268583) (not b!1268565))
(check-sat)
