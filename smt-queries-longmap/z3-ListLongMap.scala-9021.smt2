; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109110 () Bool)

(assert start!109110)

(declare-fun b_free!28399 () Bool)

(declare-fun b_next!28399 () Bool)

(assert (=> start!109110 (= b_free!28399 (not b_next!28399))))

(declare-fun tp!100313 () Bool)

(declare-fun b_and!46467 () Bool)

(assert (=> start!109110 (= tp!100313 b_and!46467)))

(declare-fun b!1287341 () Bool)

(declare-fun res!854857 () Bool)

(declare-fun e!735406 () Bool)

(assert (=> b!1287341 (=> (not res!854857) (not e!735406))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!85163 0))(
  ( (array!85164 (arr!41079 (Array (_ BitVec 32) (_ BitVec 64))) (size!41630 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85163)

(assert (=> b!1287341 (= res!854857 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41630 _keys!1741))))))

(declare-fun mapNonEmpty!52616 () Bool)

(declare-fun mapRes!52616 () Bool)

(declare-fun tp!100312 () Bool)

(declare-fun e!735410 () Bool)

(assert (=> mapNonEmpty!52616 (= mapRes!52616 (and tp!100312 e!735410))))

(declare-datatypes ((V!50489 0))(
  ( (V!50490 (val!17094 Int)) )
))
(declare-datatypes ((ValueCell!16121 0))(
  ( (ValueCellFull!16121 (v!19691 V!50489)) (EmptyCell!16121) )
))
(declare-fun mapRest!52616 () (Array (_ BitVec 32) ValueCell!16121))

