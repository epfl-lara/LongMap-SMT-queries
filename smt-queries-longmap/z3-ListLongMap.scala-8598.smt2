; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105042 () Bool)

(assert start!105042)

(declare-fun b_free!26623 () Bool)

(declare-fun b_next!26623 () Bool)

(assert (=> start!105042 (= b_free!26623 (not b_next!26623))))

(declare-fun tp!93358 () Bool)

(declare-fun b_and!44393 () Bool)

(assert (=> start!105042 (= tp!93358 b_and!44393)))

(declare-fun b!1250736 () Bool)

(declare-fun e!709975 () Bool)

(assert (=> b!1250736 (= e!709975 (not true))))

(declare-datatypes ((V!47399 0))(
  ( (V!47400 (val!15825 Int)) )
))
(declare-datatypes ((tuple2!20412 0))(
  ( (tuple2!20413 (_1!10217 (_ BitVec 64)) (_2!10217 V!47399)) )
))
(declare-datatypes ((List!27665 0))(
  ( (Nil!27662) (Cons!27661 (h!28879 tuple2!20412) (t!41128 List!27665)) )
))
(declare-datatypes ((ListLongMap!18293 0))(
  ( (ListLongMap!18294 (toList!9162 List!27665)) )
))
(declare-fun lt!564212 () ListLongMap!18293)

(declare-fun lt!564210 () ListLongMap!18293)

(assert (=> b!1250736 (= lt!564212 lt!564210)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47399)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47399)

