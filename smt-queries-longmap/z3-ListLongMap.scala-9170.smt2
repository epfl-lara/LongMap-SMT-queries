; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110446 () Bool)

(assert start!110446)

(declare-fun b_free!29293 () Bool)

(declare-fun b_next!29293 () Bool)

(assert (=> start!110446 (= b_free!29293 (not b_next!29293))))

(declare-fun tp!103040 () Bool)

(declare-fun b_and!47485 () Bool)

(assert (=> start!110446 (= tp!103040 b_and!47485)))

(declare-fun mapNonEmpty!54003 () Bool)

(declare-fun mapRes!54003 () Bool)

(declare-fun tp!103041 () Bool)

(declare-fun e!745120 () Bool)

(assert (=> mapNonEmpty!54003 (= mapRes!54003 (and tp!103041 e!745120))))

(declare-datatypes ((V!51681 0))(
  ( (V!51682 (val!17541 Int)) )
))
(declare-datatypes ((ValueCell!16568 0))(
  ( (ValueCellFull!16568 (v!20157 V!51681)) (EmptyCell!16568) )
))
(declare-fun mapValue!54003 () ValueCell!16568)

(declare-fun mapKey!54003 () (_ BitVec 32))

(declare-datatypes ((array!86925 0))(
  ( (array!86926 (arr!41946 (Array (_ BitVec 32) ValueCell!16568)) (size!42497 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86925)

(declare-fun mapRest!54003 () (Array (_ BitVec 32) ValueCell!16568))

(assert (=> mapNonEmpty!54003 (= (arr!41946 _values!1445) (store mapRest!54003 mapKey!54003 mapValue!54003))))

(declare-fun b!1306096 () Bool)

(declare-fun res!867024 () Bool)

(declare-fun e!745119 () Bool)

(assert (=> b!1306096 (=> (not res!867024) (not e!745119))))

(declare-fun minValue!1387 () V!51681)

(declare-fun zeroValue!1387 () V!51681)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86927 0))(
  ( (array!86928 (arr!41947 (Array (_ BitVec 32) (_ BitVec 64))) (size!42498 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86927)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22668 0))(
  ( (tuple2!22669 (_1!11345 (_ BitVec 64)) (_2!11345 V!51681)) )
))
(declare-datatypes ((List!29811 0))(
  ( (Nil!29808) (Cons!29807 (h!31025 tuple2!22668) (t!43403 List!29811)) )
))
(declare-datatypes ((ListLongMap!20333 0))(
  ( (ListLongMap!20334 (toList!10182 List!29811)) )
))
(declare-fun contains!8336 (ListLongMap!20333 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5190 (array!86927 array!86925 (_ BitVec 32) (_ BitVec 32) V!51681 V!51681 (_ BitVec 32) Int) ListLongMap!20333)

(assert (=> b!1306096 (= res!867024 (contains!8336 (getCurrentListMap!5190 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1306097 () Bool)

(declare-fun res!867023 () Bool)

(assert (=> b!1306097 (=> (not res!867023) (not e!745119))))

(assert (=> b!1306097 (= res!867023 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42498 _keys!1741))))))

(declare-fun res!867020 () Bool)

(assert (=> start!110446 (=> (not res!867020) (not e!745119))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110446 (= res!867020 (validMask!0 mask!2175))))

(assert (=> start!110446 e!745119))

(declare-fun tp_is_empty!34933 () Bool)

(assert (=> start!110446 tp_is_empty!34933))

(assert (=> start!110446 true))

(declare-fun e!745117 () Bool)

(declare-fun array_inv!31969 (array!86925) Bool)

(assert (=> start!110446 (and (array_inv!31969 _values!1445) e!745117)))

(declare-fun array_inv!31970 (array!86927) Bool)

(assert (=> start!110446 (array_inv!31970 _keys!1741)))

(assert (=> start!110446 tp!103040))

(declare-fun b!1306098 () Bool)

(assert (=> b!1306098 (= e!745120 tp_is_empty!34933)))

(declare-fun b!1306099 () Bool)

(declare-fun res!867019 () Bool)

(assert (=> b!1306099 (=> (not res!867019) (not e!745119))))

(declare-datatypes ((List!29812 0))(
  ( (Nil!29809) (Cons!29808 (h!31026 (_ BitVec 64)) (t!43404 List!29812)) )
))
(declare-fun arrayNoDuplicates!0 (array!86927 (_ BitVec 32) List!29812) Bool)

(assert (=> b!1306099 (= res!867019 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29809))))

(declare-fun b!1306100 () Bool)

(declare-fun res!867018 () Bool)

(assert (=> b!1306100 (=> (not res!867018) (not e!745119))))

(assert (=> b!1306100 (= res!867018 (and (= (size!42497 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42498 _keys!1741) (size!42497 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1306101 () Bool)

(declare-fun res!867022 () Bool)

(assert (=> b!1306101 (=> (not res!867022) (not e!745119))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1306101 (= res!867022 (not (validKeyInArray!0 (select (arr!41947 _keys!1741) from!2144))))))

(declare-fun b!1306102 () Bool)

(declare-fun e!745115 () Bool)

(assert (=> b!1306102 (= e!745115 tp_is_empty!34933)))

(declare-fun b!1306103 () Bool)

(assert (=> b!1306103 (= e!745117 (and e!745115 mapRes!54003))))

(declare-fun condMapEmpty!54003 () Bool)

(declare-fun mapDefault!54003 () ValueCell!16568)

(assert (=> b!1306103 (= condMapEmpty!54003 (= (arr!41946 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16568)) mapDefault!54003)))))

(declare-fun b!1306104 () Bool)

(declare-fun e!745116 () Bool)

(assert (=> b!1306104 (= e!745116 false)))

(declare-fun lt!584501 () ListLongMap!20333)

(declare-fun +!4535 (ListLongMap!20333 tuple2!22668) ListLongMap!20333)

(assert (=> b!1306104 (not (contains!8336 (+!4535 lt!584501 (tuple2!22669 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-datatypes ((Unit!43180 0))(
  ( (Unit!43181) )
))
(declare-fun lt!584502 () Unit!43180)

(declare-fun addStillNotContains!486 (ListLongMap!20333 (_ BitVec 64) V!51681 (_ BitVec 64)) Unit!43180)

(assert (=> b!1306104 (= lt!584502 (addStillNotContains!486 lt!584501 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6175 (array!86927 array!86925 (_ BitVec 32) (_ BitVec 32) V!51681 V!51681 (_ BitVec 32) Int) ListLongMap!20333)

(assert (=> b!1306104 (= lt!584501 (getCurrentListMapNoExtraKeys!6175 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1306105 () Bool)

(declare-fun res!867025 () Bool)

(assert (=> b!1306105 (=> (not res!867025) (not e!745119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86927 (_ BitVec 32)) Bool)

(assert (=> b!1306105 (= res!867025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1306106 () Bool)

(declare-fun res!867021 () Bool)

(assert (=> b!1306106 (=> (not res!867021) (not e!745119))))

(assert (=> b!1306106 (= res!867021 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42498 _keys!1741))))))

(declare-fun b!1306107 () Bool)

(assert (=> b!1306107 (= e!745119 (not e!745116))))

(declare-fun res!867026 () Bool)

(assert (=> b!1306107 (=> res!867026 e!745116)))

(assert (=> b!1306107 (= res!867026 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1306107 (not (contains!8336 (ListLongMap!20334 Nil!29808) k0!1205))))

(declare-fun lt!584500 () Unit!43180)

(declare-fun emptyContainsNothing!230 ((_ BitVec 64)) Unit!43180)

(assert (=> b!1306107 (= lt!584500 (emptyContainsNothing!230 k0!1205))))

(declare-fun mapIsEmpty!54003 () Bool)

(assert (=> mapIsEmpty!54003 mapRes!54003))

(assert (= (and start!110446 res!867020) b!1306100))

(assert (= (and b!1306100 res!867018) b!1306105))

(assert (= (and b!1306105 res!867025) b!1306099))

(assert (= (and b!1306099 res!867019) b!1306106))

(assert (= (and b!1306106 res!867021) b!1306096))

(assert (= (and b!1306096 res!867024) b!1306097))

(assert (= (and b!1306097 res!867023) b!1306101))

(assert (= (and b!1306101 res!867022) b!1306107))

(assert (= (and b!1306107 (not res!867026)) b!1306104))

(assert (= (and b!1306103 condMapEmpty!54003) mapIsEmpty!54003))

(assert (= (and b!1306103 (not condMapEmpty!54003)) mapNonEmpty!54003))

(get-info :version)

(assert (= (and mapNonEmpty!54003 ((_ is ValueCellFull!16568) mapValue!54003)) b!1306098))

(assert (= (and b!1306103 ((_ is ValueCellFull!16568) mapDefault!54003)) b!1306102))

(assert (= start!110446 b!1306103))

(declare-fun m!1197469 () Bool)

(assert (=> b!1306099 m!1197469))

(declare-fun m!1197471 () Bool)

(assert (=> b!1306096 m!1197471))

(assert (=> b!1306096 m!1197471))

(declare-fun m!1197473 () Bool)

(assert (=> b!1306096 m!1197473))

(declare-fun m!1197475 () Bool)

(assert (=> b!1306104 m!1197475))

(assert (=> b!1306104 m!1197475))

(declare-fun m!1197477 () Bool)

(assert (=> b!1306104 m!1197477))

(declare-fun m!1197479 () Bool)

(assert (=> b!1306104 m!1197479))

(declare-fun m!1197481 () Bool)

(assert (=> b!1306104 m!1197481))

(declare-fun m!1197483 () Bool)

(assert (=> b!1306105 m!1197483))

(declare-fun m!1197485 () Bool)

(assert (=> mapNonEmpty!54003 m!1197485))

(declare-fun m!1197487 () Bool)

(assert (=> b!1306107 m!1197487))

(declare-fun m!1197489 () Bool)

(assert (=> b!1306107 m!1197489))

(declare-fun m!1197491 () Bool)

(assert (=> b!1306101 m!1197491))

(assert (=> b!1306101 m!1197491))

(declare-fun m!1197493 () Bool)

(assert (=> b!1306101 m!1197493))

(declare-fun m!1197495 () Bool)

(assert (=> start!110446 m!1197495))

(declare-fun m!1197497 () Bool)

(assert (=> start!110446 m!1197497))

(declare-fun m!1197499 () Bool)

(assert (=> start!110446 m!1197499))

(check-sat (not b!1306107) tp_is_empty!34933 (not b!1306099) (not mapNonEmpty!54003) (not b!1306101) (not start!110446) (not b!1306096) (not b!1306104) (not b_next!29293) (not b!1306105) b_and!47485)
(check-sat b_and!47485 (not b_next!29293))
(get-model)

(declare-fun d!142393 () Bool)

(declare-fun e!745162 () Bool)

(assert (=> d!142393 e!745162))

(declare-fun res!867083 () Bool)

(assert (=> d!142393 (=> res!867083 e!745162)))

(declare-fun lt!584530 () Bool)

(assert (=> d!142393 (= res!867083 (not lt!584530))))

(declare-fun lt!584531 () Bool)

(assert (=> d!142393 (= lt!584530 lt!584531)))

(declare-fun lt!584532 () Unit!43180)

(declare-fun e!745161 () Unit!43180)

(assert (=> d!142393 (= lt!584532 e!745161)))

(declare-fun c!125700 () Bool)

(assert (=> d!142393 (= c!125700 lt!584531)))

(declare-fun containsKey!730 (List!29811 (_ BitVec 64)) Bool)

(assert (=> d!142393 (= lt!584531 (containsKey!730 (toList!10182 (+!4535 lt!584501 (tuple2!22669 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))

(assert (=> d!142393 (= (contains!8336 (+!4535 lt!584501 (tuple2!22669 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205) lt!584530)))

(declare-fun b!1306186 () Bool)

(declare-fun lt!584529 () Unit!43180)

(assert (=> b!1306186 (= e!745161 lt!584529)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!476 (List!29811 (_ BitVec 64)) Unit!43180)

(assert (=> b!1306186 (= lt!584529 (lemmaContainsKeyImpliesGetValueByKeyDefined!476 (toList!10182 (+!4535 lt!584501 (tuple2!22669 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))

(declare-datatypes ((Option!755 0))(
  ( (Some!754 (v!20160 V!51681)) (None!753) )
))
(declare-fun isDefined!513 (Option!755) Bool)

(declare-fun getValueByKey!704 (List!29811 (_ BitVec 64)) Option!755)

(assert (=> b!1306186 (isDefined!513 (getValueByKey!704 (toList!10182 (+!4535 lt!584501 (tuple2!22669 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))

(declare-fun b!1306187 () Bool)

(declare-fun Unit!43182 () Unit!43180)

(assert (=> b!1306187 (= e!745161 Unit!43182)))

(declare-fun b!1306188 () Bool)

(assert (=> b!1306188 (= e!745162 (isDefined!513 (getValueByKey!704 (toList!10182 (+!4535 lt!584501 (tuple2!22669 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205)))))

(assert (= (and d!142393 c!125700) b!1306186))

(assert (= (and d!142393 (not c!125700)) b!1306187))

(assert (= (and d!142393 (not res!867083)) b!1306188))

(declare-fun m!1197565 () Bool)

(assert (=> d!142393 m!1197565))

(declare-fun m!1197567 () Bool)

(assert (=> b!1306186 m!1197567))

(declare-fun m!1197569 () Bool)

(assert (=> b!1306186 m!1197569))

(assert (=> b!1306186 m!1197569))

(declare-fun m!1197571 () Bool)

(assert (=> b!1306186 m!1197571))

(assert (=> b!1306188 m!1197569))

(assert (=> b!1306188 m!1197569))

(assert (=> b!1306188 m!1197571))

(assert (=> b!1306104 d!142393))

(declare-fun d!142395 () Bool)

(declare-fun e!745165 () Bool)

(assert (=> d!142395 e!745165))

(declare-fun res!867088 () Bool)

(assert (=> d!142395 (=> (not res!867088) (not e!745165))))

(declare-fun lt!584541 () ListLongMap!20333)

(assert (=> d!142395 (= res!867088 (contains!8336 lt!584541 (_1!11345 (tuple2!22669 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun lt!584544 () List!29811)

(assert (=> d!142395 (= lt!584541 (ListLongMap!20334 lt!584544))))

(declare-fun lt!584542 () Unit!43180)

(declare-fun lt!584543 () Unit!43180)

(assert (=> d!142395 (= lt!584542 lt!584543)))

(assert (=> d!142395 (= (getValueByKey!704 lt!584544 (_1!11345 (tuple2!22669 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!754 (_2!11345 (tuple2!22669 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun lemmaContainsTupThenGetReturnValue!355 (List!29811 (_ BitVec 64) V!51681) Unit!43180)

(assert (=> d!142395 (= lt!584543 (lemmaContainsTupThenGetReturnValue!355 lt!584544 (_1!11345 (tuple2!22669 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11345 (tuple2!22669 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun insertStrictlySorted!484 (List!29811 (_ BitVec 64) V!51681) List!29811)

(assert (=> d!142395 (= lt!584544 (insertStrictlySorted!484 (toList!10182 lt!584501) (_1!11345 (tuple2!22669 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11345 (tuple2!22669 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!142395 (= (+!4535 lt!584501 (tuple2!22669 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) lt!584541)))

(declare-fun b!1306193 () Bool)

(declare-fun res!867089 () Bool)

(assert (=> b!1306193 (=> (not res!867089) (not e!745165))))

(assert (=> b!1306193 (= res!867089 (= (getValueByKey!704 (toList!10182 lt!584541) (_1!11345 (tuple2!22669 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!754 (_2!11345 (tuple2!22669 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1306194 () Bool)

(declare-fun contains!8337 (List!29811 tuple2!22668) Bool)

(assert (=> b!1306194 (= e!745165 (contains!8337 (toList!10182 lt!584541) (tuple2!22669 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(assert (= (and d!142395 res!867088) b!1306193))

(assert (= (and b!1306193 res!867089) b!1306194))

(declare-fun m!1197573 () Bool)

(assert (=> d!142395 m!1197573))

(declare-fun m!1197575 () Bool)

(assert (=> d!142395 m!1197575))

(declare-fun m!1197577 () Bool)

(assert (=> d!142395 m!1197577))

(declare-fun m!1197579 () Bool)

(assert (=> d!142395 m!1197579))

(declare-fun m!1197581 () Bool)

(assert (=> b!1306193 m!1197581))

(declare-fun m!1197583 () Bool)

(assert (=> b!1306194 m!1197583))

(assert (=> b!1306104 d!142395))

(declare-fun d!142397 () Bool)

(assert (=> d!142397 (not (contains!8336 (+!4535 lt!584501 (tuple2!22669 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!584547 () Unit!43180)

(declare-fun choose!1936 (ListLongMap!20333 (_ BitVec 64) V!51681 (_ BitVec 64)) Unit!43180)

(assert (=> d!142397 (= lt!584547 (choose!1936 lt!584501 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun e!745168 () Bool)

(assert (=> d!142397 e!745168))

(declare-fun res!867092 () Bool)

(assert (=> d!142397 (=> (not res!867092) (not e!745168))))

(assert (=> d!142397 (= res!867092 (not (contains!8336 lt!584501 k0!1205)))))

(assert (=> d!142397 (= (addStillNotContains!486 lt!584501 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205) lt!584547)))

(declare-fun b!1306198 () Bool)

(assert (=> b!1306198 (= e!745168 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!1205)))))

(assert (= (and d!142397 res!867092) b!1306198))

(assert (=> d!142397 m!1197475))

(assert (=> d!142397 m!1197475))

(assert (=> d!142397 m!1197477))

(declare-fun m!1197585 () Bool)

(assert (=> d!142397 m!1197585))

(declare-fun m!1197587 () Bool)

(assert (=> d!142397 m!1197587))

(assert (=> b!1306104 d!142397))

(declare-fun b!1306223 () Bool)

(declare-fun e!745188 () Bool)

(assert (=> b!1306223 (= e!745188 (validKeyInArray!0 (select (arr!41947 _keys!1741) from!2144)))))

(assert (=> b!1306223 (bvsge from!2144 #b00000000000000000000000000000000)))

(declare-fun b!1306224 () Bool)

(declare-fun lt!584567 () Unit!43180)

(declare-fun lt!584564 () Unit!43180)

(assert (=> b!1306224 (= lt!584567 lt!584564)))

(declare-fun lt!584562 () (_ BitVec 64))

(declare-fun lt!584566 () V!51681)

(declare-fun lt!584568 () (_ BitVec 64))

(declare-fun lt!584565 () ListLongMap!20333)

(assert (=> b!1306224 (not (contains!8336 (+!4535 lt!584565 (tuple2!22669 lt!584568 lt!584566)) lt!584562))))

(assert (=> b!1306224 (= lt!584564 (addStillNotContains!486 lt!584565 lt!584568 lt!584566 lt!584562))))

(assert (=> b!1306224 (= lt!584562 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!21234 (ValueCell!16568 V!51681) V!51681)

(declare-fun dynLambda!3495 (Int (_ BitVec 64)) V!51681)

(assert (=> b!1306224 (= lt!584566 (get!21234 (select (arr!41946 _values!1445) from!2144) (dynLambda!3495 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1306224 (= lt!584568 (select (arr!41947 _keys!1741) from!2144))))

(declare-fun call!64370 () ListLongMap!20333)

(assert (=> b!1306224 (= lt!584565 call!64370)))

(declare-fun e!745186 () ListLongMap!20333)

(assert (=> b!1306224 (= e!745186 (+!4535 call!64370 (tuple2!22669 (select (arr!41947 _keys!1741) from!2144) (get!21234 (select (arr!41946 _values!1445) from!2144) (dynLambda!3495 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1306225 () Bool)

(declare-fun res!867102 () Bool)

(declare-fun e!745184 () Bool)

(assert (=> b!1306225 (=> (not res!867102) (not e!745184))))

(declare-fun lt!584563 () ListLongMap!20333)

(assert (=> b!1306225 (= res!867102 (not (contains!8336 lt!584563 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1306226 () Bool)

(declare-fun e!745187 () ListLongMap!20333)

(assert (=> b!1306226 (= e!745187 (ListLongMap!20334 Nil!29808))))

(declare-fun b!1306227 () Bool)

(declare-fun e!745185 () Bool)

(assert (=> b!1306227 (= e!745184 e!745185)))

(declare-fun c!125709 () Bool)

(assert (=> b!1306227 (= c!125709 e!745188)))

(declare-fun res!867101 () Bool)

(assert (=> b!1306227 (=> (not res!867101) (not e!745188))))

(assert (=> b!1306227 (= res!867101 (bvslt from!2144 (size!42498 _keys!1741)))))

(declare-fun b!1306228 () Bool)

(declare-fun e!745189 () Bool)

(assert (=> b!1306228 (= e!745185 e!745189)))

(assert (=> b!1306228 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42498 _keys!1741)))))

(declare-fun res!867103 () Bool)

(assert (=> b!1306228 (= res!867103 (contains!8336 lt!584563 (select (arr!41947 _keys!1741) from!2144)))))

(assert (=> b!1306228 (=> (not res!867103) (not e!745189))))

(declare-fun b!1306229 () Bool)

(assert (=> b!1306229 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42498 _keys!1741)))))

(assert (=> b!1306229 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42497 _values!1445)))))

(declare-fun apply!1034 (ListLongMap!20333 (_ BitVec 64)) V!51681)

(assert (=> b!1306229 (= e!745189 (= (apply!1034 lt!584563 (select (arr!41947 _keys!1741) from!2144)) (get!21234 (select (arr!41946 _values!1445) from!2144) (dynLambda!3495 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!142399 () Bool)

(assert (=> d!142399 e!745184))

(declare-fun res!867104 () Bool)

(assert (=> d!142399 (=> (not res!867104) (not e!745184))))

(assert (=> d!142399 (= res!867104 (not (contains!8336 lt!584563 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!142399 (= lt!584563 e!745187)))

(declare-fun c!125710 () Bool)

(assert (=> d!142399 (= c!125710 (bvsge from!2144 (size!42498 _keys!1741)))))

(assert (=> d!142399 (validMask!0 mask!2175)))

(assert (=> d!142399 (= (getCurrentListMapNoExtraKeys!6175 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!584563)))

(declare-fun b!1306230 () Bool)

(declare-fun e!745183 () Bool)

(declare-fun isEmpty!1073 (ListLongMap!20333) Bool)

(assert (=> b!1306230 (= e!745183 (isEmpty!1073 lt!584563))))

(declare-fun b!1306231 () Bool)

(assert (=> b!1306231 (= e!745185 e!745183)))

(declare-fun c!125711 () Bool)

(assert (=> b!1306231 (= c!125711 (bvslt from!2144 (size!42498 _keys!1741)))))

(declare-fun b!1306232 () Bool)

(assert (=> b!1306232 (= e!745187 e!745186)))

(declare-fun c!125712 () Bool)

(assert (=> b!1306232 (= c!125712 (validKeyInArray!0 (select (arr!41947 _keys!1741) from!2144)))))

(declare-fun b!1306233 () Bool)

(assert (=> b!1306233 (= e!745186 call!64370)))

(declare-fun b!1306234 () Bool)

(assert (=> b!1306234 (= e!745183 (= lt!584563 (getCurrentListMapNoExtraKeys!6175 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun bm!64367 () Bool)

(assert (=> bm!64367 (= call!64370 (getCurrentListMapNoExtraKeys!6175 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448))))

(assert (= (and d!142399 c!125710) b!1306226))

(assert (= (and d!142399 (not c!125710)) b!1306232))

(assert (= (and b!1306232 c!125712) b!1306224))

(assert (= (and b!1306232 (not c!125712)) b!1306233))

(assert (= (or b!1306224 b!1306233) bm!64367))

(assert (= (and d!142399 res!867104) b!1306225))

(assert (= (and b!1306225 res!867102) b!1306227))

(assert (= (and b!1306227 res!867101) b!1306223))

(assert (= (and b!1306227 c!125709) b!1306228))

(assert (= (and b!1306227 (not c!125709)) b!1306231))

(assert (= (and b!1306228 res!867103) b!1306229))

(assert (= (and b!1306231 c!125711) b!1306234))

(assert (= (and b!1306231 (not c!125711)) b!1306230))

(declare-fun b_lambda!23321 () Bool)

(assert (=> (not b_lambda!23321) (not b!1306224)))

(declare-fun t!43408 () Bool)

(declare-fun tb!11397 () Bool)

(assert (=> (and start!110446 (= defaultEntry!1448 defaultEntry!1448) t!43408) tb!11397))

(declare-fun result!23829 () Bool)

(assert (=> tb!11397 (= result!23829 tp_is_empty!34933)))

(assert (=> b!1306224 t!43408))

(declare-fun b_and!47491 () Bool)

(assert (= b_and!47485 (and (=> t!43408 result!23829) b_and!47491)))

(declare-fun b_lambda!23323 () Bool)

(assert (=> (not b_lambda!23323) (not b!1306229)))

(assert (=> b!1306229 t!43408))

(declare-fun b_and!47493 () Bool)

(assert (= b_and!47491 (and (=> t!43408 result!23829) b_and!47493)))

(declare-fun m!1197589 () Bool)

(assert (=> b!1306234 m!1197589))

(assert (=> b!1306232 m!1197491))

(assert (=> b!1306232 m!1197491))

(assert (=> b!1306232 m!1197493))

(declare-fun m!1197591 () Bool)

(assert (=> b!1306229 m!1197591))

(assert (=> b!1306229 m!1197591))

(declare-fun m!1197593 () Bool)

(assert (=> b!1306229 m!1197593))

(declare-fun m!1197595 () Bool)

(assert (=> b!1306229 m!1197595))

(assert (=> b!1306229 m!1197593))

(assert (=> b!1306229 m!1197491))

(assert (=> b!1306229 m!1197491))

(declare-fun m!1197597 () Bool)

(assert (=> b!1306229 m!1197597))

(assert (=> b!1306223 m!1197491))

(assert (=> b!1306223 m!1197491))

(assert (=> b!1306223 m!1197493))

(assert (=> bm!64367 m!1197589))

(assert (=> b!1306228 m!1197491))

(assert (=> b!1306228 m!1197491))

(declare-fun m!1197599 () Bool)

(assert (=> b!1306228 m!1197599))

(declare-fun m!1197601 () Bool)

(assert (=> b!1306230 m!1197601))

(declare-fun m!1197603 () Bool)

(assert (=> d!142399 m!1197603))

(assert (=> d!142399 m!1197495))

(declare-fun m!1197605 () Bool)

(assert (=> b!1306224 m!1197605))

(assert (=> b!1306224 m!1197591))

(declare-fun m!1197607 () Bool)

(assert (=> b!1306224 m!1197607))

(declare-fun m!1197609 () Bool)

(assert (=> b!1306224 m!1197609))

(assert (=> b!1306224 m!1197591))

(assert (=> b!1306224 m!1197593))

(assert (=> b!1306224 m!1197595))

(assert (=> b!1306224 m!1197593))

(assert (=> b!1306224 m!1197609))

(declare-fun m!1197611 () Bool)

(assert (=> b!1306224 m!1197611))

(assert (=> b!1306224 m!1197491))

(declare-fun m!1197613 () Bool)

(assert (=> b!1306225 m!1197613))

(assert (=> b!1306104 d!142399))

(declare-fun b!1306247 () Bool)

(declare-fun e!745199 () Bool)

(declare-fun e!745201 () Bool)

(assert (=> b!1306247 (= e!745199 e!745201)))

(declare-fun c!125715 () Bool)

(assert (=> b!1306247 (= c!125715 (validKeyInArray!0 (select (arr!41947 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1306248 () Bool)

(declare-fun e!745198 () Bool)

(assert (=> b!1306248 (= e!745198 e!745199)))

(declare-fun res!867111 () Bool)

(assert (=> b!1306248 (=> (not res!867111) (not e!745199))))

(declare-fun e!745200 () Bool)

(assert (=> b!1306248 (= res!867111 (not e!745200))))

(declare-fun res!867113 () Bool)

(assert (=> b!1306248 (=> (not res!867113) (not e!745200))))

(assert (=> b!1306248 (= res!867113 (validKeyInArray!0 (select (arr!41947 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1306249 () Bool)

(declare-fun call!64373 () Bool)

(assert (=> b!1306249 (= e!745201 call!64373)))

(declare-fun d!142401 () Bool)

(declare-fun res!867112 () Bool)

(assert (=> d!142401 (=> res!867112 e!745198)))

(assert (=> d!142401 (= res!867112 (bvsge #b00000000000000000000000000000000 (size!42498 _keys!1741)))))

(assert (=> d!142401 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29809) e!745198)))

(declare-fun b!1306250 () Bool)

(assert (=> b!1306250 (= e!745201 call!64373)))

(declare-fun bm!64370 () Bool)

(assert (=> bm!64370 (= call!64373 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125715 (Cons!29808 (select (arr!41947 _keys!1741) #b00000000000000000000000000000000) Nil!29809) Nil!29809)))))

(declare-fun b!1306251 () Bool)

(declare-fun contains!8338 (List!29812 (_ BitVec 64)) Bool)

(assert (=> b!1306251 (= e!745200 (contains!8338 Nil!29809 (select (arr!41947 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!142401 (not res!867112)) b!1306248))

(assert (= (and b!1306248 res!867113) b!1306251))

(assert (= (and b!1306248 res!867111) b!1306247))

(assert (= (and b!1306247 c!125715) b!1306249))

(assert (= (and b!1306247 (not c!125715)) b!1306250))

(assert (= (or b!1306249 b!1306250) bm!64370))

(declare-fun m!1197615 () Bool)

(assert (=> b!1306247 m!1197615))

(assert (=> b!1306247 m!1197615))

(declare-fun m!1197617 () Bool)

(assert (=> b!1306247 m!1197617))

(assert (=> b!1306248 m!1197615))

(assert (=> b!1306248 m!1197615))

(assert (=> b!1306248 m!1197617))

(assert (=> bm!64370 m!1197615))

(declare-fun m!1197619 () Bool)

(assert (=> bm!64370 m!1197619))

(assert (=> b!1306251 m!1197615))

(assert (=> b!1306251 m!1197615))

(declare-fun m!1197621 () Bool)

(assert (=> b!1306251 m!1197621))

(assert (=> b!1306099 d!142401))

(declare-fun b!1306260 () Bool)

(declare-fun e!745208 () Bool)

(declare-fun call!64376 () Bool)

(assert (=> b!1306260 (= e!745208 call!64376)))

(declare-fun b!1306261 () Bool)

(declare-fun e!745210 () Bool)

(assert (=> b!1306261 (= e!745210 e!745208)))

(declare-fun c!125718 () Bool)

(assert (=> b!1306261 (= c!125718 (validKeyInArray!0 (select (arr!41947 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun d!142403 () Bool)

(declare-fun res!867119 () Bool)

(assert (=> d!142403 (=> res!867119 e!745210)))

(assert (=> d!142403 (= res!867119 (bvsge #b00000000000000000000000000000000 (size!42498 _keys!1741)))))

(assert (=> d!142403 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!745210)))

(declare-fun b!1306262 () Bool)

(declare-fun e!745209 () Bool)

(assert (=> b!1306262 (= e!745208 e!745209)))

(declare-fun lt!584576 () (_ BitVec 64))

(assert (=> b!1306262 (= lt!584576 (select (arr!41947 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!584577 () Unit!43180)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86927 (_ BitVec 64) (_ BitVec 32)) Unit!43180)

(assert (=> b!1306262 (= lt!584577 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!584576 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!86927 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1306262 (arrayContainsKey!0 _keys!1741 lt!584576 #b00000000000000000000000000000000)))

(declare-fun lt!584575 () Unit!43180)

(assert (=> b!1306262 (= lt!584575 lt!584577)))

(declare-fun res!867118 () Bool)

(declare-datatypes ((SeekEntryResult!9984 0))(
  ( (MissingZero!9984 (index!42307 (_ BitVec 32))) (Found!9984 (index!42308 (_ BitVec 32))) (Intermediate!9984 (undefined!10796 Bool) (index!42309 (_ BitVec 32)) (x!115872 (_ BitVec 32))) (Undefined!9984) (MissingVacant!9984 (index!42310 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86927 (_ BitVec 32)) SeekEntryResult!9984)

(assert (=> b!1306262 (= res!867118 (= (seekEntryOrOpen!0 (select (arr!41947 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!9984 #b00000000000000000000000000000000)))))

(assert (=> b!1306262 (=> (not res!867118) (not e!745209))))

(declare-fun b!1306263 () Bool)

(assert (=> b!1306263 (= e!745209 call!64376)))

(declare-fun bm!64373 () Bool)

(assert (=> bm!64373 (= call!64376 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(assert (= (and d!142403 (not res!867119)) b!1306261))

(assert (= (and b!1306261 c!125718) b!1306262))

(assert (= (and b!1306261 (not c!125718)) b!1306260))

(assert (= (and b!1306262 res!867118) b!1306263))

(assert (= (or b!1306263 b!1306260) bm!64373))

(assert (=> b!1306261 m!1197615))

(assert (=> b!1306261 m!1197615))

(assert (=> b!1306261 m!1197617))

(assert (=> b!1306262 m!1197615))

(declare-fun m!1197623 () Bool)

(assert (=> b!1306262 m!1197623))

(declare-fun m!1197625 () Bool)

(assert (=> b!1306262 m!1197625))

(assert (=> b!1306262 m!1197615))

(declare-fun m!1197627 () Bool)

(assert (=> b!1306262 m!1197627))

(declare-fun m!1197629 () Bool)

(assert (=> bm!64373 m!1197629))

(assert (=> b!1306105 d!142403))

(declare-fun d!142405 () Bool)

(declare-fun e!745212 () Bool)

(assert (=> d!142405 e!745212))

(declare-fun res!867120 () Bool)

(assert (=> d!142405 (=> res!867120 e!745212)))

(declare-fun lt!584579 () Bool)

(assert (=> d!142405 (= res!867120 (not lt!584579))))

(declare-fun lt!584580 () Bool)

(assert (=> d!142405 (= lt!584579 lt!584580)))

(declare-fun lt!584581 () Unit!43180)

(declare-fun e!745211 () Unit!43180)

(assert (=> d!142405 (= lt!584581 e!745211)))

(declare-fun c!125719 () Bool)

(assert (=> d!142405 (= c!125719 lt!584580)))

(assert (=> d!142405 (= lt!584580 (containsKey!730 (toList!10182 (getCurrentListMap!5190 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!142405 (= (contains!8336 (getCurrentListMap!5190 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!584579)))

(declare-fun b!1306264 () Bool)

(declare-fun lt!584578 () Unit!43180)

(assert (=> b!1306264 (= e!745211 lt!584578)))

(assert (=> b!1306264 (= lt!584578 (lemmaContainsKeyImpliesGetValueByKeyDefined!476 (toList!10182 (getCurrentListMap!5190 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> b!1306264 (isDefined!513 (getValueByKey!704 (toList!10182 (getCurrentListMap!5190 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1306265 () Bool)

(declare-fun Unit!43183 () Unit!43180)

(assert (=> b!1306265 (= e!745211 Unit!43183)))

(declare-fun b!1306266 () Bool)

(assert (=> b!1306266 (= e!745212 (isDefined!513 (getValueByKey!704 (toList!10182 (getCurrentListMap!5190 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!142405 c!125719) b!1306264))

(assert (= (and d!142405 (not c!125719)) b!1306265))

(assert (= (and d!142405 (not res!867120)) b!1306266))

(declare-fun m!1197631 () Bool)

(assert (=> d!142405 m!1197631))

(declare-fun m!1197633 () Bool)

(assert (=> b!1306264 m!1197633))

(declare-fun m!1197635 () Bool)

(assert (=> b!1306264 m!1197635))

(assert (=> b!1306264 m!1197635))

(declare-fun m!1197637 () Bool)

(assert (=> b!1306264 m!1197637))

(assert (=> b!1306266 m!1197635))

(assert (=> b!1306266 m!1197635))

(assert (=> b!1306266 m!1197637))

(assert (=> b!1306096 d!142405))

(declare-fun b!1306310 () Bool)

(declare-fun c!125733 () Bool)

(assert (=> b!1306310 (= c!125733 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!745246 () ListLongMap!20333)

(declare-fun e!745240 () ListLongMap!20333)

(assert (=> b!1306310 (= e!745246 e!745240)))

(declare-fun b!1306311 () Bool)

(declare-fun e!745242 () ListLongMap!20333)

(assert (=> b!1306311 (= e!745242 e!745246)))

(declare-fun c!125735 () Bool)

(assert (=> b!1306311 (= c!125735 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1306312 () Bool)

(declare-fun e!745244 () Bool)

(declare-fun e!745248 () Bool)

(assert (=> b!1306312 (= e!745244 e!745248)))

(declare-fun res!867143 () Bool)

(assert (=> b!1306312 (=> (not res!867143) (not e!745248))))

(declare-fun lt!584645 () ListLongMap!20333)

(assert (=> b!1306312 (= res!867143 (contains!8336 lt!584645 (select (arr!41947 _keys!1741) from!2144)))))

(assert (=> b!1306312 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42498 _keys!1741)))))

(declare-fun bm!64388 () Bool)

(declare-fun call!64394 () Bool)

(assert (=> bm!64388 (= call!64394 (contains!8336 lt!584645 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1306313 () Bool)

(declare-fun call!64395 () ListLongMap!20333)

(assert (=> b!1306313 (= e!745242 (+!4535 call!64395 (tuple2!22669 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1306314 () Bool)

(declare-fun e!745241 () Bool)

(assert (=> b!1306314 (= e!745241 (validKeyInArray!0 (select (arr!41947 _keys!1741) from!2144)))))

(declare-fun b!1306315 () Bool)

(declare-fun e!745243 () Bool)

(declare-fun e!745250 () Bool)

(assert (=> b!1306315 (= e!745243 e!745250)))

(declare-fun res!867144 () Bool)

(declare-fun call!64397 () Bool)

(assert (=> b!1306315 (= res!867144 call!64397)))

(assert (=> b!1306315 (=> (not res!867144) (not e!745250))))

(declare-fun b!1306316 () Bool)

(declare-fun res!867146 () Bool)

(declare-fun e!745249 () Bool)

(assert (=> b!1306316 (=> (not res!867146) (not e!745249))))

(assert (=> b!1306316 (= res!867146 e!745243)))

(declare-fun c!125732 () Bool)

(assert (=> b!1306316 (= c!125732 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun call!64391 () ListLongMap!20333)

(declare-fun c!125737 () Bool)

(declare-fun call!64393 () ListLongMap!20333)

(declare-fun bm!64389 () Bool)

(declare-fun call!64392 () ListLongMap!20333)

(assert (=> bm!64389 (= call!64395 (+!4535 (ite c!125737 call!64393 (ite c!125735 call!64391 call!64392)) (ite (or c!125737 c!125735) (tuple2!22669 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22669 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1306317 () Bool)

(declare-fun e!745247 () Unit!43180)

(declare-fun lt!584627 () Unit!43180)

(assert (=> b!1306317 (= e!745247 lt!584627)))

(declare-fun lt!584639 () ListLongMap!20333)

(assert (=> b!1306317 (= lt!584639 (getCurrentListMapNoExtraKeys!6175 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!584629 () (_ BitVec 64))

(assert (=> b!1306317 (= lt!584629 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!584638 () (_ BitVec 64))

(assert (=> b!1306317 (= lt!584638 (select (arr!41947 _keys!1741) from!2144))))

(declare-fun lt!584634 () Unit!43180)

(declare-fun addStillContains!1121 (ListLongMap!20333 (_ BitVec 64) V!51681 (_ BitVec 64)) Unit!43180)

(assert (=> b!1306317 (= lt!584634 (addStillContains!1121 lt!584639 lt!584629 zeroValue!1387 lt!584638))))

(assert (=> b!1306317 (contains!8336 (+!4535 lt!584639 (tuple2!22669 lt!584629 zeroValue!1387)) lt!584638)))

(declare-fun lt!584647 () Unit!43180)

(assert (=> b!1306317 (= lt!584647 lt!584634)))

(declare-fun lt!584643 () ListLongMap!20333)

(assert (=> b!1306317 (= lt!584643 (getCurrentListMapNoExtraKeys!6175 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!584635 () (_ BitVec 64))

(assert (=> b!1306317 (= lt!584635 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!584631 () (_ BitVec 64))

(assert (=> b!1306317 (= lt!584631 (select (arr!41947 _keys!1741) from!2144))))

(declare-fun lt!584644 () Unit!43180)

(declare-fun addApplyDifferent!563 (ListLongMap!20333 (_ BitVec 64) V!51681 (_ BitVec 64)) Unit!43180)

(assert (=> b!1306317 (= lt!584644 (addApplyDifferent!563 lt!584643 lt!584635 minValue!1387 lt!584631))))

(assert (=> b!1306317 (= (apply!1034 (+!4535 lt!584643 (tuple2!22669 lt!584635 minValue!1387)) lt!584631) (apply!1034 lt!584643 lt!584631))))

(declare-fun lt!584632 () Unit!43180)

(assert (=> b!1306317 (= lt!584632 lt!584644)))

(declare-fun lt!584636 () ListLongMap!20333)

(assert (=> b!1306317 (= lt!584636 (getCurrentListMapNoExtraKeys!6175 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!584642 () (_ BitVec 64))

(assert (=> b!1306317 (= lt!584642 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!584630 () (_ BitVec 64))

(assert (=> b!1306317 (= lt!584630 (select (arr!41947 _keys!1741) from!2144))))

(declare-fun lt!584641 () Unit!43180)

(assert (=> b!1306317 (= lt!584641 (addApplyDifferent!563 lt!584636 lt!584642 zeroValue!1387 lt!584630))))

(assert (=> b!1306317 (= (apply!1034 (+!4535 lt!584636 (tuple2!22669 lt!584642 zeroValue!1387)) lt!584630) (apply!1034 lt!584636 lt!584630))))

(declare-fun lt!584633 () Unit!43180)

(assert (=> b!1306317 (= lt!584633 lt!584641)))

(declare-fun lt!584637 () ListLongMap!20333)

(assert (=> b!1306317 (= lt!584637 (getCurrentListMapNoExtraKeys!6175 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!584626 () (_ BitVec 64))

(assert (=> b!1306317 (= lt!584626 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!584628 () (_ BitVec 64))

(assert (=> b!1306317 (= lt!584628 (select (arr!41947 _keys!1741) from!2144))))

(assert (=> b!1306317 (= lt!584627 (addApplyDifferent!563 lt!584637 lt!584626 minValue!1387 lt!584628))))

(assert (=> b!1306317 (= (apply!1034 (+!4535 lt!584637 (tuple2!22669 lt!584626 minValue!1387)) lt!584628) (apply!1034 lt!584637 lt!584628))))

(declare-fun b!1306318 () Bool)

(declare-fun call!64396 () ListLongMap!20333)

(assert (=> b!1306318 (= e!745240 call!64396)))

(declare-fun b!1306319 () Bool)

(declare-fun e!745245 () Bool)

(assert (=> b!1306319 (= e!745245 (not call!64394))))

(declare-fun bm!64390 () Bool)

(assert (=> bm!64390 (= call!64393 (getCurrentListMapNoExtraKeys!6175 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1306320 () Bool)

(assert (=> b!1306320 (= e!745250 (= (apply!1034 lt!584645 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun b!1306321 () Bool)

(declare-fun e!745239 () Bool)

(assert (=> b!1306321 (= e!745239 (= (apply!1034 lt!584645 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun bm!64391 () Bool)

(assert (=> bm!64391 (= call!64396 call!64395)))

(declare-fun b!1306322 () Bool)

(assert (=> b!1306322 (= e!745249 e!745245)))

(declare-fun c!125736 () Bool)

(assert (=> b!1306322 (= c!125736 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!64392 () Bool)

(assert (=> bm!64392 (= call!64392 call!64391)))

(declare-fun b!1306309 () Bool)

(declare-fun Unit!43184 () Unit!43180)

(assert (=> b!1306309 (= e!745247 Unit!43184)))

(declare-fun d!142407 () Bool)

(assert (=> d!142407 e!745249))

(declare-fun res!867142 () Bool)

(assert (=> d!142407 (=> (not res!867142) (not e!745249))))

(assert (=> d!142407 (= res!867142 (or (bvsge from!2144 (size!42498 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42498 _keys!1741)))))))

(declare-fun lt!584646 () ListLongMap!20333)

(assert (=> d!142407 (= lt!584645 lt!584646)))

(declare-fun lt!584640 () Unit!43180)

(assert (=> d!142407 (= lt!584640 e!745247)))

(declare-fun c!125734 () Bool)

(assert (=> d!142407 (= c!125734 e!745241)))

(declare-fun res!867140 () Bool)

(assert (=> d!142407 (=> (not res!867140) (not e!745241))))

(assert (=> d!142407 (= res!867140 (bvslt from!2144 (size!42498 _keys!1741)))))

(assert (=> d!142407 (= lt!584646 e!745242)))

(assert (=> d!142407 (= c!125737 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!142407 (validMask!0 mask!2175)))

(assert (=> d!142407 (= (getCurrentListMap!5190 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!584645)))

(declare-fun bm!64393 () Bool)

(assert (=> bm!64393 (= call!64397 (contains!8336 lt!584645 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!64394 () Bool)

(assert (=> bm!64394 (= call!64391 call!64393)))

(declare-fun b!1306323 () Bool)

(declare-fun e!745251 () Bool)

(assert (=> b!1306323 (= e!745251 (validKeyInArray!0 (select (arr!41947 _keys!1741) from!2144)))))

(declare-fun b!1306324 () Bool)

(assert (=> b!1306324 (= e!745240 call!64392)))

(declare-fun b!1306325 () Bool)

(declare-fun res!867147 () Bool)

(assert (=> b!1306325 (=> (not res!867147) (not e!745249))))

(assert (=> b!1306325 (= res!867147 e!745244)))

(declare-fun res!867145 () Bool)

(assert (=> b!1306325 (=> res!867145 e!745244)))

(assert (=> b!1306325 (= res!867145 (not e!745251))))

(declare-fun res!867139 () Bool)

(assert (=> b!1306325 (=> (not res!867139) (not e!745251))))

(assert (=> b!1306325 (= res!867139 (bvslt from!2144 (size!42498 _keys!1741)))))

(declare-fun b!1306326 () Bool)

(assert (=> b!1306326 (= e!745243 (not call!64397))))

(declare-fun b!1306327 () Bool)

(assert (=> b!1306327 (= e!745248 (= (apply!1034 lt!584645 (select (arr!41947 _keys!1741) from!2144)) (get!21234 (select (arr!41946 _values!1445) from!2144) (dynLambda!3495 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1306327 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42497 _values!1445)))))

(assert (=> b!1306327 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42498 _keys!1741)))))

(declare-fun b!1306328 () Bool)

(assert (=> b!1306328 (= e!745245 e!745239)))

(declare-fun res!867141 () Bool)

(assert (=> b!1306328 (= res!867141 call!64394)))

(assert (=> b!1306328 (=> (not res!867141) (not e!745239))))

(declare-fun b!1306329 () Bool)

(assert (=> b!1306329 (= e!745246 call!64396)))

(assert (= (and d!142407 c!125737) b!1306313))

(assert (= (and d!142407 (not c!125737)) b!1306311))

(assert (= (and b!1306311 c!125735) b!1306329))

(assert (= (and b!1306311 (not c!125735)) b!1306310))

(assert (= (and b!1306310 c!125733) b!1306318))

(assert (= (and b!1306310 (not c!125733)) b!1306324))

(assert (= (or b!1306318 b!1306324) bm!64392))

(assert (= (or b!1306329 bm!64392) bm!64394))

(assert (= (or b!1306329 b!1306318) bm!64391))

(assert (= (or b!1306313 bm!64394) bm!64390))

(assert (= (or b!1306313 bm!64391) bm!64389))

(assert (= (and d!142407 res!867140) b!1306314))

(assert (= (and d!142407 c!125734) b!1306317))

(assert (= (and d!142407 (not c!125734)) b!1306309))

(assert (= (and d!142407 res!867142) b!1306325))

(assert (= (and b!1306325 res!867139) b!1306323))

(assert (= (and b!1306325 (not res!867145)) b!1306312))

(assert (= (and b!1306312 res!867143) b!1306327))

(assert (= (and b!1306325 res!867147) b!1306316))

(assert (= (and b!1306316 c!125732) b!1306315))

(assert (= (and b!1306316 (not c!125732)) b!1306326))

(assert (= (and b!1306315 res!867144) b!1306320))

(assert (= (or b!1306315 b!1306326) bm!64393))

(assert (= (and b!1306316 res!867146) b!1306322))

(assert (= (and b!1306322 c!125736) b!1306328))

(assert (= (and b!1306322 (not c!125736)) b!1306319))

(assert (= (and b!1306328 res!867141) b!1306321))

(assert (= (or b!1306328 b!1306319) bm!64388))

(declare-fun b_lambda!23325 () Bool)

(assert (=> (not b_lambda!23325) (not b!1306327)))

(assert (=> b!1306327 t!43408))

(declare-fun b_and!47495 () Bool)

(assert (= b_and!47493 (and (=> t!43408 result!23829) b_and!47495)))

(declare-fun m!1197639 () Bool)

(assert (=> b!1306321 m!1197639))

(declare-fun m!1197641 () Bool)

(assert (=> b!1306313 m!1197641))

(assert (=> bm!64390 m!1197481))

(assert (=> d!142407 m!1197495))

(declare-fun m!1197643 () Bool)

(assert (=> bm!64393 m!1197643))

(declare-fun m!1197645 () Bool)

(assert (=> b!1306320 m!1197645))

(declare-fun m!1197647 () Bool)

(assert (=> bm!64388 m!1197647))

(declare-fun m!1197649 () Bool)

(assert (=> b!1306317 m!1197649))

(declare-fun m!1197651 () Bool)

(assert (=> b!1306317 m!1197651))

(declare-fun m!1197653 () Bool)

(assert (=> b!1306317 m!1197653))

(assert (=> b!1306317 m!1197481))

(declare-fun m!1197655 () Bool)

(assert (=> b!1306317 m!1197655))

(declare-fun m!1197657 () Bool)

(assert (=> b!1306317 m!1197657))

(declare-fun m!1197659 () Bool)

(assert (=> b!1306317 m!1197659))

(assert (=> b!1306317 m!1197657))

(declare-fun m!1197661 () Bool)

(assert (=> b!1306317 m!1197661))

(declare-fun m!1197663 () Bool)

(assert (=> b!1306317 m!1197663))

(declare-fun m!1197665 () Bool)

(assert (=> b!1306317 m!1197665))

(declare-fun m!1197667 () Bool)

(assert (=> b!1306317 m!1197667))

(declare-fun m!1197669 () Bool)

(assert (=> b!1306317 m!1197669))

(assert (=> b!1306317 m!1197491))

(declare-fun m!1197671 () Bool)

(assert (=> b!1306317 m!1197671))

(declare-fun m!1197673 () Bool)

(assert (=> b!1306317 m!1197673))

(assert (=> b!1306317 m!1197661))

(assert (=> b!1306317 m!1197655))

(declare-fun m!1197675 () Bool)

(assert (=> b!1306317 m!1197675))

(assert (=> b!1306317 m!1197667))

(declare-fun m!1197677 () Bool)

(assert (=> b!1306317 m!1197677))

(assert (=> b!1306312 m!1197491))

(assert (=> b!1306312 m!1197491))

(declare-fun m!1197679 () Bool)

(assert (=> b!1306312 m!1197679))

(assert (=> b!1306327 m!1197593))

(assert (=> b!1306327 m!1197491))

(declare-fun m!1197681 () Bool)

(assert (=> b!1306327 m!1197681))

(assert (=> b!1306327 m!1197491))

(assert (=> b!1306327 m!1197591))

(assert (=> b!1306327 m!1197591))

(assert (=> b!1306327 m!1197593))

(assert (=> b!1306327 m!1197595))

(assert (=> b!1306314 m!1197491))

(assert (=> b!1306314 m!1197491))

(assert (=> b!1306314 m!1197493))

(declare-fun m!1197683 () Bool)

(assert (=> bm!64389 m!1197683))

(assert (=> b!1306323 m!1197491))

(assert (=> b!1306323 m!1197491))

(assert (=> b!1306323 m!1197493))

(assert (=> b!1306096 d!142407))

(declare-fun d!142409 () Bool)

(declare-fun e!745253 () Bool)

(assert (=> d!142409 e!745253))

(declare-fun res!867148 () Bool)

(assert (=> d!142409 (=> res!867148 e!745253)))

(declare-fun lt!584649 () Bool)

(assert (=> d!142409 (= res!867148 (not lt!584649))))

(declare-fun lt!584650 () Bool)

(assert (=> d!142409 (= lt!584649 lt!584650)))

(declare-fun lt!584651 () Unit!43180)

(declare-fun e!745252 () Unit!43180)

(assert (=> d!142409 (= lt!584651 e!745252)))

(declare-fun c!125738 () Bool)

(assert (=> d!142409 (= c!125738 lt!584650)))

(assert (=> d!142409 (= lt!584650 (containsKey!730 (toList!10182 (ListLongMap!20334 Nil!29808)) k0!1205))))

(assert (=> d!142409 (= (contains!8336 (ListLongMap!20334 Nil!29808) k0!1205) lt!584649)))

(declare-fun b!1306330 () Bool)

(declare-fun lt!584648 () Unit!43180)

(assert (=> b!1306330 (= e!745252 lt!584648)))

(assert (=> b!1306330 (= lt!584648 (lemmaContainsKeyImpliesGetValueByKeyDefined!476 (toList!10182 (ListLongMap!20334 Nil!29808)) k0!1205))))

(assert (=> b!1306330 (isDefined!513 (getValueByKey!704 (toList!10182 (ListLongMap!20334 Nil!29808)) k0!1205))))

(declare-fun b!1306331 () Bool)

(declare-fun Unit!43185 () Unit!43180)

(assert (=> b!1306331 (= e!745252 Unit!43185)))

(declare-fun b!1306332 () Bool)

(assert (=> b!1306332 (= e!745253 (isDefined!513 (getValueByKey!704 (toList!10182 (ListLongMap!20334 Nil!29808)) k0!1205)))))

(assert (= (and d!142409 c!125738) b!1306330))

(assert (= (and d!142409 (not c!125738)) b!1306331))

(assert (= (and d!142409 (not res!867148)) b!1306332))

(declare-fun m!1197685 () Bool)

(assert (=> d!142409 m!1197685))

(declare-fun m!1197687 () Bool)

(assert (=> b!1306330 m!1197687))

(declare-fun m!1197689 () Bool)

(assert (=> b!1306330 m!1197689))

(assert (=> b!1306330 m!1197689))

(declare-fun m!1197691 () Bool)

(assert (=> b!1306330 m!1197691))

(assert (=> b!1306332 m!1197689))

(assert (=> b!1306332 m!1197689))

(assert (=> b!1306332 m!1197691))

(assert (=> b!1306107 d!142409))

(declare-fun d!142411 () Bool)

(assert (=> d!142411 (not (contains!8336 (ListLongMap!20334 Nil!29808) k0!1205))))

(declare-fun lt!584654 () Unit!43180)

(declare-fun choose!1937 ((_ BitVec 64)) Unit!43180)

(assert (=> d!142411 (= lt!584654 (choose!1937 k0!1205))))

(assert (=> d!142411 (= (emptyContainsNothing!230 k0!1205) lt!584654)))

(declare-fun bs!37189 () Bool)

(assert (= bs!37189 d!142411))

(assert (=> bs!37189 m!1197487))

(declare-fun m!1197693 () Bool)

(assert (=> bs!37189 m!1197693))

(assert (=> b!1306107 d!142411))

(declare-fun d!142413 () Bool)

(assert (=> d!142413 (= (validKeyInArray!0 (select (arr!41947 _keys!1741) from!2144)) (and (not (= (select (arr!41947 _keys!1741) from!2144) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41947 _keys!1741) from!2144) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1306101 d!142413))

(declare-fun d!142415 () Bool)

(assert (=> d!142415 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!110446 d!142415))

(declare-fun d!142417 () Bool)

(assert (=> d!142417 (= (array_inv!31969 _values!1445) (bvsge (size!42497 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!110446 d!142417))

(declare-fun d!142419 () Bool)

(assert (=> d!142419 (= (array_inv!31970 _keys!1741) (bvsge (size!42498 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!110446 d!142419))

(declare-fun mapNonEmpty!54012 () Bool)

(declare-fun mapRes!54012 () Bool)

(declare-fun tp!103056 () Bool)

(declare-fun e!745259 () Bool)

(assert (=> mapNonEmpty!54012 (= mapRes!54012 (and tp!103056 e!745259))))

(declare-fun mapRest!54012 () (Array (_ BitVec 32) ValueCell!16568))

(declare-fun mapKey!54012 () (_ BitVec 32))

(declare-fun mapValue!54012 () ValueCell!16568)

(assert (=> mapNonEmpty!54012 (= mapRest!54003 (store mapRest!54012 mapKey!54012 mapValue!54012))))

(declare-fun mapIsEmpty!54012 () Bool)

(assert (=> mapIsEmpty!54012 mapRes!54012))

(declare-fun b!1306340 () Bool)

(declare-fun e!745258 () Bool)

(assert (=> b!1306340 (= e!745258 tp_is_empty!34933)))

(declare-fun b!1306339 () Bool)

(assert (=> b!1306339 (= e!745259 tp_is_empty!34933)))

(declare-fun condMapEmpty!54012 () Bool)

(declare-fun mapDefault!54012 () ValueCell!16568)

(assert (=> mapNonEmpty!54003 (= condMapEmpty!54012 (= mapRest!54003 ((as const (Array (_ BitVec 32) ValueCell!16568)) mapDefault!54012)))))

(assert (=> mapNonEmpty!54003 (= tp!103041 (and e!745258 mapRes!54012))))

(assert (= (and mapNonEmpty!54003 condMapEmpty!54012) mapIsEmpty!54012))

(assert (= (and mapNonEmpty!54003 (not condMapEmpty!54012)) mapNonEmpty!54012))

(assert (= (and mapNonEmpty!54012 ((_ is ValueCellFull!16568) mapValue!54012)) b!1306339))

(assert (= (and mapNonEmpty!54003 ((_ is ValueCellFull!16568) mapDefault!54012)) b!1306340))

(declare-fun m!1197695 () Bool)

(assert (=> mapNonEmpty!54012 m!1197695))

(declare-fun b_lambda!23327 () Bool)

(assert (= b_lambda!23325 (or (and start!110446 b_free!29293) b_lambda!23327)))

(declare-fun b_lambda!23329 () Bool)

(assert (= b_lambda!23321 (or (and start!110446 b_free!29293) b_lambda!23329)))

(declare-fun b_lambda!23331 () Bool)

(assert (= b_lambda!23323 (or (and start!110446 b_free!29293) b_lambda!23331)))

(check-sat (not b!1306234) (not b_next!29293) (not d!142411) (not b!1306193) (not b!1306194) (not b!1306229) (not b!1306232) (not b!1306261) (not b!1306251) (not b!1306330) (not b_lambda!23327) (not bm!64367) (not b!1306262) (not bm!64390) (not b!1306312) tp_is_empty!34933 (not b!1306228) (not bm!64389) (not b!1306188) (not d!142409) (not b!1306248) (not b!1306186) (not b!1306224) (not bm!64373) (not b!1306264) (not b!1306314) (not d!142393) (not bm!64388) (not bm!64370) (not d!142405) (not mapNonEmpty!54012) (not b!1306225) (not b!1306327) (not b_lambda!23329) (not b!1306317) (not b!1306320) (not b!1306223) (not d!142397) (not b!1306313) (not b!1306247) (not d!142395) b_and!47495 (not b!1306266) (not b!1306323) (not bm!64393) (not b!1306332) (not b!1306321) (not b!1306230) (not d!142407) (not d!142399) (not b_lambda!23331))
(check-sat b_and!47495 (not b_next!29293))
