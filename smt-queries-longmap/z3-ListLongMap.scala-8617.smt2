; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104964 () Bool)

(assert start!104964)

(declare-fun b_free!26737 () Bool)

(declare-fun b_next!26737 () Bool)

(assert (=> start!104964 (= b_free!26737 (not b_next!26737))))

(declare-fun tp!93707 () Bool)

(declare-fun b_and!44505 () Bool)

(assert (=> start!104964 (= tp!93707 b_and!44505)))

(declare-fun b!1251017 () Bool)

(declare-fun e!710328 () Bool)

(assert (=> b!1251017 (= e!710328 true)))

(declare-datatypes ((V!47551 0))(
  ( (V!47552 (val!15882 Int)) )
))
(declare-datatypes ((tuple2!20556 0))(
  ( (tuple2!20557 (_1!10289 (_ BitVec 64)) (_2!10289 V!47551)) )
))
(declare-datatypes ((List!27776 0))(
  ( (Nil!27773) (Cons!27772 (h!28981 tuple2!20556) (t!41242 List!27776)) )
))
(declare-datatypes ((ListLongMap!18429 0))(
  ( (ListLongMap!18430 (toList!9230 List!27776)) )
))
(declare-fun lt!564455 () ListLongMap!18429)

(declare-fun -!1976 (ListLongMap!18429 (_ BitVec 64)) ListLongMap!18429)

