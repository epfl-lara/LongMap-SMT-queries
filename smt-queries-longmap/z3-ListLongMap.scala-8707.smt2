; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105916 () Bool)

(assert start!105916)

(declare-fun b_free!27277 () Bool)

(declare-fun b_next!27277 () Bool)

(assert (=> start!105916 (= b_free!27277 (not b_next!27277))))

(declare-fun tp!95356 () Bool)

(declare-fun b_and!45163 () Bool)

(assert (=> start!105916 (= tp!95356 b_and!45163)))

(declare-fun b!1260266 () Bool)

(declare-fun res!839585 () Bool)

(declare-fun e!716959 () Bool)

(assert (=> b!1260266 (=> (not res!839585) (not e!716959))))

(declare-datatypes ((array!82033 0))(
  ( (array!82034 (arr!39567 (Array (_ BitVec 32) (_ BitVec 64))) (size!40104 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82033)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82033 (_ BitVec 32)) Bool)

(assert (=> b!1260266 (= res!839585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1260267 () Bool)

(declare-fun e!716958 () Bool)

(declare-fun tp_is_empty!32179 () Bool)

(assert (=> b!1260267 (= e!716958 tp_is_empty!32179)))

(declare-fun b!1260268 () Bool)

(declare-fun res!839584 () Bool)

(assert (=> b!1260268 (=> (not res!839584) (not e!716959))))

(declare-datatypes ((List!28124 0))(
  ( (Nil!28121) (Cons!28120 (h!29338 (_ BitVec 64)) (t!41611 List!28124)) )
))
(declare-fun arrayNoDuplicates!0 (array!82033 (_ BitVec 32) List!28124) Bool)

(assert (=> b!1260268 (= res!839584 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28121))))

(declare-fun b!1260269 () Bool)

(declare-fun e!716957 () Bool)

(assert (=> b!1260269 (= e!716959 (not e!716957))))

(declare-fun res!839586 () Bool)

(assert (=> b!1260269 (=> res!839586 e!716957)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1260269 (= res!839586 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!48271 0))(
  ( (V!48272 (val!16152 Int)) )
))
(declare-datatypes ((tuple2!20896 0))(
  ( (tuple2!20897 (_1!10459 (_ BitVec 64)) (_2!10459 V!48271)) )
))
(declare-datatypes ((List!28125 0))(
  ( (Nil!28122) (Cons!28121 (h!29339 tuple2!20896) (t!41612 List!28125)) )
))
(declare-datatypes ((ListLongMap!18777 0))(
  ( (ListLongMap!18778 (toList!9404 List!28125)) )
))
(declare-fun lt!570030 () ListLongMap!18777)

(declare-fun lt!570022 () ListLongMap!18777)

(assert (=> b!1260269 (= lt!570030 lt!570022)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48271)

(declare-datatypes ((Unit!41948 0))(
  ( (Unit!41949) )
))
(declare-fun lt!570027 () Unit!41948)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48271)

(declare-datatypes ((ValueCell!15326 0))(
  ( (ValueCellFull!15326 (v!18850 V!48271)) (EmptyCell!15326) )
))
(declare-datatypes ((array!82035 0))(
  ( (array!82036 (arr!39568 (Array (_ BitVec 32) ValueCell!15326)) (size!40105 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82035)

(declare-fun minValueBefore!43 () V!48271)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1132 (array!82033 array!82035 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48271 V!48271 V!48271 V!48271 (_ BitVec 32) Int) Unit!41948)

(assert (=> b!1260269 (= lt!570027 (lemmaNoChangeToArrayThenSameMapNoExtras!1132 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5818 (array!82033 array!82035 (_ BitVec 32) (_ BitVec 32) V!48271 V!48271 (_ BitVec 32) Int) ListLongMap!18777)

(assert (=> b!1260269 (= lt!570022 (getCurrentListMapNoExtraKeys!5818 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260269 (= lt!570030 (getCurrentListMapNoExtraKeys!5818 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun e!716962 () Bool)

(declare-fun b!1260270 () Bool)

(declare-fun lt!570021 () ListLongMap!18777)

(declare-fun lt!570029 () tuple2!20896)

(declare-fun +!4245 (ListLongMap!18777 tuple2!20896) ListLongMap!18777)

(assert (=> b!1260270 (= e!716962 (= lt!570021 (+!4245 lt!570022 lt!570029)))))

(declare-fun mapNonEmpty!50065 () Bool)

(declare-fun mapRes!50065 () Bool)

(declare-fun tp!95357 () Bool)

(assert (=> mapNonEmpty!50065 (= mapRes!50065 (and tp!95357 e!716958))))

(declare-fun mapKey!50065 () (_ BitVec 32))

(declare-fun mapValue!50065 () ValueCell!15326)

(declare-fun mapRest!50065 () (Array (_ BitVec 32) ValueCell!15326))

(assert (=> mapNonEmpty!50065 (= (arr!39568 _values!914) (store mapRest!50065 mapKey!50065 mapValue!50065))))

(declare-fun b!1260271 () Bool)

(declare-fun e!716956 () Bool)

(assert (=> b!1260271 (= e!716956 tp_is_empty!32179)))

(declare-fun mapIsEmpty!50065 () Bool)

(assert (=> mapIsEmpty!50065 mapRes!50065))

(declare-fun b!1260272 () Bool)

(declare-fun res!839583 () Bool)

(assert (=> b!1260272 (=> (not res!839583) (not e!716959))))

(assert (=> b!1260272 (= res!839583 (and (= (size!40105 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40104 _keys!1118) (size!40105 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1260273 () Bool)

(assert (=> b!1260273 (= e!716957 true)))

(declare-fun lt!570026 () ListLongMap!18777)

(declare-fun lt!570028 () ListLongMap!18777)

(declare-fun -!2077 (ListLongMap!18777 (_ BitVec 64)) ListLongMap!18777)

(assert (=> b!1260273 (= lt!570026 (-!2077 lt!570028 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!570025 () ListLongMap!18777)

(declare-fun lt!570023 () ListLongMap!18777)

(assert (=> b!1260273 (= (-!2077 lt!570025 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570023)))

(declare-fun lt!570024 () Unit!41948)

(declare-fun addThenRemoveForNewKeyIsSame!331 (ListLongMap!18777 (_ BitVec 64) V!48271) Unit!41948)

(assert (=> b!1260273 (= lt!570024 (addThenRemoveForNewKeyIsSame!331 lt!570023 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> b!1260273 e!716962))

(declare-fun res!839587 () Bool)

(assert (=> b!1260273 (=> (not res!839587) (not e!716962))))

(assert (=> b!1260273 (= res!839587 (= lt!570028 lt!570025))))

(assert (=> b!1260273 (= lt!570025 (+!4245 lt!570023 (tuple2!20897 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(assert (=> b!1260273 (= lt!570023 (+!4245 lt!570030 lt!570029))))

(assert (=> b!1260273 (= lt!570029 (tuple2!20897 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun getCurrentListMap!4589 (array!82033 array!82035 (_ BitVec 32) (_ BitVec 32) V!48271 V!48271 (_ BitVec 32) Int) ListLongMap!18777)

(assert (=> b!1260273 (= lt!570021 (getCurrentListMap!4589 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260273 (= lt!570028 (getCurrentListMap!4589 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260265 () Bool)

(declare-fun e!716960 () Bool)

(assert (=> b!1260265 (= e!716960 (and e!716956 mapRes!50065))))

(declare-fun condMapEmpty!50065 () Bool)

(declare-fun mapDefault!50065 () ValueCell!15326)

(assert (=> b!1260265 (= condMapEmpty!50065 (= (arr!39568 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15326)) mapDefault!50065)))))

(declare-fun res!839582 () Bool)

(assert (=> start!105916 (=> (not res!839582) (not e!716959))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105916 (= res!839582 (validMask!0 mask!1466))))

(assert (=> start!105916 e!716959))

(assert (=> start!105916 true))

(assert (=> start!105916 tp!95356))

(assert (=> start!105916 tp_is_empty!32179))

(declare-fun array_inv!30273 (array!82033) Bool)

(assert (=> start!105916 (array_inv!30273 _keys!1118)))

(declare-fun array_inv!30274 (array!82035) Bool)

(assert (=> start!105916 (and (array_inv!30274 _values!914) e!716960)))

(assert (= (and start!105916 res!839582) b!1260272))

(assert (= (and b!1260272 res!839583) b!1260266))

(assert (= (and b!1260266 res!839585) b!1260268))

(assert (= (and b!1260268 res!839584) b!1260269))

(assert (= (and b!1260269 (not res!839586)) b!1260273))

(assert (= (and b!1260273 res!839587) b!1260270))

(assert (= (and b!1260265 condMapEmpty!50065) mapIsEmpty!50065))

(assert (= (and b!1260265 (not condMapEmpty!50065)) mapNonEmpty!50065))

(get-info :version)

(assert (= (and mapNonEmpty!50065 ((_ is ValueCellFull!15326) mapValue!50065)) b!1260267))

(assert (= (and b!1260265 ((_ is ValueCellFull!15326) mapDefault!50065)) b!1260271))

(assert (= start!105916 b!1260265))

(declare-fun m!1160923 () Bool)

(assert (=> b!1260273 m!1160923))

(declare-fun m!1160925 () Bool)

(assert (=> b!1260273 m!1160925))

(declare-fun m!1160927 () Bool)

(assert (=> b!1260273 m!1160927))

(declare-fun m!1160929 () Bool)

(assert (=> b!1260273 m!1160929))

(declare-fun m!1160931 () Bool)

(assert (=> b!1260273 m!1160931))

(declare-fun m!1160933 () Bool)

(assert (=> b!1260273 m!1160933))

(declare-fun m!1160935 () Bool)

(assert (=> b!1260273 m!1160935))

(declare-fun m!1160937 () Bool)

(assert (=> b!1260266 m!1160937))

(declare-fun m!1160939 () Bool)

(assert (=> b!1260269 m!1160939))

(declare-fun m!1160941 () Bool)

(assert (=> b!1260269 m!1160941))

(declare-fun m!1160943 () Bool)

(assert (=> b!1260269 m!1160943))

(declare-fun m!1160945 () Bool)

(assert (=> mapNonEmpty!50065 m!1160945))

(declare-fun m!1160947 () Bool)

(assert (=> b!1260268 m!1160947))

(declare-fun m!1160949 () Bool)

(assert (=> start!105916 m!1160949))

(declare-fun m!1160951 () Bool)

(assert (=> start!105916 m!1160951))

(declare-fun m!1160953 () Bool)

(assert (=> start!105916 m!1160953))

(declare-fun m!1160955 () Bool)

(assert (=> b!1260270 m!1160955))

(check-sat (not start!105916) (not b!1260268) (not b!1260273) (not b!1260266) (not b!1260269) (not mapNonEmpty!50065) (not b_next!27277) (not b!1260270) tp_is_empty!32179 b_and!45163)
(check-sat b_and!45163 (not b_next!27277))
