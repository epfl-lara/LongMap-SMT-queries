; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105278 () Bool)

(assert start!105278)

(declare-fun b_free!26973 () Bool)

(declare-fun b_next!26973 () Bool)

(assert (=> start!105278 (= b_free!26973 (not b_next!26973))))

(declare-fun tp!94427 () Bool)

(declare-fun b_and!44799 () Bool)

(assert (=> start!105278 (= tp!94427 b_and!44799)))

(declare-fun b!1254485 () Bool)

(declare-fun e!712843 () Bool)

(declare-fun tp_is_empty!31875 () Bool)

(assert (=> b!1254485 (= e!712843 tp_is_empty!31875)))

(declare-fun b!1254486 () Bool)

(declare-fun res!836448 () Bool)

(declare-fun e!712844 () Bool)

(assert (=> b!1254486 (=> (not res!836448) (not e!712844))))

(declare-datatypes ((array!81404 0))(
  ( (array!81405 (arr!39263 (Array (_ BitVec 32) (_ BitVec 64))) (size!39799 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81404)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81404 (_ BitVec 32)) Bool)

(assert (=> b!1254486 (= res!836448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1254488 () Bool)

(declare-fun res!836451 () Bool)

(assert (=> b!1254488 (=> (not res!836451) (not e!712844))))

(declare-datatypes ((List!27885 0))(
  ( (Nil!27882) (Cons!27881 (h!29090 (_ BitVec 64)) (t!41368 List!27885)) )
))
(declare-fun arrayNoDuplicates!0 (array!81404 (_ BitVec 32) List!27885) Bool)

(assert (=> b!1254488 (= res!836451 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27882))))

(declare-fun b!1254489 () Bool)

(declare-fun e!712842 () Bool)

(assert (=> b!1254489 (= e!712842 true)))

(declare-datatypes ((V!47865 0))(
  ( (V!47866 (val!16000 Int)) )
))
(declare-datatypes ((tuple2!20660 0))(
  ( (tuple2!20661 (_1!10341 (_ BitVec 64)) (_2!10341 V!47865)) )
))
(declare-datatypes ((List!27886 0))(
  ( (Nil!27883) (Cons!27882 (h!29091 tuple2!20660) (t!41369 List!27886)) )
))
(declare-datatypes ((ListLongMap!18533 0))(
  ( (ListLongMap!18534 (toList!9282 List!27886)) )
))
(declare-fun lt!566971 () ListLongMap!18533)

(declare-fun lt!566976 () ListLongMap!18533)

(declare-fun -!2053 (ListLongMap!18533 (_ BitVec 64)) ListLongMap!18533)

(assert (=> b!1254489 (= lt!566971 (-!2053 lt!566976 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!566974 () ListLongMap!18533)

(declare-fun lt!566973 () ListLongMap!18533)

(assert (=> b!1254489 (= (-!2053 lt!566974 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566973)))

(declare-datatypes ((Unit!41748 0))(
  ( (Unit!41749) )
))
(declare-fun lt!566972 () Unit!41748)

(declare-fun minValueBefore!43 () V!47865)

(declare-fun addThenRemoveForNewKeyIsSame!323 (ListLongMap!18533 (_ BitVec 64) V!47865) Unit!41748)

(assert (=> b!1254489 (= lt!566972 (addThenRemoveForNewKeyIsSame!323 lt!566973 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!566975 () ListLongMap!18533)

(declare-fun lt!566970 () ListLongMap!18533)

(assert (=> b!1254489 (and (= lt!566976 lt!566974) (= lt!566975 lt!566970))))

(declare-fun +!4176 (ListLongMap!18533 tuple2!20660) ListLongMap!18533)

(assert (=> b!1254489 (= lt!566974 (+!4176 lt!566973 (tuple2!20661 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun minValueAfter!43 () V!47865)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47865)

(declare-datatypes ((ValueCell!15174 0))(
  ( (ValueCellFull!15174 (v!18699 V!47865)) (EmptyCell!15174) )
))
(declare-datatypes ((array!81406 0))(
  ( (array!81407 (arr!39264 (Array (_ BitVec 32) ValueCell!15174)) (size!39800 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81406)

(declare-fun defaultEntry!922 () Int)

(declare-fun getCurrentListMap!4524 (array!81404 array!81406 (_ BitVec 32) (_ BitVec 32) V!47865 V!47865 (_ BitVec 32) Int) ListLongMap!18533)

(assert (=> b!1254489 (= lt!566975 (getCurrentListMap!4524 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1254489 (= lt!566976 (getCurrentListMap!4524 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254490 () Bool)

(assert (=> b!1254490 (= e!712844 (not e!712842))))

(declare-fun res!836447 () Bool)

(assert (=> b!1254490 (=> res!836447 e!712842)))

(assert (=> b!1254490 (= res!836447 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1254490 (= lt!566973 lt!566970)))

(declare-fun lt!566969 () Unit!41748)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1033 (array!81404 array!81406 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47865 V!47865 V!47865 V!47865 (_ BitVec 32) Int) Unit!41748)

(assert (=> b!1254490 (= lt!566969 (lemmaNoChangeToArrayThenSameMapNoExtras!1033 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5669 (array!81404 array!81406 (_ BitVec 32) (_ BitVec 32) V!47865 V!47865 (_ BitVec 32) Int) ListLongMap!18533)

(assert (=> b!1254490 (= lt!566970 (getCurrentListMapNoExtraKeys!5669 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254490 (= lt!566973 (getCurrentListMapNoExtraKeys!5669 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49591 () Bool)

(declare-fun mapRes!49591 () Bool)

(declare-fun tp!94426 () Bool)

(declare-fun e!712841 () Bool)

(assert (=> mapNonEmpty!49591 (= mapRes!49591 (and tp!94426 e!712841))))

(declare-fun mapRest!49591 () (Array (_ BitVec 32) ValueCell!15174))

(declare-fun mapKey!49591 () (_ BitVec 32))

(declare-fun mapValue!49591 () ValueCell!15174)

(assert (=> mapNonEmpty!49591 (= (arr!39264 _values!914) (store mapRest!49591 mapKey!49591 mapValue!49591))))

(declare-fun b!1254491 () Bool)

(declare-fun res!836449 () Bool)

(assert (=> b!1254491 (=> (not res!836449) (not e!712844))))

(assert (=> b!1254491 (= res!836449 (and (= (size!39800 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39799 _keys!1118) (size!39800 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!49591 () Bool)

(assert (=> mapIsEmpty!49591 mapRes!49591))

(declare-fun b!1254492 () Bool)

(declare-fun e!712840 () Bool)

(assert (=> b!1254492 (= e!712840 (and e!712843 mapRes!49591))))

(declare-fun condMapEmpty!49591 () Bool)

(declare-fun mapDefault!49591 () ValueCell!15174)

(assert (=> b!1254492 (= condMapEmpty!49591 (= (arr!39264 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15174)) mapDefault!49591)))))

(declare-fun b!1254487 () Bool)

(assert (=> b!1254487 (= e!712841 tp_is_empty!31875)))

(declare-fun res!836450 () Bool)

(assert (=> start!105278 (=> (not res!836450) (not e!712844))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105278 (= res!836450 (validMask!0 mask!1466))))

(assert (=> start!105278 e!712844))

(assert (=> start!105278 true))

(assert (=> start!105278 tp!94427))

(assert (=> start!105278 tp_is_empty!31875))

(declare-fun array_inv!29931 (array!81404) Bool)

(assert (=> start!105278 (array_inv!29931 _keys!1118)))

(declare-fun array_inv!29932 (array!81406) Bool)

(assert (=> start!105278 (and (array_inv!29932 _values!914) e!712840)))

(assert (= (and start!105278 res!836450) b!1254491))

(assert (= (and b!1254491 res!836449) b!1254486))

(assert (= (and b!1254486 res!836448) b!1254488))

(assert (= (and b!1254488 res!836451) b!1254490))

(assert (= (and b!1254490 (not res!836447)) b!1254489))

(assert (= (and b!1254492 condMapEmpty!49591) mapIsEmpty!49591))

(assert (= (and b!1254492 (not condMapEmpty!49591)) mapNonEmpty!49591))

(get-info :version)

(assert (= (and mapNonEmpty!49591 ((_ is ValueCellFull!15174) mapValue!49591)) b!1254487))

(assert (= (and b!1254492 ((_ is ValueCellFull!15174) mapDefault!49591)) b!1254485))

(assert (= start!105278 b!1254492))

(declare-fun m!1155229 () Bool)

(assert (=> b!1254490 m!1155229))

(declare-fun m!1155231 () Bool)

(assert (=> b!1254490 m!1155231))

(declare-fun m!1155233 () Bool)

(assert (=> b!1254490 m!1155233))

(declare-fun m!1155235 () Bool)

(assert (=> b!1254488 m!1155235))

(declare-fun m!1155237 () Bool)

(assert (=> b!1254489 m!1155237))

(declare-fun m!1155239 () Bool)

(assert (=> b!1254489 m!1155239))

(declare-fun m!1155241 () Bool)

(assert (=> b!1254489 m!1155241))

(declare-fun m!1155243 () Bool)

(assert (=> b!1254489 m!1155243))

(declare-fun m!1155245 () Bool)

(assert (=> b!1254489 m!1155245))

(declare-fun m!1155247 () Bool)

(assert (=> b!1254489 m!1155247))

(declare-fun m!1155249 () Bool)

(assert (=> start!105278 m!1155249))

(declare-fun m!1155251 () Bool)

(assert (=> start!105278 m!1155251))

(declare-fun m!1155253 () Bool)

(assert (=> start!105278 m!1155253))

(declare-fun m!1155255 () Bool)

(assert (=> mapNonEmpty!49591 m!1155255))

(declare-fun m!1155257 () Bool)

(assert (=> b!1254486 m!1155257))

(check-sat (not b!1254488) (not b!1254486) tp_is_empty!31875 (not b!1254489) (not b!1254490) (not b_next!26973) (not start!105278) (not mapNonEmpty!49591) b_and!44799)
(check-sat b_and!44799 (not b_next!26973))
