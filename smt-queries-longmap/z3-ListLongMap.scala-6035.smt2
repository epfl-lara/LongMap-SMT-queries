; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78278 () Bool)

(assert start!78278)

(declare-fun b_free!16621 () Bool)

(declare-fun b_next!16621 () Bool)

(assert (=> start!78278 (= b_free!16621 (not b_next!16621))))

(declare-fun tp!58138 () Bool)

(declare-fun b_and!27205 () Bool)

(assert (=> start!78278 (= tp!58138 b_and!27205)))

(declare-fun b!912565 () Bool)

(declare-fun e!511896 () Bool)

(declare-fun e!511899 () Bool)

(declare-fun mapRes!30283 () Bool)

(assert (=> b!912565 (= e!511896 (and e!511899 mapRes!30283))))

(declare-fun condMapEmpty!30283 () Bool)

(declare-datatypes ((V!30351 0))(
  ( (V!30352 (val!9570 Int)) )
))
(declare-datatypes ((ValueCell!9038 0))(
  ( (ValueCellFull!9038 (v!12077 V!30351)) (EmptyCell!9038) )
))
(declare-datatypes ((array!54141 0))(
  ( (array!54142 (arr!26021 (Array (_ BitVec 32) ValueCell!9038)) (size!26481 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54141)

(declare-fun mapDefault!30283 () ValueCell!9038)

(assert (=> b!912565 (= condMapEmpty!30283 (= (arr!26021 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9038)) mapDefault!30283)))))

(declare-fun b!912566 () Bool)

(declare-fun tp_is_empty!19039 () Bool)

(assert (=> b!912566 (= e!511899 tp_is_empty!19039)))

(declare-fun b!912567 () Bool)

(declare-fun res!615397 () Bool)

(declare-fun e!511895 () Bool)

(assert (=> b!912567 (=> (not res!615397) (not e!511895))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!54143 0))(
  ( (array!54144 (arr!26022 (Array (_ BitVec 32) (_ BitVec 64))) (size!26482 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54143)

(assert (=> b!912567 (= res!615397 (and (= (size!26481 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26482 _keys!1386) (size!26481 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!912568 () Bool)

(assert (=> b!912568 (= e!511895 false)))

(declare-fun lt!410853 () Bool)

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30351)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30351)

(declare-datatypes ((tuple2!12432 0))(
  ( (tuple2!12433 (_1!6227 (_ BitVec 64)) (_2!6227 V!30351)) )
))
(declare-datatypes ((List!18251 0))(
  ( (Nil!18248) (Cons!18247 (h!19399 tuple2!12432) (t!25830 List!18251)) )
))
(declare-datatypes ((ListLongMap!11131 0))(
  ( (ListLongMap!11132 (toList!5581 List!18251)) )
))
(declare-fun contains!4635 (ListLongMap!11131 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2842 (array!54143 array!54141 (_ BitVec 32) (_ BitVec 32) V!30351 V!30351 (_ BitVec 32) Int) ListLongMap!11131)

(assert (=> b!912568 (= lt!410853 (contains!4635 (getCurrentListMap!2842 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun res!615398 () Bool)

(assert (=> start!78278 (=> (not res!615398) (not e!511895))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78278 (= res!615398 (validMask!0 mask!1756))))

(assert (=> start!78278 e!511895))

(declare-fun array_inv!20416 (array!54141) Bool)

(assert (=> start!78278 (and (array_inv!20416 _values!1152) e!511896)))

(assert (=> start!78278 tp!58138))

(assert (=> start!78278 true))

(assert (=> start!78278 tp_is_empty!19039))

(declare-fun array_inv!20417 (array!54143) Bool)

(assert (=> start!78278 (array_inv!20417 _keys!1386)))

(declare-fun b!912569 () Bool)

(declare-fun e!511897 () Bool)

(assert (=> b!912569 (= e!511897 tp_is_empty!19039)))

(declare-fun b!912570 () Bool)

(declare-fun res!615396 () Bool)

(assert (=> b!912570 (=> (not res!615396) (not e!511895))))

(declare-datatypes ((List!18252 0))(
  ( (Nil!18249) (Cons!18248 (h!19400 (_ BitVec 64)) (t!25831 List!18252)) )
))
(declare-fun arrayNoDuplicates!0 (array!54143 (_ BitVec 32) List!18252) Bool)

(assert (=> b!912570 (= res!615396 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18249))))

(declare-fun mapIsEmpty!30283 () Bool)

(assert (=> mapIsEmpty!30283 mapRes!30283))

(declare-fun b!912571 () Bool)

(declare-fun res!615395 () Bool)

(assert (=> b!912571 (=> (not res!615395) (not e!511895))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54143 (_ BitVec 32)) Bool)

(assert (=> b!912571 (= res!615395 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapNonEmpty!30283 () Bool)

(declare-fun tp!58137 () Bool)

(assert (=> mapNonEmpty!30283 (= mapRes!30283 (and tp!58137 e!511897))))

(declare-fun mapKey!30283 () (_ BitVec 32))

(declare-fun mapValue!30283 () ValueCell!9038)

(declare-fun mapRest!30283 () (Array (_ BitVec 32) ValueCell!9038))

(assert (=> mapNonEmpty!30283 (= (arr!26021 _values!1152) (store mapRest!30283 mapKey!30283 mapValue!30283))))

(assert (= (and start!78278 res!615398) b!912567))

(assert (= (and b!912567 res!615397) b!912571))

(assert (= (and b!912571 res!615395) b!912570))

(assert (= (and b!912570 res!615396) b!912568))

(assert (= (and b!912565 condMapEmpty!30283) mapIsEmpty!30283))

(assert (= (and b!912565 (not condMapEmpty!30283)) mapNonEmpty!30283))

(get-info :version)

(assert (= (and mapNonEmpty!30283 ((_ is ValueCellFull!9038) mapValue!30283)) b!912569))

(assert (= (and b!912565 ((_ is ValueCellFull!9038) mapDefault!30283)) b!912566))

(assert (= start!78278 b!912565))

(declare-fun m!847653 () Bool)

(assert (=> start!78278 m!847653))

(declare-fun m!847655 () Bool)

(assert (=> start!78278 m!847655))

(declare-fun m!847657 () Bool)

(assert (=> start!78278 m!847657))

(declare-fun m!847659 () Bool)

(assert (=> b!912568 m!847659))

(assert (=> b!912568 m!847659))

(declare-fun m!847661 () Bool)

(assert (=> b!912568 m!847661))

(declare-fun m!847663 () Bool)

(assert (=> mapNonEmpty!30283 m!847663))

(declare-fun m!847665 () Bool)

(assert (=> b!912570 m!847665))

(declare-fun m!847667 () Bool)

(assert (=> b!912571 m!847667))

(check-sat b_and!27205 (not b_next!16621) (not b!912568) (not start!78278) (not b!912571) tp_is_empty!19039 (not mapNonEmpty!30283) (not b!912570))
(check-sat b_and!27205 (not b_next!16621))
