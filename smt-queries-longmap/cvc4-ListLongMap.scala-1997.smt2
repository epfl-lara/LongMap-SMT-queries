; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34914 () Bool)

(assert start!34914)

(declare-fun b_free!7655 () Bool)

(declare-fun b_next!7655 () Bool)

(assert (=> start!34914 (= b_free!7655 (not b_next!7655))))

(declare-fun tp!26537 () Bool)

(declare-fun b_and!14881 () Bool)

(assert (=> start!34914 (= tp!26537 b_and!14881)))

(declare-fun b!349664 () Bool)

(declare-fun e!214191 () Bool)

(declare-fun e!214187 () Bool)

(declare-fun mapRes!12876 () Bool)

(assert (=> b!349664 (= e!214191 (and e!214187 mapRes!12876))))

(declare-fun condMapEmpty!12876 () Bool)

(declare-datatypes ((V!11119 0))(
  ( (V!11120 (val!3848 Int)) )
))
(declare-datatypes ((ValueCell!3460 0))(
  ( (ValueCellFull!3460 (v!6033 V!11119)) (EmptyCell!3460) )
))
(declare-datatypes ((array!18799 0))(
  ( (array!18800 (arr!8907 (Array (_ BitVec 32) ValueCell!3460)) (size!9259 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18799)

(declare-fun mapDefault!12876 () ValueCell!3460)

