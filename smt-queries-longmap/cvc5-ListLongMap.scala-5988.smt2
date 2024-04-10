; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77754 () Bool)

(assert start!77754)

(declare-fun b_free!16339 () Bool)

(declare-fun b_next!16339 () Bool)

(assert (=> start!77754 (= b_free!16339 (not b_next!16339))))

(declare-fun tp!57279 () Bool)

(declare-fun b_and!26831 () Bool)

(assert (=> start!77754 (= tp!57279 b_and!26831)))

(declare-fun b!907460 () Bool)

(declare-fun e!508569 () Bool)

(declare-fun e!508566 () Bool)

(declare-fun mapRes!29848 () Bool)

(assert (=> b!907460 (= e!508569 (and e!508566 mapRes!29848))))

(declare-fun condMapEmpty!29848 () Bool)

(declare-datatypes ((V!29975 0))(
  ( (V!29976 (val!9429 Int)) )
))
(declare-datatypes ((ValueCell!8897 0))(
  ( (ValueCellFull!8897 (v!11934 V!29975)) (EmptyCell!8897) )
))
(declare-datatypes ((array!53548 0))(
  ( (array!53549 (arr!25733 (Array (_ BitVec 32) ValueCell!8897)) (size!26192 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53548)

(declare-fun mapDefault!29848 () ValueCell!8897)

