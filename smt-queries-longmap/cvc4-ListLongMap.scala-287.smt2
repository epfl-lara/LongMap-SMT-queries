; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4726 () Bool)

(assert start!4726)

(declare-fun b_free!1313 () Bool)

(declare-fun b_next!1313 () Bool)

(assert (=> start!4726 (= b_free!1313 (not b_next!1313))))

(declare-fun tp!5402 () Bool)

(declare-fun b_and!2163 () Bool)

(assert (=> start!4726 (= tp!5402 b_and!2163)))

(declare-fun b!36604 () Bool)

(declare-fun res!22171 () Bool)

(declare-fun e!23121 () Bool)

(assert (=> b!36604 (=> (not res!22171) (not e!23121))))

(declare-datatypes ((B!720 0))(
  ( (B!721 (val!860 Int)) )
))
(declare-datatypes ((tuple2!1380 0))(
  ( (tuple2!1381 (_1!701 (_ BitVec 64)) (_2!701 B!720)) )
))
(declare-datatypes ((List!964 0))(
  ( (Nil!961) (Cons!960 (h!1528 tuple2!1380) (t!3695 List!964)) )
))
(declare-datatypes ((ListLongMap!957 0))(
  ( (ListLongMap!958 (toList!494 List!964)) )
))
(declare-fun lt!13535 () ListLongMap!957)

(declare-fun k!388 () (_ BitVec 64))

(declare-fun contains!445 (ListLongMap!957 (_ BitVec 64)) Bool)

(assert (=> b!36604 (= res!22171 (contains!445 lt!13535 k!388))))

(declare-fun b!36605 () Bool)

(assert (=> b!36605 (= e!23121 (not true))))

(declare-fun p!304 () Int)

(declare-fun dynLambda!165 (Int tuple2!1380) Bool)

(declare-fun apply!45 (ListLongMap!957 (_ BitVec 64)) B!720)

(assert (=> b!36605 (dynLambda!165 p!304 (tuple2!1381 k!388 (apply!45 lt!13535 k!388)))))

(declare-datatypes ((Unit!813 0))(
  ( (Unit!814) )
))
(declare-fun lt!13536 () Unit!813)

(declare-fun applyForall!4 (ListLongMap!957 Int (_ BitVec 64)) Unit!813)

(assert (=> b!36605 (= lt!13536 (applyForall!4 lt!13535 p!304 k!388))))

(declare-fun res!22173 () Bool)

(declare-fun e!23122 () Bool)

(assert (=> start!4726 (=> (not res!22173) (not e!23122))))

(declare-fun lm!252 () ListLongMap!957)

(declare-fun forall!160 (List!964 Int) Bool)

(assert (=> start!4726 (= res!22173 (forall!160 (toList!494 lm!252) p!304))))

(assert (=> start!4726 e!23122))

(declare-fun e!23120 () Bool)

(declare-fun inv!1600 (ListLongMap!957) Bool)

(assert (=> start!4726 (and (inv!1600 lm!252) e!23120)))

(assert (=> start!4726 tp!5402))

(assert (=> start!4726 true))

(declare-fun b!36606 () Bool)

(assert (=> b!36606 (= e!23122 e!23121)))

(declare-fun res!22168 () Bool)

(assert (=> b!36606 (=> (not res!22168) (not e!23121))))

(assert (=> b!36606 (= res!22168 (forall!160 (toList!494 lt!13535) p!304))))

(declare-fun tail!91 (ListLongMap!957) ListLongMap!957)

(assert (=> b!36606 (= lt!13535 (tail!91 lm!252))))

(declare-fun b!36607 () Bool)

(declare-fun tp!5401 () Bool)

(assert (=> b!36607 (= e!23120 tp!5401)))

(declare-fun b!36608 () Bool)

(declare-fun res!22169 () Bool)

(assert (=> b!36608 (=> (not res!22169) (not e!23122))))

(assert (=> b!36608 (= res!22169 (contains!445 lm!252 k!388))))

(declare-fun b!36609 () Bool)

(declare-fun res!22172 () Bool)

(assert (=> b!36609 (=> (not res!22172) (not e!23122))))

(declare-fun isEmpty!189 (ListLongMap!957) Bool)

(assert (=> b!36609 (= res!22172 (not (isEmpty!189 lm!252)))))

(declare-fun b!36610 () Bool)

(declare-fun res!22170 () Bool)

(assert (=> b!36610 (=> (not res!22170) (not e!23122))))

(declare-fun head!838 (List!964) tuple2!1380)

(assert (=> b!36610 (= res!22170 (not (= (_1!701 (head!838 (toList!494 lm!252))) k!388)))))

(assert (= (and start!4726 res!22173) b!36608))

(assert (= (and b!36608 res!22169) b!36609))

(assert (= (and b!36609 res!22172) b!36610))

(assert (= (and b!36610 res!22170) b!36606))

(assert (= (and b!36606 res!22168) b!36604))

(assert (= (and b!36604 res!22171) b!36605))

(assert (= start!4726 b!36607))

(declare-fun b_lambda!1771 () Bool)

(assert (=> (not b_lambda!1771) (not b!36605)))

(declare-fun t!3694 () Bool)

(declare-fun tb!717 () Bool)

(assert (=> (and start!4726 (= p!304 p!304) t!3694) tb!717))

(declare-fun result!1235 () Bool)

(assert (=> tb!717 (= result!1235 true)))

(assert (=> b!36605 t!3694))

(declare-fun b_and!2165 () Bool)

(assert (= b_and!2163 (and (=> t!3694 result!1235) b_and!2165)))

(declare-fun m!29489 () Bool)

(assert (=> b!36606 m!29489))

(declare-fun m!29491 () Bool)

(assert (=> b!36606 m!29491))

(declare-fun m!29493 () Bool)

(assert (=> b!36610 m!29493))

(declare-fun m!29495 () Bool)

(assert (=> b!36609 m!29495))

(declare-fun m!29497 () Bool)

(assert (=> b!36604 m!29497))

(declare-fun m!29499 () Bool)

(assert (=> b!36608 m!29499))

(declare-fun m!29501 () Bool)

(assert (=> start!4726 m!29501))

(declare-fun m!29503 () Bool)

(assert (=> start!4726 m!29503))

(declare-fun m!29505 () Bool)

(assert (=> b!36605 m!29505))

(declare-fun m!29507 () Bool)

(assert (=> b!36605 m!29507))

(declare-fun m!29509 () Bool)

(assert (=> b!36605 m!29509))

(push 1)

