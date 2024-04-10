; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72828 () Bool)

(assert start!72828)

(declare-fun b!845159 () Bool)

(declare-fun e!471832 () Bool)

(declare-fun tp_is_empty!15879 () Bool)

(assert (=> b!845159 (= e!471832 tp_is_empty!15879)))

(declare-fun b!845160 () Bool)

(declare-fun e!471828 () Bool)

(assert (=> b!845160 (= e!471828 false)))

(declare-fun lt!381385 () Bool)

(declare-datatypes ((array!47978 0))(
  ( (array!47979 (arr!23020 (Array (_ BitVec 32) (_ BitVec 64))) (size!23460 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47978)

(declare-datatypes ((List!16295 0))(
  ( (Nil!16292) (Cons!16291 (h!17422 (_ BitVec 64)) (t!22666 List!16295)) )
))
(declare-fun arrayNoDuplicates!0 (array!47978 (_ BitVec 32) List!16295) Bool)

(assert (=> b!845160 (= lt!381385 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16292))))

(declare-fun res!574144 () Bool)

(assert (=> start!72828 (=> (not res!574144) (not e!471828))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72828 (= res!574144 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23460 _keys!868))))))

(assert (=> start!72828 e!471828))

(assert (=> start!72828 true))

(declare-fun array_inv!18296 (array!47978) Bool)

(assert (=> start!72828 (array_inv!18296 _keys!868)))

(declare-datatypes ((V!26219 0))(
  ( (V!26220 (val!7987 Int)) )
))
(declare-datatypes ((ValueCell!7500 0))(
  ( (ValueCellFull!7500 (v!10412 V!26219)) (EmptyCell!7500) )
))
(declare-datatypes ((array!47980 0))(
  ( (array!47981 (arr!23021 (Array (_ BitVec 32) ValueCell!7500)) (size!23461 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47980)

(declare-fun e!471830 () Bool)

(declare-fun array_inv!18297 (array!47980) Bool)

(assert (=> start!72828 (and (array_inv!18297 _values!688) e!471830)))

(declare-fun mapIsEmpty!25418 () Bool)

(declare-fun mapRes!25418 () Bool)

(assert (=> mapIsEmpty!25418 mapRes!25418))

(declare-fun b!845161 () Bool)

(declare-fun res!574143 () Bool)

(assert (=> b!845161 (=> (not res!574143) (not e!471828))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47978 (_ BitVec 32)) Bool)

(assert (=> b!845161 (= res!574143 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!845162 () Bool)

(declare-fun e!471829 () Bool)

(assert (=> b!845162 (= e!471830 (and e!471829 mapRes!25418))))

(declare-fun condMapEmpty!25418 () Bool)

(declare-fun mapDefault!25418 () ValueCell!7500)

(assert (=> b!845162 (= condMapEmpty!25418 (= (arr!23021 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7500)) mapDefault!25418)))))

(declare-fun b!845163 () Bool)

(assert (=> b!845163 (= e!471829 tp_is_empty!15879)))

(declare-fun b!845164 () Bool)

(declare-fun res!574142 () Bool)

(assert (=> b!845164 (=> (not res!574142) (not e!471828))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845164 (= res!574142 (validMask!0 mask!1196))))

(declare-fun b!845165 () Bool)

(declare-fun res!574145 () Bool)

(assert (=> b!845165 (=> (not res!574145) (not e!471828))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!845165 (= res!574145 (and (= (size!23461 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23460 _keys!868) (size!23461 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!25418 () Bool)

(declare-fun tp!48736 () Bool)

(assert (=> mapNonEmpty!25418 (= mapRes!25418 (and tp!48736 e!471832))))

(declare-fun mapValue!25418 () ValueCell!7500)

(declare-fun mapRest!25418 () (Array (_ BitVec 32) ValueCell!7500))

(declare-fun mapKey!25418 () (_ BitVec 32))

(assert (=> mapNonEmpty!25418 (= (arr!23021 _values!688) (store mapRest!25418 mapKey!25418 mapValue!25418))))

(assert (= (and start!72828 res!574144) b!845164))

(assert (= (and b!845164 res!574142) b!845165))

(assert (= (and b!845165 res!574145) b!845161))

(assert (= (and b!845161 res!574143) b!845160))

(assert (= (and b!845162 condMapEmpty!25418) mapIsEmpty!25418))

(assert (= (and b!845162 (not condMapEmpty!25418)) mapNonEmpty!25418))

(get-info :version)

(assert (= (and mapNonEmpty!25418 ((_ is ValueCellFull!7500) mapValue!25418)) b!845159))

(assert (= (and b!845162 ((_ is ValueCellFull!7500) mapDefault!25418)) b!845163))

(assert (= start!72828 b!845162))

(declare-fun m!787101 () Bool)

(assert (=> start!72828 m!787101))

(declare-fun m!787103 () Bool)

(assert (=> start!72828 m!787103))

(declare-fun m!787105 () Bool)

(assert (=> b!845164 m!787105))

(declare-fun m!787107 () Bool)

(assert (=> mapNonEmpty!25418 m!787107))

(declare-fun m!787109 () Bool)

(assert (=> b!845161 m!787109))

(declare-fun m!787111 () Bool)

(assert (=> b!845160 m!787111))

(check-sat tp_is_empty!15879 (not b!845164) (not b!845161) (not start!72828) (not b!845160) (not mapNonEmpty!25418))
(check-sat)
