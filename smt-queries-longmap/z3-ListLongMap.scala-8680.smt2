; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105702 () Bool)

(assert start!105702)

(declare-fun b_free!27115 () Bool)

(declare-fun b_next!27115 () Bool)

(assert (=> start!105702 (= b_free!27115 (not b_next!27115))))

(declare-fun tp!94862 () Bool)

(declare-fun b_and!44973 () Bool)

(assert (=> start!105702 (= tp!94862 b_and!44973)))

(declare-fun b!1257931 () Bool)

(declare-fun e!715254 () Bool)

(declare-fun tp_is_empty!32017 () Bool)

(assert (=> b!1257931 (= e!715254 tp_is_empty!32017)))

(declare-fun b!1257932 () Bool)

(declare-fun e!715252 () Bool)

(declare-fun e!715249 () Bool)

(assert (=> b!1257932 (= e!715252 e!715249)))

(declare-fun res!838219 () Bool)

(assert (=> b!1257932 (=> res!838219 e!715249)))

(declare-datatypes ((V!48055 0))(
  ( (V!48056 (val!16071 Int)) )
))
(declare-datatypes ((tuple2!20784 0))(
  ( (tuple2!20785 (_1!10403 (_ BitVec 64)) (_2!10403 V!48055)) )
))
(declare-datatypes ((List!28015 0))(
  ( (Nil!28012) (Cons!28011 (h!29229 tuple2!20784) (t!41496 List!28015)) )
))
(declare-datatypes ((ListLongMap!18665 0))(
  ( (ListLongMap!18666 (toList!9348 List!28015)) )
))
(declare-fun lt!568745 () ListLongMap!18665)

(declare-fun contains!7579 (ListLongMap!18665 (_ BitVec 64)) Bool)

