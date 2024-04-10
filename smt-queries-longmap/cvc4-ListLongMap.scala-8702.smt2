; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105650 () Bool)

(assert start!105650)

(declare-fun b_free!27251 () Bool)

(declare-fun b_next!27251 () Bool)

(assert (=> start!105650 (= b_free!27251 (not b_next!27251))))

(declare-fun tp!95275 () Bool)

(declare-fun b_and!45125 () Bool)

(assert (=> start!105650 (= tp!95275 b_and!45125)))

(declare-fun mapNonEmpty!50023 () Bool)

(declare-fun mapRes!50023 () Bool)

(declare-fun tp!95276 () Bool)

(declare-fun e!715771 () Bool)

(assert (=> mapNonEmpty!50023 (= mapRes!50023 (and tp!95276 e!715771))))

(declare-datatypes ((V!48235 0))(
  ( (V!48236 (val!16139 Int)) )
))
(declare-datatypes ((ValueCell!15313 0))(
  ( (ValueCellFull!15313 (v!18841 V!48235)) (EmptyCell!15313) )
))
(declare-fun mapRest!50023 () (Array (_ BitVec 32) ValueCell!15313))

(declare-fun mapKey!50023 () (_ BitVec 32))

(declare-fun mapValue!50023 () ValueCell!15313)

(declare-datatypes ((array!81926 0))(
  ( (array!81927 (arr!39519 (Array (_ BitVec 32) ValueCell!15313)) (size!40055 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81926)

(assert (=> mapNonEmpty!50023 (= (arr!39519 _values!914) (store mapRest!50023 mapKey!50023 mapValue!50023))))

(declare-fun b!1258489 () Bool)

(declare-fun e!715775 () Bool)

(declare-fun e!715773 () Bool)

(assert (=> b!1258489 (= e!715775 (not e!715773))))

(declare-fun res!838802 () Bool)

(assert (=> b!1258489 (=> res!838802 e!715773)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1258489 (= res!838802 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20846 0))(
  ( (tuple2!20847 (_1!10434 (_ BitVec 64)) (_2!10434 V!48235)) )
))
(declare-datatypes ((List!28061 0))(
  ( (Nil!28058) (Cons!28057 (h!29266 tuple2!20846) (t!41554 List!28061)) )
))
(declare-datatypes ((ListLongMap!18719 0))(
  ( (ListLongMap!18720 (toList!9375 List!28061)) )
))
(declare-fun lt!569227 () ListLongMap!18719)

(declare-fun lt!569228 () ListLongMap!18719)

(assert (=> b!1258489 (= lt!569227 lt!569228)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48235)

(declare-datatypes ((Unit!41932 0))(
  ( (Unit!41933) )
))
(declare-fun lt!569230 () Unit!41932)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48235)

(declare-datatypes ((array!81928 0))(
  ( (array!81929 (arr!39520 (Array (_ BitVec 32) (_ BitVec 64))) (size!40056 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81928)

(declare-fun minValueBefore!43 () V!48235)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1116 (array!81928 array!81926 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48235 V!48235 V!48235 V!48235 (_ BitVec 32) Int) Unit!41932)

(assert (=> b!1258489 (= lt!569230 (lemmaNoChangeToArrayThenSameMapNoExtras!1116 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5752 (array!81928 array!81926 (_ BitVec 32) (_ BitVec 32) V!48235 V!48235 (_ BitVec 32) Int) ListLongMap!18719)

(assert (=> b!1258489 (= lt!569228 (getCurrentListMapNoExtraKeys!5752 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258489 (= lt!569227 (getCurrentListMapNoExtraKeys!5752 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258490 () Bool)

(declare-fun res!838799 () Bool)

(assert (=> b!1258490 (=> (not res!838799) (not e!715775))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81928 (_ BitVec 32)) Bool)

(assert (=> b!1258490 (= res!838799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1258491 () Bool)

(declare-fun res!838801 () Bool)

(assert (=> b!1258491 (=> (not res!838801) (not e!715775))))

(assert (=> b!1258491 (= res!838801 (and (= (size!40055 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40056 _keys!1118) (size!40055 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1258492 () Bool)

(declare-fun res!838798 () Bool)

(assert (=> b!1258492 (=> (not res!838798) (not e!715775))))

(declare-datatypes ((List!28062 0))(
  ( (Nil!28059) (Cons!28058 (h!29267 (_ BitVec 64)) (t!41555 List!28062)) )
))
(declare-fun arrayNoDuplicates!0 (array!81928 (_ BitVec 32) List!28062) Bool)

(assert (=> b!1258492 (= res!838798 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28059))))

(declare-fun mapIsEmpty!50023 () Bool)

(assert (=> mapIsEmpty!50023 mapRes!50023))

(declare-fun b!1258493 () Bool)

(declare-fun tp_is_empty!32153 () Bool)

(assert (=> b!1258493 (= e!715771 tp_is_empty!32153)))

(declare-fun b!1258495 () Bool)

(declare-fun e!715770 () Bool)

(assert (=> b!1258495 (= e!715770 tp_is_empty!32153)))

(declare-fun b!1258496 () Bool)

(declare-fun e!715772 () Bool)

(assert (=> b!1258496 (= e!715772 (and e!715770 mapRes!50023))))

(declare-fun condMapEmpty!50023 () Bool)

(declare-fun mapDefault!50023 () ValueCell!15313)

