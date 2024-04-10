; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35072 () Bool)

(assert start!35072)

(declare-fun b_free!7739 () Bool)

(declare-fun b_next!7739 () Bool)

(assert (=> start!35072 (= b_free!7739 (not b_next!7739))))

(declare-fun tp!26799 () Bool)

(declare-fun b_and!14971 () Bool)

(assert (=> start!35072 (= tp!26799 b_and!14971)))

(declare-fun b!351584 () Bool)

(declare-fun e!215302 () Bool)

(declare-fun tp_is_empty!7691 () Bool)

(assert (=> b!351584 (= e!215302 tp_is_empty!7691)))

(declare-fun b!351585 () Bool)

(declare-fun e!215304 () Bool)

(declare-fun e!215308 () Bool)

(declare-fun mapRes!13011 () Bool)

(assert (=> b!351585 (= e!215304 (and e!215308 mapRes!13011))))

(declare-fun condMapEmpty!13011 () Bool)

(declare-datatypes ((V!11231 0))(
  ( (V!11232 (val!3890 Int)) )
))
(declare-datatypes ((ValueCell!3502 0))(
  ( (ValueCellFull!3502 (v!6078 V!11231)) (EmptyCell!3502) )
))
(declare-datatypes ((array!18971 0))(
  ( (array!18972 (arr!8990 (Array (_ BitVec 32) ValueCell!3502)) (size!9342 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18971)

(declare-fun mapDefault!13011 () ValueCell!3502)

