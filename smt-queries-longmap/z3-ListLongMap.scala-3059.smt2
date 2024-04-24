; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43182 () Bool)

(assert start!43182)

(declare-fun mapIsEmpty!22072 () Bool)

(declare-fun mapRes!22072 () Bool)

(assert (=> mapIsEmpty!22072 mapRes!22072))

(declare-fun b!478689 () Bool)

(declare-fun e!281498 () Bool)

(declare-fun e!281497 () Bool)

(assert (=> b!478689 (= e!281498 (and e!281497 mapRes!22072))))

(declare-fun condMapEmpty!22072 () Bool)

(declare-datatypes ((V!19185 0))(
  ( (V!19186 (val!6840 Int)) )
))
(declare-datatypes ((ValueCell!6431 0))(
  ( (ValueCellFull!6431 (v!9130 V!19185)) (EmptyCell!6431) )
))
(declare-datatypes ((array!30834 0))(
  ( (array!30835 (arr!14824 (Array (_ BitVec 32) ValueCell!6431)) (size!15182 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30834)

(declare-fun mapDefault!22072 () ValueCell!6431)

(assert (=> b!478689 (= condMapEmpty!22072 (= (arr!14824 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6431)) mapDefault!22072)))))

(declare-fun b!478690 () Bool)

(declare-fun e!281496 () Bool)

(assert (=> b!478690 (= e!281496 false)))

(declare-fun lt!217774 () Bool)

(declare-datatypes ((array!30836 0))(
  ( (array!30837 (arr!14825 (Array (_ BitVec 32) (_ BitVec 64))) (size!15183 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30836)

(declare-datatypes ((List!8977 0))(
  ( (Nil!8974) (Cons!8973 (h!9829 (_ BitVec 64)) (t!15175 List!8977)) )
))
(declare-fun arrayNoDuplicates!0 (array!30836 (_ BitVec 32) List!8977) Bool)

(assert (=> b!478690 (= lt!217774 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!8974))))

(declare-fun b!478691 () Bool)

(declare-fun res!285617 () Bool)

(assert (=> b!478691 (=> (not res!285617) (not e!281496))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30836 (_ BitVec 32)) Bool)

(assert (=> b!478691 (= res!285617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun res!285615 () Bool)

(assert (=> start!43182 (=> (not res!285615) (not e!281496))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43182 (= res!285615 (validMask!0 mask!2352))))

(assert (=> start!43182 e!281496))

(assert (=> start!43182 true))

(declare-fun array_inv!10772 (array!30834) Bool)

(assert (=> start!43182 (and (array_inv!10772 _values!1516) e!281498)))

(declare-fun array_inv!10773 (array!30836) Bool)

(assert (=> start!43182 (array_inv!10773 _keys!1874)))

(declare-fun b!478692 () Bool)

(declare-fun tp_is_empty!13585 () Bool)

(assert (=> b!478692 (= e!281497 tp_is_empty!13585)))

(declare-fun mapNonEmpty!22072 () Bool)

(declare-fun tp!42547 () Bool)

(declare-fun e!281499 () Bool)

(assert (=> mapNonEmpty!22072 (= mapRes!22072 (and tp!42547 e!281499))))

(declare-fun mapValue!22072 () ValueCell!6431)

(declare-fun mapKey!22072 () (_ BitVec 32))

(declare-fun mapRest!22072 () (Array (_ BitVec 32) ValueCell!6431))

(assert (=> mapNonEmpty!22072 (= (arr!14824 _values!1516) (store mapRest!22072 mapKey!22072 mapValue!22072))))

(declare-fun b!478693 () Bool)

(assert (=> b!478693 (= e!281499 tp_is_empty!13585)))

(declare-fun b!478694 () Bool)

(declare-fun res!285616 () Bool)

(assert (=> b!478694 (=> (not res!285616) (not e!281496))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!478694 (= res!285616 (and (= (size!15182 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15183 _keys!1874) (size!15182 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(assert (= (and start!43182 res!285615) b!478694))

(assert (= (and b!478694 res!285616) b!478691))

(assert (= (and b!478691 res!285617) b!478690))

(assert (= (and b!478689 condMapEmpty!22072) mapIsEmpty!22072))

(assert (= (and b!478689 (not condMapEmpty!22072)) mapNonEmpty!22072))

(get-info :version)

(assert (= (and mapNonEmpty!22072 ((_ is ValueCellFull!6431) mapValue!22072)) b!478693))

(assert (= (and b!478689 ((_ is ValueCellFull!6431) mapDefault!22072)) b!478692))

(assert (= start!43182 b!478689))

(declare-fun m!461095 () Bool)

(assert (=> b!478690 m!461095))

(declare-fun m!461097 () Bool)

(assert (=> b!478691 m!461097))

(declare-fun m!461099 () Bool)

(assert (=> start!43182 m!461099))

(declare-fun m!461101 () Bool)

(assert (=> start!43182 m!461101))

(declare-fun m!461103 () Bool)

(assert (=> start!43182 m!461103))

(declare-fun m!461105 () Bool)

(assert (=> mapNonEmpty!22072 m!461105))

(check-sat (not b!478691) (not mapNonEmpty!22072) tp_is_empty!13585 (not b!478690) (not start!43182))
(check-sat)
