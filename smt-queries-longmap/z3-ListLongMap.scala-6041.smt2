; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78148 () Bool)

(assert start!78148)

(declare-fun b_free!16659 () Bool)

(declare-fun b_next!16659 () Bool)

(assert (=> start!78148 (= b_free!16659 (not b_next!16659))))

(declare-fun tp!58251 () Bool)

(declare-fun b_and!27233 () Bool)

(assert (=> start!78148 (= tp!58251 b_and!27233)))

(declare-fun b!912061 () Bool)

(declare-fun e!511599 () Bool)

(assert (=> b!912061 (= e!511599 false)))

(declare-datatypes ((V!30401 0))(
  ( (V!30402 (val!9589 Int)) )
))
(declare-datatypes ((ValueCell!9057 0))(
  ( (ValueCellFull!9057 (v!12099 V!30401)) (EmptyCell!9057) )
))
(declare-datatypes ((array!54152 0))(
  ( (array!54153 (arr!26031 (Array (_ BitVec 32) ValueCell!9057)) (size!26490 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54152)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30401)

(declare-datatypes ((array!54154 0))(
  ( (array!54155 (arr!26032 (Array (_ BitVec 32) (_ BitVec 64))) (size!26491 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54154)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun lt!410549 () Bool)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30401)

(declare-datatypes ((tuple2!12494 0))(
  ( (tuple2!12495 (_1!6258 (_ BitVec 64)) (_2!6258 V!30401)) )
))
(declare-datatypes ((List!18284 0))(
  ( (Nil!18281) (Cons!18280 (h!19426 tuple2!12494) (t!25871 List!18284)) )
))
(declare-datatypes ((ListLongMap!11191 0))(
  ( (ListLongMap!11192 (toList!5611 List!18284)) )
))
(declare-fun contains!4656 (ListLongMap!11191 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2873 (array!54154 array!54152 (_ BitVec 32) (_ BitVec 32) V!30401 V!30401 (_ BitVec 32) Int) ListLongMap!11191)

(assert (=> b!912061 (= lt!410549 (contains!4656 (getCurrentListMap!2873 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!912062 () Bool)

(declare-fun res!615279 () Bool)

(assert (=> b!912062 (=> (not res!615279) (not e!511599))))

(declare-datatypes ((List!18285 0))(
  ( (Nil!18282) (Cons!18281 (h!19427 (_ BitVec 64)) (t!25872 List!18285)) )
))
(declare-fun arrayNoDuplicates!0 (array!54154 (_ BitVec 32) List!18285) Bool)

(assert (=> b!912062 (= res!615279 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18282))))

(declare-fun b!912063 () Bool)

(declare-fun res!615280 () Bool)

(assert (=> b!912063 (=> (not res!615280) (not e!511599))))

(assert (=> b!912063 (= res!615280 (and (= (size!26490 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26491 _keys!1386) (size!26490 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!30340 () Bool)

(declare-fun mapRes!30340 () Bool)

(declare-fun tp!58250 () Bool)

(declare-fun e!511600 () Bool)

(assert (=> mapNonEmpty!30340 (= mapRes!30340 (and tp!58250 e!511600))))

(declare-fun mapRest!30340 () (Array (_ BitVec 32) ValueCell!9057))

(declare-fun mapValue!30340 () ValueCell!9057)

(declare-fun mapKey!30340 () (_ BitVec 32))

(assert (=> mapNonEmpty!30340 (= (arr!26031 _values!1152) (store mapRest!30340 mapKey!30340 mapValue!30340))))

(declare-fun res!615282 () Bool)

(assert (=> start!78148 (=> (not res!615282) (not e!511599))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78148 (= res!615282 (validMask!0 mask!1756))))

(assert (=> start!78148 e!511599))

(declare-fun e!511602 () Bool)

(declare-fun array_inv!20342 (array!54152) Bool)

(assert (=> start!78148 (and (array_inv!20342 _values!1152) e!511602)))

(assert (=> start!78148 tp!58251))

(assert (=> start!78148 true))

(declare-fun tp_is_empty!19077 () Bool)

(assert (=> start!78148 tp_is_empty!19077))

(declare-fun array_inv!20343 (array!54154) Bool)

(assert (=> start!78148 (array_inv!20343 _keys!1386)))

(declare-fun mapIsEmpty!30340 () Bool)

(assert (=> mapIsEmpty!30340 mapRes!30340))

(declare-fun b!912064 () Bool)

(declare-fun e!511598 () Bool)

(assert (=> b!912064 (= e!511602 (and e!511598 mapRes!30340))))

(declare-fun condMapEmpty!30340 () Bool)

(declare-fun mapDefault!30340 () ValueCell!9057)

(assert (=> b!912064 (= condMapEmpty!30340 (= (arr!26031 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9057)) mapDefault!30340)))))

(declare-fun b!912065 () Bool)

(assert (=> b!912065 (= e!511600 tp_is_empty!19077)))

(declare-fun b!912066 () Bool)

(declare-fun res!615281 () Bool)

(assert (=> b!912066 (=> (not res!615281) (not e!511599))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54154 (_ BitVec 32)) Bool)

(assert (=> b!912066 (= res!615281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!912067 () Bool)

(assert (=> b!912067 (= e!511598 tp_is_empty!19077)))

(assert (= (and start!78148 res!615282) b!912063))

(assert (= (and b!912063 res!615280) b!912066))

(assert (= (and b!912066 res!615281) b!912062))

(assert (= (and b!912062 res!615279) b!912061))

(assert (= (and b!912064 condMapEmpty!30340) mapIsEmpty!30340))

(assert (= (and b!912064 (not condMapEmpty!30340)) mapNonEmpty!30340))

(get-info :version)

(assert (= (and mapNonEmpty!30340 ((_ is ValueCellFull!9057) mapValue!30340)) b!912065))

(assert (= (and b!912064 ((_ is ValueCellFull!9057) mapDefault!30340)) b!912067))

(assert (= start!78148 b!912064))

(declare-fun m!846663 () Bool)

(assert (=> b!912061 m!846663))

(assert (=> b!912061 m!846663))

(declare-fun m!846665 () Bool)

(assert (=> b!912061 m!846665))

(declare-fun m!846667 () Bool)

(assert (=> b!912066 m!846667))

(declare-fun m!846669 () Bool)

(assert (=> start!78148 m!846669))

(declare-fun m!846671 () Bool)

(assert (=> start!78148 m!846671))

(declare-fun m!846673 () Bool)

(assert (=> start!78148 m!846673))

(declare-fun m!846675 () Bool)

(assert (=> b!912062 m!846675))

(declare-fun m!846677 () Bool)

(assert (=> mapNonEmpty!30340 m!846677))

(check-sat (not b!912066) tp_is_empty!19077 (not mapNonEmpty!30340) b_and!27233 (not b!912062) (not b_next!16659) (not start!78148) (not b!912061))
(check-sat b_and!27233 (not b_next!16659))
