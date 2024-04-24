; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110276 () Bool)

(assert start!110276)

(declare-fun b_free!29251 () Bool)

(declare-fun b_next!29251 () Bool)

(assert (=> start!110276 (= b_free!29251 (not b_next!29251))))

(declare-fun tp!102904 () Bool)

(declare-fun b_and!47417 () Bool)

(assert (=> start!110276 (= tp!102904 b_and!47417)))

(declare-fun b!1304561 () Bool)

(declare-fun res!866104 () Bool)

(declare-fun e!744225 () Bool)

(assert (=> b!1304561 (=> (not res!866104) (not e!744225))))

(declare-datatypes ((array!86837 0))(
  ( (array!86838 (arr!41905 (Array (_ BitVec 32) (_ BitVec 64))) (size!42456 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86837)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86837 (_ BitVec 32)) Bool)

(assert (=> b!1304561 (= res!866104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1304562 () Bool)

(declare-fun res!866108 () Bool)

(assert (=> b!1304562 (=> (not res!866108) (not e!744225))))

(declare-datatypes ((V!51625 0))(
  ( (V!51626 (val!17520 Int)) )
))
(declare-fun minValue!1387 () V!51625)

(declare-fun zeroValue!1387 () V!51625)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((ValueCell!16547 0))(
  ( (ValueCellFull!16547 (v!20131 V!51625)) (EmptyCell!16547) )
))
(declare-datatypes ((array!86839 0))(
  ( (array!86840 (arr!41906 (Array (_ BitVec 32) ValueCell!16547)) (size!42457 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86839)

(declare-datatypes ((tuple2!22628 0))(
  ( (tuple2!22629 (_1!11325 (_ BitVec 64)) (_2!11325 V!51625)) )
))
(declare-datatypes ((List!29776 0))(
  ( (Nil!29773) (Cons!29772 (h!30990 tuple2!22628) (t!43362 List!29776)) )
))
(declare-datatypes ((ListLongMap!20293 0))(
  ( (ListLongMap!20294 (toList!10162 List!29776)) )
))
(declare-fun contains!8310 (ListLongMap!20293 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5173 (array!86837 array!86839 (_ BitVec 32) (_ BitVec 32) V!51625 V!51625 (_ BitVec 32) Int) ListLongMap!20293)

(assert (=> b!1304562 (= res!866108 (contains!8310 (getCurrentListMap!5173 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1304563 () Bool)

(declare-fun res!866109 () Bool)

(assert (=> b!1304563 (=> (not res!866109) (not e!744225))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1304563 (= res!866109 (not (validKeyInArray!0 (select (arr!41905 _keys!1741) from!2144))))))

(declare-fun b!1304564 () Bool)

(declare-fun e!744227 () Bool)

(assert (=> b!1304564 (= e!744225 (not e!744227))))

(declare-fun res!866110 () Bool)

(assert (=> b!1304564 (=> res!866110 e!744227)))

(assert (=> b!1304564 (= res!866110 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1304564 (not (contains!8310 (ListLongMap!20294 Nil!29773) k0!1205))))

(declare-datatypes ((Unit!43118 0))(
  ( (Unit!43119) )
))
(declare-fun lt!583670 () Unit!43118)

(declare-fun emptyContainsNothing!217 ((_ BitVec 64)) Unit!43118)

(assert (=> b!1304564 (= lt!583670 (emptyContainsNothing!217 k0!1205))))

(declare-fun mapNonEmpty!53929 () Bool)

(declare-fun mapRes!53929 () Bool)

(declare-fun tp!102903 () Bool)

(declare-fun e!744226 () Bool)

(assert (=> mapNonEmpty!53929 (= mapRes!53929 (and tp!102903 e!744226))))

(declare-fun mapKey!53929 () (_ BitVec 32))

(declare-fun mapValue!53929 () ValueCell!16547)

(declare-fun mapRest!53929 () (Array (_ BitVec 32) ValueCell!16547))

(assert (=> mapNonEmpty!53929 (= (arr!41906 _values!1445) (store mapRest!53929 mapKey!53929 mapValue!53929))))

(declare-fun b!1304565 () Bool)

(declare-fun res!866111 () Bool)

(assert (=> b!1304565 (=> (not res!866111) (not e!744225))))

(assert (=> b!1304565 (= res!866111 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42456 _keys!1741))))))

(declare-fun b!1304566 () Bool)

(declare-fun tp_is_empty!34891 () Bool)

(assert (=> b!1304566 (= e!744226 tp_is_empty!34891)))

(declare-fun b!1304567 () Bool)

(declare-fun res!866107 () Bool)

(assert (=> b!1304567 (=> (not res!866107) (not e!744225))))

(assert (=> b!1304567 (= res!866107 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42456 _keys!1741))))))

(declare-fun b!1304568 () Bool)

(declare-fun e!744229 () Bool)

(assert (=> b!1304568 (= e!744229 tp_is_empty!34891)))

(declare-fun b!1304569 () Bool)

(assert (=> b!1304569 (= e!744227 true)))

(declare-fun lt!583668 () ListLongMap!20293)

(declare-fun lt!583673 () tuple2!22628)

(declare-fun lt!583669 () Bool)

(declare-fun +!4523 (ListLongMap!20293 tuple2!22628) ListLongMap!20293)

(assert (=> b!1304569 (= lt!583669 (contains!8310 (+!4523 lt!583668 lt!583673) k0!1205))))

(declare-fun lt!583667 () ListLongMap!20293)

(assert (=> b!1304569 (not (contains!8310 (+!4523 lt!583667 lt!583673) k0!1205))))

(assert (=> b!1304569 (= lt!583673 (tuple2!22629 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))

(declare-fun lt!583672 () Unit!43118)

(declare-fun addStillNotContains!474 (ListLongMap!20293 (_ BitVec 64) V!51625 (_ BitVec 64)) Unit!43118)

(assert (=> b!1304569 (= lt!583672 (addStillNotContains!474 lt!583667 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1304569 (not (contains!8310 lt!583668 k0!1205))))

(assert (=> b!1304569 (= lt!583668 (+!4523 lt!583667 (tuple2!22629 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!583671 () Unit!43118)

(assert (=> b!1304569 (= lt!583671 (addStillNotContains!474 lt!583667 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6161 (array!86837 array!86839 (_ BitVec 32) (_ BitVec 32) V!51625 V!51625 (_ BitVec 32) Int) ListLongMap!20293)

(assert (=> b!1304569 (= lt!583667 (getCurrentListMapNoExtraKeys!6161 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1304570 () Bool)

(declare-fun res!866106 () Bool)

(assert (=> b!1304570 (=> (not res!866106) (not e!744225))))

(assert (=> b!1304570 (= res!866106 (and (= (size!42457 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42456 _keys!1741) (size!42457 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1304571 () Bool)

(declare-fun res!866103 () Bool)

(assert (=> b!1304571 (=> (not res!866103) (not e!744225))))

(declare-datatypes ((List!29777 0))(
  ( (Nil!29774) (Cons!29773 (h!30991 (_ BitVec 64)) (t!43363 List!29777)) )
))
(declare-fun arrayNoDuplicates!0 (array!86837 (_ BitVec 32) List!29777) Bool)

(assert (=> b!1304571 (= res!866103 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29774))))

(declare-fun b!1304572 () Bool)

(declare-fun e!744228 () Bool)

(assert (=> b!1304572 (= e!744228 (and e!744229 mapRes!53929))))

(declare-fun condMapEmpty!53929 () Bool)

(declare-fun mapDefault!53929 () ValueCell!16547)

(assert (=> b!1304572 (= condMapEmpty!53929 (= (arr!41906 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16547)) mapDefault!53929)))))

(declare-fun mapIsEmpty!53929 () Bool)

(assert (=> mapIsEmpty!53929 mapRes!53929))

(declare-fun res!866105 () Bool)

(assert (=> start!110276 (=> (not res!866105) (not e!744225))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110276 (= res!866105 (validMask!0 mask!2175))))

(assert (=> start!110276 e!744225))

(assert (=> start!110276 tp_is_empty!34891))

(assert (=> start!110276 true))

(declare-fun array_inv!31943 (array!86839) Bool)

(assert (=> start!110276 (and (array_inv!31943 _values!1445) e!744228)))

(declare-fun array_inv!31944 (array!86837) Bool)

(assert (=> start!110276 (array_inv!31944 _keys!1741)))

(assert (=> start!110276 tp!102904))

(assert (= (and start!110276 res!866105) b!1304570))

(assert (= (and b!1304570 res!866106) b!1304561))

(assert (= (and b!1304561 res!866104) b!1304571))

(assert (= (and b!1304571 res!866103) b!1304567))

(assert (= (and b!1304567 res!866107) b!1304562))

(assert (= (and b!1304562 res!866108) b!1304565))

(assert (= (and b!1304565 res!866111) b!1304563))

(assert (= (and b!1304563 res!866109) b!1304564))

(assert (= (and b!1304564 (not res!866110)) b!1304569))

(assert (= (and b!1304572 condMapEmpty!53929) mapIsEmpty!53929))

(assert (= (and b!1304572 (not condMapEmpty!53929)) mapNonEmpty!53929))

(get-info :version)

(assert (= (and mapNonEmpty!53929 ((_ is ValueCellFull!16547) mapValue!53929)) b!1304566))

(assert (= (and b!1304572 ((_ is ValueCellFull!16547) mapDefault!53929)) b!1304568))

(assert (= start!110276 b!1304572))

(declare-fun m!1195743 () Bool)

(assert (=> b!1304564 m!1195743))

(declare-fun m!1195745 () Bool)

(assert (=> b!1304564 m!1195745))

(declare-fun m!1195747 () Bool)

(assert (=> start!110276 m!1195747))

(declare-fun m!1195749 () Bool)

(assert (=> start!110276 m!1195749))

(declare-fun m!1195751 () Bool)

(assert (=> start!110276 m!1195751))

(declare-fun m!1195753 () Bool)

(assert (=> b!1304561 m!1195753))

(declare-fun m!1195755 () Bool)

(assert (=> b!1304563 m!1195755))

(assert (=> b!1304563 m!1195755))

(declare-fun m!1195757 () Bool)

(assert (=> b!1304563 m!1195757))

(declare-fun m!1195759 () Bool)

(assert (=> b!1304562 m!1195759))

(assert (=> b!1304562 m!1195759))

(declare-fun m!1195761 () Bool)

(assert (=> b!1304562 m!1195761))

(declare-fun m!1195763 () Bool)

(assert (=> mapNonEmpty!53929 m!1195763))

(declare-fun m!1195765 () Bool)

(assert (=> b!1304571 m!1195765))

(declare-fun m!1195767 () Bool)

(assert (=> b!1304569 m!1195767))

(declare-fun m!1195769 () Bool)

(assert (=> b!1304569 m!1195769))

(declare-fun m!1195771 () Bool)

(assert (=> b!1304569 m!1195771))

(declare-fun m!1195773 () Bool)

(assert (=> b!1304569 m!1195773))

(declare-fun m!1195775 () Bool)

(assert (=> b!1304569 m!1195775))

(declare-fun m!1195777 () Bool)

(assert (=> b!1304569 m!1195777))

(declare-fun m!1195779 () Bool)

(assert (=> b!1304569 m!1195779))

(assert (=> b!1304569 m!1195775))

(declare-fun m!1195781 () Bool)

(assert (=> b!1304569 m!1195781))

(assert (=> b!1304569 m!1195769))

(declare-fun m!1195783 () Bool)

(assert (=> b!1304569 m!1195783))

(check-sat (not b!1304569) (not b!1304564) b_and!47417 (not b_next!29251) (not b!1304563) tp_is_empty!34891 (not b!1304562) (not b!1304571) (not mapNonEmpty!53929) (not b!1304561) (not start!110276))
(check-sat b_and!47417 (not b_next!29251))
