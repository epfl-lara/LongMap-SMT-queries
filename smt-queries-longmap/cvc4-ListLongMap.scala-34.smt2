; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!640 () Bool)

(assert start!640)

(declare-fun b_free!113 () Bool)

(declare-fun b_next!113 () Bool)

(assert (=> start!640 (= b_free!113 (not b_next!113))))

(declare-fun tp!556 () Bool)

(declare-fun b_and!251 () Bool)

(assert (=> start!640 (= tp!556 b_and!251)))

(declare-fun b!4120 () Bool)

(declare-fun e!2146 () Bool)

(declare-fun tp_is_empty!191 () Bool)

(assert (=> b!4120 (= e!2146 tp_is_empty!191)))

(declare-fun mapIsEmpty!245 () Bool)

(declare-fun mapRes!245 () Bool)

(assert (=> mapIsEmpty!245 mapRes!245))

(declare-fun b!4121 () Bool)

(declare-fun res!5558 () Bool)

(declare-fun e!2149 () Bool)

(assert (=> b!4121 (=> (not res!5558) (not e!2149))))

(declare-datatypes ((array!313 0))(
  ( (array!314 (arr!149 (Array (_ BitVec 32) (_ BitVec 64))) (size!211 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!313)

(declare-datatypes ((List!90 0))(
  ( (Nil!87) (Cons!86 (h!652 (_ BitVec 64)) (t!2217 List!90)) )
))
(declare-fun arrayNoDuplicates!0 (array!313 (_ BitVec 32) List!90) Bool)

(assert (=> b!4121 (= res!5558 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!87))))

(declare-fun b!4122 () Bool)

(assert (=> b!4122 (= e!2149 false)))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!431 0))(
  ( (V!432 (val!101 Int)) )
))
(declare-datatypes ((ValueCell!79 0))(
  ( (ValueCellFull!79 (v!1188 V!431)) (EmptyCell!79) )
))
(declare-datatypes ((array!315 0))(
  ( (array!316 (arr!150 (Array (_ BitVec 32) ValueCell!79)) (size!212 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!315)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!431)

(declare-fun lt!570 () Bool)

(declare-fun minValue!1434 () V!431)

(declare-datatypes ((tuple2!80 0))(
  ( (tuple2!81 (_1!40 (_ BitVec 64)) (_2!40 V!431)) )
))
(declare-datatypes ((List!91 0))(
  ( (Nil!88) (Cons!87 (h!653 tuple2!80) (t!2218 List!91)) )
))
(declare-datatypes ((ListLongMap!85 0))(
  ( (ListLongMap!86 (toList!58 List!91)) )
))
(declare-fun contains!28 (ListLongMap!85 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!17 (array!313 array!315 (_ BitVec 32) (_ BitVec 32) V!431 V!431 (_ BitVec 32) Int) ListLongMap!85)

(assert (=> b!4122 (= lt!570 (contains!28 (getCurrentListMap!17 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!4123 () Bool)

(declare-fun res!5557 () Bool)

(assert (=> b!4123 (=> (not res!5557) (not e!2149))))

(assert (=> b!4123 (= res!5557 (and (= (size!212 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!211 _keys!1806) (size!212 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!4124 () Bool)

(declare-fun res!5559 () Bool)

(assert (=> b!4124 (=> (not res!5559) (not e!2149))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!313 (_ BitVec 32)) Bool)

(assert (=> b!4124 (= res!5559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!4125 () Bool)

(declare-fun e!2150 () Bool)

(assert (=> b!4125 (= e!2150 tp_is_empty!191)))

(declare-fun b!4126 () Bool)

(declare-fun e!2148 () Bool)

(assert (=> b!4126 (= e!2148 (and e!2146 mapRes!245))))

(declare-fun condMapEmpty!245 () Bool)

(declare-fun mapDefault!245 () ValueCell!79)

