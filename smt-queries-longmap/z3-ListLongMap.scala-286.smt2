; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4718 () Bool)

(assert start!4718)

(declare-fun b_free!1305 () Bool)

(declare-fun b_next!1305 () Bool)

(assert (=> start!4718 (= b_free!1305 (not b_next!1305))))

(declare-fun tp!5378 () Bool)

(declare-fun b_and!2151 () Bool)

(assert (=> start!4718 (= tp!5378 b_and!2151)))

(declare-fun b!36524 () Bool)

(declare-fun e!23086 () Bool)

(declare-fun tp!5377 () Bool)

(assert (=> b!36524 (= e!23086 tp!5377)))

(declare-fun b!36525 () Bool)

(declare-fun e!23085 () Bool)

(assert (=> b!36525 (= e!23085 false)))

(declare-fun lt!13512 () Bool)

(declare-datatypes ((B!712 0))(
  ( (B!713 (val!856 Int)) )
))
(declare-datatypes ((tuple2!1372 0))(
  ( (tuple2!1373 (_1!697 (_ BitVec 64)) (_2!697 B!712)) )
))
(declare-datatypes ((List!960 0))(
  ( (Nil!957) (Cons!956 (h!1524 tuple2!1372) (t!3685 List!960)) )
))
(declare-datatypes ((ListLongMap!949 0))(
  ( (ListLongMap!950 (toList!490 List!960)) )
))
(declare-fun lt!13511 () ListLongMap!949)

(declare-fun k0!388 () (_ BitVec 64))

(declare-fun contains!441 (ListLongMap!949 (_ BitVec 64)) Bool)

(assert (=> b!36525 (= lt!13512 (contains!441 lt!13511 k0!388))))

(declare-fun b!36526 () Bool)

(declare-fun res!22103 () Bool)

(declare-fun e!23084 () Bool)

(assert (=> b!36526 (=> (not res!22103) (not e!23084))))

(declare-fun lm!252 () ListLongMap!949)

(declare-fun isEmpty!185 (ListLongMap!949) Bool)

(assert (=> b!36526 (= res!22103 (not (isEmpty!185 lm!252)))))

(declare-fun b!36527 () Bool)

(declare-fun res!22100 () Bool)

(assert (=> b!36527 (=> (not res!22100) (not e!23084))))

(assert (=> b!36527 (= res!22100 (contains!441 lm!252 k0!388))))

(declare-fun res!22104 () Bool)

(assert (=> start!4718 (=> (not res!22104) (not e!23084))))

(declare-fun p!304 () Int)

(declare-fun forall!156 (List!960 Int) Bool)

(assert (=> start!4718 (= res!22104 (forall!156 (toList!490 lm!252) p!304))))

(assert (=> start!4718 e!23084))

(declare-fun inv!1591 (ListLongMap!949) Bool)

(assert (=> start!4718 (and (inv!1591 lm!252) e!23086)))

(assert (=> start!4718 tp!5378))

(assert (=> start!4718 true))

(declare-fun b!36528 () Bool)

(assert (=> b!36528 (= e!23084 e!23085)))

(declare-fun res!22102 () Bool)

(assert (=> b!36528 (=> (not res!22102) (not e!23085))))

(assert (=> b!36528 (= res!22102 (forall!156 (toList!490 lt!13511) p!304))))

(declare-fun tail!87 (ListLongMap!949) ListLongMap!949)

(assert (=> b!36528 (= lt!13511 (tail!87 lm!252))))

(declare-fun b!36529 () Bool)

(declare-fun res!22101 () Bool)

(assert (=> b!36529 (=> (not res!22101) (not e!23084))))

(declare-fun head!834 (List!960) tuple2!1372)

(assert (=> b!36529 (= res!22101 (not (= (_1!697 (head!834 (toList!490 lm!252))) k0!388)))))

(assert (= (and start!4718 res!22104) b!36527))

(assert (= (and b!36527 res!22100) b!36526))

(assert (= (and b!36526 res!22103) b!36529))

(assert (= (and b!36529 res!22101) b!36528))

(assert (= (and b!36528 res!22102) b!36525))

(assert (= start!4718 b!36524))

(declare-fun m!29413 () Bool)

(assert (=> b!36528 m!29413))

(declare-fun m!29415 () Bool)

(assert (=> b!36528 m!29415))

(declare-fun m!29417 () Bool)

(assert (=> b!36525 m!29417))

(declare-fun m!29419 () Bool)

(assert (=> start!4718 m!29419))

(declare-fun m!29421 () Bool)

(assert (=> start!4718 m!29421))

(declare-fun m!29423 () Bool)

(assert (=> b!36526 m!29423))

(declare-fun m!29425 () Bool)

(assert (=> b!36529 m!29425))

(declare-fun m!29427 () Bool)

(assert (=> b!36527 m!29427))

(check-sat (not b_next!1305) (not b!36528) (not b!36525) (not b!36526) (not start!4718) b_and!2151 (not b!36529) (not b!36527) (not b!36524))
(check-sat b_and!2151 (not b_next!1305))
