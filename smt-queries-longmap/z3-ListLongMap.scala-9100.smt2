; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109384 () Bool)

(assert start!109384)

(declare-fun b_free!28873 () Bool)

(declare-fun b_next!28873 () Bool)

(assert (=> start!109384 (= b_free!28873 (not b_next!28873))))

(declare-fun tp!101738 () Bool)

(declare-fun b_and!46945 () Bool)

(assert (=> start!109384 (= tp!101738 b_and!46945)))

(declare-fun b!1294771 () Bool)

(declare-fun res!860504 () Bool)

(declare-fun e!738806 () Bool)

(assert (=> b!1294771 (=> (not res!860504) (not e!738806))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85939 0))(
  ( (array!85940 (arr!41471 (Array (_ BitVec 32) (_ BitVec 64))) (size!42023 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85939)

(assert (=> b!1294771 (= res!860504 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42023 _keys!1741))))))

(declare-fun b!1294772 () Bool)

(declare-fun res!860503 () Bool)

(assert (=> b!1294772 (=> (not res!860503) (not e!738806))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1294772 (= res!860503 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42023 _keys!1741))))))

(declare-fun b!1294773 () Bool)

(declare-fun e!738802 () Bool)

(declare-fun tp_is_empty!34513 () Bool)

(assert (=> b!1294773 (= e!738802 tp_is_empty!34513)))

(declare-fun b!1294774 () Bool)

(declare-fun e!738803 () Bool)

(declare-fun e!738804 () Bool)

(declare-fun mapRes!53330 () Bool)

(assert (=> b!1294774 (= e!738803 (and e!738804 mapRes!53330))))

(declare-fun condMapEmpty!53330 () Bool)

