; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109574 () Bool)

(assert start!109574)

(declare-fun b_free!29063 () Bool)

(declare-fun b_next!29063 () Bool)

(assert (=> start!109574 (= b_free!29063 (not b_next!29063))))

(declare-fun tp!102308 () Bool)

(declare-fun b_and!47153 () Bool)

(assert (=> start!109574 (= tp!102308 b_and!47153)))

(declare-fun res!862485 () Bool)

(declare-fun e!740443 () Bool)

(assert (=> start!109574 (=> (not res!862485) (not e!740443))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109574 (= res!862485 (validMask!0 mask!2175))))

(assert (=> start!109574 e!740443))

(declare-fun tp_is_empty!34703 () Bool)

(assert (=> start!109574 tp_is_empty!34703))

(assert (=> start!109574 true))

(declare-datatypes ((V!51373 0))(
  ( (V!51374 (val!17426 Int)) )
))
(declare-datatypes ((ValueCell!16453 0))(
  ( (ValueCellFull!16453 (v!20029 V!51373)) (EmptyCell!16453) )
))
(declare-datatypes ((array!86414 0))(
  ( (array!86415 (arr!41708 (Array (_ BitVec 32) ValueCell!16453)) (size!42258 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86414)

(declare-fun e!740445 () Bool)

(declare-fun array_inv!31569 (array!86414) Bool)

(assert (=> start!109574 (and (array_inv!31569 _values!1445) e!740445)))

(declare-datatypes ((array!86416 0))(
  ( (array!86417 (arr!41709 (Array (_ BitVec 32) (_ BitVec 64))) (size!42259 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86416)

(declare-fun array_inv!31570 (array!86416) Bool)

(assert (=> start!109574 (array_inv!31570 _keys!1741)))

(assert (=> start!109574 tp!102308))

(declare-fun mapIsEmpty!53615 () Bool)

(declare-fun mapRes!53615 () Bool)

(assert (=> mapIsEmpty!53615 mapRes!53615))

(declare-fun b!1297807 () Bool)

(declare-fun e!740447 () Bool)

(assert (=> b!1297807 (= e!740447 tp_is_empty!34703)))

(declare-fun b!1297808 () Bool)

(declare-fun res!862479 () Bool)

(assert (=> b!1297808 (=> (not res!862479) (not e!740443))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1297808 (= res!862479 (and (= (size!42258 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42259 _keys!1741) (size!42258 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1297809 () Bool)

(assert (=> b!1297809 (= e!740443 (not true))))

(declare-fun minValue!1387 () V!51373)

(declare-fun zeroValue!1387 () V!51373)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22460 0))(
  ( (tuple2!22461 (_1!11241 (_ BitVec 64)) (_2!11241 V!51373)) )
))
(declare-datatypes ((List!29593 0))(
  ( (Nil!29590) (Cons!29589 (h!30798 tuple2!22460) (t!43157 List!29593)) )
))
(declare-datatypes ((ListLongMap!20117 0))(
  ( (ListLongMap!20118 (toList!10074 List!29593)) )
))
(declare-fun contains!8192 (ListLongMap!20117 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5103 (array!86416 array!86414 (_ BitVec 32) (_ BitVec 32) V!51373 V!51373 (_ BitVec 32) Int) ListLongMap!20117)

(assert (=> b!1297809 (contains!8192 (getCurrentListMap!5103 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k!1205)))

(declare-datatypes ((Unit!42961 0))(
  ( (Unit!42962) )
))
(declare-fun lt!580640 () Unit!42961)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!33 (array!86416 array!86414 (_ BitVec 32) (_ BitVec 32) V!51373 V!51373 (_ BitVec 64) (_ BitVec 32) Int) Unit!42961)

(assert (=> b!1297809 (= lt!580640 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!33 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1297810 () Bool)

(declare-fun res!862482 () Bool)

(assert (=> b!1297810 (=> (not res!862482) (not e!740443))))

(assert (=> b!1297810 (= res!862482 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42259 _keys!1741)) (not (= (select (arr!41709 _keys!1741) from!2144) k!1205))))))

(declare-fun mapNonEmpty!53615 () Bool)

(declare-fun tp!102307 () Bool)

(assert (=> mapNonEmpty!53615 (= mapRes!53615 (and tp!102307 e!740447))))

(declare-fun mapRest!53615 () (Array (_ BitVec 32) ValueCell!16453))

(declare-fun mapValue!53615 () ValueCell!16453)

(declare-fun mapKey!53615 () (_ BitVec 32))

(assert (=> mapNonEmpty!53615 (= (arr!41708 _values!1445) (store mapRest!53615 mapKey!53615 mapValue!53615))))

(declare-fun b!1297811 () Bool)

(declare-fun res!862480 () Bool)

(assert (=> b!1297811 (=> (not res!862480) (not e!740443))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86416 (_ BitVec 32)) Bool)

(assert (=> b!1297811 (= res!862480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1297812 () Bool)

(declare-fun e!740446 () Bool)

(assert (=> b!1297812 (= e!740446 tp_is_empty!34703)))

(declare-fun b!1297813 () Bool)

(declare-fun res!862484 () Bool)

(assert (=> b!1297813 (=> (not res!862484) (not e!740443))))

(assert (=> b!1297813 (= res!862484 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42259 _keys!1741))))))

(declare-fun b!1297814 () Bool)

(declare-fun res!862481 () Bool)

(assert (=> b!1297814 (=> (not res!862481) (not e!740443))))

(assert (=> b!1297814 (= res!862481 (contains!8192 (getCurrentListMap!5103 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1297815 () Bool)

(declare-fun res!862483 () Bool)

(assert (=> b!1297815 (=> (not res!862483) (not e!740443))))

(declare-datatypes ((List!29594 0))(
  ( (Nil!29591) (Cons!29590 (h!30799 (_ BitVec 64)) (t!43158 List!29594)) )
))
(declare-fun arrayNoDuplicates!0 (array!86416 (_ BitVec 32) List!29594) Bool)

(assert (=> b!1297815 (= res!862483 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29591))))

(declare-fun b!1297816 () Bool)

(assert (=> b!1297816 (= e!740445 (and e!740446 mapRes!53615))))

(declare-fun condMapEmpty!53615 () Bool)

(declare-fun mapDefault!53615 () ValueCell!16453)

