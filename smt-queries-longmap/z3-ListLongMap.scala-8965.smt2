; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108516 () Bool)

(assert start!108516)

(declare-fun b_free!28063 () Bool)

(declare-fun b_next!28063 () Bool)

(assert (=> start!108516 (= b_free!28063 (not b_next!28063))))

(declare-fun tp!99300 () Bool)

(declare-fun b_and!46105 () Bool)

(assert (=> start!108516 (= tp!99300 b_and!46105)))

(declare-fun mapNonEmpty!52106 () Bool)

(declare-fun mapRes!52106 () Bool)

(declare-fun tp!99299 () Bool)

(declare-fun e!731809 () Bool)

(assert (=> mapNonEmpty!52106 (= mapRes!52106 (and tp!99299 e!731809))))

(declare-fun mapKey!52106 () (_ BitVec 32))

(declare-datatypes ((V!50041 0))(
  ( (V!50042 (val!16926 Int)) )
))
(declare-datatypes ((ValueCell!15953 0))(
  ( (ValueCellFull!15953 (v!19525 V!50041)) (EmptyCell!15953) )
))
(declare-datatypes ((array!84373 0))(
  ( (array!84374 (arr!40691 (Array (_ BitVec 32) ValueCell!15953)) (size!41243 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84373)

(declare-fun mapRest!52106 () (Array (_ BitVec 32) ValueCell!15953))

(declare-fun mapValue!52106 () ValueCell!15953)

(assert (=> mapNonEmpty!52106 (= (arr!40691 _values!1445) (store mapRest!52106 mapKey!52106 mapValue!52106))))

(declare-fun b!1280781 () Bool)

(declare-fun res!850790 () Bool)

(declare-fun e!731810 () Bool)

(assert (=> b!1280781 (=> (not res!850790) (not e!731810))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84375 0))(
  ( (array!84376 (arr!40692 (Array (_ BitVec 32) (_ BitVec 64))) (size!41244 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84375)

(assert (=> b!1280781 (= res!850790 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41244 _keys!1741))))))

(declare-fun b!1280782 () Bool)

(declare-fun res!850794 () Bool)

(assert (=> b!1280782 (=> (not res!850794) (not e!731810))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1280782 (= res!850794 (and (= (size!41243 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41244 _keys!1741) (size!41243 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1280783 () Bool)

(declare-fun res!850792 () Bool)

(assert (=> b!1280783 (=> (not res!850792) (not e!731810))))

(declare-fun minValue!1387 () V!50041)

(declare-fun zeroValue!1387 () V!50041)

(declare-fun defaultEntry!1448 () Int)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!21736 0))(
  ( (tuple2!21737 (_1!10879 (_ BitVec 64)) (_2!10879 V!50041)) )
))
(declare-datatypes ((List!28929 0))(
  ( (Nil!28926) (Cons!28925 (h!30134 tuple2!21736) (t!42461 List!28929)) )
))
(declare-datatypes ((ListLongMap!19393 0))(
  ( (ListLongMap!19394 (toList!9712 List!28929)) )
))
(declare-fun contains!7757 (ListLongMap!19393 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4686 (array!84375 array!84373 (_ BitVec 32) (_ BitVec 32) V!50041 V!50041 (_ BitVec 32) Int) ListLongMap!19393)

(assert (=> b!1280783 (= res!850792 (contains!7757 (getCurrentListMap!4686 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1280784 () Bool)

(declare-fun e!731808 () Bool)

(declare-fun tp_is_empty!33703 () Bool)

(assert (=> b!1280784 (= e!731808 tp_is_empty!33703)))

(declare-fun b!1280785 () Bool)

(declare-fun res!850791 () Bool)

(assert (=> b!1280785 (=> (not res!850791) (not e!731810))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84375 (_ BitVec 32)) Bool)

(assert (=> b!1280785 (= res!850791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1280786 () Bool)

(declare-fun res!850796 () Bool)

(assert (=> b!1280786 (=> (not res!850796) (not e!731810))))

(declare-datatypes ((List!28930 0))(
  ( (Nil!28927) (Cons!28926 (h!30135 (_ BitVec 64)) (t!42462 List!28930)) )
))
(declare-fun arrayNoDuplicates!0 (array!84375 (_ BitVec 32) List!28930) Bool)

(assert (=> b!1280786 (= res!850796 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28927))))

(declare-fun b!1280787 () Bool)

(declare-fun res!850793 () Bool)

(assert (=> b!1280787 (=> (not res!850793) (not e!731810))))

(assert (=> b!1280787 (= res!850793 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41244 _keys!1741)) (not (= (select (arr!40692 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1280788 () Bool)

(assert (=> b!1280788 (= e!731809 tp_is_empty!33703)))

(declare-fun b!1280789 () Bool)

(declare-fun e!731811 () Bool)

(assert (=> b!1280789 (= e!731811 (and e!731808 mapRes!52106))))

(declare-fun condMapEmpty!52106 () Bool)

(declare-fun mapDefault!52106 () ValueCell!15953)

(assert (=> b!1280789 (= condMapEmpty!52106 (= (arr!40691 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15953)) mapDefault!52106)))))

(declare-fun b!1280790 () Bool)

(assert (=> b!1280790 (= e!731810 (not true))))

(assert (=> b!1280790 (contains!7757 (getCurrentListMap!4686 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42255 0))(
  ( (Unit!42256) )
))
(declare-fun lt!575989 () Unit!42255)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!9 (array!84375 array!84373 (_ BitVec 32) (_ BitVec 32) V!50041 V!50041 (_ BitVec 64) (_ BitVec 32) Int) Unit!42255)

(assert (=> b!1280790 (= lt!575989 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!9 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun mapIsEmpty!52106 () Bool)

(assert (=> mapIsEmpty!52106 mapRes!52106))

(declare-fun res!850795 () Bool)

(assert (=> start!108516 (=> (not res!850795) (not e!731810))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108516 (= res!850795 (validMask!0 mask!2175))))

(assert (=> start!108516 e!731810))

(assert (=> start!108516 tp_is_empty!33703))

(assert (=> start!108516 true))

(declare-fun array_inv!31047 (array!84373) Bool)

(assert (=> start!108516 (and (array_inv!31047 _values!1445) e!731811)))

(declare-fun array_inv!31048 (array!84375) Bool)

(assert (=> start!108516 (array_inv!31048 _keys!1741)))

(assert (=> start!108516 tp!99300))

(assert (= (and start!108516 res!850795) b!1280782))

(assert (= (and b!1280782 res!850794) b!1280785))

(assert (= (and b!1280785 res!850791) b!1280786))

(assert (= (and b!1280786 res!850796) b!1280781))

(assert (= (and b!1280781 res!850790) b!1280783))

(assert (= (and b!1280783 res!850792) b!1280787))

(assert (= (and b!1280787 res!850793) b!1280790))

(assert (= (and b!1280789 condMapEmpty!52106) mapIsEmpty!52106))

(assert (= (and b!1280789 (not condMapEmpty!52106)) mapNonEmpty!52106))

(get-info :version)

(assert (= (and mapNonEmpty!52106 ((_ is ValueCellFull!15953) mapValue!52106)) b!1280788))

(assert (= (and b!1280789 ((_ is ValueCellFull!15953) mapDefault!52106)) b!1280784))

(assert (= start!108516 b!1280789))

(declare-fun m!1174881 () Bool)

(assert (=> b!1280790 m!1174881))

(assert (=> b!1280790 m!1174881))

(declare-fun m!1174883 () Bool)

(assert (=> b!1280790 m!1174883))

(declare-fun m!1174885 () Bool)

(assert (=> b!1280790 m!1174885))

(declare-fun m!1174887 () Bool)

(assert (=> b!1280787 m!1174887))

(declare-fun m!1174889 () Bool)

(assert (=> b!1280785 m!1174889))

(declare-fun m!1174891 () Bool)

(assert (=> b!1280783 m!1174891))

(assert (=> b!1280783 m!1174891))

(declare-fun m!1174893 () Bool)

(assert (=> b!1280783 m!1174893))

(declare-fun m!1174895 () Bool)

(assert (=> mapNonEmpty!52106 m!1174895))

(declare-fun m!1174897 () Bool)

(assert (=> start!108516 m!1174897))

(declare-fun m!1174899 () Bool)

(assert (=> start!108516 m!1174899))

(declare-fun m!1174901 () Bool)

(assert (=> start!108516 m!1174901))

(declare-fun m!1174903 () Bool)

(assert (=> b!1280786 m!1174903))

(check-sat (not b!1280786) (not b!1280790) (not b_next!28063) (not b!1280785) tp_is_empty!33703 (not mapNonEmpty!52106) (not b!1280783) b_and!46105 (not start!108516))
(check-sat b_and!46105 (not b_next!28063))
