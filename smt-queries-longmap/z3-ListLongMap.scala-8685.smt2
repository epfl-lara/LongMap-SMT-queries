; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105732 () Bool)

(assert start!105732)

(declare-fun b_free!27145 () Bool)

(declare-fun b_next!27145 () Bool)

(assert (=> start!105732 (= b_free!27145 (not b_next!27145))))

(declare-fun tp!94952 () Bool)

(declare-fun b_and!45003 () Bool)

(assert (=> start!105732 (= tp!94952 b_and!45003)))

(declare-fun b!1258336 () Bool)

(declare-fun e!715567 () Bool)

(declare-fun e!715568 () Bool)

(assert (=> b!1258336 (= e!715567 (not e!715568))))

(declare-fun res!838490 () Bool)

(assert (=> b!1258336 (=> res!838490 e!715568)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1258336 (= res!838490 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!48095 0))(
  ( (V!48096 (val!16086 Int)) )
))
(declare-datatypes ((tuple2!20806 0))(
  ( (tuple2!20807 (_1!10414 (_ BitVec 64)) (_2!10414 V!48095)) )
))
(declare-datatypes ((List!28034 0))(
  ( (Nil!28031) (Cons!28030 (h!29248 tuple2!20806) (t!41515 List!28034)) )
))
(declare-datatypes ((ListLongMap!18687 0))(
  ( (ListLongMap!18688 (toList!9359 List!28034)) )
))
(declare-fun lt!568969 () ListLongMap!18687)

(declare-fun lt!568971 () ListLongMap!18687)

(assert (=> b!1258336 (= lt!568969 lt!568971)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48095)

(declare-datatypes ((Unit!41859 0))(
  ( (Unit!41860) )
))
(declare-fun lt!568970 () Unit!41859)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48095)

