; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105290 () Bool)

(assert start!105290)

(declare-fun b_free!26989 () Bool)

(declare-fun b_next!26989 () Bool)

(assert (=> start!105290 (= b_free!26989 (not b_next!26989))))

(declare-fun tp!94475 () Bool)

(declare-fun b_and!44797 () Bool)

(assert (=> start!105290 (= tp!94475 b_and!44797)))

(declare-fun b!1254597 () Bool)

(declare-fun res!836533 () Bool)

(declare-fun e!712943 () Bool)

(assert (=> b!1254597 (=> (not res!836533) (not e!712943))))

(declare-datatypes ((array!81359 0))(
  ( (array!81360 (arr!39241 (Array (_ BitVec 32) (_ BitVec 64))) (size!39779 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81359)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81359 (_ BitVec 32)) Bool)

(assert (=> b!1254597 (= res!836533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!49615 () Bool)

(declare-fun mapRes!49615 () Bool)

(assert (=> mapIsEmpty!49615 mapRes!49615))

(declare-fun b!1254598 () Bool)

(declare-fun res!836531 () Bool)

(assert (=> b!1254598 (=> (not res!836531) (not e!712943))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!47887 0))(
  ( (V!47888 (val!16008 Int)) )
))
(declare-datatypes ((ValueCell!15182 0))(
  ( (ValueCellFull!15182 (v!18706 V!47887)) (EmptyCell!15182) )
))
(declare-datatypes ((array!81361 0))(
  ( (array!81362 (arr!39242 (Array (_ BitVec 32) ValueCell!15182)) (size!39780 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81361)

(assert (=> b!1254598 (= res!836531 (and (= (size!39780 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39779 _keys!1118) (size!39780 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1254599 () Bool)

(declare-fun e!712941 () Bool)

(declare-fun tp_is_empty!31891 () Bool)

(assert (=> b!1254599 (= e!712941 tp_is_empty!31891)))

(declare-fun b!1254600 () Bool)

(declare-fun e!712945 () Bool)

(assert (=> b!1254600 (= e!712943 (not e!712945))))

(declare-fun res!836534 () Bool)

(assert (=> b!1254600 (=> res!836534 e!712945)))

(assert (=> b!1254600 (= res!836534 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20752 0))(
  ( (tuple2!20753 (_1!10387 (_ BitVec 64)) (_2!10387 V!47887)) )
))
(declare-datatypes ((List!27962 0))(
  ( (Nil!27959) (Cons!27958 (h!29167 tuple2!20752) (t!41436 List!27962)) )
))
(declare-datatypes ((ListLongMap!18625 0))(
  ( (ListLongMap!18626 (toList!9328 List!27962)) )
))
(declare-fun lt!566986 () ListLongMap!18625)

(declare-fun lt!566982 () ListLongMap!18625)

(assert (=> b!1254600 (= lt!566986 lt!566982)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47887)

(declare-datatypes ((Unit!41621 0))(
  ( (Unit!41622) )
))
(declare-fun lt!566981 () Unit!41621)

(declare-fun zeroValue!871 () V!47887)

(declare-fun minValueBefore!43 () V!47887)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1045 (array!81359 array!81361 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47887 V!47887 V!47887 V!47887 (_ BitVec 32) Int) Unit!41621)

(assert (=> b!1254600 (= lt!566981 (lemmaNoChangeToArrayThenSameMapNoExtras!1045 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5723 (array!81359 array!81361 (_ BitVec 32) (_ BitVec 32) V!47887 V!47887 (_ BitVec 32) Int) ListLongMap!18625)

(assert (=> b!1254600 (= lt!566982 (getCurrentListMapNoExtraKeys!5723 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254600 (= lt!566986 (getCurrentListMapNoExtraKeys!5723 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254601 () Bool)

(declare-fun e!712940 () Bool)

(assert (=> b!1254601 (= e!712945 e!712940)))

(declare-fun res!836532 () Bool)

(assert (=> b!1254601 (=> res!836532 e!712940)))

(declare-fun lt!566984 () ListLongMap!18625)

(declare-fun lt!566983 () ListLongMap!18625)

(declare-fun -!2020 (ListLongMap!18625 (_ BitVec 64)) ListLongMap!18625)

(assert (=> b!1254601 (= res!836532 (not (= (-!2020 lt!566984 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566983)))))

(declare-fun lt!566980 () ListLongMap!18625)

(assert (=> b!1254601 (= (-!2020 lt!566980 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566986)))

(declare-fun lt!566985 () Unit!41621)

(declare-fun addThenRemoveForNewKeyIsSame!309 (ListLongMap!18625 (_ BitVec 64) V!47887) Unit!41621)

(assert (=> b!1254601 (= lt!566985 (addThenRemoveForNewKeyIsSame!309 lt!566986 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> b!1254601 (and (= lt!566984 lt!566980) (= lt!566983 lt!566982))))

(declare-fun +!4223 (ListLongMap!18625 tuple2!20752) ListLongMap!18625)

(assert (=> b!1254601 (= lt!566980 (+!4223 lt!566986 (tuple2!20753 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun getCurrentListMap!4459 (array!81359 array!81361 (_ BitVec 32) (_ BitVec 32) V!47887 V!47887 (_ BitVec 32) Int) ListLongMap!18625)

(assert (=> b!1254601 (= lt!566983 (getCurrentListMap!4459 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254601 (= lt!566984 (getCurrentListMap!4459 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254602 () Bool)

(declare-fun e!712942 () Bool)

(assert (=> b!1254602 (= e!712942 (and e!712941 mapRes!49615))))

(declare-fun condMapEmpty!49615 () Bool)

(declare-fun mapDefault!49615 () ValueCell!15182)

(assert (=> b!1254602 (= condMapEmpty!49615 (= (arr!39242 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15182)) mapDefault!49615)))))

(declare-fun b!1254603 () Bool)

(declare-fun res!836529 () Bool)

(assert (=> b!1254603 (=> (not res!836529) (not e!712943))))

(declare-datatypes ((List!27963 0))(
  ( (Nil!27960) (Cons!27959 (h!29168 (_ BitVec 64)) (t!41437 List!27963)) )
))
(declare-fun arrayNoDuplicates!0 (array!81359 (_ BitVec 32) List!27963) Bool)

(assert (=> b!1254603 (= res!836529 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27960))))

(declare-fun b!1254604 () Bool)

(assert (=> b!1254604 (= e!712940 (bvsle #b00000000000000000000000000000000 (size!39779 _keys!1118)))))

(declare-fun res!836530 () Bool)

(assert (=> start!105290 (=> (not res!836530) (not e!712943))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105290 (= res!836530 (validMask!0 mask!1466))))

(assert (=> start!105290 e!712943))

(assert (=> start!105290 true))

(assert (=> start!105290 tp!94475))

(assert (=> start!105290 tp_is_empty!31891))

(declare-fun array_inv!30039 (array!81359) Bool)

(assert (=> start!105290 (array_inv!30039 _keys!1118)))

(declare-fun array_inv!30040 (array!81361) Bool)

(assert (=> start!105290 (and (array_inv!30040 _values!914) e!712942)))

(declare-fun b!1254605 () Bool)

(declare-fun e!712946 () Bool)

(assert (=> b!1254605 (= e!712946 tp_is_empty!31891)))

(declare-fun mapNonEmpty!49615 () Bool)

(declare-fun tp!94474 () Bool)

(assert (=> mapNonEmpty!49615 (= mapRes!49615 (and tp!94474 e!712946))))

(declare-fun mapValue!49615 () ValueCell!15182)

(declare-fun mapRest!49615 () (Array (_ BitVec 32) ValueCell!15182))

(declare-fun mapKey!49615 () (_ BitVec 32))

(assert (=> mapNonEmpty!49615 (= (arr!39242 _values!914) (store mapRest!49615 mapKey!49615 mapValue!49615))))

(assert (= (and start!105290 res!836530) b!1254598))

(assert (= (and b!1254598 res!836531) b!1254597))

(assert (= (and b!1254597 res!836533) b!1254603))

(assert (= (and b!1254603 res!836529) b!1254600))

(assert (= (and b!1254600 (not res!836534)) b!1254601))

(assert (= (and b!1254601 (not res!836532)) b!1254604))

(assert (= (and b!1254602 condMapEmpty!49615) mapIsEmpty!49615))

(assert (= (and b!1254602 (not condMapEmpty!49615)) mapNonEmpty!49615))

(get-info :version)

(assert (= (and mapNonEmpty!49615 ((_ is ValueCellFull!15182) mapValue!49615)) b!1254605))

(assert (= (and b!1254602 ((_ is ValueCellFull!15182) mapDefault!49615)) b!1254599))

(assert (= start!105290 b!1254602))

(declare-fun m!1154949 () Bool)

(assert (=> b!1254603 m!1154949))

(declare-fun m!1154951 () Bool)

(assert (=> b!1254597 m!1154951))

(declare-fun m!1154953 () Bool)

(assert (=> start!105290 m!1154953))

(declare-fun m!1154955 () Bool)

(assert (=> start!105290 m!1154955))

(declare-fun m!1154957 () Bool)

(assert (=> start!105290 m!1154957))

(declare-fun m!1154959 () Bool)

(assert (=> b!1254601 m!1154959))

(declare-fun m!1154961 () Bool)

(assert (=> b!1254601 m!1154961))

(declare-fun m!1154963 () Bool)

(assert (=> b!1254601 m!1154963))

(declare-fun m!1154965 () Bool)

(assert (=> b!1254601 m!1154965))

(declare-fun m!1154967 () Bool)

(assert (=> b!1254601 m!1154967))

(declare-fun m!1154969 () Bool)

(assert (=> b!1254601 m!1154969))

(declare-fun m!1154971 () Bool)

(assert (=> b!1254600 m!1154971))

(declare-fun m!1154973 () Bool)

(assert (=> b!1254600 m!1154973))

(declare-fun m!1154975 () Bool)

(assert (=> b!1254600 m!1154975))

(declare-fun m!1154977 () Bool)

(assert (=> mapNonEmpty!49615 m!1154977))

(check-sat (not mapNonEmpty!49615) (not start!105290) (not b!1254597) (not b!1254603) (not b!1254600) b_and!44797 tp_is_empty!31891 (not b_next!26989) (not b!1254601))
(check-sat b_and!44797 (not b_next!26989))
(get-model)

(declare-fun d!137971 () Bool)

(assert (=> d!137971 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!105290 d!137971))

(declare-fun d!137973 () Bool)

(assert (=> d!137973 (= (array_inv!30039 _keys!1118) (bvsge (size!39779 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!105290 d!137973))

(declare-fun d!137975 () Bool)

(assert (=> d!137975 (= (array_inv!30040 _values!914) (bvsge (size!39780 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!105290 d!137975))

(declare-fun d!137977 () Bool)

(assert (=> d!137977 (= (getCurrentListMapNoExtraKeys!5723 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5723 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!567031 () Unit!41621)

(declare-fun choose!1864 (array!81359 array!81361 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47887 V!47887 V!47887 V!47887 (_ BitVec 32) Int) Unit!41621)

(assert (=> d!137977 (= lt!567031 (choose!1864 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!137977 (validMask!0 mask!1466)))

(assert (=> d!137977 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1045 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!567031)))

(declare-fun bs!35429 () Bool)

(assert (= bs!35429 d!137977))

(assert (=> bs!35429 m!1154975))

(assert (=> bs!35429 m!1154973))

(declare-fun m!1155039 () Bool)

(assert (=> bs!35429 m!1155039))

(assert (=> bs!35429 m!1154953))

(assert (=> b!1254600 d!137977))

(declare-fun b!1254684 () Bool)

(declare-fun e!713004 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1254684 (= e!713004 (validKeyInArray!0 (select (arr!39241 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1254684 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1254686 () Bool)

(declare-fun lt!567052 () Unit!41621)

(declare-fun lt!567050 () Unit!41621)

(assert (=> b!1254686 (= lt!567052 lt!567050)))

(declare-fun lt!567049 () V!47887)

(declare-fun lt!567048 () (_ BitVec 64))

(declare-fun lt!567047 () (_ BitVec 64))

(declare-fun lt!567046 () ListLongMap!18625)

(declare-fun contains!7496 (ListLongMap!18625 (_ BitVec 64)) Bool)

(assert (=> b!1254686 (not (contains!7496 (+!4223 lt!567046 (tuple2!20753 lt!567048 lt!567049)) lt!567047))))

(declare-fun addStillNotContains!315 (ListLongMap!18625 (_ BitVec 64) V!47887 (_ BitVec 64)) Unit!41621)

(assert (=> b!1254686 (= lt!567050 (addStillNotContains!315 lt!567046 lt!567048 lt!567049 lt!567047))))

(assert (=> b!1254686 (= lt!567047 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!20102 (ValueCell!15182 V!47887) V!47887)

(declare-fun dynLambda!3409 (Int (_ BitVec 64)) V!47887)

(assert (=> b!1254686 (= lt!567049 (get!20102 (select (arr!39242 _values!914) #b00000000000000000000000000000000) (dynLambda!3409 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1254686 (= lt!567048 (select (arr!39241 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!61713 () ListLongMap!18625)

(assert (=> b!1254686 (= lt!567046 call!61713)))

(declare-fun e!713008 () ListLongMap!18625)

(assert (=> b!1254686 (= e!713008 (+!4223 call!61713 (tuple2!20753 (select (arr!39241 _keys!1118) #b00000000000000000000000000000000) (get!20102 (select (arr!39242 _values!914) #b00000000000000000000000000000000) (dynLambda!3409 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1254687 () Bool)

(assert (=> b!1254687 (= e!713008 call!61713)))

(declare-fun b!1254688 () Bool)

(declare-fun e!713006 () Bool)

(declare-fun lt!567051 () ListLongMap!18625)

(declare-fun isEmpty!1034 (ListLongMap!18625) Bool)

(assert (=> b!1254688 (= e!713006 (isEmpty!1034 lt!567051))))

(declare-fun bm!61710 () Bool)

(assert (=> bm!61710 (= call!61713 (getCurrentListMapNoExtraKeys!5723 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1254689 () Bool)

(assert (=> b!1254689 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39779 _keys!1118)))))

(assert (=> b!1254689 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39780 _values!914)))))

(declare-fun e!713005 () Bool)

(declare-fun apply!979 (ListLongMap!18625 (_ BitVec 64)) V!47887)

(assert (=> b!1254689 (= e!713005 (= (apply!979 lt!567051 (select (arr!39241 _keys!1118) #b00000000000000000000000000000000)) (get!20102 (select (arr!39242 _values!914) #b00000000000000000000000000000000) (dynLambda!3409 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1254690 () Bool)

(declare-fun e!713003 () Bool)

(declare-fun e!713007 () Bool)

(assert (=> b!1254690 (= e!713003 e!713007)))

(declare-fun c!122334 () Bool)

(assert (=> b!1254690 (= c!122334 e!713004)))

(declare-fun res!836581 () Bool)

(assert (=> b!1254690 (=> (not res!836581) (not e!713004))))

(assert (=> b!1254690 (= res!836581 (bvslt #b00000000000000000000000000000000 (size!39779 _keys!1118)))))

(declare-fun b!1254691 () Bool)

(declare-fun e!713009 () ListLongMap!18625)

(assert (=> b!1254691 (= e!713009 e!713008)))

(declare-fun c!122332 () Bool)

(assert (=> b!1254691 (= c!122332 (validKeyInArray!0 (select (arr!39241 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1254692 () Bool)

(assert (=> b!1254692 (= e!713007 e!713006)))

(declare-fun c!122333 () Bool)

(assert (=> b!1254692 (= c!122333 (bvslt #b00000000000000000000000000000000 (size!39779 _keys!1118)))))

(declare-fun b!1254693 () Bool)

(declare-fun res!836580 () Bool)

(assert (=> b!1254693 (=> (not res!836580) (not e!713003))))

(assert (=> b!1254693 (= res!836580 (not (contains!7496 lt!567051 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1254685 () Bool)

(assert (=> b!1254685 (= e!713007 e!713005)))

(assert (=> b!1254685 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39779 _keys!1118)))))

(declare-fun res!836582 () Bool)

(assert (=> b!1254685 (= res!836582 (contains!7496 lt!567051 (select (arr!39241 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1254685 (=> (not res!836582) (not e!713005))))

(declare-fun d!137979 () Bool)

(assert (=> d!137979 e!713003))

(declare-fun res!836579 () Bool)

(assert (=> d!137979 (=> (not res!836579) (not e!713003))))

(assert (=> d!137979 (= res!836579 (not (contains!7496 lt!567051 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!137979 (= lt!567051 e!713009)))

(declare-fun c!122331 () Bool)

(assert (=> d!137979 (= c!122331 (bvsge #b00000000000000000000000000000000 (size!39779 _keys!1118)))))

(assert (=> d!137979 (validMask!0 mask!1466)))

(assert (=> d!137979 (= (getCurrentListMapNoExtraKeys!5723 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!567051)))

(declare-fun b!1254694 () Bool)

(assert (=> b!1254694 (= e!713006 (= lt!567051 (getCurrentListMapNoExtraKeys!5723 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1254695 () Bool)

(assert (=> b!1254695 (= e!713009 (ListLongMap!18626 Nil!27959))))

(assert (= (and d!137979 c!122331) b!1254695))

(assert (= (and d!137979 (not c!122331)) b!1254691))

(assert (= (and b!1254691 c!122332) b!1254686))

(assert (= (and b!1254691 (not c!122332)) b!1254687))

(assert (= (or b!1254686 b!1254687) bm!61710))

(assert (= (and d!137979 res!836579) b!1254693))

(assert (= (and b!1254693 res!836580) b!1254690))

(assert (= (and b!1254690 res!836581) b!1254684))

(assert (= (and b!1254690 c!122334) b!1254685))

(assert (= (and b!1254690 (not c!122334)) b!1254692))

(assert (= (and b!1254685 res!836582) b!1254689))

(assert (= (and b!1254692 c!122333) b!1254694))

(assert (= (and b!1254692 (not c!122333)) b!1254688))

(declare-fun b_lambda!22617 () Bool)

(assert (=> (not b_lambda!22617) (not b!1254686)))

(declare-fun t!41441 () Bool)

(declare-fun tb!11291 () Bool)

(assert (=> (and start!105290 (= defaultEntry!922 defaultEntry!922) t!41441) tb!11291))

(declare-fun result!23297 () Bool)

(assert (=> tb!11291 (= result!23297 tp_is_empty!31891)))

(assert (=> b!1254686 t!41441))

(declare-fun b_and!44803 () Bool)

(assert (= b_and!44797 (and (=> t!41441 result!23297) b_and!44803)))

(declare-fun b_lambda!22619 () Bool)

(assert (=> (not b_lambda!22619) (not b!1254689)))

(assert (=> b!1254689 t!41441))

(declare-fun b_and!44805 () Bool)

(assert (= b_and!44803 (and (=> t!41441 result!23297) b_and!44805)))

(declare-fun m!1155041 () Bool)

(assert (=> b!1254688 m!1155041))

(declare-fun m!1155043 () Bool)

(assert (=> b!1254685 m!1155043))

(assert (=> b!1254685 m!1155043))

(declare-fun m!1155045 () Bool)

(assert (=> b!1254685 m!1155045))

(declare-fun m!1155047 () Bool)

(assert (=> b!1254694 m!1155047))

(assert (=> bm!61710 m!1155047))

(assert (=> b!1254684 m!1155043))

(assert (=> b!1254684 m!1155043))

(declare-fun m!1155049 () Bool)

(assert (=> b!1254684 m!1155049))

(declare-fun m!1155051 () Bool)

(assert (=> b!1254686 m!1155051))

(declare-fun m!1155053 () Bool)

(assert (=> b!1254686 m!1155053))

(declare-fun m!1155055 () Bool)

(assert (=> b!1254686 m!1155055))

(assert (=> b!1254686 m!1155051))

(declare-fun m!1155057 () Bool)

(assert (=> b!1254686 m!1155057))

(declare-fun m!1155059 () Bool)

(assert (=> b!1254686 m!1155059))

(declare-fun m!1155061 () Bool)

(assert (=> b!1254686 m!1155061))

(declare-fun m!1155063 () Bool)

(assert (=> b!1254686 m!1155063))

(assert (=> b!1254686 m!1155043))

(assert (=> b!1254686 m!1155061))

(assert (=> b!1254686 m!1155057))

(declare-fun m!1155065 () Bool)

(assert (=> b!1254693 m!1155065))

(declare-fun m!1155067 () Bool)

(assert (=> d!137979 m!1155067))

(assert (=> d!137979 m!1154953))

(assert (=> b!1254691 m!1155043))

(assert (=> b!1254691 m!1155043))

(assert (=> b!1254691 m!1155049))

(assert (=> b!1254689 m!1155051))

(assert (=> b!1254689 m!1155051))

(assert (=> b!1254689 m!1155057))

(assert (=> b!1254689 m!1155059))

(assert (=> b!1254689 m!1155043))

(assert (=> b!1254689 m!1155057))

(assert (=> b!1254689 m!1155043))

(declare-fun m!1155069 () Bool)

(assert (=> b!1254689 m!1155069))

(assert (=> b!1254600 d!137979))

(declare-fun b!1254698 () Bool)

(declare-fun e!713011 () Bool)

(assert (=> b!1254698 (= e!713011 (validKeyInArray!0 (select (arr!39241 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1254698 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1254700 () Bool)

(declare-fun lt!567059 () Unit!41621)

(declare-fun lt!567057 () Unit!41621)

(assert (=> b!1254700 (= lt!567059 lt!567057)))

(declare-fun lt!567056 () V!47887)

(declare-fun lt!567054 () (_ BitVec 64))

(declare-fun lt!567053 () ListLongMap!18625)

(declare-fun lt!567055 () (_ BitVec 64))

(assert (=> b!1254700 (not (contains!7496 (+!4223 lt!567053 (tuple2!20753 lt!567055 lt!567056)) lt!567054))))

(assert (=> b!1254700 (= lt!567057 (addStillNotContains!315 lt!567053 lt!567055 lt!567056 lt!567054))))

(assert (=> b!1254700 (= lt!567054 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1254700 (= lt!567056 (get!20102 (select (arr!39242 _values!914) #b00000000000000000000000000000000) (dynLambda!3409 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1254700 (= lt!567055 (select (arr!39241 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!61714 () ListLongMap!18625)

(assert (=> b!1254700 (= lt!567053 call!61714)))

(declare-fun e!713015 () ListLongMap!18625)

(assert (=> b!1254700 (= e!713015 (+!4223 call!61714 (tuple2!20753 (select (arr!39241 _keys!1118) #b00000000000000000000000000000000) (get!20102 (select (arr!39242 _values!914) #b00000000000000000000000000000000) (dynLambda!3409 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1254701 () Bool)

(assert (=> b!1254701 (= e!713015 call!61714)))

(declare-fun b!1254702 () Bool)

(declare-fun e!713013 () Bool)

(declare-fun lt!567058 () ListLongMap!18625)

(assert (=> b!1254702 (= e!713013 (isEmpty!1034 lt!567058))))

(declare-fun bm!61711 () Bool)

(assert (=> bm!61711 (= call!61714 (getCurrentListMapNoExtraKeys!5723 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1254703 () Bool)

(assert (=> b!1254703 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39779 _keys!1118)))))

(assert (=> b!1254703 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39780 _values!914)))))

(declare-fun e!713012 () Bool)

(assert (=> b!1254703 (= e!713012 (= (apply!979 lt!567058 (select (arr!39241 _keys!1118) #b00000000000000000000000000000000)) (get!20102 (select (arr!39242 _values!914) #b00000000000000000000000000000000) (dynLambda!3409 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1254704 () Bool)

(declare-fun e!713010 () Bool)

(declare-fun e!713014 () Bool)

(assert (=> b!1254704 (= e!713010 e!713014)))

(declare-fun c!122338 () Bool)

(assert (=> b!1254704 (= c!122338 e!713011)))

(declare-fun res!836585 () Bool)

(assert (=> b!1254704 (=> (not res!836585) (not e!713011))))

(assert (=> b!1254704 (= res!836585 (bvslt #b00000000000000000000000000000000 (size!39779 _keys!1118)))))

(declare-fun b!1254705 () Bool)

(declare-fun e!713016 () ListLongMap!18625)

(assert (=> b!1254705 (= e!713016 e!713015)))

(declare-fun c!122336 () Bool)

(assert (=> b!1254705 (= c!122336 (validKeyInArray!0 (select (arr!39241 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1254706 () Bool)

(assert (=> b!1254706 (= e!713014 e!713013)))

(declare-fun c!122337 () Bool)

(assert (=> b!1254706 (= c!122337 (bvslt #b00000000000000000000000000000000 (size!39779 _keys!1118)))))

(declare-fun b!1254707 () Bool)

(declare-fun res!836584 () Bool)

(assert (=> b!1254707 (=> (not res!836584) (not e!713010))))

(assert (=> b!1254707 (= res!836584 (not (contains!7496 lt!567058 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1254699 () Bool)

(assert (=> b!1254699 (= e!713014 e!713012)))

(assert (=> b!1254699 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39779 _keys!1118)))))

(declare-fun res!836586 () Bool)

(assert (=> b!1254699 (= res!836586 (contains!7496 lt!567058 (select (arr!39241 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1254699 (=> (not res!836586) (not e!713012))))

(declare-fun d!137981 () Bool)

(assert (=> d!137981 e!713010))

(declare-fun res!836583 () Bool)

(assert (=> d!137981 (=> (not res!836583) (not e!713010))))

(assert (=> d!137981 (= res!836583 (not (contains!7496 lt!567058 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!137981 (= lt!567058 e!713016)))

(declare-fun c!122335 () Bool)

(assert (=> d!137981 (= c!122335 (bvsge #b00000000000000000000000000000000 (size!39779 _keys!1118)))))

(assert (=> d!137981 (validMask!0 mask!1466)))

(assert (=> d!137981 (= (getCurrentListMapNoExtraKeys!5723 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!567058)))

(declare-fun b!1254708 () Bool)

(assert (=> b!1254708 (= e!713013 (= lt!567058 (getCurrentListMapNoExtraKeys!5723 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1254709 () Bool)

(assert (=> b!1254709 (= e!713016 (ListLongMap!18626 Nil!27959))))

(assert (= (and d!137981 c!122335) b!1254709))

(assert (= (and d!137981 (not c!122335)) b!1254705))

(assert (= (and b!1254705 c!122336) b!1254700))

(assert (= (and b!1254705 (not c!122336)) b!1254701))

(assert (= (or b!1254700 b!1254701) bm!61711))

(assert (= (and d!137981 res!836583) b!1254707))

(assert (= (and b!1254707 res!836584) b!1254704))

(assert (= (and b!1254704 res!836585) b!1254698))

(assert (= (and b!1254704 c!122338) b!1254699))

(assert (= (and b!1254704 (not c!122338)) b!1254706))

(assert (= (and b!1254699 res!836586) b!1254703))

(assert (= (and b!1254706 c!122337) b!1254708))

(assert (= (and b!1254706 (not c!122337)) b!1254702))

(declare-fun b_lambda!22621 () Bool)

(assert (=> (not b_lambda!22621) (not b!1254700)))

(assert (=> b!1254700 t!41441))

(declare-fun b_and!44807 () Bool)

(assert (= b_and!44805 (and (=> t!41441 result!23297) b_and!44807)))

(declare-fun b_lambda!22623 () Bool)

(assert (=> (not b_lambda!22623) (not b!1254703)))

(assert (=> b!1254703 t!41441))

(declare-fun b_and!44809 () Bool)

(assert (= b_and!44807 (and (=> t!41441 result!23297) b_and!44809)))

(declare-fun m!1155071 () Bool)

(assert (=> b!1254702 m!1155071))

(assert (=> b!1254699 m!1155043))

(assert (=> b!1254699 m!1155043))

(declare-fun m!1155073 () Bool)

(assert (=> b!1254699 m!1155073))

(declare-fun m!1155075 () Bool)

(assert (=> b!1254708 m!1155075))

(assert (=> bm!61711 m!1155075))

(assert (=> b!1254698 m!1155043))

(assert (=> b!1254698 m!1155043))

(assert (=> b!1254698 m!1155049))

(assert (=> b!1254700 m!1155051))

(declare-fun m!1155077 () Bool)

(assert (=> b!1254700 m!1155077))

(declare-fun m!1155079 () Bool)

(assert (=> b!1254700 m!1155079))

(assert (=> b!1254700 m!1155051))

(assert (=> b!1254700 m!1155057))

(assert (=> b!1254700 m!1155059))

(declare-fun m!1155081 () Bool)

(assert (=> b!1254700 m!1155081))

(declare-fun m!1155083 () Bool)

(assert (=> b!1254700 m!1155083))

(assert (=> b!1254700 m!1155043))

(assert (=> b!1254700 m!1155081))

(assert (=> b!1254700 m!1155057))

(declare-fun m!1155085 () Bool)

(assert (=> b!1254707 m!1155085))

(declare-fun m!1155087 () Bool)

(assert (=> d!137981 m!1155087))

(assert (=> d!137981 m!1154953))

(assert (=> b!1254705 m!1155043))

(assert (=> b!1254705 m!1155043))

(assert (=> b!1254705 m!1155049))

(assert (=> b!1254703 m!1155051))

(assert (=> b!1254703 m!1155051))

(assert (=> b!1254703 m!1155057))

(assert (=> b!1254703 m!1155059))

(assert (=> b!1254703 m!1155043))

(assert (=> b!1254703 m!1155057))

(assert (=> b!1254703 m!1155043))

(declare-fun m!1155089 () Bool)

(assert (=> b!1254703 m!1155089))

(assert (=> b!1254600 d!137981))

(declare-fun b!1254752 () Bool)

(declare-fun e!713050 () Bool)

(declare-fun lt!567122 () ListLongMap!18625)

(assert (=> b!1254752 (= e!713050 (= (apply!979 lt!567122 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!43))))

(declare-fun b!1254753 () Bool)

(declare-fun e!713049 () Bool)

(declare-fun call!61730 () Bool)

(assert (=> b!1254753 (= e!713049 (not call!61730))))

(declare-fun bm!61726 () Bool)

(assert (=> bm!61726 (= call!61730 (contains!7496 lt!567122 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1254754 () Bool)

(declare-fun e!713054 () ListLongMap!18625)

(declare-fun e!713046 () ListLongMap!18625)

(assert (=> b!1254754 (= e!713054 e!713046)))

(declare-fun c!122352 () Bool)

(assert (=> b!1254754 (= c!122352 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1254755 () Bool)

(declare-fun e!713044 () Bool)

(assert (=> b!1254755 (= e!713044 (validKeyInArray!0 (select (arr!39241 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61727 () Bool)

(declare-fun call!61731 () ListLongMap!18625)

(declare-fun call!61733 () ListLongMap!18625)

(assert (=> bm!61727 (= call!61731 call!61733)))

(declare-fun b!1254756 () Bool)

(declare-fun e!713047 () ListLongMap!18625)

(declare-fun call!61735 () ListLongMap!18625)

(assert (=> b!1254756 (= e!713047 call!61735)))

(declare-fun b!1254757 () Bool)

(declare-fun e!713053 () Bool)

(declare-fun call!61729 () Bool)

(assert (=> b!1254757 (= e!713053 (not call!61729))))

(declare-fun call!61734 () ListLongMap!18625)

(declare-fun c!122354 () Bool)

(declare-fun bm!61728 () Bool)

(assert (=> bm!61728 (= call!61734 (+!4223 (ite c!122354 call!61733 (ite c!122352 call!61731 call!61735)) (ite (or c!122354 c!122352) (tuple2!20753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!20753 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43))))))

(declare-fun bm!61729 () Bool)

(assert (=> bm!61729 (= call!61729 (contains!7496 lt!567122 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1254758 () Bool)

(declare-fun res!836613 () Bool)

(declare-fun e!713052 () Bool)

(assert (=> b!1254758 (=> (not res!836613) (not e!713052))))

(declare-fun e!713048 () Bool)

(assert (=> b!1254758 (= res!836613 e!713048)))

(declare-fun res!836605 () Bool)

(assert (=> b!1254758 (=> res!836605 e!713048)))

(assert (=> b!1254758 (= res!836605 (not e!713044))))

(declare-fun res!836608 () Bool)

(assert (=> b!1254758 (=> (not res!836608) (not e!713044))))

(assert (=> b!1254758 (= res!836608 (bvslt #b00000000000000000000000000000000 (size!39779 _keys!1118)))))

(declare-fun b!1254759 () Bool)

(declare-fun e!713045 () Bool)

(assert (=> b!1254759 (= e!713045 (= (apply!979 lt!567122 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1254760 () Bool)

(assert (=> b!1254760 (= e!713049 e!713045)))

(declare-fun res!836606 () Bool)

(assert (=> b!1254760 (= res!836606 call!61730)))

(assert (=> b!1254760 (=> (not res!836606) (not e!713045))))

(declare-fun b!1254761 () Bool)

(declare-fun e!713051 () Unit!41621)

(declare-fun lt!567114 () Unit!41621)

(assert (=> b!1254761 (= e!713051 lt!567114)))

(declare-fun lt!567125 () ListLongMap!18625)

(assert (=> b!1254761 (= lt!567125 (getCurrentListMapNoExtraKeys!5723 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!567113 () (_ BitVec 64))

(assert (=> b!1254761 (= lt!567113 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!567118 () (_ BitVec 64))

(assert (=> b!1254761 (= lt!567118 (select (arr!39241 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!567115 () Unit!41621)

(declare-fun addStillContains!1079 (ListLongMap!18625 (_ BitVec 64) V!47887 (_ BitVec 64)) Unit!41621)

(assert (=> b!1254761 (= lt!567115 (addStillContains!1079 lt!567125 lt!567113 zeroValue!871 lt!567118))))

(assert (=> b!1254761 (contains!7496 (+!4223 lt!567125 (tuple2!20753 lt!567113 zeroValue!871)) lt!567118)))

(declare-fun lt!567123 () Unit!41621)

(assert (=> b!1254761 (= lt!567123 lt!567115)))

(declare-fun lt!567124 () ListLongMap!18625)

(assert (=> b!1254761 (= lt!567124 (getCurrentListMapNoExtraKeys!5723 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!567105 () (_ BitVec 64))

(assert (=> b!1254761 (= lt!567105 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!567109 () (_ BitVec 64))

(assert (=> b!1254761 (= lt!567109 (select (arr!39241 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!567111 () Unit!41621)

(declare-fun addApplyDifferent!522 (ListLongMap!18625 (_ BitVec 64) V!47887 (_ BitVec 64)) Unit!41621)

(assert (=> b!1254761 (= lt!567111 (addApplyDifferent!522 lt!567124 lt!567105 minValueAfter!43 lt!567109))))

(assert (=> b!1254761 (= (apply!979 (+!4223 lt!567124 (tuple2!20753 lt!567105 minValueAfter!43)) lt!567109) (apply!979 lt!567124 lt!567109))))

(declare-fun lt!567107 () Unit!41621)

(assert (=> b!1254761 (= lt!567107 lt!567111)))

(declare-fun lt!567106 () ListLongMap!18625)

(assert (=> b!1254761 (= lt!567106 (getCurrentListMapNoExtraKeys!5723 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!567121 () (_ BitVec 64))

(assert (=> b!1254761 (= lt!567121 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!567110 () (_ BitVec 64))

(assert (=> b!1254761 (= lt!567110 (select (arr!39241 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!567116 () Unit!41621)

(assert (=> b!1254761 (= lt!567116 (addApplyDifferent!522 lt!567106 lt!567121 zeroValue!871 lt!567110))))

(assert (=> b!1254761 (= (apply!979 (+!4223 lt!567106 (tuple2!20753 lt!567121 zeroValue!871)) lt!567110) (apply!979 lt!567106 lt!567110))))

(declare-fun lt!567104 () Unit!41621)

(assert (=> b!1254761 (= lt!567104 lt!567116)))

(declare-fun lt!567112 () ListLongMap!18625)

(assert (=> b!1254761 (= lt!567112 (getCurrentListMapNoExtraKeys!5723 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!567120 () (_ BitVec 64))

(assert (=> b!1254761 (= lt!567120 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!567108 () (_ BitVec 64))

(assert (=> b!1254761 (= lt!567108 (select (arr!39241 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1254761 (= lt!567114 (addApplyDifferent!522 lt!567112 lt!567120 minValueAfter!43 lt!567108))))

(assert (=> b!1254761 (= (apply!979 (+!4223 lt!567112 (tuple2!20753 lt!567120 minValueAfter!43)) lt!567108) (apply!979 lt!567112 lt!567108))))

(declare-fun b!1254762 () Bool)

(declare-fun call!61732 () ListLongMap!18625)

(assert (=> b!1254762 (= e!713047 call!61732)))

(declare-fun b!1254763 () Bool)

(assert (=> b!1254763 (= e!713053 e!713050)))

(declare-fun res!836609 () Bool)

(assert (=> b!1254763 (= res!836609 call!61729)))

(assert (=> b!1254763 (=> (not res!836609) (not e!713050))))

(declare-fun b!1254764 () Bool)

(assert (=> b!1254764 (= e!713052 e!713053)))

(declare-fun c!122355 () Bool)

(assert (=> b!1254764 (= c!122355 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1254765 () Bool)

(declare-fun c!122356 () Bool)

(assert (=> b!1254765 (= c!122356 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1254765 (= e!713046 e!713047)))

(declare-fun bm!61730 () Bool)

(assert (=> bm!61730 (= call!61735 call!61731)))

(declare-fun b!1254766 () Bool)

(assert (=> b!1254766 (= e!713054 (+!4223 call!61734 (tuple2!20753 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43)))))

(declare-fun b!1254767 () Bool)

(declare-fun e!713043 () Bool)

(assert (=> b!1254767 (= e!713048 e!713043)))

(declare-fun res!836612 () Bool)

(assert (=> b!1254767 (=> (not res!836612) (not e!713043))))

(assert (=> b!1254767 (= res!836612 (contains!7496 lt!567122 (select (arr!39241 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1254767 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39779 _keys!1118)))))

(declare-fun bm!61731 () Bool)

(assert (=> bm!61731 (= call!61732 call!61734)))

(declare-fun b!1254768 () Bool)

(declare-fun Unit!41625 () Unit!41621)

(assert (=> b!1254768 (= e!713051 Unit!41625)))

(declare-fun d!137983 () Bool)

(assert (=> d!137983 e!713052))

(declare-fun res!836607 () Bool)

(assert (=> d!137983 (=> (not res!836607) (not e!713052))))

(assert (=> d!137983 (= res!836607 (or (bvsge #b00000000000000000000000000000000 (size!39779 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39779 _keys!1118)))))))

(declare-fun lt!567119 () ListLongMap!18625)

(assert (=> d!137983 (= lt!567122 lt!567119)))

(declare-fun lt!567117 () Unit!41621)

(assert (=> d!137983 (= lt!567117 e!713051)))

(declare-fun c!122351 () Bool)

(declare-fun e!713055 () Bool)

(assert (=> d!137983 (= c!122351 e!713055)))

(declare-fun res!836610 () Bool)

(assert (=> d!137983 (=> (not res!836610) (not e!713055))))

(assert (=> d!137983 (= res!836610 (bvslt #b00000000000000000000000000000000 (size!39779 _keys!1118)))))

(assert (=> d!137983 (= lt!567119 e!713054)))

(assert (=> d!137983 (= c!122354 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!137983 (validMask!0 mask!1466)))

(assert (=> d!137983 (= (getCurrentListMap!4459 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!567122)))

(declare-fun b!1254769 () Bool)

(assert (=> b!1254769 (= e!713055 (validKeyInArray!0 (select (arr!39241 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1254770 () Bool)

(assert (=> b!1254770 (= e!713043 (= (apply!979 lt!567122 (select (arr!39241 _keys!1118) #b00000000000000000000000000000000)) (get!20102 (select (arr!39242 _values!914) #b00000000000000000000000000000000) (dynLambda!3409 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1254770 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39780 _values!914)))))

(assert (=> b!1254770 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39779 _keys!1118)))))

(declare-fun b!1254771 () Bool)

(declare-fun res!836611 () Bool)

(assert (=> b!1254771 (=> (not res!836611) (not e!713052))))

(assert (=> b!1254771 (= res!836611 e!713049)))

(declare-fun c!122353 () Bool)

(assert (=> b!1254771 (= c!122353 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!61732 () Bool)

(assert (=> bm!61732 (= call!61733 (getCurrentListMapNoExtraKeys!5723 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254772 () Bool)

(assert (=> b!1254772 (= e!713046 call!61732)))

(assert (= (and d!137983 c!122354) b!1254766))

(assert (= (and d!137983 (not c!122354)) b!1254754))

(assert (= (and b!1254754 c!122352) b!1254772))

(assert (= (and b!1254754 (not c!122352)) b!1254765))

(assert (= (and b!1254765 c!122356) b!1254762))

(assert (= (and b!1254765 (not c!122356)) b!1254756))

(assert (= (or b!1254762 b!1254756) bm!61730))

(assert (= (or b!1254772 bm!61730) bm!61727))

(assert (= (or b!1254772 b!1254762) bm!61731))

(assert (= (or b!1254766 bm!61727) bm!61732))

(assert (= (or b!1254766 bm!61731) bm!61728))

(assert (= (and d!137983 res!836610) b!1254769))

(assert (= (and d!137983 c!122351) b!1254761))

(assert (= (and d!137983 (not c!122351)) b!1254768))

(assert (= (and d!137983 res!836607) b!1254758))

(assert (= (and b!1254758 res!836608) b!1254755))

(assert (= (and b!1254758 (not res!836605)) b!1254767))

(assert (= (and b!1254767 res!836612) b!1254770))

(assert (= (and b!1254758 res!836613) b!1254771))

(assert (= (and b!1254771 c!122353) b!1254760))

(assert (= (and b!1254771 (not c!122353)) b!1254753))

(assert (= (and b!1254760 res!836606) b!1254759))

(assert (= (or b!1254760 b!1254753) bm!61726))

(assert (= (and b!1254771 res!836611) b!1254764))

(assert (= (and b!1254764 c!122355) b!1254763))

(assert (= (and b!1254764 (not c!122355)) b!1254757))

(assert (= (and b!1254763 res!836609) b!1254752))

(assert (= (or b!1254763 b!1254757) bm!61729))

(declare-fun b_lambda!22625 () Bool)

(assert (=> (not b_lambda!22625) (not b!1254770)))

(assert (=> b!1254770 t!41441))

(declare-fun b_and!44811 () Bool)

(assert (= b_and!44809 (and (=> t!41441 result!23297) b_and!44811)))

(declare-fun m!1155091 () Bool)

(assert (=> b!1254752 m!1155091))

(assert (=> bm!61732 m!1154973))

(assert (=> b!1254767 m!1155043))

(assert (=> b!1254767 m!1155043))

(declare-fun m!1155093 () Bool)

(assert (=> b!1254767 m!1155093))

(assert (=> b!1254769 m!1155043))

(assert (=> b!1254769 m!1155043))

(assert (=> b!1254769 m!1155049))

(declare-fun m!1155095 () Bool)

(assert (=> bm!61729 m!1155095))

(assert (=> b!1254770 m!1155057))

(assert (=> b!1254770 m!1155051))

(assert (=> b!1254770 m!1155043))

(assert (=> b!1254770 m!1155051))

(assert (=> b!1254770 m!1155057))

(assert (=> b!1254770 m!1155059))

(assert (=> b!1254770 m!1155043))

(declare-fun m!1155097 () Bool)

(assert (=> b!1254770 m!1155097))

(declare-fun m!1155099 () Bool)

(assert (=> b!1254759 m!1155099))

(declare-fun m!1155101 () Bool)

(assert (=> bm!61728 m!1155101))

(assert (=> d!137983 m!1154953))

(declare-fun m!1155103 () Bool)

(assert (=> b!1254761 m!1155103))

(assert (=> b!1254761 m!1155103))

(declare-fun m!1155105 () Bool)

(assert (=> b!1254761 m!1155105))

(declare-fun m!1155107 () Bool)

(assert (=> b!1254761 m!1155107))

(assert (=> b!1254761 m!1155107))

(declare-fun m!1155109 () Bool)

(assert (=> b!1254761 m!1155109))

(declare-fun m!1155111 () Bool)

(assert (=> b!1254761 m!1155111))

(declare-fun m!1155113 () Bool)

(assert (=> b!1254761 m!1155113))

(declare-fun m!1155115 () Bool)

(assert (=> b!1254761 m!1155115))

(assert (=> b!1254761 m!1154973))

(assert (=> b!1254761 m!1155115))

(declare-fun m!1155117 () Bool)

(assert (=> b!1254761 m!1155117))

(declare-fun m!1155119 () Bool)

(assert (=> b!1254761 m!1155119))

(declare-fun m!1155121 () Bool)

(assert (=> b!1254761 m!1155121))

(declare-fun m!1155123 () Bool)

(assert (=> b!1254761 m!1155123))

(assert (=> b!1254761 m!1155043))

(declare-fun m!1155125 () Bool)

(assert (=> b!1254761 m!1155125))

(declare-fun m!1155127 () Bool)

(assert (=> b!1254761 m!1155127))

(assert (=> b!1254761 m!1155123))

(declare-fun m!1155129 () Bool)

(assert (=> b!1254761 m!1155129))

(declare-fun m!1155131 () Bool)

(assert (=> b!1254761 m!1155131))

(declare-fun m!1155133 () Bool)

(assert (=> b!1254766 m!1155133))

(assert (=> b!1254755 m!1155043))

(assert (=> b!1254755 m!1155043))

(assert (=> b!1254755 m!1155049))

(declare-fun m!1155135 () Bool)

(assert (=> bm!61726 m!1155135))

(assert (=> b!1254601 d!137983))

(declare-fun d!137985 () Bool)

(declare-fun e!713058 () Bool)

(assert (=> d!137985 e!713058))

(declare-fun res!836619 () Bool)

(assert (=> d!137985 (=> (not res!836619) (not e!713058))))

(declare-fun lt!567135 () ListLongMap!18625)

(assert (=> d!137985 (= res!836619 (contains!7496 lt!567135 (_1!10387 (tuple2!20753 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lt!567137 () List!27962)

(assert (=> d!137985 (= lt!567135 (ListLongMap!18626 lt!567137))))

(declare-fun lt!567134 () Unit!41621)

(declare-fun lt!567136 () Unit!41621)

(assert (=> d!137985 (= lt!567134 lt!567136)))

(declare-datatypes ((Option!708 0))(
  ( (Some!707 (v!18709 V!47887)) (None!706) )
))
(declare-fun getValueByKey!657 (List!27962 (_ BitVec 64)) Option!708)

(assert (=> d!137985 (= (getValueByKey!657 lt!567137 (_1!10387 (tuple2!20753 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!707 (_2!10387 (tuple2!20753 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lemmaContainsTupThenGetReturnValue!331 (List!27962 (_ BitVec 64) V!47887) Unit!41621)

(assert (=> d!137985 (= lt!567136 (lemmaContainsTupThenGetReturnValue!331 lt!567137 (_1!10387 (tuple2!20753 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10387 (tuple2!20753 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun insertStrictlySorted!445 (List!27962 (_ BitVec 64) V!47887) List!27962)

(assert (=> d!137985 (= lt!567137 (insertStrictlySorted!445 (toList!9328 lt!566986) (_1!10387 (tuple2!20753 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10387 (tuple2!20753 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(assert (=> d!137985 (= (+!4223 lt!566986 (tuple2!20753 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) lt!567135)))

(declare-fun b!1254777 () Bool)

(declare-fun res!836618 () Bool)

(assert (=> b!1254777 (=> (not res!836618) (not e!713058))))

(assert (=> b!1254777 (= res!836618 (= (getValueByKey!657 (toList!9328 lt!567135) (_1!10387 (tuple2!20753 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!707 (_2!10387 (tuple2!20753 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))))

(declare-fun b!1254778 () Bool)

(declare-fun contains!7497 (List!27962 tuple2!20752) Bool)

(assert (=> b!1254778 (= e!713058 (contains!7497 (toList!9328 lt!567135) (tuple2!20753 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(assert (= (and d!137985 res!836619) b!1254777))

(assert (= (and b!1254777 res!836618) b!1254778))

(declare-fun m!1155137 () Bool)

(assert (=> d!137985 m!1155137))

(declare-fun m!1155139 () Bool)

(assert (=> d!137985 m!1155139))

(declare-fun m!1155141 () Bool)

(assert (=> d!137985 m!1155141))

(declare-fun m!1155143 () Bool)

(assert (=> d!137985 m!1155143))

(declare-fun m!1155145 () Bool)

(assert (=> b!1254777 m!1155145))

(declare-fun m!1155147 () Bool)

(assert (=> b!1254778 m!1155147))

(assert (=> b!1254601 d!137985))

(declare-fun d!137987 () Bool)

(assert (=> d!137987 (= (-!2020 (+!4223 lt!566986 (tuple2!20753 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) #b1000000000000000000000000000000000000000000000000000000000000000) lt!566986)))

(declare-fun lt!567140 () Unit!41621)

(declare-fun choose!1865 (ListLongMap!18625 (_ BitVec 64) V!47887) Unit!41621)

(assert (=> d!137987 (= lt!567140 (choose!1865 lt!566986 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> d!137987 (not (contains!7496 lt!566986 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!137987 (= (addThenRemoveForNewKeyIsSame!309 lt!566986 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43) lt!567140)))

(declare-fun bs!35430 () Bool)

(assert (= bs!35430 d!137987))

(assert (=> bs!35430 m!1154965))

(assert (=> bs!35430 m!1154965))

(declare-fun m!1155149 () Bool)

(assert (=> bs!35430 m!1155149))

(declare-fun m!1155151 () Bool)

(assert (=> bs!35430 m!1155151))

(declare-fun m!1155153 () Bool)

(assert (=> bs!35430 m!1155153))

(assert (=> b!1254601 d!137987))

(declare-fun b!1254779 () Bool)

(declare-fun e!713066 () Bool)

(declare-fun lt!567159 () ListLongMap!18625)

(assert (=> b!1254779 (= e!713066 (= (apply!979 lt!567159 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun b!1254780 () Bool)

(declare-fun e!713065 () Bool)

(declare-fun call!61737 () Bool)

(assert (=> b!1254780 (= e!713065 (not call!61737))))

(declare-fun bm!61733 () Bool)

(assert (=> bm!61733 (= call!61737 (contains!7496 lt!567159 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1254781 () Bool)

(declare-fun e!713070 () ListLongMap!18625)

(declare-fun e!713062 () ListLongMap!18625)

(assert (=> b!1254781 (= e!713070 e!713062)))

(declare-fun c!122358 () Bool)

(assert (=> b!1254781 (= c!122358 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1254782 () Bool)

(declare-fun e!713060 () Bool)

(assert (=> b!1254782 (= e!713060 (validKeyInArray!0 (select (arr!39241 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61734 () Bool)

(declare-fun call!61738 () ListLongMap!18625)

(declare-fun call!61740 () ListLongMap!18625)

(assert (=> bm!61734 (= call!61738 call!61740)))

(declare-fun b!1254783 () Bool)

(declare-fun e!713063 () ListLongMap!18625)

(declare-fun call!61742 () ListLongMap!18625)

(assert (=> b!1254783 (= e!713063 call!61742)))

(declare-fun b!1254784 () Bool)

(declare-fun e!713069 () Bool)

(declare-fun call!61736 () Bool)

(assert (=> b!1254784 (= e!713069 (not call!61736))))

(declare-fun call!61741 () ListLongMap!18625)

(declare-fun c!122360 () Bool)

(declare-fun bm!61735 () Bool)

(assert (=> bm!61735 (= call!61741 (+!4223 (ite c!122360 call!61740 (ite c!122358 call!61738 call!61742)) (ite (or c!122360 c!122358) (tuple2!20753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!20753 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun bm!61736 () Bool)

(assert (=> bm!61736 (= call!61736 (contains!7496 lt!567159 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1254785 () Bool)

(declare-fun res!836628 () Bool)

(declare-fun e!713068 () Bool)

(assert (=> b!1254785 (=> (not res!836628) (not e!713068))))

(declare-fun e!713064 () Bool)

(assert (=> b!1254785 (= res!836628 e!713064)))

(declare-fun res!836620 () Bool)

(assert (=> b!1254785 (=> res!836620 e!713064)))

(assert (=> b!1254785 (= res!836620 (not e!713060))))

(declare-fun res!836623 () Bool)

(assert (=> b!1254785 (=> (not res!836623) (not e!713060))))

(assert (=> b!1254785 (= res!836623 (bvslt #b00000000000000000000000000000000 (size!39779 _keys!1118)))))

(declare-fun b!1254786 () Bool)

(declare-fun e!713061 () Bool)

(assert (=> b!1254786 (= e!713061 (= (apply!979 lt!567159 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1254787 () Bool)

(assert (=> b!1254787 (= e!713065 e!713061)))

(declare-fun res!836621 () Bool)

(assert (=> b!1254787 (= res!836621 call!61737)))

(assert (=> b!1254787 (=> (not res!836621) (not e!713061))))

(declare-fun b!1254788 () Bool)

(declare-fun e!713067 () Unit!41621)

(declare-fun lt!567151 () Unit!41621)

(assert (=> b!1254788 (= e!713067 lt!567151)))

(declare-fun lt!567162 () ListLongMap!18625)

(assert (=> b!1254788 (= lt!567162 (getCurrentListMapNoExtraKeys!5723 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!567150 () (_ BitVec 64))

(assert (=> b!1254788 (= lt!567150 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!567155 () (_ BitVec 64))

(assert (=> b!1254788 (= lt!567155 (select (arr!39241 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!567152 () Unit!41621)

(assert (=> b!1254788 (= lt!567152 (addStillContains!1079 lt!567162 lt!567150 zeroValue!871 lt!567155))))

(assert (=> b!1254788 (contains!7496 (+!4223 lt!567162 (tuple2!20753 lt!567150 zeroValue!871)) lt!567155)))

(declare-fun lt!567160 () Unit!41621)

(assert (=> b!1254788 (= lt!567160 lt!567152)))

(declare-fun lt!567161 () ListLongMap!18625)

(assert (=> b!1254788 (= lt!567161 (getCurrentListMapNoExtraKeys!5723 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!567142 () (_ BitVec 64))

(assert (=> b!1254788 (= lt!567142 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!567146 () (_ BitVec 64))

(assert (=> b!1254788 (= lt!567146 (select (arr!39241 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!567148 () Unit!41621)

(assert (=> b!1254788 (= lt!567148 (addApplyDifferent!522 lt!567161 lt!567142 minValueBefore!43 lt!567146))))

(assert (=> b!1254788 (= (apply!979 (+!4223 lt!567161 (tuple2!20753 lt!567142 minValueBefore!43)) lt!567146) (apply!979 lt!567161 lt!567146))))

(declare-fun lt!567144 () Unit!41621)

(assert (=> b!1254788 (= lt!567144 lt!567148)))

(declare-fun lt!567143 () ListLongMap!18625)

(assert (=> b!1254788 (= lt!567143 (getCurrentListMapNoExtraKeys!5723 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!567158 () (_ BitVec 64))

(assert (=> b!1254788 (= lt!567158 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!567147 () (_ BitVec 64))

(assert (=> b!1254788 (= lt!567147 (select (arr!39241 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!567153 () Unit!41621)

(assert (=> b!1254788 (= lt!567153 (addApplyDifferent!522 lt!567143 lt!567158 zeroValue!871 lt!567147))))

(assert (=> b!1254788 (= (apply!979 (+!4223 lt!567143 (tuple2!20753 lt!567158 zeroValue!871)) lt!567147) (apply!979 lt!567143 lt!567147))))

(declare-fun lt!567141 () Unit!41621)

(assert (=> b!1254788 (= lt!567141 lt!567153)))

(declare-fun lt!567149 () ListLongMap!18625)

(assert (=> b!1254788 (= lt!567149 (getCurrentListMapNoExtraKeys!5723 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!567157 () (_ BitVec 64))

(assert (=> b!1254788 (= lt!567157 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!567145 () (_ BitVec 64))

(assert (=> b!1254788 (= lt!567145 (select (arr!39241 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1254788 (= lt!567151 (addApplyDifferent!522 lt!567149 lt!567157 minValueBefore!43 lt!567145))))

(assert (=> b!1254788 (= (apply!979 (+!4223 lt!567149 (tuple2!20753 lt!567157 minValueBefore!43)) lt!567145) (apply!979 lt!567149 lt!567145))))

(declare-fun b!1254789 () Bool)

(declare-fun call!61739 () ListLongMap!18625)

(assert (=> b!1254789 (= e!713063 call!61739)))

(declare-fun b!1254790 () Bool)

(assert (=> b!1254790 (= e!713069 e!713066)))

(declare-fun res!836624 () Bool)

(assert (=> b!1254790 (= res!836624 call!61736)))

(assert (=> b!1254790 (=> (not res!836624) (not e!713066))))

(declare-fun b!1254791 () Bool)

(assert (=> b!1254791 (= e!713068 e!713069)))

(declare-fun c!122361 () Bool)

(assert (=> b!1254791 (= c!122361 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1254792 () Bool)

(declare-fun c!122362 () Bool)

(assert (=> b!1254792 (= c!122362 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1254792 (= e!713062 e!713063)))

(declare-fun bm!61737 () Bool)

(assert (=> bm!61737 (= call!61742 call!61738)))

(declare-fun b!1254793 () Bool)

(assert (=> b!1254793 (= e!713070 (+!4223 call!61741 (tuple2!20753 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun b!1254794 () Bool)

(declare-fun e!713059 () Bool)

(assert (=> b!1254794 (= e!713064 e!713059)))

(declare-fun res!836627 () Bool)

(assert (=> b!1254794 (=> (not res!836627) (not e!713059))))

(assert (=> b!1254794 (= res!836627 (contains!7496 lt!567159 (select (arr!39241 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1254794 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39779 _keys!1118)))))

(declare-fun bm!61738 () Bool)

(assert (=> bm!61738 (= call!61739 call!61741)))

(declare-fun b!1254795 () Bool)

(declare-fun Unit!41626 () Unit!41621)

(assert (=> b!1254795 (= e!713067 Unit!41626)))

(declare-fun d!137989 () Bool)

(assert (=> d!137989 e!713068))

(declare-fun res!836622 () Bool)

(assert (=> d!137989 (=> (not res!836622) (not e!713068))))

(assert (=> d!137989 (= res!836622 (or (bvsge #b00000000000000000000000000000000 (size!39779 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39779 _keys!1118)))))))

(declare-fun lt!567156 () ListLongMap!18625)

(assert (=> d!137989 (= lt!567159 lt!567156)))

(declare-fun lt!567154 () Unit!41621)

(assert (=> d!137989 (= lt!567154 e!713067)))

(declare-fun c!122357 () Bool)

(declare-fun e!713071 () Bool)

(assert (=> d!137989 (= c!122357 e!713071)))

(declare-fun res!836625 () Bool)

(assert (=> d!137989 (=> (not res!836625) (not e!713071))))

(assert (=> d!137989 (= res!836625 (bvslt #b00000000000000000000000000000000 (size!39779 _keys!1118)))))

(assert (=> d!137989 (= lt!567156 e!713070)))

(assert (=> d!137989 (= c!122360 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!137989 (validMask!0 mask!1466)))

(assert (=> d!137989 (= (getCurrentListMap!4459 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!567159)))

(declare-fun b!1254796 () Bool)

(assert (=> b!1254796 (= e!713071 (validKeyInArray!0 (select (arr!39241 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1254797 () Bool)

(assert (=> b!1254797 (= e!713059 (= (apply!979 lt!567159 (select (arr!39241 _keys!1118) #b00000000000000000000000000000000)) (get!20102 (select (arr!39242 _values!914) #b00000000000000000000000000000000) (dynLambda!3409 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1254797 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39780 _values!914)))))

(assert (=> b!1254797 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39779 _keys!1118)))))

(declare-fun b!1254798 () Bool)

(declare-fun res!836626 () Bool)

(assert (=> b!1254798 (=> (not res!836626) (not e!713068))))

(assert (=> b!1254798 (= res!836626 e!713065)))

(declare-fun c!122359 () Bool)

(assert (=> b!1254798 (= c!122359 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!61739 () Bool)

(assert (=> bm!61739 (= call!61740 (getCurrentListMapNoExtraKeys!5723 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254799 () Bool)

(assert (=> b!1254799 (= e!713062 call!61739)))

(assert (= (and d!137989 c!122360) b!1254793))

(assert (= (and d!137989 (not c!122360)) b!1254781))

(assert (= (and b!1254781 c!122358) b!1254799))

(assert (= (and b!1254781 (not c!122358)) b!1254792))

(assert (= (and b!1254792 c!122362) b!1254789))

(assert (= (and b!1254792 (not c!122362)) b!1254783))

(assert (= (or b!1254789 b!1254783) bm!61737))

(assert (= (or b!1254799 bm!61737) bm!61734))

(assert (= (or b!1254799 b!1254789) bm!61738))

(assert (= (or b!1254793 bm!61734) bm!61739))

(assert (= (or b!1254793 bm!61738) bm!61735))

(assert (= (and d!137989 res!836625) b!1254796))

(assert (= (and d!137989 c!122357) b!1254788))

(assert (= (and d!137989 (not c!122357)) b!1254795))

(assert (= (and d!137989 res!836622) b!1254785))

(assert (= (and b!1254785 res!836623) b!1254782))

(assert (= (and b!1254785 (not res!836620)) b!1254794))

(assert (= (and b!1254794 res!836627) b!1254797))

(assert (= (and b!1254785 res!836628) b!1254798))

(assert (= (and b!1254798 c!122359) b!1254787))

(assert (= (and b!1254798 (not c!122359)) b!1254780))

(assert (= (and b!1254787 res!836621) b!1254786))

(assert (= (or b!1254787 b!1254780) bm!61733))

(assert (= (and b!1254798 res!836626) b!1254791))

(assert (= (and b!1254791 c!122361) b!1254790))

(assert (= (and b!1254791 (not c!122361)) b!1254784))

(assert (= (and b!1254790 res!836624) b!1254779))

(assert (= (or b!1254790 b!1254784) bm!61736))

(declare-fun b_lambda!22627 () Bool)

(assert (=> (not b_lambda!22627) (not b!1254797)))

(assert (=> b!1254797 t!41441))

(declare-fun b_and!44813 () Bool)

(assert (= b_and!44811 (and (=> t!41441 result!23297) b_and!44813)))

(declare-fun m!1155155 () Bool)

(assert (=> b!1254779 m!1155155))

(assert (=> bm!61739 m!1154975))

(assert (=> b!1254794 m!1155043))

(assert (=> b!1254794 m!1155043))

(declare-fun m!1155157 () Bool)

(assert (=> b!1254794 m!1155157))

(assert (=> b!1254796 m!1155043))

(assert (=> b!1254796 m!1155043))

(assert (=> b!1254796 m!1155049))

(declare-fun m!1155159 () Bool)

(assert (=> bm!61736 m!1155159))

(assert (=> b!1254797 m!1155057))

(assert (=> b!1254797 m!1155051))

(assert (=> b!1254797 m!1155043))

(assert (=> b!1254797 m!1155051))

(assert (=> b!1254797 m!1155057))

(assert (=> b!1254797 m!1155059))

(assert (=> b!1254797 m!1155043))

(declare-fun m!1155161 () Bool)

(assert (=> b!1254797 m!1155161))

(declare-fun m!1155163 () Bool)

(assert (=> b!1254786 m!1155163))

(declare-fun m!1155165 () Bool)

(assert (=> bm!61735 m!1155165))

(assert (=> d!137989 m!1154953))

(declare-fun m!1155167 () Bool)

(assert (=> b!1254788 m!1155167))

(assert (=> b!1254788 m!1155167))

(declare-fun m!1155169 () Bool)

(assert (=> b!1254788 m!1155169))

(declare-fun m!1155171 () Bool)

(assert (=> b!1254788 m!1155171))

(assert (=> b!1254788 m!1155171))

(declare-fun m!1155173 () Bool)

(assert (=> b!1254788 m!1155173))

(declare-fun m!1155175 () Bool)

(assert (=> b!1254788 m!1155175))

(declare-fun m!1155177 () Bool)

(assert (=> b!1254788 m!1155177))

(declare-fun m!1155179 () Bool)

(assert (=> b!1254788 m!1155179))

(assert (=> b!1254788 m!1154975))

(assert (=> b!1254788 m!1155179))

(declare-fun m!1155181 () Bool)

(assert (=> b!1254788 m!1155181))

(declare-fun m!1155183 () Bool)

(assert (=> b!1254788 m!1155183))

(declare-fun m!1155185 () Bool)

(assert (=> b!1254788 m!1155185))

(declare-fun m!1155187 () Bool)

(assert (=> b!1254788 m!1155187))

(assert (=> b!1254788 m!1155043))

(declare-fun m!1155189 () Bool)

(assert (=> b!1254788 m!1155189))

(declare-fun m!1155191 () Bool)

(assert (=> b!1254788 m!1155191))

(assert (=> b!1254788 m!1155187))

(declare-fun m!1155193 () Bool)

(assert (=> b!1254788 m!1155193))

(declare-fun m!1155195 () Bool)

(assert (=> b!1254788 m!1155195))

(declare-fun m!1155197 () Bool)

(assert (=> b!1254793 m!1155197))

(assert (=> b!1254782 m!1155043))

(assert (=> b!1254782 m!1155043))

(assert (=> b!1254782 m!1155049))

(declare-fun m!1155199 () Bool)

(assert (=> bm!61733 m!1155199))

(assert (=> b!1254601 d!137989))

(declare-fun d!137991 () Bool)

(declare-fun lt!567165 () ListLongMap!18625)

(assert (=> d!137991 (not (contains!7496 lt!567165 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!139 (List!27962 (_ BitVec 64)) List!27962)

(assert (=> d!137991 (= lt!567165 (ListLongMap!18626 (removeStrictlySorted!139 (toList!9328 lt!566980) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!137991 (= (-!2020 lt!566980 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567165)))

(declare-fun bs!35431 () Bool)

(assert (= bs!35431 d!137991))

(declare-fun m!1155201 () Bool)

(assert (=> bs!35431 m!1155201))

(declare-fun m!1155203 () Bool)

(assert (=> bs!35431 m!1155203))

(assert (=> b!1254601 d!137991))

(declare-fun d!137993 () Bool)

(declare-fun lt!567166 () ListLongMap!18625)

(assert (=> d!137993 (not (contains!7496 lt!567166 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!137993 (= lt!567166 (ListLongMap!18626 (removeStrictlySorted!139 (toList!9328 lt!566984) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!137993 (= (-!2020 lt!566984 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567166)))

(declare-fun bs!35432 () Bool)

(assert (= bs!35432 d!137993))

(declare-fun m!1155205 () Bool)

(assert (=> bs!35432 m!1155205))

(declare-fun m!1155207 () Bool)

(assert (=> bs!35432 m!1155207))

(assert (=> b!1254601 d!137993))

(declare-fun b!1254808 () Bool)

(declare-fun e!713079 () Bool)

(declare-fun call!61745 () Bool)

(assert (=> b!1254808 (= e!713079 call!61745)))

(declare-fun b!1254809 () Bool)

(declare-fun e!713080 () Bool)

(assert (=> b!1254809 (= e!713080 e!713079)))

(declare-fun c!122365 () Bool)

(assert (=> b!1254809 (= c!122365 (validKeyInArray!0 (select (arr!39241 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1254810 () Bool)

(declare-fun e!713078 () Bool)

(assert (=> b!1254810 (= e!713078 call!61745)))

(declare-fun b!1254811 () Bool)

(assert (=> b!1254811 (= e!713079 e!713078)))

(declare-fun lt!567173 () (_ BitVec 64))

(assert (=> b!1254811 (= lt!567173 (select (arr!39241 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!567174 () Unit!41621)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!81359 (_ BitVec 64) (_ BitVec 32)) Unit!41621)

(assert (=> b!1254811 (= lt!567174 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!567173 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!81359 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1254811 (arrayContainsKey!0 _keys!1118 lt!567173 #b00000000000000000000000000000000)))

(declare-fun lt!567175 () Unit!41621)

(assert (=> b!1254811 (= lt!567175 lt!567174)))

(declare-fun res!836633 () Bool)

(declare-datatypes ((SeekEntryResult!9963 0))(
  ( (MissingZero!9963 (index!42223 (_ BitVec 32))) (Found!9963 (index!42224 (_ BitVec 32))) (Intermediate!9963 (undefined!10775 Bool) (index!42225 (_ BitVec 32)) (x!110453 (_ BitVec 32))) (Undefined!9963) (MissingVacant!9963 (index!42226 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!81359 (_ BitVec 32)) SeekEntryResult!9963)

(assert (=> b!1254811 (= res!836633 (= (seekEntryOrOpen!0 (select (arr!39241 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9963 #b00000000000000000000000000000000)))))

(assert (=> b!1254811 (=> (not res!836633) (not e!713078))))

(declare-fun d!137995 () Bool)

(declare-fun res!836634 () Bool)

(assert (=> d!137995 (=> res!836634 e!713080)))

(assert (=> d!137995 (= res!836634 (bvsge #b00000000000000000000000000000000 (size!39779 _keys!1118)))))

(assert (=> d!137995 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!713080)))

(declare-fun bm!61742 () Bool)

(assert (=> bm!61742 (= call!61745 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(assert (= (and d!137995 (not res!836634)) b!1254809))

(assert (= (and b!1254809 c!122365) b!1254811))

(assert (= (and b!1254809 (not c!122365)) b!1254808))

(assert (= (and b!1254811 res!836633) b!1254810))

(assert (= (or b!1254810 b!1254808) bm!61742))

(assert (=> b!1254809 m!1155043))

(assert (=> b!1254809 m!1155043))

(assert (=> b!1254809 m!1155049))

(assert (=> b!1254811 m!1155043))

(declare-fun m!1155209 () Bool)

(assert (=> b!1254811 m!1155209))

(declare-fun m!1155211 () Bool)

(assert (=> b!1254811 m!1155211))

(assert (=> b!1254811 m!1155043))

(declare-fun m!1155213 () Bool)

(assert (=> b!1254811 m!1155213))

(declare-fun m!1155215 () Bool)

(assert (=> bm!61742 m!1155215))

(assert (=> b!1254597 d!137995))

(declare-fun b!1254822 () Bool)

(declare-fun e!713092 () Bool)

(declare-fun call!61748 () Bool)

(assert (=> b!1254822 (= e!713092 call!61748)))

(declare-fun b!1254824 () Bool)

(declare-fun e!713091 () Bool)

(declare-fun contains!7498 (List!27963 (_ BitVec 64)) Bool)

(assert (=> b!1254824 (= e!713091 (contains!7498 Nil!27960 (select (arr!39241 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1254825 () Bool)

(declare-fun e!713089 () Bool)

(assert (=> b!1254825 (= e!713089 e!713092)))

(declare-fun c!122368 () Bool)

(assert (=> b!1254825 (= c!122368 (validKeyInArray!0 (select (arr!39241 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1254826 () Bool)

(assert (=> b!1254826 (= e!713092 call!61748)))

(declare-fun bm!61745 () Bool)

(assert (=> bm!61745 (= call!61748 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122368 (Cons!27959 (select (arr!39241 _keys!1118) #b00000000000000000000000000000000) Nil!27960) Nil!27960)))))

(declare-fun b!1254823 () Bool)

(declare-fun e!713090 () Bool)

(assert (=> b!1254823 (= e!713090 e!713089)))

(declare-fun res!836643 () Bool)

(assert (=> b!1254823 (=> (not res!836643) (not e!713089))))

(assert (=> b!1254823 (= res!836643 (not e!713091))))

(declare-fun res!836641 () Bool)

(assert (=> b!1254823 (=> (not res!836641) (not e!713091))))

(assert (=> b!1254823 (= res!836641 (validKeyInArray!0 (select (arr!39241 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!137997 () Bool)

(declare-fun res!836642 () Bool)

(assert (=> d!137997 (=> res!836642 e!713090)))

(assert (=> d!137997 (= res!836642 (bvsge #b00000000000000000000000000000000 (size!39779 _keys!1118)))))

(assert (=> d!137997 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27960) e!713090)))

(assert (= (and d!137997 (not res!836642)) b!1254823))

(assert (= (and b!1254823 res!836641) b!1254824))

(assert (= (and b!1254823 res!836643) b!1254825))

(assert (= (and b!1254825 c!122368) b!1254826))

(assert (= (and b!1254825 (not c!122368)) b!1254822))

(assert (= (or b!1254826 b!1254822) bm!61745))

(assert (=> b!1254824 m!1155043))

(assert (=> b!1254824 m!1155043))

(declare-fun m!1155217 () Bool)

(assert (=> b!1254824 m!1155217))

(assert (=> b!1254825 m!1155043))

(assert (=> b!1254825 m!1155043))

(assert (=> b!1254825 m!1155049))

(assert (=> bm!61745 m!1155043))

(declare-fun m!1155219 () Bool)

(assert (=> bm!61745 m!1155219))

(assert (=> b!1254823 m!1155043))

(assert (=> b!1254823 m!1155043))

(assert (=> b!1254823 m!1155049))

(assert (=> b!1254603 d!137997))

(declare-fun mapIsEmpty!49624 () Bool)

(declare-fun mapRes!49624 () Bool)

(assert (=> mapIsEmpty!49624 mapRes!49624))

(declare-fun mapNonEmpty!49624 () Bool)

(declare-fun tp!94490 () Bool)

(declare-fun e!713097 () Bool)

(assert (=> mapNonEmpty!49624 (= mapRes!49624 (and tp!94490 e!713097))))

(declare-fun mapKey!49624 () (_ BitVec 32))

(declare-fun mapValue!49624 () ValueCell!15182)

(declare-fun mapRest!49624 () (Array (_ BitVec 32) ValueCell!15182))

(assert (=> mapNonEmpty!49624 (= mapRest!49615 (store mapRest!49624 mapKey!49624 mapValue!49624))))

(declare-fun b!1254834 () Bool)

(declare-fun e!713098 () Bool)

(assert (=> b!1254834 (= e!713098 tp_is_empty!31891)))

(declare-fun condMapEmpty!49624 () Bool)

(declare-fun mapDefault!49624 () ValueCell!15182)

(assert (=> mapNonEmpty!49615 (= condMapEmpty!49624 (= mapRest!49615 ((as const (Array (_ BitVec 32) ValueCell!15182)) mapDefault!49624)))))

(assert (=> mapNonEmpty!49615 (= tp!94474 (and e!713098 mapRes!49624))))

(declare-fun b!1254833 () Bool)

(assert (=> b!1254833 (= e!713097 tp_is_empty!31891)))

(assert (= (and mapNonEmpty!49615 condMapEmpty!49624) mapIsEmpty!49624))

(assert (= (and mapNonEmpty!49615 (not condMapEmpty!49624)) mapNonEmpty!49624))

(assert (= (and mapNonEmpty!49624 ((_ is ValueCellFull!15182) mapValue!49624)) b!1254833))

(assert (= (and mapNonEmpty!49615 ((_ is ValueCellFull!15182) mapDefault!49624)) b!1254834))

(declare-fun m!1155221 () Bool)

(assert (=> mapNonEmpty!49624 m!1155221))

(declare-fun b_lambda!22629 () Bool)

(assert (= b_lambda!22627 (or (and start!105290 b_free!26989) b_lambda!22629)))

(declare-fun b_lambda!22631 () Bool)

(assert (= b_lambda!22619 (or (and start!105290 b_free!26989) b_lambda!22631)))

(declare-fun b_lambda!22633 () Bool)

(assert (= b_lambda!22621 (or (and start!105290 b_free!26989) b_lambda!22633)))

(declare-fun b_lambda!22635 () Bool)

(assert (= b_lambda!22617 (or (and start!105290 b_free!26989) b_lambda!22635)))

(declare-fun b_lambda!22637 () Bool)

(assert (= b_lambda!22625 (or (and start!105290 b_free!26989) b_lambda!22637)))

(declare-fun b_lambda!22639 () Bool)

(assert (= b_lambda!22623 (or (and start!105290 b_free!26989) b_lambda!22639)))

(check-sat (not b!1254788) (not b_lambda!22629) (not bm!61732) (not b!1254752) (not b!1254766) (not b!1254705) (not bm!61739) (not b!1254685) (not b_lambda!22631) (not b!1254699) (not bm!61733) (not d!137989) (not bm!61742) (not b!1254797) (not b!1254688) (not b!1254698) (not b!1254824) (not b!1254708) (not b!1254779) (not b!1254770) (not b!1254761) (not b!1254684) (not b!1254703) (not d!137979) (not bm!61729) tp_is_empty!31891 (not d!137977) (not b!1254686) (not d!137987) (not b!1254811) b_and!44813 (not b!1254689) (not d!137993) (not bm!61735) (not d!137981) (not b!1254825) (not b!1254700) (not mapNonEmpty!49624) (not b!1254777) (not b!1254694) (not bm!61745) (not b!1254767) (not b!1254796) (not b!1254778) (not b!1254693) (not b!1254794) (not bm!61711) (not bm!61726) (not b!1254769) (not b!1254755) (not b!1254702) (not b_lambda!22637) (not b!1254786) (not b!1254809) (not b!1254782) (not d!137983) (not b!1254759) (not d!137985) (not b!1254793) (not bm!61710) (not bm!61736) (not b!1254823) (not b!1254707) (not bm!61728) (not b_lambda!22639) (not b_lambda!22633) (not b_next!26989) (not b_lambda!22635) (not d!137991) (not b!1254691))
(check-sat b_and!44813 (not b_next!26989))
