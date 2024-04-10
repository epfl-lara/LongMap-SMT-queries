; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109232 () Bool)

(assert start!109232)

(declare-fun b_free!28721 () Bool)

(declare-fun b_next!28721 () Bool)

(assert (=> start!109232 (= b_free!28721 (not b_next!28721))))

(declare-fun tp!101281 () Bool)

(declare-fun b_and!46811 () Bool)

(assert (=> start!109232 (= tp!101281 b_and!46811)))

(declare-fun b!1292217 () Bool)

(declare-fun res!858593 () Bool)

(declare-fun e!737583 () Bool)

(assert (=> b!1292217 (=> (not res!858593) (not e!737583))))

(declare-datatypes ((array!85756 0))(
  ( (array!85757 (arr!41379 (Array (_ BitVec 32) (_ BitVec 64))) (size!41929 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85756)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1292217 (= res!858593 (not (validKeyInArray!0 (select (arr!41379 _keys!1741) from!2144))))))

(declare-fun mapIsEmpty!53102 () Bool)

(declare-fun mapRes!53102 () Bool)

(assert (=> mapIsEmpty!53102 mapRes!53102))

(declare-fun mapNonEmpty!53102 () Bool)

(declare-fun tp!101282 () Bool)

(declare-fun e!737582 () Bool)

(assert (=> mapNonEmpty!53102 (= mapRes!53102 (and tp!101282 e!737582))))

(declare-datatypes ((V!50917 0))(
  ( (V!50918 (val!17255 Int)) )
))
(declare-datatypes ((ValueCell!16282 0))(
  ( (ValueCellFull!16282 (v!19858 V!50917)) (EmptyCell!16282) )
))
(declare-fun mapRest!53102 () (Array (_ BitVec 32) ValueCell!16282))

(declare-datatypes ((array!85758 0))(
  ( (array!85759 (arr!41380 (Array (_ BitVec 32) ValueCell!16282)) (size!41930 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85758)

(declare-fun mapValue!53102 () ValueCell!16282)

(declare-fun mapKey!53102 () (_ BitVec 32))

(assert (=> mapNonEmpty!53102 (= (arr!41380 _values!1445) (store mapRest!53102 mapKey!53102 mapValue!53102))))

(declare-fun b!1292218 () Bool)

(declare-fun res!858592 () Bool)

(assert (=> b!1292218 (=> (not res!858592) (not e!737583))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85756 (_ BitVec 32)) Bool)

(assert (=> b!1292218 (= res!858592 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1292219 () Bool)

(declare-fun res!858594 () Bool)

(assert (=> b!1292219 (=> (not res!858594) (not e!737583))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1292219 (= res!858594 (and (= (size!41930 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41929 _keys!1741) (size!41930 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!858597 () Bool)

(assert (=> start!109232 (=> (not res!858597) (not e!737583))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109232 (= res!858597 (validMask!0 mask!2175))))

(assert (=> start!109232 e!737583))

(declare-fun tp_is_empty!34361 () Bool)

(assert (=> start!109232 tp_is_empty!34361))

(assert (=> start!109232 true))

(declare-fun e!737584 () Bool)

(declare-fun array_inv!31355 (array!85758) Bool)

(assert (=> start!109232 (and (array_inv!31355 _values!1445) e!737584)))

(declare-fun array_inv!31356 (array!85756) Bool)

(assert (=> start!109232 (array_inv!31356 _keys!1741)))

(assert (=> start!109232 tp!101281))

(declare-fun b!1292220 () Bool)

(declare-fun res!858595 () Bool)

(assert (=> b!1292220 (=> (not res!858595) (not e!737583))))

(declare-datatypes ((List!29351 0))(
  ( (Nil!29348) (Cons!29347 (h!30556 (_ BitVec 64)) (t!42915 List!29351)) )
))
(declare-fun arrayNoDuplicates!0 (array!85756 (_ BitVec 32) List!29351) Bool)

(assert (=> b!1292220 (= res!858595 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29348))))

(declare-fun b!1292221 () Bool)

(declare-fun res!858591 () Bool)

(assert (=> b!1292221 (=> (not res!858591) (not e!737583))))

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1292221 (= res!858591 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41929 _keys!1741))))))

(declare-fun b!1292222 () Bool)

(declare-fun res!858596 () Bool)

(assert (=> b!1292222 (=> (not res!858596) (not e!737583))))

(declare-fun minValue!1387 () V!50917)

(declare-fun zeroValue!1387 () V!50917)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22198 0))(
  ( (tuple2!22199 (_1!11110 (_ BitVec 64)) (_2!11110 V!50917)) )
))
(declare-datatypes ((List!29352 0))(
  ( (Nil!29349) (Cons!29348 (h!30557 tuple2!22198) (t!42916 List!29352)) )
))
(declare-datatypes ((ListLongMap!19855 0))(
  ( (ListLongMap!19856 (toList!9943 List!29352)) )
))
(declare-fun contains!8061 (ListLongMap!19855 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4989 (array!85756 array!85758 (_ BitVec 32) (_ BitVec 32) V!50917 V!50917 (_ BitVec 32) Int) ListLongMap!19855)

(assert (=> b!1292222 (= res!858596 (contains!8061 (getCurrentListMap!4989 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1292223 () Bool)

(declare-fun res!858590 () Bool)

(assert (=> b!1292223 (=> (not res!858590) (not e!737583))))

(assert (=> b!1292223 (= res!858590 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41929 _keys!1741))))))

(declare-fun b!1292224 () Bool)

(assert (=> b!1292224 (= e!737582 tp_is_empty!34361)))

(declare-fun b!1292225 () Bool)

(declare-fun e!737581 () Bool)

(assert (=> b!1292225 (= e!737584 (and e!737581 mapRes!53102))))

(declare-fun condMapEmpty!53102 () Bool)

(declare-fun mapDefault!53102 () ValueCell!16282)

