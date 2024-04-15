; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109330 () Bool)

(assert start!109330)

(declare-fun b_free!28819 () Bool)

(declare-fun b_next!28819 () Bool)

(assert (=> start!109330 (= b_free!28819 (not b_next!28819))))

(declare-fun tp!101576 () Bool)

(declare-fun b_and!46891 () Bool)

(assert (=> start!109330 (= tp!101576 b_and!46891)))

(declare-fun b!1293878 () Bool)

(declare-fun res!859854 () Bool)

(declare-fun e!738399 () Bool)

(assert (=> b!1293878 (=> (not res!859854) (not e!738399))))

(declare-datatypes ((array!85831 0))(
  ( (array!85832 (arr!41417 (Array (_ BitVec 32) (_ BitVec 64))) (size!41969 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85831)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1293878 (= res!859854 (not (validKeyInArray!0 (select (arr!41417 _keys!1741) from!2144))))))

(declare-fun b!1293879 () Bool)

(declare-fun res!859853 () Bool)

(assert (=> b!1293879 (=> (not res!859853) (not e!738399))))

(assert (=> b!1293879 (= res!859853 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41969 _keys!1741))))))

(declare-fun b!1293880 () Bool)

(declare-fun res!859852 () Bool)

(assert (=> b!1293880 (=> (not res!859852) (not e!738399))))

(declare-datatypes ((List!29457 0))(
  ( (Nil!29454) (Cons!29453 (h!30662 (_ BitVec 64)) (t!43013 List!29457)) )
))
(declare-fun arrayNoDuplicates!0 (array!85831 (_ BitVec 32) List!29457) Bool)

(assert (=> b!1293880 (= res!859852 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29454))))

(declare-fun b!1293881 () Bool)

(declare-fun res!859851 () Bool)

(assert (=> b!1293881 (=> (not res!859851) (not e!738399))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1293881 (= res!859851 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41969 _keys!1741))))))

(declare-fun res!859849 () Bool)

(assert (=> start!109330 (=> (not res!859849) (not e!738399))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109330 (= res!859849 (validMask!0 mask!2175))))

(assert (=> start!109330 e!738399))

(declare-fun tp_is_empty!34459 () Bool)

(assert (=> start!109330 tp_is_empty!34459))

(assert (=> start!109330 true))

