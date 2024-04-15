; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109264 () Bool)

(assert start!109264)

(declare-fun b_free!28753 () Bool)

(declare-fun b_next!28753 () Bool)

(assert (=> start!109264 (= b_free!28753 (not b_next!28753))))

(declare-fun tp!101379 () Bool)

(declare-fun b_and!46825 () Bool)

(assert (=> start!109264 (= tp!101379 b_and!46825)))

(declare-fun b!1292692 () Bool)

(declare-fun res!858964 () Bool)

(declare-fun e!737805 () Bool)

(assert (=> b!1292692 (=> (not res!858964) (not e!737805))))

(declare-datatypes ((array!85703 0))(
  ( (array!85704 (arr!41353 (Array (_ BitVec 32) (_ BitVec 64))) (size!41905 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85703)

(declare-datatypes ((List!29411 0))(
  ( (Nil!29408) (Cons!29407 (h!30616 (_ BitVec 64)) (t!42967 List!29411)) )
))
(declare-fun arrayNoDuplicates!0 (array!85703 (_ BitVec 32) List!29411) Bool)

(assert (=> b!1292692 (= res!858964 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29408))))

(declare-fun b!1292693 () Bool)

(declare-fun res!858963 () Bool)

(assert (=> b!1292693 (=> (not res!858963) (not e!737805))))

(declare-datatypes ((V!50961 0))(
  ( (V!50962 (val!17271 Int)) )
))
(declare-fun minValue!1387 () V!50961)

(declare-fun zeroValue!1387 () V!50961)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16298 0))(
  ( (ValueCellFull!16298 (v!19873 V!50961)) (EmptyCell!16298) )
))
(declare-datatypes ((array!85705 0))(
  ( (array!85706 (arr!41354 (Array (_ BitVec 32) ValueCell!16298)) (size!41906 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85705)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22260 0))(
  ( (tuple2!22261 (_1!11141 (_ BitVec 64)) (_2!11141 V!50961)) )
))
(declare-datatypes ((List!29412 0))(
  ( (Nil!29409) (Cons!29408 (h!30617 tuple2!22260) (t!42968 List!29412)) )
))
(declare-datatypes ((ListLongMap!19917 0))(
  ( (ListLongMap!19918 (toList!9974 List!29412)) )
))
(declare-fun contains!8022 (ListLongMap!19917 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4916 (array!85703 array!85705 (_ BitVec 32) (_ BitVec 32) V!50961 V!50961 (_ BitVec 32) Int) ListLongMap!19917)

(assert (=> b!1292693 (= res!858963 (contains!8022 (getCurrentListMap!4916 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1292694 () Bool)

(declare-fun e!737807 () Bool)

(assert (=> b!1292694 (= e!737805 (not e!737807))))

(declare-fun res!858959 () Bool)

(assert (=> b!1292694 (=> res!858959 e!737807)))

(assert (=> b!1292694 (= res!858959 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1292694 (not (contains!8022 (ListLongMap!19918 Nil!29409) k0!1205))))

(declare-datatypes ((Unit!42628 0))(
  ( (Unit!42629) )
))
(declare-fun lt!579202 () Unit!42628)

(declare-fun emptyContainsNothing!111 ((_ BitVec 64)) Unit!42628)

(assert (=> b!1292694 (= lt!579202 (emptyContainsNothing!111 k0!1205))))

(declare-fun res!858961 () Bool)

(assert (=> start!109264 (=> (not res!858961) (not e!737805))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109264 (= res!858961 (validMask!0 mask!2175))))

(assert (=> start!109264 e!737805))

(declare-fun tp_is_empty!34393 () Bool)

(assert (=> start!109264 tp_is_empty!34393))

(assert (=> start!109264 true))

(declare-fun e!737804 () Bool)

(declare-fun array_inv!31491 (array!85705) Bool)

(assert (=> start!109264 (and (array_inv!31491 _values!1445) e!737804)))

(declare-fun array_inv!31492 (array!85703) Bool)

(assert (=> start!109264 (array_inv!31492 _keys!1741)))

(assert (=> start!109264 tp!101379))

(declare-fun b!1292695 () Bool)

(declare-fun res!858965 () Bool)

(assert (=> b!1292695 (=> (not res!858965) (not e!737805))))

(assert (=> b!1292695 (= res!858965 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41905 _keys!1741))))))

(declare-fun b!1292696 () Bool)

(declare-fun res!858962 () Bool)

(assert (=> b!1292696 (=> (not res!858962) (not e!737805))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85703 (_ BitVec 32)) Bool)

(assert (=> b!1292696 (= res!858962 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1292697 () Bool)

(declare-fun res!858960 () Bool)

(assert (=> b!1292697 (=> (not res!858960) (not e!737805))))

(assert (=> b!1292697 (= res!858960 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41905 _keys!1741))))))

(declare-fun b!1292698 () Bool)

(declare-fun e!737806 () Bool)

(assert (=> b!1292698 (= e!737806 tp_is_empty!34393)))

(declare-fun mapIsEmpty!53150 () Bool)

(declare-fun mapRes!53150 () Bool)

(assert (=> mapIsEmpty!53150 mapRes!53150))

(declare-fun b!1292699 () Bool)

(declare-fun res!858966 () Bool)

(assert (=> b!1292699 (=> (not res!858966) (not e!737805))))

(assert (=> b!1292699 (= res!858966 (and (= (size!41906 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41905 _keys!1741) (size!41906 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1292700 () Bool)

(declare-fun e!737803 () Bool)

(assert (=> b!1292700 (= e!737804 (and e!737803 mapRes!53150))))

(declare-fun condMapEmpty!53150 () Bool)

(declare-fun mapDefault!53150 () ValueCell!16298)

(assert (=> b!1292700 (= condMapEmpty!53150 (= (arr!41354 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16298)) mapDefault!53150)))))

(declare-fun b!1292701 () Bool)

(declare-fun res!858958 () Bool)

(assert (=> b!1292701 (=> (not res!858958) (not e!737805))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1292701 (= res!858958 (not (validKeyInArray!0 (select (arr!41353 _keys!1741) from!2144))))))

(declare-fun b!1292702 () Bool)

(assert (=> b!1292702 (= e!737803 tp_is_empty!34393)))

(declare-fun b!1292703 () Bool)

(assert (=> b!1292703 (= e!737807 true)))

(declare-fun lt!579200 () ListLongMap!19917)

(declare-fun +!4424 (ListLongMap!19917 tuple2!22260) ListLongMap!19917)

(assert (=> b!1292703 (not (contains!8022 (+!4424 lt!579200 (tuple2!22261 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!579201 () Unit!42628)

(declare-fun addStillNotContains!401 (ListLongMap!19917 (_ BitVec 64) V!50961 (_ BitVec 64)) Unit!42628)

(assert (=> b!1292703 (= lt!579201 (addStillNotContains!401 lt!579200 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6056 (array!85703 array!85705 (_ BitVec 32) (_ BitVec 32) V!50961 V!50961 (_ BitVec 32) Int) ListLongMap!19917)

(assert (=> b!1292703 (= lt!579200 (getCurrentListMapNoExtraKeys!6056 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun mapNonEmpty!53150 () Bool)

(declare-fun tp!101378 () Bool)

(assert (=> mapNonEmpty!53150 (= mapRes!53150 (and tp!101378 e!737806))))

(declare-fun mapValue!53150 () ValueCell!16298)

(declare-fun mapKey!53150 () (_ BitVec 32))

(declare-fun mapRest!53150 () (Array (_ BitVec 32) ValueCell!16298))

(assert (=> mapNonEmpty!53150 (= (arr!41354 _values!1445) (store mapRest!53150 mapKey!53150 mapValue!53150))))

(assert (= (and start!109264 res!858961) b!1292699))

(assert (= (and b!1292699 res!858966) b!1292696))

(assert (= (and b!1292696 res!858962) b!1292692))

(assert (= (and b!1292692 res!858964) b!1292695))

(assert (= (and b!1292695 res!858965) b!1292693))

(assert (= (and b!1292693 res!858963) b!1292697))

(assert (= (and b!1292697 res!858960) b!1292701))

(assert (= (and b!1292701 res!858958) b!1292694))

(assert (= (and b!1292694 (not res!858959)) b!1292703))

(assert (= (and b!1292700 condMapEmpty!53150) mapIsEmpty!53150))

(assert (= (and b!1292700 (not condMapEmpty!53150)) mapNonEmpty!53150))

(get-info :version)

(assert (= (and mapNonEmpty!53150 ((_ is ValueCellFull!16298) mapValue!53150)) b!1292698))

(assert (= (and b!1292700 ((_ is ValueCellFull!16298) mapDefault!53150)) b!1292702))

(assert (= start!109264 b!1292700))

(declare-fun m!1184727 () Bool)

(assert (=> b!1292694 m!1184727))

(declare-fun m!1184729 () Bool)

(assert (=> b!1292694 m!1184729))

(declare-fun m!1184731 () Bool)

(assert (=> mapNonEmpty!53150 m!1184731))

(declare-fun m!1184733 () Bool)

(assert (=> b!1292692 m!1184733))

(declare-fun m!1184735 () Bool)

(assert (=> b!1292693 m!1184735))

(assert (=> b!1292693 m!1184735))

(declare-fun m!1184737 () Bool)

(assert (=> b!1292693 m!1184737))

(declare-fun m!1184739 () Bool)

(assert (=> b!1292696 m!1184739))

(declare-fun m!1184741 () Bool)

(assert (=> b!1292701 m!1184741))

(assert (=> b!1292701 m!1184741))

(declare-fun m!1184743 () Bool)

(assert (=> b!1292701 m!1184743))

(declare-fun m!1184745 () Bool)

(assert (=> b!1292703 m!1184745))

(assert (=> b!1292703 m!1184745))

(declare-fun m!1184747 () Bool)

(assert (=> b!1292703 m!1184747))

(declare-fun m!1184749 () Bool)

(assert (=> b!1292703 m!1184749))

(declare-fun m!1184751 () Bool)

(assert (=> b!1292703 m!1184751))

(declare-fun m!1184753 () Bool)

(assert (=> start!109264 m!1184753))

(declare-fun m!1184755 () Bool)

(assert (=> start!109264 m!1184755))

(declare-fun m!1184757 () Bool)

(assert (=> start!109264 m!1184757))

(check-sat (not b!1292694) (not b!1292696) b_and!46825 (not b!1292703) (not b!1292692) (not start!109264) (not b!1292701) tp_is_empty!34393 (not b_next!28753) (not mapNonEmpty!53150) (not b!1292693))
(check-sat b_and!46825 (not b_next!28753))
