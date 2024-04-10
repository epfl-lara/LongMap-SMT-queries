; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105486 () Bool)

(assert start!105486)

(declare-fun b_free!27123 () Bool)

(declare-fun b_next!27123 () Bool)

(assert (=> start!105486 (= b_free!27123 (not b_next!27123))))

(declare-fun tp!94886 () Bool)

(declare-fun b_and!44979 () Bool)

(assert (=> start!105486 (= tp!94886 b_and!44979)))

(declare-fun b!1256734 () Bool)

(declare-fun e!714490 () Bool)

(declare-fun e!714491 () Bool)

(assert (=> b!1256734 (= e!714490 (not e!714491))))

(declare-fun res!837769 () Bool)

(assert (=> b!1256734 (=> res!837769 e!714491)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1256734 (= res!837769 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!48065 0))(
  ( (V!48066 (val!16075 Int)) )
))
(declare-datatypes ((tuple2!20766 0))(
  ( (tuple2!20767 (_1!10394 (_ BitVec 64)) (_2!10394 V!48065)) )
))
(declare-datatypes ((List!27983 0))(
  ( (Nil!27980) (Cons!27979 (h!29188 tuple2!20766) (t!41472 List!27983)) )
))
(declare-datatypes ((ListLongMap!18639 0))(
  ( (ListLongMap!18640 (toList!9335 List!27983)) )
))
(declare-fun lt!568320 () ListLongMap!18639)

(declare-fun lt!568319 () ListLongMap!18639)

(assert (=> b!1256734 (= lt!568320 lt!568319)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41854 0))(
  ( (Unit!41855) )
))
(declare-fun lt!568321 () Unit!41854)

(declare-fun minValueAfter!43 () V!48065)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48065)

