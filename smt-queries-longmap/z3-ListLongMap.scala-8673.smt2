; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105638 () Bool)

(assert start!105638)

(declare-fun b_free!27073 () Bool)

(declare-fun b_next!27073 () Bool)

(assert (=> start!105638 (= b_free!27073 (not b_next!27073))))

(declare-fun tp!94732 () Bool)

(declare-fun b_and!44921 () Bool)

(assert (=> start!105638 (= tp!94732 b_and!44921)))

(declare-fun b!1257207 () Bool)

(declare-fun e!714711 () Bool)

(declare-fun e!714708 () Bool)

(assert (=> b!1257207 (= e!714711 (not e!714708))))

(declare-fun res!837779 () Bool)

(assert (=> b!1257207 (=> res!837779 e!714708)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1257207 (= res!837779 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!47999 0))(
  ( (V!48000 (val!16050 Int)) )
))
(declare-datatypes ((tuple2!20748 0))(
  ( (tuple2!20749 (_1!10385 (_ BitVec 64)) (_2!10385 V!47999)) )
))
(declare-datatypes ((List!27980 0))(
  ( (Nil!27977) (Cons!27976 (h!29194 tuple2!20748) (t!41459 List!27980)) )
))
(declare-datatypes ((ListLongMap!18629 0))(
  ( (ListLongMap!18630 (toList!9330 List!27980)) )
))
(declare-fun lt!568307 () ListLongMap!18629)

(declare-fun lt!568305 () ListLongMap!18629)

(assert (=> b!1257207 (= lt!568307 lt!568305)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47999)

(declare-datatypes ((Unit!41801 0))(
  ( (Unit!41802) )
))
(declare-fun lt!568304 () Unit!41801)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47999)

