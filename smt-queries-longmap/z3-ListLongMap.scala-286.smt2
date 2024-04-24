; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4712 () Bool)

(assert start!4712)

(declare-fun b_free!1303 () Bool)

(declare-fun b_next!1303 () Bool)

(assert (=> start!4712 (= b_free!1303 (not b_next!1303))))

(declare-fun tp!5372 () Bool)

(declare-fun b_and!2139 () Bool)

(assert (=> start!4712 (= tp!5372 b_and!2139)))

(declare-fun b!36434 () Bool)

(declare-fun res!22046 () Bool)

(declare-fun e!23024 () Bool)

(assert (=> b!36434 (=> (not res!22046) (not e!23024))))

(declare-datatypes ((B!710 0))(
  ( (B!711 (val!855 Int)) )
))
(declare-datatypes ((tuple2!1352 0))(
  ( (tuple2!1353 (_1!687 (_ BitVec 64)) (_2!687 B!710)) )
))
(declare-datatypes ((List!945 0))(
  ( (Nil!942) (Cons!941 (h!1509 tuple2!1352) (t!3664 List!945)) )
))
(declare-datatypes ((ListLongMap!923 0))(
  ( (ListLongMap!924 (toList!477 List!945)) )
))
(declare-fun lm!252 () ListLongMap!923)

(declare-fun k0!388 () (_ BitVec 64))

(declare-fun contains!430 (ListLongMap!923 (_ BitVec 64)) Bool)

(assert (=> b!36434 (= res!22046 (contains!430 lm!252 k0!388))))

(declare-fun b!36435 () Bool)

(declare-fun e!23025 () Bool)

(declare-fun tp!5371 () Bool)

(assert (=> b!36435 (= e!23025 tp!5371)))

(declare-fun b!36436 () Bool)

(declare-fun res!22049 () Bool)

(assert (=> b!36436 (=> (not res!22049) (not e!23024))))

(declare-fun head!831 (List!945) tuple2!1352)

(assert (=> b!36436 (= res!22049 (not (= (_1!687 (head!831 (toList!477 lm!252))) k0!388)))))

(declare-fun b!36437 () Bool)

(declare-fun e!23023 () Bool)

(assert (=> b!36437 (= e!23024 e!23023)))

(declare-fun res!22045 () Bool)

(assert (=> b!36437 (=> (not res!22045) (not e!23023))))

(declare-fun lt!13462 () ListLongMap!923)

(declare-fun p!304 () Int)

(declare-fun forall!155 (List!945 Int) Bool)

(assert (=> b!36437 (= res!22045 (forall!155 (toList!477 lt!13462) p!304))))

(declare-fun tail!86 (ListLongMap!923) ListLongMap!923)

(assert (=> b!36437 (= lt!13462 (tail!86 lm!252))))

(declare-fun res!22047 () Bool)

(assert (=> start!4712 (=> (not res!22047) (not e!23024))))

(assert (=> start!4712 (= res!22047 (forall!155 (toList!477 lm!252) p!304))))

(assert (=> start!4712 e!23024))

(declare-fun inv!1590 (ListLongMap!923) Bool)

(assert (=> start!4712 (and (inv!1590 lm!252) e!23025)))

(assert (=> start!4712 tp!5372))

(assert (=> start!4712 true))

(declare-fun b!36438 () Bool)

(assert (=> b!36438 (= e!23023 false)))

(declare-fun lt!13461 () Bool)

(assert (=> b!36438 (= lt!13461 (contains!430 lt!13462 k0!388))))

(declare-fun b!36439 () Bool)

(declare-fun res!22048 () Bool)

(assert (=> b!36439 (=> (not res!22048) (not e!23024))))

(declare-fun isEmpty!185 (ListLongMap!923) Bool)

(assert (=> b!36439 (= res!22048 (not (isEmpty!185 lm!252)))))

(assert (= (and start!4712 res!22047) b!36434))

(assert (= (and b!36434 res!22046) b!36439))

(assert (= (and b!36439 res!22048) b!36436))

(assert (= (and b!36436 res!22049) b!36437))

(assert (= (and b!36437 res!22045) b!36438))

(assert (= start!4712 b!36435))

(declare-fun m!29245 () Bool)

(assert (=> b!36439 m!29245))

(declare-fun m!29247 () Bool)

(assert (=> b!36438 m!29247))

(declare-fun m!29249 () Bool)

(assert (=> b!36437 m!29249))

(declare-fun m!29251 () Bool)

(assert (=> b!36437 m!29251))

(declare-fun m!29253 () Bool)

(assert (=> start!4712 m!29253))

(declare-fun m!29255 () Bool)

(assert (=> start!4712 m!29255))

(declare-fun m!29257 () Bool)

(assert (=> b!36434 m!29257))

(declare-fun m!29259 () Bool)

(assert (=> b!36436 m!29259))

(check-sat b_and!2139 (not b!36435) (not b!36438) (not b!36436) (not start!4712) (not b!36434) (not b!36439) (not b!36437) (not b_next!1303))
(check-sat b_and!2139 (not b_next!1303))
