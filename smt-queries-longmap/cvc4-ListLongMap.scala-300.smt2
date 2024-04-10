; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5234 () Bool)

(assert start!5234)

(declare-fun res!22956 () Bool)

(declare-fun e!24162 () Bool)

(assert (=> start!5234 (=> (not res!22956) (not e!24162))))

(declare-datatypes ((B!792 0))(
  ( (B!793 (val!896 Int)) )
))
(declare-fun b!99 () B!792)

(declare-datatypes ((tuple2!1452 0))(
  ( (tuple2!1453 (_1!737 (_ BitVec 64)) (_2!737 B!792)) )
))
(declare-datatypes ((List!1006 0))(
  ( (Nil!1003) (Cons!1002 (h!1570 tuple2!1452) (t!3839 List!1006)) )
))
(declare-datatypes ((ListLongMap!1029 0))(
  ( (ListLongMap!1030 (toList!530 List!1006)) )
))
(declare-fun lm!264 () ListLongMap!1029)

(declare-fun a!526 () (_ BitVec 64))

(declare-fun contains!481 (List!1006 tuple2!1452) Bool)

(assert (=> start!5234 (= res!22956 (contains!481 (toList!530 lm!264) (tuple2!1453 a!526 b!99)))))

(assert (=> start!5234 e!24162))

(declare-fun e!24161 () Bool)

(declare-fun inv!1701 (ListLongMap!1029) Bool)

(assert (=> start!5234 (and (inv!1701 lm!264) e!24161)))

(assert (=> start!5234 true))

(declare-fun tp_is_empty!1715 () Bool)

(assert (=> start!5234 tp_is_empty!1715))

(declare-fun b!38015 () Bool)

(declare-fun e!24163 () Bool)

(assert (=> b!38015 (= e!24162 (not e!24163))))

(declare-fun res!22955 () Bool)

(assert (=> b!38015 (=> res!22955 e!24163)))

(declare-fun isStrictlySorted!202 (List!1006) Bool)

(assert (=> b!38015 (= res!22955 (not (isStrictlySorted!202 (toList!530 lm!264))))))

(declare-fun containsKey!65 (List!1006 (_ BitVec 64)) Bool)

(assert (=> b!38015 (containsKey!65 (toList!530 lm!264) a!526)))

(declare-datatypes ((Unit!885 0))(
  ( (Unit!886) )
))
(declare-fun lt!13979 () Unit!885)

(declare-fun lemmaContainsTupleThenContainsKey!9 (List!1006 (_ BitVec 64) B!792) Unit!885)

(assert (=> b!38015 (= lt!13979 (lemmaContainsTupleThenContainsKey!9 (toList!530 lm!264) a!526 b!99))))

(declare-fun b!38016 () Bool)

(assert (=> b!38016 (= e!24163 true)))

(declare-datatypes ((Option!101 0))(
  ( (Some!100 (v!1975 B!792)) (None!99) )
))
(declare-fun getValueByKey!95 (List!1006 (_ BitVec 64)) Option!101)

(assert (=> b!38016 (= (getValueByKey!95 (toList!530 lm!264) a!526) (Some!100 b!99))))

(declare-fun lt!13978 () Unit!885)

(declare-fun lemmaContainsTupThenGetReturnValue!22 (List!1006 (_ BitVec 64) B!792) Unit!885)

(assert (=> b!38016 (= lt!13978 (lemmaContainsTupThenGetReturnValue!22 (toList!530 lm!264) a!526 b!99))))

(declare-fun b!38017 () Bool)

(declare-fun tp!5648 () Bool)

(assert (=> b!38017 (= e!24161 tp!5648)))

(assert (= (and start!5234 res!22956) b!38015))

(assert (= (and b!38015 (not res!22955)) b!38016))

(assert (= start!5234 b!38017))

(declare-fun m!30695 () Bool)

(assert (=> start!5234 m!30695))

(declare-fun m!30697 () Bool)

(assert (=> start!5234 m!30697))

(declare-fun m!30699 () Bool)

(assert (=> b!38015 m!30699))

(declare-fun m!30701 () Bool)

(assert (=> b!38015 m!30701))

(declare-fun m!30703 () Bool)

(assert (=> b!38015 m!30703))

(declare-fun m!30705 () Bool)

(assert (=> b!38016 m!30705))

(declare-fun m!30707 () Bool)

(assert (=> b!38016 m!30707))

(push 1)

(assert (not b!38015))

(assert (not b!38016))

(assert (not b!38017))

(assert (not start!5234))

(assert tp_is_empty!1715)

(check-sat)

(pop 1)

