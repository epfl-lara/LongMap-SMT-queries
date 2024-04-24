; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105656 () Bool)

(assert start!105656)

(declare-fun b_free!27091 () Bool)

(declare-fun b_next!27091 () Bool)

(assert (=> start!105656 (= b_free!27091 (not b_next!27091))))

(declare-fun tp!94787 () Bool)

(declare-fun b_and!44939 () Bool)

(assert (=> start!105656 (= tp!94787 b_and!44939)))

(declare-fun b!1257450 () Bool)

(declare-fun e!714899 () Bool)

(declare-fun e!714897 () Bool)

(assert (=> b!1257450 (= e!714899 e!714897)))

(declare-fun res!837945 () Bool)

(assert (=> b!1257450 (=> res!837945 e!714897)))

(declare-datatypes ((V!48023 0))(
  ( (V!48024 (val!16059 Int)) )
))
(declare-datatypes ((tuple2!20764 0))(
  ( (tuple2!20765 (_1!10393 (_ BitVec 64)) (_2!10393 V!48023)) )
))
(declare-datatypes ((List!27995 0))(
  ( (Nil!27992) (Cons!27991 (h!29209 tuple2!20764) (t!41474 List!27995)) )
))
(declare-datatypes ((ListLongMap!18645 0))(
  ( (ListLongMap!18646 (toList!9338 List!27995)) )
))
(declare-fun lt!568442 () ListLongMap!18645)

(declare-fun contains!7570 (ListLongMap!18645 (_ BitVec 64)) Bool)