(declare-datatypes ((array!85165 0))(
  ( (array!85166 (arr!41080 (Array (_ BitVec 32) ValueCell!16121)) (size!41631 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85165)

(declare-fun mapKey!52616 () (_ BitVec 32))

(declare-fun mapValue!52616 () ValueCell!16121)

(assert (=> mapNonEmpty!52616 (= (arr!41080 _values!1445) (store mapRest!52616 mapKey!52616 mapValue!52616))))

(declare-fun b!1287342 () Bool)

(assert (=> b!1287342 (= e!735406 (not true))))

(declare-datatypes ((tuple2!21934 0))(
  ( (tuple2!21935 (_1!10978 (_ BitVec 64)) (_2!10978 V!50489)) )
))
(declare-datatypes ((List!29134 0))(
  ( (Nil!29131) (Cons!29130 (h!30348 tuple2!21934) (t!42670 List!29134)) )
))
(declare-datatypes ((ListLongMap!19599 0))(
  ( (ListLongMap!19600 (toList!9815 List!29134)) )
))
(declare-fun contains!7946 (ListLongMap!19599 (_ BitVec 64)) Bool)

(assert (=> b!1287342 (not (contains!7946 (ListLongMap!19600 Nil!29131) k0!1205))))

(declare-datatypes ((Unit!42468 0))(
  ( (Unit!42469) )
))
(declare-fun lt!577474 () Unit!42468)

(declare-fun emptyContainsNothing!1 ((_ BitVec 64)) Unit!42468)

(assert (=> b!1287342 (= lt!577474 (emptyContainsNothing!1 k0!1205))))

(declare-fun lt!577476 () Unit!42468)

(declare-fun e!735409 () Unit!42468)

(assert (=> b!1287342 (= lt!577476 e!735409)))

(declare-fun c!124509 () Bool)

(declare-fun lt!577480 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1287342 (= c!124509 (and (not lt!577480) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1287342 (= lt!577480 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1287343 () Bool)

(declare-fun e!735404 () Bool)

(declare-fun tp_is_empty!34039 () Bool)

(assert (=> b!1287343 (= e!735404 tp_is_empty!34039)))

(declare-fun zeroValue!1387 () V!50489)

(declare-fun c!124510 () Bool)

(declare-fun lt!577479 () ListLongMap!19599)

(declare-fun bm!62852 () Bool)

(declare-fun lt!577472 () ListLongMap!19599)

(declare-fun lt!577473 () ListLongMap!19599)

(declare-fun minValue!1387 () V!50489)

(declare-fun call!62855 () Unit!42468)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!24 ((_ BitVec 64) (_ BitVec 64) V!50489 ListLongMap!19599) Unit!42468)

(assert (=> bm!62852 (= call!62855 (lemmaInListMapAfterAddingDiffThenInBefore!24 k0!1205 (ite c!124509 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124510 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124509 minValue!1387 (ite c!124510 zeroValue!1387 minValue!1387)) (ite c!124509 lt!577479 (ite c!124510 lt!577473 lt!577472))))))

(declare-fun b!1287344 () Bool)

(declare-fun c!124511 () Bool)

(assert (=> b!1287344 (= c!124511 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!577480))))

(declare-fun e!735407 () Unit!42468)

(declare-fun e!735408 () Unit!42468)

(assert (=> b!1287344 (= e!735407 e!735408)))

(declare-fun b!1287345 () Bool)

(declare-fun res!854861 () Bool)

(assert (=> b!1287345 (=> (not res!854861) (not e!735406))))

(declare-fun mask!2175 () (_ BitVec 32))

(assert (=> b!1287345 (= res!854861 (and (= (size!41631 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41630 _keys!1741) (size!41631 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!854863 () Bool)

(assert (=> start!109110 (=> (not res!854863) (not e!735406))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109110 (= res!854863 (validMask!0 mask!2175))))

(assert (=> start!109110 e!735406))

(assert (=> start!109110 tp_is_empty!34039))

(assert (=> start!109110 true))

(declare-fun e!735411 () Bool)

(declare-fun array_inv!31365 (array!85165) Bool)

(assert (=> start!109110 (and (array_inv!31365 _values!1445) e!735411)))

(declare-fun array_inv!31366 (array!85163) Bool)

(assert (=> start!109110 (array_inv!31366 _keys!1741)))

(assert (=> start!109110 tp!100313))

(declare-fun call!62856 () Bool)

(declare-fun bm!62853 () Bool)

(assert (=> bm!62853 (= call!62856 (contains!7946 (ite c!124509 lt!577479 (ite c!124510 lt!577473 lt!577472)) k0!1205))))

(declare-fun b!1287346 () Bool)

(declare-fun lt!577475 () Unit!42468)

(assert (=> b!1287346 (= e!735409 lt!577475)))

(declare-fun lt!577471 () ListLongMap!19599)

(declare-fun call!62858 () ListLongMap!19599)

(assert (=> b!1287346 (= lt!577471 call!62858)))

(declare-fun +!4355 (ListLongMap!19599 tuple2!21934) ListLongMap!19599)

(assert (=> b!1287346 (= lt!577479 (+!4355 lt!577471 (tuple2!21935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!577477 () Unit!42468)

(assert (=> b!1287346 (= lt!577477 call!62855)))

(assert (=> b!1287346 call!62856))

(assert (=> b!1287346 (= lt!577475 (lemmaInListMapAfterAddingDiffThenInBefore!24 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!577471))))

(assert (=> b!1287346 (contains!7946 lt!577471 k0!1205)))

(declare-fun b!1287347 () Bool)

(declare-fun res!854858 () Bool)

(assert (=> b!1287347 (=> (not res!854858) (not e!735406))))

(assert (=> b!1287347 (= res!854858 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41630 _keys!1741))))))

(declare-fun b!1287348 () Bool)

(declare-fun call!62860 () Bool)

(assert (=> b!1287348 call!62860))

(declare-fun lt!577481 () Unit!42468)

(declare-fun call!62859 () Unit!42468)

(assert (=> b!1287348 (= lt!577481 call!62859)))

(declare-fun call!62857 () ListLongMap!19599)

(assert (=> b!1287348 (= lt!577473 call!62857)))

(assert (=> b!1287348 (= e!735407 lt!577481)))

(declare-fun b!1287349 () Bool)

(declare-fun Unit!42470 () Unit!42468)

(assert (=> b!1287349 (= e!735408 Unit!42470)))

(declare-fun b!1287350 () Bool)

(declare-fun res!854860 () Bool)

(assert (=> b!1287350 (=> (not res!854860) (not e!735406))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1287350 (= res!854860 (validKeyInArray!0 (select (arr!41079 _keys!1741) from!2144)))))

(declare-fun b!1287351 () Bool)

(assert (=> b!1287351 (= e!735411 (and e!735404 mapRes!52616))))

(declare-fun condMapEmpty!52616 () Bool)

(declare-fun mapDefault!52616 () ValueCell!16121)

(assert (=> b!1287351 (= condMapEmpty!52616 (= (arr!41080 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16121)) mapDefault!52616)))))

(declare-fun b!1287352 () Bool)

(assert (=> b!1287352 (= e!735410 tp_is_empty!34039)))

(declare-fun b!1287353 () Bool)

(declare-fun lt!577478 () Unit!42468)

(assert (=> b!1287353 (= e!735408 lt!577478)))

(assert (=> b!1287353 (= lt!577472 call!62857)))

(assert (=> b!1287353 (= lt!577478 call!62859)))

(assert (=> b!1287353 call!62860))

(declare-fun b!1287354 () Bool)

(declare-fun res!854856 () Bool)

(assert (=> b!1287354 (=> (not res!854856) (not e!735406))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85163 (_ BitVec 32)) Bool)

(assert (=> b!1287354 (= res!854856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun bm!62854 () Bool)

(assert (=> bm!62854 (= call!62857 call!62858)))

(declare-fun bm!62855 () Bool)

(assert (=> bm!62855 (= call!62859 call!62855)))

(declare-fun mapIsEmpty!52616 () Bool)

(assert (=> mapIsEmpty!52616 mapRes!52616))

(declare-fun defaultEntry!1448 () Int)

(declare-fun bm!62856 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5987 (array!85163 array!85165 (_ BitVec 32) (_ BitVec 32) V!50489 V!50489 (_ BitVec 32) Int) ListLongMap!19599)

(assert (=> bm!62856 (= call!62858 (getCurrentListMapNoExtraKeys!5987 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1287355 () Bool)

(assert (=> b!1287355 (= e!735409 e!735407)))

(assert (=> b!1287355 (= c!124510 (and (not lt!577480) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1287356 () Bool)

(declare-fun res!854862 () Bool)

(assert (=> b!1287356 (=> (not res!854862) (not e!735406))))

(declare-fun getCurrentListMap!4879 (array!85163 array!85165 (_ BitVec 32) (_ BitVec 32) V!50489 V!50489 (_ BitVec 32) Int) ListLongMap!19599)

(assert (=> b!1287356 (= res!854862 (contains!7946 (getCurrentListMap!4879 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1287357 () Bool)

(declare-fun res!854859 () Bool)

(assert (=> b!1287357 (=> (not res!854859) (not e!735406))))

(declare-datatypes ((List!29135 0))(
  ( (Nil!29132) (Cons!29131 (h!30349 (_ BitVec 64)) (t!42671 List!29135)) )
))
(declare-fun arrayNoDuplicates!0 (array!85163 (_ BitVec 32) List!29135) Bool)

(assert (=> b!1287357 (= res!854859 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29132))))

(declare-fun bm!62857 () Bool)

(assert (=> bm!62857 (= call!62860 call!62856)))

(assert (= (and start!109110 res!854863) b!1287345))

(assert (= (and b!1287345 res!854861) b!1287354))

(assert (= (and b!1287354 res!854856) b!1287357))

(assert (= (and b!1287357 res!854859) b!1287347))

(assert (= (and b!1287347 res!854858) b!1287356))

(assert (= (and b!1287356 res!854862) b!1287341))

(assert (= (and b!1287341 res!854857) b!1287350))

(assert (= (and b!1287350 res!854860) b!1287342))

(assert (= (and b!1287342 c!124509) b!1287346))

(assert (= (and b!1287342 (not c!124509)) b!1287355))

(assert (= (and b!1287355 c!124510) b!1287348))

(assert (= (and b!1287355 (not c!124510)) b!1287344))

(assert (= (and b!1287344 c!124511) b!1287353))

(assert (= (and b!1287344 (not c!124511)) b!1287349))

(assert (= (or b!1287348 b!1287353) bm!62854))

(assert (= (or b!1287348 b!1287353) bm!62855))

(assert (= (or b!1287348 b!1287353) bm!62857))

(assert (= (or b!1287346 bm!62854) bm!62856))

(assert (= (or b!1287346 bm!62855) bm!62852))

(assert (= (or b!1287346 bm!62857) bm!62853))

(assert (= (and b!1287351 condMapEmpty!52616) mapIsEmpty!52616))

(assert (= (and b!1287351 (not condMapEmpty!52616)) mapNonEmpty!52616))

(get-info :version)

(assert (= (and mapNonEmpty!52616 ((_ is ValueCellFull!16121) mapValue!52616)) b!1287352))

(assert (= (and b!1287351 ((_ is ValueCellFull!16121) mapDefault!52616)) b!1287343))

(assert (= start!109110 b!1287351))

(declare-fun m!1180801 () Bool)

(assert (=> start!109110 m!1180801))

(declare-fun m!1180803 () Bool)

(assert (=> start!109110 m!1180803))

(declare-fun m!1180805 () Bool)

(assert (=> start!109110 m!1180805))

(declare-fun m!1180807 () Bool)

(assert (=> b!1287357 m!1180807))

(declare-fun m!1180809 () Bool)

(assert (=> bm!62856 m!1180809))

(declare-fun m!1180811 () Bool)

(assert (=> bm!62852 m!1180811))

(declare-fun m!1180813 () Bool)

(assert (=> b!1287342 m!1180813))

(declare-fun m!1180815 () Bool)

(assert (=> b!1287342 m!1180815))

(declare-fun m!1180817 () Bool)

(assert (=> b!1287350 m!1180817))

(assert (=> b!1287350 m!1180817))

(declare-fun m!1180819 () Bool)

(assert (=> b!1287350 m!1180819))

(declare-fun m!1180821 () Bool)

(assert (=> b!1287356 m!1180821))

(assert (=> b!1287356 m!1180821))

(declare-fun m!1180823 () Bool)

(assert (=> b!1287356 m!1180823))

(declare-fun m!1180825 () Bool)

(assert (=> b!1287354 m!1180825))

(declare-fun m!1180827 () Bool)

(assert (=> b!1287346 m!1180827))

(declare-fun m!1180829 () Bool)

(assert (=> b!1287346 m!1180829))

(declare-fun m!1180831 () Bool)

(assert (=> b!1287346 m!1180831))

(declare-fun m!1180833 () Bool)

(assert (=> mapNonEmpty!52616 m!1180833))

(declare-fun m!1180835 () Bool)

(assert (=> bm!62853 m!1180835))

(check-sat (not bm!62856) (not b_next!28399) (not b!1287346) (not mapNonEmpty!52616) (not b!1287354) (not b!1287350) (not b!1287342) (not bm!62852) (not b!1287356) (not bm!62853) (not start!109110) b_and!46467 tp_is_empty!34039 (not b!1287357))
(check-sat b_and!46467 (not b_next!28399))