(declare-datatypes ((array!81775 0))(
  ( (array!81776 (arr!39441 (Array (_ BitVec 32) (_ BitVec 64))) (size!39978 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81775)

(declare-datatypes ((ValueCell!15260 0))(
  ( (ValueCellFull!15260 (v!18783 V!48095)) (EmptyCell!15260) )
))
(declare-datatypes ((array!81777 0))(
  ( (array!81778 (arr!39442 (Array (_ BitVec 32) ValueCell!15260)) (size!39979 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81777)

(declare-fun minValueBefore!43 () V!48095)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1090 (array!81775 array!81777 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48095 V!48095 V!48095 V!48095 (_ BitVec 32) Int) Unit!41859)

(assert (=> b!1258336 (= lt!568970 (lemmaNoChangeToArrayThenSameMapNoExtras!1090 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5776 (array!81775 array!81777 (_ BitVec 32) (_ BitVec 32) V!48095 V!48095 (_ BitVec 32) Int) ListLongMap!18687)

(assert (=> b!1258336 (= lt!568971 (getCurrentListMapNoExtraKeys!5776 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258336 (= lt!568969 (getCurrentListMapNoExtraKeys!5776 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49858 () Bool)

(declare-fun mapRes!49858 () Bool)

(assert (=> mapIsEmpty!49858 mapRes!49858))

(declare-fun res!838491 () Bool)

(assert (=> start!105732 (=> (not res!838491) (not e!715567))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105732 (= res!838491 (validMask!0 mask!1466))))

(assert (=> start!105732 e!715567))

(assert (=> start!105732 true))

(assert (=> start!105732 tp!94952))

(declare-fun tp_is_empty!32047 () Bool)

(assert (=> start!105732 tp_is_empty!32047))

(declare-fun array_inv!30177 (array!81775) Bool)

(assert (=> start!105732 (array_inv!30177 _keys!1118)))

(declare-fun e!715564 () Bool)

(declare-fun array_inv!30178 (array!81777) Bool)

(assert (=> start!105732 (and (array_inv!30178 _values!914) e!715564)))

(declare-fun b!1258337 () Bool)

(declare-fun e!715565 () Bool)

(assert (=> b!1258337 (= e!715565 tp_is_empty!32047)))

(declare-fun b!1258338 () Bool)

(assert (=> b!1258338 (= e!715564 (and e!715565 mapRes!49858))))

(declare-fun condMapEmpty!49858 () Bool)

(declare-fun mapDefault!49858 () ValueCell!15260)

(assert (=> b!1258338 (= condMapEmpty!49858 (= (arr!39442 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15260)) mapDefault!49858)))))

(declare-fun b!1258339 () Bool)

(declare-fun e!715569 () Bool)

(assert (=> b!1258339 (= e!715569 true)))

(declare-fun lt!568968 () ListLongMap!18687)

(declare-fun -!2071 (ListLongMap!18687 (_ BitVec 64)) ListLongMap!18687)

(assert (=> b!1258339 (= (-!2071 lt!568968 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568968)))

(declare-fun lt!568967 () Unit!41859)

(declare-fun removeNotPresentStillSame!143 (ListLongMap!18687 (_ BitVec 64)) Unit!41859)

(assert (=> b!1258339 (= lt!568967 (removeNotPresentStillSame!143 lt!568968 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1258340 () Bool)

(declare-fun res!838492 () Bool)

(assert (=> b!1258340 (=> (not res!838492) (not e!715567))))

(assert (=> b!1258340 (= res!838492 (and (= (size!39979 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39978 _keys!1118) (size!39979 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1258341 () Bool)

(declare-fun res!838489 () Bool)

(assert (=> b!1258341 (=> (not res!838489) (not e!715567))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81775 (_ BitVec 32)) Bool)

(assert (=> b!1258341 (= res!838489 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1258342 () Bool)

(assert (=> b!1258342 (= e!715568 e!715569)))

(declare-fun res!838487 () Bool)

(assert (=> b!1258342 (=> res!838487 e!715569)))

(declare-fun contains!7587 (ListLongMap!18687 (_ BitVec 64)) Bool)

(assert (=> b!1258342 (= res!838487 (contains!7587 lt!568968 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4564 (array!81775 array!81777 (_ BitVec 32) (_ BitVec 32) V!48095 V!48095 (_ BitVec 32) Int) ListLongMap!18687)

(assert (=> b!1258342 (= lt!568968 (getCurrentListMap!4564 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258343 () Bool)

(declare-fun res!838488 () Bool)

(assert (=> b!1258343 (=> (not res!838488) (not e!715567))))

(declare-datatypes ((List!28035 0))(
  ( (Nil!28032) (Cons!28031 (h!29249 (_ BitVec 64)) (t!41516 List!28035)) )
))
(declare-fun arrayNoDuplicates!0 (array!81775 (_ BitVec 32) List!28035) Bool)

(assert (=> b!1258343 (= res!838488 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28032))))

(declare-fun b!1258344 () Bool)

(declare-fun e!715570 () Bool)

(assert (=> b!1258344 (= e!715570 tp_is_empty!32047)))

(declare-fun mapNonEmpty!49858 () Bool)

(declare-fun tp!94951 () Bool)

(assert (=> mapNonEmpty!49858 (= mapRes!49858 (and tp!94951 e!715570))))

(declare-fun mapRest!49858 () (Array (_ BitVec 32) ValueCell!15260))

(declare-fun mapKey!49858 () (_ BitVec 32))

(declare-fun mapValue!49858 () ValueCell!15260)

(assert (=> mapNonEmpty!49858 (= (arr!39442 _values!914) (store mapRest!49858 mapKey!49858 mapValue!49858))))

(assert (= (and start!105732 res!838491) b!1258340))

(assert (= (and b!1258340 res!838492) b!1258341))

(assert (= (and b!1258341 res!838489) b!1258343))

(assert (= (and b!1258343 res!838488) b!1258336))

(assert (= (and b!1258336 (not res!838490)) b!1258342))

(assert (= (and b!1258342 (not res!838487)) b!1258339))

(assert (= (and b!1258338 condMapEmpty!49858) mapIsEmpty!49858))

(assert (= (and b!1258338 (not condMapEmpty!49858)) mapNonEmpty!49858))

(get-info :version)

(assert (= (and mapNonEmpty!49858 ((_ is ValueCellFull!15260) mapValue!49858)) b!1258344))

(assert (= (and b!1258338 ((_ is ValueCellFull!15260) mapDefault!49858)) b!1258337))

(assert (= start!105732 b!1258338))

(declare-fun m!1159269 () Bool)

(assert (=> b!1258342 m!1159269))

(declare-fun m!1159271 () Bool)

(assert (=> b!1258342 m!1159271))

(declare-fun m!1159273 () Bool)

(assert (=> b!1258339 m!1159273))

(declare-fun m!1159275 () Bool)

(assert (=> b!1258339 m!1159275))

(declare-fun m!1159277 () Bool)

(assert (=> mapNonEmpty!49858 m!1159277))

(declare-fun m!1159279 () Bool)

(assert (=> b!1258341 m!1159279))

(declare-fun m!1159281 () Bool)

(assert (=> b!1258343 m!1159281))

(declare-fun m!1159283 () Bool)

(assert (=> b!1258336 m!1159283))

(declare-fun m!1159285 () Bool)

(assert (=> b!1258336 m!1159285))

(declare-fun m!1159287 () Bool)

(assert (=> b!1258336 m!1159287))

(declare-fun m!1159289 () Bool)

(assert (=> start!105732 m!1159289))

(declare-fun m!1159291 () Bool)

(assert (=> start!105732 m!1159291))

(declare-fun m!1159293 () Bool)

(assert (=> start!105732 m!1159293))

(check-sat (not b!1258343) (not b!1258339) (not b!1258336) (not mapNonEmpty!49858) tp_is_empty!32047 (not b_next!27145) (not b!1258341) (not start!105732) b_and!45003 (not b!1258342))
(check-sat b_and!45003 (not b_next!27145))
