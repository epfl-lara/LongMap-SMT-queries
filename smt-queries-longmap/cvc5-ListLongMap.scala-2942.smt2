; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41858 () Bool)

(assert start!41858)

(declare-fun b_free!11461 () Bool)

(declare-fun b_next!11461 () Bool)

(assert (=> start!41858 (= b_free!11461 (not b_next!11461))))

(declare-fun tp!40392 () Bool)

(declare-fun b_and!19841 () Bool)

(assert (=> start!41858 (= tp!40392 b_and!19841)))

(declare-fun b!467387 () Bool)

(declare-fun e!273397 () Bool)

(declare-fun tp_is_empty!12889 () Bool)

(assert (=> b!467387 (= e!273397 tp_is_empty!12889)))

(declare-fun b!467388 () Bool)

(declare-fun e!273399 () Bool)

(declare-fun mapRes!21022 () Bool)

(assert (=> b!467388 (= e!273399 (and e!273397 mapRes!21022))))

(declare-fun condMapEmpty!21022 () Bool)

(declare-datatypes ((V!18291 0))(
  ( (V!18292 (val!6489 Int)) )
))
(declare-datatypes ((ValueCell!6101 0))(
  ( (ValueCellFull!6101 (v!8778 V!18291)) (EmptyCell!6101) )
))
(declare-datatypes ((array!29557 0))(
  ( (array!29558 (arr!14206 (Array (_ BitVec 32) ValueCell!6101)) (size!14558 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29557)

(declare-fun mapDefault!21022 () ValueCell!6101)

