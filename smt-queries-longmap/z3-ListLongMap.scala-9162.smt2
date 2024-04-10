; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110024 () Bool)

(assert start!110024)

(declare-fun b_free!29247 () Bool)

(declare-fun b_next!29247 () Bool)

(assert (=> start!110024 (= b_free!29247 (not b_next!29247))))

(declare-fun tp!102889 () Bool)

(declare-fun b_and!47405 () Bool)

(assert (=> start!110024 (= tp!102889 b_and!47405)))

(declare-fun mapIsEmpty!53920 () Bool)

(declare-fun mapRes!53920 () Bool)

(assert (=> mapIsEmpty!53920 mapRes!53920))

(declare-fun b!1303018 () Bool)

(declare-fun res!865462 () Bool)

(declare-fun e!743237 () Bool)

(assert (=> b!1303018 (=> (not res!865462) (not e!743237))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!86788 0))(
  ( (array!86789 (arr!41886 (Array (_ BitVec 32) (_ BitVec 64))) (size!42436 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86788)

(assert (=> b!1303018 (= res!865462 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42436 _keys!1741))))))

(declare-fun b!1303019 () Bool)

(declare-fun res!865459 () Bool)

(assert (=> b!1303019 (=> (not res!865459) (not e!743237))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1303019 (= res!865459 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42436 _keys!1741))))))

(declare-fun b!1303020 () Bool)

(declare-fun res!865464 () Bool)

(assert (=> b!1303020 (=> (not res!865464) (not e!743237))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1303020 (= res!865464 (not (validKeyInArray!0 (select (arr!41886 _keys!1741) from!2144))))))

(declare-fun b!1303021 () Bool)

(declare-fun e!743240 () Bool)

(declare-fun tp_is_empty!34887 () Bool)

(assert (=> b!1303021 (= e!743240 tp_is_empty!34887)))

(declare-fun b!1303022 () Bool)

(declare-fun res!865461 () Bool)

