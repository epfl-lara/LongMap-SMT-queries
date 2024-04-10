; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41182 () Bool)

(assert start!41182)

(declare-fun b_free!11051 () Bool)

(declare-fun b_next!11051 () Bool)

(assert (=> start!41182 (= b_free!11051 (not b_next!11051))))

(declare-fun tp!38988 () Bool)

(declare-fun b_and!19341 () Bool)

(assert (=> start!41182 (= tp!38988 b_and!19341)))

(declare-fun b!460371 () Bool)

(declare-fun e!268590 () Bool)

(declare-fun e!268591 () Bool)

(declare-fun mapRes!20233 () Bool)

(assert (=> b!460371 (= e!268590 (and e!268591 mapRes!20233))))

(declare-fun condMapEmpty!20233 () Bool)

(declare-datatypes ((V!17623 0))(
  ( (V!17624 (val!6239 Int)) )
))
(declare-datatypes ((ValueCell!5851 0))(
  ( (ValueCellFull!5851 (v!8517 V!17623)) (EmptyCell!5851) )
))
(declare-datatypes ((array!28579 0))(
  ( (array!28580 (arr!13730 (Array (_ BitVec 32) ValueCell!5851)) (size!14082 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28579)

(declare-fun mapDefault!20233 () ValueCell!5851)

