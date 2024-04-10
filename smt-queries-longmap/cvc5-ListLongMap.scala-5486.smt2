; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72700 () Bool)

(assert start!72700)

(declare-fun b!843815 () Bool)

(declare-fun e!470872 () Bool)

(declare-fun tp_is_empty!15751 () Bool)

(assert (=> b!843815 (= e!470872 tp_is_empty!15751)))

(declare-fun b!843816 () Bool)

(declare-fun e!470871 () Bool)

(assert (=> b!843816 (= e!470871 false)))

(declare-fun lt!381193 () Bool)

(declare-datatypes ((array!47746 0))(
  ( (array!47747 (arr!22904 (Array (_ BitVec 32) (_ BitVec 64))) (size!23344 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47746)

(declare-datatypes ((List!16250 0))(
  ( (Nil!16247) (Cons!16246 (h!17377 (_ BitVec 64)) (t!22621 List!16250)) )
))
(declare-fun arrayNoDuplicates!0 (array!47746 (_ BitVec 32) List!16250) Bool)

(assert (=> b!843816 (= lt!381193 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16247))))

(declare-fun b!843817 () Bool)

(declare-fun e!470870 () Bool)

(declare-fun mapRes!25226 () Bool)

(assert (=> b!843817 (= e!470870 (and e!470872 mapRes!25226))))

(declare-fun condMapEmpty!25226 () Bool)

(declare-datatypes ((V!26049 0))(
  ( (V!26050 (val!7923 Int)) )
))
(declare-datatypes ((ValueCell!7436 0))(
  ( (ValueCellFull!7436 (v!10348 V!26049)) (EmptyCell!7436) )
))
(declare-datatypes ((array!47748 0))(
  ( (array!47749 (arr!22905 (Array (_ BitVec 32) ValueCell!7436)) (size!23345 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47748)

(declare-fun mapDefault!25226 () ValueCell!7436)