(assert (=> b!1303022 (=> (not res!865461) (not e!743237))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51619 0))(
  ( (V!51620 (val!17518 Int)) )
))
(declare-datatypes ((ValueCell!16545 0))(
  ( (ValueCellFull!16545 (v!20133 V!51619)) (EmptyCell!16545) )
))
(declare-datatypes ((array!86790 0))(
  ( (array!86791 (arr!41887 (Array (_ BitVec 32) ValueCell!16545)) (size!42437 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86790)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1303022 (= res!865461 (and (= (size!42437 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42436 _keys!1741) (size!42437 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun e!743238 () Bool)

(declare-fun b!1303023 () Bool)

(declare-datatypes ((tuple2!22604 0))(
  ( (tuple2!22605 (_1!11313 (_ BitVec 64)) (_2!11313 V!51619)) )
))
(declare-fun lt!583004 () tuple2!22604)

(declare-datatypes ((List!29731 0))(
  ( (Nil!29728) (Cons!29727 (h!30936 tuple2!22604) (t!43323 List!29731)) )
))
(declare-datatypes ((ListLongMap!20261 0))(
  ( (ListLongMap!20262 (toList!10146 List!29731)) )
))
(declare-fun lt!583007 () ListLongMap!20261)

(declare-fun contains!8280 (ListLongMap!20261 (_ BitVec 64)) Bool)

(declare-fun +!4472 (ListLongMap!20261 tuple2!22604) ListLongMap!20261)

(assert (=> b!1303023 (= e!743238 (contains!8280 (+!4472 lt!583007 lt!583004) k0!1205))))

(declare-fun lt!583002 () ListLongMap!20261)

(assert (=> b!1303023 (not (contains!8280 (+!4472 lt!583002 lt!583004) k0!1205))))

(declare-fun minValue!1387 () V!51619)

(assert (=> b!1303023 (= lt!583004 (tuple2!22605 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))

(declare-datatypes ((Unit!43140 0))(
  ( (Unit!43141) )
))
(declare-fun lt!583003 () Unit!43140)

(declare-fun addStillNotContains!469 (ListLongMap!20261 (_ BitVec 64) V!51619 (_ BitVec 64)) Unit!43140)

(assert (=> b!1303023 (= lt!583003 (addStillNotContains!469 lt!583002 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1303023 (not (contains!8280 lt!583007 k0!1205))))

(declare-fun zeroValue!1387 () V!51619)

(assert (=> b!1303023 (= lt!583007 (+!4472 lt!583002 (tuple2!22605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!583006 () Unit!43140)

(assert (=> b!1303023 (= lt!583006 (addStillNotContains!469 lt!583002 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6105 (array!86788 array!86790 (_ BitVec 32) (_ BitVec 32) V!51619 V!51619 (_ BitVec 32) Int) ListLongMap!20261)

(assert (=> b!1303023 (= lt!583002 (getCurrentListMapNoExtraKeys!6105 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun mapNonEmpty!53920 () Bool)

(declare-fun tp!102888 () Bool)

(declare-fun e!743236 () Bool)

(assert (=> mapNonEmpty!53920 (= mapRes!53920 (and tp!102888 e!743236))))

(declare-fun mapRest!53920 () (Array (_ BitVec 32) ValueCell!16545))

(declare-fun mapValue!53920 () ValueCell!16545)

(declare-fun mapKey!53920 () (_ BitVec 32))

(assert (=> mapNonEmpty!53920 (= (arr!41887 _values!1445) (store mapRest!53920 mapKey!53920 mapValue!53920))))

(declare-fun b!1303024 () Bool)

(declare-fun res!865463 () Bool)

(assert (=> b!1303024 (=> (not res!865463) (not e!743237))))

(declare-datatypes ((List!29732 0))(
  ( (Nil!29729) (Cons!29728 (h!30937 (_ BitVec 64)) (t!43324 List!29732)) )
))
(declare-fun arrayNoDuplicates!0 (array!86788 (_ BitVec 32) List!29732) Bool)

(assert (=> b!1303024 (= res!865463 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29729))))

(declare-fun b!1303025 () Bool)

(declare-fun res!865460 () Bool)

(assert (=> b!1303025 (=> (not res!865460) (not e!743237))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86788 (_ BitVec 32)) Bool)

(assert (=> b!1303025 (= res!865460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1303027 () Bool)

(declare-fun e!743235 () Bool)

(assert (=> b!1303027 (= e!743235 (and e!743240 mapRes!53920))))

(declare-fun condMapEmpty!53920 () Bool)

(declare-fun mapDefault!53920 () ValueCell!16545)

(assert (=> b!1303027 (= condMapEmpty!53920 (= (arr!41887 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16545)) mapDefault!53920)))))

(declare-fun b!1303028 () Bool)

(assert (=> b!1303028 (= e!743236 tp_is_empty!34887)))

(declare-fun b!1303029 () Bool)

(declare-fun res!865458 () Bool)

(assert (=> b!1303029 (=> (not res!865458) (not e!743237))))

(declare-fun getCurrentListMap!5170 (array!86788 array!86790 (_ BitVec 32) (_ BitVec 32) V!51619 V!51619 (_ BitVec 32) Int) ListLongMap!20261)

(assert (=> b!1303029 (= res!865458 (contains!8280 (getCurrentListMap!5170 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1303026 () Bool)

(assert (=> b!1303026 (= e!743237 (not e!743238))))

(declare-fun res!865457 () Bool)

(assert (=> b!1303026 (=> res!865457 e!743238)))

(assert (=> b!1303026 (= res!865457 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1303026 (not (contains!8280 (ListLongMap!20262 Nil!29728) k0!1205))))

(declare-fun lt!583005 () Unit!43140)

(declare-fun emptyContainsNothing!211 ((_ BitVec 64)) Unit!43140)

(assert (=> b!1303026 (= lt!583005 (emptyContainsNothing!211 k0!1205))))

(declare-fun res!865456 () Bool)

(assert (=> start!110024 (=> (not res!865456) (not e!743237))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110024 (= res!865456 (validMask!0 mask!2175))))

(assert (=> start!110024 e!743237))

(assert (=> start!110024 tp_is_empty!34887))

(assert (=> start!110024 true))

(declare-fun array_inv!31681 (array!86790) Bool)

(assert (=> start!110024 (and (array_inv!31681 _values!1445) e!743235)))

(declare-fun array_inv!31682 (array!86788) Bool)

(assert (=> start!110024 (array_inv!31682 _keys!1741)))

(assert (=> start!110024 tp!102889))

(assert (= (and start!110024 res!865456) b!1303022))

(assert (= (and b!1303022 res!865461) b!1303025))

(assert (= (and b!1303025 res!865460) b!1303024))

(assert (= (and b!1303024 res!865463) b!1303018))

(assert (= (and b!1303018 res!865462) b!1303029))

(assert (= (and b!1303029 res!865458) b!1303019))

(assert (= (and b!1303019 res!865459) b!1303020))

(assert (= (and b!1303020 res!865464) b!1303026))

(assert (= (and b!1303026 (not res!865457)) b!1303023))

(assert (= (and b!1303027 condMapEmpty!53920) mapIsEmpty!53920))

(assert (= (and b!1303027 (not condMapEmpty!53920)) mapNonEmpty!53920))

(get-info :version)

(assert (= (and mapNonEmpty!53920 ((_ is ValueCellFull!16545) mapValue!53920)) b!1303028))

(assert (= (and b!1303027 ((_ is ValueCellFull!16545) mapDefault!53920)) b!1303021))

(assert (= start!110024 b!1303027))

(declare-fun m!1193881 () Bool)

(assert (=> b!1303024 m!1193881))

(declare-fun m!1193883 () Bool)

(assert (=> start!110024 m!1193883))

(declare-fun m!1193885 () Bool)

(assert (=> start!110024 m!1193885))

(declare-fun m!1193887 () Bool)

(assert (=> start!110024 m!1193887))

(declare-fun m!1193889 () Bool)

(assert (=> b!1303026 m!1193889))

(declare-fun m!1193891 () Bool)

(assert (=> b!1303026 m!1193891))

(declare-fun m!1193893 () Bool)

(assert (=> b!1303025 m!1193893))

(declare-fun m!1193895 () Bool)

(assert (=> mapNonEmpty!53920 m!1193895))

(declare-fun m!1193897 () Bool)

(assert (=> b!1303020 m!1193897))

(assert (=> b!1303020 m!1193897))

(declare-fun m!1193899 () Bool)

(assert (=> b!1303020 m!1193899))

(declare-fun m!1193901 () Bool)

(assert (=> b!1303029 m!1193901))

(assert (=> b!1303029 m!1193901))

(declare-fun m!1193903 () Bool)

(assert (=> b!1303029 m!1193903))

(declare-fun m!1193905 () Bool)

(assert (=> b!1303023 m!1193905))

(declare-fun m!1193907 () Bool)

(assert (=> b!1303023 m!1193907))

(declare-fun m!1193909 () Bool)

(assert (=> b!1303023 m!1193909))

(declare-fun m!1193911 () Bool)

(assert (=> b!1303023 m!1193911))

(declare-fun m!1193913 () Bool)

(assert (=> b!1303023 m!1193913))

(declare-fun m!1193915 () Bool)

(assert (=> b!1303023 m!1193915))

(declare-fun m!1193917 () Bool)

(assert (=> b!1303023 m!1193917))

(assert (=> b!1303023 m!1193913))

(declare-fun m!1193919 () Bool)

(assert (=> b!1303023 m!1193919))

(assert (=> b!1303023 m!1193911))

(declare-fun m!1193921 () Bool)

(assert (=> b!1303023 m!1193921))

(check-sat (not b_next!29247) (not mapNonEmpty!53920) (not start!110024) b_and!47405 (not b!1303029) (not b!1303026) (not b!1303023) (not b!1303024) (not b!1303020) tp_is_empty!34887 (not b!1303025))
(check-sat b_and!47405 (not b_next!29247))
(get-model)

(declare-fun d!141603 () Bool)

(declare-fun e!743261 () Bool)

(assert (=> d!141603 e!743261))

(declare-fun res!865496 () Bool)

(assert (=> d!141603 (=> (not res!865496) (not e!743261))))

(declare-fun lt!583034 () ListLongMap!20261)

(assert (=> d!141603 (= res!865496 (contains!8280 lt!583034 (_1!11313 (tuple2!22605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lt!583036 () List!29731)

(assert (=> d!141603 (= lt!583034 (ListLongMap!20262 lt!583036))))

(declare-fun lt!583035 () Unit!43140)

(declare-fun lt!583037 () Unit!43140)

(assert (=> d!141603 (= lt!583035 lt!583037)))

(declare-datatypes ((Option!756 0))(
  ( (Some!755 (v!20135 V!51619)) (None!754) )
))
(declare-fun getValueByKey!704 (List!29731 (_ BitVec 64)) Option!756)

(assert (=> d!141603 (= (getValueByKey!704 lt!583036 (_1!11313 (tuple2!22605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!755 (_2!11313 (tuple2!22605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lemmaContainsTupThenGetReturnValue!350 (List!29731 (_ BitVec 64) V!51619) Unit!43140)

(assert (=> d!141603 (= lt!583037 (lemmaContainsTupThenGetReturnValue!350 lt!583036 (_1!11313 (tuple2!22605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11313 (tuple2!22605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun insertStrictlySorted!479 (List!29731 (_ BitVec 64) V!51619) List!29731)

(assert (=> d!141603 (= lt!583036 (insertStrictlySorted!479 (toList!10146 lt!583002) (_1!11313 (tuple2!22605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11313 (tuple2!22605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!141603 (= (+!4472 lt!583002 (tuple2!22605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) lt!583034)))

(declare-fun b!1303070 () Bool)

(declare-fun res!865497 () Bool)

(assert (=> b!1303070 (=> (not res!865497) (not e!743261))))

(assert (=> b!1303070 (= res!865497 (= (getValueByKey!704 (toList!10146 lt!583034) (_1!11313 (tuple2!22605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!755 (_2!11313 (tuple2!22605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(declare-fun b!1303071 () Bool)

(declare-fun contains!8282 (List!29731 tuple2!22604) Bool)

(assert (=> b!1303071 (= e!743261 (contains!8282 (toList!10146 lt!583034) (tuple2!22605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(assert (= (and d!141603 res!865496) b!1303070))

(assert (= (and b!1303070 res!865497) b!1303071))

(declare-fun m!1193965 () Bool)

(assert (=> d!141603 m!1193965))

(declare-fun m!1193967 () Bool)

(assert (=> d!141603 m!1193967))

(declare-fun m!1193969 () Bool)

(assert (=> d!141603 m!1193969))

(declare-fun m!1193971 () Bool)

(assert (=> d!141603 m!1193971))

(declare-fun m!1193973 () Bool)

(assert (=> b!1303070 m!1193973))

(declare-fun m!1193975 () Bool)

(assert (=> b!1303071 m!1193975))

(assert (=> b!1303023 d!141603))

(declare-fun d!141605 () Bool)

(declare-fun e!743267 () Bool)

(assert (=> d!141605 e!743267))

(declare-fun res!865500 () Bool)

(assert (=> d!141605 (=> res!865500 e!743267)))

(declare-fun lt!583049 () Bool)

(assert (=> d!141605 (= res!865500 (not lt!583049))))

(declare-fun lt!583047 () Bool)

(assert (=> d!141605 (= lt!583049 lt!583047)))

(declare-fun lt!583046 () Unit!43140)

(declare-fun e!743266 () Unit!43140)

(assert (=> d!141605 (= lt!583046 e!743266)))

(declare-fun c!125064 () Bool)

(assert (=> d!141605 (= c!125064 lt!583047)))

(declare-fun containsKey!726 (List!29731 (_ BitVec 64)) Bool)

(assert (=> d!141605 (= lt!583047 (containsKey!726 (toList!10146 (+!4472 lt!583002 lt!583004)) k0!1205))))

(assert (=> d!141605 (= (contains!8280 (+!4472 lt!583002 lt!583004) k0!1205) lt!583049)))

(declare-fun b!1303078 () Bool)

(declare-fun lt!583048 () Unit!43140)

(assert (=> b!1303078 (= e!743266 lt!583048)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!472 (List!29731 (_ BitVec 64)) Unit!43140)

(assert (=> b!1303078 (= lt!583048 (lemmaContainsKeyImpliesGetValueByKeyDefined!472 (toList!10146 (+!4472 lt!583002 lt!583004)) k0!1205))))

(declare-fun isDefined!511 (Option!756) Bool)

(assert (=> b!1303078 (isDefined!511 (getValueByKey!704 (toList!10146 (+!4472 lt!583002 lt!583004)) k0!1205))))

(declare-fun b!1303079 () Bool)

(declare-fun Unit!43144 () Unit!43140)

(assert (=> b!1303079 (= e!743266 Unit!43144)))

(declare-fun b!1303080 () Bool)

(assert (=> b!1303080 (= e!743267 (isDefined!511 (getValueByKey!704 (toList!10146 (+!4472 lt!583002 lt!583004)) k0!1205)))))

(assert (= (and d!141605 c!125064) b!1303078))

(assert (= (and d!141605 (not c!125064)) b!1303079))

(assert (= (and d!141605 (not res!865500)) b!1303080))

(declare-fun m!1193977 () Bool)

(assert (=> d!141605 m!1193977))

(declare-fun m!1193979 () Bool)

(assert (=> b!1303078 m!1193979))

(declare-fun m!1193981 () Bool)

(assert (=> b!1303078 m!1193981))

(assert (=> b!1303078 m!1193981))

(declare-fun m!1193983 () Bool)

(assert (=> b!1303078 m!1193983))

(assert (=> b!1303080 m!1193981))

(assert (=> b!1303080 m!1193981))

(assert (=> b!1303080 m!1193983))

(assert (=> b!1303023 d!141605))

(declare-fun b!1303105 () Bool)

(declare-fun e!743284 () ListLongMap!20261)

(declare-fun call!64179 () ListLongMap!20261)

(assert (=> b!1303105 (= e!743284 call!64179)))

(declare-fun d!141607 () Bool)

(declare-fun e!743288 () Bool)

(assert (=> d!141607 e!743288))

(declare-fun res!865509 () Bool)

(assert (=> d!141607 (=> (not res!865509) (not e!743288))))

(declare-fun lt!583064 () ListLongMap!20261)

(assert (=> d!141607 (= res!865509 (not (contains!8280 lt!583064 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!743286 () ListLongMap!20261)

(assert (=> d!141607 (= lt!583064 e!743286)))

(declare-fun c!125074 () Bool)

(assert (=> d!141607 (= c!125074 (bvsge from!2144 (size!42436 _keys!1741)))))

(assert (=> d!141607 (validMask!0 mask!2175)))

(assert (=> d!141607 (= (getCurrentListMapNoExtraKeys!6105 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!583064)))

(declare-fun b!1303106 () Bool)

(assert (=> b!1303106 (= e!743286 e!743284)))

(declare-fun c!125076 () Bool)

(assert (=> b!1303106 (= c!125076 (validKeyInArray!0 (select (arr!41886 _keys!1741) from!2144)))))

(declare-fun b!1303107 () Bool)

(declare-fun e!743283 () Bool)

(declare-fun e!743285 () Bool)

(assert (=> b!1303107 (= e!743283 e!743285)))

(assert (=> b!1303107 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42436 _keys!1741)))))

(declare-fun res!865511 () Bool)

(assert (=> b!1303107 (= res!865511 (contains!8280 lt!583064 (select (arr!41886 _keys!1741) from!2144)))))

(assert (=> b!1303107 (=> (not res!865511) (not e!743285))))

(declare-fun b!1303108 () Bool)

(declare-fun e!743287 () Bool)

(assert (=> b!1303108 (= e!743287 (validKeyInArray!0 (select (arr!41886 _keys!1741) from!2144)))))

(assert (=> b!1303108 (bvsge from!2144 #b00000000000000000000000000000000)))

(declare-fun b!1303109 () Bool)

(declare-fun res!865510 () Bool)

(assert (=> b!1303109 (=> (not res!865510) (not e!743288))))

(assert (=> b!1303109 (= res!865510 (not (contains!8280 lt!583064 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1303110 () Bool)

(assert (=> b!1303110 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42436 _keys!1741)))))

(assert (=> b!1303110 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42437 _values!1445)))))

(declare-fun apply!1021 (ListLongMap!20261 (_ BitVec 64)) V!51619)

(declare-fun get!21157 (ValueCell!16545 V!51619) V!51619)

(declare-fun dynLambda!3428 (Int (_ BitVec 64)) V!51619)

(assert (=> b!1303110 (= e!743285 (= (apply!1021 lt!583064 (select (arr!41886 _keys!1741) from!2144)) (get!21157 (select (arr!41887 _values!1445) from!2144) (dynLambda!3428 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1303111 () Bool)

(declare-fun e!743282 () Bool)

(declare-fun isEmpty!1061 (ListLongMap!20261) Bool)

(assert (=> b!1303111 (= e!743282 (isEmpty!1061 lt!583064))))

(declare-fun b!1303112 () Bool)

(assert (=> b!1303112 (= e!743286 (ListLongMap!20262 Nil!29728))))

(declare-fun b!1303113 () Bool)

(assert (=> b!1303113 (= e!743288 e!743283)))

(declare-fun c!125075 () Bool)

(assert (=> b!1303113 (= c!125075 e!743287)))

(declare-fun res!865512 () Bool)

(assert (=> b!1303113 (=> (not res!865512) (not e!743287))))

(assert (=> b!1303113 (= res!865512 (bvslt from!2144 (size!42436 _keys!1741)))))

(declare-fun b!1303114 () Bool)

(assert (=> b!1303114 (= e!743283 e!743282)))

(declare-fun c!125073 () Bool)

(assert (=> b!1303114 (= c!125073 (bvslt from!2144 (size!42436 _keys!1741)))))

(declare-fun b!1303115 () Bool)

(declare-fun lt!583067 () Unit!43140)

(declare-fun lt!583069 () Unit!43140)

(assert (=> b!1303115 (= lt!583067 lt!583069)))

(declare-fun lt!583066 () (_ BitVec 64))

(declare-fun lt!583065 () (_ BitVec 64))

(declare-fun lt!583070 () V!51619)

(declare-fun lt!583068 () ListLongMap!20261)

(assert (=> b!1303115 (not (contains!8280 (+!4472 lt!583068 (tuple2!22605 lt!583066 lt!583070)) lt!583065))))

(assert (=> b!1303115 (= lt!583069 (addStillNotContains!469 lt!583068 lt!583066 lt!583070 lt!583065))))

(assert (=> b!1303115 (= lt!583065 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1303115 (= lt!583070 (get!21157 (select (arr!41887 _values!1445) from!2144) (dynLambda!3428 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1303115 (= lt!583066 (select (arr!41886 _keys!1741) from!2144))))

(assert (=> b!1303115 (= lt!583068 call!64179)))

(assert (=> b!1303115 (= e!743284 (+!4472 call!64179 (tuple2!22605 (select (arr!41886 _keys!1741) from!2144) (get!21157 (select (arr!41887 _values!1445) from!2144) (dynLambda!3428 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!64176 () Bool)

(assert (=> bm!64176 (= call!64179 (getCurrentListMapNoExtraKeys!6105 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun b!1303116 () Bool)

(assert (=> b!1303116 (= e!743282 (= lt!583064 (getCurrentListMapNoExtraKeys!6105 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448)))))

(assert (= (and d!141607 c!125074) b!1303112))

(assert (= (and d!141607 (not c!125074)) b!1303106))

(assert (= (and b!1303106 c!125076) b!1303115))

(assert (= (and b!1303106 (not c!125076)) b!1303105))

(assert (= (or b!1303115 b!1303105) bm!64176))

(assert (= (and d!141607 res!865509) b!1303109))

(assert (= (and b!1303109 res!865510) b!1303113))

(assert (= (and b!1303113 res!865512) b!1303108))

(assert (= (and b!1303113 c!125075) b!1303107))

(assert (= (and b!1303113 (not c!125075)) b!1303114))

(assert (= (and b!1303107 res!865511) b!1303110))

(assert (= (and b!1303114 c!125073) b!1303116))

(assert (= (and b!1303114 (not c!125073)) b!1303111))

(declare-fun b_lambda!23263 () Bool)

(assert (=> (not b_lambda!23263) (not b!1303110)))

(declare-fun t!43328 () Bool)

(declare-fun tb!11397 () Bool)

(assert (=> (and start!110024 (= defaultEntry!1448 defaultEntry!1448) t!43328) tb!11397))

(declare-fun result!23813 () Bool)

(assert (=> tb!11397 (= result!23813 tp_is_empty!34887)))

(assert (=> b!1303110 t!43328))

(declare-fun b_and!47409 () Bool)

(assert (= b_and!47405 (and (=> t!43328 result!23813) b_and!47409)))

(declare-fun b_lambda!23265 () Bool)

(assert (=> (not b_lambda!23265) (not b!1303115)))

(assert (=> b!1303115 t!43328))

(declare-fun b_and!47411 () Bool)

(assert (= b_and!47409 (and (=> t!43328 result!23813) b_and!47411)))

(declare-fun m!1193985 () Bool)

(assert (=> b!1303111 m!1193985))

(declare-fun m!1193987 () Bool)

(assert (=> b!1303116 m!1193987))

(assert (=> b!1303107 m!1193897))

(assert (=> b!1303107 m!1193897))

(declare-fun m!1193989 () Bool)

(assert (=> b!1303107 m!1193989))

(declare-fun m!1193991 () Bool)

(assert (=> b!1303109 m!1193991))

(assert (=> b!1303106 m!1193897))

(assert (=> b!1303106 m!1193897))

(assert (=> b!1303106 m!1193899))

(assert (=> bm!64176 m!1193987))

(assert (=> b!1303108 m!1193897))

(assert (=> b!1303108 m!1193897))

(assert (=> b!1303108 m!1193899))

(declare-fun m!1193993 () Bool)

(assert (=> d!141607 m!1193993))

(assert (=> d!141607 m!1193883))

(declare-fun m!1193995 () Bool)

(assert (=> b!1303115 m!1193995))

(declare-fun m!1193997 () Bool)

(assert (=> b!1303115 m!1193997))

(declare-fun m!1193999 () Bool)

(assert (=> b!1303115 m!1193999))

(assert (=> b!1303115 m!1193999))

(assert (=> b!1303115 m!1193995))

(declare-fun m!1194001 () Bool)

(assert (=> b!1303115 m!1194001))

(declare-fun m!1194003 () Bool)

(assert (=> b!1303115 m!1194003))

(assert (=> b!1303115 m!1194003))

(declare-fun m!1194005 () Bool)

(assert (=> b!1303115 m!1194005))

(declare-fun m!1194007 () Bool)

(assert (=> b!1303115 m!1194007))

(assert (=> b!1303115 m!1193897))

(assert (=> b!1303110 m!1193897))

(assert (=> b!1303110 m!1193995))

(assert (=> b!1303110 m!1193999))

(assert (=> b!1303110 m!1193897))

(declare-fun m!1194009 () Bool)

(assert (=> b!1303110 m!1194009))

(assert (=> b!1303110 m!1193999))

(assert (=> b!1303110 m!1193995))

(assert (=> b!1303110 m!1194001))

(assert (=> b!1303023 d!141607))

(declare-fun d!141609 () Bool)

(declare-fun e!743289 () Bool)

(assert (=> d!141609 e!743289))

(declare-fun res!865513 () Bool)

(assert (=> d!141609 (=> (not res!865513) (not e!743289))))

(declare-fun lt!583071 () ListLongMap!20261)

(assert (=> d!141609 (= res!865513 (contains!8280 lt!583071 (_1!11313 lt!583004)))))

(declare-fun lt!583073 () List!29731)

(assert (=> d!141609 (= lt!583071 (ListLongMap!20262 lt!583073))))

(declare-fun lt!583072 () Unit!43140)

(declare-fun lt!583074 () Unit!43140)

(assert (=> d!141609 (= lt!583072 lt!583074)))

(assert (=> d!141609 (= (getValueByKey!704 lt!583073 (_1!11313 lt!583004)) (Some!755 (_2!11313 lt!583004)))))

(assert (=> d!141609 (= lt!583074 (lemmaContainsTupThenGetReturnValue!350 lt!583073 (_1!11313 lt!583004) (_2!11313 lt!583004)))))

(assert (=> d!141609 (= lt!583073 (insertStrictlySorted!479 (toList!10146 lt!583002) (_1!11313 lt!583004) (_2!11313 lt!583004)))))

(assert (=> d!141609 (= (+!4472 lt!583002 lt!583004) lt!583071)))

(declare-fun b!1303119 () Bool)

(declare-fun res!865514 () Bool)

(assert (=> b!1303119 (=> (not res!865514) (not e!743289))))

(assert (=> b!1303119 (= res!865514 (= (getValueByKey!704 (toList!10146 lt!583071) (_1!11313 lt!583004)) (Some!755 (_2!11313 lt!583004))))))

(declare-fun b!1303120 () Bool)

(assert (=> b!1303120 (= e!743289 (contains!8282 (toList!10146 lt!583071) lt!583004))))

(assert (= (and d!141609 res!865513) b!1303119))

(assert (= (and b!1303119 res!865514) b!1303120))

(declare-fun m!1194011 () Bool)

(assert (=> d!141609 m!1194011))

(declare-fun m!1194013 () Bool)

(assert (=> d!141609 m!1194013))

(declare-fun m!1194015 () Bool)

(assert (=> d!141609 m!1194015))

(declare-fun m!1194017 () Bool)

(assert (=> d!141609 m!1194017))

(declare-fun m!1194019 () Bool)

(assert (=> b!1303119 m!1194019))

(declare-fun m!1194021 () Bool)

(assert (=> b!1303120 m!1194021))

(assert (=> b!1303023 d!141609))

(declare-fun d!141611 () Bool)

(declare-fun e!743290 () Bool)

(assert (=> d!141611 e!743290))

(declare-fun res!865515 () Bool)

(assert (=> d!141611 (=> (not res!865515) (not e!743290))))

(declare-fun lt!583075 () ListLongMap!20261)

(assert (=> d!141611 (= res!865515 (contains!8280 lt!583075 (_1!11313 lt!583004)))))

(declare-fun lt!583077 () List!29731)

(assert (=> d!141611 (= lt!583075 (ListLongMap!20262 lt!583077))))

(declare-fun lt!583076 () Unit!43140)

(declare-fun lt!583078 () Unit!43140)

(assert (=> d!141611 (= lt!583076 lt!583078)))

(assert (=> d!141611 (= (getValueByKey!704 lt!583077 (_1!11313 lt!583004)) (Some!755 (_2!11313 lt!583004)))))

(assert (=> d!141611 (= lt!583078 (lemmaContainsTupThenGetReturnValue!350 lt!583077 (_1!11313 lt!583004) (_2!11313 lt!583004)))))

(assert (=> d!141611 (= lt!583077 (insertStrictlySorted!479 (toList!10146 lt!583007) (_1!11313 lt!583004) (_2!11313 lt!583004)))))

(assert (=> d!141611 (= (+!4472 lt!583007 lt!583004) lt!583075)))

(declare-fun b!1303121 () Bool)

(declare-fun res!865516 () Bool)

(assert (=> b!1303121 (=> (not res!865516) (not e!743290))))

(assert (=> b!1303121 (= res!865516 (= (getValueByKey!704 (toList!10146 lt!583075) (_1!11313 lt!583004)) (Some!755 (_2!11313 lt!583004))))))

(declare-fun b!1303122 () Bool)

(assert (=> b!1303122 (= e!743290 (contains!8282 (toList!10146 lt!583075) lt!583004))))

(assert (= (and d!141611 res!865515) b!1303121))

(assert (= (and b!1303121 res!865516) b!1303122))

(declare-fun m!1194023 () Bool)

(assert (=> d!141611 m!1194023))

(declare-fun m!1194025 () Bool)

(assert (=> d!141611 m!1194025))

(declare-fun m!1194027 () Bool)

(assert (=> d!141611 m!1194027))

(declare-fun m!1194029 () Bool)

(assert (=> d!141611 m!1194029))

(declare-fun m!1194031 () Bool)

(assert (=> b!1303121 m!1194031))

(declare-fun m!1194033 () Bool)

(assert (=> b!1303122 m!1194033))

(assert (=> b!1303023 d!141611))

(declare-fun d!141613 () Bool)

(assert (=> d!141613 (not (contains!8280 (+!4472 lt!583002 (tuple2!22605 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!583081 () Unit!43140)

(declare-fun choose!1919 (ListLongMap!20261 (_ BitVec 64) V!51619 (_ BitVec 64)) Unit!43140)

(assert (=> d!141613 (= lt!583081 (choose!1919 lt!583002 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun e!743293 () Bool)

(assert (=> d!141613 e!743293))

(declare-fun res!865519 () Bool)

(assert (=> d!141613 (=> (not res!865519) (not e!743293))))

(assert (=> d!141613 (= res!865519 (not (contains!8280 lt!583002 k0!1205)))))

(assert (=> d!141613 (= (addStillNotContains!469 lt!583002 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205) lt!583081)))

(declare-fun b!1303126 () Bool)

(assert (=> b!1303126 (= e!743293 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!1205)))))

(assert (= (and d!141613 res!865519) b!1303126))

(declare-fun m!1194035 () Bool)

(assert (=> d!141613 m!1194035))

(assert (=> d!141613 m!1194035))

(declare-fun m!1194037 () Bool)

(assert (=> d!141613 m!1194037))

(declare-fun m!1194039 () Bool)

(assert (=> d!141613 m!1194039))

(declare-fun m!1194041 () Bool)

(assert (=> d!141613 m!1194041))

(assert (=> b!1303023 d!141613))

(declare-fun d!141615 () Bool)

(assert (=> d!141615 (not (contains!8280 (+!4472 lt!583002 (tuple2!22605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!583082 () Unit!43140)

(assert (=> d!141615 (= lt!583082 (choose!1919 lt!583002 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun e!743294 () Bool)

(assert (=> d!141615 e!743294))

(declare-fun res!865520 () Bool)

(assert (=> d!141615 (=> (not res!865520) (not e!743294))))

(assert (=> d!141615 (= res!865520 (not (contains!8280 lt!583002 k0!1205)))))

(assert (=> d!141615 (= (addStillNotContains!469 lt!583002 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205) lt!583082)))

(declare-fun b!1303127 () Bool)

(assert (=> b!1303127 (= e!743294 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!1205)))))

(assert (= (and d!141615 res!865520) b!1303127))

(assert (=> d!141615 m!1193909))

(assert (=> d!141615 m!1193909))

(declare-fun m!1194043 () Bool)

(assert (=> d!141615 m!1194043))

(declare-fun m!1194045 () Bool)

(assert (=> d!141615 m!1194045))

(assert (=> d!141615 m!1194041))

(assert (=> b!1303023 d!141615))

(declare-fun d!141617 () Bool)

(declare-fun e!743296 () Bool)

(assert (=> d!141617 e!743296))

(declare-fun res!865521 () Bool)

(assert (=> d!141617 (=> res!865521 e!743296)))

(declare-fun lt!583086 () Bool)

(assert (=> d!141617 (= res!865521 (not lt!583086))))

(declare-fun lt!583084 () Bool)

(assert (=> d!141617 (= lt!583086 lt!583084)))

(declare-fun lt!583083 () Unit!43140)

(declare-fun e!743295 () Unit!43140)

(assert (=> d!141617 (= lt!583083 e!743295)))

(declare-fun c!125077 () Bool)

(assert (=> d!141617 (= c!125077 lt!583084)))

(assert (=> d!141617 (= lt!583084 (containsKey!726 (toList!10146 lt!583007) k0!1205))))

(assert (=> d!141617 (= (contains!8280 lt!583007 k0!1205) lt!583086)))

(declare-fun b!1303128 () Bool)

(declare-fun lt!583085 () Unit!43140)

(assert (=> b!1303128 (= e!743295 lt!583085)))

(assert (=> b!1303128 (= lt!583085 (lemmaContainsKeyImpliesGetValueByKeyDefined!472 (toList!10146 lt!583007) k0!1205))))

(assert (=> b!1303128 (isDefined!511 (getValueByKey!704 (toList!10146 lt!583007) k0!1205))))

(declare-fun b!1303129 () Bool)

(declare-fun Unit!43145 () Unit!43140)

(assert (=> b!1303129 (= e!743295 Unit!43145)))

(declare-fun b!1303130 () Bool)

(assert (=> b!1303130 (= e!743296 (isDefined!511 (getValueByKey!704 (toList!10146 lt!583007) k0!1205)))))

(assert (= (and d!141617 c!125077) b!1303128))

(assert (= (and d!141617 (not c!125077)) b!1303129))

(assert (= (and d!141617 (not res!865521)) b!1303130))

(declare-fun m!1194047 () Bool)

(assert (=> d!141617 m!1194047))

(declare-fun m!1194049 () Bool)

(assert (=> b!1303128 m!1194049))

(declare-fun m!1194051 () Bool)

(assert (=> b!1303128 m!1194051))

(assert (=> b!1303128 m!1194051))

(declare-fun m!1194053 () Bool)

(assert (=> b!1303128 m!1194053))

(assert (=> b!1303130 m!1194051))

(assert (=> b!1303130 m!1194051))

(assert (=> b!1303130 m!1194053))

(assert (=> b!1303023 d!141617))

(declare-fun d!141619 () Bool)

(declare-fun e!743298 () Bool)

(assert (=> d!141619 e!743298))

(declare-fun res!865522 () Bool)

(assert (=> d!141619 (=> res!865522 e!743298)))

(declare-fun lt!583090 () Bool)

(assert (=> d!141619 (= res!865522 (not lt!583090))))

(declare-fun lt!583088 () Bool)

(assert (=> d!141619 (= lt!583090 lt!583088)))

(declare-fun lt!583087 () Unit!43140)

(declare-fun e!743297 () Unit!43140)

(assert (=> d!141619 (= lt!583087 e!743297)))

(declare-fun c!125078 () Bool)

(assert (=> d!141619 (= c!125078 lt!583088)))

(assert (=> d!141619 (= lt!583088 (containsKey!726 (toList!10146 (+!4472 lt!583007 lt!583004)) k0!1205))))

(assert (=> d!141619 (= (contains!8280 (+!4472 lt!583007 lt!583004) k0!1205) lt!583090)))

(declare-fun b!1303131 () Bool)

(declare-fun lt!583089 () Unit!43140)

(assert (=> b!1303131 (= e!743297 lt!583089)))

(assert (=> b!1303131 (= lt!583089 (lemmaContainsKeyImpliesGetValueByKeyDefined!472 (toList!10146 (+!4472 lt!583007 lt!583004)) k0!1205))))

(assert (=> b!1303131 (isDefined!511 (getValueByKey!704 (toList!10146 (+!4472 lt!583007 lt!583004)) k0!1205))))

(declare-fun b!1303132 () Bool)

(declare-fun Unit!43146 () Unit!43140)

(assert (=> b!1303132 (= e!743297 Unit!43146)))

(declare-fun b!1303133 () Bool)

(assert (=> b!1303133 (= e!743298 (isDefined!511 (getValueByKey!704 (toList!10146 (+!4472 lt!583007 lt!583004)) k0!1205)))))

(assert (= (and d!141619 c!125078) b!1303131))

(assert (= (and d!141619 (not c!125078)) b!1303132))

(assert (= (and d!141619 (not res!865522)) b!1303133))

(declare-fun m!1194055 () Bool)

(assert (=> d!141619 m!1194055))

(declare-fun m!1194057 () Bool)

(assert (=> b!1303131 m!1194057))

(declare-fun m!1194059 () Bool)

(assert (=> b!1303131 m!1194059))

(assert (=> b!1303131 m!1194059))

(declare-fun m!1194061 () Bool)

(assert (=> b!1303131 m!1194061))

(assert (=> b!1303133 m!1194059))

(assert (=> b!1303133 m!1194059))

(assert (=> b!1303133 m!1194061))

(assert (=> b!1303023 d!141619))

(declare-fun bm!64179 () Bool)

(declare-fun call!64182 () Bool)

(declare-fun c!125081 () Bool)

(assert (=> bm!64179 (= call!64182 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125081 (Cons!29728 (select (arr!41886 _keys!1741) #b00000000000000000000000000000000) Nil!29729) Nil!29729)))))

(declare-fun b!1303144 () Bool)

(declare-fun e!743308 () Bool)

(declare-fun contains!8283 (List!29732 (_ BitVec 64)) Bool)

(assert (=> b!1303144 (= e!743308 (contains!8283 Nil!29729 (select (arr!41886 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1303146 () Bool)

(declare-fun e!743310 () Bool)

(assert (=> b!1303146 (= e!743310 call!64182)))

(declare-fun b!1303147 () Bool)

(assert (=> b!1303147 (= e!743310 call!64182)))

(declare-fun b!1303148 () Bool)

(declare-fun e!743309 () Bool)

(assert (=> b!1303148 (= e!743309 e!743310)))

(assert (=> b!1303148 (= c!125081 (validKeyInArray!0 (select (arr!41886 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun d!141621 () Bool)

(declare-fun res!865531 () Bool)

(declare-fun e!743307 () Bool)

(assert (=> d!141621 (=> res!865531 e!743307)))

(assert (=> d!141621 (= res!865531 (bvsge #b00000000000000000000000000000000 (size!42436 _keys!1741)))))

(assert (=> d!141621 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29729) e!743307)))

(declare-fun b!1303145 () Bool)

(assert (=> b!1303145 (= e!743307 e!743309)))

(declare-fun res!865530 () Bool)

(assert (=> b!1303145 (=> (not res!865530) (not e!743309))))

(assert (=> b!1303145 (= res!865530 (not e!743308))))

(declare-fun res!865529 () Bool)

(assert (=> b!1303145 (=> (not res!865529) (not e!743308))))

(assert (=> b!1303145 (= res!865529 (validKeyInArray!0 (select (arr!41886 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!141621 (not res!865531)) b!1303145))

(assert (= (and b!1303145 res!865529) b!1303144))

(assert (= (and b!1303145 res!865530) b!1303148))

(assert (= (and b!1303148 c!125081) b!1303147))

(assert (= (and b!1303148 (not c!125081)) b!1303146))

(assert (= (or b!1303147 b!1303146) bm!64179))

(declare-fun m!1194063 () Bool)

(assert (=> bm!64179 m!1194063))

(declare-fun m!1194065 () Bool)

(assert (=> bm!64179 m!1194065))

(assert (=> b!1303144 m!1194063))

(assert (=> b!1303144 m!1194063))

(declare-fun m!1194067 () Bool)

(assert (=> b!1303144 m!1194067))

(assert (=> b!1303148 m!1194063))

(assert (=> b!1303148 m!1194063))

(declare-fun m!1194069 () Bool)

(assert (=> b!1303148 m!1194069))

(assert (=> b!1303145 m!1194063))

(assert (=> b!1303145 m!1194063))

(assert (=> b!1303145 m!1194069))

(assert (=> b!1303024 d!141621))

(declare-fun d!141623 () Bool)

(declare-fun e!743312 () Bool)

(assert (=> d!141623 e!743312))

(declare-fun res!865532 () Bool)

(assert (=> d!141623 (=> res!865532 e!743312)))

(declare-fun lt!583094 () Bool)

(assert (=> d!141623 (= res!865532 (not lt!583094))))

(declare-fun lt!583092 () Bool)

(assert (=> d!141623 (= lt!583094 lt!583092)))

(declare-fun lt!583091 () Unit!43140)

(declare-fun e!743311 () Unit!43140)

(assert (=> d!141623 (= lt!583091 e!743311)))

(declare-fun c!125082 () Bool)

(assert (=> d!141623 (= c!125082 lt!583092)))

(assert (=> d!141623 (= lt!583092 (containsKey!726 (toList!10146 (getCurrentListMap!5170 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!141623 (= (contains!8280 (getCurrentListMap!5170 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!583094)))

(declare-fun b!1303149 () Bool)

(declare-fun lt!583093 () Unit!43140)

(assert (=> b!1303149 (= e!743311 lt!583093)))

(assert (=> b!1303149 (= lt!583093 (lemmaContainsKeyImpliesGetValueByKeyDefined!472 (toList!10146 (getCurrentListMap!5170 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> b!1303149 (isDefined!511 (getValueByKey!704 (toList!10146 (getCurrentListMap!5170 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1303150 () Bool)

(declare-fun Unit!43147 () Unit!43140)

(assert (=> b!1303150 (= e!743311 Unit!43147)))

(declare-fun b!1303151 () Bool)

(assert (=> b!1303151 (= e!743312 (isDefined!511 (getValueByKey!704 (toList!10146 (getCurrentListMap!5170 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141623 c!125082) b!1303149))

(assert (= (and d!141623 (not c!125082)) b!1303150))

(assert (= (and d!141623 (not res!865532)) b!1303151))

(declare-fun m!1194071 () Bool)

(assert (=> d!141623 m!1194071))

(declare-fun m!1194073 () Bool)

(assert (=> b!1303149 m!1194073))

(declare-fun m!1194075 () Bool)

(assert (=> b!1303149 m!1194075))

(assert (=> b!1303149 m!1194075))

(declare-fun m!1194077 () Bool)

(assert (=> b!1303149 m!1194077))

(assert (=> b!1303151 m!1194075))

(assert (=> b!1303151 m!1194075))

(assert (=> b!1303151 m!1194077))

(assert (=> b!1303029 d!141623))

(declare-fun b!1303194 () Bool)

(declare-fun e!743348 () Bool)

(declare-fun lt!583145 () ListLongMap!20261)

(assert (=> b!1303194 (= e!743348 (= (apply!1021 lt!583145 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun b!1303195 () Bool)

(declare-fun e!743349 () Bool)

(declare-fun call!64199 () Bool)

(assert (=> b!1303195 (= e!743349 (not call!64199))))

(declare-fun call!64202 () ListLongMap!20261)

(declare-fun bm!64194 () Bool)

(assert (=> bm!64194 (= call!64202 (getCurrentListMapNoExtraKeys!6105 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun c!125098 () Bool)

(declare-fun call!64201 () ListLongMap!20261)

(declare-fun call!64200 () ListLongMap!20261)

(declare-fun bm!64195 () Bool)

(declare-fun c!125096 () Bool)

(declare-fun call!64198 () ListLongMap!20261)

(assert (=> bm!64195 (= call!64200 (+!4472 (ite c!125098 call!64202 (ite c!125096 call!64201 call!64198)) (ite (or c!125098 c!125096) (tuple2!22605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22605 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1303196 () Bool)

(declare-fun e!743340 () Unit!43140)

(declare-fun Unit!43148 () Unit!43140)

(assert (=> b!1303196 (= e!743340 Unit!43148)))

(declare-fun b!1303197 () Bool)

(declare-fun e!743342 () Bool)

(assert (=> b!1303197 (= e!743342 e!743348)))

(declare-fun res!865557 () Bool)

(declare-fun call!64203 () Bool)

(assert (=> b!1303197 (= res!865557 call!64203)))

(assert (=> b!1303197 (=> (not res!865557) (not e!743348))))

(declare-fun bm!64196 () Bool)

(assert (=> bm!64196 (= call!64201 call!64202)))

(declare-fun e!743346 () Bool)

(declare-fun b!1303198 () Bool)

(assert (=> b!1303198 (= e!743346 (= (apply!1021 lt!583145 (select (arr!41886 _keys!1741) from!2144)) (get!21157 (select (arr!41887 _values!1445) from!2144) (dynLambda!3428 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1303198 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42437 _values!1445)))))

(assert (=> b!1303198 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42436 _keys!1741)))))

(declare-fun b!1303199 () Bool)

(declare-fun e!743339 () ListLongMap!20261)

(assert (=> b!1303199 (= e!743339 (+!4472 call!64200 (tuple2!22605 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1303200 () Bool)

(declare-fun e!743344 () Bool)

(assert (=> b!1303200 (= e!743344 (validKeyInArray!0 (select (arr!41886 _keys!1741) from!2144)))))

(declare-fun bm!64197 () Bool)

(declare-fun call!64197 () ListLongMap!20261)

(assert (=> bm!64197 (= call!64197 call!64200)))

(declare-fun bm!64198 () Bool)

(assert (=> bm!64198 (= call!64199 (contains!8280 lt!583145 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1303202 () Bool)

(declare-fun e!743347 () ListLongMap!20261)

(assert (=> b!1303202 (= e!743347 call!64197)))

(declare-fun bm!64199 () Bool)

(assert (=> bm!64199 (= call!64203 (contains!8280 lt!583145 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1303203 () Bool)

(declare-fun e!743351 () Bool)

(assert (=> b!1303203 (= e!743351 (validKeyInArray!0 (select (arr!41886 _keys!1741) from!2144)))))

(declare-fun b!1303204 () Bool)

(declare-fun res!865559 () Bool)

(declare-fun e!743341 () Bool)

(assert (=> b!1303204 (=> (not res!865559) (not e!743341))))

(declare-fun e!743343 () Bool)

(assert (=> b!1303204 (= res!865559 e!743343)))

(declare-fun res!865551 () Bool)

(assert (=> b!1303204 (=> res!865551 e!743343)))

(assert (=> b!1303204 (= res!865551 (not e!743351))))

(declare-fun res!865554 () Bool)

(assert (=> b!1303204 (=> (not res!865554) (not e!743351))))

(assert (=> b!1303204 (= res!865554 (bvslt from!2144 (size!42436 _keys!1741)))))

(declare-fun b!1303205 () Bool)

(assert (=> b!1303205 (= e!743341 e!743349)))

(declare-fun c!125099 () Bool)

(assert (=> b!1303205 (= c!125099 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1303206 () Bool)

(declare-fun e!743345 () Bool)

(assert (=> b!1303206 (= e!743345 (= (apply!1021 lt!583145 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun bm!64200 () Bool)

(assert (=> bm!64200 (= call!64198 call!64201)))

(declare-fun b!1303207 () Bool)

(assert (=> b!1303207 (= e!743339 e!743347)))

(assert (=> b!1303207 (= c!125096 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1303208 () Bool)

(assert (=> b!1303208 (= e!743343 e!743346)))

(declare-fun res!865553 () Bool)

(assert (=> b!1303208 (=> (not res!865553) (not e!743346))))

(assert (=> b!1303208 (= res!865553 (contains!8280 lt!583145 (select (arr!41886 _keys!1741) from!2144)))))

(assert (=> b!1303208 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42436 _keys!1741)))))

(declare-fun b!1303209 () Bool)

(assert (=> b!1303209 (= e!743342 (not call!64203))))

(declare-fun b!1303210 () Bool)

(declare-fun c!125095 () Bool)

(assert (=> b!1303210 (= c!125095 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!743350 () ListLongMap!20261)

(assert (=> b!1303210 (= e!743347 e!743350)))

(declare-fun b!1303211 () Bool)

(declare-fun res!865552 () Bool)

(assert (=> b!1303211 (=> (not res!865552) (not e!743341))))

(assert (=> b!1303211 (= res!865552 e!743342)))

(declare-fun c!125100 () Bool)

(assert (=> b!1303211 (= c!125100 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1303212 () Bool)

(assert (=> b!1303212 (= e!743350 call!64198)))

(declare-fun b!1303213 () Bool)

(assert (=> b!1303213 (= e!743350 call!64197)))

(declare-fun b!1303214 () Bool)

(declare-fun lt!583149 () Unit!43140)

(assert (=> b!1303214 (= e!743340 lt!583149)))

(declare-fun lt!583144 () ListLongMap!20261)

(assert (=> b!1303214 (= lt!583144 (getCurrentListMapNoExtraKeys!6105 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583157 () (_ BitVec 64))

(assert (=> b!1303214 (= lt!583157 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583140 () (_ BitVec 64))

(assert (=> b!1303214 (= lt!583140 (select (arr!41886 _keys!1741) from!2144))))

(declare-fun lt!583158 () Unit!43140)

(declare-fun addStillContains!1109 (ListLongMap!20261 (_ BitVec 64) V!51619 (_ BitVec 64)) Unit!43140)

(assert (=> b!1303214 (= lt!583158 (addStillContains!1109 lt!583144 lt!583157 zeroValue!1387 lt!583140))))

(assert (=> b!1303214 (contains!8280 (+!4472 lt!583144 (tuple2!22605 lt!583157 zeroValue!1387)) lt!583140)))

(declare-fun lt!583147 () Unit!43140)

(assert (=> b!1303214 (= lt!583147 lt!583158)))

(declare-fun lt!583152 () ListLongMap!20261)

(assert (=> b!1303214 (= lt!583152 (getCurrentListMapNoExtraKeys!6105 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583142 () (_ BitVec 64))

(assert (=> b!1303214 (= lt!583142 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583150 () (_ BitVec 64))

(assert (=> b!1303214 (= lt!583150 (select (arr!41886 _keys!1741) from!2144))))

(declare-fun lt!583159 () Unit!43140)

(declare-fun addApplyDifferent!563 (ListLongMap!20261 (_ BitVec 64) V!51619 (_ BitVec 64)) Unit!43140)

(assert (=> b!1303214 (= lt!583159 (addApplyDifferent!563 lt!583152 lt!583142 minValue!1387 lt!583150))))

(assert (=> b!1303214 (= (apply!1021 (+!4472 lt!583152 (tuple2!22605 lt!583142 minValue!1387)) lt!583150) (apply!1021 lt!583152 lt!583150))))

(declare-fun lt!583160 () Unit!43140)

(assert (=> b!1303214 (= lt!583160 lt!583159)))

(declare-fun lt!583148 () ListLongMap!20261)

(assert (=> b!1303214 (= lt!583148 (getCurrentListMapNoExtraKeys!6105 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583153 () (_ BitVec 64))

(assert (=> b!1303214 (= lt!583153 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583146 () (_ BitVec 64))

(assert (=> b!1303214 (= lt!583146 (select (arr!41886 _keys!1741) from!2144))))

(declare-fun lt!583139 () Unit!43140)

(assert (=> b!1303214 (= lt!583139 (addApplyDifferent!563 lt!583148 lt!583153 zeroValue!1387 lt!583146))))

(assert (=> b!1303214 (= (apply!1021 (+!4472 lt!583148 (tuple2!22605 lt!583153 zeroValue!1387)) lt!583146) (apply!1021 lt!583148 lt!583146))))

(declare-fun lt!583143 () Unit!43140)

(assert (=> b!1303214 (= lt!583143 lt!583139)))

(declare-fun lt!583151 () ListLongMap!20261)

(assert (=> b!1303214 (= lt!583151 (getCurrentListMapNoExtraKeys!6105 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583155 () (_ BitVec 64))

(assert (=> b!1303214 (= lt!583155 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583141 () (_ BitVec 64))

(assert (=> b!1303214 (= lt!583141 (select (arr!41886 _keys!1741) from!2144))))

(assert (=> b!1303214 (= lt!583149 (addApplyDifferent!563 lt!583151 lt!583155 minValue!1387 lt!583141))))

(assert (=> b!1303214 (= (apply!1021 (+!4472 lt!583151 (tuple2!22605 lt!583155 minValue!1387)) lt!583141) (apply!1021 lt!583151 lt!583141))))

(declare-fun d!141625 () Bool)

(assert (=> d!141625 e!743341))

(declare-fun res!865555 () Bool)

(assert (=> d!141625 (=> (not res!865555) (not e!743341))))

(assert (=> d!141625 (= res!865555 (or (bvsge from!2144 (size!42436 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42436 _keys!1741)))))))

(declare-fun lt!583154 () ListLongMap!20261)

(assert (=> d!141625 (= lt!583145 lt!583154)))

(declare-fun lt!583156 () Unit!43140)

(assert (=> d!141625 (= lt!583156 e!743340)))

(declare-fun c!125097 () Bool)

(assert (=> d!141625 (= c!125097 e!743344)))

(declare-fun res!865556 () Bool)

(assert (=> d!141625 (=> (not res!865556) (not e!743344))))

(assert (=> d!141625 (= res!865556 (bvslt from!2144 (size!42436 _keys!1741)))))

(assert (=> d!141625 (= lt!583154 e!743339)))

(assert (=> d!141625 (= c!125098 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!141625 (validMask!0 mask!2175)))

(assert (=> d!141625 (= (getCurrentListMap!5170 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!583145)))

(declare-fun b!1303201 () Bool)

(assert (=> b!1303201 (= e!743349 e!743345)))

(declare-fun res!865558 () Bool)

(assert (=> b!1303201 (= res!865558 call!64199)))

(assert (=> b!1303201 (=> (not res!865558) (not e!743345))))

(assert (= (and d!141625 c!125098) b!1303199))

(assert (= (and d!141625 (not c!125098)) b!1303207))

(assert (= (and b!1303207 c!125096) b!1303202))

(assert (= (and b!1303207 (not c!125096)) b!1303210))

(assert (= (and b!1303210 c!125095) b!1303213))

(assert (= (and b!1303210 (not c!125095)) b!1303212))

(assert (= (or b!1303213 b!1303212) bm!64200))

(assert (= (or b!1303202 bm!64200) bm!64196))

(assert (= (or b!1303202 b!1303213) bm!64197))

(assert (= (or b!1303199 bm!64196) bm!64194))

(assert (= (or b!1303199 bm!64197) bm!64195))

(assert (= (and d!141625 res!865556) b!1303200))

(assert (= (and d!141625 c!125097) b!1303214))

(assert (= (and d!141625 (not c!125097)) b!1303196))

(assert (= (and d!141625 res!865555) b!1303204))

(assert (= (and b!1303204 res!865554) b!1303203))

(assert (= (and b!1303204 (not res!865551)) b!1303208))

(assert (= (and b!1303208 res!865553) b!1303198))

(assert (= (and b!1303204 res!865559) b!1303211))

(assert (= (and b!1303211 c!125100) b!1303197))

(assert (= (and b!1303211 (not c!125100)) b!1303209))

(assert (= (and b!1303197 res!865557) b!1303194))

(assert (= (or b!1303197 b!1303209) bm!64199))

(assert (= (and b!1303211 res!865552) b!1303205))

(assert (= (and b!1303205 c!125099) b!1303201))

(assert (= (and b!1303205 (not c!125099)) b!1303195))

(assert (= (and b!1303201 res!865558) b!1303206))

(assert (= (or b!1303201 b!1303195) bm!64198))

(declare-fun b_lambda!23267 () Bool)

(assert (=> (not b_lambda!23267) (not b!1303198)))

(assert (=> b!1303198 t!43328))

(declare-fun b_and!47413 () Bool)

(assert (= b_and!47411 (and (=> t!43328 result!23813) b_and!47413)))

(assert (=> b!1303200 m!1193897))

(assert (=> b!1303200 m!1193897))

(assert (=> b!1303200 m!1193899))

(declare-fun m!1194079 () Bool)

(assert (=> bm!64198 m!1194079))

(declare-fun m!1194081 () Bool)

(assert (=> b!1303194 m!1194081))

(declare-fun m!1194083 () Bool)

(assert (=> b!1303214 m!1194083))

(declare-fun m!1194085 () Bool)

(assert (=> b!1303214 m!1194085))

(declare-fun m!1194087 () Bool)

(assert (=> b!1303214 m!1194087))

(assert (=> b!1303214 m!1194083))

(declare-fun m!1194089 () Bool)

(assert (=> b!1303214 m!1194089))

(declare-fun m!1194091 () Bool)

(assert (=> b!1303214 m!1194091))

(assert (=> b!1303214 m!1193897))

(declare-fun m!1194093 () Bool)

(assert (=> b!1303214 m!1194093))

(declare-fun m!1194095 () Bool)

(assert (=> b!1303214 m!1194095))

(assert (=> b!1303214 m!1194091))

(declare-fun m!1194097 () Bool)

(assert (=> b!1303214 m!1194097))

(declare-fun m!1194099 () Bool)

(assert (=> b!1303214 m!1194099))

(declare-fun m!1194101 () Bool)

(assert (=> b!1303214 m!1194101))

(declare-fun m!1194103 () Bool)

(assert (=> b!1303214 m!1194103))

(declare-fun m!1194105 () Bool)

(assert (=> b!1303214 m!1194105))

(assert (=> b!1303214 m!1193917))

(declare-fun m!1194107 () Bool)

(assert (=> b!1303214 m!1194107))

(declare-fun m!1194109 () Bool)

(assert (=> b!1303214 m!1194109))

(declare-fun m!1194111 () Bool)

(assert (=> b!1303214 m!1194111))

(assert (=> b!1303214 m!1194093))

(assert (=> b!1303214 m!1194109))

(assert (=> d!141625 m!1193883))

(declare-fun m!1194113 () Bool)

(assert (=> bm!64199 m!1194113))

(assert (=> b!1303203 m!1193897))

(assert (=> b!1303203 m!1193897))

(assert (=> b!1303203 m!1193899))

(declare-fun m!1194115 () Bool)

(assert (=> b!1303206 m!1194115))

(assert (=> bm!64194 m!1193917))

(assert (=> b!1303208 m!1193897))

(assert (=> b!1303208 m!1193897))

(declare-fun m!1194117 () Bool)

(assert (=> b!1303208 m!1194117))

(assert (=> b!1303198 m!1193897))

(assert (=> b!1303198 m!1193995))

(assert (=> b!1303198 m!1193999))

(assert (=> b!1303198 m!1193995))

(assert (=> b!1303198 m!1194001))

(assert (=> b!1303198 m!1193999))

(assert (=> b!1303198 m!1193897))

(declare-fun m!1194119 () Bool)

(assert (=> b!1303198 m!1194119))

(declare-fun m!1194121 () Bool)

(assert (=> bm!64195 m!1194121))

(declare-fun m!1194123 () Bool)

(assert (=> b!1303199 m!1194123))

(assert (=> b!1303029 d!141625))

(declare-fun d!141627 () Bool)

(assert (=> d!141627 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!110024 d!141627))

(declare-fun d!141629 () Bool)

(assert (=> d!141629 (= (array_inv!31681 _values!1445) (bvsge (size!42437 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!110024 d!141629))

(declare-fun d!141631 () Bool)

(assert (=> d!141631 (= (array_inv!31682 _keys!1741) (bvsge (size!42436 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!110024 d!141631))

(declare-fun b!1303223 () Bool)

(declare-fun e!743360 () Bool)

(declare-fun e!743358 () Bool)

(assert (=> b!1303223 (= e!743360 e!743358)))

(declare-fun lt!583169 () (_ BitVec 64))

(assert (=> b!1303223 (= lt!583169 (select (arr!41886 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!583168 () Unit!43140)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86788 (_ BitVec 64) (_ BitVec 32)) Unit!43140)

(assert (=> b!1303223 (= lt!583168 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!583169 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!86788 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1303223 (arrayContainsKey!0 _keys!1741 lt!583169 #b00000000000000000000000000000000)))

(declare-fun lt!583167 () Unit!43140)

(assert (=> b!1303223 (= lt!583167 lt!583168)))

(declare-fun res!865565 () Bool)

(declare-datatypes ((SeekEntryResult!10024 0))(
  ( (MissingZero!10024 (index!42467 (_ BitVec 32))) (Found!10024 (index!42468 (_ BitVec 32))) (Intermediate!10024 (undefined!10836 Bool) (index!42469 (_ BitVec 32)) (x!115734 (_ BitVec 32))) (Undefined!10024) (MissingVacant!10024 (index!42470 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86788 (_ BitVec 32)) SeekEntryResult!10024)

(assert (=> b!1303223 (= res!865565 (= (seekEntryOrOpen!0 (select (arr!41886 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!10024 #b00000000000000000000000000000000)))))

(assert (=> b!1303223 (=> (not res!865565) (not e!743358))))

(declare-fun b!1303224 () Bool)

(declare-fun call!64206 () Bool)

(assert (=> b!1303224 (= e!743360 call!64206)))

(declare-fun d!141633 () Bool)

(declare-fun res!865564 () Bool)

(declare-fun e!743359 () Bool)

(assert (=> d!141633 (=> res!865564 e!743359)))

(assert (=> d!141633 (= res!865564 (bvsge #b00000000000000000000000000000000 (size!42436 _keys!1741)))))

(assert (=> d!141633 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!743359)))

(declare-fun b!1303225 () Bool)

(assert (=> b!1303225 (= e!743359 e!743360)))

(declare-fun c!125103 () Bool)

(assert (=> b!1303225 (= c!125103 (validKeyInArray!0 (select (arr!41886 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun bm!64203 () Bool)

(assert (=> bm!64203 (= call!64206 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1303226 () Bool)

(assert (=> b!1303226 (= e!743358 call!64206)))

(assert (= (and d!141633 (not res!865564)) b!1303225))

(assert (= (and b!1303225 c!125103) b!1303223))

(assert (= (and b!1303225 (not c!125103)) b!1303224))

(assert (= (and b!1303223 res!865565) b!1303226))

(assert (= (or b!1303226 b!1303224) bm!64203))

(assert (=> b!1303223 m!1194063))

(declare-fun m!1194125 () Bool)

(assert (=> b!1303223 m!1194125))

(declare-fun m!1194127 () Bool)

(assert (=> b!1303223 m!1194127))

(assert (=> b!1303223 m!1194063))

(declare-fun m!1194129 () Bool)

(assert (=> b!1303223 m!1194129))

(assert (=> b!1303225 m!1194063))

(assert (=> b!1303225 m!1194063))

(assert (=> b!1303225 m!1194069))

(declare-fun m!1194131 () Bool)

(assert (=> bm!64203 m!1194131))

(assert (=> b!1303025 d!141633))

(declare-fun d!141635 () Bool)

(assert (=> d!141635 (= (validKeyInArray!0 (select (arr!41886 _keys!1741) from!2144)) (and (not (= (select (arr!41886 _keys!1741) from!2144) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41886 _keys!1741) from!2144) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1303020 d!141635))

(declare-fun d!141637 () Bool)

(declare-fun e!743362 () Bool)

(assert (=> d!141637 e!743362))

(declare-fun res!865566 () Bool)

(assert (=> d!141637 (=> res!865566 e!743362)))

(declare-fun lt!583173 () Bool)

(assert (=> d!141637 (= res!865566 (not lt!583173))))

(declare-fun lt!583171 () Bool)

(assert (=> d!141637 (= lt!583173 lt!583171)))

(declare-fun lt!583170 () Unit!43140)

(declare-fun e!743361 () Unit!43140)

(assert (=> d!141637 (= lt!583170 e!743361)))

(declare-fun c!125104 () Bool)

(assert (=> d!141637 (= c!125104 lt!583171)))

(assert (=> d!141637 (= lt!583171 (containsKey!726 (toList!10146 (ListLongMap!20262 Nil!29728)) k0!1205))))

(assert (=> d!141637 (= (contains!8280 (ListLongMap!20262 Nil!29728) k0!1205) lt!583173)))

(declare-fun b!1303227 () Bool)

(declare-fun lt!583172 () Unit!43140)

(assert (=> b!1303227 (= e!743361 lt!583172)))

(assert (=> b!1303227 (= lt!583172 (lemmaContainsKeyImpliesGetValueByKeyDefined!472 (toList!10146 (ListLongMap!20262 Nil!29728)) k0!1205))))

(assert (=> b!1303227 (isDefined!511 (getValueByKey!704 (toList!10146 (ListLongMap!20262 Nil!29728)) k0!1205))))

(declare-fun b!1303228 () Bool)

(declare-fun Unit!43149 () Unit!43140)

(assert (=> b!1303228 (= e!743361 Unit!43149)))

(declare-fun b!1303229 () Bool)

(assert (=> b!1303229 (= e!743362 (isDefined!511 (getValueByKey!704 (toList!10146 (ListLongMap!20262 Nil!29728)) k0!1205)))))

(assert (= (and d!141637 c!125104) b!1303227))

(assert (= (and d!141637 (not c!125104)) b!1303228))

(assert (= (and d!141637 (not res!865566)) b!1303229))

(declare-fun m!1194133 () Bool)

(assert (=> d!141637 m!1194133))

(declare-fun m!1194135 () Bool)

(assert (=> b!1303227 m!1194135))

(declare-fun m!1194137 () Bool)

(assert (=> b!1303227 m!1194137))

(assert (=> b!1303227 m!1194137))

(declare-fun m!1194139 () Bool)

(assert (=> b!1303227 m!1194139))

(assert (=> b!1303229 m!1194137))

(assert (=> b!1303229 m!1194137))

(assert (=> b!1303229 m!1194139))

(assert (=> b!1303026 d!141637))

(declare-fun d!141639 () Bool)

(assert (=> d!141639 (not (contains!8280 (ListLongMap!20262 Nil!29728) k0!1205))))

(declare-fun lt!583176 () Unit!43140)

(declare-fun choose!1920 ((_ BitVec 64)) Unit!43140)

(assert (=> d!141639 (= lt!583176 (choose!1920 k0!1205))))

(assert (=> d!141639 (= (emptyContainsNothing!211 k0!1205) lt!583176)))

(declare-fun bs!37111 () Bool)

(assert (= bs!37111 d!141639))

(assert (=> bs!37111 m!1193889))

(declare-fun m!1194141 () Bool)

(assert (=> bs!37111 m!1194141))

(assert (=> b!1303026 d!141639))

(declare-fun b!1303237 () Bool)

(declare-fun e!743367 () Bool)

(assert (=> b!1303237 (= e!743367 tp_is_empty!34887)))

(declare-fun condMapEmpty!53926 () Bool)

(declare-fun mapDefault!53926 () ValueCell!16545)

(assert (=> mapNonEmpty!53920 (= condMapEmpty!53926 (= mapRest!53920 ((as const (Array (_ BitVec 32) ValueCell!16545)) mapDefault!53926)))))

(declare-fun mapRes!53926 () Bool)

(assert (=> mapNonEmpty!53920 (= tp!102888 (and e!743367 mapRes!53926))))

(declare-fun mapNonEmpty!53926 () Bool)

(declare-fun tp!102898 () Bool)

(declare-fun e!743368 () Bool)

(assert (=> mapNonEmpty!53926 (= mapRes!53926 (and tp!102898 e!743368))))

(declare-fun mapRest!53926 () (Array (_ BitVec 32) ValueCell!16545))

(declare-fun mapValue!53926 () ValueCell!16545)

(declare-fun mapKey!53926 () (_ BitVec 32))

(assert (=> mapNonEmpty!53926 (= mapRest!53920 (store mapRest!53926 mapKey!53926 mapValue!53926))))

(declare-fun mapIsEmpty!53926 () Bool)

(assert (=> mapIsEmpty!53926 mapRes!53926))

(declare-fun b!1303236 () Bool)

(assert (=> b!1303236 (= e!743368 tp_is_empty!34887)))

(assert (= (and mapNonEmpty!53920 condMapEmpty!53926) mapIsEmpty!53926))

(assert (= (and mapNonEmpty!53920 (not condMapEmpty!53926)) mapNonEmpty!53926))

(assert (= (and mapNonEmpty!53926 ((_ is ValueCellFull!16545) mapValue!53926)) b!1303236))

(assert (= (and mapNonEmpty!53920 ((_ is ValueCellFull!16545) mapDefault!53926)) b!1303237))

(declare-fun m!1194143 () Bool)

(assert (=> mapNonEmpty!53926 m!1194143))

(declare-fun b_lambda!23269 () Bool)

(assert (= b_lambda!23267 (or (and start!110024 b_free!29247) b_lambda!23269)))

(declare-fun b_lambda!23271 () Bool)

(assert (= b_lambda!23263 (or (and start!110024 b_free!29247) b_lambda!23271)))

(declare-fun b_lambda!23273 () Bool)

(assert (= b_lambda!23265 (or (and start!110024 b_free!29247) b_lambda!23273)))

(check-sat (not d!141609) (not d!141619) (not b!1303194) (not b!1303106) (not d!141639) tp_is_empty!34887 (not b!1303151) (not d!141623) (not b!1303109) (not b!1303128) (not b!1303149) (not bm!64198) (not b!1303203) (not b_next!29247) (not mapNonEmpty!53926) (not d!141605) (not b!1303198) (not b!1303131) (not b!1303110) (not b!1303107) (not b!1303133) (not b_lambda!23269) (not d!141613) (not d!141617) (not b!1303223) (not b!1303111) (not b!1303225) (not d!141637) (not b!1303199) (not bm!64203) (not b!1303122) (not d!141615) (not b!1303116) (not d!141607) (not b!1303120) (not b!1303208) (not b!1303071) (not b!1303080) (not d!141625) (not b!1303078) (not bm!64195) (not bm!64194) b_and!47413 (not b!1303070) (not bm!64199) (not b!1303119) (not b!1303144) (not b!1303115) (not b!1303227) (not bm!64176) (not b!1303145) (not b!1303214) (not b_lambda!23271) (not bm!64179) (not b!1303229) (not d!141611) (not b!1303148) (not d!141603) (not b!1303200) (not b!1303130) (not b!1303108) (not b!1303121) (not b!1303206) (not b_lambda!23273))
(check-sat b_and!47413 (not b_next!29247))
