; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109596 () Bool)

(assert start!109596)

(declare-fun b_free!28861 () Bool)

(declare-fun b_next!28861 () Bool)

(assert (=> start!109596 (= b_free!28861 (not b_next!28861))))

(declare-fun tp!101701 () Bool)

(declare-fun b_and!46953 () Bool)

(assert (=> start!109596 (= tp!101701 b_and!46953)))

(declare-fun b!1295940 () Bool)

(declare-fun e!739589 () Bool)

(declare-fun tp_is_empty!34501 () Bool)

(assert (=> b!1295940 (= e!739589 tp_is_empty!34501)))

(declare-fun mapNonEmpty!53312 () Bool)

(declare-fun mapRes!53312 () Bool)

(declare-fun tp!101702 () Bool)

(declare-fun e!739586 () Bool)

(assert (=> mapNonEmpty!53312 (= mapRes!53312 (and tp!101702 e!739586))))

(declare-datatypes ((V!51105 0))(
  ( (V!51106 (val!17325 Int)) )
))
(declare-datatypes ((ValueCell!16352 0))(
  ( (ValueCellFull!16352 (v!19923 V!51105)) (EmptyCell!16352) )
))
(declare-datatypes ((array!86057 0))(
  ( (array!86058 (arr!41525 (Array (_ BitVec 32) ValueCell!16352)) (size!42076 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86057)

(declare-fun mapRest!53312 () (Array (_ BitVec 32) ValueCell!16352))

(declare-fun mapKey!53312 () (_ BitVec 32))

(declare-fun mapValue!53312 () ValueCell!16352)

(assert (=> mapNonEmpty!53312 (= (arr!41525 _values!1445) (store mapRest!53312 mapKey!53312 mapValue!53312))))

(declare-fun b!1295941 () Bool)

(declare-fun e!739590 () Bool)

(assert (=> b!1295941 (= e!739590 (and e!739589 mapRes!53312))))

(declare-fun condMapEmpty!53312 () Bool)

(declare-fun mapDefault!53312 () ValueCell!16352)

(assert (=> b!1295941 (= condMapEmpty!53312 (= (arr!41525 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16352)) mapDefault!53312)))))

(declare-fun b!1295942 () Bool)

(declare-fun res!860900 () Bool)

(declare-fun e!739588 () Bool)

(assert (=> b!1295942 (=> (not res!860900) (not e!739588))))

(declare-datatypes ((array!86059 0))(
  ( (array!86060 (arr!41526 (Array (_ BitVec 32) (_ BitVec 64))) (size!42077 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86059)

(declare-datatypes ((List!29476 0))(
  ( (Nil!29473) (Cons!29472 (h!30690 (_ BitVec 64)) (t!43032 List!29476)) )
))
(declare-fun arrayNoDuplicates!0 (array!86059 (_ BitVec 32) List!29476) Bool)

(assert (=> b!1295942 (= res!860900 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29473))))

(declare-fun b!1295943 () Bool)

(assert (=> b!1295943 (= e!739588 (not true))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22308 0))(
  ( (tuple2!22309 (_1!11165 (_ BitVec 64)) (_2!11165 V!51105)) )
))
(declare-datatypes ((List!29477 0))(
  ( (Nil!29474) (Cons!29473 (h!30691 tuple2!22308) (t!43033 List!29477)) )
))
(declare-datatypes ((ListLongMap!19973 0))(
  ( (ListLongMap!19974 (toList!10002 List!29477)) )
))
(declare-fun contains!8133 (ListLongMap!19973 (_ BitVec 64)) Bool)

(assert (=> b!1295943 (not (contains!8133 (ListLongMap!19974 Nil!29474) k0!1205))))

(declare-datatypes ((Unit!42835 0))(
  ( (Unit!42836) )
))
(declare-fun lt!580218 () Unit!42835)

(declare-fun emptyContainsNothing!160 ((_ BitVec 64)) Unit!42835)

(assert (=> b!1295943 (= lt!580218 (emptyContainsNothing!160 k0!1205))))

(declare-fun b!1295944 () Bool)

(declare-fun res!860904 () Bool)

(assert (=> b!1295944 (=> (not res!860904) (not e!739588))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1295944 (= res!860904 (and (= (size!42076 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42077 _keys!1741) (size!42076 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1295945 () Bool)

(assert (=> b!1295945 (= e!739586 tp_is_empty!34501)))

(declare-fun res!860899 () Bool)

(assert (=> start!109596 (=> (not res!860899) (not e!739588))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109596 (= res!860899 (validMask!0 mask!2175))))

(assert (=> start!109596 e!739588))

(assert (=> start!109596 tp_is_empty!34501))

(assert (=> start!109596 true))

(declare-fun array_inv!31677 (array!86057) Bool)

(assert (=> start!109596 (and (array_inv!31677 _values!1445) e!739590)))

(declare-fun array_inv!31678 (array!86059) Bool)

(assert (=> start!109596 (array_inv!31678 _keys!1741)))

(assert (=> start!109596 tp!101701))

(declare-fun b!1295946 () Bool)

(declare-fun res!860898 () Bool)

(assert (=> b!1295946 (=> (not res!860898) (not e!739588))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1295946 (= res!860898 (not (validKeyInArray!0 (select (arr!41526 _keys!1741) from!2144))))))

(declare-fun mapIsEmpty!53312 () Bool)

(assert (=> mapIsEmpty!53312 mapRes!53312))

(declare-fun b!1295947 () Bool)

(declare-fun res!860905 () Bool)

(assert (=> b!1295947 (=> (not res!860905) (not e!739588))))

(declare-fun minValue!1387 () V!51105)

(declare-fun zeroValue!1387 () V!51105)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!5029 (array!86059 array!86057 (_ BitVec 32) (_ BitVec 32) V!51105 V!51105 (_ BitVec 32) Int) ListLongMap!19973)

(assert (=> b!1295947 (= res!860905 (contains!8133 (getCurrentListMap!5029 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1295948 () Bool)

(declare-fun res!860901 () Bool)

(assert (=> b!1295948 (=> (not res!860901) (not e!739588))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86059 (_ BitVec 32)) Bool)

(assert (=> b!1295948 (= res!860901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1295949 () Bool)

(declare-fun res!860903 () Bool)

(assert (=> b!1295949 (=> (not res!860903) (not e!739588))))

(assert (=> b!1295949 (= res!860903 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42077 _keys!1741))))))

(declare-fun b!1295950 () Bool)

(declare-fun res!860902 () Bool)

(assert (=> b!1295950 (=> (not res!860902) (not e!739588))))

(assert (=> b!1295950 (= res!860902 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42077 _keys!1741))))))

(assert (= (and start!109596 res!860899) b!1295944))

(assert (= (and b!1295944 res!860904) b!1295948))

(assert (= (and b!1295948 res!860901) b!1295942))

(assert (= (and b!1295942 res!860900) b!1295950))

(assert (= (and b!1295950 res!860902) b!1295947))

(assert (= (and b!1295947 res!860905) b!1295949))

(assert (= (and b!1295949 res!860903) b!1295946))

(assert (= (and b!1295946 res!860898) b!1295943))

(assert (= (and b!1295941 condMapEmpty!53312) mapIsEmpty!53312))

(assert (= (and b!1295941 (not condMapEmpty!53312)) mapNonEmpty!53312))

(get-info :version)

(assert (= (and mapNonEmpty!53312 ((_ is ValueCellFull!16352) mapValue!53312)) b!1295945))

(assert (= (and b!1295941 ((_ is ValueCellFull!16352) mapDefault!53312)) b!1295940))

(assert (= start!109596 b!1295941))

(declare-fun m!1188405 () Bool)

(assert (=> b!1295947 m!1188405))

(assert (=> b!1295947 m!1188405))

(declare-fun m!1188407 () Bool)

(assert (=> b!1295947 m!1188407))

(declare-fun m!1188409 () Bool)

(assert (=> mapNonEmpty!53312 m!1188409))

(declare-fun m!1188411 () Bool)

(assert (=> b!1295943 m!1188411))

(declare-fun m!1188413 () Bool)

(assert (=> b!1295943 m!1188413))

(declare-fun m!1188415 () Bool)

(assert (=> start!109596 m!1188415))

(declare-fun m!1188417 () Bool)

(assert (=> start!109596 m!1188417))

(declare-fun m!1188419 () Bool)

(assert (=> start!109596 m!1188419))

(declare-fun m!1188421 () Bool)

(assert (=> b!1295946 m!1188421))

(assert (=> b!1295946 m!1188421))

(declare-fun m!1188423 () Bool)

(assert (=> b!1295946 m!1188423))

(declare-fun m!1188425 () Bool)

(assert (=> b!1295948 m!1188425))

(declare-fun m!1188427 () Bool)

(assert (=> b!1295942 m!1188427))

(check-sat b_and!46953 (not b!1295946) (not b!1295948) (not b!1295947) (not b_next!28861) (not b!1295942) (not mapNonEmpty!53312) (not b!1295943) tp_is_empty!34501 (not start!109596))
(check-sat b_and!46953 (not b_next!28861))
