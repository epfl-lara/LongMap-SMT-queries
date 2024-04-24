; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71568 () Bool)

(assert start!71568)

(declare-fun b_free!13465 () Bool)

(declare-fun b_next!13465 () Bool)

(assert (=> start!71568 (= b_free!13465 (not b_next!13465))))

(declare-fun tp!47173 () Bool)

(declare-fun b_and!22469 () Bool)

(assert (=> start!71568 (= tp!47173 b_and!22469)))

(declare-fun b!830126 () Bool)

(declare-fun res!565274 () Bool)

(declare-fun e!462770 () Bool)

(assert (=> b!830126 (=> (not res!565274) (not e!462770))))

(declare-datatypes ((array!46527 0))(
  ( (array!46528 (arr!22298 (Array (_ BitVec 32) (_ BitVec 64))) (size!22718 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46527)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46527 (_ BitVec 32)) Bool)

(assert (=> b!830126 (= res!565274 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!830127 () Bool)

(declare-fun e!462765 () Bool)

(declare-fun tp_is_empty!15175 () Bool)

(assert (=> b!830127 (= e!462765 tp_is_empty!15175)))

(declare-datatypes ((V!25235 0))(
  ( (V!25236 (val!7635 Int)) )
))
(declare-fun zeroValueAfter!34 () V!25235)

(declare-fun minValue!754 () V!25235)

(declare-datatypes ((ValueCell!7172 0))(
  ( (ValueCellFull!7172 (v!10074 V!25235)) (EmptyCell!7172) )
))
(declare-datatypes ((array!46529 0))(
  ( (array!46530 (arr!22299 (Array (_ BitVec 32) ValueCell!7172)) (size!22719 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46529)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun b!830128 () Bool)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!10050 0))(
  ( (tuple2!10051 (_1!5036 (_ BitVec 64)) (_2!5036 V!25235)) )
))
(declare-datatypes ((List!15824 0))(
  ( (Nil!15821) (Cons!15820 (h!16955 tuple2!10050) (t!22175 List!15824)) )
))
(declare-datatypes ((ListLongMap!8875 0))(
  ( (ListLongMap!8876 (toList!4453 List!15824)) )
))
(declare-fun lt!376325 () ListLongMap!8875)

(declare-fun e!462766 () Bool)

(declare-fun getCurrentListMap!2548 (array!46527 array!46529 (_ BitVec 32) (_ BitVec 32) V!25235 V!25235 (_ BitVec 32) Int) ListLongMap!8875)

(declare-fun +!1976 (ListLongMap!8875 tuple2!10050) ListLongMap!8875)

(assert (=> b!830128 (= e!462766 (= (getCurrentListMap!2548 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (+!1976 (+!1976 lt!376325 (tuple2!10051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (tuple2!10051 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun mapNonEmpty!24406 () Bool)

(declare-fun mapRes!24406 () Bool)

(declare-fun tp!47172 () Bool)

(declare-fun e!462767 () Bool)

(assert (=> mapNonEmpty!24406 (= mapRes!24406 (and tp!47172 e!462767))))

(declare-fun mapKey!24406 () (_ BitVec 32))

(declare-fun mapValue!24406 () ValueCell!7172)

(declare-fun mapRest!24406 () (Array (_ BitVec 32) ValueCell!7172))

(assert (=> mapNonEmpty!24406 (= (arr!22299 _values!788) (store mapRest!24406 mapKey!24406 mapValue!24406))))

(declare-fun b!830129 () Bool)

(declare-fun e!462764 () Bool)

(assert (=> b!830129 (= e!462764 (and e!462765 mapRes!24406))))

(declare-fun condMapEmpty!24406 () Bool)

(declare-fun mapDefault!24406 () ValueCell!7172)

(assert (=> b!830129 (= condMapEmpty!24406 (= (arr!22299 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7172)) mapDefault!24406)))))

(declare-fun b!830130 () Bool)

(assert (=> b!830130 (= e!462767 tp_is_empty!15175)))

(declare-fun e!462769 () Bool)

(declare-fun zeroValueBefore!34 () V!25235)

(declare-fun b!830131 () Bool)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!830131 (= e!462769 (= (getCurrentListMap!2548 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (+!1976 lt!376325 (tuple2!10051 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!830132 () Bool)

(assert (=> b!830132 (= e!462770 (not e!462766))))

(declare-fun res!565272 () Bool)

(assert (=> b!830132 (=> res!565272 e!462766)))

(assert (=> b!830132 (= res!565272 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun e!462768 () Bool)

(assert (=> b!830132 e!462768))

(declare-fun res!565276 () Bool)

(assert (=> b!830132 (=> (not res!565276) (not e!462768))))

(declare-fun lt!376326 () ListLongMap!8875)

(assert (=> b!830132 (= res!565276 (= lt!376325 lt!376326))))

(declare-datatypes ((Unit!28422 0))(
  ( (Unit!28423) )
))
(declare-fun lt!376324 () Unit!28422)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!594 (array!46527 array!46529 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25235 V!25235 V!25235 V!25235 (_ BitVec 32) Int) Unit!28422)

(assert (=> b!830132 (= lt!376324 (lemmaNoChangeToArrayThenSameMapNoExtras!594 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2527 (array!46527 array!46529 (_ BitVec 32) (_ BitVec 32) V!25235 V!25235 (_ BitVec 32) Int) ListLongMap!8875)

(assert (=> b!830132 (= lt!376326 (getCurrentListMapNoExtraKeys!2527 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!830132 (= lt!376325 (getCurrentListMapNoExtraKeys!2527 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!565271 () Bool)

(assert (=> start!71568 (=> (not res!565271) (not e!462770))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71568 (= res!565271 (validMask!0 mask!1312))))

(assert (=> start!71568 e!462770))

(assert (=> start!71568 tp_is_empty!15175))

(declare-fun array_inv!17803 (array!46527) Bool)

(assert (=> start!71568 (array_inv!17803 _keys!976)))

(assert (=> start!71568 true))

(declare-fun array_inv!17804 (array!46529) Bool)

(assert (=> start!71568 (and (array_inv!17804 _values!788) e!462764)))

(assert (=> start!71568 tp!47173))

(declare-fun b!830133 () Bool)

(declare-fun res!565270 () Bool)

(assert (=> b!830133 (=> (not res!565270) (not e!462770))))

(assert (=> b!830133 (= res!565270 (and (= (size!22719 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22718 _keys!976) (size!22719 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!830134 () Bool)

(declare-fun res!565275 () Bool)

(assert (=> b!830134 (=> (not res!565275) (not e!462770))))

(declare-datatypes ((List!15825 0))(
  ( (Nil!15822) (Cons!15821 (h!16956 (_ BitVec 64)) (t!22176 List!15825)) )
))
(declare-fun arrayNoDuplicates!0 (array!46527 (_ BitVec 32) List!15825) Bool)

(assert (=> b!830134 (= res!565275 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15822))))

(declare-fun b!830135 () Bool)

(assert (=> b!830135 (= e!462768 e!462769)))

(declare-fun res!565273 () Bool)

(assert (=> b!830135 (=> res!565273 e!462769)))

(assert (=> b!830135 (= res!565273 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!24406 () Bool)

(assert (=> mapIsEmpty!24406 mapRes!24406))

(assert (= (and start!71568 res!565271) b!830133))

(assert (= (and b!830133 res!565270) b!830126))

(assert (= (and b!830126 res!565274) b!830134))

(assert (= (and b!830134 res!565275) b!830132))

(assert (= (and b!830132 res!565276) b!830135))

(assert (= (and b!830135 (not res!565273)) b!830131))

(assert (= (and b!830132 (not res!565272)) b!830128))

(assert (= (and b!830129 condMapEmpty!24406) mapIsEmpty!24406))

(assert (= (and b!830129 (not condMapEmpty!24406)) mapNonEmpty!24406))

(get-info :version)

(assert (= (and mapNonEmpty!24406 ((_ is ValueCellFull!7172) mapValue!24406)) b!830130))

(assert (= (and b!830129 ((_ is ValueCellFull!7172) mapDefault!24406)) b!830127))

(assert (= start!71568 b!830129))

(declare-fun m!773489 () Bool)

(assert (=> b!830128 m!773489))

(declare-fun m!773491 () Bool)

(assert (=> b!830128 m!773491))

(assert (=> b!830128 m!773491))

(declare-fun m!773493 () Bool)

(assert (=> b!830128 m!773493))

(declare-fun m!773495 () Bool)

(assert (=> start!71568 m!773495))

(declare-fun m!773497 () Bool)

(assert (=> start!71568 m!773497))

(declare-fun m!773499 () Bool)

(assert (=> start!71568 m!773499))

(declare-fun m!773501 () Bool)

(assert (=> mapNonEmpty!24406 m!773501))

(declare-fun m!773503 () Bool)

(assert (=> b!830132 m!773503))

(declare-fun m!773505 () Bool)

(assert (=> b!830132 m!773505))

(declare-fun m!773507 () Bool)

(assert (=> b!830132 m!773507))

(declare-fun m!773509 () Bool)

(assert (=> b!830134 m!773509))

(declare-fun m!773511 () Bool)

(assert (=> b!830126 m!773511))

(declare-fun m!773513 () Bool)

(assert (=> b!830131 m!773513))

(declare-fun m!773515 () Bool)

(assert (=> b!830131 m!773515))

(check-sat (not mapNonEmpty!24406) b_and!22469 (not b!830131) tp_is_empty!15175 (not b!830132) (not b!830128) (not start!71568) (not b_next!13465) (not b!830126) (not b!830134))
(check-sat b_and!22469 (not b_next!13465))
(get-model)

(declare-fun bm!36165 () Bool)

(declare-fun call!36172 () ListLongMap!8875)

(declare-fun call!36169 () ListLongMap!8875)

(assert (=> bm!36165 (= call!36172 call!36169)))

(declare-fun b!830238 () Bool)

(declare-fun e!462848 () Unit!28422)

(declare-fun Unit!28424 () Unit!28422)

(assert (=> b!830238 (= e!462848 Unit!28424)))

(declare-fun b!830239 () Bool)

(declare-fun res!565343 () Bool)

(declare-fun e!462852 () Bool)

(assert (=> b!830239 (=> (not res!565343) (not e!462852))))

(declare-fun e!462847 () Bool)

(assert (=> b!830239 (= res!565343 e!462847)))

(declare-fun c!90022 () Bool)

(assert (=> b!830239 (= c!90022 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!376408 () ListLongMap!8875)

(declare-fun e!462857 () Bool)

(declare-fun b!830240 () Bool)

(declare-fun apply!369 (ListLongMap!8875 (_ BitVec 64)) V!25235)

(declare-fun get!11807 (ValueCell!7172 V!25235) V!25235)

(declare-fun dynLambda!977 (Int (_ BitVec 64)) V!25235)

(assert (=> b!830240 (= e!462857 (= (apply!369 lt!376408 (select (arr!22298 _keys!976) #b00000000000000000000000000000000)) (get!11807 (select (arr!22299 _values!788) #b00000000000000000000000000000000) (dynLambda!977 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!830240 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22719 _values!788)))))

(assert (=> b!830240 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22718 _keys!976)))))

(declare-fun b!830242 () Bool)

(declare-fun e!462851 () Bool)

(assert (=> b!830242 (= e!462851 e!462857)))

(declare-fun res!565341 () Bool)

(assert (=> b!830242 (=> (not res!565341) (not e!462857))))

(declare-fun contains!4177 (ListLongMap!8875 (_ BitVec 64)) Bool)

(assert (=> b!830242 (= res!565341 (contains!4177 lt!376408 (select (arr!22298 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!830242 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22718 _keys!976)))))

(declare-fun b!830243 () Bool)

(declare-fun c!90020 () Bool)

(assert (=> b!830243 (= c!90020 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!462853 () ListLongMap!8875)

(declare-fun e!462854 () ListLongMap!8875)

(assert (=> b!830243 (= e!462853 e!462854)))

(declare-fun b!830244 () Bool)

(declare-fun lt!376406 () Unit!28422)

(assert (=> b!830244 (= e!462848 lt!376406)))

(declare-fun lt!376403 () ListLongMap!8875)

(assert (=> b!830244 (= lt!376403 (getCurrentListMapNoExtraKeys!2527 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376399 () (_ BitVec 64))

(assert (=> b!830244 (= lt!376399 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376390 () (_ BitVec 64))

(assert (=> b!830244 (= lt!376390 (select (arr!22298 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376396 () Unit!28422)

(declare-fun addStillContains!320 (ListLongMap!8875 (_ BitVec 64) V!25235 (_ BitVec 64)) Unit!28422)

(assert (=> b!830244 (= lt!376396 (addStillContains!320 lt!376403 lt!376399 zeroValueBefore!34 lt!376390))))

(assert (=> b!830244 (contains!4177 (+!1976 lt!376403 (tuple2!10051 lt!376399 zeroValueBefore!34)) lt!376390)))

(declare-fun lt!376410 () Unit!28422)

(assert (=> b!830244 (= lt!376410 lt!376396)))

(declare-fun lt!376393 () ListLongMap!8875)

(assert (=> b!830244 (= lt!376393 (getCurrentListMapNoExtraKeys!2527 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376391 () (_ BitVec 64))

(assert (=> b!830244 (= lt!376391 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376394 () (_ BitVec 64))

(assert (=> b!830244 (= lt!376394 (select (arr!22298 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376398 () Unit!28422)

(declare-fun addApplyDifferent!320 (ListLongMap!8875 (_ BitVec 64) V!25235 (_ BitVec 64)) Unit!28422)

(assert (=> b!830244 (= lt!376398 (addApplyDifferent!320 lt!376393 lt!376391 minValue!754 lt!376394))))

(assert (=> b!830244 (= (apply!369 (+!1976 lt!376393 (tuple2!10051 lt!376391 minValue!754)) lt!376394) (apply!369 lt!376393 lt!376394))))

(declare-fun lt!376400 () Unit!28422)

(assert (=> b!830244 (= lt!376400 lt!376398)))

(declare-fun lt!376405 () ListLongMap!8875)

(assert (=> b!830244 (= lt!376405 (getCurrentListMapNoExtraKeys!2527 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376397 () (_ BitVec 64))

(assert (=> b!830244 (= lt!376397 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376389 () (_ BitVec 64))

(assert (=> b!830244 (= lt!376389 (select (arr!22298 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376392 () Unit!28422)

(assert (=> b!830244 (= lt!376392 (addApplyDifferent!320 lt!376405 lt!376397 zeroValueBefore!34 lt!376389))))

(assert (=> b!830244 (= (apply!369 (+!1976 lt!376405 (tuple2!10051 lt!376397 zeroValueBefore!34)) lt!376389) (apply!369 lt!376405 lt!376389))))

(declare-fun lt!376407 () Unit!28422)

(assert (=> b!830244 (= lt!376407 lt!376392)))

(declare-fun lt!376402 () ListLongMap!8875)

(assert (=> b!830244 (= lt!376402 (getCurrentListMapNoExtraKeys!2527 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376395 () (_ BitVec 64))

(assert (=> b!830244 (= lt!376395 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376409 () (_ BitVec 64))

(assert (=> b!830244 (= lt!376409 (select (arr!22298 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!830244 (= lt!376406 (addApplyDifferent!320 lt!376402 lt!376395 minValue!754 lt!376409))))

(assert (=> b!830244 (= (apply!369 (+!1976 lt!376402 (tuple2!10051 lt!376395 minValue!754)) lt!376409) (apply!369 lt!376402 lt!376409))))

(declare-fun b!830245 () Bool)

(declare-fun call!36173 () ListLongMap!8875)

(assert (=> b!830245 (= e!462854 call!36173)))

(declare-fun b!830246 () Bool)

(declare-fun call!36170 () Bool)

(assert (=> b!830246 (= e!462847 (not call!36170))))

(declare-fun b!830247 () Bool)

(declare-fun e!462846 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!830247 (= e!462846 (validKeyInArray!0 (select (arr!22298 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830248 () Bool)

(declare-fun e!462856 () Bool)

(assert (=> b!830248 (= e!462856 (validKeyInArray!0 (select (arr!22298 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!36166 () Bool)

(assert (=> bm!36166 (= call!36170 (contains!4177 lt!376408 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!36167 () Bool)

(declare-fun call!36174 () ListLongMap!8875)

(assert (=> bm!36167 (= call!36173 call!36174)))

(declare-fun b!830249 () Bool)

(declare-fun e!462855 () ListLongMap!8875)

(assert (=> b!830249 (= e!462855 (+!1976 call!36169 (tuple2!10051 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!830250 () Bool)

(declare-fun e!462845 () Bool)

(assert (=> b!830250 (= e!462845 (= (apply!369 lt!376408 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun d!105569 () Bool)

(assert (=> d!105569 e!462852))

(declare-fun res!565345 () Bool)

(assert (=> d!105569 (=> (not res!565345) (not e!462852))))

(assert (=> d!105569 (= res!565345 (or (bvsge #b00000000000000000000000000000000 (size!22718 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22718 _keys!976)))))))

(declare-fun lt!376401 () ListLongMap!8875)

(assert (=> d!105569 (= lt!376408 lt!376401)))

(declare-fun lt!376404 () Unit!28422)

(assert (=> d!105569 (= lt!376404 e!462848)))

(declare-fun c!90019 () Bool)

(assert (=> d!105569 (= c!90019 e!462846)))

(declare-fun res!565338 () Bool)

(assert (=> d!105569 (=> (not res!565338) (not e!462846))))

(assert (=> d!105569 (= res!565338 (bvslt #b00000000000000000000000000000000 (size!22718 _keys!976)))))

(assert (=> d!105569 (= lt!376401 e!462855)))

(declare-fun c!90018 () Bool)

(assert (=> d!105569 (= c!90018 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105569 (validMask!0 mask!1312)))

(assert (=> d!105569 (= (getCurrentListMap!2548 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376408)))

(declare-fun b!830241 () Bool)

(declare-fun e!462850 () Bool)

(assert (=> b!830241 (= e!462850 (= (apply!369 lt!376408 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun b!830251 () Bool)

(assert (=> b!830251 (= e!462854 call!36172)))

(declare-fun b!830252 () Bool)

(assert (=> b!830252 (= e!462855 e!462853)))

(declare-fun c!90021 () Bool)

(assert (=> b!830252 (= c!90021 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!36168 () Bool)

(declare-fun call!36168 () ListLongMap!8875)

(assert (=> bm!36168 (= call!36174 call!36168)))

(declare-fun b!830253 () Bool)

(assert (=> b!830253 (= e!462847 e!462850)))

(declare-fun res!565340 () Bool)

(assert (=> b!830253 (= res!565340 call!36170)))

(assert (=> b!830253 (=> (not res!565340) (not e!462850))))

(declare-fun bm!36169 () Bool)

(assert (=> bm!36169 (= call!36169 (+!1976 (ite c!90018 call!36168 (ite c!90021 call!36174 call!36173)) (ite (or c!90018 c!90021) (tuple2!10051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10051 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun bm!36170 () Bool)

(assert (=> bm!36170 (= call!36168 (getCurrentListMapNoExtraKeys!2527 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!830254 () Bool)

(declare-fun e!462849 () Bool)

(assert (=> b!830254 (= e!462849 e!462845)))

(declare-fun res!565344 () Bool)

(declare-fun call!36171 () Bool)

(assert (=> b!830254 (= res!565344 call!36171)))

(assert (=> b!830254 (=> (not res!565344) (not e!462845))))

(declare-fun b!830255 () Bool)

(declare-fun res!565339 () Bool)

(assert (=> b!830255 (=> (not res!565339) (not e!462852))))

(assert (=> b!830255 (= res!565339 e!462851)))

(declare-fun res!565337 () Bool)

(assert (=> b!830255 (=> res!565337 e!462851)))

(assert (=> b!830255 (= res!565337 (not e!462856))))

(declare-fun res!565342 () Bool)

(assert (=> b!830255 (=> (not res!565342) (not e!462856))))

(assert (=> b!830255 (= res!565342 (bvslt #b00000000000000000000000000000000 (size!22718 _keys!976)))))

(declare-fun b!830256 () Bool)

(assert (=> b!830256 (= e!462852 e!462849)))

(declare-fun c!90023 () Bool)

(assert (=> b!830256 (= c!90023 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!830257 () Bool)

(assert (=> b!830257 (= e!462849 (not call!36171))))

(declare-fun bm!36171 () Bool)

(assert (=> bm!36171 (= call!36171 (contains!4177 lt!376408 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830258 () Bool)

(assert (=> b!830258 (= e!462853 call!36172)))

(assert (= (and d!105569 c!90018) b!830249))

(assert (= (and d!105569 (not c!90018)) b!830252))

(assert (= (and b!830252 c!90021) b!830258))

(assert (= (and b!830252 (not c!90021)) b!830243))

(assert (= (and b!830243 c!90020) b!830251))

(assert (= (and b!830243 (not c!90020)) b!830245))

(assert (= (or b!830251 b!830245) bm!36167))

(assert (= (or b!830258 bm!36167) bm!36168))

(assert (= (or b!830258 b!830251) bm!36165))

(assert (= (or b!830249 bm!36168) bm!36170))

(assert (= (or b!830249 bm!36165) bm!36169))

(assert (= (and d!105569 res!565338) b!830247))

(assert (= (and d!105569 c!90019) b!830244))

(assert (= (and d!105569 (not c!90019)) b!830238))

(assert (= (and d!105569 res!565345) b!830255))

(assert (= (and b!830255 res!565342) b!830248))

(assert (= (and b!830255 (not res!565337)) b!830242))

(assert (= (and b!830242 res!565341) b!830240))

(assert (= (and b!830255 res!565339) b!830239))

(assert (= (and b!830239 c!90022) b!830253))

(assert (= (and b!830239 (not c!90022)) b!830246))

(assert (= (and b!830253 res!565340) b!830241))

(assert (= (or b!830253 b!830246) bm!36166))

(assert (= (and b!830239 res!565343) b!830256))

(assert (= (and b!830256 c!90023) b!830254))

(assert (= (and b!830256 (not c!90023)) b!830257))

(assert (= (and b!830254 res!565344) b!830250))

(assert (= (or b!830254 b!830257) bm!36171))

(declare-fun b_lambda!11289 () Bool)

(assert (=> (not b_lambda!11289) (not b!830240)))

(declare-fun t!22181 () Bool)

(declare-fun tb!4211 () Bool)

(assert (=> (and start!71568 (= defaultEntry!796 defaultEntry!796) t!22181) tb!4211))

(declare-fun result!7989 () Bool)

(assert (=> tb!4211 (= result!7989 tp_is_empty!15175)))

(assert (=> b!830240 t!22181))

(declare-fun b_and!22475 () Bool)

(assert (= b_and!22469 (and (=> t!22181 result!7989) b_and!22475)))

(declare-fun m!773573 () Bool)

(assert (=> b!830244 m!773573))

(declare-fun m!773575 () Bool)

(assert (=> b!830244 m!773575))

(declare-fun m!773577 () Bool)

(assert (=> b!830244 m!773577))

(declare-fun m!773579 () Bool)

(assert (=> b!830244 m!773579))

(assert (=> b!830244 m!773575))

(declare-fun m!773581 () Bool)

(assert (=> b!830244 m!773581))

(assert (=> b!830244 m!773507))

(declare-fun m!773583 () Bool)

(assert (=> b!830244 m!773583))

(declare-fun m!773585 () Bool)

(assert (=> b!830244 m!773585))

(declare-fun m!773587 () Bool)

(assert (=> b!830244 m!773587))

(declare-fun m!773589 () Bool)

(assert (=> b!830244 m!773589))

(declare-fun m!773591 () Bool)

(assert (=> b!830244 m!773591))

(declare-fun m!773593 () Bool)

(assert (=> b!830244 m!773593))

(assert (=> b!830244 m!773573))

(declare-fun m!773595 () Bool)

(assert (=> b!830244 m!773595))

(assert (=> b!830244 m!773591))

(assert (=> b!830244 m!773581))

(declare-fun m!773597 () Bool)

(assert (=> b!830244 m!773597))

(declare-fun m!773599 () Bool)

(assert (=> b!830244 m!773599))

(declare-fun m!773601 () Bool)

(assert (=> b!830244 m!773601))

(declare-fun m!773603 () Bool)

(assert (=> b!830244 m!773603))

(declare-fun m!773605 () Bool)

(assert (=> bm!36166 m!773605))

(assert (=> b!830247 m!773601))

(assert (=> b!830247 m!773601))

(declare-fun m!773607 () Bool)

(assert (=> b!830247 m!773607))

(declare-fun m!773609 () Bool)

(assert (=> bm!36171 m!773609))

(declare-fun m!773611 () Bool)

(assert (=> b!830249 m!773611))

(assert (=> d!105569 m!773495))

(assert (=> bm!36170 m!773507))

(assert (=> b!830248 m!773601))

(assert (=> b!830248 m!773601))

(assert (=> b!830248 m!773607))

(declare-fun m!773613 () Bool)

(assert (=> b!830250 m!773613))

(assert (=> b!830240 m!773601))

(declare-fun m!773615 () Bool)

(assert (=> b!830240 m!773615))

(declare-fun m!773617 () Bool)

(assert (=> b!830240 m!773617))

(declare-fun m!773619 () Bool)

(assert (=> b!830240 m!773619))

(declare-fun m!773621 () Bool)

(assert (=> b!830240 m!773621))

(assert (=> b!830240 m!773619))

(assert (=> b!830240 m!773601))

(assert (=> b!830240 m!773617))

(declare-fun m!773623 () Bool)

(assert (=> b!830241 m!773623))

(assert (=> b!830242 m!773601))

(assert (=> b!830242 m!773601))

(declare-fun m!773625 () Bool)

(assert (=> b!830242 m!773625))

(declare-fun m!773627 () Bool)

(assert (=> bm!36169 m!773627))

(assert (=> b!830131 d!105569))

(declare-fun d!105571 () Bool)

(declare-fun e!462860 () Bool)

(assert (=> d!105571 e!462860))

(declare-fun res!565350 () Bool)

(assert (=> d!105571 (=> (not res!565350) (not e!462860))))

(declare-fun lt!376419 () ListLongMap!8875)

(assert (=> d!105571 (= res!565350 (contains!4177 lt!376419 (_1!5036 (tuple2!10051 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!376421 () List!15824)

(assert (=> d!105571 (= lt!376419 (ListLongMap!8876 lt!376421))))

(declare-fun lt!376422 () Unit!28422)

(declare-fun lt!376420 () Unit!28422)

(assert (=> d!105571 (= lt!376422 lt!376420)))

(declare-datatypes ((Option!419 0))(
  ( (Some!418 (v!10077 V!25235)) (None!417) )
))
(declare-fun getValueByKey!413 (List!15824 (_ BitVec 64)) Option!419)

(assert (=> d!105571 (= (getValueByKey!413 lt!376421 (_1!5036 (tuple2!10051 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!418 (_2!5036 (tuple2!10051 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lemmaContainsTupThenGetReturnValue!227 (List!15824 (_ BitVec 64) V!25235) Unit!28422)

(assert (=> d!105571 (= lt!376420 (lemmaContainsTupThenGetReturnValue!227 lt!376421 (_1!5036 (tuple2!10051 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5036 (tuple2!10051 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun insertStrictlySorted!266 (List!15824 (_ BitVec 64) V!25235) List!15824)

(assert (=> d!105571 (= lt!376421 (insertStrictlySorted!266 (toList!4453 lt!376325) (_1!5036 (tuple2!10051 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5036 (tuple2!10051 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105571 (= (+!1976 lt!376325 (tuple2!10051 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) lt!376419)))

(declare-fun b!830265 () Bool)

(declare-fun res!565351 () Bool)

(assert (=> b!830265 (=> (not res!565351) (not e!462860))))

(assert (=> b!830265 (= res!565351 (= (getValueByKey!413 (toList!4453 lt!376419) (_1!5036 (tuple2!10051 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!418 (_2!5036 (tuple2!10051 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!830266 () Bool)

(declare-fun contains!4178 (List!15824 tuple2!10050) Bool)

(assert (=> b!830266 (= e!462860 (contains!4178 (toList!4453 lt!376419) (tuple2!10051 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(assert (= (and d!105571 res!565350) b!830265))

(assert (= (and b!830265 res!565351) b!830266))

(declare-fun m!773629 () Bool)

(assert (=> d!105571 m!773629))

(declare-fun m!773631 () Bool)

(assert (=> d!105571 m!773631))

(declare-fun m!773633 () Bool)

(assert (=> d!105571 m!773633))

(declare-fun m!773635 () Bool)

(assert (=> d!105571 m!773635))

(declare-fun m!773637 () Bool)

(assert (=> b!830265 m!773637))

(declare-fun m!773639 () Bool)

(assert (=> b!830266 m!773639))

(assert (=> b!830131 d!105571))

(declare-fun d!105573 () Bool)

(assert (=> d!105573 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!71568 d!105573))

(declare-fun d!105575 () Bool)

(assert (=> d!105575 (= (array_inv!17803 _keys!976) (bvsge (size!22718 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!71568 d!105575))

(declare-fun d!105577 () Bool)

(assert (=> d!105577 (= (array_inv!17804 _values!788) (bvsge (size!22719 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!71568 d!105577))

(declare-fun d!105579 () Bool)

(declare-fun res!565357 () Bool)

(declare-fun e!462869 () Bool)

(assert (=> d!105579 (=> res!565357 e!462869)))

(assert (=> d!105579 (= res!565357 (bvsge #b00000000000000000000000000000000 (size!22718 _keys!976)))))

(assert (=> d!105579 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!462869)))

(declare-fun b!830275 () Bool)

(declare-fun e!462868 () Bool)

(assert (=> b!830275 (= e!462869 e!462868)))

(declare-fun c!90026 () Bool)

(assert (=> b!830275 (= c!90026 (validKeyInArray!0 (select (arr!22298 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830276 () Bool)

(declare-fun call!36177 () Bool)

(assert (=> b!830276 (= e!462868 call!36177)))

(declare-fun b!830277 () Bool)

(declare-fun e!462867 () Bool)

(assert (=> b!830277 (= e!462868 e!462867)))

(declare-fun lt!376431 () (_ BitVec 64))

(assert (=> b!830277 (= lt!376431 (select (arr!22298 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376430 () Unit!28422)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46527 (_ BitVec 64) (_ BitVec 32)) Unit!28422)

(assert (=> b!830277 (= lt!376430 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!376431 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46527 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!830277 (arrayContainsKey!0 _keys!976 lt!376431 #b00000000000000000000000000000000)))

(declare-fun lt!376429 () Unit!28422)

(assert (=> b!830277 (= lt!376429 lt!376430)))

(declare-fun res!565356 () Bool)

(declare-datatypes ((SeekEntryResult!8692 0))(
  ( (MissingZero!8692 (index!37139 (_ BitVec 32))) (Found!8692 (index!37140 (_ BitVec 32))) (Intermediate!8692 (undefined!9504 Bool) (index!37141 (_ BitVec 32)) (x!69998 (_ BitVec 32))) (Undefined!8692) (MissingVacant!8692 (index!37142 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46527 (_ BitVec 32)) SeekEntryResult!8692)

(assert (=> b!830277 (= res!565356 (= (seekEntryOrOpen!0 (select (arr!22298 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8692 #b00000000000000000000000000000000)))))

(assert (=> b!830277 (=> (not res!565356) (not e!462867))))

(declare-fun bm!36174 () Bool)

(assert (=> bm!36174 (= call!36177 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!830278 () Bool)

(assert (=> b!830278 (= e!462867 call!36177)))

(assert (= (and d!105579 (not res!565357)) b!830275))

(assert (= (and b!830275 c!90026) b!830277))

(assert (= (and b!830275 (not c!90026)) b!830276))

(assert (= (and b!830277 res!565356) b!830278))

(assert (= (or b!830278 b!830276) bm!36174))

(assert (=> b!830275 m!773601))

(assert (=> b!830275 m!773601))

(assert (=> b!830275 m!773607))

(assert (=> b!830277 m!773601))

(declare-fun m!773641 () Bool)

(assert (=> b!830277 m!773641))

(declare-fun m!773643 () Bool)

(assert (=> b!830277 m!773643))

(assert (=> b!830277 m!773601))

(declare-fun m!773645 () Bool)

(assert (=> b!830277 m!773645))

(declare-fun m!773647 () Bool)

(assert (=> bm!36174 m!773647))

(assert (=> b!830126 d!105579))

(declare-fun b!830289 () Bool)

(declare-fun e!462879 () Bool)

(declare-fun e!462881 () Bool)

(assert (=> b!830289 (= e!462879 e!462881)))

(declare-fun res!565365 () Bool)

(assert (=> b!830289 (=> (not res!565365) (not e!462881))))

(declare-fun e!462880 () Bool)

(assert (=> b!830289 (= res!565365 (not e!462880))))

(declare-fun res!565364 () Bool)

(assert (=> b!830289 (=> (not res!565364) (not e!462880))))

(assert (=> b!830289 (= res!565364 (validKeyInArray!0 (select (arr!22298 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!105581 () Bool)

(declare-fun res!565366 () Bool)

(assert (=> d!105581 (=> res!565366 e!462879)))

(assert (=> d!105581 (= res!565366 (bvsge #b00000000000000000000000000000000 (size!22718 _keys!976)))))

(assert (=> d!105581 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15822) e!462879)))

(declare-fun b!830290 () Bool)

(declare-fun e!462878 () Bool)

(assert (=> b!830290 (= e!462881 e!462878)))

(declare-fun c!90029 () Bool)

(assert (=> b!830290 (= c!90029 (validKeyInArray!0 (select (arr!22298 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830291 () Bool)

(declare-fun call!36180 () Bool)

(assert (=> b!830291 (= e!462878 call!36180)))

(declare-fun b!830292 () Bool)

(declare-fun contains!4179 (List!15825 (_ BitVec 64)) Bool)

(assert (=> b!830292 (= e!462880 (contains!4179 Nil!15822 (select (arr!22298 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830293 () Bool)

(assert (=> b!830293 (= e!462878 call!36180)))

(declare-fun bm!36177 () Bool)

(assert (=> bm!36177 (= call!36180 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!90029 (Cons!15821 (select (arr!22298 _keys!976) #b00000000000000000000000000000000) Nil!15822) Nil!15822)))))

(assert (= (and d!105581 (not res!565366)) b!830289))

(assert (= (and b!830289 res!565364) b!830292))

(assert (= (and b!830289 res!565365) b!830290))

(assert (= (and b!830290 c!90029) b!830291))

(assert (= (and b!830290 (not c!90029)) b!830293))

(assert (= (or b!830291 b!830293) bm!36177))

(assert (=> b!830289 m!773601))

(assert (=> b!830289 m!773601))

(assert (=> b!830289 m!773607))

(assert (=> b!830290 m!773601))

(assert (=> b!830290 m!773601))

(assert (=> b!830290 m!773607))

(assert (=> b!830292 m!773601))

(assert (=> b!830292 m!773601))

(declare-fun m!773649 () Bool)

(assert (=> b!830292 m!773649))

(assert (=> bm!36177 m!773601))

(declare-fun m!773651 () Bool)

(assert (=> bm!36177 m!773651))

(assert (=> b!830134 d!105581))

(declare-fun d!105583 () Bool)

(assert (=> d!105583 (= (getCurrentListMapNoExtraKeys!2527 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2527 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376434 () Unit!28422)

(declare-fun choose!1419 (array!46527 array!46529 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25235 V!25235 V!25235 V!25235 (_ BitVec 32) Int) Unit!28422)

(assert (=> d!105583 (= lt!376434 (choose!1419 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!105583 (validMask!0 mask!1312)))

(assert (=> d!105583 (= (lemmaNoChangeToArrayThenSameMapNoExtras!594 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376434)))

(declare-fun bs!23180 () Bool)

(assert (= bs!23180 d!105583))

(assert (=> bs!23180 m!773507))

(assert (=> bs!23180 m!773505))

(declare-fun m!773653 () Bool)

(assert (=> bs!23180 m!773653))

(assert (=> bs!23180 m!773495))

(assert (=> b!830132 d!105583))

(declare-fun b!830318 () Bool)

(declare-fun e!462902 () Bool)

(assert (=> b!830318 (= e!462902 (validKeyInArray!0 (select (arr!22298 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!830318 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!830319 () Bool)

(declare-fun res!565375 () Bool)

(declare-fun e!462901 () Bool)

(assert (=> b!830319 (=> (not res!565375) (not e!462901))))

(declare-fun lt!376452 () ListLongMap!8875)

(assert (=> b!830319 (= res!565375 (not (contains!4177 lt!376452 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!830320 () Bool)

(declare-fun e!462900 () Bool)

(assert (=> b!830320 (= e!462901 e!462900)))

(declare-fun c!90038 () Bool)

(assert (=> b!830320 (= c!90038 e!462902)))

(declare-fun res!565376 () Bool)

(assert (=> b!830320 (=> (not res!565376) (not e!462902))))

(assert (=> b!830320 (= res!565376 (bvslt #b00000000000000000000000000000000 (size!22718 _keys!976)))))

(declare-fun b!830321 () Bool)

(declare-fun lt!376454 () Unit!28422)

(declare-fun lt!376455 () Unit!28422)

(assert (=> b!830321 (= lt!376454 lt!376455)))

(declare-fun lt!376450 () V!25235)

(declare-fun lt!376453 () (_ BitVec 64))

(declare-fun lt!376449 () (_ BitVec 64))

(declare-fun lt!376451 () ListLongMap!8875)

(assert (=> b!830321 (not (contains!4177 (+!1976 lt!376451 (tuple2!10051 lt!376449 lt!376450)) lt!376453))))

(declare-fun addStillNotContains!196 (ListLongMap!8875 (_ BitVec 64) V!25235 (_ BitVec 64)) Unit!28422)

(assert (=> b!830321 (= lt!376455 (addStillNotContains!196 lt!376451 lt!376449 lt!376450 lt!376453))))

(assert (=> b!830321 (= lt!376453 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!830321 (= lt!376450 (get!11807 (select (arr!22299 _values!788) #b00000000000000000000000000000000) (dynLambda!977 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!830321 (= lt!376449 (select (arr!22298 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!36183 () ListLongMap!8875)

(assert (=> b!830321 (= lt!376451 call!36183)))

(declare-fun e!462897 () ListLongMap!8875)

(assert (=> b!830321 (= e!462897 (+!1976 call!36183 (tuple2!10051 (select (arr!22298 _keys!976) #b00000000000000000000000000000000) (get!11807 (select (arr!22299 _values!788) #b00000000000000000000000000000000) (dynLambda!977 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!830322 () Bool)

(declare-fun e!462896 () Bool)

(assert (=> b!830322 (= e!462900 e!462896)))

(assert (=> b!830322 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22718 _keys!976)))))

(declare-fun res!565377 () Bool)

(assert (=> b!830322 (= res!565377 (contains!4177 lt!376452 (select (arr!22298 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!830322 (=> (not res!565377) (not e!462896))))

(declare-fun bm!36180 () Bool)

(assert (=> bm!36180 (= call!36183 (getCurrentListMapNoExtraKeys!2527 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!830324 () Bool)

(declare-fun e!462898 () Bool)

(assert (=> b!830324 (= e!462900 e!462898)))

(declare-fun c!90039 () Bool)

(assert (=> b!830324 (= c!90039 (bvslt #b00000000000000000000000000000000 (size!22718 _keys!976)))))

(declare-fun b!830325 () Bool)

(assert (=> b!830325 (= e!462898 (= lt!376452 (getCurrentListMapNoExtraKeys!2527 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!830326 () Bool)

(declare-fun e!462899 () ListLongMap!8875)

(assert (=> b!830326 (= e!462899 e!462897)))

(declare-fun c!90040 () Bool)

(assert (=> b!830326 (= c!90040 (validKeyInArray!0 (select (arr!22298 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830327 () Bool)

(declare-fun isEmpty!657 (ListLongMap!8875) Bool)

(assert (=> b!830327 (= e!462898 (isEmpty!657 lt!376452))))

(declare-fun d!105585 () Bool)

(assert (=> d!105585 e!462901))

(declare-fun res!565378 () Bool)

(assert (=> d!105585 (=> (not res!565378) (not e!462901))))

(assert (=> d!105585 (= res!565378 (not (contains!4177 lt!376452 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105585 (= lt!376452 e!462899)))

(declare-fun c!90041 () Bool)

(assert (=> d!105585 (= c!90041 (bvsge #b00000000000000000000000000000000 (size!22718 _keys!976)))))

(assert (=> d!105585 (validMask!0 mask!1312)))

(assert (=> d!105585 (= (getCurrentListMapNoExtraKeys!2527 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376452)))

(declare-fun b!830323 () Bool)

(assert (=> b!830323 (= e!462897 call!36183)))

(declare-fun b!830328 () Bool)

(assert (=> b!830328 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22718 _keys!976)))))

(assert (=> b!830328 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22719 _values!788)))))

(assert (=> b!830328 (= e!462896 (= (apply!369 lt!376452 (select (arr!22298 _keys!976) #b00000000000000000000000000000000)) (get!11807 (select (arr!22299 _values!788) #b00000000000000000000000000000000) (dynLambda!977 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!830329 () Bool)

(assert (=> b!830329 (= e!462899 (ListLongMap!8876 Nil!15821))))

(assert (= (and d!105585 c!90041) b!830329))

(assert (= (and d!105585 (not c!90041)) b!830326))

(assert (= (and b!830326 c!90040) b!830321))

(assert (= (and b!830326 (not c!90040)) b!830323))

(assert (= (or b!830321 b!830323) bm!36180))

(assert (= (and d!105585 res!565378) b!830319))

(assert (= (and b!830319 res!565375) b!830320))

(assert (= (and b!830320 res!565376) b!830318))

(assert (= (and b!830320 c!90038) b!830322))

(assert (= (and b!830320 (not c!90038)) b!830324))

(assert (= (and b!830322 res!565377) b!830328))

(assert (= (and b!830324 c!90039) b!830325))

(assert (= (and b!830324 (not c!90039)) b!830327))

(declare-fun b_lambda!11291 () Bool)

(assert (=> (not b_lambda!11291) (not b!830321)))

(assert (=> b!830321 t!22181))

(declare-fun b_and!22477 () Bool)

(assert (= b_and!22475 (and (=> t!22181 result!7989) b_and!22477)))

(declare-fun b_lambda!11293 () Bool)

(assert (=> (not b_lambda!11293) (not b!830328)))

(assert (=> b!830328 t!22181))

(declare-fun b_and!22479 () Bool)

(assert (= b_and!22477 (and (=> t!22181 result!7989) b_and!22479)))

(assert (=> b!830322 m!773601))

(assert (=> b!830322 m!773601))

(declare-fun m!773655 () Bool)

(assert (=> b!830322 m!773655))

(declare-fun m!773657 () Bool)

(assert (=> b!830325 m!773657))

(assert (=> b!830326 m!773601))

(assert (=> b!830326 m!773601))

(assert (=> b!830326 m!773607))

(declare-fun m!773659 () Bool)

(assert (=> d!105585 m!773659))

(assert (=> d!105585 m!773495))

(declare-fun m!773661 () Bool)

(assert (=> b!830319 m!773661))

(declare-fun m!773663 () Bool)

(assert (=> b!830321 m!773663))

(declare-fun m!773665 () Bool)

(assert (=> b!830321 m!773665))

(declare-fun m!773667 () Bool)

(assert (=> b!830321 m!773667))

(assert (=> b!830321 m!773601))

(assert (=> b!830321 m!773665))

(assert (=> b!830321 m!773617))

(declare-fun m!773669 () Bool)

(assert (=> b!830321 m!773669))

(assert (=> b!830321 m!773619))

(assert (=> b!830321 m!773617))

(assert (=> b!830321 m!773619))

(assert (=> b!830321 m!773621))

(assert (=> b!830328 m!773601))

(declare-fun m!773671 () Bool)

(assert (=> b!830328 m!773671))

(assert (=> b!830328 m!773601))

(assert (=> b!830328 m!773617))

(assert (=> b!830328 m!773619))

(assert (=> b!830328 m!773617))

(assert (=> b!830328 m!773619))

(assert (=> b!830328 m!773621))

(assert (=> bm!36180 m!773657))

(assert (=> b!830318 m!773601))

(assert (=> b!830318 m!773601))

(assert (=> b!830318 m!773607))

(declare-fun m!773673 () Bool)

(assert (=> b!830327 m!773673))

(assert (=> b!830132 d!105585))

(declare-fun b!830330 () Bool)

(declare-fun e!462909 () Bool)

(assert (=> b!830330 (= e!462909 (validKeyInArray!0 (select (arr!22298 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!830330 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!830331 () Bool)

(declare-fun res!565379 () Bool)

(declare-fun e!462908 () Bool)

(assert (=> b!830331 (=> (not res!565379) (not e!462908))))

(declare-fun lt!376459 () ListLongMap!8875)

(assert (=> b!830331 (= res!565379 (not (contains!4177 lt!376459 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!830332 () Bool)

(declare-fun e!462907 () Bool)

(assert (=> b!830332 (= e!462908 e!462907)))

(declare-fun c!90042 () Bool)

(assert (=> b!830332 (= c!90042 e!462909)))

(declare-fun res!565380 () Bool)

(assert (=> b!830332 (=> (not res!565380) (not e!462909))))

(assert (=> b!830332 (= res!565380 (bvslt #b00000000000000000000000000000000 (size!22718 _keys!976)))))

(declare-fun b!830333 () Bool)

(declare-fun lt!376461 () Unit!28422)

(declare-fun lt!376462 () Unit!28422)

(assert (=> b!830333 (= lt!376461 lt!376462)))

(declare-fun lt!376460 () (_ BitVec 64))

(declare-fun lt!376456 () (_ BitVec 64))

(declare-fun lt!376457 () V!25235)

(declare-fun lt!376458 () ListLongMap!8875)

(assert (=> b!830333 (not (contains!4177 (+!1976 lt!376458 (tuple2!10051 lt!376456 lt!376457)) lt!376460))))

(assert (=> b!830333 (= lt!376462 (addStillNotContains!196 lt!376458 lt!376456 lt!376457 lt!376460))))

(assert (=> b!830333 (= lt!376460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!830333 (= lt!376457 (get!11807 (select (arr!22299 _values!788) #b00000000000000000000000000000000) (dynLambda!977 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!830333 (= lt!376456 (select (arr!22298 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!36184 () ListLongMap!8875)

(assert (=> b!830333 (= lt!376458 call!36184)))

(declare-fun e!462904 () ListLongMap!8875)

(assert (=> b!830333 (= e!462904 (+!1976 call!36184 (tuple2!10051 (select (arr!22298 _keys!976) #b00000000000000000000000000000000) (get!11807 (select (arr!22299 _values!788) #b00000000000000000000000000000000) (dynLambda!977 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!830334 () Bool)

(declare-fun e!462903 () Bool)

(assert (=> b!830334 (= e!462907 e!462903)))

(assert (=> b!830334 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22718 _keys!976)))))

(declare-fun res!565381 () Bool)

(assert (=> b!830334 (= res!565381 (contains!4177 lt!376459 (select (arr!22298 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!830334 (=> (not res!565381) (not e!462903))))

(declare-fun bm!36181 () Bool)

(assert (=> bm!36181 (= call!36184 (getCurrentListMapNoExtraKeys!2527 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!830336 () Bool)

(declare-fun e!462905 () Bool)

(assert (=> b!830336 (= e!462907 e!462905)))

(declare-fun c!90043 () Bool)

(assert (=> b!830336 (= c!90043 (bvslt #b00000000000000000000000000000000 (size!22718 _keys!976)))))

(declare-fun b!830337 () Bool)

(assert (=> b!830337 (= e!462905 (= lt!376459 (getCurrentListMapNoExtraKeys!2527 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!830338 () Bool)

(declare-fun e!462906 () ListLongMap!8875)

(assert (=> b!830338 (= e!462906 e!462904)))

(declare-fun c!90044 () Bool)

(assert (=> b!830338 (= c!90044 (validKeyInArray!0 (select (arr!22298 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830339 () Bool)

(assert (=> b!830339 (= e!462905 (isEmpty!657 lt!376459))))

(declare-fun d!105587 () Bool)

(assert (=> d!105587 e!462908))

(declare-fun res!565382 () Bool)

(assert (=> d!105587 (=> (not res!565382) (not e!462908))))

(assert (=> d!105587 (= res!565382 (not (contains!4177 lt!376459 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105587 (= lt!376459 e!462906)))

(declare-fun c!90045 () Bool)

(assert (=> d!105587 (= c!90045 (bvsge #b00000000000000000000000000000000 (size!22718 _keys!976)))))

(assert (=> d!105587 (validMask!0 mask!1312)))

(assert (=> d!105587 (= (getCurrentListMapNoExtraKeys!2527 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376459)))

(declare-fun b!830335 () Bool)

(assert (=> b!830335 (= e!462904 call!36184)))

(declare-fun b!830340 () Bool)

(assert (=> b!830340 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22718 _keys!976)))))

(assert (=> b!830340 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22719 _values!788)))))

(assert (=> b!830340 (= e!462903 (= (apply!369 lt!376459 (select (arr!22298 _keys!976) #b00000000000000000000000000000000)) (get!11807 (select (arr!22299 _values!788) #b00000000000000000000000000000000) (dynLambda!977 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!830341 () Bool)

(assert (=> b!830341 (= e!462906 (ListLongMap!8876 Nil!15821))))

(assert (= (and d!105587 c!90045) b!830341))

(assert (= (and d!105587 (not c!90045)) b!830338))

(assert (= (and b!830338 c!90044) b!830333))

(assert (= (and b!830338 (not c!90044)) b!830335))

(assert (= (or b!830333 b!830335) bm!36181))

(assert (= (and d!105587 res!565382) b!830331))

(assert (= (and b!830331 res!565379) b!830332))

(assert (= (and b!830332 res!565380) b!830330))

(assert (= (and b!830332 c!90042) b!830334))

(assert (= (and b!830332 (not c!90042)) b!830336))

(assert (= (and b!830334 res!565381) b!830340))

(assert (= (and b!830336 c!90043) b!830337))

(assert (= (and b!830336 (not c!90043)) b!830339))

(declare-fun b_lambda!11295 () Bool)

(assert (=> (not b_lambda!11295) (not b!830333)))

(assert (=> b!830333 t!22181))

(declare-fun b_and!22481 () Bool)

(assert (= b_and!22479 (and (=> t!22181 result!7989) b_and!22481)))

(declare-fun b_lambda!11297 () Bool)

(assert (=> (not b_lambda!11297) (not b!830340)))

(assert (=> b!830340 t!22181))

(declare-fun b_and!22483 () Bool)

(assert (= b_and!22481 (and (=> t!22181 result!7989) b_and!22483)))

(assert (=> b!830334 m!773601))

(assert (=> b!830334 m!773601))

(declare-fun m!773675 () Bool)

(assert (=> b!830334 m!773675))

(declare-fun m!773677 () Bool)

(assert (=> b!830337 m!773677))

(assert (=> b!830338 m!773601))

(assert (=> b!830338 m!773601))

(assert (=> b!830338 m!773607))

(declare-fun m!773679 () Bool)

(assert (=> d!105587 m!773679))

(assert (=> d!105587 m!773495))

(declare-fun m!773681 () Bool)

(assert (=> b!830331 m!773681))

(declare-fun m!773683 () Bool)

(assert (=> b!830333 m!773683))

(declare-fun m!773685 () Bool)

(assert (=> b!830333 m!773685))

(declare-fun m!773687 () Bool)

(assert (=> b!830333 m!773687))

(assert (=> b!830333 m!773601))

(assert (=> b!830333 m!773685))

(assert (=> b!830333 m!773617))

(declare-fun m!773689 () Bool)

(assert (=> b!830333 m!773689))

(assert (=> b!830333 m!773619))

(assert (=> b!830333 m!773617))

(assert (=> b!830333 m!773619))

(assert (=> b!830333 m!773621))

(assert (=> b!830340 m!773601))

(declare-fun m!773691 () Bool)

(assert (=> b!830340 m!773691))

(assert (=> b!830340 m!773601))

(assert (=> b!830340 m!773617))

(assert (=> b!830340 m!773619))

(assert (=> b!830340 m!773617))

(assert (=> b!830340 m!773619))

(assert (=> b!830340 m!773621))

(assert (=> bm!36181 m!773677))

(assert (=> b!830330 m!773601))

(assert (=> b!830330 m!773601))

(assert (=> b!830330 m!773607))

(declare-fun m!773693 () Bool)

(assert (=> b!830339 m!773693))

(assert (=> b!830132 d!105587))

(declare-fun bm!36182 () Bool)

(declare-fun call!36189 () ListLongMap!8875)

(declare-fun call!36186 () ListLongMap!8875)

(assert (=> bm!36182 (= call!36189 call!36186)))

(declare-fun b!830342 () Bool)

(declare-fun e!462913 () Unit!28422)

(declare-fun Unit!28425 () Unit!28422)

(assert (=> b!830342 (= e!462913 Unit!28425)))

(declare-fun b!830343 () Bool)

(declare-fun res!565389 () Bool)

(declare-fun e!462917 () Bool)

(assert (=> b!830343 (=> (not res!565389) (not e!462917))))

(declare-fun e!462912 () Bool)

(assert (=> b!830343 (= res!565389 e!462912)))

(declare-fun c!90050 () Bool)

(assert (=> b!830343 (= c!90050 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!376482 () ListLongMap!8875)

(declare-fun e!462922 () Bool)

(declare-fun b!830344 () Bool)

(assert (=> b!830344 (= e!462922 (= (apply!369 lt!376482 (select (arr!22298 _keys!976) #b00000000000000000000000000000000)) (get!11807 (select (arr!22299 _values!788) #b00000000000000000000000000000000) (dynLambda!977 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!830344 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22719 _values!788)))))

(assert (=> b!830344 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22718 _keys!976)))))

(declare-fun b!830346 () Bool)

(declare-fun e!462916 () Bool)

(assert (=> b!830346 (= e!462916 e!462922)))

(declare-fun res!565387 () Bool)

(assert (=> b!830346 (=> (not res!565387) (not e!462922))))

(assert (=> b!830346 (= res!565387 (contains!4177 lt!376482 (select (arr!22298 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!830346 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22718 _keys!976)))))

(declare-fun b!830347 () Bool)

(declare-fun c!90048 () Bool)

(assert (=> b!830347 (= c!90048 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!462918 () ListLongMap!8875)

(declare-fun e!462919 () ListLongMap!8875)

(assert (=> b!830347 (= e!462918 e!462919)))

(declare-fun b!830348 () Bool)

(declare-fun lt!376480 () Unit!28422)

(assert (=> b!830348 (= e!462913 lt!376480)))

(declare-fun lt!376477 () ListLongMap!8875)

(assert (=> b!830348 (= lt!376477 (getCurrentListMapNoExtraKeys!2527 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376473 () (_ BitVec 64))

(assert (=> b!830348 (= lt!376473 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376464 () (_ BitVec 64))

(assert (=> b!830348 (= lt!376464 (select (arr!22298 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376470 () Unit!28422)

(assert (=> b!830348 (= lt!376470 (addStillContains!320 lt!376477 lt!376473 zeroValueAfter!34 lt!376464))))

(assert (=> b!830348 (contains!4177 (+!1976 lt!376477 (tuple2!10051 lt!376473 zeroValueAfter!34)) lt!376464)))

(declare-fun lt!376484 () Unit!28422)

(assert (=> b!830348 (= lt!376484 lt!376470)))

(declare-fun lt!376467 () ListLongMap!8875)

(assert (=> b!830348 (= lt!376467 (getCurrentListMapNoExtraKeys!2527 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376465 () (_ BitVec 64))

(assert (=> b!830348 (= lt!376465 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376468 () (_ BitVec 64))

(assert (=> b!830348 (= lt!376468 (select (arr!22298 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376472 () Unit!28422)

(assert (=> b!830348 (= lt!376472 (addApplyDifferent!320 lt!376467 lt!376465 minValue!754 lt!376468))))

(assert (=> b!830348 (= (apply!369 (+!1976 lt!376467 (tuple2!10051 lt!376465 minValue!754)) lt!376468) (apply!369 lt!376467 lt!376468))))

(declare-fun lt!376474 () Unit!28422)

(assert (=> b!830348 (= lt!376474 lt!376472)))

(declare-fun lt!376479 () ListLongMap!8875)

(assert (=> b!830348 (= lt!376479 (getCurrentListMapNoExtraKeys!2527 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376471 () (_ BitVec 64))

(assert (=> b!830348 (= lt!376471 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376463 () (_ BitVec 64))

(assert (=> b!830348 (= lt!376463 (select (arr!22298 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376466 () Unit!28422)

(assert (=> b!830348 (= lt!376466 (addApplyDifferent!320 lt!376479 lt!376471 zeroValueAfter!34 lt!376463))))

(assert (=> b!830348 (= (apply!369 (+!1976 lt!376479 (tuple2!10051 lt!376471 zeroValueAfter!34)) lt!376463) (apply!369 lt!376479 lt!376463))))

(declare-fun lt!376481 () Unit!28422)

(assert (=> b!830348 (= lt!376481 lt!376466)))

(declare-fun lt!376476 () ListLongMap!8875)

(assert (=> b!830348 (= lt!376476 (getCurrentListMapNoExtraKeys!2527 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376469 () (_ BitVec 64))

(assert (=> b!830348 (= lt!376469 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376483 () (_ BitVec 64))

(assert (=> b!830348 (= lt!376483 (select (arr!22298 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!830348 (= lt!376480 (addApplyDifferent!320 lt!376476 lt!376469 minValue!754 lt!376483))))

(assert (=> b!830348 (= (apply!369 (+!1976 lt!376476 (tuple2!10051 lt!376469 minValue!754)) lt!376483) (apply!369 lt!376476 lt!376483))))

(declare-fun b!830349 () Bool)

(declare-fun call!36190 () ListLongMap!8875)

(assert (=> b!830349 (= e!462919 call!36190)))

(declare-fun b!830350 () Bool)

(declare-fun call!36187 () Bool)

(assert (=> b!830350 (= e!462912 (not call!36187))))

(declare-fun b!830351 () Bool)

(declare-fun e!462911 () Bool)

(assert (=> b!830351 (= e!462911 (validKeyInArray!0 (select (arr!22298 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830352 () Bool)

(declare-fun e!462921 () Bool)

(assert (=> b!830352 (= e!462921 (validKeyInArray!0 (select (arr!22298 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!36183 () Bool)

(assert (=> bm!36183 (= call!36187 (contains!4177 lt!376482 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!36184 () Bool)

(declare-fun call!36191 () ListLongMap!8875)

(assert (=> bm!36184 (= call!36190 call!36191)))

(declare-fun b!830353 () Bool)

(declare-fun e!462920 () ListLongMap!8875)

(assert (=> b!830353 (= e!462920 (+!1976 call!36186 (tuple2!10051 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!830354 () Bool)

(declare-fun e!462910 () Bool)

(assert (=> b!830354 (= e!462910 (= (apply!369 lt!376482 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun d!105589 () Bool)

(assert (=> d!105589 e!462917))

(declare-fun res!565391 () Bool)

(assert (=> d!105589 (=> (not res!565391) (not e!462917))))

(assert (=> d!105589 (= res!565391 (or (bvsge #b00000000000000000000000000000000 (size!22718 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22718 _keys!976)))))))

(declare-fun lt!376475 () ListLongMap!8875)

(assert (=> d!105589 (= lt!376482 lt!376475)))

(declare-fun lt!376478 () Unit!28422)

(assert (=> d!105589 (= lt!376478 e!462913)))

(declare-fun c!90047 () Bool)

(assert (=> d!105589 (= c!90047 e!462911)))

(declare-fun res!565384 () Bool)

(assert (=> d!105589 (=> (not res!565384) (not e!462911))))

(assert (=> d!105589 (= res!565384 (bvslt #b00000000000000000000000000000000 (size!22718 _keys!976)))))

(assert (=> d!105589 (= lt!376475 e!462920)))

(declare-fun c!90046 () Bool)

(assert (=> d!105589 (= c!90046 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105589 (validMask!0 mask!1312)))

(assert (=> d!105589 (= (getCurrentListMap!2548 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376482)))

(declare-fun b!830345 () Bool)

(declare-fun e!462915 () Bool)

(assert (=> b!830345 (= e!462915 (= (apply!369 lt!376482 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun b!830355 () Bool)

(assert (=> b!830355 (= e!462919 call!36189)))

(declare-fun b!830356 () Bool)

(assert (=> b!830356 (= e!462920 e!462918)))

(declare-fun c!90049 () Bool)

(assert (=> b!830356 (= c!90049 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!36185 () Bool)

(declare-fun call!36185 () ListLongMap!8875)

(assert (=> bm!36185 (= call!36191 call!36185)))

(declare-fun b!830357 () Bool)

(assert (=> b!830357 (= e!462912 e!462915)))

(declare-fun res!565386 () Bool)

(assert (=> b!830357 (= res!565386 call!36187)))

(assert (=> b!830357 (=> (not res!565386) (not e!462915))))

(declare-fun bm!36186 () Bool)

(assert (=> bm!36186 (= call!36186 (+!1976 (ite c!90046 call!36185 (ite c!90049 call!36191 call!36190)) (ite (or c!90046 c!90049) (tuple2!10051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10051 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun bm!36187 () Bool)

(assert (=> bm!36187 (= call!36185 (getCurrentListMapNoExtraKeys!2527 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!830358 () Bool)

(declare-fun e!462914 () Bool)

(assert (=> b!830358 (= e!462914 e!462910)))

(declare-fun res!565390 () Bool)

(declare-fun call!36188 () Bool)

(assert (=> b!830358 (= res!565390 call!36188)))

(assert (=> b!830358 (=> (not res!565390) (not e!462910))))

(declare-fun b!830359 () Bool)

(declare-fun res!565385 () Bool)

(assert (=> b!830359 (=> (not res!565385) (not e!462917))))

(assert (=> b!830359 (= res!565385 e!462916)))

(declare-fun res!565383 () Bool)

(assert (=> b!830359 (=> res!565383 e!462916)))

(assert (=> b!830359 (= res!565383 (not e!462921))))

(declare-fun res!565388 () Bool)

(assert (=> b!830359 (=> (not res!565388) (not e!462921))))

(assert (=> b!830359 (= res!565388 (bvslt #b00000000000000000000000000000000 (size!22718 _keys!976)))))

(declare-fun b!830360 () Bool)

(assert (=> b!830360 (= e!462917 e!462914)))

(declare-fun c!90051 () Bool)

(assert (=> b!830360 (= c!90051 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!830361 () Bool)

(assert (=> b!830361 (= e!462914 (not call!36188))))

(declare-fun bm!36188 () Bool)

(assert (=> bm!36188 (= call!36188 (contains!4177 lt!376482 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830362 () Bool)

(assert (=> b!830362 (= e!462918 call!36189)))

(assert (= (and d!105589 c!90046) b!830353))

(assert (= (and d!105589 (not c!90046)) b!830356))

(assert (= (and b!830356 c!90049) b!830362))

(assert (= (and b!830356 (not c!90049)) b!830347))

(assert (= (and b!830347 c!90048) b!830355))

(assert (= (and b!830347 (not c!90048)) b!830349))

(assert (= (or b!830355 b!830349) bm!36184))

(assert (= (or b!830362 bm!36184) bm!36185))

(assert (= (or b!830362 b!830355) bm!36182))

(assert (= (or b!830353 bm!36185) bm!36187))

(assert (= (or b!830353 bm!36182) bm!36186))

(assert (= (and d!105589 res!565384) b!830351))

(assert (= (and d!105589 c!90047) b!830348))

(assert (= (and d!105589 (not c!90047)) b!830342))

(assert (= (and d!105589 res!565391) b!830359))

(assert (= (and b!830359 res!565388) b!830352))

(assert (= (and b!830359 (not res!565383)) b!830346))

(assert (= (and b!830346 res!565387) b!830344))

(assert (= (and b!830359 res!565385) b!830343))

(assert (= (and b!830343 c!90050) b!830357))

(assert (= (and b!830343 (not c!90050)) b!830350))

(assert (= (and b!830357 res!565386) b!830345))

(assert (= (or b!830357 b!830350) bm!36183))

(assert (= (and b!830343 res!565389) b!830360))

(assert (= (and b!830360 c!90051) b!830358))

(assert (= (and b!830360 (not c!90051)) b!830361))

(assert (= (and b!830358 res!565390) b!830354))

(assert (= (or b!830358 b!830361) bm!36188))

(declare-fun b_lambda!11299 () Bool)

(assert (=> (not b_lambda!11299) (not b!830344)))

(assert (=> b!830344 t!22181))

(declare-fun b_and!22485 () Bool)

(assert (= b_and!22483 (and (=> t!22181 result!7989) b_and!22485)))

(declare-fun m!773695 () Bool)

(assert (=> b!830348 m!773695))

(declare-fun m!773697 () Bool)

(assert (=> b!830348 m!773697))

(declare-fun m!773699 () Bool)

(assert (=> b!830348 m!773699))

(declare-fun m!773701 () Bool)

(assert (=> b!830348 m!773701))

(assert (=> b!830348 m!773697))

(declare-fun m!773703 () Bool)

(assert (=> b!830348 m!773703))

(assert (=> b!830348 m!773505))

(declare-fun m!773705 () Bool)

(assert (=> b!830348 m!773705))

(declare-fun m!773707 () Bool)

(assert (=> b!830348 m!773707))

(declare-fun m!773709 () Bool)

(assert (=> b!830348 m!773709))

(declare-fun m!773711 () Bool)

(assert (=> b!830348 m!773711))

(declare-fun m!773713 () Bool)

(assert (=> b!830348 m!773713))

(declare-fun m!773715 () Bool)

(assert (=> b!830348 m!773715))

(assert (=> b!830348 m!773695))

(declare-fun m!773717 () Bool)

(assert (=> b!830348 m!773717))

(assert (=> b!830348 m!773713))

(assert (=> b!830348 m!773703))

(declare-fun m!773719 () Bool)

(assert (=> b!830348 m!773719))

(declare-fun m!773721 () Bool)

(assert (=> b!830348 m!773721))

(assert (=> b!830348 m!773601))

(declare-fun m!773723 () Bool)

(assert (=> b!830348 m!773723))

(declare-fun m!773725 () Bool)

(assert (=> bm!36183 m!773725))

(assert (=> b!830351 m!773601))

(assert (=> b!830351 m!773601))

(assert (=> b!830351 m!773607))

(declare-fun m!773727 () Bool)

(assert (=> bm!36188 m!773727))

(declare-fun m!773729 () Bool)

(assert (=> b!830353 m!773729))

(assert (=> d!105589 m!773495))

(assert (=> bm!36187 m!773505))

(assert (=> b!830352 m!773601))

(assert (=> b!830352 m!773601))

(assert (=> b!830352 m!773607))

(declare-fun m!773731 () Bool)

(assert (=> b!830354 m!773731))

(assert (=> b!830344 m!773601))

(declare-fun m!773733 () Bool)

(assert (=> b!830344 m!773733))

(assert (=> b!830344 m!773617))

(assert (=> b!830344 m!773619))

(assert (=> b!830344 m!773621))

(assert (=> b!830344 m!773619))

(assert (=> b!830344 m!773601))

(assert (=> b!830344 m!773617))

(declare-fun m!773735 () Bool)

(assert (=> b!830345 m!773735))

(assert (=> b!830346 m!773601))

(assert (=> b!830346 m!773601))

(declare-fun m!773737 () Bool)

(assert (=> b!830346 m!773737))

(declare-fun m!773739 () Bool)

(assert (=> bm!36186 m!773739))

(assert (=> b!830128 d!105589))

(declare-fun d!105591 () Bool)

(declare-fun e!462923 () Bool)

(assert (=> d!105591 e!462923))

(declare-fun res!565392 () Bool)

(assert (=> d!105591 (=> (not res!565392) (not e!462923))))

(declare-fun lt!376485 () ListLongMap!8875)

(assert (=> d!105591 (= res!565392 (contains!4177 lt!376485 (_1!5036 (tuple2!10051 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!376487 () List!15824)

(assert (=> d!105591 (= lt!376485 (ListLongMap!8876 lt!376487))))

(declare-fun lt!376488 () Unit!28422)

(declare-fun lt!376486 () Unit!28422)

(assert (=> d!105591 (= lt!376488 lt!376486)))

(assert (=> d!105591 (= (getValueByKey!413 lt!376487 (_1!5036 (tuple2!10051 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!418 (_2!5036 (tuple2!10051 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105591 (= lt!376486 (lemmaContainsTupThenGetReturnValue!227 lt!376487 (_1!5036 (tuple2!10051 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5036 (tuple2!10051 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105591 (= lt!376487 (insertStrictlySorted!266 (toList!4453 (+!1976 lt!376325 (tuple2!10051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (_1!5036 (tuple2!10051 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5036 (tuple2!10051 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105591 (= (+!1976 (+!1976 lt!376325 (tuple2!10051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (tuple2!10051 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) lt!376485)))

(declare-fun b!830363 () Bool)

(declare-fun res!565393 () Bool)

(assert (=> b!830363 (=> (not res!565393) (not e!462923))))

(assert (=> b!830363 (= res!565393 (= (getValueByKey!413 (toList!4453 lt!376485) (_1!5036 (tuple2!10051 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!418 (_2!5036 (tuple2!10051 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!830364 () Bool)

(assert (=> b!830364 (= e!462923 (contains!4178 (toList!4453 lt!376485) (tuple2!10051 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(assert (= (and d!105591 res!565392) b!830363))

(assert (= (and b!830363 res!565393) b!830364))

(declare-fun m!773741 () Bool)

(assert (=> d!105591 m!773741))

(declare-fun m!773743 () Bool)

(assert (=> d!105591 m!773743))

(declare-fun m!773745 () Bool)

(assert (=> d!105591 m!773745))

(declare-fun m!773747 () Bool)

(assert (=> d!105591 m!773747))

(declare-fun m!773749 () Bool)

(assert (=> b!830363 m!773749))

(declare-fun m!773751 () Bool)

(assert (=> b!830364 m!773751))

(assert (=> b!830128 d!105591))

(declare-fun d!105593 () Bool)

(declare-fun e!462924 () Bool)

(assert (=> d!105593 e!462924))

(declare-fun res!565394 () Bool)

(assert (=> d!105593 (=> (not res!565394) (not e!462924))))

(declare-fun lt!376489 () ListLongMap!8875)

(assert (=> d!105593 (= res!565394 (contains!4177 lt!376489 (_1!5036 (tuple2!10051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!376491 () List!15824)

(assert (=> d!105593 (= lt!376489 (ListLongMap!8876 lt!376491))))

(declare-fun lt!376492 () Unit!28422)

(declare-fun lt!376490 () Unit!28422)

(assert (=> d!105593 (= lt!376492 lt!376490)))

(assert (=> d!105593 (= (getValueByKey!413 lt!376491 (_1!5036 (tuple2!10051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!418 (_2!5036 (tuple2!10051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105593 (= lt!376490 (lemmaContainsTupThenGetReturnValue!227 lt!376491 (_1!5036 (tuple2!10051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5036 (tuple2!10051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105593 (= lt!376491 (insertStrictlySorted!266 (toList!4453 lt!376325) (_1!5036 (tuple2!10051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5036 (tuple2!10051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105593 (= (+!1976 lt!376325 (tuple2!10051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!376489)))

(declare-fun b!830365 () Bool)

(declare-fun res!565395 () Bool)

(assert (=> b!830365 (=> (not res!565395) (not e!462924))))

(assert (=> b!830365 (= res!565395 (= (getValueByKey!413 (toList!4453 lt!376489) (_1!5036 (tuple2!10051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!418 (_2!5036 (tuple2!10051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!830366 () Bool)

(assert (=> b!830366 (= e!462924 (contains!4178 (toList!4453 lt!376489) (tuple2!10051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!105593 res!565394) b!830365))

(assert (= (and b!830365 res!565395) b!830366))

(declare-fun m!773753 () Bool)

(assert (=> d!105593 m!773753))

(declare-fun m!773755 () Bool)

(assert (=> d!105593 m!773755))

(declare-fun m!773757 () Bool)

(assert (=> d!105593 m!773757))

(declare-fun m!773759 () Bool)

(assert (=> d!105593 m!773759))

(declare-fun m!773761 () Bool)

(assert (=> b!830365 m!773761))

(declare-fun m!773763 () Bool)

(assert (=> b!830366 m!773763))

(assert (=> b!830128 d!105593))

(declare-fun condMapEmpty!24415 () Bool)

(declare-fun mapDefault!24415 () ValueCell!7172)

(assert (=> mapNonEmpty!24406 (= condMapEmpty!24415 (= mapRest!24406 ((as const (Array (_ BitVec 32) ValueCell!7172)) mapDefault!24415)))))

(declare-fun e!462930 () Bool)

(declare-fun mapRes!24415 () Bool)

(assert (=> mapNonEmpty!24406 (= tp!47172 (and e!462930 mapRes!24415))))

(declare-fun b!830374 () Bool)

(assert (=> b!830374 (= e!462930 tp_is_empty!15175)))

(declare-fun b!830373 () Bool)

(declare-fun e!462929 () Bool)

(assert (=> b!830373 (= e!462929 tp_is_empty!15175)))

(declare-fun mapIsEmpty!24415 () Bool)

(assert (=> mapIsEmpty!24415 mapRes!24415))

(declare-fun mapNonEmpty!24415 () Bool)

(declare-fun tp!47188 () Bool)

(assert (=> mapNonEmpty!24415 (= mapRes!24415 (and tp!47188 e!462929))))

(declare-fun mapKey!24415 () (_ BitVec 32))

(declare-fun mapRest!24415 () (Array (_ BitVec 32) ValueCell!7172))

(declare-fun mapValue!24415 () ValueCell!7172)

(assert (=> mapNonEmpty!24415 (= mapRest!24406 (store mapRest!24415 mapKey!24415 mapValue!24415))))

(assert (= (and mapNonEmpty!24406 condMapEmpty!24415) mapIsEmpty!24415))

(assert (= (and mapNonEmpty!24406 (not condMapEmpty!24415)) mapNonEmpty!24415))

(assert (= (and mapNonEmpty!24415 ((_ is ValueCellFull!7172) mapValue!24415)) b!830373))

(assert (= (and mapNonEmpty!24406 ((_ is ValueCellFull!7172) mapDefault!24415)) b!830374))

(declare-fun m!773765 () Bool)

(assert (=> mapNonEmpty!24415 m!773765))

(declare-fun b_lambda!11301 () Bool)

(assert (= b_lambda!11297 (or (and start!71568 b_free!13465) b_lambda!11301)))

(declare-fun b_lambda!11303 () Bool)

(assert (= b_lambda!11299 (or (and start!71568 b_free!13465) b_lambda!11303)))

(declare-fun b_lambda!11305 () Bool)

(assert (= b_lambda!11295 (or (and start!71568 b_free!13465) b_lambda!11305)))

(declare-fun b_lambda!11307 () Bool)

(assert (= b_lambda!11291 (or (and start!71568 b_free!13465) b_lambda!11307)))

(declare-fun b_lambda!11309 () Bool)

(assert (= b_lambda!11289 (or (and start!71568 b_free!13465) b_lambda!11309)))

(declare-fun b_lambda!11311 () Bool)

(assert (= b_lambda!11293 (or (and start!71568 b_free!13465) b_lambda!11311)))

(check-sat (not b!830328) (not b_lambda!11311) (not d!105589) (not d!105587) (not bm!36166) (not bm!36186) (not bm!36174) (not b!830327) (not b!830240) (not bm!36183) (not b_lambda!11309) (not b!830318) (not b!830326) (not b!830250) (not b!830339) (not bm!36187) tp_is_empty!15175 (not d!105583) (not mapNonEmpty!24415) (not b!830351) (not b!830265) (not b!830366) (not b!830345) b_and!22485 (not b!830330) (not b!830248) (not b_lambda!11305) (not b!830352) (not b!830247) (not b!830266) (not b!830292) (not d!105571) (not bm!36181) (not b!830325) (not bm!36170) (not b!830340) (not b_lambda!11303) (not b!830354) (not bm!36180) (not b!830344) (not bm!36169) (not d!105593) (not b!830364) (not b!830338) (not b!830275) (not d!105585) (not b!830337) (not b!830289) (not b_next!13465) (not b!830290) (not b!830346) (not b_lambda!11307) (not b!830319) (not bm!36171) (not b!830365) (not b!830334) (not b!830277) (not b!830244) (not b!830348) (not b!830241) (not b!830331) (not bm!36188) (not d!105591) (not b!830242) (not bm!36177) (not b!830363) (not b_lambda!11301) (not b!830321) (not b!830333) (not d!105569) (not b!830249) (not b!830322) (not b!830353))
(check-sat b_and!22485 (not b_next!13465))
