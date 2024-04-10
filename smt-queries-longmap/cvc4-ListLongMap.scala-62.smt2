; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!908 () Bool)

(assert start!908)

(declare-fun b_free!281 () Bool)

(declare-fun b_next!281 () Bool)

(assert (=> start!908 (= b_free!281 (not b_next!281))))

(declare-fun tp!1075 () Bool)

(declare-fun b_and!429 () Bool)

(assert (=> start!908 (= tp!1075 b_and!429)))

(declare-fun b!7596 () Bool)

(declare-fun res!7498 () Bool)

(declare-fun e!4244 () Bool)

(assert (=> b!7596 (=> (not res!7498) (not e!4244))))

(declare-datatypes ((array!651 0))(
  ( (array!652 (arr!313 (Array (_ BitVec 32) (_ BitVec 64))) (size!375 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!651)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!651 (_ BitVec 32)) Bool)

(assert (=> b!7596 (= res!7498 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!7597 () Bool)

(assert (=> b!7597 (= e!4244 false)))

(declare-fun defaultEntry!1495 () Int)

(declare-fun lt!1560 () Bool)

(declare-datatypes ((V!655 0))(
  ( (V!656 (val!185 Int)) )
))
(declare-datatypes ((ValueCell!163 0))(
  ( (ValueCellFull!163 (v!1277 V!655)) (EmptyCell!163) )
))
(declare-datatypes ((array!653 0))(
  ( (array!654 (arr!314 (Array (_ BitVec 32) ValueCell!163)) (size!376 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!653)

(declare-fun minValue!1434 () V!655)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!655)

(declare-datatypes ((tuple2!202 0))(
  ( (tuple2!203 (_1!101 (_ BitVec 64)) (_2!101 V!655)) )
))
(declare-datatypes ((List!211 0))(
  ( (Nil!208) (Cons!207 (h!773 tuple2!202) (t!2348 List!211)) )
))
(declare-datatypes ((ListLongMap!207 0))(
  ( (ListLongMap!208 (toList!119 List!211)) )
))
(declare-fun contains!94 (ListLongMap!207 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!78 (array!651 array!653 (_ BitVec 32) (_ BitVec 32) V!655 V!655 (_ BitVec 32) Int) ListLongMap!207)

(assert (=> b!7597 (= lt!1560 (contains!94 (getCurrentListMap!78 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!7598 () Bool)

(declare-fun e!4243 () Bool)

(declare-fun e!4245 () Bool)

(declare-fun mapRes!512 () Bool)

(assert (=> b!7598 (= e!4243 (and e!4245 mapRes!512))))

(declare-fun condMapEmpty!512 () Bool)

(declare-fun mapDefault!512 () ValueCell!163)

