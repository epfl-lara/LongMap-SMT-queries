; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132994 () Bool)

(assert start!132994)

(declare-fun res!1065085 () Bool)

(declare-fun e!867337 () Bool)

(assert (=> start!132994 (=> (not res!1065085) (not e!867337))))

(declare-datatypes ((B!2362 0))(
  ( (B!2363 (val!19267 Int)) )
))
(declare-datatypes ((tuple2!24910 0))(
  ( (tuple2!24911 (_1!12466 (_ BitVec 64)) (_2!12466 B!2362)) )
))
(declare-datatypes ((List!36301 0))(
  ( (Nil!36298) (Cons!36297 (h!37743 tuple2!24910) (t!51028 List!36301)) )
))
(declare-datatypes ((ListLongMap!22411 0))(
  ( (ListLongMap!22412 (toList!11221 List!36301)) )
))
(declare-fun lm!250 () ListLongMap!22411)

(declare-fun a0!50 () (_ BitVec 64))

(declare-fun contains!10189 (ListLongMap!22411 (_ BitVec 64)) Bool)

(assert (=> start!132994 (= res!1065085 (contains!10189 lm!250 a0!50))))

(assert (=> start!132994 e!867337))

(declare-fun e!867338 () Bool)

(declare-fun inv!57450 (ListLongMap!22411) Bool)

(assert (=> start!132994 (and (inv!57450 lm!250) e!867338)))

(assert (=> start!132994 true))

(declare-fun b!1557103 () Bool)

(assert (=> b!1557103 (= e!867337 false)))

(declare-fun b!1557104 () Bool)

(declare-fun tp!112470 () Bool)

(assert (=> b!1557104 (= e!867338 tp!112470)))

(assert (= (and start!132994 res!1065085) b!1557103))

(assert (= start!132994 b!1557104))

(declare-fun m!1434355 () Bool)

(assert (=> start!132994 m!1434355))

(declare-fun m!1434357 () Bool)

(assert (=> start!132994 m!1434357))

(check-sat (not start!132994) (not b!1557104))
(check-sat)
