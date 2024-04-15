; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109240 () Bool)

(assert start!109240)

(declare-fun b_free!28729 () Bool)

(declare-fun b_next!28729 () Bool)

(assert (=> start!109240 (= b_free!28729 (not b_next!28729))))

(declare-fun tp!101307 () Bool)

(declare-fun b_and!46801 () Bool)

(assert (=> start!109240 (= tp!101307 b_and!46801)))

(declare-fun b!1292285 () Bool)

(declare-fun res!858664 () Bool)

(declare-fun e!737616 () Bool)

(assert (=> b!1292285 (=> (not res!858664) (not e!737616))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!85655 0))(
  ( (array!85656 (arr!41329 (Array (_ BitVec 32) (_ BitVec 64))) (size!41881 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85655)

(assert (=> b!1292285 (= res!858664 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41881 _keys!1741))))))

(declare-fun mapNonEmpty!53114 () Bool)

(declare-fun mapRes!53114 () Bool)

(declare-fun tp!101306 () Bool)

(declare-fun e!737612 () Bool)

(assert (=> mapNonEmpty!53114 (= mapRes!53114 (and tp!101306 e!737612))))

(declare-datatypes ((V!50929 0))(
  ( (V!50930 (val!17259 Int)) )
))
(declare-datatypes ((ValueCell!16286 0))(
  ( (ValueCellFull!16286 (v!19861 V!50929)) (EmptyCell!16286) )
))
(declare-fun mapRest!53114 () (Array (_ BitVec 32) ValueCell!16286))

(declare-fun mapValue!53114 () ValueCell!16286)

(declare-fun mapKey!53114 () (_ BitVec 32))

