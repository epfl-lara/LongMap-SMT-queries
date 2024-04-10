; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!642 () Bool)

(assert start!642)

(declare-fun b_free!115 () Bool)

(declare-fun b_next!115 () Bool)

(assert (=> start!642 (= b_free!115 (not b_next!115))))

(declare-fun tp!563 () Bool)

(declare-fun b_and!253 () Bool)

(assert (=> start!642 (= tp!563 b_and!253)))

(declare-fun b!4141 () Bool)

(declare-fun e!2163 () Bool)

(assert (=> b!4141 (= e!2163 false)))

(declare-fun lt!573 () Bool)

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!435 0))(
  ( (V!436 (val!102 Int)) )
))
(declare-datatypes ((ValueCell!80 0))(
  ( (ValueCellFull!80 (v!1189 V!435)) (EmptyCell!80) )
))
(declare-datatypes ((array!317 0))(
  ( (array!318 (arr!151 (Array (_ BitVec 32) ValueCell!80)) (size!213 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!317)

(declare-fun minValue!1434 () V!435)

(declare-datatypes ((array!319 0))(
  ( (array!320 (arr!152 (Array (_ BitVec 32) (_ BitVec 64))) (size!214 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!319)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!435)

(declare-datatypes ((tuple2!82 0))(
  ( (tuple2!83 (_1!41 (_ BitVec 64)) (_2!41 V!435)) )
))
(declare-datatypes ((List!92 0))(
  ( (Nil!89) (Cons!88 (h!654 tuple2!82) (t!2219 List!92)) )
))
(declare-datatypes ((ListLongMap!87 0))(
  ( (ListLongMap!88 (toList!59 List!92)) )
))
(declare-fun contains!29 (ListLongMap!87 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!18 (array!319 array!317 (_ BitVec 32) (_ BitVec 32) V!435 V!435 (_ BitVec 32) Int) ListLongMap!87)

(assert (=> b!4141 (= lt!573 (contains!29 (getCurrentListMap!18 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!4142 () Bool)

(declare-fun res!5571 () Bool)

(assert (=> b!4142 (=> (not res!5571) (not e!2163))))

(declare-datatypes ((List!93 0))(
  ( (Nil!90) (Cons!89 (h!655 (_ BitVec 64)) (t!2220 List!93)) )
))
(declare-fun arrayNoDuplicates!0 (array!319 (_ BitVec 32) List!93) Bool)

(assert (=> b!4142 (= res!5571 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!90))))

(declare-fun b!4143 () Bool)

(declare-fun e!2165 () Bool)

(declare-fun e!2161 () Bool)

(declare-fun mapRes!248 () Bool)

(assert (=> b!4143 (= e!2165 (and e!2161 mapRes!248))))

(declare-fun condMapEmpty!248 () Bool)

(declare-fun mapDefault!248 () ValueCell!80)

