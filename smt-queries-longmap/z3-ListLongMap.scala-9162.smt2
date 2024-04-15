; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110022 () Bool)

(assert start!110022)

(declare-fun b_free!29245 () Bool)

(declare-fun b_next!29245 () Bool)

(assert (=> start!110022 (= b_free!29245 (not b_next!29245))))

(declare-fun tp!102883 () Bool)

(declare-fun b_and!47385 () Bool)

(assert (=> start!110022 (= tp!102883 b_and!47385)))

(declare-datatypes ((V!51617 0))(
  ( (V!51618 (val!17517 Int)) )
))
(declare-datatypes ((tuple2!22660 0))(
  ( (tuple2!22661 (_1!11341 (_ BitVec 64)) (_2!11341 V!51617)) )
))
(declare-datatypes ((List!29773 0))(
  ( (Nil!29770) (Cons!29769 (h!30978 tuple2!22660) (t!43357 List!29773)) )
))
(declare-datatypes ((ListLongMap!20317 0))(
  ( (ListLongMap!20318 (toList!10174 List!29773)) )
))
(declare-fun lt!582802 () ListLongMap!20317)

(declare-fun b!1302912 () Bool)

(declare-fun lt!582800 () tuple2!22660)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun e!743187 () Bool)

(declare-fun contains!8236 (ListLongMap!20317 (_ BitVec 64)) Bool)

(declare-fun +!4507 (ListLongMap!20317 tuple2!22660) ListLongMap!20317)

(assert (=> b!1302912 (= e!743187 (contains!8236 (+!4507 lt!582802 lt!582800) k0!1205))))

(declare-fun lt!582799 () ListLongMap!20317)

(assert (=> b!1302912 (not (contains!8236 (+!4507 lt!582799 lt!582800) k0!1205))))

(declare-fun minValue!1387 () V!51617)

