; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72556 () Bool)

(assert start!72556)

(declare-fun res!572508 () Bool)

(declare-fun e!469775 () Bool)

(assert (=> start!72556 (=> (not res!572508) (not e!469775))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47503 0))(
  ( (array!47504 (arr!22783 (Array (_ BitVec 32) (_ BitVec 64))) (size!23225 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47503)

(assert (=> start!72556 (= res!572508 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23225 _keys!868))))))

(assert (=> start!72556 e!469775))

(assert (=> start!72556 true))

(declare-fun array_inv!18200 (array!47503) Bool)

(assert (=> start!72556 (array_inv!18200 _keys!868)))

(declare-datatypes ((V!25881 0))(
  ( (V!25882 (val!7860 Int)) )
))
(declare-datatypes ((ValueCell!7373 0))(
  ( (ValueCellFull!7373 (v!10279 V!25881)) (EmptyCell!7373) )
))
(declare-datatypes ((array!47505 0))(
  ( (array!47506 (arr!22784 (Array (_ BitVec 32) ValueCell!7373)) (size!23226 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47505)

(declare-fun e!469779 () Bool)

(declare-fun array_inv!18201 (array!47505) Bool)

(assert (=> start!72556 (and (array_inv!18201 _values!688) e!469779)))

(declare-fun b!842253 () Bool)

(declare-fun e!469778 () Bool)

(declare-fun tp_is_empty!15625 () Bool)

(assert (=> b!842253 (= e!469778 tp_is_empty!15625)))

(declare-fun b!842254 () Bool)

(declare-fun res!572510 () Bool)

(assert (=> b!842254 (=> (not res!572510) (not e!469775))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842254 (= res!572510 (validMask!0 mask!1196))))

(declare-fun b!842255 () Bool)

(declare-fun res!572511 () Bool)

(assert (=> b!842255 (=> (not res!572511) (not e!469775))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!842255 (= res!572511 (and (= (size!23226 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23225 _keys!868) (size!23226 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!842256 () Bool)

(declare-fun res!572509 () Bool)

(assert (=> b!842256 (=> (not res!572509) (not e!469775))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47503 (_ BitVec 32)) Bool)

(assert (=> b!842256 (= res!572509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!25037 () Bool)

(declare-fun mapRes!25037 () Bool)

(declare-fun tp!48356 () Bool)

(declare-fun e!469777 () Bool)

(assert (=> mapNonEmpty!25037 (= mapRes!25037 (and tp!48356 e!469777))))

(declare-fun mapRest!25037 () (Array (_ BitVec 32) ValueCell!7373))

(declare-fun mapValue!25037 () ValueCell!7373)

(declare-fun mapKey!25037 () (_ BitVec 32))

(assert (=> mapNonEmpty!25037 (= (arr!22784 _values!688) (store mapRest!25037 mapKey!25037 mapValue!25037))))

(declare-fun b!842257 () Bool)

(assert (=> b!842257 (= e!469775 false)))

(declare-fun lt!380768 () Bool)

(declare-datatypes ((List!16225 0))(
  ( (Nil!16222) (Cons!16221 (h!17352 (_ BitVec 64)) (t!22587 List!16225)) )
))
(declare-fun arrayNoDuplicates!0 (array!47503 (_ BitVec 32) List!16225) Bool)

(assert (=> b!842257 (= lt!380768 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16222))))

(declare-fun b!842258 () Bool)

(assert (=> b!842258 (= e!469779 (and e!469778 mapRes!25037))))

(declare-fun condMapEmpty!25037 () Bool)

(declare-fun mapDefault!25037 () ValueCell!7373)

(assert (=> b!842258 (= condMapEmpty!25037 (= (arr!22784 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7373)) mapDefault!25037)))))

(declare-fun b!842259 () Bool)

(assert (=> b!842259 (= e!469777 tp_is_empty!15625)))

(declare-fun mapIsEmpty!25037 () Bool)

(assert (=> mapIsEmpty!25037 mapRes!25037))

(assert (= (and start!72556 res!572508) b!842254))

(assert (= (and b!842254 res!572510) b!842255))

(assert (= (and b!842255 res!572511) b!842256))

(assert (= (and b!842256 res!572509) b!842257))

(assert (= (and b!842258 condMapEmpty!25037) mapIsEmpty!25037))

(assert (= (and b!842258 (not condMapEmpty!25037)) mapNonEmpty!25037))

(get-info :version)

(assert (= (and mapNonEmpty!25037 ((_ is ValueCellFull!7373) mapValue!25037)) b!842259))

(assert (= (and b!842258 ((_ is ValueCellFull!7373) mapDefault!25037)) b!842253))

(assert (= start!72556 b!842258))

(declare-fun m!784823 () Bool)

(assert (=> mapNonEmpty!25037 m!784823))

(declare-fun m!784825 () Bool)

(assert (=> b!842257 m!784825))

(declare-fun m!784827 () Bool)

(assert (=> b!842256 m!784827))

(declare-fun m!784829 () Bool)

(assert (=> start!72556 m!784829))

(declare-fun m!784831 () Bool)

(assert (=> start!72556 m!784831))

(declare-fun m!784833 () Bool)

(assert (=> b!842254 m!784833))

(check-sat (not start!72556) tp_is_empty!15625 (not mapNonEmpty!25037) (not b!842257) (not b!842256) (not b!842254))
(check-sat)
