; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105298 () Bool)

(assert start!105298)

(declare-fun b_free!26821 () Bool)

(declare-fun b_next!26821 () Bool)

(assert (=> start!105298 (= b_free!26821 (not b_next!26821))))

(declare-fun tp!93962 () Bool)

(declare-fun b_and!44619 () Bool)

(assert (=> start!105298 (= tp!93962 b_and!44619)))

(declare-fun b!1253547 () Bool)

(declare-fun res!835657 () Bool)

(declare-fun e!712049 () Bool)

(assert (=> b!1253547 (=> (not res!835657) (not e!712049))))

(declare-datatypes ((array!81155 0))(
  ( (array!81156 (arr!39137 (Array (_ BitVec 32) (_ BitVec 64))) (size!39674 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81155)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81155 (_ BitVec 32)) Bool)

(assert (=> b!1253547 (= res!835657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1253548 () Bool)

(declare-fun e!712052 () Bool)

(declare-fun e!712048 () Bool)

(declare-fun mapRes!49354 () Bool)

(assert (=> b!1253548 (= e!712052 (and e!712048 mapRes!49354))))

(declare-fun condMapEmpty!49354 () Bool)

(declare-datatypes ((V!47663 0))(
  ( (V!47664 (val!15924 Int)) )
))
(declare-datatypes ((ValueCell!15098 0))(
  ( (ValueCellFull!15098 (v!18618 V!47663)) (EmptyCell!15098) )
))
(declare-datatypes ((array!81157 0))(
  ( (array!81158 (arr!39138 (Array (_ BitVec 32) ValueCell!15098)) (size!39675 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81157)

(declare-fun mapDefault!49354 () ValueCell!15098)

(assert (=> b!1253548 (= condMapEmpty!49354 (= (arr!39138 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15098)) mapDefault!49354)))))

(declare-fun b!1253549 () Bool)

(declare-fun res!835656 () Bool)

(assert (=> b!1253549 (=> (not res!835656) (not e!712049))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1253549 (= res!835656 (and (= (size!39675 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39674 _keys!1118) (size!39675 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49354 () Bool)

(declare-fun tp!93961 () Bool)

(declare-fun e!712051 () Bool)

(assert (=> mapNonEmpty!49354 (= mapRes!49354 (and tp!93961 e!712051))))

(declare-fun mapValue!49354 () ValueCell!15098)

(declare-fun mapRest!49354 () (Array (_ BitVec 32) ValueCell!15098))

(declare-fun mapKey!49354 () (_ BitVec 32))

(assert (=> mapNonEmpty!49354 (= (arr!39138 _values!914) (store mapRest!49354 mapKey!49354 mapValue!49354))))

(declare-fun mapIsEmpty!49354 () Bool)

(assert (=> mapIsEmpty!49354 mapRes!49354))

(declare-fun b!1253550 () Bool)

(declare-fun tp_is_empty!31723 () Bool)

(assert (=> b!1253550 (= e!712048 tp_is_empty!31723)))

(declare-fun b!1253551 () Bool)

(declare-fun res!835655 () Bool)

(assert (=> b!1253551 (=> (not res!835655) (not e!712049))))

(declare-datatypes ((List!27806 0))(
  ( (Nil!27803) (Cons!27802 (h!29020 (_ BitVec 64)) (t!41275 List!27806)) )
))
(declare-fun arrayNoDuplicates!0 (array!81155 (_ BitVec 32) List!27806) Bool)

(assert (=> b!1253551 (= res!835655 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27803))))

(declare-fun res!835654 () Bool)

(assert (=> start!105298 (=> (not res!835654) (not e!712049))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105298 (= res!835654 (validMask!0 mask!1466))))

(assert (=> start!105298 e!712049))

(assert (=> start!105298 true))

(assert (=> start!105298 tp!93962))

(assert (=> start!105298 tp_is_empty!31723))

(declare-fun array_inv!29961 (array!81155) Bool)

(assert (=> start!105298 (array_inv!29961 _keys!1118)))

(declare-fun array_inv!29962 (array!81157) Bool)

(assert (=> start!105298 (and (array_inv!29962 _values!914) e!712052)))

(declare-fun b!1253552 () Bool)

(assert (=> b!1253552 (= e!712051 tp_is_empty!31723)))

(declare-fun b!1253553 () Bool)

(assert (=> b!1253553 (= e!712049 (not (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!39674 _keys!1118)))))))

(declare-datatypes ((tuple2!20560 0))(
  ( (tuple2!20561 (_1!10291 (_ BitVec 64)) (_2!10291 V!47663)) )
))
(declare-datatypes ((List!27807 0))(
  ( (Nil!27804) (Cons!27803 (h!29021 tuple2!20560) (t!41276 List!27807)) )
))
(declare-datatypes ((ListLongMap!18441 0))(
  ( (ListLongMap!18442 (toList!9236 List!27807)) )
))
(declare-fun lt!565722 () ListLongMap!18441)

(declare-fun lt!565724 () ListLongMap!18441)

(assert (=> b!1253553 (= lt!565722 lt!565724)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47663)

(declare-fun zeroValue!871 () V!47663)

(declare-datatypes ((Unit!41610 0))(
  ( (Unit!41611) )
))
(declare-fun lt!565723 () Unit!41610)

(declare-fun minValueBefore!43 () V!47663)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!977 (array!81155 array!81157 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47663 V!47663 V!47663 V!47663 (_ BitVec 32) Int) Unit!41610)

(assert (=> b!1253553 (= lt!565723 (lemmaNoChangeToArrayThenSameMapNoExtras!977 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5663 (array!81155 array!81157 (_ BitVec 32) (_ BitVec 32) V!47663 V!47663 (_ BitVec 32) Int) ListLongMap!18441)

(assert (=> b!1253553 (= lt!565724 (getCurrentListMapNoExtraKeys!5663 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253553 (= lt!565722 (getCurrentListMapNoExtraKeys!5663 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105298 res!835654) b!1253549))

(assert (= (and b!1253549 res!835656) b!1253547))

(assert (= (and b!1253547 res!835657) b!1253551))

(assert (= (and b!1253551 res!835655) b!1253553))

(assert (= (and b!1253548 condMapEmpty!49354) mapIsEmpty!49354))

(assert (= (and b!1253548 (not condMapEmpty!49354)) mapNonEmpty!49354))

(get-info :version)

(assert (= (and mapNonEmpty!49354 ((_ is ValueCellFull!15098) mapValue!49354)) b!1253552))

(assert (= (and b!1253548 ((_ is ValueCellFull!15098) mapDefault!49354)) b!1253550))

(assert (= start!105298 b!1253548))

(declare-fun m!1154517 () Bool)

(assert (=> start!105298 m!1154517))

(declare-fun m!1154519 () Bool)

(assert (=> start!105298 m!1154519))

(declare-fun m!1154521 () Bool)

(assert (=> start!105298 m!1154521))

(declare-fun m!1154523 () Bool)

(assert (=> b!1253547 m!1154523))

(declare-fun m!1154525 () Bool)

(assert (=> b!1253551 m!1154525))

(declare-fun m!1154527 () Bool)

(assert (=> b!1253553 m!1154527))

(declare-fun m!1154529 () Bool)

(assert (=> b!1253553 m!1154529))

(declare-fun m!1154531 () Bool)

(assert (=> b!1253553 m!1154531))

(declare-fun m!1154533 () Bool)

(assert (=> mapNonEmpty!49354 m!1154533))

(check-sat (not b!1253547) (not b!1253553) (not start!105298) (not mapNonEmpty!49354) (not b_next!26821) b_and!44619 (not b!1253551) tp_is_empty!31723)
(check-sat b_and!44619 (not b_next!26821))
(get-model)

(declare-fun d!138433 () Bool)

(assert (=> d!138433 (= (getCurrentListMapNoExtraKeys!5663 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5663 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!565745 () Unit!41610)

(declare-fun choose!1855 (array!81155 array!81157 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47663 V!47663 V!47663 V!47663 (_ BitVec 32) Int) Unit!41610)

(assert (=> d!138433 (= lt!565745 (choose!1855 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138433 (validMask!0 mask!1466)))

(assert (=> d!138433 (= (lemmaNoChangeToArrayThenSameMapNoExtras!977 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!565745)))

(declare-fun bs!35383 () Bool)

(assert (= bs!35383 d!138433))

(assert (=> bs!35383 m!1154531))

(assert (=> bs!35383 m!1154529))

(declare-fun m!1154571 () Bool)

(assert (=> bs!35383 m!1154571))

(assert (=> bs!35383 m!1154517))

(assert (=> b!1253553 d!138433))

(declare-fun d!138435 () Bool)

(declare-fun e!712099 () Bool)

(assert (=> d!138435 e!712099))

(declare-fun res!835692 () Bool)

(assert (=> d!138435 (=> (not res!835692) (not e!712099))))

(declare-fun lt!565762 () ListLongMap!18441)

(declare-fun contains!7543 (ListLongMap!18441 (_ BitVec 64)) Bool)

(assert (=> d!138435 (= res!835692 (not (contains!7543 lt!565762 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!712102 () ListLongMap!18441)

(assert (=> d!138435 (= lt!565762 e!712102)))

(declare-fun c!122641 () Bool)

(assert (=> d!138435 (= c!122641 (bvsge #b00000000000000000000000000000000 (size!39674 _keys!1118)))))

(assert (=> d!138435 (validMask!0 mask!1466)))

(assert (=> d!138435 (= (getCurrentListMapNoExtraKeys!5663 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!565762)))

(declare-fun b!1253620 () Bool)

(assert (=> b!1253620 (= e!712102 (ListLongMap!18442 Nil!27804))))

(declare-fun b!1253621 () Bool)

(declare-fun e!712097 () Bool)

(declare-fun e!712101 () Bool)

(assert (=> b!1253621 (= e!712097 e!712101)))

(declare-fun c!122643 () Bool)

(assert (=> b!1253621 (= c!122643 (bvslt #b00000000000000000000000000000000 (size!39674 _keys!1118)))))

(declare-fun b!1253622 () Bool)

(assert (=> b!1253622 (= e!712099 e!712097)))

(declare-fun c!122644 () Bool)

(declare-fun e!712098 () Bool)

(assert (=> b!1253622 (= c!122644 e!712098)))

(declare-fun res!835693 () Bool)

(assert (=> b!1253622 (=> (not res!835693) (not e!712098))))

(assert (=> b!1253622 (= res!835693 (bvslt #b00000000000000000000000000000000 (size!39674 _keys!1118)))))

(declare-fun b!1253623 () Bool)

(declare-fun isEmpty!1029 (ListLongMap!18441) Bool)

(assert (=> b!1253623 (= e!712101 (isEmpty!1029 lt!565762))))

(declare-fun b!1253624 () Bool)

(assert (=> b!1253624 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39674 _keys!1118)))))

(assert (=> b!1253624 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39675 _values!914)))))

(declare-fun e!712100 () Bool)

(declare-fun apply!992 (ListLongMap!18441 (_ BitVec 64)) V!47663)

(declare-fun get!20093 (ValueCell!15098 V!47663) V!47663)

(declare-fun dynLambda!3444 (Int (_ BitVec 64)) V!47663)

(assert (=> b!1253624 (= e!712100 (= (apply!992 lt!565762 (select (arr!39137 _keys!1118) #b00000000000000000000000000000000)) (get!20093 (select (arr!39138 _values!914) #b00000000000000000000000000000000) (dynLambda!3444 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1253625 () Bool)

(assert (=> b!1253625 (= e!712097 e!712100)))

(assert (=> b!1253625 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39674 _keys!1118)))))

(declare-fun res!835691 () Bool)

(assert (=> b!1253625 (= res!835691 (contains!7543 lt!565762 (select (arr!39137 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1253625 (=> (not res!835691) (not e!712100))))

(declare-fun b!1253626 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1253626 (= e!712098 (validKeyInArray!0 (select (arr!39137 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1253626 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1253627 () Bool)

(declare-fun res!835690 () Bool)

(assert (=> b!1253627 (=> (not res!835690) (not e!712099))))

(assert (=> b!1253627 (= res!835690 (not (contains!7543 lt!565762 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1253628 () Bool)

(declare-fun lt!565760 () Unit!41610)

(declare-fun lt!565765 () Unit!41610)

(assert (=> b!1253628 (= lt!565760 lt!565765)))

(declare-fun lt!565766 () V!47663)

(declare-fun lt!565764 () ListLongMap!18441)

(declare-fun lt!565761 () (_ BitVec 64))

(declare-fun lt!565763 () (_ BitVec 64))

(declare-fun +!4196 (ListLongMap!18441 tuple2!20560) ListLongMap!18441)

(assert (=> b!1253628 (not (contains!7543 (+!4196 lt!565764 (tuple2!20561 lt!565763 lt!565766)) lt!565761))))

(declare-fun addStillNotContains!313 (ListLongMap!18441 (_ BitVec 64) V!47663 (_ BitVec 64)) Unit!41610)

(assert (=> b!1253628 (= lt!565765 (addStillNotContains!313 lt!565764 lt!565763 lt!565766 lt!565761))))

(assert (=> b!1253628 (= lt!565761 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1253628 (= lt!565766 (get!20093 (select (arr!39138 _values!914) #b00000000000000000000000000000000) (dynLambda!3444 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1253628 (= lt!565763 (select (arr!39137 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!61718 () ListLongMap!18441)

(assert (=> b!1253628 (= lt!565764 call!61718)))

(declare-fun e!712103 () ListLongMap!18441)

(assert (=> b!1253628 (= e!712103 (+!4196 call!61718 (tuple2!20561 (select (arr!39137 _keys!1118) #b00000000000000000000000000000000) (get!20093 (select (arr!39138 _values!914) #b00000000000000000000000000000000) (dynLambda!3444 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!61715 () Bool)

(assert (=> bm!61715 (= call!61718 (getCurrentListMapNoExtraKeys!5663 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1253629 () Bool)

(assert (=> b!1253629 (= e!712102 e!712103)))

(declare-fun c!122642 () Bool)

(assert (=> b!1253629 (= c!122642 (validKeyInArray!0 (select (arr!39137 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1253630 () Bool)

(assert (=> b!1253630 (= e!712103 call!61718)))

(declare-fun b!1253631 () Bool)

(assert (=> b!1253631 (= e!712101 (= lt!565762 (getCurrentListMapNoExtraKeys!5663 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(assert (= (and d!138435 c!122641) b!1253620))

(assert (= (and d!138435 (not c!122641)) b!1253629))

(assert (= (and b!1253629 c!122642) b!1253628))

(assert (= (and b!1253629 (not c!122642)) b!1253630))

(assert (= (or b!1253628 b!1253630) bm!61715))

(assert (= (and d!138435 res!835692) b!1253627))

(assert (= (and b!1253627 res!835690) b!1253622))

(assert (= (and b!1253622 res!835693) b!1253626))

(assert (= (and b!1253622 c!122644) b!1253625))

(assert (= (and b!1253622 (not c!122644)) b!1253621))

(assert (= (and b!1253625 res!835691) b!1253624))

(assert (= (and b!1253621 c!122643) b!1253631))

(assert (= (and b!1253621 (not c!122643)) b!1253623))

(declare-fun b_lambda!22561 () Bool)

(assert (=> (not b_lambda!22561) (not b!1253624)))

(declare-fun t!41279 () Bool)

(declare-fun tb!11285 () Bool)

(assert (=> (and start!105298 (= defaultEntry!922 defaultEntry!922) t!41279) tb!11285))

(declare-fun result!23279 () Bool)

(assert (=> tb!11285 (= result!23279 tp_is_empty!31723)))

(assert (=> b!1253624 t!41279))

(declare-fun b_and!44625 () Bool)

(assert (= b_and!44619 (and (=> t!41279 result!23279) b_and!44625)))

(declare-fun b_lambda!22563 () Bool)

(assert (=> (not b_lambda!22563) (not b!1253628)))

(assert (=> b!1253628 t!41279))

(declare-fun b_and!44627 () Bool)

(assert (= b_and!44625 (and (=> t!41279 result!23279) b_and!44627)))

(declare-fun m!1154573 () Bool)

(assert (=> b!1253624 m!1154573))

(declare-fun m!1154575 () Bool)

(assert (=> b!1253624 m!1154575))

(declare-fun m!1154577 () Bool)

(assert (=> b!1253624 m!1154577))

(assert (=> b!1253624 m!1154573))

(declare-fun m!1154579 () Bool)

(assert (=> b!1253624 m!1154579))

(assert (=> b!1253624 m!1154577))

(assert (=> b!1253624 m!1154575))

(declare-fun m!1154581 () Bool)

(assert (=> b!1253624 m!1154581))

(assert (=> b!1253626 m!1154573))

(assert (=> b!1253626 m!1154573))

(declare-fun m!1154583 () Bool)

(assert (=> b!1253626 m!1154583))

(assert (=> b!1253625 m!1154573))

(assert (=> b!1253625 m!1154573))

(declare-fun m!1154585 () Bool)

(assert (=> b!1253625 m!1154585))

(declare-fun m!1154587 () Bool)

(assert (=> d!138435 m!1154587))

(assert (=> d!138435 m!1154517))

(declare-fun m!1154589 () Bool)

(assert (=> b!1253631 m!1154589))

(declare-fun m!1154591 () Bool)

(assert (=> b!1253623 m!1154591))

(assert (=> b!1253629 m!1154573))

(assert (=> b!1253629 m!1154573))

(assert (=> b!1253629 m!1154583))

(assert (=> b!1253628 m!1154573))

(declare-fun m!1154593 () Bool)

(assert (=> b!1253628 m!1154593))

(assert (=> b!1253628 m!1154577))

(declare-fun m!1154595 () Bool)

(assert (=> b!1253628 m!1154595))

(declare-fun m!1154597 () Bool)

(assert (=> b!1253628 m!1154597))

(assert (=> b!1253628 m!1154595))

(assert (=> b!1253628 m!1154575))

(assert (=> b!1253628 m!1154577))

(assert (=> b!1253628 m!1154575))

(assert (=> b!1253628 m!1154581))

(declare-fun m!1154599 () Bool)

(assert (=> b!1253628 m!1154599))

(assert (=> bm!61715 m!1154589))

(declare-fun m!1154601 () Bool)

(assert (=> b!1253627 m!1154601))

(assert (=> b!1253553 d!138435))

(declare-fun d!138437 () Bool)

(declare-fun e!712106 () Bool)

(assert (=> d!138437 e!712106))

(declare-fun res!835696 () Bool)

(assert (=> d!138437 (=> (not res!835696) (not e!712106))))

(declare-fun lt!565769 () ListLongMap!18441)

(assert (=> d!138437 (= res!835696 (not (contains!7543 lt!565769 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!712109 () ListLongMap!18441)

(assert (=> d!138437 (= lt!565769 e!712109)))

(declare-fun c!122645 () Bool)

(assert (=> d!138437 (= c!122645 (bvsge #b00000000000000000000000000000000 (size!39674 _keys!1118)))))

(assert (=> d!138437 (validMask!0 mask!1466)))

(assert (=> d!138437 (= (getCurrentListMapNoExtraKeys!5663 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!565769)))

(declare-fun b!1253634 () Bool)

(assert (=> b!1253634 (= e!712109 (ListLongMap!18442 Nil!27804))))

(declare-fun b!1253635 () Bool)

(declare-fun e!712104 () Bool)

(declare-fun e!712108 () Bool)

(assert (=> b!1253635 (= e!712104 e!712108)))

(declare-fun c!122647 () Bool)

(assert (=> b!1253635 (= c!122647 (bvslt #b00000000000000000000000000000000 (size!39674 _keys!1118)))))

(declare-fun b!1253636 () Bool)

(assert (=> b!1253636 (= e!712106 e!712104)))

(declare-fun c!122648 () Bool)

(declare-fun e!712105 () Bool)

(assert (=> b!1253636 (= c!122648 e!712105)))

(declare-fun res!835697 () Bool)

(assert (=> b!1253636 (=> (not res!835697) (not e!712105))))

(assert (=> b!1253636 (= res!835697 (bvslt #b00000000000000000000000000000000 (size!39674 _keys!1118)))))

(declare-fun b!1253637 () Bool)

(assert (=> b!1253637 (= e!712108 (isEmpty!1029 lt!565769))))

(declare-fun b!1253638 () Bool)

(assert (=> b!1253638 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39674 _keys!1118)))))

(assert (=> b!1253638 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39675 _values!914)))))

(declare-fun e!712107 () Bool)

(assert (=> b!1253638 (= e!712107 (= (apply!992 lt!565769 (select (arr!39137 _keys!1118) #b00000000000000000000000000000000)) (get!20093 (select (arr!39138 _values!914) #b00000000000000000000000000000000) (dynLambda!3444 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1253639 () Bool)

(assert (=> b!1253639 (= e!712104 e!712107)))

(assert (=> b!1253639 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39674 _keys!1118)))))

(declare-fun res!835695 () Bool)

(assert (=> b!1253639 (= res!835695 (contains!7543 lt!565769 (select (arr!39137 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1253639 (=> (not res!835695) (not e!712107))))

(declare-fun b!1253640 () Bool)

(assert (=> b!1253640 (= e!712105 (validKeyInArray!0 (select (arr!39137 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1253640 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1253641 () Bool)

(declare-fun res!835694 () Bool)

(assert (=> b!1253641 (=> (not res!835694) (not e!712106))))

(assert (=> b!1253641 (= res!835694 (not (contains!7543 lt!565769 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1253642 () Bool)

(declare-fun lt!565767 () Unit!41610)

(declare-fun lt!565772 () Unit!41610)

(assert (=> b!1253642 (= lt!565767 lt!565772)))

(declare-fun lt!565770 () (_ BitVec 64))

(declare-fun lt!565773 () V!47663)

(declare-fun lt!565768 () (_ BitVec 64))

(declare-fun lt!565771 () ListLongMap!18441)

(assert (=> b!1253642 (not (contains!7543 (+!4196 lt!565771 (tuple2!20561 lt!565770 lt!565773)) lt!565768))))

(assert (=> b!1253642 (= lt!565772 (addStillNotContains!313 lt!565771 lt!565770 lt!565773 lt!565768))))

(assert (=> b!1253642 (= lt!565768 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1253642 (= lt!565773 (get!20093 (select (arr!39138 _values!914) #b00000000000000000000000000000000) (dynLambda!3444 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1253642 (= lt!565770 (select (arr!39137 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!61719 () ListLongMap!18441)

(assert (=> b!1253642 (= lt!565771 call!61719)))

(declare-fun e!712110 () ListLongMap!18441)

(assert (=> b!1253642 (= e!712110 (+!4196 call!61719 (tuple2!20561 (select (arr!39137 _keys!1118) #b00000000000000000000000000000000) (get!20093 (select (arr!39138 _values!914) #b00000000000000000000000000000000) (dynLambda!3444 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!61716 () Bool)

(assert (=> bm!61716 (= call!61719 (getCurrentListMapNoExtraKeys!5663 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1253643 () Bool)

(assert (=> b!1253643 (= e!712109 e!712110)))

(declare-fun c!122646 () Bool)

(assert (=> b!1253643 (= c!122646 (validKeyInArray!0 (select (arr!39137 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1253644 () Bool)

(assert (=> b!1253644 (= e!712110 call!61719)))

(declare-fun b!1253645 () Bool)

(assert (=> b!1253645 (= e!712108 (= lt!565769 (getCurrentListMapNoExtraKeys!5663 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(assert (= (and d!138437 c!122645) b!1253634))

(assert (= (and d!138437 (not c!122645)) b!1253643))

(assert (= (and b!1253643 c!122646) b!1253642))

(assert (= (and b!1253643 (not c!122646)) b!1253644))

(assert (= (or b!1253642 b!1253644) bm!61716))

(assert (= (and d!138437 res!835696) b!1253641))

(assert (= (and b!1253641 res!835694) b!1253636))

(assert (= (and b!1253636 res!835697) b!1253640))

(assert (= (and b!1253636 c!122648) b!1253639))

(assert (= (and b!1253636 (not c!122648)) b!1253635))

(assert (= (and b!1253639 res!835695) b!1253638))

(assert (= (and b!1253635 c!122647) b!1253645))

(assert (= (and b!1253635 (not c!122647)) b!1253637))

(declare-fun b_lambda!22565 () Bool)

(assert (=> (not b_lambda!22565) (not b!1253638)))

(assert (=> b!1253638 t!41279))

(declare-fun b_and!44629 () Bool)

(assert (= b_and!44627 (and (=> t!41279 result!23279) b_and!44629)))

(declare-fun b_lambda!22567 () Bool)

(assert (=> (not b_lambda!22567) (not b!1253642)))

(assert (=> b!1253642 t!41279))

(declare-fun b_and!44631 () Bool)

(assert (= b_and!44629 (and (=> t!41279 result!23279) b_and!44631)))

(assert (=> b!1253638 m!1154573))

(assert (=> b!1253638 m!1154575))

(assert (=> b!1253638 m!1154577))

(assert (=> b!1253638 m!1154573))

(declare-fun m!1154603 () Bool)

(assert (=> b!1253638 m!1154603))

(assert (=> b!1253638 m!1154577))

(assert (=> b!1253638 m!1154575))

(assert (=> b!1253638 m!1154581))

(assert (=> b!1253640 m!1154573))

(assert (=> b!1253640 m!1154573))

(assert (=> b!1253640 m!1154583))

(assert (=> b!1253639 m!1154573))

(assert (=> b!1253639 m!1154573))

(declare-fun m!1154605 () Bool)

(assert (=> b!1253639 m!1154605))

(declare-fun m!1154607 () Bool)

(assert (=> d!138437 m!1154607))

(assert (=> d!138437 m!1154517))

(declare-fun m!1154609 () Bool)

(assert (=> b!1253645 m!1154609))

(declare-fun m!1154611 () Bool)

(assert (=> b!1253637 m!1154611))

(assert (=> b!1253643 m!1154573))

(assert (=> b!1253643 m!1154573))

(assert (=> b!1253643 m!1154583))

(assert (=> b!1253642 m!1154573))

(declare-fun m!1154613 () Bool)

(assert (=> b!1253642 m!1154613))

(assert (=> b!1253642 m!1154577))

(declare-fun m!1154615 () Bool)

(assert (=> b!1253642 m!1154615))

(declare-fun m!1154617 () Bool)

(assert (=> b!1253642 m!1154617))

(assert (=> b!1253642 m!1154615))

(assert (=> b!1253642 m!1154575))

(assert (=> b!1253642 m!1154577))

(assert (=> b!1253642 m!1154575))

(assert (=> b!1253642 m!1154581))

(declare-fun m!1154619 () Bool)

(assert (=> b!1253642 m!1154619))

(assert (=> bm!61716 m!1154609))

(declare-fun m!1154621 () Bool)

(assert (=> b!1253641 m!1154621))

(assert (=> b!1253553 d!138437))

(declare-fun b!1253656 () Bool)

(declare-fun e!712121 () Bool)

(declare-fun e!712119 () Bool)

(assert (=> b!1253656 (= e!712121 e!712119)))

(declare-fun c!122651 () Bool)

(assert (=> b!1253656 (= c!122651 (validKeyInArray!0 (select (arr!39137 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1253657 () Bool)

(declare-fun e!712120 () Bool)

(declare-fun contains!7544 (List!27806 (_ BitVec 64)) Bool)

(assert (=> b!1253657 (= e!712120 (contains!7544 Nil!27803 (select (arr!39137 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138439 () Bool)

(declare-fun res!835706 () Bool)

(declare-fun e!712122 () Bool)

(assert (=> d!138439 (=> res!835706 e!712122)))

(assert (=> d!138439 (= res!835706 (bvsge #b00000000000000000000000000000000 (size!39674 _keys!1118)))))

(assert (=> d!138439 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27803) e!712122)))

(declare-fun b!1253658 () Bool)

(declare-fun call!61722 () Bool)

(assert (=> b!1253658 (= e!712119 call!61722)))

(declare-fun b!1253659 () Bool)

(assert (=> b!1253659 (= e!712122 e!712121)))

(declare-fun res!835705 () Bool)

(assert (=> b!1253659 (=> (not res!835705) (not e!712121))))

(assert (=> b!1253659 (= res!835705 (not e!712120))))

(declare-fun res!835704 () Bool)

(assert (=> b!1253659 (=> (not res!835704) (not e!712120))))

(assert (=> b!1253659 (= res!835704 (validKeyInArray!0 (select (arr!39137 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61719 () Bool)

(assert (=> bm!61719 (= call!61722 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122651 (Cons!27802 (select (arr!39137 _keys!1118) #b00000000000000000000000000000000) Nil!27803) Nil!27803)))))

(declare-fun b!1253660 () Bool)

(assert (=> b!1253660 (= e!712119 call!61722)))

(assert (= (and d!138439 (not res!835706)) b!1253659))

(assert (= (and b!1253659 res!835704) b!1253657))

(assert (= (and b!1253659 res!835705) b!1253656))

(assert (= (and b!1253656 c!122651) b!1253658))

(assert (= (and b!1253656 (not c!122651)) b!1253660))

(assert (= (or b!1253658 b!1253660) bm!61719))

(assert (=> b!1253656 m!1154573))

(assert (=> b!1253656 m!1154573))

(assert (=> b!1253656 m!1154583))

(assert (=> b!1253657 m!1154573))

(assert (=> b!1253657 m!1154573))

(declare-fun m!1154623 () Bool)

(assert (=> b!1253657 m!1154623))

(assert (=> b!1253659 m!1154573))

(assert (=> b!1253659 m!1154573))

(assert (=> b!1253659 m!1154583))

(assert (=> bm!61719 m!1154573))

(declare-fun m!1154625 () Bool)

(assert (=> bm!61719 m!1154625))

(assert (=> b!1253551 d!138439))

(declare-fun b!1253669 () Bool)

(declare-fun e!712130 () Bool)

(declare-fun call!61725 () Bool)

(assert (=> b!1253669 (= e!712130 call!61725)))

(declare-fun b!1253670 () Bool)

(declare-fun e!712131 () Bool)

(assert (=> b!1253670 (= e!712131 call!61725)))

(declare-fun bm!61722 () Bool)

(assert (=> bm!61722 (= call!61725 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1253671 () Bool)

(assert (=> b!1253671 (= e!712130 e!712131)))

(declare-fun lt!565782 () (_ BitVec 64))

(assert (=> b!1253671 (= lt!565782 (select (arr!39137 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!565780 () Unit!41610)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!81155 (_ BitVec 64) (_ BitVec 32)) Unit!41610)

(assert (=> b!1253671 (= lt!565780 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!565782 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!81155 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1253671 (arrayContainsKey!0 _keys!1118 lt!565782 #b00000000000000000000000000000000)))

(declare-fun lt!565781 () Unit!41610)

(assert (=> b!1253671 (= lt!565781 lt!565780)))

(declare-fun res!835711 () Bool)

(declare-datatypes ((SeekEntryResult!9917 0))(
  ( (MissingZero!9917 (index!42039 (_ BitVec 32))) (Found!9917 (index!42040 (_ BitVec 32))) (Intermediate!9917 (undefined!10729 Bool) (index!42041 (_ BitVec 32)) (x!110175 (_ BitVec 32))) (Undefined!9917) (MissingVacant!9917 (index!42042 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!81155 (_ BitVec 32)) SeekEntryResult!9917)

(assert (=> b!1253671 (= res!835711 (= (seekEntryOrOpen!0 (select (arr!39137 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9917 #b00000000000000000000000000000000)))))

(assert (=> b!1253671 (=> (not res!835711) (not e!712131))))

(declare-fun b!1253672 () Bool)

(declare-fun e!712129 () Bool)

(assert (=> b!1253672 (= e!712129 e!712130)))

(declare-fun c!122654 () Bool)

(assert (=> b!1253672 (= c!122654 (validKeyInArray!0 (select (arr!39137 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138441 () Bool)

(declare-fun res!835712 () Bool)

(assert (=> d!138441 (=> res!835712 e!712129)))

(assert (=> d!138441 (= res!835712 (bvsge #b00000000000000000000000000000000 (size!39674 _keys!1118)))))

(assert (=> d!138441 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!712129)))

(assert (= (and d!138441 (not res!835712)) b!1253672))

(assert (= (and b!1253672 c!122654) b!1253671))

(assert (= (and b!1253672 (not c!122654)) b!1253669))

(assert (= (and b!1253671 res!835711) b!1253670))

(assert (= (or b!1253670 b!1253669) bm!61722))

(declare-fun m!1154627 () Bool)

(assert (=> bm!61722 m!1154627))

(assert (=> b!1253671 m!1154573))

(declare-fun m!1154629 () Bool)

(assert (=> b!1253671 m!1154629))

(declare-fun m!1154631 () Bool)

(assert (=> b!1253671 m!1154631))

(assert (=> b!1253671 m!1154573))

(declare-fun m!1154633 () Bool)

(assert (=> b!1253671 m!1154633))

(assert (=> b!1253672 m!1154573))

(assert (=> b!1253672 m!1154573))

(assert (=> b!1253672 m!1154583))

(assert (=> b!1253547 d!138441))

(declare-fun d!138443 () Bool)

(assert (=> d!138443 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!105298 d!138443))

(declare-fun d!138445 () Bool)

(assert (=> d!138445 (= (array_inv!29961 _keys!1118) (bvsge (size!39674 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!105298 d!138445))

(declare-fun d!138447 () Bool)

(assert (=> d!138447 (= (array_inv!29962 _values!914) (bvsge (size!39675 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!105298 d!138447))

(declare-fun b!1253679 () Bool)

(declare-fun e!712137 () Bool)

(assert (=> b!1253679 (= e!712137 tp_is_empty!31723)))

(declare-fun mapNonEmpty!49363 () Bool)

(declare-fun mapRes!49363 () Bool)

(declare-fun tp!93977 () Bool)

(assert (=> mapNonEmpty!49363 (= mapRes!49363 (and tp!93977 e!712137))))

(declare-fun mapKey!49363 () (_ BitVec 32))

(declare-fun mapValue!49363 () ValueCell!15098)

(declare-fun mapRest!49363 () (Array (_ BitVec 32) ValueCell!15098))

(assert (=> mapNonEmpty!49363 (= mapRest!49354 (store mapRest!49363 mapKey!49363 mapValue!49363))))

(declare-fun mapIsEmpty!49363 () Bool)

(assert (=> mapIsEmpty!49363 mapRes!49363))

(declare-fun b!1253680 () Bool)

(declare-fun e!712136 () Bool)

(assert (=> b!1253680 (= e!712136 tp_is_empty!31723)))

(declare-fun condMapEmpty!49363 () Bool)

(declare-fun mapDefault!49363 () ValueCell!15098)

(assert (=> mapNonEmpty!49354 (= condMapEmpty!49363 (= mapRest!49354 ((as const (Array (_ BitVec 32) ValueCell!15098)) mapDefault!49363)))))

(assert (=> mapNonEmpty!49354 (= tp!93961 (and e!712136 mapRes!49363))))

(assert (= (and mapNonEmpty!49354 condMapEmpty!49363) mapIsEmpty!49363))

(assert (= (and mapNonEmpty!49354 (not condMapEmpty!49363)) mapNonEmpty!49363))

(assert (= (and mapNonEmpty!49363 ((_ is ValueCellFull!15098) mapValue!49363)) b!1253679))

(assert (= (and mapNonEmpty!49354 ((_ is ValueCellFull!15098) mapDefault!49363)) b!1253680))

(declare-fun m!1154635 () Bool)

(assert (=> mapNonEmpty!49363 m!1154635))

(declare-fun b_lambda!22569 () Bool)

(assert (= b_lambda!22563 (or (and start!105298 b_free!26821) b_lambda!22569)))

(declare-fun b_lambda!22571 () Bool)

(assert (= b_lambda!22565 (or (and start!105298 b_free!26821) b_lambda!22571)))

(declare-fun b_lambda!22573 () Bool)

(assert (= b_lambda!22567 (or (and start!105298 b_free!26821) b_lambda!22573)))

(declare-fun b_lambda!22575 () Bool)

(assert (= b_lambda!22561 (or (and start!105298 b_free!26821) b_lambda!22575)))

(check-sat (not bm!61719) (not b!1253640) (not b!1253626) (not b!1253627) (not bm!61716) (not bm!61715) (not b!1253637) (not b!1253643) (not d!138435) (not b_lambda!22573) (not b_next!26821) b_and!44631 (not b!1253641) (not b!1253672) (not b_lambda!22569) (not b!1253628) (not b!1253625) (not b!1253659) (not b!1253631) (not b!1253629) (not b!1253623) (not b!1253657) (not b!1253624) (not b_lambda!22571) (not b_lambda!22575) (not b!1253645) (not b!1253639) (not mapNonEmpty!49363) (not d!138433) (not d!138437) (not bm!61722) (not b!1253642) (not b!1253638) (not b!1253671) (not b!1253656) tp_is_empty!31723)
(check-sat b_and!44631 (not b_next!26821))
