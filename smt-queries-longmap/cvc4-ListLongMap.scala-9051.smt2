; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109094 () Bool)

(assert start!109094)

(declare-fun b_free!28583 () Bool)

(declare-fun b_next!28583 () Bool)

(assert (=> start!109094 (= b_free!28583 (not b_next!28583))))

(declare-fun tp!100868 () Bool)

(declare-fun b_and!46673 () Bool)

(assert (=> start!109094 (= tp!100868 b_and!46673)))

(declare-fun res!856776 () Bool)

(declare-fun e!736384 () Bool)

(assert (=> start!109094 (=> (not res!856776) (not e!736384))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109094 (= res!856776 (validMask!0 mask!2175))))

(assert (=> start!109094 e!736384))

(declare-fun tp_is_empty!34223 () Bool)

(assert (=> start!109094 tp_is_empty!34223))

(assert (=> start!109094 true))

(declare-datatypes ((V!50733 0))(
  ( (V!50734 (val!17186 Int)) )
))
(declare-datatypes ((ValueCell!16213 0))(
  ( (ValueCellFull!16213 (v!19789 V!50733)) (EmptyCell!16213) )
))
(declare-datatypes ((array!85488 0))(
  ( (array!85489 (arr!41245 (Array (_ BitVec 32) ValueCell!16213)) (size!41795 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85488)

(declare-fun e!736385 () Bool)

(declare-fun array_inv!31263 (array!85488) Bool)

(assert (=> start!109094 (and (array_inv!31263 _values!1445) e!736385)))

(declare-datatypes ((array!85490 0))(
  ( (array!85491 (arr!41246 (Array (_ BitVec 32) (_ BitVec 64))) (size!41796 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85490)

(declare-fun array_inv!31264 (array!85490) Bool)

(assert (=> start!109094 (array_inv!31264 _keys!1741)))

(assert (=> start!109094 tp!100868))

(declare-fun b!1289777 () Bool)

(declare-fun res!856774 () Bool)

(assert (=> b!1289777 (=> (not res!856774) (not e!736384))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1289777 (= res!856774 (and (= (size!41795 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41796 _keys!1741) (size!41795 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1289778 () Bool)

(declare-fun e!736386 () Bool)

(assert (=> b!1289778 (= e!736386 tp_is_empty!34223)))

(declare-fun b!1289779 () Bool)

(declare-fun res!856775 () Bool)

(assert (=> b!1289779 (=> (not res!856775) (not e!736384))))

(declare-fun minValue!1387 () V!50733)

(declare-fun zeroValue!1387 () V!50733)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22076 0))(
  ( (tuple2!22077 (_1!11049 (_ BitVec 64)) (_2!11049 V!50733)) )
))
(declare-datatypes ((List!29245 0))(
  ( (Nil!29242) (Cons!29241 (h!30450 tuple2!22076) (t!42809 List!29245)) )
))
(declare-datatypes ((ListLongMap!19733 0))(
  ( (ListLongMap!19734 (toList!9882 List!29245)) )
))
(declare-fun contains!8000 (ListLongMap!19733 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4942 (array!85490 array!85488 (_ BitVec 32) (_ BitVec 32) V!50733 V!50733 (_ BitVec 32) Int) ListLongMap!19733)

(assert (=> b!1289779 (= res!856775 (contains!8000 (getCurrentListMap!4942 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1289780 () Bool)

(declare-fun res!856779 () Bool)

(assert (=> b!1289780 (=> (not res!856779) (not e!736384))))

(assert (=> b!1289780 (= res!856779 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41796 _keys!1741))))))

(declare-fun mapNonEmpty!52895 () Bool)

(declare-fun mapRes!52895 () Bool)

(declare-fun tp!100867 () Bool)

(declare-fun e!736388 () Bool)

(assert (=> mapNonEmpty!52895 (= mapRes!52895 (and tp!100867 e!736388))))

(declare-fun mapRest!52895 () (Array (_ BitVec 32) ValueCell!16213))

(declare-fun mapKey!52895 () (_ BitVec 32))

(declare-fun mapValue!52895 () ValueCell!16213)

(assert (=> mapNonEmpty!52895 (= (arr!41245 _values!1445) (store mapRest!52895 mapKey!52895 mapValue!52895))))

(declare-fun b!1289781 () Bool)

(declare-fun res!856778 () Bool)

(assert (=> b!1289781 (=> (not res!856778) (not e!736384))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1289781 (= res!856778 (not (validKeyInArray!0 (select (arr!41246 _keys!1741) from!2144))))))

(declare-fun b!1289782 () Bool)

(declare-fun res!856772 () Bool)

(assert (=> b!1289782 (=> (not res!856772) (not e!736384))))

(declare-datatypes ((List!29246 0))(
  ( (Nil!29243) (Cons!29242 (h!30451 (_ BitVec 64)) (t!42810 List!29246)) )
))
(declare-fun arrayNoDuplicates!0 (array!85490 (_ BitVec 32) List!29246) Bool)

(assert (=> b!1289782 (= res!856772 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29243))))

(declare-fun b!1289783 () Bool)

(declare-fun e!736383 () Bool)

(assert (=> b!1289783 (= e!736384 (not e!736383))))

(declare-fun res!856773 () Bool)

(assert (=> b!1289783 (=> res!856773 e!736383)))

(assert (=> b!1289783 (= res!856773 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1289783 (not (contains!8000 (ListLongMap!19734 Nil!29242) k!1205))))

(declare-datatypes ((Unit!42682 0))(
  ( (Unit!42683) )
))
(declare-fun lt!578371 () Unit!42682)

(declare-fun emptyContainsNothing!69 ((_ BitVec 64)) Unit!42682)

(assert (=> b!1289783 (= lt!578371 (emptyContainsNothing!69 k!1205))))

(declare-fun b!1289784 () Bool)

(assert (=> b!1289784 (= e!736385 (and e!736386 mapRes!52895))))

(declare-fun condMapEmpty!52895 () Bool)

(declare-fun mapDefault!52895 () ValueCell!16213)

