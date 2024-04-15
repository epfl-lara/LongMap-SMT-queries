; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4700 () Bool)

(assert start!4700)

(declare-fun b_free!1297 () Bool)

(declare-fun b_next!1297 () Bool)

(assert (=> start!4700 (= b_free!1297 (not b_next!1297))))

(declare-fun tp!5353 () Bool)

(declare-fun b_and!2137 () Bool)

(assert (=> start!4700 (= tp!5353 b_and!2137)))

(declare-fun res!22036 () Bool)

(declare-fun e!23012 () Bool)

(assert (=> start!4700 (=> (not res!22036) (not e!23012))))

(declare-datatypes ((B!704 0))(
  ( (B!705 (val!852 Int)) )
))
(declare-datatypes ((tuple2!1368 0))(
  ( (tuple2!1369 (_1!695 (_ BitVec 64)) (_2!695 B!704)) )
))
(declare-datatypes ((List!949 0))(
  ( (Nil!946) (Cons!945 (h!1513 tuple2!1368) (t!3667 List!949)) )
))
(declare-datatypes ((ListLongMap!933 0))(
  ( (ListLongMap!934 (toList!482 List!949)) )
))
(declare-fun lm!252 () ListLongMap!933)

(declare-fun p!304 () Int)

(declare-fun forall!152 (List!949 Int) Bool)

(assert (=> start!4700 (= res!22036 (forall!152 (toList!482 lm!252) p!304))))

(assert (=> start!4700 e!23012))

(declare-fun e!23013 () Bool)

(declare-fun inv!1582 (ListLongMap!933) Bool)

(assert (=> start!4700 (and (inv!1582 lm!252) e!23013)))

(assert (=> start!4700 tp!5353))

(assert (=> start!4700 true))

(declare-fun b!36426 () Bool)

(assert (=> b!36426 (= e!23012 false)))

(declare-fun lt!13490 () Bool)

(declare-fun k0!388 () (_ BitVec 64))

(declare-fun contains!434 (ListLongMap!933 (_ BitVec 64)) Bool)

(assert (=> b!36426 (= lt!13490 (contains!434 lm!252 k0!388))))

(declare-fun b!36427 () Bool)

(declare-fun tp!5354 () Bool)

(assert (=> b!36427 (= e!23013 tp!5354)))

(assert (= (and start!4700 res!22036) b!36426))

(assert (= start!4700 b!36427))

(declare-fun m!29309 () Bool)

(assert (=> start!4700 m!29309))

(declare-fun m!29311 () Bool)

(assert (=> start!4700 m!29311))

(declare-fun m!29313 () Bool)

(assert (=> b!36426 m!29313))

(check-sat (not b!36427) (not b_next!1297) b_and!2137 (not start!4700) (not b!36426))
(check-sat b_and!2137 (not b_next!1297))
