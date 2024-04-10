; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111438 () Bool)

(assert start!111438)

(declare-fun b_free!30095 () Bool)

(declare-fun b_next!30095 () Bool)

(assert (=> start!111438 (= b_free!30095 (not b_next!30095))))

(declare-fun tp!105760 () Bool)

(declare-fun b_and!48349 () Bool)

(assert (=> start!111438 (= tp!105760 b_and!48349)))

(declare-fun b!1318880 () Bool)

(declare-fun e!752554 () Bool)

(assert (=> b!1318880 (= e!752554 (not true))))

(declare-datatypes ((V!52989 0))(
  ( (V!52990 (val!18032 Int)) )
))
(declare-datatypes ((tuple2!23204 0))(
  ( (tuple2!23205 (_1!11613 (_ BitVec 64)) (_2!11613 V!52989)) )
))
(declare-datatypes ((List!30360 0))(
  ( (Nil!30357) (Cons!30356 (h!31565 tuple2!23204) (t!44004 List!30360)) )
))
(declare-datatypes ((ListLongMap!20861 0))(
  ( (ListLongMap!20862 (toList!10446 List!30360)) )
))
(declare-fun lt!586545 () ListLongMap!20861)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun contains!8601 (ListLongMap!20861 (_ BitVec 64)) Bool)

(assert (=> b!1318880 (contains!8601 lt!586545 k!1164)))

(declare-datatypes ((Unit!43434 0))(
  ( (Unit!43435) )
))
(declare-fun lt!586544 () Unit!43434)

(declare-fun minValue!1279 () V!52989)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!103 ((_ BitVec 64) (_ BitVec 64) V!52989 ListLongMap!20861) Unit!43434)

(assert (=> b!1318880 (= lt!586544 (lemmaInListMapAfterAddingDiffThenInBefore!103 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586545))))

(declare-datatypes ((array!88772 0))(
  ( (array!88773 (arr!42860 (Array (_ BitVec 32) (_ BitVec 64))) (size!43410 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88772)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!52989)

(declare-datatypes ((ValueCell!17059 0))(
  ( (ValueCellFull!17059 (v!20662 V!52989)) (EmptyCell!17059) )
))
(declare-datatypes ((array!88774 0))(
  ( (array!88775 (arr!42861 (Array (_ BitVec 32) ValueCell!17059)) (size!43411 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88774)

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun +!4507 (ListLongMap!20861 tuple2!23204) ListLongMap!20861)

(declare-fun getCurrentListMapNoExtraKeys!6142 (array!88772 array!88774 (_ BitVec 32) (_ BitVec 32) V!52989 V!52989 (_ BitVec 32) Int) ListLongMap!20861)

(declare-fun get!21529 (ValueCell!17059 V!52989) V!52989)

(declare-fun dynLambda!3446 (Int (_ BitVec 64)) V!52989)

(assert (=> b!1318880 (= lt!586545 (+!4507 (+!4507 (getCurrentListMapNoExtraKeys!6142 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23205 (select (arr!42860 _keys!1609) from!2000) (get!21529 (select (arr!42861 _values!1337) from!2000) (dynLambda!3446 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun b!1318881 () Bool)

(declare-fun res!875320 () Bool)

(assert (=> b!1318881 (=> (not res!875320) (not e!752554))))

(assert (=> b!1318881 (= res!875320 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43410 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!55520 () Bool)

(declare-fun mapRes!55520 () Bool)

(assert (=> mapIsEmpty!55520 mapRes!55520))

(declare-fun mapNonEmpty!55520 () Bool)

(declare-fun tp!105761 () Bool)

(declare-fun e!752552 () Bool)

(assert (=> mapNonEmpty!55520 (= mapRes!55520 (and tp!105761 e!752552))))

(declare-fun mapValue!55520 () ValueCell!17059)

(declare-fun mapKey!55520 () (_ BitVec 32))

(declare-fun mapRest!55520 () (Array (_ BitVec 32) ValueCell!17059))

(assert (=> mapNonEmpty!55520 (= (arr!42861 _values!1337) (store mapRest!55520 mapKey!55520 mapValue!55520))))

(declare-fun b!1318882 () Bool)

(declare-fun tp_is_empty!35915 () Bool)

(assert (=> b!1318882 (= e!752552 tp_is_empty!35915)))

(declare-fun b!1318883 () Bool)

(declare-fun e!752551 () Bool)

(assert (=> b!1318883 (= e!752551 tp_is_empty!35915)))

(declare-fun b!1318884 () Bool)

(declare-fun res!875322 () Bool)

(assert (=> b!1318884 (=> (not res!875322) (not e!752554))))

(assert (=> b!1318884 (= res!875322 (and (= (size!43411 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43410 _keys!1609) (size!43411 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1318885 () Bool)

(declare-fun res!875318 () Bool)

(assert (=> b!1318885 (=> (not res!875318) (not e!752554))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88772 (_ BitVec 32)) Bool)

(assert (=> b!1318885 (= res!875318 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1318886 () Bool)

(declare-fun res!875323 () Bool)

(assert (=> b!1318886 (=> (not res!875323) (not e!752554))))

(assert (=> b!1318886 (= res!875323 (not (= (select (arr!42860 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1318887 () Bool)

(declare-fun e!752553 () Bool)

(assert (=> b!1318887 (= e!752553 (and e!752551 mapRes!55520))))

(declare-fun condMapEmpty!55520 () Bool)

(declare-fun mapDefault!55520 () ValueCell!17059)

