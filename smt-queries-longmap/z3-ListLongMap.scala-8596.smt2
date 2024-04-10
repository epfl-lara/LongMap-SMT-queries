; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104808 () Bool)

(assert start!104808)

(declare-fun b_free!26613 () Bool)

(declare-fun b_next!26613 () Bool)

(assert (=> start!104808 (= b_free!26613 (not b_next!26613))))

(declare-fun tp!93328 () Bool)

(declare-fun b_and!44381 () Bool)

(assert (=> start!104808 (= tp!93328 b_and!44381)))

(declare-fun b!1249326 () Bool)

(declare-fun e!709053 () Bool)

(assert (=> b!1249326 (= e!709053 (not true))))

(declare-datatypes ((V!47385 0))(
  ( (V!47386 (val!15820 Int)) )
))
(declare-datatypes ((tuple2!20382 0))(
  ( (tuple2!20383 (_1!10202 (_ BitVec 64)) (_2!10202 V!47385)) )
))
(declare-datatypes ((List!27626 0))(
  ( (Nil!27623) (Cons!27622 (h!28831 tuple2!20382) (t!41097 List!27626)) )
))
(declare-datatypes ((ListLongMap!18255 0))(
  ( (ListLongMap!18256 (toList!9143 List!27626)) )
))
(declare-fun lt!563681 () ListLongMap!18255)

(declare-fun lt!563682 () ListLongMap!18255)

(assert (=> b!1249326 (= lt!563681 lt!563682)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47385)

(declare-datatypes ((Unit!41483 0))(
  ( (Unit!41484) )
))
(declare-fun lt!563683 () Unit!41483)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47385)

