; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113986 () Bool)

(assert start!113986)

(declare-fun b!1351303 () Bool)

(declare-fun res!896059 () Bool)

(declare-fun e!768817 () Bool)

(assert (=> b!1351303 (=> (not res!896059) (not e!768817))))

(declare-fun k0!1141 () (_ BitVec 64))

(declare-fun otherKey!123 () (_ BitVec 64))

(assert (=> b!1351303 (= res!896059 (not (= k0!1141 otherKey!123)))))

(declare-fun b!1351305 () Bool)

(assert (=> b!1351305 (= e!768817 (= otherKey!123 k0!1141))))

(declare-fun b!1351304 () Bool)

(declare-fun res!896060 () Bool)

(assert (=> b!1351304 (=> (not res!896060) (not e!768817))))

(declare-datatypes ((V!55241 0))(
  ( (V!55242 (val!18876 Int)) )
))
(declare-datatypes ((tuple2!24402 0))(
  ( (tuple2!24403 (_1!12212 (_ BitVec 64)) (_2!12212 V!55241)) )
))
(declare-datatypes ((List!31534 0))(
  ( (Nil!31531) (Cons!31530 (h!32748 tuple2!24402) (t!46184 List!31534)) )
))
(declare-datatypes ((ListLongMap!22067 0))(
  ( (ListLongMap!22068 (toList!11049 List!31534)) )
))
(declare-fun lm!1456 () ListLongMap!22067)

(declare-fun contains!9246 (ListLongMap!22067 (_ BitVec 64)) Bool)

(assert (=> b!1351304 (= res!896060 (not (contains!9246 lm!1456 k0!1141)))))

(declare-fun res!896061 () Bool)

(assert (=> start!113986 (=> (not res!896061) (not e!768817))))

(declare-fun value!554 () V!55241)

(declare-fun +!4900 (ListLongMap!22067 tuple2!24402) ListLongMap!22067)

(assert (=> start!113986 (= res!896061 (contains!9246 (+!4900 lm!1456 (tuple2!24403 otherKey!123 value!554)) k0!1141))))

(assert (=> start!113986 e!768817))

(declare-fun e!768816 () Bool)

(declare-fun inv!48418 (ListLongMap!22067) Bool)

(assert (=> start!113986 (and (inv!48418 lm!1456) e!768816)))

(assert (=> start!113986 true))

(declare-fun tp_is_empty!37603 () Bool)

(assert (=> start!113986 tp_is_empty!37603))

(declare-fun b!1351306 () Bool)

(declare-fun tp!110620 () Bool)

(assert (=> b!1351306 (= e!768816 tp!110620)))

(assert (= (and start!113986 res!896061) b!1351303))

(assert (= (and b!1351303 res!896059) b!1351304))

(assert (= (and b!1351304 res!896060) b!1351305))

(assert (= start!113986 b!1351306))

(declare-fun m!1238919 () Bool)

(assert (=> b!1351304 m!1238919))

(declare-fun m!1238921 () Bool)

(assert (=> start!113986 m!1238921))

(assert (=> start!113986 m!1238921))

(declare-fun m!1238923 () Bool)

(assert (=> start!113986 m!1238923))

(declare-fun m!1238925 () Bool)

(assert (=> start!113986 m!1238925))

(check-sat (not b!1351304) (not start!113986) (not b!1351306) tp_is_empty!37603)
(check-sat)
