; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43492 () Bool)

(assert start!43492)

(declare-fun b_free!12271 () Bool)

(declare-fun b_next!12271 () Bool)

(assert (=> start!43492 (= b_free!12271 (not b_next!12271))))

(declare-fun tp!43096 () Bool)

(declare-fun b_and!21031 () Bool)

(assert (=> start!43492 (= tp!43096 b_and!21031)))

(declare-fun b!481901 () Bool)

(declare-fun e!283538 () Bool)

(declare-fun e!283537 () Bool)

(declare-fun mapRes!22384 () Bool)

(assert (=> b!481901 (= e!283538 (and e!283537 mapRes!22384))))

(declare-fun condMapEmpty!22384 () Bool)

(declare-datatypes ((V!19449 0))(
  ( (V!19450 (val!6939 Int)) )
))
(declare-datatypes ((ValueCell!6530 0))(
  ( (ValueCellFull!6530 (v!9232 V!19449)) (EmptyCell!6530) )
))
(declare-datatypes ((array!31227 0))(
  ( (array!31228 (arr!15016 (Array (_ BitVec 32) ValueCell!6530)) (size!15374 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31227)

(declare-fun mapDefault!22384 () ValueCell!6530)

