; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72490 () Bool)

(assert start!72490)

(declare-fun b!838805 () Bool)

(declare-fun e!468291 () Bool)

(declare-fun tp_is_empty!15373 () Bool)

(assert (=> b!838805 (= e!468291 tp_is_empty!15373)))

(declare-fun b!838806 () Bool)

(declare-fun res!570157 () Bool)

(declare-fun e!468294 () Bool)

(assert (=> b!838806 (=> (not res!570157) (not e!468294))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47045 0))(
  ( (array!47046 (arr!22549 (Array (_ BitVec 32) (_ BitVec 64))) (size!22990 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47045)

(declare-datatypes ((V!25545 0))(
  ( (V!25546 (val!7734 Int)) )
))
(declare-datatypes ((ValueCell!7247 0))(
  ( (ValueCellFull!7247 (v!10159 V!25545)) (EmptyCell!7247) )
))
(declare-datatypes ((array!47047 0))(
  ( (array!47048 (arr!22550 (Array (_ BitVec 32) ValueCell!7247)) (size!22991 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47047)

(assert (=> b!838806 (= res!570157 (and (= (size!22991 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22990 _keys!868) (size!22991 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!838807 () Bool)

(assert (=> b!838807 (= e!468294 false)))

(declare-fun lt!380987 () Bool)

(declare-datatypes ((List!15946 0))(
  ( (Nil!15943) (Cons!15942 (h!17079 (_ BitVec 64)) (t!22309 List!15946)) )
))
(declare-fun arrayNoDuplicates!0 (array!47045 (_ BitVec 32) List!15946) Bool)

(assert (=> b!838807 (= lt!380987 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!15943))))

(declare-fun b!838808 () Bool)

(declare-fun e!468295 () Bool)

(declare-fun mapRes!24659 () Bool)

(assert (=> b!838808 (= e!468295 (and e!468291 mapRes!24659))))

(declare-fun condMapEmpty!24659 () Bool)

(declare-fun mapDefault!24659 () ValueCell!7247)

(assert (=> b!838808 (= condMapEmpty!24659 (= (arr!22550 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7247)) mapDefault!24659)))))

(declare-fun mapIsEmpty!24659 () Bool)

(assert (=> mapIsEmpty!24659 mapRes!24659))

(declare-fun b!838809 () Bool)

(declare-fun res!570156 () Bool)

(assert (=> b!838809 (=> (not res!570156) (not e!468294))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47045 (_ BitVec 32)) Bool)

(assert (=> b!838809 (= res!570156 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!24659 () Bool)

(declare-fun tp!47654 () Bool)

(declare-fun e!468293 () Bool)

(assert (=> mapNonEmpty!24659 (= mapRes!24659 (and tp!47654 e!468293))))

(declare-fun mapKey!24659 () (_ BitVec 32))

(declare-fun mapValue!24659 () ValueCell!7247)

(declare-fun mapRest!24659 () (Array (_ BitVec 32) ValueCell!7247))

(assert (=> mapNonEmpty!24659 (= (arr!22550 _values!688) (store mapRest!24659 mapKey!24659 mapValue!24659))))

(declare-fun res!570155 () Bool)

(assert (=> start!72490 (=> (not res!570155) (not e!468294))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72490 (= res!570155 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22990 _keys!868))))))

(assert (=> start!72490 e!468294))

(assert (=> start!72490 true))

(declare-fun array_inv!18014 (array!47045) Bool)

(assert (=> start!72490 (array_inv!18014 _keys!868)))

(declare-fun array_inv!18015 (array!47047) Bool)

(assert (=> start!72490 (and (array_inv!18015 _values!688) e!468295)))

(declare-fun b!838810 () Bool)

(assert (=> b!838810 (= e!468293 tp_is_empty!15373)))

(declare-fun b!838811 () Bool)

(declare-fun res!570154 () Bool)

(assert (=> b!838811 (=> (not res!570154) (not e!468294))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!838811 (= res!570154 (validMask!0 mask!1196))))

(assert (= (and start!72490 res!570155) b!838811))

(assert (= (and b!838811 res!570154) b!838806))

(assert (= (and b!838806 res!570157) b!838809))

(assert (= (and b!838809 res!570156) b!838807))

(assert (= (and b!838808 condMapEmpty!24659) mapIsEmpty!24659))

(assert (= (and b!838808 (not condMapEmpty!24659)) mapNonEmpty!24659))

(get-info :version)

(assert (= (and mapNonEmpty!24659 ((_ is ValueCellFull!7247) mapValue!24659)) b!838810))

(assert (= (and b!838808 ((_ is ValueCellFull!7247) mapDefault!24659)) b!838805))

(assert (= start!72490 b!838808))

(declare-fun m!783845 () Bool)

(assert (=> b!838809 m!783845))

(declare-fun m!783847 () Bool)

(assert (=> b!838811 m!783847))

(declare-fun m!783849 () Bool)

(assert (=> b!838807 m!783849))

(declare-fun m!783851 () Bool)

(assert (=> mapNonEmpty!24659 m!783851))

(declare-fun m!783853 () Bool)

(assert (=> start!72490 m!783853))

(declare-fun m!783855 () Bool)

(assert (=> start!72490 m!783855))

(check-sat (not b!838811) tp_is_empty!15373 (not b!838809) (not b!838807) (not mapNonEmpty!24659) (not start!72490))
(check-sat)
