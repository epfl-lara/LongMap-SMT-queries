; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77728 () Bool)

(assert start!77728)

(declare-fun b_free!16313 () Bool)

(declare-fun b_next!16313 () Bool)

(assert (=> start!77728 (= b_free!16313 (not b_next!16313))))

(declare-fun tp!57200 () Bool)

(declare-fun b_and!26779 () Bool)

(assert (=> start!77728 (= tp!57200 b_and!26779)))

(declare-fun b!906927 () Bool)

(declare-fun e!508250 () Bool)

(declare-fun e!508252 () Bool)

(declare-fun mapRes!29809 () Bool)

(assert (=> b!906927 (= e!508250 (and e!508252 mapRes!29809))))

(declare-fun condMapEmpty!29809 () Bool)

(declare-datatypes ((V!29939 0))(
  ( (V!29940 (val!9416 Int)) )
))
(declare-datatypes ((ValueCell!8884 0))(
  ( (ValueCellFull!8884 (v!11921 V!29939)) (EmptyCell!8884) )
))
(declare-datatypes ((array!53502 0))(
  ( (array!53503 (arr!25710 (Array (_ BitVec 32) ValueCell!8884)) (size!26169 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53502)

(declare-fun mapDefault!29809 () ValueCell!8884)

