; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111668 () Bool)

(assert start!111668)

(declare-fun b_free!30325 () Bool)

(declare-fun b_next!30325 () Bool)

(assert (=> start!111668 (= b_free!30325 (not b_next!30325))))

(declare-fun tp!106450 () Bool)

(declare-fun b_and!48809 () Bool)

(assert (=> start!111668 (= tp!106450 b_and!48809)))

(declare-fun b!1322905 () Bool)

(declare-fun e!754279 () Bool)

(declare-fun tp_is_empty!36145 () Bool)

(assert (=> b!1322905 (= e!754279 tp_is_empty!36145)))

(declare-fun b!1322906 () Bool)

(declare-fun res!878081 () Bool)

(declare-fun e!754276 () Bool)

(assert (=> b!1322906 (=> (not res!878081) (not e!754276))))

(declare-datatypes ((array!89210 0))(
  ( (array!89211 (arr!43079 (Array (_ BitVec 32) (_ BitVec 64))) (size!43629 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89210)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53297 0))(
  ( (V!53298 (val!18147 Int)) )
))
(declare-datatypes ((ValueCell!17174 0))(
  ( (ValueCellFull!17174 (v!20777 V!53297)) (EmptyCell!17174) )
))
(declare-datatypes ((array!89212 0))(
  ( (array!89213 (arr!43080 (Array (_ BitVec 32) ValueCell!17174)) (size!43630 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89212)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1322906 (= res!878081 (and (= (size!43630 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43629 _keys!1609) (size!43630 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!55865 () Bool)

(declare-fun mapRes!55865 () Bool)

(declare-fun tp!106451 () Bool)

(declare-fun e!754278 () Bool)

(assert (=> mapNonEmpty!55865 (= mapRes!55865 (and tp!106451 e!754278))))

(declare-fun mapRest!55865 () (Array (_ BitVec 32) ValueCell!17174))

(declare-fun mapKey!55865 () (_ BitVec 32))

(declare-fun mapValue!55865 () ValueCell!17174)

(assert (=> mapNonEmpty!55865 (= (arr!43080 _values!1337) (store mapRest!55865 mapKey!55865 mapValue!55865))))

(declare-fun b!1322907 () Bool)

(declare-fun res!878083 () Bool)

(assert (=> b!1322907 (=> (not res!878083) (not e!754276))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1322907 (= res!878083 (not (= (select (arr!43079 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1322908 () Bool)

(declare-fun res!878080 () Bool)

(assert (=> b!1322908 (=> (not res!878080) (not e!754276))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89210 (_ BitVec 32)) Bool)

(assert (=> b!1322908 (= res!878080 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1322909 () Bool)

(assert (=> b!1322909 (= e!754276 (not true))))

(declare-datatypes ((tuple2!23388 0))(
  ( (tuple2!23389 (_1!11705 (_ BitVec 64)) (_2!11705 V!53297)) )
))
(declare-datatypes ((List!30530 0))(
  ( (Nil!30527) (Cons!30526 (h!31735 tuple2!23388) (t!44404 List!30530)) )
))
(declare-datatypes ((ListLongMap!21045 0))(
  ( (ListLongMap!21046 (toList!10538 List!30530)) )
))
(declare-fun lt!588536 () ListLongMap!21045)

(declare-fun minValue!1279 () V!53297)

(declare-fun contains!8693 (ListLongMap!21045 (_ BitVec 64)) Bool)

(declare-fun +!4590 (ListLongMap!21045 tuple2!23388) ListLongMap!21045)

(assert (=> b!1322909 (contains!8693 (+!4590 lt!588536 (tuple2!23389 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k!1164)))

(declare-datatypes ((Unit!43600 0))(
  ( (Unit!43601) )
))
(declare-fun lt!588532 () Unit!43600)

(declare-fun addStillContains!1139 (ListLongMap!21045 (_ BitVec 64) V!53297 (_ BitVec 64)) Unit!43600)

(assert (=> b!1322909 (= lt!588532 (addStillContains!1139 lt!588536 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k!1164))))

(assert (=> b!1322909 (contains!8693 lt!588536 k!1164)))

(declare-fun lt!588537 () ListLongMap!21045)

(declare-fun lt!588535 () tuple2!23388)

(assert (=> b!1322909 (= lt!588536 (+!4590 lt!588537 lt!588535))))

(declare-fun zeroValue!1279 () V!53297)

(declare-fun lt!588531 () Unit!43600)

(assert (=> b!1322909 (= lt!588531 (addStillContains!1139 lt!588537 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k!1164))))

(assert (=> b!1322909 (contains!8693 lt!588537 k!1164)))

(declare-fun lt!588539 () Unit!43600)

(declare-fun lt!588533 () V!53297)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!186 ((_ BitVec 64) (_ BitVec 64) V!53297 ListLongMap!21045) Unit!43600)

(assert (=> b!1322909 (= lt!588539 (lemmaInListMapAfterAddingDiffThenInBefore!186 k!1164 (select (arr!43079 _keys!1609) from!2000) lt!588533 lt!588537))))

(declare-fun lt!588538 () ListLongMap!21045)

(assert (=> b!1322909 (contains!8693 lt!588538 k!1164)))

(declare-fun lt!588530 () Unit!43600)

(assert (=> b!1322909 (= lt!588530 (lemmaInListMapAfterAddingDiffThenInBefore!186 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588538))))

(declare-fun lt!588534 () ListLongMap!21045)

(assert (=> b!1322909 (contains!8693 lt!588534 k!1164)))

(declare-fun lt!588540 () Unit!43600)

(assert (=> b!1322909 (= lt!588540 (lemmaInListMapAfterAddingDiffThenInBefore!186 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588534))))

(assert (=> b!1322909 (= lt!588534 (+!4590 lt!588538 lt!588535))))

(assert (=> b!1322909 (= lt!588535 (tuple2!23389 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1322909 (= lt!588538 (+!4590 lt!588537 (tuple2!23389 (select (arr!43079 _keys!1609) from!2000) lt!588533)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21690 (ValueCell!17174 V!53297) V!53297)

(declare-fun dynLambda!3529 (Int (_ BitVec 64)) V!53297)

(assert (=> b!1322909 (= lt!588533 (get!21690 (select (arr!43080 _values!1337) from!2000) (dynLambda!3529 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6225 (array!89210 array!89212 (_ BitVec 32) (_ BitVec 32) V!53297 V!53297 (_ BitVec 32) Int) ListLongMap!21045)

(assert (=> b!1322909 (= lt!588537 (getCurrentListMapNoExtraKeys!6225 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun mapIsEmpty!55865 () Bool)

(assert (=> mapIsEmpty!55865 mapRes!55865))

(declare-fun b!1322910 () Bool)

(declare-fun e!754277 () Bool)

(assert (=> b!1322910 (= e!754277 (and e!754279 mapRes!55865))))

(declare-fun condMapEmpty!55865 () Bool)

(declare-fun mapDefault!55865 () ValueCell!17174)

