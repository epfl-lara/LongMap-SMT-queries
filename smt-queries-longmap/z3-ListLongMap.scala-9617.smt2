; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113998 () Bool)

(assert start!113998)

(declare-fun res!896120 () Bool)

(declare-fun e!768852 () Bool)

(assert (=> start!113998 (=> (not res!896120) (not e!768852))))

(declare-datatypes ((V!55257 0))(
  ( (V!55258 (val!18882 Int)) )
))
(declare-fun value!554 () V!55257)

(declare-datatypes ((tuple2!24414 0))(
  ( (tuple2!24415 (_1!12218 (_ BitVec 64)) (_2!12218 V!55257)) )
))
(declare-datatypes ((List!31540 0))(
  ( (Nil!31537) (Cons!31536 (h!32754 tuple2!24414) (t!46190 List!31540)) )
))
(declare-datatypes ((ListLongMap!22079 0))(
  ( (ListLongMap!22080 (toList!11055 List!31540)) )
))
(declare-fun lm!1456 () ListLongMap!22079)

(declare-fun otherKey!123 () (_ BitVec 64))

(declare-fun k0!1141 () (_ BitVec 64))

(declare-fun contains!9252 (ListLongMap!22079 (_ BitVec 64)) Bool)

(declare-fun +!4906 (ListLongMap!22079 tuple2!24414) ListLongMap!22079)

(assert (=> start!113998 (= res!896120 (contains!9252 (+!4906 lm!1456 (tuple2!24415 otherKey!123 value!554)) k0!1141))))

(assert (=> start!113998 e!768852))

(declare-fun e!768853 () Bool)

(declare-fun inv!48434 (ListLongMap!22079) Bool)

(assert (=> start!113998 (and (inv!48434 lm!1456) e!768853)))

(assert (=> start!113998 true))

(declare-fun tp_is_empty!37615 () Bool)

(assert (=> start!113998 tp_is_empty!37615))

(declare-fun b!1351382 () Bool)

(declare-fun res!896121 () Bool)

(assert (=> b!1351382 (=> (not res!896121) (not e!768852))))

(assert (=> b!1351382 (= res!896121 (not (= k0!1141 otherKey!123)))))

(declare-fun b!1351383 () Bool)

(assert (=> b!1351383 (= e!768852 false)))

(declare-fun lt!597369 () Bool)

(assert (=> b!1351383 (= lt!597369 (contains!9252 lm!1456 k0!1141))))

(declare-fun b!1351384 () Bool)

(declare-fun tp!110638 () Bool)

(assert (=> b!1351384 (= e!768853 tp!110638)))

(assert (= (and start!113998 res!896120) b!1351382))

(assert (= (and b!1351382 res!896121) b!1351383))

(assert (= start!113998 b!1351384))

(declare-fun m!1238973 () Bool)

(assert (=> start!113998 m!1238973))

(assert (=> start!113998 m!1238973))

(declare-fun m!1238975 () Bool)

(assert (=> start!113998 m!1238975))

(declare-fun m!1238977 () Bool)

(assert (=> start!113998 m!1238977))

(declare-fun m!1238979 () Bool)

(assert (=> b!1351383 m!1238979))

(check-sat (not start!113998) (not b!1351383) (not b!1351384) tp_is_empty!37615)
(check-sat)
