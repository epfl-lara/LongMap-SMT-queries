; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70588 () Bool)

(assert start!70588)

(declare-fun b_free!12895 () Bool)

(declare-fun b_next!12895 () Bool)

(assert (=> start!70588 (= b_free!12895 (not b_next!12895))))

(declare-fun tp!45420 () Bool)

(declare-fun b_and!21737 () Bool)

(assert (=> start!70588 (= tp!45420 b_and!21737)))

(declare-fun b!820034 () Bool)

(declare-fun e!455515 () Bool)

(declare-fun e!455516 () Bool)

(declare-fun mapRes!23509 () Bool)

(assert (=> b!820034 (= e!455515 (and e!455516 mapRes!23509))))

(declare-fun condMapEmpty!23509 () Bool)

(declare-datatypes ((V!24475 0))(
  ( (V!24476 (val!7350 Int)) )
))
(declare-datatypes ((ValueCell!6887 0))(
  ( (ValueCellFull!6887 (v!9780 V!24475)) (EmptyCell!6887) )
))
(declare-datatypes ((array!45406 0))(
  ( (array!45407 (arr!21756 (Array (_ BitVec 32) ValueCell!6887)) (size!22177 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45406)

(declare-fun mapDefault!23509 () ValueCell!6887)

