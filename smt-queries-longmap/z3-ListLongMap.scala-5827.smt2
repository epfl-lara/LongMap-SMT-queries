; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75322 () Bool)

(assert start!75322)

(declare-fun res!601815 () Bool)

(declare-fun e!493568 () Bool)

(assert (=> start!75322 (=> (not res!601815) (not e!493568))))

(declare-datatypes ((B!1280 0))(
  ( (B!1281 (val!8946 Int)) )
))
(declare-datatypes ((tuple2!11816 0))(
  ( (tuple2!11817 (_1!5919 (_ BitVec 64)) (_2!5919 B!1280)) )
))
(declare-datatypes ((List!17617 0))(
  ( (Nil!17614) (Cons!17613 (h!18750 tuple2!11816) (t!24886 List!17617)) )
))
(declare-fun l!906 () List!17617)

(declare-fun isStrictlySorted!468 (List!17617) Bool)

(assert (=> start!75322 (= res!601815 (isStrictlySorted!468 l!906))))

(assert (=> start!75322 e!493568))

(declare-fun e!493569 () Bool)

(assert (=> start!75322 e!493569))

(declare-fun b!886671 () Bool)

(declare-fun ListPrimitiveSize!85 (List!17617) Int)

(assert (=> b!886671 (= e!493568 (< (ListPrimitiveSize!85 l!906) 0))))

(declare-fun b!886672 () Bool)

(declare-fun tp_is_empty!17791 () Bool)

(declare-fun tp!54312 () Bool)

(assert (=> b!886672 (= e!493569 (and tp_is_empty!17791 tp!54312))))

(assert (= (and start!75322 res!601815) b!886671))

(get-info :version)

(assert (= (and start!75322 ((_ is Cons!17613) l!906)) b!886672))

(declare-fun m!827135 () Bool)

(assert (=> start!75322 m!827135))

(declare-fun m!827137 () Bool)

(assert (=> b!886671 m!827137))

(check-sat (not start!75322) (not b!886671) (not b!886672) tp_is_empty!17791)
(check-sat)
(get-model)

(declare-fun d!109765 () Bool)

(declare-fun res!601832 () Bool)

(declare-fun e!493595 () Bool)

(assert (=> d!109765 (=> res!601832 e!493595)))

(assert (=> d!109765 (= res!601832 (or ((_ is Nil!17614) l!906) ((_ is Nil!17614) (t!24886 l!906))))))

(assert (=> d!109765 (= (isStrictlySorted!468 l!906) e!493595)))

(declare-fun b!886701 () Bool)

(declare-fun e!493596 () Bool)

(assert (=> b!886701 (= e!493595 e!493596)))

(declare-fun res!601833 () Bool)

(assert (=> b!886701 (=> (not res!601833) (not e!493596))))

(assert (=> b!886701 (= res!601833 (bvslt (_1!5919 (h!18750 l!906)) (_1!5919 (h!18750 (t!24886 l!906)))))))

(declare-fun b!886702 () Bool)

(assert (=> b!886702 (= e!493596 (isStrictlySorted!468 (t!24886 l!906)))))

(assert (= (and d!109765 (not res!601832)) b!886701))

(assert (= (and b!886701 res!601833) b!886702))

(declare-fun m!827151 () Bool)

(assert (=> b!886702 m!827151))

(assert (=> start!75322 d!109765))

(declare-fun d!109775 () Bool)

(declare-fun lt!401414 () Int)

(assert (=> d!109775 (>= lt!401414 0)))

(declare-fun e!493610 () Int)

(assert (=> d!109775 (= lt!401414 e!493610)))

(declare-fun c!93644 () Bool)

(assert (=> d!109775 (= c!93644 ((_ is Nil!17614) l!906))))

(assert (=> d!109775 (= (ListPrimitiveSize!85 l!906) lt!401414)))

(declare-fun b!886723 () Bool)

(assert (=> b!886723 (= e!493610 0)))

(declare-fun b!886724 () Bool)

(assert (=> b!886724 (= e!493610 (+ 1 (ListPrimitiveSize!85 (t!24886 l!906))))))

(assert (= (and d!109775 c!93644) b!886723))

(assert (= (and d!109775 (not c!93644)) b!886724))

(declare-fun m!827157 () Bool)

(assert (=> b!886724 m!827157))

(assert (=> b!886671 d!109775))

(declare-fun b!886735 () Bool)

(declare-fun e!493617 () Bool)

(declare-fun tp!54327 () Bool)

(assert (=> b!886735 (= e!493617 (and tp_is_empty!17791 tp!54327))))

(assert (=> b!886672 (= tp!54312 e!493617)))

(assert (= (and b!886672 ((_ is Cons!17613) (t!24886 l!906))) b!886735))

(check-sat (not b!886702) (not b!886724) (not b!886735) tp_is_empty!17791)
(check-sat)
