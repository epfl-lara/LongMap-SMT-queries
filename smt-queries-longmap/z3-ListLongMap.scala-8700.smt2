; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105630 () Bool)

(assert start!105630)

(declare-fun b_free!27235 () Bool)

(declare-fun b_next!27235 () Bool)

(assert (=> start!105630 (= b_free!27235 (not b_next!27235))))

(declare-fun tp!95228 () Bool)

(declare-fun b_and!45091 () Bool)

(assert (=> start!105630 (= tp!95228 b_and!45091)))

(declare-fun res!838639 () Bool)

(declare-fun e!715582 () Bool)

(assert (=> start!105630 (=> (not res!838639) (not e!715582))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105630 (= res!838639 (validMask!0 mask!1466))))

(assert (=> start!105630 e!715582))

(assert (=> start!105630 true))

(assert (=> start!105630 tp!95228))

(declare-fun tp_is_empty!32137 () Bool)

(assert (=> start!105630 tp_is_empty!32137))

(declare-datatypes ((array!81823 0))(
  ( (array!81824 (arr!39468 (Array (_ BitVec 32) (_ BitVec 64))) (size!40006 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81823)

(declare-fun array_inv!30195 (array!81823) Bool)

(assert (=> start!105630 (array_inv!30195 _keys!1118)))

(declare-datatypes ((V!48215 0))(
  ( (V!48216 (val!16131 Int)) )
))
(declare-datatypes ((ValueCell!15305 0))(
  ( (ValueCellFull!15305 (v!18832 V!48215)) (EmptyCell!15305) )
))
(declare-datatypes ((array!81825 0))(
  ( (array!81826 (arr!39469 (Array (_ BitVec 32) ValueCell!15305)) (size!40007 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81825)

(declare-fun e!715581 () Bool)

(declare-fun array_inv!30196 (array!81825) Bool)

(assert (=> start!105630 (and (array_inv!30196 _values!914) e!715581)))

(declare-fun mapNonEmpty!49999 () Bool)

(declare-fun mapRes!49999 () Bool)

(declare-fun tp!95227 () Bool)

(declare-fun e!715584 () Bool)

(assert (=> mapNonEmpty!49999 (= mapRes!49999 (and tp!95227 e!715584))))

(declare-fun mapKey!49999 () (_ BitVec 32))

(declare-fun mapRest!49999 () (Array (_ BitVec 32) ValueCell!15305))

(declare-fun mapValue!49999 () ValueCell!15305)

(assert (=> mapNonEmpty!49999 (= (arr!39469 _values!914) (store mapRest!49999 mapKey!49999 mapValue!49999))))

(declare-fun b!1258215 () Bool)

(declare-fun res!838638 () Bool)

(assert (=> b!1258215 (=> (not res!838638) (not e!715582))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81823 (_ BitVec 32)) Bool)

(assert (=> b!1258215 (= res!838638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1258216 () Bool)

(declare-fun e!715583 () Bool)

(assert (=> b!1258216 (= e!715583 tp_is_empty!32137)))

(declare-fun b!1258217 () Bool)

(assert (=> b!1258217 (= e!715584 tp_is_empty!32137)))

(declare-fun b!1258218 () Bool)

(declare-fun res!838641 () Bool)

(assert (=> b!1258218 (=> (not res!838641) (not e!715582))))

(declare-datatypes ((List!28130 0))(
  ( (Nil!28127) (Cons!28126 (h!29335 (_ BitVec 64)) (t!41614 List!28130)) )
))
(declare-fun arrayNoDuplicates!0 (array!81823 (_ BitVec 32) List!28130) Bool)

(assert (=> b!1258218 (= res!838641 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28127))))

(declare-fun b!1258219 () Bool)

(declare-fun e!715585 () Bool)

(assert (=> b!1258219 (= e!715585 true)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48215)

(declare-fun minValueBefore!43 () V!48215)

(declare-datatypes ((tuple2!20922 0))(
  ( (tuple2!20923 (_1!10472 (_ BitVec 64)) (_2!10472 V!48215)) )
))
(declare-datatypes ((List!28131 0))(
  ( (Nil!28128) (Cons!28127 (h!29336 tuple2!20922) (t!41615 List!28131)) )
))
(declare-datatypes ((ListLongMap!18795 0))(
  ( (ListLongMap!18796 (toList!9413 List!28131)) )
))
(declare-fun lt!568955 () ListLongMap!18795)

(declare-fun defaultEntry!922 () Int)

(declare-fun getCurrentListMap!4504 (array!81823 array!81825 (_ BitVec 32) (_ BitVec 32) V!48215 V!48215 (_ BitVec 32) Int) ListLongMap!18795)

(assert (=> b!1258219 (= lt!568955 (getCurrentListMap!4504 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258220 () Bool)

(assert (=> b!1258220 (= e!715581 (and e!715583 mapRes!49999))))

(declare-fun condMapEmpty!49999 () Bool)

(declare-fun mapDefault!49999 () ValueCell!15305)

(assert (=> b!1258220 (= condMapEmpty!49999 (= (arr!39469 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15305)) mapDefault!49999)))))

(declare-fun mapIsEmpty!49999 () Bool)

(assert (=> mapIsEmpty!49999 mapRes!49999))

(declare-fun b!1258221 () Bool)

(declare-fun res!838640 () Bool)

(assert (=> b!1258221 (=> (not res!838640) (not e!715582))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1258221 (= res!838640 (and (= (size!40007 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40006 _keys!1118) (size!40007 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1258222 () Bool)

(assert (=> b!1258222 (= e!715582 (not e!715585))))

(declare-fun res!838642 () Bool)

(assert (=> b!1258222 (=> res!838642 e!715585)))

(assert (=> b!1258222 (= res!838642 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!568953 () ListLongMap!18795)

(declare-fun lt!568952 () ListLongMap!18795)

(assert (=> b!1258222 (= lt!568953 lt!568952)))

(declare-fun minValueAfter!43 () V!48215)

(declare-datatypes ((Unit!41781 0))(
  ( (Unit!41782) )
))
(declare-fun lt!568954 () Unit!41781)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1115 (array!81823 array!81825 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48215 V!48215 V!48215 V!48215 (_ BitVec 32) Int) Unit!41781)

(assert (=> b!1258222 (= lt!568954 (lemmaNoChangeToArrayThenSameMapNoExtras!1115 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5793 (array!81823 array!81825 (_ BitVec 32) (_ BitVec 32) V!48215 V!48215 (_ BitVec 32) Int) ListLongMap!18795)

(assert (=> b!1258222 (= lt!568952 (getCurrentListMapNoExtraKeys!5793 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258222 (= lt!568953 (getCurrentListMapNoExtraKeys!5793 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105630 res!838639) b!1258221))

(assert (= (and b!1258221 res!838640) b!1258215))

(assert (= (and b!1258215 res!838638) b!1258218))

(assert (= (and b!1258218 res!838641) b!1258222))

(assert (= (and b!1258222 (not res!838642)) b!1258219))

(assert (= (and b!1258220 condMapEmpty!49999) mapIsEmpty!49999))

(assert (= (and b!1258220 (not condMapEmpty!49999)) mapNonEmpty!49999))

(get-info :version)

(assert (= (and mapNonEmpty!49999 ((_ is ValueCellFull!15305) mapValue!49999)) b!1258217))

(assert (= (and b!1258220 ((_ is ValueCellFull!15305) mapDefault!49999)) b!1258216))

(assert (= start!105630 b!1258220))

(declare-fun m!1158229 () Bool)

(assert (=> start!105630 m!1158229))

(declare-fun m!1158231 () Bool)

(assert (=> start!105630 m!1158231))

(declare-fun m!1158233 () Bool)

(assert (=> start!105630 m!1158233))

(declare-fun m!1158235 () Bool)

(assert (=> mapNonEmpty!49999 m!1158235))

(declare-fun m!1158237 () Bool)

(assert (=> b!1258218 m!1158237))

(declare-fun m!1158239 () Bool)

(assert (=> b!1258222 m!1158239))

(declare-fun m!1158241 () Bool)

(assert (=> b!1258222 m!1158241))

(declare-fun m!1158243 () Bool)

(assert (=> b!1258222 m!1158243))

(declare-fun m!1158245 () Bool)

(assert (=> b!1258215 m!1158245))

(declare-fun m!1158247 () Bool)

(assert (=> b!1258219 m!1158247))

(check-sat (not start!105630) (not b!1258222) (not mapNonEmpty!49999) (not b_next!27235) (not b!1258215) (not b!1258219) tp_is_empty!32137 b_and!45091 (not b!1258218))
(check-sat b_and!45091 (not b_next!27235))
