; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105114 () Bool)

(assert start!105114)

(declare-fun b_free!26851 () Bool)

(declare-fun b_next!26851 () Bool)

(assert (=> start!105114 (= b_free!26851 (not b_next!26851))))

(declare-fun tp!94055 () Bool)

(declare-fun b_and!44637 () Bool)

(assert (=> start!105114 (= tp!94055 b_and!44637)))

(declare-fun b!1252598 () Bool)

(declare-fun res!835344 () Bool)

(declare-fun e!711477 () Bool)

(assert (=> b!1252598 (=> (not res!835344) (not e!711477))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81091 0))(
  ( (array!81092 (arr!39109 (Array (_ BitVec 32) (_ BitVec 64))) (size!39647 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81091)

(declare-datatypes ((V!47703 0))(
  ( (V!47704 (val!15939 Int)) )
))
(declare-datatypes ((ValueCell!15113 0))(
  ( (ValueCellFull!15113 (v!18636 V!47703)) (EmptyCell!15113) )
))
(declare-datatypes ((array!81093 0))(
  ( (array!81094 (arr!39110 (Array (_ BitVec 32) ValueCell!15113)) (size!39648 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81093)

(assert (=> b!1252598 (= res!835344 (and (= (size!39648 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39647 _keys!1118) (size!39648 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1252599 () Bool)

(declare-fun e!711476 () Bool)

(declare-fun tp_is_empty!31753 () Bool)

(assert (=> b!1252599 (= e!711476 tp_is_empty!31753)))

(declare-fun b!1252600 () Bool)

(declare-fun res!835345 () Bool)

(assert (=> b!1252600 (=> (not res!835345) (not e!711477))))

(declare-datatypes ((List!27864 0))(
  ( (Nil!27861) (Cons!27860 (h!29069 (_ BitVec 64)) (t!41334 List!27864)) )
))
(declare-fun arrayNoDuplicates!0 (array!81091 (_ BitVec 32) List!27864) Bool)

(assert (=> b!1252600 (= res!835345 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27861))))

(declare-fun b!1252601 () Bool)

(declare-fun e!711474 () Bool)

(assert (=> b!1252601 (= e!711474 true)))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!47703)

(declare-fun minValueBefore!43 () V!47703)

(declare-datatypes ((tuple2!20650 0))(
  ( (tuple2!20651 (_1!10336 (_ BitVec 64)) (_2!10336 V!47703)) )
))
(declare-datatypes ((List!27865 0))(
  ( (Nil!27862) (Cons!27861 (h!29070 tuple2!20650) (t!41335 List!27865)) )
))
(declare-datatypes ((ListLongMap!18523 0))(
  ( (ListLongMap!18524 (toList!9277 List!27865)) )
))
(declare-fun lt!565274 () ListLongMap!18523)

(declare-fun getCurrentListMap!4417 (array!81091 array!81093 (_ BitVec 32) (_ BitVec 32) V!47703 V!47703 (_ BitVec 32) Int) ListLongMap!18523)

(assert (=> b!1252601 (= lt!565274 (getCurrentListMap!4417 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!835347 () Bool)

(assert (=> start!105114 (=> (not res!835347) (not e!711477))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105114 (= res!835347 (validMask!0 mask!1466))))

(assert (=> start!105114 e!711477))

(assert (=> start!105114 true))

(assert (=> start!105114 tp!94055))

(assert (=> start!105114 tp_is_empty!31753))

(declare-fun array_inv!29947 (array!81091) Bool)

(assert (=> start!105114 (array_inv!29947 _keys!1118)))

(declare-fun e!711479 () Bool)

(declare-fun array_inv!29948 (array!81093) Bool)

(assert (=> start!105114 (and (array_inv!29948 _values!914) e!711479)))

(declare-fun b!1252602 () Bool)

(declare-fun e!711478 () Bool)

(assert (=> b!1252602 (= e!711478 tp_is_empty!31753)))

(declare-fun b!1252603 () Bool)

(declare-fun res!835346 () Bool)

(assert (=> b!1252603 (=> (not res!835346) (not e!711477))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81091 (_ BitVec 32)) Bool)

(assert (=> b!1252603 (= res!835346 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1252604 () Bool)

(declare-fun mapRes!49402 () Bool)

(assert (=> b!1252604 (= e!711479 (and e!711476 mapRes!49402))))

(declare-fun condMapEmpty!49402 () Bool)

(declare-fun mapDefault!49402 () ValueCell!15113)

(assert (=> b!1252604 (= condMapEmpty!49402 (= (arr!39110 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15113)) mapDefault!49402)))))

(declare-fun mapIsEmpty!49402 () Bool)

(assert (=> mapIsEmpty!49402 mapRes!49402))

(declare-fun b!1252605 () Bool)

(assert (=> b!1252605 (= e!711477 (not e!711474))))

(declare-fun res!835343 () Bool)

(assert (=> b!1252605 (=> res!835343 e!711474)))

(assert (=> b!1252605 (= res!835343 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!565272 () ListLongMap!18523)

(declare-fun lt!565273 () ListLongMap!18523)

(assert (=> b!1252605 (= lt!565272 lt!565273)))

(declare-datatypes ((Unit!41520 0))(
  ( (Unit!41521) )
))
(declare-fun lt!565275 () Unit!41520)

(declare-fun minValueAfter!43 () V!47703)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1003 (array!81091 array!81093 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47703 V!47703 V!47703 V!47703 (_ BitVec 32) Int) Unit!41520)

(assert (=> b!1252605 (= lt!565275 (lemmaNoChangeToArrayThenSameMapNoExtras!1003 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5681 (array!81091 array!81093 (_ BitVec 32) (_ BitVec 32) V!47703 V!47703 (_ BitVec 32) Int) ListLongMap!18523)

(assert (=> b!1252605 (= lt!565273 (getCurrentListMapNoExtraKeys!5681 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252605 (= lt!565272 (getCurrentListMapNoExtraKeys!5681 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49402 () Bool)

(declare-fun tp!94054 () Bool)

(assert (=> mapNonEmpty!49402 (= mapRes!49402 (and tp!94054 e!711478))))

(declare-fun mapValue!49402 () ValueCell!15113)

(declare-fun mapRest!49402 () (Array (_ BitVec 32) ValueCell!15113))

(declare-fun mapKey!49402 () (_ BitVec 32))

(assert (=> mapNonEmpty!49402 (= (arr!39110 _values!914) (store mapRest!49402 mapKey!49402 mapValue!49402))))

(assert (= (and start!105114 res!835347) b!1252598))

(assert (= (and b!1252598 res!835344) b!1252603))

(assert (= (and b!1252603 res!835346) b!1252600))

(assert (= (and b!1252600 res!835345) b!1252605))

(assert (= (and b!1252605 (not res!835343)) b!1252601))

(assert (= (and b!1252604 condMapEmpty!49402) mapIsEmpty!49402))

(assert (= (and b!1252604 (not condMapEmpty!49402)) mapNonEmpty!49402))

(get-info :version)

(assert (= (and mapNonEmpty!49402 ((_ is ValueCellFull!15113) mapValue!49402)) b!1252602))

(assert (= (and b!1252604 ((_ is ValueCellFull!15113) mapDefault!49402)) b!1252599))

(assert (= start!105114 b!1252604))

(declare-fun m!1152745 () Bool)

(assert (=> start!105114 m!1152745))

(declare-fun m!1152747 () Bool)

(assert (=> start!105114 m!1152747))

(declare-fun m!1152749 () Bool)

(assert (=> start!105114 m!1152749))

(declare-fun m!1152751 () Bool)

(assert (=> mapNonEmpty!49402 m!1152751))

(declare-fun m!1152753 () Bool)

(assert (=> b!1252603 m!1152753))

(declare-fun m!1152755 () Bool)

(assert (=> b!1252600 m!1152755))

(declare-fun m!1152757 () Bool)

(assert (=> b!1252601 m!1152757))

(declare-fun m!1152759 () Bool)

(assert (=> b!1252605 m!1152759))

(declare-fun m!1152761 () Bool)

(assert (=> b!1252605 m!1152761))

(declare-fun m!1152763 () Bool)

(assert (=> b!1252605 m!1152763))

(check-sat (not b!1252603) (not b!1252605) (not b_next!26851) (not start!105114) tp_is_empty!31753 (not mapNonEmpty!49402) (not b!1252601) b_and!44637 (not b!1252600))
(check-sat b_and!44637 (not b_next!26851))
