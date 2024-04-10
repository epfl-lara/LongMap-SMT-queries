; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106744 () Bool)

(assert start!106744)

(declare-fun res!843535 () Bool)

(declare-fun e!721867 () Bool)

(assert (=> start!106744 (=> (not res!843535) (not e!721867))))

(declare-datatypes ((B!2066 0))(
  ( (B!2067 (val!16368 Int)) )
))
(declare-datatypes ((tuple2!21254 0))(
  ( (tuple2!21255 (_1!10638 (_ BitVec 64)) (_2!10638 B!2066)) )
))
(declare-datatypes ((List!28360 0))(
  ( (Nil!28357) (Cons!28356 (h!29565 tuple2!21254) (t!41887 List!28360)) )
))
(declare-fun l!874 () List!28360)

(declare-fun isStrictlySorted!817 (List!28360) Bool)

(assert (=> start!106744 (= res!843535 (isStrictlySorted!817 l!874))))

(assert (=> start!106744 e!721867))

(declare-fun e!721868 () Bool)

(assert (=> start!106744 e!721868))

(assert (=> start!106744 true))

(declare-fun b!1267208 () Bool)

(declare-fun res!843534 () Bool)

(assert (=> b!1267208 (=> (not res!843534) (not e!721867))))

(declare-fun key!235 () (_ BitVec 64))

(declare-fun containsKey!676 (List!28360 (_ BitVec 64)) Bool)

(assert (=> b!1267208 (= res!843534 (not (containsKey!676 l!874 key!235)))))

(declare-fun b!1267209 () Bool)

(declare-fun ListPrimitiveSize!157 (List!28360) Int)

(assert (=> b!1267209 (= e!721867 (< (ListPrimitiveSize!157 l!874) 0))))

(declare-fun b!1267210 () Bool)

(declare-fun tp_is_empty!32587 () Bool)

(declare-fun tp!96569 () Bool)

(assert (=> b!1267210 (= e!721868 (and tp_is_empty!32587 tp!96569))))

(assert (= (and start!106744 res!843535) b!1267208))

(assert (= (and b!1267208 res!843534) b!1267209))

(assert (= (and start!106744 (is-Cons!28356 l!874)) b!1267210))

(declare-fun m!1166655 () Bool)

(assert (=> start!106744 m!1166655))

(declare-fun m!1166657 () Bool)

(assert (=> b!1267208 m!1166657))

(declare-fun m!1166659 () Bool)

(assert (=> b!1267209 m!1166659))

(push 1)

(assert (not start!106744))

(assert (not b!1267209))

(assert (not b!1267210))

(assert tp_is_empty!32587)

(assert (not b!1267208))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!139422 () Bool)

(declare-fun res!843558 () Bool)

(declare-fun e!721891 () Bool)

(assert (=> d!139422 (=> res!843558 e!721891)))

(assert (=> d!139422 (= res!843558 (and (is-Cons!28356 l!874) (= (_1!10638 (h!29565 l!874)) key!235)))))

(assert (=> d!139422 (= (containsKey!676 l!874 key!235) e!721891)))

(declare-fun b!1267239 () Bool)

(declare-fun e!721892 () Bool)

(assert (=> b!1267239 (= e!721891 e!721892)))

(declare-fun res!843559 () Bool)

(assert (=> b!1267239 (=> (not res!843559) (not e!721892))))

(assert (=> b!1267239 (= res!843559 (and (or (not (is-Cons!28356 l!874)) (bvsle (_1!10638 (h!29565 l!874)) key!235)) (is-Cons!28356 l!874) (bvslt (_1!10638 (h!29565 l!874)) key!235)))))

(declare-fun b!1267240 () Bool)

(assert (=> b!1267240 (= e!721892 (containsKey!676 (t!41887 l!874) key!235))))

(assert (= (and d!139422 (not res!843558)) b!1267239))

(assert (= (and b!1267239 res!843559) b!1267240))

(declare-fun m!1166675 () Bool)

(assert (=> b!1267240 m!1166675))

(assert (=> b!1267208 d!139422))

(declare-fun d!139429 () Bool)

(declare-fun lt!574323 () Int)

(assert (=> d!139429 (>= lt!574323 0)))

(declare-fun e!721901 () Int)

(assert (=> d!139429 (= lt!574323 e!721901)))

(declare-fun c!123556 () Bool)

(assert (=> d!139429 (= c!123556 (is-Nil!28357 l!874))))

(assert (=> d!139429 (= (ListPrimitiveSize!157 l!874) lt!574323)))

(declare-fun b!1267249 () Bool)

(assert (=> b!1267249 (= e!721901 0)))

(declare-fun b!1267250 () Bool)

(assert (=> b!1267250 (= e!721901 (+ 1 (ListPrimitiveSize!157 (t!41887 l!874))))))

(assert (= (and d!139429 c!123556) b!1267249))

(assert (= (and d!139429 (not c!123556)) b!1267250))

(declare-fun m!1166677 () Bool)

(assert (=> b!1267250 m!1166677))

(assert (=> b!1267209 d!139429))

(declare-fun d!139431 () Bool)

(declare-fun res!843576 () Bool)

(declare-fun e!721914 () Bool)

(assert (=> d!139431 (=> res!843576 e!721914)))

(assert (=> d!139431 (= res!843576 (or (is-Nil!28357 l!874) (is-Nil!28357 (t!41887 l!874))))))

(assert (=> d!139431 (= (isStrictlySorted!817 l!874) e!721914)))

(declare-fun b!1267267 () Bool)

(declare-fun e!721915 () Bool)

(assert (=> b!1267267 (= e!721914 e!721915)))

(declare-fun res!843577 () Bool)

(assert (=> b!1267267 (=> (not res!843577) (not e!721915))))

(assert (=> b!1267267 (= res!843577 (bvslt (_1!10638 (h!29565 l!874)) (_1!10638 (h!29565 (t!41887 l!874)))))))

(declare-fun b!1267268 () Bool)

(assert (=> b!1267268 (= e!721915 (isStrictlySorted!817 (t!41887 l!874)))))

(assert (= (and d!139431 (not res!843576)) b!1267267))

(assert (= (and b!1267267 res!843577) b!1267268))

(declare-fun m!1166683 () Bool)

(assert (=> b!1267268 m!1166683))

(assert (=> start!106744 d!139431))

(declare-fun b!1267279 () Bool)

(declare-fun e!721921 () Bool)

(declare-fun tp!96580 () Bool)

(assert (=> b!1267279 (= e!721921 (and tp_is_empty!32587 tp!96580))))

(assert (=> b!1267210 (= tp!96569 e!721921)))

(assert (= (and b!1267210 (is-Cons!28356 (t!41887 l!874))) b!1267279))

(push 1)

(assert (not b!1267268))

(assert tp_is_empty!32587)

(assert (not b!1267279))

(assert (not b!1267250))

(assert (not b!1267240))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

