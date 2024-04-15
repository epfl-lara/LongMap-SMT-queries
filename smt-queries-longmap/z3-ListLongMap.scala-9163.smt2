; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110052 () Bool)

(assert start!110052)

(declare-fun b_free!29251 () Bool)

(declare-fun b_next!29251 () Bool)

(assert (=> start!110052 (= b_free!29251 (not b_next!29251))))

(declare-fun tp!102905 () Bool)

(declare-fun b_and!47397 () Bool)

(assert (=> start!110052 (= tp!102905 b_and!47397)))

(declare-fun b!1303192 () Bool)

(declare-fun e!743352 () Bool)

(declare-fun tp_is_empty!34891 () Bool)

(assert (=> b!1303192 (= e!743352 tp_is_empty!34891)))

(declare-fun res!865560 () Bool)

(declare-fun e!743353 () Bool)

(assert (=> start!110052 (=> (not res!865560) (not e!743353))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110052 (= res!865560 (validMask!0 mask!2175))))

(assert (=> start!110052 e!743353))

(assert (=> start!110052 tp_is_empty!34891))

(assert (=> start!110052 true))

(declare-datatypes ((V!51625 0))(
  ( (V!51626 (val!17520 Int)) )
))
(declare-datatypes ((ValueCell!16547 0))(
  ( (ValueCellFull!16547 (v!20135 V!51625)) (EmptyCell!16547) )
))
(declare-datatypes ((array!86699 0))(
  ( (array!86700 (arr!41841 (Array (_ BitVec 32) ValueCell!16547)) (size!42393 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86699)

(declare-fun e!743348 () Bool)

(declare-fun array_inv!31827 (array!86699) Bool)

(assert (=> start!110052 (and (array_inv!31827 _values!1445) e!743348)))

(declare-datatypes ((array!86701 0))(
  ( (array!86702 (arr!41842 (Array (_ BitVec 32) (_ BitVec 64))) (size!42394 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86701)

(declare-fun array_inv!31828 (array!86701) Bool)

(assert (=> start!110052 (array_inv!31828 _keys!1741)))

(assert (=> start!110052 tp!102905))

(declare-fun b!1303193 () Bool)

(declare-fun e!743350 () Bool)

(assert (=> b!1303193 (= e!743353 (not e!743350))))

(declare-fun res!865556 () Bool)

(assert (=> b!1303193 (=> res!865556 e!743350)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1303193 (= res!865556 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22666 0))(
  ( (tuple2!22667 (_1!11344 (_ BitVec 64)) (_2!11344 V!51625)) )
))
(declare-datatypes ((List!29777 0))(
  ( (Nil!29774) (Cons!29773 (h!30982 tuple2!22666) (t!43363 List!29777)) )
))
(declare-datatypes ((ListLongMap!20323 0))(
  ( (ListLongMap!20324 (toList!10177 List!29777)) )
))
(declare-fun contains!8241 (ListLongMap!20323 (_ BitVec 64)) Bool)

(assert (=> b!1303193 (not (contains!8241 (ListLongMap!20324 Nil!29774) k0!1205))))

(declare-datatypes ((Unit!42993 0))(
  ( (Unit!42994) )
))
(declare-fun lt!583010 () Unit!42993)

(declare-fun emptyContainsNothing!208 ((_ BitVec 64)) Unit!42993)

(assert (=> b!1303193 (= lt!583010 (emptyContainsNothing!208 k0!1205))))

(declare-fun b!1303194 () Bool)

(declare-fun res!865564 () Bool)

(assert (=> b!1303194 (=> (not res!865564) (not e!743353))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1303194 (= res!865564 (not (validKeyInArray!0 (select (arr!41842 _keys!1741) from!2144))))))

(declare-fun b!1303195 () Bool)

(declare-fun res!865561 () Bool)

(assert (=> b!1303195 (=> (not res!865561) (not e!743353))))

(assert (=> b!1303195 (= res!865561 (and (= (size!42393 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42394 _keys!1741) (size!42393 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1303196 () Bool)

(declare-fun res!865559 () Bool)

(assert (=> b!1303196 (=> (not res!865559) (not e!743353))))

(declare-datatypes ((List!29778 0))(
  ( (Nil!29775) (Cons!29774 (h!30983 (_ BitVec 64)) (t!43364 List!29778)) )
))
(declare-fun arrayNoDuplicates!0 (array!86701 (_ BitVec 32) List!29778) Bool)

(assert (=> b!1303196 (= res!865559 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29775))))

(declare-fun b!1303197 () Bool)

(declare-fun mapRes!53929 () Bool)

(assert (=> b!1303197 (= e!743348 (and e!743352 mapRes!53929))))

(declare-fun condMapEmpty!53929 () Bool)

(declare-fun mapDefault!53929 () ValueCell!16547)

(assert (=> b!1303197 (= condMapEmpty!53929 (= (arr!41841 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16547)) mapDefault!53929)))))

(declare-fun mapNonEmpty!53929 () Bool)

(declare-fun tp!102904 () Bool)

(declare-fun e!743349 () Bool)

(assert (=> mapNonEmpty!53929 (= mapRes!53929 (and tp!102904 e!743349))))

(declare-fun mapValue!53929 () ValueCell!16547)

(declare-fun mapRest!53929 () (Array (_ BitVec 32) ValueCell!16547))

(declare-fun mapKey!53929 () (_ BitVec 32))

(assert (=> mapNonEmpty!53929 (= (arr!41841 _values!1445) (store mapRest!53929 mapKey!53929 mapValue!53929))))

(declare-fun b!1303198 () Bool)

(declare-fun res!865558 () Bool)

(assert (=> b!1303198 (=> (not res!865558) (not e!743353))))

(declare-fun minValue!1387 () V!51625)

(declare-fun zeroValue!1387 () V!51625)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!5081 (array!86701 array!86699 (_ BitVec 32) (_ BitVec 32) V!51625 V!51625 (_ BitVec 32) Int) ListLongMap!20323)

(assert (=> b!1303198 (= res!865558 (contains!8241 (getCurrentListMap!5081 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1303199 () Bool)

(declare-fun res!865563 () Bool)

(assert (=> b!1303199 (=> (not res!865563) (not e!743353))))

(assert (=> b!1303199 (= res!865563 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42394 _keys!1741))))))

(declare-fun b!1303200 () Bool)

(declare-fun res!865562 () Bool)

(assert (=> b!1303200 (=> (not res!865562) (not e!743353))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86701 (_ BitVec 32)) Bool)

(assert (=> b!1303200 (= res!865562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1303201 () Bool)

(declare-fun res!865557 () Bool)

(assert (=> b!1303201 (=> (not res!865557) (not e!743353))))

(assert (=> b!1303201 (= res!865557 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42394 _keys!1741))))))

(declare-fun b!1303202 () Bool)

(assert (=> b!1303202 (= e!743350 true)))

(declare-fun lt!583011 () ListLongMap!20323)

(declare-fun lt!583009 () tuple2!22666)

(declare-fun lt!583008 () Bool)

(declare-fun +!4510 (ListLongMap!20323 tuple2!22666) ListLongMap!20323)

(assert (=> b!1303202 (= lt!583008 (contains!8241 (+!4510 lt!583011 lt!583009) k0!1205))))

(declare-fun lt!583005 () ListLongMap!20323)

(assert (=> b!1303202 (not (contains!8241 (+!4510 lt!583005 lt!583009) k0!1205))))

(assert (=> b!1303202 (= lt!583009 (tuple2!22667 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))

(declare-fun lt!583006 () Unit!42993)

(declare-fun addStillNotContains!463 (ListLongMap!20323 (_ BitVec 64) V!51625 (_ BitVec 64)) Unit!42993)

(assert (=> b!1303202 (= lt!583006 (addStillNotContains!463 lt!583005 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1303202 (not (contains!8241 lt!583011 k0!1205))))

(assert (=> b!1303202 (= lt!583011 (+!4510 lt!583005 (tuple2!22667 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!583007 () Unit!42993)

(assert (=> b!1303202 (= lt!583007 (addStillNotContains!463 lt!583005 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6142 (array!86701 array!86699 (_ BitVec 32) (_ BitVec 32) V!51625 V!51625 (_ BitVec 32) Int) ListLongMap!20323)

(assert (=> b!1303202 (= lt!583005 (getCurrentListMapNoExtraKeys!6142 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1303203 () Bool)

(assert (=> b!1303203 (= e!743349 tp_is_empty!34891)))

(declare-fun mapIsEmpty!53929 () Bool)

(assert (=> mapIsEmpty!53929 mapRes!53929))

(assert (= (and start!110052 res!865560) b!1303195))

(assert (= (and b!1303195 res!865561) b!1303200))

(assert (= (and b!1303200 res!865562) b!1303196))

(assert (= (and b!1303196 res!865559) b!1303201))

(assert (= (and b!1303201 res!865557) b!1303198))

(assert (= (and b!1303198 res!865558) b!1303199))

(assert (= (and b!1303199 res!865563) b!1303194))

(assert (= (and b!1303194 res!865564) b!1303193))

(assert (= (and b!1303193 (not res!865556)) b!1303202))

(assert (= (and b!1303197 condMapEmpty!53929) mapIsEmpty!53929))

(assert (= (and b!1303197 (not condMapEmpty!53929)) mapNonEmpty!53929))

(get-info :version)

(assert (= (and mapNonEmpty!53929 ((_ is ValueCellFull!16547) mapValue!53929)) b!1303203))

(assert (= (and b!1303197 ((_ is ValueCellFull!16547) mapDefault!53929)) b!1303192))

(assert (= start!110052 b!1303197))

(declare-fun m!1193629 () Bool)

(assert (=> start!110052 m!1193629))

(declare-fun m!1193631 () Bool)

(assert (=> start!110052 m!1193631))

(declare-fun m!1193633 () Bool)

(assert (=> start!110052 m!1193633))

(declare-fun m!1193635 () Bool)

(assert (=> b!1303194 m!1193635))

(assert (=> b!1303194 m!1193635))

(declare-fun m!1193637 () Bool)

(assert (=> b!1303194 m!1193637))

(declare-fun m!1193639 () Bool)

(assert (=> b!1303200 m!1193639))

(declare-fun m!1193641 () Bool)

(assert (=> b!1303202 m!1193641))

(declare-fun m!1193643 () Bool)

(assert (=> b!1303202 m!1193643))

(declare-fun m!1193645 () Bool)

(assert (=> b!1303202 m!1193645))

(declare-fun m!1193647 () Bool)

(assert (=> b!1303202 m!1193647))

(declare-fun m!1193649 () Bool)

(assert (=> b!1303202 m!1193649))

(assert (=> b!1303202 m!1193645))

(declare-fun m!1193651 () Bool)

(assert (=> b!1303202 m!1193651))

(declare-fun m!1193653 () Bool)

(assert (=> b!1303202 m!1193653))

(assert (=> b!1303202 m!1193641))

(declare-fun m!1193655 () Bool)

(assert (=> b!1303202 m!1193655))

(declare-fun m!1193657 () Bool)

(assert (=> b!1303202 m!1193657))

(declare-fun m!1193659 () Bool)

(assert (=> mapNonEmpty!53929 m!1193659))

(declare-fun m!1193661 () Bool)

(assert (=> b!1303193 m!1193661))

(declare-fun m!1193663 () Bool)

(assert (=> b!1303193 m!1193663))

(declare-fun m!1193665 () Bool)

(assert (=> b!1303196 m!1193665))

(declare-fun m!1193667 () Bool)

(assert (=> b!1303198 m!1193667))

(assert (=> b!1303198 m!1193667))

(declare-fun m!1193669 () Bool)

(assert (=> b!1303198 m!1193669))

(check-sat (not b!1303194) (not mapNonEmpty!53929) (not b!1303200) tp_is_empty!34891 (not b!1303196) b_and!47397 (not b_next!29251) (not start!110052) (not b!1303193) (not b!1303198) (not b!1303202))
(check-sat b_and!47397 (not b_next!29251))
