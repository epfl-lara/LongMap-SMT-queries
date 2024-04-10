; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105282 () Bool)

(assert start!105282)

(declare-fun b_free!26977 () Bool)

(declare-fun b_next!26977 () Bool)

(assert (=> start!105282 (= b_free!26977 (not b_next!26977))))

(declare-fun tp!94439 () Bool)

(declare-fun b_and!44803 () Bool)

(assert (=> start!105282 (= tp!94439 b_and!44803)))

(declare-fun b!1254533 () Bool)

(declare-fun e!712878 () Bool)

(declare-fun e!712877 () Bool)

(assert (=> b!1254533 (= e!712878 (not e!712877))))

(declare-fun res!836480 () Bool)

(assert (=> b!1254533 (=> res!836480 e!712877)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1254533 (= res!836480 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!47871 0))(
  ( (V!47872 (val!16002 Int)) )
))
(declare-datatypes ((tuple2!20664 0))(
  ( (tuple2!20665 (_1!10343 (_ BitVec 64)) (_2!10343 V!47871)) )
))
(declare-datatypes ((List!27889 0))(
  ( (Nil!27886) (Cons!27885 (h!29094 tuple2!20664) (t!41372 List!27889)) )
))
(declare-datatypes ((ListLongMap!18537 0))(
  ( (ListLongMap!18538 (toList!9284 List!27889)) )
))
(declare-fun lt!567020 () ListLongMap!18537)

(declare-fun lt!567018 () ListLongMap!18537)

(assert (=> b!1254533 (= lt!567020 lt!567018)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47871)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47871)

(declare-datatypes ((array!81412 0))(
  ( (array!81413 (arr!39267 (Array (_ BitVec 32) (_ BitVec 64))) (size!39803 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81412)

(declare-datatypes ((ValueCell!15176 0))(
  ( (ValueCellFull!15176 (v!18701 V!47871)) (EmptyCell!15176) )
))
(declare-datatypes ((array!81414 0))(
  ( (array!81415 (arr!39268 (Array (_ BitVec 32) ValueCell!15176)) (size!39804 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81414)

(declare-fun minValueBefore!43 () V!47871)

(declare-datatypes ((Unit!41752 0))(
  ( (Unit!41753) )
))
(declare-fun lt!567024 () Unit!41752)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1035 (array!81412 array!81414 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47871 V!47871 V!47871 V!47871 (_ BitVec 32) Int) Unit!41752)

(assert (=> b!1254533 (= lt!567024 (lemmaNoChangeToArrayThenSameMapNoExtras!1035 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5671 (array!81412 array!81414 (_ BitVec 32) (_ BitVec 32) V!47871 V!47871 (_ BitVec 32) Int) ListLongMap!18537)

(assert (=> b!1254533 (= lt!567018 (getCurrentListMapNoExtraKeys!5671 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254533 (= lt!567020 (getCurrentListMapNoExtraKeys!5671 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254534 () Bool)

(assert (=> b!1254534 (= e!712877 true)))

(declare-fun lt!567023 () ListLongMap!18537)

(declare-fun lt!567022 () ListLongMap!18537)

(declare-fun -!2055 (ListLongMap!18537 (_ BitVec 64)) ListLongMap!18537)

(assert (=> b!1254534 (= lt!567023 (-!2055 lt!567022 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!567021 () ListLongMap!18537)

(assert (=> b!1254534 (= (-!2055 lt!567021 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567020)))

(declare-fun lt!567019 () Unit!41752)

(declare-fun addThenRemoveForNewKeyIsSame!325 (ListLongMap!18537 (_ BitVec 64) V!47871) Unit!41752)

(assert (=> b!1254534 (= lt!567019 (addThenRemoveForNewKeyIsSame!325 lt!567020 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!567017 () ListLongMap!18537)

(assert (=> b!1254534 (and (= lt!567022 lt!567021) (= lt!567017 lt!567018))))

(declare-fun +!4178 (ListLongMap!18537 tuple2!20664) ListLongMap!18537)

(assert (=> b!1254534 (= lt!567021 (+!4178 lt!567020 (tuple2!20665 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun getCurrentListMap!4526 (array!81412 array!81414 (_ BitVec 32) (_ BitVec 32) V!47871 V!47871 (_ BitVec 32) Int) ListLongMap!18537)

(assert (=> b!1254534 (= lt!567017 (getCurrentListMap!4526 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254534 (= lt!567022 (getCurrentListMap!4526 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254535 () Bool)

(declare-fun res!836478 () Bool)

(assert (=> b!1254535 (=> (not res!836478) (not e!712878))))

(declare-datatypes ((List!27890 0))(
  ( (Nil!27887) (Cons!27886 (h!29095 (_ BitVec 64)) (t!41373 List!27890)) )
))
(declare-fun arrayNoDuplicates!0 (array!81412 (_ BitVec 32) List!27890) Bool)

(assert (=> b!1254535 (= res!836478 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27887))))

(declare-fun b!1254536 () Bool)

(declare-fun res!836481 () Bool)

(assert (=> b!1254536 (=> (not res!836481) (not e!712878))))

(assert (=> b!1254536 (= res!836481 (and (= (size!39804 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39803 _keys!1118) (size!39804 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1254537 () Bool)

(declare-fun e!712879 () Bool)

(declare-fun tp_is_empty!31879 () Bool)

(assert (=> b!1254537 (= e!712879 tp_is_empty!31879)))

(declare-fun res!836477 () Bool)

(assert (=> start!105282 (=> (not res!836477) (not e!712878))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105282 (= res!836477 (validMask!0 mask!1466))))

(assert (=> start!105282 e!712878))

(assert (=> start!105282 true))

(assert (=> start!105282 tp!94439))

(assert (=> start!105282 tp_is_empty!31879))

(declare-fun array_inv!29935 (array!81412) Bool)

(assert (=> start!105282 (array_inv!29935 _keys!1118)))

(declare-fun e!712876 () Bool)

(declare-fun array_inv!29936 (array!81414) Bool)

(assert (=> start!105282 (and (array_inv!29936 _values!914) e!712876)))

(declare-fun mapNonEmpty!49597 () Bool)

(declare-fun mapRes!49597 () Bool)

(declare-fun tp!94438 () Bool)

(declare-fun e!712875 () Bool)

(assert (=> mapNonEmpty!49597 (= mapRes!49597 (and tp!94438 e!712875))))

(declare-fun mapKey!49597 () (_ BitVec 32))

(declare-fun mapRest!49597 () (Array (_ BitVec 32) ValueCell!15176))

(declare-fun mapValue!49597 () ValueCell!15176)

(assert (=> mapNonEmpty!49597 (= (arr!39268 _values!914) (store mapRest!49597 mapKey!49597 mapValue!49597))))

(declare-fun mapIsEmpty!49597 () Bool)

(assert (=> mapIsEmpty!49597 mapRes!49597))

(declare-fun b!1254538 () Bool)

(assert (=> b!1254538 (= e!712876 (and e!712879 mapRes!49597))))

(declare-fun condMapEmpty!49597 () Bool)

(declare-fun mapDefault!49597 () ValueCell!15176)

