; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41498 () Bool)

(assert start!41498)

(declare-fun b_free!11165 () Bool)

(declare-fun b_next!11165 () Bool)

(assert (=> start!41498 (= b_free!11165 (not b_next!11165))))

(declare-fun tp!39492 () Bool)

(declare-fun b_and!19505 () Bool)

(assert (=> start!41498 (= tp!39492 b_and!19505)))

(declare-fun b!463579 () Bool)

(declare-fun e!270684 () Bool)

(declare-fun e!270687 () Bool)

(declare-fun mapRes!20566 () Bool)

(assert (=> b!463579 (= e!270684 (and e!270687 mapRes!20566))))

(declare-fun condMapEmpty!20566 () Bool)

(declare-datatypes ((V!17895 0))(
  ( (V!17896 (val!6341 Int)) )
))
(declare-datatypes ((ValueCell!5953 0))(
  ( (ValueCellFull!5953 (v!8628 V!17895)) (EmptyCell!5953) )
))
(declare-datatypes ((array!28981 0))(
  ( (array!28982 (arr!13922 (Array (_ BitVec 32) ValueCell!5953)) (size!14274 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28981)

(declare-fun mapDefault!20566 () ValueCell!5953)

