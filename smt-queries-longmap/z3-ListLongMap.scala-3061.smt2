; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43194 () Bool)

(assert start!43194)

(declare-fun b!478587 () Bool)

(declare-fun e!281452 () Bool)

(assert (=> b!478587 (= e!281452 false)))

(declare-fun lt!217546 () Bool)

(declare-datatypes ((array!30863 0))(
  ( (array!30864 (arr!14839 (Array (_ BitVec 32) (_ BitVec 64))) (size!15198 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30863)

(declare-datatypes ((List!9115 0))(
  ( (Nil!9112) (Cons!9111 (h!9967 (_ BitVec 64)) (t!15312 List!9115)) )
))
(declare-fun arrayNoDuplicates!0 (array!30863 (_ BitVec 32) List!9115) Bool)

(assert (=> b!478587 (= lt!217546 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9112))))

(declare-fun res!285547 () Bool)

(assert (=> start!43194 (=> (not res!285547) (not e!281452))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43194 (= res!285547 (validMask!0 mask!2352))))

(assert (=> start!43194 e!281452))

(assert (=> start!43194 true))

(declare-datatypes ((V!19201 0))(
  ( (V!19202 (val!6846 Int)) )
))
(declare-datatypes ((ValueCell!6437 0))(
  ( (ValueCellFull!6437 (v!9129 V!19201)) (EmptyCell!6437) )
))
(declare-datatypes ((array!30865 0))(
  ( (array!30866 (arr!14840 (Array (_ BitVec 32) ValueCell!6437)) (size!15199 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30865)

(declare-fun e!281451 () Bool)

(declare-fun array_inv!10796 (array!30865) Bool)

(assert (=> start!43194 (and (array_inv!10796 _values!1516) e!281451)))

(declare-fun array_inv!10797 (array!30863) Bool)

(assert (=> start!43194 (array_inv!10797 _keys!1874)))

(declare-fun mapNonEmpty!22090 () Bool)

(declare-fun mapRes!22090 () Bool)

(declare-fun tp!42565 () Bool)

(declare-fun e!281454 () Bool)

(assert (=> mapNonEmpty!22090 (= mapRes!22090 (and tp!42565 e!281454))))

(declare-fun mapRest!22090 () (Array (_ BitVec 32) ValueCell!6437))

(declare-fun mapKey!22090 () (_ BitVec 32))

(declare-fun mapValue!22090 () ValueCell!6437)

(assert (=> mapNonEmpty!22090 (= (arr!14840 _values!1516) (store mapRest!22090 mapKey!22090 mapValue!22090))))

(declare-fun b!478588 () Bool)

(declare-fun res!285548 () Bool)

(assert (=> b!478588 (=> (not res!285548) (not e!281452))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30863 (_ BitVec 32)) Bool)

(assert (=> b!478588 (= res!285548 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!478589 () Bool)

(declare-fun e!281450 () Bool)

(declare-fun tp_is_empty!13597 () Bool)

(assert (=> b!478589 (= e!281450 tp_is_empty!13597)))

(declare-fun mapIsEmpty!22090 () Bool)

(assert (=> mapIsEmpty!22090 mapRes!22090))

(declare-fun b!478590 () Bool)

(assert (=> b!478590 (= e!281454 tp_is_empty!13597)))

(declare-fun b!478591 () Bool)

(assert (=> b!478591 (= e!281451 (and e!281450 mapRes!22090))))

(declare-fun condMapEmpty!22090 () Bool)

(declare-fun mapDefault!22090 () ValueCell!6437)

(assert (=> b!478591 (= condMapEmpty!22090 (= (arr!14840 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6437)) mapDefault!22090)))))

(declare-fun b!478592 () Bool)

(declare-fun res!285549 () Bool)

(assert (=> b!478592 (=> (not res!285549) (not e!281452))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!478592 (= res!285549 (and (= (size!15199 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15198 _keys!1874) (size!15199 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(assert (= (and start!43194 res!285547) b!478592))

(assert (= (and b!478592 res!285549) b!478588))

(assert (= (and b!478588 res!285548) b!478587))

(assert (= (and b!478591 condMapEmpty!22090) mapIsEmpty!22090))

(assert (= (and b!478591 (not condMapEmpty!22090)) mapNonEmpty!22090))

(get-info :version)

(assert (= (and mapNonEmpty!22090 ((_ is ValueCellFull!6437) mapValue!22090)) b!478590))

(assert (= (and b!478591 ((_ is ValueCellFull!6437) mapDefault!22090)) b!478589))

(assert (= start!43194 b!478591))

(declare-fun m!460251 () Bool)

(assert (=> b!478587 m!460251))

(declare-fun m!460253 () Bool)

(assert (=> start!43194 m!460253))

(declare-fun m!460255 () Bool)

(assert (=> start!43194 m!460255))

(declare-fun m!460257 () Bool)

(assert (=> start!43194 m!460257))

(declare-fun m!460259 () Bool)

(assert (=> mapNonEmpty!22090 m!460259))

(declare-fun m!460261 () Bool)

(assert (=> b!478588 m!460261))

(check-sat (not start!43194) (not b!478588) (not mapNonEmpty!22090) tp_is_empty!13597 (not b!478587))
(check-sat)
