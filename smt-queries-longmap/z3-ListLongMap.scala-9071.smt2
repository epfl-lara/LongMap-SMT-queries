; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109212 () Bool)

(assert start!109212)

(declare-fun b_free!28701 () Bool)

(declare-fun b_next!28701 () Bool)

(assert (=> start!109212 (= b_free!28701 (not b_next!28701))))

(declare-fun tp!101221 () Bool)

(declare-fun b_and!46791 () Bool)

(assert (=> start!109212 (= tp!101221 b_and!46791)))

(declare-fun b!1291887 () Bool)

(declare-fun e!737431 () Bool)

(declare-fun tp_is_empty!34341 () Bool)

(assert (=> b!1291887 (= e!737431 tp_is_empty!34341)))

(declare-fun mapNonEmpty!53072 () Bool)

(declare-fun mapRes!53072 () Bool)

(declare-fun tp!101222 () Bool)

(declare-fun e!737434 () Bool)

(assert (=> mapNonEmpty!53072 (= mapRes!53072 (and tp!101222 e!737434))))

(declare-fun mapKey!53072 () (_ BitVec 32))

(declare-datatypes ((V!50891 0))(
  ( (V!50892 (val!17245 Int)) )
))
(declare-datatypes ((ValueCell!16272 0))(
  ( (ValueCellFull!16272 (v!19848 V!50891)) (EmptyCell!16272) )
))
(declare-fun mapRest!53072 () (Array (_ BitVec 32) ValueCell!16272))

(declare-fun mapValue!53072 () ValueCell!16272)

