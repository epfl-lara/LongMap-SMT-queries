; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113992 () Bool)

(assert start!113992)

(declare-fun b!1351341 () Bool)

(declare-fun e!768835 () Bool)

(assert (=> b!1351341 (= e!768835 (not true))))

(assert (=> b!1351341 false))

(declare-datatypes ((V!55249 0))(
  ( (V!55250 (val!18879 Int)) )
))
(declare-fun value!554 () V!55249)

(declare-datatypes ((tuple2!24408 0))(
  ( (tuple2!24409 (_1!12215 (_ BitVec 64)) (_2!12215 V!55249)) )
))
(declare-datatypes ((List!31537 0))(
  ( (Nil!31534) (Cons!31533 (h!32751 tuple2!24408) (t!46187 List!31537)) )
))
(declare-datatypes ((ListLongMap!22073 0))(
  ( (ListLongMap!22074 (toList!11052 List!31537)) )
))
(declare-fun lm!1456 () ListLongMap!22073)

(declare-fun otherKey!123 () (_ BitVec 64))

(declare-datatypes ((Unit!44156 0))(
  ( (Unit!44157) )
))
(declare-fun lt!597360 () Unit!44156)

(declare-fun k0!1141 () (_ BitVec 64))

(declare-fun addStillNotContains!507 (ListLongMap!22073 (_ BitVec 64) V!55249 (_ BitVec 64)) Unit!44156)

(assert (=> b!1351341 (= lt!597360 (addStillNotContains!507 lm!1456 otherKey!123 value!554 k0!1141))))

(declare-fun b!1351342 () Bool)

(declare-fun res!896089 () Bool)

(assert (=> b!1351342 (=> (not res!896089) (not e!768835))))

(assert (=> b!1351342 (= res!896089 (not (= k0!1141 otherKey!123)))))

(declare-fun b!1351343 () Bool)

(declare-fun res!896088 () Bool)

(assert (=> b!1351343 (=> (not res!896088) (not e!768835))))

(assert (=> b!1351343 (= res!896088 (not (= otherKey!123 k0!1141)))))

(declare-fun b!1351344 () Bool)

(declare-fun res!896091 () Bool)

(assert (=> b!1351344 (=> (not res!896091) (not e!768835))))

(declare-fun contains!9249 (ListLongMap!22073 (_ BitVec 64)) Bool)

(assert (=> b!1351344 (= res!896091 (not (contains!9249 lm!1456 k0!1141)))))

(declare-fun b!1351345 () Bool)

(declare-fun e!768834 () Bool)

(declare-fun tp!110629 () Bool)

(assert (=> b!1351345 (= e!768834 tp!110629)))

(declare-fun res!896090 () Bool)

(assert (=> start!113992 (=> (not res!896090) (not e!768835))))

(declare-fun +!4903 (ListLongMap!22073 tuple2!24408) ListLongMap!22073)

(assert (=> start!113992 (= res!896090 (contains!9249 (+!4903 lm!1456 (tuple2!24409 otherKey!123 value!554)) k0!1141))))

(assert (=> start!113992 e!768835))

(declare-fun inv!48426 (ListLongMap!22073) Bool)

(assert (=> start!113992 (and (inv!48426 lm!1456) e!768834)))

(assert (=> start!113992 true))

(declare-fun tp_is_empty!37609 () Bool)

(assert (=> start!113992 tp_is_empty!37609))

(assert (= (and start!113992 res!896090) b!1351342))

(assert (= (and b!1351342 res!896089) b!1351344))

(assert (= (and b!1351344 res!896091) b!1351343))

(assert (= (and b!1351343 res!896088) b!1351341))

(assert (= start!113992 b!1351345))

(declare-fun m!1238943 () Bool)

(assert (=> b!1351341 m!1238943))

(declare-fun m!1238945 () Bool)

(assert (=> b!1351344 m!1238945))

(declare-fun m!1238947 () Bool)

(assert (=> start!113992 m!1238947))

(assert (=> start!113992 m!1238947))

(declare-fun m!1238949 () Bool)

(assert (=> start!113992 m!1238949))

(declare-fun m!1238951 () Bool)

(assert (=> start!113992 m!1238951))

(check-sat (not b!1351345) (not b!1351341) (not b!1351344) (not start!113992) tp_is_empty!37609)
(check-sat)
