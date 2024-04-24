; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109356 () Bool)

(assert start!109356)

(declare-fun b_free!28621 () Bool)

(declare-fun b_next!28621 () Bool)

(assert (=> start!109356 (= b_free!28621 (not b_next!28621))))

(declare-fun tp!100982 () Bool)

(declare-fun b_and!46713 () Bool)

(assert (=> start!109356 (= tp!100982 b_and!46713)))

(declare-fun b!1291766 () Bool)

(declare-fun res!857810 () Bool)

(declare-fun e!737575 () Bool)

(assert (=> b!1291766 (=> (not res!857810) (not e!737575))))

(declare-datatypes ((array!85599 0))(
  ( (array!85600 (arr!41296 (Array (_ BitVec 32) (_ BitVec 64))) (size!41847 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85599)

(declare-datatypes ((List!29301 0))(
  ( (Nil!29298) (Cons!29297 (h!30515 (_ BitVec 64)) (t!42857 List!29301)) )
))
(declare-fun arrayNoDuplicates!0 (array!85599 (_ BitVec 32) List!29301) Bool)

(assert (=> b!1291766 (= res!857810 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29298))))

(declare-fun b!1291767 () Bool)

(declare-fun e!737577 () Bool)

(assert (=> b!1291767 (= e!737575 (not e!737577))))

(declare-fun res!857807 () Bool)

(assert (=> b!1291767 (=> res!857807 e!737577)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1291767 (= res!857807 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((V!50785 0))(
  ( (V!50786 (val!17205 Int)) )
))
(declare-datatypes ((tuple2!22124 0))(
  ( (tuple2!22125 (_1!11073 (_ BitVec 64)) (_2!11073 V!50785)) )
))
(declare-datatypes ((List!29302 0))(
  ( (Nil!29299) (Cons!29298 (h!30516 tuple2!22124) (t!42858 List!29302)) )
))
(declare-datatypes ((ListLongMap!19789 0))(
  ( (ListLongMap!19790 (toList!9910 List!29302)) )
))
(declare-fun contains!8041 (ListLongMap!19789 (_ BitVec 64)) Bool)

(assert (=> b!1291767 (not (contains!8041 (ListLongMap!19790 Nil!29299) k0!1205))))

(declare-datatypes ((Unit!42667 0))(
  ( (Unit!42668) )
))
(declare-fun lt!579119 () Unit!42667)

(declare-fun emptyContainsNothing!84 ((_ BitVec 64)) Unit!42667)

(assert (=> b!1291767 (= lt!579119 (emptyContainsNothing!84 k0!1205))))

(declare-fun res!857806 () Bool)

(assert (=> start!109356 (=> (not res!857806) (not e!737575))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109356 (= res!857806 (validMask!0 mask!2175))))

(assert (=> start!109356 e!737575))

(declare-fun tp_is_empty!34261 () Bool)

(assert (=> start!109356 tp_is_empty!34261))

(assert (=> start!109356 true))

(declare-datatypes ((ValueCell!16232 0))(
  ( (ValueCellFull!16232 (v!19803 V!50785)) (EmptyCell!16232) )
))
(declare-datatypes ((array!85601 0))(
  ( (array!85602 (arr!41297 (Array (_ BitVec 32) ValueCell!16232)) (size!41848 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85601)

(declare-fun e!737574 () Bool)

(declare-fun array_inv!31521 (array!85601) Bool)

(assert (=> start!109356 (and (array_inv!31521 _values!1445) e!737574)))

(declare-fun array_inv!31522 (array!85599) Bool)

(assert (=> start!109356 (array_inv!31522 _keys!1741)))

(assert (=> start!109356 tp!100982))

(declare-fun b!1291768 () Bool)

(declare-fun res!857812 () Bool)

(assert (=> b!1291768 (=> (not res!857812) (not e!737575))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1291768 (= res!857812 (not (validKeyInArray!0 (select (arr!41296 _keys!1741) from!2144))))))

(declare-fun b!1291769 () Bool)

(assert (=> b!1291769 (= e!737577 true)))

(declare-fun lt!579118 () ListLongMap!19789)

(declare-fun lt!579114 () tuple2!22124)

(declare-fun lt!579120 () Bool)

(declare-fun +!4409 (ListLongMap!19789 tuple2!22124) ListLongMap!19789)

(assert (=> b!1291769 (= lt!579120 (contains!8041 (+!4409 lt!579118 lt!579114) k0!1205))))

(declare-fun lt!579117 () ListLongMap!19789)

(assert (=> b!1291769 (not (contains!8041 (+!4409 lt!579117 lt!579114) k0!1205))))

(declare-fun minValue!1387 () V!50785)

(assert (=> b!1291769 (= lt!579114 (tuple2!22125 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))

(declare-fun lt!579116 () Unit!42667)

(declare-fun addStillNotContains!385 (ListLongMap!19789 (_ BitVec 64) V!50785 (_ BitVec 64)) Unit!42667)

(assert (=> b!1291769 (= lt!579116 (addStillNotContains!385 lt!579117 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1291769 (not (contains!8041 lt!579118 k0!1205))))

(declare-fun zeroValue!1387 () V!50785)

(assert (=> b!1291769 (= lt!579118 (+!4409 lt!579117 (tuple2!22125 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!579115 () Unit!42667)

(assert (=> b!1291769 (= lt!579115 (addStillNotContains!385 lt!579117 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6047 (array!85599 array!85601 (_ BitVec 32) (_ BitVec 32) V!50785 V!50785 (_ BitVec 32) Int) ListLongMap!19789)

(assert (=> b!1291769 (= lt!579117 (getCurrentListMapNoExtraKeys!6047 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1291770 () Bool)

(declare-fun res!857808 () Bool)

(assert (=> b!1291770 (=> (not res!857808) (not e!737575))))

(assert (=> b!1291770 (= res!857808 (and (= (size!41848 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41847 _keys!1741) (size!41848 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1291771 () Bool)

(declare-fun e!737576 () Bool)

(assert (=> b!1291771 (= e!737576 tp_is_empty!34261)))

(declare-fun b!1291772 () Bool)

(declare-fun e!737572 () Bool)

(declare-fun mapRes!52952 () Bool)

(assert (=> b!1291772 (= e!737574 (and e!737572 mapRes!52952))))

(declare-fun condMapEmpty!52952 () Bool)

(declare-fun mapDefault!52952 () ValueCell!16232)

(assert (=> b!1291772 (= condMapEmpty!52952 (= (arr!41297 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16232)) mapDefault!52952)))))

(declare-fun mapNonEmpty!52952 () Bool)

(declare-fun tp!100981 () Bool)

(assert (=> mapNonEmpty!52952 (= mapRes!52952 (and tp!100981 e!737576))))

(declare-fun mapKey!52952 () (_ BitVec 32))

(declare-fun mapRest!52952 () (Array (_ BitVec 32) ValueCell!16232))

(declare-fun mapValue!52952 () ValueCell!16232)

(assert (=> mapNonEmpty!52952 (= (arr!41297 _values!1445) (store mapRest!52952 mapKey!52952 mapValue!52952))))

(declare-fun b!1291773 () Bool)

(declare-fun res!857804 () Bool)

(assert (=> b!1291773 (=> (not res!857804) (not e!737575))))

(assert (=> b!1291773 (= res!857804 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41847 _keys!1741))))))

(declare-fun mapIsEmpty!52952 () Bool)

(assert (=> mapIsEmpty!52952 mapRes!52952))

(declare-fun b!1291774 () Bool)

(assert (=> b!1291774 (= e!737572 tp_is_empty!34261)))

(declare-fun b!1291775 () Bool)

(declare-fun res!857805 () Bool)

(assert (=> b!1291775 (=> (not res!857805) (not e!737575))))

(declare-fun getCurrentListMap!4951 (array!85599 array!85601 (_ BitVec 32) (_ BitVec 32) V!50785 V!50785 (_ BitVec 32) Int) ListLongMap!19789)

(assert (=> b!1291775 (= res!857805 (contains!8041 (getCurrentListMap!4951 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1291776 () Bool)

(declare-fun res!857809 () Bool)

(assert (=> b!1291776 (=> (not res!857809) (not e!737575))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85599 (_ BitVec 32)) Bool)

(assert (=> b!1291776 (= res!857809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1291777 () Bool)

(declare-fun res!857811 () Bool)

(assert (=> b!1291777 (=> (not res!857811) (not e!737575))))

(assert (=> b!1291777 (= res!857811 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41847 _keys!1741))))))

(assert (= (and start!109356 res!857806) b!1291770))

(assert (= (and b!1291770 res!857808) b!1291776))

(assert (= (and b!1291776 res!857809) b!1291766))

(assert (= (and b!1291766 res!857810) b!1291773))

(assert (= (and b!1291773 res!857804) b!1291775))

(assert (= (and b!1291775 res!857805) b!1291777))

(assert (= (and b!1291777 res!857811) b!1291768))

(assert (= (and b!1291768 res!857812) b!1291767))

(assert (= (and b!1291767 (not res!857807)) b!1291769))

(assert (= (and b!1291772 condMapEmpty!52952) mapIsEmpty!52952))

(assert (= (and b!1291772 (not condMapEmpty!52952)) mapNonEmpty!52952))

(get-info :version)

(assert (= (and mapNonEmpty!52952 ((_ is ValueCellFull!16232) mapValue!52952)) b!1291771))

(assert (= (and b!1291772 ((_ is ValueCellFull!16232) mapDefault!52952)) b!1291774))

(assert (= start!109356 b!1291772))

(declare-fun m!1184667 () Bool)

(assert (=> b!1291768 m!1184667))

(assert (=> b!1291768 m!1184667))

(declare-fun m!1184669 () Bool)

(assert (=> b!1291768 m!1184669))

(declare-fun m!1184671 () Bool)

(assert (=> b!1291766 m!1184671))

(declare-fun m!1184673 () Bool)

(assert (=> mapNonEmpty!52952 m!1184673))

(declare-fun m!1184675 () Bool)

(assert (=> start!109356 m!1184675))

(declare-fun m!1184677 () Bool)

(assert (=> start!109356 m!1184677))

(declare-fun m!1184679 () Bool)

(assert (=> start!109356 m!1184679))

(declare-fun m!1184681 () Bool)

(assert (=> b!1291776 m!1184681))

(declare-fun m!1184683 () Bool)

(assert (=> b!1291769 m!1184683))

(assert (=> b!1291769 m!1184683))

(declare-fun m!1184685 () Bool)

(assert (=> b!1291769 m!1184685))

(declare-fun m!1184687 () Bool)

(assert (=> b!1291769 m!1184687))

(declare-fun m!1184689 () Bool)

(assert (=> b!1291769 m!1184689))

(declare-fun m!1184691 () Bool)

(assert (=> b!1291769 m!1184691))

(declare-fun m!1184693 () Bool)

(assert (=> b!1291769 m!1184693))

(declare-fun m!1184695 () Bool)

(assert (=> b!1291769 m!1184695))

(assert (=> b!1291769 m!1184691))

(declare-fun m!1184697 () Bool)

(assert (=> b!1291769 m!1184697))

(declare-fun m!1184699 () Bool)

(assert (=> b!1291769 m!1184699))

(declare-fun m!1184701 () Bool)

(assert (=> b!1291775 m!1184701))

(assert (=> b!1291775 m!1184701))

(declare-fun m!1184703 () Bool)

(assert (=> b!1291775 m!1184703))

(declare-fun m!1184705 () Bool)

(assert (=> b!1291767 m!1184705))

(declare-fun m!1184707 () Bool)

(assert (=> b!1291767 m!1184707))

(check-sat (not b!1291767) (not mapNonEmpty!52952) (not b!1291769) (not b!1291775) tp_is_empty!34261 (not start!109356) (not b!1291768) (not b_next!28621) (not b!1291776) (not b!1291766) b_and!46713)
(check-sat b_and!46713 (not b_next!28621))
