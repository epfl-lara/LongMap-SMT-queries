; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109992 () Bool)

(assert start!109992)

(declare-fun b_free!29239 () Bool)

(declare-fun b_next!29239 () Bool)

(assert (=> start!109992 (= b_free!29239 (not b_next!29239))))

(declare-fun tp!102862 () Bool)

(declare-fun b_and!47373 () Bool)

(assert (=> start!109992 (= tp!102862 b_and!47373)))

(declare-fun b!1302633 () Bool)

(declare-fun res!865248 () Bool)

(declare-fun e!743019 () Bool)

(assert (=> b!1302633 (=> (not res!865248) (not e!743019))))

(declare-datatypes ((array!86671 0))(
  ( (array!86672 (arr!41829 (Array (_ BitVec 32) (_ BitVec 64))) (size!42381 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86671)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86671 (_ BitVec 32)) Bool)

(assert (=> b!1302633 (= res!865248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1302634 () Bool)

(declare-fun res!865251 () Bool)

(assert (=> b!1302634 (=> (not res!865251) (not e!743019))))

(declare-datatypes ((V!51609 0))(
  ( (V!51610 (val!17514 Int)) )
))
(declare-fun minValue!1387 () V!51609)

(declare-fun zeroValue!1387 () V!51609)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16541 0))(
  ( (ValueCellFull!16541 (v!20127 V!51609)) (EmptyCell!16541) )
))
(declare-datatypes ((array!86673 0))(
  ( (array!86674 (arr!41830 (Array (_ BitVec 32) ValueCell!16541)) (size!42382 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86673)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22654 0))(
  ( (tuple2!22655 (_1!11338 (_ BitVec 64)) (_2!11338 V!51609)) )
))
(declare-datatypes ((List!29767 0))(
  ( (Nil!29764) (Cons!29763 (h!30972 tuple2!22654) (t!43349 List!29767)) )
))
(declare-datatypes ((ListLongMap!20311 0))(
  ( (ListLongMap!20312 (toList!10171 List!29767)) )
))
(declare-fun contains!8231 (ListLongMap!20311 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5077 (array!86671 array!86673 (_ BitVec 32) (_ BitVec 32) V!51609 V!51609 (_ BitVec 32) Int) ListLongMap!20311)

(assert (=> b!1302634 (= res!865251 (contains!8231 (getCurrentListMap!5077 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1302635 () Bool)

(declare-fun res!865244 () Bool)

(assert (=> b!1302635 (=> (not res!865244) (not e!743019))))

(assert (=> b!1302635 (= res!865244 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42381 _keys!1741))))))

(declare-fun b!1302637 () Bool)

(declare-fun e!743021 () Bool)

(assert (=> b!1302637 (= e!743019 (not e!743021))))

(declare-fun res!865252 () Bool)

(assert (=> b!1302637 (=> res!865252 e!743021)))

(assert (=> b!1302637 (= res!865252 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1302637 (not (contains!8231 (ListLongMap!20312 Nil!29764) k0!1205))))

(declare-datatypes ((Unit!42970 0))(
  ( (Unit!42971) )
))
(declare-fun lt!582627 () Unit!42970)

(declare-fun emptyContainsNothing!204 ((_ BitVec 64)) Unit!42970)

(assert (=> b!1302637 (= lt!582627 (emptyContainsNothing!204 k0!1205))))

(declare-fun b!1302638 () Bool)

(declare-fun e!743018 () Bool)

(declare-fun tp_is_empty!34879 () Bool)

(assert (=> b!1302638 (= e!743018 tp_is_empty!34879)))

(declare-fun b!1302639 () Bool)

(declare-fun e!743020 () Bool)

(assert (=> b!1302639 (= e!743020 tp_is_empty!34879)))

(declare-fun b!1302640 () Bool)

(declare-fun res!865250 () Bool)

(assert (=> b!1302640 (=> (not res!865250) (not e!743019))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1302640 (= res!865250 (not (validKeyInArray!0 (select (arr!41829 _keys!1741) from!2144))))))

(declare-fun b!1302641 () Bool)

(declare-fun res!865247 () Bool)

(assert (=> b!1302641 (=> (not res!865247) (not e!743019))))

(assert (=> b!1302641 (= res!865247 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42381 _keys!1741))))))

(declare-fun mapNonEmpty!53905 () Bool)

(declare-fun mapRes!53905 () Bool)

(declare-fun tp!102863 () Bool)

(assert (=> mapNonEmpty!53905 (= mapRes!53905 (and tp!102863 e!743020))))

(declare-fun mapRest!53905 () (Array (_ BitVec 32) ValueCell!16541))

(declare-fun mapValue!53905 () ValueCell!16541)

(declare-fun mapKey!53905 () (_ BitVec 32))

(assert (=> mapNonEmpty!53905 (= (arr!41830 _values!1445) (store mapRest!53905 mapKey!53905 mapValue!53905))))

(declare-fun b!1302642 () Bool)

(declare-fun e!743024 () Bool)

(assert (=> b!1302642 (= e!743024 (and e!743018 mapRes!53905))))

(declare-fun condMapEmpty!53905 () Bool)

(declare-fun mapDefault!53905 () ValueCell!16541)

(assert (=> b!1302642 (= condMapEmpty!53905 (= (arr!41830 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16541)) mapDefault!53905)))))

(declare-fun b!1302643 () Bool)

(declare-fun res!865245 () Bool)

(assert (=> b!1302643 (=> (not res!865245) (not e!743019))))

