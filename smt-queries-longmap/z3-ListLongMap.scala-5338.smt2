; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71298 () Bool)

(assert start!71298)

(declare-fun b_free!13435 () Bool)

(declare-fun b_next!13435 () Bool)

(assert (=> start!71298 (= b_free!13435 (not b_next!13435))))

(declare-fun tp!47073 () Bool)

(declare-fun b_and!22367 () Bool)

(assert (=> start!71298 (= tp!47073 b_and!22367)))

(declare-fun b!828050 () Bool)

(declare-fun e!461389 () Bool)

(declare-fun tp_is_empty!15145 () Bool)

(assert (=> b!828050 (= e!461389 tp_is_empty!15145)))

(declare-fun mapNonEmpty!24352 () Bool)

(declare-fun mapRes!24352 () Bool)

(declare-fun tp!47074 () Bool)

(assert (=> mapNonEmpty!24352 (= mapRes!24352 (and tp!47074 e!461389))))

(declare-datatypes ((V!25195 0))(
  ( (V!25196 (val!7620 Int)) )
))
(declare-datatypes ((ValueCell!7157 0))(
  ( (ValueCellFull!7157 (v!10050 V!25195)) (EmptyCell!7157) )
))
(declare-fun mapRest!24352 () (Array (_ BitVec 32) ValueCell!7157))