(declare-datatypes ((array!80712 0))(
  ( (array!80713 (arr!38923 (Array (_ BitVec 32) (_ BitVec 64))) (size!39459 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80712)

(declare-datatypes ((ValueCell!14994 0))(
  ( (ValueCellFull!14994 (v!18516 V!47385)) (EmptyCell!14994) )
))
(declare-datatypes ((array!80714 0))(
  ( (array!80715 (arr!38924 (Array (_ BitVec 32) ValueCell!14994)) (size!39460 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80714)

(declare-fun minValueBefore!43 () V!47385)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!914 (array!80712 array!80714 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47385 V!47385 V!47385 V!47385 (_ BitVec 32) Int) Unit!41483)

(assert (=> b!1249326 (= lt!563683 (lemmaNoChangeToArrayThenSameMapNoExtras!914 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5550 (array!80712 array!80714 (_ BitVec 32) (_ BitVec 32) V!47385 V!47385 (_ BitVec 32) Int) ListLongMap!18255)

(assert (=> b!1249326 (= lt!563682 (getCurrentListMapNoExtraKeys!5550 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1249326 (= lt!563681 (getCurrentListMapNoExtraKeys!5550 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1249327 () Bool)

(declare-fun e!709055 () Bool)

(declare-fun e!709054 () Bool)

(declare-fun mapRes!49033 () Bool)

(assert (=> b!1249327 (= e!709055 (and e!709054 mapRes!49033))))

(declare-fun condMapEmpty!49033 () Bool)

(declare-fun mapDefault!49033 () ValueCell!14994)

(assert (=> b!1249327 (= condMapEmpty!49033 (= (arr!38924 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14994)) mapDefault!49033)))))

(declare-fun b!1249328 () Bool)

(declare-fun tp_is_empty!31515 () Bool)

(assert (=> b!1249328 (= e!709054 tp_is_empty!31515)))

(declare-fun b!1249329 () Bool)

(declare-fun e!709057 () Bool)

(assert (=> b!1249329 (= e!709057 tp_is_empty!31515)))

(declare-fun b!1249330 () Bool)

(declare-fun res!833400 () Bool)

(assert (=> b!1249330 (=> (not res!833400) (not e!709053))))

(assert (=> b!1249330 (= res!833400 (and (= (size!39460 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39459 _keys!1118) (size!39460 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1249331 () Bool)

(declare-fun res!833402 () Bool)

(assert (=> b!1249331 (=> (not res!833402) (not e!709053))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80712 (_ BitVec 32)) Bool)

(assert (=> b!1249331 (= res!833402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!833401 () Bool)

(assert (=> start!104808 (=> (not res!833401) (not e!709053))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104808 (= res!833401 (validMask!0 mask!1466))))

(assert (=> start!104808 e!709053))

(assert (=> start!104808 true))

(assert (=> start!104808 tp!93328))

(assert (=> start!104808 tp_is_empty!31515))

(declare-fun array_inv!29703 (array!80712) Bool)

(assert (=> start!104808 (array_inv!29703 _keys!1118)))

(declare-fun array_inv!29704 (array!80714) Bool)

(assert (=> start!104808 (and (array_inv!29704 _values!914) e!709055)))

(declare-fun mapNonEmpty!49033 () Bool)

(declare-fun tp!93329 () Bool)

(assert (=> mapNonEmpty!49033 (= mapRes!49033 (and tp!93329 e!709057))))

(declare-fun mapKey!49033 () (_ BitVec 32))

(declare-fun mapRest!49033 () (Array (_ BitVec 32) ValueCell!14994))

(declare-fun mapValue!49033 () ValueCell!14994)

(assert (=> mapNonEmpty!49033 (= (arr!38924 _values!914) (store mapRest!49033 mapKey!49033 mapValue!49033))))

(declare-fun mapIsEmpty!49033 () Bool)

(assert (=> mapIsEmpty!49033 mapRes!49033))

(declare-fun b!1249332 () Bool)

(declare-fun res!833403 () Bool)

(assert (=> b!1249332 (=> (not res!833403) (not e!709053))))

(declare-datatypes ((List!27627 0))(
  ( (Nil!27624) (Cons!27623 (h!28832 (_ BitVec 64)) (t!41098 List!27627)) )
))
(declare-fun arrayNoDuplicates!0 (array!80712 (_ BitVec 32) List!27627) Bool)

(assert (=> b!1249332 (= res!833403 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27624))))

(assert (= (and start!104808 res!833401) b!1249330))

(assert (= (and b!1249330 res!833400) b!1249331))

(assert (= (and b!1249331 res!833402) b!1249332))

(assert (= (and b!1249332 res!833403) b!1249326))

(assert (= (and b!1249327 condMapEmpty!49033) mapIsEmpty!49033))

(assert (= (and b!1249327 (not condMapEmpty!49033)) mapNonEmpty!49033))

(get-info :version)

(assert (= (and mapNonEmpty!49033 ((_ is ValueCellFull!14994) mapValue!49033)) b!1249329))

(assert (= (and b!1249327 ((_ is ValueCellFull!14994) mapDefault!49033)) b!1249328))

(assert (= start!104808 b!1249327))

(declare-fun m!1150271 () Bool)

(assert (=> b!1249331 m!1150271))

(declare-fun m!1150273 () Bool)

(assert (=> start!104808 m!1150273))

(declare-fun m!1150275 () Bool)

(assert (=> start!104808 m!1150275))

(declare-fun m!1150277 () Bool)

(assert (=> start!104808 m!1150277))

(declare-fun m!1150279 () Bool)

(assert (=> mapNonEmpty!49033 m!1150279))

(declare-fun m!1150281 () Bool)

(assert (=> b!1249326 m!1150281))

(declare-fun m!1150283 () Bool)

(assert (=> b!1249326 m!1150283))

(declare-fun m!1150285 () Bool)

(assert (=> b!1249326 m!1150285))

(declare-fun m!1150287 () Bool)

(assert (=> b!1249332 m!1150287))

(check-sat (not b!1249332) (not start!104808) (not b_next!26613) b_and!44381 tp_is_empty!31515 (not b!1249326) (not b!1249331) (not mapNonEmpty!49033))
(check-sat b_and!44381 (not b_next!26613))
