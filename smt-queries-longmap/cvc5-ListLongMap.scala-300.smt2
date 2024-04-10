; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5230 () Bool)

(assert start!5230)

(declare-fun res!22944 () Bool)

(declare-fun e!24144 () Bool)

(assert (=> start!5230 (=> (not res!22944) (not e!24144))))

(declare-datatypes ((B!788 0))(
  ( (B!789 (val!894 Int)) )
))
(declare-fun b!99 () B!788)

(declare-datatypes ((tuple2!1448 0))(
  ( (tuple2!1449 (_1!735 (_ BitVec 64)) (_2!735 B!788)) )
))
(declare-datatypes ((List!1004 0))(
  ( (Nil!1001) (Cons!1000 (h!1568 tuple2!1448) (t!3837 List!1004)) )
))
(declare-datatypes ((ListLongMap!1025 0))(
  ( (ListLongMap!1026 (toList!528 List!1004)) )
))
(declare-fun lm!264 () ListLongMap!1025)

(declare-fun a!526 () (_ BitVec 64))

(declare-fun contains!479 (List!1004 tuple2!1448) Bool)

(assert (=> start!5230 (= res!22944 (contains!479 (toList!528 lm!264) (tuple2!1449 a!526 b!99)))))

(assert (=> start!5230 e!24144))

(declare-fun e!24143 () Bool)

(declare-fun inv!1699 (ListLongMap!1025) Bool)

(assert (=> start!5230 (and (inv!1699 lm!264) e!24143)))

(assert (=> start!5230 true))

(declare-fun tp_is_empty!1711 () Bool)

(assert (=> start!5230 tp_is_empty!1711))

(declare-fun b!37997 () Bool)

(declare-fun e!24145 () Bool)

(assert (=> b!37997 (= e!24144 (not e!24145))))

(declare-fun res!22943 () Bool)

(assert (=> b!37997 (=> res!22943 e!24145)))

(declare-fun isStrictlySorted!200 (List!1004) Bool)

(assert (=> b!37997 (= res!22943 (not (isStrictlySorted!200 (toList!528 lm!264))))))

(declare-fun containsKey!63 (List!1004 (_ BitVec 64)) Bool)

(assert (=> b!37997 (containsKey!63 (toList!528 lm!264) a!526)))

(declare-datatypes ((Unit!881 0))(
  ( (Unit!882) )
))
(declare-fun lt!13966 () Unit!881)

(declare-fun lemmaContainsTupleThenContainsKey!7 (List!1004 (_ BitVec 64) B!788) Unit!881)

(assert (=> b!37997 (= lt!13966 (lemmaContainsTupleThenContainsKey!7 (toList!528 lm!264) a!526 b!99))))

(declare-fun b!37998 () Bool)

(assert (=> b!37998 (= e!24145 true)))

(declare-datatypes ((Option!99 0))(
  ( (Some!98 (v!1973 B!788)) (None!97) )
))
(declare-fun getValueByKey!93 (List!1004 (_ BitVec 64)) Option!99)

(assert (=> b!37998 (= (getValueByKey!93 (toList!528 lm!264) a!526) (Some!98 b!99))))

(declare-fun lt!13967 () Unit!881)

(declare-fun lemmaContainsTupThenGetReturnValue!20 (List!1004 (_ BitVec 64) B!788) Unit!881)

(assert (=> b!37998 (= lt!13967 (lemmaContainsTupThenGetReturnValue!20 (toList!528 lm!264) a!526 b!99))))

(declare-fun b!37999 () Bool)

(declare-fun tp!5642 () Bool)

(assert (=> b!37999 (= e!24143 tp!5642)))

(assert (= (and start!5230 res!22944) b!37997))

(assert (= (and b!37997 (not res!22943)) b!37998))

(assert (= start!5230 b!37999))

(declare-fun m!30667 () Bool)

(assert (=> start!5230 m!30667))

(declare-fun m!30669 () Bool)

(assert (=> start!5230 m!30669))

(declare-fun m!30671 () Bool)

(assert (=> b!37997 m!30671))

(declare-fun m!30673 () Bool)

(assert (=> b!37997 m!30673))

(declare-fun m!30675 () Bool)

(assert (=> b!37997 m!30675))

(declare-fun m!30677 () Bool)

(assert (=> b!37998 m!30677))

(declare-fun m!30679 () Bool)

(assert (=> b!37998 m!30679))

(push 1)

(assert (not b!37998))

(assert (not b!37997))

(assert (not b!37999))

(assert (not start!5230))

(assert tp_is_empty!1711)

(check-sat)

(pop 1)

