; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109390 () Bool)

(assert start!109390)

(declare-fun b_free!28879 () Bool)

(declare-fun b_next!28879 () Bool)

(assert (=> start!109390 (= b_free!28879 (not b_next!28879))))

(declare-fun tp!101756 () Bool)

(declare-fun b_and!46969 () Bool)

(assert (=> start!109390 (= tp!101756 b_and!46969)))

(declare-fun b!1294943 () Bool)

(declare-fun res!860612 () Bool)

(declare-fun e!738886 () Bool)

(assert (=> b!1294943 (=> (not res!860612) (not e!738886))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51129 0))(
  ( (V!51130 (val!17334 Int)) )
))
(declare-datatypes ((ValueCell!16361 0))(
  ( (ValueCellFull!16361 (v!19937 V!51129)) (EmptyCell!16361) )
))
(declare-datatypes ((array!86058 0))(
  ( (array!86059 (arr!41530 (Array (_ BitVec 32) ValueCell!16361)) (size!42080 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86058)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86060 0))(
  ( (array!86061 (arr!41531 (Array (_ BitVec 32) (_ BitVec 64))) (size!42081 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86060)

(assert (=> b!1294943 (= res!860612 (and (= (size!42080 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42081 _keys!1741) (size!42080 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!53339 () Bool)

(declare-fun mapRes!53339 () Bool)

(declare-fun tp!101755 () Bool)

(declare-fun e!738885 () Bool)

(assert (=> mapNonEmpty!53339 (= mapRes!53339 (and tp!101755 e!738885))))

(declare-fun mapKey!53339 () (_ BitVec 32))

(declare-fun mapRest!53339 () (Array (_ BitVec 32) ValueCell!16361))

(declare-fun mapValue!53339 () ValueCell!16361)

(assert (=> mapNonEmpty!53339 (= (arr!41530 _values!1445) (store mapRest!53339 mapKey!53339 mapValue!53339))))

(declare-fun b!1294944 () Bool)

(declare-fun res!860608 () Bool)

(assert (=> b!1294944 (=> (not res!860608) (not e!738886))))

(declare-datatypes ((List!29457 0))(
  ( (Nil!29454) (Cons!29453 (h!30662 (_ BitVec 64)) (t!43021 List!29457)) )
))
(declare-fun arrayNoDuplicates!0 (array!86060 (_ BitVec 32) List!29457) Bool)

(assert (=> b!1294944 (= res!860608 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29454))))

(declare-fun b!1294945 () Bool)

(declare-fun res!860606 () Bool)

(assert (=> b!1294945 (=> (not res!860606) (not e!738886))))

(declare-fun minValue!1387 () V!51129)

(declare-fun zeroValue!1387 () V!51129)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22314 0))(
  ( (tuple2!22315 (_1!11168 (_ BitVec 64)) (_2!11168 V!51129)) )
))
(declare-datatypes ((List!29458 0))(
  ( (Nil!29455) (Cons!29454 (h!30663 tuple2!22314) (t!43022 List!29458)) )
))
(declare-datatypes ((ListLongMap!19971 0))(
  ( (ListLongMap!19972 (toList!10001 List!29458)) )
))
(declare-fun contains!8119 (ListLongMap!19971 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5038 (array!86060 array!86058 (_ BitVec 32) (_ BitVec 32) V!51129 V!51129 (_ BitVec 32) Int) ListLongMap!19971)

(assert (=> b!1294945 (= res!860606 (contains!8119 (getCurrentListMap!5038 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1294946 () Bool)

(declare-fun res!860613 () Bool)

(assert (=> b!1294946 (=> (not res!860613) (not e!738886))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86060 (_ BitVec 32)) Bool)

(assert (=> b!1294946 (= res!860613 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!860607 () Bool)

(assert (=> start!109390 (=> (not res!860607) (not e!738886))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109390 (= res!860607 (validMask!0 mask!2175))))

(assert (=> start!109390 e!738886))

(declare-fun tp_is_empty!34519 () Bool)

(assert (=> start!109390 tp_is_empty!34519))

(assert (=> start!109390 true))

(declare-fun e!738888 () Bool)

(declare-fun array_inv!31445 (array!86058) Bool)

(assert (=> start!109390 (and (array_inv!31445 _values!1445) e!738888)))

(declare-fun array_inv!31446 (array!86060) Bool)

(assert (=> start!109390 (array_inv!31446 _keys!1741)))

(assert (=> start!109390 tp!101756))

(declare-fun b!1294947 () Bool)

(declare-fun e!738890 () Bool)

(assert (=> b!1294947 (= e!738888 (and e!738890 mapRes!53339))))

(declare-fun condMapEmpty!53339 () Bool)

(declare-fun mapDefault!53339 () ValueCell!16361)

