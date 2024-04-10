; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111530 () Bool)

(assert start!111530)

(declare-fun b_free!30187 () Bool)

(declare-fun b_next!30187 () Bool)

(assert (=> start!111530 (= b_free!30187 (not b_next!30187))))

(declare-fun tp!106037 () Bool)

(declare-fun b_and!48533 () Bool)

(assert (=> start!111530 (= tp!106037 b_and!48533)))

(declare-fun b!1320490 () Bool)

(declare-fun e!753242 () Bool)

(declare-fun from!2000 () (_ BitVec 32))

(assert (=> b!1320490 (= e!753242 (not (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!53113 0))(
  ( (V!53114 (val!18078 Int)) )
))
(declare-datatypes ((tuple2!23278 0))(
  ( (tuple2!23279 (_1!11650 (_ BitVec 64)) (_2!11650 V!53113)) )
))
(declare-datatypes ((List!30428 0))(
  ( (Nil!30425) (Cons!30424 (h!31633 tuple2!23278) (t!44164 List!30428)) )
))
(declare-datatypes ((ListLongMap!20935 0))(
  ( (ListLongMap!20936 (toList!10483 List!30428)) )
))
(declare-fun lt!586969 () ListLongMap!20935)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun contains!8638 (ListLongMap!20935 (_ BitVec 64)) Bool)

(assert (=> b!1320490 (contains!8638 lt!586969 k!1164)))

(declare-fun zeroValue!1279 () V!53113)

(declare-datatypes ((Unit!43504 0))(
  ( (Unit!43505) )
))
(declare-fun lt!586970 () Unit!43504)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!138 ((_ BitVec 64) (_ BitVec 64) V!53113 ListLongMap!20935) Unit!43504)

(assert (=> b!1320490 (= lt!586970 (lemmaInListMapAfterAddingDiffThenInBefore!138 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!586969))))

(declare-fun lt!586971 () ListLongMap!20935)

(assert (=> b!1320490 (contains!8638 lt!586971 k!1164)))

(declare-fun lt!586968 () Unit!43504)

(declare-fun minValue!1279 () V!53113)

(assert (=> b!1320490 (= lt!586968 (lemmaInListMapAfterAddingDiffThenInBefore!138 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586971))))

(declare-fun +!4542 (ListLongMap!20935 tuple2!23278) ListLongMap!20935)