(declare-datatypes ((ValueCell!14999 0))(
  ( (ValueCellFull!14999 (v!18517 V!47399)) (EmptyCell!14999) )
))
(declare-datatypes ((array!80769 0))(
  ( (array!80770 (arr!38947 (Array (_ BitVec 32) ValueCell!14999)) (size!39484 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80769)

(declare-fun minValueBefore!43 () V!47399)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((Unit!41464 0))(
  ( (Unit!41465) )
))
(declare-fun lt!564211 () Unit!41464)

(declare-datatypes ((array!80771 0))(
  ( (array!80772 (arr!38948 (Array (_ BitVec 32) (_ BitVec 64))) (size!39485 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80771)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!911 (array!80771 array!80769 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47399 V!47399 V!47399 V!47399 (_ BitVec 32) Int) Unit!41464)

(assert (=> b!1250736 (= lt!564211 (lemmaNoChangeToArrayThenSameMapNoExtras!911 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5597 (array!80771 array!80769 (_ BitVec 32) (_ BitVec 32) V!47399 V!47399 (_ BitVec 32) Int) ListLongMap!18293)

(assert (=> b!1250736 (= lt!564210 (getCurrentListMapNoExtraKeys!5597 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1250736 (= lt!564212 (getCurrentListMapNoExtraKeys!5597 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250737 () Bool)

(declare-fun res!833980 () Bool)

(assert (=> b!1250737 (=> (not res!833980) (not e!709975))))

(declare-datatypes ((List!27666 0))(
  ( (Nil!27663) (Cons!27662 (h!28880 (_ BitVec 64)) (t!41129 List!27666)) )
))
(declare-fun arrayNoDuplicates!0 (array!80771 (_ BitVec 32) List!27666) Bool)

(assert (=> b!1250737 (= res!833980 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27663))))

(declare-fun b!1250738 () Bool)

(declare-fun e!709979 () Bool)

(declare-fun tp_is_empty!31525 () Bool)

(assert (=> b!1250738 (= e!709979 tp_is_empty!31525)))

(declare-fun b!1250739 () Bool)

(declare-fun res!833982 () Bool)

(assert (=> b!1250739 (=> (not res!833982) (not e!709975))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80771 (_ BitVec 32)) Bool)

(assert (=> b!1250739 (= res!833982 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!833983 () Bool)

(assert (=> start!105042 (=> (not res!833983) (not e!709975))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105042 (= res!833983 (validMask!0 mask!1466))))

(assert (=> start!105042 e!709975))

(assert (=> start!105042 true))

(assert (=> start!105042 tp!93358))

(assert (=> start!105042 tp_is_empty!31525))

(declare-fun array_inv!29831 (array!80771) Bool)

(assert (=> start!105042 (array_inv!29831 _keys!1118)))

(declare-fun e!709978 () Bool)

(declare-fun array_inv!29832 (array!80769) Bool)

(assert (=> start!105042 (and (array_inv!29832 _values!914) e!709978)))

(declare-fun b!1250740 () Bool)

(declare-fun e!709976 () Bool)

(assert (=> b!1250740 (= e!709976 tp_is_empty!31525)))

(declare-fun b!1250741 () Bool)

(declare-fun res!833981 () Bool)

(assert (=> b!1250741 (=> (not res!833981) (not e!709975))))

(assert (=> b!1250741 (= res!833981 (and (= (size!39484 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39485 _keys!1118) (size!39484 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!49048 () Bool)

(declare-fun mapRes!49048 () Bool)

(assert (=> mapIsEmpty!49048 mapRes!49048))

(declare-fun b!1250742 () Bool)

(assert (=> b!1250742 (= e!709978 (and e!709979 mapRes!49048))))

(declare-fun condMapEmpty!49048 () Bool)

(declare-fun mapDefault!49048 () ValueCell!14999)

(assert (=> b!1250742 (= condMapEmpty!49048 (= (arr!38947 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14999)) mapDefault!49048)))))

(declare-fun mapNonEmpty!49048 () Bool)

(declare-fun tp!93359 () Bool)

(assert (=> mapNonEmpty!49048 (= mapRes!49048 (and tp!93359 e!709976))))

(declare-fun mapRest!49048 () (Array (_ BitVec 32) ValueCell!14999))

(declare-fun mapValue!49048 () ValueCell!14999)

(declare-fun mapKey!49048 () (_ BitVec 32))

(assert (=> mapNonEmpty!49048 (= (arr!38947 _values!914) (store mapRest!49048 mapKey!49048 mapValue!49048))))

(assert (= (and start!105042 res!833983) b!1250741))

(assert (= (and b!1250741 res!833981) b!1250739))

(assert (= (and b!1250739 res!833982) b!1250737))

(assert (= (and b!1250737 res!833980) b!1250736))

(assert (= (and b!1250742 condMapEmpty!49048) mapIsEmpty!49048))

(assert (= (and b!1250742 (not condMapEmpty!49048)) mapNonEmpty!49048))

(get-info :version)

(assert (= (and mapNonEmpty!49048 ((_ is ValueCellFull!14999) mapValue!49048)) b!1250740))

(assert (= (and b!1250742 ((_ is ValueCellFull!14999) mapDefault!49048)) b!1250738))

(assert (= start!105042 b!1250742))

(declare-fun m!1151973 () Bool)

(assert (=> start!105042 m!1151973))

(declare-fun m!1151975 () Bool)

(assert (=> start!105042 m!1151975))

(declare-fun m!1151977 () Bool)

(assert (=> start!105042 m!1151977))

(declare-fun m!1151979 () Bool)

(assert (=> b!1250736 m!1151979))

(declare-fun m!1151981 () Bool)

(assert (=> b!1250736 m!1151981))

(declare-fun m!1151983 () Bool)

(assert (=> b!1250736 m!1151983))

(declare-fun m!1151985 () Bool)

(assert (=> mapNonEmpty!49048 m!1151985))

(declare-fun m!1151987 () Bool)

(assert (=> b!1250739 m!1151987))

(declare-fun m!1151989 () Bool)

(assert (=> b!1250737 m!1151989))

(check-sat (not start!105042) (not b_next!26623) b_and!44393 (not b!1250736) (not mapNonEmpty!49048) (not b!1250739) (not b!1250737) tp_is_empty!31525)
(check-sat b_and!44393 (not b_next!26623))
