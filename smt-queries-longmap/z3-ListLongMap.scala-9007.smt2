; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108802 () Bool)

(assert start!108802)

(declare-fun b_free!28315 () Bool)

(declare-fun b_next!28315 () Bool)

(assert (=> start!108802 (= b_free!28315 (not b_next!28315))))

(declare-fun tp!100061 () Bool)

(declare-fun b_and!46363 () Bool)

(assert (=> start!108802 (= tp!100061 b_and!46363)))

(declare-fun b!1284754 () Bool)

(declare-fun res!853484 () Bool)

(declare-fun e!733895 () Bool)

(assert (=> b!1284754 (=> (not res!853484) (not e!733895))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84859 0))(
  ( (array!84860 (arr!40932 (Array (_ BitVec 32) (_ BitVec 64))) (size!41484 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84859)

(assert (=> b!1284754 (= res!853484 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41484 _keys!1741))))))

(declare-fun mapNonEmpty!52490 () Bool)

(declare-fun mapRes!52490 () Bool)

(declare-fun tp!100062 () Bool)

(declare-fun e!733896 () Bool)

(assert (=> mapNonEmpty!52490 (= mapRes!52490 (and tp!100062 e!733896))))

(declare-fun mapKey!52490 () (_ BitVec 32))

(declare-datatypes ((V!50377 0))(
  ( (V!50378 (val!17052 Int)) )
))
(declare-datatypes ((ValueCell!16079 0))(
  ( (ValueCellFull!16079 (v!19653 V!50377)) (EmptyCell!16079) )
))
(declare-datatypes ((array!84861 0))(
  ( (array!84862 (arr!40933 (Array (_ BitVec 32) ValueCell!16079)) (size!41485 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84861)

(declare-fun mapValue!52490 () ValueCell!16079)

(declare-fun mapRest!52490 () (Array (_ BitVec 32) ValueCell!16079))

(assert (=> mapNonEmpty!52490 (= (arr!40933 _values!1445) (store mapRest!52490 mapKey!52490 mapValue!52490))))

(declare-fun b!1284755 () Bool)

(declare-fun res!853485 () Bool)

(assert (=> b!1284755 (=> (not res!853485) (not e!733895))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1284755 (= res!853485 (and (= (size!41485 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41484 _keys!1741) (size!41485 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!52490 () Bool)

(assert (=> mapIsEmpty!52490 mapRes!52490))

(declare-fun b!1284756 () Bool)

(declare-fun res!853487 () Bool)

(assert (=> b!1284756 (=> (not res!853487) (not e!733895))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84859 (_ BitVec 32)) Bool)

(assert (=> b!1284756 (= res!853487 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1284757 () Bool)

(declare-fun e!733893 () Bool)

(declare-fun e!733892 () Bool)

(assert (=> b!1284757 (= e!733893 (and e!733892 mapRes!52490))))

(declare-fun condMapEmpty!52490 () Bool)

(declare-fun mapDefault!52490 () ValueCell!16079)

(assert (=> b!1284757 (= condMapEmpty!52490 (= (arr!40933 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16079)) mapDefault!52490)))))

(declare-fun b!1284758 () Bool)

(declare-fun tp_is_empty!33955 () Bool)

(assert (=> b!1284758 (= e!733892 tp_is_empty!33955)))

(declare-fun res!853483 () Bool)

(assert (=> start!108802 (=> (not res!853483) (not e!733895))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108802 (= res!853483 (validMask!0 mask!2175))))

(assert (=> start!108802 e!733895))

(assert (=> start!108802 tp_is_empty!33955))

(assert (=> start!108802 true))

(declare-fun array_inv!31209 (array!84861) Bool)

(assert (=> start!108802 (and (array_inv!31209 _values!1445) e!733893)))

(declare-fun array_inv!31210 (array!84859) Bool)

(assert (=> start!108802 (array_inv!31210 _keys!1741)))

(assert (=> start!108802 tp!100061))

(declare-fun b!1284759 () Bool)

(declare-fun res!853488 () Bool)

(assert (=> b!1284759 (=> (not res!853488) (not e!733895))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1284759 (= res!853488 (validKeyInArray!0 (select (arr!40932 _keys!1741) from!2144)))))

(declare-fun b!1284760 () Bool)

(assert (=> b!1284760 (= e!733896 tp_is_empty!33955)))

(declare-fun b!1284761 () Bool)

(declare-fun res!853482 () Bool)

(assert (=> b!1284761 (=> (not res!853482) (not e!733895))))

(declare-fun minValue!1387 () V!50377)

(declare-fun zeroValue!1387 () V!50377)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21922 0))(
  ( (tuple2!21923 (_1!10972 (_ BitVec 64)) (_2!10972 V!50377)) )
))
(declare-datatypes ((List!29102 0))(
  ( (Nil!29099) (Cons!29098 (h!30307 tuple2!21922) (t!42638 List!29102)) )
))
(declare-datatypes ((ListLongMap!19579 0))(
  ( (ListLongMap!19580 (toList!9805 List!29102)) )
))
(declare-fun contains!7852 (ListLongMap!19579 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4775 (array!84859 array!84861 (_ BitVec 32) (_ BitVec 32) V!50377 V!50377 (_ BitVec 32) Int) ListLongMap!19579)

(assert (=> b!1284761 (= res!853482 (contains!7852 (getCurrentListMap!4775 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1284762 () Bool)

(assert (=> b!1284762 (= e!733895 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsgt from!2144 (size!41484 _keys!1741))))))

(declare-fun b!1284763 () Bool)

(declare-fun res!853481 () Bool)

(assert (=> b!1284763 (=> (not res!853481) (not e!733895))))

(assert (=> b!1284763 (= res!853481 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41484 _keys!1741))))))

(declare-fun b!1284764 () Bool)

(declare-fun res!853486 () Bool)

(assert (=> b!1284764 (=> (not res!853486) (not e!733895))))

(declare-datatypes ((List!29103 0))(
  ( (Nil!29100) (Cons!29099 (h!30308 (_ BitVec 64)) (t!42639 List!29103)) )
))
(declare-fun arrayNoDuplicates!0 (array!84859 (_ BitVec 32) List!29103) Bool)

(assert (=> b!1284764 (= res!853486 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29100))))

(assert (= (and start!108802 res!853483) b!1284755))

(assert (= (and b!1284755 res!853485) b!1284756))

(assert (= (and b!1284756 res!853487) b!1284764))

(assert (= (and b!1284764 res!853486) b!1284754))

(assert (= (and b!1284754 res!853484) b!1284761))

(assert (= (and b!1284761 res!853482) b!1284763))

(assert (= (and b!1284763 res!853481) b!1284759))

(assert (= (and b!1284759 res!853488) b!1284762))

(assert (= (and b!1284757 condMapEmpty!52490) mapIsEmpty!52490))

(assert (= (and b!1284757 (not condMapEmpty!52490)) mapNonEmpty!52490))

(get-info :version)

(assert (= (and mapNonEmpty!52490 ((_ is ValueCellFull!16079) mapValue!52490)) b!1284760))

(assert (= (and b!1284757 ((_ is ValueCellFull!16079) mapDefault!52490)) b!1284758))

(assert (= start!108802 b!1284757))

(declare-fun m!1177873 () Bool)

(assert (=> mapNonEmpty!52490 m!1177873))

(declare-fun m!1177875 () Bool)

(assert (=> start!108802 m!1177875))

(declare-fun m!1177877 () Bool)

(assert (=> start!108802 m!1177877))

(declare-fun m!1177879 () Bool)

(assert (=> start!108802 m!1177879))

(declare-fun m!1177881 () Bool)

(assert (=> b!1284756 m!1177881))

(declare-fun m!1177883 () Bool)

(assert (=> b!1284764 m!1177883))

(declare-fun m!1177885 () Bool)

(assert (=> b!1284761 m!1177885))

(assert (=> b!1284761 m!1177885))

(declare-fun m!1177887 () Bool)

(assert (=> b!1284761 m!1177887))

(declare-fun m!1177889 () Bool)

(assert (=> b!1284759 m!1177889))

(assert (=> b!1284759 m!1177889))

(declare-fun m!1177891 () Bool)

(assert (=> b!1284759 m!1177891))

(check-sat (not mapNonEmpty!52490) (not b!1284756) (not b!1284759) b_and!46363 tp_is_empty!33955 (not b!1284764) (not start!108802) (not b_next!28315) (not b!1284761))
(check-sat b_and!46363 (not b_next!28315))
