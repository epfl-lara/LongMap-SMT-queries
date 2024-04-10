; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69916 () Bool)

(assert start!69916)

(declare-fun b!812816 () Bool)

(declare-fun e!450299 () Bool)

(declare-fun e!450302 () Bool)

(declare-fun mapRes!22678 () Bool)

(assert (=> b!812816 (= e!450299 (and e!450302 mapRes!22678))))

(declare-fun condMapEmpty!22678 () Bool)

(declare-datatypes ((V!23759 0))(
  ( (V!23760 (val!7082 Int)) )
))
(declare-datatypes ((ValueCell!6619 0))(
  ( (ValueCellFull!6619 (v!9509 V!23759)) (EmptyCell!6619) )
))
(declare-datatypes ((array!44354 0))(
  ( (array!44355 (arr!21239 (Array (_ BitVec 32) ValueCell!6619)) (size!21660 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44354)

(declare-fun mapDefault!22678 () ValueCell!6619)

