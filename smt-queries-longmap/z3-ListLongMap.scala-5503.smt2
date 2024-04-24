; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72970 () Bool)

(assert start!72970)

(declare-fun mapNonEmpty!25379 () Bool)

(declare-fun mapRes!25379 () Bool)

(declare-fun tp!48698 () Bool)

(declare-fun e!472215 () Bool)

(assert (=> mapNonEmpty!25379 (= mapRes!25379 (and tp!48698 e!472215))))

(declare-datatypes ((V!26185 0))(
  ( (V!26186 (val!7974 Int)) )
))
(declare-datatypes ((ValueCell!7487 0))(
  ( (ValueCellFull!7487 (v!10399 V!26185)) (EmptyCell!7487) )
))
(declare-fun mapValue!25379 () ValueCell!7487)

(declare-fun mapKey!25379 () (_ BitVec 32))

(declare-fun mapRest!25379 () (Array (_ BitVec 32) ValueCell!7487))

(declare-datatypes ((array!47973 0))(
  ( (array!47974 (arr!23013 (Array (_ BitVec 32) ValueCell!7487)) (size!23454 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47973)

(assert (=> mapNonEmpty!25379 (= (arr!23013 _values!688) (store mapRest!25379 mapKey!25379 mapValue!25379))))

(declare-fun b!845789 () Bool)

(declare-fun e!472216 () Bool)

(declare-fun e!472218 () Bool)

(assert (=> b!845789 (= e!472216 (and e!472218 mapRes!25379))))

(declare-fun condMapEmpty!25379 () Bool)

(declare-fun mapDefault!25379 () ValueCell!7487)

(assert (=> b!845789 (= condMapEmpty!25379 (= (arr!23013 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7487)) mapDefault!25379)))))

(declare-fun b!845790 () Bool)

(declare-fun res!574331 () Bool)

(declare-fun e!472217 () Bool)

(assert (=> b!845790 (=> (not res!574331) (not e!472217))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47975 0))(
  ( (array!47976 (arr!23014 (Array (_ BitVec 32) (_ BitVec 64))) (size!23455 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47975)

(assert (=> b!845790 (= res!574331 (and (= (size!23454 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23455 _keys!868) (size!23454 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!845791 () Bool)

(declare-fun res!574330 () Bool)

(assert (=> b!845791 (=> (not res!574330) (not e!472217))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47975 (_ BitVec 32)) Bool)

(assert (=> b!845791 (= res!574330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!845792 () Bool)

(declare-fun res!574333 () Bool)

(assert (=> b!845792 (=> (not res!574333) (not e!472217))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845792 (= res!574333 (validMask!0 mask!1196))))

(declare-fun b!845793 () Bool)

(declare-fun tp_is_empty!15853 () Bool)

(assert (=> b!845793 (= e!472218 tp_is_empty!15853)))

(declare-fun res!574332 () Bool)

(assert (=> start!72970 (=> (not res!574332) (not e!472217))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72970 (= res!574332 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23455 _keys!868))))))

(assert (=> start!72970 e!472217))

(assert (=> start!72970 true))

(declare-fun array_inv!18344 (array!47975) Bool)

(assert (=> start!72970 (array_inv!18344 _keys!868)))

(declare-fun array_inv!18345 (array!47973) Bool)

(assert (=> start!72970 (and (array_inv!18345 _values!688) e!472216)))

(declare-fun mapIsEmpty!25379 () Bool)

(assert (=> mapIsEmpty!25379 mapRes!25379))

(declare-fun b!845794 () Bool)

(assert (=> b!845794 (= e!472215 tp_is_empty!15853)))

(declare-fun b!845795 () Bool)

(assert (=> b!845795 (= e!472217 false)))

(declare-fun lt!381707 () Bool)

(declare-datatypes ((List!16215 0))(
  ( (Nil!16212) (Cons!16211 (h!17348 (_ BitVec 64)) (t!22578 List!16215)) )
))
(declare-fun arrayNoDuplicates!0 (array!47975 (_ BitVec 32) List!16215) Bool)

(assert (=> b!845795 (= lt!381707 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16212))))

(assert (= (and start!72970 res!574332) b!845792))

(assert (= (and b!845792 res!574333) b!845790))

(assert (= (and b!845790 res!574331) b!845791))

(assert (= (and b!845791 res!574330) b!845795))

(assert (= (and b!845789 condMapEmpty!25379) mapIsEmpty!25379))

(assert (= (and b!845789 (not condMapEmpty!25379)) mapNonEmpty!25379))

(get-info :version)

(assert (= (and mapNonEmpty!25379 ((_ is ValueCellFull!7487) mapValue!25379)) b!845794))

(assert (= (and b!845789 ((_ is ValueCellFull!7487) mapDefault!25379)) b!845793))

(assert (= start!72970 b!845789))

(declare-fun m!788237 () Bool)

(assert (=> b!845792 m!788237))

(declare-fun m!788239 () Bool)

(assert (=> b!845791 m!788239))

(declare-fun m!788241 () Bool)

(assert (=> start!72970 m!788241))

(declare-fun m!788243 () Bool)

(assert (=> start!72970 m!788243))

(declare-fun m!788245 () Bool)

(assert (=> mapNonEmpty!25379 m!788245))

(declare-fun m!788247 () Bool)

(assert (=> b!845795 m!788247))

(check-sat (not b!845791) (not start!72970) (not mapNonEmpty!25379) (not b!845792) (not b!845795) tp_is_empty!15853)
(check-sat)
