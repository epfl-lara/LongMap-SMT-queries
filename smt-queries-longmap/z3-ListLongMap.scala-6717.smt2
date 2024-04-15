; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84256 () Bool)

(assert start!84256)

(declare-fun b!985700 () Bool)

(declare-fun e!555644 () Bool)

(declare-fun tp_is_empty!23077 () Bool)

(assert (=> b!985700 (= e!555644 tp_is_empty!23077)))

(declare-fun b!985701 () Bool)

(declare-fun res!659618 () Bool)

(declare-fun e!555643 () Bool)

(assert (=> b!985701 (=> (not res!659618) (not e!555643))))

(declare-datatypes ((array!62056 0))(
  ( (array!62057 (arr!29886 (Array (_ BitVec 32) (_ BitVec 64))) (size!30367 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62056)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62056 (_ BitVec 32)) Bool)

(assert (=> b!985701 (= res!659618 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!985702 () Bool)

(declare-fun e!555642 () Bool)

(declare-fun mapRes!36644 () Bool)

(assert (=> b!985702 (= e!555642 (and e!555644 mapRes!36644))))

(declare-fun condMapEmpty!36644 () Bool)

(declare-datatypes ((V!35753 0))(
  ( (V!35754 (val!11589 Int)) )
))
(declare-datatypes ((ValueCell!11057 0))(
  ( (ValueCellFull!11057 (v!14150 V!35753)) (EmptyCell!11057) )
))
(declare-datatypes ((array!62058 0))(
  ( (array!62059 (arr!29887 (Array (_ BitVec 32) ValueCell!11057)) (size!30368 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62058)

(declare-fun mapDefault!36644 () ValueCell!11057)

(assert (=> b!985702 (= condMapEmpty!36644 (= (arr!29887 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11057)) mapDefault!36644)))))

(declare-fun mapNonEmpty!36644 () Bool)

(declare-fun tp!69500 () Bool)

(declare-fun e!555640 () Bool)

(assert (=> mapNonEmpty!36644 (= mapRes!36644 (and tp!69500 e!555640))))

(declare-fun mapRest!36644 () (Array (_ BitVec 32) ValueCell!11057))

(declare-fun mapKey!36644 () (_ BitVec 32))

(declare-fun mapValue!36644 () ValueCell!11057)

(assert (=> mapNonEmpty!36644 (= (arr!29887 _values!1278) (store mapRest!36644 mapKey!36644 mapValue!36644))))

(declare-fun b!985704 () Bool)

(declare-fun res!659617 () Bool)

(assert (=> b!985704 (=> (not res!659617) (not e!555643))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!985704 (= res!659617 (and (= (size!30368 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30367 _keys!1544) (size!30368 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!985705 () Bool)

(assert (=> b!985705 (= e!555640 tp_is_empty!23077)))

(declare-fun mapIsEmpty!36644 () Bool)

(assert (=> mapIsEmpty!36644 mapRes!36644))

(declare-fun b!985703 () Bool)

(assert (=> b!985703 (= e!555643 false)))

(declare-fun lt!437175 () Bool)

(declare-datatypes ((List!20759 0))(
  ( (Nil!20756) (Cons!20755 (h!21917 (_ BitVec 64)) (t!29649 List!20759)) )
))
(declare-fun arrayNoDuplicates!0 (array!62056 (_ BitVec 32) List!20759) Bool)

(assert (=> b!985703 (= lt!437175 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20756))))

(declare-fun res!659619 () Bool)

(assert (=> start!84256 (=> (not res!659619) (not e!555643))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84256 (= res!659619 (validMask!0 mask!1948))))

(assert (=> start!84256 e!555643))

(assert (=> start!84256 true))

(declare-fun array_inv!23107 (array!62058) Bool)

(assert (=> start!84256 (and (array_inv!23107 _values!1278) e!555642)))

(declare-fun array_inv!23108 (array!62056) Bool)

(assert (=> start!84256 (array_inv!23108 _keys!1544)))

(assert (= (and start!84256 res!659619) b!985704))

(assert (= (and b!985704 res!659617) b!985701))

(assert (= (and b!985701 res!659618) b!985703))

(assert (= (and b!985702 condMapEmpty!36644) mapIsEmpty!36644))

(assert (= (and b!985702 (not condMapEmpty!36644)) mapNonEmpty!36644))

(get-info :version)

(assert (= (and mapNonEmpty!36644 ((_ is ValueCellFull!11057) mapValue!36644)) b!985705))

(assert (= (and b!985702 ((_ is ValueCellFull!11057) mapDefault!36644)) b!985700))

(assert (= start!84256 b!985702))

(declare-fun m!912185 () Bool)

(assert (=> b!985701 m!912185))

(declare-fun m!912187 () Bool)

(assert (=> mapNonEmpty!36644 m!912187))

(declare-fun m!912189 () Bool)

(assert (=> b!985703 m!912189))

(declare-fun m!912191 () Bool)

(assert (=> start!84256 m!912191))

(declare-fun m!912193 () Bool)

(assert (=> start!84256 m!912193))

(declare-fun m!912195 () Bool)

(assert (=> start!84256 m!912195))

(check-sat (not start!84256) (not b!985703) (not mapNonEmpty!36644) tp_is_empty!23077 (not b!985701))
(check-sat)
