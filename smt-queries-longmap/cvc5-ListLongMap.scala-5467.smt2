; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72586 () Bool)

(assert start!72586)

(declare-fun res!572690 () Bool)

(declare-fun e!470014 () Bool)

(assert (=> start!72586 (=> (not res!572690) (not e!470014))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47544 0))(
  ( (array!47545 (arr!22803 (Array (_ BitVec 32) (_ BitVec 64))) (size!23243 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47544)

(assert (=> start!72586 (= res!572690 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23243 _keys!868))))))

(assert (=> start!72586 e!470014))

(assert (=> start!72586 true))

(declare-fun array_inv!18146 (array!47544) Bool)

(assert (=> start!72586 (array_inv!18146 _keys!868)))

(declare-datatypes ((V!25897 0))(
  ( (V!25898 (val!7866 Int)) )
))
(declare-datatypes ((ValueCell!7379 0))(
  ( (ValueCellFull!7379 (v!10291 V!25897)) (EmptyCell!7379) )
))
(declare-datatypes ((array!47546 0))(
  ( (array!47547 (arr!22804 (Array (_ BitVec 32) ValueCell!7379)) (size!23244 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47546)

(declare-fun e!470017 () Bool)

(declare-fun array_inv!18147 (array!47546) Bool)

(assert (=> start!72586 (and (array_inv!18147 _values!688) e!470017)))

(declare-fun b!842618 () Bool)

(assert (=> b!842618 (= e!470014 false)))

(declare-fun lt!381022 () Bool)

(declare-datatypes ((List!16216 0))(
  ( (Nil!16213) (Cons!16212 (h!17343 (_ BitVec 64)) (t!22587 List!16216)) )
))
(declare-fun arrayNoDuplicates!0 (array!47544 (_ BitVec 32) List!16216) Bool)

(assert (=> b!842618 (= lt!381022 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16213))))

(declare-fun b!842619 () Bool)

(declare-fun res!572691 () Bool)

(assert (=> b!842619 (=> (not res!572691) (not e!470014))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!842619 (= res!572691 (and (= (size!23244 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23243 _keys!868) (size!23244 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!842620 () Bool)

(declare-fun e!470016 () Bool)

(declare-fun tp_is_empty!15637 () Bool)

(assert (=> b!842620 (= e!470016 tp_is_empty!15637)))

(declare-fun b!842621 () Bool)

(declare-fun e!470015 () Bool)

(declare-fun mapRes!25055 () Bool)

(assert (=> b!842621 (= e!470017 (and e!470015 mapRes!25055))))

(declare-fun condMapEmpty!25055 () Bool)

(declare-fun mapDefault!25055 () ValueCell!7379)

