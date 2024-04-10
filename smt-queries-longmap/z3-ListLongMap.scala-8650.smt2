; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105220 () Bool)

(assert start!105220)

(declare-fun b_free!26937 () Bool)

(declare-fun b_next!26937 () Bool)

(assert (=> start!105220 (= b_free!26937 (not b_next!26937))))

(declare-fun tp!94316 () Bool)

(declare-fun b_and!44751 () Bool)

(assert (=> start!105220 (= tp!94316 b_and!44751)))

(declare-fun b!1253874 () Bool)

(declare-fun e!712407 () Bool)

(declare-fun e!712404 () Bool)

(declare-fun mapRes!49534 () Bool)

(assert (=> b!1253874 (= e!712407 (and e!712404 mapRes!49534))))

(declare-fun condMapEmpty!49534 () Bool)

(declare-datatypes ((V!47817 0))(
  ( (V!47818 (val!15982 Int)) )
))
(declare-datatypes ((ValueCell!15156 0))(
  ( (ValueCellFull!15156 (v!18680 V!47817)) (EmptyCell!15156) )
))
(declare-datatypes ((array!81334 0))(
  ( (array!81335 (arr!39229 (Array (_ BitVec 32) ValueCell!15156)) (size!39765 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81334)

(declare-fun mapDefault!49534 () ValueCell!15156)

(assert (=> b!1253874 (= condMapEmpty!49534 (= (arr!39229 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15156)) mapDefault!49534)))))

(declare-fun b!1253875 () Bool)

(declare-fun e!712402 () Bool)

(declare-fun e!712406 () Bool)

(assert (=> b!1253875 (= e!712402 (not e!712406))))

(declare-fun res!836101 () Bool)

(assert (=> b!1253875 (=> res!836101 e!712406)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1253875 (= res!836101 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20630 0))(
  ( (tuple2!20631 (_1!10326 (_ BitVec 64)) (_2!10326 V!47817)) )
))
(declare-datatypes ((List!27857 0))(
  ( (Nil!27854) (Cons!27853 (h!29062 tuple2!20630) (t!41338 List!27857)) )
))
(declare-datatypes ((ListLongMap!18503 0))(
  ( (ListLongMap!18504 (toList!9267 List!27857)) )
))
(declare-fun lt!566400 () ListLongMap!18503)

(declare-fun lt!566399 () ListLongMap!18503)

(assert (=> b!1253875 (= lt!566400 lt!566399)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47817)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47817)

(declare-datatypes ((array!81336 0))(
  ( (array!81337 (arr!39230 (Array (_ BitVec 32) (_ BitVec 64))) (size!39766 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81336)

(declare-fun minValueBefore!43 () V!47817)

(declare-datatypes ((Unit!41716 0))(
  ( (Unit!41717) )
))
(declare-fun lt!566397 () Unit!41716)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1019 (array!81336 array!81334 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47817 V!47817 V!47817 V!47817 (_ BitVec 32) Int) Unit!41716)

(assert (=> b!1253875 (= lt!566397 (lemmaNoChangeToArrayThenSameMapNoExtras!1019 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5655 (array!81336 array!81334 (_ BitVec 32) (_ BitVec 32) V!47817 V!47817 (_ BitVec 32) Int) ListLongMap!18503)

(assert (=> b!1253875 (= lt!566399 (getCurrentListMapNoExtraKeys!5655 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253875 (= lt!566400 (getCurrentListMapNoExtraKeys!5655 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49534 () Bool)

(assert (=> mapIsEmpty!49534 mapRes!49534))

(declare-fun mapNonEmpty!49534 () Bool)

(declare-fun tp!94315 () Bool)

(declare-fun e!712401 () Bool)

(assert (=> mapNonEmpty!49534 (= mapRes!49534 (and tp!94315 e!712401))))

(declare-fun mapRest!49534 () (Array (_ BitVec 32) ValueCell!15156))

(declare-fun mapKey!49534 () (_ BitVec 32))

(declare-fun mapValue!49534 () ValueCell!15156)

(assert (=> mapNonEmpty!49534 (= (arr!39229 _values!914) (store mapRest!49534 mapKey!49534 mapValue!49534))))

(declare-fun b!1253877 () Bool)

(declare-fun res!836104 () Bool)

(assert (=> b!1253877 (=> (not res!836104) (not e!712402))))

(declare-datatypes ((List!27858 0))(
  ( (Nil!27855) (Cons!27854 (h!29063 (_ BitVec 64)) (t!41339 List!27858)) )
))
(declare-fun arrayNoDuplicates!0 (array!81336 (_ BitVec 32) List!27858) Bool)

(assert (=> b!1253877 (= res!836104 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27855))))

(declare-fun b!1253878 () Bool)

(declare-fun e!712405 () Bool)

(assert (=> b!1253878 (= e!712405 (bvsle #b00000000000000000000000000000000 (size!39766 _keys!1118)))))

(declare-fun b!1253879 () Bool)

(assert (=> b!1253879 (= e!712406 e!712405)))

(declare-fun res!836105 () Bool)

(assert (=> b!1253879 (=> res!836105 e!712405)))

(declare-fun lt!566395 () ListLongMap!18503)

(declare-fun lt!566398 () ListLongMap!18503)

(declare-fun -!2040 (ListLongMap!18503 (_ BitVec 64)) ListLongMap!18503)

(assert (=> b!1253879 (= res!836105 (not (= (-!2040 lt!566395 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566398)))))

(declare-fun lt!566394 () ListLongMap!18503)

(assert (=> b!1253879 (= (-!2040 lt!566394 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566400)))

(declare-fun lt!566396 () Unit!41716)

(declare-fun addThenRemoveForNewKeyIsSame!310 (ListLongMap!18503 (_ BitVec 64) V!47817) Unit!41716)

(assert (=> b!1253879 (= lt!566396 (addThenRemoveForNewKeyIsSame!310 lt!566400 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> b!1253879 (and (= lt!566395 lt!566394) (= lt!566398 lt!566399))))

(declare-fun +!4163 (ListLongMap!18503 tuple2!20630) ListLongMap!18503)

(assert (=> b!1253879 (= lt!566394 (+!4163 lt!566400 (tuple2!20631 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun getCurrentListMap!4511 (array!81336 array!81334 (_ BitVec 32) (_ BitVec 32) V!47817 V!47817 (_ BitVec 32) Int) ListLongMap!18503)

(assert (=> b!1253879 (= lt!566398 (getCurrentListMap!4511 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253879 (= lt!566395 (getCurrentListMap!4511 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253880 () Bool)

(declare-fun tp_is_empty!31839 () Bool)

(assert (=> b!1253880 (= e!712401 tp_is_empty!31839)))

(declare-fun b!1253881 () Bool)

(assert (=> b!1253881 (= e!712404 tp_is_empty!31839)))

(declare-fun b!1253882 () Bool)

(declare-fun res!836100 () Bool)

(assert (=> b!1253882 (=> (not res!836100) (not e!712402))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81336 (_ BitVec 32)) Bool)

(assert (=> b!1253882 (= res!836100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!836102 () Bool)

(assert (=> start!105220 (=> (not res!836102) (not e!712402))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105220 (= res!836102 (validMask!0 mask!1466))))

(assert (=> start!105220 e!712402))

(assert (=> start!105220 true))

(assert (=> start!105220 tp!94316))

(assert (=> start!105220 tp_is_empty!31839))

(declare-fun array_inv!29907 (array!81336) Bool)

(assert (=> start!105220 (array_inv!29907 _keys!1118)))

(declare-fun array_inv!29908 (array!81334) Bool)

(assert (=> start!105220 (and (array_inv!29908 _values!914) e!712407)))

(declare-fun b!1253876 () Bool)

(declare-fun res!836103 () Bool)

(assert (=> b!1253876 (=> (not res!836103) (not e!712402))))

(assert (=> b!1253876 (= res!836103 (and (= (size!39765 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39766 _keys!1118) (size!39765 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!105220 res!836102) b!1253876))

(assert (= (and b!1253876 res!836103) b!1253882))

(assert (= (and b!1253882 res!836100) b!1253877))

(assert (= (and b!1253877 res!836104) b!1253875))

(assert (= (and b!1253875 (not res!836101)) b!1253879))

(assert (= (and b!1253879 (not res!836105)) b!1253878))

(assert (= (and b!1253874 condMapEmpty!49534) mapIsEmpty!49534))

(assert (= (and b!1253874 (not condMapEmpty!49534)) mapNonEmpty!49534))

(get-info :version)

(assert (= (and mapNonEmpty!49534 ((_ is ValueCellFull!15156) mapValue!49534)) b!1253880))

(assert (= (and b!1253874 ((_ is ValueCellFull!15156) mapDefault!49534)) b!1253881))

(assert (= start!105220 b!1253874))

(declare-fun m!1154505 () Bool)

(assert (=> b!1253882 m!1154505))

(declare-fun m!1154507 () Bool)

(assert (=> b!1253877 m!1154507))

(declare-fun m!1154509 () Bool)

(assert (=> b!1253879 m!1154509))

(declare-fun m!1154511 () Bool)

(assert (=> b!1253879 m!1154511))

(declare-fun m!1154513 () Bool)

(assert (=> b!1253879 m!1154513))

(declare-fun m!1154515 () Bool)

(assert (=> b!1253879 m!1154515))

(declare-fun m!1154517 () Bool)

(assert (=> b!1253879 m!1154517))

(declare-fun m!1154519 () Bool)

(assert (=> b!1253879 m!1154519))

(declare-fun m!1154521 () Bool)

(assert (=> mapNonEmpty!49534 m!1154521))

(declare-fun m!1154523 () Bool)

(assert (=> b!1253875 m!1154523))

(declare-fun m!1154525 () Bool)

(assert (=> b!1253875 m!1154525))

(declare-fun m!1154527 () Bool)

(assert (=> b!1253875 m!1154527))

(declare-fun m!1154529 () Bool)

(assert (=> start!105220 m!1154529))

(declare-fun m!1154531 () Bool)

(assert (=> start!105220 m!1154531))

(declare-fun m!1154533 () Bool)

(assert (=> start!105220 m!1154533))

(check-sat (not b!1253875) (not b_next!26937) (not b!1253882) (not mapNonEmpty!49534) (not b!1253877) (not start!105220) b_and!44751 tp_is_empty!31839 (not b!1253879))
(check-sat b_and!44751 (not b_next!26937))
(get-model)

(declare-fun d!138057 () Bool)

(declare-fun lt!566424 () ListLongMap!18503)

(declare-fun contains!7520 (ListLongMap!18503 (_ BitVec 64)) Bool)

(assert (=> d!138057 (not (contains!7520 lt!566424 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!138 (List!27857 (_ BitVec 64)) List!27857)

(assert (=> d!138057 (= lt!566424 (ListLongMap!18504 (removeStrictlySorted!138 (toList!9267 lt!566395) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138057 (= (-!2040 lt!566395 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566424)))

(declare-fun bs!35426 () Bool)

(assert (= bs!35426 d!138057))

(declare-fun m!1154565 () Bool)

(assert (=> bs!35426 m!1154565))

(declare-fun m!1154567 () Bool)

(assert (=> bs!35426 m!1154567))

(assert (=> b!1253879 d!138057))

(declare-fun d!138059 () Bool)

(declare-fun e!712431 () Bool)

(assert (=> d!138059 e!712431))

(declare-fun res!836129 () Bool)

(assert (=> d!138059 (=> (not res!836129) (not e!712431))))

(declare-fun lt!566435 () ListLongMap!18503)

(assert (=> d!138059 (= res!836129 (contains!7520 lt!566435 (_1!10326 (tuple2!20631 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lt!566434 () List!27857)

(assert (=> d!138059 (= lt!566435 (ListLongMap!18504 lt!566434))))

(declare-fun lt!566433 () Unit!41716)

(declare-fun lt!566436 () Unit!41716)

(assert (=> d!138059 (= lt!566433 lt!566436)))

(declare-datatypes ((Option!705 0))(
  ( (Some!704 (v!18682 V!47817)) (None!703) )
))
(declare-fun getValueByKey!654 (List!27857 (_ BitVec 64)) Option!705)

(assert (=> d!138059 (= (getValueByKey!654 lt!566434 (_1!10326 (tuple2!20631 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!704 (_2!10326 (tuple2!20631 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lemmaContainsTupThenGetReturnValue!329 (List!27857 (_ BitVec 64) V!47817) Unit!41716)

(assert (=> d!138059 (= lt!566436 (lemmaContainsTupThenGetReturnValue!329 lt!566434 (_1!10326 (tuple2!20631 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10326 (tuple2!20631 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun insertStrictlySorted!443 (List!27857 (_ BitVec 64) V!47817) List!27857)

(assert (=> d!138059 (= lt!566434 (insertStrictlySorted!443 (toList!9267 lt!566400) (_1!10326 (tuple2!20631 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10326 (tuple2!20631 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(assert (=> d!138059 (= (+!4163 lt!566400 (tuple2!20631 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) lt!566435)))

(declare-fun b!1253914 () Bool)

(declare-fun res!836128 () Bool)

(assert (=> b!1253914 (=> (not res!836128) (not e!712431))))

(assert (=> b!1253914 (= res!836128 (= (getValueByKey!654 (toList!9267 lt!566435) (_1!10326 (tuple2!20631 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!704 (_2!10326 (tuple2!20631 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))))

(declare-fun b!1253915 () Bool)

(declare-fun contains!7521 (List!27857 tuple2!20630) Bool)

(assert (=> b!1253915 (= e!712431 (contains!7521 (toList!9267 lt!566435) (tuple2!20631 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(assert (= (and d!138059 res!836129) b!1253914))

(assert (= (and b!1253914 res!836128) b!1253915))

(declare-fun m!1154569 () Bool)

(assert (=> d!138059 m!1154569))

(declare-fun m!1154571 () Bool)

(assert (=> d!138059 m!1154571))

(declare-fun m!1154573 () Bool)

(assert (=> d!138059 m!1154573))

(declare-fun m!1154575 () Bool)

(assert (=> d!138059 m!1154575))

(declare-fun m!1154577 () Bool)

(assert (=> b!1253914 m!1154577))

(declare-fun m!1154579 () Bool)

(assert (=> b!1253915 m!1154579))

(assert (=> b!1253879 d!138059))

(declare-fun d!138061 () Bool)

(declare-fun lt!566437 () ListLongMap!18503)

(assert (=> d!138061 (not (contains!7520 lt!566437 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138061 (= lt!566437 (ListLongMap!18504 (removeStrictlySorted!138 (toList!9267 lt!566394) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138061 (= (-!2040 lt!566394 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566437)))

(declare-fun bs!35427 () Bool)

(assert (= bs!35427 d!138061))

(declare-fun m!1154581 () Bool)

(assert (=> bs!35427 m!1154581))

(declare-fun m!1154583 () Bool)

(assert (=> bs!35427 m!1154583))

(assert (=> b!1253879 d!138061))

(declare-fun b!1253958 () Bool)

(declare-fun e!712465 () Bool)

(declare-fun call!61707 () Bool)

(assert (=> b!1253958 (= e!712465 (not call!61707))))

(declare-fun d!138063 () Bool)

(declare-fun e!712469 () Bool)

(assert (=> d!138063 e!712469))

(declare-fun res!836150 () Bool)

(assert (=> d!138063 (=> (not res!836150) (not e!712469))))

(assert (=> d!138063 (= res!836150 (or (bvsge #b00000000000000000000000000000000 (size!39766 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39766 _keys!1118)))))))

(declare-fun lt!566501 () ListLongMap!18503)

(declare-fun lt!566486 () ListLongMap!18503)

(assert (=> d!138063 (= lt!566501 lt!566486)))

(declare-fun lt!566500 () Unit!41716)

(declare-fun e!712460 () Unit!41716)

(assert (=> d!138063 (= lt!566500 e!712460)))

(declare-fun c!122312 () Bool)

(declare-fun e!712461 () Bool)

(assert (=> d!138063 (= c!122312 e!712461)))

(declare-fun res!836155 () Bool)

(assert (=> d!138063 (=> (not res!836155) (not e!712461))))

(assert (=> d!138063 (= res!836155 (bvslt #b00000000000000000000000000000000 (size!39766 _keys!1118)))))

(declare-fun e!712470 () ListLongMap!18503)

(assert (=> d!138063 (= lt!566486 e!712470)))

(declare-fun c!122310 () Bool)

(assert (=> d!138063 (= c!122310 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138063 (validMask!0 mask!1466)))

(assert (=> d!138063 (= (getCurrentListMap!4511 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!566501)))

(declare-fun b!1253959 () Bool)

(declare-fun res!836152 () Bool)

(assert (=> b!1253959 (=> (not res!836152) (not e!712469))))

(declare-fun e!712464 () Bool)

(assert (=> b!1253959 (= res!836152 e!712464)))

(declare-fun c!122307 () Bool)

(assert (=> b!1253959 (= c!122307 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1253960 () Bool)

(declare-fun e!712466 () Bool)

(declare-fun e!712467 () Bool)

(assert (=> b!1253960 (= e!712466 e!712467)))

(declare-fun res!836149 () Bool)

(assert (=> b!1253960 (=> (not res!836149) (not e!712467))))

(assert (=> b!1253960 (= res!836149 (contains!7520 lt!566501 (select (arr!39230 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1253960 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39766 _keys!1118)))))

(declare-fun b!1253961 () Bool)

(declare-fun lt!566491 () Unit!41716)

(assert (=> b!1253961 (= e!712460 lt!566491)))

(declare-fun lt!566490 () ListLongMap!18503)

(assert (=> b!1253961 (= lt!566490 (getCurrentListMapNoExtraKeys!5655 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!566488 () (_ BitVec 64))

(assert (=> b!1253961 (= lt!566488 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!566497 () (_ BitVec 64))

(assert (=> b!1253961 (= lt!566497 (select (arr!39230 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!566489 () Unit!41716)

(declare-fun addStillContains!1078 (ListLongMap!18503 (_ BitVec 64) V!47817 (_ BitVec 64)) Unit!41716)

(assert (=> b!1253961 (= lt!566489 (addStillContains!1078 lt!566490 lt!566488 zeroValue!871 lt!566497))))

(assert (=> b!1253961 (contains!7520 (+!4163 lt!566490 (tuple2!20631 lt!566488 zeroValue!871)) lt!566497)))

(declare-fun lt!566503 () Unit!41716)

(assert (=> b!1253961 (= lt!566503 lt!566489)))

(declare-fun lt!566492 () ListLongMap!18503)

(assert (=> b!1253961 (= lt!566492 (getCurrentListMapNoExtraKeys!5655 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!566483 () (_ BitVec 64))

(assert (=> b!1253961 (= lt!566483 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!566502 () (_ BitVec 64))

(assert (=> b!1253961 (= lt!566502 (select (arr!39230 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!566498 () Unit!41716)

(declare-fun addApplyDifferent!532 (ListLongMap!18503 (_ BitVec 64) V!47817 (_ BitVec 64)) Unit!41716)

(assert (=> b!1253961 (= lt!566498 (addApplyDifferent!532 lt!566492 lt!566483 minValueBefore!43 lt!566502))))

(declare-fun apply!985 (ListLongMap!18503 (_ BitVec 64)) V!47817)

(assert (=> b!1253961 (= (apply!985 (+!4163 lt!566492 (tuple2!20631 lt!566483 minValueBefore!43)) lt!566502) (apply!985 lt!566492 lt!566502))))

(declare-fun lt!566496 () Unit!41716)

(assert (=> b!1253961 (= lt!566496 lt!566498)))

(declare-fun lt!566482 () ListLongMap!18503)

(assert (=> b!1253961 (= lt!566482 (getCurrentListMapNoExtraKeys!5655 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!566493 () (_ BitVec 64))

(assert (=> b!1253961 (= lt!566493 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!566485 () (_ BitVec 64))

(assert (=> b!1253961 (= lt!566485 (select (arr!39230 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!566487 () Unit!41716)

(assert (=> b!1253961 (= lt!566487 (addApplyDifferent!532 lt!566482 lt!566493 zeroValue!871 lt!566485))))

(assert (=> b!1253961 (= (apply!985 (+!4163 lt!566482 (tuple2!20631 lt!566493 zeroValue!871)) lt!566485) (apply!985 lt!566482 lt!566485))))

(declare-fun lt!566494 () Unit!41716)

(assert (=> b!1253961 (= lt!566494 lt!566487)))

(declare-fun lt!566495 () ListLongMap!18503)

(assert (=> b!1253961 (= lt!566495 (getCurrentListMapNoExtraKeys!5655 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!566499 () (_ BitVec 64))

(assert (=> b!1253961 (= lt!566499 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!566484 () (_ BitVec 64))

(assert (=> b!1253961 (= lt!566484 (select (arr!39230 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1253961 (= lt!566491 (addApplyDifferent!532 lt!566495 lt!566499 minValueBefore!43 lt!566484))))

(assert (=> b!1253961 (= (apply!985 (+!4163 lt!566495 (tuple2!20631 lt!566499 minValueBefore!43)) lt!566484) (apply!985 lt!566495 lt!566484))))

(declare-fun bm!61703 () Bool)

(declare-fun call!61712 () ListLongMap!18503)

(declare-fun call!61711 () ListLongMap!18503)

(assert (=> bm!61703 (= call!61712 call!61711)))

(declare-fun b!1253962 () Bool)

(declare-fun call!61708 () ListLongMap!18503)

(assert (=> b!1253962 (= e!712470 (+!4163 call!61708 (tuple2!20631 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun b!1253963 () Bool)

(declare-fun e!712463 () Bool)

(assert (=> b!1253963 (= e!712464 e!712463)))

(declare-fun res!836154 () Bool)

(declare-fun call!61710 () Bool)

(assert (=> b!1253963 (= res!836154 call!61710)))

(assert (=> b!1253963 (=> (not res!836154) (not e!712463))))

(declare-fun b!1253964 () Bool)

(declare-fun e!712468 () Bool)

(assert (=> b!1253964 (= e!712468 (= (apply!985 lt!566501 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun b!1253965 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1253965 (= e!712461 (validKeyInArray!0 (select (arr!39230 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61704 () Bool)

(declare-fun call!61709 () ListLongMap!18503)

(assert (=> bm!61704 (= call!61709 call!61708)))

(declare-fun b!1253966 () Bool)

(declare-fun get!20082 (ValueCell!15156 V!47817) V!47817)

(declare-fun dynLambda!3383 (Int (_ BitVec 64)) V!47817)

(assert (=> b!1253966 (= e!712467 (= (apply!985 lt!566501 (select (arr!39230 _keys!1118) #b00000000000000000000000000000000)) (get!20082 (select (arr!39229 _values!914) #b00000000000000000000000000000000) (dynLambda!3383 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1253966 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39765 _values!914)))))

(assert (=> b!1253966 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39766 _keys!1118)))))

(declare-fun bm!61705 () Bool)

(declare-fun call!61706 () ListLongMap!18503)

(declare-fun c!122311 () Bool)

(assert (=> bm!61705 (= call!61708 (+!4163 (ite c!122310 call!61706 (ite c!122311 call!61711 call!61712)) (ite (or c!122310 c!122311) (tuple2!20631 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!20631 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1253967 () Bool)

(declare-fun e!712458 () ListLongMap!18503)

(assert (=> b!1253967 (= e!712470 e!712458)))

(assert (=> b!1253967 (= c!122311 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1253968 () Bool)

(declare-fun Unit!41720 () Unit!41716)

(assert (=> b!1253968 (= e!712460 Unit!41720)))

(declare-fun bm!61706 () Bool)

(assert (=> bm!61706 (= call!61711 call!61706)))

(declare-fun b!1253969 () Bool)

(assert (=> b!1253969 (= e!712469 e!712465)))

(declare-fun c!122309 () Bool)

(assert (=> b!1253969 (= c!122309 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!61707 () Bool)

(assert (=> bm!61707 (= call!61707 (contains!7520 lt!566501 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1253970 () Bool)

(declare-fun c!122308 () Bool)

(assert (=> b!1253970 (= c!122308 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!712462 () ListLongMap!18503)

(assert (=> b!1253970 (= e!712458 e!712462)))

(declare-fun b!1253971 () Bool)

(assert (=> b!1253971 (= e!712463 (= (apply!985 lt!566501 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun bm!61708 () Bool)

(assert (=> bm!61708 (= call!61706 (getCurrentListMapNoExtraKeys!5655 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun bm!61709 () Bool)

(assert (=> bm!61709 (= call!61710 (contains!7520 lt!566501 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1253972 () Bool)

(assert (=> b!1253972 (= e!712458 call!61709)))

(declare-fun b!1253973 () Bool)

(assert (=> b!1253973 (= e!712464 (not call!61710))))

(declare-fun b!1253974 () Bool)

(declare-fun res!836151 () Bool)

(assert (=> b!1253974 (=> (not res!836151) (not e!712469))))

(assert (=> b!1253974 (= res!836151 e!712466)))

(declare-fun res!836156 () Bool)

(assert (=> b!1253974 (=> res!836156 e!712466)))

(declare-fun e!712459 () Bool)

(assert (=> b!1253974 (= res!836156 (not e!712459))))

(declare-fun res!836153 () Bool)

(assert (=> b!1253974 (=> (not res!836153) (not e!712459))))

(assert (=> b!1253974 (= res!836153 (bvslt #b00000000000000000000000000000000 (size!39766 _keys!1118)))))

(declare-fun b!1253975 () Bool)

(assert (=> b!1253975 (= e!712462 call!61712)))

(declare-fun b!1253976 () Bool)

(assert (=> b!1253976 (= e!712465 e!712468)))

(declare-fun res!836148 () Bool)

(assert (=> b!1253976 (= res!836148 call!61707)))

(assert (=> b!1253976 (=> (not res!836148) (not e!712468))))

(declare-fun b!1253977 () Bool)

(assert (=> b!1253977 (= e!712459 (validKeyInArray!0 (select (arr!39230 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1253978 () Bool)

(assert (=> b!1253978 (= e!712462 call!61709)))

(assert (= (and d!138063 c!122310) b!1253962))

(assert (= (and d!138063 (not c!122310)) b!1253967))

(assert (= (and b!1253967 c!122311) b!1253972))

(assert (= (and b!1253967 (not c!122311)) b!1253970))

(assert (= (and b!1253970 c!122308) b!1253978))

(assert (= (and b!1253970 (not c!122308)) b!1253975))

(assert (= (or b!1253978 b!1253975) bm!61703))

(assert (= (or b!1253972 bm!61703) bm!61706))

(assert (= (or b!1253972 b!1253978) bm!61704))

(assert (= (or b!1253962 bm!61706) bm!61708))

(assert (= (or b!1253962 bm!61704) bm!61705))

(assert (= (and d!138063 res!836155) b!1253965))

(assert (= (and d!138063 c!122312) b!1253961))

(assert (= (and d!138063 (not c!122312)) b!1253968))

(assert (= (and d!138063 res!836150) b!1253974))

(assert (= (and b!1253974 res!836153) b!1253977))

(assert (= (and b!1253974 (not res!836156)) b!1253960))

(assert (= (and b!1253960 res!836149) b!1253966))

(assert (= (and b!1253974 res!836151) b!1253959))

(assert (= (and b!1253959 c!122307) b!1253963))

(assert (= (and b!1253959 (not c!122307)) b!1253973))

(assert (= (and b!1253963 res!836154) b!1253971))

(assert (= (or b!1253963 b!1253973) bm!61709))

(assert (= (and b!1253959 res!836152) b!1253969))

(assert (= (and b!1253969 c!122309) b!1253976))

(assert (= (and b!1253969 (not c!122309)) b!1253958))

(assert (= (and b!1253976 res!836148) b!1253964))

(assert (= (or b!1253976 b!1253958) bm!61707))

(declare-fun b_lambda!22603 () Bool)

(assert (=> (not b_lambda!22603) (not b!1253966)))

(declare-fun t!41343 () Bool)

(declare-fun tb!11297 () Bool)

(assert (=> (and start!105220 (= defaultEntry!922 defaultEntry!922) t!41343) tb!11297))

(declare-fun result!23299 () Bool)

(assert (=> tb!11297 (= result!23299 tp_is_empty!31839)))

(assert (=> b!1253966 t!41343))

(declare-fun b_and!44755 () Bool)

(assert (= b_and!44751 (and (=> t!41343 result!23299) b_and!44755)))

(declare-fun m!1154585 () Bool)

(assert (=> bm!61709 m!1154585))

(declare-fun m!1154587 () Bool)

(assert (=> b!1253961 m!1154587))

(declare-fun m!1154589 () Bool)

(assert (=> b!1253961 m!1154589))

(declare-fun m!1154591 () Bool)

(assert (=> b!1253961 m!1154591))

(declare-fun m!1154593 () Bool)

(assert (=> b!1253961 m!1154593))

(declare-fun m!1154595 () Bool)

(assert (=> b!1253961 m!1154595))

(declare-fun m!1154597 () Bool)

(assert (=> b!1253961 m!1154597))

(declare-fun m!1154599 () Bool)

(assert (=> b!1253961 m!1154599))

(declare-fun m!1154601 () Bool)

(assert (=> b!1253961 m!1154601))

(declare-fun m!1154603 () Bool)

(assert (=> b!1253961 m!1154603))

(declare-fun m!1154605 () Bool)

(assert (=> b!1253961 m!1154605))

(assert (=> b!1253961 m!1154527))

(declare-fun m!1154607 () Bool)

(assert (=> b!1253961 m!1154607))

(declare-fun m!1154609 () Bool)

(assert (=> b!1253961 m!1154609))

(assert (=> b!1253961 m!1154601))

(assert (=> b!1253961 m!1154589))

(declare-fun m!1154611 () Bool)

(assert (=> b!1253961 m!1154611))

(assert (=> b!1253961 m!1154607))

(declare-fun m!1154613 () Bool)

(assert (=> b!1253961 m!1154613))

(declare-fun m!1154615 () Bool)

(assert (=> b!1253961 m!1154615))

(declare-fun m!1154617 () Bool)

(assert (=> b!1253961 m!1154617))

(assert (=> b!1253961 m!1154591))

(declare-fun m!1154619 () Bool)

(assert (=> b!1253964 m!1154619))

(assert (=> b!1253966 m!1154597))

(assert (=> b!1253966 m!1154597))

(declare-fun m!1154621 () Bool)

(assert (=> b!1253966 m!1154621))

(declare-fun m!1154623 () Bool)

(assert (=> b!1253966 m!1154623))

(declare-fun m!1154625 () Bool)

(assert (=> b!1253966 m!1154625))

(declare-fun m!1154627 () Bool)

(assert (=> b!1253966 m!1154627))

(assert (=> b!1253966 m!1154623))

(assert (=> b!1253966 m!1154625))

(assert (=> b!1253960 m!1154597))

(assert (=> b!1253960 m!1154597))

(declare-fun m!1154629 () Bool)

(assert (=> b!1253960 m!1154629))

(declare-fun m!1154631 () Bool)

(assert (=> b!1253971 m!1154631))

(declare-fun m!1154633 () Bool)

(assert (=> b!1253962 m!1154633))

(declare-fun m!1154635 () Bool)

(assert (=> bm!61705 m!1154635))

(assert (=> d!138063 m!1154529))

(declare-fun m!1154637 () Bool)

(assert (=> bm!61707 m!1154637))

(assert (=> bm!61708 m!1154527))

(assert (=> b!1253965 m!1154597))

(assert (=> b!1253965 m!1154597))

(declare-fun m!1154639 () Bool)

(assert (=> b!1253965 m!1154639))

(assert (=> b!1253977 m!1154597))

(assert (=> b!1253977 m!1154597))

(assert (=> b!1253977 m!1154639))

(assert (=> b!1253879 d!138063))

(declare-fun b!1253981 () Bool)

(declare-fun e!712478 () Bool)

(declare-fun call!61714 () Bool)

(assert (=> b!1253981 (= e!712478 (not call!61714))))

(declare-fun d!138065 () Bool)

(declare-fun e!712482 () Bool)

(assert (=> d!138065 e!712482))

(declare-fun res!836159 () Bool)

(assert (=> d!138065 (=> (not res!836159) (not e!712482))))

(assert (=> d!138065 (= res!836159 (or (bvsge #b00000000000000000000000000000000 (size!39766 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39766 _keys!1118)))))))

(declare-fun lt!566523 () ListLongMap!18503)

(declare-fun lt!566508 () ListLongMap!18503)

(assert (=> d!138065 (= lt!566523 lt!566508)))

(declare-fun lt!566522 () Unit!41716)

(declare-fun e!712473 () Unit!41716)

(assert (=> d!138065 (= lt!566522 e!712473)))

(declare-fun c!122318 () Bool)

(declare-fun e!712474 () Bool)

(assert (=> d!138065 (= c!122318 e!712474)))

(declare-fun res!836164 () Bool)

(assert (=> d!138065 (=> (not res!836164) (not e!712474))))

(assert (=> d!138065 (= res!836164 (bvslt #b00000000000000000000000000000000 (size!39766 _keys!1118)))))

(declare-fun e!712483 () ListLongMap!18503)

(assert (=> d!138065 (= lt!566508 e!712483)))

(declare-fun c!122316 () Bool)

(assert (=> d!138065 (= c!122316 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138065 (validMask!0 mask!1466)))

(assert (=> d!138065 (= (getCurrentListMap!4511 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!566523)))

(declare-fun b!1253982 () Bool)

(declare-fun res!836161 () Bool)

(assert (=> b!1253982 (=> (not res!836161) (not e!712482))))

(declare-fun e!712477 () Bool)

(assert (=> b!1253982 (= res!836161 e!712477)))

(declare-fun c!122313 () Bool)

(assert (=> b!1253982 (= c!122313 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1253983 () Bool)

(declare-fun e!712479 () Bool)

(declare-fun e!712480 () Bool)

(assert (=> b!1253983 (= e!712479 e!712480)))

(declare-fun res!836158 () Bool)

(assert (=> b!1253983 (=> (not res!836158) (not e!712480))))

(assert (=> b!1253983 (= res!836158 (contains!7520 lt!566523 (select (arr!39230 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1253983 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39766 _keys!1118)))))

(declare-fun b!1253984 () Bool)

(declare-fun lt!566513 () Unit!41716)

(assert (=> b!1253984 (= e!712473 lt!566513)))

(declare-fun lt!566512 () ListLongMap!18503)

(assert (=> b!1253984 (= lt!566512 (getCurrentListMapNoExtraKeys!5655 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!566510 () (_ BitVec 64))

(assert (=> b!1253984 (= lt!566510 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!566519 () (_ BitVec 64))

(assert (=> b!1253984 (= lt!566519 (select (arr!39230 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!566511 () Unit!41716)

(assert (=> b!1253984 (= lt!566511 (addStillContains!1078 lt!566512 lt!566510 zeroValue!871 lt!566519))))

(assert (=> b!1253984 (contains!7520 (+!4163 lt!566512 (tuple2!20631 lt!566510 zeroValue!871)) lt!566519)))

(declare-fun lt!566525 () Unit!41716)

(assert (=> b!1253984 (= lt!566525 lt!566511)))

(declare-fun lt!566514 () ListLongMap!18503)

(assert (=> b!1253984 (= lt!566514 (getCurrentListMapNoExtraKeys!5655 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!566505 () (_ BitVec 64))

(assert (=> b!1253984 (= lt!566505 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!566524 () (_ BitVec 64))

(assert (=> b!1253984 (= lt!566524 (select (arr!39230 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!566520 () Unit!41716)

(assert (=> b!1253984 (= lt!566520 (addApplyDifferent!532 lt!566514 lt!566505 minValueAfter!43 lt!566524))))

(assert (=> b!1253984 (= (apply!985 (+!4163 lt!566514 (tuple2!20631 lt!566505 minValueAfter!43)) lt!566524) (apply!985 lt!566514 lt!566524))))

(declare-fun lt!566518 () Unit!41716)

(assert (=> b!1253984 (= lt!566518 lt!566520)))

(declare-fun lt!566504 () ListLongMap!18503)

(assert (=> b!1253984 (= lt!566504 (getCurrentListMapNoExtraKeys!5655 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!566515 () (_ BitVec 64))

(assert (=> b!1253984 (= lt!566515 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!566507 () (_ BitVec 64))

(assert (=> b!1253984 (= lt!566507 (select (arr!39230 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!566509 () Unit!41716)

(assert (=> b!1253984 (= lt!566509 (addApplyDifferent!532 lt!566504 lt!566515 zeroValue!871 lt!566507))))

(assert (=> b!1253984 (= (apply!985 (+!4163 lt!566504 (tuple2!20631 lt!566515 zeroValue!871)) lt!566507) (apply!985 lt!566504 lt!566507))))

(declare-fun lt!566516 () Unit!41716)

(assert (=> b!1253984 (= lt!566516 lt!566509)))

(declare-fun lt!566517 () ListLongMap!18503)

(assert (=> b!1253984 (= lt!566517 (getCurrentListMapNoExtraKeys!5655 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!566521 () (_ BitVec 64))

(assert (=> b!1253984 (= lt!566521 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!566506 () (_ BitVec 64))

(assert (=> b!1253984 (= lt!566506 (select (arr!39230 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1253984 (= lt!566513 (addApplyDifferent!532 lt!566517 lt!566521 minValueAfter!43 lt!566506))))

(assert (=> b!1253984 (= (apply!985 (+!4163 lt!566517 (tuple2!20631 lt!566521 minValueAfter!43)) lt!566506) (apply!985 lt!566517 lt!566506))))

(declare-fun bm!61710 () Bool)

(declare-fun call!61719 () ListLongMap!18503)

(declare-fun call!61718 () ListLongMap!18503)

(assert (=> bm!61710 (= call!61719 call!61718)))

(declare-fun b!1253985 () Bool)

(declare-fun call!61715 () ListLongMap!18503)

(assert (=> b!1253985 (= e!712483 (+!4163 call!61715 (tuple2!20631 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43)))))

(declare-fun b!1253986 () Bool)

(declare-fun e!712476 () Bool)

(assert (=> b!1253986 (= e!712477 e!712476)))

(declare-fun res!836163 () Bool)

(declare-fun call!61717 () Bool)

(assert (=> b!1253986 (= res!836163 call!61717)))

(assert (=> b!1253986 (=> (not res!836163) (not e!712476))))

(declare-fun b!1253987 () Bool)

(declare-fun e!712481 () Bool)

(assert (=> b!1253987 (= e!712481 (= (apply!985 lt!566523 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!43))))

(declare-fun b!1253988 () Bool)

(assert (=> b!1253988 (= e!712474 (validKeyInArray!0 (select (arr!39230 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61711 () Bool)

(declare-fun call!61716 () ListLongMap!18503)

(assert (=> bm!61711 (= call!61716 call!61715)))

(declare-fun b!1253989 () Bool)

(assert (=> b!1253989 (= e!712480 (= (apply!985 lt!566523 (select (arr!39230 _keys!1118) #b00000000000000000000000000000000)) (get!20082 (select (arr!39229 _values!914) #b00000000000000000000000000000000) (dynLambda!3383 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1253989 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39765 _values!914)))))

(assert (=> b!1253989 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39766 _keys!1118)))))

(declare-fun c!122317 () Bool)

(declare-fun call!61713 () ListLongMap!18503)

(declare-fun bm!61712 () Bool)

(assert (=> bm!61712 (= call!61715 (+!4163 (ite c!122316 call!61713 (ite c!122317 call!61718 call!61719)) (ite (or c!122316 c!122317) (tuple2!20631 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!20631 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43))))))

(declare-fun b!1253990 () Bool)

(declare-fun e!712471 () ListLongMap!18503)

(assert (=> b!1253990 (= e!712483 e!712471)))

(assert (=> b!1253990 (= c!122317 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1253991 () Bool)

(declare-fun Unit!41721 () Unit!41716)

(assert (=> b!1253991 (= e!712473 Unit!41721)))

(declare-fun bm!61713 () Bool)

(assert (=> bm!61713 (= call!61718 call!61713)))

(declare-fun b!1253992 () Bool)

(assert (=> b!1253992 (= e!712482 e!712478)))

(declare-fun c!122315 () Bool)

(assert (=> b!1253992 (= c!122315 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!61714 () Bool)

(assert (=> bm!61714 (= call!61714 (contains!7520 lt!566523 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1253993 () Bool)

(declare-fun c!122314 () Bool)

(assert (=> b!1253993 (= c!122314 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!712475 () ListLongMap!18503)

(assert (=> b!1253993 (= e!712471 e!712475)))

(declare-fun b!1253994 () Bool)

(assert (=> b!1253994 (= e!712476 (= (apply!985 lt!566523 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun bm!61715 () Bool)

(assert (=> bm!61715 (= call!61713 (getCurrentListMapNoExtraKeys!5655 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun bm!61716 () Bool)

(assert (=> bm!61716 (= call!61717 (contains!7520 lt!566523 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1253995 () Bool)

(assert (=> b!1253995 (= e!712471 call!61716)))

(declare-fun b!1253996 () Bool)

(assert (=> b!1253996 (= e!712477 (not call!61717))))

(declare-fun b!1253997 () Bool)

(declare-fun res!836160 () Bool)

(assert (=> b!1253997 (=> (not res!836160) (not e!712482))))

(assert (=> b!1253997 (= res!836160 e!712479)))

(declare-fun res!836165 () Bool)

(assert (=> b!1253997 (=> res!836165 e!712479)))

(declare-fun e!712472 () Bool)

(assert (=> b!1253997 (= res!836165 (not e!712472))))

(declare-fun res!836162 () Bool)

(assert (=> b!1253997 (=> (not res!836162) (not e!712472))))

(assert (=> b!1253997 (= res!836162 (bvslt #b00000000000000000000000000000000 (size!39766 _keys!1118)))))

(declare-fun b!1253998 () Bool)

(assert (=> b!1253998 (= e!712475 call!61719)))

(declare-fun b!1253999 () Bool)

(assert (=> b!1253999 (= e!712478 e!712481)))

(declare-fun res!836157 () Bool)

(assert (=> b!1253999 (= res!836157 call!61714)))

(assert (=> b!1253999 (=> (not res!836157) (not e!712481))))

(declare-fun b!1254000 () Bool)

(assert (=> b!1254000 (= e!712472 (validKeyInArray!0 (select (arr!39230 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1254001 () Bool)

(assert (=> b!1254001 (= e!712475 call!61716)))

(assert (= (and d!138065 c!122316) b!1253985))

(assert (= (and d!138065 (not c!122316)) b!1253990))

(assert (= (and b!1253990 c!122317) b!1253995))

(assert (= (and b!1253990 (not c!122317)) b!1253993))

(assert (= (and b!1253993 c!122314) b!1254001))

(assert (= (and b!1253993 (not c!122314)) b!1253998))

(assert (= (or b!1254001 b!1253998) bm!61710))

(assert (= (or b!1253995 bm!61710) bm!61713))

(assert (= (or b!1253995 b!1254001) bm!61711))

(assert (= (or b!1253985 bm!61713) bm!61715))

(assert (= (or b!1253985 bm!61711) bm!61712))

(assert (= (and d!138065 res!836164) b!1253988))

(assert (= (and d!138065 c!122318) b!1253984))

(assert (= (and d!138065 (not c!122318)) b!1253991))

(assert (= (and d!138065 res!836159) b!1253997))

(assert (= (and b!1253997 res!836162) b!1254000))

(assert (= (and b!1253997 (not res!836165)) b!1253983))

(assert (= (and b!1253983 res!836158) b!1253989))

(assert (= (and b!1253997 res!836160) b!1253982))

(assert (= (and b!1253982 c!122313) b!1253986))

(assert (= (and b!1253982 (not c!122313)) b!1253996))

(assert (= (and b!1253986 res!836163) b!1253994))

(assert (= (or b!1253986 b!1253996) bm!61716))

(assert (= (and b!1253982 res!836161) b!1253992))

(assert (= (and b!1253992 c!122315) b!1253999))

(assert (= (and b!1253992 (not c!122315)) b!1253981))

(assert (= (and b!1253999 res!836157) b!1253987))

(assert (= (or b!1253999 b!1253981) bm!61714))

(declare-fun b_lambda!22605 () Bool)

(assert (=> (not b_lambda!22605) (not b!1253989)))

(assert (=> b!1253989 t!41343))

(declare-fun b_and!44757 () Bool)

(assert (= b_and!44755 (and (=> t!41343 result!23299) b_and!44757)))

(declare-fun m!1154641 () Bool)

(assert (=> bm!61716 m!1154641))

(declare-fun m!1154643 () Bool)

(assert (=> b!1253984 m!1154643))

(declare-fun m!1154645 () Bool)

(assert (=> b!1253984 m!1154645))

(declare-fun m!1154647 () Bool)

(assert (=> b!1253984 m!1154647))

(declare-fun m!1154649 () Bool)

(assert (=> b!1253984 m!1154649))

(declare-fun m!1154651 () Bool)

(assert (=> b!1253984 m!1154651))

(assert (=> b!1253984 m!1154597))

(declare-fun m!1154653 () Bool)

(assert (=> b!1253984 m!1154653))

(declare-fun m!1154655 () Bool)

(assert (=> b!1253984 m!1154655))

(declare-fun m!1154657 () Bool)

(assert (=> b!1253984 m!1154657))

(declare-fun m!1154659 () Bool)

(assert (=> b!1253984 m!1154659))

(assert (=> b!1253984 m!1154525))

(declare-fun m!1154661 () Bool)

(assert (=> b!1253984 m!1154661))

(declare-fun m!1154663 () Bool)

(assert (=> b!1253984 m!1154663))

(assert (=> b!1253984 m!1154655))

(assert (=> b!1253984 m!1154645))

(declare-fun m!1154665 () Bool)

(assert (=> b!1253984 m!1154665))

(assert (=> b!1253984 m!1154661))

(declare-fun m!1154667 () Bool)

(assert (=> b!1253984 m!1154667))

(declare-fun m!1154669 () Bool)

(assert (=> b!1253984 m!1154669))

(declare-fun m!1154671 () Bool)

(assert (=> b!1253984 m!1154671))

(assert (=> b!1253984 m!1154647))

(declare-fun m!1154673 () Bool)

(assert (=> b!1253987 m!1154673))

(assert (=> b!1253989 m!1154597))

(assert (=> b!1253989 m!1154597))

(declare-fun m!1154675 () Bool)

(assert (=> b!1253989 m!1154675))

(assert (=> b!1253989 m!1154623))

(assert (=> b!1253989 m!1154625))

(assert (=> b!1253989 m!1154627))

(assert (=> b!1253989 m!1154623))

(assert (=> b!1253989 m!1154625))

(assert (=> b!1253983 m!1154597))

(assert (=> b!1253983 m!1154597))

(declare-fun m!1154677 () Bool)

(assert (=> b!1253983 m!1154677))

(declare-fun m!1154679 () Bool)

(assert (=> b!1253994 m!1154679))

(declare-fun m!1154681 () Bool)

(assert (=> b!1253985 m!1154681))

(declare-fun m!1154683 () Bool)

(assert (=> bm!61712 m!1154683))

(assert (=> d!138065 m!1154529))

(declare-fun m!1154685 () Bool)

(assert (=> bm!61714 m!1154685))

(assert (=> bm!61715 m!1154525))

(assert (=> b!1253988 m!1154597))

(assert (=> b!1253988 m!1154597))

(assert (=> b!1253988 m!1154639))

(assert (=> b!1254000 m!1154597))

(assert (=> b!1254000 m!1154597))

(assert (=> b!1254000 m!1154639))

(assert (=> b!1253879 d!138065))

(declare-fun d!138067 () Bool)

(assert (=> d!138067 (= (-!2040 (+!4163 lt!566400 (tuple2!20631 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) #b1000000000000000000000000000000000000000000000000000000000000000) lt!566400)))

(declare-fun lt!566528 () Unit!41716)

(declare-fun choose!1853 (ListLongMap!18503 (_ BitVec 64) V!47817) Unit!41716)

(assert (=> d!138067 (= lt!566528 (choose!1853 lt!566400 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> d!138067 (not (contains!7520 lt!566400 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138067 (= (addThenRemoveForNewKeyIsSame!310 lt!566400 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43) lt!566528)))

(declare-fun bs!35428 () Bool)

(assert (= bs!35428 d!138067))

(assert (=> bs!35428 m!1154513))

(assert (=> bs!35428 m!1154513))

(declare-fun m!1154687 () Bool)

(assert (=> bs!35428 m!1154687))

(declare-fun m!1154689 () Bool)

(assert (=> bs!35428 m!1154689))

(declare-fun m!1154691 () Bool)

(assert (=> bs!35428 m!1154691))

(assert (=> b!1253879 d!138067))

(declare-fun d!138069 () Bool)

(assert (=> d!138069 (= (getCurrentListMapNoExtraKeys!5655 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5655 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!566531 () Unit!41716)

(declare-fun choose!1854 (array!81336 array!81334 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47817 V!47817 V!47817 V!47817 (_ BitVec 32) Int) Unit!41716)

(assert (=> d!138069 (= lt!566531 (choose!1854 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138069 (validMask!0 mask!1466)))

(assert (=> d!138069 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1019 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!566531)))

(declare-fun bs!35429 () Bool)

(assert (= bs!35429 d!138069))

(assert (=> bs!35429 m!1154527))

(assert (=> bs!35429 m!1154525))

(declare-fun m!1154693 () Bool)

(assert (=> bs!35429 m!1154693))

(assert (=> bs!35429 m!1154529))

(assert (=> b!1253875 d!138069))

(declare-fun b!1254026 () Bool)

(declare-fun e!712501 () Bool)

(assert (=> b!1254026 (= e!712501 (validKeyInArray!0 (select (arr!39230 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1254026 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!138071 () Bool)

(declare-fun e!712498 () Bool)

(assert (=> d!138071 e!712498))

(declare-fun res!836175 () Bool)

(assert (=> d!138071 (=> (not res!836175) (not e!712498))))

(declare-fun lt!566548 () ListLongMap!18503)

(assert (=> d!138071 (= res!836175 (not (contains!7520 lt!566548 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!712500 () ListLongMap!18503)

(assert (=> d!138071 (= lt!566548 e!712500)))

(declare-fun c!122329 () Bool)

(assert (=> d!138071 (= c!122329 (bvsge #b00000000000000000000000000000000 (size!39766 _keys!1118)))))

(assert (=> d!138071 (validMask!0 mask!1466)))

(assert (=> d!138071 (= (getCurrentListMapNoExtraKeys!5655 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!566548)))

(declare-fun b!1254027 () Bool)

(declare-fun e!712504 () Bool)

(declare-fun e!712499 () Bool)

(assert (=> b!1254027 (= e!712504 e!712499)))

(assert (=> b!1254027 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39766 _keys!1118)))))

(declare-fun res!836174 () Bool)

(assert (=> b!1254027 (= res!836174 (contains!7520 lt!566548 (select (arr!39230 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1254027 (=> (not res!836174) (not e!712499))))

(declare-fun call!61722 () ListLongMap!18503)

(declare-fun bm!61719 () Bool)

(assert (=> bm!61719 (= call!61722 (getCurrentListMapNoExtraKeys!5655 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1254028 () Bool)

(declare-fun lt!566546 () Unit!41716)

(declare-fun lt!566550 () Unit!41716)

(assert (=> b!1254028 (= lt!566546 lt!566550)))

(declare-fun lt!566551 () (_ BitVec 64))

(declare-fun lt!566547 () (_ BitVec 64))

(declare-fun lt!566549 () ListLongMap!18503)

(declare-fun lt!566552 () V!47817)

(assert (=> b!1254028 (not (contains!7520 (+!4163 lt!566549 (tuple2!20631 lt!566547 lt!566552)) lt!566551))))

(declare-fun addStillNotContains!313 (ListLongMap!18503 (_ BitVec 64) V!47817 (_ BitVec 64)) Unit!41716)

(assert (=> b!1254028 (= lt!566550 (addStillNotContains!313 lt!566549 lt!566547 lt!566552 lt!566551))))

(assert (=> b!1254028 (= lt!566551 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1254028 (= lt!566552 (get!20082 (select (arr!39229 _values!914) #b00000000000000000000000000000000) (dynLambda!3383 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1254028 (= lt!566547 (select (arr!39230 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1254028 (= lt!566549 call!61722)))

(declare-fun e!712502 () ListLongMap!18503)

(assert (=> b!1254028 (= e!712502 (+!4163 call!61722 (tuple2!20631 (select (arr!39230 _keys!1118) #b00000000000000000000000000000000) (get!20082 (select (arr!39229 _values!914) #b00000000000000000000000000000000) (dynLambda!3383 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1254029 () Bool)

(assert (=> b!1254029 (= e!712498 e!712504)))

(declare-fun c!122330 () Bool)

(assert (=> b!1254029 (= c!122330 e!712501)))

(declare-fun res!836177 () Bool)

(assert (=> b!1254029 (=> (not res!836177) (not e!712501))))

(assert (=> b!1254029 (= res!836177 (bvslt #b00000000000000000000000000000000 (size!39766 _keys!1118)))))

(declare-fun b!1254030 () Bool)

(assert (=> b!1254030 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39766 _keys!1118)))))

(assert (=> b!1254030 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39765 _values!914)))))

(assert (=> b!1254030 (= e!712499 (= (apply!985 lt!566548 (select (arr!39230 _keys!1118) #b00000000000000000000000000000000)) (get!20082 (select (arr!39229 _values!914) #b00000000000000000000000000000000) (dynLambda!3383 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1254031 () Bool)

(declare-fun e!712503 () Bool)

(assert (=> b!1254031 (= e!712504 e!712503)))

(declare-fun c!122327 () Bool)

(assert (=> b!1254031 (= c!122327 (bvslt #b00000000000000000000000000000000 (size!39766 _keys!1118)))))

(declare-fun b!1254032 () Bool)

(assert (=> b!1254032 (= e!712500 (ListLongMap!18504 Nil!27854))))

(declare-fun b!1254033 () Bool)

(declare-fun res!836176 () Bool)

(assert (=> b!1254033 (=> (not res!836176) (not e!712498))))

(assert (=> b!1254033 (= res!836176 (not (contains!7520 lt!566548 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1254034 () Bool)

(assert (=> b!1254034 (= e!712503 (= lt!566548 (getCurrentListMapNoExtraKeys!5655 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1254035 () Bool)

(assert (=> b!1254035 (= e!712500 e!712502)))

(declare-fun c!122328 () Bool)

(assert (=> b!1254035 (= c!122328 (validKeyInArray!0 (select (arr!39230 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1254036 () Bool)

(assert (=> b!1254036 (= e!712502 call!61722)))

(declare-fun b!1254037 () Bool)

(declare-fun isEmpty!1027 (ListLongMap!18503) Bool)

(assert (=> b!1254037 (= e!712503 (isEmpty!1027 lt!566548))))

(assert (= (and d!138071 c!122329) b!1254032))

(assert (= (and d!138071 (not c!122329)) b!1254035))

(assert (= (and b!1254035 c!122328) b!1254028))

(assert (= (and b!1254035 (not c!122328)) b!1254036))

(assert (= (or b!1254028 b!1254036) bm!61719))

(assert (= (and d!138071 res!836175) b!1254033))

(assert (= (and b!1254033 res!836176) b!1254029))

(assert (= (and b!1254029 res!836177) b!1254026))

(assert (= (and b!1254029 c!122330) b!1254027))

(assert (= (and b!1254029 (not c!122330)) b!1254031))

(assert (= (and b!1254027 res!836174) b!1254030))

(assert (= (and b!1254031 c!122327) b!1254034))

(assert (= (and b!1254031 (not c!122327)) b!1254037))

(declare-fun b_lambda!22607 () Bool)

(assert (=> (not b_lambda!22607) (not b!1254028)))

(assert (=> b!1254028 t!41343))

(declare-fun b_and!44759 () Bool)

(assert (= b_and!44757 (and (=> t!41343 result!23299) b_and!44759)))

(declare-fun b_lambda!22609 () Bool)

(assert (=> (not b_lambda!22609) (not b!1254030)))

(assert (=> b!1254030 t!41343))

(declare-fun b_and!44761 () Bool)

(assert (= b_and!44759 (and (=> t!41343 result!23299) b_and!44761)))

(declare-fun m!1154695 () Bool)

(assert (=> b!1254037 m!1154695))

(declare-fun m!1154697 () Bool)

(assert (=> b!1254033 m!1154697))

(assert (=> b!1254035 m!1154597))

(assert (=> b!1254035 m!1154597))

(assert (=> b!1254035 m!1154639))

(declare-fun m!1154699 () Bool)

(assert (=> d!138071 m!1154699))

(assert (=> d!138071 m!1154529))

(declare-fun m!1154701 () Bool)

(assert (=> b!1254034 m!1154701))

(assert (=> bm!61719 m!1154701))

(assert (=> b!1254030 m!1154597))

(assert (=> b!1254030 m!1154597))

(declare-fun m!1154703 () Bool)

(assert (=> b!1254030 m!1154703))

(assert (=> b!1254030 m!1154623))

(assert (=> b!1254030 m!1154625))

(assert (=> b!1254030 m!1154623))

(assert (=> b!1254030 m!1154625))

(assert (=> b!1254030 m!1154627))

(assert (=> b!1254027 m!1154597))

(assert (=> b!1254027 m!1154597))

(declare-fun m!1154705 () Bool)

(assert (=> b!1254027 m!1154705))

(assert (=> b!1254026 m!1154597))

(assert (=> b!1254026 m!1154597))

(assert (=> b!1254026 m!1154639))

(declare-fun m!1154707 () Bool)

(assert (=> b!1254028 m!1154707))

(declare-fun m!1154709 () Bool)

(assert (=> b!1254028 m!1154709))

(assert (=> b!1254028 m!1154597))

(assert (=> b!1254028 m!1154623))

(assert (=> b!1254028 m!1154625))

(declare-fun m!1154711 () Bool)

(assert (=> b!1254028 m!1154711))

(declare-fun m!1154713 () Bool)

(assert (=> b!1254028 m!1154713))

(assert (=> b!1254028 m!1154623))

(assert (=> b!1254028 m!1154625))

(assert (=> b!1254028 m!1154627))

(assert (=> b!1254028 m!1154707))

(assert (=> b!1253875 d!138071))

(declare-fun b!1254038 () Bool)

(declare-fun e!712508 () Bool)

(assert (=> b!1254038 (= e!712508 (validKeyInArray!0 (select (arr!39230 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1254038 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!138073 () Bool)

(declare-fun e!712505 () Bool)

(assert (=> d!138073 e!712505))

(declare-fun res!836179 () Bool)

(assert (=> d!138073 (=> (not res!836179) (not e!712505))))

(declare-fun lt!566555 () ListLongMap!18503)

(assert (=> d!138073 (= res!836179 (not (contains!7520 lt!566555 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!712507 () ListLongMap!18503)

(assert (=> d!138073 (= lt!566555 e!712507)))

(declare-fun c!122333 () Bool)

(assert (=> d!138073 (= c!122333 (bvsge #b00000000000000000000000000000000 (size!39766 _keys!1118)))))

(assert (=> d!138073 (validMask!0 mask!1466)))

(assert (=> d!138073 (= (getCurrentListMapNoExtraKeys!5655 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!566555)))

(declare-fun b!1254039 () Bool)

(declare-fun e!712511 () Bool)

(declare-fun e!712506 () Bool)

(assert (=> b!1254039 (= e!712511 e!712506)))

(assert (=> b!1254039 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39766 _keys!1118)))))

(declare-fun res!836178 () Bool)

(assert (=> b!1254039 (= res!836178 (contains!7520 lt!566555 (select (arr!39230 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1254039 (=> (not res!836178) (not e!712506))))

(declare-fun bm!61720 () Bool)

(declare-fun call!61723 () ListLongMap!18503)

(assert (=> bm!61720 (= call!61723 (getCurrentListMapNoExtraKeys!5655 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1254040 () Bool)

(declare-fun lt!566553 () Unit!41716)

(declare-fun lt!566557 () Unit!41716)

(assert (=> b!1254040 (= lt!566553 lt!566557)))

(declare-fun lt!566559 () V!47817)

(declare-fun lt!566558 () (_ BitVec 64))

(declare-fun lt!566556 () ListLongMap!18503)

(declare-fun lt!566554 () (_ BitVec 64))

(assert (=> b!1254040 (not (contains!7520 (+!4163 lt!566556 (tuple2!20631 lt!566554 lt!566559)) lt!566558))))

(assert (=> b!1254040 (= lt!566557 (addStillNotContains!313 lt!566556 lt!566554 lt!566559 lt!566558))))

(assert (=> b!1254040 (= lt!566558 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1254040 (= lt!566559 (get!20082 (select (arr!39229 _values!914) #b00000000000000000000000000000000) (dynLambda!3383 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1254040 (= lt!566554 (select (arr!39230 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1254040 (= lt!566556 call!61723)))

(declare-fun e!712509 () ListLongMap!18503)

(assert (=> b!1254040 (= e!712509 (+!4163 call!61723 (tuple2!20631 (select (arr!39230 _keys!1118) #b00000000000000000000000000000000) (get!20082 (select (arr!39229 _values!914) #b00000000000000000000000000000000) (dynLambda!3383 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1254041 () Bool)

(assert (=> b!1254041 (= e!712505 e!712511)))

(declare-fun c!122334 () Bool)

(assert (=> b!1254041 (= c!122334 e!712508)))

(declare-fun res!836181 () Bool)

(assert (=> b!1254041 (=> (not res!836181) (not e!712508))))

(assert (=> b!1254041 (= res!836181 (bvslt #b00000000000000000000000000000000 (size!39766 _keys!1118)))))

(declare-fun b!1254042 () Bool)

(assert (=> b!1254042 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39766 _keys!1118)))))

(assert (=> b!1254042 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39765 _values!914)))))

(assert (=> b!1254042 (= e!712506 (= (apply!985 lt!566555 (select (arr!39230 _keys!1118) #b00000000000000000000000000000000)) (get!20082 (select (arr!39229 _values!914) #b00000000000000000000000000000000) (dynLambda!3383 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1254043 () Bool)

(declare-fun e!712510 () Bool)

(assert (=> b!1254043 (= e!712511 e!712510)))

(declare-fun c!122331 () Bool)

(assert (=> b!1254043 (= c!122331 (bvslt #b00000000000000000000000000000000 (size!39766 _keys!1118)))))

(declare-fun b!1254044 () Bool)

(assert (=> b!1254044 (= e!712507 (ListLongMap!18504 Nil!27854))))

(declare-fun b!1254045 () Bool)

(declare-fun res!836180 () Bool)

(assert (=> b!1254045 (=> (not res!836180) (not e!712505))))

(assert (=> b!1254045 (= res!836180 (not (contains!7520 lt!566555 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1254046 () Bool)

(assert (=> b!1254046 (= e!712510 (= lt!566555 (getCurrentListMapNoExtraKeys!5655 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1254047 () Bool)

(assert (=> b!1254047 (= e!712507 e!712509)))

(declare-fun c!122332 () Bool)

(assert (=> b!1254047 (= c!122332 (validKeyInArray!0 (select (arr!39230 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1254048 () Bool)

(assert (=> b!1254048 (= e!712509 call!61723)))

(declare-fun b!1254049 () Bool)

(assert (=> b!1254049 (= e!712510 (isEmpty!1027 lt!566555))))

(assert (= (and d!138073 c!122333) b!1254044))

(assert (= (and d!138073 (not c!122333)) b!1254047))

(assert (= (and b!1254047 c!122332) b!1254040))

(assert (= (and b!1254047 (not c!122332)) b!1254048))

(assert (= (or b!1254040 b!1254048) bm!61720))

(assert (= (and d!138073 res!836179) b!1254045))

(assert (= (and b!1254045 res!836180) b!1254041))

(assert (= (and b!1254041 res!836181) b!1254038))

(assert (= (and b!1254041 c!122334) b!1254039))

(assert (= (and b!1254041 (not c!122334)) b!1254043))

(assert (= (and b!1254039 res!836178) b!1254042))

(assert (= (and b!1254043 c!122331) b!1254046))

(assert (= (and b!1254043 (not c!122331)) b!1254049))

(declare-fun b_lambda!22611 () Bool)

(assert (=> (not b_lambda!22611) (not b!1254040)))

(assert (=> b!1254040 t!41343))

(declare-fun b_and!44763 () Bool)

(assert (= b_and!44761 (and (=> t!41343 result!23299) b_and!44763)))

(declare-fun b_lambda!22613 () Bool)

(assert (=> (not b_lambda!22613) (not b!1254042)))

(assert (=> b!1254042 t!41343))

(declare-fun b_and!44765 () Bool)

(assert (= b_and!44763 (and (=> t!41343 result!23299) b_and!44765)))

(declare-fun m!1154715 () Bool)

(assert (=> b!1254049 m!1154715))

(declare-fun m!1154717 () Bool)

(assert (=> b!1254045 m!1154717))

(assert (=> b!1254047 m!1154597))

(assert (=> b!1254047 m!1154597))

(assert (=> b!1254047 m!1154639))

(declare-fun m!1154719 () Bool)

(assert (=> d!138073 m!1154719))

(assert (=> d!138073 m!1154529))

(declare-fun m!1154721 () Bool)

(assert (=> b!1254046 m!1154721))

(assert (=> bm!61720 m!1154721))

(assert (=> b!1254042 m!1154597))

(assert (=> b!1254042 m!1154597))

(declare-fun m!1154723 () Bool)

(assert (=> b!1254042 m!1154723))

(assert (=> b!1254042 m!1154623))

(assert (=> b!1254042 m!1154625))

(assert (=> b!1254042 m!1154623))

(assert (=> b!1254042 m!1154625))

(assert (=> b!1254042 m!1154627))

(assert (=> b!1254039 m!1154597))

(assert (=> b!1254039 m!1154597))

(declare-fun m!1154725 () Bool)

(assert (=> b!1254039 m!1154725))

(assert (=> b!1254038 m!1154597))

(assert (=> b!1254038 m!1154597))

(assert (=> b!1254038 m!1154639))

(declare-fun m!1154727 () Bool)

(assert (=> b!1254040 m!1154727))

(declare-fun m!1154729 () Bool)

(assert (=> b!1254040 m!1154729))

(assert (=> b!1254040 m!1154597))

(assert (=> b!1254040 m!1154623))

(assert (=> b!1254040 m!1154625))

(declare-fun m!1154731 () Bool)

(assert (=> b!1254040 m!1154731))

(declare-fun m!1154733 () Bool)

(assert (=> b!1254040 m!1154733))

(assert (=> b!1254040 m!1154623))

(assert (=> b!1254040 m!1154625))

(assert (=> b!1254040 m!1154627))

(assert (=> b!1254040 m!1154727))

(assert (=> b!1253875 d!138073))

(declare-fun b!1254060 () Bool)

(declare-fun e!712521 () Bool)

(declare-fun contains!7522 (List!27858 (_ BitVec 64)) Bool)

(assert (=> b!1254060 (= e!712521 (contains!7522 Nil!27855 (select (arr!39230 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138075 () Bool)

(declare-fun res!836188 () Bool)

(declare-fun e!712520 () Bool)

(assert (=> d!138075 (=> res!836188 e!712520)))

(assert (=> d!138075 (= res!836188 (bvsge #b00000000000000000000000000000000 (size!39766 _keys!1118)))))

(assert (=> d!138075 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27855) e!712520)))

(declare-fun b!1254061 () Bool)

(declare-fun e!712522 () Bool)

(declare-fun call!61726 () Bool)

(assert (=> b!1254061 (= e!712522 call!61726)))

(declare-fun bm!61723 () Bool)

(declare-fun c!122337 () Bool)

(assert (=> bm!61723 (= call!61726 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122337 (Cons!27854 (select (arr!39230 _keys!1118) #b00000000000000000000000000000000) Nil!27855) Nil!27855)))))

(declare-fun b!1254062 () Bool)

(declare-fun e!712523 () Bool)

(assert (=> b!1254062 (= e!712520 e!712523)))

(declare-fun res!836189 () Bool)

(assert (=> b!1254062 (=> (not res!836189) (not e!712523))))

(assert (=> b!1254062 (= res!836189 (not e!712521))))

(declare-fun res!836190 () Bool)

(assert (=> b!1254062 (=> (not res!836190) (not e!712521))))

(assert (=> b!1254062 (= res!836190 (validKeyInArray!0 (select (arr!39230 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1254063 () Bool)

(assert (=> b!1254063 (= e!712522 call!61726)))

(declare-fun b!1254064 () Bool)

(assert (=> b!1254064 (= e!712523 e!712522)))

(assert (=> b!1254064 (= c!122337 (validKeyInArray!0 (select (arr!39230 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138075 (not res!836188)) b!1254062))

(assert (= (and b!1254062 res!836190) b!1254060))

(assert (= (and b!1254062 res!836189) b!1254064))

(assert (= (and b!1254064 c!122337) b!1254063))

(assert (= (and b!1254064 (not c!122337)) b!1254061))

(assert (= (or b!1254063 b!1254061) bm!61723))

(assert (=> b!1254060 m!1154597))

(assert (=> b!1254060 m!1154597))

(declare-fun m!1154735 () Bool)

(assert (=> b!1254060 m!1154735))

(assert (=> bm!61723 m!1154597))

(declare-fun m!1154737 () Bool)

(assert (=> bm!61723 m!1154737))

(assert (=> b!1254062 m!1154597))

(assert (=> b!1254062 m!1154597))

(assert (=> b!1254062 m!1154639))

(assert (=> b!1254064 m!1154597))

(assert (=> b!1254064 m!1154597))

(assert (=> b!1254064 m!1154639))

(assert (=> b!1253877 d!138075))

(declare-fun b!1254074 () Bool)

(declare-fun e!712531 () Bool)

(declare-fun e!712530 () Bool)

(assert (=> b!1254074 (= e!712531 e!712530)))

(declare-fun c!122340 () Bool)

(assert (=> b!1254074 (= c!122340 (validKeyInArray!0 (select (arr!39230 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1254075 () Bool)

(declare-fun e!712532 () Bool)

(assert (=> b!1254075 (= e!712530 e!712532)))

(declare-fun lt!566567 () (_ BitVec 64))

(assert (=> b!1254075 (= lt!566567 (select (arr!39230 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!566566 () Unit!41716)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!81336 (_ BitVec 64) (_ BitVec 32)) Unit!41716)

(assert (=> b!1254075 (= lt!566566 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!566567 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!81336 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1254075 (arrayContainsKey!0 _keys!1118 lt!566567 #b00000000000000000000000000000000)))

(declare-fun lt!566568 () Unit!41716)

(assert (=> b!1254075 (= lt!566568 lt!566566)))

(declare-fun res!836195 () Bool)

(declare-datatypes ((SeekEntryResult!9963 0))(
  ( (MissingZero!9963 (index!42223 (_ BitVec 32))) (Found!9963 (index!42224 (_ BitVec 32))) (Intermediate!9963 (undefined!10775 Bool) (index!42225 (_ BitVec 32)) (x!110373 (_ BitVec 32))) (Undefined!9963) (MissingVacant!9963 (index!42226 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!81336 (_ BitVec 32)) SeekEntryResult!9963)

(assert (=> b!1254075 (= res!836195 (= (seekEntryOrOpen!0 (select (arr!39230 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9963 #b00000000000000000000000000000000)))))

(assert (=> b!1254075 (=> (not res!836195) (not e!712532))))

(declare-fun bm!61726 () Bool)

(declare-fun call!61729 () Bool)

(assert (=> bm!61726 (= call!61729 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1254076 () Bool)

(assert (=> b!1254076 (= e!712532 call!61729)))

(declare-fun d!138077 () Bool)

(declare-fun res!836196 () Bool)

(assert (=> d!138077 (=> res!836196 e!712531)))

(assert (=> d!138077 (= res!836196 (bvsge #b00000000000000000000000000000000 (size!39766 _keys!1118)))))

(assert (=> d!138077 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!712531)))

(declare-fun b!1254073 () Bool)

(assert (=> b!1254073 (= e!712530 call!61729)))

(assert (= (and d!138077 (not res!836196)) b!1254074))

(assert (= (and b!1254074 c!122340) b!1254075))

(assert (= (and b!1254074 (not c!122340)) b!1254073))

(assert (= (and b!1254075 res!836195) b!1254076))

(assert (= (or b!1254076 b!1254073) bm!61726))

(assert (=> b!1254074 m!1154597))

(assert (=> b!1254074 m!1154597))

(assert (=> b!1254074 m!1154639))

(assert (=> b!1254075 m!1154597))

(declare-fun m!1154739 () Bool)

(assert (=> b!1254075 m!1154739))

(declare-fun m!1154741 () Bool)

(assert (=> b!1254075 m!1154741))

(assert (=> b!1254075 m!1154597))

(declare-fun m!1154743 () Bool)

(assert (=> b!1254075 m!1154743))

(declare-fun m!1154745 () Bool)

(assert (=> bm!61726 m!1154745))

(assert (=> b!1253882 d!138077))

(declare-fun d!138079 () Bool)

(assert (=> d!138079 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!105220 d!138079))

(declare-fun d!138081 () Bool)

(assert (=> d!138081 (= (array_inv!29907 _keys!1118) (bvsge (size!39766 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!105220 d!138081))

(declare-fun d!138083 () Bool)

(assert (=> d!138083 (= (array_inv!29908 _values!914) (bvsge (size!39765 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!105220 d!138083))

(declare-fun b!1254083 () Bool)

(declare-fun e!712538 () Bool)

(assert (=> b!1254083 (= e!712538 tp_is_empty!31839)))

(declare-fun b!1254084 () Bool)

(declare-fun e!712537 () Bool)

(assert (=> b!1254084 (= e!712537 tp_is_empty!31839)))

(declare-fun mapNonEmpty!49540 () Bool)

(declare-fun mapRes!49540 () Bool)

(declare-fun tp!94325 () Bool)

(assert (=> mapNonEmpty!49540 (= mapRes!49540 (and tp!94325 e!712538))))

(declare-fun mapValue!49540 () ValueCell!15156)

(declare-fun mapRest!49540 () (Array (_ BitVec 32) ValueCell!15156))

(declare-fun mapKey!49540 () (_ BitVec 32))

(assert (=> mapNonEmpty!49540 (= mapRest!49534 (store mapRest!49540 mapKey!49540 mapValue!49540))))

(declare-fun mapIsEmpty!49540 () Bool)

(assert (=> mapIsEmpty!49540 mapRes!49540))

(declare-fun condMapEmpty!49540 () Bool)

(declare-fun mapDefault!49540 () ValueCell!15156)

(assert (=> mapNonEmpty!49534 (= condMapEmpty!49540 (= mapRest!49534 ((as const (Array (_ BitVec 32) ValueCell!15156)) mapDefault!49540)))))

(assert (=> mapNonEmpty!49534 (= tp!94315 (and e!712537 mapRes!49540))))

(assert (= (and mapNonEmpty!49534 condMapEmpty!49540) mapIsEmpty!49540))

(assert (= (and mapNonEmpty!49534 (not condMapEmpty!49540)) mapNonEmpty!49540))

(assert (= (and mapNonEmpty!49540 ((_ is ValueCellFull!15156) mapValue!49540)) b!1254083))

(assert (= (and mapNonEmpty!49534 ((_ is ValueCellFull!15156) mapDefault!49540)) b!1254084))

(declare-fun m!1154747 () Bool)

(assert (=> mapNonEmpty!49540 m!1154747))

(declare-fun b_lambda!22615 () Bool)

(assert (= b_lambda!22611 (or (and start!105220 b_free!26937) b_lambda!22615)))

(declare-fun b_lambda!22617 () Bool)

(assert (= b_lambda!22603 (or (and start!105220 b_free!26937) b_lambda!22617)))

(declare-fun b_lambda!22619 () Bool)

(assert (= b_lambda!22609 (or (and start!105220 b_free!26937) b_lambda!22619)))

(declare-fun b_lambda!22621 () Bool)

(assert (= b_lambda!22607 (or (and start!105220 b_free!26937) b_lambda!22621)))

(declare-fun b_lambda!22623 () Bool)

(assert (= b_lambda!22605 (or (and start!105220 b_free!26937) b_lambda!22623)))

(declare-fun b_lambda!22625 () Bool)

(assert (= b_lambda!22613 (or (and start!105220 b_free!26937) b_lambda!22625)))

(check-sat (not bm!61712) (not b!1253966) (not b!1253964) (not bm!61719) (not d!138057) (not b!1253988) (not b!1254046) (not b!1253994) (not d!138065) (not bm!61715) tp_is_empty!31839 (not b!1254037) (not bm!61716) (not b!1253971) (not d!138071) (not d!138069) (not bm!61720) (not b!1253984) (not b!1253960) (not d!138067) b_and!44765 (not b!1254060) (not b!1254026) (not bm!61707) (not bm!61705) (not d!138061) (not d!138073) (not b!1253977) (not b!1254064) (not b_lambda!22625) (not b!1254033) (not b!1254038) (not b!1254047) (not b_lambda!22621) (not b!1253989) (not b!1253983) (not b!1254027) (not b!1254075) (not b!1254045) (not b!1253965) (not b!1254035) (not bm!61708) (not b!1254028) (not b!1254049) (not d!138059) (not b!1254030) (not bm!61726) (not b!1254034) (not b!1254074) (not b!1254062) (not b_lambda!22615) (not bm!61723) (not b!1253915) (not bm!61714) (not mapNonEmpty!49540) (not b_next!26937) (not b_lambda!22623) (not b!1253987) (not b!1253962) (not b!1253985) (not b_lambda!22619) (not b_lambda!22617) (not b!1254000) (not b!1254040) (not b!1253961) (not bm!61709) (not b!1254039) (not b!1253914) (not b!1254042) (not d!138063))
(check-sat b_and!44765 (not b_next!26937))
