; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104520 () Bool)

(assert start!104520)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun b!1246859 () Bool)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!80207 0))(
  ( (array!80208 (arr!38678 (Array (_ BitVec 32) (_ BitVec 64))) (size!39216 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80207)

(declare-datatypes ((V!47095 0))(
  ( (V!47096 (val!15711 Int)) )
))
(declare-datatypes ((ValueCell!14885 0))(
  ( (ValueCellFull!14885 (v!18405 V!47095)) (EmptyCell!14885) )
))
(declare-datatypes ((array!80209 0))(
  ( (array!80210 (arr!38679 (Array (_ BitVec 32) ValueCell!14885)) (size!39217 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80209)

(declare-fun e!707206 () Bool)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1246859 (= e!707206 (and (= (size!39217 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39216 _keys!1118) (size!39217 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (size!39216 _keys!1118) (bvadd #b00000000000000000000000000000001 mask!1466)))))))

(declare-fun b!1246860 () Bool)

(declare-fun e!707204 () Bool)

(declare-fun e!707207 () Bool)

(declare-fun mapRes!48685 () Bool)

(assert (=> b!1246860 (= e!707204 (and e!707207 mapRes!48685))))

(declare-fun condMapEmpty!48685 () Bool)

(declare-fun mapDefault!48685 () ValueCell!14885)

(assert (=> b!1246860 (= condMapEmpty!48685 (= (arr!38679 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14885)) mapDefault!48685)))))

(declare-fun mapIsEmpty!48685 () Bool)

(assert (=> mapIsEmpty!48685 mapRes!48685))

(declare-fun mapNonEmpty!48685 () Bool)

(declare-fun tp!92786 () Bool)

(declare-fun e!707205 () Bool)

(assert (=> mapNonEmpty!48685 (= mapRes!48685 (and tp!92786 e!707205))))

(declare-fun mapKey!48685 () (_ BitVec 32))

(declare-fun mapRest!48685 () (Array (_ BitVec 32) ValueCell!14885))

(declare-fun mapValue!48685 () ValueCell!14885)

(assert (=> mapNonEmpty!48685 (= (arr!38679 _values!914) (store mapRest!48685 mapKey!48685 mapValue!48685))))

(declare-fun res!832086 () Bool)

(assert (=> start!104520 (=> (not res!832086) (not e!707206))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104520 (= res!832086 (validMask!0 mask!1466))))

(assert (=> start!104520 e!707206))

(assert (=> start!104520 true))

(declare-fun array_inv!29661 (array!80207) Bool)

(assert (=> start!104520 (array_inv!29661 _keys!1118)))

(declare-fun array_inv!29662 (array!80209) Bool)

(assert (=> start!104520 (and (array_inv!29662 _values!914) e!707204)))

(declare-fun b!1246861 () Bool)

(declare-fun tp_is_empty!31297 () Bool)

(assert (=> b!1246861 (= e!707207 tp_is_empty!31297)))

(declare-fun b!1246862 () Bool)

(assert (=> b!1246862 (= e!707205 tp_is_empty!31297)))

(assert (= (and start!104520 res!832086) b!1246859))

(assert (= (and b!1246860 condMapEmpty!48685) mapIsEmpty!48685))

(assert (= (and b!1246860 (not condMapEmpty!48685)) mapNonEmpty!48685))

(get-info :version)

(assert (= (and mapNonEmpty!48685 ((_ is ValueCellFull!14885) mapValue!48685)) b!1246862))

(assert (= (and b!1246860 ((_ is ValueCellFull!14885) mapDefault!48685)) b!1246861))

(assert (= start!104520 b!1246860))

(declare-fun m!1148119 () Bool)

(assert (=> mapNonEmpty!48685 m!1148119))

(declare-fun m!1148121 () Bool)

(assert (=> start!104520 m!1148121))

(declare-fun m!1148123 () Bool)

(assert (=> start!104520 m!1148123))

(declare-fun m!1148125 () Bool)

(assert (=> start!104520 m!1148125))

(check-sat (not start!104520) (not mapNonEmpty!48685) tp_is_empty!31297)
(check-sat)
