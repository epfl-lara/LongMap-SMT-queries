; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105712 () Bool)

(assert start!105712)

(declare-fun b_free!27297 () Bool)

(declare-fun b_next!27297 () Bool)

(assert (=> start!105712 (= b_free!27297 (not b_next!27297))))

(declare-fun tp!95416 () Bool)

(declare-fun b_and!45181 () Bool)

(assert (=> start!105712 (= tp!95416 b_and!45181)))

(declare-fun b!1259230 () Bool)

(declare-fun e!716322 () Bool)

(declare-fun e!716324 () Bool)

(assert (=> b!1259230 (= e!716322 (not e!716324))))

(declare-fun res!839245 () Bool)

(assert (=> b!1259230 (=> res!839245 e!716324)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1259230 (= res!839245 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!48297 0))(
  ( (V!48298 (val!16162 Int)) )
))
(declare-datatypes ((tuple2!20888 0))(
  ( (tuple2!20889 (_1!10455 (_ BitVec 64)) (_2!10455 V!48297)) )
))
(declare-datatypes ((List!28096 0))(
  ( (Nil!28093) (Cons!28092 (h!29301 tuple2!20888) (t!41591 List!28096)) )
))
(declare-datatypes ((ListLongMap!18761 0))(
  ( (ListLongMap!18762 (toList!9396 List!28096)) )
))
(declare-fun lt!569837 () ListLongMap!18761)

(declare-fun lt!569838 () ListLongMap!18761)

(assert (=> b!1259230 (= lt!569837 lt!569838)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48297)

(declare-datatypes ((Unit!41975 0))(
  ( (Unit!41976) )
))
(declare-fun lt!569839 () Unit!41975)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48297)

