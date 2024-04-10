; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69850 () Bool)

(assert start!69850)

(declare-fun b!812285 () Bool)

(declare-fun e!449869 () Bool)

(declare-fun e!449868 () Bool)

(declare-fun mapRes!22594 () Bool)

(assert (=> b!812285 (= e!449869 (and e!449868 mapRes!22594))))

(declare-fun condMapEmpty!22594 () Bool)

(declare-datatypes ((V!23687 0))(
  ( (V!23688 (val!7055 Int)) )
))
(declare-datatypes ((ValueCell!6592 0))(
  ( (ValueCellFull!6592 (v!9481 V!23687)) (EmptyCell!6592) )
))
(declare-datatypes ((array!44256 0))(
  ( (array!44257 (arr!21191 (Array (_ BitVec 32) ValueCell!6592)) (size!21612 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44256)

(declare-fun mapDefault!22594 () ValueCell!6592)

