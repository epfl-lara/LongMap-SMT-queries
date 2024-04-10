; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105416 () Bool)

(assert start!105416)

(declare-fun b_free!27075 () Bool)

(declare-fun b_next!27075 () Bool)

(assert (=> start!105416 (= b_free!27075 (not b_next!27075))))

(declare-fun tp!94738 () Bool)

(declare-fun b_and!44921 () Bool)

(assert (=> start!105416 (= tp!94738 b_and!44921)))

(declare-fun b!1255929 () Bool)

(declare-fun res!837278 () Bool)

(declare-fun e!713882 () Bool)

(assert (=> b!1255929 (=> (not res!837278) (not e!713882))))

(declare-datatypes ((array!81596 0))(
  ( (array!81597 (arr!39357 (Array (_ BitVec 32) (_ BitVec 64))) (size!39893 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81596)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81596 (_ BitVec 32)) Bool)

(assert (=> b!1255929 (= res!837278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!837277 () Bool)

(assert (=> start!105416 (=> (not res!837277) (not e!713882))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105416 (= res!837277 (validMask!0 mask!1466))))

(assert (=> start!105416 e!713882))

(assert (=> start!105416 true))

(assert (=> start!105416 tp!94738))

(declare-fun tp_is_empty!31977 () Bool)

(assert (=> start!105416 tp_is_empty!31977))

(declare-fun array_inv!29987 (array!81596) Bool)

(assert (=> start!105416 (array_inv!29987 _keys!1118)))

(declare-datatypes ((V!48001 0))(
  ( (V!48002 (val!16051 Int)) )
))
(declare-datatypes ((ValueCell!15225 0))(
  ( (ValueCellFull!15225 (v!18751 V!48001)) (EmptyCell!15225) )
))
(declare-datatypes ((array!81598 0))(
  ( (array!81599 (arr!39358 (Array (_ BitVec 32) ValueCell!15225)) (size!39894 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81598)

(declare-fun e!713885 () Bool)

(declare-fun array_inv!29988 (array!81598) Bool)

(assert (=> start!105416 (and (array_inv!29988 _values!914) e!713885)))

(declare-fun b!1255930 () Bool)

(declare-fun e!713886 () Bool)

(declare-fun mapRes!49750 () Bool)

(assert (=> b!1255930 (= e!713885 (and e!713886 mapRes!49750))))

(declare-fun condMapEmpty!49750 () Bool)

(declare-fun mapDefault!49750 () ValueCell!15225)

(assert (=> b!1255930 (= condMapEmpty!49750 (= (arr!39358 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15225)) mapDefault!49750)))))

(declare-fun b!1255931 () Bool)

(declare-fun res!837281 () Bool)

(assert (=> b!1255931 (=> (not res!837281) (not e!713882))))

(declare-datatypes ((List!27950 0))(
  ( (Nil!27947) (Cons!27946 (h!29155 (_ BitVec 64)) (t!41437 List!27950)) )
))
(declare-fun arrayNoDuplicates!0 (array!81596 (_ BitVec 32) List!27950) Bool)

(assert (=> b!1255931 (= res!837281 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27947))))

(declare-fun b!1255932 () Bool)

(declare-fun res!837279 () Bool)

(assert (=> b!1255932 (=> (not res!837279) (not e!713882))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1255932 (= res!837279 (and (= (size!39894 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39893 _keys!1118) (size!39894 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!49750 () Bool)

(assert (=> mapIsEmpty!49750 mapRes!49750))

(declare-fun b!1255933 () Bool)

(declare-fun e!713883 () Bool)

(assert (=> b!1255933 (= e!713882 (not e!713883))))

(declare-fun res!837280 () Bool)

(assert (=> b!1255933 (=> res!837280 e!713883)))

(assert (=> b!1255933 (= res!837280 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!20730 0))(
  ( (tuple2!20731 (_1!10376 (_ BitVec 64)) (_2!10376 V!48001)) )
))
(declare-datatypes ((List!27951 0))(
  ( (Nil!27948) (Cons!27947 (h!29156 tuple2!20730) (t!41438 List!27951)) )
))
(declare-datatypes ((ListLongMap!18603 0))(
  ( (ListLongMap!18604 (toList!9317 List!27951)) )
))
(declare-fun lt!567835 () ListLongMap!18603)

(declare-fun lt!567837 () ListLongMap!18603)

(assert (=> b!1255933 (= lt!567835 lt!567837)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48001)

(declare-datatypes ((Unit!41820 0))(
  ( (Unit!41821) )
))
(declare-fun lt!567838 () Unit!41820)

(declare-fun zeroValue!871 () V!48001)

(declare-fun minValueBefore!43 () V!48001)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1066 (array!81596 array!81598 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48001 V!48001 V!48001 V!48001 (_ BitVec 32) Int) Unit!41820)

(assert (=> b!1255933 (= lt!567838 (lemmaNoChangeToArrayThenSameMapNoExtras!1066 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5702 (array!81596 array!81598 (_ BitVec 32) (_ BitVec 32) V!48001 V!48001 (_ BitVec 32) Int) ListLongMap!18603)

(assert (=> b!1255933 (= lt!567837 (getCurrentListMapNoExtraKeys!5702 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255933 (= lt!567835 (getCurrentListMapNoExtraKeys!5702 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255934 () Bool)

(declare-fun e!713887 () Bool)

(assert (=> b!1255934 (= e!713883 e!713887)))

(declare-fun res!837276 () Bool)

(assert (=> b!1255934 (=> res!837276 e!713887)))

(declare-fun lt!567836 () ListLongMap!18603)

(declare-fun contains!7534 (ListLongMap!18603 (_ BitVec 64)) Bool)

(assert (=> b!1255934 (= res!837276 (contains!7534 lt!567836 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4540 (array!81596 array!81598 (_ BitVec 32) (_ BitVec 32) V!48001 V!48001 (_ BitVec 32) Int) ListLongMap!18603)

(assert (=> b!1255934 (= lt!567836 (getCurrentListMap!4540 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255935 () Bool)

(assert (=> b!1255935 (= e!713887 true)))

(declare-fun -!2070 (ListLongMap!18603 (_ BitVec 64)) ListLongMap!18603)

(assert (=> b!1255935 (= (-!2070 lt!567836 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567836)))

(declare-fun lt!567834 () Unit!41820)

(declare-fun removeNotPresentStillSame!123 (ListLongMap!18603 (_ BitVec 64)) Unit!41820)

(assert (=> b!1255935 (= lt!567834 (removeNotPresentStillSame!123 lt!567836 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1255936 () Bool)

(assert (=> b!1255936 (= e!713886 tp_is_empty!31977)))

(declare-fun b!1255937 () Bool)

(declare-fun e!713884 () Bool)

(assert (=> b!1255937 (= e!713884 tp_is_empty!31977)))

(declare-fun mapNonEmpty!49750 () Bool)

(declare-fun tp!94739 () Bool)

(assert (=> mapNonEmpty!49750 (= mapRes!49750 (and tp!94739 e!713884))))

(declare-fun mapRest!49750 () (Array (_ BitVec 32) ValueCell!15225))

(declare-fun mapValue!49750 () ValueCell!15225)

(declare-fun mapKey!49750 () (_ BitVec 32))

(assert (=> mapNonEmpty!49750 (= (arr!39358 _values!914) (store mapRest!49750 mapKey!49750 mapValue!49750))))

(assert (= (and start!105416 res!837277) b!1255932))

(assert (= (and b!1255932 res!837279) b!1255929))

(assert (= (and b!1255929 res!837278) b!1255931))

(assert (= (and b!1255931 res!837281) b!1255933))

(assert (= (and b!1255933 (not res!837280)) b!1255934))

(assert (= (and b!1255934 (not res!837276)) b!1255935))

(assert (= (and b!1255930 condMapEmpty!49750) mapIsEmpty!49750))

(assert (= (and b!1255930 (not condMapEmpty!49750)) mapNonEmpty!49750))

(get-info :version)

(assert (= (and mapNonEmpty!49750 ((_ is ValueCellFull!15225) mapValue!49750)) b!1255937))

(assert (= (and b!1255930 ((_ is ValueCellFull!15225) mapDefault!49750)) b!1255936))

(assert (= start!105416 b!1255930))

(declare-fun m!1156621 () Bool)

(assert (=> b!1255929 m!1156621))

(declare-fun m!1156623 () Bool)

(assert (=> b!1255934 m!1156623))

(declare-fun m!1156625 () Bool)

(assert (=> b!1255934 m!1156625))

(declare-fun m!1156627 () Bool)

(assert (=> b!1255935 m!1156627))

(declare-fun m!1156629 () Bool)

(assert (=> b!1255935 m!1156629))

(declare-fun m!1156631 () Bool)

(assert (=> mapNonEmpty!49750 m!1156631))

(declare-fun m!1156633 () Bool)

(assert (=> start!105416 m!1156633))

(declare-fun m!1156635 () Bool)

(assert (=> start!105416 m!1156635))

(declare-fun m!1156637 () Bool)

(assert (=> start!105416 m!1156637))

(declare-fun m!1156639 () Bool)

(assert (=> b!1255931 m!1156639))

(declare-fun m!1156641 () Bool)

(assert (=> b!1255933 m!1156641))

(declare-fun m!1156643 () Bool)

(assert (=> b!1255933 m!1156643))

(declare-fun m!1156645 () Bool)

(assert (=> b!1255933 m!1156645))

(check-sat (not start!105416) tp_is_empty!31977 (not b!1255935) (not b!1255934) (not mapNonEmpty!49750) (not b!1255929) b_and!44921 (not b_next!27075) (not b!1255933) (not b!1255931))
(check-sat b_and!44921 (not b_next!27075))
