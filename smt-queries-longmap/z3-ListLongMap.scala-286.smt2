; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4706 () Bool)

(assert start!4706)

(declare-fun b_free!1303 () Bool)

(declare-fun b_next!1303 () Bool)

(assert (=> start!4706 (= b_free!1303 (not b_next!1303))))

(declare-fun tp!5372 () Bool)

(declare-fun b_and!2143 () Bool)

(assert (=> start!4706 (= tp!5372 b_and!2143)))

(declare-fun b!36452 () Bool)

(declare-fun e!23034 () Bool)

(declare-fun e!23032 () Bool)

(assert (=> b!36452 (= e!23034 e!23032)))

(declare-fun res!22057 () Bool)

(assert (=> b!36452 (=> (not res!22057) (not e!23032))))

(declare-datatypes ((B!710 0))(
  ( (B!711 (val!855 Int)) )
))
(declare-datatypes ((tuple2!1374 0))(
  ( (tuple2!1375 (_1!698 (_ BitVec 64)) (_2!698 B!710)) )
))
(declare-datatypes ((List!952 0))(
  ( (Nil!949) (Cons!948 (h!1516 tuple2!1374) (t!3670 List!952)) )
))
(declare-datatypes ((ListLongMap!939 0))(
  ( (ListLongMap!940 (toList!485 List!952)) )
))
(declare-fun lt!13502 () ListLongMap!939)

(declare-fun p!304 () Int)

(declare-fun forall!155 (List!952 Int) Bool)

(assert (=> b!36452 (= res!22057 (forall!155 (toList!485 lt!13502) p!304))))

(declare-fun lm!252 () ListLongMap!939)

(declare-fun tail!86 (ListLongMap!939) ListLongMap!939)

(assert (=> b!36452 (= lt!13502 (tail!86 lm!252))))

(declare-fun res!22053 () Bool)

(assert (=> start!4706 (=> (not res!22053) (not e!23034))))

(assert (=> start!4706 (= res!22053 (forall!155 (toList!485 lm!252) p!304))))

(assert (=> start!4706 e!23034))

(declare-fun e!23033 () Bool)

(declare-fun inv!1590 (ListLongMap!939) Bool)

(assert (=> start!4706 (and (inv!1590 lm!252) e!23033)))

(assert (=> start!4706 tp!5372))

(assert (=> start!4706 true))

(declare-fun b!36453 () Bool)

(declare-fun res!22055 () Bool)

(assert (=> b!36453 (=> (not res!22055) (not e!23034))))

(declare-fun k0!388 () (_ BitVec 64))

(declare-fun head!833 (List!952) tuple2!1374)

(assert (=> b!36453 (= res!22055 (not (= (_1!698 (head!833 (toList!485 lm!252))) k0!388)))))

(declare-fun b!36454 () Bool)

(declare-fun res!22056 () Bool)

(assert (=> b!36454 (=> (not res!22056) (not e!23034))))

(declare-fun contains!437 (ListLongMap!939 (_ BitVec 64)) Bool)

(assert (=> b!36454 (= res!22056 (contains!437 lm!252 k0!388))))

(declare-fun b!36455 () Bool)

(declare-fun res!22054 () Bool)

(assert (=> b!36455 (=> (not res!22054) (not e!23034))))

(declare-fun isEmpty!185 (ListLongMap!939) Bool)

(assert (=> b!36455 (= res!22054 (not (isEmpty!185 lm!252)))))

(declare-fun b!36456 () Bool)

(declare-fun tp!5371 () Bool)

(assert (=> b!36456 (= e!23033 tp!5371)))

(declare-fun b!36457 () Bool)

(assert (=> b!36457 (= e!23032 false)))

(declare-fun lt!13501 () Bool)

(assert (=> b!36457 (= lt!13501 (contains!437 lt!13502 k0!388))))

(assert (= (and start!4706 res!22053) b!36454))

(assert (= (and b!36454 res!22056) b!36455))

(assert (= (and b!36455 res!22054) b!36453))

(assert (= (and b!36453 res!22055) b!36452))

(assert (= (and b!36452 res!22057) b!36457))

(assert (= start!4706 b!36456))

(declare-fun m!29327 () Bool)

(assert (=> b!36454 m!29327))

(declare-fun m!29329 () Bool)

(assert (=> b!36457 m!29329))

(declare-fun m!29331 () Bool)

(assert (=> b!36455 m!29331))

(declare-fun m!29333 () Bool)

(assert (=> start!4706 m!29333))

(declare-fun m!29335 () Bool)

(assert (=> start!4706 m!29335))

(declare-fun m!29337 () Bool)

(assert (=> b!36453 m!29337))

(declare-fun m!29339 () Bool)

(assert (=> b!36452 m!29339))

(declare-fun m!29341 () Bool)

(assert (=> b!36452 m!29341))

(check-sat (not b!36454) (not start!4706) (not b_next!1303) (not b!36457) (not b!36453) (not b!36456) b_and!2143 (not b!36452) (not b!36455))
(check-sat b_and!2143 (not b_next!1303))
