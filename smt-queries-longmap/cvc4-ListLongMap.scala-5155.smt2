; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69898 () Bool)

(assert start!69898)

(declare-fun b!812646 () Bool)

(declare-fun e!450168 () Bool)

(declare-fun e!450166 () Bool)

(declare-fun mapRes!22651 () Bool)

(assert (=> b!812646 (= e!450168 (and e!450166 mapRes!22651))))

(declare-fun condMapEmpty!22651 () Bool)

(declare-datatypes ((V!23735 0))(
  ( (V!23736 (val!7073 Int)) )
))
(declare-datatypes ((ValueCell!6610 0))(
  ( (ValueCellFull!6610 (v!9500 V!23735)) (EmptyCell!6610) )
))
(declare-datatypes ((array!44322 0))(
  ( (array!44323 (arr!21223 (Array (_ BitVec 32) ValueCell!6610)) (size!21644 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44322)

(declare-fun mapDefault!22651 () ValueCell!6610)

