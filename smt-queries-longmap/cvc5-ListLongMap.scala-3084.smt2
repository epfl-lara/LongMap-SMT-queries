; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43396 () Bool)

(assert start!43396)

(declare-fun b_free!12223 () Bool)

(declare-fun b_next!12223 () Bool)

(assert (=> start!43396 (= b_free!12223 (not b_next!12223))))

(declare-fun tp!42946 () Bool)

(declare-fun b_and!20979 () Bool)

(assert (=> start!43396 (= tp!42946 b_and!20979)))

(declare-fun mapIsEmpty!22306 () Bool)

(declare-fun mapRes!22306 () Bool)

(assert (=> mapIsEmpty!22306 mapRes!22306))

(declare-fun b!480891 () Bool)

(declare-fun e!282945 () Bool)

(declare-fun e!282940 () Bool)

(assert (=> b!480891 (= e!282945 (and e!282940 mapRes!22306))))

(declare-fun condMapEmpty!22306 () Bool)

(declare-datatypes ((V!19385 0))(
  ( (V!19386 (val!6915 Int)) )
))
(declare-datatypes ((ValueCell!6506 0))(
  ( (ValueCellFull!6506 (v!9206 V!19385)) (EmptyCell!6506) )
))
(declare-datatypes ((array!31133 0))(
  ( (array!31134 (arr!14971 (Array (_ BitVec 32) ValueCell!6506)) (size!15329 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31133)

(declare-fun mapDefault!22306 () ValueCell!6506)

