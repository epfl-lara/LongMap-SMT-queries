; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69880 () Bool)

(assert start!69880)

(declare-fun b!812484 () Bool)

(declare-fun e!450030 () Bool)

(declare-fun e!450029 () Bool)

(declare-fun mapRes!22624 () Bool)

(assert (=> b!812484 (= e!450030 (and e!450029 mapRes!22624))))

(declare-fun condMapEmpty!22624 () Bool)

(declare-datatypes ((V!23711 0))(
  ( (V!23712 (val!7064 Int)) )
))
(declare-datatypes ((ValueCell!6601 0))(
  ( (ValueCellFull!6601 (v!9491 V!23711)) (EmptyCell!6601) )
))
(declare-datatypes ((array!44290 0))(
  ( (array!44291 (arr!21207 (Array (_ BitVec 32) ValueCell!6601)) (size!21628 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44290)

(declare-fun mapDefault!22624 () ValueCell!6601)

