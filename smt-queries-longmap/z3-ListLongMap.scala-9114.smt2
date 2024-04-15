; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109468 () Bool)

(assert start!109468)

(declare-fun b_free!28957 () Bool)

(declare-fun b_next!28957 () Bool)

(assert (=> start!109468 (= b_free!28957 (not b_next!28957))))

(declare-fun tp!101990 () Bool)

(declare-fun b_and!47029 () Bool)

(assert (=> start!109468 (= tp!101990 b_and!47029)))

(declare-fun res!861616 () Bool)

(declare-fun e!739604 () Bool)

(assert (=> start!109468 (=> (not res!861616) (not e!739604))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109468 (= res!861616 (validMask!0 mask!2175))))

(assert (=> start!109468 e!739604))

(declare-fun tp_is_empty!34597 () Bool)

(assert (=> start!109468 tp_is_empty!34597))

(assert (=> start!109468 true))

(declare-datatypes ((V!51233 0))(
  ( (V!51234 (val!17373 Int)) )
))
(declare-datatypes ((ValueCell!16400 0))(
  ( (ValueCellFull!16400 (v!19975 V!51233)) (EmptyCell!16400) )
))
(declare-datatypes ((array!86105 0))(
  ( (array!86106 (arr!41554 (Array (_ BitVec 32) ValueCell!16400)) (size!42106 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86105)

(declare-fun e!739598 () Bool)

(declare-fun array_inv!31617 (array!86105) Bool)

(assert (=> start!109468 (and (array_inv!31617 _values!1445) e!739598)))

(declare-datatypes ((array!86107 0))(
  ( (array!86108 (arr!41555 (Array (_ BitVec 32) (_ BitVec 64))) (size!42107 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86107)

(declare-fun array_inv!31618 (array!86107) Bool)

(assert (=> start!109468 (array_inv!31618 _keys!1741)))

(assert (=> start!109468 tp!101990))

(declare-fun minValue!1387 () V!51233)

(declare-fun zeroValue!1387 () V!51233)

(declare-datatypes ((tuple2!22436 0))(
  ( (tuple2!22437 (_1!11229 (_ BitVec 64)) (_2!11229 V!51233)) )
))
(declare-datatypes ((List!29564 0))(
  ( (Nil!29561) (Cons!29560 (h!30769 tuple2!22436) (t!43120 List!29564)) )
))
(declare-datatypes ((ListLongMap!20093 0))(
  ( (ListLongMap!20094 (toList!10062 List!29564)) )
))
(declare-fun lt!580208 () ListLongMap!20093)

(declare-fun bm!63404 () Bool)

(declare-fun lt!580216 () ListLongMap!20093)

(declare-fun lt!580213 () ListLongMap!20093)

(declare-fun c!124379 () Bool)

(declare-fun c!124378 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((Unit!42795 0))(
  ( (Unit!42796) )
))
(declare-fun call!63416 () Unit!42795)

(declare-fun addStillNotContains!447 (ListLongMap!20093 (_ BitVec 64) V!51233 (_ BitVec 64)) Unit!42795)

(assert (=> bm!63404 (= call!63416 (addStillNotContains!447 (ite c!124379 lt!580216 (ite c!124378 lt!580208 lt!580213)) (ite c!124379 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124378 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124379 minValue!1387 (ite c!124378 zeroValue!1387 minValue!1387)) k0!1205))))

(declare-fun b!1296383 () Bool)

(declare-fun e!739602 () Unit!42795)

(declare-fun lt!580222 () Unit!42795)

(assert (=> b!1296383 (= e!739602 lt!580222)))

(declare-fun call!63408 () ListLongMap!20093)

(assert (=> b!1296383 (= lt!580213 call!63408)))

(declare-fun lt!580220 () Unit!42795)

(declare-fun call!63407 () Unit!42795)

(assert (=> b!1296383 (= lt!580220 call!63407)))

(declare-fun call!63415 () Bool)

(assert (=> b!1296383 (not call!63415)))

(declare-fun call!63412 () Unit!42795)

(assert (=> b!1296383 (= lt!580222 call!63412)))

(declare-fun call!63411 () Bool)

(assert (=> b!1296383 call!63411))

(declare-fun mapIsEmpty!53456 () Bool)

(declare-fun mapRes!53456 () Bool)

(assert (=> mapIsEmpty!53456 mapRes!53456))

(declare-fun b!1296384 () Bool)

(declare-fun res!861614 () Bool)

(assert (=> b!1296384 (=> (not res!861614) (not e!739604))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1296384 (= res!861614 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42107 _keys!1741))))))

(declare-fun b!1296385 () Bool)

(declare-fun e!739603 () Unit!42795)

(declare-fun lt!580218 () Unit!42795)

(assert (=> b!1296385 (= e!739603 lt!580218)))

(declare-fun call!63410 () ListLongMap!20093)

(assert (=> b!1296385 (= lt!580216 call!63410)))

(declare-fun lt!580207 () Unit!42795)

(assert (=> b!1296385 (= lt!580207 (addStillNotContains!447 lt!580216 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun lt!580215 () ListLongMap!20093)

(declare-fun call!63417 () ListLongMap!20093)

(assert (=> b!1296385 (= lt!580215 call!63417)))

(declare-fun call!63418 () Bool)

(assert (=> b!1296385 (not call!63418)))

(declare-fun lt!580219 () Unit!42795)

(assert (=> b!1296385 (= lt!580219 call!63416)))

(declare-fun contains!8110 (ListLongMap!20093 (_ BitVec 64)) Bool)

(declare-fun +!4471 (ListLongMap!20093 tuple2!22436) ListLongMap!20093)

(assert (=> b!1296385 (not (contains!8110 (+!4471 lt!580216 (tuple2!22437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!580211 () Unit!42795)

(declare-fun call!63409 () Unit!42795)

(assert (=> b!1296385 (= lt!580211 call!63409)))

(assert (=> b!1296385 false))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!70 ((_ BitVec 64) (_ BitVec 64) V!51233 ListLongMap!20093) Unit!42795)

(assert (=> b!1296385 (= lt!580218 (lemmaInListMapAfterAddingDiffThenInBefore!70 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!580216))))

(declare-fun lt!580217 () Bool)

(declare-fun call!63414 () Bool)

(assert (=> b!1296385 (= lt!580217 call!63414)))

(declare-fun bm!63405 () Bool)

(declare-fun call!63413 () ListLongMap!20093)

(assert (=> bm!63405 (= call!63413 call!63417)))

(declare-fun b!1296386 () Bool)

(assert (=> b!1296386 call!63411))

(declare-fun lt!580212 () Unit!42795)

(assert (=> b!1296386 (= lt!580212 call!63412)))

(assert (=> b!1296386 (not call!63415)))

(declare-fun lt!580209 () Unit!42795)

(assert (=> b!1296386 (= lt!580209 call!63407)))

(assert (=> b!1296386 (= lt!580208 call!63408)))

(declare-fun e!739599 () Unit!42795)

(assert (=> b!1296386 (= e!739599 lt!580212)))

(declare-fun bm!63406 () Bool)

(assert (=> bm!63406 (= call!63417 (+!4471 (ite c!124379 lt!580216 (ite c!124378 lt!580208 lt!580213)) (ite (or c!124379 c!124378) (tuple2!22437 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun bm!63407 () Bool)

(assert (=> bm!63407 (= call!63408 call!63410)))

(declare-fun bm!63408 () Bool)

(assert (=> bm!63408 (= call!63412 call!63409)))

(declare-fun bm!63409 () Bool)

(assert (=> bm!63409 (= call!63418 (contains!8110 (ite c!124379 lt!580215 call!63413) k0!1205))))

(declare-fun b!1296387 () Bool)

(declare-fun e!739601 () Bool)

(assert (=> b!1296387 (= e!739598 (and e!739601 mapRes!53456))))

(declare-fun condMapEmpty!53456 () Bool)

(declare-fun mapDefault!53456 () ValueCell!16400)

(assert (=> b!1296387 (= condMapEmpty!53456 (= (arr!41554 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16400)) mapDefault!53456)))))

(declare-fun bm!63410 () Bool)

(assert (=> bm!63410 (= call!63415 call!63418)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun bm!63411 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6103 (array!86107 array!86105 (_ BitVec 32) (_ BitVec 32) V!51233 V!51233 (_ BitVec 32) Int) ListLongMap!20093)

(assert (=> bm!63411 (= call!63410 (getCurrentListMapNoExtraKeys!6103 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1296388 () Bool)

(declare-fun res!861613 () Bool)

(assert (=> b!1296388 (=> (not res!861613) (not e!739604))))

(assert (=> b!1296388 (= res!861613 (and (= (size!42106 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42107 _keys!1741) (size!42106 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun bm!63412 () Bool)

(assert (=> bm!63412 (= call!63409 (lemmaInListMapAfterAddingDiffThenInBefore!70 k0!1205 (ite c!124379 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124378 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124379 minValue!1387 (ite c!124378 zeroValue!1387 minValue!1387)) (ite c!124379 lt!580215 (ite c!124378 lt!580208 lt!580213))))))

(declare-fun b!1296389 () Bool)

(declare-fun Unit!42797 () Unit!42795)

(assert (=> b!1296389 (= e!739602 Unit!42797)))

(declare-fun b!1296390 () Bool)

(assert (=> b!1296390 (= e!739601 tp_is_empty!34597)))

(declare-fun b!1296391 () Bool)

(declare-fun c!124380 () Bool)

(declare-fun lt!580221 () Bool)

(assert (=> b!1296391 (= c!124380 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!580221))))

(assert (=> b!1296391 (= e!739599 e!739602)))

(declare-fun mapNonEmpty!53456 () Bool)

(declare-fun tp!101991 () Bool)

(declare-fun e!739600 () Bool)

(assert (=> mapNonEmpty!53456 (= mapRes!53456 (and tp!101991 e!739600))))

(declare-fun mapKey!53456 () (_ BitVec 32))

(declare-fun mapValue!53456 () ValueCell!16400)

(declare-fun mapRest!53456 () (Array (_ BitVec 32) ValueCell!16400))

(assert (=> mapNonEmpty!53456 (= (arr!41554 _values!1445) (store mapRest!53456 mapKey!53456 mapValue!53456))))

(declare-fun bm!63413 () Bool)

(assert (=> bm!63413 (= call!63411 call!63414)))

(declare-fun bm!63414 () Bool)

(assert (=> bm!63414 (= call!63407 call!63416)))

(declare-fun bm!63415 () Bool)

(assert (=> bm!63415 (= call!63414 (contains!8110 (ite c!124379 lt!580216 (ite c!124378 lt!580208 lt!580213)) k0!1205))))

(declare-fun b!1296392 () Bool)

(declare-fun res!861611 () Bool)

(assert (=> b!1296392 (=> (not res!861611) (not e!739604))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86107 (_ BitVec 32)) Bool)

(assert (=> b!1296392 (= res!861611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1296393 () Bool)

(declare-fun res!861618 () Bool)

(assert (=> b!1296393 (=> (not res!861618) (not e!739604))))

(assert (=> b!1296393 (= res!861618 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42107 _keys!1741))))))

(declare-fun b!1296394 () Bool)

(assert (=> b!1296394 (= e!739603 e!739599)))

(assert (=> b!1296394 (= c!124378 (and (not lt!580221) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1296395 () Bool)

(assert (=> b!1296395 (= e!739604 (not true))))

(declare-fun lt!580210 () Unit!42795)

(assert (=> b!1296395 (= lt!580210 e!739603)))

(assert (=> b!1296395 (= c!124379 (and (not lt!580221) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1296395 (= lt!580221 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1296395 (not (contains!8110 (ListLongMap!20094 Nil!29561) k0!1205))))

(declare-fun lt!580214 () Unit!42795)

(declare-fun emptyContainsNothing!185 ((_ BitVec 64)) Unit!42795)

(assert (=> b!1296395 (= lt!580214 (emptyContainsNothing!185 k0!1205))))

(declare-fun b!1296396 () Bool)

(declare-fun res!861615 () Bool)

(assert (=> b!1296396 (=> (not res!861615) (not e!739604))))

(declare-fun getCurrentListMap!4979 (array!86107 array!86105 (_ BitVec 32) (_ BitVec 32) V!51233 V!51233 (_ BitVec 32) Int) ListLongMap!20093)

(assert (=> b!1296396 (= res!861615 (contains!8110 (getCurrentListMap!4979 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1296397 () Bool)

(declare-fun res!861612 () Bool)

(assert (=> b!1296397 (=> (not res!861612) (not e!739604))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1296397 (= res!861612 (not (validKeyInArray!0 (select (arr!41555 _keys!1741) from!2144))))))

(declare-fun b!1296398 () Bool)

(assert (=> b!1296398 (= e!739600 tp_is_empty!34597)))

(declare-fun b!1296399 () Bool)

(declare-fun res!861617 () Bool)

(assert (=> b!1296399 (=> (not res!861617) (not e!739604))))

(declare-datatypes ((List!29565 0))(
  ( (Nil!29562) (Cons!29561 (h!30770 (_ BitVec 64)) (t!43121 List!29565)) )
))
(declare-fun arrayNoDuplicates!0 (array!86107 (_ BitVec 32) List!29565) Bool)

(assert (=> b!1296399 (= res!861617 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29562))))

(assert (= (and start!109468 res!861616) b!1296388))

(assert (= (and b!1296388 res!861613) b!1296392))

(assert (= (and b!1296392 res!861611) b!1296399))

(assert (= (and b!1296399 res!861617) b!1296393))

(assert (= (and b!1296393 res!861618) b!1296396))

(assert (= (and b!1296396 res!861615) b!1296384))

(assert (= (and b!1296384 res!861614) b!1296397))

(assert (= (and b!1296397 res!861612) b!1296395))

(assert (= (and b!1296395 c!124379) b!1296385))

(assert (= (and b!1296395 (not c!124379)) b!1296394))

(assert (= (and b!1296394 c!124378) b!1296386))

(assert (= (and b!1296394 (not c!124378)) b!1296391))

(assert (= (and b!1296391 c!124380) b!1296383))

(assert (= (and b!1296391 (not c!124380)) b!1296389))

(assert (= (or b!1296386 b!1296383) bm!63413))

(assert (= (or b!1296386 b!1296383) bm!63414))

(assert (= (or b!1296386 b!1296383) bm!63407))

(assert (= (or b!1296386 b!1296383) bm!63408))

(assert (= (or b!1296386 b!1296383) bm!63405))

(assert (= (or b!1296386 b!1296383) bm!63410))

(assert (= (or b!1296385 bm!63408) bm!63412))

(assert (= (or b!1296385 bm!63413) bm!63415))

(assert (= (or b!1296385 bm!63410) bm!63409))

(assert (= (or b!1296385 bm!63405) bm!63406))

(assert (= (or b!1296385 bm!63414) bm!63404))

(assert (= (or b!1296385 bm!63407) bm!63411))

(assert (= (and b!1296387 condMapEmpty!53456) mapIsEmpty!53456))

(assert (= (and b!1296387 (not condMapEmpty!53456)) mapNonEmpty!53456))

(get-info :version)

(assert (= (and mapNonEmpty!53456 ((_ is ValueCellFull!16400) mapValue!53456)) b!1296398))

(assert (= (and b!1296387 ((_ is ValueCellFull!16400) mapDefault!53456)) b!1296390))

(assert (= start!109468 b!1296387))

(declare-fun m!1187835 () Bool)

(assert (=> bm!63415 m!1187835))

(declare-fun m!1187837 () Bool)

(assert (=> b!1296396 m!1187837))

(assert (=> b!1296396 m!1187837))

(declare-fun m!1187839 () Bool)

(assert (=> b!1296396 m!1187839))

(declare-fun m!1187841 () Bool)

(assert (=> b!1296385 m!1187841))

(declare-fun m!1187843 () Bool)

(assert (=> b!1296385 m!1187843))

(assert (=> b!1296385 m!1187843))

(declare-fun m!1187845 () Bool)

(assert (=> b!1296385 m!1187845))

(declare-fun m!1187847 () Bool)

(assert (=> b!1296385 m!1187847))

(declare-fun m!1187849 () Bool)

(assert (=> b!1296392 m!1187849))

(declare-fun m!1187851 () Bool)

(assert (=> bm!63406 m!1187851))

(declare-fun m!1187853 () Bool)

(assert (=> b!1296399 m!1187853))

(declare-fun m!1187855 () Bool)

(assert (=> bm!63409 m!1187855))

(declare-fun m!1187857 () Bool)

(assert (=> b!1296395 m!1187857))

(declare-fun m!1187859 () Bool)

(assert (=> b!1296395 m!1187859))

(declare-fun m!1187861 () Bool)

(assert (=> b!1296397 m!1187861))

(assert (=> b!1296397 m!1187861))

(declare-fun m!1187863 () Bool)

(assert (=> b!1296397 m!1187863))

(declare-fun m!1187865 () Bool)

(assert (=> bm!63404 m!1187865))

(declare-fun m!1187867 () Bool)

(assert (=> bm!63411 m!1187867))

(declare-fun m!1187869 () Bool)

(assert (=> mapNonEmpty!53456 m!1187869))

(declare-fun m!1187871 () Bool)

(assert (=> bm!63412 m!1187871))

(declare-fun m!1187873 () Bool)

(assert (=> start!109468 m!1187873))

(declare-fun m!1187875 () Bool)

(assert (=> start!109468 m!1187875))

(declare-fun m!1187877 () Bool)

(assert (=> start!109468 m!1187877))

(check-sat tp_is_empty!34597 b_and!47029 (not b!1296395) (not b!1296392) (not b!1296399) (not b!1296396) (not bm!63404) (not b_next!28957) (not bm!63406) (not bm!63411) (not bm!63412) (not bm!63409) (not start!109468) (not b!1296397) (not bm!63415) (not b!1296385) (not mapNonEmpty!53456))
(check-sat b_and!47029 (not b_next!28957))
