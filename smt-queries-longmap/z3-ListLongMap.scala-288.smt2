; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4730 () Bool)

(assert start!4730)

(declare-fun b_free!1317 () Bool)

(declare-fun b_next!1317 () Bool)

(assert (=> start!4730 (= b_free!1317 (not b_next!1317))))

(declare-fun tp!5414 () Bool)

(declare-fun b_and!2169 () Bool)

(assert (=> start!4730 (= tp!5414 b_and!2169)))

(declare-fun res!22179 () Bool)

(declare-fun e!23134 () Bool)

(assert (=> start!4730 (=> (not res!22179) (not e!23134))))

(declare-datatypes ((B!724 0))(
  ( (B!725 (val!862 Int)) )
))
(declare-datatypes ((tuple2!1384 0))(
  ( (tuple2!1385 (_1!703 (_ BitVec 64)) (_2!703 B!724)) )
))
(declare-datatypes ((List!966 0))(
  ( (Nil!963) (Cons!962 (h!1530 tuple2!1384) (t!3697 List!966)) )
))
(declare-datatypes ((ListLongMap!961 0))(
  ( (ListLongMap!962 (toList!496 List!966)) )
))
(declare-fun lm!252 () ListLongMap!961)

(declare-fun p!304 () Int)

(declare-fun forall!162 (List!966 Int) Bool)

(assert (=> start!4730 (= res!22179 (forall!162 (toList!496 lm!252) p!304))))

(assert (=> start!4730 e!23134))

(declare-fun e!23133 () Bool)

(declare-fun inv!1607 (ListLongMap!961) Bool)

(assert (=> start!4730 (and (inv!1607 lm!252) e!23133)))

(assert (=> start!4730 tp!5414))

(assert (=> start!4730 true))

(declare-fun b!36621 () Bool)

(assert (=> b!36621 (= e!23134 false)))

(declare-fun lt!13542 () Bool)

(declare-fun k0!388 () (_ BitVec 64))

(declare-fun contains!447 (ListLongMap!961 (_ BitVec 64)) Bool)

(assert (=> b!36621 (= lt!13542 (contains!447 lm!252 k0!388))))

(declare-fun b!36622 () Bool)

(declare-fun tp!5413 () Bool)

(assert (=> b!36622 (= e!23133 tp!5413)))

(assert (= (and start!4730 res!22179) b!36621))

(assert (= start!4730 b!36622))

(declare-fun m!29517 () Bool)

(assert (=> start!4730 m!29517))

(declare-fun m!29519 () Bool)

(assert (=> start!4730 m!29519))

(declare-fun m!29521 () Bool)

(assert (=> b!36621 m!29521))

(check-sat (not start!4730) (not b_next!1317) b_and!2169 (not b!36621) (not b!36622))
(check-sat b_and!2169 (not b_next!1317))
