; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43194 () Bool)

(assert start!43194)

(declare-fun b!478797 () Bool)

(declare-fun res!285669 () Bool)

(declare-fun e!281586 () Bool)

(assert (=> b!478797 (=> (not res!285669) (not e!281586))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((array!30858 0))(
  ( (array!30859 (arr!14836 (Array (_ BitVec 32) (_ BitVec 64))) (size!15194 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30858)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19201 0))(
  ( (V!19202 (val!6846 Int)) )
))
(declare-datatypes ((ValueCell!6437 0))(
  ( (ValueCellFull!6437 (v!9136 V!19201)) (EmptyCell!6437) )
))
(declare-datatypes ((array!30860 0))(
  ( (array!30861 (arr!14837 (Array (_ BitVec 32) ValueCell!6437)) (size!15195 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30860)

(assert (=> b!478797 (= res!285669 (and (= (size!15195 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15194 _keys!1874) (size!15195 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!478798 () Bool)

(declare-fun res!285670 () Bool)

(assert (=> b!478798 (=> (not res!285670) (not e!281586))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30858 (_ BitVec 32)) Bool)

(assert (=> b!478798 (= res!285670 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!478799 () Bool)

(declare-fun e!281585 () Bool)

(declare-fun tp_is_empty!13597 () Bool)

(assert (=> b!478799 (= e!281585 tp_is_empty!13597)))

(declare-fun b!478800 () Bool)

(declare-fun e!281588 () Bool)

(declare-fun mapRes!22090 () Bool)

(assert (=> b!478800 (= e!281588 (and e!281585 mapRes!22090))))

(declare-fun condMapEmpty!22090 () Bool)

(declare-fun mapDefault!22090 () ValueCell!6437)

(assert (=> b!478800 (= condMapEmpty!22090 (= (arr!14837 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6437)) mapDefault!22090)))))

(declare-fun mapIsEmpty!22090 () Bool)

(assert (=> mapIsEmpty!22090 mapRes!22090))

(declare-fun b!478801 () Bool)

(declare-fun e!281589 () Bool)

(assert (=> b!478801 (= e!281589 tp_is_empty!13597)))

(declare-fun mapNonEmpty!22090 () Bool)

(declare-fun tp!42565 () Bool)

(assert (=> mapNonEmpty!22090 (= mapRes!22090 (and tp!42565 e!281589))))

(declare-fun mapKey!22090 () (_ BitVec 32))

(declare-fun mapValue!22090 () ValueCell!6437)

(declare-fun mapRest!22090 () (Array (_ BitVec 32) ValueCell!6437))

(assert (=> mapNonEmpty!22090 (= (arr!14837 _values!1516) (store mapRest!22090 mapKey!22090 mapValue!22090))))

(declare-fun b!478802 () Bool)

(assert (=> b!478802 (= e!281586 false)))

(declare-fun lt!217792 () Bool)

(declare-datatypes ((List!8982 0))(
  ( (Nil!8979) (Cons!8978 (h!9834 (_ BitVec 64)) (t!15180 List!8982)) )
))
(declare-fun arrayNoDuplicates!0 (array!30858 (_ BitVec 32) List!8982) Bool)

(assert (=> b!478802 (= lt!217792 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!8979))))

(declare-fun res!285671 () Bool)

(assert (=> start!43194 (=> (not res!285671) (not e!281586))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43194 (= res!285671 (validMask!0 mask!2352))))

(assert (=> start!43194 e!281586))

(assert (=> start!43194 true))

(declare-fun array_inv!10782 (array!30860) Bool)

(assert (=> start!43194 (and (array_inv!10782 _values!1516) e!281588)))

(declare-fun array_inv!10783 (array!30858) Bool)

(assert (=> start!43194 (array_inv!10783 _keys!1874)))

(assert (= (and start!43194 res!285671) b!478797))

(assert (= (and b!478797 res!285669) b!478798))

(assert (= (and b!478798 res!285670) b!478802))

(assert (= (and b!478800 condMapEmpty!22090) mapIsEmpty!22090))

(assert (= (and b!478800 (not condMapEmpty!22090)) mapNonEmpty!22090))

(get-info :version)

(assert (= (and mapNonEmpty!22090 ((_ is ValueCellFull!6437) mapValue!22090)) b!478801))

(assert (= (and b!478800 ((_ is ValueCellFull!6437) mapDefault!22090)) b!478799))

(assert (= start!43194 b!478800))

(declare-fun m!461167 () Bool)

(assert (=> b!478798 m!461167))

(declare-fun m!461169 () Bool)

(assert (=> mapNonEmpty!22090 m!461169))

(declare-fun m!461171 () Bool)

(assert (=> b!478802 m!461171))

(declare-fun m!461173 () Bool)

(assert (=> start!43194 m!461173))

(declare-fun m!461175 () Bool)

(assert (=> start!43194 m!461175))

(declare-fun m!461177 () Bool)

(assert (=> start!43194 m!461177))

(check-sat tp_is_empty!13597 (not mapNonEmpty!22090) (not b!478802) (not start!43194) (not b!478798))
(check-sat)
