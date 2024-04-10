; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106424 () Bool)

(assert start!106424)

(declare-fun res!842607 () Bool)

(declare-fun e!720709 () Bool)

(assert (=> start!106424 (=> (not res!842607) (not e!720709))))

(declare-datatypes ((B!1974 0))(
  ( (B!1975 (val!16322 Int)) )
))
(declare-datatypes ((tuple2!21162 0))(
  ( (tuple2!21163 (_1!10592 (_ BitVec 64)) (_2!10592 B!1974)) )
))
(declare-datatypes ((List!28314 0))(
  ( (Nil!28311) (Cons!28310 (h!29519 tuple2!21162) (t!41835 List!28314)) )
))
(declare-fun l!706 () List!28314)

(declare-fun isStrictlySorted!789 (List!28314) Bool)

(assert (=> start!106424 (= res!842607 (isStrictlySorted!789 l!706))))

(assert (=> start!106424 e!720709))

(declare-fun e!720710 () Bool)

(assert (=> start!106424 e!720710))

(assert (=> start!106424 true))

(declare-fun b!1265534 () Bool)

(declare-fun res!842608 () Bool)

(assert (=> b!1265534 (=> (not res!842608) (not e!720709))))

(declare-fun key1!31 () (_ BitVec 64))

(declare-fun containsKey!648 (List!28314 (_ BitVec 64)) Bool)

(assert (=> b!1265534 (= res!842608 (not (containsKey!648 l!706 key1!31)))))

(declare-fun b!1265535 () Bool)

(declare-fun ListPrimitiveSize!153 (List!28314) Int)

(assert (=> b!1265535 (= e!720709 (< (ListPrimitiveSize!153 l!706) 0))))

(declare-fun b!1265536 () Bool)

(declare-fun tp_is_empty!32507 () Bool)

(declare-fun tp!96344 () Bool)

(assert (=> b!1265536 (= e!720710 (and tp_is_empty!32507 tp!96344))))

(assert (= (and start!106424 res!842607) b!1265534))

(assert (= (and b!1265534 res!842608) b!1265535))

(assert (= (and start!106424 (is-Cons!28310 l!706)) b!1265536))

(declare-fun m!1165659 () Bool)

(assert (=> start!106424 m!1165659))

(declare-fun m!1165661 () Bool)

(assert (=> b!1265534 m!1165661))

(declare-fun m!1165663 () Bool)

(assert (=> b!1265535 m!1165663))

(push 1)

(assert (not b!1265536))

(assert tp_is_empty!32507)

(assert (not start!106424))

(assert (not b!1265534))

(assert (not b!1265535))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!138927 () Bool)

(declare-fun res!842617 () Bool)

(declare-fun e!720722 () Bool)

(assert (=> d!138927 (=> res!842617 e!720722)))

(assert (=> d!138927 (= res!842617 (and (is-Cons!28310 l!706) (= (_1!10592 (h!29519 l!706)) key1!31)))))

(assert (=> d!138927 (= (containsKey!648 l!706 key1!31) e!720722)))

(declare-fun b!1265551 () Bool)

(declare-fun e!720723 () Bool)

(assert (=> b!1265551 (= e!720722 e!720723)))

(declare-fun res!842618 () Bool)

(assert (=> b!1265551 (=> (not res!842618) (not e!720723))))

(assert (=> b!1265551 (= res!842618 (and (or (not (is-Cons!28310 l!706)) (bvsle (_1!10592 (h!29519 l!706)) key1!31)) (is-Cons!28310 l!706) (bvslt (_1!10592 (h!29519 l!706)) key1!31)))))

(declare-fun b!1265552 () Bool)

(assert (=> b!1265552 (= e!720723 (containsKey!648 (t!41835 l!706) key1!31))))

(assert (= (and d!138927 (not res!842617)) b!1265551))

(assert (= (and b!1265551 res!842618) b!1265552))

(declare-fun m!1165667 () Bool)

(assert (=> b!1265552 m!1165667))

(assert (=> b!1265534 d!138927))

(declare-fun d!138935 () Bool)

(declare-fun lt!574058 () Int)

(assert (=> d!138935 (>= lt!574058 0)))

(declare-fun e!720734 () Int)

(assert (=> d!138935 (= lt!574058 e!720734)))

(declare-fun c!123327 () Bool)

(assert (=> d!138935 (= c!123327 (is-Nil!28311 l!706))))

(assert (=> d!138935 (= (ListPrimitiveSize!153 l!706) lt!574058)))

(declare-fun b!1265567 () Bool)

(assert (=> b!1265567 (= e!720734 0)))

(declare-fun b!1265568 () Bool)

(assert (=> b!1265568 (= e!720734 (+ 1 (ListPrimitiveSize!153 (t!41835 l!706))))))

(assert (= (and d!138935 c!123327) b!1265567))

(assert (= (and d!138935 (not c!123327)) b!1265568))

(declare-fun m!1165671 () Bool)

(assert (=> b!1265568 m!1165671))

(assert (=> b!1265535 d!138935))

(declare-fun d!138939 () Bool)

(declare-fun res!842639 () Bool)

(declare-fun e!720750 () Bool)

(assert (=> d!138939 (=> res!842639 e!720750)))

(assert (=> d!138939 (= res!842639 (or (is-Nil!28311 l!706) (is-Nil!28311 (t!41835 l!706))))))

(assert (=> d!138939 (= (isStrictlySorted!789 l!706) e!720750)))

(declare-fun b!1265585 () Bool)

(declare-fun e!720751 () Bool)

(assert (=> b!1265585 (= e!720750 e!720751)))

(declare-fun res!842640 () Bool)

(assert (=> b!1265585 (=> (not res!842640) (not e!720751))))

(assert (=> b!1265585 (= res!842640 (bvslt (_1!10592 (h!29519 l!706)) (_1!10592 (h!29519 (t!41835 l!706)))))))

(declare-fun b!1265586 () Bool)

(assert (=> b!1265586 (= e!720751 (isStrictlySorted!789 (t!41835 l!706)))))

(assert (= (and d!138939 (not res!842639)) b!1265585))

(assert (= (and b!1265585 res!842640) b!1265586))

(declare-fun m!1165677 () Bool)

(assert (=> b!1265586 m!1165677))

(assert (=> start!106424 d!138939))

(declare-fun b!1265603 () Bool)

(declare-fun e!720762 () Bool)

(declare-fun tp!96351 () Bool)

(assert (=> b!1265603 (= e!720762 (and tp_is_empty!32507 tp!96351))))

(assert (=> b!1265536 (= tp!96344 e!720762)))

(assert (= (and b!1265536 (is-Cons!28310 (t!41835 l!706))) b!1265603))

(push 1)

