; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105930 () Bool)

(assert start!105930)

(declare-fun b_free!27459 () Bool)

(declare-fun b_next!27459 () Bool)

(assert (=> start!105930 (= b_free!27459 (not b_next!27459))))

(declare-fun tp!95911 () Bool)

(declare-fun b_and!45375 () Bool)

(assert (=> start!105930 (= tp!95911 b_and!45375)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((V!48513 0))(
  ( (V!48514 (val!16243 Int)) )
))
(declare-fun zeroValue!871 () V!48513)

(declare-datatypes ((ValueCell!15417 0))(
  ( (ValueCellFull!15417 (v!18947 V!48513)) (EmptyCell!15417) )
))
(declare-datatypes ((array!82338 0))(
  ( (array!82339 (arr!39721 (Array (_ BitVec 32) ValueCell!15417)) (size!40257 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82338)

(declare-fun minValueBefore!43 () V!48513)

(declare-fun e!718098 () Bool)

(declare-fun b!1261657 () Bool)

(declare-datatypes ((array!82340 0))(
  ( (array!82341 (arr!39722 (Array (_ BitVec 32) (_ BitVec 64))) (size!40258 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82340)

(declare-datatypes ((tuple2!21020 0))(
  ( (tuple2!21021 (_1!10521 (_ BitVec 64)) (_2!10521 V!48513)) )
))
(declare-datatypes ((List!28216 0))(
  ( (Nil!28213) (Cons!28212 (h!29421 tuple2!21020) (t!41717 List!28216)) )
))
(declare-datatypes ((ListLongMap!18893 0))(
  ( (ListLongMap!18894 (toList!9462 List!28216)) )
))
(declare-fun contains!7582 (ListLongMap!18893 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4632 (array!82340 array!82338 (_ BitVec 32) (_ BitVec 32) V!48513 V!48513 (_ BitVec 32) Int) ListLongMap!18893)

(assert (=> b!1261657 (= e!718098 (not (contains!7582 (getCurrentListMap!4632 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1261658 () Bool)

(declare-fun e!718101 () Bool)

(declare-fun tp_is_empty!32361 () Bool)

(assert (=> b!1261658 (= e!718101 tp_is_empty!32361)))

(declare-fun mapIsEmpty!50347 () Bool)

(declare-fun mapRes!50347 () Bool)

(assert (=> mapIsEmpty!50347 mapRes!50347))

(declare-fun b!1261659 () Bool)

(declare-fun e!718099 () Bool)

(declare-fun e!718096 () Bool)

(assert (=> b!1261659 (= e!718099 (and e!718096 mapRes!50347))))

(declare-fun condMapEmpty!50347 () Bool)

(declare-fun mapDefault!50347 () ValueCell!15417)

(assert (=> b!1261659 (= condMapEmpty!50347 (= (arr!39721 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15417)) mapDefault!50347)))))

(declare-fun b!1261660 () Bool)

(declare-fun res!840683 () Bool)

(declare-fun e!718097 () Bool)

(assert (=> b!1261660 (=> (not res!840683) (not e!718097))))

(declare-datatypes ((List!28217 0))(
  ( (Nil!28214) (Cons!28213 (h!29422 (_ BitVec 64)) (t!41718 List!28217)) )
))
(declare-fun arrayNoDuplicates!0 (array!82340 (_ BitVec 32) List!28217) Bool)

(assert (=> b!1261660 (= res!840683 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28214))))

(declare-fun b!1261661 () Bool)

(declare-fun res!840686 () Bool)

(assert (=> b!1261661 (=> (not res!840686) (not e!718097))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82340 (_ BitVec 32)) Bool)

(assert (=> b!1261661 (= res!840686 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!840684 () Bool)

(assert (=> start!105930 (=> (not res!840684) (not e!718097))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105930 (= res!840684 (validMask!0 mask!1466))))

(assert (=> start!105930 e!718097))

(assert (=> start!105930 true))

(assert (=> start!105930 tp!95911))

(assert (=> start!105930 tp_is_empty!32361))

(declare-fun array_inv!30237 (array!82340) Bool)

(assert (=> start!105930 (array_inv!30237 _keys!1118)))

(declare-fun array_inv!30238 (array!82338) Bool)

(assert (=> start!105930 (and (array_inv!30238 _values!914) e!718099)))

(declare-fun b!1261662 () Bool)

(declare-fun res!840685 () Bool)

(assert (=> b!1261662 (=> (not res!840685) (not e!718097))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1261662 (= res!840685 (and (= (size!40257 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40258 _keys!1118) (size!40257 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!50347 () Bool)

(declare-fun tp!95912 () Bool)

(assert (=> mapNonEmpty!50347 (= mapRes!50347 (and tp!95912 e!718101))))

(declare-fun mapValue!50347 () ValueCell!15417)

(declare-fun mapKey!50347 () (_ BitVec 32))

(declare-fun mapRest!50347 () (Array (_ BitVec 32) ValueCell!15417))

(assert (=> mapNonEmpty!50347 (= (arr!39721 _values!914) (store mapRest!50347 mapKey!50347 mapValue!50347))))

(declare-fun b!1261663 () Bool)

(assert (=> b!1261663 (= e!718096 tp_is_empty!32361)))

(declare-fun b!1261664 () Bool)

(assert (=> b!1261664 (= e!718097 (not e!718098))))

(declare-fun res!840682 () Bool)

(assert (=> b!1261664 (=> res!840682 e!718098)))

(assert (=> b!1261664 (= res!840682 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!571706 () ListLongMap!18893)

(declare-fun lt!571708 () ListLongMap!18893)

(assert (=> b!1261664 (= lt!571706 lt!571708)))

(declare-fun minValueAfter!43 () V!48513)

(declare-datatypes ((Unit!42063 0))(
  ( (Unit!42064) )
))
(declare-fun lt!571707 () Unit!42063)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1171 (array!82340 array!82338 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48513 V!48513 V!48513 V!48513 (_ BitVec 32) Int) Unit!42063)

(assert (=> b!1261664 (= lt!571707 (lemmaNoChangeToArrayThenSameMapNoExtras!1171 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5829 (array!82340 array!82338 (_ BitVec 32) (_ BitVec 32) V!48513 V!48513 (_ BitVec 32) Int) ListLongMap!18893)

(assert (=> b!1261664 (= lt!571708 (getCurrentListMapNoExtraKeys!5829 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1261664 (= lt!571706 (getCurrentListMapNoExtraKeys!5829 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105930 res!840684) b!1261662))

(assert (= (and b!1261662 res!840685) b!1261661))

(assert (= (and b!1261661 res!840686) b!1261660))

(assert (= (and b!1261660 res!840683) b!1261664))

(assert (= (and b!1261664 (not res!840682)) b!1261657))

(assert (= (and b!1261659 condMapEmpty!50347) mapIsEmpty!50347))

(assert (= (and b!1261659 (not condMapEmpty!50347)) mapNonEmpty!50347))

(get-info :version)

(assert (= (and mapNonEmpty!50347 ((_ is ValueCellFull!15417) mapValue!50347)) b!1261658))

(assert (= (and b!1261659 ((_ is ValueCellFull!15417) mapDefault!50347)) b!1261663))

(assert (= start!105930 b!1261659))

(declare-fun m!1162231 () Bool)

(assert (=> start!105930 m!1162231))

(declare-fun m!1162233 () Bool)

(assert (=> start!105930 m!1162233))

(declare-fun m!1162235 () Bool)

(assert (=> start!105930 m!1162235))

(declare-fun m!1162237 () Bool)

(assert (=> b!1261660 m!1162237))

(declare-fun m!1162239 () Bool)

(assert (=> mapNonEmpty!50347 m!1162239))

(declare-fun m!1162241 () Bool)

(assert (=> b!1261661 m!1162241))

(declare-fun m!1162243 () Bool)

(assert (=> b!1261664 m!1162243))

(declare-fun m!1162245 () Bool)

(assert (=> b!1261664 m!1162245))

(declare-fun m!1162247 () Bool)

(assert (=> b!1261664 m!1162247))

(declare-fun m!1162249 () Bool)

(assert (=> b!1261657 m!1162249))

(assert (=> b!1261657 m!1162249))

(declare-fun m!1162251 () Bool)

(assert (=> b!1261657 m!1162251))

(check-sat tp_is_empty!32361 (not b!1261661) b_and!45375 (not b!1261660) (not b!1261657) (not b_next!27459) (not mapNonEmpty!50347) (not start!105930) (not b!1261664))
(check-sat b_and!45375 (not b_next!27459))
(get-model)

(declare-fun d!138463 () Bool)

(assert (=> d!138463 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!105930 d!138463))

(declare-fun d!138465 () Bool)

(assert (=> d!138465 (= (array_inv!30237 _keys!1118) (bvsge (size!40258 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!105930 d!138465))

(declare-fun d!138467 () Bool)

(assert (=> d!138467 (= (array_inv!30238 _values!914) (bvsge (size!40257 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!105930 d!138467))

(declare-fun d!138469 () Bool)

(assert (=> d!138469 (= (getCurrentListMapNoExtraKeys!5829 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5829 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571720 () Unit!42063)

(declare-fun choose!1868 (array!82340 array!82338 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48513 V!48513 V!48513 V!48513 (_ BitVec 32) Int) Unit!42063)

(assert (=> d!138469 (= lt!571720 (choose!1868 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138469 (validMask!0 mask!1466)))

(assert (=> d!138469 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1171 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!571720)))

(declare-fun bs!35712 () Bool)

(assert (= bs!35712 d!138469))

(assert (=> bs!35712 m!1162247))

(assert (=> bs!35712 m!1162245))

(declare-fun m!1162275 () Bool)

(assert (=> bs!35712 m!1162275))

(assert (=> bs!35712 m!1162231))

(assert (=> b!1261664 d!138469))

(declare-fun d!138471 () Bool)

(declare-fun e!718139 () Bool)

(assert (=> d!138471 e!718139))

(declare-fun res!840713 () Bool)

(assert (=> d!138471 (=> (not res!840713) (not e!718139))))

(declare-fun lt!571741 () ListLongMap!18893)

(assert (=> d!138471 (= res!840713 (not (contains!7582 lt!571741 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!718138 () ListLongMap!18893)

(assert (=> d!138471 (= lt!571741 e!718138)))

(declare-fun c!122682 () Bool)

(assert (=> d!138471 (= c!122682 (bvsge #b00000000000000000000000000000000 (size!40258 _keys!1118)))))

(assert (=> d!138471 (validMask!0 mask!1466)))

(assert (=> d!138471 (= (getCurrentListMapNoExtraKeys!5829 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!571741)))

(declare-fun e!718135 () Bool)

(declare-fun b!1261713 () Bool)

(assert (=> b!1261713 (= e!718135 (= lt!571741 (getCurrentListMapNoExtraKeys!5829 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1261714 () Bool)

(declare-fun e!718137 () Bool)

(assert (=> b!1261714 (= e!718137 e!718135)))

(declare-fun c!122680 () Bool)

(assert (=> b!1261714 (= c!122680 (bvslt #b00000000000000000000000000000000 (size!40258 _keys!1118)))))

(declare-fun b!1261715 () Bool)

(declare-fun res!840712 () Bool)

(assert (=> b!1261715 (=> (not res!840712) (not e!718139))))

(assert (=> b!1261715 (= res!840712 (not (contains!7582 lt!571741 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun call!61969 () ListLongMap!18893)

(declare-fun bm!61966 () Bool)

(assert (=> bm!61966 (= call!61969 (getCurrentListMapNoExtraKeys!5829 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1261716 () Bool)

(assert (=> b!1261716 (= e!718139 e!718137)))

(declare-fun c!122681 () Bool)

(declare-fun e!718134 () Bool)

(assert (=> b!1261716 (= c!122681 e!718134)))

(declare-fun res!840711 () Bool)

(assert (=> b!1261716 (=> (not res!840711) (not e!718134))))

(assert (=> b!1261716 (= res!840711 (bvslt #b00000000000000000000000000000000 (size!40258 _keys!1118)))))

(declare-fun b!1261717 () Bool)

(declare-fun e!718136 () ListLongMap!18893)

(assert (=> b!1261717 (= e!718138 e!718136)))

(declare-fun c!122679 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1261717 (= c!122679 (validKeyInArray!0 (select (arr!39722 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1261718 () Bool)

(assert (=> b!1261718 (= e!718138 (ListLongMap!18894 Nil!28213))))

(declare-fun b!1261719 () Bool)

(assert (=> b!1261719 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40258 _keys!1118)))))

(assert (=> b!1261719 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40257 _values!914)))))

(declare-fun e!718140 () Bool)

(declare-fun apply!995 (ListLongMap!18893 (_ BitVec 64)) V!48513)

(declare-fun get!20266 (ValueCell!15417 V!48513) V!48513)

(declare-fun dynLambda!3393 (Int (_ BitVec 64)) V!48513)

(assert (=> b!1261719 (= e!718140 (= (apply!995 lt!571741 (select (arr!39722 _keys!1118) #b00000000000000000000000000000000)) (get!20266 (select (arr!39721 _values!914) #b00000000000000000000000000000000) (dynLambda!3393 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1261720 () Bool)

(declare-fun isEmpty!1037 (ListLongMap!18893) Bool)

(assert (=> b!1261720 (= e!718135 (isEmpty!1037 lt!571741))))

(declare-fun b!1261721 () Bool)

(assert (=> b!1261721 (= e!718136 call!61969)))

(declare-fun b!1261722 () Bool)

(declare-fun lt!571738 () Unit!42063)

(declare-fun lt!571739 () Unit!42063)

(assert (=> b!1261722 (= lt!571738 lt!571739)))

(declare-fun lt!571740 () ListLongMap!18893)

(declare-fun lt!571735 () (_ BitVec 64))

(declare-fun lt!571737 () (_ BitVec 64))

(declare-fun lt!571736 () V!48513)

(declare-fun +!4241 (ListLongMap!18893 tuple2!21020) ListLongMap!18893)

(assert (=> b!1261722 (not (contains!7582 (+!4241 lt!571740 (tuple2!21021 lt!571737 lt!571736)) lt!571735))))

(declare-fun addStillNotContains!323 (ListLongMap!18893 (_ BitVec 64) V!48513 (_ BitVec 64)) Unit!42063)

(assert (=> b!1261722 (= lt!571739 (addStillNotContains!323 lt!571740 lt!571737 lt!571736 lt!571735))))

(assert (=> b!1261722 (= lt!571735 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1261722 (= lt!571736 (get!20266 (select (arr!39721 _values!914) #b00000000000000000000000000000000) (dynLambda!3393 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1261722 (= lt!571737 (select (arr!39722 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1261722 (= lt!571740 call!61969)))

(assert (=> b!1261722 (= e!718136 (+!4241 call!61969 (tuple2!21021 (select (arr!39722 _keys!1118) #b00000000000000000000000000000000) (get!20266 (select (arr!39721 _values!914) #b00000000000000000000000000000000) (dynLambda!3393 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1261723 () Bool)

(assert (=> b!1261723 (= e!718134 (validKeyInArray!0 (select (arr!39722 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1261723 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1261724 () Bool)

(assert (=> b!1261724 (= e!718137 e!718140)))

(assert (=> b!1261724 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40258 _keys!1118)))))

(declare-fun res!840710 () Bool)

(assert (=> b!1261724 (= res!840710 (contains!7582 lt!571741 (select (arr!39722 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1261724 (=> (not res!840710) (not e!718140))))

(assert (= (and d!138471 c!122682) b!1261718))

(assert (= (and d!138471 (not c!122682)) b!1261717))

(assert (= (and b!1261717 c!122679) b!1261722))

(assert (= (and b!1261717 (not c!122679)) b!1261721))

(assert (= (or b!1261722 b!1261721) bm!61966))

(assert (= (and d!138471 res!840713) b!1261715))

(assert (= (and b!1261715 res!840712) b!1261716))

(assert (= (and b!1261716 res!840711) b!1261723))

(assert (= (and b!1261716 c!122681) b!1261724))

(assert (= (and b!1261716 (not c!122681)) b!1261714))

(assert (= (and b!1261724 res!840710) b!1261719))

(assert (= (and b!1261714 c!122680) b!1261713))

(assert (= (and b!1261714 (not c!122680)) b!1261720))

(declare-fun b_lambda!22807 () Bool)

(assert (=> (not b_lambda!22807) (not b!1261719)))

(declare-fun t!41721 () Bool)

(declare-fun tb!11317 () Bool)

(assert (=> (and start!105930 (= defaultEntry!922 defaultEntry!922) t!41721) tb!11317))

(declare-fun result!23359 () Bool)

(assert (=> tb!11317 (= result!23359 tp_is_empty!32361)))

(assert (=> b!1261719 t!41721))

(declare-fun b_and!45379 () Bool)

(assert (= b_and!45375 (and (=> t!41721 result!23359) b_and!45379)))

(declare-fun b_lambda!22809 () Bool)

(assert (=> (not b_lambda!22809) (not b!1261722)))

(assert (=> b!1261722 t!41721))

(declare-fun b_and!45381 () Bool)

(assert (= b_and!45379 (and (=> t!41721 result!23359) b_and!45381)))

(declare-fun m!1162277 () Bool)

(assert (=> b!1261722 m!1162277))

(assert (=> b!1261722 m!1162277))

(declare-fun m!1162279 () Bool)

(assert (=> b!1261722 m!1162279))

(declare-fun m!1162281 () Bool)

(assert (=> b!1261722 m!1162281))

(declare-fun m!1162283 () Bool)

(assert (=> b!1261722 m!1162283))

(declare-fun m!1162285 () Bool)

(assert (=> b!1261722 m!1162285))

(declare-fun m!1162287 () Bool)

(assert (=> b!1261722 m!1162287))

(assert (=> b!1261722 m!1162281))

(assert (=> b!1261722 m!1162285))

(declare-fun m!1162289 () Bool)

(assert (=> b!1261722 m!1162289))

(declare-fun m!1162291 () Bool)

(assert (=> b!1261722 m!1162291))

(declare-fun m!1162293 () Bool)

(assert (=> b!1261715 m!1162293))

(declare-fun m!1162295 () Bool)

(assert (=> b!1261713 m!1162295))

(assert (=> b!1261723 m!1162291))

(assert (=> b!1261723 m!1162291))

(declare-fun m!1162297 () Bool)

(assert (=> b!1261723 m!1162297))

(assert (=> b!1261724 m!1162291))

(assert (=> b!1261724 m!1162291))

(declare-fun m!1162299 () Bool)

(assert (=> b!1261724 m!1162299))

(declare-fun m!1162301 () Bool)

(assert (=> d!138471 m!1162301))

(assert (=> d!138471 m!1162231))

(assert (=> b!1261719 m!1162291))

(declare-fun m!1162303 () Bool)

(assert (=> b!1261719 m!1162303))

(assert (=> b!1261719 m!1162281))

(assert (=> b!1261719 m!1162285))

(assert (=> b!1261719 m!1162281))

(assert (=> b!1261719 m!1162285))

(assert (=> b!1261719 m!1162289))

(assert (=> b!1261719 m!1162291))

(assert (=> b!1261717 m!1162291))

(assert (=> b!1261717 m!1162291))

(assert (=> b!1261717 m!1162297))

(declare-fun m!1162305 () Bool)

(assert (=> b!1261720 m!1162305))

(assert (=> bm!61966 m!1162295))

(assert (=> b!1261664 d!138471))

(declare-fun d!138473 () Bool)

(declare-fun e!718146 () Bool)

(assert (=> d!138473 e!718146))

(declare-fun res!840717 () Bool)

(assert (=> d!138473 (=> (not res!840717) (not e!718146))))

(declare-fun lt!571748 () ListLongMap!18893)

(assert (=> d!138473 (= res!840717 (not (contains!7582 lt!571748 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!718145 () ListLongMap!18893)

(assert (=> d!138473 (= lt!571748 e!718145)))

(declare-fun c!122686 () Bool)

(assert (=> d!138473 (= c!122686 (bvsge #b00000000000000000000000000000000 (size!40258 _keys!1118)))))

(assert (=> d!138473 (validMask!0 mask!1466)))

(assert (=> d!138473 (= (getCurrentListMapNoExtraKeys!5829 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!571748)))

(declare-fun b!1261727 () Bool)

(declare-fun e!718142 () Bool)

(assert (=> b!1261727 (= e!718142 (= lt!571748 (getCurrentListMapNoExtraKeys!5829 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1261728 () Bool)

(declare-fun e!718144 () Bool)

(assert (=> b!1261728 (= e!718144 e!718142)))

(declare-fun c!122684 () Bool)

(assert (=> b!1261728 (= c!122684 (bvslt #b00000000000000000000000000000000 (size!40258 _keys!1118)))))

(declare-fun b!1261729 () Bool)

(declare-fun res!840716 () Bool)

(assert (=> b!1261729 (=> (not res!840716) (not e!718146))))

(assert (=> b!1261729 (= res!840716 (not (contains!7582 lt!571748 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!61967 () Bool)

(declare-fun call!61970 () ListLongMap!18893)

(assert (=> bm!61967 (= call!61970 (getCurrentListMapNoExtraKeys!5829 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1261730 () Bool)

(assert (=> b!1261730 (= e!718146 e!718144)))

(declare-fun c!122685 () Bool)

(declare-fun e!718141 () Bool)

(assert (=> b!1261730 (= c!122685 e!718141)))

(declare-fun res!840715 () Bool)

(assert (=> b!1261730 (=> (not res!840715) (not e!718141))))

(assert (=> b!1261730 (= res!840715 (bvslt #b00000000000000000000000000000000 (size!40258 _keys!1118)))))

(declare-fun b!1261731 () Bool)

(declare-fun e!718143 () ListLongMap!18893)

(assert (=> b!1261731 (= e!718145 e!718143)))

(declare-fun c!122683 () Bool)

(assert (=> b!1261731 (= c!122683 (validKeyInArray!0 (select (arr!39722 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1261732 () Bool)

(assert (=> b!1261732 (= e!718145 (ListLongMap!18894 Nil!28213))))

(declare-fun b!1261733 () Bool)

(assert (=> b!1261733 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40258 _keys!1118)))))

(assert (=> b!1261733 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40257 _values!914)))))

(declare-fun e!718147 () Bool)

(assert (=> b!1261733 (= e!718147 (= (apply!995 lt!571748 (select (arr!39722 _keys!1118) #b00000000000000000000000000000000)) (get!20266 (select (arr!39721 _values!914) #b00000000000000000000000000000000) (dynLambda!3393 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1261734 () Bool)

(assert (=> b!1261734 (= e!718142 (isEmpty!1037 lt!571748))))

(declare-fun b!1261735 () Bool)

(assert (=> b!1261735 (= e!718143 call!61970)))

(declare-fun b!1261736 () Bool)

(declare-fun lt!571745 () Unit!42063)

(declare-fun lt!571746 () Unit!42063)

(assert (=> b!1261736 (= lt!571745 lt!571746)))

(declare-fun lt!571742 () (_ BitVec 64))

(declare-fun lt!571747 () ListLongMap!18893)

(declare-fun lt!571743 () V!48513)

(declare-fun lt!571744 () (_ BitVec 64))

(assert (=> b!1261736 (not (contains!7582 (+!4241 lt!571747 (tuple2!21021 lt!571744 lt!571743)) lt!571742))))

(assert (=> b!1261736 (= lt!571746 (addStillNotContains!323 lt!571747 lt!571744 lt!571743 lt!571742))))

(assert (=> b!1261736 (= lt!571742 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1261736 (= lt!571743 (get!20266 (select (arr!39721 _values!914) #b00000000000000000000000000000000) (dynLambda!3393 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1261736 (= lt!571744 (select (arr!39722 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1261736 (= lt!571747 call!61970)))

(assert (=> b!1261736 (= e!718143 (+!4241 call!61970 (tuple2!21021 (select (arr!39722 _keys!1118) #b00000000000000000000000000000000) (get!20266 (select (arr!39721 _values!914) #b00000000000000000000000000000000) (dynLambda!3393 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1261737 () Bool)

(assert (=> b!1261737 (= e!718141 (validKeyInArray!0 (select (arr!39722 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1261737 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1261738 () Bool)

(assert (=> b!1261738 (= e!718144 e!718147)))

(assert (=> b!1261738 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40258 _keys!1118)))))

(declare-fun res!840714 () Bool)

(assert (=> b!1261738 (= res!840714 (contains!7582 lt!571748 (select (arr!39722 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1261738 (=> (not res!840714) (not e!718147))))

(assert (= (and d!138473 c!122686) b!1261732))

(assert (= (and d!138473 (not c!122686)) b!1261731))

(assert (= (and b!1261731 c!122683) b!1261736))

(assert (= (and b!1261731 (not c!122683)) b!1261735))

(assert (= (or b!1261736 b!1261735) bm!61967))

(assert (= (and d!138473 res!840717) b!1261729))

(assert (= (and b!1261729 res!840716) b!1261730))

(assert (= (and b!1261730 res!840715) b!1261737))

(assert (= (and b!1261730 c!122685) b!1261738))

(assert (= (and b!1261730 (not c!122685)) b!1261728))

(assert (= (and b!1261738 res!840714) b!1261733))

(assert (= (and b!1261728 c!122684) b!1261727))

(assert (= (and b!1261728 (not c!122684)) b!1261734))

(declare-fun b_lambda!22811 () Bool)

(assert (=> (not b_lambda!22811) (not b!1261733)))

(assert (=> b!1261733 t!41721))

(declare-fun b_and!45383 () Bool)

(assert (= b_and!45381 (and (=> t!41721 result!23359) b_and!45383)))

(declare-fun b_lambda!22813 () Bool)

(assert (=> (not b_lambda!22813) (not b!1261736)))

(assert (=> b!1261736 t!41721))

(declare-fun b_and!45385 () Bool)

(assert (= b_and!45383 (and (=> t!41721 result!23359) b_and!45385)))

(declare-fun m!1162307 () Bool)

(assert (=> b!1261736 m!1162307))

(assert (=> b!1261736 m!1162307))

(declare-fun m!1162309 () Bool)

(assert (=> b!1261736 m!1162309))

(assert (=> b!1261736 m!1162281))

(declare-fun m!1162311 () Bool)

(assert (=> b!1261736 m!1162311))

(assert (=> b!1261736 m!1162285))

(declare-fun m!1162313 () Bool)

(assert (=> b!1261736 m!1162313))

(assert (=> b!1261736 m!1162281))

(assert (=> b!1261736 m!1162285))

(assert (=> b!1261736 m!1162289))

(assert (=> b!1261736 m!1162291))

(declare-fun m!1162315 () Bool)

(assert (=> b!1261729 m!1162315))

(declare-fun m!1162317 () Bool)

(assert (=> b!1261727 m!1162317))

(assert (=> b!1261737 m!1162291))

(assert (=> b!1261737 m!1162291))

(assert (=> b!1261737 m!1162297))

(assert (=> b!1261738 m!1162291))

(assert (=> b!1261738 m!1162291))

(declare-fun m!1162319 () Bool)

(assert (=> b!1261738 m!1162319))

(declare-fun m!1162321 () Bool)

(assert (=> d!138473 m!1162321))

(assert (=> d!138473 m!1162231))

(assert (=> b!1261733 m!1162291))

(declare-fun m!1162323 () Bool)

(assert (=> b!1261733 m!1162323))

(assert (=> b!1261733 m!1162281))

(assert (=> b!1261733 m!1162285))

(assert (=> b!1261733 m!1162281))

(assert (=> b!1261733 m!1162285))

(assert (=> b!1261733 m!1162289))

(assert (=> b!1261733 m!1162291))

(assert (=> b!1261731 m!1162291))

(assert (=> b!1261731 m!1162291))

(assert (=> b!1261731 m!1162297))

(declare-fun m!1162325 () Bool)

(assert (=> b!1261734 m!1162325))

(assert (=> bm!61967 m!1162317))

(assert (=> b!1261664 d!138473))

(declare-fun d!138475 () Bool)

(declare-fun res!840726 () Bool)

(declare-fun e!718159 () Bool)

(assert (=> d!138475 (=> res!840726 e!718159)))

(assert (=> d!138475 (= res!840726 (bvsge #b00000000000000000000000000000000 (size!40258 _keys!1118)))))

(assert (=> d!138475 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28214) e!718159)))

(declare-fun b!1261749 () Bool)

(declare-fun e!718156 () Bool)

(assert (=> b!1261749 (= e!718159 e!718156)))

(declare-fun res!840724 () Bool)

(assert (=> b!1261749 (=> (not res!840724) (not e!718156))))

(declare-fun e!718158 () Bool)

(assert (=> b!1261749 (= res!840724 (not e!718158))))

(declare-fun res!840725 () Bool)

(assert (=> b!1261749 (=> (not res!840725) (not e!718158))))

(assert (=> b!1261749 (= res!840725 (validKeyInArray!0 (select (arr!39722 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1261750 () Bool)

(declare-fun e!718157 () Bool)

(declare-fun call!61973 () Bool)

(assert (=> b!1261750 (= e!718157 call!61973)))

(declare-fun bm!61970 () Bool)

(declare-fun c!122689 () Bool)

(assert (=> bm!61970 (= call!61973 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122689 (Cons!28213 (select (arr!39722 _keys!1118) #b00000000000000000000000000000000) Nil!28214) Nil!28214)))))

(declare-fun b!1261751 () Bool)

(assert (=> b!1261751 (= e!718156 e!718157)))

(assert (=> b!1261751 (= c!122689 (validKeyInArray!0 (select (arr!39722 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1261752 () Bool)

(assert (=> b!1261752 (= e!718157 call!61973)))

(declare-fun b!1261753 () Bool)

(declare-fun contains!7584 (List!28217 (_ BitVec 64)) Bool)

(assert (=> b!1261753 (= e!718158 (contains!7584 Nil!28214 (select (arr!39722 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138475 (not res!840726)) b!1261749))

(assert (= (and b!1261749 res!840725) b!1261753))

(assert (= (and b!1261749 res!840724) b!1261751))

(assert (= (and b!1261751 c!122689) b!1261752))

(assert (= (and b!1261751 (not c!122689)) b!1261750))

(assert (= (or b!1261752 b!1261750) bm!61970))

(assert (=> b!1261749 m!1162291))

(assert (=> b!1261749 m!1162291))

(assert (=> b!1261749 m!1162297))

(assert (=> bm!61970 m!1162291))

(declare-fun m!1162327 () Bool)

(assert (=> bm!61970 m!1162327))

(assert (=> b!1261751 m!1162291))

(assert (=> b!1261751 m!1162291))

(assert (=> b!1261751 m!1162297))

(assert (=> b!1261753 m!1162291))

(assert (=> b!1261753 m!1162291))

(declare-fun m!1162329 () Bool)

(assert (=> b!1261753 m!1162329))

(assert (=> b!1261660 d!138475))

(declare-fun b!1261762 () Bool)

(declare-fun e!718167 () Bool)

(declare-fun call!61976 () Bool)

(assert (=> b!1261762 (= e!718167 call!61976)))

(declare-fun bm!61973 () Bool)

(assert (=> bm!61973 (= call!61976 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1261763 () Bool)

(declare-fun e!718166 () Bool)

(assert (=> b!1261763 (= e!718166 e!718167)))

(declare-fun lt!571756 () (_ BitVec 64))

(assert (=> b!1261763 (= lt!571756 (select (arr!39722 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!571757 () Unit!42063)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82340 (_ BitVec 64) (_ BitVec 32)) Unit!42063)

(assert (=> b!1261763 (= lt!571757 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!571756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82340 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1261763 (arrayContainsKey!0 _keys!1118 lt!571756 #b00000000000000000000000000000000)))

(declare-fun lt!571755 () Unit!42063)

(assert (=> b!1261763 (= lt!571755 lt!571757)))

(declare-fun res!840732 () Bool)

(declare-datatypes ((SeekEntryResult!9973 0))(
  ( (MissingZero!9973 (index!42263 (_ BitVec 32))) (Found!9973 (index!42264 (_ BitVec 32))) (Intermediate!9973 (undefined!10785 Bool) (index!42265 (_ BitVec 32)) (x!111189 (_ BitVec 32))) (Undefined!9973) (MissingVacant!9973 (index!42266 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82340 (_ BitVec 32)) SeekEntryResult!9973)

(assert (=> b!1261763 (= res!840732 (= (seekEntryOrOpen!0 (select (arr!39722 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9973 #b00000000000000000000000000000000)))))

(assert (=> b!1261763 (=> (not res!840732) (not e!718167))))

(declare-fun d!138477 () Bool)

(declare-fun res!840731 () Bool)

(declare-fun e!718168 () Bool)

(assert (=> d!138477 (=> res!840731 e!718168)))

(assert (=> d!138477 (= res!840731 (bvsge #b00000000000000000000000000000000 (size!40258 _keys!1118)))))

(assert (=> d!138477 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!718168)))

(declare-fun b!1261764 () Bool)

(assert (=> b!1261764 (= e!718168 e!718166)))

(declare-fun c!122692 () Bool)

(assert (=> b!1261764 (= c!122692 (validKeyInArray!0 (select (arr!39722 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1261765 () Bool)

(assert (=> b!1261765 (= e!718166 call!61976)))

(assert (= (and d!138477 (not res!840731)) b!1261764))

(assert (= (and b!1261764 c!122692) b!1261763))

(assert (= (and b!1261764 (not c!122692)) b!1261765))

(assert (= (and b!1261763 res!840732) b!1261762))

(assert (= (or b!1261762 b!1261765) bm!61973))

(declare-fun m!1162331 () Bool)

(assert (=> bm!61973 m!1162331))

(assert (=> b!1261763 m!1162291))

(declare-fun m!1162333 () Bool)

(assert (=> b!1261763 m!1162333))

(declare-fun m!1162335 () Bool)

(assert (=> b!1261763 m!1162335))

(assert (=> b!1261763 m!1162291))

(declare-fun m!1162337 () Bool)

(assert (=> b!1261763 m!1162337))

(assert (=> b!1261764 m!1162291))

(assert (=> b!1261764 m!1162291))

(assert (=> b!1261764 m!1162297))

(assert (=> b!1261661 d!138477))

(declare-fun d!138479 () Bool)

(declare-fun e!718173 () Bool)

(assert (=> d!138479 e!718173))

(declare-fun res!840735 () Bool)

(assert (=> d!138479 (=> res!840735 e!718173)))

(declare-fun lt!571768 () Bool)

(assert (=> d!138479 (= res!840735 (not lt!571768))))

(declare-fun lt!571767 () Bool)

(assert (=> d!138479 (= lt!571768 lt!571767)))

(declare-fun lt!571769 () Unit!42063)

(declare-fun e!718174 () Unit!42063)

(assert (=> d!138479 (= lt!571769 e!718174)))

(declare-fun c!122695 () Bool)

(assert (=> d!138479 (= c!122695 lt!571767)))

(declare-fun containsKey!622 (List!28216 (_ BitVec 64)) Bool)

(assert (=> d!138479 (= lt!571767 (containsKey!622 (toList!9462 (getCurrentListMap!4632 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138479 (= (contains!7582 (getCurrentListMap!4632 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) #b1000000000000000000000000000000000000000000000000000000000000000) lt!571768)))

(declare-fun b!1261772 () Bool)

(declare-fun lt!571766 () Unit!42063)

(assert (=> b!1261772 (= e!718174 lt!571766)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!431 (List!28216 (_ BitVec 64)) Unit!42063)

(assert (=> b!1261772 (= lt!571766 (lemmaContainsKeyImpliesGetValueByKeyDefined!431 (toList!9462 (getCurrentListMap!4632 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!711 0))(
  ( (Some!710 (v!18949 V!48513)) (None!709) )
))
(declare-fun isDefined!470 (Option!711) Bool)

(declare-fun getValueByKey!660 (List!28216 (_ BitVec 64)) Option!711)

(assert (=> b!1261772 (isDefined!470 (getValueByKey!660 (toList!9462 (getCurrentListMap!4632 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1261773 () Bool)

(declare-fun Unit!42065 () Unit!42063)

(assert (=> b!1261773 (= e!718174 Unit!42065)))

(declare-fun b!1261774 () Bool)

(assert (=> b!1261774 (= e!718173 (isDefined!470 (getValueByKey!660 (toList!9462 (getCurrentListMap!4632 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!138479 c!122695) b!1261772))

(assert (= (and d!138479 (not c!122695)) b!1261773))

(assert (= (and d!138479 (not res!840735)) b!1261774))

(declare-fun m!1162339 () Bool)

(assert (=> d!138479 m!1162339))

(declare-fun m!1162341 () Bool)

(assert (=> b!1261772 m!1162341))

(declare-fun m!1162343 () Bool)

(assert (=> b!1261772 m!1162343))

(assert (=> b!1261772 m!1162343))

(declare-fun m!1162345 () Bool)

(assert (=> b!1261772 m!1162345))

(assert (=> b!1261774 m!1162343))

(assert (=> b!1261774 m!1162343))

(assert (=> b!1261774 m!1162345))

(assert (=> b!1261657 d!138479))

(declare-fun bm!61988 () Bool)

(declare-fun call!61994 () Bool)

(declare-fun lt!571820 () ListLongMap!18893)

(assert (=> bm!61988 (= call!61994 (contains!7582 lt!571820 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1261817 () Bool)

(declare-fun e!718202 () ListLongMap!18893)

(declare-fun e!718201 () ListLongMap!18893)

(assert (=> b!1261817 (= e!718202 e!718201)))

(declare-fun c!122712 () Bool)

(assert (=> b!1261817 (= c!122712 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1261818 () Bool)

(declare-fun e!718204 () Bool)

(assert (=> b!1261818 (= e!718204 (= (apply!995 lt!571820 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun b!1261819 () Bool)

(declare-fun e!718203 () Bool)

(declare-fun e!718207 () Bool)

(assert (=> b!1261819 (= e!718203 e!718207)))

(declare-fun res!840759 () Bool)

(assert (=> b!1261819 (=> (not res!840759) (not e!718207))))

(assert (=> b!1261819 (= res!840759 (contains!7582 lt!571820 (select (arr!39722 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1261819 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40258 _keys!1118)))))

(declare-fun b!1261820 () Bool)

(declare-fun call!61993 () ListLongMap!18893)

(assert (=> b!1261820 (= e!718202 (+!4241 call!61993 (tuple2!21021 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun b!1261821 () Bool)

(declare-fun e!718212 () Unit!42063)

(declare-fun lt!571823 () Unit!42063)

(assert (=> b!1261821 (= e!718212 lt!571823)))

(declare-fun lt!571824 () ListLongMap!18893)

(assert (=> b!1261821 (= lt!571824 (getCurrentListMapNoExtraKeys!5829 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571821 () (_ BitVec 64))

(assert (=> b!1261821 (= lt!571821 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571827 () (_ BitVec 64))

(assert (=> b!1261821 (= lt!571827 (select (arr!39722 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!571832 () Unit!42063)

(declare-fun addStillContains!1085 (ListLongMap!18893 (_ BitVec 64) V!48513 (_ BitVec 64)) Unit!42063)

(assert (=> b!1261821 (= lt!571832 (addStillContains!1085 lt!571824 lt!571821 zeroValue!871 lt!571827))))

(assert (=> b!1261821 (contains!7582 (+!4241 lt!571824 (tuple2!21021 lt!571821 zeroValue!871)) lt!571827)))

(declare-fun lt!571831 () Unit!42063)

(assert (=> b!1261821 (= lt!571831 lt!571832)))

(declare-fun lt!571829 () ListLongMap!18893)

(assert (=> b!1261821 (= lt!571829 (getCurrentListMapNoExtraKeys!5829 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571819 () (_ BitVec 64))

(assert (=> b!1261821 (= lt!571819 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571822 () (_ BitVec 64))

(assert (=> b!1261821 (= lt!571822 (select (arr!39722 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!571814 () Unit!42063)

(declare-fun addApplyDifferent!539 (ListLongMap!18893 (_ BitVec 64) V!48513 (_ BitVec 64)) Unit!42063)

(assert (=> b!1261821 (= lt!571814 (addApplyDifferent!539 lt!571829 lt!571819 minValueBefore!43 lt!571822))))

(assert (=> b!1261821 (= (apply!995 (+!4241 lt!571829 (tuple2!21021 lt!571819 minValueBefore!43)) lt!571822) (apply!995 lt!571829 lt!571822))))

(declare-fun lt!571815 () Unit!42063)

(assert (=> b!1261821 (= lt!571815 lt!571814)))

(declare-fun lt!571833 () ListLongMap!18893)

(assert (=> b!1261821 (= lt!571833 (getCurrentListMapNoExtraKeys!5829 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571825 () (_ BitVec 64))

(assert (=> b!1261821 (= lt!571825 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571818 () (_ BitVec 64))

(assert (=> b!1261821 (= lt!571818 (select (arr!39722 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!571828 () Unit!42063)

(assert (=> b!1261821 (= lt!571828 (addApplyDifferent!539 lt!571833 lt!571825 zeroValue!871 lt!571818))))

(assert (=> b!1261821 (= (apply!995 (+!4241 lt!571833 (tuple2!21021 lt!571825 zeroValue!871)) lt!571818) (apply!995 lt!571833 lt!571818))))

(declare-fun lt!571826 () Unit!42063)

(assert (=> b!1261821 (= lt!571826 lt!571828)))

(declare-fun lt!571817 () ListLongMap!18893)

(assert (=> b!1261821 (= lt!571817 (getCurrentListMapNoExtraKeys!5829 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571816 () (_ BitVec 64))

(assert (=> b!1261821 (= lt!571816 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571834 () (_ BitVec 64))

(assert (=> b!1261821 (= lt!571834 (select (arr!39722 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1261821 (= lt!571823 (addApplyDifferent!539 lt!571817 lt!571816 minValueBefore!43 lt!571834))))

(assert (=> b!1261821 (= (apply!995 (+!4241 lt!571817 (tuple2!21021 lt!571816 minValueBefore!43)) lt!571834) (apply!995 lt!571817 lt!571834))))

(declare-fun b!1261822 () Bool)

(declare-fun c!122711 () Bool)

(assert (=> b!1261822 (= c!122711 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!718210 () ListLongMap!18893)

(assert (=> b!1261822 (= e!718201 e!718210)))

(declare-fun b!1261823 () Bool)

(declare-fun e!718213 () Bool)

(assert (=> b!1261823 (= e!718213 (= (apply!995 lt!571820 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1261824 () Bool)

(declare-fun e!718208 () Bool)

(declare-fun call!61997 () Bool)

(assert (=> b!1261824 (= e!718208 (not call!61997))))

(declare-fun b!1261825 () Bool)

(assert (=> b!1261825 (= e!718207 (= (apply!995 lt!571820 (select (arr!39722 _keys!1118) #b00000000000000000000000000000000)) (get!20266 (select (arr!39721 _values!914) #b00000000000000000000000000000000) (dynLambda!3393 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1261825 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40257 _values!914)))))

(assert (=> b!1261825 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40258 _keys!1118)))))

(declare-fun b!1261826 () Bool)

(declare-fun e!718211 () Bool)

(assert (=> b!1261826 (= e!718211 (validKeyInArray!0 (select (arr!39722 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61989 () Bool)

(declare-fun call!61992 () ListLongMap!18893)

(assert (=> bm!61989 (= call!61992 (getCurrentListMapNoExtraKeys!5829 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1261827 () Bool)

(declare-fun e!718206 () Bool)

(assert (=> b!1261827 (= e!718206 e!718213)))

(declare-fun res!840754 () Bool)

(assert (=> b!1261827 (= res!840754 call!61994)))

(assert (=> b!1261827 (=> (not res!840754) (not e!718213))))

(declare-fun b!1261828 () Bool)

(assert (=> b!1261828 (= e!718206 (not call!61994))))

(declare-fun b!1261829 () Bool)

(declare-fun call!61995 () ListLongMap!18893)

(assert (=> b!1261829 (= e!718210 call!61995)))

(declare-fun c!122708 () Bool)

(declare-fun call!61991 () ListLongMap!18893)

(declare-fun bm!61990 () Bool)

(assert (=> bm!61990 (= call!61993 (+!4241 (ite c!122708 call!61992 (ite c!122712 call!61991 call!61995)) (ite (or c!122708 c!122712) (tuple2!21021 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21021 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1261830 () Bool)

(declare-fun Unit!42066 () Unit!42063)

(assert (=> b!1261830 (= e!718212 Unit!42066)))

(declare-fun bm!61991 () Bool)

(declare-fun call!61996 () ListLongMap!18893)

(assert (=> bm!61991 (= call!61996 call!61993)))

(declare-fun b!1261831 () Bool)

(assert (=> b!1261831 (= e!718201 call!61996)))

(declare-fun b!1261832 () Bool)

(declare-fun e!718205 () Bool)

(assert (=> b!1261832 (= e!718205 e!718208)))

(declare-fun c!122709 () Bool)

(assert (=> b!1261832 (= c!122709 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1261833 () Bool)

(declare-fun res!840757 () Bool)

(assert (=> b!1261833 (=> (not res!840757) (not e!718205))))

(assert (=> b!1261833 (= res!840757 e!718206)))

(declare-fun c!122713 () Bool)

(assert (=> b!1261833 (= c!122713 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1261834 () Bool)

(declare-fun res!840756 () Bool)

(assert (=> b!1261834 (=> (not res!840756) (not e!718205))))

(assert (=> b!1261834 (= res!840756 e!718203)))

(declare-fun res!840762 () Bool)

(assert (=> b!1261834 (=> res!840762 e!718203)))

(declare-fun e!718209 () Bool)

(assert (=> b!1261834 (= res!840762 (not e!718209))))

(declare-fun res!840760 () Bool)

(assert (=> b!1261834 (=> (not res!840760) (not e!718209))))

(assert (=> b!1261834 (= res!840760 (bvslt #b00000000000000000000000000000000 (size!40258 _keys!1118)))))

(declare-fun bm!61992 () Bool)

(assert (=> bm!61992 (= call!61991 call!61992)))

(declare-fun d!138481 () Bool)

(assert (=> d!138481 e!718205))

(declare-fun res!840758 () Bool)

(assert (=> d!138481 (=> (not res!840758) (not e!718205))))

(assert (=> d!138481 (= res!840758 (or (bvsge #b00000000000000000000000000000000 (size!40258 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40258 _keys!1118)))))))

(declare-fun lt!571830 () ListLongMap!18893)

(assert (=> d!138481 (= lt!571820 lt!571830)))

(declare-fun lt!571835 () Unit!42063)

(assert (=> d!138481 (= lt!571835 e!718212)))

(declare-fun c!122710 () Bool)

(assert (=> d!138481 (= c!122710 e!718211)))

(declare-fun res!840755 () Bool)

(assert (=> d!138481 (=> (not res!840755) (not e!718211))))

(assert (=> d!138481 (= res!840755 (bvslt #b00000000000000000000000000000000 (size!40258 _keys!1118)))))

(assert (=> d!138481 (= lt!571830 e!718202)))

(assert (=> d!138481 (= c!122708 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138481 (validMask!0 mask!1466)))

(assert (=> d!138481 (= (getCurrentListMap!4632 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!571820)))

(declare-fun b!1261835 () Bool)

(assert (=> b!1261835 (= e!718210 call!61996)))

(declare-fun bm!61993 () Bool)

(assert (=> bm!61993 (= call!61997 (contains!7582 lt!571820 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1261836 () Bool)

(assert (=> b!1261836 (= e!718209 (validKeyInArray!0 (select (arr!39722 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1261837 () Bool)

(assert (=> b!1261837 (= e!718208 e!718204)))

(declare-fun res!840761 () Bool)

(assert (=> b!1261837 (= res!840761 call!61997)))

(assert (=> b!1261837 (=> (not res!840761) (not e!718204))))

(declare-fun bm!61994 () Bool)

(assert (=> bm!61994 (= call!61995 call!61991)))

(assert (= (and d!138481 c!122708) b!1261820))

(assert (= (and d!138481 (not c!122708)) b!1261817))

(assert (= (and b!1261817 c!122712) b!1261831))

(assert (= (and b!1261817 (not c!122712)) b!1261822))

(assert (= (and b!1261822 c!122711) b!1261835))

(assert (= (and b!1261822 (not c!122711)) b!1261829))

(assert (= (or b!1261835 b!1261829) bm!61994))

(assert (= (or b!1261831 bm!61994) bm!61992))

(assert (= (or b!1261831 b!1261835) bm!61991))

(assert (= (or b!1261820 bm!61992) bm!61989))

(assert (= (or b!1261820 bm!61991) bm!61990))

(assert (= (and d!138481 res!840755) b!1261826))

(assert (= (and d!138481 c!122710) b!1261821))

(assert (= (and d!138481 (not c!122710)) b!1261830))

(assert (= (and d!138481 res!840758) b!1261834))

(assert (= (and b!1261834 res!840760) b!1261836))

(assert (= (and b!1261834 (not res!840762)) b!1261819))

(assert (= (and b!1261819 res!840759) b!1261825))

(assert (= (and b!1261834 res!840756) b!1261833))

(assert (= (and b!1261833 c!122713) b!1261827))

(assert (= (and b!1261833 (not c!122713)) b!1261828))

(assert (= (and b!1261827 res!840754) b!1261823))

(assert (= (or b!1261827 b!1261828) bm!61988))

(assert (= (and b!1261833 res!840757) b!1261832))

(assert (= (and b!1261832 c!122709) b!1261837))

(assert (= (and b!1261832 (not c!122709)) b!1261824))

(assert (= (and b!1261837 res!840761) b!1261818))

(assert (= (or b!1261837 b!1261824) bm!61993))

(declare-fun b_lambda!22815 () Bool)

(assert (=> (not b_lambda!22815) (not b!1261825)))

(assert (=> b!1261825 t!41721))

(declare-fun b_and!45387 () Bool)

(assert (= b_and!45385 (and (=> t!41721 result!23359) b_and!45387)))

(declare-fun m!1162347 () Bool)

(assert (=> b!1261820 m!1162347))

(declare-fun m!1162349 () Bool)

(assert (=> bm!61990 m!1162349))

(declare-fun m!1162351 () Bool)

(assert (=> bm!61993 m!1162351))

(assert (=> b!1261819 m!1162291))

(assert (=> b!1261819 m!1162291))

(declare-fun m!1162353 () Bool)

(assert (=> b!1261819 m!1162353))

(assert (=> d!138481 m!1162231))

(assert (=> b!1261825 m!1162285))

(assert (=> b!1261825 m!1162291))

(assert (=> b!1261825 m!1162281))

(assert (=> b!1261825 m!1162281))

(assert (=> b!1261825 m!1162285))

(assert (=> b!1261825 m!1162289))

(assert (=> b!1261825 m!1162291))

(declare-fun m!1162355 () Bool)

(assert (=> b!1261825 m!1162355))

(assert (=> bm!61989 m!1162247))

(assert (=> b!1261836 m!1162291))

(assert (=> b!1261836 m!1162291))

(assert (=> b!1261836 m!1162297))

(assert (=> b!1261826 m!1162291))

(assert (=> b!1261826 m!1162291))

(assert (=> b!1261826 m!1162297))

(declare-fun m!1162357 () Bool)

(assert (=> b!1261818 m!1162357))

(declare-fun m!1162359 () Bool)

(assert (=> bm!61988 m!1162359))

(declare-fun m!1162361 () Bool)

(assert (=> b!1261821 m!1162361))

(assert (=> b!1261821 m!1162361))

(declare-fun m!1162363 () Bool)

(assert (=> b!1261821 m!1162363))

(declare-fun m!1162365 () Bool)

(assert (=> b!1261821 m!1162365))

(declare-fun m!1162367 () Bool)

(assert (=> b!1261821 m!1162367))

(declare-fun m!1162369 () Bool)

(assert (=> b!1261821 m!1162369))

(declare-fun m!1162371 () Bool)

(assert (=> b!1261821 m!1162371))

(declare-fun m!1162373 () Bool)

(assert (=> b!1261821 m!1162373))

(declare-fun m!1162375 () Bool)

(assert (=> b!1261821 m!1162375))

(declare-fun m!1162377 () Bool)

(assert (=> b!1261821 m!1162377))

(assert (=> b!1261821 m!1162371))

(assert (=> b!1261821 m!1162375))

(declare-fun m!1162379 () Bool)

(assert (=> b!1261821 m!1162379))

(assert (=> b!1261821 m!1162247))

(declare-fun m!1162381 () Bool)

(assert (=> b!1261821 m!1162381))

(declare-fun m!1162383 () Bool)

(assert (=> b!1261821 m!1162383))

(declare-fun m!1162385 () Bool)

(assert (=> b!1261821 m!1162385))

(assert (=> b!1261821 m!1162291))

(assert (=> b!1261821 m!1162367))

(declare-fun m!1162387 () Bool)

(assert (=> b!1261821 m!1162387))

(declare-fun m!1162389 () Bool)

(assert (=> b!1261821 m!1162389))

(declare-fun m!1162391 () Bool)

(assert (=> b!1261823 m!1162391))

(assert (=> b!1261657 d!138481))

(declare-fun b!1261845 () Bool)

(declare-fun e!718218 () Bool)

(assert (=> b!1261845 (= e!718218 tp_is_empty!32361)))

(declare-fun mapIsEmpty!50353 () Bool)

(declare-fun mapRes!50353 () Bool)

(assert (=> mapIsEmpty!50353 mapRes!50353))

(declare-fun mapNonEmpty!50353 () Bool)

(declare-fun tp!95921 () Bool)

(declare-fun e!718219 () Bool)

(assert (=> mapNonEmpty!50353 (= mapRes!50353 (and tp!95921 e!718219))))

(declare-fun mapValue!50353 () ValueCell!15417)

(declare-fun mapRest!50353 () (Array (_ BitVec 32) ValueCell!15417))

(declare-fun mapKey!50353 () (_ BitVec 32))

(assert (=> mapNonEmpty!50353 (= mapRest!50347 (store mapRest!50353 mapKey!50353 mapValue!50353))))

(declare-fun b!1261844 () Bool)

(assert (=> b!1261844 (= e!718219 tp_is_empty!32361)))

(declare-fun condMapEmpty!50353 () Bool)

(declare-fun mapDefault!50353 () ValueCell!15417)

(assert (=> mapNonEmpty!50347 (= condMapEmpty!50353 (= mapRest!50347 ((as const (Array (_ BitVec 32) ValueCell!15417)) mapDefault!50353)))))

(assert (=> mapNonEmpty!50347 (= tp!95912 (and e!718218 mapRes!50353))))

(assert (= (and mapNonEmpty!50347 condMapEmpty!50353) mapIsEmpty!50353))

(assert (= (and mapNonEmpty!50347 (not condMapEmpty!50353)) mapNonEmpty!50353))

(assert (= (and mapNonEmpty!50353 ((_ is ValueCellFull!15417) mapValue!50353)) b!1261844))

(assert (= (and mapNonEmpty!50347 ((_ is ValueCellFull!15417) mapDefault!50353)) b!1261845))

(declare-fun m!1162393 () Bool)

(assert (=> mapNonEmpty!50353 m!1162393))

(declare-fun b_lambda!22817 () Bool)

(assert (= b_lambda!22807 (or (and start!105930 b_free!27459) b_lambda!22817)))

(declare-fun b_lambda!22819 () Bool)

(assert (= b_lambda!22813 (or (and start!105930 b_free!27459) b_lambda!22819)))

(declare-fun b_lambda!22821 () Bool)

(assert (= b_lambda!22815 (or (and start!105930 b_free!27459) b_lambda!22821)))

(declare-fun b_lambda!22823 () Bool)

(assert (= b_lambda!22811 (or (and start!105930 b_free!27459) b_lambda!22823)))

(declare-fun b_lambda!22825 () Bool)

(assert (= b_lambda!22809 (or (and start!105930 b_free!27459) b_lambda!22825)))

(check-sat (not b!1261719) (not b!1261772) (not b!1261724) (not bm!61970) (not b!1261731) (not b!1261715) (not bm!61967) (not b!1261737) (not b!1261729) (not b!1261836) (not b_lambda!22819) (not d!138481) (not bm!61993) (not b!1261727) (not b!1261764) (not d!138471) b_and!45387 (not b!1261717) (not b!1261825) (not b_next!27459) (not mapNonEmpty!50353) (not b!1261751) (not b!1261723) (not d!138469) (not d!138479) tp_is_empty!32361 (not b!1261733) (not bm!61989) (not b!1261738) (not bm!61973) (not b!1261713) (not b_lambda!22823) (not b!1261823) (not b!1261820) (not bm!61988) (not b!1261818) (not b!1261749) (not b_lambda!22825) (not b!1261734) (not bm!61990) (not b!1261826) (not b!1261753) (not b!1261821) (not b!1261763) (not b!1261819) (not b!1261720) (not b!1261774) (not b_lambda!22821) (not b!1261722) (not d!138473) (not b!1261736) (not bm!61966) (not b_lambda!22817))
(check-sat b_and!45387 (not b_next!27459))
