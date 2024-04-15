; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72646 () Bool)

(assert start!72646)

(declare-fun b!843198 () Bool)

(declare-fun e!470450 () Bool)

(declare-fun tp_is_empty!15715 () Bool)

(assert (=> b!843198 (= e!470450 tp_is_empty!15715)))

(declare-fun b!843199 () Bool)

(declare-fun e!470453 () Bool)

(assert (=> b!843199 (= e!470453 tp_is_empty!15715)))

(declare-fun res!573048 () Bool)

(declare-fun e!470451 () Bool)

(assert (=> start!72646 (=> (not res!573048) (not e!470451))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47669 0))(
  ( (array!47670 (arr!22866 (Array (_ BitVec 32) (_ BitVec 64))) (size!23308 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47669)

(assert (=> start!72646 (= res!573048 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23308 _keys!868))))))

(assert (=> start!72646 e!470451))

(assert (=> start!72646 true))

(declare-fun array_inv!18262 (array!47669) Bool)

(assert (=> start!72646 (array_inv!18262 _keys!868)))

(declare-datatypes ((V!26001 0))(
  ( (V!26002 (val!7905 Int)) )
))
(declare-datatypes ((ValueCell!7418 0))(
  ( (ValueCellFull!7418 (v!10324 V!26001)) (EmptyCell!7418) )
))
(declare-datatypes ((array!47671 0))(
  ( (array!47672 (arr!22867 (Array (_ BitVec 32) ValueCell!7418)) (size!23309 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47671)

(declare-fun e!470454 () Bool)

(declare-fun array_inv!18263 (array!47671) Bool)

(assert (=> start!72646 (and (array_inv!18263 _values!688) e!470454)))

(declare-fun mapNonEmpty!25172 () Bool)

(declare-fun mapRes!25172 () Bool)

(declare-fun tp!48491 () Bool)

(assert (=> mapNonEmpty!25172 (= mapRes!25172 (and tp!48491 e!470450))))

(declare-fun mapValue!25172 () ValueCell!7418)

(declare-fun mapKey!25172 () (_ BitVec 32))

(declare-fun mapRest!25172 () (Array (_ BitVec 32) ValueCell!7418))

(assert (=> mapNonEmpty!25172 (= (arr!22867 _values!688) (store mapRest!25172 mapKey!25172 mapValue!25172))))

(declare-fun b!843200 () Bool)

(assert (=> b!843200 (= e!470454 (and e!470453 mapRes!25172))))

(declare-fun condMapEmpty!25172 () Bool)

(declare-fun mapDefault!25172 () ValueCell!7418)

(assert (=> b!843200 (= condMapEmpty!25172 (= (arr!22867 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7418)) mapDefault!25172)))))

(declare-fun b!843201 () Bool)

(assert (=> b!843201 (= e!470451 false)))

(declare-fun lt!380903 () Bool)

(declare-datatypes ((List!16256 0))(
  ( (Nil!16253) (Cons!16252 (h!17383 (_ BitVec 64)) (t!22618 List!16256)) )
))
(declare-fun arrayNoDuplicates!0 (array!47669 (_ BitVec 32) List!16256) Bool)

(assert (=> b!843201 (= lt!380903 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16253))))

(declare-fun mapIsEmpty!25172 () Bool)

(assert (=> mapIsEmpty!25172 mapRes!25172))

(declare-fun b!843202 () Bool)

(declare-fun res!573051 () Bool)

(assert (=> b!843202 (=> (not res!573051) (not e!470451))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47669 (_ BitVec 32)) Bool)

(assert (=> b!843202 (= res!573051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!843203 () Bool)

(declare-fun res!573050 () Bool)

(assert (=> b!843203 (=> (not res!573050) (not e!470451))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!843203 (= res!573050 (and (= (size!23309 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23308 _keys!868) (size!23309 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!843204 () Bool)

(declare-fun res!573049 () Bool)

(assert (=> b!843204 (=> (not res!573049) (not e!470451))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843204 (= res!573049 (validMask!0 mask!1196))))

(assert (= (and start!72646 res!573048) b!843204))

(assert (= (and b!843204 res!573049) b!843203))

(assert (= (and b!843203 res!573050) b!843202))

(assert (= (and b!843202 res!573051) b!843201))

(assert (= (and b!843200 condMapEmpty!25172) mapIsEmpty!25172))

(assert (= (and b!843200 (not condMapEmpty!25172)) mapNonEmpty!25172))

(get-info :version)

(assert (= (and mapNonEmpty!25172 ((_ is ValueCellFull!7418) mapValue!25172)) b!843198))

(assert (= (and b!843200 ((_ is ValueCellFull!7418) mapDefault!25172)) b!843199))

(assert (= start!72646 b!843200))

(declare-fun m!785363 () Bool)

(assert (=> b!843202 m!785363))

(declare-fun m!785365 () Bool)

(assert (=> b!843201 m!785365))

(declare-fun m!785367 () Bool)

(assert (=> mapNonEmpty!25172 m!785367))

(declare-fun m!785369 () Bool)

(assert (=> start!72646 m!785369))

(declare-fun m!785371 () Bool)

(assert (=> start!72646 m!785371))

(declare-fun m!785373 () Bool)

(assert (=> b!843204 m!785373))

(check-sat tp_is_empty!15715 (not b!843202) (not b!843204) (not start!72646) (not b!843201) (not mapNonEmpty!25172))
(check-sat)
