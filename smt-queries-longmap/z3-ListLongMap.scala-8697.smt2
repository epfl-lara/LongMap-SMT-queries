; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105840 () Bool)

(assert start!105840)

(declare-fun b_free!27217 () Bool)

(declare-fun b_next!27217 () Bool)

(assert (=> start!105840 (= b_free!27217 (not b_next!27217))))

(declare-fun tp!95173 () Bool)

(declare-fun b_and!45093 () Bool)

(assert (=> start!105840 (= tp!95173 b_and!45093)))

(declare-fun b!1259386 () Bool)

(declare-fun e!716312 () Bool)

(assert (=> b!1259386 (= e!716312 true)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((V!48191 0))(
  ( (V!48192 (val!16122 Int)) )
))
(declare-fun zeroValue!871 () V!48191)

(declare-datatypes ((array!81917 0))(
  ( (array!81918 (arr!39510 (Array (_ BitVec 32) (_ BitVec 64))) (size!40047 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81917)

(declare-datatypes ((ValueCell!15296 0))(
  ( (ValueCellFull!15296 (v!18820 V!48191)) (EmptyCell!15296) )
))
(declare-datatypes ((array!81919 0))(
  ( (array!81920 (arr!39511 (Array (_ BitVec 32) ValueCell!15296)) (size!40048 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81919)

(declare-fun minValueBefore!43 () V!48191)

(declare-datatypes ((tuple2!20848 0))(
  ( (tuple2!20849 (_1!10435 (_ BitVec 64)) (_2!10435 V!48191)) )
))
(declare-datatypes ((List!28079 0))(
  ( (Nil!28076) (Cons!28075 (h!29293 tuple2!20848) (t!41564 List!28079)) )
))
(declare-datatypes ((ListLongMap!18729 0))(
  ( (ListLongMap!18730 (toList!9380 List!28079)) )
))
(declare-fun lt!569510 () ListLongMap!18729)

(declare-fun getCurrentListMap!4570 (array!81917 array!81919 (_ BitVec 32) (_ BitVec 32) V!48191 V!48191 (_ BitVec 32) Int) ListLongMap!18729)

(assert (=> b!1259386 (= lt!569510 (getCurrentListMap!4570 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259387 () Bool)

(declare-fun e!716314 () Bool)

(assert (=> b!1259387 (= e!716314 (not e!716312))))

(declare-fun res!839065 () Bool)

(assert (=> b!1259387 (=> res!839065 e!716312)))

(assert (=> b!1259387 (= res!839065 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!569508 () ListLongMap!18729)

(declare-fun lt!569509 () ListLongMap!18729)

(assert (=> b!1259387 (= lt!569508 lt!569509)))

(declare-fun minValueAfter!43 () V!48191)

(declare-datatypes ((Unit!41903 0))(
  ( (Unit!41904) )
))
(declare-fun lt!569507 () Unit!41903)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1110 (array!81917 array!81919 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48191 V!48191 V!48191 V!48191 (_ BitVec 32) Int) Unit!41903)

(assert (=> b!1259387 (= lt!569507 (lemmaNoChangeToArrayThenSameMapNoExtras!1110 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5796 (array!81917 array!81919 (_ BitVec 32) (_ BitVec 32) V!48191 V!48191 (_ BitVec 32) Int) ListLongMap!18729)

(assert (=> b!1259387 (= lt!569509 (getCurrentListMapNoExtraKeys!5796 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259387 (= lt!569508 (getCurrentListMapNoExtraKeys!5796 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259388 () Bool)

(declare-fun res!839067 () Bool)

(assert (=> b!1259388 (=> (not res!839067) (not e!716314))))

(assert (=> b!1259388 (= res!839067 (and (= (size!40048 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40047 _keys!1118) (size!40048 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1259389 () Bool)

(declare-fun res!839066 () Bool)

(assert (=> b!1259389 (=> (not res!839066) (not e!716314))))

(declare-datatypes ((List!28080 0))(
  ( (Nil!28077) (Cons!28076 (h!29294 (_ BitVec 64)) (t!41565 List!28080)) )
))
(declare-fun arrayNoDuplicates!0 (array!81917 (_ BitVec 32) List!28080) Bool)

(assert (=> b!1259389 (= res!839066 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28077))))

(declare-fun b!1259390 () Bool)

(declare-fun e!716311 () Bool)

(declare-fun tp_is_empty!32119 () Bool)

(assert (=> b!1259390 (= e!716311 tp_is_empty!32119)))

(declare-fun b!1259392 () Bool)

(declare-fun e!716315 () Bool)

(assert (=> b!1259392 (= e!716315 tp_is_empty!32119)))

(declare-fun mapNonEmpty!49972 () Bool)

(declare-fun mapRes!49972 () Bool)

(declare-fun tp!95174 () Bool)

(assert (=> mapNonEmpty!49972 (= mapRes!49972 (and tp!95174 e!716311))))

(declare-fun mapKey!49972 () (_ BitVec 32))

(declare-fun mapRest!49972 () (Array (_ BitVec 32) ValueCell!15296))

(declare-fun mapValue!49972 () ValueCell!15296)

(assert (=> mapNonEmpty!49972 (= (arr!39511 _values!914) (store mapRest!49972 mapKey!49972 mapValue!49972))))

(declare-fun res!839064 () Bool)

(assert (=> start!105840 (=> (not res!839064) (not e!716314))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105840 (= res!839064 (validMask!0 mask!1466))))

(assert (=> start!105840 e!716314))

(assert (=> start!105840 true))

(assert (=> start!105840 tp!95173))

(assert (=> start!105840 tp_is_empty!32119))

(declare-fun array_inv!30229 (array!81917) Bool)

(assert (=> start!105840 (array_inv!30229 _keys!1118)))

(declare-fun e!716316 () Bool)

(declare-fun array_inv!30230 (array!81919) Bool)

(assert (=> start!105840 (and (array_inv!30230 _values!914) e!716316)))

(declare-fun b!1259391 () Bool)

(assert (=> b!1259391 (= e!716316 (and e!716315 mapRes!49972))))

(declare-fun condMapEmpty!49972 () Bool)

(declare-fun mapDefault!49972 () ValueCell!15296)

(assert (=> b!1259391 (= condMapEmpty!49972 (= (arr!39511 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15296)) mapDefault!49972)))))

(declare-fun b!1259393 () Bool)

(declare-fun res!839063 () Bool)

(assert (=> b!1259393 (=> (not res!839063) (not e!716314))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81917 (_ BitVec 32)) Bool)

(assert (=> b!1259393 (= res!839063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!49972 () Bool)

(assert (=> mapIsEmpty!49972 mapRes!49972))

(assert (= (and start!105840 res!839064) b!1259388))

(assert (= (and b!1259388 res!839067) b!1259393))

(assert (= (and b!1259393 res!839063) b!1259389))

(assert (= (and b!1259389 res!839066) b!1259387))

(assert (= (and b!1259387 (not res!839065)) b!1259386))

(assert (= (and b!1259391 condMapEmpty!49972) mapIsEmpty!49972))

(assert (= (and b!1259391 (not condMapEmpty!49972)) mapNonEmpty!49972))

(get-info :version)

(assert (= (and mapNonEmpty!49972 ((_ is ValueCellFull!15296) mapValue!49972)) b!1259390))

(assert (= (and b!1259391 ((_ is ValueCellFull!15296) mapDefault!49972)) b!1259392))

(assert (= start!105840 b!1259391))

(declare-fun m!1160181 () Bool)

(assert (=> b!1259393 m!1160181))

(declare-fun m!1160183 () Bool)

(assert (=> start!105840 m!1160183))

(declare-fun m!1160185 () Bool)

(assert (=> start!105840 m!1160185))

(declare-fun m!1160187 () Bool)

(assert (=> start!105840 m!1160187))

(declare-fun m!1160189 () Bool)

(assert (=> mapNonEmpty!49972 m!1160189))

(declare-fun m!1160191 () Bool)

(assert (=> b!1259386 m!1160191))

(declare-fun m!1160193 () Bool)

(assert (=> b!1259387 m!1160193))

(declare-fun m!1160195 () Bool)

(assert (=> b!1259387 m!1160195))

(declare-fun m!1160197 () Bool)

(assert (=> b!1259387 m!1160197))

(declare-fun m!1160199 () Bool)

(assert (=> b!1259389 m!1160199))

(check-sat (not b!1259389) b_and!45093 (not b!1259393) (not mapNonEmpty!49972) (not b!1259387) (not b!1259386) tp_is_empty!32119 (not start!105840) (not b_next!27217))
(check-sat b_and!45093 (not b_next!27217))
