; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113764 () Bool)

(assert start!113764)

(declare-fun b!1350019 () Bool)

(declare-fun e!767980 () Bool)

(declare-fun tp!110623 () Bool)

(assert (=> b!1350019 (= e!767980 tp!110623)))

(declare-fun b!1350017 () Bool)

(declare-fun res!895551 () Bool)

(declare-fun e!767979 () Bool)

(assert (=> b!1350017 (=> (not res!895551) (not e!767979))))

(declare-datatypes ((V!55243 0))(
  ( (V!55244 (val!18877 Int)) )
))
(declare-datatypes ((tuple2!24348 0))(
  ( (tuple2!24349 (_1!12185 (_ BitVec 64)) (_2!12185 V!55243)) )
))
(declare-datatypes ((List!31495 0))(
  ( (Nil!31492) (Cons!31491 (h!32700 tuple2!24348) (t!46153 List!31495)) )
))
(declare-datatypes ((ListLongMap!22005 0))(
  ( (ListLongMap!22006 (toList!11018 List!31495)) )
))
(declare-fun lm!1456 () ListLongMap!22005)

(declare-fun k0!1141 () (_ BitVec 64))

(declare-fun contains!9204 (ListLongMap!22005 (_ BitVec 64)) Bool)

(assert (=> b!1350017 (= res!895551 (not (contains!9204 lm!1456 k0!1141)))))

(declare-fun res!895552 () Bool)

(assert (=> start!113764 (=> (not res!895552) (not e!767979))))

(declare-fun value!554 () V!55243)

(declare-fun otherKey!123 () (_ BitVec 64))

(declare-fun +!4860 (ListLongMap!22005 tuple2!24348) ListLongMap!22005)

(assert (=> start!113764 (= res!895552 (contains!9204 (+!4860 lm!1456 (tuple2!24349 otherKey!123 value!554)) k0!1141))))

(assert (=> start!113764 e!767979))

(declare-fun inv!48419 (ListLongMap!22005) Bool)

(assert (=> start!113764 (and (inv!48419 lm!1456) e!767980)))

(assert (=> start!113764 true))

(declare-fun tp_is_empty!37605 () Bool)

(assert (=> start!113764 tp_is_empty!37605))

(declare-fun b!1350016 () Bool)

(declare-fun res!895550 () Bool)

(assert (=> b!1350016 (=> (not res!895550) (not e!767979))))

(assert (=> b!1350016 (= res!895550 (not (= k0!1141 otherKey!123)))))

(declare-fun b!1350018 () Bool)

(assert (=> b!1350018 (= e!767979 (= otherKey!123 k0!1141))))

(assert (= (and start!113764 res!895552) b!1350016))

(assert (= (and b!1350016 res!895550) b!1350017))

(assert (= (and b!1350017 res!895551) b!1350018))

(assert (= start!113764 b!1350019))

(declare-fun m!1237329 () Bool)

(assert (=> b!1350017 m!1237329))

(declare-fun m!1237331 () Bool)

(assert (=> start!113764 m!1237331))

(assert (=> start!113764 m!1237331))

(declare-fun m!1237333 () Bool)

(assert (=> start!113764 m!1237333))

(declare-fun m!1237335 () Bool)

(assert (=> start!113764 m!1237335))

(check-sat (not b!1350017) (not start!113764) (not b!1350019) tp_is_empty!37605)
(check-sat)
