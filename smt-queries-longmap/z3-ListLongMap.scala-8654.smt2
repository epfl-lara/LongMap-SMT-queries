; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105266 () Bool)

(assert start!105266)

(declare-fun b_free!26961 () Bool)

(declare-fun b_next!26961 () Bool)

(assert (=> start!105266 (= b_free!26961 (not b_next!26961))))

(declare-fun tp!94391 () Bool)

(declare-fun b_and!44787 () Bool)

(assert (=> start!105266 (= tp!94391 b_and!44787)))

(declare-fun b!1254341 () Bool)

(declare-fun res!836359 () Bool)

(declare-fun e!712734 () Bool)

(assert (=> b!1254341 (=> (not res!836359) (not e!712734))))

(declare-datatypes ((array!81382 0))(
  ( (array!81383 (arr!39252 (Array (_ BitVec 32) (_ BitVec 64))) (size!39788 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81382)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81382 (_ BitVec 32)) Bool)

(assert (=> b!1254341 (= res!836359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!49573 () Bool)

(declare-fun mapRes!49573 () Bool)

(declare-fun tp!94390 () Bool)

(declare-fun e!712733 () Bool)

(assert (=> mapNonEmpty!49573 (= mapRes!49573 (and tp!94390 e!712733))))

(declare-datatypes ((V!47849 0))(
  ( (V!47850 (val!15994 Int)) )
))
(declare-datatypes ((ValueCell!15168 0))(
  ( (ValueCellFull!15168 (v!18693 V!47849)) (EmptyCell!15168) )
))
(declare-fun mapValue!49573 () ValueCell!15168)

(declare-fun mapRest!49573 () (Array (_ BitVec 32) ValueCell!15168))

(declare-datatypes ((array!81384 0))(
  ( (array!81385 (arr!39253 (Array (_ BitVec 32) ValueCell!15168)) (size!39789 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81384)

(declare-fun mapKey!49573 () (_ BitVec 32))

(assert (=> mapNonEmpty!49573 (= (arr!39253 _values!914) (store mapRest!49573 mapKey!49573 mapValue!49573))))

(declare-fun b!1254342 () Bool)

(declare-fun e!712735 () Bool)

(declare-fun e!712731 () Bool)

(assert (=> b!1254342 (= e!712735 (and e!712731 mapRes!49573))))

(declare-fun condMapEmpty!49573 () Bool)

(declare-fun mapDefault!49573 () ValueCell!15168)

(assert (=> b!1254342 (= condMapEmpty!49573 (= (arr!39253 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15168)) mapDefault!49573)))))

(declare-fun b!1254343 () Bool)

(declare-fun res!836358 () Bool)

(assert (=> b!1254343 (=> (not res!836358) (not e!712734))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1254343 (= res!836358 (and (= (size!39789 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39788 _keys!1118) (size!39789 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1254344 () Bool)

(declare-fun e!712732 () Bool)

(assert (=> b!1254344 (= e!712732 true)))

(declare-datatypes ((tuple2!20650 0))(
  ( (tuple2!20651 (_1!10336 (_ BitVec 64)) (_2!10336 V!47849)) )
))
(declare-datatypes ((List!27875 0))(
  ( (Nil!27872) (Cons!27871 (h!29080 tuple2!20650) (t!41358 List!27875)) )
))
(declare-datatypes ((ListLongMap!18523 0))(
  ( (ListLongMap!18524 (toList!9277 List!27875)) )
))
(declare-fun lt!566827 () ListLongMap!18523)

(declare-fun lt!566832 () ListLongMap!18523)

(declare-fun -!2049 (ListLongMap!18523 (_ BitVec 64)) ListLongMap!18523)

(assert (=> b!1254344 (= lt!566827 (-!2049 lt!566832 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!566830 () ListLongMap!18523)

(declare-fun lt!566829 () ListLongMap!18523)

(assert (=> b!1254344 (= (-!2049 lt!566830 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566829)))

(declare-datatypes ((Unit!41738 0))(
  ( (Unit!41739) )
))
(declare-fun lt!566826 () Unit!41738)

(declare-fun minValueBefore!43 () V!47849)

(declare-fun addThenRemoveForNewKeyIsSame!319 (ListLongMap!18523 (_ BitVec 64) V!47849) Unit!41738)

(assert (=> b!1254344 (= lt!566826 (addThenRemoveForNewKeyIsSame!319 lt!566829 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!566825 () ListLongMap!18523)

(declare-fun lt!566831 () ListLongMap!18523)

(assert (=> b!1254344 (and (= lt!566832 lt!566830) (= lt!566825 lt!566831))))

(declare-fun +!4172 (ListLongMap!18523 tuple2!20650) ListLongMap!18523)

(assert (=> b!1254344 (= lt!566830 (+!4172 lt!566829 (tuple2!20651 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47849)

(declare-fun zeroValue!871 () V!47849)

(declare-fun getCurrentListMap!4520 (array!81382 array!81384 (_ BitVec 32) (_ BitVec 32) V!47849 V!47849 (_ BitVec 32) Int) ListLongMap!18523)

(assert (=> b!1254344 (= lt!566825 (getCurrentListMap!4520 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254344 (= lt!566832 (getCurrentListMap!4520 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254346 () Bool)

(declare-fun tp_is_empty!31863 () Bool)

(assert (=> b!1254346 (= e!712731 tp_is_empty!31863)))

(declare-fun b!1254347 () Bool)

(assert (=> b!1254347 (= e!712734 (not e!712732))))

(declare-fun res!836361 () Bool)

(assert (=> b!1254347 (=> res!836361 e!712732)))

(assert (=> b!1254347 (= res!836361 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1254347 (= lt!566829 lt!566831)))

(declare-fun lt!566828 () Unit!41738)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1028 (array!81382 array!81384 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47849 V!47849 V!47849 V!47849 (_ BitVec 32) Int) Unit!41738)

(assert (=> b!1254347 (= lt!566828 (lemmaNoChangeToArrayThenSameMapNoExtras!1028 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5664 (array!81382 array!81384 (_ BitVec 32) (_ BitVec 32) V!47849 V!47849 (_ BitVec 32) Int) ListLongMap!18523)

(assert (=> b!1254347 (= lt!566831 (getCurrentListMapNoExtraKeys!5664 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254347 (= lt!566829 (getCurrentListMapNoExtraKeys!5664 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!836357 () Bool)

(assert (=> start!105266 (=> (not res!836357) (not e!712734))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105266 (= res!836357 (validMask!0 mask!1466))))

(assert (=> start!105266 e!712734))

(assert (=> start!105266 true))

(assert (=> start!105266 tp!94391))

(assert (=> start!105266 tp_is_empty!31863))

(declare-fun array_inv!29923 (array!81382) Bool)

(assert (=> start!105266 (array_inv!29923 _keys!1118)))

(declare-fun array_inv!29924 (array!81384) Bool)

(assert (=> start!105266 (and (array_inv!29924 _values!914) e!712735)))

(declare-fun b!1254345 () Bool)

(declare-fun res!836360 () Bool)

(assert (=> b!1254345 (=> (not res!836360) (not e!712734))))

(declare-datatypes ((List!27876 0))(
  ( (Nil!27873) (Cons!27872 (h!29081 (_ BitVec 64)) (t!41359 List!27876)) )
))
(declare-fun arrayNoDuplicates!0 (array!81382 (_ BitVec 32) List!27876) Bool)

(assert (=> b!1254345 (= res!836360 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27873))))

(declare-fun b!1254348 () Bool)

(assert (=> b!1254348 (= e!712733 tp_is_empty!31863)))

(declare-fun mapIsEmpty!49573 () Bool)

(assert (=> mapIsEmpty!49573 mapRes!49573))

(assert (= (and start!105266 res!836357) b!1254343))

(assert (= (and b!1254343 res!836358) b!1254341))

(assert (= (and b!1254341 res!836359) b!1254345))

(assert (= (and b!1254345 res!836360) b!1254347))

(assert (= (and b!1254347 (not res!836361)) b!1254344))

(assert (= (and b!1254342 condMapEmpty!49573) mapIsEmpty!49573))

(assert (= (and b!1254342 (not condMapEmpty!49573)) mapNonEmpty!49573))

(get-info :version)

(assert (= (and mapNonEmpty!49573 ((_ is ValueCellFull!15168) mapValue!49573)) b!1254348))

(assert (= (and b!1254342 ((_ is ValueCellFull!15168) mapDefault!49573)) b!1254346))

(assert (= start!105266 b!1254342))

(declare-fun m!1155049 () Bool)

(assert (=> b!1254341 m!1155049))

(declare-fun m!1155051 () Bool)

(assert (=> start!105266 m!1155051))

(declare-fun m!1155053 () Bool)

(assert (=> start!105266 m!1155053))

(declare-fun m!1155055 () Bool)

(assert (=> start!105266 m!1155055))

(declare-fun m!1155057 () Bool)

(assert (=> b!1254344 m!1155057))

(declare-fun m!1155059 () Bool)

(assert (=> b!1254344 m!1155059))

(declare-fun m!1155061 () Bool)

(assert (=> b!1254344 m!1155061))

(declare-fun m!1155063 () Bool)

(assert (=> b!1254344 m!1155063))

(declare-fun m!1155065 () Bool)

(assert (=> b!1254344 m!1155065))

(declare-fun m!1155067 () Bool)

(assert (=> b!1254344 m!1155067))

(declare-fun m!1155069 () Bool)

(assert (=> mapNonEmpty!49573 m!1155069))

(declare-fun m!1155071 () Bool)

(assert (=> b!1254345 m!1155071))

(declare-fun m!1155073 () Bool)

(assert (=> b!1254347 m!1155073))

(declare-fun m!1155075 () Bool)

(assert (=> b!1254347 m!1155075))

(declare-fun m!1155077 () Bool)

(assert (=> b!1254347 m!1155077))

(check-sat (not b!1254347) (not mapNonEmpty!49573) (not b!1254341) (not start!105266) (not b!1254344) (not b_next!26961) b_and!44787 tp_is_empty!31863 (not b!1254345))
(check-sat b_and!44787 (not b_next!26961))
