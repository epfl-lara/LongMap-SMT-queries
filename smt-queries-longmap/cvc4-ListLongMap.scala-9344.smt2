; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111504 () Bool)

(assert start!111504)

(declare-fun b_free!30161 () Bool)

(declare-fun b_next!30161 () Bool)

(assert (=> start!111504 (= b_free!30161 (not b_next!30161))))

(declare-fun tp!105959 () Bool)

(declare-fun b_and!48481 () Bool)

(assert (=> start!111504 (= tp!105959 b_and!48481)))

(declare-fun b!1320035 () Bool)

(declare-fun res!876114 () Bool)

(declare-fun e!753048 () Bool)

(assert (=> b!1320035 (=> (not res!876114) (not e!753048))))

(declare-datatypes ((array!88894 0))(
  ( (array!88895 (arr!42921 (Array (_ BitVec 32) (_ BitVec 64))) (size!43471 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88894)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53077 0))(
  ( (V!53078 (val!18065 Int)) )
))
(declare-datatypes ((ValueCell!17092 0))(
  ( (ValueCellFull!17092 (v!20695 V!53077)) (EmptyCell!17092) )
))
(declare-datatypes ((array!88896 0))(
  ( (array!88897 (arr!42922 (Array (_ BitVec 32) ValueCell!17092)) (size!43472 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88896)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1320035 (= res!876114 (and (= (size!43472 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43471 _keys!1609) (size!43472 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1320036 () Bool)

(declare-fun res!876115 () Bool)

(assert (=> b!1320036 (=> (not res!876115) (not e!753048))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1320036 (= res!876115 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43471 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!55619 () Bool)

(declare-fun mapRes!55619 () Bool)

(assert (=> mapIsEmpty!55619 mapRes!55619))

(declare-fun b!1320037 () Bool)

(declare-fun res!876113 () Bool)

(assert (=> b!1320037 (=> (not res!876113) (not e!753048))))

(assert (=> b!1320037 (= res!876113 (not (= (select (arr!42921 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1320038 () Bool)

(declare-fun res!876116 () Bool)

(assert (=> b!1320038 (=> (not res!876116) (not e!753048))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88894 (_ BitVec 32)) Bool)

(assert (=> b!1320038 (= res!876116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1320039 () Bool)

(assert (=> b!1320039 (= e!753048 (not true))))

(declare-datatypes ((tuple2!23256 0))(
  ( (tuple2!23257 (_1!11639 (_ BitVec 64)) (_2!11639 V!53077)) )
))
(declare-datatypes ((List!30408 0))(
  ( (Nil!30405) (Cons!30404 (h!31613 tuple2!23256) (t!44118 List!30408)) )
))
(declare-datatypes ((ListLongMap!20913 0))(
  ( (ListLongMap!20914 (toList!10472 List!30408)) )
))
(declare-fun lt!586815 () ListLongMap!20913)

(declare-fun contains!8627 (ListLongMap!20913 (_ BitVec 64)) Bool)

(assert (=> b!1320039 (contains!8627 lt!586815 k!1164)))

(declare-fun zeroValue!1279 () V!53077)

(declare-datatypes ((Unit!43482 0))(
  ( (Unit!43483) )
))
(declare-fun lt!586813 () Unit!43482)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!127 ((_ BitVec 64) (_ BitVec 64) V!53077 ListLongMap!20913) Unit!43482)

(assert (=> b!1320039 (= lt!586813 (lemmaInListMapAfterAddingDiffThenInBefore!127 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!586815))))

(declare-fun lt!586814 () ListLongMap!20913)

(assert (=> b!1320039 (contains!8627 lt!586814 k!1164)))

(declare-fun lt!586812 () Unit!43482)

(declare-fun minValue!1279 () V!53077)

(assert (=> b!1320039 (= lt!586812 (lemmaInListMapAfterAddingDiffThenInBefore!127 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586814))))

(declare-fun +!4531 (ListLongMap!20913 tuple2!23256) ListLongMap!20913)

(assert (=> b!1320039 (= lt!586814 (+!4531 lt!586815 (tuple2!23257 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6166 (array!88894 array!88896 (_ BitVec 32) (_ BitVec 32) V!53077 V!53077 (_ BitVec 32) Int) ListLongMap!20913)

(declare-fun get!21575 (ValueCell!17092 V!53077) V!53077)

(declare-fun dynLambda!3470 (Int (_ BitVec 64)) V!53077)

(assert (=> b!1320039 (= lt!586815 (+!4531 (getCurrentListMapNoExtraKeys!6166 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23257 (select (arr!42921 _keys!1609) from!2000) (get!21575 (select (arr!42922 _values!1337) from!2000) (dynLambda!3470 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1320040 () Bool)

(declare-fun e!753049 () Bool)

(declare-fun tp_is_empty!35981 () Bool)

(assert (=> b!1320040 (= e!753049 tp_is_empty!35981)))

(declare-fun b!1320041 () Bool)

(declare-fun res!876111 () Bool)

(assert (=> b!1320041 (=> (not res!876111) (not e!753048))))

(declare-fun getCurrentListMap!5480 (array!88894 array!88896 (_ BitVec 32) (_ BitVec 32) V!53077 V!53077 (_ BitVec 32) Int) ListLongMap!20913)

(assert (=> b!1320041 (= res!876111 (contains!8627 (getCurrentListMap!5480 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1320043 () Bool)

(declare-fun res!876109 () Bool)

(assert (=> b!1320043 (=> (not res!876109) (not e!753048))))

(declare-datatypes ((List!30409 0))(
  ( (Nil!30406) (Cons!30405 (h!31614 (_ BitVec 64)) (t!44119 List!30409)) )
))
(declare-fun arrayNoDuplicates!0 (array!88894 (_ BitVec 32) List!30409) Bool)

(assert (=> b!1320043 (= res!876109 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30406))))

(declare-fun mapNonEmpty!55619 () Bool)

(declare-fun tp!105958 () Bool)

(declare-fun e!753046 () Bool)

(assert (=> mapNonEmpty!55619 (= mapRes!55619 (and tp!105958 e!753046))))

(declare-fun mapRest!55619 () (Array (_ BitVec 32) ValueCell!17092))

(declare-fun mapKey!55619 () (_ BitVec 32))

(declare-fun mapValue!55619 () ValueCell!17092)

(assert (=> mapNonEmpty!55619 (= (arr!42922 _values!1337) (store mapRest!55619 mapKey!55619 mapValue!55619))))

(declare-fun b!1320044 () Bool)

(assert (=> b!1320044 (= e!753046 tp_is_empty!35981)))

(declare-fun b!1320045 () Bool)

(declare-fun e!753045 () Bool)

(assert (=> b!1320045 (= e!753045 (and e!753049 mapRes!55619))))

(declare-fun condMapEmpty!55619 () Bool)

(declare-fun mapDefault!55619 () ValueCell!17092)

