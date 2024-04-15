; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72592 () Bool)

(assert start!72592)

(declare-fun b!842631 () Bool)

(declare-fun res!572727 () Bool)

(declare-fun e!470045 () Bool)

(assert (=> b!842631 (=> (not res!572727) (not e!470045))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842631 (= res!572727 (validMask!0 mask!1196))))

(declare-fun b!842632 () Bool)

(assert (=> b!842632 (= e!470045 false)))

(declare-fun lt!380822 () Bool)

(declare-datatypes ((array!47569 0))(
  ( (array!47570 (arr!22816 (Array (_ BitVec 32) (_ BitVec 64))) (size!23258 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47569)

(declare-datatypes ((List!16237 0))(
  ( (Nil!16234) (Cons!16233 (h!17364 (_ BitVec 64)) (t!22599 List!16237)) )
))
(declare-fun arrayNoDuplicates!0 (array!47569 (_ BitVec 32) List!16237) Bool)

(assert (=> b!842632 (= lt!380822 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16234))))

(declare-fun b!842633 () Bool)

(declare-fun res!572726 () Bool)

(assert (=> b!842633 (=> (not res!572726) (not e!470045))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47569 (_ BitVec 32)) Bool)

(assert (=> b!842633 (= res!572726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!572724 () Bool)

(assert (=> start!72592 (=> (not res!572724) (not e!470045))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72592 (= res!572724 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23258 _keys!868))))))

(assert (=> start!72592 e!470045))

(assert (=> start!72592 true))

(declare-fun array_inv!18222 (array!47569) Bool)

(assert (=> start!72592 (array_inv!18222 _keys!868)))

(declare-datatypes ((V!25929 0))(
  ( (V!25930 (val!7878 Int)) )
))
(declare-datatypes ((ValueCell!7391 0))(
  ( (ValueCellFull!7391 (v!10297 V!25929)) (EmptyCell!7391) )
))
(declare-datatypes ((array!47571 0))(
  ( (array!47572 (arr!22817 (Array (_ BitVec 32) ValueCell!7391)) (size!23259 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47571)

(declare-fun e!470047 () Bool)

(declare-fun array_inv!18223 (array!47571) Bool)

(assert (=> start!72592 (and (array_inv!18223 _values!688) e!470047)))

(declare-fun mapNonEmpty!25091 () Bool)

(declare-fun mapRes!25091 () Bool)

(declare-fun tp!48410 () Bool)

(declare-fun e!470048 () Bool)

(assert (=> mapNonEmpty!25091 (= mapRes!25091 (and tp!48410 e!470048))))

(declare-fun mapKey!25091 () (_ BitVec 32))

(declare-fun mapRest!25091 () (Array (_ BitVec 32) ValueCell!7391))

(declare-fun mapValue!25091 () ValueCell!7391)

(assert (=> mapNonEmpty!25091 (= (arr!22817 _values!688) (store mapRest!25091 mapKey!25091 mapValue!25091))))

(declare-fun b!842634 () Bool)

(declare-fun e!470049 () Bool)

(declare-fun tp_is_empty!15661 () Bool)

(assert (=> b!842634 (= e!470049 tp_is_empty!15661)))

(declare-fun mapIsEmpty!25091 () Bool)

(assert (=> mapIsEmpty!25091 mapRes!25091))

(declare-fun b!842635 () Bool)

(assert (=> b!842635 (= e!470047 (and e!470049 mapRes!25091))))

(declare-fun condMapEmpty!25091 () Bool)

(declare-fun mapDefault!25091 () ValueCell!7391)

(assert (=> b!842635 (= condMapEmpty!25091 (= (arr!22817 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7391)) mapDefault!25091)))))

(declare-fun b!842636 () Bool)

(assert (=> b!842636 (= e!470048 tp_is_empty!15661)))

(declare-fun b!842637 () Bool)

(declare-fun res!572725 () Bool)

(assert (=> b!842637 (=> (not res!572725) (not e!470045))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!842637 (= res!572725 (and (= (size!23259 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23258 _keys!868) (size!23259 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!72592 res!572724) b!842631))

(assert (= (and b!842631 res!572727) b!842637))

(assert (= (and b!842637 res!572725) b!842633))

(assert (= (and b!842633 res!572726) b!842632))

(assert (= (and b!842635 condMapEmpty!25091) mapIsEmpty!25091))

(assert (= (and b!842635 (not condMapEmpty!25091)) mapNonEmpty!25091))

(get-info :version)

(assert (= (and mapNonEmpty!25091 ((_ is ValueCellFull!7391) mapValue!25091)) b!842636))

(assert (= (and b!842635 ((_ is ValueCellFull!7391) mapDefault!25091)) b!842634))

(assert (= start!72592 b!842635))

(declare-fun m!785039 () Bool)

(assert (=> b!842632 m!785039))

(declare-fun m!785041 () Bool)

(assert (=> b!842633 m!785041))

(declare-fun m!785043 () Bool)

(assert (=> start!72592 m!785043))

(declare-fun m!785045 () Bool)

(assert (=> start!72592 m!785045))

(declare-fun m!785047 () Bool)

(assert (=> mapNonEmpty!25091 m!785047))

(declare-fun m!785049 () Bool)

(assert (=> b!842631 m!785049))

(check-sat (not start!72592) tp_is_empty!15661 (not b!842632) (not b!842633) (not mapNonEmpty!25091) (not b!842631))
(check-sat)
