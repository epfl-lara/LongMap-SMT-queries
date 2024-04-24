; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72988 () Bool)

(assert start!72988)

(declare-fun mapNonEmpty!25406 () Bool)

(declare-fun mapRes!25406 () Bool)

(declare-fun tp!48725 () Bool)

(declare-fun e!472351 () Bool)

(assert (=> mapNonEmpty!25406 (= mapRes!25406 (and tp!48725 e!472351))))

(declare-fun mapKey!25406 () (_ BitVec 32))

(declare-datatypes ((V!26209 0))(
  ( (V!26210 (val!7983 Int)) )
))
(declare-datatypes ((ValueCell!7496 0))(
  ( (ValueCellFull!7496 (v!10408 V!26209)) (EmptyCell!7496) )
))
(declare-fun mapValue!25406 () ValueCell!7496)

(declare-fun mapRest!25406 () (Array (_ BitVec 32) ValueCell!7496))

(declare-datatypes ((array!48009 0))(
  ( (array!48010 (arr!23031 (Array (_ BitVec 32) ValueCell!7496)) (size!23472 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48009)

(assert (=> mapNonEmpty!25406 (= (arr!23031 _values!688) (store mapRest!25406 mapKey!25406 mapValue!25406))))

(declare-fun b!845978 () Bool)

(declare-fun e!472354 () Bool)

(declare-fun tp_is_empty!15871 () Bool)

(assert (=> b!845978 (= e!472354 tp_is_empty!15871)))

(declare-fun b!845979 () Bool)

(declare-fun e!472352 () Bool)

(assert (=> b!845979 (= e!472352 (and e!472354 mapRes!25406))))

(declare-fun condMapEmpty!25406 () Bool)

(declare-fun mapDefault!25406 () ValueCell!7496)

(assert (=> b!845979 (= condMapEmpty!25406 (= (arr!23031 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7496)) mapDefault!25406)))))

(declare-fun b!845980 () Bool)

(declare-fun res!574439 () Bool)

(declare-fun e!472353 () Bool)

(assert (=> b!845980 (=> (not res!574439) (not e!472353))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!48011 0))(
  ( (array!48012 (arr!23032 (Array (_ BitVec 32) (_ BitVec 64))) (size!23473 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48011)

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!845980 (= res!574439 (and (= (size!23472 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23473 _keys!868) (size!23472 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!845981 () Bool)

(assert (=> b!845981 (= e!472351 tp_is_empty!15871)))

(declare-fun mapIsEmpty!25406 () Bool)

(assert (=> mapIsEmpty!25406 mapRes!25406))

(declare-fun b!845982 () Bool)

(declare-fun res!574438 () Bool)

(assert (=> b!845982 (=> (not res!574438) (not e!472353))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48011 (_ BitVec 32)) Bool)

(assert (=> b!845982 (= res!574438 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!845983 () Bool)

(declare-fun res!574441 () Bool)

(assert (=> b!845983 (=> (not res!574441) (not e!472353))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845983 (= res!574441 (validMask!0 mask!1196))))

(declare-fun res!574440 () Bool)

(assert (=> start!72988 (=> (not res!574440) (not e!472353))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72988 (= res!574440 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23473 _keys!868))))))

(assert (=> start!72988 e!472353))

(assert (=> start!72988 true))

(declare-fun array_inv!18356 (array!48011) Bool)

(assert (=> start!72988 (array_inv!18356 _keys!868)))

(declare-fun array_inv!18357 (array!48009) Bool)

(assert (=> start!72988 (and (array_inv!18357 _values!688) e!472352)))

(declare-fun b!845984 () Bool)

(assert (=> b!845984 (= e!472353 false)))

(declare-fun lt!381734 () Bool)

(declare-datatypes ((List!16223 0))(
  ( (Nil!16220) (Cons!16219 (h!17356 (_ BitVec 64)) (t!22586 List!16223)) )
))
(declare-fun arrayNoDuplicates!0 (array!48011 (_ BitVec 32) List!16223) Bool)

(assert (=> b!845984 (= lt!381734 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16220))))

(assert (= (and start!72988 res!574440) b!845983))

(assert (= (and b!845983 res!574441) b!845980))

(assert (= (and b!845980 res!574439) b!845982))

(assert (= (and b!845982 res!574438) b!845984))

(assert (= (and b!845979 condMapEmpty!25406) mapIsEmpty!25406))

(assert (= (and b!845979 (not condMapEmpty!25406)) mapNonEmpty!25406))

(get-info :version)

(assert (= (and mapNonEmpty!25406 ((_ is ValueCellFull!7496) mapValue!25406)) b!845981))

(assert (= (and b!845979 ((_ is ValueCellFull!7496) mapDefault!25406)) b!845978))

(assert (= start!72988 b!845979))

(declare-fun m!788345 () Bool)

(assert (=> start!72988 m!788345))

(declare-fun m!788347 () Bool)

(assert (=> start!72988 m!788347))

(declare-fun m!788349 () Bool)

(assert (=> mapNonEmpty!25406 m!788349))

(declare-fun m!788351 () Bool)

(assert (=> b!845982 m!788351))

(declare-fun m!788353 () Bool)

(assert (=> b!845983 m!788353))

(declare-fun m!788355 () Bool)

(assert (=> b!845984 m!788355))

(check-sat (not mapNonEmpty!25406) (not start!72988) tp_is_empty!15871 (not b!845983) (not b!845984) (not b!845982))
(check-sat)
