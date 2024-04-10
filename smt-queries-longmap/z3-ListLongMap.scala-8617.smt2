; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104970 () Bool)

(assert start!104970)

(declare-fun b_free!26739 () Bool)

(declare-fun b_next!26739 () Bool)

(assert (=> start!104970 (= b_free!26739 (not b_next!26739))))

(declare-fun tp!93712 () Bool)

(declare-fun b_and!44525 () Bool)

(assert (=> start!104970 (= tp!93712 b_and!44525)))

(declare-fun b!1251126 () Bool)

(declare-fun res!834484 () Bool)

(declare-fun e!710393 () Bool)

(assert (=> b!1251126 (=> (not res!834484) (not e!710393))))

(declare-datatypes ((array!80946 0))(
  ( (array!80947 (arr!39038 (Array (_ BitVec 32) (_ BitVec 64))) (size!39574 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80946)

(declare-datatypes ((List!27707 0))(
  ( (Nil!27704) (Cons!27703 (h!28912 (_ BitVec 64)) (t!41182 List!27707)) )
))
(declare-fun arrayNoDuplicates!0 (array!80946 (_ BitVec 32) List!27707) Bool)

(assert (=> b!1251126 (= res!834484 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27704))))

(declare-fun res!834488 () Bool)

(assert (=> start!104970 (=> (not res!834488) (not e!710393))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104970 (= res!834488 (validMask!0 mask!1466))))

(assert (=> start!104970 e!710393))

(assert (=> start!104970 true))

(assert (=> start!104970 tp!93712))

(declare-fun tp_is_empty!31641 () Bool)

(assert (=> start!104970 tp_is_empty!31641))

(declare-fun array_inv!29779 (array!80946) Bool)

(assert (=> start!104970 (array_inv!29779 _keys!1118)))

(declare-datatypes ((V!47553 0))(
  ( (V!47554 (val!15883 Int)) )
))
(declare-datatypes ((ValueCell!15057 0))(
  ( (ValueCellFull!15057 (v!18580 V!47553)) (EmptyCell!15057) )
))
(declare-datatypes ((array!80948 0))(
  ( (array!80949 (arr!39039 (Array (_ BitVec 32) ValueCell!15057)) (size!39575 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80948)

(declare-fun e!710391 () Bool)

(declare-fun array_inv!29780 (array!80948) Bool)

(assert (=> start!104970 (and (array_inv!29780 _values!914) e!710391)))

(declare-fun b!1251127 () Bool)

(declare-fun e!710390 () Bool)

(declare-fun mapRes!49228 () Bool)

(assert (=> b!1251127 (= e!710391 (and e!710390 mapRes!49228))))

(declare-fun condMapEmpty!49228 () Bool)

(declare-fun mapDefault!49228 () ValueCell!15057)

(assert (=> b!1251127 (= condMapEmpty!49228 (= (arr!39039 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15057)) mapDefault!49228)))))

(declare-fun b!1251128 () Bool)

(declare-fun e!710394 () Bool)

(assert (=> b!1251128 (= e!710394 tp_is_empty!31641)))

(declare-fun b!1251129 () Bool)

(declare-fun res!834485 () Bool)

(assert (=> b!1251129 (=> (not res!834485) (not e!710393))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80946 (_ BitVec 32)) Bool)

(assert (=> b!1251129 (= res!834485 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1251130 () Bool)

(assert (=> b!1251130 (= e!710390 tp_is_empty!31641)))

(declare-fun b!1251131 () Bool)

(declare-fun e!710392 () Bool)

(assert (=> b!1251131 (= e!710392 true)))

(declare-datatypes ((tuple2!20472 0))(
  ( (tuple2!20473 (_1!10247 (_ BitVec 64)) (_2!10247 V!47553)) )
))
(declare-datatypes ((List!27708 0))(
  ( (Nil!27705) (Cons!27704 (h!28913 tuple2!20472) (t!41183 List!27708)) )
))
(declare-datatypes ((ListLongMap!18345 0))(
  ( (ListLongMap!18346 (toList!9188 List!27708)) )
))
(declare-fun lt!564651 () ListLongMap!18345)

(declare-fun -!2011 (ListLongMap!18345 (_ BitVec 64)) ListLongMap!18345)

(assert (=> b!1251131 (= (-!2011 lt!564651 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564651)))

(declare-datatypes ((Unit!41565 0))(
  ( (Unit!41566) )
))
(declare-fun lt!564647 () Unit!41565)

(declare-fun removeNotPresentStillSame!106 (ListLongMap!18345 (_ BitVec 64)) Unit!41565)

(assert (=> b!1251131 (= lt!564647 (removeNotPresentStillSame!106 lt!564651 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!49228 () Bool)

(declare-fun tp!93713 () Bool)

(assert (=> mapNonEmpty!49228 (= mapRes!49228 (and tp!93713 e!710394))))

(declare-fun mapRest!49228 () (Array (_ BitVec 32) ValueCell!15057))

(declare-fun mapKey!49228 () (_ BitVec 32))

(declare-fun mapValue!49228 () ValueCell!15057)

(assert (=> mapNonEmpty!49228 (= (arr!39039 _values!914) (store mapRest!49228 mapKey!49228 mapValue!49228))))

(declare-fun b!1251132 () Bool)

(declare-fun res!834486 () Bool)

(assert (=> b!1251132 (=> (not res!834486) (not e!710393))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1251132 (= res!834486 (and (= (size!39575 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39574 _keys!1118) (size!39575 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!49228 () Bool)

(assert (=> mapIsEmpty!49228 mapRes!49228))

(declare-fun b!1251133 () Bool)

(declare-fun e!710389 () Bool)

(assert (=> b!1251133 (= e!710389 e!710392)))

(declare-fun res!834487 () Bool)

(assert (=> b!1251133 (=> res!834487 e!710392)))

(declare-fun contains!7500 (ListLongMap!18345 (_ BitVec 64)) Bool)

(assert (=> b!1251133 (= res!834487 (contains!7500 lt!564651 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!47553)

(declare-fun minValueBefore!43 () V!47553)

(declare-fun getCurrentListMap!4460 (array!80946 array!80948 (_ BitVec 32) (_ BitVec 32) V!47553 V!47553 (_ BitVec 32) Int) ListLongMap!18345)

(assert (=> b!1251133 (= lt!564651 (getCurrentListMap!4460 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251134 () Bool)

(assert (=> b!1251134 (= e!710393 (not e!710389))))

(declare-fun res!834483 () Bool)

(assert (=> b!1251134 (=> res!834483 e!710389)))

(assert (=> b!1251134 (= res!834483 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!564648 () ListLongMap!18345)

(declare-fun lt!564650 () ListLongMap!18345)

(assert (=> b!1251134 (= lt!564648 lt!564650)))

(declare-fun lt!564649 () Unit!41565)

(declare-fun minValueAfter!43 () V!47553)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!951 (array!80946 array!80948 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47553 V!47553 V!47553 V!47553 (_ BitVec 32) Int) Unit!41565)

(assert (=> b!1251134 (= lt!564649 (lemmaNoChangeToArrayThenSameMapNoExtras!951 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5587 (array!80946 array!80948 (_ BitVec 32) (_ BitVec 32) V!47553 V!47553 (_ BitVec 32) Int) ListLongMap!18345)

(assert (=> b!1251134 (= lt!564650 (getCurrentListMapNoExtraKeys!5587 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251134 (= lt!564648 (getCurrentListMapNoExtraKeys!5587 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!104970 res!834488) b!1251132))

(assert (= (and b!1251132 res!834486) b!1251129))

(assert (= (and b!1251129 res!834485) b!1251126))

(assert (= (and b!1251126 res!834484) b!1251134))

(assert (= (and b!1251134 (not res!834483)) b!1251133))

(assert (= (and b!1251133 (not res!834487)) b!1251131))

(assert (= (and b!1251127 condMapEmpty!49228) mapIsEmpty!49228))

(assert (= (and b!1251127 (not condMapEmpty!49228)) mapNonEmpty!49228))

(get-info :version)

(assert (= (and mapNonEmpty!49228 ((_ is ValueCellFull!15057) mapValue!49228)) b!1251128))

(assert (= (and b!1251127 ((_ is ValueCellFull!15057) mapDefault!49228)) b!1251130))

(assert (= start!104970 b!1251127))

(declare-fun m!1151905 () Bool)

(assert (=> start!104970 m!1151905))

(declare-fun m!1151907 () Bool)

(assert (=> start!104970 m!1151907))

(declare-fun m!1151909 () Bool)

(assert (=> start!104970 m!1151909))

(declare-fun m!1151911 () Bool)

(assert (=> b!1251133 m!1151911))

(declare-fun m!1151913 () Bool)

(assert (=> b!1251133 m!1151913))

(declare-fun m!1151915 () Bool)

(assert (=> b!1251131 m!1151915))

(declare-fun m!1151917 () Bool)

(assert (=> b!1251131 m!1151917))

(declare-fun m!1151919 () Bool)

(assert (=> b!1251126 m!1151919))

(declare-fun m!1151921 () Bool)

(assert (=> b!1251129 m!1151921))

(declare-fun m!1151923 () Bool)

(assert (=> mapNonEmpty!49228 m!1151923))

(declare-fun m!1151925 () Bool)

(assert (=> b!1251134 m!1151925))

(declare-fun m!1151927 () Bool)

(assert (=> b!1251134 m!1151927))

(declare-fun m!1151929 () Bool)

(assert (=> b!1251134 m!1151929))

(check-sat (not b!1251129) (not b!1251133) (not b!1251126) (not mapNonEmpty!49228) (not b!1251131) b_and!44525 (not b!1251134) (not b_next!26739) tp_is_empty!31641 (not start!104970))
(check-sat b_and!44525 (not b_next!26739))