(declare-datatypes ((array!85718 0))(
  ( (array!85719 (arr!41360 (Array (_ BitVec 32) ValueCell!16272)) (size!41910 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85718)

(assert (=> mapNonEmpty!53072 (= (arr!41360 _values!1445) (store mapRest!53072 mapKey!53072 mapValue!53072))))

(declare-fun mapIsEmpty!53072 () Bool)

(assert (=> mapIsEmpty!53072 mapRes!53072))

(declare-fun b!1291888 () Bool)

(declare-fun res!858351 () Bool)

(declare-fun e!737435 () Bool)

(assert (=> b!1291888 (=> (not res!858351) (not e!737435))))

(declare-datatypes ((array!85720 0))(
  ( (array!85721 (arr!41361 (Array (_ BitVec 32) (_ BitVec 64))) (size!41911 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85720)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85720 (_ BitVec 32)) Bool)

(assert (=> b!1291888 (= res!858351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!858352 () Bool)

(assert (=> start!109212 (=> (not res!858352) (not e!737435))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109212 (= res!858352 (validMask!0 mask!2175))))

(assert (=> start!109212 e!737435))

(assert (=> start!109212 tp_is_empty!34341))

(assert (=> start!109212 true))

(declare-fun e!737433 () Bool)

(declare-fun array_inv!31339 (array!85718) Bool)

(assert (=> start!109212 (and (array_inv!31339 _values!1445) e!737433)))

(declare-fun array_inv!31340 (array!85720) Bool)

(assert (=> start!109212 (array_inv!31340 _keys!1741)))

(assert (=> start!109212 tp!101221))

(declare-fun b!1291889 () Bool)

(assert (=> b!1291889 (= e!737435 (not true))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22180 0))(
  ( (tuple2!22181 (_1!11101 (_ BitVec 64)) (_2!11101 V!50891)) )
))
(declare-datatypes ((List!29334 0))(
  ( (Nil!29331) (Cons!29330 (h!30539 tuple2!22180) (t!42898 List!29334)) )
))
(declare-datatypes ((ListLongMap!19837 0))(
  ( (ListLongMap!19838 (toList!9934 List!29334)) )
))
(declare-fun contains!8052 (ListLongMap!19837 (_ BitVec 64)) Bool)

(assert (=> b!1291889 (not (contains!8052 (ListLongMap!19838 Nil!29331) k0!1205))))

(declare-datatypes ((Unit!42778 0))(
  ( (Unit!42779) )
))
(declare-fun lt!579287 () Unit!42778)

(declare-fun emptyContainsNothing!111 ((_ BitVec 64)) Unit!42778)

(assert (=> b!1291889 (= lt!579287 (emptyContainsNothing!111 k0!1205))))

(declare-fun b!1291890 () Bool)

(declare-fun res!858354 () Bool)

(assert (=> b!1291890 (=> (not res!858354) (not e!737435))))

(declare-fun minValue!1387 () V!50891)

(declare-fun zeroValue!1387 () V!50891)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4982 (array!85720 array!85718 (_ BitVec 32) (_ BitVec 32) V!50891 V!50891 (_ BitVec 32) Int) ListLongMap!19837)

(assert (=> b!1291890 (= res!858354 (contains!8052 (getCurrentListMap!4982 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1291891 () Bool)

(declare-fun res!858356 () Bool)

(assert (=> b!1291891 (=> (not res!858356) (not e!737435))))

(assert (=> b!1291891 (= res!858356 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41911 _keys!1741))))))

(declare-fun b!1291892 () Bool)

(declare-fun res!858355 () Bool)

(assert (=> b!1291892 (=> (not res!858355) (not e!737435))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1291892 (= res!858355 (not (validKeyInArray!0 (select (arr!41361 _keys!1741) from!2144))))))

(declare-fun b!1291893 () Bool)

(declare-fun res!858357 () Bool)

(assert (=> b!1291893 (=> (not res!858357) (not e!737435))))

(assert (=> b!1291893 (= res!858357 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41911 _keys!1741))))))

(declare-fun b!1291894 () Bool)

(assert (=> b!1291894 (= e!737434 tp_is_empty!34341)))

(declare-fun b!1291895 () Bool)

(declare-fun res!858353 () Bool)

(assert (=> b!1291895 (=> (not res!858353) (not e!737435))))

(assert (=> b!1291895 (= res!858353 (and (= (size!41910 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41911 _keys!1741) (size!41910 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1291896 () Bool)

(declare-fun res!858350 () Bool)

(assert (=> b!1291896 (=> (not res!858350) (not e!737435))))

(declare-datatypes ((List!29335 0))(
  ( (Nil!29332) (Cons!29331 (h!30540 (_ BitVec 64)) (t!42899 List!29335)) )
))
(declare-fun arrayNoDuplicates!0 (array!85720 (_ BitVec 32) List!29335) Bool)

(assert (=> b!1291896 (= res!858350 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29332))))

(declare-fun b!1291897 () Bool)

(assert (=> b!1291897 (= e!737433 (and e!737431 mapRes!53072))))

(declare-fun condMapEmpty!53072 () Bool)

(declare-fun mapDefault!53072 () ValueCell!16272)

(assert (=> b!1291897 (= condMapEmpty!53072 (= (arr!41360 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16272)) mapDefault!53072)))))

(assert (= (and start!109212 res!858352) b!1291895))

(assert (= (and b!1291895 res!858353) b!1291888))

(assert (= (and b!1291888 res!858351) b!1291896))

(assert (= (and b!1291896 res!858350) b!1291893))

(assert (= (and b!1291893 res!858357) b!1291890))

(assert (= (and b!1291890 res!858354) b!1291891))

(assert (= (and b!1291891 res!858356) b!1291892))

(assert (= (and b!1291892 res!858355) b!1291889))

(assert (= (and b!1291897 condMapEmpty!53072) mapIsEmpty!53072))

(assert (= (and b!1291897 (not condMapEmpty!53072)) mapNonEmpty!53072))

(get-info :version)

(assert (= (and mapNonEmpty!53072 ((_ is ValueCellFull!16272) mapValue!53072)) b!1291894))

(assert (= (and b!1291897 ((_ is ValueCellFull!16272) mapDefault!53072)) b!1291887))

(assert (= start!109212 b!1291897))

(declare-fun m!1184591 () Bool)

(assert (=> b!1291888 m!1184591))

(declare-fun m!1184593 () Bool)

(assert (=> b!1291892 m!1184593))

(assert (=> b!1291892 m!1184593))

(declare-fun m!1184595 () Bool)

(assert (=> b!1291892 m!1184595))

(declare-fun m!1184597 () Bool)

(assert (=> b!1291890 m!1184597))

(assert (=> b!1291890 m!1184597))

(declare-fun m!1184599 () Bool)

(assert (=> b!1291890 m!1184599))

(declare-fun m!1184601 () Bool)

(assert (=> mapNonEmpty!53072 m!1184601))

(declare-fun m!1184603 () Bool)

(assert (=> start!109212 m!1184603))

(declare-fun m!1184605 () Bool)

(assert (=> start!109212 m!1184605))

(declare-fun m!1184607 () Bool)

(assert (=> start!109212 m!1184607))

(declare-fun m!1184609 () Bool)

(assert (=> b!1291896 m!1184609))

(declare-fun m!1184611 () Bool)

(assert (=> b!1291889 m!1184611))

(declare-fun m!1184613 () Bool)

(assert (=> b!1291889 m!1184613))

(check-sat (not b!1291888) (not b!1291889) (not b!1291896) (not start!109212) b_and!46791 (not b!1291890) tp_is_empty!34341 (not b_next!28701) (not b!1291892) (not mapNonEmpty!53072))
(check-sat b_and!46791 (not b_next!28701))
