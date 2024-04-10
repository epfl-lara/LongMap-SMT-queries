; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69868 () Bool)

(assert start!69868)

(declare-fun b!812376 () Bool)

(declare-fun e!449943 () Bool)

(assert (=> b!812376 (= e!449943 false)))

(declare-fun lt!364128 () Bool)

(declare-datatypes ((array!44268 0))(
  ( (array!44269 (arr!21196 (Array (_ BitVec 32) (_ BitVec 64))) (size!21617 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44268)

(declare-datatypes ((List!15095 0))(
  ( (Nil!15092) (Cons!15091 (h!16220 (_ BitVec 64)) (t!21410 List!15095)) )
))
(declare-fun arrayNoDuplicates!0 (array!44268 (_ BitVec 32) List!15095) Bool)

(assert (=> b!812376 (= lt!364128 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15092))))

(declare-fun b!812377 () Bool)

(declare-fun e!449941 () Bool)

(declare-fun tp_is_empty!14021 () Bool)

(assert (=> b!812377 (= e!449941 tp_is_empty!14021)))

(declare-fun mapNonEmpty!22606 () Bool)

(declare-fun mapRes!22606 () Bool)

(declare-fun tp!43714 () Bool)

(declare-fun e!449942 () Bool)

(assert (=> mapNonEmpty!22606 (= mapRes!22606 (and tp!43714 e!449942))))

(declare-datatypes ((V!23695 0))(
  ( (V!23696 (val!7058 Int)) )
))
(declare-datatypes ((ValueCell!6595 0))(
  ( (ValueCellFull!6595 (v!9485 V!23695)) (EmptyCell!6595) )
))
(declare-fun mapValue!22606 () ValueCell!6595)

(declare-datatypes ((array!44270 0))(
  ( (array!44271 (arr!21197 (Array (_ BitVec 32) ValueCell!6595)) (size!21618 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44270)

(declare-fun mapKey!22606 () (_ BitVec 32))

(declare-fun mapRest!22606 () (Array (_ BitVec 32) ValueCell!6595))

(assert (=> mapNonEmpty!22606 (= (arr!21197 _values!788) (store mapRest!22606 mapKey!22606 mapValue!22606))))

(declare-fun res!555147 () Bool)

(assert (=> start!69868 (=> (not res!555147) (not e!449943))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69868 (= res!555147 (validMask!0 mask!1312))))

(assert (=> start!69868 e!449943))

(declare-fun array_inv!16981 (array!44268) Bool)

(assert (=> start!69868 (array_inv!16981 _keys!976)))

(assert (=> start!69868 true))

(declare-fun e!449940 () Bool)

(declare-fun array_inv!16982 (array!44270) Bool)

(assert (=> start!69868 (and (array_inv!16982 _values!788) e!449940)))

(declare-fun b!812378 () Bool)

(assert (=> b!812378 (= e!449940 (and e!449941 mapRes!22606))))

(declare-fun condMapEmpty!22606 () Bool)

(declare-fun mapDefault!22606 () ValueCell!6595)