(assert (=> b!1302912 (= lt!582800 (tuple2!22661 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))

(declare-datatypes ((Unit!42981 0))(
  ( (Unit!42982) )
))
(declare-fun lt!582801 () Unit!42981)

(declare-fun addStillNotContains!460 (ListLongMap!20317 (_ BitVec 64) V!51617 (_ BitVec 64)) Unit!42981)

(assert (=> b!1302912 (= lt!582801 (addStillNotContains!460 lt!582799 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1302912 (not (contains!8236 lt!582802 k0!1205))))

(declare-fun zeroValue!1387 () V!51617)

(assert (=> b!1302912 (= lt!582802 (+!4507 lt!582799 (tuple2!22661 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!582803 () Unit!42981)

(assert (=> b!1302912 (= lt!582803 (addStillNotContains!460 lt!582799 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16544 0))(
  ( (ValueCellFull!16544 (v!20131 V!51617)) (EmptyCell!16544) )
))
(declare-datatypes ((array!86685 0))(
  ( (array!86686 (arr!41835 (Array (_ BitVec 32) ValueCell!16544)) (size!42387 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86685)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86687 0))(
  ( (array!86688 (arr!41836 (Array (_ BitVec 32) (_ BitVec 64))) (size!42388 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86687)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6139 (array!86687 array!86685 (_ BitVec 32) (_ BitVec 32) V!51617 V!51617 (_ BitVec 32) Int) ListLongMap!20317)

(assert (=> b!1302912 (= lt!582799 (getCurrentListMapNoExtraKeys!6139 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1302913 () Bool)

(declare-fun res!865403 () Bool)

(declare-fun e!743189 () Bool)

(assert (=> b!1302913 (=> (not res!865403) (not e!743189))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1302913 (= res!865403 (not (validKeyInArray!0 (select (arr!41836 _keys!1741) from!2144))))))

(declare-fun b!1302914 () Bool)

(declare-fun e!743185 () Bool)

(declare-fun e!743186 () Bool)

(declare-fun mapRes!53917 () Bool)

(assert (=> b!1302914 (= e!743185 (and e!743186 mapRes!53917))))

(declare-fun condMapEmpty!53917 () Bool)

(declare-fun mapDefault!53917 () ValueCell!16544)

(assert (=> b!1302914 (= condMapEmpty!53917 (= (arr!41835 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16544)) mapDefault!53917)))))

(declare-fun b!1302915 () Bool)

(declare-fun res!865408 () Bool)

(assert (=> b!1302915 (=> (not res!865408) (not e!743189))))

(declare-datatypes ((List!29774 0))(
  ( (Nil!29771) (Cons!29770 (h!30979 (_ BitVec 64)) (t!43358 List!29774)) )
))
(declare-fun arrayNoDuplicates!0 (array!86687 (_ BitVec 32) List!29774) Bool)

(assert (=> b!1302915 (= res!865408 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29771))))

(declare-fun b!1302916 () Bool)

(declare-fun res!865402 () Bool)

(assert (=> b!1302916 (=> (not res!865402) (not e!743189))))

(assert (=> b!1302916 (= res!865402 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42388 _keys!1741))))))

(declare-fun b!1302917 () Bool)

(declare-fun res!865404 () Bool)

(assert (=> b!1302917 (=> (not res!865404) (not e!743189))))

(declare-fun getCurrentListMap!5079 (array!86687 array!86685 (_ BitVec 32) (_ BitVec 32) V!51617 V!51617 (_ BitVec 32) Int) ListLongMap!20317)

(assert (=> b!1302917 (= res!865404 (contains!8236 (getCurrentListMap!5079 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1302918 () Bool)

(declare-fun res!865407 () Bool)

(assert (=> b!1302918 (=> (not res!865407) (not e!743189))))

(assert (=> b!1302918 (= res!865407 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42388 _keys!1741))))))

(declare-fun mapIsEmpty!53917 () Bool)

(assert (=> mapIsEmpty!53917 mapRes!53917))

(declare-fun b!1302919 () Bool)

(declare-fun res!865400 () Bool)

(assert (=> b!1302919 (=> (not res!865400) (not e!743189))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86687 (_ BitVec 32)) Bool)

(assert (=> b!1302919 (= res!865400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1302920 () Bool)

(declare-fun tp_is_empty!34885 () Bool)

(assert (=> b!1302920 (= e!743186 tp_is_empty!34885)))

(declare-fun res!865406 () Bool)

(assert (=> start!110022 (=> (not res!865406) (not e!743189))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110022 (= res!865406 (validMask!0 mask!2175))))

(assert (=> start!110022 e!743189))

(assert (=> start!110022 tp_is_empty!34885))

(assert (=> start!110022 true))

(declare-fun array_inv!31821 (array!86685) Bool)

(assert (=> start!110022 (and (array_inv!31821 _values!1445) e!743185)))

(declare-fun array_inv!31822 (array!86687) Bool)

(assert (=> start!110022 (array_inv!31822 _keys!1741)))

(assert (=> start!110022 tp!102883))

(declare-fun mapNonEmpty!53917 () Bool)

(declare-fun tp!102884 () Bool)

(declare-fun e!743188 () Bool)

(assert (=> mapNonEmpty!53917 (= mapRes!53917 (and tp!102884 e!743188))))

(declare-fun mapKey!53917 () (_ BitVec 32))

(declare-fun mapRest!53917 () (Array (_ BitVec 32) ValueCell!16544))

(declare-fun mapValue!53917 () ValueCell!16544)

(assert (=> mapNonEmpty!53917 (= (arr!41835 _values!1445) (store mapRest!53917 mapKey!53917 mapValue!53917))))

(declare-fun b!1302921 () Bool)

(declare-fun res!865401 () Bool)

(assert (=> b!1302921 (=> (not res!865401) (not e!743189))))

(assert (=> b!1302921 (= res!865401 (and (= (size!42387 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42388 _keys!1741) (size!42387 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1302922 () Bool)

(assert (=> b!1302922 (= e!743188 tp_is_empty!34885)))

(declare-fun b!1302923 () Bool)

(assert (=> b!1302923 (= e!743189 (not e!743187))))

(declare-fun res!865405 () Bool)

(assert (=> b!1302923 (=> res!865405 e!743187)))

(assert (=> b!1302923 (= res!865405 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1302923 (not (contains!8236 (ListLongMap!20318 Nil!29770) k0!1205))))

(declare-fun lt!582798 () Unit!42981)

(declare-fun emptyContainsNothing!207 ((_ BitVec 64)) Unit!42981)

(assert (=> b!1302923 (= lt!582798 (emptyContainsNothing!207 k0!1205))))

(assert (= (and start!110022 res!865406) b!1302921))

(assert (= (and b!1302921 res!865401) b!1302919))

(assert (= (and b!1302919 res!865400) b!1302915))

(assert (= (and b!1302915 res!865408) b!1302918))

(assert (= (and b!1302918 res!865407) b!1302917))

(assert (= (and b!1302917 res!865404) b!1302916))

(assert (= (and b!1302916 res!865402) b!1302913))

(assert (= (and b!1302913 res!865403) b!1302923))

(assert (= (and b!1302923 (not res!865405)) b!1302912))

(assert (= (and b!1302914 condMapEmpty!53917) mapIsEmpty!53917))

(assert (= (and b!1302914 (not condMapEmpty!53917)) mapNonEmpty!53917))

(get-info :version)

(assert (= (and mapNonEmpty!53917 ((_ is ValueCellFull!16544) mapValue!53917)) b!1302922))

(assert (= (and b!1302914 ((_ is ValueCellFull!16544) mapDefault!53917)) b!1302920))

(assert (= start!110022 b!1302914))

(declare-fun m!1193323 () Bool)

(assert (=> b!1302913 m!1193323))

(assert (=> b!1302913 m!1193323))

(declare-fun m!1193325 () Bool)

(assert (=> b!1302913 m!1193325))

(declare-fun m!1193327 () Bool)

(assert (=> b!1302912 m!1193327))

(declare-fun m!1193329 () Bool)

(assert (=> b!1302912 m!1193329))

(declare-fun m!1193331 () Bool)

(assert (=> b!1302912 m!1193331))

(declare-fun m!1193333 () Bool)

(assert (=> b!1302912 m!1193333))

(declare-fun m!1193335 () Bool)

(assert (=> b!1302912 m!1193335))

(declare-fun m!1193337 () Bool)

(assert (=> b!1302912 m!1193337))

(declare-fun m!1193339 () Bool)

(assert (=> b!1302912 m!1193339))

(assert (=> b!1302912 m!1193339))

(declare-fun m!1193341 () Bool)

(assert (=> b!1302912 m!1193341))

(assert (=> b!1302912 m!1193327))

(declare-fun m!1193343 () Bool)

(assert (=> b!1302912 m!1193343))

(declare-fun m!1193345 () Bool)

(assert (=> b!1302917 m!1193345))

(assert (=> b!1302917 m!1193345))

(declare-fun m!1193347 () Bool)

(assert (=> b!1302917 m!1193347))

(declare-fun m!1193349 () Bool)

(assert (=> mapNonEmpty!53917 m!1193349))

(declare-fun m!1193351 () Bool)

(assert (=> b!1302915 m!1193351))

(declare-fun m!1193353 () Bool)

(assert (=> start!110022 m!1193353))

(declare-fun m!1193355 () Bool)

(assert (=> start!110022 m!1193355))

(declare-fun m!1193357 () Bool)

(assert (=> start!110022 m!1193357))

(declare-fun m!1193359 () Bool)

(assert (=> b!1302923 m!1193359))

(declare-fun m!1193361 () Bool)

(assert (=> b!1302923 m!1193361))

(declare-fun m!1193363 () Bool)

(assert (=> b!1302919 m!1193363))

(check-sat tp_is_empty!34885 (not b!1302915) (not b!1302912) (not b_next!29245) (not b!1302917) (not mapNonEmpty!53917) (not start!110022) (not b!1302919) (not b!1302923) (not b!1302913) b_and!47385)
(check-sat b_and!47385 (not b_next!29245))
(get-model)

(declare-fun d!141487 () Bool)

(declare-fun e!743230 () Bool)

(assert (=> d!141487 e!743230))

(declare-fun res!865465 () Bool)

(assert (=> d!141487 (=> res!865465 e!743230)))

(declare-fun lt!582849 () Bool)

(assert (=> d!141487 (= res!865465 (not lt!582849))))

(declare-fun lt!582850 () Bool)

(assert (=> d!141487 (= lt!582849 lt!582850)))

(declare-fun lt!582851 () Unit!42981)

(declare-fun e!743231 () Unit!42981)

(assert (=> d!141487 (= lt!582851 e!743231)))

(declare-fun c!125046 () Bool)

(assert (=> d!141487 (= c!125046 lt!582850)))

(declare-fun containsKey!724 (List!29773 (_ BitVec 64)) Bool)

(assert (=> d!141487 (= lt!582850 (containsKey!724 (toList!10174 (ListLongMap!20318 Nil!29770)) k0!1205))))

(assert (=> d!141487 (= (contains!8236 (ListLongMap!20318 Nil!29770) k0!1205) lt!582849)))

(declare-fun b!1303002 () Bool)

(declare-fun lt!582848 () Unit!42981)

(assert (=> b!1303002 (= e!743231 lt!582848)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!471 (List!29773 (_ BitVec 64)) Unit!42981)

(assert (=> b!1303002 (= lt!582848 (lemmaContainsKeyImpliesGetValueByKeyDefined!471 (toList!10174 (ListLongMap!20318 Nil!29770)) k0!1205))))

(declare-datatypes ((Option!758 0))(
  ( (Some!757 (v!20134 V!51617)) (None!756) )
))
(declare-fun isDefined!514 (Option!758) Bool)

(declare-fun getValueByKey!707 (List!29773 (_ BitVec 64)) Option!758)

(assert (=> b!1303002 (isDefined!514 (getValueByKey!707 (toList!10174 (ListLongMap!20318 Nil!29770)) k0!1205))))

(declare-fun b!1303003 () Bool)

(declare-fun Unit!42987 () Unit!42981)

(assert (=> b!1303003 (= e!743231 Unit!42987)))

(declare-fun b!1303004 () Bool)

(assert (=> b!1303004 (= e!743230 (isDefined!514 (getValueByKey!707 (toList!10174 (ListLongMap!20318 Nil!29770)) k0!1205)))))

(assert (= (and d!141487 c!125046) b!1303002))

(assert (= (and d!141487 (not c!125046)) b!1303003))

(assert (= (and d!141487 (not res!865465)) b!1303004))

(declare-fun m!1193449 () Bool)

(assert (=> d!141487 m!1193449))

(declare-fun m!1193451 () Bool)

(assert (=> b!1303002 m!1193451))

(declare-fun m!1193453 () Bool)

(assert (=> b!1303002 m!1193453))

(assert (=> b!1303002 m!1193453))

(declare-fun m!1193455 () Bool)

(assert (=> b!1303002 m!1193455))

(assert (=> b!1303004 m!1193453))

(assert (=> b!1303004 m!1193453))

(assert (=> b!1303004 m!1193455))

(assert (=> b!1302923 d!141487))

(declare-fun d!141489 () Bool)

(assert (=> d!141489 (not (contains!8236 (ListLongMap!20318 Nil!29770) k0!1205))))

(declare-fun lt!582854 () Unit!42981)

(declare-fun choose!1928 ((_ BitVec 64)) Unit!42981)

(assert (=> d!141489 (= lt!582854 (choose!1928 k0!1205))))

(assert (=> d!141489 (= (emptyContainsNothing!207 k0!1205) lt!582854)))

(declare-fun bs!37084 () Bool)

(assert (= bs!37084 d!141489))

(assert (=> bs!37084 m!1193359))

(declare-fun m!1193457 () Bool)

(assert (=> bs!37084 m!1193457))

(assert (=> b!1302923 d!141489))

(declare-fun b!1303013 () Bool)

(declare-fun e!743240 () Bool)

(declare-fun e!743239 () Bool)

(assert (=> b!1303013 (= e!743240 e!743239)))

(declare-fun c!125049 () Bool)

(assert (=> b!1303013 (= c!125049 (validKeyInArray!0 (select (arr!41836 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun d!141491 () Bool)

(declare-fun res!865471 () Bool)

(assert (=> d!141491 (=> res!865471 e!743240)))

(assert (=> d!141491 (= res!865471 (bvsge #b00000000000000000000000000000000 (size!42388 _keys!1741)))))

(assert (=> d!141491 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!743240)))

(declare-fun b!1303014 () Bool)

(declare-fun e!743238 () Bool)

(assert (=> b!1303014 (= e!743239 e!743238)))

(declare-fun lt!582861 () (_ BitVec 64))

(assert (=> b!1303014 (= lt!582861 (select (arr!41836 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!582862 () Unit!42981)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86687 (_ BitVec 64) (_ BitVec 32)) Unit!42981)

(assert (=> b!1303014 (= lt!582862 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!582861 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!86687 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1303014 (arrayContainsKey!0 _keys!1741 lt!582861 #b00000000000000000000000000000000)))

(declare-fun lt!582863 () Unit!42981)

(assert (=> b!1303014 (= lt!582863 lt!582862)))

(declare-fun res!865470 () Bool)

(declare-datatypes ((SeekEntryResult!10023 0))(
  ( (MissingZero!10023 (index!42463 (_ BitVec 32))) (Found!10023 (index!42464 (_ BitVec 32))) (Intermediate!10023 (undefined!10835 Bool) (index!42465 (_ BitVec 32)) (x!115730 (_ BitVec 32))) (Undefined!10023) (MissingVacant!10023 (index!42466 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86687 (_ BitVec 32)) SeekEntryResult!10023)

(assert (=> b!1303014 (= res!865470 (= (seekEntryOrOpen!0 (select (arr!41836 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!10023 #b00000000000000000000000000000000)))))

(assert (=> b!1303014 (=> (not res!865470) (not e!743238))))

(declare-fun b!1303015 () Bool)

(declare-fun call!64160 () Bool)

(assert (=> b!1303015 (= e!743238 call!64160)))

(declare-fun b!1303016 () Bool)

(assert (=> b!1303016 (= e!743239 call!64160)))

(declare-fun bm!64157 () Bool)

(assert (=> bm!64157 (= call!64160 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(assert (= (and d!141491 (not res!865471)) b!1303013))

(assert (= (and b!1303013 c!125049) b!1303014))

(assert (= (and b!1303013 (not c!125049)) b!1303016))

(assert (= (and b!1303014 res!865470) b!1303015))

(assert (= (or b!1303015 b!1303016) bm!64157))

(declare-fun m!1193459 () Bool)

(assert (=> b!1303013 m!1193459))

(assert (=> b!1303013 m!1193459))

(declare-fun m!1193461 () Bool)

(assert (=> b!1303013 m!1193461))

(assert (=> b!1303014 m!1193459))

(declare-fun m!1193463 () Bool)

(assert (=> b!1303014 m!1193463))

(declare-fun m!1193465 () Bool)

(assert (=> b!1303014 m!1193465))

(assert (=> b!1303014 m!1193459))

(declare-fun m!1193467 () Bool)

(assert (=> b!1303014 m!1193467))

(declare-fun m!1193469 () Bool)

(assert (=> bm!64157 m!1193469))

(assert (=> b!1302919 d!141491))

(declare-fun b!1303027 () Bool)

(declare-fun e!743250 () Bool)

(declare-fun call!64163 () Bool)

(assert (=> b!1303027 (= e!743250 call!64163)))

(declare-fun b!1303028 () Bool)

(declare-fun e!743249 () Bool)

(declare-fun contains!8239 (List!29774 (_ BitVec 64)) Bool)

(assert (=> b!1303028 (= e!743249 (contains!8239 Nil!29771 (select (arr!41836 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1303029 () Bool)

(declare-fun e!743252 () Bool)

(declare-fun e!743251 () Bool)

(assert (=> b!1303029 (= e!743252 e!743251)))

(declare-fun res!865479 () Bool)

(assert (=> b!1303029 (=> (not res!865479) (not e!743251))))

(assert (=> b!1303029 (= res!865479 (not e!743249))))

(declare-fun res!865480 () Bool)

(assert (=> b!1303029 (=> (not res!865480) (not e!743249))))

(assert (=> b!1303029 (= res!865480 (validKeyInArray!0 (select (arr!41836 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1303030 () Bool)

(assert (=> b!1303030 (= e!743250 call!64163)))

(declare-fun b!1303031 () Bool)

(assert (=> b!1303031 (= e!743251 e!743250)))

(declare-fun c!125052 () Bool)

(assert (=> b!1303031 (= c!125052 (validKeyInArray!0 (select (arr!41836 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun bm!64160 () Bool)

(assert (=> bm!64160 (= call!64163 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125052 (Cons!29770 (select (arr!41836 _keys!1741) #b00000000000000000000000000000000) Nil!29771) Nil!29771)))))

(declare-fun d!141493 () Bool)

(declare-fun res!865478 () Bool)

(assert (=> d!141493 (=> res!865478 e!743252)))

(assert (=> d!141493 (= res!865478 (bvsge #b00000000000000000000000000000000 (size!42388 _keys!1741)))))

(assert (=> d!141493 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29771) e!743252)))

(assert (= (and d!141493 (not res!865478)) b!1303029))

(assert (= (and b!1303029 res!865480) b!1303028))

(assert (= (and b!1303029 res!865479) b!1303031))

(assert (= (and b!1303031 c!125052) b!1303027))

(assert (= (and b!1303031 (not c!125052)) b!1303030))

(assert (= (or b!1303027 b!1303030) bm!64160))

(assert (=> b!1303028 m!1193459))

(assert (=> b!1303028 m!1193459))

(declare-fun m!1193471 () Bool)

(assert (=> b!1303028 m!1193471))

(assert (=> b!1303029 m!1193459))

(assert (=> b!1303029 m!1193459))

(assert (=> b!1303029 m!1193461))

(assert (=> b!1303031 m!1193459))

(assert (=> b!1303031 m!1193459))

(assert (=> b!1303031 m!1193461))

(assert (=> bm!64160 m!1193459))

(declare-fun m!1193473 () Bool)

(assert (=> bm!64160 m!1193473))

(assert (=> b!1302915 d!141493))

(declare-fun d!141495 () Bool)

(assert (=> d!141495 (= (validKeyInArray!0 (select (arr!41836 _keys!1741) from!2144)) (and (not (= (select (arr!41836 _keys!1741) from!2144) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41836 _keys!1741) from!2144) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1302913 d!141495))

(declare-fun d!141497 () Bool)

(declare-fun e!743253 () Bool)

(assert (=> d!141497 e!743253))

(declare-fun res!865481 () Bool)

(assert (=> d!141497 (=> res!865481 e!743253)))

(declare-fun lt!582865 () Bool)

(assert (=> d!141497 (= res!865481 (not lt!582865))))

(declare-fun lt!582866 () Bool)

(assert (=> d!141497 (= lt!582865 lt!582866)))

(declare-fun lt!582867 () Unit!42981)

(declare-fun e!743254 () Unit!42981)

(assert (=> d!141497 (= lt!582867 e!743254)))

(declare-fun c!125053 () Bool)

(assert (=> d!141497 (= c!125053 lt!582866)))

(assert (=> d!141497 (= lt!582866 (containsKey!724 (toList!10174 (getCurrentListMap!5079 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!141497 (= (contains!8236 (getCurrentListMap!5079 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!582865)))

(declare-fun b!1303032 () Bool)

(declare-fun lt!582864 () Unit!42981)

(assert (=> b!1303032 (= e!743254 lt!582864)))

(assert (=> b!1303032 (= lt!582864 (lemmaContainsKeyImpliesGetValueByKeyDefined!471 (toList!10174 (getCurrentListMap!5079 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> b!1303032 (isDefined!514 (getValueByKey!707 (toList!10174 (getCurrentListMap!5079 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1303033 () Bool)

(declare-fun Unit!42988 () Unit!42981)

(assert (=> b!1303033 (= e!743254 Unit!42988)))

(declare-fun b!1303034 () Bool)

(assert (=> b!1303034 (= e!743253 (isDefined!514 (getValueByKey!707 (toList!10174 (getCurrentListMap!5079 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141497 c!125053) b!1303032))

(assert (= (and d!141497 (not c!125053)) b!1303033))

(assert (= (and d!141497 (not res!865481)) b!1303034))

(declare-fun m!1193475 () Bool)

(assert (=> d!141497 m!1193475))

(declare-fun m!1193477 () Bool)

(assert (=> b!1303032 m!1193477))

(declare-fun m!1193479 () Bool)

(assert (=> b!1303032 m!1193479))

(assert (=> b!1303032 m!1193479))

(declare-fun m!1193481 () Bool)

(assert (=> b!1303032 m!1193481))

(assert (=> b!1303034 m!1193479))

(assert (=> b!1303034 m!1193479))

(assert (=> b!1303034 m!1193481))

(assert (=> b!1302917 d!141497))

(declare-fun b!1303077 () Bool)

(declare-fun e!743289 () Bool)

(assert (=> b!1303077 (= e!743289 (validKeyInArray!0 (select (arr!41836 _keys!1741) from!2144)))))

(declare-fun b!1303078 () Bool)

(declare-fun res!865507 () Bool)

(declare-fun e!743282 () Bool)

(assert (=> b!1303078 (=> (not res!865507) (not e!743282))))

(declare-fun e!743281 () Bool)

(assert (=> b!1303078 (= res!865507 e!743281)))

(declare-fun res!865501 () Bool)

(assert (=> b!1303078 (=> res!865501 e!743281)))

(assert (=> b!1303078 (= res!865501 (not e!743289))))

(declare-fun res!865506 () Bool)

(assert (=> b!1303078 (=> (not res!865506) (not e!743289))))

(assert (=> b!1303078 (= res!865506 (bvslt from!2144 (size!42388 _keys!1741)))))

(declare-fun b!1303079 () Bool)

(declare-fun res!865502 () Bool)

(assert (=> b!1303079 (=> (not res!865502) (not e!743282))))

(declare-fun e!743288 () Bool)

(assert (=> b!1303079 (= res!865502 e!743288)))

(declare-fun c!125067 () Bool)

(assert (=> b!1303079 (= c!125067 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1303080 () Bool)

(declare-fun e!743290 () Bool)

(assert (=> b!1303080 (= e!743282 e!743290)))

(declare-fun c!125069 () Bool)

(assert (=> b!1303080 (= c!125069 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!64175 () Bool)

(declare-fun call!64179 () ListLongMap!20317)

(declare-fun call!64183 () ListLongMap!20317)

(assert (=> bm!64175 (= call!64179 call!64183)))

(declare-fun b!1303081 () Bool)

(declare-fun e!743291 () Bool)

(declare-fun lt!582928 () ListLongMap!20317)

(declare-fun apply!1014 (ListLongMap!20317 (_ BitVec 64)) V!51617)

(assert (=> b!1303081 (= e!743291 (= (apply!1014 lt!582928 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun bm!64176 () Bool)

(declare-fun call!64182 () ListLongMap!20317)

(assert (=> bm!64176 (= call!64182 (getCurrentListMapNoExtraKeys!6139 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1303082 () Bool)

(declare-fun call!64181 () Bool)

(assert (=> b!1303082 (= e!743290 (not call!64181))))

(declare-fun b!1303083 () Bool)

(declare-fun e!743292 () Bool)

(assert (=> b!1303083 (= e!743292 (validKeyInArray!0 (select (arr!41836 _keys!1741) from!2144)))))

(declare-fun b!1303084 () Bool)

(declare-fun e!743293 () Bool)

(declare-fun get!21157 (ValueCell!16544 V!51617) V!51617)

(declare-fun dynLambda!3452 (Int (_ BitVec 64)) V!51617)

(assert (=> b!1303084 (= e!743293 (= (apply!1014 lt!582928 (select (arr!41836 _keys!1741) from!2144)) (get!21157 (select (arr!41835 _values!1445) from!2144) (dynLambda!3452 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1303084 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42387 _values!1445)))))

(assert (=> b!1303084 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42388 _keys!1741)))))

(declare-fun b!1303085 () Bool)

(declare-fun call!64178 () Bool)

(assert (=> b!1303085 (= e!743288 (not call!64178))))

(declare-fun b!1303086 () Bool)

(declare-fun e!743285 () Bool)

(assert (=> b!1303086 (= e!743285 (= (apply!1014 lt!582928 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun bm!64177 () Bool)

(assert (=> bm!64177 (= call!64181 (contains!8236 lt!582928 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1303087 () Bool)

(declare-fun e!743287 () ListLongMap!20317)

(declare-fun e!743284 () ListLongMap!20317)

(assert (=> b!1303087 (= e!743287 e!743284)))

(declare-fun c!125071 () Bool)

(assert (=> b!1303087 (= c!125071 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun c!125066 () Bool)

(declare-fun call!64180 () ListLongMap!20317)

(declare-fun bm!64178 () Bool)

(assert (=> bm!64178 (= call!64180 (+!4507 (ite c!125066 call!64182 (ite c!125071 call!64183 call!64179)) (ite (or c!125066 c!125071) (tuple2!22661 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22661 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun d!141499 () Bool)

(assert (=> d!141499 e!743282))

(declare-fun res!865500 () Bool)

(assert (=> d!141499 (=> (not res!865500) (not e!743282))))

(assert (=> d!141499 (= res!865500 (or (bvsge from!2144 (size!42388 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42388 _keys!1741)))))))

(declare-fun lt!582924 () ListLongMap!20317)

(assert (=> d!141499 (= lt!582928 lt!582924)))

(declare-fun lt!582922 () Unit!42981)

(declare-fun e!743283 () Unit!42981)

(assert (=> d!141499 (= lt!582922 e!743283)))

(declare-fun c!125068 () Bool)

(assert (=> d!141499 (= c!125068 e!743292)))

(declare-fun res!865503 () Bool)

(assert (=> d!141499 (=> (not res!865503) (not e!743292))))

(assert (=> d!141499 (= res!865503 (bvslt from!2144 (size!42388 _keys!1741)))))

(assert (=> d!141499 (= lt!582924 e!743287)))

(assert (=> d!141499 (= c!125066 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!141499 (validMask!0 mask!2175)))

(assert (=> d!141499 (= (getCurrentListMap!5079 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!582928)))

(declare-fun b!1303088 () Bool)

(assert (=> b!1303088 (= e!743281 e!743293)))

(declare-fun res!865508 () Bool)

(assert (=> b!1303088 (=> (not res!865508) (not e!743293))))

(assert (=> b!1303088 (= res!865508 (contains!8236 lt!582928 (select (arr!41836 _keys!1741) from!2144)))))

(assert (=> b!1303088 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42388 _keys!1741)))))

(declare-fun b!1303089 () Bool)

(assert (=> b!1303089 (= e!743288 e!743291)))

(declare-fun res!865504 () Bool)

(assert (=> b!1303089 (= res!865504 call!64178)))

(assert (=> b!1303089 (=> (not res!865504) (not e!743291))))

(declare-fun b!1303090 () Bool)

(assert (=> b!1303090 (= e!743290 e!743285)))

(declare-fun res!865505 () Bool)

(assert (=> b!1303090 (= res!865505 call!64181)))

(assert (=> b!1303090 (=> (not res!865505) (not e!743285))))

(declare-fun b!1303091 () Bool)

(assert (=> b!1303091 (= e!743287 (+!4507 call!64180 (tuple2!22661 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1303092 () Bool)

(declare-fun Unit!42989 () Unit!42981)

(assert (=> b!1303092 (= e!743283 Unit!42989)))

(declare-fun bm!64179 () Bool)

(declare-fun call!64184 () ListLongMap!20317)

(assert (=> bm!64179 (= call!64184 call!64180)))

(declare-fun b!1303093 () Bool)

(declare-fun e!743286 () ListLongMap!20317)

(assert (=> b!1303093 (= e!743286 call!64184)))

(declare-fun b!1303094 () Bool)

(declare-fun c!125070 () Bool)

(assert (=> b!1303094 (= c!125070 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1303094 (= e!743284 e!743286)))

(declare-fun b!1303095 () Bool)

(assert (=> b!1303095 (= e!743286 call!64179)))

(declare-fun bm!64180 () Bool)

(assert (=> bm!64180 (= call!64183 call!64182)))

(declare-fun b!1303096 () Bool)

(assert (=> b!1303096 (= e!743284 call!64184)))

(declare-fun b!1303097 () Bool)

(declare-fun lt!582912 () Unit!42981)

(assert (=> b!1303097 (= e!743283 lt!582912)))

(declare-fun lt!582917 () ListLongMap!20317)

(assert (=> b!1303097 (= lt!582917 (getCurrentListMapNoExtraKeys!6139 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!582926 () (_ BitVec 64))

(assert (=> b!1303097 (= lt!582926 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!582920 () (_ BitVec 64))

(assert (=> b!1303097 (= lt!582920 (select (arr!41836 _keys!1741) from!2144))))

(declare-fun lt!582933 () Unit!42981)

(declare-fun addStillContains!1109 (ListLongMap!20317 (_ BitVec 64) V!51617 (_ BitVec 64)) Unit!42981)

(assert (=> b!1303097 (= lt!582933 (addStillContains!1109 lt!582917 lt!582926 zeroValue!1387 lt!582920))))

(assert (=> b!1303097 (contains!8236 (+!4507 lt!582917 (tuple2!22661 lt!582926 zeroValue!1387)) lt!582920)))

(declare-fun lt!582932 () Unit!42981)

(assert (=> b!1303097 (= lt!582932 lt!582933)))

(declare-fun lt!582913 () ListLongMap!20317)

(assert (=> b!1303097 (= lt!582913 (getCurrentListMapNoExtraKeys!6139 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!582914 () (_ BitVec 64))

(assert (=> b!1303097 (= lt!582914 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!582927 () (_ BitVec 64))

(assert (=> b!1303097 (= lt!582927 (select (arr!41836 _keys!1741) from!2144))))

(declare-fun lt!582916 () Unit!42981)

(declare-fun addApplyDifferent!552 (ListLongMap!20317 (_ BitVec 64) V!51617 (_ BitVec 64)) Unit!42981)

(assert (=> b!1303097 (= lt!582916 (addApplyDifferent!552 lt!582913 lt!582914 minValue!1387 lt!582927))))

(assert (=> b!1303097 (= (apply!1014 (+!4507 lt!582913 (tuple2!22661 lt!582914 minValue!1387)) lt!582927) (apply!1014 lt!582913 lt!582927))))

(declare-fun lt!582915 () Unit!42981)

(assert (=> b!1303097 (= lt!582915 lt!582916)))

(declare-fun lt!582918 () ListLongMap!20317)

(assert (=> b!1303097 (= lt!582918 (getCurrentListMapNoExtraKeys!6139 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!582923 () (_ BitVec 64))

(assert (=> b!1303097 (= lt!582923 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!582930 () (_ BitVec 64))

(assert (=> b!1303097 (= lt!582930 (select (arr!41836 _keys!1741) from!2144))))

(declare-fun lt!582931 () Unit!42981)

(assert (=> b!1303097 (= lt!582931 (addApplyDifferent!552 lt!582918 lt!582923 zeroValue!1387 lt!582930))))

(assert (=> b!1303097 (= (apply!1014 (+!4507 lt!582918 (tuple2!22661 lt!582923 zeroValue!1387)) lt!582930) (apply!1014 lt!582918 lt!582930))))

(declare-fun lt!582921 () Unit!42981)

(assert (=> b!1303097 (= lt!582921 lt!582931)))

(declare-fun lt!582925 () ListLongMap!20317)

(assert (=> b!1303097 (= lt!582925 (getCurrentListMapNoExtraKeys!6139 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!582919 () (_ BitVec 64))

(assert (=> b!1303097 (= lt!582919 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!582929 () (_ BitVec 64))

(assert (=> b!1303097 (= lt!582929 (select (arr!41836 _keys!1741) from!2144))))

(assert (=> b!1303097 (= lt!582912 (addApplyDifferent!552 lt!582925 lt!582919 minValue!1387 lt!582929))))

(assert (=> b!1303097 (= (apply!1014 (+!4507 lt!582925 (tuple2!22661 lt!582919 minValue!1387)) lt!582929) (apply!1014 lt!582925 lt!582929))))

(declare-fun bm!64181 () Bool)

(assert (=> bm!64181 (= call!64178 (contains!8236 lt!582928 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!141499 c!125066) b!1303091))

(assert (= (and d!141499 (not c!125066)) b!1303087))

(assert (= (and b!1303087 c!125071) b!1303096))

(assert (= (and b!1303087 (not c!125071)) b!1303094))

(assert (= (and b!1303094 c!125070) b!1303093))

(assert (= (and b!1303094 (not c!125070)) b!1303095))

(assert (= (or b!1303093 b!1303095) bm!64175))

(assert (= (or b!1303096 bm!64175) bm!64180))

(assert (= (or b!1303096 b!1303093) bm!64179))

(assert (= (or b!1303091 bm!64180) bm!64176))

(assert (= (or b!1303091 bm!64179) bm!64178))

(assert (= (and d!141499 res!865503) b!1303083))

(assert (= (and d!141499 c!125068) b!1303097))

(assert (= (and d!141499 (not c!125068)) b!1303092))

(assert (= (and d!141499 res!865500) b!1303078))

(assert (= (and b!1303078 res!865506) b!1303077))

(assert (= (and b!1303078 (not res!865501)) b!1303088))

(assert (= (and b!1303088 res!865508) b!1303084))

(assert (= (and b!1303078 res!865507) b!1303079))

(assert (= (and b!1303079 c!125067) b!1303089))

(assert (= (and b!1303079 (not c!125067)) b!1303085))

(assert (= (and b!1303089 res!865504) b!1303081))

(assert (= (or b!1303089 b!1303085) bm!64181))

(assert (= (and b!1303079 res!865502) b!1303080))

(assert (= (and b!1303080 c!125069) b!1303090))

(assert (= (and b!1303080 (not c!125069)) b!1303082))

(assert (= (and b!1303090 res!865505) b!1303086))

(assert (= (or b!1303090 b!1303082) bm!64177))

(declare-fun b_lambda!23253 () Bool)

(assert (=> (not b_lambda!23253) (not b!1303084)))

(declare-fun t!43362 () Bool)

(declare-fun tb!11389 () Bool)

(assert (=> (and start!110022 (= defaultEntry!1448 defaultEntry!1448) t!43362) tb!11389))

(declare-fun result!23805 () Bool)

(assert (=> tb!11389 (= result!23805 tp_is_empty!34885)))

(assert (=> b!1303084 t!43362))

(declare-fun b_and!47391 () Bool)

(assert (= b_and!47385 (and (=> t!43362 result!23805) b_and!47391)))

(assert (=> b!1303083 m!1193323))

(assert (=> b!1303083 m!1193323))

(assert (=> b!1303083 m!1193325))

(declare-fun m!1193483 () Bool)

(assert (=> bm!64177 m!1193483))

(assert (=> b!1303088 m!1193323))

(assert (=> b!1303088 m!1193323))

(declare-fun m!1193485 () Bool)

(assert (=> b!1303088 m!1193485))

(declare-fun m!1193487 () Bool)

(assert (=> bm!64178 m!1193487))

(declare-fun m!1193489 () Bool)

(assert (=> bm!64181 m!1193489))

(assert (=> d!141499 m!1193353))

(declare-fun m!1193491 () Bool)

(assert (=> b!1303091 m!1193491))

(assert (=> bm!64176 m!1193343))

(assert (=> b!1303084 m!1193323))

(declare-fun m!1193493 () Bool)

(assert (=> b!1303084 m!1193493))

(declare-fun m!1193495 () Bool)

(assert (=> b!1303084 m!1193495))

(declare-fun m!1193497 () Bool)

(assert (=> b!1303084 m!1193497))

(assert (=> b!1303084 m!1193495))

(declare-fun m!1193499 () Bool)

(assert (=> b!1303084 m!1193499))

(assert (=> b!1303084 m!1193323))

(assert (=> b!1303084 m!1193497))

(declare-fun m!1193501 () Bool)

(assert (=> b!1303097 m!1193501))

(declare-fun m!1193503 () Bool)

(assert (=> b!1303097 m!1193503))

(declare-fun m!1193505 () Bool)

(assert (=> b!1303097 m!1193505))

(declare-fun m!1193507 () Bool)

(assert (=> b!1303097 m!1193507))

(declare-fun m!1193509 () Bool)

(assert (=> b!1303097 m!1193509))

(assert (=> b!1303097 m!1193343))

(declare-fun m!1193511 () Bool)

(assert (=> b!1303097 m!1193511))

(declare-fun m!1193513 () Bool)

(assert (=> b!1303097 m!1193513))

(declare-fun m!1193515 () Bool)

(assert (=> b!1303097 m!1193515))

(assert (=> b!1303097 m!1193505))

(declare-fun m!1193517 () Bool)

(assert (=> b!1303097 m!1193517))

(declare-fun m!1193519 () Bool)

(assert (=> b!1303097 m!1193519))

(declare-fun m!1193521 () Bool)

(assert (=> b!1303097 m!1193521))

(declare-fun m!1193523 () Bool)

(assert (=> b!1303097 m!1193523))

(declare-fun m!1193525 () Bool)

(assert (=> b!1303097 m!1193525))

(assert (=> b!1303097 m!1193521))

(declare-fun m!1193527 () Bool)

(assert (=> b!1303097 m!1193527))

(assert (=> b!1303097 m!1193507))

(declare-fun m!1193529 () Bool)

(assert (=> b!1303097 m!1193529))

(assert (=> b!1303097 m!1193513))

(assert (=> b!1303097 m!1193323))

(declare-fun m!1193531 () Bool)

(assert (=> b!1303081 m!1193531))

(assert (=> b!1303077 m!1193323))

(assert (=> b!1303077 m!1193323))

(assert (=> b!1303077 m!1193325))

(declare-fun m!1193533 () Bool)

(assert (=> b!1303086 m!1193533))

(assert (=> b!1302917 d!141499))

(declare-fun d!141501 () Bool)

(declare-fun e!743296 () Bool)

(assert (=> d!141501 e!743296))

(declare-fun res!865513 () Bool)

(assert (=> d!141501 (=> (not res!865513) (not e!743296))))

(declare-fun lt!582944 () ListLongMap!20317)

(assert (=> d!141501 (= res!865513 (contains!8236 lt!582944 (_1!11341 lt!582800)))))

(declare-fun lt!582942 () List!29773)

(assert (=> d!141501 (= lt!582944 (ListLongMap!20318 lt!582942))))

(declare-fun lt!582945 () Unit!42981)

(declare-fun lt!582943 () Unit!42981)

(assert (=> d!141501 (= lt!582945 lt!582943)))

(assert (=> d!141501 (= (getValueByKey!707 lt!582942 (_1!11341 lt!582800)) (Some!757 (_2!11341 lt!582800)))))

(declare-fun lemmaContainsTupThenGetReturnValue!351 (List!29773 (_ BitVec 64) V!51617) Unit!42981)

(assert (=> d!141501 (= lt!582943 (lemmaContainsTupThenGetReturnValue!351 lt!582942 (_1!11341 lt!582800) (_2!11341 lt!582800)))))

(declare-fun insertStrictlySorted!480 (List!29773 (_ BitVec 64) V!51617) List!29773)

(assert (=> d!141501 (= lt!582942 (insertStrictlySorted!480 (toList!10174 lt!582802) (_1!11341 lt!582800) (_2!11341 lt!582800)))))

(assert (=> d!141501 (= (+!4507 lt!582802 lt!582800) lt!582944)))

(declare-fun b!1303104 () Bool)

(declare-fun res!865514 () Bool)

(assert (=> b!1303104 (=> (not res!865514) (not e!743296))))

(assert (=> b!1303104 (= res!865514 (= (getValueByKey!707 (toList!10174 lt!582944) (_1!11341 lt!582800)) (Some!757 (_2!11341 lt!582800))))))

(declare-fun b!1303105 () Bool)

(declare-fun contains!8240 (List!29773 tuple2!22660) Bool)

(assert (=> b!1303105 (= e!743296 (contains!8240 (toList!10174 lt!582944) lt!582800))))

(assert (= (and d!141501 res!865513) b!1303104))

(assert (= (and b!1303104 res!865514) b!1303105))

(declare-fun m!1193535 () Bool)

(assert (=> d!141501 m!1193535))

(declare-fun m!1193537 () Bool)

(assert (=> d!141501 m!1193537))

(declare-fun m!1193539 () Bool)

(assert (=> d!141501 m!1193539))

(declare-fun m!1193541 () Bool)

(assert (=> d!141501 m!1193541))

(declare-fun m!1193543 () Bool)

(assert (=> b!1303104 m!1193543))

(declare-fun m!1193545 () Bool)

(assert (=> b!1303105 m!1193545))

(assert (=> b!1302912 d!141501))

(declare-fun d!141503 () Bool)

(assert (=> d!141503 (not (contains!8236 (+!4507 lt!582799 (tuple2!22661 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!582948 () Unit!42981)

(declare-fun choose!1929 (ListLongMap!20317 (_ BitVec 64) V!51617 (_ BitVec 64)) Unit!42981)

(assert (=> d!141503 (= lt!582948 (choose!1929 lt!582799 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun e!743299 () Bool)

(assert (=> d!141503 e!743299))

(declare-fun res!865517 () Bool)

(assert (=> d!141503 (=> (not res!865517) (not e!743299))))

(assert (=> d!141503 (= res!865517 (not (contains!8236 lt!582799 k0!1205)))))

(assert (=> d!141503 (= (addStillNotContains!460 lt!582799 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205) lt!582948)))

(declare-fun b!1303109 () Bool)

(assert (=> b!1303109 (= e!743299 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!1205)))))

(assert (= (and d!141503 res!865517) b!1303109))

(assert (=> d!141503 m!1193333))

(assert (=> d!141503 m!1193333))

(declare-fun m!1193547 () Bool)

(assert (=> d!141503 m!1193547))

(declare-fun m!1193549 () Bool)

(assert (=> d!141503 m!1193549))

(declare-fun m!1193551 () Bool)

(assert (=> d!141503 m!1193551))

(assert (=> b!1302912 d!141503))

(declare-fun d!141505 () Bool)

(declare-fun e!743300 () Bool)

(assert (=> d!141505 e!743300))

(declare-fun res!865518 () Bool)

(assert (=> d!141505 (=> res!865518 e!743300)))

(declare-fun lt!582950 () Bool)

(assert (=> d!141505 (= res!865518 (not lt!582950))))

(declare-fun lt!582951 () Bool)

(assert (=> d!141505 (= lt!582950 lt!582951)))

(declare-fun lt!582952 () Unit!42981)

(declare-fun e!743301 () Unit!42981)

(assert (=> d!141505 (= lt!582952 e!743301)))

(declare-fun c!125072 () Bool)

(assert (=> d!141505 (= c!125072 lt!582951)))

(assert (=> d!141505 (= lt!582951 (containsKey!724 (toList!10174 lt!582802) k0!1205))))

(assert (=> d!141505 (= (contains!8236 lt!582802 k0!1205) lt!582950)))

(declare-fun b!1303110 () Bool)

(declare-fun lt!582949 () Unit!42981)

(assert (=> b!1303110 (= e!743301 lt!582949)))

(assert (=> b!1303110 (= lt!582949 (lemmaContainsKeyImpliesGetValueByKeyDefined!471 (toList!10174 lt!582802) k0!1205))))

(assert (=> b!1303110 (isDefined!514 (getValueByKey!707 (toList!10174 lt!582802) k0!1205))))

(declare-fun b!1303111 () Bool)

(declare-fun Unit!42990 () Unit!42981)

(assert (=> b!1303111 (= e!743301 Unit!42990)))

(declare-fun b!1303112 () Bool)

(assert (=> b!1303112 (= e!743300 (isDefined!514 (getValueByKey!707 (toList!10174 lt!582802) k0!1205)))))

(assert (= (and d!141505 c!125072) b!1303110))

(assert (= (and d!141505 (not c!125072)) b!1303111))

(assert (= (and d!141505 (not res!865518)) b!1303112))

(declare-fun m!1193553 () Bool)

(assert (=> d!141505 m!1193553))

(declare-fun m!1193555 () Bool)

(assert (=> b!1303110 m!1193555))

(declare-fun m!1193557 () Bool)

(assert (=> b!1303110 m!1193557))

(assert (=> b!1303110 m!1193557))

(declare-fun m!1193559 () Bool)

(assert (=> b!1303110 m!1193559))

(assert (=> b!1303112 m!1193557))

(assert (=> b!1303112 m!1193557))

(assert (=> b!1303112 m!1193559))

(assert (=> b!1302912 d!141505))

(declare-fun d!141507 () Bool)

(assert (=> d!141507 (not (contains!8236 (+!4507 lt!582799 (tuple2!22661 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!582953 () Unit!42981)

(assert (=> d!141507 (= lt!582953 (choose!1929 lt!582799 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun e!743302 () Bool)

(assert (=> d!141507 e!743302))

(declare-fun res!865519 () Bool)

(assert (=> d!141507 (=> (not res!865519) (not e!743302))))

(assert (=> d!141507 (= res!865519 (not (contains!8236 lt!582799 k0!1205)))))

(assert (=> d!141507 (= (addStillNotContains!460 lt!582799 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205) lt!582953)))

(declare-fun b!1303113 () Bool)

(assert (=> b!1303113 (= e!743302 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!1205)))))

(assert (= (and d!141507 res!865519) b!1303113))

(declare-fun m!1193561 () Bool)

(assert (=> d!141507 m!1193561))

(assert (=> d!141507 m!1193561))

(declare-fun m!1193563 () Bool)

(assert (=> d!141507 m!1193563))

(declare-fun m!1193565 () Bool)

(assert (=> d!141507 m!1193565))

(assert (=> d!141507 m!1193551))

(assert (=> b!1302912 d!141507))

(declare-fun d!141509 () Bool)

(declare-fun e!743303 () Bool)

(assert (=> d!141509 e!743303))

(declare-fun res!865520 () Bool)

(assert (=> d!141509 (=> res!865520 e!743303)))

(declare-fun lt!582955 () Bool)

(assert (=> d!141509 (= res!865520 (not lt!582955))))

(declare-fun lt!582956 () Bool)

(assert (=> d!141509 (= lt!582955 lt!582956)))

(declare-fun lt!582957 () Unit!42981)

(declare-fun e!743304 () Unit!42981)

(assert (=> d!141509 (= lt!582957 e!743304)))

(declare-fun c!125073 () Bool)

(assert (=> d!141509 (= c!125073 lt!582956)))

(assert (=> d!141509 (= lt!582956 (containsKey!724 (toList!10174 (+!4507 lt!582802 lt!582800)) k0!1205))))

(assert (=> d!141509 (= (contains!8236 (+!4507 lt!582802 lt!582800) k0!1205) lt!582955)))

(declare-fun b!1303114 () Bool)

(declare-fun lt!582954 () Unit!42981)

(assert (=> b!1303114 (= e!743304 lt!582954)))

(assert (=> b!1303114 (= lt!582954 (lemmaContainsKeyImpliesGetValueByKeyDefined!471 (toList!10174 (+!4507 lt!582802 lt!582800)) k0!1205))))

(assert (=> b!1303114 (isDefined!514 (getValueByKey!707 (toList!10174 (+!4507 lt!582802 lt!582800)) k0!1205))))

(declare-fun b!1303115 () Bool)

(declare-fun Unit!42991 () Unit!42981)

(assert (=> b!1303115 (= e!743304 Unit!42991)))

(declare-fun b!1303116 () Bool)

(assert (=> b!1303116 (= e!743303 (isDefined!514 (getValueByKey!707 (toList!10174 (+!4507 lt!582802 lt!582800)) k0!1205)))))

(assert (= (and d!141509 c!125073) b!1303114))

(assert (= (and d!141509 (not c!125073)) b!1303115))

(assert (= (and d!141509 (not res!865520)) b!1303116))

(declare-fun m!1193567 () Bool)

(assert (=> d!141509 m!1193567))

(declare-fun m!1193569 () Bool)

(assert (=> b!1303114 m!1193569))

(declare-fun m!1193571 () Bool)

(assert (=> b!1303114 m!1193571))

(assert (=> b!1303114 m!1193571))

(declare-fun m!1193573 () Bool)

(assert (=> b!1303114 m!1193573))

(assert (=> b!1303116 m!1193571))

(assert (=> b!1303116 m!1193571))

(assert (=> b!1303116 m!1193573))

(assert (=> b!1302912 d!141509))

(declare-fun d!141511 () Bool)

(declare-fun e!743305 () Bool)

(assert (=> d!141511 e!743305))

(declare-fun res!865521 () Bool)

(assert (=> d!141511 (=> (not res!865521) (not e!743305))))

(declare-fun lt!582960 () ListLongMap!20317)

(assert (=> d!141511 (= res!865521 (contains!8236 lt!582960 (_1!11341 lt!582800)))))

(declare-fun lt!582958 () List!29773)

(assert (=> d!141511 (= lt!582960 (ListLongMap!20318 lt!582958))))

(declare-fun lt!582961 () Unit!42981)

(declare-fun lt!582959 () Unit!42981)

(assert (=> d!141511 (= lt!582961 lt!582959)))

(assert (=> d!141511 (= (getValueByKey!707 lt!582958 (_1!11341 lt!582800)) (Some!757 (_2!11341 lt!582800)))))

(assert (=> d!141511 (= lt!582959 (lemmaContainsTupThenGetReturnValue!351 lt!582958 (_1!11341 lt!582800) (_2!11341 lt!582800)))))

(assert (=> d!141511 (= lt!582958 (insertStrictlySorted!480 (toList!10174 lt!582799) (_1!11341 lt!582800) (_2!11341 lt!582800)))))

(assert (=> d!141511 (= (+!4507 lt!582799 lt!582800) lt!582960)))

(declare-fun b!1303117 () Bool)

(declare-fun res!865522 () Bool)

(assert (=> b!1303117 (=> (not res!865522) (not e!743305))))

(assert (=> b!1303117 (= res!865522 (= (getValueByKey!707 (toList!10174 lt!582960) (_1!11341 lt!582800)) (Some!757 (_2!11341 lt!582800))))))

(declare-fun b!1303118 () Bool)

(assert (=> b!1303118 (= e!743305 (contains!8240 (toList!10174 lt!582960) lt!582800))))

(assert (= (and d!141511 res!865521) b!1303117))

(assert (= (and b!1303117 res!865522) b!1303118))

(declare-fun m!1193575 () Bool)

(assert (=> d!141511 m!1193575))

(declare-fun m!1193577 () Bool)

(assert (=> d!141511 m!1193577))

(declare-fun m!1193579 () Bool)

(assert (=> d!141511 m!1193579))

(declare-fun m!1193581 () Bool)

(assert (=> d!141511 m!1193581))

(declare-fun m!1193583 () Bool)

(assert (=> b!1303117 m!1193583))

(declare-fun m!1193585 () Bool)

(assert (=> b!1303118 m!1193585))

(assert (=> b!1302912 d!141511))

(declare-fun d!141513 () Bool)

(declare-fun e!743306 () Bool)

(assert (=> d!141513 e!743306))

(declare-fun res!865523 () Bool)

(assert (=> d!141513 (=> (not res!865523) (not e!743306))))

(declare-fun lt!582964 () ListLongMap!20317)

(assert (=> d!141513 (= res!865523 (contains!8236 lt!582964 (_1!11341 (tuple2!22661 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lt!582962 () List!29773)

(assert (=> d!141513 (= lt!582964 (ListLongMap!20318 lt!582962))))

(declare-fun lt!582965 () Unit!42981)

(declare-fun lt!582963 () Unit!42981)

(assert (=> d!141513 (= lt!582965 lt!582963)))

(assert (=> d!141513 (= (getValueByKey!707 lt!582962 (_1!11341 (tuple2!22661 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!757 (_2!11341 (tuple2!22661 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!141513 (= lt!582963 (lemmaContainsTupThenGetReturnValue!351 lt!582962 (_1!11341 (tuple2!22661 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11341 (tuple2!22661 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!141513 (= lt!582962 (insertStrictlySorted!480 (toList!10174 lt!582799) (_1!11341 (tuple2!22661 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11341 (tuple2!22661 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!141513 (= (+!4507 lt!582799 (tuple2!22661 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) lt!582964)))

(declare-fun b!1303119 () Bool)

(declare-fun res!865524 () Bool)

(assert (=> b!1303119 (=> (not res!865524) (not e!743306))))

(assert (=> b!1303119 (= res!865524 (= (getValueByKey!707 (toList!10174 lt!582964) (_1!11341 (tuple2!22661 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!757 (_2!11341 (tuple2!22661 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(declare-fun b!1303120 () Bool)

(assert (=> b!1303120 (= e!743306 (contains!8240 (toList!10174 lt!582964) (tuple2!22661 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(assert (= (and d!141513 res!865523) b!1303119))

(assert (= (and b!1303119 res!865524) b!1303120))

(declare-fun m!1193587 () Bool)

(assert (=> d!141513 m!1193587))

(declare-fun m!1193589 () Bool)

(assert (=> d!141513 m!1193589))

(declare-fun m!1193591 () Bool)

(assert (=> d!141513 m!1193591))

(declare-fun m!1193593 () Bool)

(assert (=> d!141513 m!1193593))

(declare-fun m!1193595 () Bool)

(assert (=> b!1303119 m!1193595))

(declare-fun m!1193597 () Bool)

(assert (=> b!1303120 m!1193597))

(assert (=> b!1302912 d!141513))

(declare-fun bm!64184 () Bool)

(declare-fun call!64187 () ListLongMap!20317)

(assert (=> bm!64184 (= call!64187 (getCurrentListMapNoExtraKeys!6139 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun b!1303145 () Bool)

(declare-fun e!743326 () ListLongMap!20317)

(assert (=> b!1303145 (= e!743326 (ListLongMap!20318 Nil!29770))))

(declare-fun b!1303146 () Bool)

(declare-fun e!743322 () Bool)

(declare-fun e!743327 () Bool)

(assert (=> b!1303146 (= e!743322 e!743327)))

(declare-fun c!125085 () Bool)

(declare-fun e!743323 () Bool)

(assert (=> b!1303146 (= c!125085 e!743323)))

(declare-fun res!865536 () Bool)

(assert (=> b!1303146 (=> (not res!865536) (not e!743323))))

(assert (=> b!1303146 (= res!865536 (bvslt from!2144 (size!42388 _keys!1741)))))

(declare-fun b!1303147 () Bool)

(declare-fun e!743324 () ListLongMap!20317)

(assert (=> b!1303147 (= e!743326 e!743324)))

(declare-fun c!125082 () Bool)

(assert (=> b!1303147 (= c!125082 (validKeyInArray!0 (select (arr!41836 _keys!1741) from!2144)))))

(declare-fun b!1303148 () Bool)

(declare-fun lt!582980 () Unit!42981)

(declare-fun lt!582984 () Unit!42981)

(assert (=> b!1303148 (= lt!582980 lt!582984)))

(declare-fun lt!582986 () ListLongMap!20317)

(declare-fun lt!582985 () (_ BitVec 64))

(declare-fun lt!582983 () (_ BitVec 64))

(declare-fun lt!582981 () V!51617)

(assert (=> b!1303148 (not (contains!8236 (+!4507 lt!582986 (tuple2!22661 lt!582985 lt!582981)) lt!582983))))

(assert (=> b!1303148 (= lt!582984 (addStillNotContains!460 lt!582986 lt!582985 lt!582981 lt!582983))))

(assert (=> b!1303148 (= lt!582983 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1303148 (= lt!582981 (get!21157 (select (arr!41835 _values!1445) from!2144) (dynLambda!3452 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1303148 (= lt!582985 (select (arr!41836 _keys!1741) from!2144))))

(assert (=> b!1303148 (= lt!582986 call!64187)))

(assert (=> b!1303148 (= e!743324 (+!4507 call!64187 (tuple2!22661 (select (arr!41836 _keys!1741) from!2144) (get!21157 (select (arr!41835 _values!1445) from!2144) (dynLambda!3452 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1303149 () Bool)

(declare-fun lt!582982 () ListLongMap!20317)

(declare-fun e!743325 () Bool)

(assert (=> b!1303149 (= e!743325 (= lt!582982 (getCurrentListMapNoExtraKeys!6139 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun b!1303150 () Bool)

(declare-fun e!743321 () Bool)

(assert (=> b!1303150 (= e!743327 e!743321)))

(assert (=> b!1303150 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42388 _keys!1741)))))

(declare-fun res!865535 () Bool)

(assert (=> b!1303150 (= res!865535 (contains!8236 lt!582982 (select (arr!41836 _keys!1741) from!2144)))))

(assert (=> b!1303150 (=> (not res!865535) (not e!743321))))

(declare-fun b!1303151 () Bool)

(assert (=> b!1303151 (= e!743327 e!743325)))

(declare-fun c!125084 () Bool)

(assert (=> b!1303151 (= c!125084 (bvslt from!2144 (size!42388 _keys!1741)))))

(declare-fun d!141515 () Bool)

(assert (=> d!141515 e!743322))

(declare-fun res!865533 () Bool)

(assert (=> d!141515 (=> (not res!865533) (not e!743322))))

(assert (=> d!141515 (= res!865533 (not (contains!8236 lt!582982 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!141515 (= lt!582982 e!743326)))

(declare-fun c!125083 () Bool)

(assert (=> d!141515 (= c!125083 (bvsge from!2144 (size!42388 _keys!1741)))))

(assert (=> d!141515 (validMask!0 mask!2175)))

(assert (=> d!141515 (= (getCurrentListMapNoExtraKeys!6139 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!582982)))

(declare-fun b!1303152 () Bool)

(declare-fun res!865534 () Bool)

(assert (=> b!1303152 (=> (not res!865534) (not e!743322))))

(assert (=> b!1303152 (= res!865534 (not (contains!8236 lt!582982 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1303153 () Bool)

(assert (=> b!1303153 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42388 _keys!1741)))))

(assert (=> b!1303153 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42387 _values!1445)))))

(assert (=> b!1303153 (= e!743321 (= (apply!1014 lt!582982 (select (arr!41836 _keys!1741) from!2144)) (get!21157 (select (arr!41835 _values!1445) from!2144) (dynLambda!3452 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1303154 () Bool)

(assert (=> b!1303154 (= e!743323 (validKeyInArray!0 (select (arr!41836 _keys!1741) from!2144)))))

(assert (=> b!1303154 (bvsge from!2144 #b00000000000000000000000000000000)))

(declare-fun b!1303155 () Bool)

(declare-fun isEmpty!1067 (ListLongMap!20317) Bool)

(assert (=> b!1303155 (= e!743325 (isEmpty!1067 lt!582982))))

(declare-fun b!1303156 () Bool)

(assert (=> b!1303156 (= e!743324 call!64187)))

(assert (= (and d!141515 c!125083) b!1303145))

(assert (= (and d!141515 (not c!125083)) b!1303147))

(assert (= (and b!1303147 c!125082) b!1303148))

(assert (= (and b!1303147 (not c!125082)) b!1303156))

(assert (= (or b!1303148 b!1303156) bm!64184))

(assert (= (and d!141515 res!865533) b!1303152))

(assert (= (and b!1303152 res!865534) b!1303146))

(assert (= (and b!1303146 res!865536) b!1303154))

(assert (= (and b!1303146 c!125085) b!1303150))

(assert (= (and b!1303146 (not c!125085)) b!1303151))

(assert (= (and b!1303150 res!865535) b!1303153))

(assert (= (and b!1303151 c!125084) b!1303149))

(assert (= (and b!1303151 (not c!125084)) b!1303155))

(declare-fun b_lambda!23255 () Bool)

(assert (=> (not b_lambda!23255) (not b!1303148)))

(assert (=> b!1303148 t!43362))

(declare-fun b_and!47393 () Bool)

(assert (= b_and!47391 (and (=> t!43362 result!23805) b_and!47393)))

(declare-fun b_lambda!23257 () Bool)

(assert (=> (not b_lambda!23257) (not b!1303153)))

(assert (=> b!1303153 t!43362))

(declare-fun b_and!47395 () Bool)

(assert (= b_and!47393 (and (=> t!43362 result!23805) b_and!47395)))

(declare-fun m!1193599 () Bool)

(assert (=> bm!64184 m!1193599))

(declare-fun m!1193601 () Bool)

(assert (=> b!1303155 m!1193601))

(declare-fun m!1193603 () Bool)

(assert (=> d!141515 m!1193603))

(assert (=> d!141515 m!1193353))

(assert (=> b!1303147 m!1193323))

(assert (=> b!1303147 m!1193323))

(assert (=> b!1303147 m!1193325))

(assert (=> b!1303150 m!1193323))

(assert (=> b!1303150 m!1193323))

(declare-fun m!1193605 () Bool)

(assert (=> b!1303150 m!1193605))

(assert (=> b!1303154 m!1193323))

(assert (=> b!1303154 m!1193323))

(assert (=> b!1303154 m!1193325))

(assert (=> b!1303149 m!1193599))

(assert (=> b!1303153 m!1193495))

(assert (=> b!1303153 m!1193497))

(assert (=> b!1303153 m!1193495))

(assert (=> b!1303153 m!1193499))

(assert (=> b!1303153 m!1193323))

(declare-fun m!1193607 () Bool)

(assert (=> b!1303153 m!1193607))

(assert (=> b!1303153 m!1193323))

(assert (=> b!1303153 m!1193497))

(declare-fun m!1193609 () Bool)

(assert (=> b!1303152 m!1193609))

(declare-fun m!1193611 () Bool)

(assert (=> b!1303148 m!1193611))

(declare-fun m!1193613 () Bool)

(assert (=> b!1303148 m!1193613))

(assert (=> b!1303148 m!1193495))

(declare-fun m!1193615 () Bool)

(assert (=> b!1303148 m!1193615))

(assert (=> b!1303148 m!1193611))

(assert (=> b!1303148 m!1193323))

(assert (=> b!1303148 m!1193497))

(assert (=> b!1303148 m!1193497))

(assert (=> b!1303148 m!1193495))

(assert (=> b!1303148 m!1193499))

(declare-fun m!1193617 () Bool)

(assert (=> b!1303148 m!1193617))

(assert (=> b!1302912 d!141515))

(declare-fun d!141517 () Bool)

(declare-fun e!743328 () Bool)

(assert (=> d!141517 e!743328))

(declare-fun res!865537 () Bool)

(assert (=> d!141517 (=> res!865537 e!743328)))

(declare-fun lt!582988 () Bool)

(assert (=> d!141517 (= res!865537 (not lt!582988))))

(declare-fun lt!582989 () Bool)

(assert (=> d!141517 (= lt!582988 lt!582989)))

(declare-fun lt!582990 () Unit!42981)

(declare-fun e!743329 () Unit!42981)

(assert (=> d!141517 (= lt!582990 e!743329)))

(declare-fun c!125086 () Bool)

(assert (=> d!141517 (= c!125086 lt!582989)))

(assert (=> d!141517 (= lt!582989 (containsKey!724 (toList!10174 (+!4507 lt!582799 lt!582800)) k0!1205))))

(assert (=> d!141517 (= (contains!8236 (+!4507 lt!582799 lt!582800) k0!1205) lt!582988)))

(declare-fun b!1303157 () Bool)

(declare-fun lt!582987 () Unit!42981)

(assert (=> b!1303157 (= e!743329 lt!582987)))

(assert (=> b!1303157 (= lt!582987 (lemmaContainsKeyImpliesGetValueByKeyDefined!471 (toList!10174 (+!4507 lt!582799 lt!582800)) k0!1205))))

(assert (=> b!1303157 (isDefined!514 (getValueByKey!707 (toList!10174 (+!4507 lt!582799 lt!582800)) k0!1205))))

(declare-fun b!1303158 () Bool)

(declare-fun Unit!42992 () Unit!42981)

(assert (=> b!1303158 (= e!743329 Unit!42992)))

(declare-fun b!1303159 () Bool)

(assert (=> b!1303159 (= e!743328 (isDefined!514 (getValueByKey!707 (toList!10174 (+!4507 lt!582799 lt!582800)) k0!1205)))))

(assert (= (and d!141517 c!125086) b!1303157))

(assert (= (and d!141517 (not c!125086)) b!1303158))

(assert (= (and d!141517 (not res!865537)) b!1303159))

(declare-fun m!1193619 () Bool)

(assert (=> d!141517 m!1193619))

(declare-fun m!1193621 () Bool)

(assert (=> b!1303157 m!1193621))

(declare-fun m!1193623 () Bool)

(assert (=> b!1303157 m!1193623))

(assert (=> b!1303157 m!1193623))

(declare-fun m!1193625 () Bool)

(assert (=> b!1303157 m!1193625))

(assert (=> b!1303159 m!1193623))

(assert (=> b!1303159 m!1193623))

(assert (=> b!1303159 m!1193625))

(assert (=> b!1302912 d!141517))

(declare-fun d!141519 () Bool)

(assert (=> d!141519 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!110022 d!141519))

(declare-fun d!141521 () Bool)

(assert (=> d!141521 (= (array_inv!31821 _values!1445) (bvsge (size!42387 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!110022 d!141521))

(declare-fun d!141523 () Bool)

(assert (=> d!141523 (= (array_inv!31822 _keys!1741) (bvsge (size!42388 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!110022 d!141523))

(declare-fun b!1303167 () Bool)

(declare-fun e!743334 () Bool)

(assert (=> b!1303167 (= e!743334 tp_is_empty!34885)))

(declare-fun mapIsEmpty!53926 () Bool)

(declare-fun mapRes!53926 () Bool)

(assert (=> mapIsEmpty!53926 mapRes!53926))

(declare-fun b!1303166 () Bool)

(declare-fun e!743335 () Bool)

(assert (=> b!1303166 (= e!743335 tp_is_empty!34885)))

(declare-fun mapNonEmpty!53926 () Bool)

(declare-fun tp!102899 () Bool)

(assert (=> mapNonEmpty!53926 (= mapRes!53926 (and tp!102899 e!743335))))

(declare-fun mapKey!53926 () (_ BitVec 32))

(declare-fun mapValue!53926 () ValueCell!16544)

(declare-fun mapRest!53926 () (Array (_ BitVec 32) ValueCell!16544))

(assert (=> mapNonEmpty!53926 (= mapRest!53917 (store mapRest!53926 mapKey!53926 mapValue!53926))))

(declare-fun condMapEmpty!53926 () Bool)

(declare-fun mapDefault!53926 () ValueCell!16544)

(assert (=> mapNonEmpty!53917 (= condMapEmpty!53926 (= mapRest!53917 ((as const (Array (_ BitVec 32) ValueCell!16544)) mapDefault!53926)))))

(assert (=> mapNonEmpty!53917 (= tp!102884 (and e!743334 mapRes!53926))))

(assert (= (and mapNonEmpty!53917 condMapEmpty!53926) mapIsEmpty!53926))

(assert (= (and mapNonEmpty!53917 (not condMapEmpty!53926)) mapNonEmpty!53926))

(assert (= (and mapNonEmpty!53926 ((_ is ValueCellFull!16544) mapValue!53926)) b!1303166))

(assert (= (and mapNonEmpty!53917 ((_ is ValueCellFull!16544) mapDefault!53926)) b!1303167))

(declare-fun m!1193627 () Bool)

(assert (=> mapNonEmpty!53926 m!1193627))

(declare-fun b_lambda!23259 () Bool)

(assert (= b_lambda!23253 (or (and start!110022 b_free!29245) b_lambda!23259)))

(declare-fun b_lambda!23261 () Bool)

(assert (= b_lambda!23255 (or (and start!110022 b_free!29245) b_lambda!23261)))

(declare-fun b_lambda!23263 () Bool)

(assert (= b_lambda!23257 (or (and start!110022 b_free!29245) b_lambda!23263)))

(check-sat (not b!1303002) (not d!141507) (not b!1303084) (not b!1303148) (not d!141497) (not d!141515) (not b!1303157) (not bm!64176) (not b!1303104) (not b!1303081) (not b!1303147) (not b!1303032) (not bm!64160) (not b!1303083) (not d!141511) (not b!1303155) (not b_lambda!23261) (not b!1303112) (not bm!64184) (not b!1303120) (not b!1303004) tp_is_empty!34885 (not b!1303150) (not d!141489) (not b!1303159) (not mapNonEmpty!53926) (not bm!64181) (not b!1303077) (not b!1303029) (not d!141501) (not b_lambda!23259) (not d!141505) (not b_lambda!23263) (not b!1303149) (not d!141513) (not b!1303152) (not b!1303088) (not d!141499) (not b!1303116) (not b!1303091) (not b!1303086) (not b!1303117) b_and!47395 (not b!1303013) (not d!141517) (not b!1303154) (not b!1303118) (not b!1303114) (not bm!64178) (not b!1303097) (not b_next!29245) (not b!1303110) (not b!1303105) (not b!1303153) (not b!1303031) (not bm!64177) (not b!1303028) (not d!141509) (not d!141487) (not b!1303014) (not bm!64157) (not b!1303119) (not d!141503) (not b!1303034))
(check-sat b_and!47395 (not b_next!29245))
