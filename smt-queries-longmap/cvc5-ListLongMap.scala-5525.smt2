; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72934 () Bool)

(assert start!72934)

(declare-fun b_free!13849 () Bool)

(declare-fun b_next!13849 () Bool)

(assert (=> start!72934 (= b_free!13849 (not b_next!13849))))

(declare-fun tp!49050 () Bool)

(declare-fun b_and!22935 () Bool)

(assert (=> start!72934 (= tp!49050 b_and!22935)))

(declare-fun b!846892 () Bool)

(declare-fun res!575401 () Bool)

(declare-fun e!472623 () Bool)

(assert (=> b!846892 (=> (not res!575401) (not e!472623))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48182 0))(
  ( (array!48183 (arr!23122 (Array (_ BitVec 32) (_ BitVec 64))) (size!23562 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48182)

(assert (=> b!846892 (= res!575401 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23562 _keys!868))))))

(declare-fun b!846893 () Bool)

(declare-fun e!472627 () Bool)

(declare-fun e!472625 () Bool)

(declare-fun mapRes!25577 () Bool)

(assert (=> b!846893 (= e!472627 (and e!472625 mapRes!25577))))

(declare-fun condMapEmpty!25577 () Bool)

(declare-datatypes ((V!26361 0))(
  ( (V!26362 (val!8040 Int)) )
))
(declare-datatypes ((ValueCell!7553 0))(
  ( (ValueCellFull!7553 (v!10465 V!26361)) (EmptyCell!7553) )
))
(declare-datatypes ((array!48184 0))(
  ( (array!48185 (arr!23123 (Array (_ BitVec 32) ValueCell!7553)) (size!23563 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48184)

(declare-fun mapDefault!25577 () ValueCell!7553)

