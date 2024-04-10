; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74986 () Bool)

(assert start!74986)

(declare-fun b_free!15475 () Bool)

(declare-fun b_next!15475 () Bool)

(assert (=> start!74986 (= b_free!15475 (not b_next!15475))))

(declare-fun tp!54130 () Bool)

(declare-fun b_and!25665 () Bool)

(assert (=> start!74986 (= tp!54130 b_and!25665)))

(declare-fun mapIsEmpty!28218 () Bool)

(declare-fun mapRes!28218 () Bool)

(assert (=> mapIsEmpty!28218 mapRes!28218))

(declare-fun b!884525 () Bool)

(declare-fun e!492251 () Bool)

(declare-fun e!492253 () Bool)

(assert (=> b!884525 (= e!492251 (and e!492253 mapRes!28218))))

(declare-fun condMapEmpty!28218 () Bool)

(declare-datatypes ((V!28673 0))(
  ( (V!28674 (val!8907 Int)) )
))
(declare-datatypes ((ValueCell!8420 0))(
  ( (ValueCellFull!8420 (v!11380 V!28673)) (EmptyCell!8420) )
))
(declare-datatypes ((array!51566 0))(
  ( (array!51567 (arr!24801 (Array (_ BitVec 32) ValueCell!8420)) (size!25241 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51566)

(declare-fun mapDefault!28218 () ValueCell!8420)

