; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71320 () Bool)

(assert start!71320)

(declare-fun b_free!13437 () Bool)

(declare-fun b_next!13437 () Bool)

(assert (=> start!71320 (= b_free!13437 (not b_next!13437))))

(declare-fun tp!47080 () Bool)

(declare-fun b_and!22395 () Bool)

(assert (=> start!71320 (= tp!47080 b_and!22395)))

(declare-fun b!828320 () Bool)

(declare-fun e!461557 () Bool)

(declare-fun e!461554 () Bool)

(assert (=> b!828320 (= e!461557 (not e!461554))))

(declare-fun res!564444 () Bool)

(assert (=> b!828320 (=> res!564444 e!461554)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!828320 (= res!564444 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!25197 0))(
  ( (V!25198 (val!7621 Int)) )
))
(declare-datatypes ((tuple2!10104 0))(
  ( (tuple2!10105 (_1!5063 (_ BitVec 64)) (_2!5063 V!25197)) )
))
(declare-datatypes ((List!15896 0))(
  ( (Nil!15893) (Cons!15892 (h!17021 tuple2!10104) (t!22249 List!15896)) )
))
(declare-datatypes ((ListLongMap!8927 0))(
  ( (ListLongMap!8928 (toList!4479 List!15896)) )
))
(declare-fun lt!375299 () ListLongMap!8927)

(declare-fun lt!375302 () ListLongMap!8927)

(assert (=> b!828320 (= lt!375299 lt!375302)))

(declare-datatypes ((Unit!28377 0))(
  ( (Unit!28378) )
))
(declare-fun lt!375301 () Unit!28377)

(declare-fun zeroValueBefore!34 () V!25197)