(declare-datatypes ((array!85657 0))(
  ( (array!85658 (arr!41330 (Array (_ BitVec 32) ValueCell!16286)) (size!41882 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85657)

(assert (=> mapNonEmpty!53114 (= (arr!41330 _values!1445) (store mapRest!53114 mapKey!53114 mapValue!53114))))

(declare-fun b!1292286 () Bool)

(assert (=> b!1292286 (= e!737616 (not true))))

(declare-datatypes ((tuple2!22242 0))(
  ( (tuple2!22243 (_1!11132 (_ BitVec 64)) (_2!11132 V!50929)) )
))
(declare-datatypes ((List!29394 0))(
  ( (Nil!29391) (Cons!29390 (h!30599 tuple2!22242) (t!42950 List!29394)) )
))
(declare-datatypes ((ListLongMap!19899 0))(
  ( (ListLongMap!19900 (toList!9965 List!29394)) )
))
(declare-fun contains!8013 (ListLongMap!19899 (_ BitVec 64)) Bool)

(assert (=> b!1292286 (not (contains!8013 (ListLongMap!19900 Nil!29391) k0!1205))))

(declare-datatypes ((Unit!42616 0))(
  ( (Unit!42617) )
))
(declare-fun lt!579151 () Unit!42616)

(declare-fun emptyContainsNothing!105 ((_ BitVec 64)) Unit!42616)

(assert (=> b!1292286 (= lt!579151 (emptyContainsNothing!105 k0!1205))))

(declare-fun res!858662 () Bool)

(assert (=> start!109240 (=> (not res!858662) (not e!737616))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109240 (= res!858662 (validMask!0 mask!2175))))

(assert (=> start!109240 e!737616))

(declare-fun tp_is_empty!34369 () Bool)

(assert (=> start!109240 tp_is_empty!34369))

(assert (=> start!109240 true))

(declare-fun e!737615 () Bool)

(declare-fun array_inv!31475 (array!85657) Bool)

(assert (=> start!109240 (and (array_inv!31475 _values!1445) e!737615)))

(declare-fun array_inv!31476 (array!85655) Bool)

(assert (=> start!109240 (array_inv!31476 _keys!1741)))

(assert (=> start!109240 tp!101307))

(declare-fun b!1292287 () Bool)

(assert (=> b!1292287 (= e!737612 tp_is_empty!34369)))

(declare-fun b!1292288 () Bool)

(declare-fun e!737614 () Bool)

(assert (=> b!1292288 (= e!737614 tp_is_empty!34369)))

(declare-fun b!1292289 () Bool)

(declare-fun res!858659 () Bool)

(assert (=> b!1292289 (=> (not res!858659) (not e!737616))))

(declare-fun minValue!1387 () V!50929)

(declare-fun zeroValue!1387 () V!50929)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4907 (array!85655 array!85657 (_ BitVec 32) (_ BitVec 32) V!50929 V!50929 (_ BitVec 32) Int) ListLongMap!19899)

(assert (=> b!1292289 (= res!858659 (contains!8013 (getCurrentListMap!4907 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1292290 () Bool)

(declare-fun res!858665 () Bool)

(assert (=> b!1292290 (=> (not res!858665) (not e!737616))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85655 (_ BitVec 32)) Bool)

(assert (=> b!1292290 (= res!858665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1292291 () Bool)

(assert (=> b!1292291 (= e!737615 (and e!737614 mapRes!53114))))

(declare-fun condMapEmpty!53114 () Bool)

(declare-fun mapDefault!53114 () ValueCell!16286)

(assert (=> b!1292291 (= condMapEmpty!53114 (= (arr!41330 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16286)) mapDefault!53114)))))

(declare-fun b!1292292 () Bool)

(declare-fun res!858663 () Bool)

(assert (=> b!1292292 (=> (not res!858663) (not e!737616))))

(declare-datatypes ((List!29395 0))(
  ( (Nil!29392) (Cons!29391 (h!30600 (_ BitVec 64)) (t!42951 List!29395)) )
))
(declare-fun arrayNoDuplicates!0 (array!85655 (_ BitVec 32) List!29395) Bool)

(assert (=> b!1292292 (= res!858663 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29392))))

(declare-fun b!1292293 () Bool)

(declare-fun res!858660 () Bool)

(assert (=> b!1292293 (=> (not res!858660) (not e!737616))))

(assert (=> b!1292293 (= res!858660 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41881 _keys!1741))))))

(declare-fun mapIsEmpty!53114 () Bool)

(assert (=> mapIsEmpty!53114 mapRes!53114))

(declare-fun b!1292294 () Bool)

(declare-fun res!858666 () Bool)

(assert (=> b!1292294 (=> (not res!858666) (not e!737616))))

(assert (=> b!1292294 (= res!858666 (and (= (size!41882 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41881 _keys!1741) (size!41882 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1292295 () Bool)

(declare-fun res!858661 () Bool)

(assert (=> b!1292295 (=> (not res!858661) (not e!737616))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1292295 (= res!858661 (not (validKeyInArray!0 (select (arr!41329 _keys!1741) from!2144))))))

(assert (= (and start!109240 res!858662) b!1292294))

(assert (= (and b!1292294 res!858666) b!1292290))

(assert (= (and b!1292290 res!858665) b!1292292))

(assert (= (and b!1292292 res!858663) b!1292293))

(assert (= (and b!1292293 res!858660) b!1292289))

(assert (= (and b!1292289 res!858659) b!1292285))

(assert (= (and b!1292285 res!858664) b!1292295))

(assert (= (and b!1292295 res!858661) b!1292286))

(assert (= (and b!1292291 condMapEmpty!53114) mapIsEmpty!53114))

(assert (= (and b!1292291 (not condMapEmpty!53114)) mapNonEmpty!53114))

(get-info :version)

(assert (= (and mapNonEmpty!53114 ((_ is ValueCellFull!16286) mapValue!53114)) b!1292287))

(assert (= (and b!1292291 ((_ is ValueCellFull!16286) mapDefault!53114)) b!1292288))

(assert (= start!109240 b!1292291))

(declare-fun m!1184427 () Bool)

(assert (=> b!1292290 m!1184427))

(declare-fun m!1184429 () Bool)

(assert (=> b!1292289 m!1184429))

(assert (=> b!1292289 m!1184429))

(declare-fun m!1184431 () Bool)

(assert (=> b!1292289 m!1184431))

(declare-fun m!1184433 () Bool)

(assert (=> b!1292292 m!1184433))

(declare-fun m!1184435 () Bool)

(assert (=> b!1292295 m!1184435))

(assert (=> b!1292295 m!1184435))

(declare-fun m!1184437 () Bool)

(assert (=> b!1292295 m!1184437))

(declare-fun m!1184439 () Bool)

(assert (=> mapNonEmpty!53114 m!1184439))

(declare-fun m!1184441 () Bool)

(assert (=> b!1292286 m!1184441))

(declare-fun m!1184443 () Bool)

(assert (=> b!1292286 m!1184443))

(declare-fun m!1184445 () Bool)

(assert (=> start!109240 m!1184445))

(declare-fun m!1184447 () Bool)

(assert (=> start!109240 m!1184447))

(declare-fun m!1184449 () Bool)

(assert (=> start!109240 m!1184449))

(check-sat (not start!109240) (not b!1292295) (not b!1292292) (not b!1292289) (not b!1292290) (not b!1292286) b_and!46801 (not mapNonEmpty!53114) (not b_next!28729) tp_is_empty!34369)
(check-sat b_and!46801 (not b_next!28729))
