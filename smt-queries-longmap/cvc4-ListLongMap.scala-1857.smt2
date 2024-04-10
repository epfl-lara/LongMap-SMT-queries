; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33526 () Bool)

(assert start!33526)

(declare-fun b_free!6815 () Bool)

(declare-fun b_next!6815 () Bool)

(assert (=> start!33526 (= b_free!6815 (not b_next!6815))))

(declare-fun tp!23940 () Bool)

(declare-fun b_and!13989 () Bool)

(assert (=> start!33526 (= tp!23940 b_and!13989)))

(declare-fun b!332726 () Bool)

(declare-fun e!204314 () Bool)

(declare-fun e!204317 () Bool)

(declare-fun mapRes!11538 () Bool)

(assert (=> b!332726 (= e!204314 (and e!204317 mapRes!11538))))

(declare-fun condMapEmpty!11538 () Bool)

(declare-datatypes ((V!9999 0))(
  ( (V!10000 (val!3428 Int)) )
))
(declare-datatypes ((ValueCell!3040 0))(
  ( (ValueCellFull!3040 (v!5587 V!9999)) (EmptyCell!3040) )
))
(declare-datatypes ((array!17131 0))(
  ( (array!17132 (arr!8099 (Array (_ BitVec 32) ValueCell!3040)) (size!8451 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17131)

(declare-fun mapDefault!11538 () ValueCell!3040)