(assert (=> b!1251017 (= (-!1976 lt!564455 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564455)))

(declare-datatypes ((Unit!41426 0))(
  ( (Unit!41427) )
))
(declare-fun lt!564454 () Unit!41426)

(declare-fun removeNotPresentStillSame!104 (ListLongMap!18429 (_ BitVec 64)) Unit!41426)

(assert (=> b!1251017 (= lt!564454 (removeNotPresentStillSame!104 lt!564455 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!834430 () Bool)

(declare-fun e!710322 () Bool)

(assert (=> start!104964 (=> (not res!834430) (not e!710322))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104964 (= res!834430 (validMask!0 mask!1466))))

(assert (=> start!104964 e!710322))

(assert (=> start!104964 true))

(assert (=> start!104964 tp!93707))

(declare-fun tp_is_empty!31639 () Bool)

(assert (=> start!104964 tp_is_empty!31639))

(declare-datatypes ((array!80863 0))(
  ( (array!80864 (arr!38997 (Array (_ BitVec 32) (_ BitVec 64))) (size!39535 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80863)

(declare-fun array_inv!29877 (array!80863) Bool)

(assert (=> start!104964 (array_inv!29877 _keys!1118)))

(declare-datatypes ((ValueCell!15056 0))(
  ( (ValueCellFull!15056 (v!18578 V!47551)) (EmptyCell!15056) )
))
(declare-datatypes ((array!80865 0))(
  ( (array!80866 (arr!38998 (Array (_ BitVec 32) ValueCell!15056)) (size!39536 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80865)

(declare-fun e!710323 () Bool)

(declare-fun array_inv!29878 (array!80865) Bool)

(assert (=> start!104964 (and (array_inv!29878 _values!914) e!710323)))

(declare-fun b!1251018 () Bool)

(declare-fun e!710326 () Bool)

(assert (=> b!1251018 (= e!710326 tp_is_empty!31639)))

(declare-fun b!1251019 () Bool)

(declare-fun res!834426 () Bool)

(assert (=> b!1251019 (=> (not res!834426) (not e!710322))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1251019 (= res!834426 (and (= (size!39536 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39535 _keys!1118) (size!39536 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1251020 () Bool)

(declare-fun e!710327 () Bool)

(assert (=> b!1251020 (= e!710327 e!710328)))

(declare-fun res!834428 () Bool)

(assert (=> b!1251020 (=> res!834428 e!710328)))

(declare-fun contains!7475 (ListLongMap!18429 (_ BitVec 64)) Bool)

(assert (=> b!1251020 (= res!834428 (contains!7475 lt!564455 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!47551)

(declare-fun minValueBefore!43 () V!47551)

(declare-fun getCurrentListMap!4401 (array!80863 array!80865 (_ BitVec 32) (_ BitVec 32) V!47551 V!47551 (_ BitVec 32) Int) ListLongMap!18429)

(assert (=> b!1251020 (= lt!564455 (getCurrentListMap!4401 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251021 () Bool)

(declare-fun res!834425 () Bool)

(assert (=> b!1251021 (=> (not res!834425) (not e!710322))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80863 (_ BitVec 32)) Bool)

(assert (=> b!1251021 (= res!834425 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1251022 () Bool)

(declare-fun mapRes!49225 () Bool)

(assert (=> b!1251022 (= e!710323 (and e!710326 mapRes!49225))))

(declare-fun condMapEmpty!49225 () Bool)

(declare-fun mapDefault!49225 () ValueCell!15056)

(assert (=> b!1251022 (= condMapEmpty!49225 (= (arr!38998 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15056)) mapDefault!49225)))))

(declare-fun mapNonEmpty!49225 () Bool)

(declare-fun tp!93706 () Bool)

(declare-fun e!710325 () Bool)

(assert (=> mapNonEmpty!49225 (= mapRes!49225 (and tp!93706 e!710325))))

(declare-fun mapValue!49225 () ValueCell!15056)

(declare-fun mapRest!49225 () (Array (_ BitVec 32) ValueCell!15056))

(declare-fun mapKey!49225 () (_ BitVec 32))

(assert (=> mapNonEmpty!49225 (= (arr!38998 _values!914) (store mapRest!49225 mapKey!49225 mapValue!49225))))

(declare-fun b!1251023 () Bool)

(declare-fun res!834427 () Bool)

(assert (=> b!1251023 (=> (not res!834427) (not e!710322))))

(declare-datatypes ((List!27777 0))(
  ( (Nil!27774) (Cons!27773 (h!28982 (_ BitVec 64)) (t!41243 List!27777)) )
))
(declare-fun arrayNoDuplicates!0 (array!80863 (_ BitVec 32) List!27777) Bool)

(assert (=> b!1251023 (= res!834427 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27774))))

(declare-fun b!1251024 () Bool)

(assert (=> b!1251024 (= e!710322 (not e!710327))))

(declare-fun res!834429 () Bool)

(assert (=> b!1251024 (=> res!834429 e!710327)))

(assert (=> b!1251024 (= res!834429 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!564456 () ListLongMap!18429)

(declare-fun lt!564457 () ListLongMap!18429)

(assert (=> b!1251024 (= lt!564456 lt!564457)))

(declare-fun minValueAfter!43 () V!47551)

(declare-fun lt!564453 () Unit!41426)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!960 (array!80863 array!80865 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47551 V!47551 V!47551 V!47551 (_ BitVec 32) Int) Unit!41426)

(assert (=> b!1251024 (= lt!564453 (lemmaNoChangeToArrayThenSameMapNoExtras!960 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5638 (array!80863 array!80865 (_ BitVec 32) (_ BitVec 32) V!47551 V!47551 (_ BitVec 32) Int) ListLongMap!18429)

(assert (=> b!1251024 (= lt!564457 (getCurrentListMapNoExtraKeys!5638 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251024 (= lt!564456 (getCurrentListMapNoExtraKeys!5638 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49225 () Bool)

(assert (=> mapIsEmpty!49225 mapRes!49225))

(declare-fun b!1251025 () Bool)

(assert (=> b!1251025 (= e!710325 tp_is_empty!31639)))

(assert (= (and start!104964 res!834430) b!1251019))

(assert (= (and b!1251019 res!834426) b!1251021))

(assert (= (and b!1251021 res!834425) b!1251023))

(assert (= (and b!1251023 res!834427) b!1251024))

(assert (= (and b!1251024 (not res!834429)) b!1251020))

(assert (= (and b!1251020 (not res!834428)) b!1251017))

(assert (= (and b!1251022 condMapEmpty!49225) mapIsEmpty!49225))

(assert (= (and b!1251022 (not condMapEmpty!49225)) mapNonEmpty!49225))

(get-info :version)

(assert (= (and mapNonEmpty!49225 ((_ is ValueCellFull!15056) mapValue!49225)) b!1251025))

(assert (= (and b!1251022 ((_ is ValueCellFull!15056) mapDefault!49225)) b!1251018))

(assert (= start!104964 b!1251022))

(declare-fun m!1151359 () Bool)

(assert (=> b!1251024 m!1151359))

(declare-fun m!1151361 () Bool)

(assert (=> b!1251024 m!1151361))

(declare-fun m!1151363 () Bool)

(assert (=> b!1251024 m!1151363))

(declare-fun m!1151365 () Bool)

(assert (=> b!1251023 m!1151365))

(declare-fun m!1151367 () Bool)

(assert (=> start!104964 m!1151367))

(declare-fun m!1151369 () Bool)

(assert (=> start!104964 m!1151369))

(declare-fun m!1151371 () Bool)

(assert (=> start!104964 m!1151371))

(declare-fun m!1151373 () Bool)

(assert (=> b!1251020 m!1151373))

(declare-fun m!1151375 () Bool)

(assert (=> b!1251020 m!1151375))

(declare-fun m!1151377 () Bool)

(assert (=> b!1251021 m!1151377))

(declare-fun m!1151379 () Bool)

(assert (=> mapNonEmpty!49225 m!1151379))

(declare-fun m!1151381 () Bool)

(assert (=> b!1251017 m!1151381))

(declare-fun m!1151383 () Bool)

(assert (=> b!1251017 m!1151383))

(check-sat (not start!104964) b_and!44505 (not b!1251021) (not b!1251017) (not b!1251023) (not b!1251024) (not b!1251020) (not mapNonEmpty!49225) (not b_next!26737) tp_is_empty!31639)
(check-sat b_and!44505 (not b_next!26737))
