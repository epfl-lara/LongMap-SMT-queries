; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43510 () Bool)

(assert start!43510)

(declare-fun b_free!12289 () Bool)

(declare-fun b_next!12289 () Bool)

(assert (=> start!43510 (= b_free!12289 (not b_next!12289))))

(declare-fun tp!43149 () Bool)

(declare-fun b_and!21049 () Bool)

(assert (=> start!43510 (= tp!43149 b_and!21049)))

(declare-fun b!482090 () Bool)

(declare-fun e!283674 () Bool)

(assert (=> b!482090 (= e!283674 false)))

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((V!19473 0))(
  ( (V!19474 (val!6948 Int)) )
))
(declare-fun minValue!1458 () V!19473)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun lt!218671 () Bool)

(declare-fun zeroValue!1458 () V!19473)

(declare-datatypes ((ValueCell!6539 0))(
  ( (ValueCellFull!6539 (v!9241 V!19473)) (EmptyCell!6539) )
))
(declare-datatypes ((array!31261 0))(
  ( (array!31262 (arr!15033 (Array (_ BitVec 32) ValueCell!6539)) (size!15391 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31261)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((array!31263 0))(
  ( (array!31264 (arr!15034 (Array (_ BitVec 32) (_ BitVec 64))) (size!15392 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31263)

(declare-datatypes ((tuple2!9118 0))(
  ( (tuple2!9119 (_1!4570 (_ BitVec 64)) (_2!4570 V!19473)) )
))
(declare-datatypes ((List!9198 0))(
  ( (Nil!9195) (Cons!9194 (h!10050 tuple2!9118) (t!15412 List!9198)) )
))
(declare-datatypes ((ListLongMap!8031 0))(
  ( (ListLongMap!8032 (toList!4031 List!9198)) )
))
(declare-fun contains!2645 (ListLongMap!8031 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2350 (array!31263 array!31261 (_ BitVec 32) (_ BitVec 32) V!19473 V!19473 (_ BitVec 32) Int) ListLongMap!8031)

(assert (=> b!482090 (= lt!218671 (contains!2645 (getCurrentListMap!2350 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k!1332))))

(declare-fun b!482091 () Bool)

(declare-fun e!283670 () Bool)

(declare-fun e!283673 () Bool)

(declare-fun mapRes!22411 () Bool)

(assert (=> b!482091 (= e!283670 (and e!283673 mapRes!22411))))

(declare-fun condMapEmpty!22411 () Bool)

(declare-fun mapDefault!22411 () ValueCell!6539)