(declare-datatypes ((array!82016 0))(
  ( (array!82017 (arr!39563 (Array (_ BitVec 32) (_ BitVec 64))) (size!40099 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82016)

(declare-datatypes ((ValueCell!15336 0))(
  ( (ValueCellFull!15336 (v!18864 V!48297)) (EmptyCell!15336) )
))
(declare-datatypes ((array!82018 0))(
  ( (array!82019 (arr!39564 (Array (_ BitVec 32) ValueCell!15336)) (size!40100 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82018)

(declare-fun minValueBefore!43 () V!48297)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1136 (array!82016 array!82018 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48297 V!48297 V!48297 V!48297 (_ BitVec 32) Int) Unit!41975)

(assert (=> b!1259230 (= lt!569839 (lemmaNoChangeToArrayThenSameMapNoExtras!1136 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5772 (array!82016 array!82018 (_ BitVec 32) (_ BitVec 32) V!48297 V!48297 (_ BitVec 32) Int) ListLongMap!18761)

(assert (=> b!1259230 (= lt!569838 (getCurrentListMapNoExtraKeys!5772 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259230 (= lt!569837 (getCurrentListMapNoExtraKeys!5772 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!50095 () Bool)

(declare-fun mapRes!50095 () Bool)

(assert (=> mapIsEmpty!50095 mapRes!50095))

(declare-fun b!1259231 () Bool)

(assert (=> b!1259231 (= e!716324 true)))

(declare-fun lt!569841 () ListLongMap!18761)

(declare-fun lt!569843 () ListLongMap!18761)

(declare-fun -!2103 (ListLongMap!18761 (_ BitVec 64)) ListLongMap!18761)

(assert (=> b!1259231 (= lt!569841 (-!2103 lt!569843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!569844 () ListLongMap!18761)

(declare-fun lt!569842 () ListLongMap!18761)

(assert (=> b!1259231 (= (-!2103 lt!569844 #b1000000000000000000000000000000000000000000000000000000000000000) lt!569842)))

(declare-fun lt!569845 () Unit!41975)

(declare-fun addThenRemoveForNewKeyIsSame!340 (ListLongMap!18761 (_ BitVec 64) V!48297) Unit!41975)

(assert (=> b!1259231 (= lt!569845 (addThenRemoveForNewKeyIsSame!340 lt!569842 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!716323 () Bool)

(assert (=> b!1259231 e!716323))

(declare-fun res!839246 () Bool)

(assert (=> b!1259231 (=> (not res!839246) (not e!716323))))

(assert (=> b!1259231 (= res!839246 (= lt!569843 lt!569844))))

(declare-fun +!4201 (ListLongMap!18761 tuple2!20888) ListLongMap!18761)

(assert (=> b!1259231 (= lt!569844 (+!4201 lt!569842 (tuple2!20889 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!569840 () tuple2!20888)

(assert (=> b!1259231 (= lt!569842 (+!4201 lt!569837 lt!569840))))

(assert (=> b!1259231 (= lt!569840 (tuple2!20889 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun lt!569846 () ListLongMap!18761)

(declare-fun getCurrentListMap!4594 (array!82016 array!82018 (_ BitVec 32) (_ BitVec 32) V!48297 V!48297 (_ BitVec 32) Int) ListLongMap!18761)

(assert (=> b!1259231 (= lt!569846 (getCurrentListMap!4594 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259231 (= lt!569843 (getCurrentListMap!4594 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259232 () Bool)

(declare-fun e!716319 () Bool)

(declare-fun tp_is_empty!32199 () Bool)

(assert (=> b!1259232 (= e!716319 tp_is_empty!32199)))

(declare-fun mapNonEmpty!50095 () Bool)

(declare-fun tp!95417 () Bool)

(assert (=> mapNonEmpty!50095 (= mapRes!50095 (and tp!95417 e!716319))))

(declare-fun mapValue!50095 () ValueCell!15336)

(declare-fun mapRest!50095 () (Array (_ BitVec 32) ValueCell!15336))

(declare-fun mapKey!50095 () (_ BitVec 32))

(assert (=> mapNonEmpty!50095 (= (arr!39564 _values!914) (store mapRest!50095 mapKey!50095 mapValue!50095))))

(declare-fun b!1259233 () Bool)

(declare-fun res!839247 () Bool)

(assert (=> b!1259233 (=> (not res!839247) (not e!716322))))

(assert (=> b!1259233 (= res!839247 (and (= (size!40100 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40099 _keys!1118) (size!40100 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1259234 () Bool)

(assert (=> b!1259234 (= e!716323 (= lt!569846 (+!4201 lt!569838 lt!569840)))))

(declare-fun b!1259235 () Bool)

(declare-fun e!716325 () Bool)

(declare-fun e!716321 () Bool)

(assert (=> b!1259235 (= e!716325 (and e!716321 mapRes!50095))))

(declare-fun condMapEmpty!50095 () Bool)

(declare-fun mapDefault!50095 () ValueCell!15336)

(assert (=> b!1259235 (= condMapEmpty!50095 (= (arr!39564 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15336)) mapDefault!50095)))))

(declare-fun b!1259236 () Bool)

(assert (=> b!1259236 (= e!716321 tp_is_empty!32199)))

(declare-fun res!839244 () Bool)

(assert (=> start!105712 (=> (not res!839244) (not e!716322))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105712 (= res!839244 (validMask!0 mask!1466))))

(assert (=> start!105712 e!716322))

(assert (=> start!105712 true))

(assert (=> start!105712 tp!95416))

(assert (=> start!105712 tp_is_empty!32199))

(declare-fun array_inv!30123 (array!82016) Bool)

(assert (=> start!105712 (array_inv!30123 _keys!1118)))

(declare-fun array_inv!30124 (array!82018) Bool)

(assert (=> start!105712 (and (array_inv!30124 _values!914) e!716325)))

(declare-fun b!1259237 () Bool)

(declare-fun res!839242 () Bool)

(assert (=> b!1259237 (=> (not res!839242) (not e!716322))))

(declare-datatypes ((List!28097 0))(
  ( (Nil!28094) (Cons!28093 (h!29302 (_ BitVec 64)) (t!41592 List!28097)) )
))
(declare-fun arrayNoDuplicates!0 (array!82016 (_ BitVec 32) List!28097) Bool)

(assert (=> b!1259237 (= res!839242 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28094))))

(declare-fun b!1259238 () Bool)

(declare-fun res!839243 () Bool)

(assert (=> b!1259238 (=> (not res!839243) (not e!716322))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82016 (_ BitVec 32)) Bool)

(assert (=> b!1259238 (= res!839243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!105712 res!839244) b!1259233))

(assert (= (and b!1259233 res!839247) b!1259238))

(assert (= (and b!1259238 res!839243) b!1259237))

(assert (= (and b!1259237 res!839242) b!1259230))

(assert (= (and b!1259230 (not res!839245)) b!1259231))

(assert (= (and b!1259231 res!839246) b!1259234))

(assert (= (and b!1259235 condMapEmpty!50095) mapIsEmpty!50095))

(assert (= (and b!1259235 (not condMapEmpty!50095)) mapNonEmpty!50095))

(get-info :version)

(assert (= (and mapNonEmpty!50095 ((_ is ValueCellFull!15336) mapValue!50095)) b!1259232))

(assert (= (and b!1259235 ((_ is ValueCellFull!15336) mapDefault!50095)) b!1259236))

(assert (= start!105712 b!1259235))

(declare-fun m!1159651 () Bool)

(assert (=> b!1259237 m!1159651))

(declare-fun m!1159653 () Bool)

(assert (=> mapNonEmpty!50095 m!1159653))

(declare-fun m!1159655 () Bool)

(assert (=> b!1259230 m!1159655))

(declare-fun m!1159657 () Bool)

(assert (=> b!1259230 m!1159657))

(declare-fun m!1159659 () Bool)

(assert (=> b!1259230 m!1159659))

(declare-fun m!1159661 () Bool)

(assert (=> b!1259238 m!1159661))

(declare-fun m!1159663 () Bool)

(assert (=> b!1259234 m!1159663))

(declare-fun m!1159665 () Bool)

(assert (=> b!1259231 m!1159665))

(declare-fun m!1159667 () Bool)

(assert (=> b!1259231 m!1159667))

(declare-fun m!1159669 () Bool)

(assert (=> b!1259231 m!1159669))

(declare-fun m!1159671 () Bool)

(assert (=> b!1259231 m!1159671))

(declare-fun m!1159673 () Bool)

(assert (=> b!1259231 m!1159673))

(declare-fun m!1159675 () Bool)

(assert (=> b!1259231 m!1159675))

(declare-fun m!1159677 () Bool)

(assert (=> b!1259231 m!1159677))

(declare-fun m!1159679 () Bool)

(assert (=> start!105712 m!1159679))

(declare-fun m!1159681 () Bool)

(assert (=> start!105712 m!1159681))

(declare-fun m!1159683 () Bool)

(assert (=> start!105712 m!1159683))

(check-sat (not start!105712) (not b!1259234) tp_is_empty!32199 (not b!1259237) b_and!45181 (not b!1259238) (not mapNonEmpty!50095) (not b_next!27297) (not b!1259230) (not b!1259231))
(check-sat b_and!45181 (not b_next!27297))