(declare-datatypes ((V!51049 0))(
  ( (V!51050 (val!17304 Int)) )
))
(declare-datatypes ((ValueCell!16331 0))(
  ( (ValueCellFull!16331 (v!19906 V!51049)) (EmptyCell!16331) )
))
(declare-datatypes ((array!85833 0))(
  ( (array!85834 (arr!41418 (Array (_ BitVec 32) ValueCell!16331)) (size!41970 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85833)

(declare-fun e!738396 () Bool)

(declare-fun array_inv!31531 (array!85833) Bool)

(assert (=> start!109330 (and (array_inv!31531 _values!1445) e!738396)))

(declare-fun array_inv!31532 (array!85831) Bool)

(assert (=> start!109330 (array_inv!31532 _keys!1741)))

(assert (=> start!109330 tp!101576))

(declare-fun b!1293882 () Bool)

(declare-fun e!738397 () Bool)

(declare-fun mapRes!53249 () Bool)

(assert (=> b!1293882 (= e!738396 (and e!738397 mapRes!53249))))

(declare-fun condMapEmpty!53249 () Bool)

(declare-fun mapDefault!53249 () ValueCell!16331)

(assert (=> b!1293882 (= condMapEmpty!53249 (= (arr!41418 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16331)) mapDefault!53249)))))

(declare-fun b!1293883 () Bool)

(declare-fun res!859848 () Bool)

(assert (=> b!1293883 (=> (not res!859848) (not e!738399))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85831 (_ BitVec 32)) Bool)

(assert (=> b!1293883 (= res!859848 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!53249 () Bool)

(assert (=> mapIsEmpty!53249 mapRes!53249))

(declare-fun b!1293884 () Bool)

(declare-fun e!738398 () Bool)

(assert (=> b!1293884 (= e!738398 tp_is_empty!34459)))

(declare-fun b!1293885 () Bool)

(assert (=> b!1293885 (= e!738399 (not true))))

(declare-datatypes ((tuple2!22314 0))(
  ( (tuple2!22315 (_1!11168 (_ BitVec 64)) (_2!11168 V!51049)) )
))
(declare-datatypes ((List!29458 0))(
  ( (Nil!29455) (Cons!29454 (h!30663 tuple2!22314) (t!43014 List!29458)) )
))
(declare-datatypes ((ListLongMap!19971 0))(
  ( (ListLongMap!19972 (toList!10001 List!29458)) )
))
(declare-fun contains!8049 (ListLongMap!19971 (_ BitVec 64)) Bool)

(assert (=> b!1293885 (not (contains!8049 (ListLongMap!19972 Nil!29455) k0!1205))))

(declare-datatypes ((Unit!42678 0))(
  ( (Unit!42679) )
))
(declare-fun lt!579493 () Unit!42678)

(declare-fun emptyContainsNothing!132 ((_ BitVec 64)) Unit!42678)

(assert (=> b!1293885 (= lt!579493 (emptyContainsNothing!132 k0!1205))))

(declare-fun mapNonEmpty!53249 () Bool)

(declare-fun tp!101577 () Bool)

(assert (=> mapNonEmpty!53249 (= mapRes!53249 (and tp!101577 e!738398))))

(declare-fun mapValue!53249 () ValueCell!16331)

(declare-fun mapKey!53249 () (_ BitVec 32))

(declare-fun mapRest!53249 () (Array (_ BitVec 32) ValueCell!16331))

(assert (=> mapNonEmpty!53249 (= (arr!41418 _values!1445) (store mapRest!53249 mapKey!53249 mapValue!53249))))

(declare-fun b!1293886 () Bool)

(declare-fun res!859847 () Bool)

(assert (=> b!1293886 (=> (not res!859847) (not e!738399))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1293886 (= res!859847 (and (= (size!41970 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41969 _keys!1741) (size!41970 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1293887 () Bool)

(assert (=> b!1293887 (= e!738397 tp_is_empty!34459)))

(declare-fun b!1293888 () Bool)

(declare-fun res!859850 () Bool)

(assert (=> b!1293888 (=> (not res!859850) (not e!738399))))

(declare-fun minValue!1387 () V!51049)

(declare-fun zeroValue!1387 () V!51049)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4933 (array!85831 array!85833 (_ BitVec 32) (_ BitVec 32) V!51049 V!51049 (_ BitVec 32) Int) ListLongMap!19971)

(assert (=> b!1293888 (= res!859850 (contains!8049 (getCurrentListMap!4933 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!109330 res!859849) b!1293886))

(assert (= (and b!1293886 res!859847) b!1293883))

(assert (= (and b!1293883 res!859848) b!1293880))

(assert (= (and b!1293880 res!859852) b!1293879))

(assert (= (and b!1293879 res!859853) b!1293888))

(assert (= (and b!1293888 res!859850) b!1293881))

(assert (= (and b!1293881 res!859851) b!1293878))

(assert (= (and b!1293878 res!859854) b!1293885))

(assert (= (and b!1293882 condMapEmpty!53249) mapIsEmpty!53249))

(assert (= (and b!1293882 (not condMapEmpty!53249)) mapNonEmpty!53249))

(get-info :version)

(assert (= (and mapNonEmpty!53249 ((_ is ValueCellFull!16331) mapValue!53249)) b!1293884))

(assert (= (and b!1293882 ((_ is ValueCellFull!16331) mapDefault!53249)) b!1293887))

(assert (= start!109330 b!1293882))

(declare-fun m!1185783 () Bool)

(assert (=> b!1293888 m!1185783))

(assert (=> b!1293888 m!1185783))

(declare-fun m!1185785 () Bool)

(assert (=> b!1293888 m!1185785))

(declare-fun m!1185787 () Bool)

(assert (=> b!1293883 m!1185787))

(declare-fun m!1185789 () Bool)

(assert (=> start!109330 m!1185789))

(declare-fun m!1185791 () Bool)

(assert (=> start!109330 m!1185791))

(declare-fun m!1185793 () Bool)

(assert (=> start!109330 m!1185793))

(declare-fun m!1185795 () Bool)

(assert (=> b!1293878 m!1185795))

(assert (=> b!1293878 m!1185795))

(declare-fun m!1185797 () Bool)

(assert (=> b!1293878 m!1185797))

(declare-fun m!1185799 () Bool)

(assert (=> mapNonEmpty!53249 m!1185799))

(declare-fun m!1185801 () Bool)

(assert (=> b!1293885 m!1185801))

(declare-fun m!1185803 () Bool)

(assert (=> b!1293885 m!1185803))

(declare-fun m!1185805 () Bool)

(assert (=> b!1293880 m!1185805))

(check-sat (not mapNonEmpty!53249) tp_is_empty!34459 (not b_next!28819) (not b!1293888) (not b!1293880) (not start!109330) (not b!1293885) (not b!1293878) b_and!46891 (not b!1293883))
(check-sat b_and!46891 (not b_next!28819))
