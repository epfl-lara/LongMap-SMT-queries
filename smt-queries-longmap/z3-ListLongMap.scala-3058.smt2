; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43176 () Bool)

(assert start!43176)

(declare-fun res!285588 () Bool)

(declare-fun e!281451 () Bool)

(assert (=> start!43176 (=> (not res!285588) (not e!281451))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43176 (= res!285588 (validMask!0 mask!2352))))

(assert (=> start!43176 e!281451))

(assert (=> start!43176 true))

(declare-datatypes ((V!19177 0))(
  ( (V!19178 (val!6837 Int)) )
))
(declare-datatypes ((ValueCell!6428 0))(
  ( (ValueCellFull!6428 (v!9127 V!19177)) (EmptyCell!6428) )
))
(declare-datatypes ((array!30824 0))(
  ( (array!30825 (arr!14819 (Array (_ BitVec 32) ValueCell!6428)) (size!15177 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30824)

(declare-fun e!281450 () Bool)

(declare-fun array_inv!10768 (array!30824) Bool)

(assert (=> start!43176 (and (array_inv!10768 _values!1516) e!281450)))

(declare-datatypes ((array!30826 0))(
  ( (array!30827 (arr!14820 (Array (_ BitVec 32) (_ BitVec 64))) (size!15178 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30826)

(declare-fun array_inv!10769 (array!30826) Bool)

(assert (=> start!43176 (array_inv!10769 _keys!1874)))

(declare-fun b!478635 () Bool)

(declare-fun e!281452 () Bool)

(declare-fun tp_is_empty!13579 () Bool)

(assert (=> b!478635 (= e!281452 tp_is_empty!13579)))

(declare-fun b!478636 () Bool)

(declare-fun res!285590 () Bool)

(assert (=> b!478636 (=> (not res!285590) (not e!281451))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30826 (_ BitVec 32)) Bool)

(assert (=> b!478636 (= res!285590 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!478637 () Bool)

(declare-fun res!285589 () Bool)

(assert (=> b!478637 (=> (not res!285589) (not e!281451))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!478637 (= res!285589 (and (= (size!15177 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15178 _keys!1874) (size!15177 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!22063 () Bool)

(declare-fun mapRes!22063 () Bool)

(assert (=> mapIsEmpty!22063 mapRes!22063))

(declare-fun b!478638 () Bool)

(declare-fun e!281453 () Bool)

(assert (=> b!478638 (= e!281453 tp_is_empty!13579)))

(declare-fun mapNonEmpty!22063 () Bool)

(declare-fun tp!42538 () Bool)

(assert (=> mapNonEmpty!22063 (= mapRes!22063 (and tp!42538 e!281452))))

(declare-fun mapValue!22063 () ValueCell!6428)

(declare-fun mapKey!22063 () (_ BitVec 32))

(declare-fun mapRest!22063 () (Array (_ BitVec 32) ValueCell!6428))

(assert (=> mapNonEmpty!22063 (= (arr!14819 _values!1516) (store mapRest!22063 mapKey!22063 mapValue!22063))))

(declare-fun b!478639 () Bool)

(assert (=> b!478639 (= e!281450 (and e!281453 mapRes!22063))))

(declare-fun condMapEmpty!22063 () Bool)

(declare-fun mapDefault!22063 () ValueCell!6428)

(assert (=> b!478639 (= condMapEmpty!22063 (= (arr!14819 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6428)) mapDefault!22063)))))

(declare-fun b!478640 () Bool)

(assert (=> b!478640 (= e!281451 false)))

(declare-fun lt!217765 () Bool)

(declare-datatypes ((List!8975 0))(
  ( (Nil!8972) (Cons!8971 (h!9827 (_ BitVec 64)) (t!15173 List!8975)) )
))
(declare-fun arrayNoDuplicates!0 (array!30826 (_ BitVec 32) List!8975) Bool)

(assert (=> b!478640 (= lt!217765 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!8972))))

(assert (= (and start!43176 res!285588) b!478637))

(assert (= (and b!478637 res!285589) b!478636))

(assert (= (and b!478636 res!285590) b!478640))

(assert (= (and b!478639 condMapEmpty!22063) mapIsEmpty!22063))

(assert (= (and b!478639 (not condMapEmpty!22063)) mapNonEmpty!22063))

(get-info :version)

(assert (= (and mapNonEmpty!22063 ((_ is ValueCellFull!6428) mapValue!22063)) b!478635))

(assert (= (and b!478639 ((_ is ValueCellFull!6428) mapDefault!22063)) b!478638))

(assert (= start!43176 b!478639))

(declare-fun m!461059 () Bool)

(assert (=> start!43176 m!461059))

(declare-fun m!461061 () Bool)

(assert (=> start!43176 m!461061))

(declare-fun m!461063 () Bool)

(assert (=> start!43176 m!461063))

(declare-fun m!461065 () Bool)

(assert (=> b!478636 m!461065))

(declare-fun m!461067 () Bool)

(assert (=> mapNonEmpty!22063 m!461067))

(declare-fun m!461069 () Bool)

(assert (=> b!478640 m!461069))

(check-sat (not mapNonEmpty!22063) tp_is_empty!13579 (not start!43176) (not b!478636) (not b!478640))
(check-sat)
