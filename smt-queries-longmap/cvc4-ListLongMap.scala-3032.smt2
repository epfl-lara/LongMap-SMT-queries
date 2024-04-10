; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42570 () Bool)

(assert start!42570)

(declare-fun b_free!12005 () Bool)

(declare-fun b_next!12005 () Bool)

(assert (=> start!42570 (= b_free!12005 (not b_next!12005))))

(declare-fun tp!42055 () Bool)

(declare-fun b_and!20485 () Bool)

(assert (=> start!42570 (= tp!42055 b_and!20485)))

(declare-fun b!474941 () Bool)

(declare-fun e!278821 () Bool)

(declare-fun e!278820 () Bool)

(declare-fun mapRes!21868 () Bool)

(assert (=> b!474941 (= e!278821 (and e!278820 mapRes!21868))))

(declare-fun condMapEmpty!21868 () Bool)

(declare-datatypes ((V!19015 0))(
  ( (V!19016 (val!6761 Int)) )
))
(declare-datatypes ((ValueCell!6373 0))(
  ( (ValueCellFull!6373 (v!9054 V!19015)) (EmptyCell!6373) )
))
(declare-datatypes ((array!30609 0))(
  ( (array!30610 (arr!14722 (Array (_ BitVec 32) ValueCell!6373)) (size!15074 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30609)

(declare-fun mapDefault!21868 () ValueCell!6373)

