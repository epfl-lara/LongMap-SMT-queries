; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105422 () Bool)

(assert start!105422)

(declare-fun b_free!27085 () Bool)

(declare-fun b_next!27085 () Bool)

(assert (=> start!105422 (= b_free!27085 (not b_next!27085))))

(declare-fun tp!94768 () Bool)

(declare-fun b_and!44913 () Bool)

(assert (=> start!105422 (= tp!94768 b_and!44913)))

(declare-fun b!1255982 () Bool)

(declare-fun e!713945 () Bool)

(assert (=> b!1255982 (= e!713945 true)))

(declare-datatypes ((V!48015 0))(
  ( (V!48016 (val!16056 Int)) )
))
(declare-datatypes ((tuple2!20822 0))(
  ( (tuple2!20823 (_1!10422 (_ BitVec 64)) (_2!10422 V!48015)) )
))
(declare-datatypes ((List!28030 0))(
  ( (Nil!28027) (Cons!28026 (h!29235 tuple2!20822) (t!41508 List!28030)) )
))
(declare-datatypes ((ListLongMap!18695 0))(
  ( (ListLongMap!18696 (toList!9363 List!28030)) )
))
(declare-fun lt!567732 () ListLongMap!18695)

(declare-fun -!2032 (ListLongMap!18695 (_ BitVec 64)) ListLongMap!18695)

