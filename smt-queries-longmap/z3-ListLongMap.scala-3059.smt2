; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43182 () Bool)

(assert start!43182)

(declare-fun b!478479 () Bool)

(declare-fun e!281364 () Bool)

(declare-fun tp_is_empty!13585 () Bool)

(assert (=> b!478479 (= e!281364 tp_is_empty!13585)))

(declare-fun b!478480 () Bool)

(declare-fun e!281362 () Bool)

(assert (=> b!478480 (= e!281362 tp_is_empty!13585)))

(declare-fun res!285495 () Bool)

(declare-fun e!281361 () Bool)

(assert (=> start!43182 (=> (not res!285495) (not e!281361))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43182 (= res!285495 (validMask!0 mask!2352))))

(assert (=> start!43182 e!281361))

(assert (=> start!43182 true))

(declare-datatypes ((V!19185 0))(
  ( (V!19186 (val!6840 Int)) )
))
(declare-datatypes ((ValueCell!6431 0))(
  ( (ValueCellFull!6431 (v!9123 V!19185)) (EmptyCell!6431) )
))
(declare-datatypes ((array!30839 0))(
  ( (array!30840 (arr!14827 (Array (_ BitVec 32) ValueCell!6431)) (size!15186 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30839)

(declare-fun e!281360 () Bool)

(declare-fun array_inv!10786 (array!30839) Bool)

(assert (=> start!43182 (and (array_inv!10786 _values!1516) e!281360)))

(declare-datatypes ((array!30841 0))(
  ( (array!30842 (arr!14828 (Array (_ BitVec 32) (_ BitVec 64))) (size!15187 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30841)

(declare-fun array_inv!10787 (array!30841) Bool)

(assert (=> start!43182 (array_inv!10787 _keys!1874)))

(declare-fun b!478481 () Bool)

(declare-fun mapRes!22072 () Bool)

(assert (=> b!478481 (= e!281360 (and e!281364 mapRes!22072))))

(declare-fun condMapEmpty!22072 () Bool)

(declare-fun mapDefault!22072 () ValueCell!6431)

(assert (=> b!478481 (= condMapEmpty!22072 (= (arr!14827 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6431)) mapDefault!22072)))))

(declare-fun b!478482 () Bool)

(declare-fun res!285493 () Bool)

(assert (=> b!478482 (=> (not res!285493) (not e!281361))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30841 (_ BitVec 32)) Bool)

(assert (=> b!478482 (= res!285493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun mapNonEmpty!22072 () Bool)

(declare-fun tp!42547 () Bool)

(assert (=> mapNonEmpty!22072 (= mapRes!22072 (and tp!42547 e!281362))))

(declare-fun mapKey!22072 () (_ BitVec 32))

(declare-fun mapRest!22072 () (Array (_ BitVec 32) ValueCell!6431))

(declare-fun mapValue!22072 () ValueCell!6431)

(assert (=> mapNonEmpty!22072 (= (arr!14827 _values!1516) (store mapRest!22072 mapKey!22072 mapValue!22072))))

(declare-fun b!478483 () Bool)

(declare-fun res!285494 () Bool)

(assert (=> b!478483 (=> (not res!285494) (not e!281361))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!478483 (= res!285494 (and (= (size!15186 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15187 _keys!1874) (size!15186 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!22072 () Bool)

(assert (=> mapIsEmpty!22072 mapRes!22072))

(declare-fun b!478484 () Bool)

(assert (=> b!478484 (= e!281361 false)))

(declare-fun lt!217528 () Bool)

(declare-datatypes ((List!9112 0))(
  ( (Nil!9109) (Cons!9108 (h!9964 (_ BitVec 64)) (t!15309 List!9112)) )
))
(declare-fun arrayNoDuplicates!0 (array!30841 (_ BitVec 32) List!9112) Bool)

(assert (=> b!478484 (= lt!217528 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9109))))

(assert (= (and start!43182 res!285495) b!478483))

(assert (= (and b!478483 res!285494) b!478482))

(assert (= (and b!478482 res!285493) b!478484))

(assert (= (and b!478481 condMapEmpty!22072) mapIsEmpty!22072))

(assert (= (and b!478481 (not condMapEmpty!22072)) mapNonEmpty!22072))

(get-info :version)

(assert (= (and mapNonEmpty!22072 ((_ is ValueCellFull!6431) mapValue!22072)) b!478480))

(assert (= (and b!478481 ((_ is ValueCellFull!6431) mapDefault!22072)) b!478479))

(assert (= start!43182 b!478481))

(declare-fun m!460179 () Bool)

(assert (=> start!43182 m!460179))

(declare-fun m!460181 () Bool)

(assert (=> start!43182 m!460181))

(declare-fun m!460183 () Bool)

(assert (=> start!43182 m!460183))

(declare-fun m!460185 () Bool)

(assert (=> b!478482 m!460185))

(declare-fun m!460187 () Bool)

(assert (=> mapNonEmpty!22072 m!460187))

(declare-fun m!460189 () Bool)

(assert (=> b!478484 m!460189))

(check-sat (not b!478482) (not b!478484) (not start!43182) tp_is_empty!13585 (not mapNonEmpty!22072))
(check-sat)
