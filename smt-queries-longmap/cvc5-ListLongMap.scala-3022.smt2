; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42486 () Bool)

(assert start!42486)

(declare-fun b_free!11941 () Bool)

(declare-fun b_next!11941 () Bool)

(assert (=> start!42486 (= b_free!11941 (not b_next!11941))))

(declare-fun tp!41860 () Bool)

(declare-fun b_and!20409 () Bool)

(assert (=> start!42486 (= tp!41860 b_and!20409)))

(declare-fun mapNonEmpty!21769 () Bool)

(declare-fun mapRes!21769 () Bool)

(declare-fun tp!41859 () Bool)

(declare-fun e!278185 () Bool)

(assert (=> mapNonEmpty!21769 (= mapRes!21769 (and tp!41859 e!278185))))

(declare-datatypes ((V!18931 0))(
  ( (V!18932 (val!6729 Int)) )
))
(declare-datatypes ((ValueCell!6341 0))(
  ( (ValueCellFull!6341 (v!9021 V!18931)) (EmptyCell!6341) )
))
(declare-datatypes ((array!30493 0))(
  ( (array!30494 (arr!14665 (Array (_ BitVec 32) ValueCell!6341)) (size!15017 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30493)

(declare-fun mapValue!21769 () ValueCell!6341)

(declare-fun mapRest!21769 () (Array (_ BitVec 32) ValueCell!6341))

(declare-fun mapKey!21769 () (_ BitVec 32))

(assert (=> mapNonEmpty!21769 (= (arr!14665 _values!833) (store mapRest!21769 mapKey!21769 mapValue!21769))))

(declare-fun b!474045 () Bool)

(declare-fun tp_is_empty!13369 () Bool)

(assert (=> b!474045 (= e!278185 tp_is_empty!13369)))

(declare-fun b!474046 () Bool)

(declare-fun e!278186 () Bool)

(declare-fun e!278187 () Bool)

(assert (=> b!474046 (= e!278186 (and e!278187 mapRes!21769))))

(declare-fun condMapEmpty!21769 () Bool)

(declare-fun mapDefault!21769 () ValueCell!6341)

