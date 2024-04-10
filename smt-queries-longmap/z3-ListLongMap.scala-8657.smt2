; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105284 () Bool)

(assert start!105284)

(declare-fun b_free!26979 () Bool)

(declare-fun b_next!26979 () Bool)

(assert (=> start!105284 (= b_free!26979 (not b_next!26979))))

(declare-fun tp!94445 () Bool)

(declare-fun b_and!44805 () Bool)

(assert (=> start!105284 (= tp!94445 b_and!44805)))

(declare-fun b!1254557 () Bool)

(declare-fun res!836495 () Bool)

(declare-fun e!712897 () Bool)

(assert (=> b!1254557 (=> (not res!836495) (not e!712897))))

(declare-datatypes ((array!81416 0))(
  ( (array!81417 (arr!39269 (Array (_ BitVec 32) (_ BitVec 64))) (size!39805 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81416)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81416 (_ BitVec 32)) Bool)

(assert (=> b!1254557 (= res!836495 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1254558 () Bool)

(declare-fun res!836493 () Bool)

(assert (=> b!1254558 (=> (not res!836493) (not e!712897))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!47873 0))(
  ( (V!47874 (val!16003 Int)) )
))
(declare-datatypes ((ValueCell!15177 0))(
  ( (ValueCellFull!15177 (v!18702 V!47873)) (EmptyCell!15177) )
))
(declare-datatypes ((array!81418 0))(
  ( (array!81419 (arr!39270 (Array (_ BitVec 32) ValueCell!15177)) (size!39806 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81418)

(assert (=> b!1254558 (= res!836493 (and (= (size!39806 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39805 _keys!1118) (size!39806 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49600 () Bool)

(declare-fun mapRes!49600 () Bool)

(declare-fun tp!94444 () Bool)

(declare-fun e!712898 () Bool)

(assert (=> mapNonEmpty!49600 (= mapRes!49600 (and tp!94444 e!712898))))

(declare-fun mapRest!49600 () (Array (_ BitVec 32) ValueCell!15177))

(declare-fun mapKey!49600 () (_ BitVec 32))

(declare-fun mapValue!49600 () ValueCell!15177)

(assert (=> mapNonEmpty!49600 (= (arr!39270 _values!914) (store mapRest!49600 mapKey!49600 mapValue!49600))))

(declare-fun b!1254560 () Bool)

(declare-fun e!712893 () Bool)

(declare-fun tp_is_empty!31881 () Bool)

(assert (=> b!1254560 (= e!712893 tp_is_empty!31881)))

(declare-fun b!1254561 () Bool)

(declare-fun e!712894 () Bool)

(assert (=> b!1254561 (= e!712897 (not e!712894))))

(declare-fun res!836496 () Bool)

(assert (=> b!1254561 (=> res!836496 e!712894)))

(assert (=> b!1254561 (= res!836496 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20666 0))(
  ( (tuple2!20667 (_1!10344 (_ BitVec 64)) (_2!10344 V!47873)) )
))
(declare-datatypes ((List!27891 0))(
  ( (Nil!27888) (Cons!27887 (h!29096 tuple2!20666) (t!41374 List!27891)) )
))
(declare-datatypes ((ListLongMap!18539 0))(
  ( (ListLongMap!18540 (toList!9285 List!27891)) )
))
(declare-fun lt!567043 () ListLongMap!18539)

(declare-fun lt!567041 () ListLongMap!18539)

(assert (=> b!1254561 (= lt!567043 lt!567041)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41754 0))(
  ( (Unit!41755) )
))
(declare-fun lt!567045 () Unit!41754)

(declare-fun minValueAfter!43 () V!47873)

(declare-fun zeroValue!871 () V!47873)

(declare-fun minValueBefore!43 () V!47873)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1036 (array!81416 array!81418 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47873 V!47873 V!47873 V!47873 (_ BitVec 32) Int) Unit!41754)

(assert (=> b!1254561 (= lt!567045 (lemmaNoChangeToArrayThenSameMapNoExtras!1036 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5672 (array!81416 array!81418 (_ BitVec 32) (_ BitVec 32) V!47873 V!47873 (_ BitVec 32) Int) ListLongMap!18539)

(assert (=> b!1254561 (= lt!567041 (getCurrentListMapNoExtraKeys!5672 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254561 (= lt!567043 (getCurrentListMapNoExtraKeys!5672 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254562 () Bool)

(declare-fun e!712896 () Bool)

(assert (=> b!1254562 (= e!712896 (and e!712893 mapRes!49600))))

(declare-fun condMapEmpty!49600 () Bool)

(declare-fun mapDefault!49600 () ValueCell!15177)

(assert (=> b!1254562 (= condMapEmpty!49600 (= (arr!39270 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15177)) mapDefault!49600)))))

(declare-fun b!1254563 () Bool)

(declare-fun res!836492 () Bool)

(assert (=> b!1254563 (=> (not res!836492) (not e!712897))))

(declare-datatypes ((List!27892 0))(
  ( (Nil!27889) (Cons!27888 (h!29097 (_ BitVec 64)) (t!41375 List!27892)) )
))
(declare-fun arrayNoDuplicates!0 (array!81416 (_ BitVec 32) List!27892) Bool)

(assert (=> b!1254563 (= res!836492 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27889))))

(declare-fun b!1254559 () Bool)

(assert (=> b!1254559 (= e!712894 true)))

(declare-fun lt!567044 () ListLongMap!18539)

(declare-fun lt!567047 () ListLongMap!18539)

(declare-fun -!2056 (ListLongMap!18539 (_ BitVec 64)) ListLongMap!18539)

(assert (=> b!1254559 (= lt!567044 (-!2056 lt!567047 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!567048 () ListLongMap!18539)

(assert (=> b!1254559 (= (-!2056 lt!567048 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567043)))

(declare-fun lt!567042 () Unit!41754)

(declare-fun addThenRemoveForNewKeyIsSame!326 (ListLongMap!18539 (_ BitVec 64) V!47873) Unit!41754)

(assert (=> b!1254559 (= lt!567042 (addThenRemoveForNewKeyIsSame!326 lt!567043 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!567046 () ListLongMap!18539)

(assert (=> b!1254559 (and (= lt!567047 lt!567048) (= lt!567046 lt!567041))))

(declare-fun +!4179 (ListLongMap!18539 tuple2!20666) ListLongMap!18539)

(assert (=> b!1254559 (= lt!567048 (+!4179 lt!567043 (tuple2!20667 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun getCurrentListMap!4527 (array!81416 array!81418 (_ BitVec 32) (_ BitVec 32) V!47873 V!47873 (_ BitVec 32) Int) ListLongMap!18539)

(assert (=> b!1254559 (= lt!567046 (getCurrentListMap!4527 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254559 (= lt!567047 (getCurrentListMap!4527 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!836494 () Bool)

(assert (=> start!105284 (=> (not res!836494) (not e!712897))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105284 (= res!836494 (validMask!0 mask!1466))))

(assert (=> start!105284 e!712897))

(assert (=> start!105284 true))

(assert (=> start!105284 tp!94445))

(assert (=> start!105284 tp_is_empty!31881))

(declare-fun array_inv!29937 (array!81416) Bool)

(assert (=> start!105284 (array_inv!29937 _keys!1118)))

(declare-fun array_inv!29938 (array!81418) Bool)

(assert (=> start!105284 (and (array_inv!29938 _values!914) e!712896)))

(declare-fun b!1254564 () Bool)

(assert (=> b!1254564 (= e!712898 tp_is_empty!31881)))

(declare-fun mapIsEmpty!49600 () Bool)

(assert (=> mapIsEmpty!49600 mapRes!49600))

(assert (= (and start!105284 res!836494) b!1254558))

(assert (= (and b!1254558 res!836493) b!1254557))

(assert (= (and b!1254557 res!836495) b!1254563))

(assert (= (and b!1254563 res!836492) b!1254561))

(assert (= (and b!1254561 (not res!836496)) b!1254559))

(assert (= (and b!1254562 condMapEmpty!49600) mapIsEmpty!49600))

(assert (= (and b!1254562 (not condMapEmpty!49600)) mapNonEmpty!49600))

(get-info :version)

(assert (= (and mapNonEmpty!49600 ((_ is ValueCellFull!15177) mapValue!49600)) b!1254564))

(assert (= (and b!1254562 ((_ is ValueCellFull!15177) mapDefault!49600)) b!1254560))

(assert (= start!105284 b!1254562))

(declare-fun m!1155319 () Bool)

(assert (=> b!1254557 m!1155319))

(declare-fun m!1155321 () Bool)

(assert (=> b!1254559 m!1155321))

(declare-fun m!1155323 () Bool)

(assert (=> b!1254559 m!1155323))

(declare-fun m!1155325 () Bool)

(assert (=> b!1254559 m!1155325))

(declare-fun m!1155327 () Bool)

(assert (=> b!1254559 m!1155327))

(declare-fun m!1155329 () Bool)

(assert (=> b!1254559 m!1155329))

(declare-fun m!1155331 () Bool)

(assert (=> b!1254559 m!1155331))

(declare-fun m!1155333 () Bool)

(assert (=> start!105284 m!1155333))

(declare-fun m!1155335 () Bool)

(assert (=> start!105284 m!1155335))

(declare-fun m!1155337 () Bool)

(assert (=> start!105284 m!1155337))

(declare-fun m!1155339 () Bool)

(assert (=> mapNonEmpty!49600 m!1155339))

(declare-fun m!1155341 () Bool)

(assert (=> b!1254563 m!1155341))

(declare-fun m!1155343 () Bool)

(assert (=> b!1254561 m!1155343))

(declare-fun m!1155345 () Bool)

(assert (=> b!1254561 m!1155345))

(declare-fun m!1155347 () Bool)

(assert (=> b!1254561 m!1155347))

(check-sat tp_is_empty!31881 (not mapNonEmpty!49600) b_and!44805 (not b!1254561) (not b_next!26979) (not b!1254563) (not b!1254559) (not b!1254557) (not start!105284))
(check-sat b_and!44805 (not b_next!26979))
