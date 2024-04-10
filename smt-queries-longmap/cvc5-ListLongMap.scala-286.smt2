; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4716 () Bool)

(assert start!4716)

(declare-fun b_free!1303 () Bool)

(declare-fun b_next!1303 () Bool)

(assert (=> start!4716 (= b_free!1303 (not b_next!1303))))

(declare-fun tp!5371 () Bool)

(declare-fun b_and!2149 () Bool)

(assert (=> start!4716 (= tp!5371 b_and!2149)))

(declare-fun b!36506 () Bool)

(declare-fun e!23077 () Bool)

(declare-fun tp!5372 () Bool)

(assert (=> b!36506 (= e!23077 tp!5372)))

(declare-fun b!36508 () Bool)

(declare-fun res!22088 () Bool)

(declare-fun e!23076 () Bool)

(assert (=> b!36508 (=> (not res!22088) (not e!23076))))

(declare-datatypes ((B!710 0))(
  ( (B!711 (val!855 Int)) )
))
(declare-datatypes ((tuple2!1370 0))(
  ( (tuple2!1371 (_1!696 (_ BitVec 64)) (_2!696 B!710)) )
))
(declare-datatypes ((List!959 0))(
  ( (Nil!956) (Cons!955 (h!1523 tuple2!1370) (t!3684 List!959)) )
))
(declare-datatypes ((ListLongMap!947 0))(
  ( (ListLongMap!948 (toList!489 List!959)) )
))
(declare-fun lm!252 () ListLongMap!947)

(declare-fun k!388 () (_ BitVec 64))

(declare-fun contains!440 (ListLongMap!947 (_ BitVec 64)) Bool)

(assert (=> b!36508 (= res!22088 (contains!440 lm!252 k!388))))

(declare-fun b!36509 () Bool)

(declare-fun e!23075 () Bool)

(assert (=> b!36509 (= e!23075 false)))

(declare-fun lt!13506 () Bool)

(declare-fun lt!13505 () ListLongMap!947)

(assert (=> b!36509 (= lt!13506 (contains!440 lt!13505 k!388))))

(declare-fun b!36510 () Bool)

(declare-fun res!22089 () Bool)

(assert (=> b!36510 (=> (not res!22089) (not e!23076))))

(declare-fun head!833 (List!959) tuple2!1370)

(assert (=> b!36510 (= res!22089 (not (= (_1!696 (head!833 (toList!489 lm!252))) k!388)))))

(declare-fun b!36511 () Bool)

(assert (=> b!36511 (= e!23076 e!23075)))

(declare-fun res!22087 () Bool)

(assert (=> b!36511 (=> (not res!22087) (not e!23075))))

(declare-fun p!304 () Int)

(declare-fun forall!155 (List!959 Int) Bool)

(assert (=> b!36511 (= res!22087 (forall!155 (toList!489 lt!13505) p!304))))

(declare-fun tail!86 (ListLongMap!947) ListLongMap!947)

(assert (=> b!36511 (= lt!13505 (tail!86 lm!252))))

(declare-fun res!22086 () Bool)

(assert (=> start!4716 (=> (not res!22086) (not e!23076))))

(assert (=> start!4716 (= res!22086 (forall!155 (toList!489 lm!252) p!304))))

(assert (=> start!4716 e!23076))

(declare-fun inv!1590 (ListLongMap!947) Bool)

(assert (=> start!4716 (and (inv!1590 lm!252) e!23077)))

(assert (=> start!4716 tp!5371))

(assert (=> start!4716 true))

(declare-fun b!36507 () Bool)

(declare-fun res!22085 () Bool)

(assert (=> b!36507 (=> (not res!22085) (not e!23076))))

(declare-fun isEmpty!184 (ListLongMap!947) Bool)

(assert (=> b!36507 (= res!22085 (not (isEmpty!184 lm!252)))))

(assert (= (and start!4716 res!22086) b!36508))

(assert (= (and b!36508 res!22088) b!36507))

(assert (= (and b!36507 res!22085) b!36510))

(assert (= (and b!36510 res!22089) b!36511))

(assert (= (and b!36511 res!22087) b!36509))

(assert (= start!4716 b!36506))

(declare-fun m!29397 () Bool)

(assert (=> b!36510 m!29397))

(declare-fun m!29399 () Bool)

(assert (=> b!36511 m!29399))

(declare-fun m!29401 () Bool)

(assert (=> b!36511 m!29401))

(declare-fun m!29403 () Bool)

(assert (=> start!4716 m!29403))

(declare-fun m!29405 () Bool)

(assert (=> start!4716 m!29405))

(declare-fun m!29407 () Bool)

(assert (=> b!36508 m!29407))

(declare-fun m!29409 () Bool)

(assert (=> b!36509 m!29409))

(declare-fun m!29411 () Bool)

(assert (=> b!36507 m!29411))

(push 1)

