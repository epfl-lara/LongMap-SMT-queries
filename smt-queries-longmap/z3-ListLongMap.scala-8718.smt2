; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105776 () Bool)

(assert start!105776)

(declare-fun b_free!27343 () Bool)

(declare-fun b_next!27343 () Bool)

(assert (=> start!105776 (= b_free!27343 (not b_next!27343))))

(declare-fun tp!95558 () Bool)

(declare-fun b_and!45221 () Bool)

(assert (=> start!105776 (= tp!95558 b_and!45221)))

(declare-fun b!1259957 () Bool)

(declare-fun res!839702 () Bool)

(declare-fun e!716881 () Bool)

(assert (=> b!1259957 (=> (not res!839702) (not e!716881))))

(declare-datatypes ((array!82035 0))(
  ( (array!82036 (arr!39572 (Array (_ BitVec 32) (_ BitVec 64))) (size!40110 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82035)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82035 (_ BitVec 32)) Bool)

(assert (=> b!1259957 (= res!839702 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1259958 () Bool)

(declare-fun e!716882 () Bool)

(assert (=> b!1259958 (= e!716882 true)))

(declare-datatypes ((V!48359 0))(
  ( (V!48360 (val!16185 Int)) )
))
(declare-datatypes ((tuple2!21008 0))(
  ( (tuple2!21009 (_1!10515 (_ BitVec 64)) (_2!10515 V!48359)) )
))
(declare-datatypes ((List!28210 0))(
  ( (Nil!28207) (Cons!28206 (h!29415 tuple2!21008) (t!41698 List!28210)) )
))
(declare-datatypes ((ListLongMap!18881 0))(
  ( (ListLongMap!18882 (toList!9456 List!28210)) )
))
(declare-fun lt!570502 () ListLongMap!18881)

(declare-fun lt!570499 () ListLongMap!18881)

(declare-fun -!2075 (ListLongMap!18881 (_ BitVec 64)) ListLongMap!18881)

(assert (=> b!1259958 (= lt!570502 (-!2075 lt!570499 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!570503 () ListLongMap!18881)

(declare-fun lt!570501 () ListLongMap!18881)

(assert (=> b!1259958 (= (-!2075 lt!570503 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570501)))

(declare-datatypes ((Unit!41858 0))(
  ( (Unit!41859) )
))
(declare-fun lt!570495 () Unit!41858)

(declare-fun minValueBefore!43 () V!48359)

(declare-fun addThenRemoveForNewKeyIsSame!332 (ListLongMap!18881 (_ BitVec 64) V!48359) Unit!41858)

(assert (=> b!1259958 (= lt!570495 (addThenRemoveForNewKeyIsSame!332 lt!570501 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!716880 () Bool)

(assert (=> b!1259958 e!716880))

(declare-fun res!839706 () Bool)

(assert (=> b!1259958 (=> (not res!839706) (not e!716880))))

(assert (=> b!1259958 (= res!839706 (= lt!570499 lt!570503))))

(declare-fun +!4257 (ListLongMap!18881 tuple2!21008) ListLongMap!18881)

(assert (=> b!1259958 (= lt!570503 (+!4257 lt!570501 (tuple2!21009 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!570500 () ListLongMap!18881)

(declare-fun lt!570498 () tuple2!21008)

(assert (=> b!1259958 (= lt!570501 (+!4257 lt!570500 lt!570498))))

(declare-fun zeroValue!871 () V!48359)

(assert (=> b!1259958 (= lt!570498 (tuple2!21009 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48359)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((ValueCell!15359 0))(
  ( (ValueCellFull!15359 (v!18887 V!48359)) (EmptyCell!15359) )
))
(declare-datatypes ((array!82037 0))(
  ( (array!82038 (arr!39573 (Array (_ BitVec 32) ValueCell!15359)) (size!40111 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82037)

(declare-fun lt!570497 () ListLongMap!18881)

(declare-fun getCurrentListMap!4541 (array!82035 array!82037 (_ BitVec 32) (_ BitVec 32) V!48359 V!48359 (_ BitVec 32) Int) ListLongMap!18881)

(assert (=> b!1259958 (= lt!570497 (getCurrentListMap!4541 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1259958 (= lt!570499 (getCurrentListMap!4541 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259959 () Bool)

(declare-fun res!839707 () Bool)

(assert (=> b!1259959 (=> (not res!839707) (not e!716881))))

(declare-datatypes ((List!28211 0))(
  ( (Nil!28208) (Cons!28207 (h!29416 (_ BitVec 64)) (t!41699 List!28211)) )
))
(declare-fun arrayNoDuplicates!0 (array!82035 (_ BitVec 32) List!28211) Bool)

(assert (=> b!1259959 (= res!839707 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28208))))

(declare-fun b!1259960 () Bool)

(declare-fun res!839704 () Bool)

(assert (=> b!1259960 (=> (not res!839704) (not e!716881))))

(assert (=> b!1259960 (= res!839704 (and (= (size!40111 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40110 _keys!1118) (size!40111 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!570494 () ListLongMap!18881)

(declare-fun b!1259961 () Bool)

(assert (=> b!1259961 (= e!716880 (= lt!570497 (+!4257 lt!570494 lt!570498)))))

(declare-fun res!839703 () Bool)

(assert (=> start!105776 (=> (not res!839703) (not e!716881))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105776 (= res!839703 (validMask!0 mask!1466))))

(assert (=> start!105776 e!716881))

(assert (=> start!105776 true))

(assert (=> start!105776 tp!95558))

(declare-fun tp_is_empty!32245 () Bool)

(assert (=> start!105776 tp_is_empty!32245))

(declare-fun array_inv!30275 (array!82035) Bool)

(assert (=> start!105776 (array_inv!30275 _keys!1118)))

(declare-fun e!716879 () Bool)

(declare-fun array_inv!30276 (array!82037) Bool)

(assert (=> start!105776 (and (array_inv!30276 _values!914) e!716879)))

(declare-fun b!1259962 () Bool)

(declare-fun e!716878 () Bool)

(assert (=> b!1259962 (= e!716878 tp_is_empty!32245)))

(declare-fun mapNonEmpty!50167 () Bool)

(declare-fun mapRes!50167 () Bool)

(declare-fun tp!95557 () Bool)

(assert (=> mapNonEmpty!50167 (= mapRes!50167 (and tp!95557 e!716878))))

(declare-fun mapValue!50167 () ValueCell!15359)

(declare-fun mapRest!50167 () (Array (_ BitVec 32) ValueCell!15359))

(declare-fun mapKey!50167 () (_ BitVec 32))

(assert (=> mapNonEmpty!50167 (= (arr!39573 _values!914) (store mapRest!50167 mapKey!50167 mapValue!50167))))

(declare-fun mapIsEmpty!50167 () Bool)

(assert (=> mapIsEmpty!50167 mapRes!50167))

(declare-fun b!1259963 () Bool)

(assert (=> b!1259963 (= e!716881 (not e!716882))))

(declare-fun res!839705 () Bool)

(assert (=> b!1259963 (=> res!839705 e!716882)))

(assert (=> b!1259963 (= res!839705 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1259963 (= lt!570500 lt!570494)))

(declare-fun lt!570496 () Unit!41858)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1149 (array!82035 array!82037 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48359 V!48359 V!48359 V!48359 (_ BitVec 32) Int) Unit!41858)

(assert (=> b!1259963 (= lt!570496 (lemmaNoChangeToArrayThenSameMapNoExtras!1149 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5827 (array!82035 array!82037 (_ BitVec 32) (_ BitVec 32) V!48359 V!48359 (_ BitVec 32) Int) ListLongMap!18881)

(assert (=> b!1259963 (= lt!570494 (getCurrentListMapNoExtraKeys!5827 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259963 (= lt!570500 (getCurrentListMapNoExtraKeys!5827 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259964 () Bool)

(declare-fun e!716884 () Bool)

(assert (=> b!1259964 (= e!716879 (and e!716884 mapRes!50167))))

(declare-fun condMapEmpty!50167 () Bool)

(declare-fun mapDefault!50167 () ValueCell!15359)

(assert (=> b!1259964 (= condMapEmpty!50167 (= (arr!39573 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15359)) mapDefault!50167)))))

(declare-fun b!1259965 () Bool)

(assert (=> b!1259965 (= e!716884 tp_is_empty!32245)))

(assert (= (and start!105776 res!839703) b!1259960))

(assert (= (and b!1259960 res!839704) b!1259957))

(assert (= (and b!1259957 res!839702) b!1259959))

(assert (= (and b!1259959 res!839707) b!1259963))

(assert (= (and b!1259963 (not res!839705)) b!1259958))

(assert (= (and b!1259958 res!839706) b!1259961))

(assert (= (and b!1259964 condMapEmpty!50167) mapIsEmpty!50167))

(assert (= (and b!1259964 (not condMapEmpty!50167)) mapNonEmpty!50167))

(get-info :version)

(assert (= (and mapNonEmpty!50167 ((_ is ValueCellFull!15359) mapValue!50167)) b!1259962))

(assert (= (and b!1259964 ((_ is ValueCellFull!15359) mapDefault!50167)) b!1259965))

(assert (= start!105776 b!1259964))

(declare-fun m!1160121 () Bool)

(assert (=> b!1259961 m!1160121))

(declare-fun m!1160123 () Bool)

(assert (=> b!1259963 m!1160123))

(declare-fun m!1160125 () Bool)

(assert (=> b!1259963 m!1160125))

(declare-fun m!1160127 () Bool)

(assert (=> b!1259963 m!1160127))

(declare-fun m!1160129 () Bool)

(assert (=> b!1259958 m!1160129))

(declare-fun m!1160131 () Bool)

(assert (=> b!1259958 m!1160131))

(declare-fun m!1160133 () Bool)

(assert (=> b!1259958 m!1160133))

(declare-fun m!1160135 () Bool)

(assert (=> b!1259958 m!1160135))

(declare-fun m!1160137 () Bool)

(assert (=> b!1259958 m!1160137))

(declare-fun m!1160139 () Bool)

(assert (=> b!1259958 m!1160139))

(declare-fun m!1160141 () Bool)

(assert (=> b!1259958 m!1160141))

(declare-fun m!1160143 () Bool)

(assert (=> start!105776 m!1160143))

(declare-fun m!1160145 () Bool)

(assert (=> start!105776 m!1160145))

(declare-fun m!1160147 () Bool)

(assert (=> start!105776 m!1160147))

(declare-fun m!1160149 () Bool)

(assert (=> mapNonEmpty!50167 m!1160149))

(declare-fun m!1160151 () Bool)

(assert (=> b!1259957 m!1160151))

(declare-fun m!1160153 () Bool)

(assert (=> b!1259959 m!1160153))

(check-sat b_and!45221 (not b!1259959) (not start!105776) (not b!1259963) (not b!1259961) (not mapNonEmpty!50167) (not b!1259957) (not b!1259958) tp_is_empty!32245 (not b_next!27343))
(check-sat b_and!45221 (not b_next!27343))
