; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109798 () Bool)

(assert start!109798)

(declare-fun b_free!29191 () Bool)

(declare-fun b_next!29191 () Bool)

(assert (=> start!109798 (= b_free!29191 (not b_next!29191))))

(declare-fun tp!102707 () Bool)

(declare-fun b_and!47287 () Bool)

(assert (=> start!109798 (= tp!102707 b_and!47287)))

(declare-fun b!1300538 () Bool)

(declare-fun res!864243 () Bool)

(declare-fun e!741865 () Bool)

(assert (=> b!1300538 (=> (not res!864243) (not e!741865))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51545 0))(
  ( (V!51546 (val!17490 Int)) )
))
(declare-datatypes ((ValueCell!16517 0))(
  ( (ValueCellFull!16517 (v!20097 V!51545)) (EmptyCell!16517) )
))
(declare-datatypes ((array!86573 0))(
  ( (array!86574 (arr!41783 (Array (_ BitVec 32) ValueCell!16517)) (size!42335 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86573)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86575 0))(
  ( (array!86576 (arr!41784 (Array (_ BitVec 32) (_ BitVec 64))) (size!42336 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86575)

(assert (=> b!1300538 (= res!864243 (and (= (size!42335 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42336 _keys!1741) (size!42335 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1300539 () Bool)

(declare-fun res!864241 () Bool)

(assert (=> b!1300539 (=> (not res!864241) (not e!741865))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1300539 (= res!864241 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42336 _keys!1741))))))

(declare-fun b!1300540 () Bool)

(declare-datatypes ((Unit!42877 0))(
  ( (Unit!42878) )
))
(declare-fun e!741866 () Unit!42877)

(declare-fun e!741864 () Unit!42877)

(assert (=> b!1300540 (= e!741866 e!741864)))

(declare-fun c!124589 () Bool)

(declare-fun lt!581256 () Bool)

(assert (=> b!1300540 (= c!124589 (and (not lt!581256) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!63651 () Bool)

(declare-fun call!63657 () Bool)

(declare-fun call!63658 () Bool)

(assert (=> bm!63651 (= call!63657 call!63658)))

(declare-fun b!1300541 () Bool)

(assert (=> b!1300541 (= e!741865 (not true))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22610 0))(
  ( (tuple2!22611 (_1!11316 (_ BitVec 64)) (_2!11316 V!51545)) )
))
(declare-datatypes ((List!29728 0))(
  ( (Nil!29725) (Cons!29724 (h!30933 tuple2!22610) (t!43294 List!29728)) )
))
(declare-datatypes ((ListLongMap!20267 0))(
  ( (ListLongMap!20268 (toList!10149 List!29728)) )
))
(declare-fun contains!8205 (ListLongMap!20267 (_ BitVec 64)) Bool)

(assert (=> b!1300541 (not (contains!8205 (ListLongMap!20268 Nil!29725) k0!1205))))

(declare-fun lt!581249 () Unit!42877)

(declare-fun emptyContainsNothing!188 ((_ BitVec 64)) Unit!42877)

(assert (=> b!1300541 (= lt!581249 (emptyContainsNothing!188 k0!1205))))

(declare-fun lt!581248 () Unit!42877)

(assert (=> b!1300541 (= lt!581248 e!741866)))

(declare-fun c!124591 () Bool)

(assert (=> b!1300541 (= c!124591 (and (not lt!581256) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1300541 (= lt!581256 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1300542 () Bool)

(declare-fun res!864244 () Bool)

(assert (=> b!1300542 (=> (not res!864244) (not e!741865))))

(assert (=> b!1300542 (= res!864244 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42336 _keys!1741))))))

(declare-fun bm!63653 () Bool)

(declare-fun call!63656 () Unit!42877)

(declare-fun call!63659 () Unit!42877)

(assert (=> bm!63653 (= call!63656 call!63659)))

(declare-fun b!1300543 () Bool)

(declare-fun res!864245 () Bool)

(assert (=> b!1300543 (=> (not res!864245) (not e!741865))))

(declare-datatypes ((List!29729 0))(
  ( (Nil!29726) (Cons!29725 (h!30934 (_ BitVec 64)) (t!43295 List!29729)) )
))
(declare-fun arrayNoDuplicates!0 (array!86575 (_ BitVec 32) List!29729) Bool)

(assert (=> b!1300543 (= res!864245 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29726))))

(declare-fun b!1300544 () Bool)

(declare-fun e!741863 () Bool)

(declare-fun e!741861 () Bool)

(declare-fun mapRes!53822 () Bool)

(assert (=> b!1300544 (= e!741863 (and e!741861 mapRes!53822))))

(declare-fun condMapEmpty!53822 () Bool)

(declare-fun mapDefault!53822 () ValueCell!16517)

(assert (=> b!1300544 (= condMapEmpty!53822 (= (arr!41783 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16517)) mapDefault!53822)))))

(declare-fun lt!581254 () ListLongMap!20267)

(declare-fun lt!581252 () ListLongMap!20267)

(declare-fun lt!581257 () ListLongMap!20267)

(declare-fun bm!63654 () Bool)

(assert (=> bm!63654 (= call!63658 (contains!8205 (ite c!124591 lt!581254 (ite c!124589 lt!581257 lt!581252)) k0!1205))))

(declare-fun b!1300545 () Bool)

(declare-fun c!124590 () Bool)

(assert (=> b!1300545 (= c!124590 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!581256))))

(declare-fun e!741862 () Unit!42877)

(assert (=> b!1300545 (= e!741864 e!741862)))

(declare-fun b!1300546 () Bool)

(declare-fun lt!581255 () Unit!42877)

(assert (=> b!1300546 (= e!741866 lt!581255)))

(declare-fun lt!581250 () ListLongMap!20267)

(declare-fun call!63655 () ListLongMap!20267)

(assert (=> b!1300546 (= lt!581250 call!63655)))

(declare-fun zeroValue!1387 () V!51545)

(declare-fun +!4491 (ListLongMap!20267 tuple2!22610) ListLongMap!20267)

(assert (=> b!1300546 (= lt!581254 (+!4491 lt!581250 (tuple2!22611 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!581251 () Unit!42877)

(assert (=> b!1300546 (= lt!581251 call!63659)))

(assert (=> b!1300546 call!63658))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!74 ((_ BitVec 64) (_ BitVec 64) V!51545 ListLongMap!20267) Unit!42877)

(assert (=> b!1300546 (= lt!581255 (lemmaInListMapAfterAddingDiffThenInBefore!74 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!581250))))

(assert (=> b!1300546 (contains!8205 lt!581250 k0!1205)))

(declare-fun minValue!1387 () V!51545)

(declare-fun bm!63652 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6122 (array!86575 array!86573 (_ BitVec 32) (_ BitVec 32) V!51545 V!51545 (_ BitVec 32) Int) ListLongMap!20267)

(assert (=> bm!63652 (= call!63655 (getCurrentListMapNoExtraKeys!6122 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun res!864242 () Bool)

(assert (=> start!109798 (=> (not res!864242) (not e!741865))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109798 (= res!864242 (validMask!0 mask!2175))))

(assert (=> start!109798 e!741865))

(declare-fun tp_is_empty!34831 () Bool)

(assert (=> start!109798 tp_is_empty!34831))

(assert (=> start!109798 true))

(declare-fun array_inv!31781 (array!86573) Bool)

(assert (=> start!109798 (and (array_inv!31781 _values!1445) e!741863)))

(declare-fun array_inv!31782 (array!86575) Bool)

(assert (=> start!109798 (array_inv!31782 _keys!1741)))

(assert (=> start!109798 tp!102707))

(declare-fun b!1300547 () Bool)

(declare-fun e!741860 () Bool)

(assert (=> b!1300547 (= e!741860 tp_is_empty!34831)))

(declare-fun b!1300548 () Bool)

(declare-fun res!864247 () Bool)

(assert (=> b!1300548 (=> (not res!864247) (not e!741865))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1300548 (= res!864247 (validKeyInArray!0 (select (arr!41784 _keys!1741) from!2144)))))

(declare-fun b!1300549 () Bool)

(assert (=> b!1300549 call!63657))

(declare-fun lt!581253 () Unit!42877)

(assert (=> b!1300549 (= lt!581253 call!63656)))

(declare-fun call!63654 () ListLongMap!20267)

(assert (=> b!1300549 (= lt!581257 call!63654)))

(assert (=> b!1300549 (= e!741864 lt!581253)))

(declare-fun mapNonEmpty!53822 () Bool)

(declare-fun tp!102708 () Bool)

(assert (=> mapNonEmpty!53822 (= mapRes!53822 (and tp!102708 e!741860))))

(declare-fun mapKey!53822 () (_ BitVec 32))

(declare-fun mapRest!53822 () (Array (_ BitVec 32) ValueCell!16517))

(declare-fun mapValue!53822 () ValueCell!16517)

(assert (=> mapNonEmpty!53822 (= (arr!41783 _values!1445) (store mapRest!53822 mapKey!53822 mapValue!53822))))

(declare-fun b!1300550 () Bool)

(declare-fun lt!581247 () Unit!42877)

(assert (=> b!1300550 (= e!741862 lt!581247)))

(assert (=> b!1300550 (= lt!581252 call!63654)))

(assert (=> b!1300550 (= lt!581247 call!63656)))

(assert (=> b!1300550 call!63657))

(declare-fun bm!63655 () Bool)

(assert (=> bm!63655 (= call!63659 (lemmaInListMapAfterAddingDiffThenInBefore!74 k0!1205 (ite c!124591 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124589 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124591 minValue!1387 (ite c!124589 zeroValue!1387 minValue!1387)) (ite c!124591 lt!581254 (ite c!124589 lt!581257 lt!581252))))))

(declare-fun b!1300551 () Bool)

(declare-fun res!864246 () Bool)

(assert (=> b!1300551 (=> (not res!864246) (not e!741865))))

(declare-fun getCurrentListMap!5063 (array!86575 array!86573 (_ BitVec 32) (_ BitVec 32) V!51545 V!51545 (_ BitVec 32) Int) ListLongMap!20267)

(assert (=> b!1300551 (= res!864246 (contains!8205 (getCurrentListMap!5063 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1300552 () Bool)

(declare-fun res!864248 () Bool)

(assert (=> b!1300552 (=> (not res!864248) (not e!741865))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86575 (_ BitVec 32)) Bool)

(assert (=> b!1300552 (= res!864248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1300553 () Bool)

(assert (=> b!1300553 (= e!741861 tp_is_empty!34831)))

(declare-fun mapIsEmpty!53822 () Bool)

(assert (=> mapIsEmpty!53822 mapRes!53822))

(declare-fun bm!63656 () Bool)

(assert (=> bm!63656 (= call!63654 call!63655)))

(declare-fun b!1300554 () Bool)

(declare-fun Unit!42879 () Unit!42877)

(assert (=> b!1300554 (= e!741862 Unit!42879)))

(assert (= (and start!109798 res!864242) b!1300538))

(assert (= (and b!1300538 res!864243) b!1300552))

(assert (= (and b!1300552 res!864248) b!1300543))

(assert (= (and b!1300543 res!864245) b!1300539))

(assert (= (and b!1300539 res!864241) b!1300551))

(assert (= (and b!1300551 res!864246) b!1300542))

(assert (= (and b!1300542 res!864244) b!1300548))

(assert (= (and b!1300548 res!864247) b!1300541))

(assert (= (and b!1300541 c!124591) b!1300546))

(assert (= (and b!1300541 (not c!124591)) b!1300540))

(assert (= (and b!1300540 c!124589) b!1300549))

(assert (= (and b!1300540 (not c!124589)) b!1300545))

(assert (= (and b!1300545 c!124590) b!1300550))

(assert (= (and b!1300545 (not c!124590)) b!1300554))

(assert (= (or b!1300549 b!1300550) bm!63656))

(assert (= (or b!1300549 b!1300550) bm!63653))

(assert (= (or b!1300549 b!1300550) bm!63651))

(assert (= (or b!1300546 bm!63656) bm!63652))

(assert (= (or b!1300546 bm!63653) bm!63655))

(assert (= (or b!1300546 bm!63651) bm!63654))

(assert (= (and b!1300544 condMapEmpty!53822) mapIsEmpty!53822))

(assert (= (and b!1300544 (not condMapEmpty!53822)) mapNonEmpty!53822))

(get-info :version)

(assert (= (and mapNonEmpty!53822 ((_ is ValueCellFull!16517) mapValue!53822)) b!1300547))

(assert (= (and b!1300544 ((_ is ValueCellFull!16517) mapDefault!53822)) b!1300553))

(assert (= start!109798 b!1300544))

(declare-fun m!1190981 () Bool)

(assert (=> b!1300551 m!1190981))

(assert (=> b!1300551 m!1190981))

(declare-fun m!1190983 () Bool)

(assert (=> b!1300551 m!1190983))

(declare-fun m!1190985 () Bool)

(assert (=> b!1300546 m!1190985))

(declare-fun m!1190987 () Bool)

(assert (=> b!1300546 m!1190987))

(declare-fun m!1190989 () Bool)

(assert (=> b!1300546 m!1190989))

(declare-fun m!1190991 () Bool)

(assert (=> bm!63652 m!1190991))

(declare-fun m!1190993 () Bool)

(assert (=> start!109798 m!1190993))

(declare-fun m!1190995 () Bool)

(assert (=> start!109798 m!1190995))

(declare-fun m!1190997 () Bool)

(assert (=> start!109798 m!1190997))

(declare-fun m!1190999 () Bool)

(assert (=> b!1300541 m!1190999))

(declare-fun m!1191001 () Bool)

(assert (=> b!1300541 m!1191001))

(declare-fun m!1191003 () Bool)

(assert (=> b!1300552 m!1191003))

(declare-fun m!1191005 () Bool)

(assert (=> mapNonEmpty!53822 m!1191005))

(declare-fun m!1191007 () Bool)

(assert (=> b!1300548 m!1191007))

(assert (=> b!1300548 m!1191007))

(declare-fun m!1191009 () Bool)

(assert (=> b!1300548 m!1191009))

(declare-fun m!1191011 () Bool)

(assert (=> b!1300543 m!1191011))

(declare-fun m!1191013 () Bool)

(assert (=> bm!63654 m!1191013))

(declare-fun m!1191015 () Bool)

(assert (=> bm!63655 m!1191015))

(check-sat (not mapNonEmpty!53822) b_and!47287 (not start!109798) (not b!1300548) (not bm!63655) (not b!1300546) (not b!1300552) (not b!1300543) (not b_next!29191) tp_is_empty!34831 (not bm!63652) (not b!1300541) (not bm!63654) (not b!1300551))
(check-sat b_and!47287 (not b_next!29191))
