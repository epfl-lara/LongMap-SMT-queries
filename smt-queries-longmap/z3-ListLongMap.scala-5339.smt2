; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71322 () Bool)

(assert start!71322)

(declare-fun b_free!13441 () Bool)

(declare-fun b_next!13441 () Bool)

(assert (=> start!71322 (= b_free!13441 (not b_next!13441))))

(declare-fun tp!47095 () Bool)

(declare-fun b_and!22385 () Bool)

(assert (=> start!71322 (= tp!47095 b_and!22385)))

(declare-fun res!564445 () Bool)

(declare-fun e!461555 () Bool)

(assert (=> start!71322 (=> (not res!564445) (not e!461555))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71322 (= res!564445 (validMask!0 mask!1312))))

(assert (=> start!71322 e!461555))

(declare-fun tp_is_empty!15151 () Bool)

(assert (=> start!71322 tp_is_empty!15151))

(declare-datatypes ((array!46439 0))(
  ( (array!46440 (arr!22261 (Array (_ BitVec 32) (_ BitVec 64))) (size!22682 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46439)

(declare-fun array_inv!17795 (array!46439) Bool)

(assert (=> start!71322 (array_inv!17795 _keys!976)))

(assert (=> start!71322 true))

(declare-datatypes ((V!25203 0))(
  ( (V!25204 (val!7623 Int)) )
))
(declare-datatypes ((ValueCell!7160 0))(
  ( (ValueCellFull!7160 (v!10054 V!25203)) (EmptyCell!7160) )
))
(declare-datatypes ((array!46441 0))(
  ( (array!46442 (arr!22262 (Array (_ BitVec 32) ValueCell!7160)) (size!22683 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46441)

(declare-fun e!461556 () Bool)

(declare-fun array_inv!17796 (array!46441) Bool)

(assert (=> start!71322 (and (array_inv!17796 _values!788) e!461556)))

(assert (=> start!71322 tp!47095))

(declare-fun b!828301 () Bool)

(declare-fun zeroValueAfter!34 () V!25203)

(declare-fun minValue!754 () V!25203)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun e!461559 () Bool)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!10114 0))(
  ( (tuple2!10115 (_1!5068 (_ BitVec 64)) (_2!5068 V!25203)) )
))
(declare-datatypes ((List!15901 0))(
  ( (Nil!15898) (Cons!15897 (h!17026 tuple2!10114) (t!22247 List!15901)) )
))
(declare-datatypes ((ListLongMap!8927 0))(
  ( (ListLongMap!8928 (toList!4479 List!15901)) )
))
(declare-fun lt!375220 () ListLongMap!8927)

(declare-fun getCurrentListMap!2534 (array!46439 array!46441 (_ BitVec 32) (_ BitVec 32) V!25203 V!25203 (_ BitVec 32) Int) ListLongMap!8927)

(declare-fun +!1990 (ListLongMap!8927 tuple2!10114) ListLongMap!8927)

(assert (=> b!828301 (= e!461559 (= (getCurrentListMap!2534 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (+!1990 lt!375220 (tuple2!10115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun mapNonEmpty!24364 () Bool)

(declare-fun mapRes!24364 () Bool)

(declare-fun tp!47094 () Bool)

(declare-fun e!461554 () Bool)

(assert (=> mapNonEmpty!24364 (= mapRes!24364 (and tp!47094 e!461554))))

(declare-fun mapRest!24364 () (Array (_ BitVec 32) ValueCell!7160))

(declare-fun mapKey!24364 () (_ BitVec 32))

(declare-fun mapValue!24364 () ValueCell!7160)

(assert (=> mapNonEmpty!24364 (= (arr!22262 _values!788) (store mapRest!24364 mapKey!24364 mapValue!24364))))

(declare-fun b!828302 () Bool)

(assert (=> b!828302 (= e!461555 (not e!461559))))

(declare-fun res!564449 () Bool)

(assert (=> b!828302 (=> res!564449 e!461559)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!828302 (= res!564449 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!461557 () Bool)

(assert (=> b!828302 e!461557))

(declare-fun res!564448 () Bool)

(assert (=> b!828302 (=> (not res!564448) (not e!461557))))

(declare-fun lt!375219 () ListLongMap!8927)

(assert (=> b!828302 (= res!564448 (= lt!375219 lt!375220))))

(declare-fun zeroValueBefore!34 () V!25203)

(declare-datatypes ((Unit!28329 0))(
  ( (Unit!28330) )
))
(declare-fun lt!375218 () Unit!28329)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!579 (array!46439 array!46441 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25203 V!25203 V!25203 V!25203 (_ BitVec 32) Int) Unit!28329)

(assert (=> b!828302 (= lt!375218 (lemmaNoChangeToArrayThenSameMapNoExtras!579 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2509 (array!46439 array!46441 (_ BitVec 32) (_ BitVec 32) V!25203 V!25203 (_ BitVec 32) Int) ListLongMap!8927)

(assert (=> b!828302 (= lt!375220 (getCurrentListMapNoExtraKeys!2509 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!828302 (= lt!375219 (getCurrentListMapNoExtraKeys!2509 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!828303 () Bool)

(declare-fun e!461560 () Bool)

(assert (=> b!828303 (= e!461557 e!461560)))

(declare-fun res!564446 () Bool)

(assert (=> b!828303 (=> res!564446 e!461560)))

(assert (=> b!828303 (= res!564446 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!828304 () Bool)

(declare-fun e!461553 () Bool)

(assert (=> b!828304 (= e!461556 (and e!461553 mapRes!24364))))

(declare-fun condMapEmpty!24364 () Bool)

(declare-fun mapDefault!24364 () ValueCell!7160)

(assert (=> b!828304 (= condMapEmpty!24364 (= (arr!22262 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7160)) mapDefault!24364)))))

(declare-fun b!828305 () Bool)

(declare-fun res!564451 () Bool)

(assert (=> b!828305 (=> (not res!564451) (not e!461555))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46439 (_ BitVec 32)) Bool)

(assert (=> b!828305 (= res!564451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!828306 () Bool)

(declare-fun res!564447 () Bool)

(assert (=> b!828306 (=> (not res!564447) (not e!461555))))

(declare-datatypes ((List!15902 0))(
  ( (Nil!15899) (Cons!15898 (h!17027 (_ BitVec 64)) (t!22248 List!15902)) )
))
(declare-fun arrayNoDuplicates!0 (array!46439 (_ BitVec 32) List!15902) Bool)

(assert (=> b!828306 (= res!564447 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15899))))

(declare-fun mapIsEmpty!24364 () Bool)

(assert (=> mapIsEmpty!24364 mapRes!24364))

(declare-fun b!828307 () Bool)

(assert (=> b!828307 (= e!461554 tp_is_empty!15151)))

(declare-fun b!828308 () Bool)

(assert (=> b!828308 (= e!461560 (= (getCurrentListMap!2534 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (+!1990 lt!375219 (tuple2!10115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(declare-fun b!828309 () Bool)

(declare-fun res!564450 () Bool)

(assert (=> b!828309 (=> (not res!564450) (not e!461555))))

(assert (=> b!828309 (= res!564450 (and (= (size!22683 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22682 _keys!976) (size!22683 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!828310 () Bool)

(assert (=> b!828310 (= e!461553 tp_is_empty!15151)))

(assert (= (and start!71322 res!564445) b!828309))

(assert (= (and b!828309 res!564450) b!828305))

(assert (= (and b!828305 res!564451) b!828306))

(assert (= (and b!828306 res!564447) b!828302))

(assert (= (and b!828302 res!564448) b!828303))

(assert (= (and b!828303 (not res!564446)) b!828308))

(assert (= (and b!828302 (not res!564449)) b!828301))

(assert (= (and b!828304 condMapEmpty!24364) mapIsEmpty!24364))

(assert (= (and b!828304 (not condMapEmpty!24364)) mapNonEmpty!24364))

(get-info :version)

(assert (= (and mapNonEmpty!24364 ((_ is ValueCellFull!7160) mapValue!24364)) b!828307))

(assert (= (and b!828304 ((_ is ValueCellFull!7160) mapDefault!24364)) b!828310))

(assert (= start!71322 b!828304))

(declare-fun m!770731 () Bool)

(assert (=> b!828306 m!770731))

(declare-fun m!770733 () Bool)

(assert (=> mapNonEmpty!24364 m!770733))

(declare-fun m!770735 () Bool)

(assert (=> b!828308 m!770735))

(declare-fun m!770737 () Bool)

(assert (=> b!828308 m!770737))

(declare-fun m!770739 () Bool)

(assert (=> b!828305 m!770739))

(declare-fun m!770741 () Bool)

(assert (=> b!828302 m!770741))

(declare-fun m!770743 () Bool)

(assert (=> b!828302 m!770743))

(declare-fun m!770745 () Bool)

(assert (=> b!828302 m!770745))

(declare-fun m!770747 () Bool)

(assert (=> start!71322 m!770747))

(declare-fun m!770749 () Bool)

(assert (=> start!71322 m!770749))

(declare-fun m!770751 () Bool)

(assert (=> start!71322 m!770751))

(declare-fun m!770753 () Bool)

(assert (=> b!828301 m!770753))

(declare-fun m!770755 () Bool)

(assert (=> b!828301 m!770755))

(check-sat (not b!828308) (not b!828306) (not b!828302) (not mapNonEmpty!24364) b_and!22385 (not b!828301) (not start!71322) tp_is_empty!15151 (not b!828305) (not b_next!13441))
(check-sat b_and!22385 (not b_next!13441))
(get-model)

(declare-fun b!828413 () Bool)

(declare-fun res!564516 () Bool)

(declare-fun e!461642 () Bool)

(assert (=> b!828413 (=> (not res!564516) (not e!461642))))

(declare-fun e!461645 () Bool)

(assert (=> b!828413 (= res!564516 e!461645)))

(declare-fun c!89582 () Bool)

(assert (=> b!828413 (= c!89582 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!36018 () Bool)

(declare-fun call!36021 () Bool)

(declare-fun lt!375289 () ListLongMap!8927)

(declare-fun contains!4172 (ListLongMap!8927 (_ BitVec 64)) Bool)

(assert (=> bm!36018 (= call!36021 (contains!4172 lt!375289 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!828414 () Bool)

(declare-fun e!461638 () Bool)

(assert (=> b!828414 (= e!461638 (not call!36021))))

(declare-fun b!828415 () Bool)

(declare-fun e!461641 () Bool)

(declare-fun apply!367 (ListLongMap!8927 (_ BitVec 64)) V!25203)

(assert (=> b!828415 (= e!461641 (= (apply!367 lt!375289 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!828416 () Bool)

(assert (=> b!828416 (= e!461638 e!461641)))

(declare-fun res!564512 () Bool)

(assert (=> b!828416 (= res!564512 call!36021)))

(assert (=> b!828416 (=> (not res!564512) (not e!461641))))

(declare-fun b!828417 () Bool)

(declare-fun e!461646 () Unit!28329)

(declare-fun lt!375293 () Unit!28329)

(assert (=> b!828417 (= e!461646 lt!375293)))

(declare-fun lt!375298 () ListLongMap!8927)

(assert (=> b!828417 (= lt!375298 (getCurrentListMapNoExtraKeys!2509 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375301 () (_ BitVec 64))

(assert (=> b!828417 (= lt!375301 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375303 () (_ BitVec 64))

(assert (=> b!828417 (= lt!375303 (select (arr!22261 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375290 () Unit!28329)

(declare-fun addStillContains!318 (ListLongMap!8927 (_ BitVec 64) V!25203 (_ BitVec 64)) Unit!28329)

(assert (=> b!828417 (= lt!375290 (addStillContains!318 lt!375298 lt!375301 zeroValueBefore!34 lt!375303))))

(assert (=> b!828417 (contains!4172 (+!1990 lt!375298 (tuple2!10115 lt!375301 zeroValueBefore!34)) lt!375303)))

(declare-fun lt!375295 () Unit!28329)

(assert (=> b!828417 (= lt!375295 lt!375290)))

(declare-fun lt!375291 () ListLongMap!8927)

(assert (=> b!828417 (= lt!375291 (getCurrentListMapNoExtraKeys!2509 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375283 () (_ BitVec 64))

(assert (=> b!828417 (= lt!375283 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375297 () (_ BitVec 64))

(assert (=> b!828417 (= lt!375297 (select (arr!22261 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375299 () Unit!28329)

(declare-fun addApplyDifferent!318 (ListLongMap!8927 (_ BitVec 64) V!25203 (_ BitVec 64)) Unit!28329)

(assert (=> b!828417 (= lt!375299 (addApplyDifferent!318 lt!375291 lt!375283 minValue!754 lt!375297))))

(assert (=> b!828417 (= (apply!367 (+!1990 lt!375291 (tuple2!10115 lt!375283 minValue!754)) lt!375297) (apply!367 lt!375291 lt!375297))))

(declare-fun lt!375286 () Unit!28329)

(assert (=> b!828417 (= lt!375286 lt!375299)))

(declare-fun lt!375284 () ListLongMap!8927)

(assert (=> b!828417 (= lt!375284 (getCurrentListMapNoExtraKeys!2509 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375285 () (_ BitVec 64))

(assert (=> b!828417 (= lt!375285 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375294 () (_ BitVec 64))

(assert (=> b!828417 (= lt!375294 (select (arr!22261 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375287 () Unit!28329)

(assert (=> b!828417 (= lt!375287 (addApplyDifferent!318 lt!375284 lt!375285 zeroValueBefore!34 lt!375294))))

(assert (=> b!828417 (= (apply!367 (+!1990 lt!375284 (tuple2!10115 lt!375285 zeroValueBefore!34)) lt!375294) (apply!367 lt!375284 lt!375294))))

(declare-fun lt!375304 () Unit!28329)

(assert (=> b!828417 (= lt!375304 lt!375287)))

(declare-fun lt!375292 () ListLongMap!8927)

(assert (=> b!828417 (= lt!375292 (getCurrentListMapNoExtraKeys!2509 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375300 () (_ BitVec 64))

(assert (=> b!828417 (= lt!375300 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375296 () (_ BitVec 64))

(assert (=> b!828417 (= lt!375296 (select (arr!22261 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!828417 (= lt!375293 (addApplyDifferent!318 lt!375292 lt!375300 minValue!754 lt!375296))))

(assert (=> b!828417 (= (apply!367 (+!1990 lt!375292 (tuple2!10115 lt!375300 minValue!754)) lt!375296) (apply!367 lt!375292 lt!375296))))

(declare-fun b!828418 () Bool)

(assert (=> b!828418 (= e!461642 e!461638)))

(declare-fun c!89579 () Bool)

(assert (=> b!828418 (= c!89579 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!828419 () Bool)

(declare-fun e!461643 () ListLongMap!8927)

(declare-fun e!461644 () ListLongMap!8927)

(assert (=> b!828419 (= e!461643 e!461644)))

(declare-fun c!89581 () Bool)

(assert (=> b!828419 (= c!89581 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!828420 () Bool)

(declare-fun e!461637 () Bool)

(assert (=> b!828420 (= e!461645 e!461637)))

(declare-fun res!564520 () Bool)

(declare-fun call!36025 () Bool)

(assert (=> b!828420 (= res!564520 call!36025)))

(assert (=> b!828420 (=> (not res!564520) (not e!461637))))

(declare-fun b!828421 () Bool)

(declare-fun e!461639 () ListLongMap!8927)

(declare-fun call!36022 () ListLongMap!8927)

(assert (=> b!828421 (= e!461639 call!36022)))

(declare-fun b!828422 () Bool)

(declare-fun call!36024 () ListLongMap!8927)

(assert (=> b!828422 (= e!461643 (+!1990 call!36024 (tuple2!10115 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun bm!36019 () Bool)

(declare-fun call!36027 () ListLongMap!8927)

(assert (=> bm!36019 (= call!36022 call!36027)))

(declare-fun b!828423 () Bool)

(assert (=> b!828423 (= e!461645 (not call!36025))))

(declare-fun b!828424 () Bool)

(declare-fun e!461640 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!828424 (= e!461640 (validKeyInArray!0 (select (arr!22261 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!36020 () Bool)

(assert (=> bm!36020 (= call!36025 (contains!4172 lt!375289 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!36021 () Bool)

(declare-fun call!36023 () ListLongMap!8927)

(assert (=> bm!36021 (= call!36027 call!36023)))

(declare-fun b!828425 () Bool)

(declare-fun e!461647 () Bool)

(declare-fun e!461636 () Bool)

(assert (=> b!828425 (= e!461647 e!461636)))

(declare-fun res!564515 () Bool)

(assert (=> b!828425 (=> (not res!564515) (not e!461636))))

(assert (=> b!828425 (= res!564515 (contains!4172 lt!375289 (select (arr!22261 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!828425 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22682 _keys!976)))))

(declare-fun bm!36022 () Bool)

(assert (=> bm!36022 (= call!36023 (getCurrentListMapNoExtraKeys!2509 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!828426 () Bool)

(declare-fun get!11800 (ValueCell!7160 V!25203) V!25203)

(declare-fun dynLambda!981 (Int (_ BitVec 64)) V!25203)

(assert (=> b!828426 (= e!461636 (= (apply!367 lt!375289 (select (arr!22261 _keys!976) #b00000000000000000000000000000000)) (get!11800 (select (arr!22262 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!828426 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22683 _values!788)))))

(assert (=> b!828426 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22682 _keys!976)))))

(declare-fun b!828427 () Bool)

(declare-fun call!36026 () ListLongMap!8927)

(assert (=> b!828427 (= e!461644 call!36026)))

(declare-fun c!89580 () Bool)

(declare-fun bm!36023 () Bool)

(assert (=> bm!36023 (= call!36024 (+!1990 (ite c!89580 call!36023 (ite c!89581 call!36027 call!36022)) (ite (or c!89580 c!89581) (tuple2!10115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10115 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!828428 () Bool)

(declare-fun Unit!28335 () Unit!28329)

(assert (=> b!828428 (= e!461646 Unit!28335)))

(declare-fun d!104999 () Bool)

(assert (=> d!104999 e!461642))

(declare-fun res!564519 () Bool)

(assert (=> d!104999 (=> (not res!564519) (not e!461642))))

(assert (=> d!104999 (= res!564519 (or (bvsge #b00000000000000000000000000000000 (size!22682 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22682 _keys!976)))))))

(declare-fun lt!375288 () ListLongMap!8927)

(assert (=> d!104999 (= lt!375289 lt!375288)))

(declare-fun lt!375302 () Unit!28329)

(assert (=> d!104999 (= lt!375302 e!461646)))

(declare-fun c!89584 () Bool)

(declare-fun e!461635 () Bool)

(assert (=> d!104999 (= c!89584 e!461635)))

(declare-fun res!564517 () Bool)

(assert (=> d!104999 (=> (not res!564517) (not e!461635))))

(assert (=> d!104999 (= res!564517 (bvslt #b00000000000000000000000000000000 (size!22682 _keys!976)))))

(assert (=> d!104999 (= lt!375288 e!461643)))

(assert (=> d!104999 (= c!89580 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104999 (validMask!0 mask!1312)))

(assert (=> d!104999 (= (getCurrentListMap!2534 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375289)))

(declare-fun b!828429 () Bool)

(declare-fun res!564514 () Bool)

(assert (=> b!828429 (=> (not res!564514) (not e!461642))))

(assert (=> b!828429 (= res!564514 e!461647)))

(declare-fun res!564513 () Bool)

(assert (=> b!828429 (=> res!564513 e!461647)))

(assert (=> b!828429 (= res!564513 (not e!461640))))

(declare-fun res!564518 () Bool)

(assert (=> b!828429 (=> (not res!564518) (not e!461640))))

(assert (=> b!828429 (= res!564518 (bvslt #b00000000000000000000000000000000 (size!22682 _keys!976)))))

(declare-fun b!828430 () Bool)

(assert (=> b!828430 (= e!461637 (= (apply!367 lt!375289 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun b!828431 () Bool)

(declare-fun c!89583 () Bool)

(assert (=> b!828431 (= c!89583 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!828431 (= e!461644 e!461639)))

(declare-fun bm!36024 () Bool)

(assert (=> bm!36024 (= call!36026 call!36024)))

(declare-fun b!828432 () Bool)

(assert (=> b!828432 (= e!461635 (validKeyInArray!0 (select (arr!22261 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!828433 () Bool)

(assert (=> b!828433 (= e!461639 call!36026)))

(assert (= (and d!104999 c!89580) b!828422))

(assert (= (and d!104999 (not c!89580)) b!828419))

(assert (= (and b!828419 c!89581) b!828427))

(assert (= (and b!828419 (not c!89581)) b!828431))

(assert (= (and b!828431 c!89583) b!828433))

(assert (= (and b!828431 (not c!89583)) b!828421))

(assert (= (or b!828433 b!828421) bm!36019))

(assert (= (or b!828427 bm!36019) bm!36021))

(assert (= (or b!828427 b!828433) bm!36024))

(assert (= (or b!828422 bm!36021) bm!36022))

(assert (= (or b!828422 bm!36024) bm!36023))

(assert (= (and d!104999 res!564517) b!828432))

(assert (= (and d!104999 c!89584) b!828417))

(assert (= (and d!104999 (not c!89584)) b!828428))

(assert (= (and d!104999 res!564519) b!828429))

(assert (= (and b!828429 res!564518) b!828424))

(assert (= (and b!828429 (not res!564513)) b!828425))

(assert (= (and b!828425 res!564515) b!828426))

(assert (= (and b!828429 res!564514) b!828413))

(assert (= (and b!828413 c!89582) b!828420))

(assert (= (and b!828413 (not c!89582)) b!828423))

(assert (= (and b!828420 res!564520) b!828430))

(assert (= (or b!828420 b!828423) bm!36020))

(assert (= (and b!828413 res!564516) b!828418))

(assert (= (and b!828418 c!89579) b!828416))

(assert (= (and b!828418 (not c!89579)) b!828414))

(assert (= (and b!828416 res!564512) b!828415))

(assert (= (or b!828416 b!828414) bm!36018))

(declare-fun b_lambda!11209 () Bool)

(assert (=> (not b_lambda!11209) (not b!828426)))

(declare-fun t!22254 () Bool)

(declare-fun tb!4207 () Bool)

(assert (=> (and start!71322 (= defaultEntry!796 defaultEntry!796) t!22254) tb!4207))

(declare-fun result!7977 () Bool)

(assert (=> tb!4207 (= result!7977 tp_is_empty!15151)))

(assert (=> b!828426 t!22254))

(declare-fun b_and!22391 () Bool)

(assert (= b_and!22385 (and (=> t!22254 result!7977) b_and!22391)))

(declare-fun m!770809 () Bool)

(assert (=> b!828430 m!770809))

(assert (=> bm!36022 m!770745))

(declare-fun m!770811 () Bool)

(assert (=> b!828424 m!770811))

(assert (=> b!828424 m!770811))

(declare-fun m!770813 () Bool)

(assert (=> b!828424 m!770813))

(assert (=> b!828425 m!770811))

(assert (=> b!828425 m!770811))

(declare-fun m!770815 () Bool)

(assert (=> b!828425 m!770815))

(assert (=> b!828432 m!770811))

(assert (=> b!828432 m!770811))

(assert (=> b!828432 m!770813))

(declare-fun m!770817 () Bool)

(assert (=> bm!36020 m!770817))

(declare-fun m!770819 () Bool)

(assert (=> b!828415 m!770819))

(declare-fun m!770821 () Bool)

(assert (=> bm!36018 m!770821))

(declare-fun m!770823 () Bool)

(assert (=> b!828422 m!770823))

(declare-fun m!770825 () Bool)

(assert (=> b!828417 m!770825))

(declare-fun m!770827 () Bool)

(assert (=> b!828417 m!770827))

(assert (=> b!828417 m!770745))

(declare-fun m!770829 () Bool)

(assert (=> b!828417 m!770829))

(declare-fun m!770831 () Bool)

(assert (=> b!828417 m!770831))

(declare-fun m!770833 () Bool)

(assert (=> b!828417 m!770833))

(declare-fun m!770835 () Bool)

(assert (=> b!828417 m!770835))

(declare-fun m!770837 () Bool)

(assert (=> b!828417 m!770837))

(declare-fun m!770839 () Bool)

(assert (=> b!828417 m!770839))

(declare-fun m!770841 () Bool)

(assert (=> b!828417 m!770841))

(declare-fun m!770843 () Bool)

(assert (=> b!828417 m!770843))

(assert (=> b!828417 m!770811))

(declare-fun m!770845 () Bool)

(assert (=> b!828417 m!770845))

(assert (=> b!828417 m!770835))

(declare-fun m!770847 () Bool)

(assert (=> b!828417 m!770847))

(declare-fun m!770849 () Bool)

(assert (=> b!828417 m!770849))

(assert (=> b!828417 m!770825))

(declare-fun m!770851 () Bool)

(assert (=> b!828417 m!770851))

(assert (=> b!828417 m!770841))

(assert (=> b!828417 m!770839))

(declare-fun m!770853 () Bool)

(assert (=> b!828417 m!770853))

(assert (=> b!828426 m!770811))

(declare-fun m!770855 () Bool)

(assert (=> b!828426 m!770855))

(declare-fun m!770857 () Bool)

(assert (=> b!828426 m!770857))

(declare-fun m!770859 () Bool)

(assert (=> b!828426 m!770859))

(declare-fun m!770861 () Bool)

(assert (=> b!828426 m!770861))

(assert (=> b!828426 m!770857))

(assert (=> b!828426 m!770811))

(assert (=> b!828426 m!770859))

(declare-fun m!770863 () Bool)

(assert (=> bm!36023 m!770863))

(assert (=> d!104999 m!770747))

(assert (=> b!828308 d!104999))

(declare-fun d!105001 () Bool)

(declare-fun e!461650 () Bool)

(assert (=> d!105001 e!461650))

(declare-fun res!564526 () Bool)

(assert (=> d!105001 (=> (not res!564526) (not e!461650))))

(declare-fun lt!375315 () ListLongMap!8927)

(assert (=> d!105001 (= res!564526 (contains!4172 lt!375315 (_1!5068 (tuple2!10115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(declare-fun lt!375316 () List!15901)

(assert (=> d!105001 (= lt!375315 (ListLongMap!8928 lt!375316))))

(declare-fun lt!375313 () Unit!28329)

(declare-fun lt!375314 () Unit!28329)

(assert (=> d!105001 (= lt!375313 lt!375314)))

(declare-datatypes ((Option!414 0))(
  ( (Some!413 (v!10057 V!25203)) (None!412) )
))
(declare-fun getValueByKey!408 (List!15901 (_ BitVec 64)) Option!414)

(assert (=> d!105001 (= (getValueByKey!408 lt!375316 (_1!5068 (tuple2!10115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))) (Some!413 (_2!5068 (tuple2!10115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(declare-fun lemmaContainsTupThenGetReturnValue!225 (List!15901 (_ BitVec 64) V!25203) Unit!28329)

(assert (=> d!105001 (= lt!375314 (lemmaContainsTupThenGetReturnValue!225 lt!375316 (_1!5068 (tuple2!10115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (_2!5068 (tuple2!10115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(declare-fun insertStrictlySorted!264 (List!15901 (_ BitVec 64) V!25203) List!15901)

(assert (=> d!105001 (= lt!375316 (insertStrictlySorted!264 (toList!4479 lt!375219) (_1!5068 (tuple2!10115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (_2!5068 (tuple2!10115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(assert (=> d!105001 (= (+!1990 lt!375219 (tuple2!10115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) lt!375315)))

(declare-fun b!828440 () Bool)

(declare-fun res!564525 () Bool)

(assert (=> b!828440 (=> (not res!564525) (not e!461650))))

(assert (=> b!828440 (= res!564525 (= (getValueByKey!408 (toList!4479 lt!375315) (_1!5068 (tuple2!10115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))) (Some!413 (_2!5068 (tuple2!10115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)))))))

(declare-fun b!828441 () Bool)

(declare-fun contains!4173 (List!15901 tuple2!10114) Bool)

(assert (=> b!828441 (= e!461650 (contains!4173 (toList!4479 lt!375315) (tuple2!10115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)))))

(assert (= (and d!105001 res!564526) b!828440))

(assert (= (and b!828440 res!564525) b!828441))

(declare-fun m!770865 () Bool)

(assert (=> d!105001 m!770865))

(declare-fun m!770867 () Bool)

(assert (=> d!105001 m!770867))

(declare-fun m!770869 () Bool)

(assert (=> d!105001 m!770869))

(declare-fun m!770871 () Bool)

(assert (=> d!105001 m!770871))

(declare-fun m!770873 () Bool)

(assert (=> b!828440 m!770873))

(declare-fun m!770875 () Bool)

(assert (=> b!828441 m!770875))

(assert (=> b!828308 d!105001))

(declare-fun b!828450 () Bool)

(declare-fun e!461657 () Bool)

(declare-fun e!461659 () Bool)

(assert (=> b!828450 (= e!461657 e!461659)))

(declare-fun c!89587 () Bool)

(assert (=> b!828450 (= c!89587 (validKeyInArray!0 (select (arr!22261 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!828451 () Bool)

(declare-fun e!461658 () Bool)

(declare-fun call!36030 () Bool)

(assert (=> b!828451 (= e!461658 call!36030)))

(declare-fun bm!36027 () Bool)

(assert (=> bm!36027 (= call!36030 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!828452 () Bool)

(assert (=> b!828452 (= e!461659 e!461658)))

(declare-fun lt!375325 () (_ BitVec 64))

(assert (=> b!828452 (= lt!375325 (select (arr!22261 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375323 () Unit!28329)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46439 (_ BitVec 64) (_ BitVec 32)) Unit!28329)

(assert (=> b!828452 (= lt!375323 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!375325 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46439 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!828452 (arrayContainsKey!0 _keys!976 lt!375325 #b00000000000000000000000000000000)))

(declare-fun lt!375324 () Unit!28329)

(assert (=> b!828452 (= lt!375324 lt!375323)))

(declare-fun res!564532 () Bool)

(declare-datatypes ((SeekEntryResult!8735 0))(
  ( (MissingZero!8735 (index!37311 (_ BitVec 32))) (Found!8735 (index!37312 (_ BitVec 32))) (Intermediate!8735 (undefined!9547 Bool) (index!37313 (_ BitVec 32)) (x!69968 (_ BitVec 32))) (Undefined!8735) (MissingVacant!8735 (index!37314 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46439 (_ BitVec 32)) SeekEntryResult!8735)

(assert (=> b!828452 (= res!564532 (= (seekEntryOrOpen!0 (select (arr!22261 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8735 #b00000000000000000000000000000000)))))

(assert (=> b!828452 (=> (not res!564532) (not e!461658))))

(declare-fun d!105003 () Bool)

(declare-fun res!564531 () Bool)

(assert (=> d!105003 (=> res!564531 e!461657)))

(assert (=> d!105003 (= res!564531 (bvsge #b00000000000000000000000000000000 (size!22682 _keys!976)))))

(assert (=> d!105003 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!461657)))

(declare-fun b!828453 () Bool)

(assert (=> b!828453 (= e!461659 call!36030)))

(assert (= (and d!105003 (not res!564531)) b!828450))

(assert (= (and b!828450 c!89587) b!828452))

(assert (= (and b!828450 (not c!89587)) b!828453))

(assert (= (and b!828452 res!564532) b!828451))

(assert (= (or b!828451 b!828453) bm!36027))

(assert (=> b!828450 m!770811))

(assert (=> b!828450 m!770811))

(assert (=> b!828450 m!770813))

(declare-fun m!770877 () Bool)

(assert (=> bm!36027 m!770877))

(assert (=> b!828452 m!770811))

(declare-fun m!770879 () Bool)

(assert (=> b!828452 m!770879))

(declare-fun m!770881 () Bool)

(assert (=> b!828452 m!770881))

(assert (=> b!828452 m!770811))

(declare-fun m!770883 () Bool)

(assert (=> b!828452 m!770883))

(assert (=> b!828305 d!105003))

(declare-fun b!828454 () Bool)

(declare-fun res!564537 () Bool)

(declare-fun e!461667 () Bool)

(assert (=> b!828454 (=> (not res!564537) (not e!461667))))

(declare-fun e!461670 () Bool)

(assert (=> b!828454 (= res!564537 e!461670)))

(declare-fun c!89591 () Bool)

(assert (=> b!828454 (= c!89591 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!36028 () Bool)

(declare-fun call!36031 () Bool)

(declare-fun lt!375332 () ListLongMap!8927)

(assert (=> bm!36028 (= call!36031 (contains!4172 lt!375332 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!828455 () Bool)

(declare-fun e!461663 () Bool)

(assert (=> b!828455 (= e!461663 (not call!36031))))

(declare-fun b!828456 () Bool)

(declare-fun e!461666 () Bool)

(assert (=> b!828456 (= e!461666 (= (apply!367 lt!375332 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!828457 () Bool)

(assert (=> b!828457 (= e!461663 e!461666)))

(declare-fun res!564533 () Bool)

(assert (=> b!828457 (= res!564533 call!36031)))

(assert (=> b!828457 (=> (not res!564533) (not e!461666))))

(declare-fun b!828458 () Bool)

(declare-fun e!461671 () Unit!28329)

(declare-fun lt!375336 () Unit!28329)

(assert (=> b!828458 (= e!461671 lt!375336)))

(declare-fun lt!375341 () ListLongMap!8927)

(assert (=> b!828458 (= lt!375341 (getCurrentListMapNoExtraKeys!2509 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375344 () (_ BitVec 64))

(assert (=> b!828458 (= lt!375344 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375346 () (_ BitVec 64))

(assert (=> b!828458 (= lt!375346 (select (arr!22261 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375333 () Unit!28329)

(assert (=> b!828458 (= lt!375333 (addStillContains!318 lt!375341 lt!375344 zeroValueAfter!34 lt!375346))))

(assert (=> b!828458 (contains!4172 (+!1990 lt!375341 (tuple2!10115 lt!375344 zeroValueAfter!34)) lt!375346)))

(declare-fun lt!375338 () Unit!28329)

(assert (=> b!828458 (= lt!375338 lt!375333)))

(declare-fun lt!375334 () ListLongMap!8927)

(assert (=> b!828458 (= lt!375334 (getCurrentListMapNoExtraKeys!2509 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375326 () (_ BitVec 64))

(assert (=> b!828458 (= lt!375326 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375340 () (_ BitVec 64))

(assert (=> b!828458 (= lt!375340 (select (arr!22261 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375342 () Unit!28329)

(assert (=> b!828458 (= lt!375342 (addApplyDifferent!318 lt!375334 lt!375326 minValue!754 lt!375340))))

(assert (=> b!828458 (= (apply!367 (+!1990 lt!375334 (tuple2!10115 lt!375326 minValue!754)) lt!375340) (apply!367 lt!375334 lt!375340))))

(declare-fun lt!375329 () Unit!28329)

(assert (=> b!828458 (= lt!375329 lt!375342)))

(declare-fun lt!375327 () ListLongMap!8927)

(assert (=> b!828458 (= lt!375327 (getCurrentListMapNoExtraKeys!2509 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375328 () (_ BitVec 64))

(assert (=> b!828458 (= lt!375328 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375337 () (_ BitVec 64))

(assert (=> b!828458 (= lt!375337 (select (arr!22261 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375330 () Unit!28329)

(assert (=> b!828458 (= lt!375330 (addApplyDifferent!318 lt!375327 lt!375328 zeroValueAfter!34 lt!375337))))

(assert (=> b!828458 (= (apply!367 (+!1990 lt!375327 (tuple2!10115 lt!375328 zeroValueAfter!34)) lt!375337) (apply!367 lt!375327 lt!375337))))

(declare-fun lt!375347 () Unit!28329)

(assert (=> b!828458 (= lt!375347 lt!375330)))

(declare-fun lt!375335 () ListLongMap!8927)

(assert (=> b!828458 (= lt!375335 (getCurrentListMapNoExtraKeys!2509 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375343 () (_ BitVec 64))

(assert (=> b!828458 (= lt!375343 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375339 () (_ BitVec 64))

(assert (=> b!828458 (= lt!375339 (select (arr!22261 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!828458 (= lt!375336 (addApplyDifferent!318 lt!375335 lt!375343 minValue!754 lt!375339))))

(assert (=> b!828458 (= (apply!367 (+!1990 lt!375335 (tuple2!10115 lt!375343 minValue!754)) lt!375339) (apply!367 lt!375335 lt!375339))))

(declare-fun b!828459 () Bool)

(assert (=> b!828459 (= e!461667 e!461663)))

(declare-fun c!89588 () Bool)

(assert (=> b!828459 (= c!89588 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!828460 () Bool)

(declare-fun e!461668 () ListLongMap!8927)

(declare-fun e!461669 () ListLongMap!8927)

(assert (=> b!828460 (= e!461668 e!461669)))

(declare-fun c!89590 () Bool)

(assert (=> b!828460 (= c!89590 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!828461 () Bool)

(declare-fun e!461662 () Bool)

(assert (=> b!828461 (= e!461670 e!461662)))

(declare-fun res!564541 () Bool)

(declare-fun call!36035 () Bool)

(assert (=> b!828461 (= res!564541 call!36035)))

(assert (=> b!828461 (=> (not res!564541) (not e!461662))))

(declare-fun b!828462 () Bool)

(declare-fun e!461664 () ListLongMap!8927)

(declare-fun call!36032 () ListLongMap!8927)

(assert (=> b!828462 (= e!461664 call!36032)))

(declare-fun b!828463 () Bool)

(declare-fun call!36034 () ListLongMap!8927)

(assert (=> b!828463 (= e!461668 (+!1990 call!36034 (tuple2!10115 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun bm!36029 () Bool)

(declare-fun call!36037 () ListLongMap!8927)

(assert (=> bm!36029 (= call!36032 call!36037)))

(declare-fun b!828464 () Bool)

(assert (=> b!828464 (= e!461670 (not call!36035))))

(declare-fun b!828465 () Bool)

(declare-fun e!461665 () Bool)

(assert (=> b!828465 (= e!461665 (validKeyInArray!0 (select (arr!22261 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!36030 () Bool)

(assert (=> bm!36030 (= call!36035 (contains!4172 lt!375332 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!36031 () Bool)

(declare-fun call!36033 () ListLongMap!8927)

(assert (=> bm!36031 (= call!36037 call!36033)))

(declare-fun b!828466 () Bool)

(declare-fun e!461672 () Bool)

(declare-fun e!461661 () Bool)

(assert (=> b!828466 (= e!461672 e!461661)))

(declare-fun res!564536 () Bool)

(assert (=> b!828466 (=> (not res!564536) (not e!461661))))

(assert (=> b!828466 (= res!564536 (contains!4172 lt!375332 (select (arr!22261 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!828466 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22682 _keys!976)))))

(declare-fun bm!36032 () Bool)

(assert (=> bm!36032 (= call!36033 (getCurrentListMapNoExtraKeys!2509 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!828467 () Bool)

(assert (=> b!828467 (= e!461661 (= (apply!367 lt!375332 (select (arr!22261 _keys!976) #b00000000000000000000000000000000)) (get!11800 (select (arr!22262 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!828467 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22683 _values!788)))))

(assert (=> b!828467 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22682 _keys!976)))))

(declare-fun b!828468 () Bool)

(declare-fun call!36036 () ListLongMap!8927)

(assert (=> b!828468 (= e!461669 call!36036)))

(declare-fun c!89589 () Bool)

(declare-fun bm!36033 () Bool)

(assert (=> bm!36033 (= call!36034 (+!1990 (ite c!89589 call!36033 (ite c!89590 call!36037 call!36032)) (ite (or c!89589 c!89590) (tuple2!10115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10115 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!828469 () Bool)

(declare-fun Unit!28336 () Unit!28329)

(assert (=> b!828469 (= e!461671 Unit!28336)))

(declare-fun d!105005 () Bool)

(assert (=> d!105005 e!461667))

(declare-fun res!564540 () Bool)

(assert (=> d!105005 (=> (not res!564540) (not e!461667))))

(assert (=> d!105005 (= res!564540 (or (bvsge #b00000000000000000000000000000000 (size!22682 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22682 _keys!976)))))))

(declare-fun lt!375331 () ListLongMap!8927)

(assert (=> d!105005 (= lt!375332 lt!375331)))

(declare-fun lt!375345 () Unit!28329)

(assert (=> d!105005 (= lt!375345 e!461671)))

(declare-fun c!89593 () Bool)

(declare-fun e!461660 () Bool)

(assert (=> d!105005 (= c!89593 e!461660)))

(declare-fun res!564538 () Bool)

(assert (=> d!105005 (=> (not res!564538) (not e!461660))))

(assert (=> d!105005 (= res!564538 (bvslt #b00000000000000000000000000000000 (size!22682 _keys!976)))))

(assert (=> d!105005 (= lt!375331 e!461668)))

(assert (=> d!105005 (= c!89589 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105005 (validMask!0 mask!1312)))

(assert (=> d!105005 (= (getCurrentListMap!2534 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375332)))

(declare-fun b!828470 () Bool)

(declare-fun res!564535 () Bool)

(assert (=> b!828470 (=> (not res!564535) (not e!461667))))

(assert (=> b!828470 (= res!564535 e!461672)))

(declare-fun res!564534 () Bool)

(assert (=> b!828470 (=> res!564534 e!461672)))

(assert (=> b!828470 (= res!564534 (not e!461665))))

(declare-fun res!564539 () Bool)

(assert (=> b!828470 (=> (not res!564539) (not e!461665))))

(assert (=> b!828470 (= res!564539 (bvslt #b00000000000000000000000000000000 (size!22682 _keys!976)))))

(declare-fun b!828471 () Bool)

(assert (=> b!828471 (= e!461662 (= (apply!367 lt!375332 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun b!828472 () Bool)

(declare-fun c!89592 () Bool)

(assert (=> b!828472 (= c!89592 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!828472 (= e!461669 e!461664)))

(declare-fun bm!36034 () Bool)

(assert (=> bm!36034 (= call!36036 call!36034)))

(declare-fun b!828473 () Bool)

(assert (=> b!828473 (= e!461660 (validKeyInArray!0 (select (arr!22261 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!828474 () Bool)

(assert (=> b!828474 (= e!461664 call!36036)))

(assert (= (and d!105005 c!89589) b!828463))

(assert (= (and d!105005 (not c!89589)) b!828460))

(assert (= (and b!828460 c!89590) b!828468))

(assert (= (and b!828460 (not c!89590)) b!828472))

(assert (= (and b!828472 c!89592) b!828474))

(assert (= (and b!828472 (not c!89592)) b!828462))

(assert (= (or b!828474 b!828462) bm!36029))

(assert (= (or b!828468 bm!36029) bm!36031))

(assert (= (or b!828468 b!828474) bm!36034))

(assert (= (or b!828463 bm!36031) bm!36032))

(assert (= (or b!828463 bm!36034) bm!36033))

(assert (= (and d!105005 res!564538) b!828473))

(assert (= (and d!105005 c!89593) b!828458))

(assert (= (and d!105005 (not c!89593)) b!828469))

(assert (= (and d!105005 res!564540) b!828470))

(assert (= (and b!828470 res!564539) b!828465))

(assert (= (and b!828470 (not res!564534)) b!828466))

(assert (= (and b!828466 res!564536) b!828467))

(assert (= (and b!828470 res!564535) b!828454))

(assert (= (and b!828454 c!89591) b!828461))

(assert (= (and b!828454 (not c!89591)) b!828464))

(assert (= (and b!828461 res!564541) b!828471))

(assert (= (or b!828461 b!828464) bm!36030))

(assert (= (and b!828454 res!564537) b!828459))

(assert (= (and b!828459 c!89588) b!828457))

(assert (= (and b!828459 (not c!89588)) b!828455))

(assert (= (and b!828457 res!564533) b!828456))

(assert (= (or b!828457 b!828455) bm!36028))

(declare-fun b_lambda!11211 () Bool)

(assert (=> (not b_lambda!11211) (not b!828467)))

(assert (=> b!828467 t!22254))

(declare-fun b_and!22393 () Bool)

(assert (= b_and!22391 (and (=> t!22254 result!7977) b_and!22393)))

(declare-fun m!770885 () Bool)

(assert (=> b!828471 m!770885))

(assert (=> bm!36032 m!770743))

(assert (=> b!828465 m!770811))

(assert (=> b!828465 m!770811))

(assert (=> b!828465 m!770813))

(assert (=> b!828466 m!770811))

(assert (=> b!828466 m!770811))

(declare-fun m!770887 () Bool)

(assert (=> b!828466 m!770887))

(assert (=> b!828473 m!770811))

(assert (=> b!828473 m!770811))

(assert (=> b!828473 m!770813))

(declare-fun m!770889 () Bool)

(assert (=> bm!36030 m!770889))

(declare-fun m!770891 () Bool)

(assert (=> b!828456 m!770891))

(declare-fun m!770893 () Bool)

(assert (=> bm!36028 m!770893))

(declare-fun m!770895 () Bool)

(assert (=> b!828463 m!770895))

(declare-fun m!770897 () Bool)

(assert (=> b!828458 m!770897))

(declare-fun m!770899 () Bool)

(assert (=> b!828458 m!770899))

(assert (=> b!828458 m!770743))

(declare-fun m!770901 () Bool)

(assert (=> b!828458 m!770901))

(declare-fun m!770903 () Bool)

(assert (=> b!828458 m!770903))

(declare-fun m!770905 () Bool)

(assert (=> b!828458 m!770905))

(declare-fun m!770907 () Bool)

(assert (=> b!828458 m!770907))

(declare-fun m!770909 () Bool)

(assert (=> b!828458 m!770909))

(declare-fun m!770911 () Bool)

(assert (=> b!828458 m!770911))

(declare-fun m!770913 () Bool)

(assert (=> b!828458 m!770913))

(declare-fun m!770915 () Bool)

(assert (=> b!828458 m!770915))

(assert (=> b!828458 m!770811))

(declare-fun m!770917 () Bool)

(assert (=> b!828458 m!770917))

(assert (=> b!828458 m!770907))

(declare-fun m!770919 () Bool)

(assert (=> b!828458 m!770919))

(declare-fun m!770921 () Bool)

(assert (=> b!828458 m!770921))

(assert (=> b!828458 m!770897))

(declare-fun m!770923 () Bool)

(assert (=> b!828458 m!770923))

(assert (=> b!828458 m!770913))

(assert (=> b!828458 m!770911))

(declare-fun m!770925 () Bool)

(assert (=> b!828458 m!770925))

(assert (=> b!828467 m!770811))

(declare-fun m!770927 () Bool)

(assert (=> b!828467 m!770927))

(assert (=> b!828467 m!770857))

(assert (=> b!828467 m!770859))

(assert (=> b!828467 m!770861))

(assert (=> b!828467 m!770857))

(assert (=> b!828467 m!770811))

(assert (=> b!828467 m!770859))

(declare-fun m!770929 () Bool)

(assert (=> bm!36033 m!770929))

(assert (=> d!105005 m!770747))

(assert (=> b!828301 d!105005))

(declare-fun d!105007 () Bool)

(declare-fun e!461673 () Bool)

(assert (=> d!105007 e!461673))

(declare-fun res!564543 () Bool)

(assert (=> d!105007 (=> (not res!564543) (not e!461673))))

(declare-fun lt!375350 () ListLongMap!8927)

(assert (=> d!105007 (= res!564543 (contains!4172 lt!375350 (_1!5068 (tuple2!10115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!375351 () List!15901)

(assert (=> d!105007 (= lt!375350 (ListLongMap!8928 lt!375351))))

(declare-fun lt!375348 () Unit!28329)

(declare-fun lt!375349 () Unit!28329)

(assert (=> d!105007 (= lt!375348 lt!375349)))

(assert (=> d!105007 (= (getValueByKey!408 lt!375351 (_1!5068 (tuple2!10115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!413 (_2!5068 (tuple2!10115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105007 (= lt!375349 (lemmaContainsTupThenGetReturnValue!225 lt!375351 (_1!5068 (tuple2!10115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5068 (tuple2!10115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105007 (= lt!375351 (insertStrictlySorted!264 (toList!4479 lt!375220) (_1!5068 (tuple2!10115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5068 (tuple2!10115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105007 (= (+!1990 lt!375220 (tuple2!10115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!375350)))

(declare-fun b!828475 () Bool)

(declare-fun res!564542 () Bool)

(assert (=> b!828475 (=> (not res!564542) (not e!461673))))

(assert (=> b!828475 (= res!564542 (= (getValueByKey!408 (toList!4479 lt!375350) (_1!5068 (tuple2!10115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!413 (_2!5068 (tuple2!10115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!828476 () Bool)

(assert (=> b!828476 (= e!461673 (contains!4173 (toList!4479 lt!375350) (tuple2!10115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!105007 res!564543) b!828475))

(assert (= (and b!828475 res!564542) b!828476))

(declare-fun m!770931 () Bool)

(assert (=> d!105007 m!770931))

(declare-fun m!770933 () Bool)

(assert (=> d!105007 m!770933))

(declare-fun m!770935 () Bool)

(assert (=> d!105007 m!770935))

(declare-fun m!770937 () Bool)

(assert (=> d!105007 m!770937))

(declare-fun m!770939 () Bool)

(assert (=> b!828475 m!770939))

(declare-fun m!770941 () Bool)

(assert (=> b!828476 m!770941))

(assert (=> b!828301 d!105007))

(declare-fun b!828487 () Bool)

(declare-fun e!461685 () Bool)

(declare-fun contains!4174 (List!15902 (_ BitVec 64)) Bool)

(assert (=> b!828487 (= e!461685 (contains!4174 Nil!15899 (select (arr!22261 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!828488 () Bool)

(declare-fun e!461682 () Bool)

(declare-fun call!36040 () Bool)

(assert (=> b!828488 (= e!461682 call!36040)))

(declare-fun b!828489 () Bool)

(declare-fun e!461683 () Bool)

(declare-fun e!461684 () Bool)

(assert (=> b!828489 (= e!461683 e!461684)))

(declare-fun res!564550 () Bool)

(assert (=> b!828489 (=> (not res!564550) (not e!461684))))

(assert (=> b!828489 (= res!564550 (not e!461685))))

(declare-fun res!564551 () Bool)

(assert (=> b!828489 (=> (not res!564551) (not e!461685))))

(assert (=> b!828489 (= res!564551 (validKeyInArray!0 (select (arr!22261 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!105009 () Bool)

(declare-fun res!564552 () Bool)

(assert (=> d!105009 (=> res!564552 e!461683)))

(assert (=> d!105009 (= res!564552 (bvsge #b00000000000000000000000000000000 (size!22682 _keys!976)))))

(assert (=> d!105009 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15899) e!461683)))

(declare-fun bm!36037 () Bool)

(declare-fun c!89596 () Bool)

(assert (=> bm!36037 (= call!36040 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89596 (Cons!15898 (select (arr!22261 _keys!976) #b00000000000000000000000000000000) Nil!15899) Nil!15899)))))

(declare-fun b!828490 () Bool)

(assert (=> b!828490 (= e!461682 call!36040)))

(declare-fun b!828491 () Bool)

(assert (=> b!828491 (= e!461684 e!461682)))

(assert (=> b!828491 (= c!89596 (validKeyInArray!0 (select (arr!22261 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!105009 (not res!564552)) b!828489))

(assert (= (and b!828489 res!564551) b!828487))

(assert (= (and b!828489 res!564550) b!828491))

(assert (= (and b!828491 c!89596) b!828490))

(assert (= (and b!828491 (not c!89596)) b!828488))

(assert (= (or b!828490 b!828488) bm!36037))

(assert (=> b!828487 m!770811))

(assert (=> b!828487 m!770811))

(declare-fun m!770943 () Bool)

(assert (=> b!828487 m!770943))

(assert (=> b!828489 m!770811))

(assert (=> b!828489 m!770811))

(assert (=> b!828489 m!770813))

(assert (=> bm!36037 m!770811))

(declare-fun m!770945 () Bool)

(assert (=> bm!36037 m!770945))

(assert (=> b!828491 m!770811))

(assert (=> b!828491 m!770811))

(assert (=> b!828491 m!770813))

(assert (=> b!828306 d!105009))

(declare-fun d!105011 () Bool)

(assert (=> d!105011 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!71322 d!105011))

(declare-fun d!105013 () Bool)

(assert (=> d!105013 (= (array_inv!17795 _keys!976) (bvsge (size!22682 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!71322 d!105013))

(declare-fun d!105015 () Bool)

(assert (=> d!105015 (= (array_inv!17796 _values!788) (bvsge (size!22683 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!71322 d!105015))

(declare-fun d!105017 () Bool)

(assert (=> d!105017 (= (getCurrentListMapNoExtraKeys!2509 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2509 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375354 () Unit!28329)

(declare-fun choose!1420 (array!46439 array!46441 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25203 V!25203 V!25203 V!25203 (_ BitVec 32) Int) Unit!28329)

(assert (=> d!105017 (= lt!375354 (choose!1420 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!105017 (validMask!0 mask!1312)))

(assert (=> d!105017 (= (lemmaNoChangeToArrayThenSameMapNoExtras!579 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375354)))

(declare-fun bs!23120 () Bool)

(assert (= bs!23120 d!105017))

(assert (=> bs!23120 m!770745))

(assert (=> bs!23120 m!770743))

(declare-fun m!770947 () Bool)

(assert (=> bs!23120 m!770947))

(assert (=> bs!23120 m!770747))

(assert (=> b!828302 d!105017))

(declare-fun b!828516 () Bool)

(declare-fun e!461706 () Bool)

(declare-fun lt!375375 () ListLongMap!8927)

(declare-fun isEmpty!654 (ListLongMap!8927) Bool)

(assert (=> b!828516 (= e!461706 (isEmpty!654 lt!375375))))

(declare-fun b!828517 () Bool)

(declare-fun e!461704 () ListLongMap!8927)

(declare-fun e!461700 () ListLongMap!8927)

(assert (=> b!828517 (= e!461704 e!461700)))

(declare-fun c!89608 () Bool)

(assert (=> b!828517 (= c!89608 (validKeyInArray!0 (select (arr!22261 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!105019 () Bool)

(declare-fun e!461702 () Bool)

(assert (=> d!105019 e!461702))

(declare-fun res!564562 () Bool)

(assert (=> d!105019 (=> (not res!564562) (not e!461702))))

(assert (=> d!105019 (= res!564562 (not (contains!4172 lt!375375 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105019 (= lt!375375 e!461704)))

(declare-fun c!89606 () Bool)

(assert (=> d!105019 (= c!89606 (bvsge #b00000000000000000000000000000000 (size!22682 _keys!976)))))

(assert (=> d!105019 (validMask!0 mask!1312)))

(assert (=> d!105019 (= (getCurrentListMapNoExtraKeys!2509 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375375)))

(declare-fun bm!36040 () Bool)

(declare-fun call!36043 () ListLongMap!8927)

(assert (=> bm!36040 (= call!36043 (getCurrentListMapNoExtraKeys!2509 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!828518 () Bool)

(assert (=> b!828518 (= e!461704 (ListLongMap!8928 Nil!15898))))

(declare-fun b!828519 () Bool)

(declare-fun res!564564 () Bool)

(assert (=> b!828519 (=> (not res!564564) (not e!461702))))

(assert (=> b!828519 (= res!564564 (not (contains!4172 lt!375375 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!828520 () Bool)

(assert (=> b!828520 (= e!461700 call!36043)))

(declare-fun b!828521 () Bool)

(declare-fun e!461701 () Bool)

(assert (=> b!828521 (= e!461702 e!461701)))

(declare-fun c!89605 () Bool)

(declare-fun e!461705 () Bool)

(assert (=> b!828521 (= c!89605 e!461705)))

(declare-fun res!564561 () Bool)

(assert (=> b!828521 (=> (not res!564561) (not e!461705))))

(assert (=> b!828521 (= res!564561 (bvslt #b00000000000000000000000000000000 (size!22682 _keys!976)))))

(declare-fun b!828522 () Bool)

(assert (=> b!828522 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22682 _keys!976)))))

(assert (=> b!828522 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22683 _values!788)))))

(declare-fun e!461703 () Bool)

(assert (=> b!828522 (= e!461703 (= (apply!367 lt!375375 (select (arr!22261 _keys!976) #b00000000000000000000000000000000)) (get!11800 (select (arr!22262 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!828523 () Bool)

(assert (=> b!828523 (= e!461701 e!461706)))

(declare-fun c!89607 () Bool)

(assert (=> b!828523 (= c!89607 (bvslt #b00000000000000000000000000000000 (size!22682 _keys!976)))))

(declare-fun b!828524 () Bool)

(assert (=> b!828524 (= e!461701 e!461703)))

(assert (=> b!828524 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22682 _keys!976)))))

(declare-fun res!564563 () Bool)

(assert (=> b!828524 (= res!564563 (contains!4172 lt!375375 (select (arr!22261 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!828524 (=> (not res!564563) (not e!461703))))

(declare-fun b!828525 () Bool)

(assert (=> b!828525 (= e!461705 (validKeyInArray!0 (select (arr!22261 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!828525 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!828526 () Bool)

(assert (=> b!828526 (= e!461706 (= lt!375375 (getCurrentListMapNoExtraKeys!2509 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!828527 () Bool)

(declare-fun lt!375373 () Unit!28329)

(declare-fun lt!375369 () Unit!28329)

(assert (=> b!828527 (= lt!375373 lt!375369)))

(declare-fun lt!375371 () ListLongMap!8927)

(declare-fun lt!375370 () (_ BitVec 64))

(declare-fun lt!375372 () (_ BitVec 64))

(declare-fun lt!375374 () V!25203)

(assert (=> b!828527 (not (contains!4172 (+!1990 lt!375371 (tuple2!10115 lt!375372 lt!375374)) lt!375370))))

(declare-fun addStillNotContains!193 (ListLongMap!8927 (_ BitVec 64) V!25203 (_ BitVec 64)) Unit!28329)

(assert (=> b!828527 (= lt!375369 (addStillNotContains!193 lt!375371 lt!375372 lt!375374 lt!375370))))

(assert (=> b!828527 (= lt!375370 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!828527 (= lt!375374 (get!11800 (select (arr!22262 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!828527 (= lt!375372 (select (arr!22261 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!828527 (= lt!375371 call!36043)))

(assert (=> b!828527 (= e!461700 (+!1990 call!36043 (tuple2!10115 (select (arr!22261 _keys!976) #b00000000000000000000000000000000) (get!11800 (select (arr!22262 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!105019 c!89606) b!828518))

(assert (= (and d!105019 (not c!89606)) b!828517))

(assert (= (and b!828517 c!89608) b!828527))

(assert (= (and b!828517 (not c!89608)) b!828520))

(assert (= (or b!828527 b!828520) bm!36040))

(assert (= (and d!105019 res!564562) b!828519))

(assert (= (and b!828519 res!564564) b!828521))

(assert (= (and b!828521 res!564561) b!828525))

(assert (= (and b!828521 c!89605) b!828524))

(assert (= (and b!828521 (not c!89605)) b!828523))

(assert (= (and b!828524 res!564563) b!828522))

(assert (= (and b!828523 c!89607) b!828526))

(assert (= (and b!828523 (not c!89607)) b!828516))

(declare-fun b_lambda!11213 () Bool)

(assert (=> (not b_lambda!11213) (not b!828522)))

(assert (=> b!828522 t!22254))

(declare-fun b_and!22395 () Bool)

(assert (= b_and!22393 (and (=> t!22254 result!7977) b_and!22395)))

(declare-fun b_lambda!11215 () Bool)

(assert (=> (not b_lambda!11215) (not b!828527)))

(assert (=> b!828527 t!22254))

(declare-fun b_and!22397 () Bool)

(assert (= b_and!22395 (and (=> t!22254 result!7977) b_and!22397)))

(declare-fun m!770949 () Bool)

(assert (=> d!105019 m!770949))

(assert (=> d!105019 m!770747))

(assert (=> b!828525 m!770811))

(assert (=> b!828525 m!770811))

(assert (=> b!828525 m!770813))

(declare-fun m!770951 () Bool)

(assert (=> bm!36040 m!770951))

(assert (=> b!828517 m!770811))

(assert (=> b!828517 m!770811))

(assert (=> b!828517 m!770813))

(assert (=> b!828526 m!770951))

(declare-fun m!770953 () Bool)

(assert (=> b!828516 m!770953))

(assert (=> b!828524 m!770811))

(assert (=> b!828524 m!770811))

(declare-fun m!770955 () Bool)

(assert (=> b!828524 m!770955))

(assert (=> b!828522 m!770859))

(assert (=> b!828522 m!770811))

(declare-fun m!770957 () Bool)

(assert (=> b!828522 m!770957))

(assert (=> b!828522 m!770857))

(assert (=> b!828522 m!770857))

(assert (=> b!828522 m!770859))

(assert (=> b!828522 m!770861))

(assert (=> b!828522 m!770811))

(declare-fun m!770959 () Bool)

(assert (=> b!828527 m!770959))

(declare-fun m!770961 () Bool)

(assert (=> b!828527 m!770961))

(assert (=> b!828527 m!770859))

(assert (=> b!828527 m!770857))

(assert (=> b!828527 m!770857))

(assert (=> b!828527 m!770859))

(assert (=> b!828527 m!770861))

(declare-fun m!770963 () Bool)

(assert (=> b!828527 m!770963))

(assert (=> b!828527 m!770811))

(assert (=> b!828527 m!770959))

(declare-fun m!770965 () Bool)

(assert (=> b!828527 m!770965))

(declare-fun m!770967 () Bool)

(assert (=> b!828519 m!770967))

(assert (=> b!828302 d!105019))

(declare-fun b!828528 () Bool)

(declare-fun e!461713 () Bool)

(declare-fun lt!375382 () ListLongMap!8927)

(assert (=> b!828528 (= e!461713 (isEmpty!654 lt!375382))))

(declare-fun b!828529 () Bool)

(declare-fun e!461711 () ListLongMap!8927)

(declare-fun e!461707 () ListLongMap!8927)

(assert (=> b!828529 (= e!461711 e!461707)))

(declare-fun c!89612 () Bool)

(assert (=> b!828529 (= c!89612 (validKeyInArray!0 (select (arr!22261 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!105021 () Bool)

(declare-fun e!461709 () Bool)

(assert (=> d!105021 e!461709))

(declare-fun res!564566 () Bool)

(assert (=> d!105021 (=> (not res!564566) (not e!461709))))

(assert (=> d!105021 (= res!564566 (not (contains!4172 lt!375382 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105021 (= lt!375382 e!461711)))

(declare-fun c!89610 () Bool)

(assert (=> d!105021 (= c!89610 (bvsge #b00000000000000000000000000000000 (size!22682 _keys!976)))))

(assert (=> d!105021 (validMask!0 mask!1312)))

(assert (=> d!105021 (= (getCurrentListMapNoExtraKeys!2509 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375382)))

(declare-fun call!36044 () ListLongMap!8927)

(declare-fun bm!36041 () Bool)

(assert (=> bm!36041 (= call!36044 (getCurrentListMapNoExtraKeys!2509 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!828530 () Bool)

(assert (=> b!828530 (= e!461711 (ListLongMap!8928 Nil!15898))))

(declare-fun b!828531 () Bool)

(declare-fun res!564568 () Bool)

(assert (=> b!828531 (=> (not res!564568) (not e!461709))))

(assert (=> b!828531 (= res!564568 (not (contains!4172 lt!375382 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!828532 () Bool)

(assert (=> b!828532 (= e!461707 call!36044)))

(declare-fun b!828533 () Bool)

(declare-fun e!461708 () Bool)

(assert (=> b!828533 (= e!461709 e!461708)))

(declare-fun c!89609 () Bool)

(declare-fun e!461712 () Bool)

(assert (=> b!828533 (= c!89609 e!461712)))

(declare-fun res!564565 () Bool)

(assert (=> b!828533 (=> (not res!564565) (not e!461712))))

(assert (=> b!828533 (= res!564565 (bvslt #b00000000000000000000000000000000 (size!22682 _keys!976)))))

(declare-fun b!828534 () Bool)

(assert (=> b!828534 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22682 _keys!976)))))

(assert (=> b!828534 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22683 _values!788)))))

(declare-fun e!461710 () Bool)

(assert (=> b!828534 (= e!461710 (= (apply!367 lt!375382 (select (arr!22261 _keys!976) #b00000000000000000000000000000000)) (get!11800 (select (arr!22262 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!828535 () Bool)

(assert (=> b!828535 (= e!461708 e!461713)))

(declare-fun c!89611 () Bool)

(assert (=> b!828535 (= c!89611 (bvslt #b00000000000000000000000000000000 (size!22682 _keys!976)))))

(declare-fun b!828536 () Bool)

(assert (=> b!828536 (= e!461708 e!461710)))

(assert (=> b!828536 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22682 _keys!976)))))

(declare-fun res!564567 () Bool)

(assert (=> b!828536 (= res!564567 (contains!4172 lt!375382 (select (arr!22261 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!828536 (=> (not res!564567) (not e!461710))))

(declare-fun b!828537 () Bool)

(assert (=> b!828537 (= e!461712 (validKeyInArray!0 (select (arr!22261 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!828537 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!828538 () Bool)

(assert (=> b!828538 (= e!461713 (= lt!375382 (getCurrentListMapNoExtraKeys!2509 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!828539 () Bool)

(declare-fun lt!375380 () Unit!28329)

(declare-fun lt!375376 () Unit!28329)

(assert (=> b!828539 (= lt!375380 lt!375376)))

(declare-fun lt!375381 () V!25203)

(declare-fun lt!375379 () (_ BitVec 64))

(declare-fun lt!375378 () ListLongMap!8927)

(declare-fun lt!375377 () (_ BitVec 64))

(assert (=> b!828539 (not (contains!4172 (+!1990 lt!375378 (tuple2!10115 lt!375379 lt!375381)) lt!375377))))

(assert (=> b!828539 (= lt!375376 (addStillNotContains!193 lt!375378 lt!375379 lt!375381 lt!375377))))

(assert (=> b!828539 (= lt!375377 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!828539 (= lt!375381 (get!11800 (select (arr!22262 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!828539 (= lt!375379 (select (arr!22261 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!828539 (= lt!375378 call!36044)))

(assert (=> b!828539 (= e!461707 (+!1990 call!36044 (tuple2!10115 (select (arr!22261 _keys!976) #b00000000000000000000000000000000) (get!11800 (select (arr!22262 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!105021 c!89610) b!828530))

(assert (= (and d!105021 (not c!89610)) b!828529))

(assert (= (and b!828529 c!89612) b!828539))

(assert (= (and b!828529 (not c!89612)) b!828532))

(assert (= (or b!828539 b!828532) bm!36041))

(assert (= (and d!105021 res!564566) b!828531))

(assert (= (and b!828531 res!564568) b!828533))

(assert (= (and b!828533 res!564565) b!828537))

(assert (= (and b!828533 c!89609) b!828536))

(assert (= (and b!828533 (not c!89609)) b!828535))

(assert (= (and b!828536 res!564567) b!828534))

(assert (= (and b!828535 c!89611) b!828538))

(assert (= (and b!828535 (not c!89611)) b!828528))

(declare-fun b_lambda!11217 () Bool)

(assert (=> (not b_lambda!11217) (not b!828534)))

(assert (=> b!828534 t!22254))

(declare-fun b_and!22399 () Bool)

(assert (= b_and!22397 (and (=> t!22254 result!7977) b_and!22399)))

(declare-fun b_lambda!11219 () Bool)

(assert (=> (not b_lambda!11219) (not b!828539)))

(assert (=> b!828539 t!22254))

(declare-fun b_and!22401 () Bool)

(assert (= b_and!22399 (and (=> t!22254 result!7977) b_and!22401)))

(declare-fun m!770969 () Bool)

(assert (=> d!105021 m!770969))

(assert (=> d!105021 m!770747))

(assert (=> b!828537 m!770811))

(assert (=> b!828537 m!770811))

(assert (=> b!828537 m!770813))

(declare-fun m!770971 () Bool)

(assert (=> bm!36041 m!770971))

(assert (=> b!828529 m!770811))

(assert (=> b!828529 m!770811))

(assert (=> b!828529 m!770813))

(assert (=> b!828538 m!770971))

(declare-fun m!770973 () Bool)

(assert (=> b!828528 m!770973))

(assert (=> b!828536 m!770811))

(assert (=> b!828536 m!770811))

(declare-fun m!770975 () Bool)

(assert (=> b!828536 m!770975))

(assert (=> b!828534 m!770859))

(assert (=> b!828534 m!770811))

(declare-fun m!770977 () Bool)

(assert (=> b!828534 m!770977))

(assert (=> b!828534 m!770857))

(assert (=> b!828534 m!770857))

(assert (=> b!828534 m!770859))

(assert (=> b!828534 m!770861))

(assert (=> b!828534 m!770811))

(declare-fun m!770979 () Bool)

(assert (=> b!828539 m!770979))

(declare-fun m!770981 () Bool)

(assert (=> b!828539 m!770981))

(assert (=> b!828539 m!770859))

(assert (=> b!828539 m!770857))

(assert (=> b!828539 m!770857))

(assert (=> b!828539 m!770859))

(assert (=> b!828539 m!770861))

(declare-fun m!770983 () Bool)

(assert (=> b!828539 m!770983))

(assert (=> b!828539 m!770811))

(assert (=> b!828539 m!770979))

(declare-fun m!770985 () Bool)

(assert (=> b!828539 m!770985))

(declare-fun m!770987 () Bool)

(assert (=> b!828531 m!770987))

(assert (=> b!828302 d!105021))

(declare-fun b!828546 () Bool)

(declare-fun e!461718 () Bool)

(assert (=> b!828546 (= e!461718 tp_is_empty!15151)))

(declare-fun mapIsEmpty!24373 () Bool)

(declare-fun mapRes!24373 () Bool)

(assert (=> mapIsEmpty!24373 mapRes!24373))

(declare-fun condMapEmpty!24373 () Bool)

(declare-fun mapDefault!24373 () ValueCell!7160)

(assert (=> mapNonEmpty!24364 (= condMapEmpty!24373 (= mapRest!24364 ((as const (Array (_ BitVec 32) ValueCell!7160)) mapDefault!24373)))))

(declare-fun e!461719 () Bool)

(assert (=> mapNonEmpty!24364 (= tp!47094 (and e!461719 mapRes!24373))))

(declare-fun b!828547 () Bool)

(assert (=> b!828547 (= e!461719 tp_is_empty!15151)))

(declare-fun mapNonEmpty!24373 () Bool)

(declare-fun tp!47110 () Bool)

(assert (=> mapNonEmpty!24373 (= mapRes!24373 (and tp!47110 e!461718))))

(declare-fun mapKey!24373 () (_ BitVec 32))

(declare-fun mapRest!24373 () (Array (_ BitVec 32) ValueCell!7160))

(declare-fun mapValue!24373 () ValueCell!7160)

(assert (=> mapNonEmpty!24373 (= mapRest!24364 (store mapRest!24373 mapKey!24373 mapValue!24373))))

(assert (= (and mapNonEmpty!24364 condMapEmpty!24373) mapIsEmpty!24373))

(assert (= (and mapNonEmpty!24364 (not condMapEmpty!24373)) mapNonEmpty!24373))

(assert (= (and mapNonEmpty!24373 ((_ is ValueCellFull!7160) mapValue!24373)) b!828546))

(assert (= (and mapNonEmpty!24364 ((_ is ValueCellFull!7160) mapDefault!24373)) b!828547))

(declare-fun m!770989 () Bool)

(assert (=> mapNonEmpty!24373 m!770989))

(declare-fun b_lambda!11221 () Bool)

(assert (= b_lambda!11213 (or (and start!71322 b_free!13441) b_lambda!11221)))

(declare-fun b_lambda!11223 () Bool)

(assert (= b_lambda!11215 (or (and start!71322 b_free!13441) b_lambda!11223)))

(declare-fun b_lambda!11225 () Bool)

(assert (= b_lambda!11209 (or (and start!71322 b_free!13441) b_lambda!11225)))

(declare-fun b_lambda!11227 () Bool)

(assert (= b_lambda!11211 (or (and start!71322 b_free!13441) b_lambda!11227)))

(declare-fun b_lambda!11229 () Bool)

(assert (= b_lambda!11217 (or (and start!71322 b_free!13441) b_lambda!11229)))

(declare-fun b_lambda!11231 () Bool)

(assert (= b_lambda!11219 (or (and start!71322 b_free!13441) b_lambda!11231)))

(check-sat (not b_lambda!11231) (not b!828417) (not b_lambda!11227) b_and!22401 (not bm!36028) (not b!828524) (not b_lambda!11225) (not bm!36018) (not b!828539) (not b!828528) (not bm!36037) (not bm!36022) (not b!828516) (not b!828466) (not b!828432) (not b_lambda!11221) (not b!828463) (not d!105017) (not bm!36040) (not d!105007) (not b!828519) (not b!828527) (not b!828422) (not b!828471) (not b!828522) (not bm!36032) (not b!828531) (not b!828526) (not b!828487) (not b!828517) (not mapNonEmpty!24373) (not b!828538) (not b!828473) (not b!828476) (not b!828456) (not bm!36033) tp_is_empty!15151 (not b!828441) (not d!104999) (not b!828467) (not b!828440) (not b_lambda!11223) (not d!105005) (not b!828489) (not b_lambda!11229) (not d!105021) (not d!105001) (not b!828424) (not b!828430) (not b!828458) (not bm!36041) (not bm!36030) (not b!828450) (not b!828426) (not b!828534) (not d!105019) (not b!828475) (not bm!36020) (not b!828425) (not b!828529) (not b!828491) (not b!828525) (not b!828465) (not b!828536) (not b!828537) (not b!828415) (not b_next!13441) (not bm!36027) (not bm!36023) (not b!828452))
(check-sat b_and!22401 (not b_next!13441))
