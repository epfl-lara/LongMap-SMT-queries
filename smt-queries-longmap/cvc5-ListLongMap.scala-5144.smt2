; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69784 () Bool)

(assert start!69784)

(declare-fun b!811904 () Bool)

(declare-fun e!449547 () Bool)

(declare-fun e!449544 () Bool)

(declare-fun mapRes!22531 () Bool)

(assert (=> b!811904 (= e!449547 (and e!449544 mapRes!22531))))

(declare-fun condMapEmpty!22531 () Bool)

(declare-datatypes ((V!23643 0))(
  ( (V!23644 (val!7038 Int)) )
))
(declare-datatypes ((ValueCell!6575 0))(
  ( (ValueCellFull!6575 (v!9464 V!23643)) (EmptyCell!6575) )
))
(declare-datatypes ((array!44184 0))(
  ( (array!44185 (arr!21159 (Array (_ BitVec 32) ValueCell!6575)) (size!21580 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44184)

(declare-fun mapDefault!22531 () ValueCell!6575)

