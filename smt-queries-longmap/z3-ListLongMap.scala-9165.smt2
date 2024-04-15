; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110064 () Bool)

(assert start!110064)

(declare-fun b_free!29263 () Bool)

(declare-fun b_next!29263 () Bool)

(assert (=> start!110064 (= b_free!29263 (not b_next!29263))))

(declare-fun tp!102940 () Bool)

(declare-fun b_and!47409 () Bool)

(assert (=> start!110064 (= tp!102940 b_and!47409)))

(declare-fun b!1303408 () Bool)

(declare-fun res!865718 () Bool)

(declare-fun e!743459 () Bool)

(assert (=> b!1303408 (=> (not res!865718) (not e!743459))))

(declare-datatypes ((array!86723 0))(
  ( (array!86724 (arr!41853 (Array (_ BitVec 32) (_ BitVec 64))) (size!42405 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86723)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86723 (_ BitVec 32)) Bool)

(assert (=> b!1303408 (= res!865718 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1303409 () Bool)

(declare-fun e!743458 () Bool)

(assert (=> b!1303409 (= e!743459 (not e!743458))))

(declare-fun res!865722 () Bool)

(assert (=> b!1303409 (=> res!865722 e!743458)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1303409 (= res!865722 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((V!51641 0))(
  ( (V!51642 (val!17526 Int)) )
))
(declare-datatypes ((tuple2!22676 0))(
  ( (tuple2!22677 (_1!11349 (_ BitVec 64)) (_2!11349 V!51641)) )
))
(declare-datatypes ((List!29785 0))(
  ( (Nil!29782) (Cons!29781 (h!30990 tuple2!22676) (t!43371 List!29785)) )
))
(declare-datatypes ((ListLongMap!20333 0))(
  ( (ListLongMap!20334 (toList!10182 List!29785)) )
))
(declare-fun contains!8246 (ListLongMap!20333 (_ BitVec 64)) Bool)

(assert (=> b!1303409 (not (contains!8246 (ListLongMap!20334 Nil!29782) k0!1205))))

(declare-datatypes ((Unit!43003 0))(
  ( (Unit!43004) )
))
(declare-fun lt!583123 () Unit!43003)

(declare-fun emptyContainsNothing!213 ((_ BitVec 64)) Unit!43003)

(assert (=> b!1303409 (= lt!583123 (emptyContainsNothing!213 k0!1205))))

(declare-fun b!1303410 () Bool)

(declare-fun res!865723 () Bool)

(assert (=> b!1303410 (=> (not res!865723) (not e!743459))))

(declare-fun minValue!1387 () V!51641)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16553 0))(
  ( (ValueCellFull!16553 (v!20141 V!51641)) (EmptyCell!16553) )
))
(declare-datatypes ((array!86725 0))(
  ( (array!86726 (arr!41854 (Array (_ BitVec 32) ValueCell!16553)) (size!42406 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86725)

(declare-fun zeroValue!1387 () V!51641)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!5085 (array!86723 array!86725 (_ BitVec 32) (_ BitVec 32) V!51641 V!51641 (_ BitVec 32) Int) ListLongMap!20333)

(assert (=> b!1303410 (= res!865723 (contains!8246 (getCurrentListMap!5085 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1303411 () Bool)

(declare-fun e!743457 () Bool)

(declare-fun tp_is_empty!34903 () Bool)

(assert (=> b!1303411 (= e!743457 tp_is_empty!34903)))

(declare-fun b!1303412 () Bool)

(declare-fun res!865724 () Bool)

(assert (=> b!1303412 (=> (not res!865724) (not e!743459))))

(assert (=> b!1303412 (= res!865724 (and (= (size!42406 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42405 _keys!1741) (size!42406 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1303413 () Bool)

(declare-fun res!865725 () Bool)

(assert (=> b!1303413 (=> (not res!865725) (not e!743459))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1303413 (= res!865725 (not (validKeyInArray!0 (select (arr!41853 _keys!1741) from!2144))))))

(declare-fun b!1303414 () Bool)

(declare-fun res!865720 () Bool)

(assert (=> b!1303414 (=> (not res!865720) (not e!743459))))

(declare-datatypes ((List!29786 0))(
  ( (Nil!29783) (Cons!29782 (h!30991 (_ BitVec 64)) (t!43372 List!29786)) )
))
(declare-fun arrayNoDuplicates!0 (array!86723 (_ BitVec 32) List!29786) Bool)

(assert (=> b!1303414 (= res!865720 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29783))))

(declare-fun res!865721 () Bool)

(assert (=> start!110064 (=> (not res!865721) (not e!743459))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110064 (= res!865721 (validMask!0 mask!2175))))

(assert (=> start!110064 e!743459))

(assert (=> start!110064 tp_is_empty!34903))

(assert (=> start!110064 true))

(declare-fun e!743456 () Bool)

(declare-fun array_inv!31837 (array!86725) Bool)

(assert (=> start!110064 (and (array_inv!31837 _values!1445) e!743456)))

(declare-fun array_inv!31838 (array!86723) Bool)

(assert (=> start!110064 (array_inv!31838 _keys!1741)))

(assert (=> start!110064 tp!102940))

(declare-fun mapIsEmpty!53947 () Bool)

(declare-fun mapRes!53947 () Bool)

(assert (=> mapIsEmpty!53947 mapRes!53947))

(declare-fun b!1303415 () Bool)

(declare-fun res!865719 () Bool)

(assert (=> b!1303415 (=> (not res!865719) (not e!743459))))

(assert (=> b!1303415 (= res!865719 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42405 _keys!1741))))))

(declare-fun b!1303416 () Bool)

(assert (=> b!1303416 (= e!743458 true)))

(assert (=> b!1303416 false))

(declare-fun lt!583122 () ListLongMap!20333)

(declare-fun lt!583121 () Unit!43003)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!93 ((_ BitVec 64) (_ BitVec 64) V!51641 ListLongMap!20333) Unit!43003)

(assert (=> b!1303416 (= lt!583121 (lemmaInListMapAfterAddingDiffThenInBefore!93 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!583122))))

(declare-fun lt!583125 () ListLongMap!20333)

(declare-fun +!4513 (ListLongMap!20333 tuple2!22676) ListLongMap!20333)

(assert (=> b!1303416 (not (contains!8246 (+!4513 lt!583125 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!583124 () Unit!43003)

(declare-fun addStillNotContains!466 (ListLongMap!20333 (_ BitVec 64) V!51641 (_ BitVec 64)) Unit!43003)

(assert (=> b!1303416 (= lt!583124 (addStillNotContains!466 lt!583125 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1303416 (not (contains!8246 lt!583122 k0!1205))))

(assert (=> b!1303416 (= lt!583122 (+!4513 lt!583125 (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!583120 () Unit!43003)

(assert (=> b!1303416 (= lt!583120 (addStillNotContains!466 lt!583125 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6145 (array!86723 array!86725 (_ BitVec 32) (_ BitVec 32) V!51641 V!51641 (_ BitVec 32) Int) ListLongMap!20333)

(assert (=> b!1303416 (= lt!583125 (getCurrentListMapNoExtraKeys!6145 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun mapNonEmpty!53947 () Bool)

(declare-fun tp!102941 () Bool)

(declare-fun e!743460 () Bool)

(assert (=> mapNonEmpty!53947 (= mapRes!53947 (and tp!102941 e!743460))))

(declare-fun mapValue!53947 () ValueCell!16553)

(declare-fun mapKey!53947 () (_ BitVec 32))

(declare-fun mapRest!53947 () (Array (_ BitVec 32) ValueCell!16553))

(assert (=> mapNonEmpty!53947 (= (arr!41854 _values!1445) (store mapRest!53947 mapKey!53947 mapValue!53947))))

(declare-fun b!1303417 () Bool)

(declare-fun res!865726 () Bool)

(assert (=> b!1303417 (=> (not res!865726) (not e!743459))))

(assert (=> b!1303417 (= res!865726 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42405 _keys!1741))))))

(declare-fun b!1303418 () Bool)

(assert (=> b!1303418 (= e!743460 tp_is_empty!34903)))

(declare-fun b!1303419 () Bool)

(assert (=> b!1303419 (= e!743456 (and e!743457 mapRes!53947))))

(declare-fun condMapEmpty!53947 () Bool)

(declare-fun mapDefault!53947 () ValueCell!16553)

(assert (=> b!1303419 (= condMapEmpty!53947 (= (arr!41854 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16553)) mapDefault!53947)))))

(assert (= (and start!110064 res!865721) b!1303412))

(assert (= (and b!1303412 res!865724) b!1303408))

(assert (= (and b!1303408 res!865718) b!1303414))

(assert (= (and b!1303414 res!865720) b!1303415))

(assert (= (and b!1303415 res!865719) b!1303410))

(assert (= (and b!1303410 res!865723) b!1303417))

(assert (= (and b!1303417 res!865726) b!1303413))

(assert (= (and b!1303413 res!865725) b!1303409))

(assert (= (and b!1303409 (not res!865722)) b!1303416))

(assert (= (and b!1303419 condMapEmpty!53947) mapIsEmpty!53947))

(assert (= (and b!1303419 (not condMapEmpty!53947)) mapNonEmpty!53947))

(get-info :version)

(assert (= (and mapNonEmpty!53947 ((_ is ValueCellFull!16553) mapValue!53947)) b!1303418))

(assert (= (and b!1303419 ((_ is ValueCellFull!16553) mapDefault!53947)) b!1303411))

(assert (= start!110064 b!1303419))

(declare-fun m!1193875 () Bool)

(assert (=> start!110064 m!1193875))

(declare-fun m!1193877 () Bool)

(assert (=> start!110064 m!1193877))

(declare-fun m!1193879 () Bool)

(assert (=> start!110064 m!1193879))

(declare-fun m!1193881 () Bool)

(assert (=> b!1303409 m!1193881))

(declare-fun m!1193883 () Bool)

(assert (=> b!1303409 m!1193883))

(declare-fun m!1193885 () Bool)

(assert (=> b!1303408 m!1193885))

(declare-fun m!1193887 () Bool)

(assert (=> b!1303416 m!1193887))

(declare-fun m!1193889 () Bool)

(assert (=> b!1303416 m!1193889))

(declare-fun m!1193891 () Bool)

(assert (=> b!1303416 m!1193891))

(declare-fun m!1193893 () Bool)

(assert (=> b!1303416 m!1193893))

(assert (=> b!1303416 m!1193889))

(declare-fun m!1193895 () Bool)

(assert (=> b!1303416 m!1193895))

(declare-fun m!1193897 () Bool)

(assert (=> b!1303416 m!1193897))

(declare-fun m!1193899 () Bool)

(assert (=> b!1303416 m!1193899))

(declare-fun m!1193901 () Bool)

(assert (=> b!1303416 m!1193901))

(declare-fun m!1193903 () Bool)

(assert (=> b!1303410 m!1193903))

(assert (=> b!1303410 m!1193903))

(declare-fun m!1193905 () Bool)

(assert (=> b!1303410 m!1193905))

(declare-fun m!1193907 () Bool)

(assert (=> b!1303413 m!1193907))

(assert (=> b!1303413 m!1193907))

(declare-fun m!1193909 () Bool)

(assert (=> b!1303413 m!1193909))

(declare-fun m!1193911 () Bool)

(assert (=> mapNonEmpty!53947 m!1193911))

(declare-fun m!1193913 () Bool)

(assert (=> b!1303414 m!1193913))

(check-sat (not b!1303416) (not b!1303408) (not start!110064) (not b!1303409) (not b!1303410) (not mapNonEmpty!53947) b_and!47409 (not b!1303414) tp_is_empty!34903 (not b!1303413) (not b_next!29263))
(check-sat b_and!47409 (not b_next!29263))