(assert (=> b!1257932 (= res!838219 (contains!7579 lt!568745 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!48055)

(declare-datatypes ((array!81721 0))(
  ( (array!81722 (arr!39414 (Array (_ BitVec 32) (_ BitVec 64))) (size!39951 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81721)

(declare-fun minValueBefore!43 () V!48055)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((ValueCell!15245 0))(
  ( (ValueCellFull!15245 (v!18768 V!48055)) (EmptyCell!15245) )
))
(declare-datatypes ((array!81723 0))(
  ( (array!81724 (arr!39415 (Array (_ BitVec 32) ValueCell!15245)) (size!39952 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81723)

(declare-fun getCurrentListMap!4556 (array!81721 array!81723 (_ BitVec 32) (_ BitVec 32) V!48055 V!48055 (_ BitVec 32) Int) ListLongMap!18665)

(assert (=> b!1257932 (= lt!568745 (getCurrentListMap!4556 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49813 () Bool)

(declare-fun mapRes!49813 () Bool)

(declare-fun tp!94861 () Bool)

(assert (=> mapNonEmpty!49813 (= mapRes!49813 (and tp!94861 e!715254))))

(declare-fun mapKey!49813 () (_ BitVec 32))

(declare-fun mapRest!49813 () (Array (_ BitVec 32) ValueCell!15245))

(declare-fun mapValue!49813 () ValueCell!15245)

(assert (=> mapNonEmpty!49813 (= (arr!39415 _values!914) (store mapRest!49813 mapKey!49813 mapValue!49813))))

(declare-fun b!1257933 () Bool)

(declare-fun e!715255 () Bool)

(assert (=> b!1257933 (= e!715255 (not e!715252))))

(declare-fun res!838221 () Bool)

(assert (=> b!1257933 (=> res!838221 e!715252)))

(assert (=> b!1257933 (= res!838221 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!568743 () ListLongMap!18665)

(declare-fun lt!568742 () ListLongMap!18665)

(assert (=> b!1257933 (= lt!568743 lt!568742)))

(declare-datatypes ((Unit!41837 0))(
  ( (Unit!41838) )
))
(declare-fun lt!568744 () Unit!41837)

(declare-fun minValueAfter!43 () V!48055)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1079 (array!81721 array!81723 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48055 V!48055 V!48055 V!48055 (_ BitVec 32) Int) Unit!41837)

(assert (=> b!1257933 (= lt!568744 (lemmaNoChangeToArrayThenSameMapNoExtras!1079 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5765 (array!81721 array!81723 (_ BitVec 32) (_ BitVec 32) V!48055 V!48055 (_ BitVec 32) Int) ListLongMap!18665)

(assert (=> b!1257933 (= lt!568742 (getCurrentListMapNoExtraKeys!5765 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1257933 (= lt!568743 (getCurrentListMapNoExtraKeys!5765 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!838220 () Bool)

(assert (=> start!105702 (=> (not res!838220) (not e!715255))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105702 (= res!838220 (validMask!0 mask!1466))))

(assert (=> start!105702 e!715255))

(assert (=> start!105702 true))

(assert (=> start!105702 tp!94862))

(assert (=> start!105702 tp_is_empty!32017))

(declare-fun array_inv!30161 (array!81721) Bool)

(assert (=> start!105702 (array_inv!30161 _keys!1118)))

(declare-fun e!715251 () Bool)

(declare-fun array_inv!30162 (array!81723) Bool)

(assert (=> start!105702 (and (array_inv!30162 _values!914) e!715251)))

(declare-fun b!1257934 () Bool)

(declare-fun res!838218 () Bool)

(assert (=> b!1257934 (=> (not res!838218) (not e!715255))))

(declare-datatypes ((List!28016 0))(
  ( (Nil!28013) (Cons!28012 (h!29230 (_ BitVec 64)) (t!41497 List!28016)) )
))
(declare-fun arrayNoDuplicates!0 (array!81721 (_ BitVec 32) List!28016) Bool)

(assert (=> b!1257934 (= res!838218 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28013))))

(declare-fun b!1257935 () Bool)

(assert (=> b!1257935 (= e!715249 true)))

(declare-fun -!2063 (ListLongMap!18665 (_ BitVec 64)) ListLongMap!18665)

(assert (=> b!1257935 (= (-!2063 lt!568745 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568745)))

(declare-fun lt!568746 () Unit!41837)

(declare-fun removeNotPresentStillSame!135 (ListLongMap!18665 (_ BitVec 64)) Unit!41837)

(assert (=> b!1257935 (= lt!568746 (removeNotPresentStillSame!135 lt!568745 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1257936 () Bool)

(declare-fun res!838217 () Bool)

(assert (=> b!1257936 (=> (not res!838217) (not e!715255))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81721 (_ BitVec 32)) Bool)

(assert (=> b!1257936 (= res!838217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1257937 () Bool)

(declare-fun e!715253 () Bool)

(assert (=> b!1257937 (= e!715253 tp_is_empty!32017)))

(declare-fun mapIsEmpty!49813 () Bool)

(assert (=> mapIsEmpty!49813 mapRes!49813))

(declare-fun b!1257938 () Bool)

(declare-fun res!838222 () Bool)

(assert (=> b!1257938 (=> (not res!838222) (not e!715255))))

(assert (=> b!1257938 (= res!838222 (and (= (size!39952 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39951 _keys!1118) (size!39952 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1257939 () Bool)

(assert (=> b!1257939 (= e!715251 (and e!715253 mapRes!49813))))

(declare-fun condMapEmpty!49813 () Bool)

(declare-fun mapDefault!49813 () ValueCell!15245)

(assert (=> b!1257939 (= condMapEmpty!49813 (= (arr!39415 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15245)) mapDefault!49813)))))

(assert (= (and start!105702 res!838220) b!1257938))

(assert (= (and b!1257938 res!838222) b!1257936))

(assert (= (and b!1257936 res!838217) b!1257934))

(assert (= (and b!1257934 res!838218) b!1257933))

(assert (= (and b!1257933 (not res!838221)) b!1257932))

(assert (= (and b!1257932 (not res!838219)) b!1257935))

(assert (= (and b!1257939 condMapEmpty!49813) mapIsEmpty!49813))

(assert (= (and b!1257939 (not condMapEmpty!49813)) mapNonEmpty!49813))

(get-info :version)

(assert (= (and mapNonEmpty!49813 ((_ is ValueCellFull!15245) mapValue!49813)) b!1257931))

(assert (= (and b!1257939 ((_ is ValueCellFull!15245) mapDefault!49813)) b!1257937))

(assert (= start!105702 b!1257939))

(declare-fun m!1158879 () Bool)

(assert (=> b!1257933 m!1158879))

(declare-fun m!1158881 () Bool)

(assert (=> b!1257933 m!1158881))

(declare-fun m!1158883 () Bool)

(assert (=> b!1257933 m!1158883))

(declare-fun m!1158885 () Bool)

(assert (=> start!105702 m!1158885))

(declare-fun m!1158887 () Bool)

(assert (=> start!105702 m!1158887))

(declare-fun m!1158889 () Bool)

(assert (=> start!105702 m!1158889))

(declare-fun m!1158891 () Bool)

(assert (=> b!1257935 m!1158891))

(declare-fun m!1158893 () Bool)

(assert (=> b!1257935 m!1158893))

(declare-fun m!1158895 () Bool)

(assert (=> b!1257934 m!1158895))

(declare-fun m!1158897 () Bool)

(assert (=> b!1257936 m!1158897))

(declare-fun m!1158899 () Bool)

(assert (=> b!1257932 m!1158899))

(declare-fun m!1158901 () Bool)

(assert (=> b!1257932 m!1158901))

(declare-fun m!1158903 () Bool)

(assert (=> mapNonEmpty!49813 m!1158903))

(check-sat (not mapNonEmpty!49813) (not b!1257933) (not b!1257934) (not b_next!27115) (not b!1257935) b_and!44973 (not b!1257936) tp_is_empty!32017 (not b!1257932) (not start!105702))
(check-sat b_and!44973 (not b_next!27115))
