; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69870 () Bool)

(assert start!69870)

(declare-fun b!812394 () Bool)

(declare-fun e!449957 () Bool)

(declare-fun e!449955 () Bool)

(declare-fun mapRes!22609 () Bool)

(assert (=> b!812394 (= e!449957 (and e!449955 mapRes!22609))))

(declare-fun condMapEmpty!22609 () Bool)

(declare-datatypes ((V!23699 0))(
  ( (V!23700 (val!7059 Int)) )
))
(declare-datatypes ((ValueCell!6596 0))(
  ( (ValueCellFull!6596 (v!9486 V!23699)) (EmptyCell!6596) )
))
(declare-datatypes ((array!44272 0))(
  ( (array!44273 (arr!21198 (Array (_ BitVec 32) ValueCell!6596)) (size!21619 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44272)

(declare-fun mapDefault!22609 () ValueCell!6596)