(declare-datatypes ((array!81688 0))(
  ( (array!81689 (arr!39402 (Array (_ BitVec 32) (_ BitVec 64))) (size!39938 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81688)

(declare-datatypes ((ValueCell!15249 0))(
  ( (ValueCellFull!15249 (v!18776 V!48065)) (EmptyCell!15249) )
))
(declare-datatypes ((array!81690 0))(
  ( (array!81691 (arr!39403 (Array (_ BitVec 32) ValueCell!15249)) (size!39939 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81690)

(declare-fun minValueBefore!43 () V!48065)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1081 (array!81688 array!81690 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48065 V!48065 V!48065 V!48065 (_ BitVec 32) Int) Unit!41854)

(assert (=> b!1256734 (= lt!568321 (lemmaNoChangeToArrayThenSameMapNoExtras!1081 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5717 (array!81688 array!81690 (_ BitVec 32) (_ BitVec 32) V!48065 V!48065 (_ BitVec 32) Int) ListLongMap!18639)

(assert (=> b!1256734 (= lt!568319 (getCurrentListMapNoExtraKeys!5717 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1256734 (= lt!568320 (getCurrentListMapNoExtraKeys!5717 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256735 () Bool)

(declare-fun e!714487 () Bool)

(assert (=> b!1256735 (= e!714491 e!714487)))

(declare-fun res!837772 () Bool)

(assert (=> b!1256735 (=> res!837772 e!714487)))

(declare-fun lt!568322 () ListLongMap!18639)

(declare-fun contains!7553 (ListLongMap!18639 (_ BitVec 64)) Bool)

(assert (=> b!1256735 (= res!837772 (contains!7553 lt!568322 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4558 (array!81688 array!81690 (_ BitVec 32) (_ BitVec 32) V!48065 V!48065 (_ BitVec 32) Int) ListLongMap!18639)

(assert (=> b!1256735 (= lt!568322 (getCurrentListMap!4558 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256736 () Bool)

(declare-fun e!714489 () Bool)

(declare-fun e!714492 () Bool)

(declare-fun mapRes!49825 () Bool)

(assert (=> b!1256736 (= e!714489 (and e!714492 mapRes!49825))))

(declare-fun condMapEmpty!49825 () Bool)

(declare-fun mapDefault!49825 () ValueCell!15249)

(assert (=> b!1256736 (= condMapEmpty!49825 (= (arr!39403 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15249)) mapDefault!49825)))))

(declare-fun b!1256737 () Bool)

(declare-fun res!837770 () Bool)

(assert (=> b!1256737 (=> (not res!837770) (not e!714490))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81688 (_ BitVec 32)) Bool)

(assert (=> b!1256737 (= res!837770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!49825 () Bool)

(assert (=> mapIsEmpty!49825 mapRes!49825))

(declare-fun b!1256738 () Bool)

(declare-fun tp_is_empty!32025 () Bool)

(assert (=> b!1256738 (= e!714492 tp_is_empty!32025)))

(declare-fun b!1256740 () Bool)

(assert (=> b!1256740 (= e!714487 true)))

(declare-fun -!2085 (ListLongMap!18639 (_ BitVec 64)) ListLongMap!18639)

(assert (=> b!1256740 (= (-!2085 lt!568322 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568322)))

(declare-fun lt!568318 () Unit!41854)

(declare-fun removeNotPresentStillSame!138 (ListLongMap!18639 (_ BitVec 64)) Unit!41854)

(assert (=> b!1256740 (= lt!568318 (removeNotPresentStillSame!138 lt!568322 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1256741 () Bool)

(declare-fun res!837774 () Bool)

(assert (=> b!1256741 (=> (not res!837774) (not e!714490))))

(assert (=> b!1256741 (= res!837774 (and (= (size!39939 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39938 _keys!1118) (size!39939 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49825 () Bool)

(declare-fun tp!94885 () Bool)

(declare-fun e!714486 () Bool)

(assert (=> mapNonEmpty!49825 (= mapRes!49825 (and tp!94885 e!714486))))

(declare-fun mapKey!49825 () (_ BitVec 32))

(declare-fun mapValue!49825 () ValueCell!15249)

(declare-fun mapRest!49825 () (Array (_ BitVec 32) ValueCell!15249))

(assert (=> mapNonEmpty!49825 (= (arr!39403 _values!914) (store mapRest!49825 mapKey!49825 mapValue!49825))))

(declare-fun b!1256742 () Bool)

(assert (=> b!1256742 (= e!714486 tp_is_empty!32025)))

(declare-fun b!1256739 () Bool)

(declare-fun res!837771 () Bool)

(assert (=> b!1256739 (=> (not res!837771) (not e!714490))))

(declare-datatypes ((List!27984 0))(
  ( (Nil!27981) (Cons!27980 (h!29189 (_ BitVec 64)) (t!41473 List!27984)) )
))
(declare-fun arrayNoDuplicates!0 (array!81688 (_ BitVec 32) List!27984) Bool)

(assert (=> b!1256739 (= res!837771 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27981))))

(declare-fun res!837773 () Bool)

(assert (=> start!105486 (=> (not res!837773) (not e!714490))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105486 (= res!837773 (validMask!0 mask!1466))))

(assert (=> start!105486 e!714490))

(assert (=> start!105486 true))

(assert (=> start!105486 tp!94886))

(assert (=> start!105486 tp_is_empty!32025))

(declare-fun array_inv!30017 (array!81688) Bool)

(assert (=> start!105486 (array_inv!30017 _keys!1118)))

(declare-fun array_inv!30018 (array!81690) Bool)

(assert (=> start!105486 (and (array_inv!30018 _values!914) e!714489)))

(assert (= (and start!105486 res!837773) b!1256741))

(assert (= (and b!1256741 res!837774) b!1256737))

(assert (= (and b!1256737 res!837770) b!1256739))

(assert (= (and b!1256739 res!837771) b!1256734))

(assert (= (and b!1256734 (not res!837769)) b!1256735))

(assert (= (and b!1256735 (not res!837772)) b!1256740))

(assert (= (and b!1256736 condMapEmpty!49825) mapIsEmpty!49825))

(assert (= (and b!1256736 (not condMapEmpty!49825)) mapNonEmpty!49825))

(get-info :version)

(assert (= (and mapNonEmpty!49825 ((_ is ValueCellFull!15249) mapValue!49825)) b!1256742))

(assert (= (and b!1256736 ((_ is ValueCellFull!15249) mapDefault!49825)) b!1256738))

(assert (= start!105486 b!1256736))

(declare-fun m!1157371 () Bool)

(assert (=> b!1256735 m!1157371))

(declare-fun m!1157373 () Bool)

(assert (=> b!1256735 m!1157373))

(declare-fun m!1157375 () Bool)

(assert (=> b!1256739 m!1157375))

(declare-fun m!1157377 () Bool)

(assert (=> b!1256734 m!1157377))

(declare-fun m!1157379 () Bool)

(assert (=> b!1256734 m!1157379))

(declare-fun m!1157381 () Bool)

(assert (=> b!1256734 m!1157381))

(declare-fun m!1157383 () Bool)

(assert (=> start!105486 m!1157383))

(declare-fun m!1157385 () Bool)

(assert (=> start!105486 m!1157385))

(declare-fun m!1157387 () Bool)

(assert (=> start!105486 m!1157387))

(declare-fun m!1157389 () Bool)

(assert (=> b!1256737 m!1157389))

(declare-fun m!1157391 () Bool)

(assert (=> mapNonEmpty!49825 m!1157391))

(declare-fun m!1157393 () Bool)

(assert (=> b!1256740 m!1157393))

(declare-fun m!1157395 () Bool)

(assert (=> b!1256740 m!1157395))

(check-sat (not b!1256740) (not start!105486) b_and!44979 (not mapNonEmpty!49825) (not b_next!27123) (not b!1256737) (not b!1256735) (not b!1256734) tp_is_empty!32025 (not b!1256739))
(check-sat b_and!44979 (not b_next!27123))
