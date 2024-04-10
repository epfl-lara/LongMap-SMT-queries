; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70390 () Bool)

(assert start!70390)

(declare-fun b_free!12747 () Bool)

(declare-fun b_next!12747 () Bool)

(assert (=> start!70390 (= b_free!12747 (not b_next!12747))))

(declare-fun tp!44968 () Bool)

(declare-fun b_and!21559 () Bool)

(assert (=> start!70390 (= tp!44968 b_and!21559)))

(declare-fun mapNonEmpty!23278 () Bool)

(declare-fun mapRes!23278 () Bool)

(declare-fun tp!44967 () Bool)

(declare-fun e!453778 () Bool)

(assert (=> mapNonEmpty!23278 (= mapRes!23278 (and tp!44967 e!453778))))

(declare-datatypes ((V!24277 0))(
  ( (V!24278 (val!7276 Int)) )
))
(declare-datatypes ((ValueCell!6813 0))(
  ( (ValueCellFull!6813 (v!9705 V!24277)) (EmptyCell!6813) )
))
(declare-datatypes ((array!45112 0))(
  ( (array!45113 (arr!21612 (Array (_ BitVec 32) ValueCell!6813)) (size!22033 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45112)

(declare-fun mapKey!23278 () (_ BitVec 32))

(declare-fun mapValue!23278 () ValueCell!6813)

(declare-fun mapRest!23278 () (Array (_ BitVec 32) ValueCell!6813))

(assert (=> mapNonEmpty!23278 (= (arr!21612 _values!788) (store mapRest!23278 mapKey!23278 mapValue!23278))))

(declare-fun b!817698 () Bool)

(declare-fun res!558128 () Bool)

(declare-fun e!453776 () Bool)

(assert (=> b!817698 (=> (not res!558128) (not e!453776))))

(declare-datatypes ((array!45114 0))(
  ( (array!45115 (arr!21613 (Array (_ BitVec 32) (_ BitVec 64))) (size!22034 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45114)

(declare-datatypes ((List!15391 0))(
  ( (Nil!15388) (Cons!15387 (h!16516 (_ BitVec 64)) (t!21716 List!15391)) )
))
(declare-fun arrayNoDuplicates!0 (array!45114 (_ BitVec 32) List!15391) Bool)

(assert (=> b!817698 (= res!558128 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15388))))

(declare-fun b!817699 () Bool)

(declare-fun e!453780 () Bool)

(declare-fun e!453777 () Bool)

(assert (=> b!817699 (= e!453780 (and e!453777 mapRes!23278))))

(declare-fun condMapEmpty!23278 () Bool)

(declare-fun mapDefault!23278 () ValueCell!6813)

(assert (=> b!817699 (= condMapEmpty!23278 (= (arr!21612 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6813)) mapDefault!23278)))))

(declare-fun b!817700 () Bool)

(declare-fun tp_is_empty!14457 () Bool)

(assert (=> b!817700 (= e!453777 tp_is_empty!14457)))

(declare-fun b!817701 () Bool)

(assert (=> b!817701 (= e!453778 tp_is_empty!14457)))

(declare-fun res!558129 () Bool)

(assert (=> start!70390 (=> (not res!558129) (not e!453776))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70390 (= res!558129 (validMask!0 mask!1312))))

(assert (=> start!70390 e!453776))

(assert (=> start!70390 tp_is_empty!14457))

(declare-fun array_inv!17285 (array!45114) Bool)

(assert (=> start!70390 (array_inv!17285 _keys!976)))

(assert (=> start!70390 true))

(declare-fun array_inv!17286 (array!45112) Bool)

(assert (=> start!70390 (and (array_inv!17286 _values!788) e!453780)))

(assert (=> start!70390 tp!44968))

(declare-fun b!817702 () Bool)

(declare-fun res!558130 () Bool)

(assert (=> b!817702 (=> (not res!558130) (not e!453776))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!817702 (= res!558130 (and (= (size!22033 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22034 _keys!976) (size!22033 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!817703 () Bool)

(assert (=> b!817703 (= e!453776 (not (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!22034 _keys!976)))))))

(declare-datatypes ((tuple2!9562 0))(
  ( (tuple2!9563 (_1!4792 (_ BitVec 64)) (_2!4792 V!24277)) )
))
(declare-datatypes ((List!15392 0))(
  ( (Nil!15389) (Cons!15388 (h!16517 tuple2!9562) (t!21717 List!15392)) )
))
(declare-datatypes ((ListLongMap!8385 0))(
  ( (ListLongMap!8386 (toList!4208 List!15392)) )
))
(declare-fun lt!366361 () ListLongMap!8385)

(declare-fun lt!366363 () ListLongMap!8385)

(assert (=> b!817703 (= lt!366361 lt!366363)))

(declare-datatypes ((Unit!27900 0))(
  ( (Unit!27901) )
))
(declare-fun lt!366362 () Unit!27900)

(declare-fun zeroValueBefore!34 () V!24277)

(declare-fun zeroValueAfter!34 () V!24277)

(declare-fun minValue!754 () V!24277)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!359 (array!45114 array!45112 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24277 V!24277 V!24277 V!24277 (_ BitVec 32) Int) Unit!27900)

(assert (=> b!817703 (= lt!366362 (lemmaNoChangeToArrayThenSameMapNoExtras!359 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2249 (array!45114 array!45112 (_ BitVec 32) (_ BitVec 32) V!24277 V!24277 (_ BitVec 32) Int) ListLongMap!8385)

(assert (=> b!817703 (= lt!366363 (getCurrentListMapNoExtraKeys!2249 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!817703 (= lt!366361 (getCurrentListMapNoExtraKeys!2249 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!817704 () Bool)

(declare-fun res!558127 () Bool)

(assert (=> b!817704 (=> (not res!558127) (not e!453776))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45114 (_ BitVec 32)) Bool)

(assert (=> b!817704 (= res!558127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!23278 () Bool)

(assert (=> mapIsEmpty!23278 mapRes!23278))

(assert (= (and start!70390 res!558129) b!817702))

(assert (= (and b!817702 res!558130) b!817704))

(assert (= (and b!817704 res!558127) b!817698))

(assert (= (and b!817698 res!558128) b!817703))

(assert (= (and b!817699 condMapEmpty!23278) mapIsEmpty!23278))

(assert (= (and b!817699 (not condMapEmpty!23278)) mapNonEmpty!23278))

(get-info :version)

(assert (= (and mapNonEmpty!23278 ((_ is ValueCellFull!6813) mapValue!23278)) b!817701))

(assert (= (and b!817699 ((_ is ValueCellFull!6813) mapDefault!23278)) b!817700))

(assert (= start!70390 b!817699))

(declare-fun m!759243 () Bool)

(assert (=> b!817703 m!759243))

(declare-fun m!759245 () Bool)

(assert (=> b!817703 m!759245))

(declare-fun m!759247 () Bool)

(assert (=> b!817703 m!759247))

(declare-fun m!759249 () Bool)

(assert (=> mapNonEmpty!23278 m!759249))

(declare-fun m!759251 () Bool)

(assert (=> b!817704 m!759251))

(declare-fun m!759253 () Bool)

(assert (=> b!817698 m!759253))

(declare-fun m!759255 () Bool)

(assert (=> start!70390 m!759255))

(declare-fun m!759257 () Bool)

(assert (=> start!70390 m!759257))

(declare-fun m!759259 () Bool)

(assert (=> start!70390 m!759259))

(check-sat (not start!70390) b_and!21559 (not b!817698) (not b_next!12747) tp_is_empty!14457 (not b!817704) (not b!817703) (not mapNonEmpty!23278))
(check-sat b_and!21559 (not b_next!12747))
(get-model)

(declare-fun bm!35595 () Bool)

(declare-fun call!35598 () Bool)

(assert (=> bm!35595 (= call!35598 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!817734 () Bool)

(declare-fun e!453803 () Bool)

(assert (=> b!817734 (= e!453803 call!35598)))

(declare-fun b!817735 () Bool)

(declare-fun e!453804 () Bool)

(assert (=> b!817735 (= e!453804 call!35598)))

(declare-fun b!817736 () Bool)

(assert (=> b!817736 (= e!453804 e!453803)))

(declare-fun lt!366380 () (_ BitVec 64))

(assert (=> b!817736 (= lt!366380 (select (arr!21613 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!366381 () Unit!27900)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!45114 (_ BitVec 64) (_ BitVec 32)) Unit!27900)

(assert (=> b!817736 (= lt!366381 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!366380 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!45114 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!817736 (arrayContainsKey!0 _keys!976 lt!366380 #b00000000000000000000000000000000)))

(declare-fun lt!366379 () Unit!27900)

(assert (=> b!817736 (= lt!366379 lt!366381)))

(declare-fun res!558147 () Bool)

(declare-datatypes ((SeekEntryResult!8724 0))(
  ( (MissingZero!8724 (index!37267 (_ BitVec 32))) (Found!8724 (index!37268 (_ BitVec 32))) (Intermediate!8724 (undefined!9536 Bool) (index!37269 (_ BitVec 32)) (x!68869 (_ BitVec 32))) (Undefined!8724) (MissingVacant!8724 (index!37270 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!45114 (_ BitVec 32)) SeekEntryResult!8724)

(assert (=> b!817736 (= res!558147 (= (seekEntryOrOpen!0 (select (arr!21613 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8724 #b00000000000000000000000000000000)))))

(assert (=> b!817736 (=> (not res!558147) (not e!453803))))

(declare-fun b!817737 () Bool)

(declare-fun e!453802 () Bool)

(assert (=> b!817737 (= e!453802 e!453804)))

(declare-fun c!89063 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!817737 (= c!89063 (validKeyInArray!0 (select (arr!21613 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!104583 () Bool)

(declare-fun res!558148 () Bool)

(assert (=> d!104583 (=> res!558148 e!453802)))

(assert (=> d!104583 (= res!558148 (bvsge #b00000000000000000000000000000000 (size!22034 _keys!976)))))

(assert (=> d!104583 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!453802)))

(assert (= (and d!104583 (not res!558148)) b!817737))

(assert (= (and b!817737 c!89063) b!817736))

(assert (= (and b!817737 (not c!89063)) b!817735))

(assert (= (and b!817736 res!558147) b!817734))

(assert (= (or b!817734 b!817735) bm!35595))

(declare-fun m!759279 () Bool)

(assert (=> bm!35595 m!759279))

(declare-fun m!759281 () Bool)

(assert (=> b!817736 m!759281))

(declare-fun m!759283 () Bool)

(assert (=> b!817736 m!759283))

(declare-fun m!759285 () Bool)

(assert (=> b!817736 m!759285))

(assert (=> b!817736 m!759281))

(declare-fun m!759287 () Bool)

(assert (=> b!817736 m!759287))

(assert (=> b!817737 m!759281))

(assert (=> b!817737 m!759281))

(declare-fun m!759289 () Bool)

(assert (=> b!817737 m!759289))

(assert (=> b!817704 d!104583))

(declare-fun d!104585 () Bool)

(assert (=> d!104585 (= (getCurrentListMapNoExtraKeys!2249 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2249 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!366384 () Unit!27900)

(declare-fun choose!1391 (array!45114 array!45112 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24277 V!24277 V!24277 V!24277 (_ BitVec 32) Int) Unit!27900)

(assert (=> d!104585 (= lt!366384 (choose!1391 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!104585 (validMask!0 mask!1312)))

(assert (=> d!104585 (= (lemmaNoChangeToArrayThenSameMapNoExtras!359 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!366384)))

(declare-fun bs!22784 () Bool)

(assert (= bs!22784 d!104585))

(assert (=> bs!22784 m!759247))

(assert (=> bs!22784 m!759245))

(declare-fun m!759291 () Bool)

(assert (=> bs!22784 m!759291))

(assert (=> bs!22784 m!759255))

(assert (=> b!817703 d!104585))

(declare-fun b!817762 () Bool)

(declare-fun res!558158 () Bool)

(declare-fun e!453821 () Bool)

(assert (=> b!817762 (=> (not res!558158) (not e!453821))))

(declare-fun lt!366404 () ListLongMap!8385)

(declare-fun contains!4155 (ListLongMap!8385 (_ BitVec 64)) Bool)

(assert (=> b!817762 (= res!558158 (not (contains!4155 lt!366404 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!817763 () Bool)

(assert (=> b!817763 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22034 _keys!976)))))

(assert (=> b!817763 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22033 _values!788)))))

(declare-fun e!453819 () Bool)

(declare-fun apply!352 (ListLongMap!8385 (_ BitVec 64)) V!24277)

(declare-fun get!11547 (ValueCell!6813 V!24277) V!24277)

(declare-fun dynLambda!963 (Int (_ BitVec 64)) V!24277)

(assert (=> b!817763 (= e!453819 (= (apply!352 lt!366404 (select (arr!21613 _keys!976) #b00000000000000000000000000000000)) (get!11547 (select (arr!21612 _values!788) #b00000000000000000000000000000000) (dynLambda!963 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!817764 () Bool)

(declare-fun e!453823 () ListLongMap!8385)

(declare-fun e!453822 () ListLongMap!8385)

(assert (=> b!817764 (= e!453823 e!453822)))

(declare-fun c!89073 () Bool)

(assert (=> b!817764 (= c!89073 (validKeyInArray!0 (select (arr!21613 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!817765 () Bool)

(declare-fun e!453824 () Bool)

(assert (=> b!817765 (= e!453821 e!453824)))

(declare-fun c!89072 () Bool)

(declare-fun e!453825 () Bool)

(assert (=> b!817765 (= c!89072 e!453825)))

(declare-fun res!558157 () Bool)

(assert (=> b!817765 (=> (not res!558157) (not e!453825))))

(assert (=> b!817765 (= res!558157 (bvslt #b00000000000000000000000000000000 (size!22034 _keys!976)))))

(declare-fun b!817766 () Bool)

(assert (=> b!817766 (= e!453824 e!453819)))

(assert (=> b!817766 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22034 _keys!976)))))

(declare-fun res!558159 () Bool)

(assert (=> b!817766 (= res!558159 (contains!4155 lt!366404 (select (arr!21613 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!817766 (=> (not res!558159) (not e!453819))))

(declare-fun b!817767 () Bool)

(declare-fun e!453820 () Bool)

(declare-fun isEmpty!634 (ListLongMap!8385) Bool)

(assert (=> b!817767 (= e!453820 (isEmpty!634 lt!366404))))

(declare-fun b!817768 () Bool)

(declare-fun call!35601 () ListLongMap!8385)

(assert (=> b!817768 (= e!453822 call!35601)))

(declare-fun bm!35598 () Bool)

(assert (=> bm!35598 (= call!35601 (getCurrentListMapNoExtraKeys!2249 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!817769 () Bool)

(assert (=> b!817769 (= e!453820 (= lt!366404 (getCurrentListMapNoExtraKeys!2249 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!817770 () Bool)

(declare-fun lt!366405 () Unit!27900)

(declare-fun lt!366402 () Unit!27900)

(assert (=> b!817770 (= lt!366405 lt!366402)))

(declare-fun lt!366401 () (_ BitVec 64))

(declare-fun lt!366400 () ListLongMap!8385)

(declare-fun lt!366403 () (_ BitVec 64))

(declare-fun lt!366399 () V!24277)

(declare-fun +!1822 (ListLongMap!8385 tuple2!9562) ListLongMap!8385)

(assert (=> b!817770 (not (contains!4155 (+!1822 lt!366400 (tuple2!9563 lt!366401 lt!366399)) lt!366403))))

(declare-fun addStillNotContains!177 (ListLongMap!8385 (_ BitVec 64) V!24277 (_ BitVec 64)) Unit!27900)

(assert (=> b!817770 (= lt!366402 (addStillNotContains!177 lt!366400 lt!366401 lt!366399 lt!366403))))

(assert (=> b!817770 (= lt!366403 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!817770 (= lt!366399 (get!11547 (select (arr!21612 _values!788) #b00000000000000000000000000000000) (dynLambda!963 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!817770 (= lt!366401 (select (arr!21613 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!817770 (= lt!366400 call!35601)))

(assert (=> b!817770 (= e!453822 (+!1822 call!35601 (tuple2!9563 (select (arr!21613 _keys!976) #b00000000000000000000000000000000) (get!11547 (select (arr!21612 _values!788) #b00000000000000000000000000000000) (dynLambda!963 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!104587 () Bool)

(assert (=> d!104587 e!453821))

(declare-fun res!558160 () Bool)

(assert (=> d!104587 (=> (not res!558160) (not e!453821))))

(assert (=> d!104587 (= res!558160 (not (contains!4155 lt!366404 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104587 (= lt!366404 e!453823)))

(declare-fun c!89075 () Bool)

(assert (=> d!104587 (= c!89075 (bvsge #b00000000000000000000000000000000 (size!22034 _keys!976)))))

(assert (=> d!104587 (validMask!0 mask!1312)))

(assert (=> d!104587 (= (getCurrentListMapNoExtraKeys!2249 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!366404)))

(declare-fun b!817771 () Bool)

(assert (=> b!817771 (= e!453824 e!453820)))

(declare-fun c!89074 () Bool)

(assert (=> b!817771 (= c!89074 (bvslt #b00000000000000000000000000000000 (size!22034 _keys!976)))))

(declare-fun b!817772 () Bool)

(assert (=> b!817772 (= e!453823 (ListLongMap!8386 Nil!15389))))

(declare-fun b!817773 () Bool)

(assert (=> b!817773 (= e!453825 (validKeyInArray!0 (select (arr!21613 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!817773 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!104587 c!89075) b!817772))

(assert (= (and d!104587 (not c!89075)) b!817764))

(assert (= (and b!817764 c!89073) b!817770))

(assert (= (and b!817764 (not c!89073)) b!817768))

(assert (= (or b!817770 b!817768) bm!35598))

(assert (= (and d!104587 res!558160) b!817762))

(assert (= (and b!817762 res!558158) b!817765))

(assert (= (and b!817765 res!558157) b!817773))

(assert (= (and b!817765 c!89072) b!817766))

(assert (= (and b!817765 (not c!89072)) b!817771))

(assert (= (and b!817766 res!558159) b!817763))

(assert (= (and b!817771 c!89074) b!817769))

(assert (= (and b!817771 (not c!89074)) b!817767))

(declare-fun b_lambda!10911 () Bool)

(assert (=> (not b_lambda!10911) (not b!817763)))

(declare-fun t!21720 () Bool)

(declare-fun tb!4185 () Bool)

(assert (=> (and start!70390 (= defaultEntry!796 defaultEntry!796) t!21720) tb!4185))

(declare-fun result!7895 () Bool)

(assert (=> tb!4185 (= result!7895 tp_is_empty!14457)))

(assert (=> b!817763 t!21720))

(declare-fun b_and!21563 () Bool)

(assert (= b_and!21559 (and (=> t!21720 result!7895) b_and!21563)))

(declare-fun b_lambda!10913 () Bool)

(assert (=> (not b_lambda!10913) (not b!817770)))

(assert (=> b!817770 t!21720))

(declare-fun b_and!21565 () Bool)

(assert (= b_and!21563 (and (=> t!21720 result!7895) b_and!21565)))

(assert (=> b!817764 m!759281))

(assert (=> b!817764 m!759281))

(assert (=> b!817764 m!759289))

(declare-fun m!759293 () Bool)

(assert (=> b!817762 m!759293))

(assert (=> b!817766 m!759281))

(assert (=> b!817766 m!759281))

(declare-fun m!759295 () Bool)

(assert (=> b!817766 m!759295))

(declare-fun m!759297 () Bool)

(assert (=> b!817770 m!759297))

(declare-fun m!759299 () Bool)

(assert (=> b!817770 m!759299))

(declare-fun m!759301 () Bool)

(assert (=> b!817770 m!759301))

(declare-fun m!759303 () Bool)

(assert (=> b!817770 m!759303))

(declare-fun m!759305 () Bool)

(assert (=> b!817770 m!759305))

(assert (=> b!817770 m!759303))

(declare-fun m!759307 () Bool)

(assert (=> b!817770 m!759307))

(assert (=> b!817770 m!759301))

(assert (=> b!817770 m!759297))

(declare-fun m!759309 () Bool)

(assert (=> b!817770 m!759309))

(assert (=> b!817770 m!759281))

(declare-fun m!759311 () Bool)

(assert (=> b!817767 m!759311))

(declare-fun m!759313 () Bool)

(assert (=> b!817769 m!759313))

(declare-fun m!759315 () Bool)

(assert (=> d!104587 m!759315))

(assert (=> d!104587 m!759255))

(assert (=> b!817773 m!759281))

(assert (=> b!817773 m!759281))

(assert (=> b!817773 m!759289))

(assert (=> b!817763 m!759297))

(assert (=> b!817763 m!759281))

(declare-fun m!759317 () Bool)

(assert (=> b!817763 m!759317))

(assert (=> b!817763 m!759301))

(assert (=> b!817763 m!759301))

(assert (=> b!817763 m!759297))

(assert (=> b!817763 m!759309))

(assert (=> b!817763 m!759281))

(assert (=> bm!35598 m!759313))

(assert (=> b!817703 d!104587))

(declare-fun b!817776 () Bool)

(declare-fun res!558162 () Bool)

(declare-fun e!453828 () Bool)

(assert (=> b!817776 (=> (not res!558162) (not e!453828))))

(declare-fun lt!366411 () ListLongMap!8385)

(assert (=> b!817776 (= res!558162 (not (contains!4155 lt!366411 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!817777 () Bool)

(assert (=> b!817777 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22034 _keys!976)))))

(assert (=> b!817777 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22033 _values!788)))))

(declare-fun e!453826 () Bool)

(assert (=> b!817777 (= e!453826 (= (apply!352 lt!366411 (select (arr!21613 _keys!976) #b00000000000000000000000000000000)) (get!11547 (select (arr!21612 _values!788) #b00000000000000000000000000000000) (dynLambda!963 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!817778 () Bool)

(declare-fun e!453830 () ListLongMap!8385)

(declare-fun e!453829 () ListLongMap!8385)

(assert (=> b!817778 (= e!453830 e!453829)))

(declare-fun c!89077 () Bool)

(assert (=> b!817778 (= c!89077 (validKeyInArray!0 (select (arr!21613 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!817779 () Bool)

(declare-fun e!453831 () Bool)

(assert (=> b!817779 (= e!453828 e!453831)))

(declare-fun c!89076 () Bool)

(declare-fun e!453832 () Bool)

(assert (=> b!817779 (= c!89076 e!453832)))

(declare-fun res!558161 () Bool)

(assert (=> b!817779 (=> (not res!558161) (not e!453832))))

(assert (=> b!817779 (= res!558161 (bvslt #b00000000000000000000000000000000 (size!22034 _keys!976)))))

(declare-fun b!817780 () Bool)

(assert (=> b!817780 (= e!453831 e!453826)))

(assert (=> b!817780 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22034 _keys!976)))))

(declare-fun res!558163 () Bool)

(assert (=> b!817780 (= res!558163 (contains!4155 lt!366411 (select (arr!21613 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!817780 (=> (not res!558163) (not e!453826))))

(declare-fun b!817781 () Bool)

(declare-fun e!453827 () Bool)

(assert (=> b!817781 (= e!453827 (isEmpty!634 lt!366411))))

(declare-fun b!817782 () Bool)

(declare-fun call!35602 () ListLongMap!8385)

(assert (=> b!817782 (= e!453829 call!35602)))

(declare-fun bm!35599 () Bool)

(assert (=> bm!35599 (= call!35602 (getCurrentListMapNoExtraKeys!2249 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!817783 () Bool)

(assert (=> b!817783 (= e!453827 (= lt!366411 (getCurrentListMapNoExtraKeys!2249 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!817784 () Bool)

(declare-fun lt!366412 () Unit!27900)

(declare-fun lt!366409 () Unit!27900)

(assert (=> b!817784 (= lt!366412 lt!366409)))

(declare-fun lt!366407 () ListLongMap!8385)

(declare-fun lt!366406 () V!24277)

(declare-fun lt!366410 () (_ BitVec 64))

(declare-fun lt!366408 () (_ BitVec 64))

(assert (=> b!817784 (not (contains!4155 (+!1822 lt!366407 (tuple2!9563 lt!366408 lt!366406)) lt!366410))))

(assert (=> b!817784 (= lt!366409 (addStillNotContains!177 lt!366407 lt!366408 lt!366406 lt!366410))))

(assert (=> b!817784 (= lt!366410 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!817784 (= lt!366406 (get!11547 (select (arr!21612 _values!788) #b00000000000000000000000000000000) (dynLambda!963 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!817784 (= lt!366408 (select (arr!21613 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!817784 (= lt!366407 call!35602)))

(assert (=> b!817784 (= e!453829 (+!1822 call!35602 (tuple2!9563 (select (arr!21613 _keys!976) #b00000000000000000000000000000000) (get!11547 (select (arr!21612 _values!788) #b00000000000000000000000000000000) (dynLambda!963 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!104589 () Bool)

(assert (=> d!104589 e!453828))

(declare-fun res!558164 () Bool)

(assert (=> d!104589 (=> (not res!558164) (not e!453828))))

(assert (=> d!104589 (= res!558164 (not (contains!4155 lt!366411 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104589 (= lt!366411 e!453830)))

(declare-fun c!89079 () Bool)

(assert (=> d!104589 (= c!89079 (bvsge #b00000000000000000000000000000000 (size!22034 _keys!976)))))

(assert (=> d!104589 (validMask!0 mask!1312)))

(assert (=> d!104589 (= (getCurrentListMapNoExtraKeys!2249 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!366411)))

(declare-fun b!817785 () Bool)

(assert (=> b!817785 (= e!453831 e!453827)))

(declare-fun c!89078 () Bool)

(assert (=> b!817785 (= c!89078 (bvslt #b00000000000000000000000000000000 (size!22034 _keys!976)))))

(declare-fun b!817786 () Bool)

(assert (=> b!817786 (= e!453830 (ListLongMap!8386 Nil!15389))))

(declare-fun b!817787 () Bool)

(assert (=> b!817787 (= e!453832 (validKeyInArray!0 (select (arr!21613 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!817787 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!104589 c!89079) b!817786))

(assert (= (and d!104589 (not c!89079)) b!817778))

(assert (= (and b!817778 c!89077) b!817784))

(assert (= (and b!817778 (not c!89077)) b!817782))

(assert (= (or b!817784 b!817782) bm!35599))

(assert (= (and d!104589 res!558164) b!817776))

(assert (= (and b!817776 res!558162) b!817779))

(assert (= (and b!817779 res!558161) b!817787))

(assert (= (and b!817779 c!89076) b!817780))

(assert (= (and b!817779 (not c!89076)) b!817785))

(assert (= (and b!817780 res!558163) b!817777))

(assert (= (and b!817785 c!89078) b!817783))

(assert (= (and b!817785 (not c!89078)) b!817781))

(declare-fun b_lambda!10915 () Bool)

(assert (=> (not b_lambda!10915) (not b!817777)))

(assert (=> b!817777 t!21720))

(declare-fun b_and!21567 () Bool)

(assert (= b_and!21565 (and (=> t!21720 result!7895) b_and!21567)))

(declare-fun b_lambda!10917 () Bool)

(assert (=> (not b_lambda!10917) (not b!817784)))

(assert (=> b!817784 t!21720))

(declare-fun b_and!21569 () Bool)

(assert (= b_and!21567 (and (=> t!21720 result!7895) b_and!21569)))

(assert (=> b!817778 m!759281))

(assert (=> b!817778 m!759281))

(assert (=> b!817778 m!759289))

(declare-fun m!759319 () Bool)

(assert (=> b!817776 m!759319))

(assert (=> b!817780 m!759281))

(assert (=> b!817780 m!759281))

(declare-fun m!759321 () Bool)

(assert (=> b!817780 m!759321))

(assert (=> b!817784 m!759297))

(declare-fun m!759323 () Bool)

(assert (=> b!817784 m!759323))

(assert (=> b!817784 m!759301))

(declare-fun m!759325 () Bool)

(assert (=> b!817784 m!759325))

(declare-fun m!759327 () Bool)

(assert (=> b!817784 m!759327))

(assert (=> b!817784 m!759325))

(declare-fun m!759329 () Bool)

(assert (=> b!817784 m!759329))

(assert (=> b!817784 m!759301))

(assert (=> b!817784 m!759297))

(assert (=> b!817784 m!759309))

(assert (=> b!817784 m!759281))

(declare-fun m!759331 () Bool)

(assert (=> b!817781 m!759331))

(declare-fun m!759333 () Bool)

(assert (=> b!817783 m!759333))

(declare-fun m!759335 () Bool)

(assert (=> d!104589 m!759335))

(assert (=> d!104589 m!759255))

(assert (=> b!817787 m!759281))

(assert (=> b!817787 m!759281))

(assert (=> b!817787 m!759289))

(assert (=> b!817777 m!759297))

(assert (=> b!817777 m!759281))

(declare-fun m!759337 () Bool)

(assert (=> b!817777 m!759337))

(assert (=> b!817777 m!759301))

(assert (=> b!817777 m!759301))

(assert (=> b!817777 m!759297))

(assert (=> b!817777 m!759309))

(assert (=> b!817777 m!759281))

(assert (=> bm!35599 m!759333))

(assert (=> b!817703 d!104589))

(declare-fun bm!35602 () Bool)

(declare-fun call!35605 () Bool)

(declare-fun c!89082 () Bool)

(assert (=> bm!35602 (= call!35605 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89082 (Cons!15387 (select (arr!21613 _keys!976) #b00000000000000000000000000000000) Nil!15388) Nil!15388)))))

(declare-fun b!817799 () Bool)

(declare-fun e!453842 () Bool)

(assert (=> b!817799 (= e!453842 call!35605)))

(declare-fun b!817800 () Bool)

(declare-fun e!453843 () Bool)

(declare-fun contains!4156 (List!15391 (_ BitVec 64)) Bool)

(assert (=> b!817800 (= e!453843 (contains!4156 Nil!15388 (select (arr!21613 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!817801 () Bool)

(assert (=> b!817801 (= e!453842 call!35605)))

(declare-fun b!817802 () Bool)

(declare-fun e!453841 () Bool)

(declare-fun e!453844 () Bool)

(assert (=> b!817802 (= e!453841 e!453844)))

(declare-fun res!558172 () Bool)

(assert (=> b!817802 (=> (not res!558172) (not e!453844))))

(assert (=> b!817802 (= res!558172 (not e!453843))))

(declare-fun res!558173 () Bool)

(assert (=> b!817802 (=> (not res!558173) (not e!453843))))

(assert (=> b!817802 (= res!558173 (validKeyInArray!0 (select (arr!21613 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!104591 () Bool)

(declare-fun res!558171 () Bool)

(assert (=> d!104591 (=> res!558171 e!453841)))

(assert (=> d!104591 (= res!558171 (bvsge #b00000000000000000000000000000000 (size!22034 _keys!976)))))

(assert (=> d!104591 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15388) e!453841)))

(declare-fun b!817798 () Bool)

(assert (=> b!817798 (= e!453844 e!453842)))

(assert (=> b!817798 (= c!89082 (validKeyInArray!0 (select (arr!21613 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!104591 (not res!558171)) b!817802))

(assert (= (and b!817802 res!558173) b!817800))

(assert (= (and b!817802 res!558172) b!817798))

(assert (= (and b!817798 c!89082) b!817801))

(assert (= (and b!817798 (not c!89082)) b!817799))

(assert (= (or b!817801 b!817799) bm!35602))

(assert (=> bm!35602 m!759281))

(declare-fun m!759339 () Bool)

(assert (=> bm!35602 m!759339))

(assert (=> b!817800 m!759281))

(assert (=> b!817800 m!759281))

(declare-fun m!759341 () Bool)

(assert (=> b!817800 m!759341))

(assert (=> b!817802 m!759281))

(assert (=> b!817802 m!759281))

(assert (=> b!817802 m!759289))

(assert (=> b!817798 m!759281))

(assert (=> b!817798 m!759281))

(assert (=> b!817798 m!759289))

(assert (=> b!817698 d!104591))

(declare-fun d!104593 () Bool)

(assert (=> d!104593 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!70390 d!104593))

(declare-fun d!104595 () Bool)

(assert (=> d!104595 (= (array_inv!17285 _keys!976) (bvsge (size!22034 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!70390 d!104595))

(declare-fun d!104597 () Bool)

(assert (=> d!104597 (= (array_inv!17286 _values!788) (bvsge (size!22033 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!70390 d!104597))

(declare-fun b!817810 () Bool)

(declare-fun e!453849 () Bool)

(assert (=> b!817810 (= e!453849 tp_is_empty!14457)))

(declare-fun condMapEmpty!23284 () Bool)

(declare-fun mapDefault!23284 () ValueCell!6813)

(assert (=> mapNonEmpty!23278 (= condMapEmpty!23284 (= mapRest!23278 ((as const (Array (_ BitVec 32) ValueCell!6813)) mapDefault!23284)))))

(declare-fun mapRes!23284 () Bool)

(assert (=> mapNonEmpty!23278 (= tp!44967 (and e!453849 mapRes!23284))))

(declare-fun b!817809 () Bool)

(declare-fun e!453850 () Bool)

(assert (=> b!817809 (= e!453850 tp_is_empty!14457)))

(declare-fun mapIsEmpty!23284 () Bool)

(assert (=> mapIsEmpty!23284 mapRes!23284))

(declare-fun mapNonEmpty!23284 () Bool)

(declare-fun tp!44977 () Bool)

(assert (=> mapNonEmpty!23284 (= mapRes!23284 (and tp!44977 e!453850))))

(declare-fun mapRest!23284 () (Array (_ BitVec 32) ValueCell!6813))

(declare-fun mapKey!23284 () (_ BitVec 32))

(declare-fun mapValue!23284 () ValueCell!6813)

(assert (=> mapNonEmpty!23284 (= mapRest!23278 (store mapRest!23284 mapKey!23284 mapValue!23284))))

(assert (= (and mapNonEmpty!23278 condMapEmpty!23284) mapIsEmpty!23284))

(assert (= (and mapNonEmpty!23278 (not condMapEmpty!23284)) mapNonEmpty!23284))

(assert (= (and mapNonEmpty!23284 ((_ is ValueCellFull!6813) mapValue!23284)) b!817809))

(assert (= (and mapNonEmpty!23278 ((_ is ValueCellFull!6813) mapDefault!23284)) b!817810))

(declare-fun m!759343 () Bool)

(assert (=> mapNonEmpty!23284 m!759343))

(declare-fun b_lambda!10919 () Bool)

(assert (= b_lambda!10913 (or (and start!70390 b_free!12747) b_lambda!10919)))

(declare-fun b_lambda!10921 () Bool)

(assert (= b_lambda!10911 (or (and start!70390 b_free!12747) b_lambda!10921)))

(declare-fun b_lambda!10923 () Bool)

(assert (= b_lambda!10917 (or (and start!70390 b_free!12747) b_lambda!10923)))

(declare-fun b_lambda!10925 () Bool)

(assert (= b_lambda!10915 (or (and start!70390 b_free!12747) b_lambda!10925)))

(check-sat (not b_lambda!10919) (not b!817736) (not d!104585) (not b!817737) (not bm!35602) (not b!817773) (not b!817783) (not b_lambda!10925) (not b_lambda!10923) (not b!817763) (not b!817778) (not bm!35595) (not b_lambda!10921) (not b!817769) (not mapNonEmpty!23284) (not b!817776) (not bm!35598) (not b!817784) (not b!817787) (not d!104589) (not b!817800) (not b!817762) (not b!817766) (not b!817780) b_and!21569 (not b_next!12747) (not b!817798) (not b!817764) (not b!817770) (not b!817767) tp_is_empty!14457 (not d!104587) (not bm!35599) (not b!817777) (not b!817802) (not b!817781))
(check-sat b_and!21569 (not b_next!12747))
