; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109344 () Bool)

(assert start!109344)

(declare-fun b_free!28609 () Bool)

(declare-fun b_next!28609 () Bool)

(assert (=> start!109344 (= b_free!28609 (not b_next!28609))))

(declare-fun tp!100946 () Bool)

(declare-fun b_and!46701 () Bool)

(assert (=> start!109344 (= tp!100946 b_and!46701)))

(declare-fun mapIsEmpty!52934 () Bool)

(declare-fun mapRes!52934 () Bool)

(assert (=> mapIsEmpty!52934 mapRes!52934))

(declare-fun b!1291550 () Bool)

(declare-fun res!857650 () Bool)

(declare-fun e!737466 () Bool)

(assert (=> b!1291550 (=> (not res!857650) (not e!737466))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!85577 0))(
  ( (array!85578 (arr!41285 (Array (_ BitVec 32) (_ BitVec 64))) (size!41836 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85577)

(assert (=> b!1291550 (= res!857650 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41836 _keys!1741))))))

(declare-fun b!1291551 () Bool)

(declare-fun e!737468 () Bool)

(assert (=> b!1291551 (= e!737466 (not e!737468))))

(declare-fun res!857646 () Bool)

(assert (=> b!1291551 (=> res!857646 e!737468)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1291551 (= res!857646 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!50769 0))(
  ( (V!50770 (val!17199 Int)) )
))
(declare-datatypes ((tuple2!22112 0))(
  ( (tuple2!22113 (_1!11067 (_ BitVec 64)) (_2!11067 V!50769)) )
))
(declare-datatypes ((List!29290 0))(
  ( (Nil!29287) (Cons!29286 (h!30504 tuple2!22112) (t!42846 List!29290)) )
))
(declare-datatypes ((ListLongMap!19777 0))(
  ( (ListLongMap!19778 (toList!9904 List!29290)) )
))
(declare-fun contains!8035 (ListLongMap!19777 (_ BitVec 64)) Bool)

(assert (=> b!1291551 (not (contains!8035 (ListLongMap!19778 Nil!29287) k0!1205))))

(declare-datatypes ((Unit!42657 0))(
  ( (Unit!42658) )
))
(declare-fun lt!579011 () Unit!42657)

(declare-fun emptyContainsNothing!79 ((_ BitVec 64)) Unit!42657)

(assert (=> b!1291551 (= lt!579011 (emptyContainsNothing!79 k0!1205))))

(declare-fun b!1291552 () Bool)

(declare-fun res!857648 () Bool)

(assert (=> b!1291552 (=> (not res!857648) (not e!737466))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1291552 (= res!857648 (not (validKeyInArray!0 (select (arr!41285 _keys!1741) from!2144))))))

(declare-fun res!857647 () Bool)

(assert (=> start!109344 (=> (not res!857647) (not e!737466))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109344 (= res!857647 (validMask!0 mask!2175))))

(assert (=> start!109344 e!737466))

(declare-fun tp_is_empty!34249 () Bool)

(assert (=> start!109344 tp_is_empty!34249))

(assert (=> start!109344 true))

(declare-datatypes ((ValueCell!16226 0))(
  ( (ValueCellFull!16226 (v!19797 V!50769)) (EmptyCell!16226) )
))
(declare-datatypes ((array!85579 0))(
  ( (array!85580 (arr!41286 (Array (_ BitVec 32) ValueCell!16226)) (size!41837 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85579)

(declare-fun e!737465 () Bool)

(declare-fun array_inv!31511 (array!85579) Bool)

(assert (=> start!109344 (and (array_inv!31511 _values!1445) e!737465)))

(declare-fun array_inv!31512 (array!85577) Bool)

(assert (=> start!109344 (array_inv!31512 _keys!1741)))

(assert (=> start!109344 tp!100946))

(declare-fun b!1291553 () Bool)

(declare-fun e!737464 () Bool)

(assert (=> b!1291553 (= e!737464 tp_is_empty!34249)))

(declare-fun mapNonEmpty!52934 () Bool)

(declare-fun tp!100945 () Bool)

(declare-fun e!737469 () Bool)

(assert (=> mapNonEmpty!52934 (= mapRes!52934 (and tp!100945 e!737469))))

(declare-fun mapRest!52934 () (Array (_ BitVec 32) ValueCell!16226))

(declare-fun mapKey!52934 () (_ BitVec 32))

(declare-fun mapValue!52934 () ValueCell!16226)

(assert (=> mapNonEmpty!52934 (= (arr!41286 _values!1445) (store mapRest!52934 mapKey!52934 mapValue!52934))))

(declare-fun b!1291554 () Bool)

(declare-fun res!857645 () Bool)

(assert (=> b!1291554 (=> (not res!857645) (not e!737466))))

(assert (=> b!1291554 (= res!857645 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41836 _keys!1741))))))

(declare-fun b!1291555 () Bool)

(assert (=> b!1291555 (= e!737465 (and e!737464 mapRes!52934))))

(declare-fun condMapEmpty!52934 () Bool)

(declare-fun mapDefault!52934 () ValueCell!16226)

(assert (=> b!1291555 (= condMapEmpty!52934 (= (arr!41286 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16226)) mapDefault!52934)))))

(declare-fun b!1291556 () Bool)

(assert (=> b!1291556 (= e!737468 (bvsle from!2144 (size!41836 _keys!1741)))))

(declare-fun lt!579012 () ListLongMap!19777)

(declare-fun minValue!1387 () V!50769)

(declare-fun +!4405 (ListLongMap!19777 tuple2!22112) ListLongMap!19777)

