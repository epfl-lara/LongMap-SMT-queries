; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72676 () Bool)

(assert start!72676)

(declare-fun b!843563 () Bool)

(declare-fun e!470691 () Bool)

(declare-fun tp_is_empty!15727 () Bool)

(assert (=> b!843563 (= e!470691 tp_is_empty!15727)))

(declare-fun b!843564 () Bool)

(declare-fun res!573233 () Bool)

(declare-fun e!470688 () Bool)

(assert (=> b!843564 (=> (not res!573233) (not e!470688))))

(declare-datatypes ((array!47700 0))(
  ( (array!47701 (arr!22881 (Array (_ BitVec 32) (_ BitVec 64))) (size!23321 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47700)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47700 (_ BitVec 32)) Bool)

(assert (=> b!843564 (= res!573233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!573232 () Bool)

(assert (=> start!72676 (=> (not res!573232) (not e!470688))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72676 (= res!573232 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23321 _keys!868))))))

(assert (=> start!72676 e!470688))

(assert (=> start!72676 true))

(declare-fun array_inv!18196 (array!47700) Bool)

(assert (=> start!72676 (array_inv!18196 _keys!868)))

(declare-datatypes ((V!26017 0))(
  ( (V!26018 (val!7911 Int)) )
))
(declare-datatypes ((ValueCell!7424 0))(
  ( (ValueCellFull!7424 (v!10336 V!26017)) (EmptyCell!7424) )
))
(declare-datatypes ((array!47702 0))(
  ( (array!47703 (arr!22882 (Array (_ BitVec 32) ValueCell!7424)) (size!23322 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47702)

(declare-fun e!470692 () Bool)

(declare-fun array_inv!18197 (array!47702) Bool)

(assert (=> start!72676 (and (array_inv!18197 _values!688) e!470692)))

(declare-fun b!843565 () Bool)

(assert (=> b!843565 (= e!470688 false)))

(declare-fun lt!381157 () Bool)

(declare-datatypes ((List!16241 0))(
  ( (Nil!16238) (Cons!16237 (h!17368 (_ BitVec 64)) (t!22612 List!16241)) )
))
(declare-fun arrayNoDuplicates!0 (array!47700 (_ BitVec 32) List!16241) Bool)

(assert (=> b!843565 (= lt!381157 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16238))))

(declare-fun b!843566 () Bool)

(declare-fun e!470690 () Bool)

(assert (=> b!843566 (= e!470690 tp_is_empty!15727)))

(declare-fun b!843567 () Bool)

(declare-fun mapRes!25190 () Bool)

(assert (=> b!843567 (= e!470692 (and e!470691 mapRes!25190))))

(declare-fun condMapEmpty!25190 () Bool)

(declare-fun mapDefault!25190 () ValueCell!7424)

