; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69806 () Bool)

(assert start!69806)

(declare-fun b!812024 () Bool)

(declare-fun e!449672 () Bool)

(declare-fun tp_is_empty!13997 () Bool)

(assert (=> b!812024 (= e!449672 tp_is_empty!13997)))

(declare-fun mapIsEmpty!22558 () Bool)

(declare-fun mapRes!22558 () Bool)

(assert (=> mapIsEmpty!22558 mapRes!22558))

(declare-fun b!812025 () Bool)

(declare-fun e!449673 () Bool)

(assert (=> b!812025 (= e!449673 (and e!449672 mapRes!22558))))

(declare-fun condMapEmpty!22558 () Bool)

(declare-datatypes ((V!23663 0))(
  ( (V!23664 (val!7046 Int)) )
))
(declare-datatypes ((ValueCell!6583 0))(
  ( (ValueCellFull!6583 (v!9472 V!23663)) (EmptyCell!6583) )
))
(declare-datatypes ((array!44216 0))(
  ( (array!44217 (arr!21174 (Array (_ BitVec 32) ValueCell!6583)) (size!21595 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44216)

(declare-fun mapDefault!22558 () ValueCell!6583)

