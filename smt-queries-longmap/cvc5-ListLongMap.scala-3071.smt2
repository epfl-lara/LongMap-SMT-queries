; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43278 () Bool)

(assert start!43278)

(declare-fun b_free!12145 () Bool)

(declare-fun b_next!12145 () Bool)

(assert (=> start!43278 (= b_free!12145 (not b_next!12145))))

(declare-fun tp!42705 () Bool)

(declare-fun b_and!20897 () Bool)

(assert (=> start!43278 (= tp!42705 b_and!20897)))

(declare-fun b!479489 () Bool)

(declare-fun e!282104 () Bool)

(declare-fun tp_is_empty!13657 () Bool)

(assert (=> b!479489 (= e!282104 tp_is_empty!13657)))

(declare-fun b!479490 () Bool)

(declare-fun e!282105 () Bool)

(declare-fun mapRes!22183 () Bool)

(assert (=> b!479490 (= e!282105 (and e!282104 mapRes!22183))))

(declare-fun condMapEmpty!22183 () Bool)

(declare-datatypes ((V!19281 0))(
  ( (V!19282 (val!6876 Int)) )
))
(declare-datatypes ((ValueCell!6467 0))(
  ( (ValueCellFull!6467 (v!9165 V!19281)) (EmptyCell!6467) )
))
(declare-datatypes ((array!30987 0))(
  ( (array!30988 (arr!14900 (Array (_ BitVec 32) ValueCell!6467)) (size!15258 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30987)

(declare-fun mapDefault!22183 () ValueCell!6467)

