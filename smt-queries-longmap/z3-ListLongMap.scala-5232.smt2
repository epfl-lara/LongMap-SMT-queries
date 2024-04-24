; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70622 () Bool)

(assert start!70622)

(declare-fun b_free!12799 () Bool)

(declare-fun b_next!12799 () Bool)

(assert (=> start!70622 (= b_free!12799 (not b_next!12799))))

(declare-fun tp!45127 () Bool)

(declare-fun b_and!21629 () Bool)

(assert (=> start!70622 (= tp!45127 b_and!21629)))

(declare-fun b!819297 () Bool)

(declare-fun res!558890 () Bool)

(declare-fun e!454877 () Bool)

(assert (=> b!819297 (=> (not res!558890) (not e!454877))))

(declare-datatypes ((array!45217 0))(
  ( (array!45218 (arr!21659 (Array (_ BitVec 32) (_ BitVec 64))) (size!22079 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45217)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24347 0))(
  ( (V!24348 (val!7302 Int)) )
))
(declare-datatypes ((ValueCell!6839 0))(
  ( (ValueCellFull!6839 (v!9731 V!24347)) (EmptyCell!6839) )
))
(declare-datatypes ((array!45219 0))(
  ( (array!45220 (arr!21660 (Array (_ BitVec 32) ValueCell!6839)) (size!22080 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45219)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!819297 (= res!558890 (and (= (size!22080 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22079 _keys!976) (size!22080 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!819298 () Bool)

(declare-fun e!454874 () Bool)

(declare-fun tp_is_empty!14509 () Bool)

(assert (=> b!819298 (= e!454874 tp_is_empty!14509)))

(declare-fun mapIsEmpty!23359 () Bool)

(declare-fun mapRes!23359 () Bool)

(assert (=> mapIsEmpty!23359 mapRes!23359))

(declare-fun res!558891 () Bool)

(assert (=> start!70622 (=> (not res!558891) (not e!454877))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70622 (= res!558891 (validMask!0 mask!1312))))

(assert (=> start!70622 e!454877))

(assert (=> start!70622 tp_is_empty!14509))

(declare-fun array_inv!17347 (array!45217) Bool)

(assert (=> start!70622 (array_inv!17347 _keys!976)))

(assert (=> start!70622 true))

(declare-fun e!454873 () Bool)

(declare-fun array_inv!17348 (array!45219) Bool)

(assert (=> start!70622 (and (array_inv!17348 _values!788) e!454873)))

(assert (=> start!70622 tp!45127))

(declare-fun b!819299 () Bool)

(declare-fun res!558894 () Bool)

(assert (=> b!819299 (=> (not res!558894) (not e!454877))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45217 (_ BitVec 32)) Bool)

(assert (=> b!819299 (= res!558894 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!819300 () Bool)

(declare-fun res!558893 () Bool)

(assert (=> b!819300 (=> (not res!558893) (not e!454877))))

(declare-datatypes ((List!15321 0))(
  ( (Nil!15318) (Cons!15317 (h!16452 (_ BitVec 64)) (t!21640 List!15321)) )
))
(declare-fun arrayNoDuplicates!0 (array!45217 (_ BitVec 32) List!15321) Bool)

(assert (=> b!819300 (= res!558893 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15318))))

(declare-fun b!819301 () Bool)

(assert (=> b!819301 (= e!454873 (and e!454874 mapRes!23359))))

(declare-fun condMapEmpty!23359 () Bool)

(declare-fun mapDefault!23359 () ValueCell!6839)

(assert (=> b!819301 (= condMapEmpty!23359 (= (arr!21660 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6839)) mapDefault!23359)))))

(declare-fun b!819302 () Bool)

(declare-fun e!454878 () Bool)

(assert (=> b!819302 (= e!454878 tp_is_empty!14509)))

(declare-fun b!819303 () Bool)

(declare-fun e!454875 () Bool)

(assert (=> b!819303 (= e!454875 (bvsle #b00000000000000000000000000000000 (size!22079 _keys!976)))))

(declare-fun zeroValueBefore!34 () V!24347)

(declare-fun minValue!754 () V!24347)

(declare-datatypes ((tuple2!9510 0))(
  ( (tuple2!9511 (_1!4766 (_ BitVec 64)) (_2!4766 V!24347)) )
))
(declare-datatypes ((List!15322 0))(
  ( (Nil!15319) (Cons!15318 (h!16453 tuple2!9510) (t!21641 List!15322)) )
))
(declare-datatypes ((ListLongMap!8335 0))(
  ( (ListLongMap!8336 (toList!4183 List!15322)) )
))
(declare-fun lt!367064 () ListLongMap!8335)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2378 (array!45217 array!45219 (_ BitVec 32) (_ BitVec 32) V!24347 V!24347 (_ BitVec 32) Int) ListLongMap!8335)

(assert (=> b!819303 (= lt!367064 (getCurrentListMap!2378 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23359 () Bool)

(declare-fun tp!45126 () Bool)

(assert (=> mapNonEmpty!23359 (= mapRes!23359 (and tp!45126 e!454878))))

(declare-fun mapKey!23359 () (_ BitVec 32))

(declare-fun mapRest!23359 () (Array (_ BitVec 32) ValueCell!6839))

(declare-fun mapValue!23359 () ValueCell!6839)

(assert (=> mapNonEmpty!23359 (= (arr!21660 _values!788) (store mapRest!23359 mapKey!23359 mapValue!23359))))

(declare-fun b!819304 () Bool)

(assert (=> b!819304 (= e!454877 (not e!454875))))

(declare-fun res!558892 () Bool)

(assert (=> b!819304 (=> res!558892 e!454875)))

(assert (=> b!819304 (= res!558892 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!367066 () ListLongMap!8335)

(declare-fun lt!367063 () ListLongMap!8335)

(assert (=> b!819304 (= lt!367066 lt!367063)))

(declare-fun zeroValueAfter!34 () V!24347)

(declare-datatypes ((Unit!27917 0))(
  ( (Unit!27918) )
))
(declare-fun lt!367065 () Unit!27917)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!368 (array!45217 array!45219 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24347 V!24347 V!24347 V!24347 (_ BitVec 32) Int) Unit!27917)

(assert (=> b!819304 (= lt!367065 (lemmaNoChangeToArrayThenSameMapNoExtras!368 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2280 (array!45217 array!45219 (_ BitVec 32) (_ BitVec 32) V!24347 V!24347 (_ BitVec 32) Int) ListLongMap!8335)

(assert (=> b!819304 (= lt!367063 (getCurrentListMapNoExtraKeys!2280 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819304 (= lt!367066 (getCurrentListMapNoExtraKeys!2280 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70622 res!558891) b!819297))

(assert (= (and b!819297 res!558890) b!819299))

(assert (= (and b!819299 res!558894) b!819300))

(assert (= (and b!819300 res!558893) b!819304))

(assert (= (and b!819304 (not res!558892)) b!819303))

(assert (= (and b!819301 condMapEmpty!23359) mapIsEmpty!23359))

(assert (= (and b!819301 (not condMapEmpty!23359)) mapNonEmpty!23359))

(get-info :version)

(assert (= (and mapNonEmpty!23359 ((_ is ValueCellFull!6839) mapValue!23359)) b!819302))

(assert (= (and b!819301 ((_ is ValueCellFull!6839) mapDefault!23359)) b!819298))

(assert (= start!70622 b!819301))

(declare-fun m!761107 () Bool)

(assert (=> b!819304 m!761107))

(declare-fun m!761109 () Bool)

(assert (=> b!819304 m!761109))

(declare-fun m!761111 () Bool)

(assert (=> b!819304 m!761111))

(declare-fun m!761113 () Bool)

(assert (=> b!819299 m!761113))

(declare-fun m!761115 () Bool)

(assert (=> mapNonEmpty!23359 m!761115))

(declare-fun m!761117 () Bool)

(assert (=> b!819303 m!761117))

(declare-fun m!761119 () Bool)

(assert (=> b!819300 m!761119))

(declare-fun m!761121 () Bool)

(assert (=> start!70622 m!761121))

(declare-fun m!761123 () Bool)

(assert (=> start!70622 m!761123))

(declare-fun m!761125 () Bool)

(assert (=> start!70622 m!761125))

(check-sat (not start!70622) (not mapNonEmpty!23359) (not b!819303) (not b!819300) b_and!21629 tp_is_empty!14509 (not b!819299) (not b!819304) (not b_next!12799))
(check-sat b_and!21629 (not b_next!12799))
(get-model)

(declare-fun b!819363 () Bool)

(declare-fun e!454925 () Bool)

(declare-fun e!454923 () Bool)

(assert (=> b!819363 (= e!454925 e!454923)))

(declare-fun c!89362 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!819363 (= c!89362 (validKeyInArray!0 (select (arr!21659 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35650 () Bool)

(declare-fun call!35653 () Bool)

(assert (=> bm!35650 (= call!35653 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89362 (Cons!15317 (select (arr!21659 _keys!976) #b00000000000000000000000000000000) Nil!15318) Nil!15318)))))

(declare-fun b!819364 () Bool)

(assert (=> b!819364 (= e!454923 call!35653)))

(declare-fun b!819365 () Bool)

(declare-fun e!454924 () Bool)

(assert (=> b!819365 (= e!454924 e!454925)))

(declare-fun res!558933 () Bool)

(assert (=> b!819365 (=> (not res!558933) (not e!454925))))

(declare-fun e!454926 () Bool)

(assert (=> b!819365 (= res!558933 (not e!454926))))

(declare-fun res!558931 () Bool)

(assert (=> b!819365 (=> (not res!558931) (not e!454926))))

(assert (=> b!819365 (= res!558931 (validKeyInArray!0 (select (arr!21659 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!819366 () Bool)

(assert (=> b!819366 (= e!454923 call!35653)))

(declare-fun d!104937 () Bool)

(declare-fun res!558932 () Bool)

(assert (=> d!104937 (=> res!558932 e!454924)))

(assert (=> d!104937 (= res!558932 (bvsge #b00000000000000000000000000000000 (size!22079 _keys!976)))))

(assert (=> d!104937 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15318) e!454924)))

(declare-fun b!819367 () Bool)

(declare-fun contains!4135 (List!15321 (_ BitVec 64)) Bool)

(assert (=> b!819367 (= e!454926 (contains!4135 Nil!15318 (select (arr!21659 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!104937 (not res!558932)) b!819365))

(assert (= (and b!819365 res!558931) b!819367))

(assert (= (and b!819365 res!558933) b!819363))

(assert (= (and b!819363 c!89362) b!819366))

(assert (= (and b!819363 (not c!89362)) b!819364))

(assert (= (or b!819366 b!819364) bm!35650))

(declare-fun m!761167 () Bool)

(assert (=> b!819363 m!761167))

(assert (=> b!819363 m!761167))

(declare-fun m!761169 () Bool)

(assert (=> b!819363 m!761169))

(assert (=> bm!35650 m!761167))

(declare-fun m!761171 () Bool)

(assert (=> bm!35650 m!761171))

(assert (=> b!819365 m!761167))

(assert (=> b!819365 m!761167))

(assert (=> b!819365 m!761169))

(assert (=> b!819367 m!761167))

(assert (=> b!819367 m!761167))

(declare-fun m!761173 () Bool)

(assert (=> b!819367 m!761173))

(assert (=> b!819300 d!104937))

(declare-fun d!104939 () Bool)

(assert (=> d!104939 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!70622 d!104939))

(declare-fun d!104941 () Bool)

(assert (=> d!104941 (= (array_inv!17347 _keys!976) (bvsge (size!22079 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!70622 d!104941))

(declare-fun d!104943 () Bool)

(assert (=> d!104943 (= (array_inv!17348 _values!788) (bvsge (size!22080 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!70622 d!104943))

(declare-fun bm!35653 () Bool)

(declare-fun call!35656 () Bool)

(assert (=> bm!35653 (= call!35656 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun d!104945 () Bool)

(declare-fun res!558939 () Bool)

(declare-fun e!454934 () Bool)

(assert (=> d!104945 (=> res!558939 e!454934)))

(assert (=> d!104945 (= res!558939 (bvsge #b00000000000000000000000000000000 (size!22079 _keys!976)))))

(assert (=> d!104945 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!454934)))

(declare-fun b!819376 () Bool)

(declare-fun e!454933 () Bool)

(assert (=> b!819376 (= e!454933 call!35656)))

(declare-fun b!819377 () Bool)

(declare-fun e!454935 () Bool)

(assert (=> b!819377 (= e!454935 e!454933)))

(declare-fun lt!367097 () (_ BitVec 64))

(assert (=> b!819377 (= lt!367097 (select (arr!21659 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!367098 () Unit!27917)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!45217 (_ BitVec 64) (_ BitVec 32)) Unit!27917)

(assert (=> b!819377 (= lt!367098 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!367097 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!45217 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!819377 (arrayContainsKey!0 _keys!976 lt!367097 #b00000000000000000000000000000000)))

(declare-fun lt!367099 () Unit!27917)

(assert (=> b!819377 (= lt!367099 lt!367098)))

(declare-fun res!558938 () Bool)

(declare-datatypes ((SeekEntryResult!8676 0))(
  ( (MissingZero!8676 (index!37075 (_ BitVec 32))) (Found!8676 (index!37076 (_ BitVec 32))) (Intermediate!8676 (undefined!9488 Bool) (index!37077 (_ BitVec 32)) (x!68918 (_ BitVec 32))) (Undefined!8676) (MissingVacant!8676 (index!37078 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!45217 (_ BitVec 32)) SeekEntryResult!8676)

(assert (=> b!819377 (= res!558938 (= (seekEntryOrOpen!0 (select (arr!21659 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8676 #b00000000000000000000000000000000)))))

(assert (=> b!819377 (=> (not res!558938) (not e!454933))))

(declare-fun b!819378 () Bool)

(assert (=> b!819378 (= e!454934 e!454935)))

(declare-fun c!89365 () Bool)

(assert (=> b!819378 (= c!89365 (validKeyInArray!0 (select (arr!21659 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!819379 () Bool)

(assert (=> b!819379 (= e!454935 call!35656)))

(assert (= (and d!104945 (not res!558939)) b!819378))

(assert (= (and b!819378 c!89365) b!819377))

(assert (= (and b!819378 (not c!89365)) b!819379))

(assert (= (and b!819377 res!558938) b!819376))

(assert (= (or b!819376 b!819379) bm!35653))

(declare-fun m!761175 () Bool)

(assert (=> bm!35653 m!761175))

(assert (=> b!819377 m!761167))

(declare-fun m!761177 () Bool)

(assert (=> b!819377 m!761177))

(declare-fun m!761179 () Bool)

(assert (=> b!819377 m!761179))

(assert (=> b!819377 m!761167))

(declare-fun m!761181 () Bool)

(assert (=> b!819377 m!761181))

(assert (=> b!819378 m!761167))

(assert (=> b!819378 m!761167))

(assert (=> b!819378 m!761169))

(assert (=> b!819299 d!104945))

(declare-fun d!104947 () Bool)

(assert (=> d!104947 (= (getCurrentListMapNoExtraKeys!2280 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2280 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!367102 () Unit!27917)

(declare-fun choose!1398 (array!45217 array!45219 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24347 V!24347 V!24347 V!24347 (_ BitVec 32) Int) Unit!27917)

(assert (=> d!104947 (= lt!367102 (choose!1398 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!104947 (validMask!0 mask!1312)))

(assert (=> d!104947 (= (lemmaNoChangeToArrayThenSameMapNoExtras!368 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!367102)))

(declare-fun bs!22826 () Bool)

(assert (= bs!22826 d!104947))

(assert (=> bs!22826 m!761111))

(assert (=> bs!22826 m!761109))

(declare-fun m!761183 () Bool)

(assert (=> bs!22826 m!761183))

(assert (=> bs!22826 m!761121))

(assert (=> b!819304 d!104947))

(declare-fun b!819404 () Bool)

(declare-fun e!454951 () ListLongMap!8335)

(declare-fun e!454953 () ListLongMap!8335)

(assert (=> b!819404 (= e!454951 e!454953)))

(declare-fun c!89376 () Bool)

(assert (=> b!819404 (= c!89376 (validKeyInArray!0 (select (arr!21659 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!819405 () Bool)

(declare-fun e!454954 () Bool)

(declare-fun e!454956 () Bool)

(assert (=> b!819405 (= e!454954 e!454956)))

(declare-fun c!89374 () Bool)

(assert (=> b!819405 (= c!89374 (bvslt #b00000000000000000000000000000000 (size!22079 _keys!976)))))

(declare-fun b!819406 () Bool)

(declare-fun lt!367123 () ListLongMap!8335)

(assert (=> b!819406 (= e!454956 (= lt!367123 (getCurrentListMapNoExtraKeys!2280 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!819407 () Bool)

(declare-fun lt!367117 () Unit!27917)

(declare-fun lt!367120 () Unit!27917)

(assert (=> b!819407 (= lt!367117 lt!367120)))

(declare-fun lt!367121 () (_ BitVec 64))

(declare-fun lt!367119 () V!24347)

(declare-fun lt!367122 () (_ BitVec 64))

(declare-fun lt!367118 () ListLongMap!8335)

(declare-fun contains!4136 (ListLongMap!8335 (_ BitVec 64)) Bool)

(declare-fun +!1823 (ListLongMap!8335 tuple2!9510) ListLongMap!8335)

(assert (=> b!819407 (not (contains!4136 (+!1823 lt!367118 (tuple2!9511 lt!367122 lt!367119)) lt!367121))))

(declare-fun addStillNotContains!180 (ListLongMap!8335 (_ BitVec 64) V!24347 (_ BitVec 64)) Unit!27917)

(assert (=> b!819407 (= lt!367120 (addStillNotContains!180 lt!367118 lt!367122 lt!367119 lt!367121))))

(assert (=> b!819407 (= lt!367121 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!11569 (ValueCell!6839 V!24347) V!24347)

(declare-fun dynLambda!961 (Int (_ BitVec 64)) V!24347)

(assert (=> b!819407 (= lt!367119 (get!11569 (select (arr!21660 _values!788) #b00000000000000000000000000000000) (dynLambda!961 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!819407 (= lt!367122 (select (arr!21659 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!35659 () ListLongMap!8335)

(assert (=> b!819407 (= lt!367118 call!35659)))

(assert (=> b!819407 (= e!454953 (+!1823 call!35659 (tuple2!9511 (select (arr!21659 _keys!976) #b00000000000000000000000000000000) (get!11569 (select (arr!21660 _values!788) #b00000000000000000000000000000000) (dynLambda!961 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!819408 () Bool)

(declare-fun res!558949 () Bool)

(declare-fun e!454955 () Bool)

(assert (=> b!819408 (=> (not res!558949) (not e!454955))))

(assert (=> b!819408 (= res!558949 (not (contains!4136 lt!367123 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!819409 () Bool)

(assert (=> b!819409 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22079 _keys!976)))))

(assert (=> b!819409 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22080 _values!788)))))

(declare-fun e!454950 () Bool)

(declare-fun apply!353 (ListLongMap!8335 (_ BitVec 64)) V!24347)

(assert (=> b!819409 (= e!454950 (= (apply!353 lt!367123 (select (arr!21659 _keys!976) #b00000000000000000000000000000000)) (get!11569 (select (arr!21660 _values!788) #b00000000000000000000000000000000) (dynLambda!961 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!819410 () Bool)

(assert (=> b!819410 (= e!454951 (ListLongMap!8336 Nil!15319))))

(declare-fun b!819411 () Bool)

(assert (=> b!819411 (= e!454954 e!454950)))

(assert (=> b!819411 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22079 _keys!976)))))

(declare-fun res!558948 () Bool)

(assert (=> b!819411 (= res!558948 (contains!4136 lt!367123 (select (arr!21659 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!819411 (=> (not res!558948) (not e!454950))))

(declare-fun d!104949 () Bool)

(assert (=> d!104949 e!454955))

(declare-fun res!558950 () Bool)

(assert (=> d!104949 (=> (not res!558950) (not e!454955))))

(assert (=> d!104949 (= res!558950 (not (contains!4136 lt!367123 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104949 (= lt!367123 e!454951)))

(declare-fun c!89377 () Bool)

(assert (=> d!104949 (= c!89377 (bvsge #b00000000000000000000000000000000 (size!22079 _keys!976)))))

(assert (=> d!104949 (validMask!0 mask!1312)))

(assert (=> d!104949 (= (getCurrentListMapNoExtraKeys!2280 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!367123)))

(declare-fun b!819412 () Bool)

(declare-fun e!454952 () Bool)

(assert (=> b!819412 (= e!454952 (validKeyInArray!0 (select (arr!21659 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!819412 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!819413 () Bool)

(declare-fun isEmpty!641 (ListLongMap!8335) Bool)

(assert (=> b!819413 (= e!454956 (isEmpty!641 lt!367123))))

(declare-fun b!819414 () Bool)

(assert (=> b!819414 (= e!454955 e!454954)))

(declare-fun c!89375 () Bool)

(assert (=> b!819414 (= c!89375 e!454952)))

(declare-fun res!558951 () Bool)

(assert (=> b!819414 (=> (not res!558951) (not e!454952))))

(assert (=> b!819414 (= res!558951 (bvslt #b00000000000000000000000000000000 (size!22079 _keys!976)))))

(declare-fun b!819415 () Bool)

(assert (=> b!819415 (= e!454953 call!35659)))

(declare-fun bm!35656 () Bool)

(assert (=> bm!35656 (= call!35659 (getCurrentListMapNoExtraKeys!2280 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(assert (= (and d!104949 c!89377) b!819410))

(assert (= (and d!104949 (not c!89377)) b!819404))

(assert (= (and b!819404 c!89376) b!819407))

(assert (= (and b!819404 (not c!89376)) b!819415))

(assert (= (or b!819407 b!819415) bm!35656))

(assert (= (and d!104949 res!558950) b!819408))

(assert (= (and b!819408 res!558949) b!819414))

(assert (= (and b!819414 res!558951) b!819412))

(assert (= (and b!819414 c!89375) b!819411))

(assert (= (and b!819414 (not c!89375)) b!819405))

(assert (= (and b!819411 res!558948) b!819409))

(assert (= (and b!819405 c!89374) b!819406))

(assert (= (and b!819405 (not c!89374)) b!819413))

(declare-fun b_lambda!10941 () Bool)

(assert (=> (not b_lambda!10941) (not b!819407)))

(declare-fun t!21645 () Bool)

(declare-fun tb!4179 () Bool)

(assert (=> (and start!70622 (= defaultEntry!796 defaultEntry!796) t!21645) tb!4179))

(declare-fun result!7893 () Bool)

(assert (=> tb!4179 (= result!7893 tp_is_empty!14509)))

(assert (=> b!819407 t!21645))

(declare-fun b_and!21635 () Bool)

(assert (= b_and!21629 (and (=> t!21645 result!7893) b_and!21635)))

(declare-fun b_lambda!10943 () Bool)

(assert (=> (not b_lambda!10943) (not b!819409)))

(assert (=> b!819409 t!21645))

(declare-fun b_and!21637 () Bool)

(assert (= b_and!21635 (and (=> t!21645 result!7893) b_and!21637)))

(declare-fun m!761185 () Bool)

(assert (=> b!819408 m!761185))

(assert (=> b!819412 m!761167))

(assert (=> b!819412 m!761167))

(assert (=> b!819412 m!761169))

(declare-fun m!761187 () Bool)

(assert (=> b!819409 m!761187))

(declare-fun m!761189 () Bool)

(assert (=> b!819409 m!761189))

(assert (=> b!819409 m!761187))

(declare-fun m!761191 () Bool)

(assert (=> b!819409 m!761191))

(assert (=> b!819409 m!761189))

(assert (=> b!819409 m!761167))

(assert (=> b!819409 m!761167))

(declare-fun m!761193 () Bool)

(assert (=> b!819409 m!761193))

(declare-fun m!761195 () Bool)

(assert (=> b!819406 m!761195))

(assert (=> b!819404 m!761167))

(assert (=> b!819404 m!761167))

(assert (=> b!819404 m!761169))

(assert (=> b!819411 m!761167))

(assert (=> b!819411 m!761167))

(declare-fun m!761197 () Bool)

(assert (=> b!819411 m!761197))

(declare-fun m!761199 () Bool)

(assert (=> b!819413 m!761199))

(declare-fun m!761201 () Bool)

(assert (=> d!104949 m!761201))

(assert (=> d!104949 m!761121))

(assert (=> bm!35656 m!761195))

(assert (=> b!819407 m!761187))

(declare-fun m!761203 () Bool)

(assert (=> b!819407 m!761203))

(assert (=> b!819407 m!761189))

(assert (=> b!819407 m!761187))

(assert (=> b!819407 m!761191))

(assert (=> b!819407 m!761189))

(declare-fun m!761205 () Bool)

(assert (=> b!819407 m!761205))

(declare-fun m!761207 () Bool)

(assert (=> b!819407 m!761207))

(assert (=> b!819407 m!761167))

(assert (=> b!819407 m!761207))

(declare-fun m!761209 () Bool)

(assert (=> b!819407 m!761209))

(assert (=> b!819304 d!104949))

(declare-fun b!819418 () Bool)

(declare-fun e!454958 () ListLongMap!8335)

(declare-fun e!454960 () ListLongMap!8335)

(assert (=> b!819418 (= e!454958 e!454960)))

(declare-fun c!89380 () Bool)

(assert (=> b!819418 (= c!89380 (validKeyInArray!0 (select (arr!21659 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!819419 () Bool)

(declare-fun e!454961 () Bool)

(declare-fun e!454963 () Bool)

(assert (=> b!819419 (= e!454961 e!454963)))

(declare-fun c!89378 () Bool)

(assert (=> b!819419 (= c!89378 (bvslt #b00000000000000000000000000000000 (size!22079 _keys!976)))))

(declare-fun lt!367130 () ListLongMap!8335)

(declare-fun b!819420 () Bool)

(assert (=> b!819420 (= e!454963 (= lt!367130 (getCurrentListMapNoExtraKeys!2280 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!819421 () Bool)

(declare-fun lt!367124 () Unit!27917)

(declare-fun lt!367127 () Unit!27917)

(assert (=> b!819421 (= lt!367124 lt!367127)))

(declare-fun lt!367129 () (_ BitVec 64))

(declare-fun lt!367126 () V!24347)

(declare-fun lt!367128 () (_ BitVec 64))

(declare-fun lt!367125 () ListLongMap!8335)

(assert (=> b!819421 (not (contains!4136 (+!1823 lt!367125 (tuple2!9511 lt!367129 lt!367126)) lt!367128))))

(assert (=> b!819421 (= lt!367127 (addStillNotContains!180 lt!367125 lt!367129 lt!367126 lt!367128))))

(assert (=> b!819421 (= lt!367128 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!819421 (= lt!367126 (get!11569 (select (arr!21660 _values!788) #b00000000000000000000000000000000) (dynLambda!961 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!819421 (= lt!367129 (select (arr!21659 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!35660 () ListLongMap!8335)

(assert (=> b!819421 (= lt!367125 call!35660)))

(assert (=> b!819421 (= e!454960 (+!1823 call!35660 (tuple2!9511 (select (arr!21659 _keys!976) #b00000000000000000000000000000000) (get!11569 (select (arr!21660 _values!788) #b00000000000000000000000000000000) (dynLambda!961 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!819422 () Bool)

(declare-fun res!558953 () Bool)

(declare-fun e!454962 () Bool)

(assert (=> b!819422 (=> (not res!558953) (not e!454962))))

(assert (=> b!819422 (= res!558953 (not (contains!4136 lt!367130 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!819423 () Bool)

(assert (=> b!819423 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22079 _keys!976)))))

(assert (=> b!819423 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22080 _values!788)))))

(declare-fun e!454957 () Bool)

(assert (=> b!819423 (= e!454957 (= (apply!353 lt!367130 (select (arr!21659 _keys!976) #b00000000000000000000000000000000)) (get!11569 (select (arr!21660 _values!788) #b00000000000000000000000000000000) (dynLambda!961 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!819424 () Bool)

(assert (=> b!819424 (= e!454958 (ListLongMap!8336 Nil!15319))))

(declare-fun b!819425 () Bool)

(assert (=> b!819425 (= e!454961 e!454957)))

(assert (=> b!819425 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22079 _keys!976)))))

(declare-fun res!558952 () Bool)

(assert (=> b!819425 (= res!558952 (contains!4136 lt!367130 (select (arr!21659 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!819425 (=> (not res!558952) (not e!454957))))

(declare-fun d!104951 () Bool)

(assert (=> d!104951 e!454962))

(declare-fun res!558954 () Bool)

(assert (=> d!104951 (=> (not res!558954) (not e!454962))))

(assert (=> d!104951 (= res!558954 (not (contains!4136 lt!367130 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104951 (= lt!367130 e!454958)))

(declare-fun c!89381 () Bool)

(assert (=> d!104951 (= c!89381 (bvsge #b00000000000000000000000000000000 (size!22079 _keys!976)))))

(assert (=> d!104951 (validMask!0 mask!1312)))

(assert (=> d!104951 (= (getCurrentListMapNoExtraKeys!2280 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!367130)))

(declare-fun b!819426 () Bool)

(declare-fun e!454959 () Bool)

(assert (=> b!819426 (= e!454959 (validKeyInArray!0 (select (arr!21659 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!819426 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!819427 () Bool)

(assert (=> b!819427 (= e!454963 (isEmpty!641 lt!367130))))

(declare-fun b!819428 () Bool)

(assert (=> b!819428 (= e!454962 e!454961)))

(declare-fun c!89379 () Bool)

(assert (=> b!819428 (= c!89379 e!454959)))

(declare-fun res!558955 () Bool)

(assert (=> b!819428 (=> (not res!558955) (not e!454959))))

(assert (=> b!819428 (= res!558955 (bvslt #b00000000000000000000000000000000 (size!22079 _keys!976)))))

(declare-fun b!819429 () Bool)

(assert (=> b!819429 (= e!454960 call!35660)))

(declare-fun bm!35657 () Bool)

(assert (=> bm!35657 (= call!35660 (getCurrentListMapNoExtraKeys!2280 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(assert (= (and d!104951 c!89381) b!819424))

(assert (= (and d!104951 (not c!89381)) b!819418))

(assert (= (and b!819418 c!89380) b!819421))

(assert (= (and b!819418 (not c!89380)) b!819429))

(assert (= (or b!819421 b!819429) bm!35657))

(assert (= (and d!104951 res!558954) b!819422))

(assert (= (and b!819422 res!558953) b!819428))

(assert (= (and b!819428 res!558955) b!819426))

(assert (= (and b!819428 c!89379) b!819425))

(assert (= (and b!819428 (not c!89379)) b!819419))

(assert (= (and b!819425 res!558952) b!819423))

(assert (= (and b!819419 c!89378) b!819420))

(assert (= (and b!819419 (not c!89378)) b!819427))

(declare-fun b_lambda!10945 () Bool)

(assert (=> (not b_lambda!10945) (not b!819421)))

(assert (=> b!819421 t!21645))

(declare-fun b_and!21639 () Bool)

(assert (= b_and!21637 (and (=> t!21645 result!7893) b_and!21639)))

(declare-fun b_lambda!10947 () Bool)

(assert (=> (not b_lambda!10947) (not b!819423)))

(assert (=> b!819423 t!21645))

(declare-fun b_and!21641 () Bool)

(assert (= b_and!21639 (and (=> t!21645 result!7893) b_and!21641)))

(declare-fun m!761211 () Bool)

(assert (=> b!819422 m!761211))

(assert (=> b!819426 m!761167))

(assert (=> b!819426 m!761167))

(assert (=> b!819426 m!761169))

(assert (=> b!819423 m!761187))

(assert (=> b!819423 m!761189))

(assert (=> b!819423 m!761187))

(assert (=> b!819423 m!761191))

(assert (=> b!819423 m!761189))

(assert (=> b!819423 m!761167))

(assert (=> b!819423 m!761167))

(declare-fun m!761213 () Bool)

(assert (=> b!819423 m!761213))

(declare-fun m!761215 () Bool)

(assert (=> b!819420 m!761215))

(assert (=> b!819418 m!761167))

(assert (=> b!819418 m!761167))

(assert (=> b!819418 m!761169))

(assert (=> b!819425 m!761167))

(assert (=> b!819425 m!761167))

(declare-fun m!761217 () Bool)

(assert (=> b!819425 m!761217))

(declare-fun m!761219 () Bool)

(assert (=> b!819427 m!761219))

(declare-fun m!761221 () Bool)

(assert (=> d!104951 m!761221))

(assert (=> d!104951 m!761121))

(assert (=> bm!35657 m!761215))

(assert (=> b!819421 m!761187))

(declare-fun m!761223 () Bool)

(assert (=> b!819421 m!761223))

(assert (=> b!819421 m!761189))

(assert (=> b!819421 m!761187))

(assert (=> b!819421 m!761191))

(assert (=> b!819421 m!761189))

(declare-fun m!761225 () Bool)

(assert (=> b!819421 m!761225))

(declare-fun m!761227 () Bool)

(assert (=> b!819421 m!761227))

(assert (=> b!819421 m!761167))

(assert (=> b!819421 m!761227))

(declare-fun m!761229 () Bool)

(assert (=> b!819421 m!761229))

(assert (=> b!819304 d!104951))

(declare-fun b!819472 () Bool)

(declare-fun e!454991 () Unit!27917)

(declare-fun Unit!27921 () Unit!27917)

(assert (=> b!819472 (= e!454991 Unit!27921)))

(declare-fun d!104953 () Bool)

(declare-fun e!454993 () Bool)

(assert (=> d!104953 e!454993))

(declare-fun res!558975 () Bool)

(assert (=> d!104953 (=> (not res!558975) (not e!454993))))

(assert (=> d!104953 (= res!558975 (or (bvsge #b00000000000000000000000000000000 (size!22079 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22079 _keys!976)))))))

(declare-fun lt!367191 () ListLongMap!8335)

(declare-fun lt!367178 () ListLongMap!8335)

(assert (=> d!104953 (= lt!367191 lt!367178)))

(declare-fun lt!367187 () Unit!27917)

(assert (=> d!104953 (= lt!367187 e!454991)))

(declare-fun c!89395 () Bool)

(declare-fun e!454999 () Bool)

(assert (=> d!104953 (= c!89395 e!454999)))

(declare-fun res!558980 () Bool)

(assert (=> d!104953 (=> (not res!558980) (not e!454999))))

(assert (=> d!104953 (= res!558980 (bvslt #b00000000000000000000000000000000 (size!22079 _keys!976)))))

(declare-fun e!454998 () ListLongMap!8335)

(assert (=> d!104953 (= lt!367178 e!454998)))

(declare-fun c!89398 () Bool)

(assert (=> d!104953 (= c!89398 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104953 (validMask!0 mask!1312)))

(assert (=> d!104953 (= (getCurrentListMap!2378 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!367191)))

(declare-fun b!819473 () Bool)

(declare-fun lt!367195 () Unit!27917)

(assert (=> b!819473 (= e!454991 lt!367195)))

(declare-fun lt!367196 () ListLongMap!8335)

(assert (=> b!819473 (= lt!367196 (getCurrentListMapNoExtraKeys!2280 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!367194 () (_ BitVec 64))

(assert (=> b!819473 (= lt!367194 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!367186 () (_ BitVec 64))

(assert (=> b!819473 (= lt!367186 (select (arr!21659 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!367189 () Unit!27917)

(declare-fun addStillContains!307 (ListLongMap!8335 (_ BitVec 64) V!24347 (_ BitVec 64)) Unit!27917)

(assert (=> b!819473 (= lt!367189 (addStillContains!307 lt!367196 lt!367194 zeroValueBefore!34 lt!367186))))

(assert (=> b!819473 (contains!4136 (+!1823 lt!367196 (tuple2!9511 lt!367194 zeroValueBefore!34)) lt!367186)))

(declare-fun lt!367190 () Unit!27917)

(assert (=> b!819473 (= lt!367190 lt!367189)))

(declare-fun lt!367180 () ListLongMap!8335)

(assert (=> b!819473 (= lt!367180 (getCurrentListMapNoExtraKeys!2280 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!367183 () (_ BitVec 64))

(assert (=> b!819473 (= lt!367183 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!367185 () (_ BitVec 64))

(assert (=> b!819473 (= lt!367185 (select (arr!21659 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!367179 () Unit!27917)

(declare-fun addApplyDifferent!307 (ListLongMap!8335 (_ BitVec 64) V!24347 (_ BitVec 64)) Unit!27917)

(assert (=> b!819473 (= lt!367179 (addApplyDifferent!307 lt!367180 lt!367183 minValue!754 lt!367185))))

(assert (=> b!819473 (= (apply!353 (+!1823 lt!367180 (tuple2!9511 lt!367183 minValue!754)) lt!367185) (apply!353 lt!367180 lt!367185))))

(declare-fun lt!367193 () Unit!27917)

(assert (=> b!819473 (= lt!367193 lt!367179)))

(declare-fun lt!367184 () ListLongMap!8335)

(assert (=> b!819473 (= lt!367184 (getCurrentListMapNoExtraKeys!2280 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!367181 () (_ BitVec 64))

(assert (=> b!819473 (= lt!367181 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!367192 () (_ BitVec 64))

(assert (=> b!819473 (= lt!367192 (select (arr!21659 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!367177 () Unit!27917)

(assert (=> b!819473 (= lt!367177 (addApplyDifferent!307 lt!367184 lt!367181 zeroValueBefore!34 lt!367192))))

(assert (=> b!819473 (= (apply!353 (+!1823 lt!367184 (tuple2!9511 lt!367181 zeroValueBefore!34)) lt!367192) (apply!353 lt!367184 lt!367192))))

(declare-fun lt!367188 () Unit!27917)

(assert (=> b!819473 (= lt!367188 lt!367177)))

(declare-fun lt!367182 () ListLongMap!8335)

(assert (=> b!819473 (= lt!367182 (getCurrentListMapNoExtraKeys!2280 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!367176 () (_ BitVec 64))

(assert (=> b!819473 (= lt!367176 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!367175 () (_ BitVec 64))

(assert (=> b!819473 (= lt!367175 (select (arr!21659 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!819473 (= lt!367195 (addApplyDifferent!307 lt!367182 lt!367176 minValue!754 lt!367175))))

(assert (=> b!819473 (= (apply!353 (+!1823 lt!367182 (tuple2!9511 lt!367176 minValue!754)) lt!367175) (apply!353 lt!367182 lt!367175))))

(declare-fun b!819474 () Bool)

(declare-fun call!35681 () ListLongMap!8335)

(assert (=> b!819474 (= e!454998 (+!1823 call!35681 (tuple2!9511 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!819475 () Bool)

(declare-fun e!454996 () Bool)

(assert (=> b!819475 (= e!454996 (= (apply!353 lt!367191 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun b!819476 () Bool)

(declare-fun e!454994 () Bool)

(declare-fun call!35676 () Bool)

(assert (=> b!819476 (= e!454994 (not call!35676))))

(declare-fun b!819477 () Bool)

(declare-fun e!454990 () ListLongMap!8335)

(declare-fun call!35675 () ListLongMap!8335)

(assert (=> b!819477 (= e!454990 call!35675)))

(declare-fun b!819478 () Bool)

(declare-fun e!455001 () ListLongMap!8335)

(declare-fun call!35678 () ListLongMap!8335)

(assert (=> b!819478 (= e!455001 call!35678)))

(declare-fun b!819479 () Bool)

(declare-fun c!89397 () Bool)

(assert (=> b!819479 (= c!89397 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!819479 (= e!454990 e!455001)))

(declare-fun b!819480 () Bool)

(declare-fun e!454992 () Bool)

(assert (=> b!819480 (= e!454993 e!454992)))

(declare-fun c!89394 () Bool)

(assert (=> b!819480 (= c!89394 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!819481 () Bool)

(declare-fun res!558981 () Bool)

(assert (=> b!819481 (=> (not res!558981) (not e!454993))))

(declare-fun e!454995 () Bool)

(assert (=> b!819481 (= res!558981 e!454995)))

(declare-fun res!558982 () Bool)

(assert (=> b!819481 (=> res!558982 e!454995)))

(declare-fun e!455000 () Bool)

(assert (=> b!819481 (= res!558982 (not e!455000))))

(declare-fun res!558974 () Bool)

(assert (=> b!819481 (=> (not res!558974) (not e!455000))))

(assert (=> b!819481 (= res!558974 (bvslt #b00000000000000000000000000000000 (size!22079 _keys!976)))))

(declare-fun b!819482 () Bool)

(assert (=> b!819482 (= e!454999 (validKeyInArray!0 (select (arr!21659 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!819483 () Bool)

(assert (=> b!819483 (= e!454998 e!454990)))

(declare-fun c!89399 () Bool)

(assert (=> b!819483 (= c!89399 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!35672 () Bool)

(declare-fun call!35680 () Bool)

(assert (=> bm!35672 (= call!35680 (contains!4136 lt!367191 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!35677 () ListLongMap!8335)

(declare-fun call!35679 () ListLongMap!8335)

(declare-fun bm!35673 () Bool)

(assert (=> bm!35673 (= call!35681 (+!1823 (ite c!89398 call!35677 (ite c!89399 call!35679 call!35678)) (ite (or c!89398 c!89399) (tuple2!9511 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!9511 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!819484 () Bool)

(declare-fun e!455002 () Bool)

(assert (=> b!819484 (= e!455002 (= (apply!353 lt!367191 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun bm!35674 () Bool)

(assert (=> bm!35674 (= call!35676 (contains!4136 lt!367191 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!35675 () Bool)

(assert (=> bm!35675 (= call!35677 (getCurrentListMapNoExtraKeys!2280 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun bm!35676 () Bool)

(assert (=> bm!35676 (= call!35678 call!35679)))

(declare-fun b!819485 () Bool)

(assert (=> b!819485 (= e!454994 e!454996)))

(declare-fun res!558978 () Bool)

(assert (=> b!819485 (= res!558978 call!35676)))

(assert (=> b!819485 (=> (not res!558978) (not e!454996))))

(declare-fun b!819486 () Bool)

(declare-fun e!454997 () Bool)

(assert (=> b!819486 (= e!454995 e!454997)))

(declare-fun res!558977 () Bool)

(assert (=> b!819486 (=> (not res!558977) (not e!454997))))

(assert (=> b!819486 (= res!558977 (contains!4136 lt!367191 (select (arr!21659 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!819486 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22079 _keys!976)))))

(declare-fun b!819487 () Bool)

(assert (=> b!819487 (= e!454992 (not call!35680))))

(declare-fun b!819488 () Bool)

(assert (=> b!819488 (= e!454992 e!455002)))

(declare-fun res!558979 () Bool)

(assert (=> b!819488 (= res!558979 call!35680)))

(assert (=> b!819488 (=> (not res!558979) (not e!455002))))

(declare-fun b!819489 () Bool)

(declare-fun res!558976 () Bool)

(assert (=> b!819489 (=> (not res!558976) (not e!454993))))

(assert (=> b!819489 (= res!558976 e!454994)))

(declare-fun c!89396 () Bool)

(assert (=> b!819489 (= c!89396 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!35677 () Bool)

(assert (=> bm!35677 (= call!35675 call!35681)))

(declare-fun b!819490 () Bool)

(assert (=> b!819490 (= e!455001 call!35675)))

(declare-fun bm!35678 () Bool)

(assert (=> bm!35678 (= call!35679 call!35677)))

(declare-fun b!819491 () Bool)

(assert (=> b!819491 (= e!454997 (= (apply!353 lt!367191 (select (arr!21659 _keys!976) #b00000000000000000000000000000000)) (get!11569 (select (arr!21660 _values!788) #b00000000000000000000000000000000) (dynLambda!961 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!819491 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22080 _values!788)))))

(assert (=> b!819491 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22079 _keys!976)))))

(declare-fun b!819492 () Bool)

(assert (=> b!819492 (= e!455000 (validKeyInArray!0 (select (arr!21659 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!104953 c!89398) b!819474))

(assert (= (and d!104953 (not c!89398)) b!819483))

(assert (= (and b!819483 c!89399) b!819477))

(assert (= (and b!819483 (not c!89399)) b!819479))

(assert (= (and b!819479 c!89397) b!819490))

(assert (= (and b!819479 (not c!89397)) b!819478))

(assert (= (or b!819490 b!819478) bm!35676))

(assert (= (or b!819477 bm!35676) bm!35678))

(assert (= (or b!819477 b!819490) bm!35677))

(assert (= (or b!819474 bm!35678) bm!35675))

(assert (= (or b!819474 bm!35677) bm!35673))

(assert (= (and d!104953 res!558980) b!819482))

(assert (= (and d!104953 c!89395) b!819473))

(assert (= (and d!104953 (not c!89395)) b!819472))

(assert (= (and d!104953 res!558975) b!819481))

(assert (= (and b!819481 res!558974) b!819492))

(assert (= (and b!819481 (not res!558982)) b!819486))

(assert (= (and b!819486 res!558977) b!819491))

(assert (= (and b!819481 res!558981) b!819489))

(assert (= (and b!819489 c!89396) b!819485))

(assert (= (and b!819489 (not c!89396)) b!819476))

(assert (= (and b!819485 res!558978) b!819475))

(assert (= (or b!819485 b!819476) bm!35674))

(assert (= (and b!819489 res!558976) b!819480))

(assert (= (and b!819480 c!89394) b!819488))

(assert (= (and b!819480 (not c!89394)) b!819487))

(assert (= (and b!819488 res!558979) b!819484))

(assert (= (or b!819488 b!819487) bm!35672))

(declare-fun b_lambda!10949 () Bool)

(assert (=> (not b_lambda!10949) (not b!819491)))

(assert (=> b!819491 t!21645))

(declare-fun b_and!21643 () Bool)

(assert (= b_and!21641 (and (=> t!21645 result!7893) b_and!21643)))

(declare-fun m!761231 () Bool)

(assert (=> b!819475 m!761231))

(assert (=> d!104953 m!761121))

(declare-fun m!761233 () Bool)

(assert (=> b!819484 m!761233))

(declare-fun m!761235 () Bool)

(assert (=> bm!35672 m!761235))

(assert (=> b!819492 m!761167))

(assert (=> b!819492 m!761167))

(assert (=> b!819492 m!761169))

(assert (=> b!819486 m!761167))

(assert (=> b!819486 m!761167))

(declare-fun m!761237 () Bool)

(assert (=> b!819486 m!761237))

(assert (=> bm!35675 m!761111))

(assert (=> b!819482 m!761167))

(assert (=> b!819482 m!761167))

(assert (=> b!819482 m!761169))

(declare-fun m!761239 () Bool)

(assert (=> b!819474 m!761239))

(declare-fun m!761241 () Bool)

(assert (=> b!819473 m!761241))

(declare-fun m!761243 () Bool)

(assert (=> b!819473 m!761243))

(declare-fun m!761245 () Bool)

(assert (=> b!819473 m!761245))

(declare-fun m!761247 () Bool)

(assert (=> b!819473 m!761247))

(assert (=> b!819473 m!761241))

(declare-fun m!761249 () Bool)

(assert (=> b!819473 m!761249))

(declare-fun m!761251 () Bool)

(assert (=> b!819473 m!761251))

(declare-fun m!761253 () Bool)

(assert (=> b!819473 m!761253))

(declare-fun m!761255 () Bool)

(assert (=> b!819473 m!761255))

(declare-fun m!761257 () Bool)

(assert (=> b!819473 m!761257))

(assert (=> b!819473 m!761251))

(declare-fun m!761259 () Bool)

(assert (=> b!819473 m!761259))

(declare-fun m!761261 () Bool)

(assert (=> b!819473 m!761261))

(declare-fun m!761263 () Bool)

(assert (=> b!819473 m!761263))

(declare-fun m!761265 () Bool)

(assert (=> b!819473 m!761265))

(declare-fun m!761267 () Bool)

(assert (=> b!819473 m!761267))

(assert (=> b!819473 m!761167))

(declare-fun m!761269 () Bool)

(assert (=> b!819473 m!761269))

(assert (=> b!819473 m!761265))

(assert (=> b!819473 m!761111))

(assert (=> b!819473 m!761255))

(assert (=> b!819491 m!761189))

(assert (=> b!819491 m!761187))

(assert (=> b!819491 m!761191))

(assert (=> b!819491 m!761187))

(assert (=> b!819491 m!761167))

(assert (=> b!819491 m!761167))

(declare-fun m!761271 () Bool)

(assert (=> b!819491 m!761271))

(assert (=> b!819491 m!761189))

(declare-fun m!761273 () Bool)

(assert (=> bm!35673 m!761273))

(declare-fun m!761275 () Bool)

(assert (=> bm!35674 m!761275))

(assert (=> b!819303 d!104953))

(declare-fun mapIsEmpty!23368 () Bool)

(declare-fun mapRes!23368 () Bool)

(assert (=> mapIsEmpty!23368 mapRes!23368))

(declare-fun b!819499 () Bool)

(declare-fun e!455008 () Bool)

(assert (=> b!819499 (= e!455008 tp_is_empty!14509)))

(declare-fun mapNonEmpty!23368 () Bool)

(declare-fun tp!45142 () Bool)

(assert (=> mapNonEmpty!23368 (= mapRes!23368 (and tp!45142 e!455008))))

(declare-fun mapKey!23368 () (_ BitVec 32))

(declare-fun mapValue!23368 () ValueCell!6839)

(declare-fun mapRest!23368 () (Array (_ BitVec 32) ValueCell!6839))

(assert (=> mapNonEmpty!23368 (= mapRest!23359 (store mapRest!23368 mapKey!23368 mapValue!23368))))

(declare-fun b!819500 () Bool)

(declare-fun e!455007 () Bool)

(assert (=> b!819500 (= e!455007 tp_is_empty!14509)))

(declare-fun condMapEmpty!23368 () Bool)

(declare-fun mapDefault!23368 () ValueCell!6839)

(assert (=> mapNonEmpty!23359 (= condMapEmpty!23368 (= mapRest!23359 ((as const (Array (_ BitVec 32) ValueCell!6839)) mapDefault!23368)))))

(assert (=> mapNonEmpty!23359 (= tp!45126 (and e!455007 mapRes!23368))))

(assert (= (and mapNonEmpty!23359 condMapEmpty!23368) mapIsEmpty!23368))

(assert (= (and mapNonEmpty!23359 (not condMapEmpty!23368)) mapNonEmpty!23368))

(assert (= (and mapNonEmpty!23368 ((_ is ValueCellFull!6839) mapValue!23368)) b!819499))

(assert (= (and mapNonEmpty!23359 ((_ is ValueCellFull!6839) mapDefault!23368)) b!819500))

(declare-fun m!761277 () Bool)

(assert (=> mapNonEmpty!23368 m!761277))

(declare-fun b_lambda!10951 () Bool)

(assert (= b_lambda!10945 (or (and start!70622 b_free!12799) b_lambda!10951)))

(declare-fun b_lambda!10953 () Bool)

(assert (= b_lambda!10947 (or (and start!70622 b_free!12799) b_lambda!10953)))

(declare-fun b_lambda!10955 () Bool)

(assert (= b_lambda!10943 (or (and start!70622 b_free!12799) b_lambda!10955)))

(declare-fun b_lambda!10957 () Bool)

(assert (= b_lambda!10949 (or (and start!70622 b_free!12799) b_lambda!10957)))

(declare-fun b_lambda!10959 () Bool)

(assert (= b_lambda!10941 (or (and start!70622 b_free!12799) b_lambda!10959)))

(check-sat (not b!819425) (not mapNonEmpty!23368) (not b!819475) (not bm!35656) (not bm!35674) (not b!819418) (not b!819406) (not b!819365) (not b_next!12799) (not b!819407) (not bm!35673) (not b_lambda!10957) (not b_lambda!10959) (not b!819426) (not b!819482) (not bm!35657) (not b!819412) (not b!819363) (not d!104953) (not b!819404) (not d!104951) (not d!104947) (not b!819484) (not bm!35653) (not b_lambda!10953) (not bm!35650) b_and!21643 (not b!819421) (not b!819420) (not b!819367) (not b!819422) (not b!819409) (not b_lambda!10955) (not b!819427) (not b!819473) tp_is_empty!14509 (not b!819423) (not b!819474) (not d!104949) (not b!819413) (not b!819411) (not bm!35672) (not b_lambda!10951) (not b!819491) (not bm!35675) (not b!819377) (not b!819486) (not b!819408) (not b!819378) (not b!819492))
(check-sat b_and!21643 (not b_next!12799))
