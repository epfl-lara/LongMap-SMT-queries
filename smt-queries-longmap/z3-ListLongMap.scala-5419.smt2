; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72300 () Bool)

(assert start!72300)

(declare-fun mapIsEmpty!24626 () Bool)

(declare-fun mapRes!24626 () Bool)

(assert (=> mapIsEmpty!24626 mapRes!24626))

(declare-fun res!569679 () Bool)

(declare-fun e!467547 () Bool)

(assert (=> start!72300 (=> (not res!569679) (not e!467547))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47000 0))(
  ( (array!47001 (arr!22531 (Array (_ BitVec 32) (_ BitVec 64))) (size!22971 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47000)

(assert (=> start!72300 (= res!569679 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22971 _keys!868))))))

(assert (=> start!72300 e!467547))

(assert (=> start!72300 true))

(declare-fun array_inv!17958 (array!47000) Bool)

(assert (=> start!72300 (array_inv!17958 _keys!868)))

(declare-datatypes ((V!25515 0))(
  ( (V!25516 (val!7723 Int)) )
))
(declare-datatypes ((ValueCell!7236 0))(
  ( (ValueCellFull!7236 (v!10148 V!25515)) (EmptyCell!7236) )
))
(declare-datatypes ((array!47002 0))(
  ( (array!47003 (arr!22532 (Array (_ BitVec 32) ValueCell!7236)) (size!22972 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47002)

(declare-fun e!467546 () Bool)

(declare-fun array_inv!17959 (array!47002) Bool)

(assert (=> start!72300 (and (array_inv!17959 _values!688) e!467546)))

(declare-fun b!837671 () Bool)

(assert (=> b!837671 (= e!467547 false)))

(declare-fun lt!380593 () Bool)

(declare-datatypes ((List!16034 0))(
  ( (Nil!16031) (Cons!16030 (h!17161 (_ BitVec 64)) (t!22405 List!16034)) )
))
(declare-fun arrayNoDuplicates!0 (array!47000 (_ BitVec 32) List!16034) Bool)

(assert (=> b!837671 (= lt!380593 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16031))))

(declare-fun b!837672 () Bool)

(declare-fun e!467544 () Bool)

(declare-fun tp_is_empty!15351 () Bool)

(assert (=> b!837672 (= e!467544 tp_is_empty!15351)))

(declare-fun b!837673 () Bool)

(declare-fun res!569681 () Bool)

(assert (=> b!837673 (=> (not res!569681) (not e!467547))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!837673 (= res!569681 (validMask!0 mask!1196))))

(declare-fun b!837674 () Bool)

(declare-fun res!569680 () Bool)

(assert (=> b!837674 (=> (not res!569680) (not e!467547))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!837674 (= res!569680 (and (= (size!22972 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22971 _keys!868) (size!22972 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!837675 () Bool)

(declare-fun e!467545 () Bool)

(assert (=> b!837675 (= e!467546 (and e!467545 mapRes!24626))))

(declare-fun condMapEmpty!24626 () Bool)

(declare-fun mapDefault!24626 () ValueCell!7236)

(assert (=> b!837675 (= condMapEmpty!24626 (= (arr!22532 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7236)) mapDefault!24626)))))

(declare-fun b!837676 () Bool)

(assert (=> b!837676 (= e!467545 tp_is_empty!15351)))

(declare-fun b!837677 () Bool)

(declare-fun res!569678 () Bool)

(assert (=> b!837677 (=> (not res!569678) (not e!467547))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47000 (_ BitVec 32)) Bool)

(assert (=> b!837677 (= res!569678 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!24626 () Bool)

(declare-fun tp!47620 () Bool)

(assert (=> mapNonEmpty!24626 (= mapRes!24626 (and tp!47620 e!467544))))

(declare-fun mapValue!24626 () ValueCell!7236)

(declare-fun mapKey!24626 () (_ BitVec 32))

(declare-fun mapRest!24626 () (Array (_ BitVec 32) ValueCell!7236))

(assert (=> mapNonEmpty!24626 (= (arr!22532 _values!688) (store mapRest!24626 mapKey!24626 mapValue!24626))))

(assert (= (and start!72300 res!569679) b!837673))

(assert (= (and b!837673 res!569681) b!837674))

(assert (= (and b!837674 res!569680) b!837677))

(assert (= (and b!837677 res!569678) b!837671))

(assert (= (and b!837675 condMapEmpty!24626) mapIsEmpty!24626))

(assert (= (and b!837675 (not condMapEmpty!24626)) mapNonEmpty!24626))

(get-info :version)

(assert (= (and mapNonEmpty!24626 ((_ is ValueCellFull!7236) mapValue!24626)) b!837672))

(assert (= (and b!837675 ((_ is ValueCellFull!7236) mapDefault!24626)) b!837676))

(assert (= start!72300 b!837675))

(declare-fun m!782421 () Bool)

(assert (=> b!837673 m!782421))

(declare-fun m!782423 () Bool)

(assert (=> mapNonEmpty!24626 m!782423))

(declare-fun m!782425 () Bool)

(assert (=> start!72300 m!782425))

(declare-fun m!782427 () Bool)

(assert (=> start!72300 m!782427))

(declare-fun m!782429 () Bool)

(assert (=> b!837677 m!782429))

(declare-fun m!782431 () Bool)

(assert (=> b!837671 m!782431))

(check-sat (not b!837671) (not start!72300) tp_is_empty!15351 (not b!837677) (not mapNonEmpty!24626) (not b!837673))
(check-sat)
