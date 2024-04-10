; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34880 () Bool)

(assert start!34880)

(declare-fun b_free!7643 () Bool)

(declare-fun b_next!7643 () Bool)

(assert (=> start!34880 (= b_free!7643 (not b_next!7643))))

(declare-fun tp!26499 () Bool)

(declare-fun b_and!14867 () Bool)

(assert (=> start!34880 (= tp!26499 b_and!14867)))

(declare-fun b!349316 () Bool)

(declare-fun e!213983 () Bool)

(declare-fun e!213981 () Bool)

(declare-fun mapRes!12855 () Bool)

(assert (=> b!349316 (= e!213983 (and e!213981 mapRes!12855))))

(declare-fun condMapEmpty!12855 () Bool)

(declare-datatypes ((V!11103 0))(
  ( (V!11104 (val!3842 Int)) )
))
(declare-datatypes ((ValueCell!3454 0))(
  ( (ValueCellFull!3454 (v!6026 V!11103)) (EmptyCell!3454) )
))
(declare-datatypes ((array!18775 0))(
  ( (array!18776 (arr!8896 (Array (_ BitVec 32) ValueCell!3454)) (size!9248 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18775)

(declare-fun mapDefault!12855 () ValueCell!3454)

