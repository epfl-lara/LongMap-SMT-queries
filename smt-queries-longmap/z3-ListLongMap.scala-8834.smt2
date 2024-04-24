; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107452 () Bool)

(assert start!107452)

(declare-fun b!1272380 () Bool)

(declare-fun e!725560 () Bool)

(declare-fun tp_is_empty!32917 () Bool)

(assert (=> b!1272380 (= e!725560 tp_is_empty!32917)))

(declare-fun b!1272381 () Bool)

(declare-fun e!725558 () Bool)

(assert (=> b!1272381 (= e!725558 false)))

(declare-fun lt!575296 () Bool)

(declare-datatypes ((array!83115 0))(
  ( (array!83116 (arr!40090 (Array (_ BitVec 32) (_ BitVec 64))) (size!40627 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83115)

(declare-datatypes ((List!28543 0))(
  ( (Nil!28540) (Cons!28539 (h!29757 (_ BitVec 64)) (t!42064 List!28543)) )
))
(declare-fun arrayNoDuplicates!0 (array!83115 (_ BitVec 32) List!28543) Bool)

(assert (=> b!1272381 (= lt!575296 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28540))))

(declare-fun b!1272382 () Bool)

(declare-fun e!725556 () Bool)

(declare-fun e!725559 () Bool)

(declare-fun mapRes!50956 () Bool)

(assert (=> b!1272382 (= e!725556 (and e!725559 mapRes!50956))))

(declare-fun condMapEmpty!50956 () Bool)

(declare-datatypes ((V!49083 0))(
  ( (V!49084 (val!16533 Int)) )
))
(declare-datatypes ((ValueCell!15605 0))(
  ( (ValueCellFull!15605 (v!19165 V!49083)) (EmptyCell!15605) )
))
(declare-datatypes ((array!83117 0))(
  ( (array!83118 (arr!40091 (Array (_ BitVec 32) ValueCell!15605)) (size!40628 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83117)

(declare-fun mapDefault!50956 () ValueCell!15605)

(assert (=> b!1272382 (= condMapEmpty!50956 (= (arr!40091 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15605)) mapDefault!50956)))))

(declare-fun res!846251 () Bool)

(assert (=> start!107452 (=> (not res!846251) (not e!725558))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107452 (= res!846251 (validMask!0 mask!1730))))

(assert (=> start!107452 e!725558))

(declare-fun array_inv!30661 (array!83117) Bool)

(assert (=> start!107452 (and (array_inv!30661 _values!1134) e!725556)))

(assert (=> start!107452 true))

(declare-fun array_inv!30662 (array!83115) Bool)

(assert (=> start!107452 (array_inv!30662 _keys!1364)))

(declare-fun b!1272383 () Bool)

(declare-fun res!846252 () Bool)

(assert (=> b!1272383 (=> (not res!846252) (not e!725558))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83115 (_ BitVec 32)) Bool)

(assert (=> b!1272383 (= res!846252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1272384 () Bool)

(declare-fun res!846250 () Bool)

(assert (=> b!1272384 (=> (not res!846250) (not e!725558))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1272384 (= res!846250 (and (= (size!40628 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40627 _keys!1364) (size!40628 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!50956 () Bool)

(declare-fun tp!97297 () Bool)

(assert (=> mapNonEmpty!50956 (= mapRes!50956 (and tp!97297 e!725560))))

(declare-fun mapRest!50956 () (Array (_ BitVec 32) ValueCell!15605))

(declare-fun mapValue!50956 () ValueCell!15605)

(declare-fun mapKey!50956 () (_ BitVec 32))

(assert (=> mapNonEmpty!50956 (= (arr!40091 _values!1134) (store mapRest!50956 mapKey!50956 mapValue!50956))))

(declare-fun b!1272385 () Bool)

(assert (=> b!1272385 (= e!725559 tp_is_empty!32917)))

(declare-fun mapIsEmpty!50956 () Bool)

(assert (=> mapIsEmpty!50956 mapRes!50956))

(assert (= (and start!107452 res!846251) b!1272384))

(assert (= (and b!1272384 res!846250) b!1272383))

(assert (= (and b!1272383 res!846252) b!1272381))

(assert (= (and b!1272382 condMapEmpty!50956) mapIsEmpty!50956))

(assert (= (and b!1272382 (not condMapEmpty!50956)) mapNonEmpty!50956))

(get-info :version)

(assert (= (and mapNonEmpty!50956 ((_ is ValueCellFull!15605) mapValue!50956)) b!1272380))

(assert (= (and b!1272382 ((_ is ValueCellFull!15605) mapDefault!50956)) b!1272385))

(assert (= start!107452 b!1272382))

(declare-fun m!1170759 () Bool)

(assert (=> b!1272381 m!1170759))

(declare-fun m!1170761 () Bool)

(assert (=> start!107452 m!1170761))

(declare-fun m!1170763 () Bool)

(assert (=> start!107452 m!1170763))

(declare-fun m!1170765 () Bool)

(assert (=> start!107452 m!1170765))

(declare-fun m!1170767 () Bool)

(assert (=> b!1272383 m!1170767))

(declare-fun m!1170769 () Bool)

(assert (=> mapNonEmpty!50956 m!1170769))

(check-sat (not start!107452) (not b!1272381) (not mapNonEmpty!50956) (not b!1272383) tp_is_empty!32917)
(check-sat)
