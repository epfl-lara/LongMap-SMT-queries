; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72670 () Bool)

(assert start!72670)

(declare-fun mapIsEmpty!25208 () Bool)

(declare-fun mapRes!25208 () Bool)

(assert (=> mapIsEmpty!25208 mapRes!25208))

(declare-fun b!843450 () Bool)

(declare-fun res!573192 () Bool)

(declare-fun e!470630 () Bool)

(assert (=> b!843450 (=> (not res!573192) (not e!470630))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47717 0))(
  ( (array!47718 (arr!22890 (Array (_ BitVec 32) (_ BitVec 64))) (size!23332 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47717)

(declare-datatypes ((V!26033 0))(
  ( (V!26034 (val!7917 Int)) )
))
(declare-datatypes ((ValueCell!7430 0))(
  ( (ValueCellFull!7430 (v!10336 V!26033)) (EmptyCell!7430) )
))
(declare-datatypes ((array!47719 0))(
  ( (array!47720 (arr!22891 (Array (_ BitVec 32) ValueCell!7430)) (size!23333 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47719)

(assert (=> b!843450 (= res!573192 (and (= (size!23333 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23332 _keys!868) (size!23333 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!843451 () Bool)

(declare-fun e!470634 () Bool)

(declare-fun tp_is_empty!15739 () Bool)

(assert (=> b!843451 (= e!470634 tp_is_empty!15739)))

(declare-fun b!843452 () Bool)

(declare-fun res!573195 () Bool)

(assert (=> b!843452 (=> (not res!573195) (not e!470630))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47717 (_ BitVec 32)) Bool)

(assert (=> b!843452 (= res!573195 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!25208 () Bool)

(declare-fun tp!48527 () Bool)

(declare-fun e!470632 () Bool)

(assert (=> mapNonEmpty!25208 (= mapRes!25208 (and tp!48527 e!470632))))

(declare-fun mapValue!25208 () ValueCell!7430)

(declare-fun mapKey!25208 () (_ BitVec 32))

(declare-fun mapRest!25208 () (Array (_ BitVec 32) ValueCell!7430))

(assert (=> mapNonEmpty!25208 (= (arr!22891 _values!688) (store mapRest!25208 mapKey!25208 mapValue!25208))))

(declare-fun b!843453 () Bool)

(assert (=> b!843453 (= e!470630 false)))

(declare-fun lt!380939 () Bool)

(declare-datatypes ((List!16266 0))(
  ( (Nil!16263) (Cons!16262 (h!17393 (_ BitVec 64)) (t!22628 List!16266)) )
))
(declare-fun arrayNoDuplicates!0 (array!47717 (_ BitVec 32) List!16266) Bool)

(assert (=> b!843453 (= lt!380939 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16263))))

(declare-fun b!843454 () Bool)

(declare-fun res!573194 () Bool)

(assert (=> b!843454 (=> (not res!573194) (not e!470630))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843454 (= res!573194 (validMask!0 mask!1196))))

(declare-fun b!843455 () Bool)

(declare-fun e!470633 () Bool)

(assert (=> b!843455 (= e!470633 (and e!470634 mapRes!25208))))

(declare-fun condMapEmpty!25208 () Bool)

(declare-fun mapDefault!25208 () ValueCell!7430)

(assert (=> b!843455 (= condMapEmpty!25208 (= (arr!22891 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7430)) mapDefault!25208)))))

(declare-fun res!573193 () Bool)

(assert (=> start!72670 (=> (not res!573193) (not e!470630))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72670 (= res!573193 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23332 _keys!868))))))

(assert (=> start!72670 e!470630))

(assert (=> start!72670 true))

(declare-fun array_inv!18280 (array!47717) Bool)

(assert (=> start!72670 (array_inv!18280 _keys!868)))

(declare-fun array_inv!18281 (array!47719) Bool)

(assert (=> start!72670 (and (array_inv!18281 _values!688) e!470633)))

(declare-fun b!843456 () Bool)

(assert (=> b!843456 (= e!470632 tp_is_empty!15739)))

(assert (= (and start!72670 res!573193) b!843454))

(assert (= (and b!843454 res!573194) b!843450))

(assert (= (and b!843450 res!573192) b!843452))

(assert (= (and b!843452 res!573195) b!843453))

(assert (= (and b!843455 condMapEmpty!25208) mapIsEmpty!25208))

(assert (= (and b!843455 (not condMapEmpty!25208)) mapNonEmpty!25208))

(get-info :version)

(assert (= (and mapNonEmpty!25208 ((_ is ValueCellFull!7430) mapValue!25208)) b!843456))

(assert (= (and b!843455 ((_ is ValueCellFull!7430) mapDefault!25208)) b!843451))

(assert (= start!72670 b!843455))

(declare-fun m!785507 () Bool)

(assert (=> b!843454 m!785507))

(declare-fun m!785509 () Bool)

(assert (=> b!843452 m!785509))

(declare-fun m!785511 () Bool)

(assert (=> mapNonEmpty!25208 m!785511))

(declare-fun m!785513 () Bool)

(assert (=> start!72670 m!785513))

(declare-fun m!785515 () Bool)

(assert (=> start!72670 m!785515))

(declare-fun m!785517 () Bool)

(assert (=> b!843453 m!785517))

(check-sat (not mapNonEmpty!25208) (not b!843454) (not b!843453) (not b!843452) (not start!72670) tp_is_empty!15739)
(check-sat)
