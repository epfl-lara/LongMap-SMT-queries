; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105024 () Bool)

(assert start!105024)

(declare-fun b_free!26605 () Bool)

(declare-fun b_next!26605 () Bool)

(assert (=> start!105024 (= b_free!26605 (not b_next!26605))))

(declare-fun tp!93305 () Bool)

(declare-fun b_and!44375 () Bool)

(assert (=> start!105024 (= tp!93305 b_and!44375)))

(declare-fun b!1250547 () Bool)

(declare-fun e!709844 () Bool)

(declare-fun tp_is_empty!31507 () Bool)

(assert (=> b!1250547 (= e!709844 tp_is_empty!31507)))

(declare-fun b!1250548 () Bool)

(declare-fun e!709840 () Bool)

(assert (=> b!1250548 (= e!709840 tp_is_empty!31507)))

(declare-fun b!1250549 () Bool)

(declare-fun e!709841 () Bool)

(assert (=> b!1250549 (= e!709841 (not true))))

(declare-datatypes ((V!47375 0))(
  ( (V!47376 (val!15816 Int)) )
))
(declare-datatypes ((tuple2!20398 0))(
  ( (tuple2!20399 (_1!10210 (_ BitVec 64)) (_2!10210 V!47375)) )
))
(declare-datatypes ((List!27653 0))(
  ( (Nil!27650) (Cons!27649 (h!28867 tuple2!20398) (t!41116 List!27653)) )
))
(declare-datatypes ((ListLongMap!18279 0))(
  ( (ListLongMap!18280 (toList!9155 List!27653)) )
))
(declare-fun lt!564130 () ListLongMap!18279)

(declare-fun lt!564131 () ListLongMap!18279)

(assert (=> b!1250549 (= lt!564130 lt!564131)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47375)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47375)