(declare-datatypes ((V!51121 0))(
  ( (V!51122 (val!17331 Int)) )
))
(declare-datatypes ((ValueCell!16358 0))(
  ( (ValueCellFull!16358 (v!19933 V!51121)) (EmptyCell!16358) )
))
(declare-datatypes ((array!85941 0))(
  ( (array!85942 (arr!41472 (Array (_ BitVec 32) ValueCell!16358)) (size!42024 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85941)

(declare-fun mapDefault!53330 () ValueCell!16358)

(assert (=> b!1294774 (= condMapEmpty!53330 (= (arr!41472 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16358)) mapDefault!53330)))))

(declare-fun b!1294775 () Bool)

(declare-fun e!738807 () Bool)

(assert (=> b!1294775 (= e!738807 true)))

(declare-fun minValue!1387 () V!51121)

(declare-fun zeroValue!1387 () V!51121)

(declare-fun lt!579576 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22362 0))(
  ( (tuple2!22363 (_1!11192 (_ BitVec 64)) (_2!11192 V!51121)) )
))
(declare-datatypes ((List!29500 0))(
  ( (Nil!29497) (Cons!29496 (h!30705 tuple2!22362) (t!43056 List!29500)) )
))
(declare-datatypes ((ListLongMap!20019 0))(
  ( (ListLongMap!20020 (toList!10025 List!29500)) )
))
(declare-fun contains!8073 (ListLongMap!20019 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!6077 (array!85939 array!85941 (_ BitVec 32) (_ BitVec 32) V!51121 V!51121 (_ BitVec 32) Int) ListLongMap!20019)

(assert (=> b!1294775 (= lt!579576 (contains!8073 (getCurrentListMapNoExtraKeys!6077 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1294776 () Bool)

(assert (=> b!1294776 (= e!738804 tp_is_empty!34513)))

(declare-fun res!860499 () Bool)

(assert (=> start!109384 (=> (not res!860499) (not e!738806))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109384 (= res!860499 (validMask!0 mask!2175))))

(assert (=> start!109384 e!738806))

(assert (=> start!109384 tp_is_empty!34513))

(assert (=> start!109384 true))

(declare-fun array_inv!31567 (array!85941) Bool)

(assert (=> start!109384 (and (array_inv!31567 _values!1445) e!738803)))

(declare-fun array_inv!31568 (array!85939) Bool)

(assert (=> start!109384 (array_inv!31568 _keys!1741)))

(assert (=> start!109384 tp!101738))

(declare-fun b!1294777 () Bool)

(declare-fun res!860497 () Bool)

(assert (=> b!1294777 (=> (not res!860497) (not e!738806))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1294777 (= res!860497 (not (validKeyInArray!0 (select (arr!41471 _keys!1741) from!2144))))))

(declare-fun b!1294778 () Bool)

(declare-fun res!860505 () Bool)

(assert (=> b!1294778 (=> (not res!860505) (not e!738806))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85939 (_ BitVec 32)) Bool)

(assert (=> b!1294778 (= res!860505 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1294779 () Bool)

(declare-fun res!860498 () Bool)

(assert (=> b!1294779 (=> (not res!860498) (not e!738806))))

(declare-fun getCurrentListMap!4953 (array!85939 array!85941 (_ BitVec 32) (_ BitVec 32) V!51121 V!51121 (_ BitVec 32) Int) ListLongMap!20019)

(assert (=> b!1294779 (= res!860498 (contains!8073 (getCurrentListMap!4953 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!53330 () Bool)

(declare-fun tp!101739 () Bool)

(assert (=> mapNonEmpty!53330 (= mapRes!53330 (and tp!101739 e!738802))))

(declare-fun mapKey!53330 () (_ BitVec 32))

(declare-fun mapRest!53330 () (Array (_ BitVec 32) ValueCell!16358))

(declare-fun mapValue!53330 () ValueCell!16358)

(assert (=> mapNonEmpty!53330 (= (arr!41472 _values!1445) (store mapRest!53330 mapKey!53330 mapValue!53330))))

(declare-fun mapIsEmpty!53330 () Bool)

(assert (=> mapIsEmpty!53330 mapRes!53330))

(declare-fun b!1294780 () Bool)

(declare-fun res!860502 () Bool)

(assert (=> b!1294780 (=> (not res!860502) (not e!738806))))

(assert (=> b!1294780 (= res!860502 (and (= (size!42024 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42023 _keys!1741) (size!42024 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1294781 () Bool)

(assert (=> b!1294781 (= e!738806 (not e!738807))))

(declare-fun res!860500 () Bool)

(assert (=> b!1294781 (=> res!860500 e!738807)))

(assert (=> b!1294781 (= res!860500 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1294781 (not (contains!8073 (ListLongMap!20020 Nil!29497) k0!1205))))

(declare-datatypes ((Unit!42722 0))(
  ( (Unit!42723) )
))
(declare-fun lt!579577 () Unit!42722)

(declare-fun emptyContainsNothing!154 ((_ BitVec 64)) Unit!42722)

(assert (=> b!1294781 (= lt!579577 (emptyContainsNothing!154 k0!1205))))

(declare-fun b!1294782 () Bool)

(declare-fun res!860501 () Bool)

(assert (=> b!1294782 (=> (not res!860501) (not e!738806))))

(declare-datatypes ((List!29501 0))(
  ( (Nil!29498) (Cons!29497 (h!30706 (_ BitVec 64)) (t!43057 List!29501)) )
))
(declare-fun arrayNoDuplicates!0 (array!85939 (_ BitVec 32) List!29501) Bool)

(assert (=> b!1294782 (= res!860501 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29498))))

(assert (= (and start!109384 res!860499) b!1294780))

(assert (= (and b!1294780 res!860502) b!1294778))

(assert (= (and b!1294778 res!860505) b!1294782))

(assert (= (and b!1294782 res!860501) b!1294771))

(assert (= (and b!1294771 res!860504) b!1294779))

(assert (= (and b!1294779 res!860498) b!1294772))

(assert (= (and b!1294772 res!860503) b!1294777))

(assert (= (and b!1294777 res!860497) b!1294781))

(assert (= (and b!1294781 (not res!860500)) b!1294775))

(assert (= (and b!1294774 condMapEmpty!53330) mapIsEmpty!53330))

(assert (= (and b!1294774 (not condMapEmpty!53330)) mapNonEmpty!53330))

(get-info :version)

(assert (= (and mapNonEmpty!53330 ((_ is ValueCellFull!16358) mapValue!53330)) b!1294773))

(assert (= (and b!1294774 ((_ is ValueCellFull!16358) mapDefault!53330)) b!1294776))

(assert (= start!109384 b!1294774))

(declare-fun m!1186431 () Bool)

(assert (=> b!1294778 m!1186431))

(declare-fun m!1186433 () Bool)

(assert (=> b!1294777 m!1186433))

(assert (=> b!1294777 m!1186433))

(declare-fun m!1186435 () Bool)

(assert (=> b!1294777 m!1186435))

(declare-fun m!1186437 () Bool)

(assert (=> b!1294782 m!1186437))

(declare-fun m!1186439 () Bool)

(assert (=> b!1294779 m!1186439))

(assert (=> b!1294779 m!1186439))

(declare-fun m!1186441 () Bool)

(assert (=> b!1294779 m!1186441))

(declare-fun m!1186443 () Bool)

(assert (=> b!1294781 m!1186443))

(declare-fun m!1186445 () Bool)

(assert (=> b!1294781 m!1186445))

(declare-fun m!1186447 () Bool)

(assert (=> b!1294775 m!1186447))

(assert (=> b!1294775 m!1186447))

(declare-fun m!1186449 () Bool)

(assert (=> b!1294775 m!1186449))

(declare-fun m!1186451 () Bool)

(assert (=> start!109384 m!1186451))

(declare-fun m!1186453 () Bool)

(assert (=> start!109384 m!1186453))

(declare-fun m!1186455 () Bool)

(assert (=> start!109384 m!1186455))

(declare-fun m!1186457 () Bool)

(assert (=> mapNonEmpty!53330 m!1186457))

(check-sat (not b!1294775) (not b!1294777) (not b!1294781) (not b!1294778) (not b_next!28873) b_and!46945 tp_is_empty!34513 (not start!109384) (not b!1294779) (not b!1294782) (not mapNonEmpty!53330))
(check-sat b_and!46945 (not b_next!28873))
