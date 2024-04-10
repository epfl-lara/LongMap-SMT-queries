; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72608 () Bool)

(assert start!72608)

(declare-fun b!842850 () Bool)

(declare-fun e!470182 () Bool)

(assert (=> b!842850 (= e!470182 false)))

(declare-fun lt!381055 () Bool)

(declare-datatypes ((array!47584 0))(
  ( (array!47585 (arr!22823 (Array (_ BitVec 32) (_ BitVec 64))) (size!23263 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47584)

(declare-datatypes ((List!16223 0))(
  ( (Nil!16220) (Cons!16219 (h!17350 (_ BitVec 64)) (t!22594 List!16223)) )
))
(declare-fun arrayNoDuplicates!0 (array!47584 (_ BitVec 32) List!16223) Bool)

(assert (=> b!842850 (= lt!381055 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16220))))

(declare-fun mapIsEmpty!25088 () Bool)

(declare-fun mapRes!25088 () Bool)

(assert (=> mapIsEmpty!25088 mapRes!25088))

(declare-fun b!842851 () Bool)

(declare-fun res!572824 () Bool)

(assert (=> b!842851 (=> (not res!572824) (not e!470182))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842851 (= res!572824 (validMask!0 mask!1196))))

(declare-fun b!842852 () Bool)

(declare-fun e!470180 () Bool)

(declare-fun tp_is_empty!15659 () Bool)

(assert (=> b!842852 (= e!470180 tp_is_empty!15659)))

(declare-fun mapNonEmpty!25088 () Bool)

(declare-fun tp!48406 () Bool)

(assert (=> mapNonEmpty!25088 (= mapRes!25088 (and tp!48406 e!470180))))

(declare-datatypes ((V!25925 0))(
  ( (V!25926 (val!7877 Int)) )
))
(declare-datatypes ((ValueCell!7390 0))(
  ( (ValueCellFull!7390 (v!10302 V!25925)) (EmptyCell!7390) )
))
(declare-fun mapValue!25088 () ValueCell!7390)

(declare-fun mapKey!25088 () (_ BitVec 32))

(declare-fun mapRest!25088 () (Array (_ BitVec 32) ValueCell!7390))

(declare-datatypes ((array!47586 0))(
  ( (array!47587 (arr!22824 (Array (_ BitVec 32) ValueCell!7390)) (size!23264 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47586)

(assert (=> mapNonEmpty!25088 (= (arr!22824 _values!688) (store mapRest!25088 mapKey!25088 mapValue!25088))))

(declare-fun b!842853 () Bool)

(declare-fun res!572823 () Bool)

(assert (=> b!842853 (=> (not res!572823) (not e!470182))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!842853 (= res!572823 (and (= (size!23264 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23263 _keys!868) (size!23264 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!842854 () Bool)

(declare-fun res!572825 () Bool)

(assert (=> b!842854 (=> (not res!572825) (not e!470182))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47584 (_ BitVec 32)) Bool)

(assert (=> b!842854 (= res!572825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!842855 () Bool)

(declare-fun e!470179 () Bool)

(assert (=> b!842855 (= e!470179 tp_is_empty!15659)))

(declare-fun res!572822 () Bool)

(assert (=> start!72608 (=> (not res!572822) (not e!470182))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72608 (= res!572822 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23263 _keys!868))))))

(assert (=> start!72608 e!470182))

(assert (=> start!72608 true))

(declare-fun array_inv!18158 (array!47584) Bool)

(assert (=> start!72608 (array_inv!18158 _keys!868)))

(declare-fun e!470181 () Bool)

(declare-fun array_inv!18159 (array!47586) Bool)

(assert (=> start!72608 (and (array_inv!18159 _values!688) e!470181)))

(declare-fun b!842849 () Bool)

(assert (=> b!842849 (= e!470181 (and e!470179 mapRes!25088))))

(declare-fun condMapEmpty!25088 () Bool)

(declare-fun mapDefault!25088 () ValueCell!7390)

