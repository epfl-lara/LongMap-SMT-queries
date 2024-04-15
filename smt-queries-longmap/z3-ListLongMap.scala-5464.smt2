; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72550 () Bool)

(assert start!72550)

(declare-fun b!842190 () Bool)

(declare-fun e!469733 () Bool)

(declare-fun tp_is_empty!15619 () Bool)

(assert (=> b!842190 (= e!469733 tp_is_empty!15619)))

(declare-fun b!842191 () Bool)

(declare-fun res!572472 () Bool)

(declare-fun e!469730 () Bool)

(assert (=> b!842191 (=> (not res!572472) (not e!469730))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842191 (= res!572472 (validMask!0 mask!1196))))

(declare-fun b!842192 () Bool)

(declare-fun e!469731 () Bool)

(assert (=> b!842192 (= e!469731 tp_is_empty!15619)))

(declare-fun res!572473 () Bool)

(assert (=> start!72550 (=> (not res!572473) (not e!469730))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47491 0))(
  ( (array!47492 (arr!22777 (Array (_ BitVec 32) (_ BitVec 64))) (size!23219 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47491)

(assert (=> start!72550 (= res!572473 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23219 _keys!868))))))

(assert (=> start!72550 e!469730))

(assert (=> start!72550 true))

(declare-fun array_inv!18198 (array!47491) Bool)

(assert (=> start!72550 (array_inv!18198 _keys!868)))

(declare-datatypes ((V!25873 0))(
  ( (V!25874 (val!7857 Int)) )
))
(declare-datatypes ((ValueCell!7370 0))(
  ( (ValueCellFull!7370 (v!10276 V!25873)) (EmptyCell!7370) )
))
(declare-datatypes ((array!47493 0))(
  ( (array!47494 (arr!22778 (Array (_ BitVec 32) ValueCell!7370)) (size!23220 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47493)

(declare-fun e!469734 () Bool)

(declare-fun array_inv!18199 (array!47493) Bool)

(assert (=> start!72550 (and (array_inv!18199 _values!688) e!469734)))

(declare-fun b!842193 () Bool)

(declare-fun mapRes!25028 () Bool)

(assert (=> b!842193 (= e!469734 (and e!469733 mapRes!25028))))

(declare-fun condMapEmpty!25028 () Bool)

(declare-fun mapDefault!25028 () ValueCell!7370)

(assert (=> b!842193 (= condMapEmpty!25028 (= (arr!22778 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7370)) mapDefault!25028)))))

(declare-fun b!842194 () Bool)

(assert (=> b!842194 (= e!469730 false)))

(declare-fun lt!380759 () Bool)

(declare-datatypes ((List!16223 0))(
  ( (Nil!16220) (Cons!16219 (h!17350 (_ BitVec 64)) (t!22585 List!16223)) )
))
(declare-fun arrayNoDuplicates!0 (array!47491 (_ BitVec 32) List!16223) Bool)

(assert (=> b!842194 (= lt!380759 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16220))))

(declare-fun b!842195 () Bool)

(declare-fun res!572474 () Bool)

(assert (=> b!842195 (=> (not res!572474) (not e!469730))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47491 (_ BitVec 32)) Bool)

(assert (=> b!842195 (= res!572474 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!25028 () Bool)

(assert (=> mapIsEmpty!25028 mapRes!25028))

(declare-fun mapNonEmpty!25028 () Bool)

(declare-fun tp!48347 () Bool)

(assert (=> mapNonEmpty!25028 (= mapRes!25028 (and tp!48347 e!469731))))

(declare-fun mapValue!25028 () ValueCell!7370)

(declare-fun mapRest!25028 () (Array (_ BitVec 32) ValueCell!7370))

(declare-fun mapKey!25028 () (_ BitVec 32))

(assert (=> mapNonEmpty!25028 (= (arr!22778 _values!688) (store mapRest!25028 mapKey!25028 mapValue!25028))))

(declare-fun b!842196 () Bool)

(declare-fun res!572475 () Bool)

(assert (=> b!842196 (=> (not res!572475) (not e!469730))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!842196 (= res!572475 (and (= (size!23220 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23219 _keys!868) (size!23220 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!72550 res!572473) b!842191))

(assert (= (and b!842191 res!572472) b!842196))

(assert (= (and b!842196 res!572475) b!842195))

(assert (= (and b!842195 res!572474) b!842194))

(assert (= (and b!842193 condMapEmpty!25028) mapIsEmpty!25028))

(assert (= (and b!842193 (not condMapEmpty!25028)) mapNonEmpty!25028))

(get-info :version)

(assert (= (and mapNonEmpty!25028 ((_ is ValueCellFull!7370) mapValue!25028)) b!842192))

(assert (= (and b!842193 ((_ is ValueCellFull!7370) mapDefault!25028)) b!842190))

(assert (= start!72550 b!842193))

(declare-fun m!784787 () Bool)

(assert (=> b!842195 m!784787))

(declare-fun m!784789 () Bool)

(assert (=> b!842191 m!784789))

(declare-fun m!784791 () Bool)

(assert (=> mapNonEmpty!25028 m!784791))

(declare-fun m!784793 () Bool)

(assert (=> b!842194 m!784793))

(declare-fun m!784795 () Bool)

(assert (=> start!72550 m!784795))

(declare-fun m!784797 () Bool)

(assert (=> start!72550 m!784797))

(check-sat (not mapNonEmpty!25028) (not b!842194) (not b!842191) (not start!72550) tp_is_empty!15619 (not b!842195))
(check-sat)
