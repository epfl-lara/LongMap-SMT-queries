; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105580 () Bool)

(assert start!105580)

(declare-fun b_free!27195 () Bool)

(declare-fun b_next!27195 () Bool)

(assert (=> start!105580 (= b_free!27195 (not b_next!27195))))

(declare-fun tp!95104 () Bool)

(declare-fun b_and!45061 () Bool)

(assert (=> start!105580 (= tp!95104 b_and!45061)))

(declare-fun b!1257763 () Bool)

(declare-fun res!838378 () Bool)

(declare-fun e!715245 () Bool)

(assert (=> b!1257763 (=> (not res!838378) (not e!715245))))

(declare-datatypes ((array!81826 0))(
  ( (array!81827 (arr!39470 (Array (_ BitVec 32) (_ BitVec 64))) (size!40006 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81826)

(declare-datatypes ((List!28031 0))(
  ( (Nil!28028) (Cons!28027 (h!29236 (_ BitVec 64)) (t!41522 List!28031)) )
))
(declare-fun arrayNoDuplicates!0 (array!81826 (_ BitVec 32) List!28031) Bool)

(assert (=> b!1257763 (= res!838378 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28028))))

(declare-fun b!1257764 () Bool)

(assert (=> b!1257764 (= e!715245 (not true))))

(declare-datatypes ((V!48161 0))(
  ( (V!48162 (val!16111 Int)) )
))
(declare-datatypes ((tuple2!20818 0))(
  ( (tuple2!20819 (_1!10420 (_ BitVec 64)) (_2!10420 V!48161)) )
))
(declare-datatypes ((List!28032 0))(
  ( (Nil!28029) (Cons!28028 (h!29237 tuple2!20818) (t!41523 List!28032)) )
))
(declare-datatypes ((ListLongMap!18691 0))(
  ( (ListLongMap!18692 (toList!9361 List!28032)) )
))
(declare-fun lt!568883 () ListLongMap!18691)

(declare-fun lt!568882 () ListLongMap!18691)

(assert (=> b!1257764 (= lt!568883 lt!568882)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun minValueAfter!43 () V!48161)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48161)

(declare-fun minValueBefore!43 () V!48161)

(declare-datatypes ((Unit!41906 0))(
  ( (Unit!41907) )
))
(declare-fun lt!568884 () Unit!41906)

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((ValueCell!15285 0))(
  ( (ValueCellFull!15285 (v!18813 V!48161)) (EmptyCell!15285) )
))
(declare-datatypes ((array!81828 0))(
  ( (array!81829 (arr!39471 (Array (_ BitVec 32) ValueCell!15285)) (size!40007 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81828)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1103 (array!81826 array!81828 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48161 V!48161 V!48161 V!48161 (_ BitVec 32) Int) Unit!41906)

(assert (=> b!1257764 (= lt!568884 (lemmaNoChangeToArrayThenSameMapNoExtras!1103 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5739 (array!81826 array!81828 (_ BitVec 32) (_ BitVec 32) V!48161 V!48161 (_ BitVec 32) Int) ListLongMap!18691)

(assert (=> b!1257764 (= lt!568882 (getCurrentListMapNoExtraKeys!5739 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1257764 (= lt!568883 (getCurrentListMapNoExtraKeys!5739 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49936 () Bool)

(declare-fun mapRes!49936 () Bool)

(assert (=> mapIsEmpty!49936 mapRes!49936))

(declare-fun b!1257766 () Bool)

(declare-fun res!838381 () Bool)

(assert (=> b!1257766 (=> (not res!838381) (not e!715245))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81826 (_ BitVec 32)) Bool)

(assert (=> b!1257766 (= res!838381 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!49936 () Bool)

(declare-fun tp!95105 () Bool)

(declare-fun e!715244 () Bool)

(assert (=> mapNonEmpty!49936 (= mapRes!49936 (and tp!95105 e!715244))))

(declare-fun mapKey!49936 () (_ BitVec 32))

(declare-fun mapValue!49936 () ValueCell!15285)

(declare-fun mapRest!49936 () (Array (_ BitVec 32) ValueCell!15285))

(assert (=> mapNonEmpty!49936 (= (arr!39471 _values!914) (store mapRest!49936 mapKey!49936 mapValue!49936))))

(declare-fun b!1257767 () Bool)

(declare-fun e!715242 () Bool)

(declare-fun tp_is_empty!32097 () Bool)

(assert (=> b!1257767 (= e!715242 tp_is_empty!32097)))

(declare-fun b!1257768 () Bool)

(declare-fun e!715243 () Bool)

(assert (=> b!1257768 (= e!715243 (and e!715242 mapRes!49936))))

(declare-fun condMapEmpty!49936 () Bool)

(declare-fun mapDefault!49936 () ValueCell!15285)

(assert (=> b!1257768 (= condMapEmpty!49936 (= (arr!39471 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15285)) mapDefault!49936)))))

(declare-fun b!1257769 () Bool)

(declare-fun res!838380 () Bool)

(assert (=> b!1257769 (=> (not res!838380) (not e!715245))))

(assert (=> b!1257769 (= res!838380 (and (= (size!40007 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40006 _keys!1118) (size!40007 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!838379 () Bool)

(assert (=> start!105580 (=> (not res!838379) (not e!715245))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105580 (= res!838379 (validMask!0 mask!1466))))

(assert (=> start!105580 e!715245))

(assert (=> start!105580 true))

(assert (=> start!105580 tp!95104))

(assert (=> start!105580 tp_is_empty!32097))

(declare-fun array_inv!30065 (array!81826) Bool)

(assert (=> start!105580 (array_inv!30065 _keys!1118)))

(declare-fun array_inv!30066 (array!81828) Bool)

(assert (=> start!105580 (and (array_inv!30066 _values!914) e!715243)))

(declare-fun b!1257765 () Bool)

(assert (=> b!1257765 (= e!715244 tp_is_empty!32097)))

(assert (= (and start!105580 res!838379) b!1257769))

(assert (= (and b!1257769 res!838380) b!1257766))

(assert (= (and b!1257766 res!838381) b!1257763))

(assert (= (and b!1257763 res!838378) b!1257764))

(assert (= (and b!1257768 condMapEmpty!49936) mapIsEmpty!49936))

(assert (= (and b!1257768 (not condMapEmpty!49936)) mapNonEmpty!49936))

(get-info :version)

(assert (= (and mapNonEmpty!49936 ((_ is ValueCellFull!15285) mapValue!49936)) b!1257765))

(assert (= (and b!1257768 ((_ is ValueCellFull!15285) mapDefault!49936)) b!1257767))

(assert (= start!105580 b!1257768))

(declare-fun m!1158305 () Bool)

(assert (=> b!1257763 m!1158305))

(declare-fun m!1158307 () Bool)

(assert (=> b!1257764 m!1158307))

(declare-fun m!1158309 () Bool)

(assert (=> b!1257764 m!1158309))

(declare-fun m!1158311 () Bool)

(assert (=> b!1257764 m!1158311))

(declare-fun m!1158313 () Bool)

(assert (=> b!1257766 m!1158313))

(declare-fun m!1158315 () Bool)

(assert (=> mapNonEmpty!49936 m!1158315))

(declare-fun m!1158317 () Bool)

(assert (=> start!105580 m!1158317))

(declare-fun m!1158319 () Bool)

(assert (=> start!105580 m!1158319))

(declare-fun m!1158321 () Bool)

(assert (=> start!105580 m!1158321))

(check-sat (not b!1257763) (not b_next!27195) (not start!105580) (not b!1257764) (not mapNonEmpty!49936) (not b!1257766) tp_is_empty!32097 b_and!45061)
(check-sat b_and!45061 (not b_next!27195))
