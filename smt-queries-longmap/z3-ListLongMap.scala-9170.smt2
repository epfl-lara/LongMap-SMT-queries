; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110222 () Bool)

(assert start!110222)

(declare-fun b_free!29293 () Bool)

(declare-fun b_next!29293 () Bool)

(assert (=> start!110222 (= b_free!29293 (not b_next!29293))))

(declare-fun tp!103041 () Bool)

(declare-fun b_and!47465 () Bool)

(assert (=> start!110222 (= tp!103041 b_and!47465)))

(declare-fun mapNonEmpty!54003 () Bool)

(declare-fun mapRes!54003 () Bool)

(declare-fun tp!103042 () Bool)

(declare-fun e!744239 () Bool)

(assert (=> mapNonEmpty!54003 (= mapRes!54003 (and tp!103042 e!744239))))

(declare-datatypes ((V!51681 0))(
  ( (V!51682 (val!17541 Int)) )
))
(declare-datatypes ((ValueCell!16568 0))(
  ( (ValueCellFull!16568 (v!20161 V!51681)) (EmptyCell!16568) )
))
(declare-fun mapValue!54003 () ValueCell!16568)

(declare-fun mapRest!54003 () (Array (_ BitVec 32) ValueCell!16568))

(declare-datatypes ((array!86789 0))(
  ( (array!86790 (arr!41883 (Array (_ BitVec 32) ValueCell!16568)) (size!42435 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86789)

(declare-fun mapKey!54003 () (_ BitVec 32))

(assert (=> mapNonEmpty!54003 (= (arr!41883 _values!1445) (store mapRest!54003 mapKey!54003 mapValue!54003))))

(declare-fun b!1304727 () Bool)

(declare-fun res!866471 () Bool)

(declare-fun e!744244 () Bool)

(assert (=> b!1304727 (=> (not res!866471) (not e!744244))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!86791 0))(
  ( (array!86792 (arr!41884 (Array (_ BitVec 32) (_ BitVec 64))) (size!42436 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86791)

(assert (=> b!1304727 (= res!866471 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42436 _keys!1741))))))

(declare-fun res!866478 () Bool)

(assert (=> start!110222 (=> (not res!866478) (not e!744244))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110222 (= res!866478 (validMask!0 mask!2175))))

(assert (=> start!110222 e!744244))

(declare-fun tp_is_empty!34933 () Bool)

(assert (=> start!110222 tp_is_empty!34933))

(assert (=> start!110222 true))

(declare-fun e!744243 () Bool)

(declare-fun array_inv!31855 (array!86789) Bool)

(assert (=> start!110222 (and (array_inv!31855 _values!1445) e!744243)))

(declare-fun array_inv!31856 (array!86791) Bool)

(assert (=> start!110222 (array_inv!31856 _keys!1741)))

(assert (=> start!110222 tp!103041))

(declare-fun b!1304728 () Bool)

(assert (=> b!1304728 (= e!744239 tp_is_empty!34933)))

(declare-fun b!1304729 () Bool)

(declare-fun e!744242 () Bool)

(assert (=> b!1304729 (= e!744242 tp_is_empty!34933)))

(declare-fun b!1304730 () Bool)

(declare-fun e!744241 () Bool)

(assert (=> b!1304730 (= e!744244 (not e!744241))))

(declare-fun res!866472 () Bool)

(assert (=> b!1304730 (=> res!866472 e!744241)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1304730 (= res!866472 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!22706 0))(
  ( (tuple2!22707 (_1!11364 (_ BitVec 64)) (_2!11364 V!51681)) )
))
(declare-datatypes ((List!29810 0))(
  ( (Nil!29807) (Cons!29806 (h!31015 tuple2!22706) (t!43402 List!29810)) )
))
(declare-datatypes ((ListLongMap!20363 0))(
  ( (ListLongMap!20364 (toList!10197 List!29810)) )
))
(declare-fun contains!8267 (ListLongMap!20363 (_ BitVec 64)) Bool)

(assert (=> b!1304730 (not (contains!8267 (ListLongMap!20364 Nil!29807) k0!1205))))

(declare-datatypes ((Unit!43055 0))(
  ( (Unit!43056) )
))
(declare-fun lt!583838 () Unit!43055)

(declare-fun emptyContainsNothing!224 ((_ BitVec 64)) Unit!43055)

(assert (=> b!1304730 (= lt!583838 (emptyContainsNothing!224 k0!1205))))

(declare-fun b!1304731 () Bool)

(declare-fun res!866473 () Bool)

(assert (=> b!1304731 (=> (not res!866473) (not e!744244))))

(declare-fun minValue!1387 () V!51681)

(declare-fun zeroValue!1387 () V!51681)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!5097 (array!86791 array!86789 (_ BitVec 32) (_ BitVec 32) V!51681 V!51681 (_ BitVec 32) Int) ListLongMap!20363)

(assert (=> b!1304731 (= res!866473 (contains!8267 (getCurrentListMap!5097 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapIsEmpty!54003 () Bool)

(assert (=> mapIsEmpty!54003 mapRes!54003))

(declare-fun b!1304732 () Bool)

(declare-fun res!866477 () Bool)

(assert (=> b!1304732 (=> (not res!866477) (not e!744244))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1304732 (= res!866477 (not (validKeyInArray!0 (select (arr!41884 _keys!1741) from!2144))))))

(declare-fun b!1304733 () Bool)

(assert (=> b!1304733 (= e!744241 false)))

(declare-fun lt!583839 () ListLongMap!20363)

(declare-fun +!4521 (ListLongMap!20363 tuple2!22706) ListLongMap!20363)

(assert (=> b!1304733 (not (contains!8267 (+!4521 lt!583839 (tuple2!22707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!583840 () Unit!43055)

(declare-fun addStillNotContains!474 (ListLongMap!20363 (_ BitVec 64) V!51681 (_ BitVec 64)) Unit!43055)

(assert (=> b!1304733 (= lt!583840 (addStillNotContains!474 lt!583839 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6156 (array!86791 array!86789 (_ BitVec 32) (_ BitVec 32) V!51681 V!51681 (_ BitVec 32) Int) ListLongMap!20363)

(assert (=> b!1304733 (= lt!583839 (getCurrentListMapNoExtraKeys!6156 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1304734 () Bool)

(declare-fun res!866476 () Bool)

(assert (=> b!1304734 (=> (not res!866476) (not e!744244))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86791 (_ BitVec 32)) Bool)

(assert (=> b!1304734 (= res!866476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1304735 () Bool)

(declare-fun res!866475 () Bool)

(assert (=> b!1304735 (=> (not res!866475) (not e!744244))))

(declare-datatypes ((List!29811 0))(
  ( (Nil!29808) (Cons!29807 (h!31016 (_ BitVec 64)) (t!43403 List!29811)) )
))
(declare-fun arrayNoDuplicates!0 (array!86791 (_ BitVec 32) List!29811) Bool)

(assert (=> b!1304735 (= res!866475 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29808))))

(declare-fun b!1304736 () Bool)

(declare-fun res!866474 () Bool)

(assert (=> b!1304736 (=> (not res!866474) (not e!744244))))

(assert (=> b!1304736 (= res!866474 (and (= (size!42435 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42436 _keys!1741) (size!42435 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1304737 () Bool)

(declare-fun res!866479 () Bool)

(assert (=> b!1304737 (=> (not res!866479) (not e!744244))))

(assert (=> b!1304737 (= res!866479 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42436 _keys!1741))))))

(declare-fun b!1304738 () Bool)

(assert (=> b!1304738 (= e!744243 (and e!744242 mapRes!54003))))

(declare-fun condMapEmpty!54003 () Bool)

(declare-fun mapDefault!54003 () ValueCell!16568)

(assert (=> b!1304738 (= condMapEmpty!54003 (= (arr!41883 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16568)) mapDefault!54003)))))

(assert (= (and start!110222 res!866478) b!1304736))

(assert (= (and b!1304736 res!866474) b!1304734))

(assert (= (and b!1304734 res!866476) b!1304735))

(assert (= (and b!1304735 res!866475) b!1304737))

(assert (= (and b!1304737 res!866479) b!1304731))

(assert (= (and b!1304731 res!866473) b!1304727))

(assert (= (and b!1304727 res!866471) b!1304732))

(assert (= (and b!1304732 res!866477) b!1304730))

(assert (= (and b!1304730 (not res!866472)) b!1304733))

(assert (= (and b!1304738 condMapEmpty!54003) mapIsEmpty!54003))

(assert (= (and b!1304738 (not condMapEmpty!54003)) mapNonEmpty!54003))

(get-info :version)

(assert (= (and mapNonEmpty!54003 ((_ is ValueCellFull!16568) mapValue!54003)) b!1304728))

(assert (= (and b!1304738 ((_ is ValueCellFull!16568) mapDefault!54003)) b!1304729))

(assert (= start!110222 b!1304738))

(declare-fun m!1195355 () Bool)

(assert (=> b!1304731 m!1195355))

(assert (=> b!1304731 m!1195355))

(declare-fun m!1195357 () Bool)

(assert (=> b!1304731 m!1195357))

(declare-fun m!1195359 () Bool)

(assert (=> b!1304734 m!1195359))

(declare-fun m!1195361 () Bool)

(assert (=> b!1304733 m!1195361))

(assert (=> b!1304733 m!1195361))

(declare-fun m!1195363 () Bool)

(assert (=> b!1304733 m!1195363))

(declare-fun m!1195365 () Bool)

(assert (=> b!1304733 m!1195365))

(declare-fun m!1195367 () Bool)

(assert (=> b!1304733 m!1195367))

(declare-fun m!1195369 () Bool)

(assert (=> b!1304732 m!1195369))

(assert (=> b!1304732 m!1195369))

(declare-fun m!1195371 () Bool)

(assert (=> b!1304732 m!1195371))

(declare-fun m!1195373 () Bool)

(assert (=> start!110222 m!1195373))

(declare-fun m!1195375 () Bool)

(assert (=> start!110222 m!1195375))

(declare-fun m!1195377 () Bool)

(assert (=> start!110222 m!1195377))

(declare-fun m!1195379 () Bool)

(assert (=> b!1304730 m!1195379))

(declare-fun m!1195381 () Bool)

(assert (=> b!1304730 m!1195381))

(declare-fun m!1195383 () Bool)

(assert (=> b!1304735 m!1195383))

(declare-fun m!1195385 () Bool)

(assert (=> mapNonEmpty!54003 m!1195385))

(check-sat tp_is_empty!34933 (not b!1304730) (not b!1304733) (not mapNonEmpty!54003) (not b_next!29293) (not b!1304732) (not b!1304735) b_and!47465 (not b!1304734) (not b!1304731) (not start!110222))
(check-sat b_and!47465 (not b_next!29293))
(get-model)

(declare-fun d!141833 () Bool)

(assert (=> d!141833 (= (validKeyInArray!0 (select (arr!41884 _keys!1741) from!2144)) (and (not (= (select (arr!41884 _keys!1741) from!2144) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41884 _keys!1741) from!2144) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1304732 d!141833))

(declare-fun d!141835 () Bool)

(assert (=> d!141835 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!110222 d!141835))

(declare-fun d!141837 () Bool)

(assert (=> d!141837 (= (array_inv!31855 _values!1445) (bvsge (size!42435 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!110222 d!141837))

(declare-fun d!141839 () Bool)

(assert (=> d!141839 (= (array_inv!31856 _keys!1741) (bvsge (size!42436 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!110222 d!141839))

(declare-fun d!141841 () Bool)

(declare-fun e!744286 () Bool)

(assert (=> d!141841 e!744286))

(declare-fun res!866536 () Bool)

(assert (=> d!141841 (=> res!866536 e!744286)))

(declare-fun lt!583867 () Bool)

(assert (=> d!141841 (= res!866536 (not lt!583867))))

(declare-fun lt!583870 () Bool)

(assert (=> d!141841 (= lt!583867 lt!583870)))

(declare-fun lt!583868 () Unit!43055)

(declare-fun e!744285 () Unit!43055)

(assert (=> d!141841 (= lt!583868 e!744285)))

(declare-fun c!125284 () Bool)

(assert (=> d!141841 (= c!125284 lt!583870)))

(declare-fun containsKey!728 (List!29810 (_ BitVec 64)) Bool)

(assert (=> d!141841 (= lt!583870 (containsKey!728 (toList!10197 (+!4521 lt!583839 (tuple2!22707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))

(assert (=> d!141841 (= (contains!8267 (+!4521 lt!583839 (tuple2!22707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205) lt!583867)))

(declare-fun b!1304817 () Bool)

(declare-fun lt!583869 () Unit!43055)

(assert (=> b!1304817 (= e!744285 lt!583869)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!475 (List!29810 (_ BitVec 64)) Unit!43055)

(assert (=> b!1304817 (= lt!583869 (lemmaContainsKeyImpliesGetValueByKeyDefined!475 (toList!10197 (+!4521 lt!583839 (tuple2!22707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))

(declare-datatypes ((Option!762 0))(
  ( (Some!761 (v!20164 V!51681)) (None!760) )
))
(declare-fun isDefined!518 (Option!762) Bool)

(declare-fun getValueByKey!711 (List!29810 (_ BitVec 64)) Option!762)

(assert (=> b!1304817 (isDefined!518 (getValueByKey!711 (toList!10197 (+!4521 lt!583839 (tuple2!22707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))

(declare-fun b!1304818 () Bool)

(declare-fun Unit!43061 () Unit!43055)

(assert (=> b!1304818 (= e!744285 Unit!43061)))

(declare-fun b!1304819 () Bool)

(assert (=> b!1304819 (= e!744286 (isDefined!518 (getValueByKey!711 (toList!10197 (+!4521 lt!583839 (tuple2!22707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205)))))

(assert (= (and d!141841 c!125284) b!1304817))

(assert (= (and d!141841 (not c!125284)) b!1304818))

(assert (= (and d!141841 (not res!866536)) b!1304819))

(declare-fun m!1195451 () Bool)

(assert (=> d!141841 m!1195451))

(declare-fun m!1195453 () Bool)

(assert (=> b!1304817 m!1195453))

(declare-fun m!1195455 () Bool)

(assert (=> b!1304817 m!1195455))

(assert (=> b!1304817 m!1195455))

(declare-fun m!1195457 () Bool)

(assert (=> b!1304817 m!1195457))

(assert (=> b!1304819 m!1195455))

(assert (=> b!1304819 m!1195455))

(assert (=> b!1304819 m!1195457))

(assert (=> b!1304733 d!141841))

(declare-fun d!141843 () Bool)

(declare-fun e!744289 () Bool)

(assert (=> d!141843 e!744289))

(declare-fun res!866542 () Bool)

(assert (=> d!141843 (=> (not res!866542) (not e!744289))))

(declare-fun lt!583879 () ListLongMap!20363)

(assert (=> d!141843 (= res!866542 (contains!8267 lt!583879 (_1!11364 (tuple2!22707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun lt!583882 () List!29810)

(assert (=> d!141843 (= lt!583879 (ListLongMap!20364 lt!583882))))

(declare-fun lt!583881 () Unit!43055)

(declare-fun lt!583880 () Unit!43055)

(assert (=> d!141843 (= lt!583881 lt!583880)))

(assert (=> d!141843 (= (getValueByKey!711 lt!583882 (_1!11364 (tuple2!22707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!761 (_2!11364 (tuple2!22707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun lemmaContainsTupThenGetReturnValue!355 (List!29810 (_ BitVec 64) V!51681) Unit!43055)

(assert (=> d!141843 (= lt!583880 (lemmaContainsTupThenGetReturnValue!355 lt!583882 (_1!11364 (tuple2!22707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11364 (tuple2!22707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun insertStrictlySorted!484 (List!29810 (_ BitVec 64) V!51681) List!29810)

(assert (=> d!141843 (= lt!583882 (insertStrictlySorted!484 (toList!10197 lt!583839) (_1!11364 (tuple2!22707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11364 (tuple2!22707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!141843 (= (+!4521 lt!583839 (tuple2!22707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) lt!583879)))

(declare-fun b!1304824 () Bool)

(declare-fun res!866541 () Bool)

(assert (=> b!1304824 (=> (not res!866541) (not e!744289))))

(assert (=> b!1304824 (= res!866541 (= (getValueByKey!711 (toList!10197 lt!583879) (_1!11364 (tuple2!22707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!761 (_2!11364 (tuple2!22707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1304825 () Bool)

(declare-fun contains!8270 (List!29810 tuple2!22706) Bool)

(assert (=> b!1304825 (= e!744289 (contains!8270 (toList!10197 lt!583879) (tuple2!22707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(assert (= (and d!141843 res!866542) b!1304824))

(assert (= (and b!1304824 res!866541) b!1304825))

(declare-fun m!1195459 () Bool)

(assert (=> d!141843 m!1195459))

(declare-fun m!1195461 () Bool)

(assert (=> d!141843 m!1195461))

(declare-fun m!1195463 () Bool)

(assert (=> d!141843 m!1195463))

(declare-fun m!1195465 () Bool)

(assert (=> d!141843 m!1195465))

(declare-fun m!1195467 () Bool)

(assert (=> b!1304824 m!1195467))

(declare-fun m!1195469 () Bool)

(assert (=> b!1304825 m!1195469))

(assert (=> b!1304733 d!141843))

(declare-fun d!141845 () Bool)

(assert (=> d!141845 (not (contains!8267 (+!4521 lt!583839 (tuple2!22707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!583885 () Unit!43055)

(declare-fun choose!1942 (ListLongMap!20363 (_ BitVec 64) V!51681 (_ BitVec 64)) Unit!43055)

(assert (=> d!141845 (= lt!583885 (choose!1942 lt!583839 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun e!744292 () Bool)

(assert (=> d!141845 e!744292))

(declare-fun res!866545 () Bool)

(assert (=> d!141845 (=> (not res!866545) (not e!744292))))

(assert (=> d!141845 (= res!866545 (not (contains!8267 lt!583839 k0!1205)))))

(assert (=> d!141845 (= (addStillNotContains!474 lt!583839 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205) lt!583885)))

(declare-fun b!1304829 () Bool)

(assert (=> b!1304829 (= e!744292 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!1205)))))

(assert (= (and d!141845 res!866545) b!1304829))

(assert (=> d!141845 m!1195361))

(assert (=> d!141845 m!1195361))

(assert (=> d!141845 m!1195363))

(declare-fun m!1195471 () Bool)

(assert (=> d!141845 m!1195471))

(declare-fun m!1195473 () Bool)

(assert (=> d!141845 m!1195473))

(assert (=> b!1304733 d!141845))

(declare-fun b!1304854 () Bool)

(declare-fun e!744307 () ListLongMap!20363)

(assert (=> b!1304854 (= e!744307 (ListLongMap!20364 Nil!29807))))

(declare-fun d!141847 () Bool)

(declare-fun e!744313 () Bool)

(assert (=> d!141847 e!744313))

(declare-fun res!866557 () Bool)

(assert (=> d!141847 (=> (not res!866557) (not e!744313))))

(declare-fun lt!583901 () ListLongMap!20363)

(assert (=> d!141847 (= res!866557 (not (contains!8267 lt!583901 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!141847 (= lt!583901 e!744307)))

(declare-fun c!125294 () Bool)

(assert (=> d!141847 (= c!125294 (bvsge from!2144 (size!42436 _keys!1741)))))

(assert (=> d!141847 (validMask!0 mask!2175)))

(assert (=> d!141847 (= (getCurrentListMapNoExtraKeys!6156 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!583901)))

(declare-fun b!1304855 () Bool)

(declare-fun res!866556 () Bool)

(assert (=> b!1304855 (=> (not res!866556) (not e!744313))))

(assert (=> b!1304855 (= res!866556 (not (contains!8267 lt!583901 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1304856 () Bool)

(declare-fun e!744309 () Bool)

(assert (=> b!1304856 (= e!744309 (validKeyInArray!0 (select (arr!41884 _keys!1741) from!2144)))))

(assert (=> b!1304856 (bvsge from!2144 #b00000000000000000000000000000000)))

(declare-fun b!1304857 () Bool)

(declare-fun lt!583900 () Unit!43055)

(declare-fun lt!583906 () Unit!43055)

(assert (=> b!1304857 (= lt!583900 lt!583906)))

(declare-fun lt!583904 () (_ BitVec 64))

(declare-fun lt!583905 () V!51681)

(declare-fun lt!583902 () ListLongMap!20363)

(declare-fun lt!583903 () (_ BitVec 64))

(assert (=> b!1304857 (not (contains!8267 (+!4521 lt!583902 (tuple2!22707 lt!583904 lt!583905)) lt!583903))))

(assert (=> b!1304857 (= lt!583906 (addStillNotContains!474 lt!583902 lt!583904 lt!583905 lt!583903))))

(assert (=> b!1304857 (= lt!583903 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!21183 (ValueCell!16568 V!51681) V!51681)

(declare-fun dynLambda!3456 (Int (_ BitVec 64)) V!51681)

(assert (=> b!1304857 (= lt!583905 (get!21183 (select (arr!41883 _values!1445) from!2144) (dynLambda!3456 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1304857 (= lt!583904 (select (arr!41884 _keys!1741) from!2144))))

(declare-fun call!64286 () ListLongMap!20363)

(assert (=> b!1304857 (= lt!583902 call!64286)))

(declare-fun e!744308 () ListLongMap!20363)

(assert (=> b!1304857 (= e!744308 (+!4521 call!64286 (tuple2!22707 (select (arr!41884 _keys!1741) from!2144) (get!21183 (select (arr!41883 _values!1445) from!2144) (dynLambda!3456 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1304858 () Bool)

(declare-fun e!744312 () Bool)

(assert (=> b!1304858 (= e!744313 e!744312)))

(declare-fun c!125293 () Bool)

(assert (=> b!1304858 (= c!125293 e!744309)))

(declare-fun res!866554 () Bool)

(assert (=> b!1304858 (=> (not res!866554) (not e!744309))))

(assert (=> b!1304858 (= res!866554 (bvslt from!2144 (size!42436 _keys!1741)))))

(declare-fun b!1304859 () Bool)

(declare-fun e!744311 () Bool)

(assert (=> b!1304859 (= e!744312 e!744311)))

(assert (=> b!1304859 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42436 _keys!1741)))))

(declare-fun res!866555 () Bool)

(assert (=> b!1304859 (= res!866555 (contains!8267 lt!583901 (select (arr!41884 _keys!1741) from!2144)))))

(assert (=> b!1304859 (=> (not res!866555) (not e!744311))))

(declare-fun b!1304860 () Bool)

(declare-fun e!744310 () Bool)

(assert (=> b!1304860 (= e!744312 e!744310)))

(declare-fun c!125296 () Bool)

(assert (=> b!1304860 (= c!125296 (bvslt from!2144 (size!42436 _keys!1741)))))

(declare-fun b!1304861 () Bool)

(assert (=> b!1304861 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42436 _keys!1741)))))

(assert (=> b!1304861 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42435 _values!1445)))))

(declare-fun apply!1018 (ListLongMap!20363 (_ BitVec 64)) V!51681)

(assert (=> b!1304861 (= e!744311 (= (apply!1018 lt!583901 (select (arr!41884 _keys!1741) from!2144)) (get!21183 (select (arr!41883 _values!1445) from!2144) (dynLambda!3456 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1304862 () Bool)

(declare-fun isEmpty!1075 (ListLongMap!20363) Bool)

(assert (=> b!1304862 (= e!744310 (isEmpty!1075 lt!583901))))

(declare-fun b!1304863 () Bool)

(assert (=> b!1304863 (= e!744308 call!64286)))

(declare-fun b!1304864 () Bool)

(assert (=> b!1304864 (= e!744310 (= lt!583901 (getCurrentListMapNoExtraKeys!6156 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun b!1304865 () Bool)

(assert (=> b!1304865 (= e!744307 e!744308)))

(declare-fun c!125295 () Bool)

(assert (=> b!1304865 (= c!125295 (validKeyInArray!0 (select (arr!41884 _keys!1741) from!2144)))))

(declare-fun bm!64283 () Bool)

(assert (=> bm!64283 (= call!64286 (getCurrentListMapNoExtraKeys!6156 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448))))

(assert (= (and d!141847 c!125294) b!1304854))

(assert (= (and d!141847 (not c!125294)) b!1304865))

(assert (= (and b!1304865 c!125295) b!1304857))

(assert (= (and b!1304865 (not c!125295)) b!1304863))

(assert (= (or b!1304857 b!1304863) bm!64283))

(assert (= (and d!141847 res!866557) b!1304855))

(assert (= (and b!1304855 res!866556) b!1304858))

(assert (= (and b!1304858 res!866554) b!1304856))

(assert (= (and b!1304858 c!125293) b!1304859))

(assert (= (and b!1304858 (not c!125293)) b!1304860))

(assert (= (and b!1304859 res!866555) b!1304861))

(assert (= (and b!1304860 c!125296) b!1304864))

(assert (= (and b!1304860 (not c!125296)) b!1304862))

(declare-fun b_lambda!23317 () Bool)

(assert (=> (not b_lambda!23317) (not b!1304857)))

(declare-fun t!43409 () Bool)

(declare-fun tb!11397 () Bool)

(assert (=> (and start!110222 (= defaultEntry!1448 defaultEntry!1448) t!43409) tb!11397))

(declare-fun result!23829 () Bool)

(assert (=> tb!11397 (= result!23829 tp_is_empty!34933)))

(assert (=> b!1304857 t!43409))

(declare-fun b_and!47471 () Bool)

(assert (= b_and!47465 (and (=> t!43409 result!23829) b_and!47471)))

(declare-fun b_lambda!23319 () Bool)

(assert (=> (not b_lambda!23319) (not b!1304861)))

(assert (=> b!1304861 t!43409))

(declare-fun b_and!47473 () Bool)

(assert (= b_and!47471 (and (=> t!43409 result!23829) b_and!47473)))

(assert (=> b!1304857 m!1195369))

(declare-fun m!1195475 () Bool)

(assert (=> b!1304857 m!1195475))

(declare-fun m!1195477 () Bool)

(assert (=> b!1304857 m!1195477))

(declare-fun m!1195479 () Bool)

(assert (=> b!1304857 m!1195479))

(declare-fun m!1195481 () Bool)

(assert (=> b!1304857 m!1195481))

(declare-fun m!1195483 () Bool)

(assert (=> b!1304857 m!1195483))

(declare-fun m!1195485 () Bool)

(assert (=> b!1304857 m!1195485))

(assert (=> b!1304857 m!1195483))

(declare-fun m!1195487 () Bool)

(assert (=> b!1304857 m!1195487))

(assert (=> b!1304857 m!1195479))

(assert (=> b!1304857 m!1195477))

(declare-fun m!1195489 () Bool)

(assert (=> bm!64283 m!1195489))

(assert (=> b!1304859 m!1195369))

(assert (=> b!1304859 m!1195369))

(declare-fun m!1195491 () Bool)

(assert (=> b!1304859 m!1195491))

(assert (=> b!1304864 m!1195489))

(declare-fun m!1195493 () Bool)

(assert (=> d!141847 m!1195493))

(assert (=> d!141847 m!1195373))

(declare-fun m!1195495 () Bool)

(assert (=> b!1304862 m!1195495))

(assert (=> b!1304861 m!1195369))

(assert (=> b!1304861 m!1195477))

(assert (=> b!1304861 m!1195479))

(assert (=> b!1304861 m!1195481))

(assert (=> b!1304861 m!1195479))

(assert (=> b!1304861 m!1195477))

(assert (=> b!1304861 m!1195369))

(declare-fun m!1195497 () Bool)

(assert (=> b!1304861 m!1195497))

(assert (=> b!1304856 m!1195369))

(assert (=> b!1304856 m!1195369))

(assert (=> b!1304856 m!1195371))

(declare-fun m!1195499 () Bool)

(assert (=> b!1304855 m!1195499))

(assert (=> b!1304865 m!1195369))

(assert (=> b!1304865 m!1195369))

(assert (=> b!1304865 m!1195371))

(assert (=> b!1304733 d!141847))

(declare-fun d!141849 () Bool)

(declare-fun res!866563 () Bool)

(declare-fun e!744320 () Bool)

(assert (=> d!141849 (=> res!866563 e!744320)))

(assert (=> d!141849 (= res!866563 (bvsge #b00000000000000000000000000000000 (size!42436 _keys!1741)))))

(assert (=> d!141849 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!744320)))

(declare-fun b!1304876 () Bool)

(declare-fun e!744322 () Bool)

(declare-fun e!744321 () Bool)

(assert (=> b!1304876 (= e!744322 e!744321)))

(declare-fun lt!583915 () (_ BitVec 64))

(assert (=> b!1304876 (= lt!583915 (select (arr!41884 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!583913 () Unit!43055)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86791 (_ BitVec 64) (_ BitVec 32)) Unit!43055)

(assert (=> b!1304876 (= lt!583913 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!583915 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!86791 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1304876 (arrayContainsKey!0 _keys!1741 lt!583915 #b00000000000000000000000000000000)))

(declare-fun lt!583914 () Unit!43055)

(assert (=> b!1304876 (= lt!583914 lt!583913)))

(declare-fun res!866562 () Bool)

(declare-datatypes ((SeekEntryResult!10027 0))(
  ( (MissingZero!10027 (index!42479 (_ BitVec 32))) (Found!10027 (index!42480 (_ BitVec 32))) (Intermediate!10027 (undefined!10839 Bool) (index!42481 (_ BitVec 32)) (x!115890 (_ BitVec 32))) (Undefined!10027) (MissingVacant!10027 (index!42482 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86791 (_ BitVec 32)) SeekEntryResult!10027)

(assert (=> b!1304876 (= res!866562 (= (seekEntryOrOpen!0 (select (arr!41884 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!10027 #b00000000000000000000000000000000)))))

(assert (=> b!1304876 (=> (not res!866562) (not e!744321))))

(declare-fun b!1304877 () Bool)

(assert (=> b!1304877 (= e!744320 e!744322)))

(declare-fun c!125299 () Bool)

(assert (=> b!1304877 (= c!125299 (validKeyInArray!0 (select (arr!41884 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun bm!64286 () Bool)

(declare-fun call!64289 () Bool)

(assert (=> bm!64286 (= call!64289 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1304878 () Bool)

(assert (=> b!1304878 (= e!744322 call!64289)))

(declare-fun b!1304879 () Bool)

(assert (=> b!1304879 (= e!744321 call!64289)))

(assert (= (and d!141849 (not res!866563)) b!1304877))

(assert (= (and b!1304877 c!125299) b!1304876))

(assert (= (and b!1304877 (not c!125299)) b!1304878))

(assert (= (and b!1304876 res!866562) b!1304879))

(assert (= (or b!1304879 b!1304878) bm!64286))

(declare-fun m!1195501 () Bool)

(assert (=> b!1304876 m!1195501))

(declare-fun m!1195503 () Bool)

(assert (=> b!1304876 m!1195503))

(declare-fun m!1195505 () Bool)

(assert (=> b!1304876 m!1195505))

(assert (=> b!1304876 m!1195501))

(declare-fun m!1195507 () Bool)

(assert (=> b!1304876 m!1195507))

(assert (=> b!1304877 m!1195501))

(assert (=> b!1304877 m!1195501))

(declare-fun m!1195509 () Bool)

(assert (=> b!1304877 m!1195509))

(declare-fun m!1195511 () Bool)

(assert (=> bm!64286 m!1195511))

(assert (=> b!1304734 d!141849))

(declare-fun d!141851 () Bool)

(declare-fun e!744324 () Bool)

(assert (=> d!141851 e!744324))

(declare-fun res!866564 () Bool)

(assert (=> d!141851 (=> res!866564 e!744324)))

(declare-fun lt!583916 () Bool)

(assert (=> d!141851 (= res!866564 (not lt!583916))))

(declare-fun lt!583919 () Bool)

(assert (=> d!141851 (= lt!583916 lt!583919)))

(declare-fun lt!583917 () Unit!43055)

(declare-fun e!744323 () Unit!43055)

(assert (=> d!141851 (= lt!583917 e!744323)))

(declare-fun c!125300 () Bool)

(assert (=> d!141851 (= c!125300 lt!583919)))

(assert (=> d!141851 (= lt!583919 (containsKey!728 (toList!10197 (ListLongMap!20364 Nil!29807)) k0!1205))))

(assert (=> d!141851 (= (contains!8267 (ListLongMap!20364 Nil!29807) k0!1205) lt!583916)))

(declare-fun b!1304880 () Bool)

(declare-fun lt!583918 () Unit!43055)

(assert (=> b!1304880 (= e!744323 lt!583918)))

(assert (=> b!1304880 (= lt!583918 (lemmaContainsKeyImpliesGetValueByKeyDefined!475 (toList!10197 (ListLongMap!20364 Nil!29807)) k0!1205))))

(assert (=> b!1304880 (isDefined!518 (getValueByKey!711 (toList!10197 (ListLongMap!20364 Nil!29807)) k0!1205))))

(declare-fun b!1304881 () Bool)

(declare-fun Unit!43062 () Unit!43055)

(assert (=> b!1304881 (= e!744323 Unit!43062)))

(declare-fun b!1304882 () Bool)

(assert (=> b!1304882 (= e!744324 (isDefined!518 (getValueByKey!711 (toList!10197 (ListLongMap!20364 Nil!29807)) k0!1205)))))

(assert (= (and d!141851 c!125300) b!1304880))

(assert (= (and d!141851 (not c!125300)) b!1304881))

(assert (= (and d!141851 (not res!866564)) b!1304882))

(declare-fun m!1195513 () Bool)

(assert (=> d!141851 m!1195513))

(declare-fun m!1195515 () Bool)

(assert (=> b!1304880 m!1195515))

(declare-fun m!1195517 () Bool)

(assert (=> b!1304880 m!1195517))

(assert (=> b!1304880 m!1195517))

(declare-fun m!1195519 () Bool)

(assert (=> b!1304880 m!1195519))

(assert (=> b!1304882 m!1195517))

(assert (=> b!1304882 m!1195517))

(assert (=> b!1304882 m!1195519))

(assert (=> b!1304730 d!141851))

(declare-fun d!141853 () Bool)

(assert (=> d!141853 (not (contains!8267 (ListLongMap!20364 Nil!29807) k0!1205))))

(declare-fun lt!583922 () Unit!43055)

(declare-fun choose!1943 ((_ BitVec 64)) Unit!43055)

(assert (=> d!141853 (= lt!583922 (choose!1943 k0!1205))))

(assert (=> d!141853 (= (emptyContainsNothing!224 k0!1205) lt!583922)))

(declare-fun bs!37146 () Bool)

(assert (= bs!37146 d!141853))

(assert (=> bs!37146 m!1195379))

(declare-fun m!1195521 () Bool)

(assert (=> bs!37146 m!1195521))

(assert (=> b!1304730 d!141853))

(declare-fun d!141855 () Bool)

(declare-fun e!744326 () Bool)

(assert (=> d!141855 e!744326))

(declare-fun res!866565 () Bool)

(assert (=> d!141855 (=> res!866565 e!744326)))

(declare-fun lt!583923 () Bool)

(assert (=> d!141855 (= res!866565 (not lt!583923))))

(declare-fun lt!583926 () Bool)

(assert (=> d!141855 (= lt!583923 lt!583926)))

(declare-fun lt!583924 () Unit!43055)

(declare-fun e!744325 () Unit!43055)

(assert (=> d!141855 (= lt!583924 e!744325)))

(declare-fun c!125301 () Bool)

(assert (=> d!141855 (= c!125301 lt!583926)))

(assert (=> d!141855 (= lt!583926 (containsKey!728 (toList!10197 (getCurrentListMap!5097 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!141855 (= (contains!8267 (getCurrentListMap!5097 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!583923)))

(declare-fun b!1304883 () Bool)

(declare-fun lt!583925 () Unit!43055)

(assert (=> b!1304883 (= e!744325 lt!583925)))

(assert (=> b!1304883 (= lt!583925 (lemmaContainsKeyImpliesGetValueByKeyDefined!475 (toList!10197 (getCurrentListMap!5097 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> b!1304883 (isDefined!518 (getValueByKey!711 (toList!10197 (getCurrentListMap!5097 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1304884 () Bool)

(declare-fun Unit!43063 () Unit!43055)

(assert (=> b!1304884 (= e!744325 Unit!43063)))

(declare-fun b!1304885 () Bool)

(assert (=> b!1304885 (= e!744326 (isDefined!518 (getValueByKey!711 (toList!10197 (getCurrentListMap!5097 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141855 c!125301) b!1304883))

(assert (= (and d!141855 (not c!125301)) b!1304884))

(assert (= (and d!141855 (not res!866565)) b!1304885))

(declare-fun m!1195523 () Bool)

(assert (=> d!141855 m!1195523))

(declare-fun m!1195525 () Bool)

(assert (=> b!1304883 m!1195525))

(declare-fun m!1195527 () Bool)

(assert (=> b!1304883 m!1195527))

(assert (=> b!1304883 m!1195527))

(declare-fun m!1195529 () Bool)

(assert (=> b!1304883 m!1195529))

(assert (=> b!1304885 m!1195527))

(assert (=> b!1304885 m!1195527))

(assert (=> b!1304885 m!1195529))

(assert (=> b!1304731 d!141855))

(declare-fun d!141857 () Bool)

(declare-fun e!744365 () Bool)

(assert (=> d!141857 e!744365))

(declare-fun res!866584 () Bool)

(assert (=> d!141857 (=> (not res!866584) (not e!744365))))

(assert (=> d!141857 (= res!866584 (or (bvsge from!2144 (size!42436 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42436 _keys!1741)))))))

(declare-fun lt!583973 () ListLongMap!20363)

(declare-fun lt!583971 () ListLongMap!20363)

(assert (=> d!141857 (= lt!583973 lt!583971)))

(declare-fun lt!583975 () Unit!43055)

(declare-fun e!744363 () Unit!43055)

(assert (=> d!141857 (= lt!583975 e!744363)))

(declare-fun c!125315 () Bool)

(declare-fun e!744360 () Bool)

(assert (=> d!141857 (= c!125315 e!744360)))

(declare-fun res!866585 () Bool)

(assert (=> d!141857 (=> (not res!866585) (not e!744360))))

(assert (=> d!141857 (= res!866585 (bvslt from!2144 (size!42436 _keys!1741)))))

(declare-fun e!744355 () ListLongMap!20363)

(assert (=> d!141857 (= lt!583971 e!744355)))

(declare-fun c!125319 () Bool)

(assert (=> d!141857 (= c!125319 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!141857 (validMask!0 mask!2175)))

(assert (=> d!141857 (= (getCurrentListMap!5097 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!583973)))

(declare-fun b!1304928 () Bool)

(declare-fun e!744353 () Bool)

(declare-fun e!744362 () Bool)

(assert (=> b!1304928 (= e!744353 e!744362)))

(declare-fun res!866589 () Bool)

(assert (=> b!1304928 (=> (not res!866589) (not e!744362))))

(assert (=> b!1304928 (= res!866589 (contains!8267 lt!583973 (select (arr!41884 _keys!1741) from!2144)))))

(assert (=> b!1304928 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42436 _keys!1741)))))

(declare-fun b!1304929 () Bool)

(assert (=> b!1304929 (= e!744360 (validKeyInArray!0 (select (arr!41884 _keys!1741) from!2144)))))

(declare-fun b!1304930 () Bool)

(declare-fun e!744357 () Bool)

(declare-fun call!64304 () Bool)

(assert (=> b!1304930 (= e!744357 (not call!64304))))

(declare-fun b!1304931 () Bool)

(declare-fun call!64307 () ListLongMap!20363)

(assert (=> b!1304931 (= e!744355 (+!4521 call!64307 (tuple2!22707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1304932 () Bool)

(declare-fun e!744364 () Bool)

(declare-fun e!744361 () Bool)

(assert (=> b!1304932 (= e!744364 e!744361)))

(declare-fun res!866586 () Bool)

(declare-fun call!64305 () Bool)

(assert (=> b!1304932 (= res!866586 call!64305)))

(assert (=> b!1304932 (=> (not res!866586) (not e!744361))))

(declare-fun bm!64301 () Bool)

(declare-fun call!64309 () ListLongMap!20363)

(declare-fun call!64308 () ListLongMap!20363)

(assert (=> bm!64301 (= call!64309 call!64308)))

(declare-fun bm!64302 () Bool)

(assert (=> bm!64302 (= call!64308 (getCurrentListMapNoExtraKeys!6156 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1304933 () Bool)

(declare-fun c!125314 () Bool)

(assert (=> b!1304933 (= c!125314 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!744356 () ListLongMap!20363)

(declare-fun e!744354 () ListLongMap!20363)

(assert (=> b!1304933 (= e!744356 e!744354)))

(declare-fun call!64310 () ListLongMap!20363)

(declare-fun c!125317 () Bool)

(declare-fun bm!64303 () Bool)

(assert (=> bm!64303 (= call!64307 (+!4521 (ite c!125319 call!64308 (ite c!125317 call!64309 call!64310)) (ite (or c!125319 c!125317) (tuple2!22707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1304934 () Bool)

(declare-fun call!64306 () ListLongMap!20363)

(assert (=> b!1304934 (= e!744354 call!64306)))

(declare-fun b!1304935 () Bool)

(declare-fun Unit!43064 () Unit!43055)

(assert (=> b!1304935 (= e!744363 Unit!43064)))

(declare-fun b!1304936 () Bool)

(declare-fun e!744358 () Bool)

(assert (=> b!1304936 (= e!744357 e!744358)))

(declare-fun res!866591 () Bool)

(assert (=> b!1304936 (= res!866591 call!64304)))

(assert (=> b!1304936 (=> (not res!866591) (not e!744358))))

(declare-fun b!1304937 () Bool)

(declare-fun res!866592 () Bool)

(assert (=> b!1304937 (=> (not res!866592) (not e!744365))))

(assert (=> b!1304937 (= res!866592 e!744353)))

(declare-fun res!866590 () Bool)

(assert (=> b!1304937 (=> res!866590 e!744353)))

(declare-fun e!744359 () Bool)

(assert (=> b!1304937 (= res!866590 (not e!744359))))

(declare-fun res!866587 () Bool)

(assert (=> b!1304937 (=> (not res!866587) (not e!744359))))

(assert (=> b!1304937 (= res!866587 (bvslt from!2144 (size!42436 _keys!1741)))))

(declare-fun b!1304938 () Bool)

(assert (=> b!1304938 (= e!744364 (not call!64305))))

(declare-fun b!1304939 () Bool)

(assert (=> b!1304939 (= e!744362 (= (apply!1018 lt!583973 (select (arr!41884 _keys!1741) from!2144)) (get!21183 (select (arr!41883 _values!1445) from!2144) (dynLambda!3456 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1304939 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42435 _values!1445)))))

(assert (=> b!1304939 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42436 _keys!1741)))))

(declare-fun bm!64304 () Bool)

(assert (=> bm!64304 (= call!64305 (contains!8267 lt!583973 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1304940 () Bool)

(declare-fun res!866588 () Bool)

(assert (=> b!1304940 (=> (not res!866588) (not e!744365))))

(assert (=> b!1304940 (= res!866588 e!744364)))

(declare-fun c!125316 () Bool)

(assert (=> b!1304940 (= c!125316 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1304941 () Bool)

(assert (=> b!1304941 (= e!744356 call!64306)))

(declare-fun bm!64305 () Bool)

(assert (=> bm!64305 (= call!64306 call!64307)))

(declare-fun b!1304942 () Bool)

(declare-fun lt!583980 () Unit!43055)

(assert (=> b!1304942 (= e!744363 lt!583980)))

(declare-fun lt!583982 () ListLongMap!20363)

(assert (=> b!1304942 (= lt!583982 (getCurrentListMapNoExtraKeys!6156 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583974 () (_ BitVec 64))

(assert (=> b!1304942 (= lt!583974 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583988 () (_ BitVec 64))

(assert (=> b!1304942 (= lt!583988 (select (arr!41884 _keys!1741) from!2144))))

(declare-fun lt!583976 () Unit!43055)

(declare-fun addStillContains!1113 (ListLongMap!20363 (_ BitVec 64) V!51681 (_ BitVec 64)) Unit!43055)

(assert (=> b!1304942 (= lt!583976 (addStillContains!1113 lt!583982 lt!583974 zeroValue!1387 lt!583988))))

(assert (=> b!1304942 (contains!8267 (+!4521 lt!583982 (tuple2!22707 lt!583974 zeroValue!1387)) lt!583988)))

(declare-fun lt!583984 () Unit!43055)

(assert (=> b!1304942 (= lt!583984 lt!583976)))

(declare-fun lt!583989 () ListLongMap!20363)

(assert (=> b!1304942 (= lt!583989 (getCurrentListMapNoExtraKeys!6156 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583979 () (_ BitVec 64))

(assert (=> b!1304942 (= lt!583979 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583981 () (_ BitVec 64))

(assert (=> b!1304942 (= lt!583981 (select (arr!41884 _keys!1741) from!2144))))

(declare-fun lt!583977 () Unit!43055)

(declare-fun addApplyDifferent!556 (ListLongMap!20363 (_ BitVec 64) V!51681 (_ BitVec 64)) Unit!43055)

(assert (=> b!1304942 (= lt!583977 (addApplyDifferent!556 lt!583989 lt!583979 minValue!1387 lt!583981))))

(assert (=> b!1304942 (= (apply!1018 (+!4521 lt!583989 (tuple2!22707 lt!583979 minValue!1387)) lt!583981) (apply!1018 lt!583989 lt!583981))))

(declare-fun lt!583978 () Unit!43055)

(assert (=> b!1304942 (= lt!583978 lt!583977)))

(declare-fun lt!583992 () ListLongMap!20363)

(assert (=> b!1304942 (= lt!583992 (getCurrentListMapNoExtraKeys!6156 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583987 () (_ BitVec 64))

(assert (=> b!1304942 (= lt!583987 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583991 () (_ BitVec 64))

(assert (=> b!1304942 (= lt!583991 (select (arr!41884 _keys!1741) from!2144))))

(declare-fun lt!583972 () Unit!43055)

(assert (=> b!1304942 (= lt!583972 (addApplyDifferent!556 lt!583992 lt!583987 zeroValue!1387 lt!583991))))

(assert (=> b!1304942 (= (apply!1018 (+!4521 lt!583992 (tuple2!22707 lt!583987 zeroValue!1387)) lt!583991) (apply!1018 lt!583992 lt!583991))))

(declare-fun lt!583990 () Unit!43055)

(assert (=> b!1304942 (= lt!583990 lt!583972)))

(declare-fun lt!583986 () ListLongMap!20363)

(assert (=> b!1304942 (= lt!583986 (getCurrentListMapNoExtraKeys!6156 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583985 () (_ BitVec 64))

(assert (=> b!1304942 (= lt!583985 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583983 () (_ BitVec 64))

(assert (=> b!1304942 (= lt!583983 (select (arr!41884 _keys!1741) from!2144))))

(assert (=> b!1304942 (= lt!583980 (addApplyDifferent!556 lt!583986 lt!583985 minValue!1387 lt!583983))))

(assert (=> b!1304942 (= (apply!1018 (+!4521 lt!583986 (tuple2!22707 lt!583985 minValue!1387)) lt!583983) (apply!1018 lt!583986 lt!583983))))

(declare-fun b!1304943 () Bool)

(assert (=> b!1304943 (= e!744355 e!744356)))

(assert (=> b!1304943 (= c!125317 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!64306 () Bool)

(assert (=> bm!64306 (= call!64304 (contains!8267 lt!583973 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1304944 () Bool)

(assert (=> b!1304944 (= e!744359 (validKeyInArray!0 (select (arr!41884 _keys!1741) from!2144)))))

(declare-fun b!1304945 () Bool)

(assert (=> b!1304945 (= e!744361 (= (apply!1018 lt!583973 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun bm!64307 () Bool)

(assert (=> bm!64307 (= call!64310 call!64309)))

(declare-fun b!1304946 () Bool)

(assert (=> b!1304946 (= e!744365 e!744357)))

(declare-fun c!125318 () Bool)

(assert (=> b!1304946 (= c!125318 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1304947 () Bool)

(assert (=> b!1304947 (= e!744358 (= (apply!1018 lt!583973 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun b!1304948 () Bool)

(assert (=> b!1304948 (= e!744354 call!64310)))

(assert (= (and d!141857 c!125319) b!1304931))

(assert (= (and d!141857 (not c!125319)) b!1304943))

(assert (= (and b!1304943 c!125317) b!1304941))

(assert (= (and b!1304943 (not c!125317)) b!1304933))

(assert (= (and b!1304933 c!125314) b!1304934))

(assert (= (and b!1304933 (not c!125314)) b!1304948))

(assert (= (or b!1304934 b!1304948) bm!64307))

(assert (= (or b!1304941 bm!64307) bm!64301))

(assert (= (or b!1304941 b!1304934) bm!64305))

(assert (= (or b!1304931 bm!64301) bm!64302))

(assert (= (or b!1304931 bm!64305) bm!64303))

(assert (= (and d!141857 res!866585) b!1304929))

(assert (= (and d!141857 c!125315) b!1304942))

(assert (= (and d!141857 (not c!125315)) b!1304935))

(assert (= (and d!141857 res!866584) b!1304937))

(assert (= (and b!1304937 res!866587) b!1304944))

(assert (= (and b!1304937 (not res!866590)) b!1304928))

(assert (= (and b!1304928 res!866589) b!1304939))

(assert (= (and b!1304937 res!866592) b!1304940))

(assert (= (and b!1304940 c!125316) b!1304932))

(assert (= (and b!1304940 (not c!125316)) b!1304938))

(assert (= (and b!1304932 res!866586) b!1304945))

(assert (= (or b!1304932 b!1304938) bm!64304))

(assert (= (and b!1304940 res!866588) b!1304946))

(assert (= (and b!1304946 c!125318) b!1304936))

(assert (= (and b!1304946 (not c!125318)) b!1304930))

(assert (= (and b!1304936 res!866591) b!1304947))

(assert (= (or b!1304936 b!1304930) bm!64306))

(declare-fun b_lambda!23321 () Bool)

(assert (=> (not b_lambda!23321) (not b!1304939)))

(assert (=> b!1304939 t!43409))

(declare-fun b_and!47475 () Bool)

(assert (= b_and!47473 (and (=> t!43409 result!23829) b_and!47475)))

(declare-fun m!1195531 () Bool)

(assert (=> b!1304942 m!1195531))

(declare-fun m!1195533 () Bool)

(assert (=> b!1304942 m!1195533))

(declare-fun m!1195535 () Bool)

(assert (=> b!1304942 m!1195535))

(declare-fun m!1195537 () Bool)

(assert (=> b!1304942 m!1195537))

(declare-fun m!1195539 () Bool)

(assert (=> b!1304942 m!1195539))

(declare-fun m!1195541 () Bool)

(assert (=> b!1304942 m!1195541))

(declare-fun m!1195543 () Bool)

(assert (=> b!1304942 m!1195543))

(assert (=> b!1304942 m!1195367))

(assert (=> b!1304942 m!1195369))

(assert (=> b!1304942 m!1195535))

(declare-fun m!1195545 () Bool)

(assert (=> b!1304942 m!1195545))

(declare-fun m!1195547 () Bool)

(assert (=> b!1304942 m!1195547))

(declare-fun m!1195549 () Bool)

(assert (=> b!1304942 m!1195549))

(assert (=> b!1304942 m!1195531))

(declare-fun m!1195551 () Bool)

(assert (=> b!1304942 m!1195551))

(declare-fun m!1195553 () Bool)

(assert (=> b!1304942 m!1195553))

(declare-fun m!1195555 () Bool)

(assert (=> b!1304942 m!1195555))

(declare-fun m!1195557 () Bool)

(assert (=> b!1304942 m!1195557))

(declare-fun m!1195559 () Bool)

(assert (=> b!1304942 m!1195559))

(assert (=> b!1304942 m!1195545))

(assert (=> b!1304942 m!1195553))

(assert (=> d!141857 m!1195373))

(declare-fun m!1195561 () Bool)

(assert (=> b!1304945 m!1195561))

(declare-fun m!1195563 () Bool)

(assert (=> b!1304947 m!1195563))

(declare-fun m!1195565 () Bool)

(assert (=> bm!64304 m!1195565))

(assert (=> b!1304928 m!1195369))

(assert (=> b!1304928 m!1195369))

(declare-fun m!1195567 () Bool)

(assert (=> b!1304928 m!1195567))

(declare-fun m!1195569 () Bool)

(assert (=> bm!64303 m!1195569))

(assert (=> b!1304929 m!1195369))

(assert (=> b!1304929 m!1195369))

(assert (=> b!1304929 m!1195371))

(assert (=> bm!64302 m!1195367))

(assert (=> b!1304944 m!1195369))

(assert (=> b!1304944 m!1195369))

(assert (=> b!1304944 m!1195371))

(declare-fun m!1195571 () Bool)

(assert (=> bm!64306 m!1195571))

(assert (=> b!1304939 m!1195369))

(assert (=> b!1304939 m!1195369))

(declare-fun m!1195573 () Bool)

(assert (=> b!1304939 m!1195573))

(assert (=> b!1304939 m!1195477))

(assert (=> b!1304939 m!1195479))

(assert (=> b!1304939 m!1195481))

(assert (=> b!1304939 m!1195479))

(assert (=> b!1304939 m!1195477))

(declare-fun m!1195575 () Bool)

(assert (=> b!1304931 m!1195575))

(assert (=> b!1304731 d!141857))

(declare-fun b!1304959 () Bool)

(declare-fun e!744376 () Bool)

(declare-fun call!64313 () Bool)

(assert (=> b!1304959 (= e!744376 call!64313)))

(declare-fun b!1304960 () Bool)

(declare-fun e!744374 () Bool)

(declare-fun contains!8271 (List!29811 (_ BitVec 64)) Bool)

(assert (=> b!1304960 (= e!744374 (contains!8271 Nil!29808 (select (arr!41884 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1304961 () Bool)

(assert (=> b!1304961 (= e!744376 call!64313)))

(declare-fun bm!64310 () Bool)

(declare-fun c!125322 () Bool)

(assert (=> bm!64310 (= call!64313 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125322 (Cons!29807 (select (arr!41884 _keys!1741) #b00000000000000000000000000000000) Nil!29808) Nil!29808)))))

(declare-fun d!141859 () Bool)

(declare-fun res!866599 () Bool)

(declare-fun e!744377 () Bool)

(assert (=> d!141859 (=> res!866599 e!744377)))

(assert (=> d!141859 (= res!866599 (bvsge #b00000000000000000000000000000000 (size!42436 _keys!1741)))))

(assert (=> d!141859 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29808) e!744377)))

(declare-fun b!1304962 () Bool)

(declare-fun e!744375 () Bool)

(assert (=> b!1304962 (= e!744377 e!744375)))

(declare-fun res!866601 () Bool)

(assert (=> b!1304962 (=> (not res!866601) (not e!744375))))

(assert (=> b!1304962 (= res!866601 (not e!744374))))

(declare-fun res!866600 () Bool)

(assert (=> b!1304962 (=> (not res!866600) (not e!744374))))

(assert (=> b!1304962 (= res!866600 (validKeyInArray!0 (select (arr!41884 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1304963 () Bool)

(assert (=> b!1304963 (= e!744375 e!744376)))

(assert (=> b!1304963 (= c!125322 (validKeyInArray!0 (select (arr!41884 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!141859 (not res!866599)) b!1304962))

(assert (= (and b!1304962 res!866600) b!1304960))

(assert (= (and b!1304962 res!866601) b!1304963))

(assert (= (and b!1304963 c!125322) b!1304959))

(assert (= (and b!1304963 (not c!125322)) b!1304961))

(assert (= (or b!1304959 b!1304961) bm!64310))

(assert (=> b!1304960 m!1195501))

(assert (=> b!1304960 m!1195501))

(declare-fun m!1195577 () Bool)

(assert (=> b!1304960 m!1195577))

(assert (=> bm!64310 m!1195501))

(declare-fun m!1195579 () Bool)

(assert (=> bm!64310 m!1195579))

(assert (=> b!1304962 m!1195501))

(assert (=> b!1304962 m!1195501))

(assert (=> b!1304962 m!1195509))

(assert (=> b!1304963 m!1195501))

(assert (=> b!1304963 m!1195501))

(assert (=> b!1304963 m!1195509))

(assert (=> b!1304735 d!141859))

(declare-fun b!1304971 () Bool)

(declare-fun e!744382 () Bool)

(assert (=> b!1304971 (= e!744382 tp_is_empty!34933)))

(declare-fun mapNonEmpty!54012 () Bool)

(declare-fun mapRes!54012 () Bool)

(declare-fun tp!103057 () Bool)

(declare-fun e!744383 () Bool)

(assert (=> mapNonEmpty!54012 (= mapRes!54012 (and tp!103057 e!744383))))

(declare-fun mapKey!54012 () (_ BitVec 32))

(declare-fun mapRest!54012 () (Array (_ BitVec 32) ValueCell!16568))

(declare-fun mapValue!54012 () ValueCell!16568)

(assert (=> mapNonEmpty!54012 (= mapRest!54003 (store mapRest!54012 mapKey!54012 mapValue!54012))))

(declare-fun mapIsEmpty!54012 () Bool)

(assert (=> mapIsEmpty!54012 mapRes!54012))

(declare-fun b!1304970 () Bool)

(assert (=> b!1304970 (= e!744383 tp_is_empty!34933)))

(declare-fun condMapEmpty!54012 () Bool)

(declare-fun mapDefault!54012 () ValueCell!16568)

(assert (=> mapNonEmpty!54003 (= condMapEmpty!54012 (= mapRest!54003 ((as const (Array (_ BitVec 32) ValueCell!16568)) mapDefault!54012)))))

(assert (=> mapNonEmpty!54003 (= tp!103042 (and e!744382 mapRes!54012))))

(assert (= (and mapNonEmpty!54003 condMapEmpty!54012) mapIsEmpty!54012))

(assert (= (and mapNonEmpty!54003 (not condMapEmpty!54012)) mapNonEmpty!54012))

(assert (= (and mapNonEmpty!54012 ((_ is ValueCellFull!16568) mapValue!54012)) b!1304970))

(assert (= (and mapNonEmpty!54003 ((_ is ValueCellFull!16568) mapDefault!54012)) b!1304971))

(declare-fun m!1195581 () Bool)

(assert (=> mapNonEmpty!54012 m!1195581))

(declare-fun b_lambda!23323 () Bool)

(assert (= b_lambda!23319 (or (and start!110222 b_free!29293) b_lambda!23323)))

(declare-fun b_lambda!23325 () Bool)

(assert (= b_lambda!23321 (or (and start!110222 b_free!29293) b_lambda!23325)))

(declare-fun b_lambda!23327 () Bool)

(assert (= b_lambda!23317 (or (and start!110222 b_free!29293) b_lambda!23327)))

(check-sat (not b!1304885) (not b!1304929) (not b!1304945) (not bm!64310) (not b!1304855) (not b!1304859) (not b!1304944) (not bm!64303) (not d!141851) (not bm!64283) (not bm!64286) (not b_lambda!23325) (not b_lambda!23327) (not bm!64306) (not b!1304928) (not b!1304856) (not b!1304882) (not d!141855) tp_is_empty!34933 (not b_lambda!23323) (not d!141853) b_and!47475 (not b!1304817) (not b!1304963) (not b!1304960) (not b!1304880) (not d!141857) (not b_next!29293) (not b!1304939) (not bm!64304) (not b!1304825) (not b!1304877) (not b!1304819) (not b!1304931) (not b!1304883) (not b!1304824) (not b!1304857) (not b!1304947) (not b!1304862) (not b!1304861) (not b!1304962) (not bm!64302) (not b!1304876) (not d!141845) (not d!141847) (not mapNonEmpty!54012) (not d!141843) (not b!1304942) (not d!141841) (not b!1304865) (not b!1304864))
(check-sat b_and!47475 (not b_next!29293))
