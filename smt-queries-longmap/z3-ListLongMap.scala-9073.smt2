; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109224 () Bool)

(assert start!109224)

(declare-fun b_free!28713 () Bool)

(declare-fun b_next!28713 () Bool)

(assert (=> start!109224 (= b_free!28713 (not b_next!28713))))

(declare-fun tp!101257 () Bool)

(declare-fun b_and!46803 () Bool)

(assert (=> start!109224 (= tp!101257 b_and!46803)))

(declare-fun b!1292085 () Bool)

(declare-fun e!737521 () Bool)

(declare-fun e!737523 () Bool)

(declare-fun mapRes!53090 () Bool)

(assert (=> b!1292085 (= e!737521 (and e!737523 mapRes!53090))))

(declare-fun condMapEmpty!53090 () Bool)

(declare-datatypes ((V!50907 0))(
  ( (V!50908 (val!17251 Int)) )
))
(declare-datatypes ((ValueCell!16278 0))(
  ( (ValueCellFull!16278 (v!19854 V!50907)) (EmptyCell!16278) )
))
(declare-datatypes ((array!85740 0))(
  ( (array!85741 (arr!41371 (Array (_ BitVec 32) ValueCell!16278)) (size!41921 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85740)

(declare-fun mapDefault!53090 () ValueCell!16278)

(assert (=> b!1292085 (= condMapEmpty!53090 (= (arr!41371 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16278)) mapDefault!53090)))))

(declare-fun b!1292086 () Bool)

(declare-fun res!858500 () Bool)

(declare-fun e!737524 () Bool)

(assert (=> b!1292086 (=> (not res!858500) (not e!737524))))

(declare-datatypes ((array!85742 0))(
  ( (array!85743 (arr!41372 (Array (_ BitVec 32) (_ BitVec 64))) (size!41922 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85742)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85742 (_ BitVec 32)) Bool)

(assert (=> b!1292086 (= res!858500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1292087 () Bool)

(declare-fun res!858501 () Bool)

(assert (=> b!1292087 (=> (not res!858501) (not e!737524))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1292087 (= res!858501 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41922 _keys!1741))))))

(declare-fun b!1292088 () Bool)

(declare-fun res!858497 () Bool)

(assert (=> b!1292088 (=> (not res!858497) (not e!737524))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1292088 (= res!858497 (not (validKeyInArray!0 (select (arr!41372 _keys!1741) from!2144))))))

(declare-fun b!1292089 () Bool)

(declare-fun e!737525 () Bool)

(declare-fun tp_is_empty!34353 () Bool)

(assert (=> b!1292089 (= e!737525 tp_is_empty!34353)))

(declare-fun mapNonEmpty!53090 () Bool)

(declare-fun tp!101258 () Bool)

(assert (=> mapNonEmpty!53090 (= mapRes!53090 (and tp!101258 e!737525))))

(declare-fun mapRest!53090 () (Array (_ BitVec 32) ValueCell!16278))

(declare-fun mapKey!53090 () (_ BitVec 32))

(declare-fun mapValue!53090 () ValueCell!16278)

(assert (=> mapNonEmpty!53090 (= (arr!41371 _values!1445) (store mapRest!53090 mapKey!53090 mapValue!53090))))

(declare-fun b!1292090 () Bool)

(assert (=> b!1292090 (= e!737524 (not true))))

(declare-datatypes ((tuple2!22190 0))(
  ( (tuple2!22191 (_1!11106 (_ BitVec 64)) (_2!11106 V!50907)) )
))
(declare-datatypes ((List!29343 0))(
  ( (Nil!29340) (Cons!29339 (h!30548 tuple2!22190) (t!42907 List!29343)) )
))
(declare-datatypes ((ListLongMap!19847 0))(
  ( (ListLongMap!19848 (toList!9939 List!29343)) )
))
(declare-fun contains!8057 (ListLongMap!19847 (_ BitVec 64)) Bool)

(assert (=> b!1292090 (not (contains!8057 (ListLongMap!19848 Nil!29340) k0!1205))))

(declare-datatypes ((Unit!42788 0))(
  ( (Unit!42789) )
))
(declare-fun lt!579305 () Unit!42788)

(declare-fun emptyContainsNothing!116 ((_ BitVec 64)) Unit!42788)

(assert (=> b!1292090 (= lt!579305 (emptyContainsNothing!116 k0!1205))))

(declare-fun mapIsEmpty!53090 () Bool)

(assert (=> mapIsEmpty!53090 mapRes!53090))

(declare-fun b!1292091 () Bool)

(declare-fun res!858499 () Bool)

(assert (=> b!1292091 (=> (not res!858499) (not e!737524))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1292091 (= res!858499 (and (= (size!41921 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41922 _keys!1741) (size!41921 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1292092 () Bool)

(declare-fun res!858494 () Bool)

(assert (=> b!1292092 (=> (not res!858494) (not e!737524))))

(declare-fun minValue!1387 () V!50907)

(declare-fun zeroValue!1387 () V!50907)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4985 (array!85742 array!85740 (_ BitVec 32) (_ BitVec 32) V!50907 V!50907 (_ BitVec 32) Int) ListLongMap!19847)

(assert (=> b!1292092 (= res!858494 (contains!8057 (getCurrentListMap!4985 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!858498 () Bool)

(assert (=> start!109224 (=> (not res!858498) (not e!737524))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109224 (= res!858498 (validMask!0 mask!2175))))

(assert (=> start!109224 e!737524))

(assert (=> start!109224 tp_is_empty!34353))

(assert (=> start!109224 true))

(declare-fun array_inv!31347 (array!85740) Bool)

(assert (=> start!109224 (and (array_inv!31347 _values!1445) e!737521)))

(declare-fun array_inv!31348 (array!85742) Bool)

(assert (=> start!109224 (array_inv!31348 _keys!1741)))

(assert (=> start!109224 tp!101257))

(declare-fun b!1292093 () Bool)

(declare-fun res!858496 () Bool)

(assert (=> b!1292093 (=> (not res!858496) (not e!737524))))

(assert (=> b!1292093 (= res!858496 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41922 _keys!1741))))))

(declare-fun b!1292094 () Bool)

(assert (=> b!1292094 (= e!737523 tp_is_empty!34353)))

(declare-fun b!1292095 () Bool)

(declare-fun res!858495 () Bool)

(assert (=> b!1292095 (=> (not res!858495) (not e!737524))))

(declare-datatypes ((List!29344 0))(
  ( (Nil!29341) (Cons!29340 (h!30549 (_ BitVec 64)) (t!42908 List!29344)) )
))
(declare-fun arrayNoDuplicates!0 (array!85742 (_ BitVec 32) List!29344) Bool)

(assert (=> b!1292095 (= res!858495 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29341))))

(assert (= (and start!109224 res!858498) b!1292091))

(assert (= (and b!1292091 res!858499) b!1292086))

(assert (= (and b!1292086 res!858500) b!1292095))

(assert (= (and b!1292095 res!858495) b!1292093))

(assert (= (and b!1292093 res!858496) b!1292092))

(assert (= (and b!1292092 res!858494) b!1292087))

(assert (= (and b!1292087 res!858501) b!1292088))

(assert (= (and b!1292088 res!858497) b!1292090))

(assert (= (and b!1292085 condMapEmpty!53090) mapIsEmpty!53090))

(assert (= (and b!1292085 (not condMapEmpty!53090)) mapNonEmpty!53090))

(get-info :version)

(assert (= (and mapNonEmpty!53090 ((_ is ValueCellFull!16278) mapValue!53090)) b!1292089))

(assert (= (and b!1292085 ((_ is ValueCellFull!16278) mapDefault!53090)) b!1292094))

(assert (= start!109224 b!1292085))

(declare-fun m!1184735 () Bool)

(assert (=> b!1292088 m!1184735))

(assert (=> b!1292088 m!1184735))

(declare-fun m!1184737 () Bool)

(assert (=> b!1292088 m!1184737))

(declare-fun m!1184739 () Bool)

(assert (=> b!1292090 m!1184739))

(declare-fun m!1184741 () Bool)

(assert (=> b!1292090 m!1184741))

(declare-fun m!1184743 () Bool)

(assert (=> b!1292086 m!1184743))

(declare-fun m!1184745 () Bool)

(assert (=> mapNonEmpty!53090 m!1184745))

(declare-fun m!1184747 () Bool)

(assert (=> b!1292095 m!1184747))

(declare-fun m!1184749 () Bool)

(assert (=> b!1292092 m!1184749))

(assert (=> b!1292092 m!1184749))

(declare-fun m!1184751 () Bool)

(assert (=> b!1292092 m!1184751))

(declare-fun m!1184753 () Bool)

(assert (=> start!109224 m!1184753))

(declare-fun m!1184755 () Bool)

(assert (=> start!109224 m!1184755))

(declare-fun m!1184757 () Bool)

(assert (=> start!109224 m!1184757))

(check-sat (not b!1292088) (not mapNonEmpty!53090) (not b!1292090) (not b!1292095) (not b!1292092) b_and!46803 (not b_next!28713) (not b!1292086) (not start!109224) tp_is_empty!34353)
(check-sat b_and!46803 (not b_next!28713))
