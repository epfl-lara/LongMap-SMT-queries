; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109380 () Bool)

(assert start!109380)

(declare-fun b_free!28869 () Bool)

(declare-fun b_next!28869 () Bool)

(assert (=> start!109380 (= b_free!28869 (not b_next!28869))))

(declare-fun tp!101726 () Bool)

(declare-fun b_and!46959 () Bool)

(assert (=> start!109380 (= tp!101726 b_and!46959)))

(declare-fun b!1294767 () Bool)

(declare-fun res!860481 () Bool)

(declare-fun e!738799 () Bool)

(assert (=> b!1294767 (=> (not res!860481) (not e!738799))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!86038 0))(
  ( (array!86039 (arr!41520 (Array (_ BitVec 32) (_ BitVec 64))) (size!42070 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86038)

(assert (=> b!1294767 (= res!860481 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42070 _keys!1741))))))

(declare-fun res!860478 () Bool)

(assert (=> start!109380 (=> (not res!860478) (not e!738799))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109380 (= res!860478 (validMask!0 mask!2175))))

(assert (=> start!109380 e!738799))

(declare-fun tp_is_empty!34509 () Bool)

(assert (=> start!109380 tp_is_empty!34509))

(assert (=> start!109380 true))

(declare-datatypes ((V!51115 0))(
  ( (V!51116 (val!17329 Int)) )
))
(declare-datatypes ((ValueCell!16356 0))(
  ( (ValueCellFull!16356 (v!19932 V!51115)) (EmptyCell!16356) )
))
(declare-datatypes ((array!86040 0))(
  ( (array!86041 (arr!41521 (Array (_ BitVec 32) ValueCell!16356)) (size!42071 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86040)

(declare-fun e!738802 () Bool)

(declare-fun array_inv!31441 (array!86040) Bool)

(assert (=> start!109380 (and (array_inv!31441 _values!1445) e!738802)))

(declare-fun array_inv!31442 (array!86038) Bool)

(assert (=> start!109380 (array_inv!31442 _keys!1741)))

(assert (=> start!109380 tp!101726))

(declare-fun b!1294768 () Bool)

(declare-fun res!860479 () Bool)

(assert (=> b!1294768 (=> (not res!860479) (not e!738799))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1294768 (= res!860479 (not (validKeyInArray!0 (select (arr!41520 _keys!1741) from!2144))))))

(declare-fun mapNonEmpty!53324 () Bool)

(declare-fun mapRes!53324 () Bool)

(declare-fun tp!101725 () Bool)

(declare-fun e!738801 () Bool)

(assert (=> mapNonEmpty!53324 (= mapRes!53324 (and tp!101725 e!738801))))

(declare-fun mapValue!53324 () ValueCell!16356)

(declare-fun mapKey!53324 () (_ BitVec 32))

(declare-fun mapRest!53324 () (Array (_ BitVec 32) ValueCell!16356))

(assert (=> mapNonEmpty!53324 (= (arr!41521 _values!1445) (store mapRest!53324 mapKey!53324 mapValue!53324))))

(declare-fun b!1294769 () Bool)

(assert (=> b!1294769 (= e!738801 tp_is_empty!34509)))

(declare-fun b!1294770 () Bool)

(declare-fun res!860480 () Bool)

(assert (=> b!1294770 (=> (not res!860480) (not e!738799))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1294770 (= res!860480 (and (= (size!42071 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42070 _keys!1741) (size!42071 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!53324 () Bool)

(assert (=> mapIsEmpty!53324 mapRes!53324))

(declare-fun b!1294771 () Bool)

(declare-fun e!738800 () Bool)

(assert (=> b!1294771 (= e!738802 (and e!738800 mapRes!53324))))

(declare-fun condMapEmpty!53324 () Bool)

(declare-fun mapDefault!53324 () ValueCell!16356)

(assert (=> b!1294771 (= condMapEmpty!53324 (= (arr!41521 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16356)) mapDefault!53324)))))

(declare-fun b!1294772 () Bool)

(declare-fun res!860474 () Bool)

(assert (=> b!1294772 (=> (not res!860474) (not e!738799))))

(declare-datatypes ((List!29452 0))(
  ( (Nil!29449) (Cons!29448 (h!30657 (_ BitVec 64)) (t!43016 List!29452)) )
))
(declare-fun arrayNoDuplicates!0 (array!86038 (_ BitVec 32) List!29452) Bool)

(assert (=> b!1294772 (= res!860474 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29449))))

(declare-fun b!1294773 () Bool)

(declare-fun res!860476 () Bool)

(assert (=> b!1294773 (=> (not res!860476) (not e!738799))))

(assert (=> b!1294773 (= res!860476 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42070 _keys!1741))))))

(declare-fun b!1294774 () Bool)

(declare-fun res!860475 () Bool)

(assert (=> b!1294774 (=> (not res!860475) (not e!738799))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86038 (_ BitVec 32)) Bool)

(assert (=> b!1294774 (= res!860475 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1294775 () Bool)

(declare-fun res!860477 () Bool)

(assert (=> b!1294775 (=> (not res!860477) (not e!738799))))

(declare-fun minValue!1387 () V!51115)

(declare-fun zeroValue!1387 () V!51115)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22308 0))(
  ( (tuple2!22309 (_1!11165 (_ BitVec 64)) (_2!11165 V!51115)) )
))
(declare-datatypes ((List!29453 0))(
  ( (Nil!29450) (Cons!29449 (h!30658 tuple2!22308) (t!43017 List!29453)) )
))
(declare-datatypes ((ListLongMap!19965 0))(
  ( (ListLongMap!19966 (toList!9998 List!29453)) )
))
(declare-fun contains!8116 (ListLongMap!19965 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5035 (array!86038 array!86040 (_ BitVec 32) (_ BitVec 32) V!51115 V!51115 (_ BitVec 32) Int) ListLongMap!19965)

(assert (=> b!1294775 (= res!860477 (contains!8116 (getCurrentListMap!5035 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1294776 () Bool)

(assert (=> b!1294776 (= e!738800 tp_is_empty!34509)))

(declare-fun b!1294777 () Bool)

(assert (=> b!1294777 (= e!738799 (not (or (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (bvsle from!2144 (size!42070 _keys!1741)))))))

(assert (=> b!1294777 (not (contains!8116 (ListLongMap!19966 Nil!29450) k0!1205))))

(declare-datatypes ((Unit!42882 0))(
  ( (Unit!42883) )
))
(declare-fun lt!579746 () Unit!42882)

(declare-fun emptyContainsNothing!162 ((_ BitVec 64)) Unit!42882)

(assert (=> b!1294777 (= lt!579746 (emptyContainsNothing!162 k0!1205))))

(assert (= (and start!109380 res!860478) b!1294770))

(assert (= (and b!1294770 res!860480) b!1294774))

(assert (= (and b!1294774 res!860475) b!1294772))

(assert (= (and b!1294772 res!860474) b!1294773))

(assert (= (and b!1294773 res!860476) b!1294775))

(assert (= (and b!1294775 res!860477) b!1294767))

(assert (= (and b!1294767 res!860481) b!1294768))

(assert (= (and b!1294768 res!860479) b!1294777))

(assert (= (and b!1294771 condMapEmpty!53324) mapIsEmpty!53324))

(assert (= (and b!1294771 (not condMapEmpty!53324)) mapNonEmpty!53324))

(get-info :version)

(assert (= (and mapNonEmpty!53324 ((_ is ValueCellFull!16356) mapValue!53324)) b!1294769))

(assert (= (and b!1294771 ((_ is ValueCellFull!16356) mapDefault!53324)) b!1294776))

(assert (= start!109380 b!1294771))

(declare-fun m!1186883 () Bool)

(assert (=> b!1294775 m!1186883))

(assert (=> b!1294775 m!1186883))

(declare-fun m!1186885 () Bool)

(assert (=> b!1294775 m!1186885))

(declare-fun m!1186887 () Bool)

(assert (=> b!1294772 m!1186887))

(declare-fun m!1186889 () Bool)

(assert (=> b!1294768 m!1186889))

(assert (=> b!1294768 m!1186889))

(declare-fun m!1186891 () Bool)

(assert (=> b!1294768 m!1186891))

(declare-fun m!1186893 () Bool)

(assert (=> b!1294777 m!1186893))

(declare-fun m!1186895 () Bool)

(assert (=> b!1294777 m!1186895))

(declare-fun m!1186897 () Bool)

(assert (=> start!109380 m!1186897))

(declare-fun m!1186899 () Bool)

(assert (=> start!109380 m!1186899))

(declare-fun m!1186901 () Bool)

(assert (=> start!109380 m!1186901))

(declare-fun m!1186903 () Bool)

(assert (=> mapNonEmpty!53324 m!1186903))

(declare-fun m!1186905 () Bool)

(assert (=> b!1294774 m!1186905))

(check-sat (not b_next!28869) (not b!1294777) (not mapNonEmpty!53324) (not b!1294768) (not b!1294774) tp_is_empty!34509 (not b!1294775) (not b!1294772) (not start!109380) b_and!46959)
(check-sat b_and!46959 (not b_next!28869))
