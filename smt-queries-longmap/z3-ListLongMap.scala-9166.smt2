; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110072 () Bool)

(assert start!110072)

(declare-fun b_free!29271 () Bool)

(declare-fun b_next!29271 () Bool)

(assert (=> start!110072 (= b_free!29271 (not b_next!29271))))

(declare-fun tp!102964 () Bool)

(declare-fun b_and!47435 () Bool)

(assert (=> start!110072 (= tp!102964 b_and!47435)))

(declare-fun b!1303627 () Bool)

(declare-fun res!865867 () Bool)

(declare-fun e!743566 () Bool)

(assert (=> b!1303627 (=> (not res!865867) (not e!743566))))

(declare-datatypes ((array!86832 0))(
  ( (array!86833 (arr!41907 (Array (_ BitVec 32) (_ BitVec 64))) (size!42457 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86832)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1303627 (= res!865867 (not (validKeyInArray!0 (select (arr!41907 _keys!1741) from!2144))))))

(declare-fun res!865869 () Bool)

(assert (=> start!110072 (=> (not res!865869) (not e!743566))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110072 (= res!865869 (validMask!0 mask!2175))))

(assert (=> start!110072 e!743566))

(declare-fun tp_is_empty!34911 () Bool)

(assert (=> start!110072 tp_is_empty!34911))

(assert (=> start!110072 true))

(declare-datatypes ((V!51651 0))(
  ( (V!51652 (val!17530 Int)) )
))
(declare-datatypes ((ValueCell!16557 0))(
  ( (ValueCellFull!16557 (v!20146 V!51651)) (EmptyCell!16557) )
))
(declare-datatypes ((array!86834 0))(
  ( (array!86835 (arr!41908 (Array (_ BitVec 32) ValueCell!16557)) (size!42458 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86834)

(declare-fun e!743570 () Bool)

(declare-fun array_inv!31693 (array!86834) Bool)

(assert (=> start!110072 (and (array_inv!31693 _values!1445) e!743570)))

(declare-fun array_inv!31694 (array!86832) Bool)

(assert (=> start!110072 (array_inv!31694 _keys!1741)))

(assert (=> start!110072 tp!102964))

(declare-fun b!1303628 () Bool)

(declare-fun res!865866 () Bool)

(assert (=> b!1303628 (=> (not res!865866) (not e!743566))))

(declare-datatypes ((List!29746 0))(
  ( (Nil!29743) (Cons!29742 (h!30951 (_ BitVec 64)) (t!43340 List!29746)) )
))
(declare-fun arrayNoDuplicates!0 (array!86832 (_ BitVec 32) List!29746) Bool)

(assert (=> b!1303628 (= res!865866 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29743))))

(declare-fun b!1303629 () Bool)

(declare-fun res!865868 () Bool)

(assert (=> b!1303629 (=> (not res!865868) (not e!743566))))

(assert (=> b!1303629 (= res!865868 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42457 _keys!1741))))))

(declare-fun b!1303630 () Bool)

(declare-fun res!865864 () Bool)

(assert (=> b!1303630 (=> (not res!865864) (not e!743566))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1303630 (= res!865864 (and (= (size!42458 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42457 _keys!1741) (size!42458 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1303631 () Bool)

(declare-fun res!865863 () Bool)

(assert (=> b!1303631 (=> (not res!865863) (not e!743566))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1303631 (= res!865863 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42457 _keys!1741))))))

(declare-fun b!1303632 () Bool)

(declare-fun e!743572 () Bool)

(assert (=> b!1303632 (= e!743572 tp_is_empty!34911)))

(declare-fun mapIsEmpty!53959 () Bool)

(declare-fun mapRes!53959 () Bool)

(assert (=> mapIsEmpty!53959 mapRes!53959))

(declare-fun b!1303633 () Bool)

(declare-fun e!743567 () Bool)

(assert (=> b!1303633 (= e!743570 (and e!743567 mapRes!53959))))

(declare-fun condMapEmpty!53959 () Bool)

(declare-fun mapDefault!53959 () ValueCell!16557)

(assert (=> b!1303633 (= condMapEmpty!53959 (= (arr!41908 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16557)) mapDefault!53959)))))

(declare-fun mapNonEmpty!53959 () Bool)

(declare-fun tp!102963 () Bool)

(assert (=> mapNonEmpty!53959 (= mapRes!53959 (and tp!102963 e!743572))))

(declare-fun mapKey!53959 () (_ BitVec 32))

(declare-fun mapRest!53959 () (Array (_ BitVec 32) ValueCell!16557))

(declare-fun mapValue!53959 () ValueCell!16557)

(assert (=> mapNonEmpty!53959 (= (arr!41908 _values!1445) (store mapRest!53959 mapKey!53959 mapValue!53959))))

(declare-fun b!1303634 () Bool)

(assert (=> b!1303634 (= e!743567 tp_is_empty!34911)))

(declare-fun b!1303635 () Bool)

(declare-fun e!743569 () Bool)

(declare-fun e!743571 () Bool)

(assert (=> b!1303635 (= e!743569 e!743571)))

(declare-fun res!865860 () Bool)

(assert (=> b!1303635 (=> (not res!865860) (not e!743571))))

(declare-fun minValue!1387 () V!51651)

(declare-fun zeroValue!1387 () V!51651)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22622 0))(
  ( (tuple2!22623 (_1!11322 (_ BitVec 64)) (_2!11322 V!51651)) )
))
(declare-datatypes ((List!29747 0))(
  ( (Nil!29744) (Cons!29743 (h!30952 tuple2!22622) (t!43341 List!29747)) )
))
(declare-datatypes ((ListLongMap!20279 0))(
  ( (ListLongMap!20280 (toList!10155 List!29747)) )
))
(declare-fun contains!8291 (ListLongMap!20279 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!6113 (array!86832 array!86834 (_ BitVec 32) (_ BitVec 32) V!51651 V!51651 (_ BitVec 32) Int) ListLongMap!20279)

(assert (=> b!1303635 (= res!865860 (not (contains!8291 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205)))))

(declare-fun b!1303636 () Bool)

(assert (=> b!1303636 (= e!743571 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!1205)))))

(declare-fun b!1303637 () Bool)

(assert (=> b!1303637 (= e!743566 (not e!743569))))

(declare-fun res!865862 () Bool)

(assert (=> b!1303637 (=> res!865862 e!743569)))

