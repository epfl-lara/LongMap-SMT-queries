; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69946 () Bool)

(assert start!69946)

(declare-fun b_free!12379 () Bool)

(declare-fun b_next!12379 () Bool)

(assert (=> start!69946 (= b_free!12379 (not b_next!12379))))

(declare-fun tp!43849 () Bool)

(declare-fun b_and!21147 () Bool)

(assert (=> start!69946 (= tp!43849 b_and!21147)))

(declare-fun b!813061 () Bool)

(declare-fun e!450476 () Bool)

(declare-fun e!450478 () Bool)

(declare-fun mapRes!22711 () Bool)

(assert (=> b!813061 (= e!450476 (and e!450478 mapRes!22711))))

(declare-fun condMapEmpty!22711 () Bool)

(declare-datatypes ((V!23787 0))(
  ( (V!23788 (val!7092 Int)) )
))
(declare-datatypes ((ValueCell!6629 0))(
  ( (ValueCellFull!6629 (v!9519 V!23787)) (EmptyCell!6629) )
))
(declare-datatypes ((array!44392 0))(
  ( (array!44393 (arr!21257 (Array (_ BitVec 32) ValueCell!6629)) (size!21678 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44392)

(declare-fun mapDefault!22711 () ValueCell!6629)

