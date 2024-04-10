; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106118 () Bool)

(assert start!106118)

(declare-fun b_free!27511 () Bool)

(declare-fun b_next!27511 () Bool)

(assert (=> start!106118 (= b_free!27511 (not b_next!27511))))

(declare-fun tp!96088 () Bool)

(declare-fun b_and!45507 () Bool)

(assert (=> start!106118 (= tp!96088 b_and!45507)))

(declare-fun b!1263530 () Bool)

(declare-fun e!719375 () Bool)

(declare-fun e!719372 () Bool)

(assert (=> b!1263530 (= e!719375 (not e!719372))))

(declare-fun res!841602 () Bool)

(assert (=> b!1263530 (=> res!841602 e!719372)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1263530 (= res!841602 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!48583 0))(
  ( (V!48584 (val!16269 Int)) )
))
(declare-datatypes ((tuple2!21064 0))(
  ( (tuple2!21065 (_1!10543 (_ BitVec 64)) (_2!10543 V!48583)) )
))
(declare-datatypes ((List!28255 0))(
  ( (Nil!28252) (Cons!28251 (h!29460 tuple2!21064) (t!41770 List!28255)) )
))
(declare-datatypes ((ListLongMap!18937 0))(
  ( (ListLongMap!18938 (toList!9484 List!28255)) )
))
(declare-fun lt!573067 () ListLongMap!18937)

(declare-fun lt!573064 () ListLongMap!18937)

(assert (=> b!1263530 (= lt!573067 lt!573064)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48583)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48583)

(declare-datatypes ((array!82450 0))(
  ( (array!82451 (arr!39770 (Array (_ BitVec 32) (_ BitVec 64))) (size!40306 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82450)

(declare-datatypes ((Unit!42118 0))(
  ( (Unit!42119) )
))
(declare-fun lt!573066 () Unit!42118)

(declare-fun minValueBefore!43 () V!48583)

(declare-datatypes ((ValueCell!15443 0))(
  ( (ValueCellFull!15443 (v!18980 V!48583)) (EmptyCell!15443) )
))
(declare-datatypes ((array!82452 0))(
  ( (array!82453 (arr!39771 (Array (_ BitVec 32) ValueCell!15443)) (size!40307 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82452)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1189 (array!82450 array!82452 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48583 V!48583 V!48583 V!48583 (_ BitVec 32) Int) Unit!42118)

(assert (=> b!1263530 (= lt!573066 (lemmaNoChangeToArrayThenSameMapNoExtras!1189 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5847 (array!82450 array!82452 (_ BitVec 32) (_ BitVec 32) V!48583 V!48583 (_ BitVec 32) Int) ListLongMap!18937)

(assert (=> b!1263530 (= lt!573064 (getCurrentListMapNoExtraKeys!5847 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1263530 (= lt!573067 (getCurrentListMapNoExtraKeys!5847 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!50446 () Bool)

(declare-fun mapRes!50446 () Bool)

(declare-fun tp!96089 () Bool)

(declare-fun e!719373 () Bool)

(assert (=> mapNonEmpty!50446 (= mapRes!50446 (and tp!96089 e!719373))))

(declare-fun mapValue!50446 () ValueCell!15443)

(declare-fun mapKey!50446 () (_ BitVec 32))

(declare-fun mapRest!50446 () (Array (_ BitVec 32) ValueCell!15443))

(assert (=> mapNonEmpty!50446 (= (arr!39771 _values!914) (store mapRest!50446 mapKey!50446 mapValue!50446))))

(declare-fun b!1263532 () Bool)

(declare-fun getCurrentListMap!4651 (array!82450 array!82452 (_ BitVec 32) (_ BitVec 32) V!48583 V!48583 (_ BitVec 32) Int) ListLongMap!18937)

(declare-fun +!4254 (ListLongMap!18937 tuple2!21064) ListLongMap!18937)

(assert (=> b!1263532 (= e!719372 (= (getCurrentListMap!4651 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (+!4254 (+!4254 lt!573067 (tuple2!21065 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)) (tuple2!21065 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lt!573065 () ListLongMap!18937)

(assert (=> b!1263532 (= lt!573065 (getCurrentListMap!4651 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1263533 () Bool)

(declare-fun res!841604 () Bool)

(assert (=> b!1263533 (=> (not res!841604) (not e!719375))))

(assert (=> b!1263533 (= res!841604 (and (= (size!40307 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40306 _keys!1118) (size!40307 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263534 () Bool)

(declare-fun e!719371 () Bool)

(declare-fun e!719374 () Bool)

(assert (=> b!1263534 (= e!719371 (and e!719374 mapRes!50446))))

(declare-fun condMapEmpty!50446 () Bool)

(declare-fun mapDefault!50446 () ValueCell!15443)

