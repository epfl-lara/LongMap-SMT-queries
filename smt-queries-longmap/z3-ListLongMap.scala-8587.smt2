; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104748 () Bool)

(assert start!104748)

(declare-fun b_free!26557 () Bool)

(declare-fun b_next!26557 () Bool)

(assert (=> start!104748 (= b_free!26557 (not b_next!26557))))

(declare-fun tp!93161 () Bool)

(declare-fun b_and!44307 () Bool)

(assert (=> start!104748 (= tp!93161 b_and!44307)))

(declare-fun mapIsEmpty!48949 () Bool)

(declare-fun mapRes!48949 () Bool)

(assert (=> mapIsEmpty!48949 mapRes!48949))

(declare-fun b!1248656 () Bool)

(declare-fun e!708588 () Bool)

(assert (=> b!1248656 (= e!708588 false)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((V!47311 0))(
  ( (V!47312 (val!15792 Int)) )
))
(declare-fun minValueAfter!43 () V!47311)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47311)

(declare-datatypes ((array!80519 0))(
  ( (array!80520 (arr!38827 (Array (_ BitVec 32) (_ BitVec 64))) (size!39365 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80519)

(declare-datatypes ((ValueCell!14966 0))(
  ( (ValueCellFull!14966 (v!18487 V!47311)) (EmptyCell!14966) )
))
(declare-datatypes ((array!80521 0))(
  ( (array!80522 (arr!38828 (Array (_ BitVec 32) ValueCell!14966)) (size!39366 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80521)

(declare-datatypes ((tuple2!20418 0))(
  ( (tuple2!20419 (_1!10220 (_ BitVec 64)) (_2!10220 V!47311)) )
))
(declare-datatypes ((List!27649 0))(
  ( (Nil!27646) (Cons!27645 (h!28854 tuple2!20418) (t!41111 List!27649)) )
))
(declare-datatypes ((ListLongMap!18291 0))(
  ( (ListLongMap!18292 (toList!9161 List!27649)) )
))
(declare-fun lt!563321 () ListLongMap!18291)

(declare-fun getCurrentListMapNoExtraKeys!5578 (array!80519 array!80521 (_ BitVec 32) (_ BitVec 32) V!47311 V!47311 (_ BitVec 32) Int) ListLongMap!18291)

(assert (=> b!1248656 (= lt!563321 (getCurrentListMapNoExtraKeys!5578 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun lt!563320 () ListLongMap!18291)

(declare-fun minValueBefore!43 () V!47311)

(assert (=> b!1248656 (= lt!563320 (getCurrentListMapNoExtraKeys!5578 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1248657 () Bool)

(declare-fun res!833025 () Bool)

(assert (=> b!1248657 (=> (not res!833025) (not e!708588))))

(assert (=> b!1248657 (= res!833025 (and (= (size!39366 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39365 _keys!1118) (size!39366 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1248658 () Bool)

(declare-fun res!833024 () Bool)

(assert (=> b!1248658 (=> (not res!833024) (not e!708588))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80519 (_ BitVec 32)) Bool)

(assert (=> b!1248658 (= res!833024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1248659 () Bool)

(declare-fun e!708591 () Bool)

(declare-fun tp_is_empty!31459 () Bool)

(assert (=> b!1248659 (= e!708591 tp_is_empty!31459)))

(declare-fun b!1248660 () Bool)

(declare-fun res!833026 () Bool)

(assert (=> b!1248660 (=> (not res!833026) (not e!708588))))

(declare-datatypes ((List!27650 0))(
  ( (Nil!27647) (Cons!27646 (h!28855 (_ BitVec 64)) (t!41112 List!27650)) )
))
(declare-fun arrayNoDuplicates!0 (array!80519 (_ BitVec 32) List!27650) Bool)

(assert (=> b!1248660 (= res!833026 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27647))))

(declare-fun b!1248661 () Bool)

(declare-fun e!708590 () Bool)

(declare-fun e!708589 () Bool)

(assert (=> b!1248661 (= e!708590 (and e!708589 mapRes!48949))))

(declare-fun condMapEmpty!48949 () Bool)

(declare-fun mapDefault!48949 () ValueCell!14966)

(assert (=> b!1248661 (= condMapEmpty!48949 (= (arr!38828 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14966)) mapDefault!48949)))))

(declare-fun mapNonEmpty!48949 () Bool)

(declare-fun tp!93160 () Bool)

(assert (=> mapNonEmpty!48949 (= mapRes!48949 (and tp!93160 e!708591))))

(declare-fun mapValue!48949 () ValueCell!14966)

(declare-fun mapKey!48949 () (_ BitVec 32))

(declare-fun mapRest!48949 () (Array (_ BitVec 32) ValueCell!14966))

(assert (=> mapNonEmpty!48949 (= (arr!38828 _values!914) (store mapRest!48949 mapKey!48949 mapValue!48949))))

(declare-fun b!1248662 () Bool)

(assert (=> b!1248662 (= e!708589 tp_is_empty!31459)))

(declare-fun res!833027 () Bool)

(assert (=> start!104748 (=> (not res!833027) (not e!708588))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104748 (= res!833027 (validMask!0 mask!1466))))

(assert (=> start!104748 e!708588))

(assert (=> start!104748 true))

(assert (=> start!104748 tp!93161))

(assert (=> start!104748 tp_is_empty!31459))

(declare-fun array_inv!29765 (array!80519) Bool)

(assert (=> start!104748 (array_inv!29765 _keys!1118)))

(declare-fun array_inv!29766 (array!80521) Bool)

(assert (=> start!104748 (and (array_inv!29766 _values!914) e!708590)))

(assert (= (and start!104748 res!833027) b!1248657))

(assert (= (and b!1248657 res!833025) b!1248658))

(assert (= (and b!1248658 res!833024) b!1248660))

(assert (= (and b!1248660 res!833026) b!1248656))

(assert (= (and b!1248661 condMapEmpty!48949) mapIsEmpty!48949))

(assert (= (and b!1248661 (not condMapEmpty!48949)) mapNonEmpty!48949))

(get-info :version)

(assert (= (and mapNonEmpty!48949 ((_ is ValueCellFull!14966) mapValue!48949)) b!1248659))

(assert (= (and b!1248661 ((_ is ValueCellFull!14966) mapDefault!48949)) b!1248662))

(assert (= start!104748 b!1248661))

(declare-fun m!1149295 () Bool)

(assert (=> b!1248658 m!1149295))

(declare-fun m!1149297 () Bool)

(assert (=> b!1248656 m!1149297))

(declare-fun m!1149299 () Bool)

(assert (=> b!1248656 m!1149299))

(declare-fun m!1149301 () Bool)

(assert (=> b!1248660 m!1149301))

(declare-fun m!1149303 () Bool)

(assert (=> start!104748 m!1149303))

(declare-fun m!1149305 () Bool)

(assert (=> start!104748 m!1149305))

(declare-fun m!1149307 () Bool)

(assert (=> start!104748 m!1149307))

(declare-fun m!1149309 () Bool)

(assert (=> mapNonEmpty!48949 m!1149309))

(check-sat (not b!1248658) (not b!1248656) (not b_next!26557) tp_is_empty!31459 (not mapNonEmpty!48949) b_and!44307 (not start!104748) (not b!1248660))
(check-sat b_and!44307 (not b_next!26557))
