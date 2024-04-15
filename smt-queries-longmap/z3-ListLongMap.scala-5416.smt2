; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72262 () Bool)

(assert start!72262)

(declare-fun b!837222 () Bool)

(declare-fun e!467248 () Bool)

(declare-fun tp_is_empty!15331 () Bool)

(assert (=> b!837222 (= e!467248 tp_is_empty!15331)))

(declare-fun b!837223 () Bool)

(declare-fun e!467247 () Bool)

(assert (=> b!837223 (= e!467247 false)))

(declare-fun lt!380327 () Bool)

(declare-datatypes ((array!46931 0))(
  ( (array!46932 (arr!22497 (Array (_ BitVec 32) (_ BitVec 64))) (size!22939 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46931)

(declare-datatypes ((List!16028 0))(
  ( (Nil!16025) (Cons!16024 (h!17155 (_ BitVec 64)) (t!22390 List!16028)) )
))
(declare-fun arrayNoDuplicates!0 (array!46931 (_ BitVec 32) List!16028) Bool)

(assert (=> b!837223 (= lt!380327 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16025))))

(declare-fun b!837224 () Bool)

(declare-fun res!569448 () Bool)

(assert (=> b!837224 (=> (not res!569448) (not e!467247))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!837224 (= res!569448 (validMask!0 mask!1196))))

(declare-fun b!837225 () Bool)

(declare-fun res!569451 () Bool)

(assert (=> b!837225 (=> (not res!569451) (not e!467247))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46931 (_ BitVec 32)) Bool)

(assert (=> b!837225 (= res!569451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!24596 () Bool)

(declare-fun mapRes!24596 () Bool)

(declare-fun tp!47591 () Bool)

(assert (=> mapNonEmpty!24596 (= mapRes!24596 (and tp!47591 e!467248))))

(declare-datatypes ((V!25489 0))(
  ( (V!25490 (val!7713 Int)) )
))
(declare-datatypes ((ValueCell!7226 0))(
  ( (ValueCellFull!7226 (v!10132 V!25489)) (EmptyCell!7226) )
))
(declare-fun mapValue!24596 () ValueCell!7226)

(declare-fun mapKey!24596 () (_ BitVec 32))

(declare-fun mapRest!24596 () (Array (_ BitVec 32) ValueCell!7226))

(declare-datatypes ((array!46933 0))(
  ( (array!46934 (arr!22498 (Array (_ BitVec 32) ValueCell!7226)) (size!22940 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46933)

(assert (=> mapNonEmpty!24596 (= (arr!22498 _values!688) (store mapRest!24596 mapKey!24596 mapValue!24596))))

(declare-fun b!837226 () Bool)

(declare-fun e!467250 () Bool)

(assert (=> b!837226 (= e!467250 tp_is_empty!15331)))

(declare-fun b!837227 () Bool)

(declare-fun e!467249 () Bool)

(assert (=> b!837227 (= e!467249 (and e!467250 mapRes!24596))))

(declare-fun condMapEmpty!24596 () Bool)

(declare-fun mapDefault!24596 () ValueCell!7226)

(assert (=> b!837227 (= condMapEmpty!24596 (= (arr!22498 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7226)) mapDefault!24596)))))

(declare-fun mapIsEmpty!24596 () Bool)

(assert (=> mapIsEmpty!24596 mapRes!24596))

(declare-fun b!837228 () Bool)

(declare-fun res!569450 () Bool)

(assert (=> b!837228 (=> (not res!569450) (not e!467247))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!837228 (= res!569450 (and (= (size!22940 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22939 _keys!868) (size!22940 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!569449 () Bool)

(assert (=> start!72262 (=> (not res!569449) (not e!467247))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72262 (= res!569449 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22939 _keys!868))))))

(assert (=> start!72262 e!467247))

(assert (=> start!72262 true))

(declare-fun array_inv!17998 (array!46931) Bool)

(assert (=> start!72262 (array_inv!17998 _keys!868)))

(declare-fun array_inv!17999 (array!46933) Bool)

(assert (=> start!72262 (and (array_inv!17999 _values!688) e!467249)))

(assert (= (and start!72262 res!569449) b!837224))

(assert (= (and b!837224 res!569448) b!837228))

(assert (= (and b!837228 res!569450) b!837225))

(assert (= (and b!837225 res!569451) b!837223))

(assert (= (and b!837227 condMapEmpty!24596) mapIsEmpty!24596))

(assert (= (and b!837227 (not condMapEmpty!24596)) mapNonEmpty!24596))

(get-info :version)

(assert (= (and mapNonEmpty!24596 ((_ is ValueCellFull!7226) mapValue!24596)) b!837222))

(assert (= (and b!837227 ((_ is ValueCellFull!7226) mapDefault!24596)) b!837226))

(assert (= start!72262 b!837227))

(declare-fun m!781547 () Bool)

(assert (=> b!837225 m!781547))

(declare-fun m!781549 () Bool)

(assert (=> b!837223 m!781549))

(declare-fun m!781551 () Bool)

(assert (=> b!837224 m!781551))

(declare-fun m!781553 () Bool)

(assert (=> mapNonEmpty!24596 m!781553))

(declare-fun m!781555 () Bool)

(assert (=> start!72262 m!781555))

(declare-fun m!781557 () Bool)

(assert (=> start!72262 m!781557))

(check-sat (not b!837224) (not b!837225) (not start!72262) (not b!837223) (not mapNonEmpty!24596) tp_is_empty!15331)
(check-sat)
