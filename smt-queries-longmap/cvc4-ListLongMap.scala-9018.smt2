; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108872 () Bool)

(assert start!108872)

(declare-fun b_free!28385 () Bool)

(declare-fun b_next!28385 () Bool)

(assert (=> start!108872 (= b_free!28385 (not b_next!28385))))

(declare-fun tp!100270 () Bool)

(declare-fun b_and!46451 () Bool)

(assert (=> start!108872 (= tp!100270 b_and!46451)))

(declare-fun res!854157 () Bool)

(declare-fun e!734449 () Bool)

(assert (=> start!108872 (=> (not res!854157) (not e!734449))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108872 (= res!854157 (validMask!0 mask!2175))))

(assert (=> start!108872 e!734449))

(declare-fun tp_is_empty!34025 () Bool)

(assert (=> start!108872 tp_is_empty!34025))

(assert (=> start!108872 true))

(declare-datatypes ((V!50469 0))(
  ( (V!50470 (val!17087 Int)) )
))
(declare-datatypes ((ValueCell!16114 0))(
  ( (ValueCellFull!16114 (v!19689 V!50469)) (EmptyCell!16114) )
))
(declare-datatypes ((array!85104 0))(
  ( (array!85105 (arr!41054 (Array (_ BitVec 32) ValueCell!16114)) (size!41604 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85104)

(declare-fun e!734450 () Bool)

(declare-fun array_inv!31131 (array!85104) Bool)

(assert (=> start!108872 (and (array_inv!31131 _values!1445) e!734450)))

(declare-datatypes ((array!85106 0))(
  ( (array!85107 (arr!41055 (Array (_ BitVec 32) (_ BitVec 64))) (size!41605 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85106)

(declare-fun array_inv!31132 (array!85106) Bool)

(assert (=> start!108872 (array_inv!31132 _keys!1741)))

(assert (=> start!108872 tp!100270))

(declare-fun b!1285775 () Bool)

(declare-fun res!854150 () Bool)

(assert (=> b!1285775 (=> (not res!854150) (not e!734449))))

(declare-datatypes ((List!29093 0))(
  ( (Nil!29090) (Cons!29089 (h!30298 (_ BitVec 64)) (t!42637 List!29093)) )
))
(declare-fun arrayNoDuplicates!0 (array!85106 (_ BitVec 32) List!29093) Bool)

(assert (=> b!1285775 (= res!854150 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29090))))

(declare-fun b!1285776 () Bool)

(declare-fun res!854155 () Bool)

(assert (=> b!1285776 (=> (not res!854155) (not e!734449))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1285776 (= res!854155 (and (= (size!41604 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41605 _keys!1741) (size!41604 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1285777 () Bool)

(declare-fun res!854154 () Bool)

(assert (=> b!1285777 (=> (not res!854154) (not e!734449))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1285777 (= res!854154 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41605 _keys!1741))))))

(declare-fun b!1285778 () Bool)

(declare-fun res!854151 () Bool)

(assert (=> b!1285778 (=> (not res!854151) (not e!734449))))

(declare-fun minValue!1387 () V!50469)

(declare-fun zeroValue!1387 () V!50469)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21906 0))(
  ( (tuple2!21907 (_1!10964 (_ BitVec 64)) (_2!10964 V!50469)) )
))
(declare-datatypes ((List!29094 0))(
  ( (Nil!29091) (Cons!29090 (h!30299 tuple2!21906) (t!42638 List!29094)) )
))
(declare-datatypes ((ListLongMap!19563 0))(
  ( (ListLongMap!19564 (toList!9797 List!29094)) )
))
(declare-fun contains!7914 (ListLongMap!19563 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4875 (array!85106 array!85104 (_ BitVec 32) (_ BitVec 32) V!50469 V!50469 (_ BitVec 32) Int) ListLongMap!19563)

(assert (=> b!1285778 (= res!854151 (contains!7914 (getCurrentListMap!4875 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1285779 () Bool)

(declare-fun res!854152 () Bool)

(assert (=> b!1285779 (=> (not res!854152) (not e!734449))))

(assert (=> b!1285779 (= res!854152 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41605 _keys!1741))))))

(declare-fun b!1285780 () Bool)

(declare-fun e!734446 () Bool)

(assert (=> b!1285780 (= e!734446 tp_is_empty!34025)))

(declare-fun b!1285781 () Bool)

(declare-fun res!854153 () Bool)

(assert (=> b!1285781 (=> (not res!854153) (not e!734449))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85106 (_ BitVec 32)) Bool)

(assert (=> b!1285781 (= res!854153 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1285782 () Bool)

(declare-fun res!854156 () Bool)

(assert (=> b!1285782 (=> (not res!854156) (not e!734449))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1285782 (= res!854156 (validKeyInArray!0 (select (arr!41055 _keys!1741) from!2144)))))

(declare-fun b!1285783 () Bool)

(declare-fun mapRes!52595 () Bool)

(assert (=> b!1285783 (= e!734450 (and e!734446 mapRes!52595))))

(declare-fun condMapEmpty!52595 () Bool)

(declare-fun mapDefault!52595 () ValueCell!16114)

