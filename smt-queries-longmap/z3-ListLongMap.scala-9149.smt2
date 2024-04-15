; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109734 () Bool)

(assert start!109734)

(declare-fun b_free!29167 () Bool)

(declare-fun b_next!29167 () Bool)

(assert (=> start!109734 (= b_free!29167 (not b_next!29167))))

(declare-fun tp!102630 () Bool)

(declare-fun b_and!47251 () Bool)

(assert (=> start!109734 (= tp!102630 b_and!47251)))

(declare-fun b!1299788 () Bool)

(declare-fun res!863796 () Bool)

(declare-fun e!741482 () Bool)

(assert (=> b!1299788 (=> (not res!863796) (not e!741482))))

(declare-datatypes ((V!51513 0))(
  ( (V!51514 (val!17478 Int)) )
))
(declare-fun minValue!1387 () V!51513)

(declare-fun zeroValue!1387 () V!51513)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16505 0))(
  ( (ValueCellFull!16505 (v!20083 V!51513)) (EmptyCell!16505) )
))
(declare-datatypes ((array!86521 0))(
  ( (array!86522 (arr!41759 (Array (_ BitVec 32) ValueCell!16505)) (size!42311 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86521)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86523 0))(
  ( (array!86524 (arr!41760 (Array (_ BitVec 32) (_ BitVec 64))) (size!42312 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86523)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22588 0))(
  ( (tuple2!22589 (_1!11305 (_ BitVec 64)) (_2!11305 V!51513)) )
))
(declare-datatypes ((List!29707 0))(
  ( (Nil!29704) (Cons!29703 (h!30912 tuple2!22588) (t!43269 List!29707)) )
))
(declare-datatypes ((ListLongMap!20245 0))(
  ( (ListLongMap!20246 (toList!10138 List!29707)) )
))
(declare-fun contains!8190 (ListLongMap!20245 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5053 (array!86523 array!86521 (_ BitVec 32) (_ BitVec 32) V!51513 V!51513 (_ BitVec 32) Int) ListLongMap!20245)

(assert (=> b!1299788 (= res!863796 (contains!8190 (getCurrentListMap!5053 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1299789 () Bool)

(declare-fun res!863798 () Bool)

(assert (=> b!1299789 (=> (not res!863798) (not e!741482))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1299789 (= res!863798 (validKeyInArray!0 (select (arr!41760 _keys!1741) from!2144)))))

(declare-fun mapIsEmpty!53780 () Bool)

(declare-fun mapRes!53780 () Bool)

(assert (=> mapIsEmpty!53780 mapRes!53780))

(declare-fun b!1299790 () Bool)

(declare-fun e!741481 () Bool)

(declare-fun e!741479 () Bool)

(assert (=> b!1299790 (= e!741481 (and e!741479 mapRes!53780))))

(declare-fun condMapEmpty!53780 () Bool)

(declare-fun mapDefault!53780 () ValueCell!16505)

(assert (=> b!1299790 (= condMapEmpty!53780 (= (arr!41759 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16505)) mapDefault!53780)))))

(declare-fun b!1299792 () Bool)

(declare-fun res!863793 () Bool)

(assert (=> b!1299792 (=> (not res!863793) (not e!741482))))

(declare-datatypes ((List!29708 0))(
  ( (Nil!29705) (Cons!29704 (h!30913 (_ BitVec 64)) (t!43270 List!29708)) )
))
(declare-fun arrayNoDuplicates!0 (array!86523 (_ BitVec 32) List!29708) Bool)

(assert (=> b!1299792 (= res!863793 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29705))))

(declare-fun b!1299793 () Bool)

(declare-fun res!863799 () Bool)

(assert (=> b!1299793 (=> (not res!863799) (not e!741482))))

(assert (=> b!1299793 (= res!863799 (and (= (size!42311 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42312 _keys!1741) (size!42311 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1299794 () Bool)

(declare-fun +!4482 (ListLongMap!20245 tuple2!22588) ListLongMap!20245)

(declare-fun getCurrentListMapNoExtraKeys!6113 (array!86523 array!86521 (_ BitVec 32) (_ BitVec 32) V!51513 V!51513 (_ BitVec 32) Int) ListLongMap!20245)

(assert (=> b!1299794 (= e!741482 (not (contains!8190 (+!4482 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205)))))

(declare-fun b!1299795 () Bool)

(declare-fun res!863795 () Bool)

(assert (=> b!1299795 (=> (not res!863795) (not e!741482))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86523 (_ BitVec 32)) Bool)

(assert (=> b!1299795 (= res!863795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1299796 () Bool)

(declare-fun res!863792 () Bool)

(assert (=> b!1299796 (=> (not res!863792) (not e!741482))))

(assert (=> b!1299796 (= res!863792 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42312 _keys!1741))))))

(declare-fun b!1299797 () Bool)

(declare-fun res!863791 () Bool)

(assert (=> b!1299797 (=> (not res!863791) (not e!741482))))

(assert (=> b!1299797 (= res!863791 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42312 _keys!1741))))))

(declare-fun b!1299798 () Bool)

(declare-fun tp_is_empty!34807 () Bool)

(assert (=> b!1299798 (= e!741479 tp_is_empty!34807)))

(declare-fun res!863797 () Bool)

(assert (=> start!109734 (=> (not res!863797) (not e!741482))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109734 (= res!863797 (validMask!0 mask!2175))))

(assert (=> start!109734 e!741482))

(assert (=> start!109734 tp_is_empty!34807))

(assert (=> start!109734 true))

(declare-fun array_inv!31761 (array!86521) Bool)

(assert (=> start!109734 (and (array_inv!31761 _values!1445) e!741481)))

(declare-fun array_inv!31762 (array!86523) Bool)

(assert (=> start!109734 (array_inv!31762 _keys!1741)))

(assert (=> start!109734 tp!102630))

(declare-fun b!1299791 () Bool)

(declare-fun e!741480 () Bool)

(assert (=> b!1299791 (= e!741480 tp_is_empty!34807)))

(declare-fun b!1299799 () Bool)

(declare-fun res!863794 () Bool)

(assert (=> b!1299799 (=> (not res!863794) (not e!741482))))

(assert (=> b!1299799 (= res!863794 (and (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!53780 () Bool)

(declare-fun tp!102629 () Bool)

(assert (=> mapNonEmpty!53780 (= mapRes!53780 (and tp!102629 e!741480))))

(declare-fun mapKey!53780 () (_ BitVec 32))

(declare-fun mapRest!53780 () (Array (_ BitVec 32) ValueCell!16505))

(declare-fun mapValue!53780 () ValueCell!16505)

(assert (=> mapNonEmpty!53780 (= (arr!41759 _values!1445) (store mapRest!53780 mapKey!53780 mapValue!53780))))

(assert (= (and start!109734 res!863797) b!1299793))

(assert (= (and b!1299793 res!863799) b!1299795))

(assert (= (and b!1299795 res!863795) b!1299792))

(assert (= (and b!1299792 res!863793) b!1299796))

(assert (= (and b!1299796 res!863792) b!1299788))

(assert (= (and b!1299788 res!863796) b!1299797))

(assert (= (and b!1299797 res!863791) b!1299789))

(assert (= (and b!1299789 res!863798) b!1299799))

(assert (= (and b!1299799 res!863794) b!1299794))

(assert (= (and b!1299790 condMapEmpty!53780) mapIsEmpty!53780))

(assert (= (and b!1299790 (not condMapEmpty!53780)) mapNonEmpty!53780))

(get-info :version)

(assert (= (and mapNonEmpty!53780 ((_ is ValueCellFull!16505) mapValue!53780)) b!1299791))

(assert (= (and b!1299790 ((_ is ValueCellFull!16505) mapDefault!53780)) b!1299798))

(assert (= start!109734 b!1299790))

(declare-fun m!1190433 () Bool)

(assert (=> start!109734 m!1190433))

(declare-fun m!1190435 () Bool)

(assert (=> start!109734 m!1190435))

(declare-fun m!1190437 () Bool)

(assert (=> start!109734 m!1190437))

(declare-fun m!1190439 () Bool)

(assert (=> b!1299795 m!1190439))

(declare-fun m!1190441 () Bool)

(assert (=> b!1299789 m!1190441))

(assert (=> b!1299789 m!1190441))

(declare-fun m!1190443 () Bool)

(assert (=> b!1299789 m!1190443))

(declare-fun m!1190445 () Bool)

(assert (=> b!1299792 m!1190445))

(declare-fun m!1190447 () Bool)

(assert (=> mapNonEmpty!53780 m!1190447))

(declare-fun m!1190449 () Bool)

(assert (=> b!1299794 m!1190449))

(assert (=> b!1299794 m!1190449))

(declare-fun m!1190451 () Bool)

(assert (=> b!1299794 m!1190451))

(assert (=> b!1299794 m!1190451))

(declare-fun m!1190453 () Bool)

(assert (=> b!1299794 m!1190453))

(declare-fun m!1190455 () Bool)

(assert (=> b!1299788 m!1190455))

(assert (=> b!1299788 m!1190455))

(declare-fun m!1190457 () Bool)

(assert (=> b!1299788 m!1190457))

(check-sat (not b!1299794) (not b!1299792) (not start!109734) (not mapNonEmpty!53780) (not b!1299788) tp_is_empty!34807 b_and!47251 (not b_next!29167) (not b!1299789) (not b!1299795))
(check-sat b_and!47251 (not b_next!29167))
(get-model)

(declare-fun b!1299880 () Bool)

(declare-fun e!741521 () Bool)

(declare-fun e!741520 () Bool)

(assert (=> b!1299880 (= e!741521 e!741520)))

(declare-fun c!124505 () Bool)

(assert (=> b!1299880 (= c!124505 (validKeyInArray!0 (select (arr!41760 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun d!141019 () Bool)

(declare-fun res!863859 () Bool)

(assert (=> d!141019 (=> res!863859 e!741521)))

(assert (=> d!141019 (= res!863859 (bvsge #b00000000000000000000000000000000 (size!42312 _keys!1741)))))

(assert (=> d!141019 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!741521)))

(declare-fun b!1299881 () Bool)

(declare-fun call!63584 () Bool)

(assert (=> b!1299881 (= e!741520 call!63584)))

(declare-fun bm!63581 () Bool)

(assert (=> bm!63581 (= call!63584 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1299882 () Bool)

(declare-fun e!741519 () Bool)

(assert (=> b!1299882 (= e!741520 e!741519)))

(declare-fun lt!580965 () (_ BitVec 64))

(assert (=> b!1299882 (= lt!580965 (select (arr!41760 _keys!1741) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42867 0))(
  ( (Unit!42868) )
))
(declare-fun lt!580966 () Unit!42867)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86523 (_ BitVec 64) (_ BitVec 32)) Unit!42867)

(assert (=> b!1299882 (= lt!580966 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!580965 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!86523 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1299882 (arrayContainsKey!0 _keys!1741 lt!580965 #b00000000000000000000000000000000)))

(declare-fun lt!580967 () Unit!42867)

(assert (=> b!1299882 (= lt!580967 lt!580966)))

(declare-fun res!863858 () Bool)

(declare-datatypes ((SeekEntryResult!10017 0))(
  ( (MissingZero!10017 (index!42439 (_ BitVec 32))) (Found!10017 (index!42440 (_ BitVec 32))) (Intermediate!10017 (undefined!10829 Bool) (index!42441 (_ BitVec 32)) (x!115470 (_ BitVec 32))) (Undefined!10017) (MissingVacant!10017 (index!42442 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86523 (_ BitVec 32)) SeekEntryResult!10017)

(assert (=> b!1299882 (= res!863858 (= (seekEntryOrOpen!0 (select (arr!41760 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!10017 #b00000000000000000000000000000000)))))

(assert (=> b!1299882 (=> (not res!863858) (not e!741519))))

(declare-fun b!1299883 () Bool)

(assert (=> b!1299883 (= e!741519 call!63584)))

(assert (= (and d!141019 (not res!863859)) b!1299880))

(assert (= (and b!1299880 c!124505) b!1299882))

(assert (= (and b!1299880 (not c!124505)) b!1299881))

(assert (= (and b!1299882 res!863858) b!1299883))

(assert (= (or b!1299883 b!1299881) bm!63581))

(declare-fun m!1190511 () Bool)

(assert (=> b!1299880 m!1190511))

(assert (=> b!1299880 m!1190511))

(declare-fun m!1190513 () Bool)

(assert (=> b!1299880 m!1190513))

(declare-fun m!1190515 () Bool)

(assert (=> bm!63581 m!1190515))

(assert (=> b!1299882 m!1190511))

(declare-fun m!1190517 () Bool)

(assert (=> b!1299882 m!1190517))

(declare-fun m!1190519 () Bool)

(assert (=> b!1299882 m!1190519))

(assert (=> b!1299882 m!1190511))

(declare-fun m!1190521 () Bool)

(assert (=> b!1299882 m!1190521))

(assert (=> b!1299795 d!141019))

(declare-fun d!141021 () Bool)

(declare-fun e!741527 () Bool)

(assert (=> d!141021 e!741527))

(declare-fun res!863862 () Bool)

(assert (=> d!141021 (=> res!863862 e!741527)))

(declare-fun lt!580978 () Bool)

(assert (=> d!141021 (= res!863862 (not lt!580978))))

(declare-fun lt!580979 () Bool)

(assert (=> d!141021 (= lt!580978 lt!580979)))

(declare-fun lt!580977 () Unit!42867)

(declare-fun e!741526 () Unit!42867)

(assert (=> d!141021 (= lt!580977 e!741526)))

(declare-fun c!124508 () Bool)

(assert (=> d!141021 (= c!124508 lt!580979)))

(declare-fun containsKey!718 (List!29707 (_ BitVec 64)) Bool)

(assert (=> d!141021 (= lt!580979 (containsKey!718 (toList!10138 (+!4482 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205))))

(assert (=> d!141021 (= (contains!8190 (+!4482 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205) lt!580978)))

(declare-fun b!1299890 () Bool)

(declare-fun lt!580976 () Unit!42867)

(assert (=> b!1299890 (= e!741526 lt!580976)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!465 (List!29707 (_ BitVec 64)) Unit!42867)

(assert (=> b!1299890 (= lt!580976 (lemmaContainsKeyImpliesGetValueByKeyDefined!465 (toList!10138 (+!4482 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205))))

(declare-datatypes ((Option!752 0))(
  ( (Some!751 (v!20086 V!51513)) (None!750) )
))
(declare-fun isDefined!508 (Option!752) Bool)

(declare-fun getValueByKey!701 (List!29707 (_ BitVec 64)) Option!752)

(assert (=> b!1299890 (isDefined!508 (getValueByKey!701 (toList!10138 (+!4482 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205))))

(declare-fun b!1299891 () Bool)

(declare-fun Unit!42869 () Unit!42867)

(assert (=> b!1299891 (= e!741526 Unit!42869)))

(declare-fun b!1299892 () Bool)

(assert (=> b!1299892 (= e!741527 (isDefined!508 (getValueByKey!701 (toList!10138 (+!4482 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205)))))

(assert (= (and d!141021 c!124508) b!1299890))

(assert (= (and d!141021 (not c!124508)) b!1299891))

(assert (= (and d!141021 (not res!863862)) b!1299892))

(declare-fun m!1190523 () Bool)

(assert (=> d!141021 m!1190523))

(declare-fun m!1190525 () Bool)

(assert (=> b!1299890 m!1190525))

(declare-fun m!1190527 () Bool)

(assert (=> b!1299890 m!1190527))

(assert (=> b!1299890 m!1190527))

(declare-fun m!1190529 () Bool)

(assert (=> b!1299890 m!1190529))

(assert (=> b!1299892 m!1190527))

(assert (=> b!1299892 m!1190527))

(assert (=> b!1299892 m!1190529))

(assert (=> b!1299794 d!141021))

(declare-fun d!141023 () Bool)

(declare-fun e!741530 () Bool)

(assert (=> d!141023 e!741530))

(declare-fun res!863868 () Bool)

(assert (=> d!141023 (=> (not res!863868) (not e!741530))))

(declare-fun lt!580991 () ListLongMap!20245)

(assert (=> d!141023 (= res!863868 (contains!8190 lt!580991 (_1!11305 (tuple2!22589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lt!580989 () List!29707)

(assert (=> d!141023 (= lt!580991 (ListLongMap!20246 lt!580989))))

(declare-fun lt!580990 () Unit!42867)

(declare-fun lt!580988 () Unit!42867)

(assert (=> d!141023 (= lt!580990 lt!580988)))

(assert (=> d!141023 (= (getValueByKey!701 lt!580989 (_1!11305 (tuple2!22589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!751 (_2!11305 (tuple2!22589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lemmaContainsTupThenGetReturnValue!345 (List!29707 (_ BitVec 64) V!51513) Unit!42867)

(assert (=> d!141023 (= lt!580988 (lemmaContainsTupThenGetReturnValue!345 lt!580989 (_1!11305 (tuple2!22589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11305 (tuple2!22589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun insertStrictlySorted!474 (List!29707 (_ BitVec 64) V!51513) List!29707)

(assert (=> d!141023 (= lt!580989 (insertStrictlySorted!474 (toList!10138 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) (_1!11305 (tuple2!22589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11305 (tuple2!22589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!141023 (= (+!4482 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) lt!580991)))

(declare-fun b!1299897 () Bool)

(declare-fun res!863867 () Bool)

(assert (=> b!1299897 (=> (not res!863867) (not e!741530))))

(assert (=> b!1299897 (= res!863867 (= (getValueByKey!701 (toList!10138 lt!580991) (_1!11305 (tuple2!22589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!751 (_2!11305 (tuple2!22589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(declare-fun b!1299898 () Bool)

(declare-fun contains!8193 (List!29707 tuple2!22588) Bool)

(assert (=> b!1299898 (= e!741530 (contains!8193 (toList!10138 lt!580991) (tuple2!22589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(assert (= (and d!141023 res!863868) b!1299897))

(assert (= (and b!1299897 res!863867) b!1299898))

(declare-fun m!1190531 () Bool)

(assert (=> d!141023 m!1190531))

(declare-fun m!1190533 () Bool)

(assert (=> d!141023 m!1190533))

(declare-fun m!1190535 () Bool)

(assert (=> d!141023 m!1190535))

(declare-fun m!1190537 () Bool)

(assert (=> d!141023 m!1190537))

(declare-fun m!1190539 () Bool)

(assert (=> b!1299897 m!1190539))

(declare-fun m!1190541 () Bool)

(assert (=> b!1299898 m!1190541))

(assert (=> b!1299794 d!141023))

(declare-fun b!1299923 () Bool)

(assert (=> b!1299923 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42312 _keys!1741)))))

(assert (=> b!1299923 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42311 _values!1445)))))

(declare-fun e!741550 () Bool)

(declare-fun lt!581011 () ListLongMap!20245)

(declare-fun apply!1008 (ListLongMap!20245 (_ BitVec 64)) V!51513)

(declare-fun get!21116 (ValueCell!16505 V!51513) V!51513)

(declare-fun dynLambda!3443 (Int (_ BitVec 64)) V!51513)

(assert (=> b!1299923 (= e!741550 (= (apply!1008 lt!581011 (select (arr!41760 _keys!1741) from!2144)) (get!21116 (select (arr!41759 _values!1445) from!2144) (dynLambda!3443 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1299924 () Bool)

(declare-fun e!741546 () ListLongMap!20245)

(declare-fun call!63587 () ListLongMap!20245)

(assert (=> b!1299924 (= e!741546 call!63587)))

(declare-fun d!141025 () Bool)

(declare-fun e!741547 () Bool)

(assert (=> d!141025 e!741547))

(declare-fun res!863877 () Bool)

(assert (=> d!141025 (=> (not res!863877) (not e!741547))))

(assert (=> d!141025 (= res!863877 (not (contains!8190 lt!581011 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!741548 () ListLongMap!20245)

(assert (=> d!141025 (= lt!581011 e!741548)))

(declare-fun c!124520 () Bool)

(assert (=> d!141025 (= c!124520 (bvsge from!2144 (size!42312 _keys!1741)))))

(assert (=> d!141025 (validMask!0 mask!2175)))

(assert (=> d!141025 (= (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!581011)))

(declare-fun b!1299925 () Bool)

(assert (=> b!1299925 (= e!741548 (ListLongMap!20246 Nil!29704))))

(declare-fun b!1299926 () Bool)

(declare-fun res!863880 () Bool)

(assert (=> b!1299926 (=> (not res!863880) (not e!741547))))

(assert (=> b!1299926 (= res!863880 (not (contains!8190 lt!581011 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1299927 () Bool)

(declare-fun e!741551 () Bool)

(declare-fun e!741549 () Bool)

(assert (=> b!1299927 (= e!741551 e!741549)))

(declare-fun c!124517 () Bool)

(assert (=> b!1299927 (= c!124517 (bvslt from!2144 (size!42312 _keys!1741)))))

(declare-fun b!1299928 () Bool)

(declare-fun isEmpty!1057 (ListLongMap!20245) Bool)

(assert (=> b!1299928 (= e!741549 (isEmpty!1057 lt!581011))))

(declare-fun b!1299929 () Bool)

(assert (=> b!1299929 (= e!741549 (= lt!581011 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun b!1299930 () Bool)

(assert (=> b!1299930 (= e!741551 e!741550)))

(assert (=> b!1299930 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42312 _keys!1741)))))

(declare-fun res!863879 () Bool)

(assert (=> b!1299930 (= res!863879 (contains!8190 lt!581011 (select (arr!41760 _keys!1741) from!2144)))))

(assert (=> b!1299930 (=> (not res!863879) (not e!741550))))

(declare-fun b!1299931 () Bool)

(assert (=> b!1299931 (= e!741547 e!741551)))

(declare-fun c!124518 () Bool)

(declare-fun e!741545 () Bool)

(assert (=> b!1299931 (= c!124518 e!741545)))

(declare-fun res!863878 () Bool)

(assert (=> b!1299931 (=> (not res!863878) (not e!741545))))

(assert (=> b!1299931 (= res!863878 (bvslt from!2144 (size!42312 _keys!1741)))))

(declare-fun b!1299932 () Bool)

(assert (=> b!1299932 (= e!741548 e!741546)))

(declare-fun c!124519 () Bool)

(assert (=> b!1299932 (= c!124519 (validKeyInArray!0 (select (arr!41760 _keys!1741) from!2144)))))

(declare-fun b!1299933 () Bool)

(declare-fun lt!581009 () Unit!42867)

(declare-fun lt!581006 () Unit!42867)

(assert (=> b!1299933 (= lt!581009 lt!581006)))

(declare-fun lt!581012 () (_ BitVec 64))

(declare-fun lt!581007 () ListLongMap!20245)

(declare-fun lt!581008 () V!51513)

(declare-fun lt!581010 () (_ BitVec 64))

(assert (=> b!1299933 (not (contains!8190 (+!4482 lt!581007 (tuple2!22589 lt!581012 lt!581008)) lt!581010))))

(declare-fun addStillNotContains!451 (ListLongMap!20245 (_ BitVec 64) V!51513 (_ BitVec 64)) Unit!42867)

(assert (=> b!1299933 (= lt!581006 (addStillNotContains!451 lt!581007 lt!581012 lt!581008 lt!581010))))

(assert (=> b!1299933 (= lt!581010 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1299933 (= lt!581008 (get!21116 (select (arr!41759 _values!1445) from!2144) (dynLambda!3443 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1299933 (= lt!581012 (select (arr!41760 _keys!1741) from!2144))))

(assert (=> b!1299933 (= lt!581007 call!63587)))

(assert (=> b!1299933 (= e!741546 (+!4482 call!63587 (tuple2!22589 (select (arr!41760 _keys!1741) from!2144) (get!21116 (select (arr!41759 _values!1445) from!2144) (dynLambda!3443 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1299934 () Bool)

(assert (=> b!1299934 (= e!741545 (validKeyInArray!0 (select (arr!41760 _keys!1741) from!2144)))))

(assert (=> b!1299934 (bvsge from!2144 #b00000000000000000000000000000000)))

(declare-fun bm!63584 () Bool)

(assert (=> bm!63584 (= call!63587 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448))))

(assert (= (and d!141025 c!124520) b!1299925))

(assert (= (and d!141025 (not c!124520)) b!1299932))

(assert (= (and b!1299932 c!124519) b!1299933))

(assert (= (and b!1299932 (not c!124519)) b!1299924))

(assert (= (or b!1299933 b!1299924) bm!63584))

(assert (= (and d!141025 res!863877) b!1299926))

(assert (= (and b!1299926 res!863880) b!1299931))

(assert (= (and b!1299931 res!863878) b!1299934))

(assert (= (and b!1299931 c!124518) b!1299930))

(assert (= (and b!1299931 (not c!124518)) b!1299927))

(assert (= (and b!1299930 res!863879) b!1299923))

(assert (= (and b!1299927 c!124517) b!1299929))

(assert (= (and b!1299927 (not c!124517)) b!1299928))

(declare-fun b_lambda!23151 () Bool)

(assert (=> (not b_lambda!23151) (not b!1299923)))

(declare-fun t!43275 () Bool)

(declare-fun tb!11367 () Bool)

(assert (=> (and start!109734 (= defaultEntry!1448 defaultEntry!1448) t!43275) tb!11367))

(declare-fun result!23749 () Bool)

(assert (=> tb!11367 (= result!23749 tp_is_empty!34807)))

(assert (=> b!1299923 t!43275))

(declare-fun b_and!47257 () Bool)

(assert (= b_and!47251 (and (=> t!43275 result!23749) b_and!47257)))

(declare-fun b_lambda!23153 () Bool)

(assert (=> (not b_lambda!23153) (not b!1299933)))

(assert (=> b!1299933 t!43275))

(declare-fun b_and!47259 () Bool)

(assert (= b_and!47257 (and (=> t!43275 result!23749) b_and!47259)))

(assert (=> b!1299934 m!1190441))

(assert (=> b!1299934 m!1190441))

(assert (=> b!1299934 m!1190443))

(assert (=> b!1299930 m!1190441))

(assert (=> b!1299930 m!1190441))

(declare-fun m!1190543 () Bool)

(assert (=> b!1299930 m!1190543))

(declare-fun m!1190545 () Bool)

(assert (=> d!141025 m!1190545))

(assert (=> d!141025 m!1190433))

(assert (=> b!1299932 m!1190441))

(assert (=> b!1299932 m!1190441))

(assert (=> b!1299932 m!1190443))

(declare-fun m!1190547 () Bool)

(assert (=> b!1299928 m!1190547))

(declare-fun m!1190549 () Bool)

(assert (=> bm!63584 m!1190549))

(declare-fun m!1190551 () Bool)

(assert (=> b!1299926 m!1190551))

(declare-fun m!1190553 () Bool)

(assert (=> b!1299923 m!1190553))

(declare-fun m!1190555 () Bool)

(assert (=> b!1299923 m!1190555))

(assert (=> b!1299923 m!1190441))

(assert (=> b!1299923 m!1190441))

(declare-fun m!1190557 () Bool)

(assert (=> b!1299923 m!1190557))

(assert (=> b!1299923 m!1190555))

(assert (=> b!1299923 m!1190553))

(declare-fun m!1190559 () Bool)

(assert (=> b!1299923 m!1190559))

(assert (=> b!1299929 m!1190549))

(assert (=> b!1299933 m!1190553))

(declare-fun m!1190561 () Bool)

(assert (=> b!1299933 m!1190561))

(declare-fun m!1190563 () Bool)

(assert (=> b!1299933 m!1190563))

(declare-fun m!1190565 () Bool)

(assert (=> b!1299933 m!1190565))

(declare-fun m!1190567 () Bool)

(assert (=> b!1299933 m!1190567))

(assert (=> b!1299933 m!1190555))

(assert (=> b!1299933 m!1190565))

(assert (=> b!1299933 m!1190441))

(assert (=> b!1299933 m!1190555))

(assert (=> b!1299933 m!1190553))

(assert (=> b!1299933 m!1190559))

(assert (=> b!1299794 d!141025))

(declare-fun d!141027 () Bool)

(assert (=> d!141027 (= (validKeyInArray!0 (select (arr!41760 _keys!1741) from!2144)) (and (not (= (select (arr!41760 _keys!1741) from!2144) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41760 _keys!1741) from!2144) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1299789 d!141027))

(declare-fun d!141029 () Bool)

(declare-fun e!741553 () Bool)

(assert (=> d!141029 e!741553))

(declare-fun res!863881 () Bool)

(assert (=> d!141029 (=> res!863881 e!741553)))

(declare-fun lt!581015 () Bool)

(assert (=> d!141029 (= res!863881 (not lt!581015))))

(declare-fun lt!581016 () Bool)

(assert (=> d!141029 (= lt!581015 lt!581016)))

(declare-fun lt!581014 () Unit!42867)

(declare-fun e!741552 () Unit!42867)

(assert (=> d!141029 (= lt!581014 e!741552)))

(declare-fun c!124521 () Bool)

(assert (=> d!141029 (= c!124521 lt!581016)))

(assert (=> d!141029 (= lt!581016 (containsKey!718 (toList!10138 (getCurrentListMap!5053 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!141029 (= (contains!8190 (getCurrentListMap!5053 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!581015)))

(declare-fun b!1299937 () Bool)

(declare-fun lt!581013 () Unit!42867)

(assert (=> b!1299937 (= e!741552 lt!581013)))

(assert (=> b!1299937 (= lt!581013 (lemmaContainsKeyImpliesGetValueByKeyDefined!465 (toList!10138 (getCurrentListMap!5053 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> b!1299937 (isDefined!508 (getValueByKey!701 (toList!10138 (getCurrentListMap!5053 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1299938 () Bool)

(declare-fun Unit!42870 () Unit!42867)

(assert (=> b!1299938 (= e!741552 Unit!42870)))

(declare-fun b!1299939 () Bool)

(assert (=> b!1299939 (= e!741553 (isDefined!508 (getValueByKey!701 (toList!10138 (getCurrentListMap!5053 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141029 c!124521) b!1299937))

(assert (= (and d!141029 (not c!124521)) b!1299938))

(assert (= (and d!141029 (not res!863881)) b!1299939))

(declare-fun m!1190569 () Bool)

(assert (=> d!141029 m!1190569))

(declare-fun m!1190571 () Bool)

(assert (=> b!1299937 m!1190571))

(declare-fun m!1190573 () Bool)

(assert (=> b!1299937 m!1190573))

(assert (=> b!1299937 m!1190573))

(declare-fun m!1190575 () Bool)

(assert (=> b!1299937 m!1190575))

(assert (=> b!1299939 m!1190573))

(assert (=> b!1299939 m!1190573))

(assert (=> b!1299939 m!1190575))

(assert (=> b!1299788 d!141029))

(declare-fun b!1299982 () Bool)

(declare-fun e!741582 () ListLongMap!20245)

(declare-fun call!63603 () ListLongMap!20245)

(assert (=> b!1299982 (= e!741582 call!63603)))

(declare-fun c!124537 () Bool)

(declare-fun bm!63599 () Bool)

(declare-fun c!124539 () Bool)

(declare-fun call!63606 () ListLongMap!20245)

(declare-fun call!63608 () ListLongMap!20245)

(declare-fun call!63605 () ListLongMap!20245)

(declare-fun call!63607 () ListLongMap!20245)

(assert (=> bm!63599 (= call!63607 (+!4482 (ite c!124539 call!63605 (ite c!124537 call!63608 call!63606)) (ite (or c!124539 c!124537) (tuple2!22589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1299983 () Bool)

(declare-fun e!741588 () Unit!42867)

(declare-fun Unit!42871 () Unit!42867)

(assert (=> b!1299983 (= e!741588 Unit!42871)))

(declare-fun bm!63600 () Bool)

(declare-fun call!63604 () Bool)

(declare-fun lt!581077 () ListLongMap!20245)

(assert (=> bm!63600 (= call!63604 (contains!8190 lt!581077 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!63601 () Bool)

(assert (=> bm!63601 (= call!63606 call!63608)))

(declare-fun b!1299984 () Bool)

(declare-fun e!741590 () Bool)

(declare-fun e!741592 () Bool)

(assert (=> b!1299984 (= e!741590 e!741592)))

(declare-fun res!863902 () Bool)

(declare-fun call!63602 () Bool)

(assert (=> b!1299984 (= res!863902 call!63602)))

(assert (=> b!1299984 (=> (not res!863902) (not e!741592))))

(declare-fun b!1299985 () Bool)

(declare-fun lt!581066 () Unit!42867)

(assert (=> b!1299985 (= e!741588 lt!581066)))

(declare-fun lt!581080 () ListLongMap!20245)

(assert (=> b!1299985 (= lt!581080 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!581069 () (_ BitVec 64))

(assert (=> b!1299985 (= lt!581069 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581073 () (_ BitVec 64))

(assert (=> b!1299985 (= lt!581073 (select (arr!41760 _keys!1741) from!2144))))

(declare-fun lt!581070 () Unit!42867)

(declare-fun addStillContains!1103 (ListLongMap!20245 (_ BitVec 64) V!51513 (_ BitVec 64)) Unit!42867)

(assert (=> b!1299985 (= lt!581070 (addStillContains!1103 lt!581080 lt!581069 zeroValue!1387 lt!581073))))

(assert (=> b!1299985 (contains!8190 (+!4482 lt!581080 (tuple2!22589 lt!581069 zeroValue!1387)) lt!581073)))

(declare-fun lt!581063 () Unit!42867)

(assert (=> b!1299985 (= lt!581063 lt!581070)))

(declare-fun lt!581068 () ListLongMap!20245)

(assert (=> b!1299985 (= lt!581068 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!581082 () (_ BitVec 64))

(assert (=> b!1299985 (= lt!581082 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581062 () (_ BitVec 64))

(assert (=> b!1299985 (= lt!581062 (select (arr!41760 _keys!1741) from!2144))))

(declare-fun lt!581061 () Unit!42867)

(declare-fun addApplyDifferent!546 (ListLongMap!20245 (_ BitVec 64) V!51513 (_ BitVec 64)) Unit!42867)

(assert (=> b!1299985 (= lt!581061 (addApplyDifferent!546 lt!581068 lt!581082 minValue!1387 lt!581062))))

(assert (=> b!1299985 (= (apply!1008 (+!4482 lt!581068 (tuple2!22589 lt!581082 minValue!1387)) lt!581062) (apply!1008 lt!581068 lt!581062))))

(declare-fun lt!581074 () Unit!42867)

(assert (=> b!1299985 (= lt!581074 lt!581061)))

(declare-fun lt!581072 () ListLongMap!20245)

(assert (=> b!1299985 (= lt!581072 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!581078 () (_ BitVec 64))

(assert (=> b!1299985 (= lt!581078 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581065 () (_ BitVec 64))

(assert (=> b!1299985 (= lt!581065 (select (arr!41760 _keys!1741) from!2144))))

(declare-fun lt!581075 () Unit!42867)

(assert (=> b!1299985 (= lt!581075 (addApplyDifferent!546 lt!581072 lt!581078 zeroValue!1387 lt!581065))))

(assert (=> b!1299985 (= (apply!1008 (+!4482 lt!581072 (tuple2!22589 lt!581078 zeroValue!1387)) lt!581065) (apply!1008 lt!581072 lt!581065))))

(declare-fun lt!581071 () Unit!42867)

(assert (=> b!1299985 (= lt!581071 lt!581075)))

(declare-fun lt!581064 () ListLongMap!20245)

(assert (=> b!1299985 (= lt!581064 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!581067 () (_ BitVec 64))

(assert (=> b!1299985 (= lt!581067 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581076 () (_ BitVec 64))

(assert (=> b!1299985 (= lt!581076 (select (arr!41760 _keys!1741) from!2144))))

(assert (=> b!1299985 (= lt!581066 (addApplyDifferent!546 lt!581064 lt!581067 minValue!1387 lt!581076))))

(assert (=> b!1299985 (= (apply!1008 (+!4482 lt!581064 (tuple2!22589 lt!581067 minValue!1387)) lt!581076) (apply!1008 lt!581064 lt!581076))))

(declare-fun b!1299986 () Bool)

(declare-fun e!741589 () Bool)

(declare-fun e!741584 () Bool)

(assert (=> b!1299986 (= e!741589 e!741584)))

(declare-fun c!124535 () Bool)

(assert (=> b!1299986 (= c!124535 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!141031 () Bool)

(assert (=> d!141031 e!741589))

(declare-fun res!863903 () Bool)

(assert (=> d!141031 (=> (not res!863903) (not e!741589))))

(assert (=> d!141031 (= res!863903 (or (bvsge from!2144 (size!42312 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42312 _keys!1741)))))))

(declare-fun lt!581079 () ListLongMap!20245)

(assert (=> d!141031 (= lt!581077 lt!581079)))

(declare-fun lt!581081 () Unit!42867)

(assert (=> d!141031 (= lt!581081 e!741588)))

(declare-fun c!124534 () Bool)

(declare-fun e!741581 () Bool)

(assert (=> d!141031 (= c!124534 e!741581)))

(declare-fun res!863905 () Bool)

(assert (=> d!141031 (=> (not res!863905) (not e!741581))))

(assert (=> d!141031 (= res!863905 (bvslt from!2144 (size!42312 _keys!1741)))))

(declare-fun e!741580 () ListLongMap!20245)

(assert (=> d!141031 (= lt!581079 e!741580)))

(assert (=> d!141031 (= c!124539 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!141031 (validMask!0 mask!2175)))

(assert (=> d!141031 (= (getCurrentListMap!5053 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!581077)))

(declare-fun bm!63602 () Bool)

(assert (=> bm!63602 (= call!63603 call!63607)))

(declare-fun b!1299987 () Bool)

(assert (=> b!1299987 (= e!741580 (+!4482 call!63607 (tuple2!22589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1299988 () Bool)

(assert (=> b!1299988 (= e!741590 (not call!63602))))

(declare-fun bm!63603 () Bool)

(assert (=> bm!63603 (= call!63605 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1299989 () Bool)

(declare-fun c!124536 () Bool)

(assert (=> b!1299989 (= c!124536 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!741585 () ListLongMap!20245)

(assert (=> b!1299989 (= e!741582 e!741585)))

(declare-fun b!1299990 () Bool)

(declare-fun e!741586 () Bool)

(assert (=> b!1299990 (= e!741584 e!741586)))

(declare-fun res!863900 () Bool)

(assert (=> b!1299990 (= res!863900 call!63604)))

(assert (=> b!1299990 (=> (not res!863900) (not e!741586))))

(declare-fun bm!63604 () Bool)

(assert (=> bm!63604 (= call!63608 call!63605)))

(declare-fun b!1299991 () Bool)

(declare-fun e!741583 () Bool)

(assert (=> b!1299991 (= e!741583 (validKeyInArray!0 (select (arr!41760 _keys!1741) from!2144)))))

(declare-fun b!1299992 () Bool)

(assert (=> b!1299992 (= e!741581 (validKeyInArray!0 (select (arr!41760 _keys!1741) from!2144)))))

(declare-fun b!1299993 () Bool)

(assert (=> b!1299993 (= e!741584 (not call!63604))))

(declare-fun b!1299994 () Bool)

(assert (=> b!1299994 (= e!741586 (= (apply!1008 lt!581077 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun b!1299995 () Bool)

(declare-fun e!741591 () Bool)

(declare-fun e!741587 () Bool)

(assert (=> b!1299995 (= e!741591 e!741587)))

(declare-fun res!863906 () Bool)

(assert (=> b!1299995 (=> (not res!863906) (not e!741587))))

(assert (=> b!1299995 (= res!863906 (contains!8190 lt!581077 (select (arr!41760 _keys!1741) from!2144)))))

(assert (=> b!1299995 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42312 _keys!1741)))))

(declare-fun b!1299996 () Bool)

(assert (=> b!1299996 (= e!741580 e!741582)))

(assert (=> b!1299996 (= c!124537 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!63605 () Bool)

(assert (=> bm!63605 (= call!63602 (contains!8190 lt!581077 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1299997 () Bool)

(assert (=> b!1299997 (= e!741592 (= (apply!1008 lt!581077 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun b!1299998 () Bool)

(assert (=> b!1299998 (= e!741587 (= (apply!1008 lt!581077 (select (arr!41760 _keys!1741) from!2144)) (get!21116 (select (arr!41759 _values!1445) from!2144) (dynLambda!3443 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1299998 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42311 _values!1445)))))

(assert (=> b!1299998 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42312 _keys!1741)))))

(declare-fun b!1299999 () Bool)

(declare-fun res!863907 () Bool)

(assert (=> b!1299999 (=> (not res!863907) (not e!741589))))

(assert (=> b!1299999 (= res!863907 e!741591)))

(declare-fun res!863908 () Bool)

(assert (=> b!1299999 (=> res!863908 e!741591)))

(assert (=> b!1299999 (= res!863908 (not e!741583))))

(declare-fun res!863904 () Bool)

(assert (=> b!1299999 (=> (not res!863904) (not e!741583))))

(assert (=> b!1299999 (= res!863904 (bvslt from!2144 (size!42312 _keys!1741)))))

(declare-fun b!1300000 () Bool)

(assert (=> b!1300000 (= e!741585 call!63603)))

(declare-fun b!1300001 () Bool)

(assert (=> b!1300001 (= e!741585 call!63606)))

(declare-fun b!1300002 () Bool)

(declare-fun res!863901 () Bool)

(assert (=> b!1300002 (=> (not res!863901) (not e!741589))))

(assert (=> b!1300002 (= res!863901 e!741590)))

(declare-fun c!124538 () Bool)

(assert (=> b!1300002 (= c!124538 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!141031 c!124539) b!1299987))

(assert (= (and d!141031 (not c!124539)) b!1299996))

(assert (= (and b!1299996 c!124537) b!1299982))

(assert (= (and b!1299996 (not c!124537)) b!1299989))

(assert (= (and b!1299989 c!124536) b!1300000))

(assert (= (and b!1299989 (not c!124536)) b!1300001))

(assert (= (or b!1300000 b!1300001) bm!63601))

(assert (= (or b!1299982 bm!63601) bm!63604))

(assert (= (or b!1299982 b!1300000) bm!63602))

(assert (= (or b!1299987 bm!63604) bm!63603))

(assert (= (or b!1299987 bm!63602) bm!63599))

(assert (= (and d!141031 res!863905) b!1299992))

(assert (= (and d!141031 c!124534) b!1299985))

(assert (= (and d!141031 (not c!124534)) b!1299983))

(assert (= (and d!141031 res!863903) b!1299999))

(assert (= (and b!1299999 res!863904) b!1299991))

(assert (= (and b!1299999 (not res!863908)) b!1299995))

(assert (= (and b!1299995 res!863906) b!1299998))

(assert (= (and b!1299999 res!863907) b!1300002))

(assert (= (and b!1300002 c!124538) b!1299984))

(assert (= (and b!1300002 (not c!124538)) b!1299988))

(assert (= (and b!1299984 res!863902) b!1299997))

(assert (= (or b!1299984 b!1299988) bm!63605))

(assert (= (and b!1300002 res!863901) b!1299986))

(assert (= (and b!1299986 c!124535) b!1299990))

(assert (= (and b!1299986 (not c!124535)) b!1299993))

(assert (= (and b!1299990 res!863900) b!1299994))

(assert (= (or b!1299990 b!1299993) bm!63600))

(declare-fun b_lambda!23155 () Bool)

(assert (=> (not b_lambda!23155) (not b!1299998)))

(assert (=> b!1299998 t!43275))

(declare-fun b_and!47261 () Bool)

(assert (= b_and!47259 (and (=> t!43275 result!23749) b_and!47261)))

(assert (=> bm!63603 m!1190449))

(assert (=> b!1299992 m!1190441))

(assert (=> b!1299992 m!1190441))

(assert (=> b!1299992 m!1190443))

(declare-fun m!1190577 () Bool)

(assert (=> b!1299987 m!1190577))

(declare-fun m!1190579 () Bool)

(assert (=> b!1299994 m!1190579))

(declare-fun m!1190581 () Bool)

(assert (=> bm!63600 m!1190581))

(assert (=> b!1299991 m!1190441))

(assert (=> b!1299991 m!1190441))

(assert (=> b!1299991 m!1190443))

(declare-fun m!1190583 () Bool)

(assert (=> b!1299997 m!1190583))

(assert (=> b!1299998 m!1190441))

(assert (=> b!1299998 m!1190555))

(assert (=> b!1299998 m!1190555))

(assert (=> b!1299998 m!1190553))

(assert (=> b!1299998 m!1190559))

(assert (=> b!1299998 m!1190441))

(declare-fun m!1190585 () Bool)

(assert (=> b!1299998 m!1190585))

(assert (=> b!1299998 m!1190553))

(declare-fun m!1190587 () Bool)

(assert (=> bm!63605 m!1190587))

(assert (=> d!141031 m!1190433))

(declare-fun m!1190589 () Bool)

(assert (=> bm!63599 m!1190589))

(declare-fun m!1190591 () Bool)

(assert (=> b!1299985 m!1190591))

(declare-fun m!1190593 () Bool)

(assert (=> b!1299985 m!1190593))

(declare-fun m!1190595 () Bool)

(assert (=> b!1299985 m!1190595))

(assert (=> b!1299985 m!1190441))

(assert (=> b!1299985 m!1190595))

(declare-fun m!1190597 () Bool)

(assert (=> b!1299985 m!1190597))

(declare-fun m!1190599 () Bool)

(assert (=> b!1299985 m!1190599))

(declare-fun m!1190601 () Bool)

(assert (=> b!1299985 m!1190601))

(declare-fun m!1190603 () Bool)

(assert (=> b!1299985 m!1190603))

(declare-fun m!1190605 () Bool)

(assert (=> b!1299985 m!1190605))

(assert (=> b!1299985 m!1190449))

(declare-fun m!1190607 () Bool)

(assert (=> b!1299985 m!1190607))

(declare-fun m!1190609 () Bool)

(assert (=> b!1299985 m!1190609))

(assert (=> b!1299985 m!1190591))

(declare-fun m!1190611 () Bool)

(assert (=> b!1299985 m!1190611))

(declare-fun m!1190613 () Bool)

(assert (=> b!1299985 m!1190613))

(assert (=> b!1299985 m!1190611))

(declare-fun m!1190615 () Bool)

(assert (=> b!1299985 m!1190615))

(declare-fun m!1190617 () Bool)

(assert (=> b!1299985 m!1190617))

(assert (=> b!1299985 m!1190615))

(declare-fun m!1190619 () Bool)

(assert (=> b!1299985 m!1190619))

(assert (=> b!1299995 m!1190441))

(assert (=> b!1299995 m!1190441))

(declare-fun m!1190621 () Bool)

(assert (=> b!1299995 m!1190621))

(assert (=> b!1299788 d!141031))

(declare-fun bm!63608 () Bool)

(declare-fun call!63611 () Bool)

(declare-fun c!124542 () Bool)

(assert (=> bm!63608 (= call!63611 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124542 (Cons!29704 (select (arr!41760 _keys!1741) #b00000000000000000000000000000000) Nil!29705) Nil!29705)))))

(declare-fun b!1300013 () Bool)

(declare-fun e!741601 () Bool)

(assert (=> b!1300013 (= e!741601 call!63611)))

(declare-fun b!1300014 () Bool)

(declare-fun e!741604 () Bool)

(declare-fun e!741603 () Bool)

(assert (=> b!1300014 (= e!741604 e!741603)))

(declare-fun res!863915 () Bool)

(assert (=> b!1300014 (=> (not res!863915) (not e!741603))))

(declare-fun e!741602 () Bool)

(assert (=> b!1300014 (= res!863915 (not e!741602))))

(declare-fun res!863917 () Bool)

(assert (=> b!1300014 (=> (not res!863917) (not e!741602))))

(assert (=> b!1300014 (= res!863917 (validKeyInArray!0 (select (arr!41760 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1300015 () Bool)

(declare-fun contains!8194 (List!29708 (_ BitVec 64)) Bool)

(assert (=> b!1300015 (= e!741602 (contains!8194 Nil!29705 (select (arr!41760 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1300016 () Bool)

(assert (=> b!1300016 (= e!741603 e!741601)))

(assert (=> b!1300016 (= c!124542 (validKeyInArray!0 (select (arr!41760 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun d!141033 () Bool)

(declare-fun res!863916 () Bool)

(assert (=> d!141033 (=> res!863916 e!741604)))

(assert (=> d!141033 (= res!863916 (bvsge #b00000000000000000000000000000000 (size!42312 _keys!1741)))))

(assert (=> d!141033 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29705) e!741604)))

(declare-fun b!1300017 () Bool)

(assert (=> b!1300017 (= e!741601 call!63611)))

(assert (= (and d!141033 (not res!863916)) b!1300014))

(assert (= (and b!1300014 res!863917) b!1300015))

(assert (= (and b!1300014 res!863915) b!1300016))

(assert (= (and b!1300016 c!124542) b!1300017))

(assert (= (and b!1300016 (not c!124542)) b!1300013))

(assert (= (or b!1300017 b!1300013) bm!63608))

(assert (=> bm!63608 m!1190511))

(declare-fun m!1190623 () Bool)

(assert (=> bm!63608 m!1190623))

(assert (=> b!1300014 m!1190511))

(assert (=> b!1300014 m!1190511))

(assert (=> b!1300014 m!1190513))

(assert (=> b!1300015 m!1190511))

(assert (=> b!1300015 m!1190511))

(declare-fun m!1190625 () Bool)

(assert (=> b!1300015 m!1190625))

(assert (=> b!1300016 m!1190511))

(assert (=> b!1300016 m!1190511))

(assert (=> b!1300016 m!1190513))

(assert (=> b!1299792 d!141033))

(declare-fun d!141035 () Bool)

(assert (=> d!141035 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!109734 d!141035))

(declare-fun d!141037 () Bool)

(assert (=> d!141037 (= (array_inv!31761 _values!1445) (bvsge (size!42311 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!109734 d!141037))

(declare-fun d!141039 () Bool)

(assert (=> d!141039 (= (array_inv!31762 _keys!1741) (bvsge (size!42312 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!109734 d!141039))

(declare-fun condMapEmpty!53789 () Bool)

(declare-fun mapDefault!53789 () ValueCell!16505)

(assert (=> mapNonEmpty!53780 (= condMapEmpty!53789 (= mapRest!53780 ((as const (Array (_ BitVec 32) ValueCell!16505)) mapDefault!53789)))))

(declare-fun e!741610 () Bool)

(declare-fun mapRes!53789 () Bool)

(assert (=> mapNonEmpty!53780 (= tp!102629 (and e!741610 mapRes!53789))))

(declare-fun b!1300025 () Bool)

(assert (=> b!1300025 (= e!741610 tp_is_empty!34807)))

(declare-fun mapNonEmpty!53789 () Bool)

(declare-fun tp!102645 () Bool)

(declare-fun e!741609 () Bool)

(assert (=> mapNonEmpty!53789 (= mapRes!53789 (and tp!102645 e!741609))))

(declare-fun mapValue!53789 () ValueCell!16505)

(declare-fun mapKey!53789 () (_ BitVec 32))

(declare-fun mapRest!53789 () (Array (_ BitVec 32) ValueCell!16505))

(assert (=> mapNonEmpty!53789 (= mapRest!53780 (store mapRest!53789 mapKey!53789 mapValue!53789))))

(declare-fun b!1300024 () Bool)

(assert (=> b!1300024 (= e!741609 tp_is_empty!34807)))

(declare-fun mapIsEmpty!53789 () Bool)

(assert (=> mapIsEmpty!53789 mapRes!53789))

(assert (= (and mapNonEmpty!53780 condMapEmpty!53789) mapIsEmpty!53789))

(assert (= (and mapNonEmpty!53780 (not condMapEmpty!53789)) mapNonEmpty!53789))

(assert (= (and mapNonEmpty!53789 ((_ is ValueCellFull!16505) mapValue!53789)) b!1300024))

(assert (= (and mapNonEmpty!53780 ((_ is ValueCellFull!16505) mapDefault!53789)) b!1300025))

(declare-fun m!1190627 () Bool)

(assert (=> mapNonEmpty!53789 m!1190627))

(declare-fun b_lambda!23157 () Bool)

(assert (= b_lambda!23155 (or (and start!109734 b_free!29167) b_lambda!23157)))

(declare-fun b_lambda!23159 () Bool)

(assert (= b_lambda!23153 (or (and start!109734 b_free!29167) b_lambda!23159)))

(declare-fun b_lambda!23161 () Bool)

(assert (= b_lambda!23151 (or (and start!109734 b_free!29167) b_lambda!23161)))

(check-sat (not b!1299995) (not b!1299897) (not b_next!29167) (not b!1299929) (not bm!63600) (not b!1299882) (not b!1299880) (not d!141031) (not bm!63603) (not b!1299928) (not b_lambda!23159) (not b!1300016) (not b!1299997) (not bm!63599) (not b!1299937) (not b!1299892) (not b!1299987) (not b!1299933) (not b!1299998) (not b!1299991) (not b!1299930) (not b!1299890) (not bm!63581) (not b!1299926) (not bm!63584) (not b_lambda!23157) (not b!1299934) (not b!1300014) (not d!141021) (not b!1300015) (not mapNonEmpty!53789) b_and!47261 (not b!1299994) (not b!1299898) (not b!1299985) (not b!1299939) (not bm!63605) (not b!1299932) (not d!141029) (not bm!63608) (not b!1299992) tp_is_empty!34807 (not b_lambda!23161) (not d!141023) (not b!1299923) (not d!141025))
(check-sat b_and!47261 (not b_next!29167))