(declare-datatypes ((array!46458 0))(
  ( (array!46459 (arr!22271 (Array (_ BitVec 32) (_ BitVec 64))) (size!22692 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46458)

(declare-fun zeroValueAfter!34 () V!25197)

(declare-fun minValue!754 () V!25197)

(declare-datatypes ((ValueCell!7158 0))(
  ( (ValueCellFull!7158 (v!10057 V!25197)) (EmptyCell!7158) )
))
(declare-datatypes ((array!46460 0))(
  ( (array!46461 (arr!22272 (Array (_ BitVec 32) ValueCell!7158)) (size!22693 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46460)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!569 (array!46458 array!46460 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25197 V!25197 V!25197 V!25197 (_ BitVec 32) Int) Unit!28377)

(assert (=> b!828320 (= lt!375301 (lemmaNoChangeToArrayThenSameMapNoExtras!569 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2481 (array!46458 array!46460 (_ BitVec 32) (_ BitVec 32) V!25197 V!25197 (_ BitVec 32) Int) ListLongMap!8927)

(assert (=> b!828320 (= lt!375302 (getCurrentListMapNoExtraKeys!2481 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!828320 (= lt!375299 (getCurrentListMapNoExtraKeys!2481 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!828321 () Bool)

(declare-fun res!564446 () Bool)

(assert (=> b!828321 (=> (not res!564446) (not e!461557))))

(declare-datatypes ((List!15897 0))(
  ( (Nil!15894) (Cons!15893 (h!17022 (_ BitVec 64)) (t!22250 List!15897)) )
))
(declare-fun arrayNoDuplicates!0 (array!46458 (_ BitVec 32) List!15897) Bool)

(assert (=> b!828321 (= res!564446 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15894))))

(declare-fun mapIsEmpty!24355 () Bool)

(declare-fun mapRes!24355 () Bool)

(assert (=> mapIsEmpty!24355 mapRes!24355))

(declare-fun b!828322 () Bool)

(declare-fun getCurrentListMap!2581 (array!46458 array!46460 (_ BitVec 32) (_ BitVec 32) V!25197 V!25197 (_ BitVec 32) Int) ListLongMap!8927)

(declare-fun +!1962 (ListLongMap!8927 tuple2!10104) ListLongMap!8927)

(assert (=> b!828322 (= e!461554 (= (getCurrentListMap!2581 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (+!1962 lt!375299 (tuple2!10105 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(declare-fun lt!375300 () ListLongMap!8927)

(assert (=> b!828322 (= lt!375300 (getCurrentListMap!2581 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!828323 () Bool)

(declare-fun e!461553 () Bool)

(declare-fun tp_is_empty!15147 () Bool)

(assert (=> b!828323 (= e!461553 tp_is_empty!15147)))

(declare-fun res!564445 () Bool)

(assert (=> start!71320 (=> (not res!564445) (not e!461557))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71320 (= res!564445 (validMask!0 mask!1312))))

(assert (=> start!71320 e!461557))

(assert (=> start!71320 tp_is_empty!15147))

(declare-fun array_inv!17741 (array!46458) Bool)

(assert (=> start!71320 (array_inv!17741 _keys!976)))

(assert (=> start!71320 true))

(declare-fun e!461555 () Bool)

(declare-fun array_inv!17742 (array!46460) Bool)

(assert (=> start!71320 (and (array_inv!17742 _values!788) e!461555)))

(assert (=> start!71320 tp!47080))

(declare-fun b!828324 () Bool)

(declare-fun res!564447 () Bool)

(assert (=> b!828324 (=> (not res!564447) (not e!461557))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46458 (_ BitVec 32)) Bool)

(assert (=> b!828324 (= res!564447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!828325 () Bool)

(declare-fun e!461558 () Bool)

(assert (=> b!828325 (= e!461555 (and e!461558 mapRes!24355))))

(declare-fun condMapEmpty!24355 () Bool)

(declare-fun mapDefault!24355 () ValueCell!7158)

(assert (=> b!828325 (= condMapEmpty!24355 (= (arr!22272 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7158)) mapDefault!24355)))))

(declare-fun mapNonEmpty!24355 () Bool)

(declare-fun tp!47079 () Bool)

(assert (=> mapNonEmpty!24355 (= mapRes!24355 (and tp!47079 e!461553))))

(declare-fun mapValue!24355 () ValueCell!7158)

(declare-fun mapRest!24355 () (Array (_ BitVec 32) ValueCell!7158))

(declare-fun mapKey!24355 () (_ BitVec 32))

(assert (=> mapNonEmpty!24355 (= (arr!22272 _values!788) (store mapRest!24355 mapKey!24355 mapValue!24355))))

(declare-fun b!828326 () Bool)

(assert (=> b!828326 (= e!461558 tp_is_empty!15147)))

(declare-fun b!828327 () Bool)

(declare-fun res!564448 () Bool)

(assert (=> b!828327 (=> (not res!564448) (not e!461557))))

(assert (=> b!828327 (= res!564448 (and (= (size!22693 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22692 _keys!976) (size!22693 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!71320 res!564445) b!828327))

(assert (= (and b!828327 res!564448) b!828324))

(assert (= (and b!828324 res!564447) b!828321))

(assert (= (and b!828321 res!564446) b!828320))

(assert (= (and b!828320 (not res!564444)) b!828322))

(assert (= (and b!828325 condMapEmpty!24355) mapIsEmpty!24355))

(assert (= (and b!828325 (not condMapEmpty!24355)) mapNonEmpty!24355))

(get-info :version)

(assert (= (and mapNonEmpty!24355 ((_ is ValueCellFull!7158) mapValue!24355)) b!828323))

(assert (= (and b!828325 ((_ is ValueCellFull!7158) mapDefault!24355)) b!828326))

(assert (= start!71320 b!828325))

(declare-fun m!771265 () Bool)

(assert (=> start!71320 m!771265))

(declare-fun m!771267 () Bool)

(assert (=> start!71320 m!771267))

(declare-fun m!771269 () Bool)

(assert (=> start!71320 m!771269))

(declare-fun m!771271 () Bool)

(assert (=> b!828321 m!771271))

(declare-fun m!771273 () Bool)

(assert (=> b!828324 m!771273))

(declare-fun m!771275 () Bool)

(assert (=> mapNonEmpty!24355 m!771275))

(declare-fun m!771277 () Bool)

(assert (=> b!828320 m!771277))

(declare-fun m!771279 () Bool)

(assert (=> b!828320 m!771279))

(declare-fun m!771281 () Bool)

(assert (=> b!828320 m!771281))

(declare-fun m!771283 () Bool)

(assert (=> b!828322 m!771283))

(declare-fun m!771285 () Bool)

(assert (=> b!828322 m!771285))

(declare-fun m!771287 () Bool)

(assert (=> b!828322 m!771287))

(check-sat (not mapNonEmpty!24355) (not b!828322) (not b_next!13437) (not b!828321) b_and!22395 (not start!71320) tp_is_empty!15147 (not b!828320) (not b!828324))
(check-sat b_and!22395 (not b_next!13437))
(get-model)

(declare-fun b!828394 () Bool)

(declare-fun e!461613 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!828394 (= e!461613 (validKeyInArray!0 (select (arr!22271 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!828395 () Bool)

(declare-fun e!461612 () Bool)

(declare-fun e!461614 () Bool)

(assert (=> b!828395 (= e!461612 e!461614)))

(declare-fun res!564483 () Bool)

(declare-fun call!36015 () Bool)

(assert (=> b!828395 (= res!564483 call!36015)))

(assert (=> b!828395 (=> (not res!564483) (not e!461614))))

(declare-fun bm!36006 () Bool)

(declare-fun call!36011 () ListLongMap!8927)

(assert (=> bm!36006 (= call!36011 (getCurrentListMapNoExtraKeys!2481 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!828396 () Bool)

(declare-fun e!461605 () ListLongMap!8927)

(declare-fun call!36014 () ListLongMap!8927)

(assert (=> b!828396 (= e!461605 call!36014)))

(declare-fun b!828397 () Bool)

(declare-fun res!564489 () Bool)

(declare-fun e!461610 () Bool)

(assert (=> b!828397 (=> (not res!564489) (not e!461610))))

(assert (=> b!828397 (= res!564489 e!461612)))

(declare-fun c!89603 () Bool)

(assert (=> b!828397 (= c!89603 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!828398 () Bool)

(declare-fun e!461615 () Bool)

(assert (=> b!828398 (= e!461615 (validKeyInArray!0 (select (arr!22271 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!828399 () Bool)

(declare-fun lt!375377 () ListLongMap!8927)

(declare-fun apply!366 (ListLongMap!8927 (_ BitVec 64)) V!25197)

(assert (=> b!828399 (= e!461614 (= (apply!366 lt!375377 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun b!828400 () Bool)

(declare-fun call!36009 () ListLongMap!8927)

(assert (=> b!828400 (= e!461605 call!36009)))

(declare-fun b!828401 () Bool)

(declare-fun e!461603 () ListLongMap!8927)

(declare-fun e!461611 () ListLongMap!8927)

(assert (=> b!828401 (= e!461603 e!461611)))

(declare-fun c!89608 () Bool)

(assert (=> b!828401 (= c!89608 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!828402 () Bool)

(assert (=> b!828402 (= e!461611 call!36014)))

(declare-fun call!36013 () ListLongMap!8927)

(declare-fun c!89606 () Bool)

(declare-fun call!36012 () ListLongMap!8927)

(declare-fun bm!36007 () Bool)

(assert (=> bm!36007 (= call!36013 (+!1962 (ite c!89606 call!36011 (ite c!89608 call!36012 call!36009)) (ite (or c!89606 c!89608) (tuple2!10105 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10105 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun d!105171 () Bool)

(assert (=> d!105171 e!461610))

(declare-fun res!564485 () Bool)

(assert (=> d!105171 (=> (not res!564485) (not e!461610))))

(assert (=> d!105171 (= res!564485 (or (bvsge #b00000000000000000000000000000000 (size!22692 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22692 _keys!976)))))))

(declare-fun lt!375361 () ListLongMap!8927)

(assert (=> d!105171 (= lt!375377 lt!375361)))

(declare-fun lt!375375 () Unit!28377)

(declare-fun e!461604 () Unit!28377)

(assert (=> d!105171 (= lt!375375 e!461604)))

(declare-fun c!89604 () Bool)

(assert (=> d!105171 (= c!89604 e!461613)))

(declare-fun res!564487 () Bool)

(assert (=> d!105171 (=> (not res!564487) (not e!461613))))

(assert (=> d!105171 (= res!564487 (bvslt #b00000000000000000000000000000000 (size!22692 _keys!976)))))

(assert (=> d!105171 (= lt!375361 e!461603)))

(assert (=> d!105171 (= c!89606 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105171 (validMask!0 mask!1312)))

(assert (=> d!105171 (= (getCurrentListMap!2581 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375377)))

(declare-fun bm!36008 () Bool)

(declare-fun contains!4190 (ListLongMap!8927 (_ BitVec 64)) Bool)

(assert (=> bm!36008 (= call!36015 (contains!4190 lt!375377 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!828403 () Bool)

(declare-fun res!564484 () Bool)

(assert (=> b!828403 (=> (not res!564484) (not e!461610))))

(declare-fun e!461607 () Bool)

(assert (=> b!828403 (= res!564484 e!461607)))

(declare-fun res!564486 () Bool)

(assert (=> b!828403 (=> res!564486 e!461607)))

(assert (=> b!828403 (= res!564486 (not e!461615))))

(declare-fun res!564482 () Bool)

(assert (=> b!828403 (=> (not res!564482) (not e!461615))))

(assert (=> b!828403 (= res!564482 (bvslt #b00000000000000000000000000000000 (size!22692 _keys!976)))))

(declare-fun b!828404 () Bool)

(declare-fun e!461608 () Bool)

(assert (=> b!828404 (= e!461610 e!461608)))

(declare-fun c!89607 () Bool)

(assert (=> b!828404 (= c!89607 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!828405 () Bool)

(declare-fun lt!375369 () Unit!28377)

(assert (=> b!828405 (= e!461604 lt!375369)))

(declare-fun lt!375376 () ListLongMap!8927)

(assert (=> b!828405 (= lt!375376 (getCurrentListMapNoExtraKeys!2481 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375362 () (_ BitVec 64))

(assert (=> b!828405 (= lt!375362 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375360 () (_ BitVec 64))

(assert (=> b!828405 (= lt!375360 (select (arr!22271 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375366 () Unit!28377)

(declare-fun addStillContains!317 (ListLongMap!8927 (_ BitVec 64) V!25197 (_ BitVec 64)) Unit!28377)

(assert (=> b!828405 (= lt!375366 (addStillContains!317 lt!375376 lt!375362 zeroValueBefore!34 lt!375360))))

(assert (=> b!828405 (contains!4190 (+!1962 lt!375376 (tuple2!10105 lt!375362 zeroValueBefore!34)) lt!375360)))

(declare-fun lt!375378 () Unit!28377)

(assert (=> b!828405 (= lt!375378 lt!375366)))

(declare-fun lt!375372 () ListLongMap!8927)

(assert (=> b!828405 (= lt!375372 (getCurrentListMapNoExtraKeys!2481 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375364 () (_ BitVec 64))

(assert (=> b!828405 (= lt!375364 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375370 () (_ BitVec 64))

(assert (=> b!828405 (= lt!375370 (select (arr!22271 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375363 () Unit!28377)

(declare-fun addApplyDifferent!317 (ListLongMap!8927 (_ BitVec 64) V!25197 (_ BitVec 64)) Unit!28377)

(assert (=> b!828405 (= lt!375363 (addApplyDifferent!317 lt!375372 lt!375364 minValue!754 lt!375370))))

(assert (=> b!828405 (= (apply!366 (+!1962 lt!375372 (tuple2!10105 lt!375364 minValue!754)) lt!375370) (apply!366 lt!375372 lt!375370))))

(declare-fun lt!375365 () Unit!28377)

(assert (=> b!828405 (= lt!375365 lt!375363)))

(declare-fun lt!375374 () ListLongMap!8927)

(assert (=> b!828405 (= lt!375374 (getCurrentListMapNoExtraKeys!2481 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375367 () (_ BitVec 64))

(assert (=> b!828405 (= lt!375367 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375371 () (_ BitVec 64))

(assert (=> b!828405 (= lt!375371 (select (arr!22271 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375368 () Unit!28377)

(assert (=> b!828405 (= lt!375368 (addApplyDifferent!317 lt!375374 lt!375367 zeroValueBefore!34 lt!375371))))

(assert (=> b!828405 (= (apply!366 (+!1962 lt!375374 (tuple2!10105 lt!375367 zeroValueBefore!34)) lt!375371) (apply!366 lt!375374 lt!375371))))

(declare-fun lt!375380 () Unit!28377)

(assert (=> b!828405 (= lt!375380 lt!375368)))

(declare-fun lt!375359 () ListLongMap!8927)

(assert (=> b!828405 (= lt!375359 (getCurrentListMapNoExtraKeys!2481 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375379 () (_ BitVec 64))

(assert (=> b!828405 (= lt!375379 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375373 () (_ BitVec 64))

(assert (=> b!828405 (= lt!375373 (select (arr!22271 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!828405 (= lt!375369 (addApplyDifferent!317 lt!375359 lt!375379 minValue!754 lt!375373))))

(assert (=> b!828405 (= (apply!366 (+!1962 lt!375359 (tuple2!10105 lt!375379 minValue!754)) lt!375373) (apply!366 lt!375359 lt!375373))))

(declare-fun e!461609 () Bool)

(declare-fun b!828406 () Bool)

(declare-fun get!11791 (ValueCell!7158 V!25197) V!25197)

(declare-fun dynLambda!977 (Int (_ BitVec 64)) V!25197)

(assert (=> b!828406 (= e!461609 (= (apply!366 lt!375377 (select (arr!22271 _keys!976) #b00000000000000000000000000000000)) (get!11791 (select (arr!22272 _values!788) #b00000000000000000000000000000000) (dynLambda!977 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!828406 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22693 _values!788)))))

(assert (=> b!828406 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22692 _keys!976)))))

(declare-fun bm!36009 () Bool)

(assert (=> bm!36009 (= call!36012 call!36011)))

(declare-fun b!828407 () Bool)

(declare-fun call!36010 () Bool)

(assert (=> b!828407 (= e!461608 (not call!36010))))

(declare-fun b!828408 () Bool)

(assert (=> b!828408 (= e!461607 e!461609)))

(declare-fun res!564490 () Bool)

(assert (=> b!828408 (=> (not res!564490) (not e!461609))))

(assert (=> b!828408 (= res!564490 (contains!4190 lt!375377 (select (arr!22271 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!828408 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22692 _keys!976)))))

(declare-fun b!828409 () Bool)

(declare-fun e!461606 () Bool)

(assert (=> b!828409 (= e!461606 (= (apply!366 lt!375377 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun bm!36010 () Bool)

(assert (=> bm!36010 (= call!36010 (contains!4190 lt!375377 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!828410 () Bool)

(assert (=> b!828410 (= e!461608 e!461606)))

(declare-fun res!564488 () Bool)

(assert (=> b!828410 (= res!564488 call!36010)))

(assert (=> b!828410 (=> (not res!564488) (not e!461606))))

(declare-fun bm!36011 () Bool)

(assert (=> bm!36011 (= call!36009 call!36012)))

(declare-fun bm!36012 () Bool)

(assert (=> bm!36012 (= call!36014 call!36013)))

(declare-fun b!828411 () Bool)

(declare-fun Unit!28381 () Unit!28377)

(assert (=> b!828411 (= e!461604 Unit!28381)))

(declare-fun b!828412 () Bool)

(declare-fun c!89605 () Bool)

(assert (=> b!828412 (= c!89605 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!828412 (= e!461611 e!461605)))

(declare-fun b!828413 () Bool)

(assert (=> b!828413 (= e!461603 (+!1962 call!36013 (tuple2!10105 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!828414 () Bool)

(assert (=> b!828414 (= e!461612 (not call!36015))))

(assert (= (and d!105171 c!89606) b!828413))

(assert (= (and d!105171 (not c!89606)) b!828401))

(assert (= (and b!828401 c!89608) b!828402))

(assert (= (and b!828401 (not c!89608)) b!828412))

(assert (= (and b!828412 c!89605) b!828396))

(assert (= (and b!828412 (not c!89605)) b!828400))

(assert (= (or b!828396 b!828400) bm!36011))

(assert (= (or b!828402 bm!36011) bm!36009))

(assert (= (or b!828402 b!828396) bm!36012))

(assert (= (or b!828413 bm!36009) bm!36006))

(assert (= (or b!828413 bm!36012) bm!36007))

(assert (= (and d!105171 res!564487) b!828394))

(assert (= (and d!105171 c!89604) b!828405))

(assert (= (and d!105171 (not c!89604)) b!828411))

(assert (= (and d!105171 res!564485) b!828403))

(assert (= (and b!828403 res!564482) b!828398))

(assert (= (and b!828403 (not res!564486)) b!828408))

(assert (= (and b!828408 res!564490) b!828406))

(assert (= (and b!828403 res!564484) b!828397))

(assert (= (and b!828397 c!89603) b!828395))

(assert (= (and b!828397 (not c!89603)) b!828414))

(assert (= (and b!828395 res!564483) b!828399))

(assert (= (or b!828395 b!828414) bm!36008))

(assert (= (and b!828397 res!564489) b!828404))

(assert (= (and b!828404 c!89607) b!828410))

(assert (= (and b!828404 (not c!89607)) b!828407))

(assert (= (and b!828410 res!564488) b!828409))

(assert (= (or b!828410 b!828407) bm!36010))

(declare-fun b_lambda!11203 () Bool)

(assert (=> (not b_lambda!11203) (not b!828406)))

(declare-fun t!22254 () Bool)

(declare-fun tb!4213 () Bool)

(assert (=> (and start!71320 (= defaultEntry!796 defaultEntry!796) t!22254) tb!4213))

(declare-fun result!7979 () Bool)

(assert (=> tb!4213 (= result!7979 tp_is_empty!15147)))

(assert (=> b!828406 t!22254))

(declare-fun b_and!22399 () Bool)

(assert (= b_and!22395 (and (=> t!22254 result!7979) b_and!22399)))

(declare-fun m!771313 () Bool)

(assert (=> b!828406 m!771313))

(declare-fun m!771315 () Bool)

(assert (=> b!828406 m!771315))

(declare-fun m!771317 () Bool)

(assert (=> b!828406 m!771317))

(assert (=> b!828406 m!771313))

(declare-fun m!771319 () Bool)

(assert (=> b!828406 m!771319))

(assert (=> b!828406 m!771317))

(assert (=> b!828406 m!771315))

(declare-fun m!771321 () Bool)

(assert (=> b!828406 m!771321))

(declare-fun m!771323 () Bool)

(assert (=> bm!36008 m!771323))

(declare-fun m!771325 () Bool)

(assert (=> b!828413 m!771325))

(assert (=> d!105171 m!771265))

(assert (=> b!828408 m!771315))

(assert (=> b!828408 m!771315))

(declare-fun m!771327 () Bool)

(assert (=> b!828408 m!771327))

(declare-fun m!771329 () Bool)

(assert (=> b!828399 m!771329))

(declare-fun m!771331 () Bool)

(assert (=> bm!36010 m!771331))

(declare-fun m!771333 () Bool)

(assert (=> bm!36007 m!771333))

(assert (=> bm!36006 m!771281))

(declare-fun m!771335 () Bool)

(assert (=> b!828409 m!771335))

(declare-fun m!771337 () Bool)

(assert (=> b!828405 m!771337))

(assert (=> b!828405 m!771281))

(declare-fun m!771339 () Bool)

(assert (=> b!828405 m!771339))

(declare-fun m!771341 () Bool)

(assert (=> b!828405 m!771341))

(declare-fun m!771343 () Bool)

(assert (=> b!828405 m!771343))

(declare-fun m!771345 () Bool)

(assert (=> b!828405 m!771345))

(declare-fun m!771347 () Bool)

(assert (=> b!828405 m!771347))

(assert (=> b!828405 m!771315))

(declare-fun m!771349 () Bool)

(assert (=> b!828405 m!771349))

(declare-fun m!771351 () Bool)

(assert (=> b!828405 m!771351))

(assert (=> b!828405 m!771343))

(declare-fun m!771353 () Bool)

(assert (=> b!828405 m!771353))

(declare-fun m!771355 () Bool)

(assert (=> b!828405 m!771355))

(declare-fun m!771357 () Bool)

(assert (=> b!828405 m!771357))

(assert (=> b!828405 m!771345))

(declare-fun m!771359 () Bool)

(assert (=> b!828405 m!771359))

(assert (=> b!828405 m!771359))

(declare-fun m!771361 () Bool)

(assert (=> b!828405 m!771361))

(declare-fun m!771363 () Bool)

(assert (=> b!828405 m!771363))

(declare-fun m!771365 () Bool)

(assert (=> b!828405 m!771365))

(assert (=> b!828405 m!771355))

(assert (=> b!828394 m!771315))

(assert (=> b!828394 m!771315))

(declare-fun m!771367 () Bool)

(assert (=> b!828394 m!771367))

(assert (=> b!828398 m!771315))

(assert (=> b!828398 m!771315))

(assert (=> b!828398 m!771367))

(assert (=> b!828322 d!105171))

(declare-fun d!105173 () Bool)

(declare-fun e!461618 () Bool)

(assert (=> d!105173 e!461618))

(declare-fun res!564495 () Bool)

(assert (=> d!105173 (=> (not res!564495) (not e!461618))))

(declare-fun lt!375392 () ListLongMap!8927)

(assert (=> d!105173 (= res!564495 (contains!4190 lt!375392 (_1!5063 (tuple2!10105 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(declare-fun lt!375390 () List!15896)

(assert (=> d!105173 (= lt!375392 (ListLongMap!8928 lt!375390))))

(declare-fun lt!375391 () Unit!28377)

(declare-fun lt!375389 () Unit!28377)

(assert (=> d!105173 (= lt!375391 lt!375389)))

(declare-datatypes ((Option!415 0))(
  ( (Some!414 (v!10059 V!25197)) (None!413) )
))
(declare-fun getValueByKey!409 (List!15896 (_ BitVec 64)) Option!415)

(assert (=> d!105173 (= (getValueByKey!409 lt!375390 (_1!5063 (tuple2!10105 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))) (Some!414 (_2!5063 (tuple2!10105 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(declare-fun lemmaContainsTupThenGetReturnValue!223 (List!15896 (_ BitVec 64) V!25197) Unit!28377)

(assert (=> d!105173 (= lt!375389 (lemmaContainsTupThenGetReturnValue!223 lt!375390 (_1!5063 (tuple2!10105 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (_2!5063 (tuple2!10105 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(declare-fun insertStrictlySorted!262 (List!15896 (_ BitVec 64) V!25197) List!15896)

(assert (=> d!105173 (= lt!375390 (insertStrictlySorted!262 (toList!4479 lt!375299) (_1!5063 (tuple2!10105 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (_2!5063 (tuple2!10105 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(assert (=> d!105173 (= (+!1962 lt!375299 (tuple2!10105 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) lt!375392)))

(declare-fun b!828421 () Bool)

(declare-fun res!564496 () Bool)

(assert (=> b!828421 (=> (not res!564496) (not e!461618))))

(assert (=> b!828421 (= res!564496 (= (getValueByKey!409 (toList!4479 lt!375392) (_1!5063 (tuple2!10105 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))) (Some!414 (_2!5063 (tuple2!10105 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)))))))

(declare-fun b!828422 () Bool)

(declare-fun contains!4191 (List!15896 tuple2!10104) Bool)

(assert (=> b!828422 (= e!461618 (contains!4191 (toList!4479 lt!375392) (tuple2!10105 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)))))

(assert (= (and d!105173 res!564495) b!828421))

(assert (= (and b!828421 res!564496) b!828422))

(declare-fun m!771369 () Bool)

(assert (=> d!105173 m!771369))

(declare-fun m!771371 () Bool)

(assert (=> d!105173 m!771371))

(declare-fun m!771373 () Bool)

(assert (=> d!105173 m!771373))

(declare-fun m!771375 () Bool)

(assert (=> d!105173 m!771375))

(declare-fun m!771377 () Bool)

(assert (=> b!828421 m!771377))

(declare-fun m!771379 () Bool)

(assert (=> b!828422 m!771379))

(assert (=> b!828322 d!105173))

(declare-fun b!828423 () Bool)

(declare-fun e!461629 () Bool)

(assert (=> b!828423 (= e!461629 (validKeyInArray!0 (select (arr!22271 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!828424 () Bool)

(declare-fun e!461628 () Bool)

(declare-fun e!461630 () Bool)

(assert (=> b!828424 (= e!461628 e!461630)))

(declare-fun res!564498 () Bool)

(declare-fun call!36022 () Bool)

(assert (=> b!828424 (= res!564498 call!36022)))

(assert (=> b!828424 (=> (not res!564498) (not e!461630))))

(declare-fun call!36018 () ListLongMap!8927)

(declare-fun bm!36013 () Bool)

(assert (=> bm!36013 (= call!36018 (getCurrentListMapNoExtraKeys!2481 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!828425 () Bool)

(declare-fun e!461621 () ListLongMap!8927)

(declare-fun call!36021 () ListLongMap!8927)

(assert (=> b!828425 (= e!461621 call!36021)))

(declare-fun b!828426 () Bool)

(declare-fun res!564504 () Bool)

(declare-fun e!461626 () Bool)

(assert (=> b!828426 (=> (not res!564504) (not e!461626))))

(assert (=> b!828426 (= res!564504 e!461628)))

(declare-fun c!89609 () Bool)

(assert (=> b!828426 (= c!89609 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!828427 () Bool)

(declare-fun e!461631 () Bool)

(assert (=> b!828427 (= e!461631 (validKeyInArray!0 (select (arr!22271 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!828428 () Bool)

(declare-fun lt!375411 () ListLongMap!8927)

(assert (=> b!828428 (= e!461630 (= (apply!366 lt!375411 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun b!828429 () Bool)

(declare-fun call!36016 () ListLongMap!8927)

(assert (=> b!828429 (= e!461621 call!36016)))

(declare-fun b!828430 () Bool)

(declare-fun e!461619 () ListLongMap!8927)

(declare-fun e!461627 () ListLongMap!8927)

(assert (=> b!828430 (= e!461619 e!461627)))

(declare-fun c!89614 () Bool)

(assert (=> b!828430 (= c!89614 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!828431 () Bool)

(assert (=> b!828431 (= e!461627 call!36021)))

(declare-fun call!36019 () ListLongMap!8927)

(declare-fun bm!36014 () Bool)

(declare-fun call!36020 () ListLongMap!8927)

(declare-fun c!89612 () Bool)

(assert (=> bm!36014 (= call!36020 (+!1962 (ite c!89612 call!36018 (ite c!89614 call!36019 call!36016)) (ite (or c!89612 c!89614) (tuple2!10105 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10105 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun d!105175 () Bool)

(assert (=> d!105175 e!461626))

(declare-fun res!564500 () Bool)

(assert (=> d!105175 (=> (not res!564500) (not e!461626))))

(assert (=> d!105175 (= res!564500 (or (bvsge #b00000000000000000000000000000000 (size!22692 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22692 _keys!976)))))))

(declare-fun lt!375395 () ListLongMap!8927)

(assert (=> d!105175 (= lt!375411 lt!375395)))

(declare-fun lt!375409 () Unit!28377)

(declare-fun e!461620 () Unit!28377)

(assert (=> d!105175 (= lt!375409 e!461620)))

(declare-fun c!89610 () Bool)

(assert (=> d!105175 (= c!89610 e!461629)))

(declare-fun res!564502 () Bool)

(assert (=> d!105175 (=> (not res!564502) (not e!461629))))

(assert (=> d!105175 (= res!564502 (bvslt #b00000000000000000000000000000000 (size!22692 _keys!976)))))

(assert (=> d!105175 (= lt!375395 e!461619)))

(assert (=> d!105175 (= c!89612 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105175 (validMask!0 mask!1312)))

(assert (=> d!105175 (= (getCurrentListMap!2581 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375411)))

(declare-fun bm!36015 () Bool)

(assert (=> bm!36015 (= call!36022 (contains!4190 lt!375411 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!828432 () Bool)

(declare-fun res!564499 () Bool)

(assert (=> b!828432 (=> (not res!564499) (not e!461626))))

(declare-fun e!461623 () Bool)

(assert (=> b!828432 (= res!564499 e!461623)))

(declare-fun res!564501 () Bool)

(assert (=> b!828432 (=> res!564501 e!461623)))

(assert (=> b!828432 (= res!564501 (not e!461631))))

(declare-fun res!564497 () Bool)

(assert (=> b!828432 (=> (not res!564497) (not e!461631))))

(assert (=> b!828432 (= res!564497 (bvslt #b00000000000000000000000000000000 (size!22692 _keys!976)))))

(declare-fun b!828433 () Bool)

(declare-fun e!461624 () Bool)

(assert (=> b!828433 (= e!461626 e!461624)))

(declare-fun c!89613 () Bool)

(assert (=> b!828433 (= c!89613 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!828434 () Bool)

(declare-fun lt!375403 () Unit!28377)

(assert (=> b!828434 (= e!461620 lt!375403)))

(declare-fun lt!375410 () ListLongMap!8927)

(assert (=> b!828434 (= lt!375410 (getCurrentListMapNoExtraKeys!2481 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375396 () (_ BitVec 64))

(assert (=> b!828434 (= lt!375396 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375394 () (_ BitVec 64))

(assert (=> b!828434 (= lt!375394 (select (arr!22271 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375400 () Unit!28377)

(assert (=> b!828434 (= lt!375400 (addStillContains!317 lt!375410 lt!375396 zeroValueAfter!34 lt!375394))))

(assert (=> b!828434 (contains!4190 (+!1962 lt!375410 (tuple2!10105 lt!375396 zeroValueAfter!34)) lt!375394)))

(declare-fun lt!375412 () Unit!28377)

(assert (=> b!828434 (= lt!375412 lt!375400)))

(declare-fun lt!375406 () ListLongMap!8927)

(assert (=> b!828434 (= lt!375406 (getCurrentListMapNoExtraKeys!2481 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375398 () (_ BitVec 64))

(assert (=> b!828434 (= lt!375398 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375404 () (_ BitVec 64))

(assert (=> b!828434 (= lt!375404 (select (arr!22271 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375397 () Unit!28377)

(assert (=> b!828434 (= lt!375397 (addApplyDifferent!317 lt!375406 lt!375398 minValue!754 lt!375404))))

(assert (=> b!828434 (= (apply!366 (+!1962 lt!375406 (tuple2!10105 lt!375398 minValue!754)) lt!375404) (apply!366 lt!375406 lt!375404))))

(declare-fun lt!375399 () Unit!28377)

(assert (=> b!828434 (= lt!375399 lt!375397)))

(declare-fun lt!375408 () ListLongMap!8927)

(assert (=> b!828434 (= lt!375408 (getCurrentListMapNoExtraKeys!2481 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375401 () (_ BitVec 64))

(assert (=> b!828434 (= lt!375401 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375405 () (_ BitVec 64))

(assert (=> b!828434 (= lt!375405 (select (arr!22271 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375402 () Unit!28377)

(assert (=> b!828434 (= lt!375402 (addApplyDifferent!317 lt!375408 lt!375401 zeroValueAfter!34 lt!375405))))

(assert (=> b!828434 (= (apply!366 (+!1962 lt!375408 (tuple2!10105 lt!375401 zeroValueAfter!34)) lt!375405) (apply!366 lt!375408 lt!375405))))

(declare-fun lt!375414 () Unit!28377)

(assert (=> b!828434 (= lt!375414 lt!375402)))

(declare-fun lt!375393 () ListLongMap!8927)

(assert (=> b!828434 (= lt!375393 (getCurrentListMapNoExtraKeys!2481 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375413 () (_ BitVec 64))

(assert (=> b!828434 (= lt!375413 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375407 () (_ BitVec 64))

(assert (=> b!828434 (= lt!375407 (select (arr!22271 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!828434 (= lt!375403 (addApplyDifferent!317 lt!375393 lt!375413 minValue!754 lt!375407))))

(assert (=> b!828434 (= (apply!366 (+!1962 lt!375393 (tuple2!10105 lt!375413 minValue!754)) lt!375407) (apply!366 lt!375393 lt!375407))))

(declare-fun e!461625 () Bool)

(declare-fun b!828435 () Bool)

(assert (=> b!828435 (= e!461625 (= (apply!366 lt!375411 (select (arr!22271 _keys!976) #b00000000000000000000000000000000)) (get!11791 (select (arr!22272 _values!788) #b00000000000000000000000000000000) (dynLambda!977 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!828435 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22693 _values!788)))))

(assert (=> b!828435 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22692 _keys!976)))))

(declare-fun bm!36016 () Bool)

(assert (=> bm!36016 (= call!36019 call!36018)))

(declare-fun b!828436 () Bool)

(declare-fun call!36017 () Bool)

(assert (=> b!828436 (= e!461624 (not call!36017))))

(declare-fun b!828437 () Bool)

(assert (=> b!828437 (= e!461623 e!461625)))

(declare-fun res!564505 () Bool)

(assert (=> b!828437 (=> (not res!564505) (not e!461625))))

(assert (=> b!828437 (= res!564505 (contains!4190 lt!375411 (select (arr!22271 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!828437 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22692 _keys!976)))))

(declare-fun b!828438 () Bool)

(declare-fun e!461622 () Bool)

(assert (=> b!828438 (= e!461622 (= (apply!366 lt!375411 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun bm!36017 () Bool)

(assert (=> bm!36017 (= call!36017 (contains!4190 lt!375411 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!828439 () Bool)

(assert (=> b!828439 (= e!461624 e!461622)))

(declare-fun res!564503 () Bool)

(assert (=> b!828439 (= res!564503 call!36017)))

(assert (=> b!828439 (=> (not res!564503) (not e!461622))))

(declare-fun bm!36018 () Bool)

(assert (=> bm!36018 (= call!36016 call!36019)))

(declare-fun bm!36019 () Bool)

(assert (=> bm!36019 (= call!36021 call!36020)))

(declare-fun b!828440 () Bool)

(declare-fun Unit!28382 () Unit!28377)

(assert (=> b!828440 (= e!461620 Unit!28382)))

(declare-fun b!828441 () Bool)

(declare-fun c!89611 () Bool)

(assert (=> b!828441 (= c!89611 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!828441 (= e!461627 e!461621)))

(declare-fun b!828442 () Bool)

(assert (=> b!828442 (= e!461619 (+!1962 call!36020 (tuple2!10105 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!828443 () Bool)

(assert (=> b!828443 (= e!461628 (not call!36022))))

(assert (= (and d!105175 c!89612) b!828442))

(assert (= (and d!105175 (not c!89612)) b!828430))

(assert (= (and b!828430 c!89614) b!828431))

(assert (= (and b!828430 (not c!89614)) b!828441))

(assert (= (and b!828441 c!89611) b!828425))

(assert (= (and b!828441 (not c!89611)) b!828429))

(assert (= (or b!828425 b!828429) bm!36018))

(assert (= (or b!828431 bm!36018) bm!36016))

(assert (= (or b!828431 b!828425) bm!36019))

(assert (= (or b!828442 bm!36016) bm!36013))

(assert (= (or b!828442 bm!36019) bm!36014))

(assert (= (and d!105175 res!564502) b!828423))

(assert (= (and d!105175 c!89610) b!828434))

(assert (= (and d!105175 (not c!89610)) b!828440))

(assert (= (and d!105175 res!564500) b!828432))

(assert (= (and b!828432 res!564497) b!828427))

(assert (= (and b!828432 (not res!564501)) b!828437))

(assert (= (and b!828437 res!564505) b!828435))

(assert (= (and b!828432 res!564499) b!828426))

(assert (= (and b!828426 c!89609) b!828424))

(assert (= (and b!828426 (not c!89609)) b!828443))

(assert (= (and b!828424 res!564498) b!828428))

(assert (= (or b!828424 b!828443) bm!36015))

(assert (= (and b!828426 res!564504) b!828433))

(assert (= (and b!828433 c!89613) b!828439))

(assert (= (and b!828433 (not c!89613)) b!828436))

(assert (= (and b!828439 res!564503) b!828438))

(assert (= (or b!828439 b!828436) bm!36017))

(declare-fun b_lambda!11205 () Bool)

(assert (=> (not b_lambda!11205) (not b!828435)))

(assert (=> b!828435 t!22254))

(declare-fun b_and!22401 () Bool)

(assert (= b_and!22399 (and (=> t!22254 result!7979) b_and!22401)))

(assert (=> b!828435 m!771313))

(assert (=> b!828435 m!771315))

(assert (=> b!828435 m!771317))

(assert (=> b!828435 m!771313))

(assert (=> b!828435 m!771319))

(assert (=> b!828435 m!771317))

(assert (=> b!828435 m!771315))

(declare-fun m!771381 () Bool)

(assert (=> b!828435 m!771381))

(declare-fun m!771383 () Bool)

(assert (=> bm!36015 m!771383))

(declare-fun m!771385 () Bool)

(assert (=> b!828442 m!771385))

(assert (=> d!105175 m!771265))

(assert (=> b!828437 m!771315))

(assert (=> b!828437 m!771315))

(declare-fun m!771387 () Bool)

(assert (=> b!828437 m!771387))

(declare-fun m!771389 () Bool)

(assert (=> b!828428 m!771389))

(declare-fun m!771391 () Bool)

(assert (=> bm!36017 m!771391))

(declare-fun m!771393 () Bool)

(assert (=> bm!36014 m!771393))

(assert (=> bm!36013 m!771279))

(declare-fun m!771395 () Bool)

(assert (=> b!828438 m!771395))

(declare-fun m!771397 () Bool)

(assert (=> b!828434 m!771397))

(assert (=> b!828434 m!771279))

(declare-fun m!771399 () Bool)

(assert (=> b!828434 m!771399))

(declare-fun m!771401 () Bool)

(assert (=> b!828434 m!771401))

(declare-fun m!771403 () Bool)

(assert (=> b!828434 m!771403))

(declare-fun m!771405 () Bool)

(assert (=> b!828434 m!771405))

(declare-fun m!771407 () Bool)

(assert (=> b!828434 m!771407))

(assert (=> b!828434 m!771315))

(declare-fun m!771409 () Bool)

(assert (=> b!828434 m!771409))

(declare-fun m!771411 () Bool)

(assert (=> b!828434 m!771411))

(assert (=> b!828434 m!771403))

(declare-fun m!771413 () Bool)

(assert (=> b!828434 m!771413))

(declare-fun m!771415 () Bool)

(assert (=> b!828434 m!771415))

(declare-fun m!771417 () Bool)

(assert (=> b!828434 m!771417))

(assert (=> b!828434 m!771405))

(declare-fun m!771419 () Bool)

(assert (=> b!828434 m!771419))

(assert (=> b!828434 m!771419))

(declare-fun m!771421 () Bool)

(assert (=> b!828434 m!771421))

(declare-fun m!771423 () Bool)

(assert (=> b!828434 m!771423))

(declare-fun m!771425 () Bool)

(assert (=> b!828434 m!771425))

(assert (=> b!828434 m!771415))

(assert (=> b!828423 m!771315))

(assert (=> b!828423 m!771315))

(assert (=> b!828423 m!771367))

(assert (=> b!828427 m!771315))

(assert (=> b!828427 m!771315))

(assert (=> b!828427 m!771367))

(assert (=> b!828322 d!105175))

(declare-fun d!105177 () Bool)

(declare-fun res!564514 () Bool)

(declare-fun e!461643 () Bool)

(assert (=> d!105177 (=> res!564514 e!461643)))

(assert (=> d!105177 (= res!564514 (bvsge #b00000000000000000000000000000000 (size!22692 _keys!976)))))

(assert (=> d!105177 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15894) e!461643)))

(declare-fun b!828454 () Bool)

(declare-fun e!461641 () Bool)

(declare-fun call!36025 () Bool)

(assert (=> b!828454 (= e!461641 call!36025)))

(declare-fun bm!36022 () Bool)

(declare-fun c!89617 () Bool)

(assert (=> bm!36022 (= call!36025 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89617 (Cons!15893 (select (arr!22271 _keys!976) #b00000000000000000000000000000000) Nil!15894) Nil!15894)))))

(declare-fun b!828455 () Bool)

(declare-fun e!461640 () Bool)

(declare-fun contains!4192 (List!15897 (_ BitVec 64)) Bool)

(assert (=> b!828455 (= e!461640 (contains!4192 Nil!15894 (select (arr!22271 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!828456 () Bool)

(declare-fun e!461642 () Bool)

(assert (=> b!828456 (= e!461643 e!461642)))

(declare-fun res!564512 () Bool)

(assert (=> b!828456 (=> (not res!564512) (not e!461642))))

(assert (=> b!828456 (= res!564512 (not e!461640))))

(declare-fun res!564513 () Bool)

(assert (=> b!828456 (=> (not res!564513) (not e!461640))))

(assert (=> b!828456 (= res!564513 (validKeyInArray!0 (select (arr!22271 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!828457 () Bool)

(assert (=> b!828457 (= e!461641 call!36025)))

(declare-fun b!828458 () Bool)

(assert (=> b!828458 (= e!461642 e!461641)))

(assert (=> b!828458 (= c!89617 (validKeyInArray!0 (select (arr!22271 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!105177 (not res!564514)) b!828456))

(assert (= (and b!828456 res!564513) b!828455))

(assert (= (and b!828456 res!564512) b!828458))

(assert (= (and b!828458 c!89617) b!828457))

(assert (= (and b!828458 (not c!89617)) b!828454))

(assert (= (or b!828457 b!828454) bm!36022))

(assert (=> bm!36022 m!771315))

(declare-fun m!771427 () Bool)

(assert (=> bm!36022 m!771427))

(assert (=> b!828455 m!771315))

(assert (=> b!828455 m!771315))

(declare-fun m!771429 () Bool)

(assert (=> b!828455 m!771429))

(assert (=> b!828456 m!771315))

(assert (=> b!828456 m!771315))

(assert (=> b!828456 m!771367))

(assert (=> b!828458 m!771315))

(assert (=> b!828458 m!771315))

(assert (=> b!828458 m!771367))

(assert (=> b!828321 d!105177))

(declare-fun d!105179 () Bool)

(assert (=> d!105179 (= (getCurrentListMapNoExtraKeys!2481 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2481 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375417 () Unit!28377)

(declare-fun choose!1410 (array!46458 array!46460 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25197 V!25197 V!25197 V!25197 (_ BitVec 32) Int) Unit!28377)

(assert (=> d!105179 (= lt!375417 (choose!1410 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!105179 (validMask!0 mask!1312)))

(assert (=> d!105179 (= (lemmaNoChangeToArrayThenSameMapNoExtras!569 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375417)))

(declare-fun bs!23148 () Bool)

(assert (= bs!23148 d!105179))

(assert (=> bs!23148 m!771281))

(assert (=> bs!23148 m!771279))

(declare-fun m!771431 () Bool)

(assert (=> bs!23148 m!771431))

(assert (=> bs!23148 m!771265))

(assert (=> b!828320 d!105179))

(declare-fun b!828483 () Bool)

(assert (=> b!828483 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22692 _keys!976)))))

(assert (=> b!828483 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22693 _values!788)))))

(declare-fun e!461663 () Bool)

(declare-fun lt!375433 () ListLongMap!8927)

(assert (=> b!828483 (= e!461663 (= (apply!366 lt!375433 (select (arr!22271 _keys!976) #b00000000000000000000000000000000)) (get!11791 (select (arr!22272 _values!788) #b00000000000000000000000000000000) (dynLambda!977 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!828484 () Bool)

(declare-fun e!461661 () Bool)

(assert (=> b!828484 (= e!461661 e!461663)))

(assert (=> b!828484 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22692 _keys!976)))))

(declare-fun res!564523 () Bool)

(assert (=> b!828484 (= res!564523 (contains!4190 lt!375433 (select (arr!22271 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!828484 (=> (not res!564523) (not e!461663))))

(declare-fun b!828485 () Bool)

(declare-fun e!461658 () Bool)

(assert (=> b!828485 (= e!461658 (validKeyInArray!0 (select (arr!22271 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!828485 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun call!36028 () ListLongMap!8927)

(declare-fun bm!36025 () Bool)

(assert (=> bm!36025 (= call!36028 (getCurrentListMapNoExtraKeys!2481 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!828486 () Bool)

(declare-fun e!461660 () Bool)

(declare-fun isEmpty!648 (ListLongMap!8927) Bool)

(assert (=> b!828486 (= e!461660 (isEmpty!648 lt!375433))))

(declare-fun b!828487 () Bool)

(declare-fun e!461659 () Bool)

(assert (=> b!828487 (= e!461659 e!461661)))

(declare-fun c!89629 () Bool)

(assert (=> b!828487 (= c!89629 e!461658)))

(declare-fun res!564526 () Bool)

(assert (=> b!828487 (=> (not res!564526) (not e!461658))))

(assert (=> b!828487 (= res!564526 (bvslt #b00000000000000000000000000000000 (size!22692 _keys!976)))))

(declare-fun d!105181 () Bool)

(assert (=> d!105181 e!461659))

(declare-fun res!564525 () Bool)

(assert (=> d!105181 (=> (not res!564525) (not e!461659))))

(assert (=> d!105181 (= res!564525 (not (contains!4190 lt!375433 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!461664 () ListLongMap!8927)

(assert (=> d!105181 (= lt!375433 e!461664)))

(declare-fun c!89626 () Bool)

(assert (=> d!105181 (= c!89626 (bvsge #b00000000000000000000000000000000 (size!22692 _keys!976)))))

(assert (=> d!105181 (validMask!0 mask!1312)))

(assert (=> d!105181 (= (getCurrentListMapNoExtraKeys!2481 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375433)))

(declare-fun b!828488 () Bool)

(assert (=> b!828488 (= e!461661 e!461660)))

(declare-fun c!89627 () Bool)

(assert (=> b!828488 (= c!89627 (bvslt #b00000000000000000000000000000000 (size!22692 _keys!976)))))

(declare-fun b!828489 () Bool)

(declare-fun e!461662 () ListLongMap!8927)

(assert (=> b!828489 (= e!461662 call!36028)))

(declare-fun b!828490 () Bool)

(assert (=> b!828490 (= e!461664 (ListLongMap!8928 Nil!15893))))

(declare-fun b!828491 () Bool)

(declare-fun lt!375432 () Unit!28377)

(declare-fun lt!375434 () Unit!28377)

(assert (=> b!828491 (= lt!375432 lt!375434)))

(declare-fun lt!375437 () (_ BitVec 64))

(declare-fun lt!375438 () ListLongMap!8927)

(declare-fun lt!375436 () V!25197)

(declare-fun lt!375435 () (_ BitVec 64))

(assert (=> b!828491 (not (contains!4190 (+!1962 lt!375438 (tuple2!10105 lt!375437 lt!375436)) lt!375435))))

(declare-fun addStillNotContains!191 (ListLongMap!8927 (_ BitVec 64) V!25197 (_ BitVec 64)) Unit!28377)

(assert (=> b!828491 (= lt!375434 (addStillNotContains!191 lt!375438 lt!375437 lt!375436 lt!375435))))

(assert (=> b!828491 (= lt!375435 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!828491 (= lt!375436 (get!11791 (select (arr!22272 _values!788) #b00000000000000000000000000000000) (dynLambda!977 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!828491 (= lt!375437 (select (arr!22271 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!828491 (= lt!375438 call!36028)))

(assert (=> b!828491 (= e!461662 (+!1962 call!36028 (tuple2!10105 (select (arr!22271 _keys!976) #b00000000000000000000000000000000) (get!11791 (select (arr!22272 _values!788) #b00000000000000000000000000000000) (dynLambda!977 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!828492 () Bool)

(assert (=> b!828492 (= e!461660 (= lt!375433 (getCurrentListMapNoExtraKeys!2481 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!828493 () Bool)

(declare-fun res!564524 () Bool)

(assert (=> b!828493 (=> (not res!564524) (not e!461659))))

(assert (=> b!828493 (= res!564524 (not (contains!4190 lt!375433 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!828494 () Bool)

(assert (=> b!828494 (= e!461664 e!461662)))

(declare-fun c!89628 () Bool)

(assert (=> b!828494 (= c!89628 (validKeyInArray!0 (select (arr!22271 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!105181 c!89626) b!828490))

(assert (= (and d!105181 (not c!89626)) b!828494))

(assert (= (and b!828494 c!89628) b!828491))

(assert (= (and b!828494 (not c!89628)) b!828489))

(assert (= (or b!828491 b!828489) bm!36025))

(assert (= (and d!105181 res!564525) b!828493))

(assert (= (and b!828493 res!564524) b!828487))

(assert (= (and b!828487 res!564526) b!828485))

(assert (= (and b!828487 c!89629) b!828484))

(assert (= (and b!828487 (not c!89629)) b!828488))

(assert (= (and b!828484 res!564523) b!828483))

(assert (= (and b!828488 c!89627) b!828492))

(assert (= (and b!828488 (not c!89627)) b!828486))

(declare-fun b_lambda!11207 () Bool)

(assert (=> (not b_lambda!11207) (not b!828483)))

(assert (=> b!828483 t!22254))

(declare-fun b_and!22403 () Bool)

(assert (= b_and!22401 (and (=> t!22254 result!7979) b_and!22403)))

(declare-fun b_lambda!11209 () Bool)

(assert (=> (not b_lambda!11209) (not b!828491)))

(assert (=> b!828491 t!22254))

(declare-fun b_and!22405 () Bool)

(assert (= b_and!22403 (and (=> t!22254 result!7979) b_and!22405)))

(assert (=> b!828484 m!771315))

(assert (=> b!828484 m!771315))

(declare-fun m!771433 () Bool)

(assert (=> b!828484 m!771433))

(declare-fun m!771435 () Bool)

(assert (=> b!828491 m!771435))

(declare-fun m!771437 () Bool)

(assert (=> b!828491 m!771437))

(assert (=> b!828491 m!771315))

(declare-fun m!771439 () Bool)

(assert (=> b!828491 m!771439))

(assert (=> b!828491 m!771313))

(assert (=> b!828491 m!771317))

(declare-fun m!771441 () Bool)

(assert (=> b!828491 m!771441))

(assert (=> b!828491 m!771435))

(assert (=> b!828491 m!771317))

(assert (=> b!828491 m!771313))

(assert (=> b!828491 m!771319))

(declare-fun m!771443 () Bool)

(assert (=> b!828493 m!771443))

(declare-fun m!771445 () Bool)

(assert (=> b!828486 m!771445))

(declare-fun m!771447 () Bool)

(assert (=> bm!36025 m!771447))

(declare-fun m!771449 () Bool)

(assert (=> d!105181 m!771449))

(assert (=> d!105181 m!771265))

(assert (=> b!828483 m!771315))

(assert (=> b!828483 m!771317))

(assert (=> b!828483 m!771315))

(declare-fun m!771451 () Bool)

(assert (=> b!828483 m!771451))

(assert (=> b!828483 m!771317))

(assert (=> b!828483 m!771313))

(assert (=> b!828483 m!771319))

(assert (=> b!828483 m!771313))

(assert (=> b!828485 m!771315))

(assert (=> b!828485 m!771315))

(assert (=> b!828485 m!771367))

(assert (=> b!828494 m!771315))

(assert (=> b!828494 m!771315))

(assert (=> b!828494 m!771367))

(assert (=> b!828492 m!771447))

(assert (=> b!828320 d!105181))

(declare-fun b!828495 () Bool)

(assert (=> b!828495 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22692 _keys!976)))))

(assert (=> b!828495 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22693 _values!788)))))

(declare-fun lt!375440 () ListLongMap!8927)

(declare-fun e!461670 () Bool)

(assert (=> b!828495 (= e!461670 (= (apply!366 lt!375440 (select (arr!22271 _keys!976) #b00000000000000000000000000000000)) (get!11791 (select (arr!22272 _values!788) #b00000000000000000000000000000000) (dynLambda!977 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!828496 () Bool)

(declare-fun e!461668 () Bool)

(assert (=> b!828496 (= e!461668 e!461670)))

(assert (=> b!828496 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22692 _keys!976)))))

(declare-fun res!564527 () Bool)

(assert (=> b!828496 (= res!564527 (contains!4190 lt!375440 (select (arr!22271 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!828496 (=> (not res!564527) (not e!461670))))

(declare-fun b!828497 () Bool)

(declare-fun e!461665 () Bool)

(assert (=> b!828497 (= e!461665 (validKeyInArray!0 (select (arr!22271 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!828497 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun call!36029 () ListLongMap!8927)

(declare-fun bm!36026 () Bool)

(assert (=> bm!36026 (= call!36029 (getCurrentListMapNoExtraKeys!2481 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!828498 () Bool)

(declare-fun e!461667 () Bool)

(assert (=> b!828498 (= e!461667 (isEmpty!648 lt!375440))))

(declare-fun b!828499 () Bool)

(declare-fun e!461666 () Bool)

(assert (=> b!828499 (= e!461666 e!461668)))

(declare-fun c!89633 () Bool)

(assert (=> b!828499 (= c!89633 e!461665)))

(declare-fun res!564530 () Bool)

(assert (=> b!828499 (=> (not res!564530) (not e!461665))))

(assert (=> b!828499 (= res!564530 (bvslt #b00000000000000000000000000000000 (size!22692 _keys!976)))))

(declare-fun d!105183 () Bool)

(assert (=> d!105183 e!461666))

(declare-fun res!564529 () Bool)

(assert (=> d!105183 (=> (not res!564529) (not e!461666))))

(assert (=> d!105183 (= res!564529 (not (contains!4190 lt!375440 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!461671 () ListLongMap!8927)

(assert (=> d!105183 (= lt!375440 e!461671)))

(declare-fun c!89630 () Bool)

(assert (=> d!105183 (= c!89630 (bvsge #b00000000000000000000000000000000 (size!22692 _keys!976)))))

(assert (=> d!105183 (validMask!0 mask!1312)))

(assert (=> d!105183 (= (getCurrentListMapNoExtraKeys!2481 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375440)))

(declare-fun b!828500 () Bool)

(assert (=> b!828500 (= e!461668 e!461667)))

(declare-fun c!89631 () Bool)

(assert (=> b!828500 (= c!89631 (bvslt #b00000000000000000000000000000000 (size!22692 _keys!976)))))

(declare-fun b!828501 () Bool)

(declare-fun e!461669 () ListLongMap!8927)

(assert (=> b!828501 (= e!461669 call!36029)))

(declare-fun b!828502 () Bool)

(assert (=> b!828502 (= e!461671 (ListLongMap!8928 Nil!15893))))

(declare-fun b!828503 () Bool)

(declare-fun lt!375439 () Unit!28377)

(declare-fun lt!375441 () Unit!28377)

(assert (=> b!828503 (= lt!375439 lt!375441)))

(declare-fun lt!375443 () V!25197)

(declare-fun lt!375444 () (_ BitVec 64))

(declare-fun lt!375445 () ListLongMap!8927)

(declare-fun lt!375442 () (_ BitVec 64))

(assert (=> b!828503 (not (contains!4190 (+!1962 lt!375445 (tuple2!10105 lt!375444 lt!375443)) lt!375442))))

(assert (=> b!828503 (= lt!375441 (addStillNotContains!191 lt!375445 lt!375444 lt!375443 lt!375442))))

(assert (=> b!828503 (= lt!375442 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!828503 (= lt!375443 (get!11791 (select (arr!22272 _values!788) #b00000000000000000000000000000000) (dynLambda!977 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!828503 (= lt!375444 (select (arr!22271 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!828503 (= lt!375445 call!36029)))

(assert (=> b!828503 (= e!461669 (+!1962 call!36029 (tuple2!10105 (select (arr!22271 _keys!976) #b00000000000000000000000000000000) (get!11791 (select (arr!22272 _values!788) #b00000000000000000000000000000000) (dynLambda!977 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!828504 () Bool)

(assert (=> b!828504 (= e!461667 (= lt!375440 (getCurrentListMapNoExtraKeys!2481 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!828505 () Bool)

(declare-fun res!564528 () Bool)

(assert (=> b!828505 (=> (not res!564528) (not e!461666))))

(assert (=> b!828505 (= res!564528 (not (contains!4190 lt!375440 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!828506 () Bool)

(assert (=> b!828506 (= e!461671 e!461669)))

(declare-fun c!89632 () Bool)

(assert (=> b!828506 (= c!89632 (validKeyInArray!0 (select (arr!22271 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!105183 c!89630) b!828502))

(assert (= (and d!105183 (not c!89630)) b!828506))

(assert (= (and b!828506 c!89632) b!828503))

(assert (= (and b!828506 (not c!89632)) b!828501))

(assert (= (or b!828503 b!828501) bm!36026))

(assert (= (and d!105183 res!564529) b!828505))

(assert (= (and b!828505 res!564528) b!828499))

(assert (= (and b!828499 res!564530) b!828497))

(assert (= (and b!828499 c!89633) b!828496))

(assert (= (and b!828499 (not c!89633)) b!828500))

(assert (= (and b!828496 res!564527) b!828495))

(assert (= (and b!828500 c!89631) b!828504))

(assert (= (and b!828500 (not c!89631)) b!828498))

(declare-fun b_lambda!11211 () Bool)

(assert (=> (not b_lambda!11211) (not b!828495)))

(assert (=> b!828495 t!22254))

(declare-fun b_and!22407 () Bool)

(assert (= b_and!22405 (and (=> t!22254 result!7979) b_and!22407)))

(declare-fun b_lambda!11213 () Bool)

(assert (=> (not b_lambda!11213) (not b!828503)))

(assert (=> b!828503 t!22254))

(declare-fun b_and!22409 () Bool)

(assert (= b_and!22407 (and (=> t!22254 result!7979) b_and!22409)))

(assert (=> b!828496 m!771315))

(assert (=> b!828496 m!771315))

(declare-fun m!771453 () Bool)

(assert (=> b!828496 m!771453))

(declare-fun m!771455 () Bool)

(assert (=> b!828503 m!771455))

(declare-fun m!771457 () Bool)

(assert (=> b!828503 m!771457))

(assert (=> b!828503 m!771315))

(declare-fun m!771459 () Bool)

(assert (=> b!828503 m!771459))

(assert (=> b!828503 m!771313))

(assert (=> b!828503 m!771317))

(declare-fun m!771461 () Bool)

(assert (=> b!828503 m!771461))

(assert (=> b!828503 m!771455))

(assert (=> b!828503 m!771317))

(assert (=> b!828503 m!771313))

(assert (=> b!828503 m!771319))

(declare-fun m!771463 () Bool)

(assert (=> b!828505 m!771463))

(declare-fun m!771465 () Bool)

(assert (=> b!828498 m!771465))

(declare-fun m!771467 () Bool)

(assert (=> bm!36026 m!771467))

(declare-fun m!771469 () Bool)

(assert (=> d!105183 m!771469))

(assert (=> d!105183 m!771265))

(assert (=> b!828495 m!771315))

(assert (=> b!828495 m!771317))

(assert (=> b!828495 m!771315))

(declare-fun m!771471 () Bool)

(assert (=> b!828495 m!771471))

(assert (=> b!828495 m!771317))

(assert (=> b!828495 m!771313))

(assert (=> b!828495 m!771319))

(assert (=> b!828495 m!771313))

(assert (=> b!828497 m!771315))

(assert (=> b!828497 m!771315))

(assert (=> b!828497 m!771367))

(assert (=> b!828506 m!771315))

(assert (=> b!828506 m!771315))

(assert (=> b!828506 m!771367))

(assert (=> b!828504 m!771467))

(assert (=> b!828320 d!105183))

(declare-fun b!828515 () Bool)

(declare-fun e!461680 () Bool)

(declare-fun e!461679 () Bool)

(assert (=> b!828515 (= e!461680 e!461679)))

(declare-fun c!89636 () Bool)

(assert (=> b!828515 (= c!89636 (validKeyInArray!0 (select (arr!22271 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!105185 () Bool)

(declare-fun res!564536 () Bool)

(assert (=> d!105185 (=> res!564536 e!461680)))

(assert (=> d!105185 (= res!564536 (bvsge #b00000000000000000000000000000000 (size!22692 _keys!976)))))

(assert (=> d!105185 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!461680)))

(declare-fun b!828516 () Bool)

(declare-fun e!461678 () Bool)

(assert (=> b!828516 (= e!461679 e!461678)))

(declare-fun lt!375453 () (_ BitVec 64))

(assert (=> b!828516 (= lt!375453 (select (arr!22271 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375454 () Unit!28377)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46458 (_ BitVec 64) (_ BitVec 32)) Unit!28377)

(assert (=> b!828516 (= lt!375454 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!375453 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46458 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!828516 (arrayContainsKey!0 _keys!976 lt!375453 #b00000000000000000000000000000000)))

(declare-fun lt!375452 () Unit!28377)

(assert (=> b!828516 (= lt!375452 lt!375454)))

(declare-fun res!564535 () Bool)

(declare-datatypes ((SeekEntryResult!8738 0))(
  ( (MissingZero!8738 (index!37323 (_ BitVec 32))) (Found!8738 (index!37324 (_ BitVec 32))) (Intermediate!8738 (undefined!9550 Bool) (index!37325 (_ BitVec 32)) (x!69957 (_ BitVec 32))) (Undefined!8738) (MissingVacant!8738 (index!37326 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46458 (_ BitVec 32)) SeekEntryResult!8738)

(assert (=> b!828516 (= res!564535 (= (seekEntryOrOpen!0 (select (arr!22271 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8738 #b00000000000000000000000000000000)))))

(assert (=> b!828516 (=> (not res!564535) (not e!461678))))

(declare-fun b!828517 () Bool)

(declare-fun call!36032 () Bool)

(assert (=> b!828517 (= e!461678 call!36032)))

(declare-fun bm!36029 () Bool)

(assert (=> bm!36029 (= call!36032 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!828518 () Bool)

(assert (=> b!828518 (= e!461679 call!36032)))

(assert (= (and d!105185 (not res!564536)) b!828515))

(assert (= (and b!828515 c!89636) b!828516))

(assert (= (and b!828515 (not c!89636)) b!828518))

(assert (= (and b!828516 res!564535) b!828517))

(assert (= (or b!828517 b!828518) bm!36029))

(assert (=> b!828515 m!771315))

(assert (=> b!828515 m!771315))

(assert (=> b!828515 m!771367))

(assert (=> b!828516 m!771315))

(declare-fun m!771473 () Bool)

(assert (=> b!828516 m!771473))

(declare-fun m!771475 () Bool)

(assert (=> b!828516 m!771475))

(assert (=> b!828516 m!771315))

(declare-fun m!771477 () Bool)

(assert (=> b!828516 m!771477))

(declare-fun m!771479 () Bool)

(assert (=> bm!36029 m!771479))

(assert (=> b!828324 d!105185))

(declare-fun d!105187 () Bool)

(assert (=> d!105187 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!71320 d!105187))

(declare-fun d!105189 () Bool)

(assert (=> d!105189 (= (array_inv!17741 _keys!976) (bvsge (size!22692 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!71320 d!105189))

(declare-fun d!105191 () Bool)

(assert (=> d!105191 (= (array_inv!17742 _values!788) (bvsge (size!22693 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!71320 d!105191))

(declare-fun b!828526 () Bool)

(declare-fun e!461686 () Bool)

(assert (=> b!828526 (= e!461686 tp_is_empty!15147)))

(declare-fun condMapEmpty!24361 () Bool)

(declare-fun mapDefault!24361 () ValueCell!7158)

(assert (=> mapNonEmpty!24355 (= condMapEmpty!24361 (= mapRest!24355 ((as const (Array (_ BitVec 32) ValueCell!7158)) mapDefault!24361)))))

(declare-fun mapRes!24361 () Bool)

(assert (=> mapNonEmpty!24355 (= tp!47079 (and e!461686 mapRes!24361))))

(declare-fun b!828525 () Bool)

(declare-fun e!461685 () Bool)

(assert (=> b!828525 (= e!461685 tp_is_empty!15147)))

(declare-fun mapIsEmpty!24361 () Bool)

(assert (=> mapIsEmpty!24361 mapRes!24361))

(declare-fun mapNonEmpty!24361 () Bool)

(declare-fun tp!47089 () Bool)

(assert (=> mapNonEmpty!24361 (= mapRes!24361 (and tp!47089 e!461685))))

(declare-fun mapRest!24361 () (Array (_ BitVec 32) ValueCell!7158))

(declare-fun mapValue!24361 () ValueCell!7158)

(declare-fun mapKey!24361 () (_ BitVec 32))

(assert (=> mapNonEmpty!24361 (= mapRest!24355 (store mapRest!24361 mapKey!24361 mapValue!24361))))

(assert (= (and mapNonEmpty!24355 condMapEmpty!24361) mapIsEmpty!24361))

(assert (= (and mapNonEmpty!24355 (not condMapEmpty!24361)) mapNonEmpty!24361))

(assert (= (and mapNonEmpty!24361 ((_ is ValueCellFull!7158) mapValue!24361)) b!828525))

(assert (= (and mapNonEmpty!24355 ((_ is ValueCellFull!7158) mapDefault!24361)) b!828526))

(declare-fun m!771481 () Bool)

(assert (=> mapNonEmpty!24361 m!771481))

(declare-fun b_lambda!11215 () Bool)

(assert (= b_lambda!11209 (or (and start!71320 b_free!13437) b_lambda!11215)))

(declare-fun b_lambda!11217 () Bool)

(assert (= b_lambda!11203 (or (and start!71320 b_free!13437) b_lambda!11217)))

(declare-fun b_lambda!11219 () Bool)

(assert (= b_lambda!11213 (or (and start!71320 b_free!13437) b_lambda!11219)))

(declare-fun b_lambda!11221 () Bool)

(assert (= b_lambda!11205 (or (and start!71320 b_free!13437) b_lambda!11221)))

(declare-fun b_lambda!11223 () Bool)

(assert (= b_lambda!11207 (or (and start!71320 b_free!13437) b_lambda!11223)))

(declare-fun b_lambda!11225 () Bool)

(assert (= b_lambda!11211 (or (and start!71320 b_free!13437) b_lambda!11225)))

(check-sat (not b!828428) (not b!828408) (not d!105175) (not b!828458) (not b!828422) (not bm!36029) (not b_lambda!11219) (not d!105183) (not b!828442) (not b!828486) (not b!828504) tp_is_empty!15147 (not b!828455) (not b!828394) (not b!828516) (not bm!36017) (not bm!36022) (not b!828413) (not b!828483) (not b_lambda!11215) (not bm!36025) (not b!828438) (not d!105171) (not b!828405) (not b!828496) (not b!828399) (not b!828506) (not b!828497) (not b!828515) (not b_lambda!11223) (not b!828409) (not bm!36014) (not b!828421) (not bm!36007) (not d!105179) (not b!828492) (not bm!36015) (not b_lambda!11221) (not b!828434) (not bm!36006) (not b!828491) (not b!828495) (not b!828423) (not bm!36010) (not b!828427) (not bm!36026) (not b!828503) (not b!828505) (not b!828493) (not b!828456) (not bm!36013) (not b!828485) (not bm!36008) (not d!105173) (not mapNonEmpty!24361) (not b_lambda!11225) (not b_next!13437) (not b!828494) (not b!828406) (not b!828484) (not d!105181) (not b!828498) b_and!22409 (not b_lambda!11217) (not b!828437) (not b!828435) (not b!828398))
(check-sat b_and!22409 (not b_next!13437))
