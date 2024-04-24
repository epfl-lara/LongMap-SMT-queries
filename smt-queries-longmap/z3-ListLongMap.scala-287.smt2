; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4718 () Bool)

(assert start!4718)

(declare-fun b_free!1309 () Bool)

(declare-fun b_next!1309 () Bool)

(assert (=> start!4718 (= b_free!1309 (not b_next!1309))))

(declare-fun tp!5390 () Bool)

(declare-fun b_and!2145 () Bool)

(assert (=> start!4718 (= tp!5390 b_and!2145)))

(declare-fun res!22094 () Bool)

(declare-fun e!23051 () Bool)

(assert (=> start!4718 (=> (not res!22094) (not e!23051))))

(declare-datatypes ((B!716 0))(
  ( (B!717 (val!858 Int)) )
))
(declare-datatypes ((tuple2!1358 0))(
  ( (tuple2!1359 (_1!690 (_ BitVec 64)) (_2!690 B!716)) )
))
(declare-datatypes ((List!948 0))(
  ( (Nil!945) (Cons!944 (h!1512 tuple2!1358) (t!3669 List!948)) )
))
(declare-datatypes ((ListLongMap!929 0))(
  ( (ListLongMap!930 (toList!480 List!948)) )
))
(declare-fun lm!252 () ListLongMap!929)

(declare-fun p!304 () Int)

(declare-fun forall!158 (List!948 Int) Bool)

(assert (=> start!4718 (= res!22094 (forall!158 (toList!480 lm!252) p!304))))

(assert (=> start!4718 e!23051))

(declare-fun e!23052 () Bool)

(declare-fun inv!1598 (ListLongMap!929) Bool)

(assert (=> start!4718 (and (inv!1598 lm!252) e!23052)))

(assert (=> start!4718 tp!5390))

(assert (=> start!4718 true))

(declare-fun b!36490 () Bool)

(declare-fun e!23050 () Bool)

(assert (=> b!36490 (= e!23050 (not true))))

(declare-fun k0!388 () (_ BitVec 64))

(declare-fun lt!13480 () ListLongMap!929)

(declare-fun dynLambda!159 (Int tuple2!1358) Bool)

(declare-fun apply!43 (ListLongMap!929 (_ BitVec 64)) B!716)

(assert (=> b!36490 (dynLambda!159 p!304 (tuple2!1359 k0!388 (apply!43 lt!13480 k0!388)))))

(declare-datatypes ((Unit!815 0))(
  ( (Unit!816) )
))
(declare-fun lt!13479 () Unit!815)

(declare-fun applyForall!2 (ListLongMap!929 Int (_ BitVec 64)) Unit!815)

(assert (=> b!36490 (= lt!13479 (applyForall!2 lt!13480 p!304 k0!388))))

(declare-fun b!36491 () Bool)

(declare-fun res!22096 () Bool)

(assert (=> b!36491 (=> (not res!22096) (not e!23051))))

(declare-fun isEmpty!188 (ListLongMap!929) Bool)

(assert (=> b!36491 (= res!22096 (not (isEmpty!188 lm!252)))))

(declare-fun b!36492 () Bool)

(declare-fun tp!5389 () Bool)

(assert (=> b!36492 (= e!23052 tp!5389)))

(declare-fun b!36493 () Bool)

(declare-fun res!22092 () Bool)

(assert (=> b!36493 (=> (not res!22092) (not e!23051))))

(declare-fun contains!433 (ListLongMap!929 (_ BitVec 64)) Bool)

(assert (=> b!36493 (= res!22092 (contains!433 lm!252 k0!388))))

(declare-fun b!36494 () Bool)

(assert (=> b!36494 (= e!23051 e!23050)))

(declare-fun res!22093 () Bool)

(assert (=> b!36494 (=> (not res!22093) (not e!23050))))

(assert (=> b!36494 (= res!22093 (forall!158 (toList!480 lt!13480) p!304))))

(declare-fun tail!89 (ListLongMap!929) ListLongMap!929)

(assert (=> b!36494 (= lt!13480 (tail!89 lm!252))))

(declare-fun b!36495 () Bool)

(declare-fun res!22097 () Bool)

(assert (=> b!36495 (=> (not res!22097) (not e!23050))))

(assert (=> b!36495 (= res!22097 (contains!433 lt!13480 k0!388))))

(declare-fun b!36496 () Bool)

(declare-fun res!22095 () Bool)

(assert (=> b!36496 (=> (not res!22095) (not e!23051))))

(declare-fun head!834 (List!948) tuple2!1358)

(assert (=> b!36496 (= res!22095 (not (= (_1!690 (head!834 (toList!480 lm!252))) k0!388)))))

(assert (= (and start!4718 res!22094) b!36493))

(assert (= (and b!36493 res!22092) b!36491))

(assert (= (and b!36491 res!22096) b!36496))

(assert (= (and b!36496 res!22095) b!36494))

(assert (= (and b!36494 res!22093) b!36495))

(assert (= (and b!36495 res!22097) b!36490))

(assert (= start!4718 b!36492))

(declare-fun b_lambda!1751 () Bool)

(assert (=> (not b_lambda!1751) (not b!36490)))

(declare-fun t!3668 () Bool)

(declare-fun tb!707 () Bool)

(assert (=> (and start!4718 (= p!304 p!304) t!3668) tb!707))

(declare-fun result!1225 () Bool)

(assert (=> tb!707 (= result!1225 true)))

(assert (=> b!36490 t!3668))

(declare-fun b_and!2147 () Bool)

(assert (= b_and!2145 (and (=> t!3668 result!1225) b_and!2147)))

(declare-fun m!29293 () Bool)

(assert (=> b!36495 m!29293))

(declare-fun m!29295 () Bool)

(assert (=> b!36490 m!29295))

(declare-fun m!29297 () Bool)

(assert (=> b!36490 m!29297))

(declare-fun m!29299 () Bool)

(assert (=> b!36490 m!29299))

(declare-fun m!29301 () Bool)

(assert (=> start!4718 m!29301))

(declare-fun m!29303 () Bool)

(assert (=> start!4718 m!29303))

(declare-fun m!29305 () Bool)

(assert (=> b!36496 m!29305))

(declare-fun m!29307 () Bool)

(assert (=> b!36491 m!29307))

(declare-fun m!29309 () Bool)

(assert (=> b!36494 m!29309))

(declare-fun m!29311 () Bool)

(assert (=> b!36494 m!29311))

(declare-fun m!29313 () Bool)

(assert (=> b!36493 m!29313))

(check-sat (not b!36494) (not b!36496) b_and!2147 (not start!4718) (not b!36492) (not b_lambda!1751) (not b!36491) (not b!36493) (not b_next!1309) (not b!36490) (not b!36495))
(check-sat b_and!2147 (not b_next!1309))
