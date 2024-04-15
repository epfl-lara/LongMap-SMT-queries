; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5228 () Bool)

(assert start!5228)

(declare-fun res!22926 () Bool)

(declare-fun e!24117 () Bool)

(assert (=> start!5228 (=> (not res!22926) (not e!24117))))

(declare-datatypes ((B!788 0))(
  ( (B!789 (val!894 Int)) )
))
(declare-fun b!99 () B!788)

(declare-datatypes ((tuple2!1452 0))(
  ( (tuple2!1453 (_1!737 (_ BitVec 64)) (_2!737 B!788)) )
))
(declare-datatypes ((List!997 0))(
  ( (Nil!994) (Cons!993 (h!1561 tuple2!1452) (t!3829 List!997)) )
))
(declare-datatypes ((ListLongMap!1017 0))(
  ( (ListLongMap!1018 (toList!524 List!997)) )
))
(declare-fun lm!264 () ListLongMap!1017)

(declare-fun a!526 () (_ BitVec 64))

(declare-fun contains!476 (List!997 tuple2!1452) Bool)

(assert (=> start!5228 (= res!22926 (contains!476 (toList!524 lm!264) (tuple2!1453 a!526 b!99)))))

(assert (=> start!5228 e!24117))

(declare-fun e!24115 () Bool)

(declare-fun inv!1699 (ListLongMap!1017) Bool)

(assert (=> start!5228 (and (inv!1699 lm!264) e!24115)))

(assert (=> start!5228 true))

(declare-fun tp_is_empty!1711 () Bool)

(assert (=> start!5228 tp_is_empty!1711))

(declare-fun b!37958 () Bool)

(declare-fun e!24116 () Bool)

(assert (=> b!37958 (= e!24117 (not e!24116))))

(declare-fun res!22927 () Bool)

(assert (=> b!37958 (=> res!22927 e!24116)))

(declare-fun isStrictlySorted!194 (List!997) Bool)

(assert (=> b!37958 (= res!22927 (not (isStrictlySorted!194 (toList!524 lm!264))))))

(declare-fun containsKey!62 (List!997 (_ BitVec 64)) Bool)

(assert (=> b!37958 (containsKey!62 (toList!524 lm!264) a!526)))

(declare-datatypes ((Unit!884 0))(
  ( (Unit!885) )
))
(declare-fun lt!13964 () Unit!884)

(declare-fun lemmaContainsTupleThenContainsKey!7 (List!997 (_ BitVec 64) B!788) Unit!884)

(assert (=> b!37958 (= lt!13964 (lemmaContainsTupleThenContainsKey!7 (toList!524 lm!264) a!526 b!99))))

(declare-fun b!37959 () Bool)

(assert (=> b!37959 (= e!24116 true)))

(declare-datatypes ((Option!98 0))(
  ( (Some!97 (v!1972 B!788)) (None!96) )
))
(declare-fun getValueByKey!92 (List!997 (_ BitVec 64)) Option!98)

(assert (=> b!37959 (= (getValueByKey!92 (toList!524 lm!264) a!526) (Some!97 b!99))))

(declare-fun lt!13963 () Unit!884)

(declare-fun lemmaContainsTupThenGetReturnValue!20 (List!997 (_ BitVec 64) B!788) Unit!884)

(assert (=> b!37959 (= lt!13963 (lemmaContainsTupThenGetReturnValue!20 (toList!524 lm!264) a!526 b!99))))

(declare-fun b!37960 () Bool)

(declare-fun tp!5642 () Bool)

(assert (=> b!37960 (= e!24115 tp!5642)))

(assert (= (and start!5228 res!22926) b!37958))

(assert (= (and b!37958 (not res!22927)) b!37959))

(assert (= start!5228 b!37960))

(declare-fun m!30623 () Bool)

(assert (=> start!5228 m!30623))

(declare-fun m!30625 () Bool)

(assert (=> start!5228 m!30625))

(declare-fun m!30627 () Bool)

(assert (=> b!37958 m!30627))

(declare-fun m!30629 () Bool)

(assert (=> b!37958 m!30629))

(declare-fun m!30631 () Bool)

(assert (=> b!37958 m!30631))

(declare-fun m!30633 () Bool)

(assert (=> b!37959 m!30633))

(declare-fun m!30635 () Bool)

(assert (=> b!37959 m!30635))

(check-sat (not b!37958) (not b!37959) (not start!5228) tp_is_empty!1711 (not b!37960))
(check-sat)
