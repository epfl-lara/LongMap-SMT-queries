; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42536 () Bool)

(assert start!42536)

(declare-fun b_free!11971 () Bool)

(declare-fun b_next!11971 () Bool)

(assert (=> start!42536 (= b_free!11971 (not b_next!11971))))

(declare-fun tp!41953 () Bool)

(declare-fun b_and!20451 () Bool)

(assert (=> start!42536 (= tp!41953 b_and!20451)))

(declare-fun b!474584 () Bool)

(declare-fun e!278567 () Bool)

(declare-fun tp_is_empty!13399 () Bool)

(assert (=> b!474584 (= e!278567 tp_is_empty!13399)))

(declare-fun b!474585 () Bool)

(declare-fun e!278564 () Bool)

(declare-fun mapRes!21817 () Bool)

(assert (=> b!474585 (= e!278564 (and e!278567 mapRes!21817))))

(declare-fun condMapEmpty!21817 () Bool)

(declare-datatypes ((V!18971 0))(
  ( (V!18972 (val!6744 Int)) )
))
(declare-datatypes ((ValueCell!6356 0))(
  ( (ValueCellFull!6356 (v!9037 V!18971)) (EmptyCell!6356) )
))
(declare-datatypes ((array!30547 0))(
  ( (array!30548 (arr!14691 (Array (_ BitVec 32) ValueCell!6356)) (size!15043 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30547)

(declare-fun mapDefault!21817 () ValueCell!6356)