(assert (=> b!1291556 (not (contains!8035 (+!4405 lt!579012 (tuple2!22113 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!579010 () Unit!42657)

(declare-fun addStillNotContains!381 (ListLongMap!19777 (_ BitVec 64) V!50769 (_ BitVec 64)) Unit!42657)

(assert (=> b!1291556 (= lt!579010 (addStillNotContains!381 lt!579012 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun zeroValue!1387 () V!50769)

(assert (=> b!1291556 (not (contains!8035 (+!4405 lt!579012 (tuple2!22113 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!579009 () Unit!42657)

(assert (=> b!1291556 (= lt!579009 (addStillNotContains!381 lt!579012 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6043 (array!85577 array!85579 (_ BitVec 32) (_ BitVec 32) V!50769 V!50769 (_ BitVec 32) Int) ListLongMap!19777)

(assert (=> b!1291556 (= lt!579012 (getCurrentListMapNoExtraKeys!6043 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1291557 () Bool)

(declare-fun res!857649 () Bool)

(assert (=> b!1291557 (=> (not res!857649) (not e!737466))))

(declare-datatypes ((List!29291 0))(
  ( (Nil!29288) (Cons!29287 (h!30505 (_ BitVec 64)) (t!42847 List!29291)) )
))
(declare-fun arrayNoDuplicates!0 (array!85577 (_ BitVec 32) List!29291) Bool)

(assert (=> b!1291557 (= res!857649 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29288))))

(declare-fun b!1291558 () Bool)

(declare-fun res!857643 () Bool)

(assert (=> b!1291558 (=> (not res!857643) (not e!737466))))

(declare-fun getCurrentListMap!4946 (array!85577 array!85579 (_ BitVec 32) (_ BitVec 32) V!50769 V!50769 (_ BitVec 32) Int) ListLongMap!19777)

(assert (=> b!1291558 (= res!857643 (contains!8035 (getCurrentListMap!4946 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1291559 () Bool)

(assert (=> b!1291559 (= e!737469 tp_is_empty!34249)))

(declare-fun b!1291560 () Bool)

(declare-fun res!857642 () Bool)

(assert (=> b!1291560 (=> (not res!857642) (not e!737466))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85577 (_ BitVec 32)) Bool)

(assert (=> b!1291560 (= res!857642 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1291561 () Bool)

(declare-fun res!857644 () Bool)

(assert (=> b!1291561 (=> (not res!857644) (not e!737466))))

(assert (=> b!1291561 (= res!857644 (and (= (size!41837 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41836 _keys!1741) (size!41837 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!109344 res!857647) b!1291561))

(assert (= (and b!1291561 res!857644) b!1291560))

(assert (= (and b!1291560 res!857642) b!1291557))

(assert (= (and b!1291557 res!857649) b!1291554))

(assert (= (and b!1291554 res!857645) b!1291558))

(assert (= (and b!1291558 res!857643) b!1291550))

(assert (= (and b!1291550 res!857650) b!1291552))

(assert (= (and b!1291552 res!857648) b!1291551))

(assert (= (and b!1291551 (not res!857646)) b!1291556))

(assert (= (and b!1291555 condMapEmpty!52934) mapIsEmpty!52934))

(assert (= (and b!1291555 (not condMapEmpty!52934)) mapNonEmpty!52934))

(get-info :version)

(assert (= (and mapNonEmpty!52934 ((_ is ValueCellFull!16226) mapValue!52934)) b!1291559))

(assert (= (and b!1291555 ((_ is ValueCellFull!16226) mapDefault!52934)) b!1291553))

(assert (= start!109344 b!1291555))

(declare-fun m!1184427 () Bool)

(assert (=> b!1291558 m!1184427))

(assert (=> b!1291558 m!1184427))

(declare-fun m!1184429 () Bool)

(assert (=> b!1291558 m!1184429))

(declare-fun m!1184431 () Bool)

(assert (=> b!1291560 m!1184431))

(declare-fun m!1184433 () Bool)

(assert (=> b!1291552 m!1184433))

(assert (=> b!1291552 m!1184433))

(declare-fun m!1184435 () Bool)

(assert (=> b!1291552 m!1184435))

(declare-fun m!1184437 () Bool)

(assert (=> start!109344 m!1184437))

(declare-fun m!1184439 () Bool)

(assert (=> start!109344 m!1184439))

(declare-fun m!1184441 () Bool)

(assert (=> start!109344 m!1184441))

(declare-fun m!1184443 () Bool)

(assert (=> mapNonEmpty!52934 m!1184443))

(declare-fun m!1184445 () Bool)

(assert (=> b!1291551 m!1184445))

(declare-fun m!1184447 () Bool)

(assert (=> b!1291551 m!1184447))

(declare-fun m!1184449 () Bool)

(assert (=> b!1291556 m!1184449))

(declare-fun m!1184451 () Bool)

(assert (=> b!1291556 m!1184451))

(declare-fun m!1184453 () Bool)

(assert (=> b!1291556 m!1184453))

(declare-fun m!1184455 () Bool)

(assert (=> b!1291556 m!1184455))

(declare-fun m!1184457 () Bool)

(assert (=> b!1291556 m!1184457))

(assert (=> b!1291556 m!1184453))

(assert (=> b!1291556 m!1184449))

(declare-fun m!1184459 () Bool)

(assert (=> b!1291556 m!1184459))

(declare-fun m!1184461 () Bool)

(assert (=> b!1291556 m!1184461))

(declare-fun m!1184463 () Bool)

(assert (=> b!1291557 m!1184463))

(check-sat (not b!1291560) (not b!1291557) (not b!1291552) (not b_next!28609) (not b!1291556) (not b!1291551) (not b!1291558) (not mapNonEmpty!52934) (not start!109344) tp_is_empty!34249 b_and!46701)
(check-sat b_and!46701 (not b_next!28609))