(declare-datatypes ((array!80733 0))(
  ( (array!80734 (arr!38929 (Array (_ BitVec 32) (_ BitVec 64))) (size!39466 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80733)

(declare-datatypes ((ValueCell!14990 0))(
  ( (ValueCellFull!14990 (v!18508 V!47375)) (EmptyCell!14990) )
))
(declare-datatypes ((array!80735 0))(
  ( (array!80736 (arr!38930 (Array (_ BitVec 32) ValueCell!14990)) (size!39467 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80735)

(declare-fun minValueBefore!43 () V!47375)

(declare-datatypes ((Unit!41450 0))(
  ( (Unit!41451) )
))
(declare-fun lt!564129 () Unit!41450)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!904 (array!80733 array!80735 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47375 V!47375 V!47375 V!47375 (_ BitVec 32) Int) Unit!41450)

(assert (=> b!1250549 (= lt!564129 (lemmaNoChangeToArrayThenSameMapNoExtras!904 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5590 (array!80733 array!80735 (_ BitVec 32) (_ BitVec 32) V!47375 V!47375 (_ BitVec 32) Int) ListLongMap!18279)

(assert (=> b!1250549 (= lt!564131 (getCurrentListMapNoExtraKeys!5590 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1250549 (= lt!564130 (getCurrentListMapNoExtraKeys!5590 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!833874 () Bool)

(assert (=> start!105024 (=> (not res!833874) (not e!709841))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105024 (= res!833874 (validMask!0 mask!1466))))

(assert (=> start!105024 e!709841))

(assert (=> start!105024 true))

(assert (=> start!105024 tp!93305))

(assert (=> start!105024 tp_is_empty!31507))

(declare-fun array_inv!29813 (array!80733) Bool)

(assert (=> start!105024 (array_inv!29813 _keys!1118)))

(declare-fun e!709842 () Bool)

(declare-fun array_inv!29814 (array!80735) Bool)

(assert (=> start!105024 (and (array_inv!29814 _values!914) e!709842)))

(declare-fun mapNonEmpty!49021 () Bool)

(declare-fun mapRes!49021 () Bool)

(declare-fun tp!93304 () Bool)

(assert (=> mapNonEmpty!49021 (= mapRes!49021 (and tp!93304 e!709840))))

(declare-fun mapValue!49021 () ValueCell!14990)

(declare-fun mapKey!49021 () (_ BitVec 32))

(declare-fun mapRest!49021 () (Array (_ BitVec 32) ValueCell!14990))

(assert (=> mapNonEmpty!49021 (= (arr!38930 _values!914) (store mapRest!49021 mapKey!49021 mapValue!49021))))

(declare-fun b!1250550 () Bool)

(assert (=> b!1250550 (= e!709842 (and e!709844 mapRes!49021))))

(declare-fun condMapEmpty!49021 () Bool)

(declare-fun mapDefault!49021 () ValueCell!14990)

(assert (=> b!1250550 (= condMapEmpty!49021 (= (arr!38930 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14990)) mapDefault!49021)))))

(declare-fun b!1250551 () Bool)

(declare-fun res!833875 () Bool)

(assert (=> b!1250551 (=> (not res!833875) (not e!709841))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80733 (_ BitVec 32)) Bool)

(assert (=> b!1250551 (= res!833875 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1250552 () Bool)

(declare-fun res!833873 () Bool)

(assert (=> b!1250552 (=> (not res!833873) (not e!709841))))

(assert (=> b!1250552 (= res!833873 (and (= (size!39467 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39466 _keys!1118) (size!39467 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1250553 () Bool)

(declare-fun res!833872 () Bool)

(assert (=> b!1250553 (=> (not res!833872) (not e!709841))))

(declare-datatypes ((List!27654 0))(
  ( (Nil!27651) (Cons!27650 (h!28868 (_ BitVec 64)) (t!41117 List!27654)) )
))
(declare-fun arrayNoDuplicates!0 (array!80733 (_ BitVec 32) List!27654) Bool)

(assert (=> b!1250553 (= res!833872 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27651))))

(declare-fun mapIsEmpty!49021 () Bool)

(assert (=> mapIsEmpty!49021 mapRes!49021))

(assert (= (and start!105024 res!833874) b!1250552))

(assert (= (and b!1250552 res!833873) b!1250551))

(assert (= (and b!1250551 res!833875) b!1250553))

(assert (= (and b!1250553 res!833872) b!1250549))

(assert (= (and b!1250550 condMapEmpty!49021) mapIsEmpty!49021))

(assert (= (and b!1250550 (not condMapEmpty!49021)) mapNonEmpty!49021))

(get-info :version)

(assert (= (and mapNonEmpty!49021 ((_ is ValueCellFull!14990) mapValue!49021)) b!1250548))

(assert (= (and b!1250550 ((_ is ValueCellFull!14990) mapDefault!49021)) b!1250547))

(assert (= start!105024 b!1250550))

(declare-fun m!1151811 () Bool)

(assert (=> b!1250551 m!1151811))

(declare-fun m!1151813 () Bool)

(assert (=> mapNonEmpty!49021 m!1151813))

(declare-fun m!1151815 () Bool)

(assert (=> b!1250549 m!1151815))

(declare-fun m!1151817 () Bool)

(assert (=> b!1250549 m!1151817))

(declare-fun m!1151819 () Bool)

(assert (=> b!1250549 m!1151819))

(declare-fun m!1151821 () Bool)

(assert (=> b!1250553 m!1151821))

(declare-fun m!1151823 () Bool)

(assert (=> start!105024 m!1151823))

(declare-fun m!1151825 () Bool)

(assert (=> start!105024 m!1151825))

(declare-fun m!1151827 () Bool)

(assert (=> start!105024 m!1151827))

(check-sat (not mapNonEmpty!49021) (not b!1250549) (not b!1250553) (not b!1250551) (not b_next!26605) tp_is_empty!31507 b_and!44375 (not start!105024))
(check-sat b_and!44375 (not b_next!26605))
