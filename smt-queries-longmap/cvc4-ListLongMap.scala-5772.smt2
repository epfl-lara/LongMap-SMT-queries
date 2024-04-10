; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74538 () Bool)

(assert start!74538)

(declare-fun b_free!15227 () Bool)

(declare-fun b_next!15227 () Bool)

(assert (=> start!74538 (= b_free!15227 (not b_next!15227))))

(declare-fun tp!53362 () Bool)

(declare-fun b_and!25103 () Bool)

(assert (=> start!74538 (= tp!53362 b_and!25103)))

(declare-fun b!878081 () Bool)

(declare-fun e!488739 () Bool)

(declare-fun e!488738 () Bool)

(declare-fun mapRes!27822 () Bool)

(assert (=> b!878081 (= e!488739 (and e!488738 mapRes!27822))))

(declare-fun condMapEmpty!27822 () Bool)

(declare-datatypes ((V!28341 0))(
  ( (V!28342 (val!8783 Int)) )
))
(declare-datatypes ((ValueCell!8296 0))(
  ( (ValueCellFull!8296 (v!11223 V!28341)) (EmptyCell!8296) )
))
(declare-datatypes ((array!51070 0))(
  ( (array!51071 (arr!24561 (Array (_ BitVec 32) ValueCell!8296)) (size!25001 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51070)

(declare-fun mapDefault!27822 () ValueCell!8296)

