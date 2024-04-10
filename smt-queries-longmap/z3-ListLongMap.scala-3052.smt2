; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43112 () Bool)

(assert start!43112)

(declare-fun b!478254 () Bool)

(declare-fun e!281139 () Bool)

(declare-fun tp_is_empty!13545 () Bool)

(assert (=> b!478254 (= e!281139 tp_is_empty!13545)))

(declare-fun b!478255 () Bool)

(declare-fun e!281142 () Bool)

(declare-fun e!281141 () Bool)

(declare-fun mapRes!21997 () Bool)

(assert (=> b!478255 (= e!281142 (and e!281141 mapRes!21997))))

(declare-fun condMapEmpty!21997 () Bool)

(declare-datatypes ((V!19131 0))(
  ( (V!19132 (val!6820 Int)) )
))
(declare-datatypes ((ValueCell!6411 0))(
  ( (ValueCellFull!6411 (v!9108 V!19131)) (EmptyCell!6411) )
))
(declare-datatypes ((array!30761 0))(
  ( (array!30762 (arr!14793 (Array (_ BitVec 32) ValueCell!6411)) (size!15151 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30761)

(declare-fun mapDefault!21997 () ValueCell!6411)

(assert (=> b!478255 (= condMapEmpty!21997 (= (arr!14793 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6411)) mapDefault!21997)))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun b!478256 () Bool)

(declare-datatypes ((array!30763 0))(
  ( (array!30764 (arr!14794 (Array (_ BitVec 32) (_ BitVec 64))) (size!15152 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30763)

(declare-fun e!281143 () Bool)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!478256 (= e!281143 (and (= (size!15151 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15152 _keys!1874) (size!15151 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011) (= (size!15152 _keys!1874) (bvadd #b00000000000000000000000000000001 mask!2352)) (bvsgt #b00000000000000000000000000000000 (size!15152 _keys!1874))))))

(declare-fun mapNonEmpty!21997 () Bool)

(declare-fun tp!42472 () Bool)

(assert (=> mapNonEmpty!21997 (= mapRes!21997 (and tp!42472 e!281139))))

(declare-fun mapKey!21997 () (_ BitVec 32))

(declare-fun mapRest!21997 () (Array (_ BitVec 32) ValueCell!6411))

(declare-fun mapValue!21997 () ValueCell!6411)

(assert (=> mapNonEmpty!21997 (= (arr!14793 _values!1516) (store mapRest!21997 mapKey!21997 mapValue!21997))))

(declare-fun mapIsEmpty!21997 () Bool)

(assert (=> mapIsEmpty!21997 mapRes!21997))

(declare-fun b!478257 () Bool)

(assert (=> b!478257 (= e!281141 tp_is_empty!13545)))

(declare-fun res!285370 () Bool)

(assert (=> start!43112 (=> (not res!285370) (not e!281143))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43112 (= res!285370 (validMask!0 mask!2352))))

(assert (=> start!43112 e!281143))

(assert (=> start!43112 true))

(declare-fun array_inv!10674 (array!30761) Bool)

(assert (=> start!43112 (and (array_inv!10674 _values!1516) e!281142)))

(declare-fun array_inv!10675 (array!30763) Bool)

(assert (=> start!43112 (array_inv!10675 _keys!1874)))

(assert (= (and start!43112 res!285370) b!478256))

(assert (= (and b!478255 condMapEmpty!21997) mapIsEmpty!21997))

(assert (= (and b!478255 (not condMapEmpty!21997)) mapNonEmpty!21997))

(get-info :version)

(assert (= (and mapNonEmpty!21997 ((_ is ValueCellFull!6411) mapValue!21997)) b!478254))

(assert (= (and b!478255 ((_ is ValueCellFull!6411) mapDefault!21997)) b!478257))

(assert (= start!43112 b!478255))

(declare-fun m!460605 () Bool)

(assert (=> mapNonEmpty!21997 m!460605))

(declare-fun m!460607 () Bool)

(assert (=> start!43112 m!460607))

(declare-fun m!460609 () Bool)

(assert (=> start!43112 m!460609))

(declare-fun m!460611 () Bool)

(assert (=> start!43112 m!460611))

(check-sat (not start!43112) (not mapNonEmpty!21997) tp_is_empty!13545)
(check-sat)
(get-model)

(declare-fun d!76581 () Bool)

(assert (=> d!76581 (= (validMask!0 mask!2352) (and (or (= mask!2352 #b00000000000000000000000000000111) (= mask!2352 #b00000000000000000000000000001111) (= mask!2352 #b00000000000000000000000000011111) (= mask!2352 #b00000000000000000000000000111111) (= mask!2352 #b00000000000000000000000001111111) (= mask!2352 #b00000000000000000000000011111111) (= mask!2352 #b00000000000000000000000111111111) (= mask!2352 #b00000000000000000000001111111111) (= mask!2352 #b00000000000000000000011111111111) (= mask!2352 #b00000000000000000000111111111111) (= mask!2352 #b00000000000000000001111111111111) (= mask!2352 #b00000000000000000011111111111111) (= mask!2352 #b00000000000000000111111111111111) (= mask!2352 #b00000000000000001111111111111111) (= mask!2352 #b00000000000000011111111111111111) (= mask!2352 #b00000000000000111111111111111111) (= mask!2352 #b00000000000001111111111111111111) (= mask!2352 #b00000000000011111111111111111111) (= mask!2352 #b00000000000111111111111111111111) (= mask!2352 #b00000000001111111111111111111111) (= mask!2352 #b00000000011111111111111111111111) (= mask!2352 #b00000000111111111111111111111111) (= mask!2352 #b00000001111111111111111111111111) (= mask!2352 #b00000011111111111111111111111111) (= mask!2352 #b00000111111111111111111111111111) (= mask!2352 #b00001111111111111111111111111111) (= mask!2352 #b00011111111111111111111111111111) (= mask!2352 #b00111111111111111111111111111111)) (bvsle mask!2352 #b00111111111111111111111111111111)))))

(assert (=> start!43112 d!76581))

(declare-fun d!76583 () Bool)

(assert (=> d!76583 (= (array_inv!10674 _values!1516) (bvsge (size!15151 _values!1516) #b00000000000000000000000000000000))))

(assert (=> start!43112 d!76583))

(declare-fun d!76585 () Bool)

(assert (=> d!76585 (= (array_inv!10675 _keys!1874) (bvsge (size!15152 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> start!43112 d!76585))

(declare-fun mapIsEmpty!22003 () Bool)

(declare-fun mapRes!22003 () Bool)

(assert (=> mapIsEmpty!22003 mapRes!22003))

(declare-fun condMapEmpty!22003 () Bool)

(declare-fun mapDefault!22003 () ValueCell!6411)

(assert (=> mapNonEmpty!21997 (= condMapEmpty!22003 (= mapRest!21997 ((as const (Array (_ BitVec 32) ValueCell!6411)) mapDefault!22003)))))

(declare-fun e!281163 () Bool)

(assert (=> mapNonEmpty!21997 (= tp!42472 (and e!281163 mapRes!22003))))

(declare-fun b!478276 () Bool)

(declare-fun e!281164 () Bool)

(assert (=> b!478276 (= e!281164 tp_is_empty!13545)))

(declare-fun mapNonEmpty!22003 () Bool)

(declare-fun tp!42478 () Bool)

(assert (=> mapNonEmpty!22003 (= mapRes!22003 (and tp!42478 e!281164))))

(declare-fun mapRest!22003 () (Array (_ BitVec 32) ValueCell!6411))

(declare-fun mapValue!22003 () ValueCell!6411)

(declare-fun mapKey!22003 () (_ BitVec 32))

(assert (=> mapNonEmpty!22003 (= mapRest!21997 (store mapRest!22003 mapKey!22003 mapValue!22003))))

(declare-fun b!478277 () Bool)

(assert (=> b!478277 (= e!281163 tp_is_empty!13545)))

(assert (= (and mapNonEmpty!21997 condMapEmpty!22003) mapIsEmpty!22003))

(assert (= (and mapNonEmpty!21997 (not condMapEmpty!22003)) mapNonEmpty!22003))

(assert (= (and mapNonEmpty!22003 ((_ is ValueCellFull!6411) mapValue!22003)) b!478276))

(assert (= (and mapNonEmpty!21997 ((_ is ValueCellFull!6411) mapDefault!22003)) b!478277))

(declare-fun m!460621 () Bool)

(assert (=> mapNonEmpty!22003 m!460621))

(check-sat (not mapNonEmpty!22003) tp_is_empty!13545)
(check-sat)
