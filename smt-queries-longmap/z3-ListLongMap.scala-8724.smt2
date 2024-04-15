; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105812 () Bool)

(assert start!105812)

(declare-fun b_free!27379 () Bool)

(declare-fun b_next!27379 () Bool)

(assert (=> start!105812 (= b_free!27379 (not b_next!27379))))

(declare-fun tp!95666 () Bool)

(declare-fun b_and!45257 () Bool)

(assert (=> start!105812 (= tp!95666 b_and!45257)))

(declare-fun b!1260445 () Bool)

(declare-fun e!717260 () Bool)

(declare-datatypes ((array!82103 0))(
  ( (array!82104 (arr!39606 (Array (_ BitVec 32) (_ BitVec 64))) (size!40144 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82103)

(assert (=> b!1260445 (= e!717260 (bvsle #b00000000000000000000000000000000 (size!40144 _keys!1118)))))

(declare-fun b!1260446 () Bool)

(declare-fun e!717264 () Bool)

(assert (=> b!1260446 (= e!717264 e!717260)))

(declare-fun res!840029 () Bool)

(assert (=> b!1260446 (=> res!840029 e!717260)))

(declare-datatypes ((V!48407 0))(
  ( (V!48408 (val!16203 Int)) )
))
(declare-datatypes ((tuple2!21040 0))(
  ( (tuple2!21041 (_1!10531 (_ BitVec 64)) (_2!10531 V!48407)) )
))
(declare-datatypes ((List!28239 0))(
  ( (Nil!28236) (Cons!28235 (h!29444 tuple2!21040) (t!41727 List!28239)) )
))
(declare-datatypes ((ListLongMap!18913 0))(
  ( (ListLongMap!18914 (toList!9472 List!28239)) )
))
(declare-fun lt!571034 () ListLongMap!18913)

(declare-fun lt!571035 () ListLongMap!18913)

(declare-fun -!2089 (ListLongMap!18913 (_ BitVec 64)) ListLongMap!18913)

(assert (=> b!1260446 (= res!840029 (not (= (-!2089 lt!571034 #b1000000000000000000000000000000000000000000000000000000000000000) lt!571035)))))

(declare-fun lt!571038 () ListLongMap!18913)

(declare-fun lt!571036 () ListLongMap!18913)

(assert (=> b!1260446 (= (-!2089 lt!571038 #b1000000000000000000000000000000000000000000000000000000000000000) lt!571036)))

(declare-datatypes ((Unit!41888 0))(
  ( (Unit!41889) )
))
(declare-fun lt!571039 () Unit!41888)

(declare-fun minValueBefore!43 () V!48407)

(declare-fun addThenRemoveForNewKeyIsSame!346 (ListLongMap!18913 (_ BitVec 64) V!48407) Unit!41888)

(assert (=> b!1260446 (= lt!571039 (addThenRemoveForNewKeyIsSame!346 lt!571036 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!717259 () Bool)

(assert (=> b!1260446 e!717259))

(declare-fun res!840031 () Bool)

(assert (=> b!1260446 (=> (not res!840031) (not e!717259))))

(assert (=> b!1260446 (= res!840031 (= lt!571034 lt!571038))))

(declare-fun +!4273 (ListLongMap!18913 tuple2!21040) ListLongMap!18913)

(assert (=> b!1260446 (= lt!571038 (+!4273 lt!571036 (tuple2!21041 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!571032 () ListLongMap!18913)

(declare-fun lt!571033 () tuple2!21040)

(assert (=> b!1260446 (= lt!571036 (+!4273 lt!571032 lt!571033))))

(declare-fun zeroValue!871 () V!48407)

(assert (=> b!1260446 (= lt!571033 (tuple2!21041 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48407)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((ValueCell!15377 0))(
  ( (ValueCellFull!15377 (v!18905 V!48407)) (EmptyCell!15377) )
))
(declare-datatypes ((array!82105 0))(
  ( (array!82106 (arr!39607 (Array (_ BitVec 32) ValueCell!15377)) (size!40145 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82105)

(declare-fun getCurrentListMap!4555 (array!82103 array!82105 (_ BitVec 32) (_ BitVec 32) V!48407 V!48407 (_ BitVec 32) Int) ListLongMap!18913)

(assert (=> b!1260446 (= lt!571035 (getCurrentListMap!4555 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1260446 (= lt!571034 (getCurrentListMap!4555 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260447 () Bool)

(declare-fun res!840032 () Bool)

(declare-fun e!717263 () Bool)

(assert (=> b!1260447 (=> (not res!840032) (not e!717263))))

(assert (=> b!1260447 (= res!840032 (and (= (size!40145 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40144 _keys!1118) (size!40145 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!50221 () Bool)

(declare-fun mapRes!50221 () Bool)

(assert (=> mapIsEmpty!50221 mapRes!50221))

(declare-fun b!1260448 () Bool)

(declare-fun e!717265 () Bool)

(declare-fun tp_is_empty!32281 () Bool)

(assert (=> b!1260448 (= e!717265 tp_is_empty!32281)))

(declare-fun b!1260449 () Bool)

(assert (=> b!1260449 (= e!717263 (not e!717264))))

(declare-fun res!840028 () Bool)

(assert (=> b!1260449 (=> res!840028 e!717264)))

(assert (=> b!1260449 (= res!840028 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!571040 () ListLongMap!18913)

(assert (=> b!1260449 (= lt!571032 lt!571040)))

(declare-fun lt!571037 () Unit!41888)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1163 (array!82103 array!82105 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48407 V!48407 V!48407 V!48407 (_ BitVec 32) Int) Unit!41888)

(assert (=> b!1260449 (= lt!571037 (lemmaNoChangeToArrayThenSameMapNoExtras!1163 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5841 (array!82103 array!82105 (_ BitVec 32) (_ BitVec 32) V!48407 V!48407 (_ BitVec 32) Int) ListLongMap!18913)

(assert (=> b!1260449 (= lt!571040 (getCurrentListMapNoExtraKeys!5841 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260449 (= lt!571032 (getCurrentListMapNoExtraKeys!5841 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!840033 () Bool)

(assert (=> start!105812 (=> (not res!840033) (not e!717263))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105812 (= res!840033 (validMask!0 mask!1466))))

(assert (=> start!105812 e!717263))

(assert (=> start!105812 true))

(assert (=> start!105812 tp!95666))

(assert (=> start!105812 tp_is_empty!32281))

(declare-fun array_inv!30299 (array!82103) Bool)

(assert (=> start!105812 (array_inv!30299 _keys!1118)))

(declare-fun e!717262 () Bool)

(declare-fun array_inv!30300 (array!82105) Bool)

(assert (=> start!105812 (and (array_inv!30300 _values!914) e!717262)))

(declare-fun b!1260450 () Bool)

(declare-fun res!840030 () Bool)

(assert (=> b!1260450 (=> (not res!840030) (not e!717263))))

(declare-datatypes ((List!28240 0))(
  ( (Nil!28237) (Cons!28236 (h!29445 (_ BitVec 64)) (t!41728 List!28240)) )
))
(declare-fun arrayNoDuplicates!0 (array!82103 (_ BitVec 32) List!28240) Bool)

(assert (=> b!1260450 (= res!840030 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28237))))

(declare-fun mapNonEmpty!50221 () Bool)

(declare-fun tp!95665 () Bool)

(assert (=> mapNonEmpty!50221 (= mapRes!50221 (and tp!95665 e!717265))))

(declare-fun mapRest!50221 () (Array (_ BitVec 32) ValueCell!15377))

(declare-fun mapKey!50221 () (_ BitVec 32))

(declare-fun mapValue!50221 () ValueCell!15377)

(assert (=> mapNonEmpty!50221 (= (arr!39607 _values!914) (store mapRest!50221 mapKey!50221 mapValue!50221))))

(declare-fun b!1260451 () Bool)

(assert (=> b!1260451 (= e!717259 (= lt!571035 (+!4273 lt!571040 lt!571033)))))

(declare-fun b!1260452 () Bool)

(declare-fun e!717258 () Bool)

(assert (=> b!1260452 (= e!717262 (and e!717258 mapRes!50221))))

(declare-fun condMapEmpty!50221 () Bool)

(declare-fun mapDefault!50221 () ValueCell!15377)

(assert (=> b!1260452 (= condMapEmpty!50221 (= (arr!39607 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15377)) mapDefault!50221)))))

(declare-fun b!1260453 () Bool)

(declare-fun res!840034 () Bool)

(assert (=> b!1260453 (=> (not res!840034) (not e!717263))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82103 (_ BitVec 32)) Bool)

(assert (=> b!1260453 (= res!840034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1260454 () Bool)

(assert (=> b!1260454 (= e!717258 tp_is_empty!32281)))

(assert (= (and start!105812 res!840033) b!1260447))

(assert (= (and b!1260447 res!840032) b!1260453))

(assert (= (and b!1260453 res!840034) b!1260450))

(assert (= (and b!1260450 res!840030) b!1260449))

(assert (= (and b!1260449 (not res!840028)) b!1260446))

(assert (= (and b!1260446 res!840031) b!1260451))

(assert (= (and b!1260446 (not res!840029)) b!1260445))

(assert (= (and b!1260452 condMapEmpty!50221) mapIsEmpty!50221))

(assert (= (and b!1260452 (not condMapEmpty!50221)) mapNonEmpty!50221))

(get-info :version)

(assert (= (and mapNonEmpty!50221 ((_ is ValueCellFull!15377) mapValue!50221)) b!1260448))

(assert (= (and b!1260452 ((_ is ValueCellFull!15377) mapDefault!50221)) b!1260454))

(assert (= start!105812 b!1260452))

(declare-fun m!1160733 () Bool)

(assert (=> b!1260450 m!1160733))

(declare-fun m!1160735 () Bool)

(assert (=> b!1260451 m!1160735))

(declare-fun m!1160737 () Bool)

(assert (=> b!1260446 m!1160737))

(declare-fun m!1160739 () Bool)

(assert (=> b!1260446 m!1160739))

(declare-fun m!1160741 () Bool)

(assert (=> b!1260446 m!1160741))

(declare-fun m!1160743 () Bool)

(assert (=> b!1260446 m!1160743))

(declare-fun m!1160745 () Bool)

(assert (=> b!1260446 m!1160745))

(declare-fun m!1160747 () Bool)

(assert (=> b!1260446 m!1160747))

(declare-fun m!1160749 () Bool)

(assert (=> b!1260446 m!1160749))

(declare-fun m!1160751 () Bool)

(assert (=> start!105812 m!1160751))

(declare-fun m!1160753 () Bool)

(assert (=> start!105812 m!1160753))

(declare-fun m!1160755 () Bool)

(assert (=> start!105812 m!1160755))

(declare-fun m!1160757 () Bool)

(assert (=> b!1260449 m!1160757))

(declare-fun m!1160759 () Bool)

(assert (=> b!1260449 m!1160759))

(declare-fun m!1160761 () Bool)

(assert (=> b!1260449 m!1160761))

(declare-fun m!1160763 () Bool)

(assert (=> mapNonEmpty!50221 m!1160763))

(declare-fun m!1160765 () Bool)

(assert (=> b!1260453 m!1160765))

(check-sat (not mapNonEmpty!50221) (not b!1260450) b_and!45257 (not b!1260446) (not start!105812) (not b_next!27379) (not b!1260453) (not b!1260451) tp_is_empty!32281 (not b!1260449))
(check-sat b_and!45257 (not b_next!27379))
(get-model)

(declare-fun b!1260523 () Bool)

(declare-fun e!717322 () Bool)

(declare-fun call!61902 () Bool)

(assert (=> b!1260523 (= e!717322 call!61902)))

(declare-fun d!138259 () Bool)

(declare-fun res!840081 () Bool)

(declare-fun e!717320 () Bool)

(assert (=> d!138259 (=> res!840081 e!717320)))

(assert (=> d!138259 (= res!840081 (bvsge #b00000000000000000000000000000000 (size!40144 _keys!1118)))))

(assert (=> d!138259 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!717320)))

(declare-fun b!1260524 () Bool)

(assert (=> b!1260524 (= e!717320 e!717322)))

(declare-fun c!122587 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1260524 (= c!122587 (validKeyInArray!0 (select (arr!39606 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1260525 () Bool)

(declare-fun e!717321 () Bool)

(assert (=> b!1260525 (= e!717321 call!61902)))

(declare-fun bm!61899 () Bool)

(assert (=> bm!61899 (= call!61902 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1260526 () Bool)

(assert (=> b!1260526 (= e!717322 e!717321)))

(declare-fun lt!571102 () (_ BitVec 64))

(assert (=> b!1260526 (= lt!571102 (select (arr!39606 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!571103 () Unit!41888)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82103 (_ BitVec 64) (_ BitVec 32)) Unit!41888)

(assert (=> b!1260526 (= lt!571103 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!571102 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82103 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1260526 (arrayContainsKey!0 _keys!1118 lt!571102 #b00000000000000000000000000000000)))

(declare-fun lt!571101 () Unit!41888)

(assert (=> b!1260526 (= lt!571101 lt!571103)))

(declare-fun res!840082 () Bool)

(declare-datatypes ((SeekEntryResult!9970 0))(
  ( (MissingZero!9970 (index!42251 (_ BitVec 32))) (Found!9970 (index!42252 (_ BitVec 32))) (Intermediate!9970 (undefined!10782 Bool) (index!42253 (_ BitVec 32)) (x!111057 (_ BitVec 32))) (Undefined!9970) (MissingVacant!9970 (index!42254 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82103 (_ BitVec 32)) SeekEntryResult!9970)

(assert (=> b!1260526 (= res!840082 (= (seekEntryOrOpen!0 (select (arr!39606 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9970 #b00000000000000000000000000000000)))))

(assert (=> b!1260526 (=> (not res!840082) (not e!717321))))

(assert (= (and d!138259 (not res!840081)) b!1260524))

(assert (= (and b!1260524 c!122587) b!1260526))

(assert (= (and b!1260524 (not c!122587)) b!1260523))

(assert (= (and b!1260526 res!840082) b!1260525))

(assert (= (or b!1260525 b!1260523) bm!61899))

(declare-fun m!1160835 () Bool)

(assert (=> b!1260524 m!1160835))

(assert (=> b!1260524 m!1160835))

(declare-fun m!1160837 () Bool)

(assert (=> b!1260524 m!1160837))

(declare-fun m!1160839 () Bool)

(assert (=> bm!61899 m!1160839))

(assert (=> b!1260526 m!1160835))

(declare-fun m!1160841 () Bool)

(assert (=> b!1260526 m!1160841))

(declare-fun m!1160843 () Bool)

(assert (=> b!1260526 m!1160843))

(assert (=> b!1260526 m!1160835))

(declare-fun m!1160845 () Bool)

(assert (=> b!1260526 m!1160845))

(assert (=> b!1260453 d!138259))

(declare-fun d!138261 () Bool)

(assert (=> d!138261 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!105812 d!138261))

(declare-fun d!138263 () Bool)

(assert (=> d!138263 (= (array_inv!30299 _keys!1118) (bvsge (size!40144 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!105812 d!138263))

(declare-fun d!138265 () Bool)

(assert (=> d!138265 (= (array_inv!30300 _values!914) (bvsge (size!40145 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!105812 d!138265))

(declare-fun d!138267 () Bool)

(assert (=> d!138267 (= (getCurrentListMapNoExtraKeys!5841 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5841 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571106 () Unit!41888)

(declare-fun choose!1875 (array!82103 array!82105 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48407 V!48407 V!48407 V!48407 (_ BitVec 32) Int) Unit!41888)

(assert (=> d!138267 (= lt!571106 (choose!1875 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138267 (validMask!0 mask!1466)))

(assert (=> d!138267 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1163 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!571106)))

(declare-fun bs!35641 () Bool)

(assert (= bs!35641 d!138267))

(assert (=> bs!35641 m!1160761))

(assert (=> bs!35641 m!1160759))

(declare-fun m!1160847 () Bool)

(assert (=> bs!35641 m!1160847))

(assert (=> bs!35641 m!1160751))

(assert (=> b!1260449 d!138267))

(declare-fun b!1260552 () Bool)

(declare-fun e!717340 () Bool)

(declare-fun e!717342 () Bool)

(assert (=> b!1260552 (= e!717340 e!717342)))

(declare-fun c!122597 () Bool)

(declare-fun e!717339 () Bool)

(assert (=> b!1260552 (= c!122597 e!717339)))

(declare-fun res!840094 () Bool)

(assert (=> b!1260552 (=> (not res!840094) (not e!717339))))

(assert (=> b!1260552 (= res!840094 (bvslt #b00000000000000000000000000000000 (size!40144 _keys!1118)))))

(declare-fun b!1260553 () Bool)

(declare-fun e!717337 () Bool)

(assert (=> b!1260553 (= e!717342 e!717337)))

(declare-fun c!122596 () Bool)

(assert (=> b!1260553 (= c!122596 (bvslt #b00000000000000000000000000000000 (size!40144 _keys!1118)))))

(declare-fun b!1260554 () Bool)

(declare-fun e!717341 () Bool)

(assert (=> b!1260554 (= e!717342 e!717341)))

(assert (=> b!1260554 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40144 _keys!1118)))))

(declare-fun res!840092 () Bool)

(declare-fun lt!571122 () ListLongMap!18913)

(declare-fun contains!7549 (ListLongMap!18913 (_ BitVec 64)) Bool)

(assert (=> b!1260554 (= res!840092 (contains!7549 lt!571122 (select (arr!39606 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1260554 (=> (not res!840092) (not e!717341))))

(declare-fun b!1260555 () Bool)

(declare-fun lt!571121 () Unit!41888)

(declare-fun lt!571123 () Unit!41888)

(assert (=> b!1260555 (= lt!571121 lt!571123)))

(declare-fun lt!571126 () (_ BitVec 64))

(declare-fun lt!571125 () ListLongMap!18913)

(declare-fun lt!571124 () V!48407)

(declare-fun lt!571127 () (_ BitVec 64))

(assert (=> b!1260555 (not (contains!7549 (+!4273 lt!571125 (tuple2!21041 lt!571126 lt!571124)) lt!571127))))

(declare-fun addStillNotContains!322 (ListLongMap!18913 (_ BitVec 64) V!48407 (_ BitVec 64)) Unit!41888)

(assert (=> b!1260555 (= lt!571123 (addStillNotContains!322 lt!571125 lt!571126 lt!571124 lt!571127))))

(assert (=> b!1260555 (= lt!571127 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!20239 (ValueCell!15377 V!48407) V!48407)

(declare-fun dynLambda!3416 (Int (_ BitVec 64)) V!48407)

(assert (=> b!1260555 (= lt!571124 (get!20239 (select (arr!39607 _values!914) #b00000000000000000000000000000000) (dynLambda!3416 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1260555 (= lt!571126 (select (arr!39606 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!61905 () ListLongMap!18913)

(assert (=> b!1260555 (= lt!571125 call!61905)))

(declare-fun e!717343 () ListLongMap!18913)

(assert (=> b!1260555 (= e!717343 (+!4273 call!61905 (tuple2!21041 (select (arr!39606 _keys!1118) #b00000000000000000000000000000000) (get!20239 (select (arr!39607 _values!914) #b00000000000000000000000000000000) (dynLambda!3416 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1260556 () Bool)

(assert (=> b!1260556 (= e!717337 (= lt!571122 (getCurrentListMapNoExtraKeys!5841 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1260557 () Bool)

(declare-fun e!717338 () ListLongMap!18913)

(assert (=> b!1260557 (= e!717338 (ListLongMap!18914 Nil!28236))))

(declare-fun b!1260558 () Bool)

(assert (=> b!1260558 (= e!717343 call!61905)))

(declare-fun bm!61902 () Bool)

(assert (=> bm!61902 (= call!61905 (getCurrentListMapNoExtraKeys!5841 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1260559 () Bool)

(declare-fun isEmpty!1041 (ListLongMap!18913) Bool)

(assert (=> b!1260559 (= e!717337 (isEmpty!1041 lt!571122))))

(declare-fun b!1260560 () Bool)

(assert (=> b!1260560 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40144 _keys!1118)))))

(assert (=> b!1260560 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40145 _values!914)))))

(declare-fun apply!986 (ListLongMap!18913 (_ BitVec 64)) V!48407)

(assert (=> b!1260560 (= e!717341 (= (apply!986 lt!571122 (select (arr!39606 _keys!1118) #b00000000000000000000000000000000)) (get!20239 (select (arr!39607 _values!914) #b00000000000000000000000000000000) (dynLambda!3416 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!138269 () Bool)

(assert (=> d!138269 e!717340))

(declare-fun res!840091 () Bool)

(assert (=> d!138269 (=> (not res!840091) (not e!717340))))

(assert (=> d!138269 (= res!840091 (not (contains!7549 lt!571122 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138269 (= lt!571122 e!717338)))

(declare-fun c!122599 () Bool)

(assert (=> d!138269 (= c!122599 (bvsge #b00000000000000000000000000000000 (size!40144 _keys!1118)))))

(assert (=> d!138269 (validMask!0 mask!1466)))

(assert (=> d!138269 (= (getCurrentListMapNoExtraKeys!5841 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!571122)))

(declare-fun b!1260551 () Bool)

(declare-fun res!840093 () Bool)

(assert (=> b!1260551 (=> (not res!840093) (not e!717340))))

(assert (=> b!1260551 (= res!840093 (not (contains!7549 lt!571122 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1260561 () Bool)

(assert (=> b!1260561 (= e!717338 e!717343)))

(declare-fun c!122598 () Bool)

(assert (=> b!1260561 (= c!122598 (validKeyInArray!0 (select (arr!39606 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1260562 () Bool)

(assert (=> b!1260562 (= e!717339 (validKeyInArray!0 (select (arr!39606 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1260562 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!138269 c!122599) b!1260557))

(assert (= (and d!138269 (not c!122599)) b!1260561))

(assert (= (and b!1260561 c!122598) b!1260555))

(assert (= (and b!1260561 (not c!122598)) b!1260558))

(assert (= (or b!1260555 b!1260558) bm!61902))

(assert (= (and d!138269 res!840091) b!1260551))

(assert (= (and b!1260551 res!840093) b!1260552))

(assert (= (and b!1260552 res!840094) b!1260562))

(assert (= (and b!1260552 c!122597) b!1260554))

(assert (= (and b!1260552 (not c!122597)) b!1260553))

(assert (= (and b!1260554 res!840092) b!1260560))

(assert (= (and b!1260553 c!122596) b!1260556))

(assert (= (and b!1260553 (not c!122596)) b!1260559))

(declare-fun b_lambda!22757 () Bool)

(assert (=> (not b_lambda!22757) (not b!1260555)))

(declare-fun t!41734 () Bool)

(declare-fun tb!11305 () Bool)

(assert (=> (and start!105812 (= defaultEntry!922 defaultEntry!922) t!41734) tb!11305))

(declare-fun result!23339 () Bool)

(assert (=> tb!11305 (= result!23339 tp_is_empty!32281)))

(assert (=> b!1260555 t!41734))

(declare-fun b_and!45263 () Bool)

(assert (= b_and!45257 (and (=> t!41734 result!23339) b_and!45263)))

(declare-fun b_lambda!22759 () Bool)

(assert (=> (not b_lambda!22759) (not b!1260560)))

(assert (=> b!1260560 t!41734))

(declare-fun b_and!45265 () Bool)

(assert (= b_and!45263 (and (=> t!41734 result!23339) b_and!45265)))

(assert (=> b!1260554 m!1160835))

(assert (=> b!1260554 m!1160835))

(declare-fun m!1160849 () Bool)

(assert (=> b!1260554 m!1160849))

(declare-fun m!1160851 () Bool)

(assert (=> d!138269 m!1160851))

(assert (=> d!138269 m!1160751))

(declare-fun m!1160853 () Bool)

(assert (=> b!1260555 m!1160853))

(declare-fun m!1160855 () Bool)

(assert (=> b!1260555 m!1160855))

(declare-fun m!1160857 () Bool)

(assert (=> b!1260555 m!1160857))

(assert (=> b!1260555 m!1160855))

(declare-fun m!1160859 () Bool)

(assert (=> b!1260555 m!1160859))

(assert (=> b!1260555 m!1160835))

(declare-fun m!1160861 () Bool)

(assert (=> b!1260555 m!1160861))

(declare-fun m!1160863 () Bool)

(assert (=> b!1260555 m!1160863))

(assert (=> b!1260555 m!1160861))

(declare-fun m!1160865 () Bool)

(assert (=> b!1260555 m!1160865))

(assert (=> b!1260555 m!1160857))

(assert (=> b!1260562 m!1160835))

(assert (=> b!1260562 m!1160835))

(assert (=> b!1260562 m!1160837))

(assert (=> b!1260561 m!1160835))

(assert (=> b!1260561 m!1160835))

(assert (=> b!1260561 m!1160837))

(declare-fun m!1160867 () Bool)

(assert (=> b!1260556 m!1160867))

(declare-fun m!1160869 () Bool)

(assert (=> b!1260559 m!1160869))

(assert (=> bm!61902 m!1160867))

(assert (=> b!1260560 m!1160855))

(assert (=> b!1260560 m!1160857))

(assert (=> b!1260560 m!1160855))

(assert (=> b!1260560 m!1160859))

(assert (=> b!1260560 m!1160835))

(assert (=> b!1260560 m!1160835))

(declare-fun m!1160871 () Bool)

(assert (=> b!1260560 m!1160871))

(assert (=> b!1260560 m!1160857))

(declare-fun m!1160873 () Bool)

(assert (=> b!1260551 m!1160873))

(assert (=> b!1260449 d!138269))

(declare-fun b!1260566 () Bool)

(declare-fun e!717347 () Bool)

(declare-fun e!717349 () Bool)

(assert (=> b!1260566 (= e!717347 e!717349)))

(declare-fun c!122601 () Bool)

(declare-fun e!717346 () Bool)

(assert (=> b!1260566 (= c!122601 e!717346)))

(declare-fun res!840098 () Bool)

(assert (=> b!1260566 (=> (not res!840098) (not e!717346))))

(assert (=> b!1260566 (= res!840098 (bvslt #b00000000000000000000000000000000 (size!40144 _keys!1118)))))

(declare-fun b!1260567 () Bool)

(declare-fun e!717344 () Bool)

(assert (=> b!1260567 (= e!717349 e!717344)))

(declare-fun c!122600 () Bool)

(assert (=> b!1260567 (= c!122600 (bvslt #b00000000000000000000000000000000 (size!40144 _keys!1118)))))

(declare-fun b!1260568 () Bool)

(declare-fun e!717348 () Bool)

(assert (=> b!1260568 (= e!717349 e!717348)))

(assert (=> b!1260568 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40144 _keys!1118)))))

(declare-fun res!840096 () Bool)

(declare-fun lt!571129 () ListLongMap!18913)

(assert (=> b!1260568 (= res!840096 (contains!7549 lt!571129 (select (arr!39606 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1260568 (=> (not res!840096) (not e!717348))))

(declare-fun b!1260569 () Bool)

(declare-fun lt!571128 () Unit!41888)

(declare-fun lt!571130 () Unit!41888)

(assert (=> b!1260569 (= lt!571128 lt!571130)))

(declare-fun lt!571134 () (_ BitVec 64))

(declare-fun lt!571133 () (_ BitVec 64))

(declare-fun lt!571131 () V!48407)

(declare-fun lt!571132 () ListLongMap!18913)

(assert (=> b!1260569 (not (contains!7549 (+!4273 lt!571132 (tuple2!21041 lt!571133 lt!571131)) lt!571134))))

(assert (=> b!1260569 (= lt!571130 (addStillNotContains!322 lt!571132 lt!571133 lt!571131 lt!571134))))

(assert (=> b!1260569 (= lt!571134 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1260569 (= lt!571131 (get!20239 (select (arr!39607 _values!914) #b00000000000000000000000000000000) (dynLambda!3416 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1260569 (= lt!571133 (select (arr!39606 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!61906 () ListLongMap!18913)

(assert (=> b!1260569 (= lt!571132 call!61906)))

(declare-fun e!717350 () ListLongMap!18913)

(assert (=> b!1260569 (= e!717350 (+!4273 call!61906 (tuple2!21041 (select (arr!39606 _keys!1118) #b00000000000000000000000000000000) (get!20239 (select (arr!39607 _values!914) #b00000000000000000000000000000000) (dynLambda!3416 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1260570 () Bool)

(assert (=> b!1260570 (= e!717344 (= lt!571129 (getCurrentListMapNoExtraKeys!5841 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1260571 () Bool)

(declare-fun e!717345 () ListLongMap!18913)

(assert (=> b!1260571 (= e!717345 (ListLongMap!18914 Nil!28236))))

(declare-fun b!1260572 () Bool)

(assert (=> b!1260572 (= e!717350 call!61906)))

(declare-fun bm!61903 () Bool)

(assert (=> bm!61903 (= call!61906 (getCurrentListMapNoExtraKeys!5841 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1260573 () Bool)

(assert (=> b!1260573 (= e!717344 (isEmpty!1041 lt!571129))))

(declare-fun b!1260574 () Bool)

(assert (=> b!1260574 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40144 _keys!1118)))))

(assert (=> b!1260574 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40145 _values!914)))))

(assert (=> b!1260574 (= e!717348 (= (apply!986 lt!571129 (select (arr!39606 _keys!1118) #b00000000000000000000000000000000)) (get!20239 (select (arr!39607 _values!914) #b00000000000000000000000000000000) (dynLambda!3416 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!138271 () Bool)

(assert (=> d!138271 e!717347))

(declare-fun res!840095 () Bool)

(assert (=> d!138271 (=> (not res!840095) (not e!717347))))

(assert (=> d!138271 (= res!840095 (not (contains!7549 lt!571129 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138271 (= lt!571129 e!717345)))

(declare-fun c!122603 () Bool)

(assert (=> d!138271 (= c!122603 (bvsge #b00000000000000000000000000000000 (size!40144 _keys!1118)))))

(assert (=> d!138271 (validMask!0 mask!1466)))

(assert (=> d!138271 (= (getCurrentListMapNoExtraKeys!5841 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!571129)))

(declare-fun b!1260565 () Bool)

(declare-fun res!840097 () Bool)

(assert (=> b!1260565 (=> (not res!840097) (not e!717347))))

(assert (=> b!1260565 (= res!840097 (not (contains!7549 lt!571129 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1260575 () Bool)

(assert (=> b!1260575 (= e!717345 e!717350)))

(declare-fun c!122602 () Bool)

(assert (=> b!1260575 (= c!122602 (validKeyInArray!0 (select (arr!39606 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1260576 () Bool)

(assert (=> b!1260576 (= e!717346 (validKeyInArray!0 (select (arr!39606 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1260576 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!138271 c!122603) b!1260571))

(assert (= (and d!138271 (not c!122603)) b!1260575))

(assert (= (and b!1260575 c!122602) b!1260569))

(assert (= (and b!1260575 (not c!122602)) b!1260572))

(assert (= (or b!1260569 b!1260572) bm!61903))

(assert (= (and d!138271 res!840095) b!1260565))

(assert (= (and b!1260565 res!840097) b!1260566))

(assert (= (and b!1260566 res!840098) b!1260576))

(assert (= (and b!1260566 c!122601) b!1260568))

(assert (= (and b!1260566 (not c!122601)) b!1260567))

(assert (= (and b!1260568 res!840096) b!1260574))

(assert (= (and b!1260567 c!122600) b!1260570))

(assert (= (and b!1260567 (not c!122600)) b!1260573))

(declare-fun b_lambda!22761 () Bool)

(assert (=> (not b_lambda!22761) (not b!1260569)))

(assert (=> b!1260569 t!41734))

(declare-fun b_and!45267 () Bool)

(assert (= b_and!45265 (and (=> t!41734 result!23339) b_and!45267)))

(declare-fun b_lambda!22763 () Bool)

(assert (=> (not b_lambda!22763) (not b!1260574)))

(assert (=> b!1260574 t!41734))

(declare-fun b_and!45269 () Bool)

(assert (= b_and!45267 (and (=> t!41734 result!23339) b_and!45269)))

(assert (=> b!1260568 m!1160835))

(assert (=> b!1260568 m!1160835))

(declare-fun m!1160875 () Bool)

(assert (=> b!1260568 m!1160875))

(declare-fun m!1160877 () Bool)

(assert (=> d!138271 m!1160877))

(assert (=> d!138271 m!1160751))

(declare-fun m!1160879 () Bool)

(assert (=> b!1260569 m!1160879))

(assert (=> b!1260569 m!1160855))

(assert (=> b!1260569 m!1160857))

(assert (=> b!1260569 m!1160855))

(assert (=> b!1260569 m!1160859))

(assert (=> b!1260569 m!1160835))

(declare-fun m!1160881 () Bool)

(assert (=> b!1260569 m!1160881))

(declare-fun m!1160883 () Bool)

(assert (=> b!1260569 m!1160883))

(assert (=> b!1260569 m!1160881))

(declare-fun m!1160885 () Bool)

(assert (=> b!1260569 m!1160885))

(assert (=> b!1260569 m!1160857))

(assert (=> b!1260576 m!1160835))

(assert (=> b!1260576 m!1160835))

(assert (=> b!1260576 m!1160837))

(assert (=> b!1260575 m!1160835))

(assert (=> b!1260575 m!1160835))

(assert (=> b!1260575 m!1160837))

(declare-fun m!1160887 () Bool)

(assert (=> b!1260570 m!1160887))

(declare-fun m!1160889 () Bool)

(assert (=> b!1260573 m!1160889))

(assert (=> bm!61903 m!1160887))

(assert (=> b!1260574 m!1160855))

(assert (=> b!1260574 m!1160857))

(assert (=> b!1260574 m!1160855))

(assert (=> b!1260574 m!1160859))

(assert (=> b!1260574 m!1160835))

(assert (=> b!1260574 m!1160835))

(declare-fun m!1160891 () Bool)

(assert (=> b!1260574 m!1160891))

(assert (=> b!1260574 m!1160857))

(declare-fun m!1160893 () Bool)

(assert (=> b!1260565 m!1160893))

(assert (=> b!1260449 d!138271))

(declare-fun d!138273 () Bool)

(declare-fun e!717353 () Bool)

(assert (=> d!138273 e!717353))

(declare-fun res!840103 () Bool)

(assert (=> d!138273 (=> (not res!840103) (not e!717353))))

(declare-fun lt!571146 () ListLongMap!18913)

(assert (=> d!138273 (= res!840103 (contains!7549 lt!571146 (_1!10531 lt!571033)))))

(declare-fun lt!571143 () List!28239)

(assert (=> d!138273 (= lt!571146 (ListLongMap!18914 lt!571143))))

(declare-fun lt!571145 () Unit!41888)

(declare-fun lt!571144 () Unit!41888)

(assert (=> d!138273 (= lt!571145 lt!571144)))

(declare-datatypes ((Option!712 0))(
  ( (Some!711 (v!18908 V!48407)) (None!710) )
))
(declare-fun getValueByKey!661 (List!28239 (_ BitVec 64)) Option!712)

(assert (=> d!138273 (= (getValueByKey!661 lt!571143 (_1!10531 lt!571033)) (Some!711 (_2!10531 lt!571033)))))

(declare-fun lemmaContainsTupThenGetReturnValue!333 (List!28239 (_ BitVec 64) V!48407) Unit!41888)

(assert (=> d!138273 (= lt!571144 (lemmaContainsTupThenGetReturnValue!333 lt!571143 (_1!10531 lt!571033) (_2!10531 lt!571033)))))

(declare-fun insertStrictlySorted!447 (List!28239 (_ BitVec 64) V!48407) List!28239)

(assert (=> d!138273 (= lt!571143 (insertStrictlySorted!447 (toList!9472 lt!571040) (_1!10531 lt!571033) (_2!10531 lt!571033)))))

(assert (=> d!138273 (= (+!4273 lt!571040 lt!571033) lt!571146)))

(declare-fun b!1260581 () Bool)

(declare-fun res!840104 () Bool)

(assert (=> b!1260581 (=> (not res!840104) (not e!717353))))

(assert (=> b!1260581 (= res!840104 (= (getValueByKey!661 (toList!9472 lt!571146) (_1!10531 lt!571033)) (Some!711 (_2!10531 lt!571033))))))

(declare-fun b!1260582 () Bool)

(declare-fun contains!7550 (List!28239 tuple2!21040) Bool)

(assert (=> b!1260582 (= e!717353 (contains!7550 (toList!9472 lt!571146) lt!571033))))

(assert (= (and d!138273 res!840103) b!1260581))

(assert (= (and b!1260581 res!840104) b!1260582))

(declare-fun m!1160895 () Bool)

(assert (=> d!138273 m!1160895))

(declare-fun m!1160897 () Bool)

(assert (=> d!138273 m!1160897))

(declare-fun m!1160899 () Bool)

(assert (=> d!138273 m!1160899))

(declare-fun m!1160901 () Bool)

(assert (=> d!138273 m!1160901))

(declare-fun m!1160903 () Bool)

(assert (=> b!1260581 m!1160903))

(declare-fun m!1160905 () Bool)

(assert (=> b!1260582 m!1160905))

(assert (=> b!1260451 d!138273))

(declare-fun b!1260593 () Bool)

(declare-fun e!717365 () Bool)

(declare-fun call!61909 () Bool)

(assert (=> b!1260593 (= e!717365 call!61909)))

(declare-fun b!1260594 () Bool)

(declare-fun e!717362 () Bool)

(declare-fun e!717364 () Bool)

(assert (=> b!1260594 (= e!717362 e!717364)))

(declare-fun res!840112 () Bool)

(assert (=> b!1260594 (=> (not res!840112) (not e!717364))))

(declare-fun e!717363 () Bool)

(assert (=> b!1260594 (= res!840112 (not e!717363))))

(declare-fun res!840113 () Bool)

(assert (=> b!1260594 (=> (not res!840113) (not e!717363))))

(assert (=> b!1260594 (= res!840113 (validKeyInArray!0 (select (arr!39606 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1260595 () Bool)

(declare-fun contains!7551 (List!28240 (_ BitVec 64)) Bool)

(assert (=> b!1260595 (= e!717363 (contains!7551 Nil!28237 (select (arr!39606 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1260596 () Bool)

(assert (=> b!1260596 (= e!717365 call!61909)))

(declare-fun d!138275 () Bool)

(declare-fun res!840111 () Bool)

(assert (=> d!138275 (=> res!840111 e!717362)))

(assert (=> d!138275 (= res!840111 (bvsge #b00000000000000000000000000000000 (size!40144 _keys!1118)))))

(assert (=> d!138275 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28237) e!717362)))

(declare-fun bm!61906 () Bool)

(declare-fun c!122606 () Bool)

(assert (=> bm!61906 (= call!61909 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122606 (Cons!28236 (select (arr!39606 _keys!1118) #b00000000000000000000000000000000) Nil!28237) Nil!28237)))))

(declare-fun b!1260597 () Bool)

(assert (=> b!1260597 (= e!717364 e!717365)))

(assert (=> b!1260597 (= c!122606 (validKeyInArray!0 (select (arr!39606 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138275 (not res!840111)) b!1260594))

(assert (= (and b!1260594 res!840113) b!1260595))

(assert (= (and b!1260594 res!840112) b!1260597))

(assert (= (and b!1260597 c!122606) b!1260596))

(assert (= (and b!1260597 (not c!122606)) b!1260593))

(assert (= (or b!1260596 b!1260593) bm!61906))

(assert (=> b!1260594 m!1160835))

(assert (=> b!1260594 m!1160835))

(assert (=> b!1260594 m!1160837))

(assert (=> b!1260595 m!1160835))

(assert (=> b!1260595 m!1160835))

(declare-fun m!1160907 () Bool)

(assert (=> b!1260595 m!1160907))

(assert (=> bm!61906 m!1160835))

(declare-fun m!1160909 () Bool)

(assert (=> bm!61906 m!1160909))

(assert (=> b!1260597 m!1160835))

(assert (=> b!1260597 m!1160835))

(assert (=> b!1260597 m!1160837))

(assert (=> b!1260450 d!138275))

(declare-fun d!138277 () Bool)

(declare-fun lt!571149 () ListLongMap!18913)

(assert (=> d!138277 (not (contains!7549 lt!571149 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!143 (List!28239 (_ BitVec 64)) List!28239)

(assert (=> d!138277 (= lt!571149 (ListLongMap!18914 (removeStrictlySorted!143 (toList!9472 lt!571038) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138277 (= (-!2089 lt!571038 #b1000000000000000000000000000000000000000000000000000000000000000) lt!571149)))

(declare-fun bs!35642 () Bool)

(assert (= bs!35642 d!138277))

(declare-fun m!1160911 () Bool)

(assert (=> bs!35642 m!1160911))

(declare-fun m!1160913 () Bool)

(assert (=> bs!35642 m!1160913))

(assert (=> b!1260446 d!138277))

(declare-fun d!138279 () Bool)

(declare-fun e!717366 () Bool)

(assert (=> d!138279 e!717366))

(declare-fun res!840114 () Bool)

(assert (=> d!138279 (=> (not res!840114) (not e!717366))))

(declare-fun lt!571153 () ListLongMap!18913)

(assert (=> d!138279 (= res!840114 (contains!7549 lt!571153 (_1!10531 lt!571033)))))

(declare-fun lt!571150 () List!28239)

(assert (=> d!138279 (= lt!571153 (ListLongMap!18914 lt!571150))))

(declare-fun lt!571152 () Unit!41888)

(declare-fun lt!571151 () Unit!41888)

(assert (=> d!138279 (= lt!571152 lt!571151)))

(assert (=> d!138279 (= (getValueByKey!661 lt!571150 (_1!10531 lt!571033)) (Some!711 (_2!10531 lt!571033)))))

(assert (=> d!138279 (= lt!571151 (lemmaContainsTupThenGetReturnValue!333 lt!571150 (_1!10531 lt!571033) (_2!10531 lt!571033)))))

(assert (=> d!138279 (= lt!571150 (insertStrictlySorted!447 (toList!9472 lt!571032) (_1!10531 lt!571033) (_2!10531 lt!571033)))))

(assert (=> d!138279 (= (+!4273 lt!571032 lt!571033) lt!571153)))

(declare-fun b!1260598 () Bool)

(declare-fun res!840115 () Bool)

(assert (=> b!1260598 (=> (not res!840115) (not e!717366))))

(assert (=> b!1260598 (= res!840115 (= (getValueByKey!661 (toList!9472 lt!571153) (_1!10531 lt!571033)) (Some!711 (_2!10531 lt!571033))))))

(declare-fun b!1260599 () Bool)

(assert (=> b!1260599 (= e!717366 (contains!7550 (toList!9472 lt!571153) lt!571033))))

(assert (= (and d!138279 res!840114) b!1260598))

(assert (= (and b!1260598 res!840115) b!1260599))

(declare-fun m!1160915 () Bool)

(assert (=> d!138279 m!1160915))

(declare-fun m!1160917 () Bool)

(assert (=> d!138279 m!1160917))

(declare-fun m!1160919 () Bool)

(assert (=> d!138279 m!1160919))

(declare-fun m!1160921 () Bool)

(assert (=> d!138279 m!1160921))

(declare-fun m!1160923 () Bool)

(assert (=> b!1260598 m!1160923))

(declare-fun m!1160925 () Bool)

(assert (=> b!1260599 m!1160925))

(assert (=> b!1260446 d!138279))

(declare-fun d!138281 () Bool)

(declare-fun e!717367 () Bool)

(assert (=> d!138281 e!717367))

(declare-fun res!840116 () Bool)

(assert (=> d!138281 (=> (not res!840116) (not e!717367))))

(declare-fun lt!571157 () ListLongMap!18913)

(assert (=> d!138281 (= res!840116 (contains!7549 lt!571157 (_1!10531 (tuple2!21041 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lt!571154 () List!28239)

(assert (=> d!138281 (= lt!571157 (ListLongMap!18914 lt!571154))))

(declare-fun lt!571156 () Unit!41888)

(declare-fun lt!571155 () Unit!41888)

(assert (=> d!138281 (= lt!571156 lt!571155)))

(assert (=> d!138281 (= (getValueByKey!661 lt!571154 (_1!10531 (tuple2!21041 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!711 (_2!10531 (tuple2!21041 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(assert (=> d!138281 (= lt!571155 (lemmaContainsTupThenGetReturnValue!333 lt!571154 (_1!10531 (tuple2!21041 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10531 (tuple2!21041 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(assert (=> d!138281 (= lt!571154 (insertStrictlySorted!447 (toList!9472 lt!571036) (_1!10531 (tuple2!21041 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10531 (tuple2!21041 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(assert (=> d!138281 (= (+!4273 lt!571036 (tuple2!21041 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) lt!571157)))

(declare-fun b!1260600 () Bool)

(declare-fun res!840117 () Bool)

(assert (=> b!1260600 (=> (not res!840117) (not e!717367))))

(assert (=> b!1260600 (= res!840117 (= (getValueByKey!661 (toList!9472 lt!571157) (_1!10531 (tuple2!21041 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!711 (_2!10531 (tuple2!21041 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))))

(declare-fun b!1260601 () Bool)

(assert (=> b!1260601 (= e!717367 (contains!7550 (toList!9472 lt!571157) (tuple2!21041 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(assert (= (and d!138281 res!840116) b!1260600))

(assert (= (and b!1260600 res!840117) b!1260601))

(declare-fun m!1160927 () Bool)

(assert (=> d!138281 m!1160927))

(declare-fun m!1160929 () Bool)

(assert (=> d!138281 m!1160929))

(declare-fun m!1160931 () Bool)

(assert (=> d!138281 m!1160931))

(declare-fun m!1160933 () Bool)

(assert (=> d!138281 m!1160933))

(declare-fun m!1160935 () Bool)

(assert (=> b!1260600 m!1160935))

(declare-fun m!1160937 () Bool)

(assert (=> b!1260601 m!1160937))

(assert (=> b!1260446 d!138281))

(declare-fun b!1260644 () Bool)

(declare-fun e!717396 () Bool)

(declare-fun e!717394 () Bool)

(assert (=> b!1260644 (= e!717396 e!717394)))

(declare-fun c!122624 () Bool)

(assert (=> b!1260644 (= c!122624 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1260645 () Bool)

(declare-fun e!717400 () Bool)

(assert (=> b!1260645 (= e!717400 (validKeyInArray!0 (select (arr!39606 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1260646 () Bool)

(declare-fun lt!571206 () ListLongMap!18913)

(declare-fun e!717397 () Bool)

(assert (=> b!1260646 (= e!717397 (= (apply!986 lt!571206 (select (arr!39606 _keys!1118) #b00000000000000000000000000000000)) (get!20239 (select (arr!39607 _values!914) #b00000000000000000000000000000000) (dynLambda!3416 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1260646 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40145 _values!914)))))

(assert (=> b!1260646 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40144 _keys!1118)))))

(declare-fun bm!61921 () Bool)

(declare-fun call!61924 () ListLongMap!18913)

(assert (=> bm!61921 (= call!61924 (getCurrentListMapNoExtraKeys!5841 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun bm!61922 () Bool)

(declare-fun call!61928 () ListLongMap!18913)

(declare-fun call!61927 () ListLongMap!18913)

(assert (=> bm!61922 (= call!61928 call!61927)))

(declare-fun b!1260647 () Bool)

(declare-fun e!717398 () ListLongMap!18913)

(declare-fun call!61930 () ListLongMap!18913)

(assert (=> b!1260647 (= e!717398 call!61930)))

(declare-fun b!1260648 () Bool)

(declare-fun c!122622 () Bool)

(assert (=> b!1260648 (= c!122622 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!717403 () ListLongMap!18913)

(assert (=> b!1260648 (= e!717403 e!717398)))

(declare-fun b!1260649 () Bool)

(assert (=> b!1260649 (= e!717398 call!61928)))

(declare-fun b!1260650 () Bool)

(assert (=> b!1260650 (= e!717403 call!61930)))

(declare-fun b!1260651 () Bool)

(declare-fun e!717406 () Bool)

(assert (=> b!1260651 (= e!717406 (= (apply!986 lt!571206 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1260652 () Bool)

(declare-fun e!717399 () Bool)

(declare-fun call!61925 () Bool)

(assert (=> b!1260652 (= e!717399 (not call!61925))))

(declare-fun b!1260653 () Bool)

(declare-fun e!717402 () ListLongMap!18913)

(assert (=> b!1260653 (= e!717402 e!717403)))

(declare-fun c!122619 () Bool)

(assert (=> b!1260653 (= c!122619 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1260654 () Bool)

(declare-fun res!840139 () Bool)

(assert (=> b!1260654 (=> (not res!840139) (not e!717396))))

(declare-fun e!717404 () Bool)

(assert (=> b!1260654 (= res!840139 e!717404)))

(declare-fun res!840141 () Bool)

(assert (=> b!1260654 (=> res!840141 e!717404)))

(assert (=> b!1260654 (= res!840141 (not e!717400))))

(declare-fun res!840142 () Bool)

(assert (=> b!1260654 (=> (not res!840142) (not e!717400))))

(assert (=> b!1260654 (= res!840142 (bvslt #b00000000000000000000000000000000 (size!40144 _keys!1118)))))

(declare-fun bm!61924 () Bool)

(declare-fun call!61926 () Bool)

(assert (=> bm!61924 (= call!61926 (contains!7549 lt!571206 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1260655 () Bool)

(assert (=> b!1260655 (= e!717394 (not call!61926))))

(declare-fun bm!61925 () Bool)

(assert (=> bm!61925 (= call!61927 call!61924)))

(declare-fun b!1260656 () Bool)

(declare-fun e!717405 () Unit!41888)

(declare-fun lt!571204 () Unit!41888)

(assert (=> b!1260656 (= e!717405 lt!571204)))

(declare-fun lt!571209 () ListLongMap!18913)

(assert (=> b!1260656 (= lt!571209 (getCurrentListMapNoExtraKeys!5841 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571207 () (_ BitVec 64))

(assert (=> b!1260656 (= lt!571207 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571223 () (_ BitVec 64))

(assert (=> b!1260656 (= lt!571223 (select (arr!39606 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!571219 () Unit!41888)

(declare-fun addStillContains!1084 (ListLongMap!18913 (_ BitVec 64) V!48407 (_ BitVec 64)) Unit!41888)

(assert (=> b!1260656 (= lt!571219 (addStillContains!1084 lt!571209 lt!571207 zeroValue!871 lt!571223))))

(assert (=> b!1260656 (contains!7549 (+!4273 lt!571209 (tuple2!21041 lt!571207 zeroValue!871)) lt!571223)))

(declare-fun lt!571216 () Unit!41888)

(assert (=> b!1260656 (= lt!571216 lt!571219)))

(declare-fun lt!571213 () ListLongMap!18913)

(assert (=> b!1260656 (= lt!571213 (getCurrentListMapNoExtraKeys!5841 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571203 () (_ BitVec 64))

(assert (=> b!1260656 (= lt!571203 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571211 () (_ BitVec 64))

(assert (=> b!1260656 (= lt!571211 (select (arr!39606 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!571214 () Unit!41888)

(declare-fun addApplyDifferent!527 (ListLongMap!18913 (_ BitVec 64) V!48407 (_ BitVec 64)) Unit!41888)

(assert (=> b!1260656 (= lt!571214 (addApplyDifferent!527 lt!571213 lt!571203 minValueAfter!43 lt!571211))))

(assert (=> b!1260656 (= (apply!986 (+!4273 lt!571213 (tuple2!21041 lt!571203 minValueAfter!43)) lt!571211) (apply!986 lt!571213 lt!571211))))

(declare-fun lt!571210 () Unit!41888)

(assert (=> b!1260656 (= lt!571210 lt!571214)))

(declare-fun lt!571205 () ListLongMap!18913)

(assert (=> b!1260656 (= lt!571205 (getCurrentListMapNoExtraKeys!5841 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571221 () (_ BitVec 64))

(assert (=> b!1260656 (= lt!571221 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571217 () (_ BitVec 64))

(assert (=> b!1260656 (= lt!571217 (select (arr!39606 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!571218 () Unit!41888)

(assert (=> b!1260656 (= lt!571218 (addApplyDifferent!527 lt!571205 lt!571221 zeroValue!871 lt!571217))))

(assert (=> b!1260656 (= (apply!986 (+!4273 lt!571205 (tuple2!21041 lt!571221 zeroValue!871)) lt!571217) (apply!986 lt!571205 lt!571217))))

(declare-fun lt!571220 () Unit!41888)

(assert (=> b!1260656 (= lt!571220 lt!571218)))

(declare-fun lt!571202 () ListLongMap!18913)

(assert (=> b!1260656 (= lt!571202 (getCurrentListMapNoExtraKeys!5841 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571208 () (_ BitVec 64))

(assert (=> b!1260656 (= lt!571208 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571215 () (_ BitVec 64))

(assert (=> b!1260656 (= lt!571215 (select (arr!39606 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1260656 (= lt!571204 (addApplyDifferent!527 lt!571202 lt!571208 minValueAfter!43 lt!571215))))

(assert (=> b!1260656 (= (apply!986 (+!4273 lt!571202 (tuple2!21041 lt!571208 minValueAfter!43)) lt!571215) (apply!986 lt!571202 lt!571215))))

(declare-fun b!1260657 () Bool)

(declare-fun e!717401 () Bool)

(assert (=> b!1260657 (= e!717394 e!717401)))

(declare-fun res!840136 () Bool)

(assert (=> b!1260657 (= res!840136 call!61926)))

(assert (=> b!1260657 (=> (not res!840136) (not e!717401))))

(declare-fun b!1260658 () Bool)

(declare-fun res!840138 () Bool)

(assert (=> b!1260658 (=> (not res!840138) (not e!717396))))

(assert (=> b!1260658 (= res!840138 e!717399)))

(declare-fun c!122621 () Bool)

(assert (=> b!1260658 (= c!122621 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1260659 () Bool)

(declare-fun e!717395 () Bool)

(assert (=> b!1260659 (= e!717395 (validKeyInArray!0 (select (arr!39606 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1260660 () Bool)

(declare-fun call!61929 () ListLongMap!18913)

(assert (=> b!1260660 (= e!717402 (+!4273 call!61929 (tuple2!21041 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43)))))

(declare-fun b!1260661 () Bool)

(assert (=> b!1260661 (= e!717399 e!717406)))

(declare-fun res!840137 () Bool)

(assert (=> b!1260661 (= res!840137 call!61925)))

(assert (=> b!1260661 (=> (not res!840137) (not e!717406))))

(declare-fun b!1260662 () Bool)

(assert (=> b!1260662 (= e!717401 (= (apply!986 lt!571206 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!43))))

(declare-fun c!122620 () Bool)

(declare-fun bm!61926 () Bool)

(assert (=> bm!61926 (= call!61929 (+!4273 (ite c!122620 call!61924 (ite c!122619 call!61927 call!61928)) (ite (or c!122620 c!122619) (tuple2!21041 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21041 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43))))))

(declare-fun b!1260663 () Bool)

(assert (=> b!1260663 (= e!717404 e!717397)))

(declare-fun res!840143 () Bool)

(assert (=> b!1260663 (=> (not res!840143) (not e!717397))))

(assert (=> b!1260663 (= res!840143 (contains!7549 lt!571206 (select (arr!39606 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1260663 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40144 _keys!1118)))))

(declare-fun b!1260664 () Bool)

(declare-fun Unit!41894 () Unit!41888)

(assert (=> b!1260664 (= e!717405 Unit!41894)))

(declare-fun bm!61927 () Bool)

(assert (=> bm!61927 (= call!61930 call!61929)))

(declare-fun bm!61923 () Bool)

(assert (=> bm!61923 (= call!61925 (contains!7549 lt!571206 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!138283 () Bool)

(assert (=> d!138283 e!717396))

(declare-fun res!840144 () Bool)

(assert (=> d!138283 (=> (not res!840144) (not e!717396))))

(assert (=> d!138283 (= res!840144 (or (bvsge #b00000000000000000000000000000000 (size!40144 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40144 _keys!1118)))))))

(declare-fun lt!571222 () ListLongMap!18913)

(assert (=> d!138283 (= lt!571206 lt!571222)))

(declare-fun lt!571212 () Unit!41888)

(assert (=> d!138283 (= lt!571212 e!717405)))

(declare-fun c!122623 () Bool)

(assert (=> d!138283 (= c!122623 e!717395)))

(declare-fun res!840140 () Bool)

(assert (=> d!138283 (=> (not res!840140) (not e!717395))))

(assert (=> d!138283 (= res!840140 (bvslt #b00000000000000000000000000000000 (size!40144 _keys!1118)))))

(assert (=> d!138283 (= lt!571222 e!717402)))

(assert (=> d!138283 (= c!122620 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138283 (validMask!0 mask!1466)))

(assert (=> d!138283 (= (getCurrentListMap!4555 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!571206)))

(assert (= (and d!138283 c!122620) b!1260660))

(assert (= (and d!138283 (not c!122620)) b!1260653))

(assert (= (and b!1260653 c!122619) b!1260650))

(assert (= (and b!1260653 (not c!122619)) b!1260648))

(assert (= (and b!1260648 c!122622) b!1260647))

(assert (= (and b!1260648 (not c!122622)) b!1260649))

(assert (= (or b!1260647 b!1260649) bm!61922))

(assert (= (or b!1260650 bm!61922) bm!61925))

(assert (= (or b!1260650 b!1260647) bm!61927))

(assert (= (or b!1260660 bm!61925) bm!61921))

(assert (= (or b!1260660 bm!61927) bm!61926))

(assert (= (and d!138283 res!840140) b!1260659))

(assert (= (and d!138283 c!122623) b!1260656))

(assert (= (and d!138283 (not c!122623)) b!1260664))

(assert (= (and d!138283 res!840144) b!1260654))

(assert (= (and b!1260654 res!840142) b!1260645))

(assert (= (and b!1260654 (not res!840141)) b!1260663))

(assert (= (and b!1260663 res!840143) b!1260646))

(assert (= (and b!1260654 res!840139) b!1260658))

(assert (= (and b!1260658 c!122621) b!1260661))

(assert (= (and b!1260658 (not c!122621)) b!1260652))

(assert (= (and b!1260661 res!840137) b!1260651))

(assert (= (or b!1260661 b!1260652) bm!61923))

(assert (= (and b!1260658 res!840138) b!1260644))

(assert (= (and b!1260644 c!122624) b!1260657))

(assert (= (and b!1260644 (not c!122624)) b!1260655))

(assert (= (and b!1260657 res!840136) b!1260662))

(assert (= (or b!1260657 b!1260655) bm!61924))

(declare-fun b_lambda!22765 () Bool)

(assert (=> (not b_lambda!22765) (not b!1260646)))

(assert (=> b!1260646 t!41734))

(declare-fun b_and!45271 () Bool)

(assert (= b_and!45269 (and (=> t!41734 result!23339) b_and!45271)))

(declare-fun m!1160939 () Bool)

(assert (=> b!1260660 m!1160939))

(assert (=> d!138283 m!1160751))

(assert (=> b!1260646 m!1160857))

(assert (=> b!1260646 m!1160855))

(assert (=> b!1260646 m!1160859))

(assert (=> b!1260646 m!1160857))

(assert (=> b!1260646 m!1160855))

(assert (=> b!1260646 m!1160835))

(declare-fun m!1160941 () Bool)

(assert (=> b!1260646 m!1160941))

(assert (=> b!1260646 m!1160835))

(assert (=> bm!61921 m!1160759))

(declare-fun m!1160943 () Bool)

(assert (=> b!1260656 m!1160943))

(declare-fun m!1160945 () Bool)

(assert (=> b!1260656 m!1160945))

(declare-fun m!1160947 () Bool)

(assert (=> b!1260656 m!1160947))

(declare-fun m!1160949 () Bool)

(assert (=> b!1260656 m!1160949))

(assert (=> b!1260656 m!1160943))

(declare-fun m!1160951 () Bool)

(assert (=> b!1260656 m!1160951))

(declare-fun m!1160953 () Bool)

(assert (=> b!1260656 m!1160953))

(declare-fun m!1160955 () Bool)

(assert (=> b!1260656 m!1160955))

(declare-fun m!1160957 () Bool)

(assert (=> b!1260656 m!1160957))

(assert (=> b!1260656 m!1160953))

(declare-fun m!1160959 () Bool)

(assert (=> b!1260656 m!1160959))

(declare-fun m!1160961 () Bool)

(assert (=> b!1260656 m!1160961))

(declare-fun m!1160963 () Bool)

(assert (=> b!1260656 m!1160963))

(declare-fun m!1160965 () Bool)

(assert (=> b!1260656 m!1160965))

(declare-fun m!1160967 () Bool)

(assert (=> b!1260656 m!1160967))

(assert (=> b!1260656 m!1160947))

(assert (=> b!1260656 m!1160835))

(declare-fun m!1160969 () Bool)

(assert (=> b!1260656 m!1160969))

(declare-fun m!1160971 () Bool)

(assert (=> b!1260656 m!1160971))

(assert (=> b!1260656 m!1160961))

(assert (=> b!1260656 m!1160759))

(assert (=> b!1260663 m!1160835))

(assert (=> b!1260663 m!1160835))

(declare-fun m!1160973 () Bool)

(assert (=> b!1260663 m!1160973))

(assert (=> b!1260659 m!1160835))

(assert (=> b!1260659 m!1160835))

(assert (=> b!1260659 m!1160837))

(declare-fun m!1160975 () Bool)

(assert (=> bm!61923 m!1160975))

(declare-fun m!1160977 () Bool)

(assert (=> b!1260651 m!1160977))

(declare-fun m!1160979 () Bool)

(assert (=> bm!61926 m!1160979))

(declare-fun m!1160981 () Bool)

(assert (=> b!1260662 m!1160981))

(declare-fun m!1160983 () Bool)

(assert (=> bm!61924 m!1160983))

(assert (=> b!1260645 m!1160835))

(assert (=> b!1260645 m!1160835))

(assert (=> b!1260645 m!1160837))

(assert (=> b!1260446 d!138283))

(declare-fun d!138285 () Bool)

(declare-fun lt!571224 () ListLongMap!18913)

(assert (=> d!138285 (not (contains!7549 lt!571224 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138285 (= lt!571224 (ListLongMap!18914 (removeStrictlySorted!143 (toList!9472 lt!571034) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138285 (= (-!2089 lt!571034 #b1000000000000000000000000000000000000000000000000000000000000000) lt!571224)))

(declare-fun bs!35643 () Bool)

(assert (= bs!35643 d!138285))

(declare-fun m!1160985 () Bool)

(assert (=> bs!35643 m!1160985))

(declare-fun m!1160987 () Bool)

(assert (=> bs!35643 m!1160987))

(assert (=> b!1260446 d!138285))

(declare-fun d!138287 () Bool)

(assert (=> d!138287 (= (-!2089 (+!4273 lt!571036 (tuple2!21041 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) #b1000000000000000000000000000000000000000000000000000000000000000) lt!571036)))

(declare-fun lt!571227 () Unit!41888)

(declare-fun choose!1876 (ListLongMap!18913 (_ BitVec 64) V!48407) Unit!41888)

(assert (=> d!138287 (= lt!571227 (choose!1876 lt!571036 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> d!138287 (not (contains!7549 lt!571036 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138287 (= (addThenRemoveForNewKeyIsSame!346 lt!571036 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43) lt!571227)))

(declare-fun bs!35644 () Bool)

(assert (= bs!35644 d!138287))

(assert (=> bs!35644 m!1160741))

(assert (=> bs!35644 m!1160741))

(declare-fun m!1160989 () Bool)

(assert (=> bs!35644 m!1160989))

(declare-fun m!1160991 () Bool)

(assert (=> bs!35644 m!1160991))

(declare-fun m!1160993 () Bool)

(assert (=> bs!35644 m!1160993))

(assert (=> b!1260446 d!138287))

(declare-fun b!1260665 () Bool)

(declare-fun e!717409 () Bool)

(declare-fun e!717407 () Bool)

(assert (=> b!1260665 (= e!717409 e!717407)))

(declare-fun c!122630 () Bool)

(assert (=> b!1260665 (= c!122630 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1260666 () Bool)

(declare-fun e!717413 () Bool)

(assert (=> b!1260666 (= e!717413 (validKeyInArray!0 (select (arr!39606 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun e!717410 () Bool)

(declare-fun lt!571232 () ListLongMap!18913)

(declare-fun b!1260667 () Bool)

(assert (=> b!1260667 (= e!717410 (= (apply!986 lt!571232 (select (arr!39606 _keys!1118) #b00000000000000000000000000000000)) (get!20239 (select (arr!39607 _values!914) #b00000000000000000000000000000000) (dynLambda!3416 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1260667 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40145 _values!914)))))

(assert (=> b!1260667 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40144 _keys!1118)))))

(declare-fun call!61931 () ListLongMap!18913)

(declare-fun bm!61928 () Bool)

(assert (=> bm!61928 (= call!61931 (getCurrentListMapNoExtraKeys!5841 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun bm!61929 () Bool)

(declare-fun call!61935 () ListLongMap!18913)

(declare-fun call!61934 () ListLongMap!18913)

(assert (=> bm!61929 (= call!61935 call!61934)))

(declare-fun b!1260668 () Bool)

(declare-fun e!717411 () ListLongMap!18913)

(declare-fun call!61937 () ListLongMap!18913)

(assert (=> b!1260668 (= e!717411 call!61937)))

(declare-fun b!1260669 () Bool)

(declare-fun c!122628 () Bool)

(assert (=> b!1260669 (= c!122628 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!717416 () ListLongMap!18913)

(assert (=> b!1260669 (= e!717416 e!717411)))

(declare-fun b!1260670 () Bool)

(assert (=> b!1260670 (= e!717411 call!61935)))

(declare-fun b!1260671 () Bool)

(assert (=> b!1260671 (= e!717416 call!61937)))

(declare-fun b!1260672 () Bool)

(declare-fun e!717419 () Bool)

(assert (=> b!1260672 (= e!717419 (= (apply!986 lt!571232 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1260673 () Bool)

(declare-fun e!717412 () Bool)

(declare-fun call!61932 () Bool)

(assert (=> b!1260673 (= e!717412 (not call!61932))))

(declare-fun b!1260674 () Bool)

(declare-fun e!717415 () ListLongMap!18913)

(assert (=> b!1260674 (= e!717415 e!717416)))

(declare-fun c!122625 () Bool)

(assert (=> b!1260674 (= c!122625 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1260675 () Bool)

(declare-fun res!840148 () Bool)

(assert (=> b!1260675 (=> (not res!840148) (not e!717409))))

(declare-fun e!717417 () Bool)

(assert (=> b!1260675 (= res!840148 e!717417)))

(declare-fun res!840150 () Bool)

(assert (=> b!1260675 (=> res!840150 e!717417)))

(assert (=> b!1260675 (= res!840150 (not e!717413))))

(declare-fun res!840151 () Bool)

(assert (=> b!1260675 (=> (not res!840151) (not e!717413))))

(assert (=> b!1260675 (= res!840151 (bvslt #b00000000000000000000000000000000 (size!40144 _keys!1118)))))

(declare-fun bm!61931 () Bool)

(declare-fun call!61933 () Bool)

(assert (=> bm!61931 (= call!61933 (contains!7549 lt!571232 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1260676 () Bool)

(assert (=> b!1260676 (= e!717407 (not call!61933))))

(declare-fun bm!61932 () Bool)

(assert (=> bm!61932 (= call!61934 call!61931)))

(declare-fun b!1260677 () Bool)

(declare-fun e!717418 () Unit!41888)

(declare-fun lt!571230 () Unit!41888)

(assert (=> b!1260677 (= e!717418 lt!571230)))

(declare-fun lt!571235 () ListLongMap!18913)

(assert (=> b!1260677 (= lt!571235 (getCurrentListMapNoExtraKeys!5841 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571233 () (_ BitVec 64))

(assert (=> b!1260677 (= lt!571233 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571249 () (_ BitVec 64))

(assert (=> b!1260677 (= lt!571249 (select (arr!39606 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!571245 () Unit!41888)

(assert (=> b!1260677 (= lt!571245 (addStillContains!1084 lt!571235 lt!571233 zeroValue!871 lt!571249))))

(assert (=> b!1260677 (contains!7549 (+!4273 lt!571235 (tuple2!21041 lt!571233 zeroValue!871)) lt!571249)))

(declare-fun lt!571242 () Unit!41888)

(assert (=> b!1260677 (= lt!571242 lt!571245)))

(declare-fun lt!571239 () ListLongMap!18913)

(assert (=> b!1260677 (= lt!571239 (getCurrentListMapNoExtraKeys!5841 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571229 () (_ BitVec 64))

(assert (=> b!1260677 (= lt!571229 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571237 () (_ BitVec 64))

(assert (=> b!1260677 (= lt!571237 (select (arr!39606 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!571240 () Unit!41888)

(assert (=> b!1260677 (= lt!571240 (addApplyDifferent!527 lt!571239 lt!571229 minValueBefore!43 lt!571237))))

(assert (=> b!1260677 (= (apply!986 (+!4273 lt!571239 (tuple2!21041 lt!571229 minValueBefore!43)) lt!571237) (apply!986 lt!571239 lt!571237))))

(declare-fun lt!571236 () Unit!41888)

(assert (=> b!1260677 (= lt!571236 lt!571240)))

(declare-fun lt!571231 () ListLongMap!18913)

(assert (=> b!1260677 (= lt!571231 (getCurrentListMapNoExtraKeys!5841 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571247 () (_ BitVec 64))

(assert (=> b!1260677 (= lt!571247 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571243 () (_ BitVec 64))

(assert (=> b!1260677 (= lt!571243 (select (arr!39606 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!571244 () Unit!41888)

(assert (=> b!1260677 (= lt!571244 (addApplyDifferent!527 lt!571231 lt!571247 zeroValue!871 lt!571243))))

(assert (=> b!1260677 (= (apply!986 (+!4273 lt!571231 (tuple2!21041 lt!571247 zeroValue!871)) lt!571243) (apply!986 lt!571231 lt!571243))))

(declare-fun lt!571246 () Unit!41888)

(assert (=> b!1260677 (= lt!571246 lt!571244)))

(declare-fun lt!571228 () ListLongMap!18913)

(assert (=> b!1260677 (= lt!571228 (getCurrentListMapNoExtraKeys!5841 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571234 () (_ BitVec 64))

(assert (=> b!1260677 (= lt!571234 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571241 () (_ BitVec 64))

(assert (=> b!1260677 (= lt!571241 (select (arr!39606 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1260677 (= lt!571230 (addApplyDifferent!527 lt!571228 lt!571234 minValueBefore!43 lt!571241))))

(assert (=> b!1260677 (= (apply!986 (+!4273 lt!571228 (tuple2!21041 lt!571234 minValueBefore!43)) lt!571241) (apply!986 lt!571228 lt!571241))))

(declare-fun b!1260678 () Bool)

(declare-fun e!717414 () Bool)

(assert (=> b!1260678 (= e!717407 e!717414)))

(declare-fun res!840145 () Bool)

(assert (=> b!1260678 (= res!840145 call!61933)))

(assert (=> b!1260678 (=> (not res!840145) (not e!717414))))

(declare-fun b!1260679 () Bool)

(declare-fun res!840147 () Bool)

(assert (=> b!1260679 (=> (not res!840147) (not e!717409))))

(assert (=> b!1260679 (= res!840147 e!717412)))

(declare-fun c!122627 () Bool)

(assert (=> b!1260679 (= c!122627 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1260680 () Bool)

(declare-fun e!717408 () Bool)

(assert (=> b!1260680 (= e!717408 (validKeyInArray!0 (select (arr!39606 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1260681 () Bool)

(declare-fun call!61936 () ListLongMap!18913)

(assert (=> b!1260681 (= e!717415 (+!4273 call!61936 (tuple2!21041 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun b!1260682 () Bool)

(assert (=> b!1260682 (= e!717412 e!717419)))

(declare-fun res!840146 () Bool)

(assert (=> b!1260682 (= res!840146 call!61932)))

(assert (=> b!1260682 (=> (not res!840146) (not e!717419))))

(declare-fun b!1260683 () Bool)

(assert (=> b!1260683 (= e!717414 (= (apply!986 lt!571232 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun c!122626 () Bool)

(declare-fun bm!61933 () Bool)

(assert (=> bm!61933 (= call!61936 (+!4273 (ite c!122626 call!61931 (ite c!122625 call!61934 call!61935)) (ite (or c!122626 c!122625) (tuple2!21041 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21041 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1260684 () Bool)

(assert (=> b!1260684 (= e!717417 e!717410)))

(declare-fun res!840152 () Bool)

(assert (=> b!1260684 (=> (not res!840152) (not e!717410))))

(assert (=> b!1260684 (= res!840152 (contains!7549 lt!571232 (select (arr!39606 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1260684 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40144 _keys!1118)))))

(declare-fun b!1260685 () Bool)

(declare-fun Unit!41895 () Unit!41888)

(assert (=> b!1260685 (= e!717418 Unit!41895)))

(declare-fun bm!61934 () Bool)

(assert (=> bm!61934 (= call!61937 call!61936)))

(declare-fun bm!61930 () Bool)

(assert (=> bm!61930 (= call!61932 (contains!7549 lt!571232 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!138289 () Bool)

(assert (=> d!138289 e!717409))

(declare-fun res!840153 () Bool)

(assert (=> d!138289 (=> (not res!840153) (not e!717409))))

(assert (=> d!138289 (= res!840153 (or (bvsge #b00000000000000000000000000000000 (size!40144 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40144 _keys!1118)))))))

(declare-fun lt!571248 () ListLongMap!18913)

(assert (=> d!138289 (= lt!571232 lt!571248)))

(declare-fun lt!571238 () Unit!41888)

(assert (=> d!138289 (= lt!571238 e!717418)))

(declare-fun c!122629 () Bool)

(assert (=> d!138289 (= c!122629 e!717408)))

(declare-fun res!840149 () Bool)

(assert (=> d!138289 (=> (not res!840149) (not e!717408))))

(assert (=> d!138289 (= res!840149 (bvslt #b00000000000000000000000000000000 (size!40144 _keys!1118)))))

(assert (=> d!138289 (= lt!571248 e!717415)))

(assert (=> d!138289 (= c!122626 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138289 (validMask!0 mask!1466)))

(assert (=> d!138289 (= (getCurrentListMap!4555 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!571232)))

(assert (= (and d!138289 c!122626) b!1260681))

(assert (= (and d!138289 (not c!122626)) b!1260674))

(assert (= (and b!1260674 c!122625) b!1260671))

(assert (= (and b!1260674 (not c!122625)) b!1260669))

(assert (= (and b!1260669 c!122628) b!1260668))

(assert (= (and b!1260669 (not c!122628)) b!1260670))

(assert (= (or b!1260668 b!1260670) bm!61929))

(assert (= (or b!1260671 bm!61929) bm!61932))

(assert (= (or b!1260671 b!1260668) bm!61934))

(assert (= (or b!1260681 bm!61932) bm!61928))

(assert (= (or b!1260681 bm!61934) bm!61933))

(assert (= (and d!138289 res!840149) b!1260680))

(assert (= (and d!138289 c!122629) b!1260677))

(assert (= (and d!138289 (not c!122629)) b!1260685))

(assert (= (and d!138289 res!840153) b!1260675))

(assert (= (and b!1260675 res!840151) b!1260666))

(assert (= (and b!1260675 (not res!840150)) b!1260684))

(assert (= (and b!1260684 res!840152) b!1260667))

(assert (= (and b!1260675 res!840148) b!1260679))

(assert (= (and b!1260679 c!122627) b!1260682))

(assert (= (and b!1260679 (not c!122627)) b!1260673))

(assert (= (and b!1260682 res!840146) b!1260672))

(assert (= (or b!1260682 b!1260673) bm!61930))

(assert (= (and b!1260679 res!840147) b!1260665))

(assert (= (and b!1260665 c!122630) b!1260678))

(assert (= (and b!1260665 (not c!122630)) b!1260676))

(assert (= (and b!1260678 res!840145) b!1260683))

(assert (= (or b!1260678 b!1260676) bm!61931))

(declare-fun b_lambda!22767 () Bool)

(assert (=> (not b_lambda!22767) (not b!1260667)))

(assert (=> b!1260667 t!41734))

(declare-fun b_and!45273 () Bool)

(assert (= b_and!45271 (and (=> t!41734 result!23339) b_and!45273)))

(declare-fun m!1160995 () Bool)

(assert (=> b!1260681 m!1160995))

(assert (=> d!138289 m!1160751))

(assert (=> b!1260667 m!1160857))

(assert (=> b!1260667 m!1160855))

(assert (=> b!1260667 m!1160859))

(assert (=> b!1260667 m!1160857))

(assert (=> b!1260667 m!1160855))

(assert (=> b!1260667 m!1160835))

(declare-fun m!1160997 () Bool)

(assert (=> b!1260667 m!1160997))

(assert (=> b!1260667 m!1160835))

(assert (=> bm!61928 m!1160761))

(declare-fun m!1160999 () Bool)

(assert (=> b!1260677 m!1160999))

(declare-fun m!1161001 () Bool)

(assert (=> b!1260677 m!1161001))

(declare-fun m!1161003 () Bool)

(assert (=> b!1260677 m!1161003))

(declare-fun m!1161005 () Bool)

(assert (=> b!1260677 m!1161005))

(assert (=> b!1260677 m!1160999))

(declare-fun m!1161007 () Bool)

(assert (=> b!1260677 m!1161007))

(declare-fun m!1161009 () Bool)

(assert (=> b!1260677 m!1161009))

(declare-fun m!1161011 () Bool)

(assert (=> b!1260677 m!1161011))

(declare-fun m!1161013 () Bool)

(assert (=> b!1260677 m!1161013))

(assert (=> b!1260677 m!1161009))

(declare-fun m!1161015 () Bool)

(assert (=> b!1260677 m!1161015))

(declare-fun m!1161017 () Bool)

(assert (=> b!1260677 m!1161017))

(declare-fun m!1161019 () Bool)

(assert (=> b!1260677 m!1161019))

(declare-fun m!1161021 () Bool)

(assert (=> b!1260677 m!1161021))

(declare-fun m!1161023 () Bool)

(assert (=> b!1260677 m!1161023))

(assert (=> b!1260677 m!1161003))

(assert (=> b!1260677 m!1160835))

(declare-fun m!1161025 () Bool)

(assert (=> b!1260677 m!1161025))

(declare-fun m!1161027 () Bool)

(assert (=> b!1260677 m!1161027))

(assert (=> b!1260677 m!1161017))

(assert (=> b!1260677 m!1160761))

(assert (=> b!1260684 m!1160835))

(assert (=> b!1260684 m!1160835))

(declare-fun m!1161029 () Bool)

(assert (=> b!1260684 m!1161029))

(assert (=> b!1260680 m!1160835))

(assert (=> b!1260680 m!1160835))

(assert (=> b!1260680 m!1160837))

(declare-fun m!1161031 () Bool)

(assert (=> bm!61930 m!1161031))

(declare-fun m!1161033 () Bool)

(assert (=> b!1260672 m!1161033))

(declare-fun m!1161035 () Bool)

(assert (=> bm!61933 m!1161035))

(declare-fun m!1161037 () Bool)

(assert (=> b!1260683 m!1161037))

(declare-fun m!1161039 () Bool)

(assert (=> bm!61931 m!1161039))

(assert (=> b!1260666 m!1160835))

(assert (=> b!1260666 m!1160835))

(assert (=> b!1260666 m!1160837))

(assert (=> b!1260446 d!138289))

(declare-fun mapNonEmpty!50230 () Bool)

(declare-fun mapRes!50230 () Bool)

(declare-fun tp!95681 () Bool)

(declare-fun e!717425 () Bool)

(assert (=> mapNonEmpty!50230 (= mapRes!50230 (and tp!95681 e!717425))))

(declare-fun mapKey!50230 () (_ BitVec 32))

(declare-fun mapRest!50230 () (Array (_ BitVec 32) ValueCell!15377))

(declare-fun mapValue!50230 () ValueCell!15377)

(assert (=> mapNonEmpty!50230 (= mapRest!50221 (store mapRest!50230 mapKey!50230 mapValue!50230))))

(declare-fun b!1260693 () Bool)

(declare-fun e!717424 () Bool)

(assert (=> b!1260693 (= e!717424 tp_is_empty!32281)))

(declare-fun condMapEmpty!50230 () Bool)

(declare-fun mapDefault!50230 () ValueCell!15377)

(assert (=> mapNonEmpty!50221 (= condMapEmpty!50230 (= mapRest!50221 ((as const (Array (_ BitVec 32) ValueCell!15377)) mapDefault!50230)))))

(assert (=> mapNonEmpty!50221 (= tp!95665 (and e!717424 mapRes!50230))))

(declare-fun mapIsEmpty!50230 () Bool)

(assert (=> mapIsEmpty!50230 mapRes!50230))

(declare-fun b!1260692 () Bool)

(assert (=> b!1260692 (= e!717425 tp_is_empty!32281)))

(assert (= (and mapNonEmpty!50221 condMapEmpty!50230) mapIsEmpty!50230))

(assert (= (and mapNonEmpty!50221 (not condMapEmpty!50230)) mapNonEmpty!50230))

(assert (= (and mapNonEmpty!50230 ((_ is ValueCellFull!15377) mapValue!50230)) b!1260692))

(assert (= (and mapNonEmpty!50221 ((_ is ValueCellFull!15377) mapDefault!50230)) b!1260693))

(declare-fun m!1161041 () Bool)

(assert (=> mapNonEmpty!50230 m!1161041))

(declare-fun b_lambda!22769 () Bool)

(assert (= b_lambda!22759 (or (and start!105812 b_free!27379) b_lambda!22769)))

(declare-fun b_lambda!22771 () Bool)

(assert (= b_lambda!22757 (or (and start!105812 b_free!27379) b_lambda!22771)))

(declare-fun b_lambda!22773 () Bool)

(assert (= b_lambda!22767 (or (and start!105812 b_free!27379) b_lambda!22773)))

(declare-fun b_lambda!22775 () Bool)

(assert (= b_lambda!22765 (or (and start!105812 b_free!27379) b_lambda!22775)))

(declare-fun b_lambda!22777 () Bool)

(assert (= b_lambda!22761 (or (and start!105812 b_free!27379) b_lambda!22777)))

(declare-fun b_lambda!22779 () Bool)

(assert (= b_lambda!22763 (or (and start!105812 b_free!27379) b_lambda!22779)))

(check-sat (not b!1260526) (not b!1260554) (not bm!61902) (not mapNonEmpty!50230) (not b!1260598) (not b!1260524) (not b!1260595) (not bm!61930) (not b!1260656) (not bm!61903) (not b!1260666) (not b!1260568) (not b!1260667) (not d!138271) (not b_lambda!22769) (not b!1260663) (not d!138267) b_and!45273 (not bm!61899) (not b_lambda!22779) (not d!138277) (not b!1260573) (not d!138273) (not b!1260645) (not b!1260672) (not b!1260684) (not b!1260597) (not b!1260680) (not b!1260662) (not b!1260565) (not b_lambda!22773) (not b!1260574) (not bm!61906) (not d!138289) (not b_lambda!22777) (not b!1260555) (not bm!61928) (not b!1260594) (not b!1260651) tp_is_empty!32281 (not d!138279) (not bm!61923) (not b!1260659) (not b!1260660) (not d!138269) (not b!1260582) (not b!1260681) (not bm!61933) (not b!1260561) (not b!1260677) (not bm!61924) (not b!1260601) (not bm!61921) (not b!1260551) (not b!1260560) (not b_lambda!22775) (not b!1260599) (not b!1260570) (not b!1260581) (not bm!61931) (not b!1260646) (not d!138283) (not b!1260559) (not b!1260576) (not b!1260562) (not b_next!27379) (not b_lambda!22771) (not b!1260683) (not d!138285) (not d!138287) (not bm!61926) (not b!1260600) (not b!1260556) (not b!1260575) (not d!138281) (not b!1260569))
(check-sat b_and!45273 (not b_next!27379))