(assert (=> b!1257450 (= res!837945 (contains!7570 lt!568442 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48023)

(declare-datatypes ((array!81675 0))(
  ( (array!81676 (arr!39392 (Array (_ BitVec 32) (_ BitVec 64))) (size!39929 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81675)

(declare-datatypes ((ValueCell!15233 0))(
  ( (ValueCellFull!15233 (v!18755 V!48023)) (EmptyCell!15233) )
))
(declare-datatypes ((array!81677 0))(
  ( (array!81678 (arr!39393 (Array (_ BitVec 32) ValueCell!15233)) (size!39930 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81677)

(declare-fun minValueBefore!43 () V!48023)

(declare-fun getCurrentListMap!4548 (array!81675 array!81677 (_ BitVec 32) (_ BitVec 32) V!48023 V!48023 (_ BitVec 32) Int) ListLongMap!18645)

(assert (=> b!1257450 (= lt!568442 (getCurrentListMap!4548 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1257451 () Bool)

(declare-fun res!837942 () Bool)

(declare-fun e!714903 () Bool)

(assert (=> b!1257451 (=> (not res!837942) (not e!714903))))

(declare-datatypes ((List!27996 0))(
  ( (Nil!27993) (Cons!27992 (h!29210 (_ BitVec 64)) (t!41475 List!27996)) )
))
(declare-fun arrayNoDuplicates!0 (array!81675 (_ BitVec 32) List!27996) Bool)

(assert (=> b!1257451 (= res!837942 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27993))))

(declare-fun b!1257452 () Bool)

(declare-fun res!837944 () Bool)

(assert (=> b!1257452 (=> (not res!837944) (not e!714903))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1257452 (= res!837944 (and (= (size!39930 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39929 _keys!1118) (size!39930 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1257453 () Bool)

(declare-fun e!714900 () Bool)

(declare-fun tp_is_empty!31993 () Bool)

(assert (=> b!1257453 (= e!714900 tp_is_empty!31993)))

(declare-fun mapNonEmpty!49774 () Bool)

(declare-fun mapRes!49774 () Bool)

(declare-fun tp!94786 () Bool)

(declare-fun e!714902 () Bool)

(assert (=> mapNonEmpty!49774 (= mapRes!49774 (and tp!94786 e!714902))))

(declare-fun mapRest!49774 () (Array (_ BitVec 32) ValueCell!15233))

(declare-fun mapValue!49774 () ValueCell!15233)

(declare-fun mapKey!49774 () (_ BitVec 32))

(assert (=> mapNonEmpty!49774 (= (arr!39393 _values!914) (store mapRest!49774 mapKey!49774 mapValue!49774))))

(declare-fun res!837941 () Bool)

(assert (=> start!105656 (=> (not res!837941) (not e!714903))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105656 (= res!837941 (validMask!0 mask!1466))))

(assert (=> start!105656 e!714903))

(assert (=> start!105656 true))

(assert (=> start!105656 tp!94787))

(assert (=> start!105656 tp_is_empty!31993))

(declare-fun array_inv!30145 (array!81675) Bool)

(assert (=> start!105656 (array_inv!30145 _keys!1118)))

(declare-fun e!714898 () Bool)

(declare-fun array_inv!30146 (array!81677) Bool)

(assert (=> start!105656 (and (array_inv!30146 _values!914) e!714898)))

(declare-fun b!1257454 () Bool)

(assert (=> b!1257454 (= e!714898 (and e!714900 mapRes!49774))))

(declare-fun condMapEmpty!49774 () Bool)

(declare-fun mapDefault!49774 () ValueCell!15233)

(assert (=> b!1257454 (= condMapEmpty!49774 (= (arr!39393 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15233)) mapDefault!49774)))))

(declare-fun mapIsEmpty!49774 () Bool)

(assert (=> mapIsEmpty!49774 mapRes!49774))

(declare-fun b!1257455 () Bool)

(declare-fun res!837943 () Bool)

(assert (=> b!1257455 (=> (not res!837943) (not e!714903))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81675 (_ BitVec 32)) Bool)

(assert (=> b!1257455 (= res!837943 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1257456 () Bool)

(assert (=> b!1257456 (= e!714897 true)))

(declare-fun -!2054 (ListLongMap!18645 (_ BitVec 64)) ListLongMap!18645)

(assert (=> b!1257456 (= (-!2054 lt!568442 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568442)))

(declare-datatypes ((Unit!41817 0))(
  ( (Unit!41818) )
))
(declare-fun lt!568438 () Unit!41817)

(declare-fun removeNotPresentStillSame!126 (ListLongMap!18645 (_ BitVec 64)) Unit!41817)

(assert (=> b!1257456 (= lt!568438 (removeNotPresentStillSame!126 lt!568442 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1257457 () Bool)

(assert (=> b!1257457 (= e!714902 tp_is_empty!31993)))

(declare-fun b!1257458 () Bool)

(assert (=> b!1257458 (= e!714903 (not e!714899))))

(declare-fun res!837940 () Bool)

(assert (=> b!1257458 (=> res!837940 e!714899)))

(assert (=> b!1257458 (= res!837940 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!568439 () ListLongMap!18645)

(declare-fun lt!568440 () ListLongMap!18645)

(assert (=> b!1257458 (= lt!568439 lt!568440)))

(declare-fun lt!568441 () Unit!41817)

(declare-fun minValueAfter!43 () V!48023)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1073 (array!81675 array!81677 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48023 V!48023 V!48023 V!48023 (_ BitVec 32) Int) Unit!41817)

(assert (=> b!1257458 (= lt!568441 (lemmaNoChangeToArrayThenSameMapNoExtras!1073 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5759 (array!81675 array!81677 (_ BitVec 32) (_ BitVec 32) V!48023 V!48023 (_ BitVec 32) Int) ListLongMap!18645)

(assert (=> b!1257458 (= lt!568440 (getCurrentListMapNoExtraKeys!5759 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1257458 (= lt!568439 (getCurrentListMapNoExtraKeys!5759 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105656 res!837941) b!1257452))

(assert (= (and b!1257452 res!837944) b!1257455))

(assert (= (and b!1257455 res!837943) b!1257451))

(assert (= (and b!1257451 res!837942) b!1257458))

(assert (= (and b!1257458 (not res!837940)) b!1257450))

(assert (= (and b!1257450 (not res!837945)) b!1257456))

(assert (= (and b!1257454 condMapEmpty!49774) mapIsEmpty!49774))

(assert (= (and b!1257454 (not condMapEmpty!49774)) mapNonEmpty!49774))

(get-info :version)

(assert (= (and mapNonEmpty!49774 ((_ is ValueCellFull!15233) mapValue!49774)) b!1257457))

(assert (= (and b!1257454 ((_ is ValueCellFull!15233) mapDefault!49774)) b!1257453))

(assert (= start!105656 b!1257454))

(declare-fun m!1158441 () Bool)

(assert (=> mapNonEmpty!49774 m!1158441))

(declare-fun m!1158443 () Bool)

(assert (=> b!1257456 m!1158443))

(declare-fun m!1158445 () Bool)

(assert (=> b!1257456 m!1158445))

(declare-fun m!1158447 () Bool)

(assert (=> b!1257451 m!1158447))

(declare-fun m!1158449 () Bool)

(assert (=> start!105656 m!1158449))

(declare-fun m!1158451 () Bool)

(assert (=> start!105656 m!1158451))

(declare-fun m!1158453 () Bool)

(assert (=> start!105656 m!1158453))

(declare-fun m!1158455 () Bool)

(assert (=> b!1257458 m!1158455))

(declare-fun m!1158457 () Bool)

(assert (=> b!1257458 m!1158457))

(declare-fun m!1158459 () Bool)

(assert (=> b!1257458 m!1158459))

(declare-fun m!1158461 () Bool)

(assert (=> b!1257450 m!1158461))

(declare-fun m!1158463 () Bool)

(assert (=> b!1257450 m!1158463))

(declare-fun m!1158465 () Bool)

(assert (=> b!1257455 m!1158465))

(check-sat (not start!105656) (not b!1257450) (not b!1257456) b_and!44939 (not b!1257451) (not b!1257455) (not mapNonEmpty!49774) (not b_next!27091) (not b!1257458) tp_is_empty!31993)
(check-sat b_and!44939 (not b_next!27091))
