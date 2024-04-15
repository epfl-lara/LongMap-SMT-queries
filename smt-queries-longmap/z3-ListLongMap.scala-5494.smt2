; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72730 () Bool)

(assert start!72730)

(declare-fun b!844080 () Bool)

(declare-fun e!471083 () Bool)

(declare-fun tp_is_empty!15799 () Bool)

(assert (=> b!844080 (= e!471083 tp_is_empty!15799)))

(declare-fun b!844081 () Bool)

(declare-fun res!573555 () Bool)

(declare-fun e!471080 () Bool)

(assert (=> b!844081 (=> (not res!573555) (not e!471080))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47829 0))(
  ( (array!47830 (arr!22946 (Array (_ BitVec 32) (_ BitVec 64))) (size!23388 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47829)

(declare-datatypes ((V!26113 0))(
  ( (V!26114 (val!7947 Int)) )
))
(declare-datatypes ((ValueCell!7460 0))(
  ( (ValueCellFull!7460 (v!10366 V!26113)) (EmptyCell!7460) )
))
(declare-datatypes ((array!47831 0))(
  ( (array!47832 (arr!22947 (Array (_ BitVec 32) ValueCell!7460)) (size!23389 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47831)

(assert (=> b!844081 (= res!573555 (and (= (size!23389 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23388 _keys!868) (size!23389 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!25298 () Bool)

(declare-fun mapRes!25298 () Bool)

(declare-fun tp!48617 () Bool)

(declare-fun e!471084 () Bool)

(assert (=> mapNonEmpty!25298 (= mapRes!25298 (and tp!48617 e!471084))))

(declare-fun mapRest!25298 () (Array (_ BitVec 32) ValueCell!7460))

(declare-fun mapKey!25298 () (_ BitVec 32))

(declare-fun mapValue!25298 () ValueCell!7460)

(assert (=> mapNonEmpty!25298 (= (arr!22947 _values!688) (store mapRest!25298 mapKey!25298 mapValue!25298))))

(declare-fun b!844082 () Bool)

(assert (=> b!844082 (= e!471084 tp_is_empty!15799)))

(declare-fun b!844084 () Bool)

(declare-fun e!471081 () Bool)

(assert (=> b!844084 (= e!471081 (and e!471083 mapRes!25298))))

(declare-fun condMapEmpty!25298 () Bool)

(declare-fun mapDefault!25298 () ValueCell!7460)

(assert (=> b!844084 (= condMapEmpty!25298 (= (arr!22947 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7460)) mapDefault!25298)))))

(declare-fun b!844085 () Bool)

(declare-fun res!573554 () Bool)

(assert (=> b!844085 (=> (not res!573554) (not e!471080))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844085 (= res!573554 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!25298 () Bool)

(assert (=> mapIsEmpty!25298 mapRes!25298))

(declare-fun b!844086 () Bool)

(assert (=> b!844086 (= e!471080 false)))

(declare-fun lt!381029 () Bool)

(declare-datatypes ((List!16284 0))(
  ( (Nil!16281) (Cons!16280 (h!17411 (_ BitVec 64)) (t!22646 List!16284)) )
))
(declare-fun arrayNoDuplicates!0 (array!47829 (_ BitVec 32) List!16284) Bool)

(assert (=> b!844086 (= lt!381029 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16281))))

(declare-fun res!573553 () Bool)

(assert (=> start!72730 (=> (not res!573553) (not e!471080))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72730 (= res!573553 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23388 _keys!868))))))

(assert (=> start!72730 e!471080))

(assert (=> start!72730 true))

(declare-fun array_inv!18318 (array!47829) Bool)

(assert (=> start!72730 (array_inv!18318 _keys!868)))

(declare-fun array_inv!18319 (array!47831) Bool)

(assert (=> start!72730 (and (array_inv!18319 _values!688) e!471081)))

(declare-fun b!844083 () Bool)

(declare-fun res!573552 () Bool)

(assert (=> b!844083 (=> (not res!573552) (not e!471080))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47829 (_ BitVec 32)) Bool)

(assert (=> b!844083 (= res!573552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!72730 res!573553) b!844085))

(assert (= (and b!844085 res!573554) b!844081))

(assert (= (and b!844081 res!573555) b!844083))

(assert (= (and b!844083 res!573552) b!844086))

(assert (= (and b!844084 condMapEmpty!25298) mapIsEmpty!25298))

(assert (= (and b!844084 (not condMapEmpty!25298)) mapNonEmpty!25298))

(get-info :version)

(assert (= (and mapNonEmpty!25298 ((_ is ValueCellFull!7460) mapValue!25298)) b!844082))

(assert (= (and b!844084 ((_ is ValueCellFull!7460) mapDefault!25298)) b!844080))

(assert (= start!72730 b!844084))

(declare-fun m!785867 () Bool)

(assert (=> b!844086 m!785867))

(declare-fun m!785869 () Bool)

(assert (=> start!72730 m!785869))

(declare-fun m!785871 () Bool)

(assert (=> start!72730 m!785871))

(declare-fun m!785873 () Bool)

(assert (=> mapNonEmpty!25298 m!785873))

(declare-fun m!785875 () Bool)

(assert (=> b!844083 m!785875))

(declare-fun m!785877 () Bool)

(assert (=> b!844085 m!785877))

(check-sat tp_is_empty!15799 (not b!844083) (not mapNonEmpty!25298) (not b!844085) (not b!844086) (not start!72730))
(check-sat)
