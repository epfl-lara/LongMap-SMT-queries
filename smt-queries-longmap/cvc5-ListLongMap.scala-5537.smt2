; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73006 () Bool)

(assert start!73006)

(declare-fun b_free!13921 () Bool)

(declare-fun b_next!13921 () Bool)

(assert (=> start!73006 (= b_free!13921 (not b_next!13921))))

(declare-fun tp!49266 () Bool)

(declare-fun b_and!23007 () Bool)

(assert (=> start!73006 (= tp!49266 b_and!23007)))

(declare-fun b!848304 () Bool)

(declare-fun e!473313 () Bool)

(declare-fun e!473314 () Bool)

(declare-fun mapRes!25685 () Bool)

(assert (=> b!848304 (= e!473313 (and e!473314 mapRes!25685))))

(declare-fun condMapEmpty!25685 () Bool)

(declare-datatypes ((V!26457 0))(
  ( (V!26458 (val!8076 Int)) )
))
(declare-datatypes ((ValueCell!7589 0))(
  ( (ValueCellFull!7589 (v!10501 V!26457)) (EmptyCell!7589) )
))
(declare-datatypes ((array!48322 0))(
  ( (array!48323 (arr!23192 (Array (_ BitVec 32) ValueCell!7589)) (size!23632 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48322)

(declare-fun mapDefault!25685 () ValueCell!7589)

