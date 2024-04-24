; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106016 () Bool)

(assert start!106016)

(declare-fun b_free!27355 () Bool)

(declare-fun b_next!27355 () Bool)

(assert (=> start!106016 (= b_free!27355 (not b_next!27355))))

(declare-fun tp!95593 () Bool)

(declare-fun b_and!45253 () Bool)

(assert (=> start!106016 (= tp!95593 b_and!45253)))

(declare-fun b!1261506 () Bool)

(declare-fun res!840372 () Bool)

(declare-fun e!717901 () Bool)

(assert (=> b!1261506 (=> (not res!840372) (not e!717901))))

(declare-datatypes ((array!82183 0))(
  ( (array!82184 (arr!39641 (Array (_ BitVec 32) (_ BitVec 64))) (size!40178 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82183)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82183 (_ BitVec 32)) Bool)

(assert (=> b!1261506 (= res!840372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1261507 () Bool)

(declare-fun e!717896 () Bool)

(declare-fun e!717902 () Bool)

(declare-fun mapRes!50185 () Bool)

(assert (=> b!1261507 (= e!717896 (and e!717902 mapRes!50185))))

(declare-fun condMapEmpty!50185 () Bool)

(declare-datatypes ((V!48375 0))(
  ( (V!48376 (val!16191 Int)) )
))
(declare-datatypes ((ValueCell!15365 0))(
  ( (ValueCellFull!15365 (v!18890 V!48375)) (EmptyCell!15365) )
))
(declare-datatypes ((array!82185 0))(
  ( (array!82186 (arr!39642 (Array (_ BitVec 32) ValueCell!15365)) (size!40179 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82185)

(declare-fun mapDefault!50185 () ValueCell!15365)

(assert (=> b!1261507 (= condMapEmpty!50185 (= (arr!39642 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15365)) mapDefault!50185)))))

(declare-fun b!1261508 () Bool)

(declare-fun e!717899 () Bool)

(assert (=> b!1261508 (= e!717899 true)))

(declare-datatypes ((tuple2!20958 0))(
  ( (tuple2!20959 (_1!10490 (_ BitVec 64)) (_2!10490 V!48375)) )
))
(declare-datatypes ((List!28181 0))(
  ( (Nil!28178) (Cons!28177 (h!29395 tuple2!20958) (t!41670 List!28181)) )
))
(declare-datatypes ((ListLongMap!18839 0))(
  ( (ListLongMap!18840 (toList!9435 List!28181)) )
))
(declare-fun lt!571346 () ListLongMap!18839)

(declare-fun lt!571338 () ListLongMap!18839)

(declare-fun -!2102 (ListLongMap!18839 (_ BitVec 64)) ListLongMap!18839)

(assert (=> b!1261508 (= lt!571346 (-!2102 lt!571338 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!571343 () ListLongMap!18839)

(declare-fun lt!571345 () ListLongMap!18839)

(assert (=> b!1261508 (= (-!2102 lt!571343 #b1000000000000000000000000000000000000000000000000000000000000000) lt!571345)))

(declare-datatypes ((Unit!42006 0))(
  ( (Unit!42007) )
))
(declare-fun lt!571340 () Unit!42006)

(declare-fun minValueBefore!43 () V!48375)

(declare-fun addThenRemoveForNewKeyIsSame!356 (ListLongMap!18839 (_ BitVec 64) V!48375) Unit!42006)

(assert (=> b!1261508 (= lt!571340 (addThenRemoveForNewKeyIsSame!356 lt!571345 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!717897 () Bool)

(assert (=> b!1261508 e!717897))

(declare-fun res!840373 () Bool)

(assert (=> b!1261508 (=> (not res!840373) (not e!717897))))

(assert (=> b!1261508 (= res!840373 (= lt!571338 lt!571343))))

(declare-fun +!4274 (ListLongMap!18839 tuple2!20958) ListLongMap!18839)

(assert (=> b!1261508 (= lt!571343 (+!4274 lt!571345 (tuple2!20959 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!571341 () ListLongMap!18839)

(declare-fun lt!571339 () tuple2!20958)

(assert (=> b!1261508 (= lt!571345 (+!4274 lt!571341 lt!571339))))

(declare-fun zeroValue!871 () V!48375)

(assert (=> b!1261508 (= lt!571339 (tuple2!20959 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48375)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun lt!571344 () ListLongMap!18839)

(declare-fun getCurrentListMap!4614 (array!82183 array!82185 (_ BitVec 32) (_ BitVec 32) V!48375 V!48375 (_ BitVec 32) Int) ListLongMap!18839)

(assert (=> b!1261508 (= lt!571344 (getCurrentListMap!4614 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1261508 (= lt!571338 (getCurrentListMap!4614 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1261509 () Bool)

(declare-fun e!717900 () Bool)

(declare-fun tp_is_empty!32257 () Bool)

(assert (=> b!1261509 (= e!717900 tp_is_empty!32257)))

(declare-fun mapNonEmpty!50185 () Bool)

(declare-fun tp!95594 () Bool)

(assert (=> mapNonEmpty!50185 (= mapRes!50185 (and tp!95594 e!717900))))

(declare-fun mapValue!50185 () ValueCell!15365)

(declare-fun mapKey!50185 () (_ BitVec 32))

(declare-fun mapRest!50185 () (Array (_ BitVec 32) ValueCell!15365))

(assert (=> mapNonEmpty!50185 (= (arr!39642 _values!914) (store mapRest!50185 mapKey!50185 mapValue!50185))))

(declare-fun res!840375 () Bool)

(assert (=> start!106016 (=> (not res!840375) (not e!717901))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106016 (= res!840375 (validMask!0 mask!1466))))

(assert (=> start!106016 e!717901))

(assert (=> start!106016 true))

(assert (=> start!106016 tp!95593))

(assert (=> start!106016 tp_is_empty!32257))

(declare-fun array_inv!30323 (array!82183) Bool)

(assert (=> start!106016 (array_inv!30323 _keys!1118)))

(declare-fun array_inv!30324 (array!82185) Bool)

(assert (=> start!106016 (and (array_inv!30324 _values!914) e!717896)))

(declare-fun mapIsEmpty!50185 () Bool)

(assert (=> mapIsEmpty!50185 mapRes!50185))

(declare-fun b!1261510 () Bool)

(assert (=> b!1261510 (= e!717901 (not e!717899))))

(declare-fun res!840371 () Bool)

(assert (=> b!1261510 (=> res!840371 e!717899)))

(assert (=> b!1261510 (= res!840371 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!571337 () ListLongMap!18839)

(assert (=> b!1261510 (= lt!571341 lt!571337)))

(declare-fun lt!571342 () Unit!42006)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1157 (array!82183 array!82185 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48375 V!48375 V!48375 V!48375 (_ BitVec 32) Int) Unit!42006)

(assert (=> b!1261510 (= lt!571342 (lemmaNoChangeToArrayThenSameMapNoExtras!1157 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5843 (array!82183 array!82185 (_ BitVec 32) (_ BitVec 32) V!48375 V!48375 (_ BitVec 32) Int) ListLongMap!18839)

(assert (=> b!1261510 (= lt!571337 (getCurrentListMapNoExtraKeys!5843 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1261510 (= lt!571341 (getCurrentListMapNoExtraKeys!5843 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1261511 () Bool)

(declare-fun res!840374 () Bool)

(assert (=> b!1261511 (=> (not res!840374) (not e!717901))))

(declare-datatypes ((List!28182 0))(
  ( (Nil!28179) (Cons!28178 (h!29396 (_ BitVec 64)) (t!41671 List!28182)) )
))
(declare-fun arrayNoDuplicates!0 (array!82183 (_ BitVec 32) List!28182) Bool)

(assert (=> b!1261511 (= res!840374 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28179))))

(declare-fun b!1261512 () Bool)

(assert (=> b!1261512 (= e!717897 (= lt!571344 (+!4274 lt!571337 lt!571339)))))

(declare-fun b!1261513 () Bool)

(assert (=> b!1261513 (= e!717902 tp_is_empty!32257)))

(declare-fun b!1261514 () Bool)

(declare-fun res!840370 () Bool)

(assert (=> b!1261514 (=> (not res!840370) (not e!717901))))

(assert (=> b!1261514 (= res!840370 (and (= (size!40179 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40178 _keys!1118) (size!40179 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!106016 res!840375) b!1261514))

(assert (= (and b!1261514 res!840370) b!1261506))

(assert (= (and b!1261506 res!840372) b!1261511))

(assert (= (and b!1261511 res!840374) b!1261510))

(assert (= (and b!1261510 (not res!840371)) b!1261508))

(assert (= (and b!1261508 res!840373) b!1261512))

(assert (= (and b!1261507 condMapEmpty!50185) mapIsEmpty!50185))

(assert (= (and b!1261507 (not condMapEmpty!50185)) mapNonEmpty!50185))

(get-info :version)

(assert (= (and mapNonEmpty!50185 ((_ is ValueCellFull!15365) mapValue!50185)) b!1261509))

(assert (= (and b!1261507 ((_ is ValueCellFull!15365) mapDefault!50185)) b!1261513))

(assert (= start!106016 b!1261507))

(declare-fun m!1162457 () Bool)

(assert (=> b!1261511 m!1162457))

(declare-fun m!1162459 () Bool)

(assert (=> b!1261506 m!1162459))

(declare-fun m!1162461 () Bool)

(assert (=> b!1261510 m!1162461))

(declare-fun m!1162463 () Bool)

(assert (=> b!1261510 m!1162463))

(declare-fun m!1162465 () Bool)

(assert (=> b!1261510 m!1162465))

(declare-fun m!1162467 () Bool)

(assert (=> b!1261508 m!1162467))

(declare-fun m!1162469 () Bool)

(assert (=> b!1261508 m!1162469))

(declare-fun m!1162471 () Bool)

(assert (=> b!1261508 m!1162471))

(declare-fun m!1162473 () Bool)

(assert (=> b!1261508 m!1162473))

(declare-fun m!1162475 () Bool)

(assert (=> b!1261508 m!1162475))

(declare-fun m!1162477 () Bool)

(assert (=> b!1261508 m!1162477))

(declare-fun m!1162479 () Bool)

(assert (=> b!1261508 m!1162479))

(declare-fun m!1162481 () Bool)

(assert (=> b!1261512 m!1162481))

(declare-fun m!1162483 () Bool)

(assert (=> mapNonEmpty!50185 m!1162483))

(declare-fun m!1162485 () Bool)

(assert (=> start!106016 m!1162485))

(declare-fun m!1162487 () Bool)

(assert (=> start!106016 m!1162487))

(declare-fun m!1162489 () Bool)

(assert (=> start!106016 m!1162489))

(check-sat (not b!1261506) (not b!1261512) (not b!1261510) tp_is_empty!32257 (not b!1261508) b_and!45253 (not b!1261511) (not start!106016) (not mapNonEmpty!50185) (not b_next!27355))
(check-sat b_and!45253 (not b_next!27355))
