; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70142 () Bool)

(assert start!70142)

(declare-fun b_free!12409 () Bool)

(declare-fun b_next!12409 () Bool)

(assert (=> start!70142 (= b_free!12409 (not b_next!12409))))

(declare-fun tp!43939 () Bool)

(declare-fun b_and!21187 () Bool)

(assert (=> start!70142 (= tp!43939 b_and!21187)))

(declare-fun b!814270 () Bool)

(declare-fun e!451281 () Bool)

(declare-datatypes ((array!44455 0))(
  ( (array!44456 (arr!21284 (Array (_ BitVec 32) (_ BitVec 64))) (size!21704 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44455)

(assert (=> b!814270 (= e!451281 (bvsgt #b00000000000000000000000000000000 (size!21704 _keys!976)))))

(declare-datatypes ((V!23827 0))(
  ( (V!23828 (val!7107 Int)) )
))
(declare-fun zeroValueBefore!34 () V!23827)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!23827)

(declare-datatypes ((ValueCell!6644 0))(
  ( (ValueCellFull!6644 (v!9534 V!23827)) (EmptyCell!6644) )
))
(declare-datatypes ((array!44457 0))(
  ( (array!44458 (arr!21285 (Array (_ BitVec 32) ValueCell!6644)) (size!21705 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44457)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9230 0))(
  ( (tuple2!9231 (_1!4626 (_ BitVec 64)) (_2!4626 V!23827)) )
))
(declare-datatypes ((List!15049 0))(
  ( (Nil!15046) (Cons!15045 (h!16180 tuple2!9230) (t!21356 List!15049)) )
))
(declare-datatypes ((ListLongMap!8055 0))(
  ( (ListLongMap!8056 (toList!4043 List!15049)) )
))
(declare-fun lt!364629 () ListLongMap!8055)

(declare-fun getCurrentListMapNoExtraKeys!2150 (array!44455 array!44457 (_ BitVec 32) (_ BitVec 32) V!23827 V!23827 (_ BitVec 32) Int) ListLongMap!8055)

(assert (=> b!814270 (= lt!364629 (getCurrentListMapNoExtraKeys!2150 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!814271 () Bool)

(declare-fun res!556031 () Bool)

(assert (=> b!814271 (=> (not res!556031) (not e!451281))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!814271 (= res!556031 (and (= (size!21705 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21704 _keys!976) (size!21705 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!814272 () Bool)

(declare-fun res!556030 () Bool)

(assert (=> b!814272 (=> (not res!556030) (not e!451281))))

(declare-datatypes ((List!15050 0))(
  ( (Nil!15047) (Cons!15046 (h!16181 (_ BitVec 64)) (t!21357 List!15050)) )
))
(declare-fun arrayNoDuplicates!0 (array!44455 (_ BitVec 32) List!15050) Bool)

(assert (=> b!814272 (= res!556030 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15047))))

(declare-fun mapIsEmpty!22756 () Bool)

(declare-fun mapRes!22756 () Bool)

(assert (=> mapIsEmpty!22756 mapRes!22756))

(declare-fun res!556032 () Bool)

(assert (=> start!70142 (=> (not res!556032) (not e!451281))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70142 (= res!556032 (validMask!0 mask!1312))))

(assert (=> start!70142 e!451281))

(declare-fun tp_is_empty!14119 () Bool)

(assert (=> start!70142 tp_is_empty!14119))

(declare-fun array_inv!17097 (array!44455) Bool)

(assert (=> start!70142 (array_inv!17097 _keys!976)))

(assert (=> start!70142 true))

(declare-fun e!451282 () Bool)

(declare-fun array_inv!17098 (array!44457) Bool)

(assert (=> start!70142 (and (array_inv!17098 _values!788) e!451282)))

(assert (=> start!70142 tp!43939))

(declare-fun b!814273 () Bool)

(declare-fun e!451283 () Bool)

(assert (=> b!814273 (= e!451282 (and e!451283 mapRes!22756))))

(declare-fun condMapEmpty!22756 () Bool)

(declare-fun mapDefault!22756 () ValueCell!6644)

(assert (=> b!814273 (= condMapEmpty!22756 (= (arr!21285 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6644)) mapDefault!22756)))))

(declare-fun b!814274 () Bool)

(declare-fun res!556033 () Bool)

(assert (=> b!814274 (=> (not res!556033) (not e!451281))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44455 (_ BitVec 32)) Bool)

(assert (=> b!814274 (= res!556033 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!814275 () Bool)

(assert (=> b!814275 (= e!451283 tp_is_empty!14119)))

(declare-fun b!814276 () Bool)

(declare-fun e!451279 () Bool)

(assert (=> b!814276 (= e!451279 tp_is_empty!14119)))

(declare-fun mapNonEmpty!22756 () Bool)

(declare-fun tp!43938 () Bool)

(assert (=> mapNonEmpty!22756 (= mapRes!22756 (and tp!43938 e!451279))))

(declare-fun mapKey!22756 () (_ BitVec 32))

(declare-fun mapValue!22756 () ValueCell!6644)

(declare-fun mapRest!22756 () (Array (_ BitVec 32) ValueCell!6644))

(assert (=> mapNonEmpty!22756 (= (arr!21285 _values!788) (store mapRest!22756 mapKey!22756 mapValue!22756))))

(assert (= (and start!70142 res!556032) b!814271))

(assert (= (and b!814271 res!556031) b!814274))

(assert (= (and b!814274 res!556033) b!814272))

(assert (= (and b!814272 res!556030) b!814270))

(assert (= (and b!814273 condMapEmpty!22756) mapIsEmpty!22756))

(assert (= (and b!814273 (not condMapEmpty!22756)) mapNonEmpty!22756))

(get-info :version)

(assert (= (and mapNonEmpty!22756 ((_ is ValueCellFull!6644) mapValue!22756)) b!814276))

(assert (= (and b!814273 ((_ is ValueCellFull!6644) mapDefault!22756)) b!814275))

(assert (= start!70142 b!814273))

(declare-fun m!756721 () Bool)

(assert (=> b!814270 m!756721))

(declare-fun m!756723 () Bool)

(assert (=> b!814274 m!756723))

(declare-fun m!756725 () Bool)

(assert (=> start!70142 m!756725))

(declare-fun m!756727 () Bool)

(assert (=> start!70142 m!756727))

(declare-fun m!756729 () Bool)

(assert (=> start!70142 m!756729))

(declare-fun m!756731 () Bool)

(assert (=> b!814272 m!756731))

(declare-fun m!756733 () Bool)

(assert (=> mapNonEmpty!22756 m!756733))

(check-sat (not b!814272) (not b!814274) (not b_next!12409) tp_is_empty!14119 b_and!21187 (not mapNonEmpty!22756) (not b!814270) (not start!70142))
(check-sat b_and!21187 (not b_next!12409))
(get-model)

(declare-fun b!814343 () Bool)

(declare-fun e!451334 () ListLongMap!8055)

(assert (=> b!814343 (= e!451334 (ListLongMap!8056 Nil!15046))))

(declare-fun b!814344 () Bool)

(declare-fun e!451328 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!814344 (= e!451328 (validKeyInArray!0 (select (arr!21284 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!814344 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!814345 () Bool)

(declare-datatypes ((Unit!27697 0))(
  ( (Unit!27698) )
))
(declare-fun lt!364655 () Unit!27697)

(declare-fun lt!364652 () Unit!27697)

(assert (=> b!814345 (= lt!364655 lt!364652)))

(declare-fun lt!364653 () ListLongMap!8055)

(declare-fun lt!364651 () (_ BitVec 64))

(declare-fun lt!364654 () V!23827)

(declare-fun lt!364650 () (_ BitVec 64))

(declare-fun contains!4121 (ListLongMap!8055 (_ BitVec 64)) Bool)

(declare-fun +!1786 (ListLongMap!8055 tuple2!9230) ListLongMap!8055)

(assert (=> b!814345 (not (contains!4121 (+!1786 lt!364653 (tuple2!9231 lt!364651 lt!364654)) lt!364650))))

(declare-fun addStillNotContains!174 (ListLongMap!8055 (_ BitVec 64) V!23827 (_ BitVec 64)) Unit!27697)

(assert (=> b!814345 (= lt!364652 (addStillNotContains!174 lt!364653 lt!364651 lt!364654 lt!364650))))

(assert (=> b!814345 (= lt!364650 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!11433 (ValueCell!6644 V!23827) V!23827)

(declare-fun dynLambda!955 (Int (_ BitVec 64)) V!23827)

(assert (=> b!814345 (= lt!364654 (get!11433 (select (arr!21285 _values!788) #b00000000000000000000000000000000) (dynLambda!955 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!814345 (= lt!364651 (select (arr!21284 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!35538 () ListLongMap!8055)

(assert (=> b!814345 (= lt!364653 call!35538)))

(declare-fun e!451329 () ListLongMap!8055)

(assert (=> b!814345 (= e!451329 (+!1786 call!35538 (tuple2!9231 (select (arr!21284 _keys!976) #b00000000000000000000000000000000) (get!11433 (select (arr!21285 _values!788) #b00000000000000000000000000000000) (dynLambda!955 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!814346 () Bool)

(declare-fun e!451333 () Bool)

(declare-fun lt!364656 () ListLongMap!8055)

(declare-fun isEmpty!635 (ListLongMap!8055) Bool)

(assert (=> b!814346 (= e!451333 (isEmpty!635 lt!364656))))

(declare-fun b!814347 () Bool)

(declare-fun res!556066 () Bool)

(declare-fun e!451332 () Bool)

(assert (=> b!814347 (=> (not res!556066) (not e!451332))))

(assert (=> b!814347 (= res!556066 (not (contains!4121 lt!364656 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!814348 () Bool)

(declare-fun e!451331 () Bool)

(assert (=> b!814348 (= e!451331 e!451333)))

(declare-fun c!89193 () Bool)

(assert (=> b!814348 (= c!89193 (bvslt #b00000000000000000000000000000000 (size!21704 _keys!976)))))

(declare-fun b!814349 () Bool)

(assert (=> b!814349 (= e!451334 e!451329)))

(declare-fun c!89192 () Bool)

(assert (=> b!814349 (= c!89192 (validKeyInArray!0 (select (arr!21284 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!814350 () Bool)

(declare-fun e!451330 () Bool)

(assert (=> b!814350 (= e!451331 e!451330)))

(assert (=> b!814350 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21704 _keys!976)))))

(declare-fun res!556068 () Bool)

(assert (=> b!814350 (= res!556068 (contains!4121 lt!364656 (select (arr!21284 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!814350 (=> (not res!556068) (not e!451330))))

(declare-fun b!814351 () Bool)

(assert (=> b!814351 (= e!451333 (= lt!364656 (getCurrentListMapNoExtraKeys!2150 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun d!104703 () Bool)

(assert (=> d!104703 e!451332))

(declare-fun res!556067 () Bool)

(assert (=> d!104703 (=> (not res!556067) (not e!451332))))

(assert (=> d!104703 (= res!556067 (not (contains!4121 lt!364656 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104703 (= lt!364656 e!451334)))

(declare-fun c!89194 () Bool)

(assert (=> d!104703 (= c!89194 (bvsge #b00000000000000000000000000000000 (size!21704 _keys!976)))))

(assert (=> d!104703 (validMask!0 mask!1312)))

(assert (=> d!104703 (= (getCurrentListMapNoExtraKeys!2150 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!364656)))

(declare-fun bm!35535 () Bool)

(assert (=> bm!35535 (= call!35538 (getCurrentListMapNoExtraKeys!2150 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!814352 () Bool)

(assert (=> b!814352 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21704 _keys!976)))))

(assert (=> b!814352 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21705 _values!788)))))

(declare-fun apply!347 (ListLongMap!8055 (_ BitVec 64)) V!23827)

(assert (=> b!814352 (= e!451330 (= (apply!347 lt!364656 (select (arr!21284 _keys!976) #b00000000000000000000000000000000)) (get!11433 (select (arr!21285 _values!788) #b00000000000000000000000000000000) (dynLambda!955 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!814353 () Bool)

(assert (=> b!814353 (= e!451332 e!451331)))

(declare-fun c!89195 () Bool)

(assert (=> b!814353 (= c!89195 e!451328)))

(declare-fun res!556069 () Bool)

(assert (=> b!814353 (=> (not res!556069) (not e!451328))))

(assert (=> b!814353 (= res!556069 (bvslt #b00000000000000000000000000000000 (size!21704 _keys!976)))))

(declare-fun b!814354 () Bool)

(assert (=> b!814354 (= e!451329 call!35538)))

(assert (= (and d!104703 c!89194) b!814343))

(assert (= (and d!104703 (not c!89194)) b!814349))

(assert (= (and b!814349 c!89192) b!814345))

(assert (= (and b!814349 (not c!89192)) b!814354))

(assert (= (or b!814345 b!814354) bm!35535))

(assert (= (and d!104703 res!556067) b!814347))

(assert (= (and b!814347 res!556066) b!814353))

(assert (= (and b!814353 res!556069) b!814344))

(assert (= (and b!814353 c!89195) b!814350))

(assert (= (and b!814353 (not c!89195)) b!814348))

(assert (= (and b!814350 res!556068) b!814352))

(assert (= (and b!814348 c!89193) b!814351))

(assert (= (and b!814348 (not c!89193)) b!814346))

(declare-fun b_lambda!10837 () Bool)

(assert (=> (not b_lambda!10837) (not b!814345)))

(declare-fun t!21363 () Bool)

(declare-fun tb!4167 () Bool)

(assert (=> (and start!70142 (= defaultEntry!796 defaultEntry!796) t!21363) tb!4167))

(declare-fun result!7857 () Bool)

(assert (=> tb!4167 (= result!7857 tp_is_empty!14119)))

(assert (=> b!814345 t!21363))

(declare-fun b_and!21193 () Bool)

(assert (= b_and!21187 (and (=> t!21363 result!7857) b_and!21193)))

(declare-fun b_lambda!10839 () Bool)

(assert (=> (not b_lambda!10839) (not b!814352)))

(assert (=> b!814352 t!21363))

(declare-fun b_and!21195 () Bool)

(assert (= b_and!21193 (and (=> t!21363 result!7857) b_and!21195)))

(declare-fun m!756763 () Bool)

(assert (=> b!814346 m!756763))

(declare-fun m!756765 () Bool)

(assert (=> bm!35535 m!756765))

(declare-fun m!756767 () Bool)

(assert (=> b!814349 m!756767))

(assert (=> b!814349 m!756767))

(declare-fun m!756769 () Bool)

(assert (=> b!814349 m!756769))

(assert (=> b!814350 m!756767))

(assert (=> b!814350 m!756767))

(declare-fun m!756771 () Bool)

(assert (=> b!814350 m!756771))

(assert (=> b!814352 m!756767))

(declare-fun m!756773 () Bool)

(assert (=> b!814352 m!756773))

(declare-fun m!756775 () Bool)

(assert (=> b!814352 m!756775))

(assert (=> b!814352 m!756773))

(assert (=> b!814352 m!756775))

(declare-fun m!756777 () Bool)

(assert (=> b!814352 m!756777))

(assert (=> b!814352 m!756767))

(declare-fun m!756779 () Bool)

(assert (=> b!814352 m!756779))

(declare-fun m!756781 () Bool)

(assert (=> d!104703 m!756781))

(assert (=> d!104703 m!756725))

(declare-fun m!756783 () Bool)

(assert (=> b!814345 m!756783))

(assert (=> b!814345 m!756767))

(declare-fun m!756785 () Bool)

(assert (=> b!814345 m!756785))

(declare-fun m!756787 () Bool)

(assert (=> b!814345 m!756787))

(assert (=> b!814345 m!756773))

(assert (=> b!814345 m!756775))

(assert (=> b!814345 m!756773))

(assert (=> b!814345 m!756775))

(assert (=> b!814345 m!756777))

(assert (=> b!814345 m!756783))

(declare-fun m!756789 () Bool)

(assert (=> b!814345 m!756789))

(assert (=> b!814351 m!756765))

(declare-fun m!756791 () Bool)

(assert (=> b!814347 m!756791))

(assert (=> b!814344 m!756767))

(assert (=> b!814344 m!756767))

(assert (=> b!814344 m!756769))

(assert (=> b!814270 d!104703))

(declare-fun b!814365 () Bool)

(declare-fun e!451342 () Bool)

(declare-fun e!451341 () Bool)

(assert (=> b!814365 (= e!451342 e!451341)))

(declare-fun lt!364665 () (_ BitVec 64))

(assert (=> b!814365 (= lt!364665 (select (arr!21284 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!364664 () Unit!27697)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!44455 (_ BitVec 64) (_ BitVec 32)) Unit!27697)

(assert (=> b!814365 (= lt!364664 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!364665 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!44455 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!814365 (arrayContainsKey!0 _keys!976 lt!364665 #b00000000000000000000000000000000)))

(declare-fun lt!364663 () Unit!27697)

(assert (=> b!814365 (= lt!364663 lt!364664)))

(declare-fun res!556075 () Bool)

(declare-datatypes ((SeekEntryResult!8670 0))(
  ( (MissingZero!8670 (index!37051 (_ BitVec 32))) (Found!8670 (index!37052 (_ BitVec 32))) (Intermediate!8670 (undefined!9482 Bool) (index!37053 (_ BitVec 32)) (x!68326 (_ BitVec 32))) (Undefined!8670) (MissingVacant!8670 (index!37054 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44455 (_ BitVec 32)) SeekEntryResult!8670)

(assert (=> b!814365 (= res!556075 (= (seekEntryOrOpen!0 (select (arr!21284 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8670 #b00000000000000000000000000000000)))))

(assert (=> b!814365 (=> (not res!556075) (not e!451341))))

(declare-fun b!814366 () Bool)

(declare-fun call!35541 () Bool)

(assert (=> b!814366 (= e!451342 call!35541)))

(declare-fun bm!35538 () Bool)

(assert (=> bm!35538 (= call!35541 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!814367 () Bool)

(assert (=> b!814367 (= e!451341 call!35541)))

(declare-fun b!814368 () Bool)

(declare-fun e!451343 () Bool)

(assert (=> b!814368 (= e!451343 e!451342)))

(declare-fun c!89198 () Bool)

(assert (=> b!814368 (= c!89198 (validKeyInArray!0 (select (arr!21284 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!104705 () Bool)

(declare-fun res!556074 () Bool)

(assert (=> d!104705 (=> res!556074 e!451343)))

(assert (=> d!104705 (= res!556074 (bvsge #b00000000000000000000000000000000 (size!21704 _keys!976)))))

(assert (=> d!104705 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!451343)))

(assert (= (and d!104705 (not res!556074)) b!814368))

(assert (= (and b!814368 c!89198) b!814365))

(assert (= (and b!814368 (not c!89198)) b!814366))

(assert (= (and b!814365 res!556075) b!814367))

(assert (= (or b!814367 b!814366) bm!35538))

(assert (=> b!814365 m!756767))

(declare-fun m!756793 () Bool)

(assert (=> b!814365 m!756793))

(declare-fun m!756795 () Bool)

(assert (=> b!814365 m!756795))

(assert (=> b!814365 m!756767))

(declare-fun m!756797 () Bool)

(assert (=> b!814365 m!756797))

(declare-fun m!756799 () Bool)

(assert (=> bm!35538 m!756799))

(assert (=> b!814368 m!756767))

(assert (=> b!814368 m!756767))

(assert (=> b!814368 m!756769))

(assert (=> b!814274 d!104705))

(declare-fun d!104707 () Bool)

(assert (=> d!104707 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!70142 d!104707))

(declare-fun d!104709 () Bool)

(assert (=> d!104709 (= (array_inv!17097 _keys!976) (bvsge (size!21704 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!70142 d!104709))

(declare-fun d!104711 () Bool)

(assert (=> d!104711 (= (array_inv!17098 _values!788) (bvsge (size!21705 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!70142 d!104711))

(declare-fun b!814379 () Bool)

(declare-fun e!451354 () Bool)

(declare-fun contains!4122 (List!15050 (_ BitVec 64)) Bool)

(assert (=> b!814379 (= e!451354 (contains!4122 Nil!15047 (select (arr!21284 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!814380 () Bool)

(declare-fun e!451352 () Bool)

(declare-fun call!35544 () Bool)

(assert (=> b!814380 (= e!451352 call!35544)))

(declare-fun b!814381 () Bool)

(declare-fun e!451353 () Bool)

(assert (=> b!814381 (= e!451353 e!451352)))

(declare-fun c!89201 () Bool)

(assert (=> b!814381 (= c!89201 (validKeyInArray!0 (select (arr!21284 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35541 () Bool)

(assert (=> bm!35541 (= call!35544 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89201 (Cons!15046 (select (arr!21284 _keys!976) #b00000000000000000000000000000000) Nil!15047) Nil!15047)))))

(declare-fun d!104713 () Bool)

(declare-fun res!556083 () Bool)

(declare-fun e!451355 () Bool)

(assert (=> d!104713 (=> res!556083 e!451355)))

(assert (=> d!104713 (= res!556083 (bvsge #b00000000000000000000000000000000 (size!21704 _keys!976)))))

(assert (=> d!104713 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15047) e!451355)))

(declare-fun b!814382 () Bool)

(assert (=> b!814382 (= e!451352 call!35544)))

(declare-fun b!814383 () Bool)

(assert (=> b!814383 (= e!451355 e!451353)))

(declare-fun res!556084 () Bool)

(assert (=> b!814383 (=> (not res!556084) (not e!451353))))

(assert (=> b!814383 (= res!556084 (not e!451354))))

(declare-fun res!556082 () Bool)

(assert (=> b!814383 (=> (not res!556082) (not e!451354))))

(assert (=> b!814383 (= res!556082 (validKeyInArray!0 (select (arr!21284 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!104713 (not res!556083)) b!814383))

(assert (= (and b!814383 res!556082) b!814379))

(assert (= (and b!814383 res!556084) b!814381))

(assert (= (and b!814381 c!89201) b!814382))

(assert (= (and b!814381 (not c!89201)) b!814380))

(assert (= (or b!814382 b!814380) bm!35541))

(assert (=> b!814379 m!756767))

(assert (=> b!814379 m!756767))

(declare-fun m!756801 () Bool)

(assert (=> b!814379 m!756801))

(assert (=> b!814381 m!756767))

(assert (=> b!814381 m!756767))

(assert (=> b!814381 m!756769))

(assert (=> bm!35541 m!756767))

(declare-fun m!756803 () Bool)

(assert (=> bm!35541 m!756803))

(assert (=> b!814383 m!756767))

(assert (=> b!814383 m!756767))

(assert (=> b!814383 m!756769))

(assert (=> b!814272 d!104713))

(declare-fun b!814390 () Bool)

(declare-fun e!451361 () Bool)

(assert (=> b!814390 (= e!451361 tp_is_empty!14119)))

(declare-fun condMapEmpty!22765 () Bool)

(declare-fun mapDefault!22765 () ValueCell!6644)

(assert (=> mapNonEmpty!22756 (= condMapEmpty!22765 (= mapRest!22756 ((as const (Array (_ BitVec 32) ValueCell!6644)) mapDefault!22765)))))

(declare-fun e!451360 () Bool)

(declare-fun mapRes!22765 () Bool)

(assert (=> mapNonEmpty!22756 (= tp!43938 (and e!451360 mapRes!22765))))

(declare-fun mapIsEmpty!22765 () Bool)

(assert (=> mapIsEmpty!22765 mapRes!22765))

(declare-fun mapNonEmpty!22765 () Bool)

(declare-fun tp!43954 () Bool)

(assert (=> mapNonEmpty!22765 (= mapRes!22765 (and tp!43954 e!451361))))

(declare-fun mapValue!22765 () ValueCell!6644)

(declare-fun mapRest!22765 () (Array (_ BitVec 32) ValueCell!6644))

(declare-fun mapKey!22765 () (_ BitVec 32))

(assert (=> mapNonEmpty!22765 (= mapRest!22756 (store mapRest!22765 mapKey!22765 mapValue!22765))))

(declare-fun b!814391 () Bool)

(assert (=> b!814391 (= e!451360 tp_is_empty!14119)))

(assert (= (and mapNonEmpty!22756 condMapEmpty!22765) mapIsEmpty!22765))

(assert (= (and mapNonEmpty!22756 (not condMapEmpty!22765)) mapNonEmpty!22765))

(assert (= (and mapNonEmpty!22765 ((_ is ValueCellFull!6644) mapValue!22765)) b!814390))

(assert (= (and mapNonEmpty!22756 ((_ is ValueCellFull!6644) mapDefault!22765)) b!814391))

(declare-fun m!756805 () Bool)

(assert (=> mapNonEmpty!22765 m!756805))

(declare-fun b_lambda!10841 () Bool)

(assert (= b_lambda!10839 (or (and start!70142 b_free!12409) b_lambda!10841)))

(declare-fun b_lambda!10843 () Bool)

(assert (= b_lambda!10837 (or (and start!70142 b_free!12409) b_lambda!10843)))

(check-sat (not b!814344) (not b!814365) (not b!814383) (not bm!35541) (not bm!35535) (not b_lambda!10843) (not b!814346) b_and!21195 (not b_lambda!10841) (not b!814350) (not b!814352) (not b!814351) (not b_next!12409) (not b!814349) tp_is_empty!14119 (not b!814381) (not mapNonEmpty!22765) (not b!814347) (not d!104703) (not b!814379) (not b!814345) (not b!814368) (not bm!35538))
(check-sat b_and!21195 (not b_next!12409))
