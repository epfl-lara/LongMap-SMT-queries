; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111410 () Bool)

(assert start!111410)

(declare-fun b_free!30067 () Bool)

(declare-fun b_next!30067 () Bool)

(assert (=> start!111410 (= b_free!30067 (not b_next!30067))))

(declare-fun tp!105677 () Bool)

(declare-fun b_and!48293 () Bool)

(assert (=> start!111410 (= tp!105677 b_and!48293)))

(declare-fun res!874985 () Bool)

(declare-fun e!752342 () Bool)

(assert (=> start!111410 (=> (not res!874985) (not e!752342))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111410 (= res!874985 (validMask!0 mask!2019))))

(assert (=> start!111410 e!752342))

(declare-datatypes ((array!88720 0))(
  ( (array!88721 (arr!42834 (Array (_ BitVec 32) (_ BitVec 64))) (size!43384 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88720)

(declare-fun array_inv!32347 (array!88720) Bool)

(assert (=> start!111410 (array_inv!32347 _keys!1609)))

(assert (=> start!111410 true))

(declare-fun tp_is_empty!35887 () Bool)

(assert (=> start!111410 tp_is_empty!35887))

(declare-datatypes ((V!52953 0))(
  ( (V!52954 (val!18018 Int)) )
))
(declare-datatypes ((ValueCell!17045 0))(
  ( (ValueCellFull!17045 (v!20648 V!52953)) (EmptyCell!17045) )
))
(declare-datatypes ((array!88722 0))(
  ( (array!88723 (arr!42835 (Array (_ BitVec 32) ValueCell!17045)) (size!43385 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88722)

(declare-fun e!752343 () Bool)

(declare-fun array_inv!32348 (array!88722) Bool)

(assert (=> start!111410 (and (array_inv!32348 _values!1337) e!752343)))

(assert (=> start!111410 tp!105677))

(declare-fun b!1318390 () Bool)

(declare-fun res!874984 () Bool)

(assert (=> b!1318390 (=> (not res!874984) (not e!752342))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1318390 (= res!874984 (and (= (size!43385 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43384 _keys!1609) (size!43385 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!55478 () Bool)

(declare-fun mapRes!55478 () Bool)

(assert (=> mapIsEmpty!55478 mapRes!55478))

(declare-fun b!1318391 () Bool)

(declare-fun res!874982 () Bool)

(assert (=> b!1318391 (=> (not res!874982) (not e!752342))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1318391 (= res!874982 (not (= (select (arr!42834 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1318392 () Bool)

(declare-fun e!752341 () Bool)

(assert (=> b!1318392 (= e!752341 tp_is_empty!35887)))

(declare-fun b!1318393 () Bool)

(declare-fun res!874986 () Bool)

(assert (=> b!1318393 (=> (not res!874986) (not e!752342))))

(declare-fun zeroValue!1279 () V!52953)

(declare-fun minValue!1279 () V!52953)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23188 0))(
  ( (tuple2!23189 (_1!11605 (_ BitVec 64)) (_2!11605 V!52953)) )
))
(declare-datatypes ((List!30343 0))(
  ( (Nil!30340) (Cons!30339 (h!31548 tuple2!23188) (t!43959 List!30343)) )
))
(declare-datatypes ((ListLongMap!20845 0))(
  ( (ListLongMap!20846 (toList!10438 List!30343)) )
))
(declare-fun contains!8593 (ListLongMap!20845 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5451 (array!88720 array!88722 (_ BitVec 32) (_ BitVec 32) V!52953 V!52953 (_ BitVec 32) Int) ListLongMap!20845)

(assert (=> b!1318393 (= res!874986 (contains!8593 (getCurrentListMap!5451 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1318394 () Bool)

(declare-fun e!752344 () Bool)

(assert (=> b!1318394 (= e!752344 tp_is_empty!35887)))

(declare-fun b!1318395 () Bool)

(declare-fun res!874981 () Bool)

(assert (=> b!1318395 (=> (not res!874981) (not e!752342))))

(declare-datatypes ((List!30344 0))(
  ( (Nil!30341) (Cons!30340 (h!31549 (_ BitVec 64)) (t!43960 List!30344)) )
))
(declare-fun arrayNoDuplicates!0 (array!88720 (_ BitVec 32) List!30344) Bool)

(assert (=> b!1318395 (= res!874981 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30341))))

(declare-fun mapNonEmpty!55478 () Bool)

(declare-fun tp!105676 () Bool)

(assert (=> mapNonEmpty!55478 (= mapRes!55478 (and tp!105676 e!752341))))

(declare-fun mapRest!55478 () (Array (_ BitVec 32) ValueCell!17045))

(declare-fun mapValue!55478 () ValueCell!17045)

(declare-fun mapKey!55478 () (_ BitVec 32))

(assert (=> mapNonEmpty!55478 (= (arr!42835 _values!1337) (store mapRest!55478 mapKey!55478 mapValue!55478))))

(declare-fun b!1318396 () Bool)

(declare-fun res!874988 () Bool)

(assert (=> b!1318396 (=> (not res!874988) (not e!752342))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1318396 (= res!874988 (validKeyInArray!0 (select (arr!42834 _keys!1609) from!2000)))))

(declare-fun b!1318397 () Bool)

(declare-fun res!874983 () Bool)

(assert (=> b!1318397 (=> (not res!874983) (not e!752342))))

(assert (=> b!1318397 (= res!874983 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43384 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1318398 () Bool)

(assert (=> b!1318398 (= e!752342 false)))

(declare-fun lt!586467 () Bool)

(declare-fun +!4499 (ListLongMap!20845 tuple2!23188) ListLongMap!20845)

(declare-fun getCurrentListMapNoExtraKeys!6134 (array!88720 array!88722 (_ BitVec 32) (_ BitVec 32) V!52953 V!52953 (_ BitVec 32) Int) ListLongMap!20845)

(declare-fun get!21513 (ValueCell!17045 V!52953) V!52953)

(declare-fun dynLambda!3438 (Int (_ BitVec 64)) V!52953)

(assert (=> b!1318398 (= lt!586467 (contains!8593 (+!4499 (+!4499 (+!4499 (getCurrentListMapNoExtraKeys!6134 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23189 (select (arr!42834 _keys!1609) from!2000) (get!21513 (select (arr!42835 _values!1337) from!2000) (dynLambda!3438 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23189 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23189 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k!1164))))

(declare-fun b!1318399 () Bool)

(assert (=> b!1318399 (= e!752343 (and e!752344 mapRes!55478))))

(declare-fun condMapEmpty!55478 () Bool)

(declare-fun mapDefault!55478 () ValueCell!17045)

