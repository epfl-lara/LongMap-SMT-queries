; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113774 () Bool)

(assert start!113774)

(declare-fun res!895602 () Bool)

(declare-fun e!768010 () Bool)

(assert (=> start!113774 (=> (not res!895602) (not e!768010))))

(declare-datatypes ((V!55257 0))(
  ( (V!55258 (val!18882 Int)) )
))
(declare-fun value!554 () V!55257)

(declare-datatypes ((tuple2!24358 0))(
  ( (tuple2!24359 (_1!12190 (_ BitVec 64)) (_2!12190 V!55257)) )
))
(declare-datatypes ((List!31500 0))(
  ( (Nil!31497) (Cons!31496 (h!32705 tuple2!24358) (t!46158 List!31500)) )
))
(declare-datatypes ((ListLongMap!22015 0))(
  ( (ListLongMap!22016 (toList!11023 List!31500)) )
))
(declare-fun lm!1456 () ListLongMap!22015)

(declare-fun otherKey!123 () (_ BitVec 64))

(declare-fun k!1141 () (_ BitVec 64))

(declare-fun contains!9209 (ListLongMap!22015 (_ BitVec 64)) Bool)

(declare-fun +!4865 (ListLongMap!22015 tuple2!24358) ListLongMap!22015)

(assert (=> start!113774 (= res!895602 (contains!9209 (+!4865 lm!1456 (tuple2!24359 otherKey!123 value!554)) k!1141))))

(assert (=> start!113774 e!768010))

(declare-fun e!768009 () Bool)

(declare-fun inv!48434 (ListLongMap!22015) Bool)

(assert (=> start!113774 (and (inv!48434 lm!1456) e!768009)))

(assert (=> start!113774 true))

(declare-fun tp_is_empty!37615 () Bool)

(assert (=> start!113774 tp_is_empty!37615))

(declare-fun b!1350083 () Bool)

(declare-fun res!895603 () Bool)

(assert (=> b!1350083 (=> (not res!895603) (not e!768010))))

(assert (=> b!1350083 (= res!895603 (not (= k!1141 otherKey!123)))))

(declare-fun b!1350084 () Bool)

(assert (=> b!1350084 (= e!768010 false)))

(declare-fun lt!596893 () Bool)

(assert (=> b!1350084 (= lt!596893 (contains!9209 lm!1456 k!1141))))

(declare-fun b!1350085 () Bool)

(declare-fun tp!110638 () Bool)

(assert (=> b!1350085 (= e!768009 tp!110638)))

(assert (= (and start!113774 res!895602) b!1350083))

(assert (= (and b!1350083 res!895603) b!1350084))

(assert (= start!113774 b!1350085))

(declare-fun m!1237375 () Bool)

(assert (=> start!113774 m!1237375))

(assert (=> start!113774 m!1237375))

(declare-fun m!1237377 () Bool)

(assert (=> start!113774 m!1237377))

(declare-fun m!1237379 () Bool)

(assert (=> start!113774 m!1237379))

(declare-fun m!1237381 () Bool)

(assert (=> b!1350084 m!1237381))

(push 1)

(assert (not start!113774))

(assert (not b!1350084))

(assert (not b!1350085))

(assert tp_is_empty!37615)

(check-sat)

(pop 1)