(assert (=> b!1320490 (= lt!586971 (+!4542 lt!586969 (tuple2!23279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-datatypes ((array!88944 0))(
  ( (array!88945 (arr!42946 (Array (_ BitVec 32) (_ BitVec 64))) (size!43496 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88944)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17105 0))(
  ( (ValueCellFull!17105 (v!20708 V!53113)) (EmptyCell!17105) )
))
(declare-datatypes ((array!88946 0))(
  ( (array!88947 (arr!42947 (Array (_ BitVec 32) ValueCell!17105)) (size!43497 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88946)

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6177 (array!88944 array!88946 (_ BitVec 32) (_ BitVec 32) V!53113 V!53113 (_ BitVec 32) Int) ListLongMap!20935)

(declare-fun get!21596 (ValueCell!17105 V!53113) V!53113)

(declare-fun dynLambda!3481 (Int (_ BitVec 64)) V!53113)

(assert (=> b!1320490 (= lt!586969 (+!4542 (getCurrentListMapNoExtraKeys!6177 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23279 (select (arr!42946 _keys!1609) from!2000) (get!21596 (select (arr!42947 _values!1337) from!2000) (dynLambda!3481 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1320491 () Bool)

(declare-fun e!753240 () Bool)

(declare-fun tp_is_empty!36007 () Bool)

(assert (=> b!1320491 (= e!753240 tp_is_empty!36007)))

(declare-fun b!1320492 () Bool)

(declare-fun res!876426 () Bool)

(assert (=> b!1320492 (=> (not res!876426) (not e!753242))))

(declare-datatypes ((List!30429 0))(
  ( (Nil!30426) (Cons!30425 (h!31634 (_ BitVec 64)) (t!44165 List!30429)) )
))
(declare-fun arrayNoDuplicates!0 (array!88944 (_ BitVec 32) List!30429) Bool)

(assert (=> b!1320492 (= res!876426 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30426))))

(declare-fun b!1320493 () Bool)

(declare-fun res!876422 () Bool)

(assert (=> b!1320493 (=> (not res!876422) (not e!753242))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1320493 (= res!876422 (validKeyInArray!0 (select (arr!42946 _keys!1609) from!2000)))))

(declare-fun b!1320494 () Bool)

(declare-fun res!876428 () Bool)

(assert (=> b!1320494 (=> (not res!876428) (not e!753242))))

(assert (=> b!1320494 (= res!876428 (and (= (size!43497 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43496 _keys!1609) (size!43497 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!55658 () Bool)

(declare-fun mapRes!55658 () Bool)

(assert (=> mapIsEmpty!55658 mapRes!55658))

(declare-fun res!876427 () Bool)

(assert (=> start!111530 (=> (not res!876427) (not e!753242))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111530 (= res!876427 (validMask!0 mask!2019))))

(assert (=> start!111530 e!753242))

(declare-fun array_inv!32425 (array!88944) Bool)

(assert (=> start!111530 (array_inv!32425 _keys!1609)))

(assert (=> start!111530 true))

(assert (=> start!111530 tp_is_empty!36007))

(declare-fun e!753244 () Bool)

(declare-fun array_inv!32426 (array!88946) Bool)

(assert (=> start!111530 (and (array_inv!32426 _values!1337) e!753244)))

(assert (=> start!111530 tp!106037))

(declare-fun b!1320495 () Bool)

(declare-fun res!876423 () Bool)

(assert (=> b!1320495 (=> (not res!876423) (not e!753242))))

(assert (=> b!1320495 (= res!876423 (not (= (select (arr!42946 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1320496 () Bool)

(declare-fun res!876421 () Bool)

(assert (=> b!1320496 (=> (not res!876421) (not e!753242))))

(declare-fun getCurrentListMap!5488 (array!88944 array!88946 (_ BitVec 32) (_ BitVec 32) V!53113 V!53113 (_ BitVec 32) Int) ListLongMap!20935)

(assert (=> b!1320496 (= res!876421 (contains!8638 (getCurrentListMap!5488 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1320497 () Bool)

(declare-fun res!876424 () Bool)

(assert (=> b!1320497 (=> (not res!876424) (not e!753242))))

(assert (=> b!1320497 (= res!876424 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43496 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1320498 () Bool)

(declare-fun e!753243 () Bool)

(assert (=> b!1320498 (= e!753243 tp_is_empty!36007)))

(declare-fun mapNonEmpty!55658 () Bool)

(declare-fun tp!106036 () Bool)

(assert (=> mapNonEmpty!55658 (= mapRes!55658 (and tp!106036 e!753240))))

(declare-fun mapKey!55658 () (_ BitVec 32))

(declare-fun mapRest!55658 () (Array (_ BitVec 32) ValueCell!17105))

(declare-fun mapValue!55658 () ValueCell!17105)

(assert (=> mapNonEmpty!55658 (= (arr!42947 _values!1337) (store mapRest!55658 mapKey!55658 mapValue!55658))))

(declare-fun b!1320499 () Bool)

(declare-fun res!876425 () Bool)

(assert (=> b!1320499 (=> (not res!876425) (not e!753242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88944 (_ BitVec 32)) Bool)

(assert (=> b!1320499 (= res!876425 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1320500 () Bool)

(assert (=> b!1320500 (= e!753244 (and e!753243 mapRes!55658))))

(declare-fun condMapEmpty!55658 () Bool)

(declare-fun mapDefault!55658 () ValueCell!17105)

