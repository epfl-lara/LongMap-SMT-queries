; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4722 () Bool)

(assert start!4722)

(declare-fun b_free!1309 () Bool)

(declare-fun b_next!1309 () Bool)

(assert (=> start!4722 (= b_free!1309 (not b_next!1309))))

(declare-fun tp!5389 () Bool)

(declare-fun b_and!2155 () Bool)

(assert (=> start!4722 (= tp!5389 b_and!2155)))

(declare-fun res!22133 () Bool)

(declare-fun e!23104 () Bool)

(assert (=> start!4722 (=> (not res!22133) (not e!23104))))

(declare-datatypes ((B!716 0))(
  ( (B!717 (val!858 Int)) )
))
(declare-datatypes ((tuple2!1376 0))(
  ( (tuple2!1377 (_1!699 (_ BitVec 64)) (_2!699 B!716)) )
))
(declare-datatypes ((List!962 0))(
  ( (Nil!959) (Cons!958 (h!1526 tuple2!1376) (t!3689 List!962)) )
))
(declare-datatypes ((ListLongMap!953 0))(
  ( (ListLongMap!954 (toList!492 List!962)) )
))
(declare-fun lm!252 () ListLongMap!953)

(declare-fun p!304 () Int)

(declare-fun forall!158 (List!962 Int) Bool)

(assert (=> start!4722 (= res!22133 (forall!158 (toList!492 lm!252) p!304))))

(assert (=> start!4722 e!23104))

(declare-fun e!23102 () Bool)

(declare-fun inv!1598 (ListLongMap!953) Bool)

(assert (=> start!4722 (and (inv!1598 lm!252) e!23102)))

(assert (=> start!4722 tp!5389))

(assert (=> start!4722 true))

(declare-fun b!36562 () Bool)

(declare-fun tp!5390 () Bool)

(assert (=> b!36562 (= e!23102 tp!5390)))

(declare-fun b!36563 () Bool)

(declare-fun res!22132 () Bool)

(assert (=> b!36563 (=> (not res!22132) (not e!23104))))

(declare-fun isEmpty!187 (ListLongMap!953) Bool)

(assert (=> b!36563 (= res!22132 (not (isEmpty!187 lm!252)))))

(declare-fun b!36564 () Bool)

(declare-fun res!22137 () Bool)

(assert (=> b!36564 (=> (not res!22137) (not e!23104))))

(declare-fun k!388 () (_ BitVec 64))

(declare-fun contains!443 (ListLongMap!953 (_ BitVec 64)) Bool)

(assert (=> b!36564 (= res!22137 (contains!443 lm!252 k!388))))

(declare-fun b!36565 () Bool)

(declare-fun e!23103 () Bool)

(assert (=> b!36565 (= e!23104 e!23103)))

(declare-fun res!22134 () Bool)

(assert (=> b!36565 (=> (not res!22134) (not e!23103))))

(declare-fun lt!13523 () ListLongMap!953)

(assert (=> b!36565 (= res!22134 (forall!158 (toList!492 lt!13523) p!304))))

(declare-fun tail!89 (ListLongMap!953) ListLongMap!953)

(assert (=> b!36565 (= lt!13523 (tail!89 lm!252))))

(declare-fun b!36566 () Bool)

(declare-fun res!22136 () Bool)

(assert (=> b!36566 (=> (not res!22136) (not e!23103))))

(assert (=> b!36566 (= res!22136 (contains!443 lt!13523 k!388))))

(declare-fun b!36567 () Bool)

(declare-fun res!22135 () Bool)

(assert (=> b!36567 (=> (not res!22135) (not e!23104))))

(declare-fun head!836 (List!962) tuple2!1376)

(assert (=> b!36567 (= res!22135 (not (= (_1!699 (head!836 (toList!492 lm!252))) k!388)))))

(declare-fun b!36568 () Bool)

(assert (=> b!36568 (= e!23103 (not true))))

(declare-fun dynLambda!163 (Int tuple2!1376) Bool)

(declare-fun apply!43 (ListLongMap!953 (_ BitVec 64)) B!716)

(assert (=> b!36568 (dynLambda!163 p!304 (tuple2!1377 k!388 (apply!43 lt!13523 k!388)))))

(declare-datatypes ((Unit!809 0))(
  ( (Unit!810) )
))
(declare-fun lt!13524 () Unit!809)

(declare-fun applyForall!2 (ListLongMap!953 Int (_ BitVec 64)) Unit!809)

(assert (=> b!36568 (= lt!13524 (applyForall!2 lt!13523 p!304 k!388))))

(assert (= (and start!4722 res!22133) b!36564))

(assert (= (and b!36564 res!22137) b!36563))

(assert (= (and b!36563 res!22132) b!36567))

(assert (= (and b!36567 res!22135) b!36565))

(assert (= (and b!36565 res!22134) b!36566))

(assert (= (and b!36566 res!22136) b!36568))

(assert (= start!4722 b!36562))

(declare-fun b_lambda!1767 () Bool)

(assert (=> (not b_lambda!1767) (not b!36568)))

(declare-fun t!3688 () Bool)

(declare-fun tb!713 () Bool)

(assert (=> (and start!4722 (= p!304 p!304) t!3688) tb!713))

(declare-fun result!1231 () Bool)

(assert (=> tb!713 (= result!1231 true)))

(assert (=> b!36568 t!3688))

(declare-fun b_and!2157 () Bool)

(assert (= b_and!2155 (and (=> t!3688 result!1231) b_and!2157)))

(declare-fun m!29445 () Bool)

(assert (=> start!4722 m!29445))

(declare-fun m!29447 () Bool)

(assert (=> start!4722 m!29447))

(declare-fun m!29449 () Bool)

(assert (=> b!36565 m!29449))

(declare-fun m!29451 () Bool)

(assert (=> b!36565 m!29451))

(declare-fun m!29453 () Bool)

(assert (=> b!36568 m!29453))

(declare-fun m!29455 () Bool)

(assert (=> b!36568 m!29455))

(declare-fun m!29457 () Bool)

(assert (=> b!36568 m!29457))

(declare-fun m!29459 () Bool)

(assert (=> b!36567 m!29459))

(declare-fun m!29461 () Bool)

(assert (=> b!36566 m!29461))

(declare-fun m!29463 () Bool)

(assert (=> b!36564 m!29463))

(declare-fun m!29465 () Bool)

(assert (=> b!36563 m!29465))

(push 1)

