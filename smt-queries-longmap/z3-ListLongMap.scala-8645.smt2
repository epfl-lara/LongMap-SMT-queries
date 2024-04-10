; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105190 () Bool)

(assert start!105190)

(declare-fun b_free!26907 () Bool)

(declare-fun b_next!26907 () Bool)

(assert (=> start!105190 (= b_free!26907 (not b_next!26907))))

(declare-fun tp!94225 () Bool)

(declare-fun b_and!44721 () Bool)

(assert (=> start!105190 (= tp!94225 b_and!44721)))

(declare-fun res!835873 () Bool)

(declare-fun e!712127 () Bool)

(assert (=> start!105190 (=> (not res!835873) (not e!712127))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105190 (= res!835873 (validMask!0 mask!1466))))

(assert (=> start!105190 e!712127))

(assert (=> start!105190 true))

(assert (=> start!105190 tp!94225))

(declare-fun tp_is_empty!31809 () Bool)

(assert (=> start!105190 tp_is_empty!31809))

(declare-datatypes ((array!81276 0))(
  ( (array!81277 (arr!39200 (Array (_ BitVec 32) (_ BitVec 64))) (size!39736 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81276)

(declare-fun array_inv!29883 (array!81276) Bool)

(assert (=> start!105190 (array_inv!29883 _keys!1118)))

(declare-datatypes ((V!47777 0))(
  ( (V!47778 (val!15967 Int)) )
))
(declare-datatypes ((ValueCell!15141 0))(
  ( (ValueCellFull!15141 (v!18665 V!47777)) (EmptyCell!15141) )
))
(declare-datatypes ((array!81278 0))(
  ( (array!81279 (arr!39201 (Array (_ BitVec 32) ValueCell!15141)) (size!39737 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81278)

(declare-fun e!712126 () Bool)

(declare-fun array_inv!29884 (array!81278) Bool)

(assert (=> start!105190 (and (array_inv!29884 _values!914) e!712126)))

(declare-fun b!1253509 () Bool)

(declare-fun e!712129 () Bool)

(assert (=> b!1253509 (= e!712129 tp_is_empty!31809)))

(declare-fun b!1253510 () Bool)

(declare-fun res!835874 () Bool)

(assert (=> b!1253510 (=> (not res!835874) (not e!712127))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1253510 (= res!835874 (and (= (size!39737 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39736 _keys!1118) (size!39737 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1253511 () Bool)

(declare-fun e!712131 () Bool)

(assert (=> b!1253511 (= e!712131 tp_is_empty!31809)))

(declare-fun b!1253512 () Bool)

(declare-fun res!835870 () Bool)

(assert (=> b!1253512 (=> (not res!835870) (not e!712127))))

(declare-datatypes ((List!27836 0))(
  ( (Nil!27833) (Cons!27832 (h!29041 (_ BitVec 64)) (t!41317 List!27836)) )
))
(declare-fun arrayNoDuplicates!0 (array!81276 (_ BitVec 32) List!27836) Bool)

(assert (=> b!1253512 (= res!835870 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27833))))

(declare-fun b!1253513 () Bool)

(declare-fun e!712130 () Bool)

(assert (=> b!1253513 (= e!712130 true)))

(declare-datatypes ((tuple2!20606 0))(
  ( (tuple2!20607 (_1!10314 (_ BitVec 64)) (_2!10314 V!47777)) )
))
(declare-datatypes ((List!27837 0))(
  ( (Nil!27834) (Cons!27833 (h!29042 tuple2!20606) (t!41318 List!27837)) )
))
(declare-datatypes ((ListLongMap!18479 0))(
  ( (ListLongMap!18480 (toList!9255 List!27837)) )
))
(declare-fun lt!566041 () ListLongMap!18479)

(declare-fun lt!566039 () ListLongMap!18479)

(declare-fun -!2028 (ListLongMap!18479 (_ BitVec 64)) ListLongMap!18479)

(assert (=> b!1253513 (= lt!566041 (-!2028 lt!566039 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!566042 () ListLongMap!18479)

(declare-fun lt!566045 () ListLongMap!18479)

(assert (=> b!1253513 (= (-!2028 lt!566042 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566045)))

(declare-datatypes ((Unit!41692 0))(
  ( (Unit!41693) )
))
(declare-fun lt!566040 () Unit!41692)

(declare-fun minValueBefore!43 () V!47777)

(declare-fun addThenRemoveForNewKeyIsSame!298 (ListLongMap!18479 (_ BitVec 64) V!47777) Unit!41692)

(assert (=> b!1253513 (= lt!566040 (addThenRemoveForNewKeyIsSame!298 lt!566045 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!566043 () ListLongMap!18479)

(declare-fun lt!566046 () ListLongMap!18479)

(assert (=> b!1253513 (and (= lt!566039 lt!566042) (= lt!566043 lt!566046))))

(declare-fun +!4151 (ListLongMap!18479 tuple2!20606) ListLongMap!18479)

(assert (=> b!1253513 (= lt!566042 (+!4151 lt!566045 (tuple2!20607 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47777)

(declare-fun zeroValue!871 () V!47777)

(declare-fun getCurrentListMap!4499 (array!81276 array!81278 (_ BitVec 32) (_ BitVec 32) V!47777 V!47777 (_ BitVec 32) Int) ListLongMap!18479)

(assert (=> b!1253513 (= lt!566043 (getCurrentListMap!4499 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253513 (= lt!566039 (getCurrentListMap!4499 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49489 () Bool)

(declare-fun mapRes!49489 () Bool)

(declare-fun tp!94226 () Bool)

(assert (=> mapNonEmpty!49489 (= mapRes!49489 (and tp!94226 e!712131))))

(declare-fun mapRest!49489 () (Array (_ BitVec 32) ValueCell!15141))

(declare-fun mapValue!49489 () ValueCell!15141)

(declare-fun mapKey!49489 () (_ BitVec 32))

(assert (=> mapNonEmpty!49489 (= (arr!39201 _values!914) (store mapRest!49489 mapKey!49489 mapValue!49489))))

(declare-fun mapIsEmpty!49489 () Bool)

(assert (=> mapIsEmpty!49489 mapRes!49489))

(declare-fun b!1253514 () Bool)

(assert (=> b!1253514 (= e!712127 (not e!712130))))

(declare-fun res!835871 () Bool)

(assert (=> b!1253514 (=> res!835871 e!712130)))

(assert (=> b!1253514 (= res!835871 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1253514 (= lt!566045 lt!566046)))

(declare-fun lt!566044 () Unit!41692)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1010 (array!81276 array!81278 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47777 V!47777 V!47777 V!47777 (_ BitVec 32) Int) Unit!41692)

(assert (=> b!1253514 (= lt!566044 (lemmaNoChangeToArrayThenSameMapNoExtras!1010 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5646 (array!81276 array!81278 (_ BitVec 32) (_ BitVec 32) V!47777 V!47777 (_ BitVec 32) Int) ListLongMap!18479)

(assert (=> b!1253514 (= lt!566046 (getCurrentListMapNoExtraKeys!5646 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253514 (= lt!566045 (getCurrentListMapNoExtraKeys!5646 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253515 () Bool)

(assert (=> b!1253515 (= e!712126 (and e!712129 mapRes!49489))))

(declare-fun condMapEmpty!49489 () Bool)

(declare-fun mapDefault!49489 () ValueCell!15141)

(assert (=> b!1253515 (= condMapEmpty!49489 (= (arr!39201 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15141)) mapDefault!49489)))))

(declare-fun b!1253516 () Bool)

(declare-fun res!835872 () Bool)

(assert (=> b!1253516 (=> (not res!835872) (not e!712127))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81276 (_ BitVec 32)) Bool)

(assert (=> b!1253516 (= res!835872 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!105190 res!835873) b!1253510))

(assert (= (and b!1253510 res!835874) b!1253516))

(assert (= (and b!1253516 res!835872) b!1253512))

(assert (= (and b!1253512 res!835870) b!1253514))

(assert (= (and b!1253514 (not res!835871)) b!1253513))

(assert (= (and b!1253515 condMapEmpty!49489) mapIsEmpty!49489))

(assert (= (and b!1253515 (not condMapEmpty!49489)) mapNonEmpty!49489))

(get-info :version)

(assert (= (and mapNonEmpty!49489 ((_ is ValueCellFull!15141) mapValue!49489)) b!1253511))

(assert (= (and b!1253515 ((_ is ValueCellFull!15141) mapDefault!49489)) b!1253509))

(assert (= start!105190 b!1253515))

(declare-fun m!1154055 () Bool)

(assert (=> b!1253513 m!1154055))

(declare-fun m!1154057 () Bool)

(assert (=> b!1253513 m!1154057))

(declare-fun m!1154059 () Bool)

(assert (=> b!1253513 m!1154059))

(declare-fun m!1154061 () Bool)

(assert (=> b!1253513 m!1154061))

(declare-fun m!1154063 () Bool)

(assert (=> b!1253513 m!1154063))

(declare-fun m!1154065 () Bool)

(assert (=> b!1253513 m!1154065))

(declare-fun m!1154067 () Bool)

(assert (=> b!1253514 m!1154067))

(declare-fun m!1154069 () Bool)

(assert (=> b!1253514 m!1154069))

(declare-fun m!1154071 () Bool)

(assert (=> b!1253514 m!1154071))

(declare-fun m!1154073 () Bool)

(assert (=> b!1253516 m!1154073))

(declare-fun m!1154075 () Bool)

(assert (=> b!1253512 m!1154075))

(declare-fun m!1154077 () Bool)

(assert (=> start!105190 m!1154077))

(declare-fun m!1154079 () Bool)

(assert (=> start!105190 m!1154079))

(declare-fun m!1154081 () Bool)

(assert (=> start!105190 m!1154081))

(declare-fun m!1154083 () Bool)

(assert (=> mapNonEmpty!49489 m!1154083))

(check-sat (not b!1253516) (not b_next!26907) (not b!1253514) (not b!1253512) tp_is_empty!31809 b_and!44721 (not start!105190) (not b!1253513) (not mapNonEmpty!49489))
(check-sat b_and!44721 (not b_next!26907))
