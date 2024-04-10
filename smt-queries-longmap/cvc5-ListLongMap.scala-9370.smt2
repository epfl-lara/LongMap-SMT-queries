; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111656 () Bool)

(assert start!111656)

(declare-fun b_free!30313 () Bool)

(declare-fun b_next!30313 () Bool)

(assert (=> start!111656 (= b_free!30313 (not b_next!30313))))

(declare-fun tp!106415 () Bool)

(declare-fun b_and!48785 () Bool)

(assert (=> start!111656 (= tp!106415 b_and!48785)))

(declare-fun res!877935 () Bool)

(declare-fun e!754185 () Bool)

(assert (=> start!111656 (=> (not res!877935) (not e!754185))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111656 (= res!877935 (validMask!0 mask!2019))))

(assert (=> start!111656 e!754185))

(declare-datatypes ((array!89186 0))(
  ( (array!89187 (arr!43067 (Array (_ BitVec 32) (_ BitVec 64))) (size!43617 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89186)

(declare-fun array_inv!32517 (array!89186) Bool)

(assert (=> start!111656 (array_inv!32517 _keys!1609)))

(assert (=> start!111656 true))

(declare-fun tp_is_empty!36133 () Bool)

(assert (=> start!111656 tp_is_empty!36133))

(declare-datatypes ((V!53281 0))(
  ( (V!53282 (val!18141 Int)) )
))
(declare-datatypes ((ValueCell!17168 0))(
  ( (ValueCellFull!17168 (v!20771 V!53281)) (EmptyCell!17168) )
))
(declare-datatypes ((array!89188 0))(
  ( (array!89189 (arr!43068 (Array (_ BitVec 32) ValueCell!17168)) (size!43618 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89188)

(declare-fun e!754188 () Bool)

(declare-fun array_inv!32518 (array!89188) Bool)

(assert (=> start!111656 (and (array_inv!32518 _values!1337) e!754188)))

(assert (=> start!111656 tp!106415))

(declare-fun b!1322695 () Bool)

(declare-fun res!877937 () Bool)

(assert (=> b!1322695 (=> (not res!877937) (not e!754185))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1322695 (= res!877937 (validKeyInArray!0 (select (arr!43067 _keys!1609) from!2000)))))

(declare-fun mapIsEmpty!55847 () Bool)

(declare-fun mapRes!55847 () Bool)

(assert (=> mapIsEmpty!55847 mapRes!55847))

(declare-fun b!1322696 () Bool)

(declare-fun res!877940 () Bool)

(assert (=> b!1322696 (=> (not res!877940) (not e!754185))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1322696 (= res!877940 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43617 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1322697 () Bool)

(declare-fun res!877933 () Bool)

(assert (=> b!1322697 (=> (not res!877933) (not e!754185))))

(declare-datatypes ((List!30521 0))(
  ( (Nil!30518) (Cons!30517 (h!31726 (_ BitVec 64)) (t!44383 List!30521)) )
))
(declare-fun arrayNoDuplicates!0 (array!89186 (_ BitVec 32) List!30521) Bool)

(assert (=> b!1322697 (= res!877933 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30518))))

(declare-fun b!1322698 () Bool)

(declare-fun res!877939 () Bool)

(assert (=> b!1322698 (=> (not res!877939) (not e!754185))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89186 (_ BitVec 32)) Bool)

(assert (=> b!1322698 (= res!877939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1322699 () Bool)

(declare-fun res!877938 () Bool)

(assert (=> b!1322699 (=> (not res!877938) (not e!754185))))

(assert (=> b!1322699 (= res!877938 (not (= (select (arr!43067 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1322700 () Bool)

(declare-fun e!754189 () Bool)

(assert (=> b!1322700 (= e!754189 tp_is_empty!36133)))

(declare-fun b!1322701 () Bool)

(assert (=> b!1322701 (= e!754185 (not (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!23376 0))(
  ( (tuple2!23377 (_1!11699 (_ BitVec 64)) (_2!11699 V!53281)) )
))
(declare-datatypes ((List!30522 0))(
  ( (Nil!30519) (Cons!30518 (h!31727 tuple2!23376) (t!44384 List!30522)) )
))
(declare-datatypes ((ListLongMap!21033 0))(
  ( (ListLongMap!21034 (toList!10532 List!30522)) )
))
(declare-fun lt!588372 () ListLongMap!21033)

(declare-fun lt!588364 () tuple2!23376)

(declare-fun contains!8687 (ListLongMap!21033 (_ BitVec 64)) Bool)

(declare-fun +!4584 (ListLongMap!21033 tuple2!23376) ListLongMap!21033)

(assert (=> b!1322701 (contains!8687 (+!4584 lt!588372 lt!588364) k!1164)))

(declare-fun zeroValue!1279 () V!53281)

(declare-datatypes ((Unit!43588 0))(
  ( (Unit!43589) )
))
(declare-fun lt!588368 () Unit!43588)

(declare-fun addStillContains!1133 (ListLongMap!21033 (_ BitVec 64) V!53281 (_ BitVec 64)) Unit!43588)

(assert (=> b!1322701 (= lt!588368 (addStillContains!1133 lt!588372 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k!1164))))

(assert (=> b!1322701 (contains!8687 lt!588372 k!1164)))

(declare-fun lt!588367 () V!53281)

(declare-fun lt!588366 () Unit!43588)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!180 ((_ BitVec 64) (_ BitVec 64) V!53281 ListLongMap!21033) Unit!43588)

(assert (=> b!1322701 (= lt!588366 (lemmaInListMapAfterAddingDiffThenInBefore!180 k!1164 (select (arr!43067 _keys!1609) from!2000) lt!588367 lt!588372))))

(declare-fun lt!588371 () ListLongMap!21033)

(assert (=> b!1322701 (contains!8687 lt!588371 k!1164)))

(declare-fun lt!588365 () Unit!43588)

(assert (=> b!1322701 (= lt!588365 (lemmaInListMapAfterAddingDiffThenInBefore!180 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588371))))

(declare-fun lt!588369 () ListLongMap!21033)

(assert (=> b!1322701 (contains!8687 lt!588369 k!1164)))

(declare-fun lt!588370 () Unit!43588)

(declare-fun minValue!1279 () V!53281)

(assert (=> b!1322701 (= lt!588370 (lemmaInListMapAfterAddingDiffThenInBefore!180 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588369))))

(assert (=> b!1322701 (= lt!588369 (+!4584 lt!588371 lt!588364))))

(assert (=> b!1322701 (= lt!588364 (tuple2!23377 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1322701 (= lt!588371 (+!4584 lt!588372 (tuple2!23377 (select (arr!43067 _keys!1609) from!2000) lt!588367)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21680 (ValueCell!17168 V!53281) V!53281)

(declare-fun dynLambda!3523 (Int (_ BitVec 64)) V!53281)

(assert (=> b!1322701 (= lt!588367 (get!21680 (select (arr!43068 _values!1337) from!2000) (dynLambda!3523 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6219 (array!89186 array!89188 (_ BitVec 32) (_ BitVec 32) V!53281 V!53281 (_ BitVec 32) Int) ListLongMap!21033)

(assert (=> b!1322701 (= lt!588372 (getCurrentListMapNoExtraKeys!6219 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1322702 () Bool)

(declare-fun res!877936 () Bool)

(assert (=> b!1322702 (=> (not res!877936) (not e!754185))))

(declare-fun getCurrentListMap!5532 (array!89186 array!89188 (_ BitVec 32) (_ BitVec 32) V!53281 V!53281 (_ BitVec 32) Int) ListLongMap!21033)

(assert (=> b!1322702 (= res!877936 (contains!8687 (getCurrentListMap!5532 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun mapNonEmpty!55847 () Bool)

(declare-fun tp!106414 () Bool)

(assert (=> mapNonEmpty!55847 (= mapRes!55847 (and tp!106414 e!754189))))

(declare-fun mapKey!55847 () (_ BitVec 32))

(declare-fun mapValue!55847 () ValueCell!17168)

(declare-fun mapRest!55847 () (Array (_ BitVec 32) ValueCell!17168))

(assert (=> mapNonEmpty!55847 (= (arr!43068 _values!1337) (store mapRest!55847 mapKey!55847 mapValue!55847))))

(declare-fun b!1322703 () Bool)

(declare-fun res!877934 () Bool)

(assert (=> b!1322703 (=> (not res!877934) (not e!754185))))

(assert (=> b!1322703 (= res!877934 (and (= (size!43618 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43617 _keys!1609) (size!43618 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1322704 () Bool)

(declare-fun e!754187 () Bool)

(assert (=> b!1322704 (= e!754188 (and e!754187 mapRes!55847))))

(declare-fun condMapEmpty!55847 () Bool)

(declare-fun mapDefault!55847 () ValueCell!17168)

