; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4096 () Bool)

(assert start!4096)

(declare-fun b_free!1001 () Bool)

(declare-fun b_next!1001 () Bool)

(assert (=> start!4096 (= b_free!1001 (not b_next!1001))))

(declare-fun tp!4422 () Bool)

(declare-fun b_and!1811 () Bool)

(assert (=> start!4096 (= tp!4422 b_and!1811)))

(declare-fun b!30405 () Bool)

(declare-fun res!18320 () Bool)

(declare-fun e!19518 () Bool)

(assert (=> b!30405 (=> (not res!18320) (not e!19518))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1939 0))(
  ( (array!1940 (arr!923 (Array (_ BitVec 32) (_ BitVec 64))) (size!1024 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1939)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-datatypes ((V!1631 0))(
  ( (V!1632 (val!704 Int)) )
))
(declare-datatypes ((ValueCell!478 0))(
  ( (ValueCellFull!478 (v!1793 V!1631)) (EmptyCell!478) )
))
(declare-datatypes ((array!1941 0))(
  ( (array!1942 (arr!924 (Array (_ BitVec 32) ValueCell!478)) (size!1025 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1941)

(declare-fun zeroValue!1443 () V!1631)

(declare-fun minValue!1443 () V!1631)

(declare-datatypes ((tuple2!1162 0))(
  ( (tuple2!1163 (_1!592 (_ BitVec 64)) (_2!592 V!1631)) )
))
(declare-datatypes ((List!757 0))(
  ( (Nil!754) (Cons!753 (h!1320 tuple2!1162) (t!3450 List!757)) )
))
(declare-datatypes ((ListLongMap!739 0))(
  ( (ListLongMap!740 (toList!385 List!757)) )
))
(declare-fun contains!325 (ListLongMap!739 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!213 (array!1939 array!1941 (_ BitVec 32) (_ BitVec 32) V!1631 V!1631 (_ BitVec 32) Int) ListLongMap!739)

(assert (=> b!30405 (= res!18320 (not (contains!325 (getCurrentListMap!213 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun b!30406 () Bool)

(declare-fun e!19519 () Bool)

(declare-fun e!19520 () Bool)

(declare-fun mapRes!1561 () Bool)

(assert (=> b!30406 (= e!19519 (and e!19520 mapRes!1561))))

(declare-fun condMapEmpty!1561 () Bool)

(declare-fun mapDefault!1561 () ValueCell!478)