(assert (=> b!1303637 (= res!865862 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1303637 (not (contains!8291 (ListLongMap!20280 Nil!29744) k0!1205))))

(declare-datatypes ((Unit!43164 0))(
  ( (Unit!43165) )
))
(declare-fun lt!583353 () Unit!43164)

(declare-fun emptyContainsNothing!219 ((_ BitVec 64)) Unit!43164)

(assert (=> b!1303637 (= lt!583353 (emptyContainsNothing!219 k0!1205))))

(declare-fun b!1303638 () Bool)

(declare-fun res!865865 () Bool)

(assert (=> b!1303638 (=> (not res!865865) (not e!743566))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86832 (_ BitVec 32)) Bool)

(assert (=> b!1303638 (= res!865865 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1303639 () Bool)

(declare-fun res!865861 () Bool)

(assert (=> b!1303639 (=> (not res!865861) (not e!743566))))

(declare-fun getCurrentListMap!5176 (array!86832 array!86834 (_ BitVec 32) (_ BitVec 32) V!51651 V!51651 (_ BitVec 32) Int) ListLongMap!20279)

(assert (=> b!1303639 (= res!865861 (contains!8291 (getCurrentListMap!5176 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!110072 res!865869) b!1303630))

(assert (= (and b!1303630 res!865864) b!1303638))

(assert (= (and b!1303638 res!865865) b!1303628))

(assert (= (and b!1303628 res!865866) b!1303629))

(assert (= (and b!1303629 res!865868) b!1303639))

(assert (= (and b!1303639 res!865861) b!1303631))

(assert (= (and b!1303631 res!865863) b!1303627))

(assert (= (and b!1303627 res!865867) b!1303637))

(assert (= (and b!1303637 (not res!865862)) b!1303635))

(assert (= (and b!1303635 res!865860) b!1303636))

(assert (= (and b!1303633 condMapEmpty!53959) mapIsEmpty!53959))

(assert (= (and b!1303633 (not condMapEmpty!53959)) mapNonEmpty!53959))

(get-info :version)

(assert (= (and mapNonEmpty!53959 ((_ is ValueCellFull!16557) mapValue!53959)) b!1303632))

(assert (= (and b!1303633 ((_ is ValueCellFull!16557) mapDefault!53959)) b!1303634))

(assert (= start!110072 b!1303633))

(declare-fun m!1194539 () Bool)

(assert (=> b!1303635 m!1194539))

(assert (=> b!1303635 m!1194539))

(declare-fun m!1194541 () Bool)

(assert (=> b!1303635 m!1194541))

(declare-fun m!1194543 () Bool)

(assert (=> b!1303638 m!1194543))

(declare-fun m!1194545 () Bool)

(assert (=> b!1303637 m!1194545))

(declare-fun m!1194547 () Bool)

(assert (=> b!1303637 m!1194547))

(declare-fun m!1194549 () Bool)

(assert (=> b!1303628 m!1194549))

(declare-fun m!1194551 () Bool)

(assert (=> start!110072 m!1194551))

(declare-fun m!1194553 () Bool)

(assert (=> start!110072 m!1194553))

(declare-fun m!1194555 () Bool)

(assert (=> start!110072 m!1194555))

(declare-fun m!1194557 () Bool)

(assert (=> b!1303639 m!1194557))

(assert (=> b!1303639 m!1194557))

(declare-fun m!1194559 () Bool)

(assert (=> b!1303639 m!1194559))

(declare-fun m!1194561 () Bool)

(assert (=> mapNonEmpty!53959 m!1194561))

(declare-fun m!1194563 () Bool)

(assert (=> b!1303627 m!1194563))

(assert (=> b!1303627 m!1194563))

(declare-fun m!1194565 () Bool)

(assert (=> b!1303627 m!1194565))

(check-sat (not mapNonEmpty!53959) (not b!1303638) (not b_next!29271) tp_is_empty!34911 (not b!1303635) (not b!1303627) (not start!110072) b_and!47435 (not b!1303628) (not b!1303639) (not b!1303637))
(check-sat b_and!47435 (not b_next!29271))
(get-model)

(declare-fun d!141649 () Bool)

(assert (=> d!141649 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!110072 d!141649))

(declare-fun d!141651 () Bool)

(assert (=> d!141651 (= (array_inv!31693 _values!1445) (bvsge (size!42458 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!110072 d!141651))

(declare-fun d!141653 () Bool)

(assert (=> d!141653 (= (array_inv!31694 _keys!1741) (bvsge (size!42457 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!110072 d!141653))

(declare-fun d!141655 () Bool)

(assert (=> d!141655 (= (validKeyInArray!0 (select (arr!41907 _keys!1741) from!2144)) (and (not (= (select (arr!41907 _keys!1741) from!2144) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41907 _keys!1741) from!2144) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1303627 d!141655))

(declare-fun d!141657 () Bool)

(declare-fun e!743598 () Bool)

(assert (=> d!141657 e!743598))

(declare-fun res!865902 () Bool)

(assert (=> d!141657 (=> res!865902 e!743598)))

(declare-fun lt!583365 () Bool)

(assert (=> d!141657 (= res!865902 (not lt!583365))))

(declare-fun lt!583366 () Bool)

(assert (=> d!141657 (= lt!583365 lt!583366)))

(declare-fun lt!583368 () Unit!43164)

(declare-fun e!743599 () Unit!43164)

(assert (=> d!141657 (= lt!583368 e!743599)))

(declare-fun c!125107 () Bool)

(assert (=> d!141657 (= c!125107 lt!583366)))

(declare-fun containsKey!727 (List!29747 (_ BitVec 64)) Bool)

(assert (=> d!141657 (= lt!583366 (containsKey!727 (toList!10155 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!141657 (= (contains!8291 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!583365)))

(declare-fun b!1303685 () Bool)

(declare-fun lt!583367 () Unit!43164)

(assert (=> b!1303685 (= e!743599 lt!583367)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!473 (List!29747 (_ BitVec 64)) Unit!43164)

(assert (=> b!1303685 (= lt!583367 (lemmaContainsKeyImpliesGetValueByKeyDefined!473 (toList!10155 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-datatypes ((Option!757 0))(
  ( (Some!756 (v!20148 V!51651)) (None!755) )
))
(declare-fun isDefined!512 (Option!757) Bool)

(declare-fun getValueByKey!705 (List!29747 (_ BitVec 64)) Option!757)

(assert (=> b!1303685 (isDefined!512 (getValueByKey!705 (toList!10155 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1303686 () Bool)

(declare-fun Unit!43166 () Unit!43164)

(assert (=> b!1303686 (= e!743599 Unit!43166)))

(declare-fun b!1303687 () Bool)

(assert (=> b!1303687 (= e!743598 (isDefined!512 (getValueByKey!705 (toList!10155 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141657 c!125107) b!1303685))

(assert (= (and d!141657 (not c!125107)) b!1303686))

(assert (= (and d!141657 (not res!865902)) b!1303687))

(declare-fun m!1194595 () Bool)

(assert (=> d!141657 m!1194595))

(declare-fun m!1194597 () Bool)

(assert (=> b!1303685 m!1194597))

(declare-fun m!1194599 () Bool)

(assert (=> b!1303685 m!1194599))

(assert (=> b!1303685 m!1194599))

(declare-fun m!1194601 () Bool)

(assert (=> b!1303685 m!1194601))

(assert (=> b!1303687 m!1194599))

(assert (=> b!1303687 m!1194599))

(assert (=> b!1303687 m!1194601))

(assert (=> b!1303635 d!141657))

(declare-fun b!1303712 () Bool)

(declare-fun res!865914 () Bool)

(declare-fun e!743616 () Bool)

(assert (=> b!1303712 (=> (not res!865914) (not e!743616))))

(declare-fun lt!583388 () ListLongMap!20279)

(assert (=> b!1303712 (= res!865914 (not (contains!8291 lt!583388 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1303713 () Bool)

(declare-fun e!743619 () Bool)

(assert (=> b!1303713 (= e!743616 e!743619)))

(declare-fun c!125117 () Bool)

(declare-fun e!743620 () Bool)

(assert (=> b!1303713 (= c!125117 e!743620)))

(declare-fun res!865911 () Bool)

(assert (=> b!1303713 (=> (not res!865911) (not e!743620))))

(assert (=> b!1303713 (= res!865911 (bvslt from!2144 (size!42457 _keys!1741)))))

(declare-fun b!1303714 () Bool)

(declare-fun e!743618 () Bool)

(assert (=> b!1303714 (= e!743619 e!743618)))

(declare-fun c!125118 () Bool)

(assert (=> b!1303714 (= c!125118 (bvslt from!2144 (size!42457 _keys!1741)))))

(declare-fun b!1303715 () Bool)

(declare-fun isEmpty!1062 (ListLongMap!20279) Bool)

(assert (=> b!1303715 (= e!743618 (isEmpty!1062 lt!583388))))

(declare-fun b!1303717 () Bool)

(assert (=> b!1303717 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42457 _keys!1741)))))

(assert (=> b!1303717 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42458 _values!1445)))))

(declare-fun e!743615 () Bool)

(declare-fun apply!1022 (ListLongMap!20279 (_ BitVec 64)) V!51651)

(declare-fun get!21166 (ValueCell!16557 V!51651) V!51651)

(declare-fun dynLambda!3429 (Int (_ BitVec 64)) V!51651)

(assert (=> b!1303717 (= e!743615 (= (apply!1022 lt!583388 (select (arr!41907 _keys!1741) from!2144)) (get!21166 (select (arr!41908 _values!1445) from!2144) (dynLambda!3429 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1303718 () Bool)

(assert (=> b!1303718 (= e!743618 (= lt!583388 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun b!1303719 () Bool)

(assert (=> b!1303719 (= e!743620 (validKeyInArray!0 (select (arr!41907 _keys!1741) from!2144)))))

(assert (=> b!1303719 (bvsge from!2144 #b00000000000000000000000000000000)))

(declare-fun b!1303720 () Bool)

(declare-fun e!743614 () ListLongMap!20279)

(assert (=> b!1303720 (= e!743614 (ListLongMap!20280 Nil!29744))))

(declare-fun b!1303721 () Bool)

(declare-fun lt!583383 () Unit!43164)

(declare-fun lt!583385 () Unit!43164)

(assert (=> b!1303721 (= lt!583383 lt!583385)))

(declare-fun lt!583389 () (_ BitVec 64))

(declare-fun lt!583384 () ListLongMap!20279)

(declare-fun lt!583386 () V!51651)

(declare-fun lt!583387 () (_ BitVec 64))

(declare-fun +!4479 (ListLongMap!20279 tuple2!22622) ListLongMap!20279)

(assert (=> b!1303721 (not (contains!8291 (+!4479 lt!583384 (tuple2!22623 lt!583387 lt!583386)) lt!583389))))

(declare-fun addStillNotContains!476 (ListLongMap!20279 (_ BitVec 64) V!51651 (_ BitVec 64)) Unit!43164)

(assert (=> b!1303721 (= lt!583385 (addStillNotContains!476 lt!583384 lt!583387 lt!583386 lt!583389))))

(assert (=> b!1303721 (= lt!583389 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1303721 (= lt!583386 (get!21166 (select (arr!41908 _values!1445) from!2144) (dynLambda!3429 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1303721 (= lt!583387 (select (arr!41907 _keys!1741) from!2144))))

(declare-fun call!64209 () ListLongMap!20279)

(assert (=> b!1303721 (= lt!583384 call!64209)))

(declare-fun e!743617 () ListLongMap!20279)

(assert (=> b!1303721 (= e!743617 (+!4479 call!64209 (tuple2!22623 (select (arr!41907 _keys!1741) from!2144) (get!21166 (select (arr!41908 _values!1445) from!2144) (dynLambda!3429 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1303722 () Bool)

(assert (=> b!1303722 (= e!743619 e!743615)))

(assert (=> b!1303722 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42457 _keys!1741)))))

(declare-fun res!865913 () Bool)

(assert (=> b!1303722 (= res!865913 (contains!8291 lt!583388 (select (arr!41907 _keys!1741) from!2144)))))

(assert (=> b!1303722 (=> (not res!865913) (not e!743615))))

(declare-fun d!141659 () Bool)

(assert (=> d!141659 e!743616))

(declare-fun res!865912 () Bool)

(assert (=> d!141659 (=> (not res!865912) (not e!743616))))

(assert (=> d!141659 (= res!865912 (not (contains!8291 lt!583388 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!141659 (= lt!583388 e!743614)))

(declare-fun c!125119 () Bool)

(assert (=> d!141659 (= c!125119 (bvsge from!2144 (size!42457 _keys!1741)))))

(assert (=> d!141659 (validMask!0 mask!2175)))

(assert (=> d!141659 (= (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!583388)))

(declare-fun b!1303716 () Bool)

(assert (=> b!1303716 (= e!743617 call!64209)))

(declare-fun b!1303723 () Bool)

(assert (=> b!1303723 (= e!743614 e!743617)))

(declare-fun c!125116 () Bool)

(assert (=> b!1303723 (= c!125116 (validKeyInArray!0 (select (arr!41907 _keys!1741) from!2144)))))

(declare-fun bm!64206 () Bool)

(assert (=> bm!64206 (= call!64209 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448))))

(assert (= (and d!141659 c!125119) b!1303720))

(assert (= (and d!141659 (not c!125119)) b!1303723))

(assert (= (and b!1303723 c!125116) b!1303721))

(assert (= (and b!1303723 (not c!125116)) b!1303716))

(assert (= (or b!1303721 b!1303716) bm!64206))

(assert (= (and d!141659 res!865912) b!1303712))

(assert (= (and b!1303712 res!865914) b!1303713))

(assert (= (and b!1303713 res!865911) b!1303719))

(assert (= (and b!1303713 c!125117) b!1303722))

(assert (= (and b!1303713 (not c!125117)) b!1303714))

(assert (= (and b!1303722 res!865913) b!1303717))

(assert (= (and b!1303714 c!125118) b!1303718))

(assert (= (and b!1303714 (not c!125118)) b!1303715))

(declare-fun b_lambda!23275 () Bool)

(assert (=> (not b_lambda!23275) (not b!1303717)))

(declare-fun t!43344 () Bool)

(declare-fun tb!11399 () Bool)

(assert (=> (and start!110072 (= defaultEntry!1448 defaultEntry!1448) t!43344) tb!11399))

(declare-fun result!23819 () Bool)

(assert (=> tb!11399 (= result!23819 tp_is_empty!34911)))

(assert (=> b!1303717 t!43344))

(declare-fun b_and!47439 () Bool)

(assert (= b_and!47435 (and (=> t!43344 result!23819) b_and!47439)))

(declare-fun b_lambda!23277 () Bool)

(assert (=> (not b_lambda!23277) (not b!1303721)))

(assert (=> b!1303721 t!43344))

(declare-fun b_and!47441 () Bool)

(assert (= b_and!47439 (and (=> t!43344 result!23819) b_and!47441)))

(declare-fun m!1194603 () Bool)

(assert (=> bm!64206 m!1194603))

(declare-fun m!1194605 () Bool)

(assert (=> b!1303721 m!1194605))

(declare-fun m!1194607 () Bool)

(assert (=> b!1303721 m!1194607))

(declare-fun m!1194609 () Bool)

(assert (=> b!1303721 m!1194609))

(declare-fun m!1194611 () Bool)

(assert (=> b!1303721 m!1194611))

(assert (=> b!1303721 m!1194609))

(declare-fun m!1194613 () Bool)

(assert (=> b!1303721 m!1194613))

(assert (=> b!1303721 m!1194607))

(assert (=> b!1303721 m!1194605))

(declare-fun m!1194615 () Bool)

(assert (=> b!1303721 m!1194615))

(declare-fun m!1194617 () Bool)

(assert (=> b!1303721 m!1194617))

(assert (=> b!1303721 m!1194563))

(declare-fun m!1194619 () Bool)

(assert (=> b!1303715 m!1194619))

(assert (=> b!1303719 m!1194563))

(assert (=> b!1303719 m!1194563))

(assert (=> b!1303719 m!1194565))

(assert (=> b!1303723 m!1194563))

(assert (=> b!1303723 m!1194563))

(assert (=> b!1303723 m!1194565))

(assert (=> b!1303722 m!1194563))

(assert (=> b!1303722 m!1194563))

(declare-fun m!1194621 () Bool)

(assert (=> b!1303722 m!1194621))

(declare-fun m!1194623 () Bool)

(assert (=> d!141659 m!1194623))

(assert (=> d!141659 m!1194551))

(assert (=> b!1303717 m!1194563))

(declare-fun m!1194625 () Bool)

(assert (=> b!1303717 m!1194625))

(assert (=> b!1303717 m!1194607))

(assert (=> b!1303717 m!1194609))

(assert (=> b!1303717 m!1194611))

(assert (=> b!1303717 m!1194609))

(assert (=> b!1303717 m!1194563))

(assert (=> b!1303717 m!1194607))

(assert (=> b!1303718 m!1194603))

(declare-fun m!1194627 () Bool)

(assert (=> b!1303712 m!1194627))

(assert (=> b!1303635 d!141659))

(declare-fun d!141661 () Bool)

(declare-fun e!743621 () Bool)

(assert (=> d!141661 e!743621))

(declare-fun res!865915 () Bool)

(assert (=> d!141661 (=> res!865915 e!743621)))

(declare-fun lt!583390 () Bool)

(assert (=> d!141661 (= res!865915 (not lt!583390))))

(declare-fun lt!583391 () Bool)

(assert (=> d!141661 (= lt!583390 lt!583391)))

(declare-fun lt!583393 () Unit!43164)

(declare-fun e!743622 () Unit!43164)

(assert (=> d!141661 (= lt!583393 e!743622)))

(declare-fun c!125120 () Bool)

(assert (=> d!141661 (= c!125120 lt!583391)))

(assert (=> d!141661 (= lt!583391 (containsKey!727 (toList!10155 (getCurrentListMap!5176 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!141661 (= (contains!8291 (getCurrentListMap!5176 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!583390)))

(declare-fun b!1303726 () Bool)

(declare-fun lt!583392 () Unit!43164)

(assert (=> b!1303726 (= e!743622 lt!583392)))

(assert (=> b!1303726 (= lt!583392 (lemmaContainsKeyImpliesGetValueByKeyDefined!473 (toList!10155 (getCurrentListMap!5176 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> b!1303726 (isDefined!512 (getValueByKey!705 (toList!10155 (getCurrentListMap!5176 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1303727 () Bool)

(declare-fun Unit!43167 () Unit!43164)

(assert (=> b!1303727 (= e!743622 Unit!43167)))

(declare-fun b!1303728 () Bool)

(assert (=> b!1303728 (= e!743621 (isDefined!512 (getValueByKey!705 (toList!10155 (getCurrentListMap!5176 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141661 c!125120) b!1303726))

(assert (= (and d!141661 (not c!125120)) b!1303727))

(assert (= (and d!141661 (not res!865915)) b!1303728))

(declare-fun m!1194629 () Bool)

(assert (=> d!141661 m!1194629))

(declare-fun m!1194631 () Bool)

(assert (=> b!1303726 m!1194631))

(declare-fun m!1194633 () Bool)

(assert (=> b!1303726 m!1194633))

(assert (=> b!1303726 m!1194633))

(declare-fun m!1194635 () Bool)

(assert (=> b!1303726 m!1194635))

(assert (=> b!1303728 m!1194633))

(assert (=> b!1303728 m!1194633))

(assert (=> b!1303728 m!1194635))

(assert (=> b!1303639 d!141661))

(declare-fun b!1303771 () Bool)

(declare-fun e!743661 () ListLongMap!20279)

(declare-fun call!64229 () ListLongMap!20279)

(assert (=> b!1303771 (= e!743661 call!64229)))

(declare-fun bm!64221 () Bool)

(declare-fun call!64224 () Bool)

(declare-fun lt!583441 () ListLongMap!20279)

(assert (=> bm!64221 (= call!64224 (contains!8291 lt!583441 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!64225 () ListLongMap!20279)

(declare-fun bm!64222 () Bool)

(assert (=> bm!64222 (= call!64225 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1303772 () Bool)

(declare-fun e!743649 () Unit!43164)

(declare-fun lt!583438 () Unit!43164)

(assert (=> b!1303772 (= e!743649 lt!583438)))

(declare-fun lt!583444 () ListLongMap!20279)

(assert (=> b!1303772 (= lt!583444 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583458 () (_ BitVec 64))

(assert (=> b!1303772 (= lt!583458 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583450 () (_ BitVec 64))

(assert (=> b!1303772 (= lt!583450 (select (arr!41907 _keys!1741) from!2144))))

(declare-fun lt!583439 () Unit!43164)

(declare-fun addStillContains!1110 (ListLongMap!20279 (_ BitVec 64) V!51651 (_ BitVec 64)) Unit!43164)

(assert (=> b!1303772 (= lt!583439 (addStillContains!1110 lt!583444 lt!583458 zeroValue!1387 lt!583450))))

(assert (=> b!1303772 (contains!8291 (+!4479 lt!583444 (tuple2!22623 lt!583458 zeroValue!1387)) lt!583450)))

(declare-fun lt!583447 () Unit!43164)

(assert (=> b!1303772 (= lt!583447 lt!583439)))

(declare-fun lt!583451 () ListLongMap!20279)

(assert (=> b!1303772 (= lt!583451 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583454 () (_ BitVec 64))

(assert (=> b!1303772 (= lt!583454 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583446 () (_ BitVec 64))

(assert (=> b!1303772 (= lt!583446 (select (arr!41907 _keys!1741) from!2144))))

(declare-fun lt!583455 () Unit!43164)

(declare-fun addApplyDifferent!564 (ListLongMap!20279 (_ BitVec 64) V!51651 (_ BitVec 64)) Unit!43164)

(assert (=> b!1303772 (= lt!583455 (addApplyDifferent!564 lt!583451 lt!583454 minValue!1387 lt!583446))))

(assert (=> b!1303772 (= (apply!1022 (+!4479 lt!583451 (tuple2!22623 lt!583454 minValue!1387)) lt!583446) (apply!1022 lt!583451 lt!583446))))

(declare-fun lt!583445 () Unit!43164)

(assert (=> b!1303772 (= lt!583445 lt!583455)))

(declare-fun lt!583456 () ListLongMap!20279)

(assert (=> b!1303772 (= lt!583456 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583459 () (_ BitVec 64))

(assert (=> b!1303772 (= lt!583459 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583442 () (_ BitVec 64))

(assert (=> b!1303772 (= lt!583442 (select (arr!41907 _keys!1741) from!2144))))

(declare-fun lt!583452 () Unit!43164)

(assert (=> b!1303772 (= lt!583452 (addApplyDifferent!564 lt!583456 lt!583459 zeroValue!1387 lt!583442))))

(assert (=> b!1303772 (= (apply!1022 (+!4479 lt!583456 (tuple2!22623 lt!583459 zeroValue!1387)) lt!583442) (apply!1022 lt!583456 lt!583442))))

(declare-fun lt!583449 () Unit!43164)

(assert (=> b!1303772 (= lt!583449 lt!583452)))

(declare-fun lt!583453 () ListLongMap!20279)

(assert (=> b!1303772 (= lt!583453 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583440 () (_ BitVec 64))

(assert (=> b!1303772 (= lt!583440 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583443 () (_ BitVec 64))

(assert (=> b!1303772 (= lt!583443 (select (arr!41907 _keys!1741) from!2144))))

(assert (=> b!1303772 (= lt!583438 (addApplyDifferent!564 lt!583453 lt!583440 minValue!1387 lt!583443))))

(assert (=> b!1303772 (= (apply!1022 (+!4479 lt!583453 (tuple2!22623 lt!583440 minValue!1387)) lt!583443) (apply!1022 lt!583453 lt!583443))))

(declare-fun b!1303773 () Bool)

(declare-fun e!743657 () Bool)

(declare-fun e!743653 () Bool)

(assert (=> b!1303773 (= e!743657 e!743653)))

(declare-fun res!865940 () Bool)

(assert (=> b!1303773 (=> (not res!865940) (not e!743653))))

(assert (=> b!1303773 (= res!865940 (contains!8291 lt!583441 (select (arr!41907 _keys!1741) from!2144)))))

(assert (=> b!1303773 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42457 _keys!1741)))))

(declare-fun bm!64223 () Bool)

(declare-fun call!64226 () ListLongMap!20279)

(assert (=> bm!64223 (= call!64229 call!64226)))

(declare-fun b!1303774 () Bool)

(declare-fun e!743651 () Bool)

(declare-fun e!743654 () Bool)

(assert (=> b!1303774 (= e!743651 e!743654)))

(declare-fun res!865942 () Bool)

(assert (=> b!1303774 (= res!865942 call!64224)))

(assert (=> b!1303774 (=> (not res!865942) (not e!743654))))

(declare-fun bm!64224 () Bool)

(declare-fun call!64230 () ListLongMap!20279)

(declare-fun call!64227 () ListLongMap!20279)

(assert (=> bm!64224 (= call!64230 call!64227)))

(declare-fun b!1303775 () Bool)

(assert (=> b!1303775 (= e!743651 (not call!64224))))

(declare-fun bm!64225 () Bool)

(declare-fun c!125138 () Bool)

(declare-fun c!125135 () Bool)

(assert (=> bm!64225 (= call!64227 (+!4479 (ite c!125138 call!64225 (ite c!125135 call!64226 call!64229)) (ite (or c!125138 c!125135) (tuple2!22623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22623 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1303776 () Bool)

(declare-fun e!743656 () Bool)

(assert (=> b!1303776 (= e!743656 (validKeyInArray!0 (select (arr!41907 _keys!1741) from!2144)))))

(declare-fun b!1303777 () Bool)

(assert (=> b!1303777 (= e!743654 (= (apply!1022 lt!583441 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun b!1303778 () Bool)

(declare-fun e!743660 () Bool)

(assert (=> b!1303778 (= e!743660 (validKeyInArray!0 (select (arr!41907 _keys!1741) from!2144)))))

(declare-fun b!1303779 () Bool)

(declare-fun e!743658 () Bool)

(declare-fun call!64228 () Bool)

(assert (=> b!1303779 (= e!743658 (not call!64228))))

(declare-fun b!1303780 () Bool)

(assert (=> b!1303780 (= e!743653 (= (apply!1022 lt!583441 (select (arr!41907 _keys!1741) from!2144)) (get!21166 (select (arr!41908 _values!1445) from!2144) (dynLambda!3429 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1303780 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42458 _values!1445)))))

(assert (=> b!1303780 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42457 _keys!1741)))))

(declare-fun b!1303781 () Bool)

(declare-fun c!125136 () Bool)

(assert (=> b!1303781 (= c!125136 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!743655 () ListLongMap!20279)

(assert (=> b!1303781 (= e!743655 e!743661)))

(declare-fun b!1303782 () Bool)

(declare-fun e!743659 () ListLongMap!20279)

(assert (=> b!1303782 (= e!743659 e!743655)))

(assert (=> b!1303782 (= c!125135 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1303783 () Bool)

(assert (=> b!1303783 (= e!743659 (+!4479 call!64227 (tuple2!22623 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun bm!64226 () Bool)

(assert (=> bm!64226 (= call!64228 (contains!8291 lt!583441 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!141663 () Bool)

(declare-fun e!743650 () Bool)

(assert (=> d!141663 e!743650))

(declare-fun res!865936 () Bool)

(assert (=> d!141663 (=> (not res!865936) (not e!743650))))

(assert (=> d!141663 (= res!865936 (or (bvsge from!2144 (size!42457 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42457 _keys!1741)))))))

(declare-fun lt!583448 () ListLongMap!20279)

(assert (=> d!141663 (= lt!583441 lt!583448)))

(declare-fun lt!583457 () Unit!43164)

(assert (=> d!141663 (= lt!583457 e!743649)))

(declare-fun c!125133 () Bool)

(assert (=> d!141663 (= c!125133 e!743660)))

(declare-fun res!865938 () Bool)

(assert (=> d!141663 (=> (not res!865938) (not e!743660))))

(assert (=> d!141663 (= res!865938 (bvslt from!2144 (size!42457 _keys!1741)))))

(assert (=> d!141663 (= lt!583448 e!743659)))

(assert (=> d!141663 (= c!125138 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!141663 (validMask!0 mask!2175)))

(assert (=> d!141663 (= (getCurrentListMap!5176 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!583441)))

(declare-fun b!1303784 () Bool)

(assert (=> b!1303784 (= e!743650 e!743651)))

(declare-fun c!125137 () Bool)

(assert (=> b!1303784 (= c!125137 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1303785 () Bool)

(declare-fun res!865941 () Bool)

(assert (=> b!1303785 (=> (not res!865941) (not e!743650))))

(assert (=> b!1303785 (= res!865941 e!743657)))

(declare-fun res!865935 () Bool)

(assert (=> b!1303785 (=> res!865935 e!743657)))

(assert (=> b!1303785 (= res!865935 (not e!743656))))

(declare-fun res!865939 () Bool)

(assert (=> b!1303785 (=> (not res!865939) (not e!743656))))

(assert (=> b!1303785 (= res!865939 (bvslt from!2144 (size!42457 _keys!1741)))))

(declare-fun b!1303786 () Bool)

(declare-fun e!743652 () Bool)

(assert (=> b!1303786 (= e!743652 (= (apply!1022 lt!583441 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun b!1303787 () Bool)

(declare-fun Unit!43168 () Unit!43164)

(assert (=> b!1303787 (= e!743649 Unit!43168)))

(declare-fun b!1303788 () Bool)

(assert (=> b!1303788 (= e!743661 call!64230)))

(declare-fun b!1303789 () Bool)

(assert (=> b!1303789 (= e!743658 e!743652)))

(declare-fun res!865934 () Bool)

(assert (=> b!1303789 (= res!865934 call!64228)))

(assert (=> b!1303789 (=> (not res!865934) (not e!743652))))

(declare-fun b!1303790 () Bool)

(assert (=> b!1303790 (= e!743655 call!64230)))

(declare-fun bm!64227 () Bool)

(assert (=> bm!64227 (= call!64226 call!64225)))

(declare-fun b!1303791 () Bool)

(declare-fun res!865937 () Bool)

(assert (=> b!1303791 (=> (not res!865937) (not e!743650))))

(assert (=> b!1303791 (= res!865937 e!743658)))

(declare-fun c!125134 () Bool)

(assert (=> b!1303791 (= c!125134 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!141663 c!125138) b!1303783))

(assert (= (and d!141663 (not c!125138)) b!1303782))

(assert (= (and b!1303782 c!125135) b!1303790))

(assert (= (and b!1303782 (not c!125135)) b!1303781))

(assert (= (and b!1303781 c!125136) b!1303788))

(assert (= (and b!1303781 (not c!125136)) b!1303771))

(assert (= (or b!1303788 b!1303771) bm!64223))

(assert (= (or b!1303790 bm!64223) bm!64227))

(assert (= (or b!1303790 b!1303788) bm!64224))

(assert (= (or b!1303783 bm!64227) bm!64222))

(assert (= (or b!1303783 bm!64224) bm!64225))

(assert (= (and d!141663 res!865938) b!1303778))

(assert (= (and d!141663 c!125133) b!1303772))

(assert (= (and d!141663 (not c!125133)) b!1303787))

(assert (= (and d!141663 res!865936) b!1303785))

(assert (= (and b!1303785 res!865939) b!1303776))

(assert (= (and b!1303785 (not res!865935)) b!1303773))

(assert (= (and b!1303773 res!865940) b!1303780))

(assert (= (and b!1303785 res!865941) b!1303791))

(assert (= (and b!1303791 c!125134) b!1303789))

(assert (= (and b!1303791 (not c!125134)) b!1303779))

(assert (= (and b!1303789 res!865934) b!1303786))

(assert (= (or b!1303789 b!1303779) bm!64226))

(assert (= (and b!1303791 res!865937) b!1303784))

(assert (= (and b!1303784 c!125137) b!1303774))

(assert (= (and b!1303784 (not c!125137)) b!1303775))

(assert (= (and b!1303774 res!865942) b!1303777))

(assert (= (or b!1303774 b!1303775) bm!64221))

(declare-fun b_lambda!23279 () Bool)

(assert (=> (not b_lambda!23279) (not b!1303780)))

(assert (=> b!1303780 t!43344))

(declare-fun b_and!47443 () Bool)

(assert (= b_and!47441 (and (=> t!43344 result!23819) b_and!47443)))

(assert (=> b!1303776 m!1194563))

(assert (=> b!1303776 m!1194563))

(assert (=> b!1303776 m!1194565))

(declare-fun m!1194637 () Bool)

(assert (=> bm!64225 m!1194637))

(assert (=> b!1303778 m!1194563))

(assert (=> b!1303778 m!1194563))

(assert (=> b!1303778 m!1194565))

(assert (=> bm!64222 m!1194539))

(assert (=> b!1303772 m!1194539))

(declare-fun m!1194639 () Bool)

(assert (=> b!1303772 m!1194639))

(declare-fun m!1194641 () Bool)

(assert (=> b!1303772 m!1194641))

(declare-fun m!1194643 () Bool)

(assert (=> b!1303772 m!1194643))

(declare-fun m!1194645 () Bool)

(assert (=> b!1303772 m!1194645))

(declare-fun m!1194647 () Bool)

(assert (=> b!1303772 m!1194647))

(declare-fun m!1194649 () Bool)

(assert (=> b!1303772 m!1194649))

(declare-fun m!1194651 () Bool)

(assert (=> b!1303772 m!1194651))

(assert (=> b!1303772 m!1194649))

(declare-fun m!1194653 () Bool)

(assert (=> b!1303772 m!1194653))

(declare-fun m!1194655 () Bool)

(assert (=> b!1303772 m!1194655))

(declare-fun m!1194657 () Bool)

(assert (=> b!1303772 m!1194657))

(assert (=> b!1303772 m!1194563))

(assert (=> b!1303772 m!1194653))

(declare-fun m!1194659 () Bool)

(assert (=> b!1303772 m!1194659))

(assert (=> b!1303772 m!1194643))

(declare-fun m!1194661 () Bool)

(assert (=> b!1303772 m!1194661))

(declare-fun m!1194663 () Bool)

(assert (=> b!1303772 m!1194663))

(assert (=> b!1303772 m!1194663))

(declare-fun m!1194665 () Bool)

(assert (=> b!1303772 m!1194665))

(declare-fun m!1194667 () Bool)

(assert (=> b!1303772 m!1194667))

(assert (=> b!1303773 m!1194563))

(assert (=> b!1303773 m!1194563))

(declare-fun m!1194669 () Bool)

(assert (=> b!1303773 m!1194669))

(declare-fun m!1194671 () Bool)

(assert (=> bm!64221 m!1194671))

(assert (=> b!1303780 m!1194607))

(assert (=> b!1303780 m!1194609))

(assert (=> b!1303780 m!1194611))

(assert (=> b!1303780 m!1194563))

(declare-fun m!1194673 () Bool)

(assert (=> b!1303780 m!1194673))

(assert (=> b!1303780 m!1194607))

(assert (=> b!1303780 m!1194609))

(assert (=> b!1303780 m!1194563))

(declare-fun m!1194675 () Bool)

(assert (=> b!1303777 m!1194675))

(declare-fun m!1194677 () Bool)

(assert (=> b!1303783 m!1194677))

(assert (=> d!141663 m!1194551))

(declare-fun m!1194679 () Bool)

(assert (=> bm!64226 m!1194679))

(declare-fun m!1194681 () Bool)

(assert (=> b!1303786 m!1194681))

(assert (=> b!1303639 d!141663))

(declare-fun b!1303800 () Bool)

(declare-fun e!743669 () Bool)

(declare-fun e!743670 () Bool)

(assert (=> b!1303800 (= e!743669 e!743670)))

(declare-fun c!125141 () Bool)

(assert (=> b!1303800 (= c!125141 (validKeyInArray!0 (select (arr!41907 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1303801 () Bool)

(declare-fun e!743668 () Bool)

(assert (=> b!1303801 (= e!743670 e!743668)))

(declare-fun lt!583468 () (_ BitVec 64))

(assert (=> b!1303801 (= lt!583468 (select (arr!41907 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!583466 () Unit!43164)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86832 (_ BitVec 64) (_ BitVec 32)) Unit!43164)

(assert (=> b!1303801 (= lt!583466 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!583468 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!86832 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1303801 (arrayContainsKey!0 _keys!1741 lt!583468 #b00000000000000000000000000000000)))

(declare-fun lt!583467 () Unit!43164)

(assert (=> b!1303801 (= lt!583467 lt!583466)))

(declare-fun res!865947 () Bool)

(declare-datatypes ((SeekEntryResult!10025 0))(
  ( (MissingZero!10025 (index!42471 (_ BitVec 32))) (Found!10025 (index!42472 (_ BitVec 32))) (Intermediate!10025 (undefined!10837 Bool) (index!42473 (_ BitVec 32)) (x!115792 (_ BitVec 32))) (Undefined!10025) (MissingVacant!10025 (index!42474 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86832 (_ BitVec 32)) SeekEntryResult!10025)

(assert (=> b!1303801 (= res!865947 (= (seekEntryOrOpen!0 (select (arr!41907 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!10025 #b00000000000000000000000000000000)))))

(assert (=> b!1303801 (=> (not res!865947) (not e!743668))))

(declare-fun bm!64230 () Bool)

(declare-fun call!64233 () Bool)

(assert (=> bm!64230 (= call!64233 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1303802 () Bool)

(assert (=> b!1303802 (= e!743668 call!64233)))

(declare-fun b!1303803 () Bool)

(assert (=> b!1303803 (= e!743670 call!64233)))

(declare-fun d!141665 () Bool)

(declare-fun res!865948 () Bool)

(assert (=> d!141665 (=> res!865948 e!743669)))

(assert (=> d!141665 (= res!865948 (bvsge #b00000000000000000000000000000000 (size!42457 _keys!1741)))))

(assert (=> d!141665 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!743669)))

(assert (= (and d!141665 (not res!865948)) b!1303800))

(assert (= (and b!1303800 c!125141) b!1303801))

(assert (= (and b!1303800 (not c!125141)) b!1303803))

(assert (= (and b!1303801 res!865947) b!1303802))

(assert (= (or b!1303802 b!1303803) bm!64230))

(declare-fun m!1194683 () Bool)

(assert (=> b!1303800 m!1194683))

(assert (=> b!1303800 m!1194683))

(declare-fun m!1194685 () Bool)

(assert (=> b!1303800 m!1194685))

(assert (=> b!1303801 m!1194683))

(declare-fun m!1194687 () Bool)

(assert (=> b!1303801 m!1194687))

(declare-fun m!1194689 () Bool)

(assert (=> b!1303801 m!1194689))

(assert (=> b!1303801 m!1194683))

(declare-fun m!1194691 () Bool)

(assert (=> b!1303801 m!1194691))

(declare-fun m!1194693 () Bool)

(assert (=> bm!64230 m!1194693))

(assert (=> b!1303638 d!141665))

(declare-fun d!141667 () Bool)

(declare-fun e!743671 () Bool)

(assert (=> d!141667 e!743671))

(declare-fun res!865949 () Bool)

(assert (=> d!141667 (=> res!865949 e!743671)))

(declare-fun lt!583469 () Bool)

(assert (=> d!141667 (= res!865949 (not lt!583469))))

(declare-fun lt!583470 () Bool)

(assert (=> d!141667 (= lt!583469 lt!583470)))

(declare-fun lt!583472 () Unit!43164)

(declare-fun e!743672 () Unit!43164)

(assert (=> d!141667 (= lt!583472 e!743672)))

(declare-fun c!125142 () Bool)

(assert (=> d!141667 (= c!125142 lt!583470)))

(assert (=> d!141667 (= lt!583470 (containsKey!727 (toList!10155 (ListLongMap!20280 Nil!29744)) k0!1205))))

(assert (=> d!141667 (= (contains!8291 (ListLongMap!20280 Nil!29744) k0!1205) lt!583469)))

(declare-fun b!1303804 () Bool)

(declare-fun lt!583471 () Unit!43164)

(assert (=> b!1303804 (= e!743672 lt!583471)))

(assert (=> b!1303804 (= lt!583471 (lemmaContainsKeyImpliesGetValueByKeyDefined!473 (toList!10155 (ListLongMap!20280 Nil!29744)) k0!1205))))

(assert (=> b!1303804 (isDefined!512 (getValueByKey!705 (toList!10155 (ListLongMap!20280 Nil!29744)) k0!1205))))

(declare-fun b!1303805 () Bool)

(declare-fun Unit!43169 () Unit!43164)

(assert (=> b!1303805 (= e!743672 Unit!43169)))

(declare-fun b!1303806 () Bool)

(assert (=> b!1303806 (= e!743671 (isDefined!512 (getValueByKey!705 (toList!10155 (ListLongMap!20280 Nil!29744)) k0!1205)))))

(assert (= (and d!141667 c!125142) b!1303804))

(assert (= (and d!141667 (not c!125142)) b!1303805))

(assert (= (and d!141667 (not res!865949)) b!1303806))

(declare-fun m!1194695 () Bool)

(assert (=> d!141667 m!1194695))

(declare-fun m!1194697 () Bool)

(assert (=> b!1303804 m!1194697))

(declare-fun m!1194699 () Bool)

(assert (=> b!1303804 m!1194699))

(assert (=> b!1303804 m!1194699))

(declare-fun m!1194701 () Bool)

(assert (=> b!1303804 m!1194701))

(assert (=> b!1303806 m!1194699))

(assert (=> b!1303806 m!1194699))

(assert (=> b!1303806 m!1194701))

(assert (=> b!1303637 d!141667))

(declare-fun d!141669 () Bool)

(assert (=> d!141669 (not (contains!8291 (ListLongMap!20280 Nil!29744) k0!1205))))

(declare-fun lt!583475 () Unit!43164)

(declare-fun choose!1921 ((_ BitVec 64)) Unit!43164)

(assert (=> d!141669 (= lt!583475 (choose!1921 k0!1205))))

(assert (=> d!141669 (= (emptyContainsNothing!219 k0!1205) lt!583475)))

(declare-fun bs!37124 () Bool)

(assert (= bs!37124 d!141669))

(assert (=> bs!37124 m!1194545))

(declare-fun m!1194703 () Bool)

(assert (=> bs!37124 m!1194703))

(assert (=> b!1303637 d!141669))

(declare-fun d!141671 () Bool)

(declare-fun res!865958 () Bool)

(declare-fun e!743681 () Bool)

(assert (=> d!141671 (=> res!865958 e!743681)))

(assert (=> d!141671 (= res!865958 (bvsge #b00000000000000000000000000000000 (size!42457 _keys!1741)))))

(assert (=> d!141671 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29743) e!743681)))

(declare-fun b!1303817 () Bool)

(declare-fun e!743682 () Bool)

(assert (=> b!1303817 (= e!743681 e!743682)))

(declare-fun res!865956 () Bool)

(assert (=> b!1303817 (=> (not res!865956) (not e!743682))))

(declare-fun e!743683 () Bool)

(assert (=> b!1303817 (= res!865956 (not e!743683))))

(declare-fun res!865957 () Bool)

(assert (=> b!1303817 (=> (not res!865957) (not e!743683))))

(assert (=> b!1303817 (= res!865957 (validKeyInArray!0 (select (arr!41907 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1303818 () Bool)

(declare-fun contains!8293 (List!29746 (_ BitVec 64)) Bool)

(assert (=> b!1303818 (= e!743683 (contains!8293 Nil!29743 (select (arr!41907 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1303819 () Bool)

(declare-fun e!743684 () Bool)

(declare-fun call!64236 () Bool)

(assert (=> b!1303819 (= e!743684 call!64236)))

(declare-fun b!1303820 () Bool)

(assert (=> b!1303820 (= e!743684 call!64236)))

(declare-fun bm!64233 () Bool)

(declare-fun c!125145 () Bool)

(assert (=> bm!64233 (= call!64236 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125145 (Cons!29742 (select (arr!41907 _keys!1741) #b00000000000000000000000000000000) Nil!29743) Nil!29743)))))

(declare-fun b!1303821 () Bool)

(assert (=> b!1303821 (= e!743682 e!743684)))

(assert (=> b!1303821 (= c!125145 (validKeyInArray!0 (select (arr!41907 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!141671 (not res!865958)) b!1303817))

(assert (= (and b!1303817 res!865957) b!1303818))

(assert (= (and b!1303817 res!865956) b!1303821))

(assert (= (and b!1303821 c!125145) b!1303819))

(assert (= (and b!1303821 (not c!125145)) b!1303820))

(assert (= (or b!1303819 b!1303820) bm!64233))

(assert (=> b!1303817 m!1194683))

(assert (=> b!1303817 m!1194683))

(assert (=> b!1303817 m!1194685))

(assert (=> b!1303818 m!1194683))

(assert (=> b!1303818 m!1194683))

(declare-fun m!1194705 () Bool)

(assert (=> b!1303818 m!1194705))

(assert (=> bm!64233 m!1194683))

(declare-fun m!1194707 () Bool)

(assert (=> bm!64233 m!1194707))

(assert (=> b!1303821 m!1194683))

(assert (=> b!1303821 m!1194683))

(assert (=> b!1303821 m!1194685))

(assert (=> b!1303628 d!141671))

(declare-fun b!1303828 () Bool)

(declare-fun e!743689 () Bool)

(assert (=> b!1303828 (= e!743689 tp_is_empty!34911)))

(declare-fun condMapEmpty!53965 () Bool)

(declare-fun mapDefault!53965 () ValueCell!16557)

(assert (=> mapNonEmpty!53959 (= condMapEmpty!53965 (= mapRest!53959 ((as const (Array (_ BitVec 32) ValueCell!16557)) mapDefault!53965)))))

(declare-fun e!743690 () Bool)

(declare-fun mapRes!53965 () Bool)

(assert (=> mapNonEmpty!53959 (= tp!102963 (and e!743690 mapRes!53965))))

(declare-fun mapNonEmpty!53965 () Bool)

(declare-fun tp!102973 () Bool)

(assert (=> mapNonEmpty!53965 (= mapRes!53965 (and tp!102973 e!743689))))

(declare-fun mapRest!53965 () (Array (_ BitVec 32) ValueCell!16557))

(declare-fun mapValue!53965 () ValueCell!16557)

(declare-fun mapKey!53965 () (_ BitVec 32))

(assert (=> mapNonEmpty!53965 (= mapRest!53959 (store mapRest!53965 mapKey!53965 mapValue!53965))))

(declare-fun mapIsEmpty!53965 () Bool)

(assert (=> mapIsEmpty!53965 mapRes!53965))

(declare-fun b!1303829 () Bool)

(assert (=> b!1303829 (= e!743690 tp_is_empty!34911)))

(assert (= (and mapNonEmpty!53959 condMapEmpty!53965) mapIsEmpty!53965))

(assert (= (and mapNonEmpty!53959 (not condMapEmpty!53965)) mapNonEmpty!53965))

(assert (= (and mapNonEmpty!53965 ((_ is ValueCellFull!16557) mapValue!53965)) b!1303828))

(assert (= (and mapNonEmpty!53959 ((_ is ValueCellFull!16557) mapDefault!53965)) b!1303829))

(declare-fun m!1194709 () Bool)

(assert (=> mapNonEmpty!53965 m!1194709))

(declare-fun b_lambda!23281 () Bool)

(assert (= b_lambda!23277 (or (and start!110072 b_free!29271) b_lambda!23281)))

(declare-fun b_lambda!23283 () Bool)

(assert (= b_lambda!23275 (or (and start!110072 b_free!29271) b_lambda!23283)))

(declare-fun b_lambda!23285 () Bool)

(assert (= b_lambda!23279 (or (and start!110072 b_free!29271) b_lambda!23285)))

(check-sat (not b!1303722) (not d!141667) (not b!1303772) (not b!1303780) (not bm!64226) (not b!1303818) (not d!141661) (not bm!64221) (not b!1303773) (not b!1303801) (not b!1303712) (not b!1303786) (not b_lambda!23281) (not b!1303806) (not b!1303718) (not b!1303776) (not d!141669) (not b!1303800) (not bm!64222) (not mapNonEmpty!53965) (not b!1303717) (not d!141657) (not b!1303728) (not b!1303723) (not bm!64233) (not b!1303726) (not b!1303804) (not bm!64206) (not b!1303719) b_and!47443 (not bm!64225) (not b_lambda!23285) (not b!1303685) (not b_next!29271) tp_is_empty!34911 (not b!1303721) (not b!1303821) (not b!1303783) (not b_lambda!23283) (not bm!64230) (not d!141663) (not b!1303817) (not b!1303778) (not b!1303777) (not b!1303715) (not d!141659) (not b!1303687))
(check-sat b_and!47443 (not b_next!29271))
(get-model)

(assert (=> bm!64222 d!141659))

(declare-fun d!141673 () Bool)

(declare-fun e!743691 () Bool)

(assert (=> d!141673 e!743691))

(declare-fun res!865959 () Bool)

(assert (=> d!141673 (=> res!865959 e!743691)))

(declare-fun lt!583476 () Bool)

(assert (=> d!141673 (= res!865959 (not lt!583476))))

(declare-fun lt!583477 () Bool)

(assert (=> d!141673 (= lt!583476 lt!583477)))

(declare-fun lt!583479 () Unit!43164)

(declare-fun e!743692 () Unit!43164)

(assert (=> d!141673 (= lt!583479 e!743692)))

(declare-fun c!125146 () Bool)

(assert (=> d!141673 (= c!125146 lt!583477)))

(assert (=> d!141673 (= lt!583477 (containsKey!727 (toList!10155 lt!583441) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!141673 (= (contains!8291 lt!583441 #b1000000000000000000000000000000000000000000000000000000000000000) lt!583476)))

(declare-fun b!1303830 () Bool)

(declare-fun lt!583478 () Unit!43164)

(assert (=> b!1303830 (= e!743692 lt!583478)))

(assert (=> b!1303830 (= lt!583478 (lemmaContainsKeyImpliesGetValueByKeyDefined!473 (toList!10155 lt!583441) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1303830 (isDefined!512 (getValueByKey!705 (toList!10155 lt!583441) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1303831 () Bool)

(declare-fun Unit!43170 () Unit!43164)

(assert (=> b!1303831 (= e!743692 Unit!43170)))

(declare-fun b!1303832 () Bool)

(assert (=> b!1303832 (= e!743691 (isDefined!512 (getValueByKey!705 (toList!10155 lt!583441) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141673 c!125146) b!1303830))

(assert (= (and d!141673 (not c!125146)) b!1303831))

(assert (= (and d!141673 (not res!865959)) b!1303832))

(declare-fun m!1194711 () Bool)

(assert (=> d!141673 m!1194711))

(declare-fun m!1194713 () Bool)

(assert (=> b!1303830 m!1194713))

(declare-fun m!1194715 () Bool)

(assert (=> b!1303830 m!1194715))

(assert (=> b!1303830 m!1194715))

(declare-fun m!1194717 () Bool)

(assert (=> b!1303830 m!1194717))

(assert (=> b!1303832 m!1194715))

(assert (=> b!1303832 m!1194715))

(assert (=> b!1303832 m!1194717))

(assert (=> bm!64221 d!141673))

(declare-fun d!141675 () Bool)

(declare-fun e!743693 () Bool)

(assert (=> d!141675 e!743693))

(declare-fun res!865960 () Bool)

(assert (=> d!141675 (=> res!865960 e!743693)))

(declare-fun lt!583480 () Bool)

(assert (=> d!141675 (= res!865960 (not lt!583480))))

(declare-fun lt!583481 () Bool)

(assert (=> d!141675 (= lt!583480 lt!583481)))

(declare-fun lt!583483 () Unit!43164)

(declare-fun e!743694 () Unit!43164)

(assert (=> d!141675 (= lt!583483 e!743694)))

(declare-fun c!125147 () Bool)

(assert (=> d!141675 (= c!125147 lt!583481)))

(assert (=> d!141675 (= lt!583481 (containsKey!727 (toList!10155 lt!583388) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!141675 (= (contains!8291 lt!583388 #b1000000000000000000000000000000000000000000000000000000000000000) lt!583480)))

(declare-fun b!1303833 () Bool)

(declare-fun lt!583482 () Unit!43164)

(assert (=> b!1303833 (= e!743694 lt!583482)))

(assert (=> b!1303833 (= lt!583482 (lemmaContainsKeyImpliesGetValueByKeyDefined!473 (toList!10155 lt!583388) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1303833 (isDefined!512 (getValueByKey!705 (toList!10155 lt!583388) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1303834 () Bool)

(declare-fun Unit!43171 () Unit!43164)

(assert (=> b!1303834 (= e!743694 Unit!43171)))

(declare-fun b!1303835 () Bool)

(assert (=> b!1303835 (= e!743693 (isDefined!512 (getValueByKey!705 (toList!10155 lt!583388) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141675 c!125147) b!1303833))

(assert (= (and d!141675 (not c!125147)) b!1303834))

(assert (= (and d!141675 (not res!865960)) b!1303835))

(declare-fun m!1194719 () Bool)

(assert (=> d!141675 m!1194719))

(declare-fun m!1194721 () Bool)

(assert (=> b!1303833 m!1194721))

(declare-fun m!1194723 () Bool)

(assert (=> b!1303833 m!1194723))

(assert (=> b!1303833 m!1194723))

(declare-fun m!1194725 () Bool)

(assert (=> b!1303833 m!1194725))

(assert (=> b!1303835 m!1194723))

(assert (=> b!1303835 m!1194723))

(assert (=> b!1303835 m!1194725))

(assert (=> b!1303712 d!141675))

(declare-fun d!141677 () Bool)

(declare-fun e!743695 () Bool)

(assert (=> d!141677 e!743695))

(declare-fun res!865961 () Bool)

(assert (=> d!141677 (=> res!865961 e!743695)))

(declare-fun lt!583484 () Bool)

(assert (=> d!141677 (= res!865961 (not lt!583484))))

(declare-fun lt!583485 () Bool)

(assert (=> d!141677 (= lt!583484 lt!583485)))

(declare-fun lt!583487 () Unit!43164)

(declare-fun e!743696 () Unit!43164)

(assert (=> d!141677 (= lt!583487 e!743696)))

(declare-fun c!125148 () Bool)

(assert (=> d!141677 (= c!125148 lt!583485)))

(assert (=> d!141677 (= lt!583485 (containsKey!727 (toList!10155 lt!583388) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!141677 (= (contains!8291 lt!583388 #b0000000000000000000000000000000000000000000000000000000000000000) lt!583484)))

(declare-fun b!1303836 () Bool)

(declare-fun lt!583486 () Unit!43164)

(assert (=> b!1303836 (= e!743696 lt!583486)))

(assert (=> b!1303836 (= lt!583486 (lemmaContainsKeyImpliesGetValueByKeyDefined!473 (toList!10155 lt!583388) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1303836 (isDefined!512 (getValueByKey!705 (toList!10155 lt!583388) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1303837 () Bool)

(declare-fun Unit!43172 () Unit!43164)

(assert (=> b!1303837 (= e!743696 Unit!43172)))

(declare-fun b!1303838 () Bool)

(assert (=> b!1303838 (= e!743695 (isDefined!512 (getValueByKey!705 (toList!10155 lt!583388) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141677 c!125148) b!1303836))

(assert (= (and d!141677 (not c!125148)) b!1303837))

(assert (= (and d!141677 (not res!865961)) b!1303838))

(declare-fun m!1194727 () Bool)

(assert (=> d!141677 m!1194727))

(declare-fun m!1194729 () Bool)

(assert (=> b!1303836 m!1194729))

(declare-fun m!1194731 () Bool)

(assert (=> b!1303836 m!1194731))

(assert (=> b!1303836 m!1194731))

(declare-fun m!1194733 () Bool)

(assert (=> b!1303836 m!1194733))

(assert (=> b!1303838 m!1194731))

(assert (=> b!1303838 m!1194731))

(assert (=> b!1303838 m!1194733))

(assert (=> d!141659 d!141677))

(assert (=> d!141659 d!141649))

(declare-fun d!141679 () Bool)

(declare-fun get!21167 (Option!757) V!51651)

(assert (=> d!141679 (= (apply!1022 lt!583441 #b0000000000000000000000000000000000000000000000000000000000000000) (get!21167 (getValueByKey!705 (toList!10155 lt!583441) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37125 () Bool)

(assert (= bs!37125 d!141679))

(declare-fun m!1194735 () Bool)

(assert (=> bs!37125 m!1194735))

(assert (=> bs!37125 m!1194735))

(declare-fun m!1194737 () Bool)

(assert (=> bs!37125 m!1194737))

(assert (=> b!1303786 d!141679))

(declare-fun b!1303839 () Bool)

(declare-fun e!743698 () Bool)

(declare-fun e!743699 () Bool)

(assert (=> b!1303839 (= e!743698 e!743699)))

(declare-fun c!125149 () Bool)

(assert (=> b!1303839 (= c!125149 (validKeyInArray!0 (select (arr!41907 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1303840 () Bool)

(declare-fun e!743697 () Bool)

(assert (=> b!1303840 (= e!743699 e!743697)))

(declare-fun lt!583490 () (_ BitVec 64))

(assert (=> b!1303840 (= lt!583490 (select (arr!41907 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!583488 () Unit!43164)

(assert (=> b!1303840 (= lt!583488 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!583490 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1303840 (arrayContainsKey!0 _keys!1741 lt!583490 #b00000000000000000000000000000000)))

(declare-fun lt!583489 () Unit!43164)

(assert (=> b!1303840 (= lt!583489 lt!583488)))

(declare-fun res!865962 () Bool)

(assert (=> b!1303840 (= res!865962 (= (seekEntryOrOpen!0 (select (arr!41907 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1741 mask!2175) (Found!10025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1303840 (=> (not res!865962) (not e!743697))))

(declare-fun bm!64234 () Bool)

(declare-fun call!64237 () Bool)

(assert (=> bm!64234 (= call!64237 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1303841 () Bool)

(assert (=> b!1303841 (= e!743697 call!64237)))

(declare-fun b!1303842 () Bool)

(assert (=> b!1303842 (= e!743699 call!64237)))

(declare-fun d!141681 () Bool)

(declare-fun res!865963 () Bool)

(assert (=> d!141681 (=> res!865963 e!743698)))

(assert (=> d!141681 (= res!865963 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!42457 _keys!1741)))))

(assert (=> d!141681 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175) e!743698)))

(assert (= (and d!141681 (not res!865963)) b!1303839))

(assert (= (and b!1303839 c!125149) b!1303840))

(assert (= (and b!1303839 (not c!125149)) b!1303842))

(assert (= (and b!1303840 res!865962) b!1303841))

(assert (= (or b!1303841 b!1303842) bm!64234))

(declare-fun m!1194739 () Bool)

(assert (=> b!1303839 m!1194739))

(assert (=> b!1303839 m!1194739))

(declare-fun m!1194741 () Bool)

(assert (=> b!1303839 m!1194741))

(assert (=> b!1303840 m!1194739))

(declare-fun m!1194743 () Bool)

(assert (=> b!1303840 m!1194743))

(declare-fun m!1194745 () Bool)

(assert (=> b!1303840 m!1194745))

(assert (=> b!1303840 m!1194739))

(declare-fun m!1194747 () Bool)

(assert (=> b!1303840 m!1194747))

(declare-fun m!1194749 () Bool)

(assert (=> bm!64234 m!1194749))

(assert (=> bm!64230 d!141681))

(declare-fun d!141683 () Bool)

(assert (=> d!141683 (arrayContainsKey!0 _keys!1741 lt!583468 #b00000000000000000000000000000000)))

(declare-fun lt!583493 () Unit!43164)

(declare-fun choose!13 (array!86832 (_ BitVec 64) (_ BitVec 32)) Unit!43164)

(assert (=> d!141683 (= lt!583493 (choose!13 _keys!1741 lt!583468 #b00000000000000000000000000000000))))

(assert (=> d!141683 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!141683 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!583468 #b00000000000000000000000000000000) lt!583493)))

(declare-fun bs!37126 () Bool)

(assert (= bs!37126 d!141683))

(assert (=> bs!37126 m!1194689))

(declare-fun m!1194751 () Bool)

(assert (=> bs!37126 m!1194751))

(assert (=> b!1303801 d!141683))

(declare-fun d!141685 () Bool)

(declare-fun res!865968 () Bool)

(declare-fun e!743704 () Bool)

(assert (=> d!141685 (=> res!865968 e!743704)))

(assert (=> d!141685 (= res!865968 (= (select (arr!41907 _keys!1741) #b00000000000000000000000000000000) lt!583468))))

(assert (=> d!141685 (= (arrayContainsKey!0 _keys!1741 lt!583468 #b00000000000000000000000000000000) e!743704)))

(declare-fun b!1303847 () Bool)

(declare-fun e!743705 () Bool)

(assert (=> b!1303847 (= e!743704 e!743705)))

(declare-fun res!865969 () Bool)

(assert (=> b!1303847 (=> (not res!865969) (not e!743705))))

(assert (=> b!1303847 (= res!865969 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!42457 _keys!1741)))))

(declare-fun b!1303848 () Bool)

(assert (=> b!1303848 (= e!743705 (arrayContainsKey!0 _keys!1741 lt!583468 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!141685 (not res!865968)) b!1303847))

(assert (= (and b!1303847 res!865969) b!1303848))

(assert (=> d!141685 m!1194683))

(declare-fun m!1194753 () Bool)

(assert (=> b!1303848 m!1194753))

(assert (=> b!1303801 d!141685))

(declare-fun b!1303861 () Bool)

(declare-fun e!743714 () SeekEntryResult!10025)

(declare-fun lt!583502 () SeekEntryResult!10025)

(assert (=> b!1303861 (= e!743714 (MissingZero!10025 (index!42473 lt!583502)))))

(declare-fun b!1303862 () Bool)

(declare-fun c!125158 () Bool)

(declare-fun lt!583500 () (_ BitVec 64))

(assert (=> b!1303862 (= c!125158 (= lt!583500 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!743713 () SeekEntryResult!10025)

(assert (=> b!1303862 (= e!743713 e!743714)))

(declare-fun b!1303863 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!86832 (_ BitVec 32)) SeekEntryResult!10025)

(assert (=> b!1303863 (= e!743714 (seekKeyOrZeroReturnVacant!0 (x!115792 lt!583502) (index!42473 lt!583502) (index!42473 lt!583502) (select (arr!41907 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175))))

(declare-fun d!141687 () Bool)

(declare-fun lt!583501 () SeekEntryResult!10025)

(assert (=> d!141687 (and (or ((_ is Undefined!10025) lt!583501) (not ((_ is Found!10025) lt!583501)) (and (bvsge (index!42472 lt!583501) #b00000000000000000000000000000000) (bvslt (index!42472 lt!583501) (size!42457 _keys!1741)))) (or ((_ is Undefined!10025) lt!583501) ((_ is Found!10025) lt!583501) (not ((_ is MissingZero!10025) lt!583501)) (and (bvsge (index!42471 lt!583501) #b00000000000000000000000000000000) (bvslt (index!42471 lt!583501) (size!42457 _keys!1741)))) (or ((_ is Undefined!10025) lt!583501) ((_ is Found!10025) lt!583501) ((_ is MissingZero!10025) lt!583501) (not ((_ is MissingVacant!10025) lt!583501)) (and (bvsge (index!42474 lt!583501) #b00000000000000000000000000000000) (bvslt (index!42474 lt!583501) (size!42457 _keys!1741)))) (or ((_ is Undefined!10025) lt!583501) (ite ((_ is Found!10025) lt!583501) (= (select (arr!41907 _keys!1741) (index!42472 lt!583501)) (select (arr!41907 _keys!1741) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!10025) lt!583501) (= (select (arr!41907 _keys!1741) (index!42471 lt!583501)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10025) lt!583501) (= (select (arr!41907 _keys!1741) (index!42474 lt!583501)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!743712 () SeekEntryResult!10025)

(assert (=> d!141687 (= lt!583501 e!743712)))

(declare-fun c!125157 () Bool)

(assert (=> d!141687 (= c!125157 (and ((_ is Intermediate!10025) lt!583502) (undefined!10837 lt!583502)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!86832 (_ BitVec 32)) SeekEntryResult!10025)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!141687 (= lt!583502 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!41907 _keys!1741) #b00000000000000000000000000000000) mask!2175) (select (arr!41907 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175))))

(assert (=> d!141687 (validMask!0 mask!2175)))

(assert (=> d!141687 (= (seekEntryOrOpen!0 (select (arr!41907 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) lt!583501)))

(declare-fun b!1303864 () Bool)

(assert (=> b!1303864 (= e!743713 (Found!10025 (index!42473 lt!583502)))))

(declare-fun b!1303865 () Bool)

(assert (=> b!1303865 (= e!743712 e!743713)))

(assert (=> b!1303865 (= lt!583500 (select (arr!41907 _keys!1741) (index!42473 lt!583502)))))

(declare-fun c!125156 () Bool)

(assert (=> b!1303865 (= c!125156 (= lt!583500 (select (arr!41907 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1303866 () Bool)

(assert (=> b!1303866 (= e!743712 Undefined!10025)))

(assert (= (and d!141687 c!125157) b!1303866))

(assert (= (and d!141687 (not c!125157)) b!1303865))

(assert (= (and b!1303865 c!125156) b!1303864))

(assert (= (and b!1303865 (not c!125156)) b!1303862))

(assert (= (and b!1303862 c!125158) b!1303861))

(assert (= (and b!1303862 (not c!125158)) b!1303863))

(assert (=> b!1303863 m!1194683))

(declare-fun m!1194755 () Bool)

(assert (=> b!1303863 m!1194755))

(declare-fun m!1194757 () Bool)

(assert (=> d!141687 m!1194757))

(assert (=> d!141687 m!1194683))

(declare-fun m!1194759 () Bool)

(assert (=> d!141687 m!1194759))

(assert (=> d!141687 m!1194759))

(assert (=> d!141687 m!1194683))

(declare-fun m!1194761 () Bool)

(assert (=> d!141687 m!1194761))

(declare-fun m!1194763 () Bool)

(assert (=> d!141687 m!1194763))

(assert (=> d!141687 m!1194551))

(declare-fun m!1194765 () Bool)

(assert (=> d!141687 m!1194765))

(declare-fun m!1194767 () Bool)

(assert (=> b!1303865 m!1194767))

(assert (=> b!1303801 d!141687))

(declare-fun d!141689 () Bool)

(assert (=> d!141689 (= (validKeyInArray!0 (select (arr!41907 _keys!1741) #b00000000000000000000000000000000)) (and (not (= (select (arr!41907 _keys!1741) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41907 _keys!1741) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1303800 d!141689))

(declare-fun d!141691 () Bool)

(declare-fun res!865974 () Bool)

(declare-fun e!743719 () Bool)

(assert (=> d!141691 (=> res!865974 e!743719)))

(assert (=> d!141691 (= res!865974 (and ((_ is Cons!29743) (toList!10155 (getCurrentListMap!5176 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11322 (h!30952 (toList!10155 (getCurrentListMap!5176 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(assert (=> d!141691 (= (containsKey!727 (toList!10155 (getCurrentListMap!5176 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!743719)))

(declare-fun b!1303871 () Bool)

(declare-fun e!743720 () Bool)

(assert (=> b!1303871 (= e!743719 e!743720)))

(declare-fun res!865975 () Bool)

(assert (=> b!1303871 (=> (not res!865975) (not e!743720))))

(assert (=> b!1303871 (= res!865975 (and (or (not ((_ is Cons!29743) (toList!10155 (getCurrentListMap!5176 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) (bvsle (_1!11322 (h!30952 (toList!10155 (getCurrentListMap!5176 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)) ((_ is Cons!29743) (toList!10155 (getCurrentListMap!5176 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (bvslt (_1!11322 (h!30952 (toList!10155 (getCurrentListMap!5176 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(declare-fun b!1303872 () Bool)

(assert (=> b!1303872 (= e!743720 (containsKey!727 (t!43341 (toList!10155 (getCurrentListMap!5176 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(assert (= (and d!141691 (not res!865974)) b!1303871))

(assert (= (and b!1303871 res!865975) b!1303872))

(declare-fun m!1194769 () Bool)

(assert (=> b!1303872 m!1194769))

(assert (=> d!141661 d!141691))

(assert (=> d!141663 d!141649))

(declare-fun d!141693 () Bool)

(declare-fun res!865976 () Bool)

(declare-fun e!743721 () Bool)

(assert (=> d!141693 (=> res!865976 e!743721)))

(assert (=> d!141693 (= res!865976 (and ((_ is Cons!29743) (toList!10155 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11322 (h!30952 (toList!10155 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(assert (=> d!141693 (= (containsKey!727 (toList!10155 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!743721)))

(declare-fun b!1303873 () Bool)

(declare-fun e!743722 () Bool)

(assert (=> b!1303873 (= e!743721 e!743722)))

(declare-fun res!865977 () Bool)

(assert (=> b!1303873 (=> (not res!865977) (not e!743722))))

(assert (=> b!1303873 (= res!865977 (and (or (not ((_ is Cons!29743) (toList!10155 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) (bvsle (_1!11322 (h!30952 (toList!10155 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)) ((_ is Cons!29743) (toList!10155 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (bvslt (_1!11322 (h!30952 (toList!10155 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(declare-fun b!1303874 () Bool)

(assert (=> b!1303874 (= e!743722 (containsKey!727 (t!43341 (toList!10155 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(assert (= (and d!141693 (not res!865976)) b!1303873))

(assert (= (and b!1303873 res!865977) b!1303874))

(declare-fun m!1194771 () Bool)

(assert (=> b!1303874 m!1194771))

(assert (=> d!141657 d!141693))

(declare-fun d!141695 () Bool)

(declare-fun e!743723 () Bool)

(assert (=> d!141695 e!743723))

(declare-fun res!865978 () Bool)

(assert (=> d!141695 (=> res!865978 e!743723)))

(declare-fun lt!583503 () Bool)

(assert (=> d!141695 (= res!865978 (not lt!583503))))

(declare-fun lt!583504 () Bool)

(assert (=> d!141695 (= lt!583503 lt!583504)))

(declare-fun lt!583506 () Unit!43164)

(declare-fun e!743724 () Unit!43164)

(assert (=> d!141695 (= lt!583506 e!743724)))

(declare-fun c!125159 () Bool)

(assert (=> d!141695 (= c!125159 lt!583504)))

(assert (=> d!141695 (= lt!583504 (containsKey!727 (toList!10155 lt!583441) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!141695 (= (contains!8291 lt!583441 #b0000000000000000000000000000000000000000000000000000000000000000) lt!583503)))

(declare-fun b!1303875 () Bool)

(declare-fun lt!583505 () Unit!43164)

(assert (=> b!1303875 (= e!743724 lt!583505)))

(assert (=> b!1303875 (= lt!583505 (lemmaContainsKeyImpliesGetValueByKeyDefined!473 (toList!10155 lt!583441) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1303875 (isDefined!512 (getValueByKey!705 (toList!10155 lt!583441) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1303876 () Bool)

(declare-fun Unit!43173 () Unit!43164)

(assert (=> b!1303876 (= e!743724 Unit!43173)))

(declare-fun b!1303877 () Bool)

(assert (=> b!1303877 (= e!743723 (isDefined!512 (getValueByKey!705 (toList!10155 lt!583441) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141695 c!125159) b!1303875))

(assert (= (and d!141695 (not c!125159)) b!1303876))

(assert (= (and d!141695 (not res!865978)) b!1303877))

(declare-fun m!1194773 () Bool)

(assert (=> d!141695 m!1194773))

(declare-fun m!1194775 () Bool)

(assert (=> b!1303875 m!1194775))

(assert (=> b!1303875 m!1194735))

(assert (=> b!1303875 m!1194735))

(declare-fun m!1194777 () Bool)

(assert (=> b!1303875 m!1194777))

(assert (=> b!1303877 m!1194735))

(assert (=> b!1303877 m!1194735))

(assert (=> b!1303877 m!1194777))

(assert (=> bm!64226 d!141695))

(declare-fun d!141697 () Bool)

(declare-fun e!743727 () Bool)

(assert (=> d!141697 e!743727))

(declare-fun res!865984 () Bool)

(assert (=> d!141697 (=> (not res!865984) (not e!743727))))

(declare-fun lt!583518 () ListLongMap!20279)

(assert (=> d!141697 (= res!865984 (contains!8291 lt!583518 (_1!11322 (tuple2!22623 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun lt!583516 () List!29747)

(assert (=> d!141697 (= lt!583518 (ListLongMap!20280 lt!583516))))

(declare-fun lt!583517 () Unit!43164)

(declare-fun lt!583515 () Unit!43164)

(assert (=> d!141697 (= lt!583517 lt!583515)))

(assert (=> d!141697 (= (getValueByKey!705 lt!583516 (_1!11322 (tuple2!22623 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!756 (_2!11322 (tuple2!22623 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun lemmaContainsTupThenGetReturnValue!351 (List!29747 (_ BitVec 64) V!51651) Unit!43164)

(assert (=> d!141697 (= lt!583515 (lemmaContainsTupThenGetReturnValue!351 lt!583516 (_1!11322 (tuple2!22623 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11322 (tuple2!22623 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun insertStrictlySorted!480 (List!29747 (_ BitVec 64) V!51651) List!29747)

(assert (=> d!141697 (= lt!583516 (insertStrictlySorted!480 (toList!10155 call!64227) (_1!11322 (tuple2!22623 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11322 (tuple2!22623 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!141697 (= (+!4479 call!64227 (tuple2!22623 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) lt!583518)))

(declare-fun b!1303882 () Bool)

(declare-fun res!865983 () Bool)

(assert (=> b!1303882 (=> (not res!865983) (not e!743727))))

(assert (=> b!1303882 (= res!865983 (= (getValueByKey!705 (toList!10155 lt!583518) (_1!11322 (tuple2!22623 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!756 (_2!11322 (tuple2!22623 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1303883 () Bool)

(declare-fun contains!8294 (List!29747 tuple2!22622) Bool)

(assert (=> b!1303883 (= e!743727 (contains!8294 (toList!10155 lt!583518) (tuple2!22623 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(assert (= (and d!141697 res!865984) b!1303882))

(assert (= (and b!1303882 res!865983) b!1303883))

(declare-fun m!1194779 () Bool)

(assert (=> d!141697 m!1194779))

(declare-fun m!1194781 () Bool)

(assert (=> d!141697 m!1194781))

(declare-fun m!1194783 () Bool)

(assert (=> d!141697 m!1194783))

(declare-fun m!1194785 () Bool)

(assert (=> d!141697 m!1194785))

(declare-fun m!1194787 () Bool)

(assert (=> b!1303882 m!1194787))

(declare-fun m!1194789 () Bool)

(assert (=> b!1303883 m!1194789))

(assert (=> b!1303783 d!141697))

(assert (=> d!141669 d!141667))

(declare-fun d!141699 () Bool)

(assert (=> d!141699 (not (contains!8291 (ListLongMap!20280 Nil!29744) k0!1205))))

(assert (=> d!141699 true))

(declare-fun _$29!198 () Unit!43164)

(assert (=> d!141699 (= (choose!1921 k0!1205) _$29!198)))

(declare-fun bs!37127 () Bool)

(assert (= bs!37127 d!141699))

(assert (=> bs!37127 m!1194545))

(assert (=> d!141669 d!141699))

(declare-fun d!141701 () Bool)

(declare-fun res!865985 () Bool)

(declare-fun e!743728 () Bool)

(assert (=> d!141701 (=> res!865985 e!743728)))

(assert (=> d!141701 (= res!865985 (and ((_ is Cons!29743) (toList!10155 (ListLongMap!20280 Nil!29744))) (= (_1!11322 (h!30952 (toList!10155 (ListLongMap!20280 Nil!29744)))) k0!1205)))))

(assert (=> d!141701 (= (containsKey!727 (toList!10155 (ListLongMap!20280 Nil!29744)) k0!1205) e!743728)))

(declare-fun b!1303884 () Bool)

(declare-fun e!743729 () Bool)

(assert (=> b!1303884 (= e!743728 e!743729)))

(declare-fun res!865986 () Bool)

(assert (=> b!1303884 (=> (not res!865986) (not e!743729))))

(assert (=> b!1303884 (= res!865986 (and (or (not ((_ is Cons!29743) (toList!10155 (ListLongMap!20280 Nil!29744)))) (bvsle (_1!11322 (h!30952 (toList!10155 (ListLongMap!20280 Nil!29744)))) k0!1205)) ((_ is Cons!29743) (toList!10155 (ListLongMap!20280 Nil!29744))) (bvslt (_1!11322 (h!30952 (toList!10155 (ListLongMap!20280 Nil!29744)))) k0!1205)))))

(declare-fun b!1303885 () Bool)

(assert (=> b!1303885 (= e!743729 (containsKey!727 (t!43341 (toList!10155 (ListLongMap!20280 Nil!29744))) k0!1205))))

(assert (= (and d!141701 (not res!865985)) b!1303884))

(assert (= (and b!1303884 res!865986) b!1303885))

(declare-fun m!1194791 () Bool)

(assert (=> b!1303885 m!1194791))

(assert (=> d!141667 d!141701))

(assert (=> b!1303821 d!141689))

(declare-fun d!141703 () Bool)

(assert (=> d!141703 (= (apply!1022 lt!583441 (select (arr!41907 _keys!1741) from!2144)) (get!21167 (getValueByKey!705 (toList!10155 lt!583441) (select (arr!41907 _keys!1741) from!2144))))))

(declare-fun bs!37128 () Bool)

(assert (= bs!37128 d!141703))

(assert (=> bs!37128 m!1194563))

(declare-fun m!1194793 () Bool)

(assert (=> bs!37128 m!1194793))

(assert (=> bs!37128 m!1194793))

(declare-fun m!1194795 () Bool)

(assert (=> bs!37128 m!1194795))

(assert (=> b!1303780 d!141703))

(declare-fun d!141705 () Bool)

(declare-fun c!125162 () Bool)

(assert (=> d!141705 (= c!125162 ((_ is ValueCellFull!16557) (select (arr!41908 _values!1445) from!2144)))))

(declare-fun e!743732 () V!51651)

(assert (=> d!141705 (= (get!21166 (select (arr!41908 _values!1445) from!2144) (dynLambda!3429 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)) e!743732)))

(declare-fun b!1303890 () Bool)

(declare-fun get!21168 (ValueCell!16557 V!51651) V!51651)

(assert (=> b!1303890 (= e!743732 (get!21168 (select (arr!41908 _values!1445) from!2144) (dynLambda!3429 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1303891 () Bool)

(declare-fun get!21169 (ValueCell!16557 V!51651) V!51651)

(assert (=> b!1303891 (= e!743732 (get!21169 (select (arr!41908 _values!1445) from!2144) (dynLambda!3429 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141705 c!125162) b!1303890))

(assert (= (and d!141705 (not c!125162)) b!1303891))

(assert (=> b!1303890 m!1194607))

(assert (=> b!1303890 m!1194609))

(declare-fun m!1194797 () Bool)

(assert (=> b!1303890 m!1194797))

(assert (=> b!1303891 m!1194607))

(assert (=> b!1303891 m!1194609))

(declare-fun m!1194799 () Bool)

(assert (=> b!1303891 m!1194799))

(assert (=> b!1303780 d!141705))

(declare-fun b!1303892 () Bool)

(declare-fun res!865990 () Bool)

(declare-fun e!743735 () Bool)

(assert (=> b!1303892 (=> (not res!865990) (not e!743735))))

(declare-fun lt!583524 () ListLongMap!20279)

(assert (=> b!1303892 (= res!865990 (not (contains!8291 lt!583524 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1303893 () Bool)

(declare-fun e!743738 () Bool)

(assert (=> b!1303893 (= e!743735 e!743738)))

(declare-fun c!125164 () Bool)

(declare-fun e!743739 () Bool)

(assert (=> b!1303893 (= c!125164 e!743739)))

(declare-fun res!865987 () Bool)

(assert (=> b!1303893 (=> (not res!865987) (not e!743739))))

(assert (=> b!1303893 (= res!865987 (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42457 _keys!1741)))))

(declare-fun b!1303894 () Bool)

(declare-fun e!743737 () Bool)

(assert (=> b!1303894 (= e!743738 e!743737)))

(declare-fun c!125165 () Bool)

(assert (=> b!1303894 (= c!125165 (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42457 _keys!1741)))))

(declare-fun b!1303895 () Bool)

(assert (=> b!1303895 (= e!743737 (isEmpty!1062 lt!583524))))

(declare-fun b!1303897 () Bool)

(assert (=> b!1303897 (and (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42457 _keys!1741)))))

(assert (=> b!1303897 (and (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42458 _values!1445)))))

(declare-fun e!743734 () Bool)

(assert (=> b!1303897 (= e!743734 (= (apply!1022 lt!583524 (select (arr!41907 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))) (get!21166 (select (arr!41908 _values!1445) (bvadd from!2144 #b00000000000000000000000000000001)) (dynLambda!3429 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1303898 () Bool)

(assert (=> b!1303898 (= e!743737 (= lt!583524 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun b!1303899 () Bool)

(assert (=> b!1303899 (= e!743739 (validKeyInArray!0 (select (arr!41907 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))))))

(assert (=> b!1303899 (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1303900 () Bool)

(declare-fun e!743733 () ListLongMap!20279)

(assert (=> b!1303900 (= e!743733 (ListLongMap!20280 Nil!29744))))

(declare-fun b!1303901 () Bool)

(declare-fun lt!583519 () Unit!43164)

(declare-fun lt!583521 () Unit!43164)

(assert (=> b!1303901 (= lt!583519 lt!583521)))

(declare-fun lt!583525 () (_ BitVec 64))

(declare-fun lt!583523 () (_ BitVec 64))

(declare-fun lt!583522 () V!51651)

(declare-fun lt!583520 () ListLongMap!20279)

(assert (=> b!1303901 (not (contains!8291 (+!4479 lt!583520 (tuple2!22623 lt!583523 lt!583522)) lt!583525))))

(assert (=> b!1303901 (= lt!583521 (addStillNotContains!476 lt!583520 lt!583523 lt!583522 lt!583525))))

(assert (=> b!1303901 (= lt!583525 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1303901 (= lt!583522 (get!21166 (select (arr!41908 _values!1445) (bvadd from!2144 #b00000000000000000000000000000001)) (dynLambda!3429 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1303901 (= lt!583523 (select (arr!41907 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001)))))

(declare-fun call!64238 () ListLongMap!20279)

(assert (=> b!1303901 (= lt!583520 call!64238)))

(declare-fun e!743736 () ListLongMap!20279)

(assert (=> b!1303901 (= e!743736 (+!4479 call!64238 (tuple2!22623 (select (arr!41907 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001)) (get!21166 (select (arr!41908 _values!1445) (bvadd from!2144 #b00000000000000000000000000000001)) (dynLambda!3429 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1303902 () Bool)

(assert (=> b!1303902 (= e!743738 e!743734)))

(assert (=> b!1303902 (and (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42457 _keys!1741)))))

(declare-fun res!865989 () Bool)

(assert (=> b!1303902 (= res!865989 (contains!8291 lt!583524 (select (arr!41907 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))))))

(assert (=> b!1303902 (=> (not res!865989) (not e!743734))))

(declare-fun d!141707 () Bool)

(assert (=> d!141707 e!743735))

(declare-fun res!865988 () Bool)

(assert (=> d!141707 (=> (not res!865988) (not e!743735))))

(assert (=> d!141707 (= res!865988 (not (contains!8291 lt!583524 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!141707 (= lt!583524 e!743733)))

(declare-fun c!125166 () Bool)

(assert (=> d!141707 (= c!125166 (bvsge (bvadd from!2144 #b00000000000000000000000000000001) (size!42457 _keys!1741)))))

(assert (=> d!141707 (validMask!0 mask!2175)))

(assert (=> d!141707 (= (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448) lt!583524)))

(declare-fun b!1303896 () Bool)

(assert (=> b!1303896 (= e!743736 call!64238)))

(declare-fun b!1303903 () Bool)

(assert (=> b!1303903 (= e!743733 e!743736)))

(declare-fun c!125163 () Bool)

(assert (=> b!1303903 (= c!125163 (validKeyInArray!0 (select (arr!41907 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))))))

(declare-fun bm!64235 () Bool)

(assert (=> bm!64235 (= call!64238 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1448))))

(assert (= (and d!141707 c!125166) b!1303900))

(assert (= (and d!141707 (not c!125166)) b!1303903))

(assert (= (and b!1303903 c!125163) b!1303901))

(assert (= (and b!1303903 (not c!125163)) b!1303896))

(assert (= (or b!1303901 b!1303896) bm!64235))

(assert (= (and d!141707 res!865988) b!1303892))

(assert (= (and b!1303892 res!865990) b!1303893))

(assert (= (and b!1303893 res!865987) b!1303899))

(assert (= (and b!1303893 c!125164) b!1303902))

(assert (= (and b!1303893 (not c!125164)) b!1303894))

(assert (= (and b!1303902 res!865989) b!1303897))

(assert (= (and b!1303894 c!125165) b!1303898))

(assert (= (and b!1303894 (not c!125165)) b!1303895))

(declare-fun b_lambda!23287 () Bool)

(assert (=> (not b_lambda!23287) (not b!1303897)))

(assert (=> b!1303897 t!43344))

(declare-fun b_and!47445 () Bool)

(assert (= b_and!47443 (and (=> t!43344 result!23819) b_and!47445)))

(declare-fun b_lambda!23289 () Bool)

(assert (=> (not b_lambda!23289) (not b!1303901)))

(assert (=> b!1303901 t!43344))

(declare-fun b_and!47447 () Bool)

(assert (= b_and!47445 (and (=> t!43344 result!23819) b_and!47447)))

(declare-fun m!1194801 () Bool)

(assert (=> bm!64235 m!1194801))

(declare-fun m!1194803 () Bool)

(assert (=> b!1303901 m!1194803))

(declare-fun m!1194805 () Bool)

(assert (=> b!1303901 m!1194805))

(assert (=> b!1303901 m!1194609))

(declare-fun m!1194807 () Bool)

(assert (=> b!1303901 m!1194807))

(assert (=> b!1303901 m!1194609))

(declare-fun m!1194809 () Bool)

(assert (=> b!1303901 m!1194809))

(assert (=> b!1303901 m!1194805))

(assert (=> b!1303901 m!1194803))

(declare-fun m!1194811 () Bool)

(assert (=> b!1303901 m!1194811))

(declare-fun m!1194813 () Bool)

(assert (=> b!1303901 m!1194813))

(declare-fun m!1194815 () Bool)

(assert (=> b!1303901 m!1194815))

(declare-fun m!1194817 () Bool)

(assert (=> b!1303895 m!1194817))

(assert (=> b!1303899 m!1194815))

(assert (=> b!1303899 m!1194815))

(declare-fun m!1194819 () Bool)

(assert (=> b!1303899 m!1194819))

(assert (=> b!1303903 m!1194815))

(assert (=> b!1303903 m!1194815))

(assert (=> b!1303903 m!1194819))

(assert (=> b!1303902 m!1194815))

(assert (=> b!1303902 m!1194815))

(declare-fun m!1194821 () Bool)

(assert (=> b!1303902 m!1194821))

(declare-fun m!1194823 () Bool)

(assert (=> d!141707 m!1194823))

(assert (=> d!141707 m!1194551))

(assert (=> b!1303897 m!1194815))

(declare-fun m!1194825 () Bool)

(assert (=> b!1303897 m!1194825))

(assert (=> b!1303897 m!1194805))

(assert (=> b!1303897 m!1194609))

(assert (=> b!1303897 m!1194807))

(assert (=> b!1303897 m!1194609))

(assert (=> b!1303897 m!1194815))

(assert (=> b!1303897 m!1194805))

(assert (=> b!1303898 m!1194801))

(declare-fun m!1194827 () Bool)

(assert (=> b!1303892 m!1194827))

(assert (=> bm!64206 d!141707))

(declare-fun d!141709 () Bool)

(declare-fun res!865993 () Bool)

(declare-fun e!743740 () Bool)

(assert (=> d!141709 (=> res!865993 e!743740)))

(assert (=> d!141709 (= res!865993 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!42457 _keys!1741)))))

(assert (=> d!141709 (= (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125145 (Cons!29742 (select (arr!41907 _keys!1741) #b00000000000000000000000000000000) Nil!29743) Nil!29743)) e!743740)))

(declare-fun b!1303904 () Bool)

(declare-fun e!743741 () Bool)

(assert (=> b!1303904 (= e!743740 e!743741)))

(declare-fun res!865991 () Bool)

(assert (=> b!1303904 (=> (not res!865991) (not e!743741))))

(declare-fun e!743742 () Bool)

(assert (=> b!1303904 (= res!865991 (not e!743742))))

(declare-fun res!865992 () Bool)

(assert (=> b!1303904 (=> (not res!865992) (not e!743742))))

(assert (=> b!1303904 (= res!865992 (validKeyInArray!0 (select (arr!41907 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1303905 () Bool)

(assert (=> b!1303905 (= e!743742 (contains!8293 (ite c!125145 (Cons!29742 (select (arr!41907 _keys!1741) #b00000000000000000000000000000000) Nil!29743) Nil!29743) (select (arr!41907 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1303906 () Bool)

(declare-fun e!743743 () Bool)

(declare-fun call!64239 () Bool)

(assert (=> b!1303906 (= e!743743 call!64239)))

(declare-fun b!1303907 () Bool)

(assert (=> b!1303907 (= e!743743 call!64239)))

(declare-fun c!125167 () Bool)

(declare-fun bm!64236 () Bool)

(assert (=> bm!64236 (= call!64239 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!125167 (Cons!29742 (select (arr!41907 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!125145 (Cons!29742 (select (arr!41907 _keys!1741) #b00000000000000000000000000000000) Nil!29743) Nil!29743)) (ite c!125145 (Cons!29742 (select (arr!41907 _keys!1741) #b00000000000000000000000000000000) Nil!29743) Nil!29743))))))

(declare-fun b!1303908 () Bool)

(assert (=> b!1303908 (= e!743741 e!743743)))

(assert (=> b!1303908 (= c!125167 (validKeyInArray!0 (select (arr!41907 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!141709 (not res!865993)) b!1303904))

(assert (= (and b!1303904 res!865992) b!1303905))

(assert (= (and b!1303904 res!865991) b!1303908))

(assert (= (and b!1303908 c!125167) b!1303906))

(assert (= (and b!1303908 (not c!125167)) b!1303907))

(assert (= (or b!1303906 b!1303907) bm!64236))

(assert (=> b!1303904 m!1194739))

(assert (=> b!1303904 m!1194739))

(assert (=> b!1303904 m!1194741))

(assert (=> b!1303905 m!1194739))

(assert (=> b!1303905 m!1194739))

(declare-fun m!1194829 () Bool)

(assert (=> b!1303905 m!1194829))

(assert (=> bm!64236 m!1194739))

(declare-fun m!1194831 () Bool)

(assert (=> bm!64236 m!1194831))

(assert (=> b!1303908 m!1194739))

(assert (=> b!1303908 m!1194739))

(assert (=> b!1303908 m!1194741))

(assert (=> bm!64233 d!141709))

(declare-fun d!141711 () Bool)

(declare-fun isEmpty!1063 (Option!757) Bool)

(assert (=> d!141711 (= (isDefined!512 (getValueByKey!705 (toList!10155 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)) (not (isEmpty!1063 (getValueByKey!705 (toList!10155 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))))

(declare-fun bs!37129 () Bool)

(assert (= bs!37129 d!141711))

(assert (=> bs!37129 m!1194599))

(declare-fun m!1194833 () Bool)

(assert (=> bs!37129 m!1194833))

(assert (=> b!1303687 d!141711))

(declare-fun b!1303920 () Bool)

(declare-fun e!743749 () Option!757)

(assert (=> b!1303920 (= e!743749 None!755)))

(declare-fun b!1303919 () Bool)

(assert (=> b!1303919 (= e!743749 (getValueByKey!705 (t!43341 (toList!10155 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(declare-fun e!743748 () Option!757)

(declare-fun b!1303917 () Bool)

(assert (=> b!1303917 (= e!743748 (Some!756 (_2!11322 (h!30952 (toList!10155 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))))

(declare-fun d!141713 () Bool)

(declare-fun c!125172 () Bool)

(assert (=> d!141713 (= c!125172 (and ((_ is Cons!29743) (toList!10155 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11322 (h!30952 (toList!10155 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(assert (=> d!141713 (= (getValueByKey!705 (toList!10155 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!743748)))

(declare-fun b!1303918 () Bool)

(assert (=> b!1303918 (= e!743748 e!743749)))

(declare-fun c!125173 () Bool)

(assert (=> b!1303918 (= c!125173 (and ((_ is Cons!29743) (toList!10155 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (not (= (_1!11322 (h!30952 (toList!10155 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205))))))

(assert (= (and d!141713 c!125172) b!1303917))

(assert (= (and d!141713 (not c!125172)) b!1303918))

(assert (= (and b!1303918 c!125173) b!1303919))

(assert (= (and b!1303918 (not c!125173)) b!1303920))

(declare-fun m!1194835 () Bool)

(assert (=> b!1303919 m!1194835))

(assert (=> b!1303687 d!141713))

(assert (=> b!1303723 d!141655))

(assert (=> b!1303778 d!141655))

(declare-fun d!141715 () Bool)

(assert (=> d!141715 (= (apply!1022 lt!583441 #b1000000000000000000000000000000000000000000000000000000000000000) (get!21167 (getValueByKey!705 (toList!10155 lt!583441) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37130 () Bool)

(assert (= bs!37130 d!141715))

(assert (=> bs!37130 m!1194715))

(assert (=> bs!37130 m!1194715))

(declare-fun m!1194837 () Bool)

(assert (=> bs!37130 m!1194837))

(assert (=> b!1303777 d!141715))

(declare-fun d!141717 () Bool)

(declare-fun e!743750 () Bool)

(assert (=> d!141717 e!743750))

(declare-fun res!865994 () Bool)

(assert (=> d!141717 (=> res!865994 e!743750)))

(declare-fun lt!583526 () Bool)

(assert (=> d!141717 (= res!865994 (not lt!583526))))

(declare-fun lt!583527 () Bool)

(assert (=> d!141717 (= lt!583526 lt!583527)))

(declare-fun lt!583529 () Unit!43164)

(declare-fun e!743751 () Unit!43164)

(assert (=> d!141717 (= lt!583529 e!743751)))

(declare-fun c!125174 () Bool)

(assert (=> d!141717 (= c!125174 lt!583527)))

(assert (=> d!141717 (= lt!583527 (containsKey!727 (toList!10155 lt!583388) (select (arr!41907 _keys!1741) from!2144)))))

(assert (=> d!141717 (= (contains!8291 lt!583388 (select (arr!41907 _keys!1741) from!2144)) lt!583526)))

(declare-fun b!1303921 () Bool)

(declare-fun lt!583528 () Unit!43164)

(assert (=> b!1303921 (= e!743751 lt!583528)))

(assert (=> b!1303921 (= lt!583528 (lemmaContainsKeyImpliesGetValueByKeyDefined!473 (toList!10155 lt!583388) (select (arr!41907 _keys!1741) from!2144)))))

(assert (=> b!1303921 (isDefined!512 (getValueByKey!705 (toList!10155 lt!583388) (select (arr!41907 _keys!1741) from!2144)))))

(declare-fun b!1303922 () Bool)

(declare-fun Unit!43174 () Unit!43164)

(assert (=> b!1303922 (= e!743751 Unit!43174)))

(declare-fun b!1303923 () Bool)

(assert (=> b!1303923 (= e!743750 (isDefined!512 (getValueByKey!705 (toList!10155 lt!583388) (select (arr!41907 _keys!1741) from!2144))))))

(assert (= (and d!141717 c!125174) b!1303921))

(assert (= (and d!141717 (not c!125174)) b!1303922))

(assert (= (and d!141717 (not res!865994)) b!1303923))

(assert (=> d!141717 m!1194563))

(declare-fun m!1194839 () Bool)

(assert (=> d!141717 m!1194839))

(assert (=> b!1303921 m!1194563))

(declare-fun m!1194841 () Bool)

(assert (=> b!1303921 m!1194841))

(assert (=> b!1303921 m!1194563))

(declare-fun m!1194843 () Bool)

(assert (=> b!1303921 m!1194843))

(assert (=> b!1303921 m!1194843))

(declare-fun m!1194845 () Bool)

(assert (=> b!1303921 m!1194845))

(assert (=> b!1303923 m!1194563))

(assert (=> b!1303923 m!1194843))

(assert (=> b!1303923 m!1194843))

(assert (=> b!1303923 m!1194845))

(assert (=> b!1303722 d!141717))

(declare-fun d!141719 () Bool)

(assert (=> d!141719 (isDefined!512 (getValueByKey!705 (toList!10155 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun lt!583532 () Unit!43164)

(declare-fun choose!1922 (List!29747 (_ BitVec 64)) Unit!43164)

(assert (=> d!141719 (= lt!583532 (choose!1922 (toList!10155 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun e!743754 () Bool)

(assert (=> d!141719 e!743754))

(declare-fun res!865997 () Bool)

(assert (=> d!141719 (=> (not res!865997) (not e!743754))))

(declare-fun isStrictlySorted!872 (List!29747) Bool)

(assert (=> d!141719 (= res!865997 (isStrictlySorted!872 (toList!10155 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))

(assert (=> d!141719 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!473 (toList!10155 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) lt!583532)))

(declare-fun b!1303926 () Bool)

(assert (=> b!1303926 (= e!743754 (containsKey!727 (toList!10155 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (= (and d!141719 res!865997) b!1303926))

(assert (=> d!141719 m!1194599))

(assert (=> d!141719 m!1194599))

(assert (=> d!141719 m!1194601))

(declare-fun m!1194847 () Bool)

(assert (=> d!141719 m!1194847))

(declare-fun m!1194849 () Bool)

(assert (=> d!141719 m!1194849))

(assert (=> b!1303926 m!1194595))

(assert (=> b!1303685 d!141719))

(assert (=> b!1303685 d!141711))

(assert (=> b!1303685 d!141713))

(declare-fun d!141721 () Bool)

(declare-fun e!743755 () Bool)

(assert (=> d!141721 e!743755))

(declare-fun res!865998 () Bool)

(assert (=> d!141721 (=> res!865998 e!743755)))

(declare-fun lt!583533 () Bool)

(assert (=> d!141721 (= res!865998 (not lt!583533))))

(declare-fun lt!583534 () Bool)

(assert (=> d!141721 (= lt!583533 lt!583534)))

(declare-fun lt!583536 () Unit!43164)

(declare-fun e!743756 () Unit!43164)

(assert (=> d!141721 (= lt!583536 e!743756)))

(declare-fun c!125175 () Bool)

(assert (=> d!141721 (= c!125175 lt!583534)))

(assert (=> d!141721 (= lt!583534 (containsKey!727 (toList!10155 (+!4479 lt!583384 (tuple2!22623 lt!583387 lt!583386))) lt!583389))))

(assert (=> d!141721 (= (contains!8291 (+!4479 lt!583384 (tuple2!22623 lt!583387 lt!583386)) lt!583389) lt!583533)))

(declare-fun b!1303927 () Bool)

(declare-fun lt!583535 () Unit!43164)

(assert (=> b!1303927 (= e!743756 lt!583535)))

(assert (=> b!1303927 (= lt!583535 (lemmaContainsKeyImpliesGetValueByKeyDefined!473 (toList!10155 (+!4479 lt!583384 (tuple2!22623 lt!583387 lt!583386))) lt!583389))))

(assert (=> b!1303927 (isDefined!512 (getValueByKey!705 (toList!10155 (+!4479 lt!583384 (tuple2!22623 lt!583387 lt!583386))) lt!583389))))

(declare-fun b!1303928 () Bool)

(declare-fun Unit!43175 () Unit!43164)

(assert (=> b!1303928 (= e!743756 Unit!43175)))

(declare-fun b!1303929 () Bool)

(assert (=> b!1303929 (= e!743755 (isDefined!512 (getValueByKey!705 (toList!10155 (+!4479 lt!583384 (tuple2!22623 lt!583387 lt!583386))) lt!583389)))))

(assert (= (and d!141721 c!125175) b!1303927))

(assert (= (and d!141721 (not c!125175)) b!1303928))

(assert (= (and d!141721 (not res!865998)) b!1303929))

(declare-fun m!1194851 () Bool)

(assert (=> d!141721 m!1194851))

(declare-fun m!1194853 () Bool)

(assert (=> b!1303927 m!1194853))

(declare-fun m!1194855 () Bool)

(assert (=> b!1303927 m!1194855))

(assert (=> b!1303927 m!1194855))

(declare-fun m!1194857 () Bool)

(assert (=> b!1303927 m!1194857))

(assert (=> b!1303929 m!1194855))

(assert (=> b!1303929 m!1194855))

(assert (=> b!1303929 m!1194857))

(assert (=> b!1303721 d!141721))

(declare-fun d!141723 () Bool)

(declare-fun e!743757 () Bool)

(assert (=> d!141723 e!743757))

(declare-fun res!866000 () Bool)

(assert (=> d!141723 (=> (not res!866000) (not e!743757))))

(declare-fun lt!583540 () ListLongMap!20279)

(assert (=> d!141723 (= res!866000 (contains!8291 lt!583540 (_1!11322 (tuple2!22623 (select (arr!41907 _keys!1741) from!2144) (get!21166 (select (arr!41908 _values!1445) from!2144) (dynLambda!3429 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!583538 () List!29747)

(assert (=> d!141723 (= lt!583540 (ListLongMap!20280 lt!583538))))

(declare-fun lt!583539 () Unit!43164)

(declare-fun lt!583537 () Unit!43164)

(assert (=> d!141723 (= lt!583539 lt!583537)))

(assert (=> d!141723 (= (getValueByKey!705 lt!583538 (_1!11322 (tuple2!22623 (select (arr!41907 _keys!1741) from!2144) (get!21166 (select (arr!41908 _values!1445) from!2144) (dynLambda!3429 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!756 (_2!11322 (tuple2!22623 (select (arr!41907 _keys!1741) from!2144) (get!21166 (select (arr!41908 _values!1445) from!2144) (dynLambda!3429 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!141723 (= lt!583537 (lemmaContainsTupThenGetReturnValue!351 lt!583538 (_1!11322 (tuple2!22623 (select (arr!41907 _keys!1741) from!2144) (get!21166 (select (arr!41908 _values!1445) from!2144) (dynLambda!3429 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11322 (tuple2!22623 (select (arr!41907 _keys!1741) from!2144) (get!21166 (select (arr!41908 _values!1445) from!2144) (dynLambda!3429 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!141723 (= lt!583538 (insertStrictlySorted!480 (toList!10155 call!64209) (_1!11322 (tuple2!22623 (select (arr!41907 _keys!1741) from!2144) (get!21166 (select (arr!41908 _values!1445) from!2144) (dynLambda!3429 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11322 (tuple2!22623 (select (arr!41907 _keys!1741) from!2144) (get!21166 (select (arr!41908 _values!1445) from!2144) (dynLambda!3429 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!141723 (= (+!4479 call!64209 (tuple2!22623 (select (arr!41907 _keys!1741) from!2144) (get!21166 (select (arr!41908 _values!1445) from!2144) (dynLambda!3429 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!583540)))

(declare-fun b!1303930 () Bool)

(declare-fun res!865999 () Bool)

(assert (=> b!1303930 (=> (not res!865999) (not e!743757))))

(assert (=> b!1303930 (= res!865999 (= (getValueByKey!705 (toList!10155 lt!583540) (_1!11322 (tuple2!22623 (select (arr!41907 _keys!1741) from!2144) (get!21166 (select (arr!41908 _values!1445) from!2144) (dynLambda!3429 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!756 (_2!11322 (tuple2!22623 (select (arr!41907 _keys!1741) from!2144) (get!21166 (select (arr!41908 _values!1445) from!2144) (dynLambda!3429 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1303931 () Bool)

(assert (=> b!1303931 (= e!743757 (contains!8294 (toList!10155 lt!583540) (tuple2!22623 (select (arr!41907 _keys!1741) from!2144) (get!21166 (select (arr!41908 _values!1445) from!2144) (dynLambda!3429 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!141723 res!866000) b!1303930))

(assert (= (and b!1303930 res!865999) b!1303931))

(declare-fun m!1194859 () Bool)

(assert (=> d!141723 m!1194859))

(declare-fun m!1194861 () Bool)

(assert (=> d!141723 m!1194861))

(declare-fun m!1194863 () Bool)

(assert (=> d!141723 m!1194863))

(declare-fun m!1194865 () Bool)

(assert (=> d!141723 m!1194865))

(declare-fun m!1194867 () Bool)

(assert (=> b!1303930 m!1194867))

(declare-fun m!1194869 () Bool)

(assert (=> b!1303931 m!1194869))

(assert (=> b!1303721 d!141723))

(declare-fun d!141725 () Bool)

(declare-fun e!743758 () Bool)

(assert (=> d!141725 e!743758))

(declare-fun res!866002 () Bool)

(assert (=> d!141725 (=> (not res!866002) (not e!743758))))

(declare-fun lt!583544 () ListLongMap!20279)

(assert (=> d!141725 (= res!866002 (contains!8291 lt!583544 (_1!11322 (tuple2!22623 lt!583387 lt!583386))))))

(declare-fun lt!583542 () List!29747)

(assert (=> d!141725 (= lt!583544 (ListLongMap!20280 lt!583542))))

(declare-fun lt!583543 () Unit!43164)

(declare-fun lt!583541 () Unit!43164)

(assert (=> d!141725 (= lt!583543 lt!583541)))

(assert (=> d!141725 (= (getValueByKey!705 lt!583542 (_1!11322 (tuple2!22623 lt!583387 lt!583386))) (Some!756 (_2!11322 (tuple2!22623 lt!583387 lt!583386))))))

(assert (=> d!141725 (= lt!583541 (lemmaContainsTupThenGetReturnValue!351 lt!583542 (_1!11322 (tuple2!22623 lt!583387 lt!583386)) (_2!11322 (tuple2!22623 lt!583387 lt!583386))))))

(assert (=> d!141725 (= lt!583542 (insertStrictlySorted!480 (toList!10155 lt!583384) (_1!11322 (tuple2!22623 lt!583387 lt!583386)) (_2!11322 (tuple2!22623 lt!583387 lt!583386))))))

(assert (=> d!141725 (= (+!4479 lt!583384 (tuple2!22623 lt!583387 lt!583386)) lt!583544)))

(declare-fun b!1303932 () Bool)

(declare-fun res!866001 () Bool)

(assert (=> b!1303932 (=> (not res!866001) (not e!743758))))

(assert (=> b!1303932 (= res!866001 (= (getValueByKey!705 (toList!10155 lt!583544) (_1!11322 (tuple2!22623 lt!583387 lt!583386))) (Some!756 (_2!11322 (tuple2!22623 lt!583387 lt!583386)))))))

(declare-fun b!1303933 () Bool)

(assert (=> b!1303933 (= e!743758 (contains!8294 (toList!10155 lt!583544) (tuple2!22623 lt!583387 lt!583386)))))

(assert (= (and d!141725 res!866002) b!1303932))

(assert (= (and b!1303932 res!866001) b!1303933))

(declare-fun m!1194871 () Bool)

(assert (=> d!141725 m!1194871))

(declare-fun m!1194873 () Bool)

(assert (=> d!141725 m!1194873))

(declare-fun m!1194875 () Bool)

(assert (=> d!141725 m!1194875))

(declare-fun m!1194877 () Bool)

(assert (=> d!141725 m!1194877))

(declare-fun m!1194879 () Bool)

(assert (=> b!1303932 m!1194879))

(declare-fun m!1194881 () Bool)

(assert (=> b!1303933 m!1194881))

(assert (=> b!1303721 d!141725))

(declare-fun d!141727 () Bool)

(assert (=> d!141727 (not (contains!8291 (+!4479 lt!583384 (tuple2!22623 lt!583387 lt!583386)) lt!583389))))

(declare-fun lt!583547 () Unit!43164)

(declare-fun choose!1923 (ListLongMap!20279 (_ BitVec 64) V!51651 (_ BitVec 64)) Unit!43164)

(assert (=> d!141727 (= lt!583547 (choose!1923 lt!583384 lt!583387 lt!583386 lt!583389))))

(declare-fun e!743761 () Bool)

(assert (=> d!141727 e!743761))

(declare-fun res!866005 () Bool)

(assert (=> d!141727 (=> (not res!866005) (not e!743761))))

(assert (=> d!141727 (= res!866005 (not (contains!8291 lt!583384 lt!583389)))))

(assert (=> d!141727 (= (addStillNotContains!476 lt!583384 lt!583387 lt!583386 lt!583389) lt!583547)))

(declare-fun b!1303937 () Bool)

(assert (=> b!1303937 (= e!743761 (not (= lt!583387 lt!583389)))))

(assert (= (and d!141727 res!866005) b!1303937))

(assert (=> d!141727 m!1194605))

(assert (=> d!141727 m!1194605))

(assert (=> d!141727 m!1194615))

(declare-fun m!1194883 () Bool)

(assert (=> d!141727 m!1194883))

(declare-fun m!1194885 () Bool)

(assert (=> d!141727 m!1194885))

(assert (=> b!1303721 d!141727))

(assert (=> b!1303721 d!141705))

(declare-fun d!141729 () Bool)

(declare-fun lt!583550 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!646 (List!29746) (InoxSet (_ BitVec 64)))

(assert (=> d!141729 (= lt!583550 (select (content!646 Nil!29743) (select (arr!41907 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun e!743766 () Bool)

(assert (=> d!141729 (= lt!583550 e!743766)))

(declare-fun res!866011 () Bool)

(assert (=> d!141729 (=> (not res!866011) (not e!743766))))

(assert (=> d!141729 (= res!866011 ((_ is Cons!29742) Nil!29743))))

(assert (=> d!141729 (= (contains!8293 Nil!29743 (select (arr!41907 _keys!1741) #b00000000000000000000000000000000)) lt!583550)))

(declare-fun b!1303942 () Bool)

(declare-fun e!743767 () Bool)

(assert (=> b!1303942 (= e!743766 e!743767)))

(declare-fun res!866010 () Bool)

(assert (=> b!1303942 (=> res!866010 e!743767)))

(assert (=> b!1303942 (= res!866010 (= (h!30951 Nil!29743) (select (arr!41907 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1303943 () Bool)

(assert (=> b!1303943 (= e!743767 (contains!8293 (t!43340 Nil!29743) (select (arr!41907 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!141729 res!866011) b!1303942))

(assert (= (and b!1303942 (not res!866010)) b!1303943))

(declare-fun m!1194887 () Bool)

(assert (=> d!141729 m!1194887))

(assert (=> d!141729 m!1194683))

(declare-fun m!1194889 () Bool)

(assert (=> d!141729 m!1194889))

(assert (=> b!1303943 m!1194683))

(declare-fun m!1194891 () Bool)

(assert (=> b!1303943 m!1194891))

(assert (=> b!1303818 d!141729))

(assert (=> b!1303776 d!141655))

(declare-fun d!141731 () Bool)

(declare-fun e!743768 () Bool)

(assert (=> d!141731 e!743768))

(declare-fun res!866013 () Bool)

(assert (=> d!141731 (=> (not res!866013) (not e!743768))))

(declare-fun lt!583554 () ListLongMap!20279)

(assert (=> d!141731 (= res!866013 (contains!8291 lt!583554 (_1!11322 (ite (or c!125138 c!125135) (tuple2!22623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22623 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun lt!583552 () List!29747)

(assert (=> d!141731 (= lt!583554 (ListLongMap!20280 lt!583552))))

(declare-fun lt!583553 () Unit!43164)

(declare-fun lt!583551 () Unit!43164)

(assert (=> d!141731 (= lt!583553 lt!583551)))

(assert (=> d!141731 (= (getValueByKey!705 lt!583552 (_1!11322 (ite (or c!125138 c!125135) (tuple2!22623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22623 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (Some!756 (_2!11322 (ite (or c!125138 c!125135) (tuple2!22623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22623 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!141731 (= lt!583551 (lemmaContainsTupThenGetReturnValue!351 lt!583552 (_1!11322 (ite (or c!125138 c!125135) (tuple2!22623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22623 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11322 (ite (or c!125138 c!125135) (tuple2!22623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22623 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!141731 (= lt!583552 (insertStrictlySorted!480 (toList!10155 (ite c!125138 call!64225 (ite c!125135 call!64226 call!64229))) (_1!11322 (ite (or c!125138 c!125135) (tuple2!22623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22623 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11322 (ite (or c!125138 c!125135) (tuple2!22623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22623 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!141731 (= (+!4479 (ite c!125138 call!64225 (ite c!125135 call!64226 call!64229)) (ite (or c!125138 c!125135) (tuple2!22623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22623 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) lt!583554)))

(declare-fun b!1303944 () Bool)

(declare-fun res!866012 () Bool)

(assert (=> b!1303944 (=> (not res!866012) (not e!743768))))

(assert (=> b!1303944 (= res!866012 (= (getValueByKey!705 (toList!10155 lt!583554) (_1!11322 (ite (or c!125138 c!125135) (tuple2!22623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22623 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (Some!756 (_2!11322 (ite (or c!125138 c!125135) (tuple2!22623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22623 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(declare-fun b!1303945 () Bool)

(assert (=> b!1303945 (= e!743768 (contains!8294 (toList!10155 lt!583554) (ite (or c!125138 c!125135) (tuple2!22623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22623 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (= (and d!141731 res!866013) b!1303944))

(assert (= (and b!1303944 res!866012) b!1303945))

(declare-fun m!1194893 () Bool)

(assert (=> d!141731 m!1194893))

(declare-fun m!1194895 () Bool)

(assert (=> d!141731 m!1194895))

(declare-fun m!1194897 () Bool)

(assert (=> d!141731 m!1194897))

(declare-fun m!1194899 () Bool)

(assert (=> d!141731 m!1194899))

(declare-fun m!1194901 () Bool)

(assert (=> b!1303944 m!1194901))

(declare-fun m!1194903 () Bool)

(assert (=> b!1303945 m!1194903))

(assert (=> bm!64225 d!141731))

(assert (=> b!1303817 d!141689))

(assert (=> b!1303719 d!141655))

(declare-fun d!141733 () Bool)

(assert (=> d!141733 (= (isDefined!512 (getValueByKey!705 (toList!10155 (getCurrentListMap!5176 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)) (not (isEmpty!1063 (getValueByKey!705 (toList!10155 (getCurrentListMap!5176 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))))

(declare-fun bs!37131 () Bool)

(assert (= bs!37131 d!141733))

(assert (=> bs!37131 m!1194633))

(declare-fun m!1194905 () Bool)

(assert (=> bs!37131 m!1194905))

(assert (=> b!1303728 d!141733))

(declare-fun b!1303949 () Bool)

(declare-fun e!743770 () Option!757)

(assert (=> b!1303949 (= e!743770 None!755)))

(declare-fun b!1303948 () Bool)

(assert (=> b!1303948 (= e!743770 (getValueByKey!705 (t!43341 (toList!10155 (getCurrentListMap!5176 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(declare-fun e!743769 () Option!757)

(declare-fun b!1303946 () Bool)

(assert (=> b!1303946 (= e!743769 (Some!756 (_2!11322 (h!30952 (toList!10155 (getCurrentListMap!5176 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))))

(declare-fun c!125176 () Bool)

(declare-fun d!141735 () Bool)

(assert (=> d!141735 (= c!125176 (and ((_ is Cons!29743) (toList!10155 (getCurrentListMap!5176 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11322 (h!30952 (toList!10155 (getCurrentListMap!5176 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(assert (=> d!141735 (= (getValueByKey!705 (toList!10155 (getCurrentListMap!5176 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!743769)))

(declare-fun b!1303947 () Bool)

(assert (=> b!1303947 (= e!743769 e!743770)))

(declare-fun c!125177 () Bool)

(assert (=> b!1303947 (= c!125177 (and ((_ is Cons!29743) (toList!10155 (getCurrentListMap!5176 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (not (= (_1!11322 (h!30952 (toList!10155 (getCurrentListMap!5176 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205))))))

(assert (= (and d!141735 c!125176) b!1303946))

(assert (= (and d!141735 (not c!125176)) b!1303947))

(assert (= (and b!1303947 c!125177) b!1303948))

(assert (= (and b!1303947 (not c!125177)) b!1303949))

(declare-fun m!1194907 () Bool)

(assert (=> b!1303948 m!1194907))

(assert (=> b!1303728 d!141735))

(assert (=> b!1303718 d!141707))

(declare-fun d!141737 () Bool)

(assert (=> d!141737 (= (apply!1022 lt!583388 (select (arr!41907 _keys!1741) from!2144)) (get!21167 (getValueByKey!705 (toList!10155 lt!583388) (select (arr!41907 _keys!1741) from!2144))))))

(declare-fun bs!37132 () Bool)

(assert (= bs!37132 d!141737))

(assert (=> bs!37132 m!1194563))

(assert (=> bs!37132 m!1194843))

(assert (=> bs!37132 m!1194843))

(declare-fun m!1194909 () Bool)

(assert (=> bs!37132 m!1194909))

(assert (=> b!1303717 d!141737))

(assert (=> b!1303717 d!141705))

(declare-fun d!141739 () Bool)

(assert (=> d!141739 (isDefined!512 (getValueByKey!705 (toList!10155 (getCurrentListMap!5176 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun lt!583555 () Unit!43164)

(assert (=> d!141739 (= lt!583555 (choose!1922 (toList!10155 (getCurrentListMap!5176 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun e!743771 () Bool)

(assert (=> d!141739 e!743771))

(declare-fun res!866014 () Bool)

(assert (=> d!141739 (=> (not res!866014) (not e!743771))))

(assert (=> d!141739 (= res!866014 (isStrictlySorted!872 (toList!10155 (getCurrentListMap!5176 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))

(assert (=> d!141739 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!473 (toList!10155 (getCurrentListMap!5176 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) lt!583555)))

(declare-fun b!1303950 () Bool)

(assert (=> b!1303950 (= e!743771 (containsKey!727 (toList!10155 (getCurrentListMap!5176 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (= (and d!141739 res!866014) b!1303950))

(assert (=> d!141739 m!1194633))

(assert (=> d!141739 m!1194633))

(assert (=> d!141739 m!1194635))

(declare-fun m!1194911 () Bool)

(assert (=> d!141739 m!1194911))

(declare-fun m!1194913 () Bool)

(assert (=> d!141739 m!1194913))

(assert (=> b!1303950 m!1194629))

(assert (=> b!1303726 d!141739))

(assert (=> b!1303726 d!141733))

(assert (=> b!1303726 d!141735))

(declare-fun d!141741 () Bool)

(assert (=> d!141741 (= (isDefined!512 (getValueByKey!705 (toList!10155 (ListLongMap!20280 Nil!29744)) k0!1205)) (not (isEmpty!1063 (getValueByKey!705 (toList!10155 (ListLongMap!20280 Nil!29744)) k0!1205))))))

(declare-fun bs!37133 () Bool)

(assert (= bs!37133 d!141741))

(assert (=> bs!37133 m!1194699))

(declare-fun m!1194915 () Bool)

(assert (=> bs!37133 m!1194915))

(assert (=> b!1303806 d!141741))

(declare-fun b!1303954 () Bool)

(declare-fun e!743773 () Option!757)

(assert (=> b!1303954 (= e!743773 None!755)))

(declare-fun b!1303953 () Bool)

(assert (=> b!1303953 (= e!743773 (getValueByKey!705 (t!43341 (toList!10155 (ListLongMap!20280 Nil!29744))) k0!1205))))

(declare-fun b!1303951 () Bool)

(declare-fun e!743772 () Option!757)

(assert (=> b!1303951 (= e!743772 (Some!756 (_2!11322 (h!30952 (toList!10155 (ListLongMap!20280 Nil!29744))))))))

(declare-fun d!141743 () Bool)

(declare-fun c!125178 () Bool)

(assert (=> d!141743 (= c!125178 (and ((_ is Cons!29743) (toList!10155 (ListLongMap!20280 Nil!29744))) (= (_1!11322 (h!30952 (toList!10155 (ListLongMap!20280 Nil!29744)))) k0!1205)))))

(assert (=> d!141743 (= (getValueByKey!705 (toList!10155 (ListLongMap!20280 Nil!29744)) k0!1205) e!743772)))

(declare-fun b!1303952 () Bool)

(assert (=> b!1303952 (= e!743772 e!743773)))

(declare-fun c!125179 () Bool)

(assert (=> b!1303952 (= c!125179 (and ((_ is Cons!29743) (toList!10155 (ListLongMap!20280 Nil!29744))) (not (= (_1!11322 (h!30952 (toList!10155 (ListLongMap!20280 Nil!29744)))) k0!1205))))))

(assert (= (and d!141743 c!125178) b!1303951))

(assert (= (and d!141743 (not c!125178)) b!1303952))

(assert (= (and b!1303952 c!125179) b!1303953))

(assert (= (and b!1303952 (not c!125179)) b!1303954))

(declare-fun m!1194917 () Bool)

(assert (=> b!1303953 m!1194917))

(assert (=> b!1303806 d!141743))

(declare-fun d!141745 () Bool)

(declare-fun isEmpty!1064 (List!29747) Bool)

(assert (=> d!141745 (= (isEmpty!1062 lt!583388) (isEmpty!1064 (toList!10155 lt!583388)))))

(declare-fun bs!37134 () Bool)

(assert (= bs!37134 d!141745))

(declare-fun m!1194919 () Bool)

(assert (=> bs!37134 m!1194919))

(assert (=> b!1303715 d!141745))

(declare-fun d!141747 () Bool)

(assert (=> d!141747 (isDefined!512 (getValueByKey!705 (toList!10155 (ListLongMap!20280 Nil!29744)) k0!1205))))

(declare-fun lt!583556 () Unit!43164)

(assert (=> d!141747 (= lt!583556 (choose!1922 (toList!10155 (ListLongMap!20280 Nil!29744)) k0!1205))))

(declare-fun e!743774 () Bool)

(assert (=> d!141747 e!743774))

(declare-fun res!866015 () Bool)

(assert (=> d!141747 (=> (not res!866015) (not e!743774))))

(assert (=> d!141747 (= res!866015 (isStrictlySorted!872 (toList!10155 (ListLongMap!20280 Nil!29744))))))

(assert (=> d!141747 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!473 (toList!10155 (ListLongMap!20280 Nil!29744)) k0!1205) lt!583556)))

(declare-fun b!1303955 () Bool)

(assert (=> b!1303955 (= e!743774 (containsKey!727 (toList!10155 (ListLongMap!20280 Nil!29744)) k0!1205))))

(assert (= (and d!141747 res!866015) b!1303955))

(assert (=> d!141747 m!1194699))

(assert (=> d!141747 m!1194699))

(assert (=> d!141747 m!1194701))

(declare-fun m!1194921 () Bool)

(assert (=> d!141747 m!1194921))

(declare-fun m!1194923 () Bool)

(assert (=> d!141747 m!1194923))

(assert (=> b!1303955 m!1194695))

(assert (=> b!1303804 d!141747))

(assert (=> b!1303804 d!141741))

(assert (=> b!1303804 d!141743))

(declare-fun d!141749 () Bool)

(declare-fun e!743775 () Bool)

(assert (=> d!141749 e!743775))

(declare-fun res!866016 () Bool)

(assert (=> d!141749 (=> res!866016 e!743775)))

(declare-fun lt!583557 () Bool)

(assert (=> d!141749 (= res!866016 (not lt!583557))))

(declare-fun lt!583558 () Bool)

(assert (=> d!141749 (= lt!583557 lt!583558)))

(declare-fun lt!583560 () Unit!43164)

(declare-fun e!743776 () Unit!43164)

(assert (=> d!141749 (= lt!583560 e!743776)))

(declare-fun c!125180 () Bool)

(assert (=> d!141749 (= c!125180 lt!583558)))

(assert (=> d!141749 (= lt!583558 (containsKey!727 (toList!10155 lt!583441) (select (arr!41907 _keys!1741) from!2144)))))

(assert (=> d!141749 (= (contains!8291 lt!583441 (select (arr!41907 _keys!1741) from!2144)) lt!583557)))

(declare-fun b!1303956 () Bool)

(declare-fun lt!583559 () Unit!43164)

(assert (=> b!1303956 (= e!743776 lt!583559)))

(assert (=> b!1303956 (= lt!583559 (lemmaContainsKeyImpliesGetValueByKeyDefined!473 (toList!10155 lt!583441) (select (arr!41907 _keys!1741) from!2144)))))

(assert (=> b!1303956 (isDefined!512 (getValueByKey!705 (toList!10155 lt!583441) (select (arr!41907 _keys!1741) from!2144)))))

(declare-fun b!1303957 () Bool)

(declare-fun Unit!43176 () Unit!43164)

(assert (=> b!1303957 (= e!743776 Unit!43176)))

(declare-fun b!1303958 () Bool)

(assert (=> b!1303958 (= e!743775 (isDefined!512 (getValueByKey!705 (toList!10155 lt!583441) (select (arr!41907 _keys!1741) from!2144))))))

(assert (= (and d!141749 c!125180) b!1303956))

(assert (= (and d!141749 (not c!125180)) b!1303957))

(assert (= (and d!141749 (not res!866016)) b!1303958))

(assert (=> d!141749 m!1194563))

(declare-fun m!1194925 () Bool)

(assert (=> d!141749 m!1194925))

(assert (=> b!1303956 m!1194563))

(declare-fun m!1194927 () Bool)

(assert (=> b!1303956 m!1194927))

(assert (=> b!1303956 m!1194563))

(assert (=> b!1303956 m!1194793))

(assert (=> b!1303956 m!1194793))

(declare-fun m!1194929 () Bool)

(assert (=> b!1303956 m!1194929))

(assert (=> b!1303958 m!1194563))

(assert (=> b!1303958 m!1194793))

(assert (=> b!1303958 m!1194793))

(assert (=> b!1303958 m!1194929))

(assert (=> b!1303773 d!141749))

(declare-fun d!141751 () Bool)

(declare-fun e!743777 () Bool)

(assert (=> d!141751 e!743777))

(declare-fun res!866018 () Bool)

(assert (=> d!141751 (=> (not res!866018) (not e!743777))))

(declare-fun lt!583564 () ListLongMap!20279)

(assert (=> d!141751 (= res!866018 (contains!8291 lt!583564 (_1!11322 (tuple2!22623 lt!583459 zeroValue!1387))))))

(declare-fun lt!583562 () List!29747)

(assert (=> d!141751 (= lt!583564 (ListLongMap!20280 lt!583562))))

(declare-fun lt!583563 () Unit!43164)

(declare-fun lt!583561 () Unit!43164)

(assert (=> d!141751 (= lt!583563 lt!583561)))

(assert (=> d!141751 (= (getValueByKey!705 lt!583562 (_1!11322 (tuple2!22623 lt!583459 zeroValue!1387))) (Some!756 (_2!11322 (tuple2!22623 lt!583459 zeroValue!1387))))))

(assert (=> d!141751 (= lt!583561 (lemmaContainsTupThenGetReturnValue!351 lt!583562 (_1!11322 (tuple2!22623 lt!583459 zeroValue!1387)) (_2!11322 (tuple2!22623 lt!583459 zeroValue!1387))))))

(assert (=> d!141751 (= lt!583562 (insertStrictlySorted!480 (toList!10155 lt!583456) (_1!11322 (tuple2!22623 lt!583459 zeroValue!1387)) (_2!11322 (tuple2!22623 lt!583459 zeroValue!1387))))))

(assert (=> d!141751 (= (+!4479 lt!583456 (tuple2!22623 lt!583459 zeroValue!1387)) lt!583564)))

(declare-fun b!1303959 () Bool)

(declare-fun res!866017 () Bool)

(assert (=> b!1303959 (=> (not res!866017) (not e!743777))))

(assert (=> b!1303959 (= res!866017 (= (getValueByKey!705 (toList!10155 lt!583564) (_1!11322 (tuple2!22623 lt!583459 zeroValue!1387))) (Some!756 (_2!11322 (tuple2!22623 lt!583459 zeroValue!1387)))))))

(declare-fun b!1303960 () Bool)

(assert (=> b!1303960 (= e!743777 (contains!8294 (toList!10155 lt!583564) (tuple2!22623 lt!583459 zeroValue!1387)))))

(assert (= (and d!141751 res!866018) b!1303959))

(assert (= (and b!1303959 res!866017) b!1303960))

(declare-fun m!1194931 () Bool)

(assert (=> d!141751 m!1194931))

(declare-fun m!1194933 () Bool)

(assert (=> d!141751 m!1194933))

(declare-fun m!1194935 () Bool)

(assert (=> d!141751 m!1194935))

(declare-fun m!1194937 () Bool)

(assert (=> d!141751 m!1194937))

(declare-fun m!1194939 () Bool)

(assert (=> b!1303959 m!1194939))

(declare-fun m!1194941 () Bool)

(assert (=> b!1303960 m!1194941))

(assert (=> b!1303772 d!141751))

(declare-fun d!141753 () Bool)

(assert (=> d!141753 (= (apply!1022 (+!4479 lt!583456 (tuple2!22623 lt!583459 zeroValue!1387)) lt!583442) (apply!1022 lt!583456 lt!583442))))

(declare-fun lt!583567 () Unit!43164)

(declare-fun choose!1924 (ListLongMap!20279 (_ BitVec 64) V!51651 (_ BitVec 64)) Unit!43164)

(assert (=> d!141753 (= lt!583567 (choose!1924 lt!583456 lt!583459 zeroValue!1387 lt!583442))))

(declare-fun e!743780 () Bool)

(assert (=> d!141753 e!743780))

(declare-fun res!866021 () Bool)

(assert (=> d!141753 (=> (not res!866021) (not e!743780))))

(assert (=> d!141753 (= res!866021 (contains!8291 lt!583456 lt!583442))))

(assert (=> d!141753 (= (addApplyDifferent!564 lt!583456 lt!583459 zeroValue!1387 lt!583442) lt!583567)))

(declare-fun b!1303964 () Bool)

(assert (=> b!1303964 (= e!743780 (not (= lt!583442 lt!583459)))))

(assert (= (and d!141753 res!866021) b!1303964))

(assert (=> d!141753 m!1194649))

(declare-fun m!1194943 () Bool)

(assert (=> d!141753 m!1194943))

(declare-fun m!1194945 () Bool)

(assert (=> d!141753 m!1194945))

(assert (=> d!141753 m!1194649))

(assert (=> d!141753 m!1194651))

(assert (=> d!141753 m!1194661))

(assert (=> b!1303772 d!141753))

(declare-fun d!141755 () Bool)

(assert (=> d!141755 (= (apply!1022 (+!4479 lt!583453 (tuple2!22623 lt!583440 minValue!1387)) lt!583443) (apply!1022 lt!583453 lt!583443))))

(declare-fun lt!583568 () Unit!43164)

(assert (=> d!141755 (= lt!583568 (choose!1924 lt!583453 lt!583440 minValue!1387 lt!583443))))

(declare-fun e!743781 () Bool)

(assert (=> d!141755 e!743781))

(declare-fun res!866022 () Bool)

(assert (=> d!141755 (=> (not res!866022) (not e!743781))))

(assert (=> d!141755 (= res!866022 (contains!8291 lt!583453 lt!583443))))

(assert (=> d!141755 (= (addApplyDifferent!564 lt!583453 lt!583440 minValue!1387 lt!583443) lt!583568)))

(declare-fun b!1303965 () Bool)

(assert (=> b!1303965 (= e!743781 (not (= lt!583443 lt!583440)))))

(assert (= (and d!141755 res!866022) b!1303965))

(assert (=> d!141755 m!1194643))

(declare-fun m!1194947 () Bool)

(assert (=> d!141755 m!1194947))

(declare-fun m!1194949 () Bool)

(assert (=> d!141755 m!1194949))

(assert (=> d!141755 m!1194643))

(assert (=> d!141755 m!1194645))

(assert (=> d!141755 m!1194639))

(assert (=> b!1303772 d!141755))

(declare-fun d!141757 () Bool)

(assert (=> d!141757 (= (apply!1022 (+!4479 lt!583451 (tuple2!22623 lt!583454 minValue!1387)) lt!583446) (apply!1022 lt!583451 lt!583446))))

(declare-fun lt!583569 () Unit!43164)

(assert (=> d!141757 (= lt!583569 (choose!1924 lt!583451 lt!583454 minValue!1387 lt!583446))))

(declare-fun e!743782 () Bool)

(assert (=> d!141757 e!743782))

(declare-fun res!866023 () Bool)

(assert (=> d!141757 (=> (not res!866023) (not e!743782))))

(assert (=> d!141757 (= res!866023 (contains!8291 lt!583451 lt!583446))))

(assert (=> d!141757 (= (addApplyDifferent!564 lt!583451 lt!583454 minValue!1387 lt!583446) lt!583569)))

(declare-fun b!1303966 () Bool)

(assert (=> b!1303966 (= e!743782 (not (= lt!583446 lt!583454)))))

(assert (= (and d!141757 res!866023) b!1303966))

(assert (=> d!141757 m!1194663))

(declare-fun m!1194951 () Bool)

(assert (=> d!141757 m!1194951))

(declare-fun m!1194953 () Bool)

(assert (=> d!141757 m!1194953))

(assert (=> d!141757 m!1194663))

(assert (=> d!141757 m!1194665))

(assert (=> d!141757 m!1194641))

(assert (=> b!1303772 d!141757))

(assert (=> b!1303772 d!141659))

(declare-fun d!141759 () Bool)

(assert (=> d!141759 (= (apply!1022 (+!4479 lt!583453 (tuple2!22623 lt!583440 minValue!1387)) lt!583443) (get!21167 (getValueByKey!705 (toList!10155 (+!4479 lt!583453 (tuple2!22623 lt!583440 minValue!1387))) lt!583443)))))

(declare-fun bs!37135 () Bool)

(assert (= bs!37135 d!141759))

(declare-fun m!1194955 () Bool)

(assert (=> bs!37135 m!1194955))

(assert (=> bs!37135 m!1194955))

(declare-fun m!1194957 () Bool)

(assert (=> bs!37135 m!1194957))

(assert (=> b!1303772 d!141759))

(declare-fun d!141761 () Bool)

(assert (=> d!141761 (contains!8291 (+!4479 lt!583444 (tuple2!22623 lt!583458 zeroValue!1387)) lt!583450)))

(declare-fun lt!583572 () Unit!43164)

(declare-fun choose!1925 (ListLongMap!20279 (_ BitVec 64) V!51651 (_ BitVec 64)) Unit!43164)

(assert (=> d!141761 (= lt!583572 (choose!1925 lt!583444 lt!583458 zeroValue!1387 lt!583450))))

(assert (=> d!141761 (contains!8291 lt!583444 lt!583450)))

(assert (=> d!141761 (= (addStillContains!1110 lt!583444 lt!583458 zeroValue!1387 lt!583450) lt!583572)))

(declare-fun bs!37136 () Bool)

(assert (= bs!37136 d!141761))

(assert (=> bs!37136 m!1194653))

(assert (=> bs!37136 m!1194653))

(assert (=> bs!37136 m!1194659))

(declare-fun m!1194959 () Bool)

(assert (=> bs!37136 m!1194959))

(declare-fun m!1194961 () Bool)

(assert (=> bs!37136 m!1194961))

(assert (=> b!1303772 d!141761))

(declare-fun d!141763 () Bool)

(declare-fun e!743783 () Bool)

(assert (=> d!141763 e!743783))

(declare-fun res!866025 () Bool)

(assert (=> d!141763 (=> (not res!866025) (not e!743783))))

(declare-fun lt!583576 () ListLongMap!20279)

(assert (=> d!141763 (= res!866025 (contains!8291 lt!583576 (_1!11322 (tuple2!22623 lt!583458 zeroValue!1387))))))

(declare-fun lt!583574 () List!29747)

(assert (=> d!141763 (= lt!583576 (ListLongMap!20280 lt!583574))))

(declare-fun lt!583575 () Unit!43164)

(declare-fun lt!583573 () Unit!43164)

(assert (=> d!141763 (= lt!583575 lt!583573)))

(assert (=> d!141763 (= (getValueByKey!705 lt!583574 (_1!11322 (tuple2!22623 lt!583458 zeroValue!1387))) (Some!756 (_2!11322 (tuple2!22623 lt!583458 zeroValue!1387))))))

(assert (=> d!141763 (= lt!583573 (lemmaContainsTupThenGetReturnValue!351 lt!583574 (_1!11322 (tuple2!22623 lt!583458 zeroValue!1387)) (_2!11322 (tuple2!22623 lt!583458 zeroValue!1387))))))

(assert (=> d!141763 (= lt!583574 (insertStrictlySorted!480 (toList!10155 lt!583444) (_1!11322 (tuple2!22623 lt!583458 zeroValue!1387)) (_2!11322 (tuple2!22623 lt!583458 zeroValue!1387))))))

(assert (=> d!141763 (= (+!4479 lt!583444 (tuple2!22623 lt!583458 zeroValue!1387)) lt!583576)))

(declare-fun b!1303968 () Bool)

(declare-fun res!866024 () Bool)

(assert (=> b!1303968 (=> (not res!866024) (not e!743783))))

(assert (=> b!1303968 (= res!866024 (= (getValueByKey!705 (toList!10155 lt!583576) (_1!11322 (tuple2!22623 lt!583458 zeroValue!1387))) (Some!756 (_2!11322 (tuple2!22623 lt!583458 zeroValue!1387)))))))

(declare-fun b!1303969 () Bool)

(assert (=> b!1303969 (= e!743783 (contains!8294 (toList!10155 lt!583576) (tuple2!22623 lt!583458 zeroValue!1387)))))

(assert (= (and d!141763 res!866025) b!1303968))

(assert (= (and b!1303968 res!866024) b!1303969))

(declare-fun m!1194963 () Bool)

(assert (=> d!141763 m!1194963))

(declare-fun m!1194965 () Bool)

(assert (=> d!141763 m!1194965))

(declare-fun m!1194967 () Bool)

(assert (=> d!141763 m!1194967))

(declare-fun m!1194969 () Bool)

(assert (=> d!141763 m!1194969))

(declare-fun m!1194971 () Bool)

(assert (=> b!1303968 m!1194971))

(declare-fun m!1194973 () Bool)

(assert (=> b!1303969 m!1194973))

(assert (=> b!1303772 d!141763))

(declare-fun d!141765 () Bool)

(assert (=> d!141765 (= (apply!1022 lt!583456 lt!583442) (get!21167 (getValueByKey!705 (toList!10155 lt!583456) lt!583442)))))

(declare-fun bs!37137 () Bool)

(assert (= bs!37137 d!141765))

(declare-fun m!1194975 () Bool)

(assert (=> bs!37137 m!1194975))

(assert (=> bs!37137 m!1194975))

(declare-fun m!1194977 () Bool)

(assert (=> bs!37137 m!1194977))

(assert (=> b!1303772 d!141765))

(declare-fun d!141767 () Bool)

(declare-fun e!743784 () Bool)

(assert (=> d!141767 e!743784))

(declare-fun res!866027 () Bool)

(assert (=> d!141767 (=> (not res!866027) (not e!743784))))

(declare-fun lt!583580 () ListLongMap!20279)

(assert (=> d!141767 (= res!866027 (contains!8291 lt!583580 (_1!11322 (tuple2!22623 lt!583440 minValue!1387))))))

(declare-fun lt!583578 () List!29747)

(assert (=> d!141767 (= lt!583580 (ListLongMap!20280 lt!583578))))

(declare-fun lt!583579 () Unit!43164)

(declare-fun lt!583577 () Unit!43164)

(assert (=> d!141767 (= lt!583579 lt!583577)))

(assert (=> d!141767 (= (getValueByKey!705 lt!583578 (_1!11322 (tuple2!22623 lt!583440 minValue!1387))) (Some!756 (_2!11322 (tuple2!22623 lt!583440 minValue!1387))))))

(assert (=> d!141767 (= lt!583577 (lemmaContainsTupThenGetReturnValue!351 lt!583578 (_1!11322 (tuple2!22623 lt!583440 minValue!1387)) (_2!11322 (tuple2!22623 lt!583440 minValue!1387))))))

(assert (=> d!141767 (= lt!583578 (insertStrictlySorted!480 (toList!10155 lt!583453) (_1!11322 (tuple2!22623 lt!583440 minValue!1387)) (_2!11322 (tuple2!22623 lt!583440 minValue!1387))))))

(assert (=> d!141767 (= (+!4479 lt!583453 (tuple2!22623 lt!583440 minValue!1387)) lt!583580)))

(declare-fun b!1303970 () Bool)

(declare-fun res!866026 () Bool)

(assert (=> b!1303970 (=> (not res!866026) (not e!743784))))

(assert (=> b!1303970 (= res!866026 (= (getValueByKey!705 (toList!10155 lt!583580) (_1!11322 (tuple2!22623 lt!583440 minValue!1387))) (Some!756 (_2!11322 (tuple2!22623 lt!583440 minValue!1387)))))))

(declare-fun b!1303971 () Bool)

(assert (=> b!1303971 (= e!743784 (contains!8294 (toList!10155 lt!583580) (tuple2!22623 lt!583440 minValue!1387)))))

(assert (= (and d!141767 res!866027) b!1303970))

(assert (= (and b!1303970 res!866026) b!1303971))

(declare-fun m!1194979 () Bool)

(assert (=> d!141767 m!1194979))

(declare-fun m!1194981 () Bool)

(assert (=> d!141767 m!1194981))

(declare-fun m!1194983 () Bool)

(assert (=> d!141767 m!1194983))

(declare-fun m!1194985 () Bool)

(assert (=> d!141767 m!1194985))

(declare-fun m!1194987 () Bool)

(assert (=> b!1303970 m!1194987))

(declare-fun m!1194989 () Bool)

(assert (=> b!1303971 m!1194989))

(assert (=> b!1303772 d!141767))

(declare-fun d!141769 () Bool)

(assert (=> d!141769 (= (apply!1022 (+!4479 lt!583451 (tuple2!22623 lt!583454 minValue!1387)) lt!583446) (get!21167 (getValueByKey!705 (toList!10155 (+!4479 lt!583451 (tuple2!22623 lt!583454 minValue!1387))) lt!583446)))))

(declare-fun bs!37138 () Bool)

(assert (= bs!37138 d!141769))

(declare-fun m!1194991 () Bool)

(assert (=> bs!37138 m!1194991))

(assert (=> bs!37138 m!1194991))

(declare-fun m!1194993 () Bool)

(assert (=> bs!37138 m!1194993))

(assert (=> b!1303772 d!141769))

(declare-fun d!141771 () Bool)

(declare-fun e!743785 () Bool)

(assert (=> d!141771 e!743785))

(declare-fun res!866029 () Bool)

(assert (=> d!141771 (=> (not res!866029) (not e!743785))))

(declare-fun lt!583584 () ListLongMap!20279)

(assert (=> d!141771 (= res!866029 (contains!8291 lt!583584 (_1!11322 (tuple2!22623 lt!583454 minValue!1387))))))

(declare-fun lt!583582 () List!29747)

(assert (=> d!141771 (= lt!583584 (ListLongMap!20280 lt!583582))))

(declare-fun lt!583583 () Unit!43164)

(declare-fun lt!583581 () Unit!43164)

(assert (=> d!141771 (= lt!583583 lt!583581)))

(assert (=> d!141771 (= (getValueByKey!705 lt!583582 (_1!11322 (tuple2!22623 lt!583454 minValue!1387))) (Some!756 (_2!11322 (tuple2!22623 lt!583454 minValue!1387))))))

(assert (=> d!141771 (= lt!583581 (lemmaContainsTupThenGetReturnValue!351 lt!583582 (_1!11322 (tuple2!22623 lt!583454 minValue!1387)) (_2!11322 (tuple2!22623 lt!583454 minValue!1387))))))

(assert (=> d!141771 (= lt!583582 (insertStrictlySorted!480 (toList!10155 lt!583451) (_1!11322 (tuple2!22623 lt!583454 minValue!1387)) (_2!11322 (tuple2!22623 lt!583454 minValue!1387))))))

(assert (=> d!141771 (= (+!4479 lt!583451 (tuple2!22623 lt!583454 minValue!1387)) lt!583584)))

(declare-fun b!1303972 () Bool)

(declare-fun res!866028 () Bool)

(assert (=> b!1303972 (=> (not res!866028) (not e!743785))))

(assert (=> b!1303972 (= res!866028 (= (getValueByKey!705 (toList!10155 lt!583584) (_1!11322 (tuple2!22623 lt!583454 minValue!1387))) (Some!756 (_2!11322 (tuple2!22623 lt!583454 minValue!1387)))))))

(declare-fun b!1303973 () Bool)

(assert (=> b!1303973 (= e!743785 (contains!8294 (toList!10155 lt!583584) (tuple2!22623 lt!583454 minValue!1387)))))

(assert (= (and d!141771 res!866029) b!1303972))

(assert (= (and b!1303972 res!866028) b!1303973))

(declare-fun m!1194995 () Bool)

(assert (=> d!141771 m!1194995))

(declare-fun m!1194997 () Bool)

(assert (=> d!141771 m!1194997))

(declare-fun m!1194999 () Bool)

(assert (=> d!141771 m!1194999))

(declare-fun m!1195001 () Bool)

(assert (=> d!141771 m!1195001))

(declare-fun m!1195003 () Bool)

(assert (=> b!1303972 m!1195003))

(declare-fun m!1195005 () Bool)

(assert (=> b!1303973 m!1195005))

(assert (=> b!1303772 d!141771))

(declare-fun d!141773 () Bool)

(assert (=> d!141773 (= (apply!1022 (+!4479 lt!583456 (tuple2!22623 lt!583459 zeroValue!1387)) lt!583442) (get!21167 (getValueByKey!705 (toList!10155 (+!4479 lt!583456 (tuple2!22623 lt!583459 zeroValue!1387))) lt!583442)))))

(declare-fun bs!37139 () Bool)

(assert (= bs!37139 d!141773))

(declare-fun m!1195007 () Bool)

(assert (=> bs!37139 m!1195007))

(assert (=> bs!37139 m!1195007))

(declare-fun m!1195009 () Bool)

(assert (=> bs!37139 m!1195009))

(assert (=> b!1303772 d!141773))

(declare-fun d!141775 () Bool)

(assert (=> d!141775 (= (apply!1022 lt!583453 lt!583443) (get!21167 (getValueByKey!705 (toList!10155 lt!583453) lt!583443)))))

(declare-fun bs!37140 () Bool)

(assert (= bs!37140 d!141775))

(declare-fun m!1195011 () Bool)

(assert (=> bs!37140 m!1195011))

(assert (=> bs!37140 m!1195011))

(declare-fun m!1195013 () Bool)

(assert (=> bs!37140 m!1195013))

(assert (=> b!1303772 d!141775))

(declare-fun d!141777 () Bool)

(declare-fun e!743786 () Bool)

(assert (=> d!141777 e!743786))

(declare-fun res!866030 () Bool)

(assert (=> d!141777 (=> res!866030 e!743786)))

(declare-fun lt!583585 () Bool)

(assert (=> d!141777 (= res!866030 (not lt!583585))))

(declare-fun lt!583586 () Bool)

(assert (=> d!141777 (= lt!583585 lt!583586)))

(declare-fun lt!583588 () Unit!43164)

(declare-fun e!743787 () Unit!43164)

(assert (=> d!141777 (= lt!583588 e!743787)))

(declare-fun c!125181 () Bool)

(assert (=> d!141777 (= c!125181 lt!583586)))

(assert (=> d!141777 (= lt!583586 (containsKey!727 (toList!10155 (+!4479 lt!583444 (tuple2!22623 lt!583458 zeroValue!1387))) lt!583450))))

(assert (=> d!141777 (= (contains!8291 (+!4479 lt!583444 (tuple2!22623 lt!583458 zeroValue!1387)) lt!583450) lt!583585)))

(declare-fun b!1303974 () Bool)

(declare-fun lt!583587 () Unit!43164)

(assert (=> b!1303974 (= e!743787 lt!583587)))

(assert (=> b!1303974 (= lt!583587 (lemmaContainsKeyImpliesGetValueByKeyDefined!473 (toList!10155 (+!4479 lt!583444 (tuple2!22623 lt!583458 zeroValue!1387))) lt!583450))))

(assert (=> b!1303974 (isDefined!512 (getValueByKey!705 (toList!10155 (+!4479 lt!583444 (tuple2!22623 lt!583458 zeroValue!1387))) lt!583450))))

(declare-fun b!1303975 () Bool)

(declare-fun Unit!43177 () Unit!43164)

(assert (=> b!1303975 (= e!743787 Unit!43177)))

(declare-fun b!1303976 () Bool)

(assert (=> b!1303976 (= e!743786 (isDefined!512 (getValueByKey!705 (toList!10155 (+!4479 lt!583444 (tuple2!22623 lt!583458 zeroValue!1387))) lt!583450)))))

(assert (= (and d!141777 c!125181) b!1303974))

(assert (= (and d!141777 (not c!125181)) b!1303975))

(assert (= (and d!141777 (not res!866030)) b!1303976))

(declare-fun m!1195015 () Bool)

(assert (=> d!141777 m!1195015))

(declare-fun m!1195017 () Bool)

(assert (=> b!1303974 m!1195017))

(declare-fun m!1195019 () Bool)

(assert (=> b!1303974 m!1195019))

(assert (=> b!1303974 m!1195019))

(declare-fun m!1195021 () Bool)

(assert (=> b!1303974 m!1195021))

(assert (=> b!1303976 m!1195019))

(assert (=> b!1303976 m!1195019))

(assert (=> b!1303976 m!1195021))

(assert (=> b!1303772 d!141777))

(declare-fun d!141779 () Bool)

(assert (=> d!141779 (= (apply!1022 lt!583451 lt!583446) (get!21167 (getValueByKey!705 (toList!10155 lt!583451) lt!583446)))))

(declare-fun bs!37141 () Bool)

(assert (= bs!37141 d!141779))

(declare-fun m!1195023 () Bool)

(assert (=> bs!37141 m!1195023))

(assert (=> bs!37141 m!1195023))

(declare-fun m!1195025 () Bool)

(assert (=> bs!37141 m!1195025))

(assert (=> b!1303772 d!141779))

(declare-fun b!1303977 () Bool)

(declare-fun e!743788 () Bool)

(assert (=> b!1303977 (= e!743788 tp_is_empty!34911)))

(declare-fun condMapEmpty!53966 () Bool)

(declare-fun mapDefault!53966 () ValueCell!16557)

(assert (=> mapNonEmpty!53965 (= condMapEmpty!53966 (= mapRest!53965 ((as const (Array (_ BitVec 32) ValueCell!16557)) mapDefault!53966)))))

(declare-fun e!743789 () Bool)

(declare-fun mapRes!53966 () Bool)

(assert (=> mapNonEmpty!53965 (= tp!102973 (and e!743789 mapRes!53966))))

(declare-fun mapNonEmpty!53966 () Bool)

(declare-fun tp!102974 () Bool)

(assert (=> mapNonEmpty!53966 (= mapRes!53966 (and tp!102974 e!743788))))

(declare-fun mapKey!53966 () (_ BitVec 32))

(declare-fun mapValue!53966 () ValueCell!16557)

(declare-fun mapRest!53966 () (Array (_ BitVec 32) ValueCell!16557))

(assert (=> mapNonEmpty!53966 (= mapRest!53965 (store mapRest!53966 mapKey!53966 mapValue!53966))))

(declare-fun mapIsEmpty!53966 () Bool)

(assert (=> mapIsEmpty!53966 mapRes!53966))

(declare-fun b!1303978 () Bool)

(assert (=> b!1303978 (= e!743789 tp_is_empty!34911)))

(assert (= (and mapNonEmpty!53965 condMapEmpty!53966) mapIsEmpty!53966))

(assert (= (and mapNonEmpty!53965 (not condMapEmpty!53966)) mapNonEmpty!53966))

(assert (= (and mapNonEmpty!53966 ((_ is ValueCellFull!16557) mapValue!53966)) b!1303977))

(assert (= (and mapNonEmpty!53965 ((_ is ValueCellFull!16557) mapDefault!53966)) b!1303978))

(declare-fun m!1195027 () Bool)

(assert (=> mapNonEmpty!53966 m!1195027))

(declare-fun b_lambda!23291 () Bool)

(assert (= b_lambda!23287 (or (and start!110072 b_free!29271) b_lambda!23291)))

(declare-fun b_lambda!23293 () Bool)

(assert (= b_lambda!23289 (or (and start!110072 b_free!29271) b_lambda!23293)))

(check-sat (not d!141775) (not d!141731) (not b!1303848) (not b!1303968) (not b!1303919) (not d!141763) (not b!1303874) (not b!1303927) (not bm!64236) (not b!1303945) (not b!1303875) (not d!141695) (not d!141765) (not b!1303832) (not b!1303885) (not b!1303931) (not b!1303840) (not b_lambda!23281) (not b!1303956) (not b!1303877) (not d!141703) (not d!141673) (not d!141753) (not b_lambda!23291) (not b!1303943) (not b!1303926) (not d!141769) (not b!1303892) (not d!141723) (not d!141711) (not b!1303959) (not b!1303830) (not b!1303955) (not d!141767) (not b!1303932) (not b!1303960) (not b!1303923) (not d!141751) (not b!1303839) (not d!141687) (not b!1303899) (not b!1303948) (not b!1303902) (not b!1303835) (not b!1303904) (not b!1303974) (not d!141715) (not b!1303890) (not b!1303833) (not d!141725) (not b!1303933) (not d!141697) (not b!1303838) (not b!1303898) (not d!141759) (not b!1303883) b_and!47447 (not b!1303895) (not b_lambda!23285) (not b!1303903) (not b!1303971) (not b_next!29271) (not b!1303930) (not d!141741) (not d!141745) (not mapNonEmpty!53966) (not d!141719) tp_is_empty!34911 (not d!141679) (not b!1303897) (not bm!64234) (not d!141779) (not b!1303944) (not b!1303976) (not d!141771) (not b_lambda!23283) (not d!141707) (not d!141739) (not d!141677) (not d!141749) (not d!141747) (not b!1303905) (not b!1303863) (not d!141699) (not d!141737) (not b!1303872) (not bm!64235) (not d!141683) (not d!141675) (not b_lambda!23293) (not d!141733) (not b!1303921) (not b!1303970) (not d!141777) (not b!1303836) (not d!141773) (not d!141757) (not d!141721) (not b!1303929) (not b!1303973) (not b!1303908) (not b!1303972) (not d!141761) (not b!1303901) (not d!141755) (not d!141727) (not b!1303891) (not d!141729) (not b!1303950) (not b!1303969) (not b!1303958) (not d!141717) (not b!1303882) (not b!1303953))
(check-sat b_and!47447 (not b_next!29271))