(assert (=> b!1255982 (= (-!2032 lt!567732 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567732)))

(declare-datatypes ((Unit!41687 0))(
  ( (Unit!41688) )
))
(declare-fun lt!567734 () Unit!41687)

(declare-fun removeNotPresentStillSame!127 (ListLongMap!18695 (_ BitVec 64)) Unit!41687)

(assert (=> b!1255982 (= lt!567734 (removeNotPresentStillSame!127 lt!567732 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1255983 () Bool)

(declare-fun e!713944 () Bool)

(declare-fun e!713942 () Bool)

(assert (=> b!1255983 (= e!713944 (not e!713942))))

(declare-fun res!837328 () Bool)

(assert (=> b!1255983 (=> res!837328 e!713942)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1255983 (= res!837328 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!567733 () ListLongMap!18695)

(declare-fun lt!567730 () ListLongMap!18695)

(assert (=> b!1255983 (= lt!567733 lt!567730)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun lt!567731 () Unit!41687)

(declare-fun minValueAfter!43 () V!48015)

(declare-fun zeroValue!871 () V!48015)

(declare-datatypes ((array!81545 0))(
  ( (array!81546 (arr!39332 (Array (_ BitVec 32) (_ BitVec 64))) (size!39870 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81545)

(declare-datatypes ((ValueCell!15230 0))(
  ( (ValueCellFull!15230 (v!18755 V!48015)) (EmptyCell!15230) )
))
(declare-datatypes ((array!81547 0))(
  ( (array!81548 (arr!39333 (Array (_ BitVec 32) ValueCell!15230)) (size!39871 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81547)

(declare-fun minValueBefore!43 () V!48015)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1074 (array!81545 array!81547 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48015 V!48015 V!48015 V!48015 (_ BitVec 32) Int) Unit!41687)

(assert (=> b!1255983 (= lt!567731 (lemmaNoChangeToArrayThenSameMapNoExtras!1074 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5752 (array!81545 array!81547 (_ BitVec 32) (_ BitVec 32) V!48015 V!48015 (_ BitVec 32) Int) ListLongMap!18695)

(assert (=> b!1255983 (= lt!567730 (getCurrentListMapNoExtraKeys!5752 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255983 (= lt!567733 (getCurrentListMapNoExtraKeys!5752 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49765 () Bool)

(declare-fun mapRes!49765 () Bool)

(assert (=> mapIsEmpty!49765 mapRes!49765))

(declare-fun b!1255984 () Bool)

(declare-fun e!713948 () Bool)

(declare-fun tp_is_empty!31987 () Bool)

(assert (=> b!1255984 (= e!713948 tp_is_empty!31987)))

(declare-fun b!1255985 () Bool)

(declare-fun res!837331 () Bool)

(assert (=> b!1255985 (=> (not res!837331) (not e!713944))))

(assert (=> b!1255985 (= res!837331 (and (= (size!39871 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39870 _keys!1118) (size!39871 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1255986 () Bool)

(assert (=> b!1255986 (= e!713942 e!713945)))

(declare-fun res!837327 () Bool)

(assert (=> b!1255986 (=> res!837327 e!713945)))

(declare-fun contains!7514 (ListLongMap!18695 (_ BitVec 64)) Bool)

(assert (=> b!1255986 (= res!837327 (contains!7514 lt!567732 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4474 (array!81545 array!81547 (_ BitVec 32) (_ BitVec 32) V!48015 V!48015 (_ BitVec 32) Int) ListLongMap!18695)

(assert (=> b!1255986 (= lt!567732 (getCurrentListMap!4474 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255987 () Bool)

(declare-fun e!713946 () Bool)

(assert (=> b!1255987 (= e!713946 tp_is_empty!31987)))

(declare-fun res!837330 () Bool)

(assert (=> start!105422 (=> (not res!837330) (not e!713944))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105422 (= res!837330 (validMask!0 mask!1466))))

(assert (=> start!105422 e!713944))

(assert (=> start!105422 true))

(assert (=> start!105422 tp!94768))

(assert (=> start!105422 tp_is_empty!31987))

(declare-fun array_inv!30099 (array!81545) Bool)

(assert (=> start!105422 (array_inv!30099 _keys!1118)))

(declare-fun e!713947 () Bool)

(declare-fun array_inv!30100 (array!81547) Bool)

(assert (=> start!105422 (and (array_inv!30100 _values!914) e!713947)))

(declare-fun mapNonEmpty!49765 () Bool)

(declare-fun tp!94769 () Bool)

(assert (=> mapNonEmpty!49765 (= mapRes!49765 (and tp!94769 e!713948))))

(declare-fun mapKey!49765 () (_ BitVec 32))

(declare-fun mapRest!49765 () (Array (_ BitVec 32) ValueCell!15230))

(declare-fun mapValue!49765 () ValueCell!15230)

(assert (=> mapNonEmpty!49765 (= (arr!39333 _values!914) (store mapRest!49765 mapKey!49765 mapValue!49765))))

(declare-fun b!1255988 () Bool)

(declare-fun res!837326 () Bool)

(assert (=> b!1255988 (=> (not res!837326) (not e!713944))))

(declare-datatypes ((List!28031 0))(
  ( (Nil!28028) (Cons!28027 (h!29236 (_ BitVec 64)) (t!41509 List!28031)) )
))
(declare-fun arrayNoDuplicates!0 (array!81545 (_ BitVec 32) List!28031) Bool)

(assert (=> b!1255988 (= res!837326 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28028))))

(declare-fun b!1255989 () Bool)

(declare-fun res!837329 () Bool)

(assert (=> b!1255989 (=> (not res!837329) (not e!713944))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81545 (_ BitVec 32)) Bool)

(assert (=> b!1255989 (= res!837329 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1255990 () Bool)

(assert (=> b!1255990 (= e!713947 (and e!713946 mapRes!49765))))

(declare-fun condMapEmpty!49765 () Bool)

(declare-fun mapDefault!49765 () ValueCell!15230)

(assert (=> b!1255990 (= condMapEmpty!49765 (= (arr!39333 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15230)) mapDefault!49765)))))

(assert (= (and start!105422 res!837330) b!1255985))

(assert (= (and b!1255985 res!837331) b!1255989))

(assert (= (and b!1255989 res!837329) b!1255988))

(assert (= (and b!1255988 res!837326) b!1255983))

(assert (= (and b!1255983 (not res!837328)) b!1255986))

(assert (= (and b!1255986 (not res!837327)) b!1255982))

(assert (= (and b!1255990 condMapEmpty!49765) mapIsEmpty!49765))

(assert (= (and b!1255990 (not condMapEmpty!49765)) mapNonEmpty!49765))

(get-info :version)

(assert (= (and mapNonEmpty!49765 ((_ is ValueCellFull!15230) mapValue!49765)) b!1255984))

(assert (= (and b!1255990 ((_ is ValueCellFull!15230) mapDefault!49765)) b!1255987))

(assert (= start!105422 b!1255990))

(declare-fun m!1156231 () Bool)

(assert (=> start!105422 m!1156231))

(declare-fun m!1156233 () Bool)

(assert (=> start!105422 m!1156233))

(declare-fun m!1156235 () Bool)

(assert (=> start!105422 m!1156235))

(declare-fun m!1156237 () Bool)

(assert (=> b!1255982 m!1156237))

(declare-fun m!1156239 () Bool)

(assert (=> b!1255982 m!1156239))

(declare-fun m!1156241 () Bool)

(assert (=> b!1255989 m!1156241))

(declare-fun m!1156243 () Bool)

(assert (=> b!1255986 m!1156243))

(declare-fun m!1156245 () Bool)

(assert (=> b!1255986 m!1156245))

(declare-fun m!1156247 () Bool)

(assert (=> b!1255988 m!1156247))

(declare-fun m!1156249 () Bool)

(assert (=> mapNonEmpty!49765 m!1156249))

(declare-fun m!1156251 () Bool)

(assert (=> b!1255983 m!1156251))

(declare-fun m!1156253 () Bool)

(assert (=> b!1255983 m!1156253))

(declare-fun m!1156255 () Bool)

(assert (=> b!1255983 m!1156255))

(check-sat (not b!1255986) (not b!1255982) tp_is_empty!31987 (not b!1255983) (not b_next!27085) b_and!44913 (not b!1255989) (not mapNonEmpty!49765) (not start!105422) (not b!1255988))
(check-sat b_and!44913 (not b_next!27085))