(declare-datatypes ((array!46427 0))(
  ( (array!46428 (arr!22256 (Array (_ BitVec 32) ValueCell!7157)) (size!22677 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46427)

(declare-fun mapKey!24352 () (_ BitVec 32))

(declare-fun mapValue!24352 () ValueCell!7157)

(assert (=> mapNonEmpty!24352 (= (arr!22256 _values!788) (store mapRest!24352 mapKey!24352 mapValue!24352))))

(declare-fun zeroValueBefore!34 () V!25195)

(declare-fun e!461388 () Bool)

(declare-datatypes ((array!46429 0))(
  ( (array!46430 (arr!22257 (Array (_ BitVec 32) (_ BitVec 64))) (size!22678 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46429)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!25195)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun b!828051 () Bool)

(declare-datatypes ((tuple2!10112 0))(
  ( (tuple2!10113 (_1!5067 (_ BitVec 64)) (_2!5067 V!25195)) )
))
(declare-datatypes ((List!15899 0))(
  ( (Nil!15896) (Cons!15895 (h!17024 tuple2!10112) (t!22243 List!15899)) )
))
(declare-datatypes ((ListLongMap!8925 0))(
  ( (ListLongMap!8926 (toList!4478 List!15899)) )
))
(declare-fun lt!375044 () ListLongMap!8925)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2533 (array!46429 array!46427 (_ BitVec 32) (_ BitVec 32) V!25195 V!25195 (_ BitVec 32) Int) ListLongMap!8925)

(declare-fun +!1989 (ListLongMap!8925 tuple2!10112) ListLongMap!8925)

(assert (=> b!828051 (= e!461388 (= (getCurrentListMap!2533 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (+!1989 lt!375044 (tuple2!10113 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(declare-fun zeroValueAfter!34 () V!25195)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun lt!375045 () ListLongMap!8925)

(assert (=> b!828051 (= lt!375045 (getCurrentListMap!2533 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!828052 () Bool)

(declare-fun e!461386 () Bool)

(declare-fun e!461390 () Bool)

(assert (=> b!828052 (= e!461386 (and e!461390 mapRes!24352))))

(declare-fun condMapEmpty!24352 () Bool)

(declare-fun mapDefault!24352 () ValueCell!7157)

(assert (=> b!828052 (= condMapEmpty!24352 (= (arr!22256 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7157)) mapDefault!24352)))))

(declare-fun mapIsEmpty!24352 () Bool)

(assert (=> mapIsEmpty!24352 mapRes!24352))

(declare-fun b!828053 () Bool)

(declare-fun res!564326 () Bool)

(declare-fun e!461385 () Bool)

(assert (=> b!828053 (=> (not res!564326) (not e!461385))))

(declare-datatypes ((List!15900 0))(
  ( (Nil!15897) (Cons!15896 (h!17025 (_ BitVec 64)) (t!22244 List!15900)) )
))
(declare-fun arrayNoDuplicates!0 (array!46429 (_ BitVec 32) List!15900) Bool)

(assert (=> b!828053 (= res!564326 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15897))))

(declare-fun b!828054 () Bool)

(declare-fun res!564323 () Bool)

(assert (=> b!828054 (=> (not res!564323) (not e!461385))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46429 (_ BitVec 32)) Bool)

(assert (=> b!828054 (= res!564323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!828055 () Bool)

(assert (=> b!828055 (= e!461390 tp_is_empty!15145)))

(declare-fun b!828056 () Bool)

(assert (=> b!828056 (= e!461385 (not e!461388))))

(declare-fun res!564327 () Bool)

(assert (=> b!828056 (=> res!564327 e!461388)))

(assert (=> b!828056 (= res!564327 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!375046 () ListLongMap!8925)

(assert (=> b!828056 (= lt!375044 lt!375046)))

(declare-datatypes ((Unit!28325 0))(
  ( (Unit!28326) )
))
(declare-fun lt!375047 () Unit!28325)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!578 (array!46429 array!46427 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25195 V!25195 V!25195 V!25195 (_ BitVec 32) Int) Unit!28325)

(assert (=> b!828056 (= lt!375047 (lemmaNoChangeToArrayThenSameMapNoExtras!578 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2508 (array!46429 array!46427 (_ BitVec 32) (_ BitVec 32) V!25195 V!25195 (_ BitVec 32) Int) ListLongMap!8925)

(assert (=> b!828056 (= lt!375046 (getCurrentListMapNoExtraKeys!2508 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!828056 (= lt!375044 (getCurrentListMapNoExtraKeys!2508 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!828057 () Bool)

(declare-fun res!564325 () Bool)

(assert (=> b!828057 (=> (not res!564325) (not e!461385))))

(assert (=> b!828057 (= res!564325 (and (= (size!22677 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22678 _keys!976) (size!22677 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!564324 () Bool)

(assert (=> start!71298 (=> (not res!564324) (not e!461385))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71298 (= res!564324 (validMask!0 mask!1312))))

(assert (=> start!71298 e!461385))

(assert (=> start!71298 tp_is_empty!15145))

(declare-fun array_inv!17791 (array!46429) Bool)

(assert (=> start!71298 (array_inv!17791 _keys!976)))

(assert (=> start!71298 true))

(declare-fun array_inv!17792 (array!46427) Bool)

(assert (=> start!71298 (and (array_inv!17792 _values!788) e!461386)))

(assert (=> start!71298 tp!47073))

(assert (= (and start!71298 res!564324) b!828057))

(assert (= (and b!828057 res!564325) b!828054))

(assert (= (and b!828054 res!564323) b!828053))

(assert (= (and b!828053 res!564326) b!828056))

(assert (= (and b!828056 (not res!564327)) b!828051))

(assert (= (and b!828052 condMapEmpty!24352) mapIsEmpty!24352))

(assert (= (and b!828052 (not condMapEmpty!24352)) mapNonEmpty!24352))

(get-info :version)

(assert (= (and mapNonEmpty!24352 ((_ is ValueCellFull!7157) mapValue!24352)) b!828050))

(assert (= (and b!828052 ((_ is ValueCellFull!7157) mapDefault!24352)) b!828055))

(assert (= start!71298 b!828052))

(declare-fun m!770489 () Bool)

(assert (=> start!71298 m!770489))

(declare-fun m!770491 () Bool)

(assert (=> start!71298 m!770491))

(declare-fun m!770493 () Bool)

(assert (=> start!71298 m!770493))

(declare-fun m!770495 () Bool)

(assert (=> b!828051 m!770495))

(declare-fun m!770497 () Bool)

(assert (=> b!828051 m!770497))

(declare-fun m!770499 () Bool)

(assert (=> b!828051 m!770499))

(declare-fun m!770501 () Bool)

(assert (=> b!828056 m!770501))

(declare-fun m!770503 () Bool)

(assert (=> b!828056 m!770503))

(declare-fun m!770505 () Bool)

(assert (=> b!828056 m!770505))

(declare-fun m!770507 () Bool)

(assert (=> b!828054 m!770507))

(declare-fun m!770509 () Bool)

(assert (=> b!828053 m!770509))

(declare-fun m!770511 () Bool)

(assert (=> mapNonEmpty!24352 m!770511))

(check-sat (not b_next!13435) (not b!828056) (not b!828051) tp_is_empty!15145 (not b!828054) (not b!828053) b_and!22367 (not mapNonEmpty!24352) (not start!71298))
(check-sat b_and!22367 (not b_next!13435))
(get-model)

(declare-fun b!828114 () Bool)

(declare-fun e!461434 () Bool)

(declare-fun call!35971 () Bool)

(assert (=> b!828114 (= e!461434 call!35971)))

(declare-fun b!828115 () Bool)

(declare-fun e!461435 () Bool)

(assert (=> b!828115 (= e!461434 e!461435)))

(declare-fun lt!375079 () (_ BitVec 64))

(assert (=> b!828115 (= lt!375079 (select (arr!22257 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375078 () Unit!28325)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46429 (_ BitVec 64) (_ BitVec 32)) Unit!28325)

(assert (=> b!828115 (= lt!375078 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!375079 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46429 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!828115 (arrayContainsKey!0 _keys!976 lt!375079 #b00000000000000000000000000000000)))

(declare-fun lt!375080 () Unit!28325)

(assert (=> b!828115 (= lt!375080 lt!375078)))

(declare-fun res!564363 () Bool)

(declare-datatypes ((SeekEntryResult!8734 0))(
  ( (MissingZero!8734 (index!37307 (_ BitVec 32))) (Found!8734 (index!37308 (_ BitVec 32))) (Intermediate!8734 (undefined!9546 Bool) (index!37309 (_ BitVec 32)) (x!69948 (_ BitVec 32))) (Undefined!8734) (MissingVacant!8734 (index!37310 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46429 (_ BitVec 32)) SeekEntryResult!8734)

(assert (=> b!828115 (= res!564363 (= (seekEntryOrOpen!0 (select (arr!22257 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8734 #b00000000000000000000000000000000)))))

(assert (=> b!828115 (=> (not res!564363) (not e!461435))))

(declare-fun b!828116 () Bool)

(declare-fun e!461433 () Bool)

(assert (=> b!828116 (= e!461433 e!461434)))

(declare-fun c!89523 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!828116 (= c!89523 (validKeyInArray!0 (select (arr!22257 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35968 () Bool)

(assert (=> bm!35968 (= call!35971 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun d!104975 () Bool)

(declare-fun res!564362 () Bool)

(assert (=> d!104975 (=> res!564362 e!461433)))

(assert (=> d!104975 (= res!564362 (bvsge #b00000000000000000000000000000000 (size!22678 _keys!976)))))

(assert (=> d!104975 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!461433)))

(declare-fun b!828117 () Bool)

(assert (=> b!828117 (= e!461435 call!35971)))

(assert (= (and d!104975 (not res!564362)) b!828116))

(assert (= (and b!828116 c!89523) b!828115))

(assert (= (and b!828116 (not c!89523)) b!828114))

(assert (= (and b!828115 res!564363) b!828117))

(assert (= (or b!828117 b!828114) bm!35968))

(declare-fun m!770561 () Bool)

(assert (=> b!828115 m!770561))

(declare-fun m!770563 () Bool)

(assert (=> b!828115 m!770563))

(declare-fun m!770565 () Bool)

(assert (=> b!828115 m!770565))

(assert (=> b!828115 m!770561))

(declare-fun m!770567 () Bool)

(assert (=> b!828115 m!770567))

(assert (=> b!828116 m!770561))

(assert (=> b!828116 m!770561))

(declare-fun m!770569 () Bool)

(assert (=> b!828116 m!770569))

(declare-fun m!770571 () Bool)

(assert (=> bm!35968 m!770571))

(assert (=> b!828054 d!104975))

(declare-fun b!828160 () Bool)

(declare-fun e!461462 () ListLongMap!8925)

(declare-fun call!35990 () ListLongMap!8925)

(assert (=> b!828160 (= e!461462 call!35990)))

(declare-fun b!828161 () Bool)

(declare-fun e!461474 () Bool)

(declare-fun e!461473 () Bool)

(assert (=> b!828161 (= e!461474 e!461473)))

(declare-fun res!564383 () Bool)

(assert (=> b!828161 (=> (not res!564383) (not e!461473))))

(declare-fun lt!375144 () ListLongMap!8925)

(declare-fun contains!4169 (ListLongMap!8925 (_ BitVec 64)) Bool)

(assert (=> b!828161 (= res!564383 (contains!4169 lt!375144 (select (arr!22257 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!828161 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22678 _keys!976)))))

(declare-fun b!828162 () Bool)

(declare-fun e!461463 () Bool)

(declare-fun apply!366 (ListLongMap!8925 (_ BitVec 64)) V!25195)

(assert (=> b!828162 (= e!461463 (= (apply!366 lt!375144 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun d!104977 () Bool)

(declare-fun e!461464 () Bool)

(assert (=> d!104977 e!461464))

(declare-fun res!564390 () Bool)

(assert (=> d!104977 (=> (not res!564390) (not e!461464))))

(assert (=> d!104977 (= res!564390 (or (bvsge #b00000000000000000000000000000000 (size!22678 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22678 _keys!976)))))))

(declare-fun lt!375131 () ListLongMap!8925)

(assert (=> d!104977 (= lt!375144 lt!375131)))

(declare-fun lt!375137 () Unit!28325)

(declare-fun e!461470 () Unit!28325)

(assert (=> d!104977 (= lt!375137 e!461470)))

(declare-fun c!89536 () Bool)

(declare-fun e!461469 () Bool)

(assert (=> d!104977 (= c!89536 e!461469)))

(declare-fun res!564382 () Bool)

(assert (=> d!104977 (=> (not res!564382) (not e!461469))))

(assert (=> d!104977 (= res!564382 (bvslt #b00000000000000000000000000000000 (size!22678 _keys!976)))))

(declare-fun e!461467 () ListLongMap!8925)

(assert (=> d!104977 (= lt!375131 e!461467)))

(declare-fun c!89537 () Bool)

(assert (=> d!104977 (= c!89537 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104977 (validMask!0 mask!1312)))

(assert (=> d!104977 (= (getCurrentListMap!2533 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375144)))

(declare-fun b!828163 () Bool)

(declare-fun call!35991 () ListLongMap!8925)

(assert (=> b!828163 (= e!461462 call!35991)))

(declare-fun bm!35983 () Bool)

(declare-fun call!35989 () Bool)

(assert (=> bm!35983 (= call!35989 (contains!4169 lt!375144 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!828164 () Bool)

(declare-fun e!461472 () ListLongMap!8925)

(assert (=> b!828164 (= e!461467 e!461472)))

(declare-fun c!89540 () Bool)

(assert (=> b!828164 (= c!89540 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!828165 () Bool)

(assert (=> b!828165 (= e!461469 (validKeyInArray!0 (select (arr!22257 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!828166 () Bool)

(declare-fun res!564384 () Bool)

(assert (=> b!828166 (=> (not res!564384) (not e!461464))))

(assert (=> b!828166 (= res!564384 e!461474)))

(declare-fun res!564387 () Bool)

(assert (=> b!828166 (=> res!564387 e!461474)))

(declare-fun e!461468 () Bool)

(assert (=> b!828166 (= res!564387 (not e!461468))))

(declare-fun res!564389 () Bool)

(assert (=> b!828166 (=> (not res!564389) (not e!461468))))

(assert (=> b!828166 (= res!564389 (bvslt #b00000000000000000000000000000000 (size!22678 _keys!976)))))

(declare-fun b!828167 () Bool)

(declare-fun e!461465 () Bool)

(assert (=> b!828167 (= e!461465 (= (apply!366 lt!375144 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!828168 () Bool)

(declare-fun e!461471 () Bool)

(assert (=> b!828168 (= e!461464 e!461471)))

(declare-fun c!89539 () Bool)

(assert (=> b!828168 (= c!89539 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!828169 () Bool)

(declare-fun call!35988 () ListLongMap!8925)

(assert (=> b!828169 (= e!461467 (+!1989 call!35988 (tuple2!10113 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!828170 () Bool)

(declare-fun res!564388 () Bool)

(assert (=> b!828170 (=> (not res!564388) (not e!461464))))

(declare-fun e!461466 () Bool)

(assert (=> b!828170 (= res!564388 e!461466)))

(declare-fun c!89541 () Bool)

(assert (=> b!828170 (= c!89541 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!828171 () Bool)

(declare-fun Unit!28327 () Unit!28325)

(assert (=> b!828171 (= e!461470 Unit!28327)))

(declare-fun call!35992 () ListLongMap!8925)

(declare-fun bm!35984 () Bool)

(assert (=> bm!35984 (= call!35992 (getCurrentListMapNoExtraKeys!2508 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!828172 () Bool)

(assert (=> b!828172 (= e!461466 e!461463)))

(declare-fun res!564385 () Bool)

(assert (=> b!828172 (= res!564385 call!35989)))

(assert (=> b!828172 (=> (not res!564385) (not e!461463))))

(declare-fun b!828173 () Bool)

(declare-fun call!35987 () Bool)

(assert (=> b!828173 (= e!461471 (not call!35987))))

(declare-fun bm!35985 () Bool)

(assert (=> bm!35985 (= call!35987 (contains!4169 lt!375144 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!828174 () Bool)

(assert (=> b!828174 (= e!461472 call!35990)))

(declare-fun bm!35986 () Bool)

(declare-fun call!35986 () ListLongMap!8925)

(assert (=> bm!35986 (= call!35986 call!35992)))

(declare-fun b!828175 () Bool)

(assert (=> b!828175 (= e!461471 e!461465)))

(declare-fun res!564386 () Bool)

(assert (=> b!828175 (= res!564386 call!35987)))

(assert (=> b!828175 (=> (not res!564386) (not e!461465))))

(declare-fun b!828176 () Bool)

(assert (=> b!828176 (= e!461466 (not call!35989))))

(declare-fun b!828177 () Bool)

(declare-fun c!89538 () Bool)

(assert (=> b!828177 (= c!89538 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!828177 (= e!461472 e!461462)))

(declare-fun b!828178 () Bool)

(declare-fun lt!375133 () Unit!28325)

(assert (=> b!828178 (= e!461470 lt!375133)))

(declare-fun lt!375129 () ListLongMap!8925)

(assert (=> b!828178 (= lt!375129 (getCurrentListMapNoExtraKeys!2508 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375134 () (_ BitVec 64))

(assert (=> b!828178 (= lt!375134 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375142 () (_ BitVec 64))

(assert (=> b!828178 (= lt!375142 (select (arr!22257 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375128 () Unit!28325)

(declare-fun addStillContains!317 (ListLongMap!8925 (_ BitVec 64) V!25195 (_ BitVec 64)) Unit!28325)

(assert (=> b!828178 (= lt!375128 (addStillContains!317 lt!375129 lt!375134 zeroValueBefore!34 lt!375142))))

(assert (=> b!828178 (contains!4169 (+!1989 lt!375129 (tuple2!10113 lt!375134 zeroValueBefore!34)) lt!375142)))

(declare-fun lt!375143 () Unit!28325)

(assert (=> b!828178 (= lt!375143 lt!375128)))

(declare-fun lt!375126 () ListLongMap!8925)

(assert (=> b!828178 (= lt!375126 (getCurrentListMapNoExtraKeys!2508 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375125 () (_ BitVec 64))

(assert (=> b!828178 (= lt!375125 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375141 () (_ BitVec 64))

(assert (=> b!828178 (= lt!375141 (select (arr!22257 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375130 () Unit!28325)

(declare-fun addApplyDifferent!317 (ListLongMap!8925 (_ BitVec 64) V!25195 (_ BitVec 64)) Unit!28325)

(assert (=> b!828178 (= lt!375130 (addApplyDifferent!317 lt!375126 lt!375125 minValue!754 lt!375141))))

(assert (=> b!828178 (= (apply!366 (+!1989 lt!375126 (tuple2!10113 lt!375125 minValue!754)) lt!375141) (apply!366 lt!375126 lt!375141))))

(declare-fun lt!375139 () Unit!28325)

(assert (=> b!828178 (= lt!375139 lt!375130)))

(declare-fun lt!375136 () ListLongMap!8925)

(assert (=> b!828178 (= lt!375136 (getCurrentListMapNoExtraKeys!2508 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375135 () (_ BitVec 64))

(assert (=> b!828178 (= lt!375135 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375127 () (_ BitVec 64))

(assert (=> b!828178 (= lt!375127 (select (arr!22257 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375146 () Unit!28325)

(assert (=> b!828178 (= lt!375146 (addApplyDifferent!317 lt!375136 lt!375135 zeroValueBefore!34 lt!375127))))

(assert (=> b!828178 (= (apply!366 (+!1989 lt!375136 (tuple2!10113 lt!375135 zeroValueBefore!34)) lt!375127) (apply!366 lt!375136 lt!375127))))

(declare-fun lt!375132 () Unit!28325)

(assert (=> b!828178 (= lt!375132 lt!375146)))

(declare-fun lt!375145 () ListLongMap!8925)

(assert (=> b!828178 (= lt!375145 (getCurrentListMapNoExtraKeys!2508 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375140 () (_ BitVec 64))

(assert (=> b!828178 (= lt!375140 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375138 () (_ BitVec 64))

(assert (=> b!828178 (= lt!375138 (select (arr!22257 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!828178 (= lt!375133 (addApplyDifferent!317 lt!375145 lt!375140 minValue!754 lt!375138))))

(assert (=> b!828178 (= (apply!366 (+!1989 lt!375145 (tuple2!10113 lt!375140 minValue!754)) lt!375138) (apply!366 lt!375145 lt!375138))))

(declare-fun bm!35987 () Bool)

(assert (=> bm!35987 (= call!35988 (+!1989 (ite c!89537 call!35992 (ite c!89540 call!35986 call!35991)) (ite (or c!89537 c!89540) (tuple2!10113 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10113 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!828179 () Bool)

(assert (=> b!828179 (= e!461468 (validKeyInArray!0 (select (arr!22257 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35988 () Bool)

(assert (=> bm!35988 (= call!35990 call!35988)))

(declare-fun b!828180 () Bool)

(declare-fun get!11797 (ValueCell!7157 V!25195) V!25195)

(declare-fun dynLambda!980 (Int (_ BitVec 64)) V!25195)

(assert (=> b!828180 (= e!461473 (= (apply!366 lt!375144 (select (arr!22257 _keys!976) #b00000000000000000000000000000000)) (get!11797 (select (arr!22256 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!828180 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22677 _values!788)))))

(assert (=> b!828180 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22678 _keys!976)))))

(declare-fun bm!35989 () Bool)

(assert (=> bm!35989 (= call!35991 call!35986)))

(assert (= (and d!104977 c!89537) b!828169))

(assert (= (and d!104977 (not c!89537)) b!828164))

(assert (= (and b!828164 c!89540) b!828174))

(assert (= (and b!828164 (not c!89540)) b!828177))

(assert (= (and b!828177 c!89538) b!828160))

(assert (= (and b!828177 (not c!89538)) b!828163))

(assert (= (or b!828160 b!828163) bm!35989))

(assert (= (or b!828174 bm!35989) bm!35986))

(assert (= (or b!828174 b!828160) bm!35988))

(assert (= (or b!828169 bm!35986) bm!35984))

(assert (= (or b!828169 bm!35988) bm!35987))

(assert (= (and d!104977 res!564382) b!828165))

(assert (= (and d!104977 c!89536) b!828178))

(assert (= (and d!104977 (not c!89536)) b!828171))

(assert (= (and d!104977 res!564390) b!828166))

(assert (= (and b!828166 res!564389) b!828179))

(assert (= (and b!828166 (not res!564387)) b!828161))

(assert (= (and b!828161 res!564383) b!828180))

(assert (= (and b!828166 res!564384) b!828170))

(assert (= (and b!828170 c!89541) b!828172))

(assert (= (and b!828170 (not c!89541)) b!828176))

(assert (= (and b!828172 res!564385) b!828162))

(assert (= (or b!828172 b!828176) bm!35983))

(assert (= (and b!828170 res!564388) b!828168))

(assert (= (and b!828168 c!89539) b!828175))

(assert (= (and b!828168 (not c!89539)) b!828173))

(assert (= (and b!828175 res!564386) b!828167))

(assert (= (or b!828175 b!828173) bm!35985))

(declare-fun b_lambda!11185 () Bool)

(assert (=> (not b_lambda!11185) (not b!828180)))

(declare-fun t!22246 () Bool)

(declare-fun tb!4205 () Bool)

(assert (=> (and start!71298 (= defaultEntry!796 defaultEntry!796) t!22246) tb!4205))

(declare-fun result!7971 () Bool)

(assert (=> tb!4205 (= result!7971 tp_is_empty!15145)))

(assert (=> b!828180 t!22246))

(declare-fun b_and!22373 () Bool)

(assert (= b_and!22367 (and (=> t!22246 result!7971) b_and!22373)))

(assert (=> b!828161 m!770561))

(assert (=> b!828161 m!770561))

(declare-fun m!770573 () Bool)

(assert (=> b!828161 m!770573))

(declare-fun m!770575 () Bool)

(assert (=> bm!35983 m!770575))

(declare-fun m!770577 () Bool)

(assert (=> b!828162 m!770577))

(assert (=> d!104977 m!770489))

(declare-fun m!770579 () Bool)

(assert (=> b!828167 m!770579))

(assert (=> b!828178 m!770505))

(declare-fun m!770581 () Bool)

(assert (=> b!828178 m!770581))

(assert (=> b!828178 m!770561))

(declare-fun m!770583 () Bool)

(assert (=> b!828178 m!770583))

(declare-fun m!770585 () Bool)

(assert (=> b!828178 m!770585))

(declare-fun m!770587 () Bool)

(assert (=> b!828178 m!770587))

(assert (=> b!828178 m!770587))

(declare-fun m!770589 () Bool)

(assert (=> b!828178 m!770589))

(declare-fun m!770591 () Bool)

(assert (=> b!828178 m!770591))

(declare-fun m!770593 () Bool)

(assert (=> b!828178 m!770593))

(declare-fun m!770595 () Bool)

(assert (=> b!828178 m!770595))

(declare-fun m!770597 () Bool)

(assert (=> b!828178 m!770597))

(assert (=> b!828178 m!770591))

(assert (=> b!828178 m!770585))

(declare-fun m!770599 () Bool)

(assert (=> b!828178 m!770599))

(declare-fun m!770601 () Bool)

(assert (=> b!828178 m!770601))

(declare-fun m!770603 () Bool)

(assert (=> b!828178 m!770603))

(assert (=> b!828178 m!770595))

(declare-fun m!770605 () Bool)

(assert (=> b!828178 m!770605))

(declare-fun m!770607 () Bool)

(assert (=> b!828178 m!770607))

(declare-fun m!770609 () Bool)

(assert (=> b!828178 m!770609))

(declare-fun m!770611 () Bool)

(assert (=> bm!35987 m!770611))

(assert (=> b!828179 m!770561))

(assert (=> b!828179 m!770561))

(assert (=> b!828179 m!770569))

(assert (=> bm!35984 m!770505))

(assert (=> b!828165 m!770561))

(assert (=> b!828165 m!770561))

(assert (=> b!828165 m!770569))

(declare-fun m!770613 () Bool)

(assert (=> b!828180 m!770613))

(declare-fun m!770615 () Bool)

(assert (=> b!828180 m!770615))

(declare-fun m!770617 () Bool)

(assert (=> b!828180 m!770617))

(assert (=> b!828180 m!770561))

(declare-fun m!770619 () Bool)

(assert (=> b!828180 m!770619))

(assert (=> b!828180 m!770613))

(assert (=> b!828180 m!770561))

(assert (=> b!828180 m!770615))

(declare-fun m!770621 () Bool)

(assert (=> bm!35985 m!770621))

(declare-fun m!770623 () Bool)

(assert (=> b!828169 m!770623))

(assert (=> b!828051 d!104977))

(declare-fun d!104979 () Bool)

(declare-fun e!461477 () Bool)

(assert (=> d!104979 e!461477))

(declare-fun res!564395 () Bool)

(assert (=> d!104979 (=> (not res!564395) (not e!461477))))

(declare-fun lt!375157 () ListLongMap!8925)

(assert (=> d!104979 (= res!564395 (contains!4169 lt!375157 (_1!5067 (tuple2!10113 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(declare-fun lt!375158 () List!15899)

(assert (=> d!104979 (= lt!375157 (ListLongMap!8926 lt!375158))))

(declare-fun lt!375155 () Unit!28325)

(declare-fun lt!375156 () Unit!28325)

(assert (=> d!104979 (= lt!375155 lt!375156)))

(declare-datatypes ((Option!413 0))(
  ( (Some!412 (v!10053 V!25195)) (None!411) )
))
(declare-fun getValueByKey!407 (List!15899 (_ BitVec 64)) Option!413)

(assert (=> d!104979 (= (getValueByKey!407 lt!375158 (_1!5067 (tuple2!10113 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))) (Some!412 (_2!5067 (tuple2!10113 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(declare-fun lemmaContainsTupThenGetReturnValue!224 (List!15899 (_ BitVec 64) V!25195) Unit!28325)

(assert (=> d!104979 (= lt!375156 (lemmaContainsTupThenGetReturnValue!224 lt!375158 (_1!5067 (tuple2!10113 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (_2!5067 (tuple2!10113 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(declare-fun insertStrictlySorted!263 (List!15899 (_ BitVec 64) V!25195) List!15899)

(assert (=> d!104979 (= lt!375158 (insertStrictlySorted!263 (toList!4478 lt!375044) (_1!5067 (tuple2!10113 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (_2!5067 (tuple2!10113 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(assert (=> d!104979 (= (+!1989 lt!375044 (tuple2!10113 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) lt!375157)))

(declare-fun b!828187 () Bool)

(declare-fun res!564396 () Bool)

(assert (=> b!828187 (=> (not res!564396) (not e!461477))))

(assert (=> b!828187 (= res!564396 (= (getValueByKey!407 (toList!4478 lt!375157) (_1!5067 (tuple2!10113 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))) (Some!412 (_2!5067 (tuple2!10113 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)))))))

(declare-fun b!828188 () Bool)

(declare-fun contains!4170 (List!15899 tuple2!10112) Bool)

(assert (=> b!828188 (= e!461477 (contains!4170 (toList!4478 lt!375157) (tuple2!10113 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)))))

(assert (= (and d!104979 res!564395) b!828187))

(assert (= (and b!828187 res!564396) b!828188))

(declare-fun m!770625 () Bool)

(assert (=> d!104979 m!770625))

(declare-fun m!770627 () Bool)

(assert (=> d!104979 m!770627))

(declare-fun m!770629 () Bool)

(assert (=> d!104979 m!770629))

(declare-fun m!770631 () Bool)

(assert (=> d!104979 m!770631))

(declare-fun m!770633 () Bool)

(assert (=> b!828187 m!770633))

(declare-fun m!770635 () Bool)

(assert (=> b!828188 m!770635))

(assert (=> b!828051 d!104979))

(declare-fun b!828189 () Bool)

(declare-fun e!461478 () ListLongMap!8925)

(declare-fun call!35997 () ListLongMap!8925)

(assert (=> b!828189 (= e!461478 call!35997)))

(declare-fun b!828190 () Bool)

(declare-fun e!461490 () Bool)

(declare-fun e!461489 () Bool)

(assert (=> b!828190 (= e!461490 e!461489)))

(declare-fun res!564398 () Bool)

(assert (=> b!828190 (=> (not res!564398) (not e!461489))))

(declare-fun lt!375178 () ListLongMap!8925)

(assert (=> b!828190 (= res!564398 (contains!4169 lt!375178 (select (arr!22257 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!828190 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22678 _keys!976)))))

(declare-fun b!828191 () Bool)

(declare-fun e!461479 () Bool)

(assert (=> b!828191 (= e!461479 (= (apply!366 lt!375178 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun d!104981 () Bool)

(declare-fun e!461480 () Bool)

(assert (=> d!104981 e!461480))

(declare-fun res!564405 () Bool)

(assert (=> d!104981 (=> (not res!564405) (not e!461480))))

(assert (=> d!104981 (= res!564405 (or (bvsge #b00000000000000000000000000000000 (size!22678 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22678 _keys!976)))))))

(declare-fun lt!375165 () ListLongMap!8925)

(assert (=> d!104981 (= lt!375178 lt!375165)))

(declare-fun lt!375171 () Unit!28325)

(declare-fun e!461486 () Unit!28325)

(assert (=> d!104981 (= lt!375171 e!461486)))

(declare-fun c!89542 () Bool)

(declare-fun e!461485 () Bool)

(assert (=> d!104981 (= c!89542 e!461485)))

(declare-fun res!564397 () Bool)

(assert (=> d!104981 (=> (not res!564397) (not e!461485))))

(assert (=> d!104981 (= res!564397 (bvslt #b00000000000000000000000000000000 (size!22678 _keys!976)))))

(declare-fun e!461483 () ListLongMap!8925)

(assert (=> d!104981 (= lt!375165 e!461483)))

(declare-fun c!89543 () Bool)

(assert (=> d!104981 (= c!89543 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104981 (validMask!0 mask!1312)))

(assert (=> d!104981 (= (getCurrentListMap!2533 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375178)))

(declare-fun b!828192 () Bool)

(declare-fun call!35998 () ListLongMap!8925)

(assert (=> b!828192 (= e!461478 call!35998)))

(declare-fun bm!35990 () Bool)

(declare-fun call!35996 () Bool)

(assert (=> bm!35990 (= call!35996 (contains!4169 lt!375178 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!828193 () Bool)

(declare-fun e!461488 () ListLongMap!8925)

(assert (=> b!828193 (= e!461483 e!461488)))

(declare-fun c!89546 () Bool)

(assert (=> b!828193 (= c!89546 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!828194 () Bool)

(assert (=> b!828194 (= e!461485 (validKeyInArray!0 (select (arr!22257 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!828195 () Bool)

(declare-fun res!564399 () Bool)

(assert (=> b!828195 (=> (not res!564399) (not e!461480))))

(assert (=> b!828195 (= res!564399 e!461490)))

(declare-fun res!564402 () Bool)

(assert (=> b!828195 (=> res!564402 e!461490)))

(declare-fun e!461484 () Bool)

(assert (=> b!828195 (= res!564402 (not e!461484))))

(declare-fun res!564404 () Bool)

(assert (=> b!828195 (=> (not res!564404) (not e!461484))))

(assert (=> b!828195 (= res!564404 (bvslt #b00000000000000000000000000000000 (size!22678 _keys!976)))))

(declare-fun b!828196 () Bool)

(declare-fun e!461481 () Bool)

(assert (=> b!828196 (= e!461481 (= (apply!366 lt!375178 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!828197 () Bool)

(declare-fun e!461487 () Bool)

(assert (=> b!828197 (= e!461480 e!461487)))

(declare-fun c!89545 () Bool)

(assert (=> b!828197 (= c!89545 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!828198 () Bool)

(declare-fun call!35995 () ListLongMap!8925)

(assert (=> b!828198 (= e!461483 (+!1989 call!35995 (tuple2!10113 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!828199 () Bool)

(declare-fun res!564403 () Bool)

(assert (=> b!828199 (=> (not res!564403) (not e!461480))))

(declare-fun e!461482 () Bool)

(assert (=> b!828199 (= res!564403 e!461482)))

(declare-fun c!89547 () Bool)

(assert (=> b!828199 (= c!89547 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!828200 () Bool)

(declare-fun Unit!28328 () Unit!28325)

(assert (=> b!828200 (= e!461486 Unit!28328)))

(declare-fun call!35999 () ListLongMap!8925)

(declare-fun bm!35991 () Bool)

(assert (=> bm!35991 (= call!35999 (getCurrentListMapNoExtraKeys!2508 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!828201 () Bool)

(assert (=> b!828201 (= e!461482 e!461479)))

(declare-fun res!564400 () Bool)

(assert (=> b!828201 (= res!564400 call!35996)))

(assert (=> b!828201 (=> (not res!564400) (not e!461479))))

(declare-fun b!828202 () Bool)

(declare-fun call!35994 () Bool)

(assert (=> b!828202 (= e!461487 (not call!35994))))

(declare-fun bm!35992 () Bool)

(assert (=> bm!35992 (= call!35994 (contains!4169 lt!375178 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!828203 () Bool)

(assert (=> b!828203 (= e!461488 call!35997)))

(declare-fun bm!35993 () Bool)

(declare-fun call!35993 () ListLongMap!8925)

(assert (=> bm!35993 (= call!35993 call!35999)))

(declare-fun b!828204 () Bool)

(assert (=> b!828204 (= e!461487 e!461481)))

(declare-fun res!564401 () Bool)

(assert (=> b!828204 (= res!564401 call!35994)))

(assert (=> b!828204 (=> (not res!564401) (not e!461481))))

(declare-fun b!828205 () Bool)

(assert (=> b!828205 (= e!461482 (not call!35996))))

(declare-fun b!828206 () Bool)

(declare-fun c!89544 () Bool)

(assert (=> b!828206 (= c!89544 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!828206 (= e!461488 e!461478)))

(declare-fun b!828207 () Bool)

(declare-fun lt!375167 () Unit!28325)

(assert (=> b!828207 (= e!461486 lt!375167)))

(declare-fun lt!375163 () ListLongMap!8925)

(assert (=> b!828207 (= lt!375163 (getCurrentListMapNoExtraKeys!2508 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375168 () (_ BitVec 64))

(assert (=> b!828207 (= lt!375168 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375176 () (_ BitVec 64))

(assert (=> b!828207 (= lt!375176 (select (arr!22257 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375162 () Unit!28325)

(assert (=> b!828207 (= lt!375162 (addStillContains!317 lt!375163 lt!375168 zeroValueAfter!34 lt!375176))))

(assert (=> b!828207 (contains!4169 (+!1989 lt!375163 (tuple2!10113 lt!375168 zeroValueAfter!34)) lt!375176)))

(declare-fun lt!375177 () Unit!28325)

(assert (=> b!828207 (= lt!375177 lt!375162)))

(declare-fun lt!375160 () ListLongMap!8925)

(assert (=> b!828207 (= lt!375160 (getCurrentListMapNoExtraKeys!2508 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375159 () (_ BitVec 64))

(assert (=> b!828207 (= lt!375159 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375175 () (_ BitVec 64))

(assert (=> b!828207 (= lt!375175 (select (arr!22257 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375164 () Unit!28325)

(assert (=> b!828207 (= lt!375164 (addApplyDifferent!317 lt!375160 lt!375159 minValue!754 lt!375175))))

(assert (=> b!828207 (= (apply!366 (+!1989 lt!375160 (tuple2!10113 lt!375159 minValue!754)) lt!375175) (apply!366 lt!375160 lt!375175))))

(declare-fun lt!375173 () Unit!28325)

(assert (=> b!828207 (= lt!375173 lt!375164)))

(declare-fun lt!375170 () ListLongMap!8925)

(assert (=> b!828207 (= lt!375170 (getCurrentListMapNoExtraKeys!2508 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375169 () (_ BitVec 64))

(assert (=> b!828207 (= lt!375169 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375161 () (_ BitVec 64))

(assert (=> b!828207 (= lt!375161 (select (arr!22257 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375180 () Unit!28325)

(assert (=> b!828207 (= lt!375180 (addApplyDifferent!317 lt!375170 lt!375169 zeroValueAfter!34 lt!375161))))

(assert (=> b!828207 (= (apply!366 (+!1989 lt!375170 (tuple2!10113 lt!375169 zeroValueAfter!34)) lt!375161) (apply!366 lt!375170 lt!375161))))

(declare-fun lt!375166 () Unit!28325)

(assert (=> b!828207 (= lt!375166 lt!375180)))

(declare-fun lt!375179 () ListLongMap!8925)

(assert (=> b!828207 (= lt!375179 (getCurrentListMapNoExtraKeys!2508 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375174 () (_ BitVec 64))

(assert (=> b!828207 (= lt!375174 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375172 () (_ BitVec 64))

(assert (=> b!828207 (= lt!375172 (select (arr!22257 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!828207 (= lt!375167 (addApplyDifferent!317 lt!375179 lt!375174 minValue!754 lt!375172))))

(assert (=> b!828207 (= (apply!366 (+!1989 lt!375179 (tuple2!10113 lt!375174 minValue!754)) lt!375172) (apply!366 lt!375179 lt!375172))))

(declare-fun bm!35994 () Bool)

(assert (=> bm!35994 (= call!35995 (+!1989 (ite c!89543 call!35999 (ite c!89546 call!35993 call!35998)) (ite (or c!89543 c!89546) (tuple2!10113 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10113 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!828208 () Bool)

(assert (=> b!828208 (= e!461484 (validKeyInArray!0 (select (arr!22257 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35995 () Bool)

(assert (=> bm!35995 (= call!35997 call!35995)))

(declare-fun b!828209 () Bool)

(assert (=> b!828209 (= e!461489 (= (apply!366 lt!375178 (select (arr!22257 _keys!976) #b00000000000000000000000000000000)) (get!11797 (select (arr!22256 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!828209 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22677 _values!788)))))

(assert (=> b!828209 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22678 _keys!976)))))

(declare-fun bm!35996 () Bool)

(assert (=> bm!35996 (= call!35998 call!35993)))

(assert (= (and d!104981 c!89543) b!828198))

(assert (= (and d!104981 (not c!89543)) b!828193))

(assert (= (and b!828193 c!89546) b!828203))

(assert (= (and b!828193 (not c!89546)) b!828206))

(assert (= (and b!828206 c!89544) b!828189))

(assert (= (and b!828206 (not c!89544)) b!828192))

(assert (= (or b!828189 b!828192) bm!35996))

(assert (= (or b!828203 bm!35996) bm!35993))

(assert (= (or b!828203 b!828189) bm!35995))

(assert (= (or b!828198 bm!35993) bm!35991))

(assert (= (or b!828198 bm!35995) bm!35994))

(assert (= (and d!104981 res!564397) b!828194))

(assert (= (and d!104981 c!89542) b!828207))

(assert (= (and d!104981 (not c!89542)) b!828200))

(assert (= (and d!104981 res!564405) b!828195))

(assert (= (and b!828195 res!564404) b!828208))

(assert (= (and b!828195 (not res!564402)) b!828190))

(assert (= (and b!828190 res!564398) b!828209))

(assert (= (and b!828195 res!564399) b!828199))

(assert (= (and b!828199 c!89547) b!828201))

(assert (= (and b!828199 (not c!89547)) b!828205))

(assert (= (and b!828201 res!564400) b!828191))

(assert (= (or b!828201 b!828205) bm!35990))

(assert (= (and b!828199 res!564403) b!828197))

(assert (= (and b!828197 c!89545) b!828204))

(assert (= (and b!828197 (not c!89545)) b!828202))

(assert (= (and b!828204 res!564401) b!828196))

(assert (= (or b!828204 b!828202) bm!35992))

(declare-fun b_lambda!11187 () Bool)

(assert (=> (not b_lambda!11187) (not b!828209)))

(assert (=> b!828209 t!22246))

(declare-fun b_and!22375 () Bool)

(assert (= b_and!22373 (and (=> t!22246 result!7971) b_and!22375)))

(assert (=> b!828190 m!770561))

(assert (=> b!828190 m!770561))

(declare-fun m!770637 () Bool)

(assert (=> b!828190 m!770637))

(declare-fun m!770639 () Bool)

(assert (=> bm!35990 m!770639))

(declare-fun m!770641 () Bool)

(assert (=> b!828191 m!770641))

(assert (=> d!104981 m!770489))

(declare-fun m!770643 () Bool)

(assert (=> b!828196 m!770643))

(assert (=> b!828207 m!770503))

(declare-fun m!770645 () Bool)

(assert (=> b!828207 m!770645))

(assert (=> b!828207 m!770561))

(declare-fun m!770647 () Bool)

(assert (=> b!828207 m!770647))

(declare-fun m!770649 () Bool)

(assert (=> b!828207 m!770649))

(declare-fun m!770651 () Bool)

(assert (=> b!828207 m!770651))

(assert (=> b!828207 m!770651))

(declare-fun m!770653 () Bool)

(assert (=> b!828207 m!770653))

(declare-fun m!770655 () Bool)

(assert (=> b!828207 m!770655))

(declare-fun m!770657 () Bool)

(assert (=> b!828207 m!770657))

(declare-fun m!770659 () Bool)

(assert (=> b!828207 m!770659))

(declare-fun m!770661 () Bool)

(assert (=> b!828207 m!770661))

(assert (=> b!828207 m!770655))

(assert (=> b!828207 m!770649))

(declare-fun m!770663 () Bool)

(assert (=> b!828207 m!770663))

(declare-fun m!770665 () Bool)

(assert (=> b!828207 m!770665))

(declare-fun m!770667 () Bool)

(assert (=> b!828207 m!770667))

(assert (=> b!828207 m!770659))

(declare-fun m!770669 () Bool)

(assert (=> b!828207 m!770669))

(declare-fun m!770671 () Bool)

(assert (=> b!828207 m!770671))

(declare-fun m!770673 () Bool)

(assert (=> b!828207 m!770673))

(declare-fun m!770675 () Bool)

(assert (=> bm!35994 m!770675))

(assert (=> b!828208 m!770561))

(assert (=> b!828208 m!770561))

(assert (=> b!828208 m!770569))

(assert (=> bm!35991 m!770503))

(assert (=> b!828194 m!770561))

(assert (=> b!828194 m!770561))

(assert (=> b!828194 m!770569))

(assert (=> b!828209 m!770613))

(assert (=> b!828209 m!770615))

(assert (=> b!828209 m!770617))

(assert (=> b!828209 m!770561))

(declare-fun m!770677 () Bool)

(assert (=> b!828209 m!770677))

(assert (=> b!828209 m!770613))

(assert (=> b!828209 m!770561))

(assert (=> b!828209 m!770615))

(declare-fun m!770679 () Bool)

(assert (=> bm!35992 m!770679))

(declare-fun m!770681 () Bool)

(assert (=> b!828198 m!770681))

(assert (=> b!828051 d!104981))

(declare-fun d!104983 () Bool)

(assert (=> d!104983 (= (getCurrentListMapNoExtraKeys!2508 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2508 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375183 () Unit!28325)

(declare-fun choose!1419 (array!46429 array!46427 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25195 V!25195 V!25195 V!25195 (_ BitVec 32) Int) Unit!28325)

(assert (=> d!104983 (= lt!375183 (choose!1419 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!104983 (validMask!0 mask!1312)))

(assert (=> d!104983 (= (lemmaNoChangeToArrayThenSameMapNoExtras!578 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375183)))

(declare-fun bs!23116 () Bool)

(assert (= bs!23116 d!104983))

(assert (=> bs!23116 m!770505))

(assert (=> bs!23116 m!770503))

(declare-fun m!770683 () Bool)

(assert (=> bs!23116 m!770683))

(assert (=> bs!23116 m!770489))

(assert (=> b!828056 d!104983))

(declare-fun b!828234 () Bool)

(declare-fun e!461509 () Bool)

(declare-fun e!461511 () Bool)

(assert (=> b!828234 (= e!461509 e!461511)))

(declare-fun c!89558 () Bool)

(declare-fun e!461508 () Bool)

(assert (=> b!828234 (= c!89558 e!461508)))

(declare-fun res!564415 () Bool)

(assert (=> b!828234 (=> (not res!564415) (not e!461508))))

(assert (=> b!828234 (= res!564415 (bvslt #b00000000000000000000000000000000 (size!22678 _keys!976)))))

(declare-fun b!828235 () Bool)

(declare-fun e!461506 () Bool)

(declare-fun lt!375199 () ListLongMap!8925)

(declare-fun isEmpty!653 (ListLongMap!8925) Bool)

(assert (=> b!828235 (= e!461506 (isEmpty!653 lt!375199))))

(declare-fun b!828236 () Bool)

(assert (=> b!828236 (= e!461506 (= lt!375199 (getCurrentListMapNoExtraKeys!2508 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!828237 () Bool)

(declare-fun e!461507 () ListLongMap!8925)

(declare-fun e!461505 () ListLongMap!8925)

(assert (=> b!828237 (= e!461507 e!461505)))

(declare-fun c!89559 () Bool)

(assert (=> b!828237 (= c!89559 (validKeyInArray!0 (select (arr!22257 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!828238 () Bool)

(assert (=> b!828238 (= e!461511 e!461506)))

(declare-fun c!89557 () Bool)

(assert (=> b!828238 (= c!89557 (bvslt #b00000000000000000000000000000000 (size!22678 _keys!976)))))

(declare-fun b!828240 () Bool)

(declare-fun call!36002 () ListLongMap!8925)

(assert (=> b!828240 (= e!461505 call!36002)))

(declare-fun b!828241 () Bool)

(declare-fun lt!375198 () Unit!28325)

(declare-fun lt!375202 () Unit!28325)

(assert (=> b!828241 (= lt!375198 lt!375202)))

(declare-fun lt!375203 () ListLongMap!8925)

(declare-fun lt!375204 () (_ BitVec 64))

(declare-fun lt!375200 () V!25195)

(declare-fun lt!375201 () (_ BitVec 64))

(assert (=> b!828241 (not (contains!4169 (+!1989 lt!375203 (tuple2!10113 lt!375204 lt!375200)) lt!375201))))

(declare-fun addStillNotContains!192 (ListLongMap!8925 (_ BitVec 64) V!25195 (_ BitVec 64)) Unit!28325)

(assert (=> b!828241 (= lt!375202 (addStillNotContains!192 lt!375203 lt!375204 lt!375200 lt!375201))))

(assert (=> b!828241 (= lt!375201 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!828241 (= lt!375200 (get!11797 (select (arr!22256 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!828241 (= lt!375204 (select (arr!22257 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!828241 (= lt!375203 call!36002)))

(assert (=> b!828241 (= e!461505 (+!1989 call!36002 (tuple2!10113 (select (arr!22257 _keys!976) #b00000000000000000000000000000000) (get!11797 (select (arr!22256 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!35999 () Bool)

(assert (=> bm!35999 (= call!36002 (getCurrentListMapNoExtraKeys!2508 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!828242 () Bool)

(declare-fun res!564414 () Bool)

(assert (=> b!828242 (=> (not res!564414) (not e!461509))))

(assert (=> b!828242 (= res!564414 (not (contains!4169 lt!375199 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!828243 () Bool)

(assert (=> b!828243 (= e!461508 (validKeyInArray!0 (select (arr!22257 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!828243 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!828244 () Bool)

(assert (=> b!828244 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22678 _keys!976)))))

(assert (=> b!828244 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22677 _values!788)))))

(declare-fun e!461510 () Bool)

(assert (=> b!828244 (= e!461510 (= (apply!366 lt!375199 (select (arr!22257 _keys!976) #b00000000000000000000000000000000)) (get!11797 (select (arr!22256 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!828245 () Bool)

(assert (=> b!828245 (= e!461507 (ListLongMap!8926 Nil!15896))))

(declare-fun b!828239 () Bool)

(assert (=> b!828239 (= e!461511 e!461510)))

(assert (=> b!828239 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22678 _keys!976)))))

(declare-fun res!564416 () Bool)

(assert (=> b!828239 (= res!564416 (contains!4169 lt!375199 (select (arr!22257 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!828239 (=> (not res!564416) (not e!461510))))

(declare-fun d!104985 () Bool)

(assert (=> d!104985 e!461509))

(declare-fun res!564417 () Bool)

(assert (=> d!104985 (=> (not res!564417) (not e!461509))))

(assert (=> d!104985 (= res!564417 (not (contains!4169 lt!375199 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104985 (= lt!375199 e!461507)))

(declare-fun c!89556 () Bool)

(assert (=> d!104985 (= c!89556 (bvsge #b00000000000000000000000000000000 (size!22678 _keys!976)))))

(assert (=> d!104985 (validMask!0 mask!1312)))

(assert (=> d!104985 (= (getCurrentListMapNoExtraKeys!2508 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375199)))

(assert (= (and d!104985 c!89556) b!828245))

(assert (= (and d!104985 (not c!89556)) b!828237))

(assert (= (and b!828237 c!89559) b!828241))

(assert (= (and b!828237 (not c!89559)) b!828240))

(assert (= (or b!828241 b!828240) bm!35999))

(assert (= (and d!104985 res!564417) b!828242))

(assert (= (and b!828242 res!564414) b!828234))

(assert (= (and b!828234 res!564415) b!828243))

(assert (= (and b!828234 c!89558) b!828239))

(assert (= (and b!828234 (not c!89558)) b!828238))

(assert (= (and b!828239 res!564416) b!828244))

(assert (= (and b!828238 c!89557) b!828236))

(assert (= (and b!828238 (not c!89557)) b!828235))

(declare-fun b_lambda!11189 () Bool)

(assert (=> (not b_lambda!11189) (not b!828241)))

(assert (=> b!828241 t!22246))

(declare-fun b_and!22377 () Bool)

(assert (= b_and!22375 (and (=> t!22246 result!7971) b_and!22377)))

(declare-fun b_lambda!11191 () Bool)

(assert (=> (not b_lambda!11191) (not b!828244)))

(assert (=> b!828244 t!22246))

(declare-fun b_and!22379 () Bool)

(assert (= b_and!22377 (and (=> t!22246 result!7971) b_and!22379)))

(declare-fun m!770685 () Bool)

(assert (=> bm!35999 m!770685))

(declare-fun m!770687 () Bool)

(assert (=> d!104985 m!770687))

(assert (=> d!104985 m!770489))

(assert (=> b!828244 m!770615))

(assert (=> b!828244 m!770613))

(assert (=> b!828244 m!770561))

(declare-fun m!770689 () Bool)

(assert (=> b!828244 m!770689))

(assert (=> b!828244 m!770561))

(assert (=> b!828244 m!770613))

(assert (=> b!828244 m!770615))

(assert (=> b!828244 m!770617))

(assert (=> b!828236 m!770685))

(declare-fun m!770691 () Bool)

(assert (=> b!828242 m!770691))

(declare-fun m!770693 () Bool)

(assert (=> b!828235 m!770693))

(assert (=> b!828239 m!770561))

(assert (=> b!828239 m!770561))

(declare-fun m!770695 () Bool)

(assert (=> b!828239 m!770695))

(assert (=> b!828241 m!770615))

(assert (=> b!828241 m!770613))

(declare-fun m!770697 () Bool)

(assert (=> b!828241 m!770697))

(declare-fun m!770699 () Bool)

(assert (=> b!828241 m!770699))

(declare-fun m!770701 () Bool)

(assert (=> b!828241 m!770701))

(declare-fun m!770703 () Bool)

(assert (=> b!828241 m!770703))

(assert (=> b!828241 m!770613))

(assert (=> b!828241 m!770615))

(assert (=> b!828241 m!770617))

(assert (=> b!828241 m!770561))

(assert (=> b!828241 m!770697))

(assert (=> b!828243 m!770561))

(assert (=> b!828243 m!770561))

(assert (=> b!828243 m!770569))

(assert (=> b!828237 m!770561))

(assert (=> b!828237 m!770561))

(assert (=> b!828237 m!770569))

(assert (=> b!828056 d!104985))

(declare-fun b!828246 () Bool)

(declare-fun e!461516 () Bool)

(declare-fun e!461518 () Bool)

(assert (=> b!828246 (= e!461516 e!461518)))

(declare-fun c!89562 () Bool)

(declare-fun e!461515 () Bool)

(assert (=> b!828246 (= c!89562 e!461515)))

(declare-fun res!564419 () Bool)

(assert (=> b!828246 (=> (not res!564419) (not e!461515))))

(assert (=> b!828246 (= res!564419 (bvslt #b00000000000000000000000000000000 (size!22678 _keys!976)))))

(declare-fun b!828247 () Bool)

(declare-fun e!461513 () Bool)

(declare-fun lt!375206 () ListLongMap!8925)

(assert (=> b!828247 (= e!461513 (isEmpty!653 lt!375206))))

(declare-fun b!828248 () Bool)

(assert (=> b!828248 (= e!461513 (= lt!375206 (getCurrentListMapNoExtraKeys!2508 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!828249 () Bool)

(declare-fun e!461514 () ListLongMap!8925)

(declare-fun e!461512 () ListLongMap!8925)

(assert (=> b!828249 (= e!461514 e!461512)))

(declare-fun c!89563 () Bool)

(assert (=> b!828249 (= c!89563 (validKeyInArray!0 (select (arr!22257 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!828250 () Bool)

(assert (=> b!828250 (= e!461518 e!461513)))

(declare-fun c!89561 () Bool)

(assert (=> b!828250 (= c!89561 (bvslt #b00000000000000000000000000000000 (size!22678 _keys!976)))))

(declare-fun b!828252 () Bool)

(declare-fun call!36003 () ListLongMap!8925)

(assert (=> b!828252 (= e!461512 call!36003)))

(declare-fun b!828253 () Bool)

(declare-fun lt!375205 () Unit!28325)

(declare-fun lt!375209 () Unit!28325)

(assert (=> b!828253 (= lt!375205 lt!375209)))

(declare-fun lt!375207 () V!25195)

(declare-fun lt!375208 () (_ BitVec 64))

(declare-fun lt!375210 () ListLongMap!8925)

(declare-fun lt!375211 () (_ BitVec 64))

(assert (=> b!828253 (not (contains!4169 (+!1989 lt!375210 (tuple2!10113 lt!375211 lt!375207)) lt!375208))))

(assert (=> b!828253 (= lt!375209 (addStillNotContains!192 lt!375210 lt!375211 lt!375207 lt!375208))))

(assert (=> b!828253 (= lt!375208 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!828253 (= lt!375207 (get!11797 (select (arr!22256 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!828253 (= lt!375211 (select (arr!22257 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!828253 (= lt!375210 call!36003)))

(assert (=> b!828253 (= e!461512 (+!1989 call!36003 (tuple2!10113 (select (arr!22257 _keys!976) #b00000000000000000000000000000000) (get!11797 (select (arr!22256 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!36000 () Bool)

(assert (=> bm!36000 (= call!36003 (getCurrentListMapNoExtraKeys!2508 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!828254 () Bool)

(declare-fun res!564418 () Bool)

(assert (=> b!828254 (=> (not res!564418) (not e!461516))))

(assert (=> b!828254 (= res!564418 (not (contains!4169 lt!375206 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!828255 () Bool)

(assert (=> b!828255 (= e!461515 (validKeyInArray!0 (select (arr!22257 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!828255 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!828256 () Bool)

(assert (=> b!828256 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22678 _keys!976)))))

(assert (=> b!828256 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22677 _values!788)))))

(declare-fun e!461517 () Bool)

(assert (=> b!828256 (= e!461517 (= (apply!366 lt!375206 (select (arr!22257 _keys!976) #b00000000000000000000000000000000)) (get!11797 (select (arr!22256 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!828257 () Bool)

(assert (=> b!828257 (= e!461514 (ListLongMap!8926 Nil!15896))))

(declare-fun b!828251 () Bool)

(assert (=> b!828251 (= e!461518 e!461517)))

(assert (=> b!828251 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22678 _keys!976)))))

(declare-fun res!564420 () Bool)

(assert (=> b!828251 (= res!564420 (contains!4169 lt!375206 (select (arr!22257 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!828251 (=> (not res!564420) (not e!461517))))

(declare-fun d!104987 () Bool)

(assert (=> d!104987 e!461516))

(declare-fun res!564421 () Bool)

(assert (=> d!104987 (=> (not res!564421) (not e!461516))))

(assert (=> d!104987 (= res!564421 (not (contains!4169 lt!375206 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104987 (= lt!375206 e!461514)))

(declare-fun c!89560 () Bool)

(assert (=> d!104987 (= c!89560 (bvsge #b00000000000000000000000000000000 (size!22678 _keys!976)))))

(assert (=> d!104987 (validMask!0 mask!1312)))

(assert (=> d!104987 (= (getCurrentListMapNoExtraKeys!2508 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375206)))

(assert (= (and d!104987 c!89560) b!828257))

(assert (= (and d!104987 (not c!89560)) b!828249))

(assert (= (and b!828249 c!89563) b!828253))

(assert (= (and b!828249 (not c!89563)) b!828252))

(assert (= (or b!828253 b!828252) bm!36000))

(assert (= (and d!104987 res!564421) b!828254))

(assert (= (and b!828254 res!564418) b!828246))

(assert (= (and b!828246 res!564419) b!828255))

(assert (= (and b!828246 c!89562) b!828251))

(assert (= (and b!828246 (not c!89562)) b!828250))

(assert (= (and b!828251 res!564420) b!828256))

(assert (= (and b!828250 c!89561) b!828248))

(assert (= (and b!828250 (not c!89561)) b!828247))

(declare-fun b_lambda!11193 () Bool)

(assert (=> (not b_lambda!11193) (not b!828253)))

(assert (=> b!828253 t!22246))

(declare-fun b_and!22381 () Bool)

(assert (= b_and!22379 (and (=> t!22246 result!7971) b_and!22381)))

(declare-fun b_lambda!11195 () Bool)

(assert (=> (not b_lambda!11195) (not b!828256)))

(assert (=> b!828256 t!22246))

(declare-fun b_and!22383 () Bool)

(assert (= b_and!22381 (and (=> t!22246 result!7971) b_and!22383)))

(declare-fun m!770705 () Bool)

(assert (=> bm!36000 m!770705))

(declare-fun m!770707 () Bool)

(assert (=> d!104987 m!770707))

(assert (=> d!104987 m!770489))

(assert (=> b!828256 m!770615))

(assert (=> b!828256 m!770613))

(assert (=> b!828256 m!770561))

(declare-fun m!770709 () Bool)

(assert (=> b!828256 m!770709))

(assert (=> b!828256 m!770561))

(assert (=> b!828256 m!770613))

(assert (=> b!828256 m!770615))

(assert (=> b!828256 m!770617))

(assert (=> b!828248 m!770705))

(declare-fun m!770711 () Bool)

(assert (=> b!828254 m!770711))

(declare-fun m!770713 () Bool)

(assert (=> b!828247 m!770713))

(assert (=> b!828251 m!770561))

(assert (=> b!828251 m!770561))

(declare-fun m!770715 () Bool)

(assert (=> b!828251 m!770715))

(assert (=> b!828253 m!770615))

(assert (=> b!828253 m!770613))

(declare-fun m!770717 () Bool)

(assert (=> b!828253 m!770717))

(declare-fun m!770719 () Bool)

(assert (=> b!828253 m!770719))

(declare-fun m!770721 () Bool)

(assert (=> b!828253 m!770721))

(declare-fun m!770723 () Bool)

(assert (=> b!828253 m!770723))

(assert (=> b!828253 m!770613))

(assert (=> b!828253 m!770615))

(assert (=> b!828253 m!770617))

(assert (=> b!828253 m!770561))

(assert (=> b!828253 m!770717))

(assert (=> b!828255 m!770561))

(assert (=> b!828255 m!770561))

(assert (=> b!828255 m!770569))

(assert (=> b!828249 m!770561))

(assert (=> b!828249 m!770561))

(assert (=> b!828249 m!770569))

(assert (=> b!828056 d!104987))

(declare-fun d!104989 () Bool)

(assert (=> d!104989 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!71298 d!104989))

(declare-fun d!104991 () Bool)

(assert (=> d!104991 (= (array_inv!17791 _keys!976) (bvsge (size!22678 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!71298 d!104991))

(declare-fun d!104993 () Bool)

(assert (=> d!104993 (= (array_inv!17792 _values!788) (bvsge (size!22677 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!71298 d!104993))

(declare-fun d!104995 () Bool)

(declare-fun res!564428 () Bool)

(declare-fun e!461527 () Bool)

(assert (=> d!104995 (=> res!564428 e!461527)))

(assert (=> d!104995 (= res!564428 (bvsge #b00000000000000000000000000000000 (size!22678 _keys!976)))))

(assert (=> d!104995 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15897) e!461527)))

(declare-fun b!828268 () Bool)

(declare-fun e!461530 () Bool)

(declare-fun call!36006 () Bool)

(assert (=> b!828268 (= e!461530 call!36006)))

(declare-fun bm!36003 () Bool)

(declare-fun c!89566 () Bool)

(assert (=> bm!36003 (= call!36006 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89566 (Cons!15896 (select (arr!22257 _keys!976) #b00000000000000000000000000000000) Nil!15897) Nil!15897)))))

(declare-fun b!828269 () Bool)

(assert (=> b!828269 (= e!461530 call!36006)))

(declare-fun b!828270 () Bool)

(declare-fun e!461528 () Bool)

(assert (=> b!828270 (= e!461527 e!461528)))

(declare-fun res!564429 () Bool)

(assert (=> b!828270 (=> (not res!564429) (not e!461528))))

(declare-fun e!461529 () Bool)

(assert (=> b!828270 (= res!564429 (not e!461529))))

(declare-fun res!564430 () Bool)

(assert (=> b!828270 (=> (not res!564430) (not e!461529))))

(assert (=> b!828270 (= res!564430 (validKeyInArray!0 (select (arr!22257 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!828271 () Bool)

(declare-fun contains!4171 (List!15900 (_ BitVec 64)) Bool)

(assert (=> b!828271 (= e!461529 (contains!4171 Nil!15897 (select (arr!22257 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!828272 () Bool)

(assert (=> b!828272 (= e!461528 e!461530)))

(assert (=> b!828272 (= c!89566 (validKeyInArray!0 (select (arr!22257 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!104995 (not res!564428)) b!828270))

(assert (= (and b!828270 res!564430) b!828271))

(assert (= (and b!828270 res!564429) b!828272))

(assert (= (and b!828272 c!89566) b!828269))

(assert (= (and b!828272 (not c!89566)) b!828268))

(assert (= (or b!828269 b!828268) bm!36003))

(assert (=> bm!36003 m!770561))

(declare-fun m!770725 () Bool)

(assert (=> bm!36003 m!770725))

(assert (=> b!828270 m!770561))

(assert (=> b!828270 m!770561))

(assert (=> b!828270 m!770569))

(assert (=> b!828271 m!770561))

(assert (=> b!828271 m!770561))

(declare-fun m!770727 () Bool)

(assert (=> b!828271 m!770727))

(assert (=> b!828272 m!770561))

(assert (=> b!828272 m!770561))

(assert (=> b!828272 m!770569))

(assert (=> b!828053 d!104995))

(declare-fun b!828279 () Bool)

(declare-fun e!461536 () Bool)

(assert (=> b!828279 (= e!461536 tp_is_empty!15145)))

(declare-fun mapIsEmpty!24361 () Bool)

(declare-fun mapRes!24361 () Bool)

(assert (=> mapIsEmpty!24361 mapRes!24361))

(declare-fun condMapEmpty!24361 () Bool)

(declare-fun mapDefault!24361 () ValueCell!7157)

(assert (=> mapNonEmpty!24352 (= condMapEmpty!24361 (= mapRest!24352 ((as const (Array (_ BitVec 32) ValueCell!7157)) mapDefault!24361)))))

(declare-fun e!461535 () Bool)

(assert (=> mapNonEmpty!24352 (= tp!47074 (and e!461535 mapRes!24361))))

(declare-fun b!828280 () Bool)

(assert (=> b!828280 (= e!461535 tp_is_empty!15145)))

(declare-fun mapNonEmpty!24361 () Bool)

(declare-fun tp!47089 () Bool)

(assert (=> mapNonEmpty!24361 (= mapRes!24361 (and tp!47089 e!461536))))

(declare-fun mapRest!24361 () (Array (_ BitVec 32) ValueCell!7157))

(declare-fun mapKey!24361 () (_ BitVec 32))

(declare-fun mapValue!24361 () ValueCell!7157)

(assert (=> mapNonEmpty!24361 (= mapRest!24352 (store mapRest!24361 mapKey!24361 mapValue!24361))))

(assert (= (and mapNonEmpty!24352 condMapEmpty!24361) mapIsEmpty!24361))

(assert (= (and mapNonEmpty!24352 (not condMapEmpty!24361)) mapNonEmpty!24361))

(assert (= (and mapNonEmpty!24361 ((_ is ValueCellFull!7157) mapValue!24361)) b!828279))

(assert (= (and mapNonEmpty!24352 ((_ is ValueCellFull!7157) mapDefault!24361)) b!828280))

(declare-fun m!770729 () Bool)

(assert (=> mapNonEmpty!24361 m!770729))

(declare-fun b_lambda!11197 () Bool)

(assert (= b_lambda!11193 (or (and start!71298 b_free!13435) b_lambda!11197)))

(declare-fun b_lambda!11199 () Bool)

(assert (= b_lambda!11185 (or (and start!71298 b_free!13435) b_lambda!11199)))

(declare-fun b_lambda!11201 () Bool)

(assert (= b_lambda!11189 (or (and start!71298 b_free!13435) b_lambda!11201)))

(declare-fun b_lambda!11203 () Bool)

(assert (= b_lambda!11195 (or (and start!71298 b_free!13435) b_lambda!11203)))

(declare-fun b_lambda!11205 () Bool)

(assert (= b_lambda!11191 (or (and start!71298 b_free!13435) b_lambda!11205)))

(declare-fun b_lambda!11207 () Bool)

(assert (= b_lambda!11187 (or (and start!71298 b_free!13435) b_lambda!11207)))

(check-sat (not bm!35983) (not b_lambda!11205) (not b!828178) (not b!828188) (not b!828237) b_and!22383 (not b!828196) (not b!828207) (not d!104981) (not bm!36003) (not b!828161) (not b_lambda!11207) (not bm!35987) (not bm!35999) (not b!828116) (not b!828242) (not b!828270) (not b!828187) (not b!828247) (not b!828271) (not b!828162) (not bm!35984) (not b_lambda!11203) (not d!104985) (not b_next!13435) (not b!828236) (not b!828179) (not b!828251) (not b!828194) (not b!828253) (not d!104979) (not b!828272) (not b!828167) (not b!828209) (not b!828191) (not d!104977) (not mapNonEmpty!24361) (not bm!35985) (not b!828165) (not b!828248) (not d!104987) (not b!828235) (not d!104983) (not b!828255) (not b!828249) (not b!828244) (not b!828239) (not b_lambda!11199) (not bm!35994) (not bm!35990) tp_is_empty!15145 (not b!828180) (not b!828190) (not b!828254) (not b_lambda!11201) (not b_lambda!11197) (not b!828169) (not b!828198) (not bm!35992) (not b!828208) (not bm!35968) (not b!828241) (not b!828256) (not b!828243) (not bm!35991) (not b!828115) (not bm!36000))
(check-sat b_and!22383 (not b_next!13435))
