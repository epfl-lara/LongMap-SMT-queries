; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105428 () Bool)

(assert start!105428)

(declare-fun b_free!27091 () Bool)

(declare-fun b_next!27091 () Bool)

(assert (=> start!105428 (= b_free!27091 (not b_next!27091))))

(declare-fun tp!94786 () Bool)

(declare-fun b_and!44919 () Bool)

(assert (=> start!105428 (= tp!94786 b_and!44919)))

(declare-fun b!1256063 () Bool)

(declare-fun res!837381 () Bool)

(declare-fun e!714007 () Bool)

(assert (=> b!1256063 (=> (not res!837381) (not e!714007))))

(declare-datatypes ((array!81555 0))(
  ( (array!81556 (arr!39337 (Array (_ BitVec 32) (_ BitVec 64))) (size!39875 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81555)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81555 (_ BitVec 32)) Bool)

(assert (=> b!1256063 (= res!837381 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!837382 () Bool)

(assert (=> start!105428 (=> (not res!837382) (not e!714007))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105428 (= res!837382 (validMask!0 mask!1466))))

(assert (=> start!105428 e!714007))

(assert (=> start!105428 true))

(assert (=> start!105428 tp!94786))

(declare-fun tp_is_empty!31993 () Bool)

(assert (=> start!105428 tp_is_empty!31993))

(declare-fun array_inv!30103 (array!81555) Bool)

(assert (=> start!105428 (array_inv!30103 _keys!1118)))

(declare-datatypes ((V!48023 0))(
  ( (V!48024 (val!16059 Int)) )
))
(declare-datatypes ((ValueCell!15233 0))(
  ( (ValueCellFull!15233 (v!18758 V!48023)) (EmptyCell!15233) )
))
(declare-datatypes ((array!81557 0))(
  ( (array!81558 (arr!39338 (Array (_ BitVec 32) ValueCell!15233)) (size!39876 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81557)

(declare-fun e!714008 () Bool)

(declare-fun array_inv!30104 (array!81557) Bool)

(assert (=> start!105428 (and (array_inv!30104 _values!914) e!714008)))

(declare-fun b!1256064 () Bool)

(declare-fun e!714009 () Bool)

(assert (=> b!1256064 (= e!714009 tp_is_empty!31993)))

(declare-fun b!1256065 () Bool)

(declare-fun e!714006 () Bool)

(assert (=> b!1256065 (= e!714007 (not e!714006))))

(declare-fun res!837380 () Bool)

(assert (=> b!1256065 (=> res!837380 e!714006)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1256065 (= res!837380 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!20824 0))(
  ( (tuple2!20825 (_1!10423 (_ BitVec 64)) (_2!10423 V!48023)) )
))
(declare-datatypes ((List!28033 0))(
  ( (Nil!28030) (Cons!28029 (h!29238 tuple2!20824) (t!41511 List!28033)) )
))
(declare-datatypes ((ListLongMap!18697 0))(
  ( (ListLongMap!18698 (toList!9364 List!28033)) )
))
(declare-fun lt!567775 () ListLongMap!18697)

(declare-fun lt!567778 () ListLongMap!18697)

(assert (=> b!1256065 (= lt!567775 lt!567778)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41689 0))(
  ( (Unit!41690) )
))
(declare-fun lt!567777 () Unit!41689)

(declare-fun minValueAfter!43 () V!48023)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48023)

(declare-fun minValueBefore!43 () V!48023)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1075 (array!81555 array!81557 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48023 V!48023 V!48023 V!48023 (_ BitVec 32) Int) Unit!41689)

(assert (=> b!1256065 (= lt!567777 (lemmaNoChangeToArrayThenSameMapNoExtras!1075 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5753 (array!81555 array!81557 (_ BitVec 32) (_ BitVec 32) V!48023 V!48023 (_ BitVec 32) Int) ListLongMap!18697)

(assert (=> b!1256065 (= lt!567778 (getCurrentListMapNoExtraKeys!5753 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1256065 (= lt!567775 (getCurrentListMapNoExtraKeys!5753 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256066 () Bool)

(declare-fun mapRes!49774 () Bool)

(assert (=> b!1256066 (= e!714008 (and e!714009 mapRes!49774))))

(declare-fun condMapEmpty!49774 () Bool)

(declare-fun mapDefault!49774 () ValueCell!15233)

(assert (=> b!1256066 (= condMapEmpty!49774 (= (arr!39338 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15233)) mapDefault!49774)))))

(declare-fun b!1256067 () Bool)

(declare-fun res!837383 () Bool)

(assert (=> b!1256067 (=> (not res!837383) (not e!714007))))

(assert (=> b!1256067 (= res!837383 (and (= (size!39876 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39875 _keys!1118) (size!39876 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49774 () Bool)

(declare-fun tp!94787 () Bool)

(declare-fun e!714005 () Bool)

(assert (=> mapNonEmpty!49774 (= mapRes!49774 (and tp!94787 e!714005))))

(declare-fun mapRest!49774 () (Array (_ BitVec 32) ValueCell!15233))

(declare-fun mapKey!49774 () (_ BitVec 32))

(declare-fun mapValue!49774 () ValueCell!15233)

(assert (=> mapNonEmpty!49774 (= (arr!39338 _values!914) (store mapRest!49774 mapKey!49774 mapValue!49774))))

(declare-fun b!1256068 () Bool)

(declare-fun res!837385 () Bool)

(assert (=> b!1256068 (=> (not res!837385) (not e!714007))))

(declare-datatypes ((List!28034 0))(
  ( (Nil!28031) (Cons!28030 (h!29239 (_ BitVec 64)) (t!41512 List!28034)) )
))
(declare-fun arrayNoDuplicates!0 (array!81555 (_ BitVec 32) List!28034) Bool)

(assert (=> b!1256068 (= res!837385 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28031))))

(declare-fun b!1256069 () Bool)

(assert (=> b!1256069 (= e!714005 tp_is_empty!31993)))

(declare-fun b!1256070 () Bool)

(declare-fun e!714011 () Bool)

(assert (=> b!1256070 (= e!714011 true)))

(declare-fun lt!567776 () ListLongMap!18697)

(declare-fun -!2033 (ListLongMap!18697 (_ BitVec 64)) ListLongMap!18697)

(assert (=> b!1256070 (= (-!2033 lt!567776 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567776)))

(declare-fun lt!567779 () Unit!41689)

(declare-fun removeNotPresentStillSame!128 (ListLongMap!18697 (_ BitVec 64)) Unit!41689)

(assert (=> b!1256070 (= lt!567779 (removeNotPresentStillSame!128 lt!567776 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!49774 () Bool)

(assert (=> mapIsEmpty!49774 mapRes!49774))

(declare-fun b!1256071 () Bool)

(assert (=> b!1256071 (= e!714006 e!714011)))

(declare-fun res!837384 () Bool)

(assert (=> b!1256071 (=> res!837384 e!714011)))

(declare-fun contains!7515 (ListLongMap!18697 (_ BitVec 64)) Bool)

(assert (=> b!1256071 (= res!837384 (contains!7515 lt!567776 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4475 (array!81555 array!81557 (_ BitVec 32) (_ BitVec 32) V!48023 V!48023 (_ BitVec 32) Int) ListLongMap!18697)

(assert (=> b!1256071 (= lt!567776 (getCurrentListMap!4475 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105428 res!837382) b!1256067))

(assert (= (and b!1256067 res!837383) b!1256063))

(assert (= (and b!1256063 res!837381) b!1256068))

(assert (= (and b!1256068 res!837385) b!1256065))

(assert (= (and b!1256065 (not res!837380)) b!1256071))

(assert (= (and b!1256071 (not res!837384)) b!1256070))

(assert (= (and b!1256066 condMapEmpty!49774) mapIsEmpty!49774))

(assert (= (and b!1256066 (not condMapEmpty!49774)) mapNonEmpty!49774))

(get-info :version)

(assert (= (and mapNonEmpty!49774 ((_ is ValueCellFull!15233) mapValue!49774)) b!1256069))

(assert (= (and b!1256066 ((_ is ValueCellFull!15233) mapDefault!49774)) b!1256064))

(assert (= start!105428 b!1256066))

(declare-fun m!1156309 () Bool)

(assert (=> b!1256063 m!1156309))

(declare-fun m!1156311 () Bool)

(assert (=> b!1256070 m!1156311))

(declare-fun m!1156313 () Bool)

(assert (=> b!1256070 m!1156313))

(declare-fun m!1156315 () Bool)

(assert (=> b!1256068 m!1156315))

(declare-fun m!1156317 () Bool)

(assert (=> start!105428 m!1156317))

(declare-fun m!1156319 () Bool)

(assert (=> start!105428 m!1156319))

(declare-fun m!1156321 () Bool)

(assert (=> start!105428 m!1156321))

(declare-fun m!1156323 () Bool)

(assert (=> b!1256065 m!1156323))

(declare-fun m!1156325 () Bool)

(assert (=> b!1256065 m!1156325))

(declare-fun m!1156327 () Bool)

(assert (=> b!1256065 m!1156327))

(declare-fun m!1156329 () Bool)

(assert (=> mapNonEmpty!49774 m!1156329))

(declare-fun m!1156331 () Bool)

(assert (=> b!1256071 m!1156331))

(declare-fun m!1156333 () Bool)

(assert (=> b!1256071 m!1156333))

(check-sat (not start!105428) (not b_next!27091) (not mapNonEmpty!49774) (not b!1256065) (not b!1256063) b_and!44919 (not b!1256068) (not b!1256070) tp_is_empty!31993 (not b!1256071))
(check-sat b_and!44919 (not b_next!27091))
