; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105290 () Bool)

(assert start!105290)

(declare-fun b_free!26985 () Bool)

(declare-fun b_next!26985 () Bool)

(assert (=> start!105290 (= b_free!26985 (not b_next!26985))))

(declare-fun tp!94463 () Bool)

(declare-fun b_and!44811 () Bool)

(assert (=> start!105290 (= tp!94463 b_and!44811)))

(declare-fun b!1254629 () Bool)

(declare-fun res!836537 () Bool)

(declare-fun e!712948 () Bool)

(assert (=> b!1254629 (=> (not res!836537) (not e!712948))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81428 0))(
  ( (array!81429 (arr!39275 (Array (_ BitVec 32) (_ BitVec 64))) (size!39811 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81428)

(declare-datatypes ((V!47881 0))(
  ( (V!47882 (val!16006 Int)) )
))
(declare-datatypes ((ValueCell!15180 0))(
  ( (ValueCellFull!15180 (v!18705 V!47881)) (EmptyCell!15180) )
))
(declare-datatypes ((array!81430 0))(
  ( (array!81431 (arr!39276 (Array (_ BitVec 32) ValueCell!15180)) (size!39812 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81430)

(assert (=> b!1254629 (= res!836537 (and (= (size!39812 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39811 _keys!1118) (size!39812 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1254631 () Bool)

(declare-fun e!712947 () Bool)

(declare-fun tp_is_empty!31887 () Bool)

(assert (=> b!1254631 (= e!712947 tp_is_empty!31887)))

(declare-fun b!1254632 () Bool)

(declare-fun e!712952 () Bool)

(assert (=> b!1254632 (= e!712952 tp_is_empty!31887)))

(declare-fun b!1254633 () Bool)

(declare-fun e!712949 () Bool)

(assert (=> b!1254633 (= e!712949 true)))

(declare-datatypes ((tuple2!20672 0))(
  ( (tuple2!20673 (_1!10347 (_ BitVec 64)) (_2!10347 V!47881)) )
))
(declare-datatypes ((List!27897 0))(
  ( (Nil!27894) (Cons!27893 (h!29102 tuple2!20672) (t!41380 List!27897)) )
))
(declare-datatypes ((ListLongMap!18545 0))(
  ( (ListLongMap!18546 (toList!9288 List!27897)) )
))
(declare-fun lt!567117 () ListLongMap!18545)

(declare-fun lt!567114 () ListLongMap!18545)

(declare-fun -!2059 (ListLongMap!18545 (_ BitVec 64)) ListLongMap!18545)

(assert (=> b!1254633 (= lt!567117 (-!2059 lt!567114 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!567116 () ListLongMap!18545)

(declare-fun lt!567120 () ListLongMap!18545)

(assert (=> b!1254633 (= (-!2059 lt!567116 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567120)))

(declare-datatypes ((Unit!41760 0))(
  ( (Unit!41761) )
))
(declare-fun lt!567118 () Unit!41760)

(declare-fun minValueBefore!43 () V!47881)

(declare-fun addThenRemoveForNewKeyIsSame!329 (ListLongMap!18545 (_ BitVec 64) V!47881) Unit!41760)

(assert (=> b!1254633 (= lt!567118 (addThenRemoveForNewKeyIsSame!329 lt!567120 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!567119 () ListLongMap!18545)

(declare-fun lt!567115 () ListLongMap!18545)

(assert (=> b!1254633 (and (= lt!567114 lt!567116) (= lt!567115 lt!567119))))

(declare-fun +!4182 (ListLongMap!18545 tuple2!20672) ListLongMap!18545)

(assert (=> b!1254633 (= lt!567116 (+!4182 lt!567120 (tuple2!20673 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47881)

(declare-fun zeroValue!871 () V!47881)

(declare-fun getCurrentListMap!4530 (array!81428 array!81430 (_ BitVec 32) (_ BitVec 32) V!47881 V!47881 (_ BitVec 32) Int) ListLongMap!18545)

(assert (=> b!1254633 (= lt!567115 (getCurrentListMap!4530 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254633 (= lt!567114 (getCurrentListMap!4530 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49609 () Bool)

(declare-fun mapRes!49609 () Bool)

(assert (=> mapIsEmpty!49609 mapRes!49609))

(declare-fun res!836538 () Bool)

(assert (=> start!105290 (=> (not res!836538) (not e!712948))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105290 (= res!836538 (validMask!0 mask!1466))))

(assert (=> start!105290 e!712948))

(assert (=> start!105290 true))

(assert (=> start!105290 tp!94463))

(assert (=> start!105290 tp_is_empty!31887))

(declare-fun array_inv!29941 (array!81428) Bool)

(assert (=> start!105290 (array_inv!29941 _keys!1118)))

(declare-fun e!712951 () Bool)

(declare-fun array_inv!29942 (array!81430) Bool)

(assert (=> start!105290 (and (array_inv!29942 _values!914) e!712951)))

(declare-fun b!1254630 () Bool)

(declare-fun res!836539 () Bool)

(assert (=> b!1254630 (=> (not res!836539) (not e!712948))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81428 (_ BitVec 32)) Bool)

(assert (=> b!1254630 (= res!836539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1254634 () Bool)

(declare-fun res!836541 () Bool)

(assert (=> b!1254634 (=> (not res!836541) (not e!712948))))

(declare-datatypes ((List!27898 0))(
  ( (Nil!27895) (Cons!27894 (h!29103 (_ BitVec 64)) (t!41381 List!27898)) )
))
(declare-fun arrayNoDuplicates!0 (array!81428 (_ BitVec 32) List!27898) Bool)

(assert (=> b!1254634 (= res!836541 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27895))))

(declare-fun b!1254635 () Bool)

(assert (=> b!1254635 (= e!712951 (and e!712952 mapRes!49609))))

(declare-fun condMapEmpty!49609 () Bool)

(declare-fun mapDefault!49609 () ValueCell!15180)

(assert (=> b!1254635 (= condMapEmpty!49609 (= (arr!39276 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15180)) mapDefault!49609)))))

(declare-fun mapNonEmpty!49609 () Bool)

(declare-fun tp!94462 () Bool)

(assert (=> mapNonEmpty!49609 (= mapRes!49609 (and tp!94462 e!712947))))

(declare-fun mapKey!49609 () (_ BitVec 32))

(declare-fun mapRest!49609 () (Array (_ BitVec 32) ValueCell!15180))

(declare-fun mapValue!49609 () ValueCell!15180)

(assert (=> mapNonEmpty!49609 (= (arr!39276 _values!914) (store mapRest!49609 mapKey!49609 mapValue!49609))))

(declare-fun b!1254636 () Bool)

(assert (=> b!1254636 (= e!712948 (not e!712949))))

(declare-fun res!836540 () Bool)

(assert (=> b!1254636 (=> res!836540 e!712949)))

(assert (=> b!1254636 (= res!836540 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1254636 (= lt!567120 lt!567119)))

(declare-fun lt!567113 () Unit!41760)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1038 (array!81428 array!81430 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47881 V!47881 V!47881 V!47881 (_ BitVec 32) Int) Unit!41760)

(assert (=> b!1254636 (= lt!567113 (lemmaNoChangeToArrayThenSameMapNoExtras!1038 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5674 (array!81428 array!81430 (_ BitVec 32) (_ BitVec 32) V!47881 V!47881 (_ BitVec 32) Int) ListLongMap!18545)

(assert (=> b!1254636 (= lt!567119 (getCurrentListMapNoExtraKeys!5674 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254636 (= lt!567120 (getCurrentListMapNoExtraKeys!5674 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105290 res!836538) b!1254629))

(assert (= (and b!1254629 res!836537) b!1254630))

(assert (= (and b!1254630 res!836539) b!1254634))

(assert (= (and b!1254634 res!836541) b!1254636))

(assert (= (and b!1254636 (not res!836540)) b!1254633))

(assert (= (and b!1254635 condMapEmpty!49609) mapIsEmpty!49609))

(assert (= (and b!1254635 (not condMapEmpty!49609)) mapNonEmpty!49609))

(get-info :version)

(assert (= (and mapNonEmpty!49609 ((_ is ValueCellFull!15180) mapValue!49609)) b!1254631))

(assert (= (and b!1254635 ((_ is ValueCellFull!15180) mapDefault!49609)) b!1254632))

(assert (= start!105290 b!1254635))

(declare-fun m!1155409 () Bool)

(assert (=> b!1254634 m!1155409))

(declare-fun m!1155411 () Bool)

(assert (=> b!1254630 m!1155411))

(declare-fun m!1155413 () Bool)

(assert (=> start!105290 m!1155413))

(declare-fun m!1155415 () Bool)

(assert (=> start!105290 m!1155415))

(declare-fun m!1155417 () Bool)

(assert (=> start!105290 m!1155417))

(declare-fun m!1155419 () Bool)

(assert (=> b!1254633 m!1155419))

(declare-fun m!1155421 () Bool)

(assert (=> b!1254633 m!1155421))

(declare-fun m!1155423 () Bool)

(assert (=> b!1254633 m!1155423))

(declare-fun m!1155425 () Bool)

(assert (=> b!1254633 m!1155425))

(declare-fun m!1155427 () Bool)

(assert (=> b!1254633 m!1155427))

(declare-fun m!1155429 () Bool)

(assert (=> b!1254633 m!1155429))

(declare-fun m!1155431 () Bool)

(assert (=> b!1254636 m!1155431))

(declare-fun m!1155433 () Bool)

(assert (=> b!1254636 m!1155433))

(declare-fun m!1155435 () Bool)

(assert (=> b!1254636 m!1155435))

(declare-fun m!1155437 () Bool)

(assert (=> mapNonEmpty!49609 m!1155437))

(check-sat (not b!1254633) b_and!44811 (not b_next!26985) (not mapNonEmpty!49609) (not b!1254634) tp_is_empty!31887 (not start!105290) (not b!1254636) (not b!1254630))
(check-sat b_and!44811 (not b_next!26985))
