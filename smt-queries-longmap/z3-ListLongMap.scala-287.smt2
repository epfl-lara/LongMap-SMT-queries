; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4712 () Bool)

(assert start!4712)

(declare-fun b_free!1309 () Bool)

(declare-fun b_next!1309 () Bool)

(assert (=> start!4712 (= b_free!1309 (not b_next!1309))))

(declare-fun tp!5390 () Bool)

(declare-fun b_and!2149 () Bool)

(assert (=> start!4712 (= tp!5390 b_and!2149)))

(declare-fun b!36508 () Bool)

(declare-fun res!22102 () Bool)

(declare-fun e!23060 () Bool)

(assert (=> b!36508 (=> (not res!22102) (not e!23060))))

(declare-datatypes ((B!716 0))(
  ( (B!717 (val!858 Int)) )
))
(declare-datatypes ((tuple2!1380 0))(
  ( (tuple2!1381 (_1!701 (_ BitVec 64)) (_2!701 B!716)) )
))
(declare-datatypes ((List!955 0))(
  ( (Nil!952) (Cons!951 (h!1519 tuple2!1380) (t!3675 List!955)) )
))
(declare-datatypes ((ListLongMap!945 0))(
  ( (ListLongMap!946 (toList!488 List!955)) )
))
(declare-fun lt!13519 () ListLongMap!945)

(declare-fun k0!388 () (_ BitVec 64))

(declare-fun contains!440 (ListLongMap!945 (_ BitVec 64)) Bool)

(assert (=> b!36508 (= res!22102 (contains!440 lt!13519 k0!388))))

(declare-fun b!36509 () Bool)

(declare-fun res!22105 () Bool)

(declare-fun e!23061 () Bool)

(assert (=> b!36509 (=> (not res!22105) (not e!23061))))

(declare-fun lm!252 () ListLongMap!945)

(declare-fun isEmpty!188 (ListLongMap!945) Bool)

(assert (=> b!36509 (= res!22105 (not (isEmpty!188 lm!252)))))

(declare-fun res!22101 () Bool)

(assert (=> start!4712 (=> (not res!22101) (not e!23061))))

(declare-fun p!304 () Int)

(declare-fun forall!158 (List!955 Int) Bool)

(assert (=> start!4712 (= res!22101 (forall!158 (toList!488 lm!252) p!304))))

(assert (=> start!4712 e!23061))

(declare-fun e!23059 () Bool)

(declare-fun inv!1598 (ListLongMap!945) Bool)

(assert (=> start!4712 (and (inv!1598 lm!252) e!23059)))

(assert (=> start!4712 tp!5390))

(assert (=> start!4712 true))

(declare-fun b!36510 () Bool)

(assert (=> b!36510 (= e!23060 (not true))))

(declare-fun dynLambda!162 (Int tuple2!1380) Bool)

(declare-fun apply!43 (ListLongMap!945 (_ BitVec 64)) B!716)

(assert (=> b!36510 (dynLambda!162 p!304 (tuple2!1381 k0!388 (apply!43 lt!13519 k0!388)))))

(declare-datatypes ((Unit!812 0))(
  ( (Unit!813) )
))
(declare-fun lt!13520 () Unit!812)

(declare-fun applyForall!2 (ListLongMap!945 Int (_ BitVec 64)) Unit!812)

(assert (=> b!36510 (= lt!13520 (applyForall!2 lt!13519 p!304 k0!388))))

(declare-fun b!36511 () Bool)

(assert (=> b!36511 (= e!23061 e!23060)))

(declare-fun res!22100 () Bool)

(assert (=> b!36511 (=> (not res!22100) (not e!23060))))

(assert (=> b!36511 (= res!22100 (forall!158 (toList!488 lt!13519) p!304))))

(declare-fun tail!89 (ListLongMap!945) ListLongMap!945)

(assert (=> b!36511 (= lt!13519 (tail!89 lm!252))))

(declare-fun b!36512 () Bool)

(declare-fun tp!5389 () Bool)

(assert (=> b!36512 (= e!23059 tp!5389)))

(declare-fun b!36513 () Bool)

(declare-fun res!22103 () Bool)

(assert (=> b!36513 (=> (not res!22103) (not e!23061))))

(assert (=> b!36513 (= res!22103 (contains!440 lm!252 k0!388))))

(declare-fun b!36514 () Bool)

(declare-fun res!22104 () Bool)

(assert (=> b!36514 (=> (not res!22104) (not e!23061))))

(declare-fun head!836 (List!955) tuple2!1380)

(assert (=> b!36514 (= res!22104 (not (= (_1!701 (head!836 (toList!488 lm!252))) k0!388)))))

(assert (= (and start!4712 res!22101) b!36513))

(assert (= (and b!36513 res!22103) b!36509))

(assert (= (and b!36509 res!22105) b!36514))

(assert (= (and b!36514 res!22104) b!36511))

(assert (= (and b!36511 res!22100) b!36508))

(assert (= (and b!36508 res!22102) b!36510))

(assert (= start!4712 b!36512))

(declare-fun b_lambda!1755 () Bool)

(assert (=> (not b_lambda!1755) (not b!36510)))

(declare-fun t!3674 () Bool)

(declare-fun tb!707 () Bool)

(assert (=> (and start!4712 (= p!304 p!304) t!3674) tb!707))

(declare-fun result!1225 () Bool)

(assert (=> tb!707 (= result!1225 true)))

(assert (=> b!36510 t!3674))

(declare-fun b_and!2151 () Bool)

(assert (= b_and!2149 (and (=> t!3674 result!1225) b_and!2151)))

(declare-fun m!29375 () Bool)

(assert (=> b!36513 m!29375))

(declare-fun m!29377 () Bool)

(assert (=> b!36514 m!29377))

(declare-fun m!29379 () Bool)

(assert (=> b!36511 m!29379))

(declare-fun m!29381 () Bool)

(assert (=> b!36511 m!29381))

(declare-fun m!29383 () Bool)

(assert (=> start!4712 m!29383))

(declare-fun m!29385 () Bool)

(assert (=> start!4712 m!29385))

(declare-fun m!29387 () Bool)

(assert (=> b!36508 m!29387))

(declare-fun m!29389 () Bool)

(assert (=> b!36509 m!29389))

(declare-fun m!29391 () Bool)

(assert (=> b!36510 m!29391))

(declare-fun m!29393 () Bool)

(assert (=> b!36510 m!29393))

(declare-fun m!29395 () Bool)

(assert (=> b!36510 m!29395))

(check-sat (not b!36511) (not b_lambda!1755) (not start!4712) (not b!36509) (not b!36514) b_and!2151 (not b!36510) (not b!36508) (not b_next!1309) (not b!36513) (not b!36512))
(check-sat b_and!2151 (not b_next!1309))
