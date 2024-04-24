; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109458 () Bool)

(assert start!109458)

(declare-fun b_free!28723 () Bool)

(declare-fun b_next!28723 () Bool)

(assert (=> start!109458 (= b_free!28723 (not b_next!28723))))

(declare-fun tp!101287 () Bool)

(declare-fun b_and!46815 () Bool)

(assert (=> start!109458 (= tp!101287 b_and!46815)))

(declare-fun res!859134 () Bool)

(declare-fun e!738446 () Bool)

(assert (=> start!109458 (=> (not res!859134) (not e!738446))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109458 (= res!859134 (validMask!0 mask!2175))))

(assert (=> start!109458 e!738446))

(declare-fun tp_is_empty!34363 () Bool)

(assert (=> start!109458 tp_is_empty!34363))

(assert (=> start!109458 true))

(declare-datatypes ((V!50921 0))(
  ( (V!50922 (val!17256 Int)) )
))
(declare-datatypes ((ValueCell!16283 0))(
  ( (ValueCellFull!16283 (v!19854 V!50921)) (EmptyCell!16283) )
))
(declare-datatypes ((array!85791 0))(
  ( (array!85792 (arr!41392 (Array (_ BitVec 32) ValueCell!16283)) (size!41943 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85791)

(declare-fun e!738444 () Bool)

(declare-fun array_inv!31591 (array!85791) Bool)

(assert (=> start!109458 (and (array_inv!31591 _values!1445) e!738444)))

(declare-datatypes ((array!85793 0))(
  ( (array!85794 (arr!41393 (Array (_ BitVec 32) (_ BitVec 64))) (size!41944 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85793)

(declare-fun array_inv!31592 (array!85793) Bool)

(assert (=> start!109458 (array_inv!31592 _keys!1741)))

(assert (=> start!109458 tp!101287))

(declare-fun b!1293555 () Bool)

(declare-fun res!859137 () Bool)

(assert (=> b!1293555 (=> (not res!859137) (not e!738446))))

(declare-datatypes ((List!29381 0))(
  ( (Nil!29378) (Cons!29377 (h!30595 (_ BitVec 64)) (t!42937 List!29381)) )
))
(declare-fun arrayNoDuplicates!0 (array!85793 (_ BitVec 32) List!29381) Bool)

(assert (=> b!1293555 (= res!859137 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29378))))

(declare-fun b!1293556 () Bool)

(declare-fun res!859138 () Bool)

(assert (=> b!1293556 (=> (not res!859138) (not e!738446))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1293556 (= res!859138 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41944 _keys!1741))))))

(declare-fun b!1293557 () Bool)

(declare-fun res!859140 () Bool)

(assert (=> b!1293557 (=> (not res!859140) (not e!738446))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1293557 (= res!859140 (and (= (size!41943 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41944 _keys!1741) (size!41943 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!53105 () Bool)

(declare-fun mapRes!53105 () Bool)

(declare-fun tp!101288 () Bool)

(declare-fun e!738445 () Bool)

(assert (=> mapNonEmpty!53105 (= mapRes!53105 (and tp!101288 e!738445))))

(declare-fun mapRest!53105 () (Array (_ BitVec 32) ValueCell!16283))

(declare-fun mapValue!53105 () ValueCell!16283)

(declare-fun mapKey!53105 () (_ BitVec 32))

(assert (=> mapNonEmpty!53105 (= (arr!41392 _values!1445) (store mapRest!53105 mapKey!53105 mapValue!53105))))

(declare-fun b!1293558 () Bool)

(declare-fun e!738447 () Bool)

(assert (=> b!1293558 (= e!738444 (and e!738447 mapRes!53105))))

(declare-fun condMapEmpty!53105 () Bool)

(declare-fun mapDefault!53105 () ValueCell!16283)

(assert (=> b!1293558 (= condMapEmpty!53105 (= (arr!41392 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16283)) mapDefault!53105)))))

(declare-fun b!1293559 () Bool)

(declare-fun res!859141 () Bool)

(assert (=> b!1293559 (=> (not res!859141) (not e!738446))))

(assert (=> b!1293559 (= res!859141 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41944 _keys!1741))))))

(declare-fun b!1293560 () Bool)

(assert (=> b!1293560 (= e!738447 tp_is_empty!34363)))

(declare-fun b!1293561 () Bool)

(declare-fun res!859136 () Bool)

(assert (=> b!1293561 (=> (not res!859136) (not e!738446))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1293561 (= res!859136 (not (validKeyInArray!0 (select (arr!41393 _keys!1741) from!2144))))))

(declare-fun b!1293562 () Bool)

(declare-fun res!859135 () Bool)

(assert (=> b!1293562 (=> (not res!859135) (not e!738446))))

(declare-fun minValue!1387 () V!50921)

(declare-fun zeroValue!1387 () V!50921)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22212 0))(
  ( (tuple2!22213 (_1!11117 (_ BitVec 64)) (_2!11117 V!50921)) )
))
(declare-datatypes ((List!29382 0))(
  ( (Nil!29379) (Cons!29378 (h!30596 tuple2!22212) (t!42938 List!29382)) )
))
(declare-datatypes ((ListLongMap!19877 0))(
  ( (ListLongMap!19878 (toList!9954 List!29382)) )
))
(declare-fun contains!8085 (ListLongMap!19877 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4986 (array!85793 array!85791 (_ BitVec 32) (_ BitVec 32) V!50921 V!50921 (_ BitVec 32) Int) ListLongMap!19877)

(assert (=> b!1293562 (= res!859135 (contains!8085 (getCurrentListMap!4986 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1293563 () Bool)

(assert (=> b!1293563 (= e!738446 (not true))))

(assert (=> b!1293563 (not (contains!8085 (ListLongMap!19878 Nil!29379) k0!1205))))

(declare-datatypes ((Unit!42747 0))(
  ( (Unit!42748) )
))
(declare-fun lt!579804 () Unit!42747)

(declare-fun emptyContainsNothing!119 ((_ BitVec 64)) Unit!42747)

(assert (=> b!1293563 (= lt!579804 (emptyContainsNothing!119 k0!1205))))

(declare-fun b!1293564 () Bool)

(assert (=> b!1293564 (= e!738445 tp_is_empty!34363)))

(declare-fun b!1293565 () Bool)

(declare-fun res!859139 () Bool)

(assert (=> b!1293565 (=> (not res!859139) (not e!738446))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85793 (_ BitVec 32)) Bool)

(assert (=> b!1293565 (= res!859139 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!53105 () Bool)

(assert (=> mapIsEmpty!53105 mapRes!53105))

(assert (= (and start!109458 res!859134) b!1293557))

(assert (= (and b!1293557 res!859140) b!1293565))

(assert (= (and b!1293565 res!859139) b!1293555))

(assert (= (and b!1293555 res!859137) b!1293559))

(assert (= (and b!1293559 res!859141) b!1293562))

(assert (= (and b!1293562 res!859135) b!1293556))

(assert (= (and b!1293556 res!859138) b!1293561))

(assert (= (and b!1293561 res!859136) b!1293563))

(assert (= (and b!1293558 condMapEmpty!53105) mapIsEmpty!53105))

(assert (= (and b!1293558 (not condMapEmpty!53105)) mapNonEmpty!53105))

(get-info :version)

(assert (= (and mapNonEmpty!53105 ((_ is ValueCellFull!16283) mapValue!53105)) b!1293564))

(assert (= (and b!1293558 ((_ is ValueCellFull!16283) mapDefault!53105)) b!1293560))

(assert (= start!109458 b!1293558))

(declare-fun m!1186473 () Bool)

(assert (=> start!109458 m!1186473))

(declare-fun m!1186475 () Bool)

(assert (=> start!109458 m!1186475))

(declare-fun m!1186477 () Bool)

(assert (=> start!109458 m!1186477))

(declare-fun m!1186479 () Bool)

(assert (=> b!1293562 m!1186479))

(assert (=> b!1293562 m!1186479))

(declare-fun m!1186481 () Bool)

(assert (=> b!1293562 m!1186481))

(declare-fun m!1186483 () Bool)

(assert (=> mapNonEmpty!53105 m!1186483))

(declare-fun m!1186485 () Bool)

(assert (=> b!1293563 m!1186485))

(declare-fun m!1186487 () Bool)

(assert (=> b!1293563 m!1186487))

(declare-fun m!1186489 () Bool)

(assert (=> b!1293561 m!1186489))

(assert (=> b!1293561 m!1186489))

(declare-fun m!1186491 () Bool)

(assert (=> b!1293561 m!1186491))

(declare-fun m!1186493 () Bool)

(assert (=> b!1293565 m!1186493))

(declare-fun m!1186495 () Bool)

(assert (=> b!1293555 m!1186495))

(check-sat b_and!46815 (not b!1293563) tp_is_empty!34363 (not start!109458) (not b!1293561) (not mapNonEmpty!53105) (not b!1293555) (not b_next!28723) (not b!1293562) (not b!1293565))
(check-sat b_and!46815 (not b_next!28723))
