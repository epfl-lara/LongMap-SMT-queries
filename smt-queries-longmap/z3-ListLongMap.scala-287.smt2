; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4724 () Bool)

(assert start!4724)

(declare-fun b_free!1311 () Bool)

(declare-fun b_next!1311 () Bool)

(assert (=> start!4724 (= b_free!1311 (not b_next!1311))))

(declare-fun tp!5396 () Bool)

(declare-fun b_and!2159 () Bool)

(assert (=> start!4724 (= tp!5396 b_and!2159)))

(declare-fun b!36583 () Bool)

(declare-fun res!22150 () Bool)

(declare-fun e!23111 () Bool)

(assert (=> b!36583 (=> (not res!22150) (not e!23111))))

(declare-datatypes ((B!718 0))(
  ( (B!719 (val!859 Int)) )
))
(declare-datatypes ((tuple2!1378 0))(
  ( (tuple2!1379 (_1!700 (_ BitVec 64)) (_2!700 B!718)) )
))
(declare-datatypes ((List!963 0))(
  ( (Nil!960) (Cons!959 (h!1527 tuple2!1378) (t!3692 List!963)) )
))
(declare-datatypes ((ListLongMap!955 0))(
  ( (ListLongMap!956 (toList!493 List!963)) )
))
(declare-fun lm!252 () ListLongMap!955)

(declare-fun k0!388 () (_ BitVec 64))

(declare-fun head!837 (List!963) tuple2!1378)

(assert (=> b!36583 (= res!22150 (not (= (_1!700 (head!837 (toList!493 lm!252))) k0!388)))))

(declare-fun b!36584 () Bool)

(declare-fun e!23112 () Bool)

(assert (=> b!36584 (= e!23111 e!23112)))

(declare-fun res!22154 () Bool)

(assert (=> b!36584 (=> (not res!22154) (not e!23112))))

(declare-fun lt!13529 () ListLongMap!955)

(declare-fun p!304 () Int)

(declare-fun forall!159 (List!963 Int) Bool)

(assert (=> b!36584 (= res!22154 (forall!159 (toList!493 lt!13529) p!304))))

(declare-fun tail!90 (ListLongMap!955) ListLongMap!955)

(assert (=> b!36584 (= lt!13529 (tail!90 lm!252))))

(declare-fun b!36585 () Bool)

(declare-fun res!22153 () Bool)

(assert (=> b!36585 (=> (not res!22153) (not e!23112))))

(declare-fun contains!444 (ListLongMap!955 (_ BitVec 64)) Bool)

(assert (=> b!36585 (= res!22153 (contains!444 lt!13529 k0!388))))

(declare-fun b!36586 () Bool)

(declare-fun res!22152 () Bool)

(assert (=> b!36586 (=> (not res!22152) (not e!23111))))

(declare-fun isEmpty!188 (ListLongMap!955) Bool)

(assert (=> b!36586 (= res!22152 (not (isEmpty!188 lm!252)))))

(declare-fun b!36587 () Bool)

(declare-fun res!22151 () Bool)

(assert (=> b!36587 (=> (not res!22151) (not e!23111))))

(assert (=> b!36587 (= res!22151 (contains!444 lm!252 k0!388))))

(declare-fun b!36589 () Bool)

(declare-fun e!23113 () Bool)

(declare-fun tp!5395 () Bool)

(assert (=> b!36589 (= e!23113 tp!5395)))

(declare-fun b!36588 () Bool)

(assert (=> b!36588 (= e!23112 (not true))))

(declare-fun dynLambda!164 (Int tuple2!1378) Bool)

(declare-fun apply!44 (ListLongMap!955 (_ BitVec 64)) B!718)

(assert (=> b!36588 (dynLambda!164 p!304 (tuple2!1379 k0!388 (apply!44 lt!13529 k0!388)))))

(declare-datatypes ((Unit!811 0))(
  ( (Unit!812) )
))
(declare-fun lt!13530 () Unit!811)

(declare-fun applyForall!3 (ListLongMap!955 Int (_ BitVec 64)) Unit!811)

(assert (=> b!36588 (= lt!13530 (applyForall!3 lt!13529 p!304 k0!388))))

(declare-fun res!22155 () Bool)

(assert (=> start!4724 (=> (not res!22155) (not e!23111))))

(assert (=> start!4724 (= res!22155 (forall!159 (toList!493 lm!252) p!304))))

(assert (=> start!4724 e!23111))

(declare-fun inv!1599 (ListLongMap!955) Bool)

(assert (=> start!4724 (and (inv!1599 lm!252) e!23113)))

(assert (=> start!4724 tp!5396))

(assert (=> start!4724 true))

(assert (= (and start!4724 res!22155) b!36587))

(assert (= (and b!36587 res!22151) b!36586))

(assert (= (and b!36586 res!22152) b!36583))

(assert (= (and b!36583 res!22150) b!36584))

(assert (= (and b!36584 res!22154) b!36585))

(assert (= (and b!36585 res!22153) b!36588))

(assert (= start!4724 b!36589))

(declare-fun b_lambda!1769 () Bool)

(assert (=> (not b_lambda!1769) (not b!36588)))

(declare-fun t!3691 () Bool)

(declare-fun tb!715 () Bool)

(assert (=> (and start!4724 (= p!304 p!304) t!3691) tb!715))

(declare-fun result!1233 () Bool)

(assert (=> tb!715 (= result!1233 true)))

(assert (=> b!36588 t!3691))

(declare-fun b_and!2161 () Bool)

(assert (= b_and!2159 (and (=> t!3691 result!1233) b_and!2161)))

(declare-fun m!29467 () Bool)

(assert (=> b!36584 m!29467))

(declare-fun m!29469 () Bool)

(assert (=> b!36584 m!29469))

(declare-fun m!29471 () Bool)

(assert (=> b!36587 m!29471))

(declare-fun m!29473 () Bool)

(assert (=> b!36585 m!29473))

(declare-fun m!29475 () Bool)

(assert (=> b!36586 m!29475))

(declare-fun m!29477 () Bool)

(assert (=> b!36588 m!29477))

(declare-fun m!29479 () Bool)

(assert (=> b!36588 m!29479))

(declare-fun m!29481 () Bool)

(assert (=> b!36588 m!29481))

(declare-fun m!29483 () Bool)

(assert (=> b!36583 m!29483))

(declare-fun m!29485 () Bool)

(assert (=> start!4724 m!29485))

(declare-fun m!29487 () Bool)

(assert (=> start!4724 m!29487))

(check-sat (not b_lambda!1769) b_and!2161 (not b_next!1311) (not b!36585) (not b!36586) (not b!36583) (not b!36588) (not b!36589) (not start!4724) (not b!36584) (not b!36587))
(check-sat b_and!2161 (not b_next!1311))