(declare-datatypes ((array!81639 0))(
  ( (array!81640 (arr!39374 (Array (_ BitVec 32) (_ BitVec 64))) (size!39911 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81639)

(declare-datatypes ((ValueCell!15224 0))(
  ( (ValueCellFull!15224 (v!18746 V!47999)) (EmptyCell!15224) )
))
(declare-datatypes ((array!81641 0))(
  ( (array!81642 (arr!39375 (Array (_ BitVec 32) ValueCell!15224)) (size!39912 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81641)

(declare-fun minValueBefore!43 () V!47999)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1065 (array!81639 array!81641 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47999 V!47999 V!47999 V!47999 (_ BitVec 32) Int) Unit!41801)

(assert (=> b!1257207 (= lt!568304 (lemmaNoChangeToArrayThenSameMapNoExtras!1065 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5751 (array!81639 array!81641 (_ BitVec 32) (_ BitVec 32) V!47999 V!47999 (_ BitVec 32) Int) ListLongMap!18629)

(assert (=> b!1257207 (= lt!568305 (getCurrentListMapNoExtraKeys!5751 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1257207 (= lt!568307 (getCurrentListMapNoExtraKeys!5751 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1257208 () Bool)

(declare-fun e!714709 () Bool)

(assert (=> b!1257208 (= e!714708 e!714709)))

(declare-fun res!837782 () Bool)

(assert (=> b!1257208 (=> res!837782 e!714709)))

(declare-fun lt!568306 () ListLongMap!18629)

(declare-fun contains!7562 (ListLongMap!18629 (_ BitVec 64)) Bool)

(assert (=> b!1257208 (= res!837782 (contains!7562 lt!568306 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4540 (array!81639 array!81641 (_ BitVec 32) (_ BitVec 32) V!47999 V!47999 (_ BitVec 32) Int) ListLongMap!18629)

(assert (=> b!1257208 (= lt!568306 (getCurrentListMap!4540 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1257209 () Bool)

(declare-fun e!714710 () Bool)

(declare-fun e!714714 () Bool)

(declare-fun mapRes!49747 () Bool)

(assert (=> b!1257209 (= e!714710 (and e!714714 mapRes!49747))))

(declare-fun condMapEmpty!49747 () Bool)

(declare-fun mapDefault!49747 () ValueCell!15224)

(assert (=> b!1257209 (= condMapEmpty!49747 (= (arr!39375 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15224)) mapDefault!49747)))))

(declare-fun b!1257210 () Bool)

(declare-fun res!837783 () Bool)

(assert (=> b!1257210 (=> (not res!837783) (not e!714711))))

(declare-datatypes ((List!27981 0))(
  ( (Nil!27978) (Cons!27977 (h!29195 (_ BitVec 64)) (t!41460 List!27981)) )
))
(declare-fun arrayNoDuplicates!0 (array!81639 (_ BitVec 32) List!27981) Bool)

(assert (=> b!1257210 (= res!837783 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27978))))

(declare-fun b!1257211 () Bool)

(declare-fun res!837781 () Bool)

(assert (=> b!1257211 (=> (not res!837781) (not e!714711))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81639 (_ BitVec 32)) Bool)

(assert (=> b!1257211 (= res!837781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!49747 () Bool)

(assert (=> mapIsEmpty!49747 mapRes!49747))

(declare-fun b!1257212 () Bool)

(assert (=> b!1257212 (= e!714709 true)))

(declare-fun -!2046 (ListLongMap!18629 (_ BitVec 64)) ListLongMap!18629)

(assert (=> b!1257212 (= (-!2046 lt!568306 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568306)))

(declare-fun lt!568303 () Unit!41801)

(declare-fun removeNotPresentStillSame!118 (ListLongMap!18629 (_ BitVec 64)) Unit!41801)

(assert (=> b!1257212 (= lt!568303 (removeNotPresentStillSame!118 lt!568306 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1257213 () Bool)

(declare-fun e!714712 () Bool)

(declare-fun tp_is_empty!31975 () Bool)

(assert (=> b!1257213 (= e!714712 tp_is_empty!31975)))

(declare-fun mapNonEmpty!49747 () Bool)

(declare-fun tp!94733 () Bool)

(assert (=> mapNonEmpty!49747 (= mapRes!49747 (and tp!94733 e!714712))))

(declare-fun mapValue!49747 () ValueCell!15224)

(declare-fun mapKey!49747 () (_ BitVec 32))

(declare-fun mapRest!49747 () (Array (_ BitVec 32) ValueCell!15224))

(assert (=> mapNonEmpty!49747 (= (arr!39375 _values!914) (store mapRest!49747 mapKey!49747 mapValue!49747))))

(declare-fun b!1257215 () Bool)

(declare-fun res!837780 () Bool)

(assert (=> b!1257215 (=> (not res!837780) (not e!714711))))

(assert (=> b!1257215 (= res!837780 (and (= (size!39912 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39911 _keys!1118) (size!39912 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1257214 () Bool)

(assert (=> b!1257214 (= e!714714 tp_is_empty!31975)))

(declare-fun res!837778 () Bool)

(assert (=> start!105638 (=> (not res!837778) (not e!714711))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105638 (= res!837778 (validMask!0 mask!1466))))

(assert (=> start!105638 e!714711))

(assert (=> start!105638 true))

(assert (=> start!105638 tp!94732))

(assert (=> start!105638 tp_is_empty!31975))

(declare-fun array_inv!30129 (array!81639) Bool)

(assert (=> start!105638 (array_inv!30129 _keys!1118)))

(declare-fun array_inv!30130 (array!81641) Bool)

(assert (=> start!105638 (and (array_inv!30130 _values!914) e!714710)))

(assert (= (and start!105638 res!837778) b!1257215))

(assert (= (and b!1257215 res!837780) b!1257211))

(assert (= (and b!1257211 res!837781) b!1257210))

(assert (= (and b!1257210 res!837783) b!1257207))

(assert (= (and b!1257207 (not res!837779)) b!1257208))

(assert (= (and b!1257208 (not res!837782)) b!1257212))

(assert (= (and b!1257209 condMapEmpty!49747) mapIsEmpty!49747))

(assert (= (and b!1257209 (not condMapEmpty!49747)) mapNonEmpty!49747))

(get-info :version)

(assert (= (and mapNonEmpty!49747 ((_ is ValueCellFull!15224) mapValue!49747)) b!1257213))

(assert (= (and b!1257209 ((_ is ValueCellFull!15224) mapDefault!49747)) b!1257214))

(assert (= start!105638 b!1257209))

(declare-fun m!1158207 () Bool)

(assert (=> b!1257207 m!1158207))

(declare-fun m!1158209 () Bool)

(assert (=> b!1257207 m!1158209))

(declare-fun m!1158211 () Bool)

(assert (=> b!1257207 m!1158211))

(declare-fun m!1158213 () Bool)

(assert (=> b!1257208 m!1158213))

(declare-fun m!1158215 () Bool)

(assert (=> b!1257208 m!1158215))

(declare-fun m!1158217 () Bool)

(assert (=> mapNonEmpty!49747 m!1158217))

(declare-fun m!1158219 () Bool)

(assert (=> b!1257210 m!1158219))

(declare-fun m!1158221 () Bool)

(assert (=> start!105638 m!1158221))

(declare-fun m!1158223 () Bool)

(assert (=> start!105638 m!1158223))

(declare-fun m!1158225 () Bool)

(assert (=> start!105638 m!1158225))

(declare-fun m!1158227 () Bool)

(assert (=> b!1257212 m!1158227))

(declare-fun m!1158229 () Bool)

(assert (=> b!1257212 m!1158229))

(declare-fun m!1158231 () Bool)

(assert (=> b!1257211 m!1158231))

(check-sat (not b!1257208) (not mapNonEmpty!49747) b_and!44921 (not start!105638) (not b_next!27073) (not b!1257207) (not b!1257211) (not b!1257210) tp_is_empty!31975 (not b!1257212))
(check-sat b_and!44921 (not b_next!27073))
