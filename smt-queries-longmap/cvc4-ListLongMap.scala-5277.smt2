; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70816 () Bool)

(assert start!70816)

(declare-fun b_free!13073 () Bool)

(declare-fun b_next!13073 () Bool)

(assert (=> start!70816 (= b_free!13073 (not b_next!13073))))

(declare-fun tp!45964 () Bool)

(declare-fun b_and!21945 () Bool)

(assert (=> start!70816 (= tp!45964 b_and!21945)))

(declare-fun b!822550 () Bool)

(declare-fun e!457346 () Bool)

(declare-fun tp_is_empty!14783 () Bool)

(assert (=> b!822550 (= e!457346 tp_is_empty!14783)))

(declare-fun res!561021 () Bool)

(declare-fun e!457347 () Bool)

(assert (=> start!70816 (=> (not res!561021) (not e!457347))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70816 (= res!561021 (validMask!0 mask!1312))))

(assert (=> start!70816 e!457347))

(assert (=> start!70816 tp_is_empty!14783))

(declare-datatypes ((array!45758 0))(
  ( (array!45759 (arr!21929 (Array (_ BitVec 32) (_ BitVec 64))) (size!22350 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45758)

(declare-fun array_inv!17517 (array!45758) Bool)

(assert (=> start!70816 (array_inv!17517 _keys!976)))

(assert (=> start!70816 true))

(declare-datatypes ((V!24711 0))(
  ( (V!24712 (val!7439 Int)) )
))
(declare-datatypes ((ValueCell!6976 0))(
  ( (ValueCellFull!6976 (v!9870 V!24711)) (EmptyCell!6976) )
))
(declare-datatypes ((array!45760 0))(
  ( (array!45761 (arr!21930 (Array (_ BitVec 32) ValueCell!6976)) (size!22351 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45760)

(declare-fun e!457342 () Bool)

(declare-fun array_inv!17518 (array!45760) Bool)

(assert (=> start!70816 (and (array_inv!17518 _values!788) e!457342)))

(assert (=> start!70816 tp!45964))

(declare-fun b!822551 () Bool)

(declare-fun res!561020 () Bool)

(assert (=> b!822551 (=> (not res!561020) (not e!457347))))

(declare-datatypes ((List!15642 0))(
  ( (Nil!15639) (Cons!15638 (h!16767 (_ BitVec 64)) (t!21979 List!15642)) )
))
(declare-fun arrayNoDuplicates!0 (array!45758 (_ BitVec 32) List!15642) Bool)

(assert (=> b!822551 (= res!561020 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15639))))

(declare-fun mapIsEmpty!23785 () Bool)

(declare-fun mapRes!23785 () Bool)

(assert (=> mapIsEmpty!23785 mapRes!23785))

(declare-fun b!822552 () Bool)

(assert (=> b!822552 (= e!457342 (and e!457346 mapRes!23785))))

(declare-fun condMapEmpty!23785 () Bool)

(declare-fun mapDefault!23785 () ValueCell!6976)

