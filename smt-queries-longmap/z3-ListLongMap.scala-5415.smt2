; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72256 () Bool)

(assert start!72256)

(declare-fun b!837159 () Bool)

(declare-fun res!569414 () Bool)

(declare-fun e!467205 () Bool)

(assert (=> b!837159 (=> (not res!569414) (not e!467205))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!837159 (= res!569414 (validMask!0 mask!1196))))

(declare-fun b!837160 () Bool)

(declare-fun e!467203 () Bool)

(declare-fun e!467201 () Bool)

(declare-fun mapRes!24587 () Bool)

(assert (=> b!837160 (= e!467203 (and e!467201 mapRes!24587))))

(declare-fun condMapEmpty!24587 () Bool)

(declare-datatypes ((V!25481 0))(
  ( (V!25482 (val!7710 Int)) )
))
(declare-datatypes ((ValueCell!7223 0))(
  ( (ValueCellFull!7223 (v!10129 V!25481)) (EmptyCell!7223) )
))
(declare-datatypes ((array!46919 0))(
  ( (array!46920 (arr!22491 (Array (_ BitVec 32) ValueCell!7223)) (size!22933 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46919)

(declare-fun mapDefault!24587 () ValueCell!7223)

(assert (=> b!837160 (= condMapEmpty!24587 (= (arr!22491 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7223)) mapDefault!24587)))))

(declare-fun b!837161 () Bool)

(declare-fun tp_is_empty!15325 () Bool)

(assert (=> b!837161 (= e!467201 tp_is_empty!15325)))

(declare-fun mapNonEmpty!24587 () Bool)

(declare-fun tp!47582 () Bool)

(declare-fun e!467204 () Bool)

(assert (=> mapNonEmpty!24587 (= mapRes!24587 (and tp!47582 e!467204))))

(declare-fun mapKey!24587 () (_ BitVec 32))

(declare-fun mapValue!24587 () ValueCell!7223)

(declare-fun mapRest!24587 () (Array (_ BitVec 32) ValueCell!7223))

(assert (=> mapNonEmpty!24587 (= (arr!22491 _values!688) (store mapRest!24587 mapKey!24587 mapValue!24587))))

(declare-fun res!569413 () Bool)

(assert (=> start!72256 (=> (not res!569413) (not e!467205))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!46921 0))(
  ( (array!46922 (arr!22492 (Array (_ BitVec 32) (_ BitVec 64))) (size!22934 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46921)

(assert (=> start!72256 (= res!569413 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22934 _keys!868))))))

(assert (=> start!72256 e!467205))

(assert (=> start!72256 true))

(declare-fun array_inv!17992 (array!46921) Bool)

(assert (=> start!72256 (array_inv!17992 _keys!868)))

(declare-fun array_inv!17993 (array!46919) Bool)

(assert (=> start!72256 (and (array_inv!17993 _values!688) e!467203)))

(declare-fun b!837162 () Bool)

(declare-fun res!569415 () Bool)

(assert (=> b!837162 (=> (not res!569415) (not e!467205))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!837162 (= res!569415 (and (= (size!22933 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22934 _keys!868) (size!22933 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!837163 () Bool)

(assert (=> b!837163 (= e!467205 false)))

(declare-fun lt!380318 () Bool)

(declare-datatypes ((List!16025 0))(
  ( (Nil!16022) (Cons!16021 (h!17152 (_ BitVec 64)) (t!22387 List!16025)) )
))
(declare-fun arrayNoDuplicates!0 (array!46921 (_ BitVec 32) List!16025) Bool)

(assert (=> b!837163 (= lt!380318 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16022))))

(declare-fun b!837164 () Bool)

(declare-fun res!569412 () Bool)

(assert (=> b!837164 (=> (not res!569412) (not e!467205))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46921 (_ BitVec 32)) Bool)

(assert (=> b!837164 (= res!569412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!24587 () Bool)

(assert (=> mapIsEmpty!24587 mapRes!24587))

(declare-fun b!837165 () Bool)

(assert (=> b!837165 (= e!467204 tp_is_empty!15325)))

(assert (= (and start!72256 res!569413) b!837159))

(assert (= (and b!837159 res!569414) b!837162))

(assert (= (and b!837162 res!569415) b!837164))

(assert (= (and b!837164 res!569412) b!837163))

(assert (= (and b!837160 condMapEmpty!24587) mapIsEmpty!24587))

(assert (= (and b!837160 (not condMapEmpty!24587)) mapNonEmpty!24587))

(get-info :version)

(assert (= (and mapNonEmpty!24587 ((_ is ValueCellFull!7223) mapValue!24587)) b!837165))

(assert (= (and b!837160 ((_ is ValueCellFull!7223) mapDefault!24587)) b!837161))

(assert (= start!72256 b!837160))

(declare-fun m!781511 () Bool)

(assert (=> start!72256 m!781511))

(declare-fun m!781513 () Bool)

(assert (=> start!72256 m!781513))

(declare-fun m!781515 () Bool)

(assert (=> b!837163 m!781515))

(declare-fun m!781517 () Bool)

(assert (=> b!837159 m!781517))

(declare-fun m!781519 () Bool)

(assert (=> b!837164 m!781519))

(declare-fun m!781521 () Bool)

(assert (=> mapNonEmpty!24587 m!781521))

(check-sat (not b!837159) tp_is_empty!15325 (not start!72256) (not b!837163) (not mapNonEmpty!24587) (not b!837164))
(check-sat)
