; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34852 () Bool)

(assert start!34852)

(declare-fun b_free!7637 () Bool)

(declare-fun b_next!7637 () Bool)

(assert (=> start!34852 (= b_free!7637 (not b_next!7637))))

(declare-fun tp!26478 () Bool)

(declare-fun b_and!14859 () Bool)

(assert (=> start!34852 (= tp!26478 b_and!14859)))

(declare-fun b!349070 () Bool)

(declare-fun e!213829 () Bool)

(declare-fun e!213826 () Bool)

(declare-fun mapRes!12843 () Bool)

(assert (=> b!349070 (= e!213829 (and e!213826 mapRes!12843))))

(declare-fun condMapEmpty!12843 () Bool)

(declare-datatypes ((V!11095 0))(
  ( (V!11096 (val!3839 Int)) )
))
(declare-datatypes ((ValueCell!3451 0))(
  ( (ValueCellFull!3451 (v!6022 V!11095)) (EmptyCell!3451) )
))
(declare-datatypes ((array!18763 0))(
  ( (array!18764 (arr!8891 (Array (_ BitVec 32) ValueCell!3451)) (size!9243 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18763)

(declare-fun mapDefault!12843 () ValueCell!3451)

