; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72856 () Bool)

(assert start!72856)

(declare-fun b!844592 () Bool)

(declare-fun res!573648 () Bool)

(declare-fun e!471362 () Bool)

(assert (=> b!844592 (=> (not res!573648) (not e!471362))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844592 (= res!573648 (validMask!0 mask!1196))))

(declare-fun res!573646 () Bool)

(assert (=> start!72856 (=> (not res!573646) (not e!471362))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47759 0))(
  ( (array!47760 (arr!22906 (Array (_ BitVec 32) (_ BitVec 64))) (size!23347 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47759)

(assert (=> start!72856 (= res!573646 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23347 _keys!868))))))

(assert (=> start!72856 e!471362))

(assert (=> start!72856 true))

(declare-fun array_inv!18270 (array!47759) Bool)

(assert (=> start!72856 (array_inv!18270 _keys!868)))

(declare-datatypes ((V!26033 0))(
  ( (V!26034 (val!7917 Int)) )
))
(declare-datatypes ((ValueCell!7430 0))(
  ( (ValueCellFull!7430 (v!10342 V!26033)) (EmptyCell!7430) )
))
(declare-datatypes ((array!47761 0))(
  ( (array!47762 (arr!22907 (Array (_ BitVec 32) ValueCell!7430)) (size!23348 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47761)

(declare-fun e!471361 () Bool)

(declare-fun array_inv!18271 (array!47761) Bool)

(assert (=> start!72856 (and (array_inv!18271 _values!688) e!471361)))

(declare-fun mapNonEmpty!25208 () Bool)

(declare-fun mapRes!25208 () Bool)

(declare-fun tp!48527 () Bool)

(declare-fun e!471363 () Bool)

(assert (=> mapNonEmpty!25208 (= mapRes!25208 (and tp!48527 e!471363))))

(declare-fun mapRest!25208 () (Array (_ BitVec 32) ValueCell!7430))

(declare-fun mapKey!25208 () (_ BitVec 32))

(declare-fun mapValue!25208 () ValueCell!7430)

(assert (=> mapNonEmpty!25208 (= (arr!22907 _values!688) (store mapRest!25208 mapKey!25208 mapValue!25208))))

(declare-fun b!844593 () Bool)

(declare-fun e!471364 () Bool)

(declare-fun tp_is_empty!15739 () Bool)

(assert (=> b!844593 (= e!471364 tp_is_empty!15739)))

(declare-fun b!844594 () Bool)

(assert (=> b!844594 (= e!471361 (and e!471364 mapRes!25208))))

(declare-fun condMapEmpty!25208 () Bool)

(declare-fun mapDefault!25208 () ValueCell!7430)

(assert (=> b!844594 (= condMapEmpty!25208 (= (arr!22907 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7430)) mapDefault!25208)))))

(declare-fun b!844595 () Bool)

(declare-fun res!573647 () Bool)

(assert (=> b!844595 (=> (not res!573647) (not e!471362))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!844595 (= res!573647 (and (= (size!23348 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23347 _keys!868) (size!23348 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!844596 () Bool)

(declare-fun res!573649 () Bool)

(assert (=> b!844596 (=> (not res!573649) (not e!471362))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47759 (_ BitVec 32)) Bool)

(assert (=> b!844596 (= res!573649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!844597 () Bool)

(assert (=> b!844597 (= e!471363 tp_is_empty!15739)))

(declare-fun mapIsEmpty!25208 () Bool)

(assert (=> mapIsEmpty!25208 mapRes!25208))

(declare-fun b!844598 () Bool)

(assert (=> b!844598 (= e!471362 false)))

(declare-fun lt!381536 () Bool)

(declare-datatypes ((List!16175 0))(
  ( (Nil!16172) (Cons!16171 (h!17308 (_ BitVec 64)) (t!22538 List!16175)) )
))
(declare-fun arrayNoDuplicates!0 (array!47759 (_ BitVec 32) List!16175) Bool)

(assert (=> b!844598 (= lt!381536 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16172))))

(assert (= (and start!72856 res!573646) b!844592))

(assert (= (and b!844592 res!573648) b!844595))

(assert (= (and b!844595 res!573647) b!844596))

(assert (= (and b!844596 res!573649) b!844598))

(assert (= (and b!844594 condMapEmpty!25208) mapIsEmpty!25208))

(assert (= (and b!844594 (not condMapEmpty!25208)) mapNonEmpty!25208))

(get-info :version)

(assert (= (and mapNonEmpty!25208 ((_ is ValueCellFull!7430) mapValue!25208)) b!844597))

(assert (= (and b!844594 ((_ is ValueCellFull!7430) mapDefault!25208)) b!844593))

(assert (= start!72856 b!844594))

(declare-fun m!787553 () Bool)

(assert (=> start!72856 m!787553))

(declare-fun m!787555 () Bool)

(assert (=> start!72856 m!787555))

(declare-fun m!787557 () Bool)

(assert (=> b!844592 m!787557))

(declare-fun m!787559 () Bool)

(assert (=> b!844598 m!787559))

(declare-fun m!787561 () Bool)

(assert (=> mapNonEmpty!25208 m!787561))

(declare-fun m!787563 () Bool)

(assert (=> b!844596 m!787563))

(check-sat (not mapNonEmpty!25208) tp_is_empty!15739 (not b!844592) (not b!844596) (not b!844598) (not start!72856))
(check-sat)
