; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69816 () Bool)

(assert start!69816)

(declare-fun b!812062 () Bool)

(declare-fun e!449702 () Bool)

(declare-fun tp_is_empty!13999 () Bool)

(assert (=> b!812062 (= e!449702 tp_is_empty!13999)))

(declare-fun b!812063 () Bool)

(declare-fun e!449703 () Bool)

(declare-datatypes ((array!44220 0))(
  ( (array!44221 (arr!21175 (Array (_ BitVec 32) (_ BitVec 64))) (size!21596 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44220)

(assert (=> b!812063 (= e!449703 (and (bvsle #b00000000000000000000000000000000 (size!21596 _keys!976)) (bvsge (size!21596 _keys!976) #b01111111111111111111111111111111)))))

(declare-fun b!812065 () Bool)

(declare-fun e!449701 () Bool)

(assert (=> b!812065 (= e!449701 tp_is_empty!13999)))

(declare-fun mapIsEmpty!22564 () Bool)

(declare-fun mapRes!22564 () Bool)

(assert (=> mapIsEmpty!22564 mapRes!22564))

(declare-fun b!812066 () Bool)

(declare-fun e!449700 () Bool)

(assert (=> b!812066 (= e!449700 (and e!449701 mapRes!22564))))

(declare-fun condMapEmpty!22564 () Bool)

(declare-datatypes ((V!23667 0))(
  ( (V!23668 (val!7047 Int)) )
))
(declare-datatypes ((ValueCell!6584 0))(
  ( (ValueCellFull!6584 (v!9473 V!23667)) (EmptyCell!6584) )
))
(declare-datatypes ((array!44222 0))(
  ( (array!44223 (arr!21176 (Array (_ BitVec 32) ValueCell!6584)) (size!21597 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44222)

(declare-fun mapDefault!22564 () ValueCell!6584)