(assert (=> b!1302643 (= res!865245 (and (= (size!42382 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42381 _keys!1741) (size!42382 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!865249 () Bool)

(assert (=> start!109992 (=> (not res!865249) (not e!743019))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109992 (= res!865249 (validMask!0 mask!2175))))

(assert (=> start!109992 e!743019))

(assert (=> start!109992 tp_is_empty!34879))

(assert (=> start!109992 true))

(declare-fun array_inv!31815 (array!86673) Bool)

(assert (=> start!109992 (and (array_inv!31815 _values!1445) e!743024)))

(declare-fun array_inv!31816 (array!86671) Bool)

(assert (=> start!109992 (array_inv!31816 _keys!1741)))

(assert (=> start!109992 tp!102862))

(declare-fun b!1302636 () Bool)

(declare-fun e!743022 () Bool)

(assert (=> b!1302636 (= e!743022 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!1205)))))

(declare-fun b!1302644 () Bool)

(declare-fun res!865243 () Bool)

(assert (=> b!1302644 (=> (not res!865243) (not e!743019))))

(declare-datatypes ((List!29768 0))(
  ( (Nil!29765) (Cons!29764 (h!30973 (_ BitVec 64)) (t!43350 List!29768)) )
))
(declare-fun arrayNoDuplicates!0 (array!86671 (_ BitVec 32) List!29768) Bool)

(assert (=> b!1302644 (= res!865243 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29765))))

(declare-fun b!1302645 () Bool)

(assert (=> b!1302645 (= e!743021 e!743022)))

(declare-fun res!865246 () Bool)

(assert (=> b!1302645 (=> (not res!865246) (not e!743022))))

(declare-fun lt!582629 () ListLongMap!20311)

(assert (=> b!1302645 (= res!865246 (not (contains!8231 lt!582629 k0!1205)))))

(declare-fun +!4506 (ListLongMap!20311 tuple2!22654) ListLongMap!20311)

(assert (=> b!1302645 (not (contains!8231 (+!4506 lt!582629 (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!582628 () Unit!42970)

(declare-fun addStillNotContains!459 (ListLongMap!20311 (_ BitVec 64) V!51609 (_ BitVec 64)) Unit!42970)

(assert (=> b!1302645 (= lt!582628 (addStillNotContains!459 lt!582629 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6138 (array!86671 array!86673 (_ BitVec 32) (_ BitVec 32) V!51609 V!51609 (_ BitVec 32) Int) ListLongMap!20311)

(assert (=> b!1302645 (= lt!582629 (getCurrentListMapNoExtraKeys!6138 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun mapIsEmpty!53905 () Bool)

(assert (=> mapIsEmpty!53905 mapRes!53905))

(assert (= (and start!109992 res!865249) b!1302643))

(assert (= (and b!1302643 res!865245) b!1302633))

(assert (= (and b!1302633 res!865248) b!1302644))

(assert (= (and b!1302644 res!865243) b!1302635))

(assert (= (and b!1302635 res!865244) b!1302634))

(assert (= (and b!1302634 res!865251) b!1302641))

(assert (= (and b!1302641 res!865247) b!1302640))

(assert (= (and b!1302640 res!865250) b!1302637))

(assert (= (and b!1302637 (not res!865252)) b!1302645))

(assert (= (and b!1302645 res!865246) b!1302636))

(assert (= (and b!1302642 condMapEmpty!53905) mapIsEmpty!53905))

(assert (= (and b!1302642 (not condMapEmpty!53905)) mapNonEmpty!53905))

(get-info :version)

(assert (= (and mapNonEmpty!53905 ((_ is ValueCellFull!16541) mapValue!53905)) b!1302639))

(assert (= (and b!1302642 ((_ is ValueCellFull!16541) mapDefault!53905)) b!1302638))

(assert (= start!109992 b!1302642))

(declare-fun m!1193083 () Bool)

(assert (=> b!1302637 m!1193083))

(declare-fun m!1193085 () Bool)

(assert (=> b!1302637 m!1193085))

(declare-fun m!1193087 () Bool)

(assert (=> mapNonEmpty!53905 m!1193087))

(declare-fun m!1193089 () Bool)

(assert (=> b!1302644 m!1193089))

(declare-fun m!1193091 () Bool)

(assert (=> b!1302640 m!1193091))

(assert (=> b!1302640 m!1193091))

(declare-fun m!1193093 () Bool)

(assert (=> b!1302640 m!1193093))

(declare-fun m!1193095 () Bool)

(assert (=> start!109992 m!1193095))

(declare-fun m!1193097 () Bool)

(assert (=> start!109992 m!1193097))

(declare-fun m!1193099 () Bool)

(assert (=> start!109992 m!1193099))

(declare-fun m!1193101 () Bool)

(assert (=> b!1302634 m!1193101))

(assert (=> b!1302634 m!1193101))

(declare-fun m!1193103 () Bool)

(assert (=> b!1302634 m!1193103))

(declare-fun m!1193105 () Bool)

(assert (=> b!1302645 m!1193105))

(declare-fun m!1193107 () Bool)

(assert (=> b!1302645 m!1193107))

(declare-fun m!1193109 () Bool)

(assert (=> b!1302645 m!1193109))

(assert (=> b!1302645 m!1193107))

(declare-fun m!1193111 () Bool)

(assert (=> b!1302645 m!1193111))

(declare-fun m!1193113 () Bool)

(assert (=> b!1302645 m!1193113))

(declare-fun m!1193115 () Bool)

(assert (=> b!1302633 m!1193115))

(check-sat (not b!1302644) tp_is_empty!34879 (not b!1302637) b_and!47373 (not b!1302640) (not mapNonEmpty!53905) (not b_next!29239) (not b!1302633) (not b!1302645) (not start!109992) (not b!1302634))
(check-sat b_and!47373 (not b_next!29239))
(get-model)

(declare-fun bm!64127 () Bool)

(declare-fun call!64130 () Bool)

(assert (=> bm!64127 (= call!64130 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun d!141455 () Bool)

(declare-fun res!865318 () Bool)

(declare-fun e!743074 () Bool)

(assert (=> d!141455 (=> res!865318 e!743074)))

(assert (=> d!141455 (= res!865318 (bvsge #b00000000000000000000000000000000 (size!42381 _keys!1741)))))

(assert (=> d!141455 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!743074)))

(declare-fun b!1302732 () Bool)

(declare-fun e!743075 () Bool)

(assert (=> b!1302732 (= e!743074 e!743075)))

(declare-fun c!125004 () Bool)

(assert (=> b!1302732 (= c!125004 (validKeyInArray!0 (select (arr!41829 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1302733 () Bool)

(declare-fun e!743073 () Bool)

(assert (=> b!1302733 (= e!743075 e!743073)))

(declare-fun lt!582654 () (_ BitVec 64))

(assert (=> b!1302733 (= lt!582654 (select (arr!41829 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!582655 () Unit!42970)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86671 (_ BitVec 64) (_ BitVec 32)) Unit!42970)

(assert (=> b!1302733 (= lt!582655 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!582654 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!86671 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1302733 (arrayContainsKey!0 _keys!1741 lt!582654 #b00000000000000000000000000000000)))

(declare-fun lt!582656 () Unit!42970)

(assert (=> b!1302733 (= lt!582656 lt!582655)))

(declare-fun res!865317 () Bool)

(declare-datatypes ((SeekEntryResult!10022 0))(
  ( (MissingZero!10022 (index!42459 (_ BitVec 32))) (Found!10022 (index!42460 (_ BitVec 32))) (Intermediate!10022 (undefined!10834 Bool) (index!42461 (_ BitVec 32)) (x!115705 (_ BitVec 32))) (Undefined!10022) (MissingVacant!10022 (index!42462 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86671 (_ BitVec 32)) SeekEntryResult!10022)

(assert (=> b!1302733 (= res!865317 (= (seekEntryOrOpen!0 (select (arr!41829 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!10022 #b00000000000000000000000000000000)))))

(assert (=> b!1302733 (=> (not res!865317) (not e!743073))))

(declare-fun b!1302734 () Bool)

(assert (=> b!1302734 (= e!743073 call!64130)))

(declare-fun b!1302735 () Bool)

(assert (=> b!1302735 (= e!743075 call!64130)))

(assert (= (and d!141455 (not res!865318)) b!1302732))

(assert (= (and b!1302732 c!125004) b!1302733))

(assert (= (and b!1302732 (not c!125004)) b!1302735))

(assert (= (and b!1302733 res!865317) b!1302734))

(assert (= (or b!1302734 b!1302735) bm!64127))

(declare-fun m!1193185 () Bool)

(assert (=> bm!64127 m!1193185))

(declare-fun m!1193187 () Bool)

(assert (=> b!1302732 m!1193187))

(assert (=> b!1302732 m!1193187))

(declare-fun m!1193189 () Bool)

(assert (=> b!1302732 m!1193189))

(assert (=> b!1302733 m!1193187))

(declare-fun m!1193191 () Bool)

(assert (=> b!1302733 m!1193191))

(declare-fun m!1193193 () Bool)

(assert (=> b!1302733 m!1193193))

(assert (=> b!1302733 m!1193187))

(declare-fun m!1193195 () Bool)

(assert (=> b!1302733 m!1193195))

(assert (=> b!1302633 d!141455))

(declare-fun d!141457 () Bool)

(assert (=> d!141457 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!109992 d!141457))

(declare-fun d!141459 () Bool)

(assert (=> d!141459 (= (array_inv!31815 _values!1445) (bvsge (size!42382 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!109992 d!141459))

(declare-fun d!141461 () Bool)

(assert (=> d!141461 (= (array_inv!31816 _keys!1741) (bvsge (size!42381 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!109992 d!141461))

(declare-fun d!141463 () Bool)

(declare-fun e!743080 () Bool)

(assert (=> d!141463 e!743080))

(declare-fun res!865321 () Bool)

(assert (=> d!141463 (=> res!865321 e!743080)))

(declare-fun lt!582667 () Bool)

(assert (=> d!141463 (= res!865321 (not lt!582667))))

(declare-fun lt!582665 () Bool)

(assert (=> d!141463 (= lt!582667 lt!582665)))

(declare-fun lt!582668 () Unit!42970)

(declare-fun e!743081 () Unit!42970)

(assert (=> d!141463 (= lt!582668 e!743081)))

(declare-fun c!125007 () Bool)

(assert (=> d!141463 (= c!125007 lt!582665)))

(declare-fun containsKey!723 (List!29767 (_ BitVec 64)) Bool)

(assert (=> d!141463 (= lt!582665 (containsKey!723 (toList!10171 (ListLongMap!20312 Nil!29764)) k0!1205))))

(assert (=> d!141463 (= (contains!8231 (ListLongMap!20312 Nil!29764) k0!1205) lt!582667)))

(declare-fun b!1302742 () Bool)

(declare-fun lt!582666 () Unit!42970)

(assert (=> b!1302742 (= e!743081 lt!582666)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!470 (List!29767 (_ BitVec 64)) Unit!42970)

(assert (=> b!1302742 (= lt!582666 (lemmaContainsKeyImpliesGetValueByKeyDefined!470 (toList!10171 (ListLongMap!20312 Nil!29764)) k0!1205))))

(declare-datatypes ((Option!757 0))(
  ( (Some!756 (v!20130 V!51609)) (None!755) )
))
(declare-fun isDefined!513 (Option!757) Bool)

(declare-fun getValueByKey!706 (List!29767 (_ BitVec 64)) Option!757)

(assert (=> b!1302742 (isDefined!513 (getValueByKey!706 (toList!10171 (ListLongMap!20312 Nil!29764)) k0!1205))))

(declare-fun b!1302743 () Bool)

(declare-fun Unit!42976 () Unit!42970)

(assert (=> b!1302743 (= e!743081 Unit!42976)))

(declare-fun b!1302744 () Bool)

(assert (=> b!1302744 (= e!743080 (isDefined!513 (getValueByKey!706 (toList!10171 (ListLongMap!20312 Nil!29764)) k0!1205)))))

(assert (= (and d!141463 c!125007) b!1302742))

(assert (= (and d!141463 (not c!125007)) b!1302743))

(assert (= (and d!141463 (not res!865321)) b!1302744))

(declare-fun m!1193197 () Bool)

(assert (=> d!141463 m!1193197))

(declare-fun m!1193199 () Bool)

(assert (=> b!1302742 m!1193199))

(declare-fun m!1193201 () Bool)

(assert (=> b!1302742 m!1193201))

(assert (=> b!1302742 m!1193201))

(declare-fun m!1193203 () Bool)

(assert (=> b!1302742 m!1193203))

(assert (=> b!1302744 m!1193201))

(assert (=> b!1302744 m!1193201))

(assert (=> b!1302744 m!1193203))

(assert (=> b!1302637 d!141463))

(declare-fun d!141465 () Bool)

(assert (=> d!141465 (not (contains!8231 (ListLongMap!20312 Nil!29764) k0!1205))))

(declare-fun lt!582671 () Unit!42970)

(declare-fun choose!1926 ((_ BitVec 64)) Unit!42970)

(assert (=> d!141465 (= lt!582671 (choose!1926 k0!1205))))

(assert (=> d!141465 (= (emptyContainsNothing!204 k0!1205) lt!582671)))

(declare-fun bs!37080 () Bool)

(assert (= bs!37080 d!141465))

(assert (=> bs!37080 m!1193083))

(declare-fun m!1193205 () Bool)

(assert (=> bs!37080 m!1193205))

(assert (=> b!1302637 d!141465))

(declare-fun d!141467 () Bool)

(declare-fun e!743084 () Bool)

(assert (=> d!141467 e!743084))

(declare-fun res!865326 () Bool)

(assert (=> d!141467 (=> (not res!865326) (not e!743084))))

(declare-fun lt!582681 () ListLongMap!20311)

(assert (=> d!141467 (= res!865326 (contains!8231 lt!582681 (_1!11338 (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lt!582680 () List!29767)

(assert (=> d!141467 (= lt!582681 (ListLongMap!20312 lt!582680))))

(declare-fun lt!582682 () Unit!42970)

(declare-fun lt!582683 () Unit!42970)

(assert (=> d!141467 (= lt!582682 lt!582683)))

(assert (=> d!141467 (= (getValueByKey!706 lt!582680 (_1!11338 (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!756 (_2!11338 (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lemmaContainsTupThenGetReturnValue!350 (List!29767 (_ BitVec 64) V!51609) Unit!42970)

(assert (=> d!141467 (= lt!582683 (lemmaContainsTupThenGetReturnValue!350 lt!582680 (_1!11338 (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11338 (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun insertStrictlySorted!479 (List!29767 (_ BitVec 64) V!51609) List!29767)

(assert (=> d!141467 (= lt!582680 (insertStrictlySorted!479 (toList!10171 lt!582629) (_1!11338 (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11338 (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!141467 (= (+!4506 lt!582629 (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) lt!582681)))

(declare-fun b!1302749 () Bool)

(declare-fun res!865327 () Bool)

(assert (=> b!1302749 (=> (not res!865327) (not e!743084))))

(assert (=> b!1302749 (= res!865327 (= (getValueByKey!706 (toList!10171 lt!582681) (_1!11338 (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!756 (_2!11338 (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(declare-fun b!1302750 () Bool)

(declare-fun contains!8234 (List!29767 tuple2!22654) Bool)

(assert (=> b!1302750 (= e!743084 (contains!8234 (toList!10171 lt!582681) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(assert (= (and d!141467 res!865326) b!1302749))

(assert (= (and b!1302749 res!865327) b!1302750))

(declare-fun m!1193207 () Bool)

(assert (=> d!141467 m!1193207))

(declare-fun m!1193209 () Bool)

(assert (=> d!141467 m!1193209))

(declare-fun m!1193211 () Bool)

(assert (=> d!141467 m!1193211))

(declare-fun m!1193213 () Bool)

(assert (=> d!141467 m!1193213))

(declare-fun m!1193215 () Bool)

(assert (=> b!1302749 m!1193215))

(declare-fun m!1193217 () Bool)

(assert (=> b!1302750 m!1193217))

(assert (=> b!1302645 d!141467))

(declare-fun d!141469 () Bool)

(declare-fun e!743085 () Bool)

(assert (=> d!141469 e!743085))

(declare-fun res!865328 () Bool)

(assert (=> d!141469 (=> res!865328 e!743085)))

(declare-fun lt!582686 () Bool)

(assert (=> d!141469 (= res!865328 (not lt!582686))))

(declare-fun lt!582684 () Bool)

(assert (=> d!141469 (= lt!582686 lt!582684)))

(declare-fun lt!582687 () Unit!42970)

(declare-fun e!743086 () Unit!42970)

(assert (=> d!141469 (= lt!582687 e!743086)))

(declare-fun c!125008 () Bool)

(assert (=> d!141469 (= c!125008 lt!582684)))

(assert (=> d!141469 (= lt!582684 (containsKey!723 (toList!10171 (+!4506 lt!582629 (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205))))

(assert (=> d!141469 (= (contains!8231 (+!4506 lt!582629 (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205) lt!582686)))

(declare-fun b!1302751 () Bool)

(declare-fun lt!582685 () Unit!42970)

(assert (=> b!1302751 (= e!743086 lt!582685)))

(assert (=> b!1302751 (= lt!582685 (lemmaContainsKeyImpliesGetValueByKeyDefined!470 (toList!10171 (+!4506 lt!582629 (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205))))

(assert (=> b!1302751 (isDefined!513 (getValueByKey!706 (toList!10171 (+!4506 lt!582629 (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205))))

(declare-fun b!1302752 () Bool)

(declare-fun Unit!42977 () Unit!42970)

(assert (=> b!1302752 (= e!743086 Unit!42977)))

(declare-fun b!1302753 () Bool)

(assert (=> b!1302753 (= e!743085 (isDefined!513 (getValueByKey!706 (toList!10171 (+!4506 lt!582629 (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205)))))

(assert (= (and d!141469 c!125008) b!1302751))

(assert (= (and d!141469 (not c!125008)) b!1302752))

(assert (= (and d!141469 (not res!865328)) b!1302753))

(declare-fun m!1193219 () Bool)

(assert (=> d!141469 m!1193219))

(declare-fun m!1193221 () Bool)

(assert (=> b!1302751 m!1193221))

(declare-fun m!1193223 () Bool)

(assert (=> b!1302751 m!1193223))

(assert (=> b!1302751 m!1193223))

(declare-fun m!1193225 () Bool)

(assert (=> b!1302751 m!1193225))

(assert (=> b!1302753 m!1193223))

(assert (=> b!1302753 m!1193223))

(assert (=> b!1302753 m!1193225))

(assert (=> b!1302645 d!141469))

(declare-fun d!141471 () Bool)

(declare-fun e!743087 () Bool)

(assert (=> d!141471 e!743087))

(declare-fun res!865329 () Bool)

(assert (=> d!141471 (=> res!865329 e!743087)))

(declare-fun lt!582690 () Bool)

(assert (=> d!141471 (= res!865329 (not lt!582690))))

(declare-fun lt!582688 () Bool)

(assert (=> d!141471 (= lt!582690 lt!582688)))

(declare-fun lt!582691 () Unit!42970)

(declare-fun e!743088 () Unit!42970)

(assert (=> d!141471 (= lt!582691 e!743088)))

(declare-fun c!125009 () Bool)

(assert (=> d!141471 (= c!125009 lt!582688)))

(assert (=> d!141471 (= lt!582688 (containsKey!723 (toList!10171 lt!582629) k0!1205))))

(assert (=> d!141471 (= (contains!8231 lt!582629 k0!1205) lt!582690)))

(declare-fun b!1302754 () Bool)

(declare-fun lt!582689 () Unit!42970)

(assert (=> b!1302754 (= e!743088 lt!582689)))

(assert (=> b!1302754 (= lt!582689 (lemmaContainsKeyImpliesGetValueByKeyDefined!470 (toList!10171 lt!582629) k0!1205))))

(assert (=> b!1302754 (isDefined!513 (getValueByKey!706 (toList!10171 lt!582629) k0!1205))))

(declare-fun b!1302755 () Bool)

(declare-fun Unit!42978 () Unit!42970)

(assert (=> b!1302755 (= e!743088 Unit!42978)))

(declare-fun b!1302756 () Bool)

(assert (=> b!1302756 (= e!743087 (isDefined!513 (getValueByKey!706 (toList!10171 lt!582629) k0!1205)))))

(assert (= (and d!141471 c!125009) b!1302754))

(assert (= (and d!141471 (not c!125009)) b!1302755))

(assert (= (and d!141471 (not res!865329)) b!1302756))

(declare-fun m!1193227 () Bool)

(assert (=> d!141471 m!1193227))

(declare-fun m!1193229 () Bool)

(assert (=> b!1302754 m!1193229))

(declare-fun m!1193231 () Bool)

(assert (=> b!1302754 m!1193231))

(assert (=> b!1302754 m!1193231))

(declare-fun m!1193233 () Bool)

(assert (=> b!1302754 m!1193233))

(assert (=> b!1302756 m!1193231))

(assert (=> b!1302756 m!1193231))

(assert (=> b!1302756 m!1193233))

(assert (=> b!1302645 d!141471))

(declare-fun d!141473 () Bool)

(assert (=> d!141473 (not (contains!8231 (+!4506 lt!582629 (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!582694 () Unit!42970)

(declare-fun choose!1927 (ListLongMap!20311 (_ BitVec 64) V!51609 (_ BitVec 64)) Unit!42970)

(assert (=> d!141473 (= lt!582694 (choose!1927 lt!582629 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun e!743091 () Bool)

(assert (=> d!141473 e!743091))

(declare-fun res!865332 () Bool)

(assert (=> d!141473 (=> (not res!865332) (not e!743091))))

(assert (=> d!141473 (= res!865332 (not (contains!8231 lt!582629 k0!1205)))))

(assert (=> d!141473 (= (addStillNotContains!459 lt!582629 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205) lt!582694)))

(declare-fun b!1302760 () Bool)

(assert (=> b!1302760 (= e!743091 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!1205)))))

(assert (= (and d!141473 res!865332) b!1302760))

(assert (=> d!141473 m!1193107))

(assert (=> d!141473 m!1193107))

(assert (=> d!141473 m!1193109))

(declare-fun m!1193235 () Bool)

(assert (=> d!141473 m!1193235))

(assert (=> d!141473 m!1193113))

(assert (=> b!1302645 d!141473))

(declare-fun b!1302785 () Bool)

(declare-fun e!743111 () Bool)

(assert (=> b!1302785 (= e!743111 (validKeyInArray!0 (select (arr!41829 _keys!1741) from!2144)))))

(assert (=> b!1302785 (bvsge from!2144 #b00000000000000000000000000000000)))

(declare-fun b!1302786 () Bool)

(declare-fun e!743107 () ListLongMap!20311)

(assert (=> b!1302786 (= e!743107 (ListLongMap!20312 Nil!29764))))

(declare-fun bm!64130 () Bool)

(declare-fun call!64133 () ListLongMap!20311)

(assert (=> bm!64130 (= call!64133 (getCurrentListMapNoExtraKeys!6138 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun b!1302787 () Bool)

(assert (=> b!1302787 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42381 _keys!1741)))))

(assert (=> b!1302787 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42382 _values!1445)))))

(declare-fun e!743108 () Bool)

(declare-fun lt!582711 () ListLongMap!20311)

(declare-fun apply!1013 (ListLongMap!20311 (_ BitVec 64)) V!51609)

(declare-fun get!21154 (ValueCell!16541 V!51609) V!51609)

(declare-fun dynLambda!3451 (Int (_ BitVec 64)) V!51609)

(assert (=> b!1302787 (= e!743108 (= (apply!1013 lt!582711 (select (arr!41829 _keys!1741) from!2144)) (get!21154 (select (arr!41830 _values!1445) from!2144) (dynLambda!3451 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1302788 () Bool)

(declare-fun e!743106 () Bool)

(declare-fun e!743112 () Bool)

(assert (=> b!1302788 (= e!743106 e!743112)))

(declare-fun c!125019 () Bool)

(assert (=> b!1302788 (= c!125019 (bvslt from!2144 (size!42381 _keys!1741)))))

(declare-fun b!1302789 () Bool)

(declare-fun res!865341 () Bool)

(declare-fun e!743109 () Bool)

(assert (=> b!1302789 (=> (not res!865341) (not e!743109))))

(assert (=> b!1302789 (= res!865341 (not (contains!8231 lt!582711 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1302790 () Bool)

(declare-fun lt!582712 () Unit!42970)

(declare-fun lt!582714 () Unit!42970)

(assert (=> b!1302790 (= lt!582712 lt!582714)))

(declare-fun lt!582709 () ListLongMap!20311)

(declare-fun lt!582710 () V!51609)

(declare-fun lt!582715 () (_ BitVec 64))

(declare-fun lt!582713 () (_ BitVec 64))

(assert (=> b!1302790 (not (contains!8231 (+!4506 lt!582709 (tuple2!22655 lt!582713 lt!582710)) lt!582715))))

(assert (=> b!1302790 (= lt!582714 (addStillNotContains!459 lt!582709 lt!582713 lt!582710 lt!582715))))

(assert (=> b!1302790 (= lt!582715 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1302790 (= lt!582710 (get!21154 (select (arr!41830 _values!1445) from!2144) (dynLambda!3451 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1302790 (= lt!582713 (select (arr!41829 _keys!1741) from!2144))))

(assert (=> b!1302790 (= lt!582709 call!64133)))

(declare-fun e!743110 () ListLongMap!20311)

(assert (=> b!1302790 (= e!743110 (+!4506 call!64133 (tuple2!22655 (select (arr!41829 _keys!1741) from!2144) (get!21154 (select (arr!41830 _values!1445) from!2144) (dynLambda!3451 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1302791 () Bool)

(assert (=> b!1302791 (= e!743110 call!64133)))

(declare-fun b!1302793 () Bool)

(assert (=> b!1302793 (= e!743106 e!743108)))

(assert (=> b!1302793 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42381 _keys!1741)))))

(declare-fun res!865344 () Bool)

(assert (=> b!1302793 (= res!865344 (contains!8231 lt!582711 (select (arr!41829 _keys!1741) from!2144)))))

(assert (=> b!1302793 (=> (not res!865344) (not e!743108))))

(declare-fun b!1302794 () Bool)

(assert (=> b!1302794 (= e!743109 e!743106)))

(declare-fun c!125021 () Bool)

(assert (=> b!1302794 (= c!125021 e!743111)))

(declare-fun res!865343 () Bool)

(assert (=> b!1302794 (=> (not res!865343) (not e!743111))))

(assert (=> b!1302794 (= res!865343 (bvslt from!2144 (size!42381 _keys!1741)))))

(declare-fun b!1302792 () Bool)

(assert (=> b!1302792 (= e!743107 e!743110)))

(declare-fun c!125020 () Bool)

(assert (=> b!1302792 (= c!125020 (validKeyInArray!0 (select (arr!41829 _keys!1741) from!2144)))))

(declare-fun d!141475 () Bool)

(assert (=> d!141475 e!743109))

(declare-fun res!865342 () Bool)

(assert (=> d!141475 (=> (not res!865342) (not e!743109))))

(assert (=> d!141475 (= res!865342 (not (contains!8231 lt!582711 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!141475 (= lt!582711 e!743107)))

(declare-fun c!125018 () Bool)

(assert (=> d!141475 (= c!125018 (bvsge from!2144 (size!42381 _keys!1741)))))

(assert (=> d!141475 (validMask!0 mask!2175)))

(assert (=> d!141475 (= (getCurrentListMapNoExtraKeys!6138 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!582711)))

(declare-fun b!1302795 () Bool)

(declare-fun isEmpty!1066 (ListLongMap!20311) Bool)

(assert (=> b!1302795 (= e!743112 (isEmpty!1066 lt!582711))))

(declare-fun b!1302796 () Bool)

(assert (=> b!1302796 (= e!743112 (= lt!582711 (getCurrentListMapNoExtraKeys!6138 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448)))))

(assert (= (and d!141475 c!125018) b!1302786))

(assert (= (and d!141475 (not c!125018)) b!1302792))

(assert (= (and b!1302792 c!125020) b!1302790))

(assert (= (and b!1302792 (not c!125020)) b!1302791))

(assert (= (or b!1302790 b!1302791) bm!64130))

(assert (= (and d!141475 res!865342) b!1302789))

(assert (= (and b!1302789 res!865341) b!1302794))

(assert (= (and b!1302794 res!865343) b!1302785))

(assert (= (and b!1302794 c!125021) b!1302793))

(assert (= (and b!1302794 (not c!125021)) b!1302788))

(assert (= (and b!1302793 res!865344) b!1302787))

(assert (= (and b!1302788 c!125019) b!1302796))

(assert (= (and b!1302788 (not c!125019)) b!1302795))

(declare-fun b_lambda!23241 () Bool)

(assert (=> (not b_lambda!23241) (not b!1302787)))

(declare-fun t!43356 () Bool)

(declare-fun tb!11387 () Bool)

(assert (=> (and start!109992 (= defaultEntry!1448 defaultEntry!1448) t!43356) tb!11387))

(declare-fun result!23799 () Bool)

(assert (=> tb!11387 (= result!23799 tp_is_empty!34879)))

(assert (=> b!1302787 t!43356))

(declare-fun b_and!47379 () Bool)

(assert (= b_and!47373 (and (=> t!43356 result!23799) b_and!47379)))

(declare-fun b_lambda!23243 () Bool)

(assert (=> (not b_lambda!23243) (not b!1302790)))

(assert (=> b!1302790 t!43356))

(declare-fun b_and!47381 () Bool)

(assert (= b_and!47379 (and (=> t!43356 result!23799) b_and!47381)))

(assert (=> b!1302793 m!1193091))

(assert (=> b!1302793 m!1193091))

(declare-fun m!1193237 () Bool)

(assert (=> b!1302793 m!1193237))

(assert (=> b!1302785 m!1193091))

(assert (=> b!1302785 m!1193091))

(assert (=> b!1302785 m!1193093))

(declare-fun m!1193239 () Bool)

(assert (=> b!1302790 m!1193239))

(declare-fun m!1193241 () Bool)

(assert (=> b!1302790 m!1193241))

(declare-fun m!1193243 () Bool)

(assert (=> b!1302790 m!1193243))

(assert (=> b!1302790 m!1193239))

(declare-fun m!1193245 () Bool)

(assert (=> b!1302790 m!1193245))

(assert (=> b!1302790 m!1193091))

(declare-fun m!1193247 () Bool)

(assert (=> b!1302790 m!1193247))

(declare-fun m!1193249 () Bool)

(assert (=> b!1302790 m!1193249))

(assert (=> b!1302790 m!1193243))

(assert (=> b!1302790 m!1193241))

(declare-fun m!1193251 () Bool)

(assert (=> b!1302790 m!1193251))

(declare-fun m!1193253 () Bool)

(assert (=> bm!64130 m!1193253))

(assert (=> b!1302787 m!1193241))

(assert (=> b!1302787 m!1193091))

(declare-fun m!1193255 () Bool)

(assert (=> b!1302787 m!1193255))

(assert (=> b!1302787 m!1193243))

(assert (=> b!1302787 m!1193091))

(assert (=> b!1302787 m!1193243))

(assert (=> b!1302787 m!1193241))

(assert (=> b!1302787 m!1193251))

(assert (=> b!1302792 m!1193091))

(assert (=> b!1302792 m!1193091))

(assert (=> b!1302792 m!1193093))

(assert (=> b!1302796 m!1193253))

(declare-fun m!1193257 () Bool)

(assert (=> b!1302789 m!1193257))

(declare-fun m!1193259 () Bool)

(assert (=> b!1302795 m!1193259))

(declare-fun m!1193261 () Bool)

(assert (=> d!141475 m!1193261))

(assert (=> d!141475 m!1193095))

(assert (=> b!1302645 d!141475))

(declare-fun d!141477 () Bool)

(assert (=> d!141477 (= (validKeyInArray!0 (select (arr!41829 _keys!1741) from!2144)) (and (not (= (select (arr!41829 _keys!1741) from!2144) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41829 _keys!1741) from!2144) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1302640 d!141477))

(declare-fun d!141479 () Bool)

(declare-fun e!743113 () Bool)

(assert (=> d!141479 e!743113))

(declare-fun res!865345 () Bool)

(assert (=> d!141479 (=> res!865345 e!743113)))

(declare-fun lt!582718 () Bool)

(assert (=> d!141479 (= res!865345 (not lt!582718))))

(declare-fun lt!582716 () Bool)

(assert (=> d!141479 (= lt!582718 lt!582716)))

(declare-fun lt!582719 () Unit!42970)

(declare-fun e!743114 () Unit!42970)

(assert (=> d!141479 (= lt!582719 e!743114)))

(declare-fun c!125022 () Bool)

(assert (=> d!141479 (= c!125022 lt!582716)))

(assert (=> d!141479 (= lt!582716 (containsKey!723 (toList!10171 (getCurrentListMap!5077 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!141479 (= (contains!8231 (getCurrentListMap!5077 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!582718)))

(declare-fun b!1302799 () Bool)

(declare-fun lt!582717 () Unit!42970)

(assert (=> b!1302799 (= e!743114 lt!582717)))

(assert (=> b!1302799 (= lt!582717 (lemmaContainsKeyImpliesGetValueByKeyDefined!470 (toList!10171 (getCurrentListMap!5077 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> b!1302799 (isDefined!513 (getValueByKey!706 (toList!10171 (getCurrentListMap!5077 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1302800 () Bool)

(declare-fun Unit!42979 () Unit!42970)

(assert (=> b!1302800 (= e!743114 Unit!42979)))

(declare-fun b!1302801 () Bool)

(assert (=> b!1302801 (= e!743113 (isDefined!513 (getValueByKey!706 (toList!10171 (getCurrentListMap!5077 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141479 c!125022) b!1302799))

(assert (= (and d!141479 (not c!125022)) b!1302800))

(assert (= (and d!141479 (not res!865345)) b!1302801))

(declare-fun m!1193263 () Bool)

(assert (=> d!141479 m!1193263))

(declare-fun m!1193265 () Bool)

(assert (=> b!1302799 m!1193265))

(declare-fun m!1193267 () Bool)

(assert (=> b!1302799 m!1193267))

(assert (=> b!1302799 m!1193267))

(declare-fun m!1193269 () Bool)

(assert (=> b!1302799 m!1193269))

(assert (=> b!1302801 m!1193267))

(assert (=> b!1302801 m!1193267))

(assert (=> b!1302801 m!1193269))

(assert (=> b!1302634 d!141479))

(declare-fun bm!64145 () Bool)

(declare-fun call!64150 () ListLongMap!20311)

(assert (=> bm!64145 (= call!64150 (getCurrentListMapNoExtraKeys!6138 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1302844 () Bool)

(declare-fun e!743142 () Bool)

(declare-fun call!64154 () Bool)

(assert (=> b!1302844 (= e!743142 (not call!64154))))

(declare-fun b!1302845 () Bool)

(declare-fun e!743151 () ListLongMap!20311)

(declare-fun call!64152 () ListLongMap!20311)

(assert (=> b!1302845 (= e!743151 call!64152)))

(declare-fun bm!64146 () Bool)

(declare-fun call!64149 () ListLongMap!20311)

(assert (=> bm!64146 (= call!64149 call!64150)))

(declare-fun b!1302846 () Bool)

(declare-fun e!743143 () ListLongMap!20311)

(declare-fun call!64151 () ListLongMap!20311)

(assert (=> b!1302846 (= e!743143 (+!4506 call!64151 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun d!141481 () Bool)

(declare-fun e!743147 () Bool)

(assert (=> d!141481 e!743147))

(declare-fun res!865369 () Bool)

(assert (=> d!141481 (=> (not res!865369) (not e!743147))))

(assert (=> d!141481 (= res!865369 (or (bvsge from!2144 (size!42381 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42381 _keys!1741)))))))

(declare-fun lt!582783 () ListLongMap!20311)

(declare-fun lt!582777 () ListLongMap!20311)

(assert (=> d!141481 (= lt!582783 lt!582777)))

(declare-fun lt!582769 () Unit!42970)

(declare-fun e!743152 () Unit!42970)

(assert (=> d!141481 (= lt!582769 e!743152)))

(declare-fun c!125038 () Bool)

(declare-fun e!743148 () Bool)

(assert (=> d!141481 (= c!125038 e!743148)))

(declare-fun res!865364 () Bool)

(assert (=> d!141481 (=> (not res!865364) (not e!743148))))

(assert (=> d!141481 (= res!865364 (bvslt from!2144 (size!42381 _keys!1741)))))

(assert (=> d!141481 (= lt!582777 e!743143)))

(declare-fun c!125039 () Bool)

(assert (=> d!141481 (= c!125039 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!141481 (validMask!0 mask!2175)))

(assert (=> d!141481 (= (getCurrentListMap!5077 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!582783)))

(declare-fun b!1302847 () Bool)

(declare-fun e!743144 () Bool)

(assert (=> b!1302847 (= e!743144 (= (apply!1013 lt!582783 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun e!743149 () Bool)

(declare-fun b!1302848 () Bool)

(assert (=> b!1302848 (= e!743149 (= (apply!1013 lt!582783 (select (arr!41829 _keys!1741) from!2144)) (get!21154 (select (arr!41830 _values!1445) from!2144) (dynLambda!3451 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1302848 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42382 _values!1445)))))

(assert (=> b!1302848 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42381 _keys!1741)))))

(declare-fun b!1302849 () Bool)

(declare-fun res!865372 () Bool)

(assert (=> b!1302849 (=> (not res!865372) (not e!743147))))

(declare-fun e!743141 () Bool)

(assert (=> b!1302849 (= res!865372 e!743141)))

(declare-fun res!865371 () Bool)

(assert (=> b!1302849 (=> res!865371 e!743141)))

(declare-fun e!743146 () Bool)

(assert (=> b!1302849 (= res!865371 (not e!743146))))

(declare-fun res!865368 () Bool)

(assert (=> b!1302849 (=> (not res!865368) (not e!743146))))

(assert (=> b!1302849 (= res!865368 (bvslt from!2144 (size!42381 _keys!1741)))))

(declare-fun b!1302850 () Bool)

(declare-fun e!743150 () ListLongMap!20311)

(declare-fun call!64148 () ListLongMap!20311)

(assert (=> b!1302850 (= e!743150 call!64148)))

(declare-fun bm!64147 () Bool)

(assert (=> bm!64147 (= call!64154 (contains!8231 lt!582783 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!125035 () Bool)

(declare-fun bm!64148 () Bool)

(assert (=> bm!64148 (= call!64151 (+!4506 (ite c!125039 call!64150 (ite c!125035 call!64149 call!64148)) (ite (or c!125039 c!125035) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1302851 () Bool)

(declare-fun Unit!42980 () Unit!42970)

(assert (=> b!1302851 (= e!743152 Unit!42980)))

(declare-fun bm!64149 () Bool)

(assert (=> bm!64149 (= call!64148 call!64149)))

(declare-fun bm!64150 () Bool)

(assert (=> bm!64150 (= call!64152 call!64151)))

(declare-fun b!1302852 () Bool)

(assert (=> b!1302852 (= e!743143 e!743151)))

(assert (=> b!1302852 (= c!125035 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1302853 () Bool)

(declare-fun c!125036 () Bool)

(assert (=> b!1302853 (= c!125036 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1302853 (= e!743151 e!743150)))

(declare-fun b!1302854 () Bool)

(declare-fun e!743145 () Bool)

(assert (=> b!1302854 (= e!743145 e!743144)))

(declare-fun res!865365 () Bool)

(declare-fun call!64153 () Bool)

(assert (=> b!1302854 (= res!865365 call!64153)))

(assert (=> b!1302854 (=> (not res!865365) (not e!743144))))

(declare-fun b!1302855 () Bool)

(assert (=> b!1302855 (= e!743146 (validKeyInArray!0 (select (arr!41829 _keys!1741) from!2144)))))

(declare-fun b!1302856 () Bool)

(declare-fun e!743153 () Bool)

(assert (=> b!1302856 (= e!743153 (= (apply!1013 lt!582783 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun b!1302857 () Bool)

(assert (=> b!1302857 (= e!743148 (validKeyInArray!0 (select (arr!41829 _keys!1741) from!2144)))))

(declare-fun b!1302858 () Bool)

(assert (=> b!1302858 (= e!743145 (not call!64153))))

(declare-fun b!1302859 () Bool)

(assert (=> b!1302859 (= e!743150 call!64152)))

(declare-fun b!1302860 () Bool)

(assert (=> b!1302860 (= e!743142 e!743153)))

(declare-fun res!865366 () Bool)

(assert (=> b!1302860 (= res!865366 call!64154)))

(assert (=> b!1302860 (=> (not res!865366) (not e!743153))))

(declare-fun b!1302861 () Bool)

(assert (=> b!1302861 (= e!743147 e!743142)))

(declare-fun c!125037 () Bool)

(assert (=> b!1302861 (= c!125037 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1302862 () Bool)

(assert (=> b!1302862 (= e!743141 e!743149)))

(declare-fun res!865367 () Bool)

(assert (=> b!1302862 (=> (not res!865367) (not e!743149))))

(assert (=> b!1302862 (= res!865367 (contains!8231 lt!582783 (select (arr!41829 _keys!1741) from!2144)))))

(assert (=> b!1302862 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42381 _keys!1741)))))

(declare-fun b!1302863 () Bool)

(declare-fun lt!582770 () Unit!42970)

(assert (=> b!1302863 (= e!743152 lt!582770)))

(declare-fun lt!582782 () ListLongMap!20311)

(assert (=> b!1302863 (= lt!582782 (getCurrentListMapNoExtraKeys!6138 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!582768 () (_ BitVec 64))

(assert (=> b!1302863 (= lt!582768 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!582784 () (_ BitVec 64))

(assert (=> b!1302863 (= lt!582784 (select (arr!41829 _keys!1741) from!2144))))

(declare-fun lt!582778 () Unit!42970)

(declare-fun addStillContains!1108 (ListLongMap!20311 (_ BitVec 64) V!51609 (_ BitVec 64)) Unit!42970)

(assert (=> b!1302863 (= lt!582778 (addStillContains!1108 lt!582782 lt!582768 zeroValue!1387 lt!582784))))

(assert (=> b!1302863 (contains!8231 (+!4506 lt!582782 (tuple2!22655 lt!582768 zeroValue!1387)) lt!582784)))

(declare-fun lt!582767 () Unit!42970)

(assert (=> b!1302863 (= lt!582767 lt!582778)))

(declare-fun lt!582781 () ListLongMap!20311)

(assert (=> b!1302863 (= lt!582781 (getCurrentListMapNoExtraKeys!6138 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!582779 () (_ BitVec 64))

(assert (=> b!1302863 (= lt!582779 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!582775 () (_ BitVec 64))

(assert (=> b!1302863 (= lt!582775 (select (arr!41829 _keys!1741) from!2144))))

(declare-fun lt!582766 () Unit!42970)

(declare-fun addApplyDifferent!551 (ListLongMap!20311 (_ BitVec 64) V!51609 (_ BitVec 64)) Unit!42970)

(assert (=> b!1302863 (= lt!582766 (addApplyDifferent!551 lt!582781 lt!582779 minValue!1387 lt!582775))))

(assert (=> b!1302863 (= (apply!1013 (+!4506 lt!582781 (tuple2!22655 lt!582779 minValue!1387)) lt!582775) (apply!1013 lt!582781 lt!582775))))

(declare-fun lt!582773 () Unit!42970)

(assert (=> b!1302863 (= lt!582773 lt!582766)))

(declare-fun lt!582776 () ListLongMap!20311)

(assert (=> b!1302863 (= lt!582776 (getCurrentListMapNoExtraKeys!6138 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!582780 () (_ BitVec 64))

(assert (=> b!1302863 (= lt!582780 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!582771 () (_ BitVec 64))

(assert (=> b!1302863 (= lt!582771 (select (arr!41829 _keys!1741) from!2144))))

(declare-fun lt!582765 () Unit!42970)

(assert (=> b!1302863 (= lt!582765 (addApplyDifferent!551 lt!582776 lt!582780 zeroValue!1387 lt!582771))))

(assert (=> b!1302863 (= (apply!1013 (+!4506 lt!582776 (tuple2!22655 lt!582780 zeroValue!1387)) lt!582771) (apply!1013 lt!582776 lt!582771))))

(declare-fun lt!582764 () Unit!42970)

(assert (=> b!1302863 (= lt!582764 lt!582765)))

(declare-fun lt!582774 () ListLongMap!20311)

(assert (=> b!1302863 (= lt!582774 (getCurrentListMapNoExtraKeys!6138 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!582772 () (_ BitVec 64))

(assert (=> b!1302863 (= lt!582772 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!582785 () (_ BitVec 64))

(assert (=> b!1302863 (= lt!582785 (select (arr!41829 _keys!1741) from!2144))))

(assert (=> b!1302863 (= lt!582770 (addApplyDifferent!551 lt!582774 lt!582772 minValue!1387 lt!582785))))

(assert (=> b!1302863 (= (apply!1013 (+!4506 lt!582774 (tuple2!22655 lt!582772 minValue!1387)) lt!582785) (apply!1013 lt!582774 lt!582785))))

(declare-fun bm!64151 () Bool)

(assert (=> bm!64151 (= call!64153 (contains!8231 lt!582783 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1302864 () Bool)

(declare-fun res!865370 () Bool)

(assert (=> b!1302864 (=> (not res!865370) (not e!743147))))

(assert (=> b!1302864 (= res!865370 e!743145)))

(declare-fun c!125040 () Bool)

(assert (=> b!1302864 (= c!125040 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!141481 c!125039) b!1302846))

(assert (= (and d!141481 (not c!125039)) b!1302852))

(assert (= (and b!1302852 c!125035) b!1302845))

(assert (= (and b!1302852 (not c!125035)) b!1302853))

(assert (= (and b!1302853 c!125036) b!1302859))

(assert (= (and b!1302853 (not c!125036)) b!1302850))

(assert (= (or b!1302859 b!1302850) bm!64149))

(assert (= (or b!1302845 bm!64149) bm!64146))

(assert (= (or b!1302845 b!1302859) bm!64150))

(assert (= (or b!1302846 bm!64146) bm!64145))

(assert (= (or b!1302846 bm!64150) bm!64148))

(assert (= (and d!141481 res!865364) b!1302857))

(assert (= (and d!141481 c!125038) b!1302863))

(assert (= (and d!141481 (not c!125038)) b!1302851))

(assert (= (and d!141481 res!865369) b!1302849))

(assert (= (and b!1302849 res!865368) b!1302855))

(assert (= (and b!1302849 (not res!865371)) b!1302862))

(assert (= (and b!1302862 res!865367) b!1302848))

(assert (= (and b!1302849 res!865372) b!1302864))

(assert (= (and b!1302864 c!125040) b!1302854))

(assert (= (and b!1302864 (not c!125040)) b!1302858))

(assert (= (and b!1302854 res!865365) b!1302847))

(assert (= (or b!1302854 b!1302858) bm!64151))

(assert (= (and b!1302864 res!865370) b!1302861))

(assert (= (and b!1302861 c!125037) b!1302860))

(assert (= (and b!1302861 (not c!125037)) b!1302844))

(assert (= (and b!1302860 res!865366) b!1302856))

(assert (= (or b!1302860 b!1302844) bm!64147))

(declare-fun b_lambda!23245 () Bool)

(assert (=> (not b_lambda!23245) (not b!1302848)))

(assert (=> b!1302848 t!43356))

(declare-fun b_and!47383 () Bool)

(assert (= b_and!47381 (and (=> t!43356 result!23799) b_and!47383)))

(declare-fun m!1193271 () Bool)

(assert (=> bm!64148 m!1193271))

(assert (=> b!1302855 m!1193091))

(assert (=> b!1302855 m!1193091))

(assert (=> b!1302855 m!1193093))

(assert (=> bm!64145 m!1193111))

(assert (=> b!1302857 m!1193091))

(assert (=> b!1302857 m!1193091))

(assert (=> b!1302857 m!1193093))

(declare-fun m!1193273 () Bool)

(assert (=> bm!64147 m!1193273))

(assert (=> d!141481 m!1193095))

(assert (=> b!1302848 m!1193243))

(assert (=> b!1302848 m!1193241))

(assert (=> b!1302848 m!1193251))

(assert (=> b!1302848 m!1193091))

(declare-fun m!1193275 () Bool)

(assert (=> b!1302848 m!1193275))

(assert (=> b!1302848 m!1193243))

(assert (=> b!1302848 m!1193241))

(assert (=> b!1302848 m!1193091))

(declare-fun m!1193277 () Bool)

(assert (=> b!1302846 m!1193277))

(assert (=> b!1302862 m!1193091))

(assert (=> b!1302862 m!1193091))

(declare-fun m!1193279 () Bool)

(assert (=> b!1302862 m!1193279))

(declare-fun m!1193281 () Bool)

(assert (=> b!1302856 m!1193281))

(declare-fun m!1193283 () Bool)

(assert (=> b!1302847 m!1193283))

(declare-fun m!1193285 () Bool)

(assert (=> bm!64151 m!1193285))

(declare-fun m!1193287 () Bool)

(assert (=> b!1302863 m!1193287))

(declare-fun m!1193289 () Bool)

(assert (=> b!1302863 m!1193289))

(declare-fun m!1193291 () Bool)

(assert (=> b!1302863 m!1193291))

(assert (=> b!1302863 m!1193287))

(declare-fun m!1193293 () Bool)

(assert (=> b!1302863 m!1193293))

(declare-fun m!1193295 () Bool)

(assert (=> b!1302863 m!1193295))

(declare-fun m!1193297 () Bool)

(assert (=> b!1302863 m!1193297))

(declare-fun m!1193299 () Bool)

(assert (=> b!1302863 m!1193299))

(declare-fun m!1193301 () Bool)

(assert (=> b!1302863 m!1193301))

(declare-fun m!1193303 () Bool)

(assert (=> b!1302863 m!1193303))

(assert (=> b!1302863 m!1193091))

(declare-fun m!1193305 () Bool)

(assert (=> b!1302863 m!1193305))

(assert (=> b!1302863 m!1193299))

(declare-fun m!1193307 () Bool)

(assert (=> b!1302863 m!1193307))

(declare-fun m!1193309 () Bool)

(assert (=> b!1302863 m!1193309))

(declare-fun m!1193311 () Bool)

(assert (=> b!1302863 m!1193311))

(assert (=> b!1302863 m!1193301))

(assert (=> b!1302863 m!1193111))

(assert (=> b!1302863 m!1193297))

(declare-fun m!1193313 () Bool)

(assert (=> b!1302863 m!1193313))

(declare-fun m!1193315 () Bool)

(assert (=> b!1302863 m!1193315))

(assert (=> b!1302634 d!141481))

(declare-fun b!1302875 () Bool)

(declare-fun e!743162 () Bool)

(declare-fun e!743163 () Bool)

(assert (=> b!1302875 (= e!743162 e!743163)))

(declare-fun res!865379 () Bool)

(assert (=> b!1302875 (=> (not res!865379) (not e!743163))))

(declare-fun e!743164 () Bool)

(assert (=> b!1302875 (= res!865379 (not e!743164))))

(declare-fun res!865381 () Bool)

(assert (=> b!1302875 (=> (not res!865381) (not e!743164))))

(assert (=> b!1302875 (= res!865381 (validKeyInArray!0 (select (arr!41829 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1302876 () Bool)

(declare-fun e!743165 () Bool)

(declare-fun call!64157 () Bool)

(assert (=> b!1302876 (= e!743165 call!64157)))

(declare-fun b!1302877 () Bool)

(declare-fun contains!8235 (List!29768 (_ BitVec 64)) Bool)

(assert (=> b!1302877 (= e!743164 (contains!8235 Nil!29765 (select (arr!41829 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1302878 () Bool)

(assert (=> b!1302878 (= e!743163 e!743165)))

(declare-fun c!125043 () Bool)

(assert (=> b!1302878 (= c!125043 (validKeyInArray!0 (select (arr!41829 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun d!141483 () Bool)

(declare-fun res!865380 () Bool)

(assert (=> d!141483 (=> res!865380 e!743162)))

(assert (=> d!141483 (= res!865380 (bvsge #b00000000000000000000000000000000 (size!42381 _keys!1741)))))

(assert (=> d!141483 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29765) e!743162)))

(declare-fun bm!64154 () Bool)

(assert (=> bm!64154 (= call!64157 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125043 (Cons!29764 (select (arr!41829 _keys!1741) #b00000000000000000000000000000000) Nil!29765) Nil!29765)))))

(declare-fun b!1302879 () Bool)

(assert (=> b!1302879 (= e!743165 call!64157)))

(assert (= (and d!141483 (not res!865380)) b!1302875))

(assert (= (and b!1302875 res!865381) b!1302877))

(assert (= (and b!1302875 res!865379) b!1302878))

(assert (= (and b!1302878 c!125043) b!1302876))

(assert (= (and b!1302878 (not c!125043)) b!1302879))

(assert (= (or b!1302876 b!1302879) bm!64154))

(assert (=> b!1302875 m!1193187))

(assert (=> b!1302875 m!1193187))

(assert (=> b!1302875 m!1193189))

(assert (=> b!1302877 m!1193187))

(assert (=> b!1302877 m!1193187))

(declare-fun m!1193317 () Bool)

(assert (=> b!1302877 m!1193317))

(assert (=> b!1302878 m!1193187))

(assert (=> b!1302878 m!1193187))

(assert (=> b!1302878 m!1193189))

(assert (=> bm!64154 m!1193187))

(declare-fun m!1193319 () Bool)

(assert (=> bm!64154 m!1193319))

(assert (=> b!1302644 d!141483))

(declare-fun mapIsEmpty!53914 () Bool)

(declare-fun mapRes!53914 () Bool)

(assert (=> mapIsEmpty!53914 mapRes!53914))

(declare-fun b!1302887 () Bool)

(declare-fun e!743171 () Bool)

(assert (=> b!1302887 (= e!743171 tp_is_empty!34879)))

(declare-fun mapNonEmpty!53914 () Bool)

(declare-fun tp!102878 () Bool)

(declare-fun e!743170 () Bool)

(assert (=> mapNonEmpty!53914 (= mapRes!53914 (and tp!102878 e!743170))))

(declare-fun mapRest!53914 () (Array (_ BitVec 32) ValueCell!16541))

(declare-fun mapValue!53914 () ValueCell!16541)

(declare-fun mapKey!53914 () (_ BitVec 32))

(assert (=> mapNonEmpty!53914 (= mapRest!53905 (store mapRest!53914 mapKey!53914 mapValue!53914))))

(declare-fun b!1302886 () Bool)

(assert (=> b!1302886 (= e!743170 tp_is_empty!34879)))

(declare-fun condMapEmpty!53914 () Bool)

(declare-fun mapDefault!53914 () ValueCell!16541)

(assert (=> mapNonEmpty!53905 (= condMapEmpty!53914 (= mapRest!53905 ((as const (Array (_ BitVec 32) ValueCell!16541)) mapDefault!53914)))))

(assert (=> mapNonEmpty!53905 (= tp!102863 (and e!743171 mapRes!53914))))

(assert (= (and mapNonEmpty!53905 condMapEmpty!53914) mapIsEmpty!53914))

(assert (= (and mapNonEmpty!53905 (not condMapEmpty!53914)) mapNonEmpty!53914))

(assert (= (and mapNonEmpty!53914 ((_ is ValueCellFull!16541) mapValue!53914)) b!1302886))

(assert (= (and mapNonEmpty!53905 ((_ is ValueCellFull!16541) mapDefault!53914)) b!1302887))

(declare-fun m!1193321 () Bool)

(assert (=> mapNonEmpty!53914 m!1193321))

(declare-fun b_lambda!23247 () Bool)

(assert (= b_lambda!23241 (or (and start!109992 b_free!29239) b_lambda!23247)))

(declare-fun b_lambda!23249 () Bool)

(assert (= b_lambda!23243 (or (and start!109992 b_free!29239) b_lambda!23249)))

(declare-fun b_lambda!23251 () Bool)

(assert (= b_lambda!23245 (or (and start!109992 b_free!29239) b_lambda!23251)))

(check-sat (not b!1302785) (not b!1302846) (not b!1302799) (not b!1302857) (not b!1302751) (not d!141469) (not b_lambda!23249) (not b_next!29239) (not b!1302793) tp_is_empty!34879 (not b!1302847) (not b!1302790) (not b!1302795) (not d!141473) (not b!1302749) (not d!141475) (not b!1302878) (not d!141471) (not d!141463) (not bm!64154) (not b!1302750) (not b!1302756) (not b!1302742) (not mapNonEmpty!53914) (not b!1302856) (not b!1302863) (not bm!64148) (not b!1302877) (not b!1302801) (not b!1302787) (not b!1302754) (not b!1302753) (not d!141479) (not b!1302862) (not b!1302733) (not b!1302789) (not b_lambda!23247) (not b!1302744) (not bm!64151) (not b!1302855) (not b!1302792) (not d!141481) (not b!1302848) (not b!1302875) (not bm!64145) (not bm!64130) (not b_lambda!23251) b_and!47383 (not b!1302796) (not d!141467) (not bm!64147) (not bm!64127) (not b!1302732) (not d!141465))
(check-sat b_and!47383 (not b_next!29239))
