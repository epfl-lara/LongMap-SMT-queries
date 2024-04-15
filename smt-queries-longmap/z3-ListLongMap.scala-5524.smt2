; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72910 () Bool)

(assert start!72910)

(declare-fun b_free!13843 () Bool)

(declare-fun b_next!13843 () Bool)

(assert (=> start!72910 (= b_free!13843 (not b_next!13843))))

(declare-fun tp!49034 () Bool)

(declare-fun b_and!22903 () Bool)

(assert (=> start!72910 (= tp!49034 b_and!22903)))

(declare-fun b!846554 () Bool)

(declare-fun res!575217 () Bool)

(declare-fun e!472432 () Bool)

(assert (=> b!846554 (=> (not res!575217) (not e!472432))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!48171 0))(
  ( (array!48172 (arr!23117 (Array (_ BitVec 32) (_ BitVec 64))) (size!23559 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48171)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!846554 (= res!575217 (and (= (select (arr!23117 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!846555 () Bool)

(declare-fun res!575222 () Bool)

(assert (=> b!846555 (=> (not res!575222) (not e!472432))))

(assert (=> b!846555 (= res!575222 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23559 _keys!868))))))

(declare-fun b!846557 () Bool)

(declare-fun e!472430 () Bool)

(declare-fun tp_is_empty!15979 () Bool)

(assert (=> b!846557 (= e!472430 tp_is_empty!15979)))

(declare-fun mapIsEmpty!25568 () Bool)

(declare-fun mapRes!25568 () Bool)

(assert (=> mapIsEmpty!25568 mapRes!25568))

(declare-fun b!846558 () Bool)

(declare-fun e!472434 () Bool)

(declare-fun e!472431 () Bool)

(assert (=> b!846558 (= e!472434 (and e!472431 mapRes!25568))))

(declare-fun condMapEmpty!25568 () Bool)

(declare-datatypes ((V!26353 0))(
  ( (V!26354 (val!8037 Int)) )
))
(declare-datatypes ((ValueCell!7550 0))(
  ( (ValueCellFull!7550 (v!10456 V!26353)) (EmptyCell!7550) )
))
(declare-datatypes ((array!48173 0))(
  ( (array!48174 (arr!23118 (Array (_ BitVec 32) ValueCell!7550)) (size!23560 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48173)

(declare-fun mapDefault!25568 () ValueCell!7550)

(assert (=> b!846558 (= condMapEmpty!25568 (= (arr!23118 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7550)) mapDefault!25568)))))

(declare-fun b!846559 () Bool)

(declare-fun res!575218 () Bool)

(assert (=> b!846559 (=> (not res!575218) (not e!472432))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!846559 (= res!575218 (validKeyInArray!0 k0!854))))

(declare-fun b!846560 () Bool)

(declare-fun res!575220 () Bool)

(assert (=> b!846560 (=> (not res!575220) (not e!472432))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!846560 (= res!575220 (and (= (size!23560 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23559 _keys!868) (size!23560 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!846561 () Bool)

(declare-fun res!575221 () Bool)

(assert (=> b!846561 (=> (not res!575221) (not e!472432))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48171 (_ BitVec 32)) Bool)

(assert (=> b!846561 (= res!575221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!846562 () Bool)

(declare-fun res!575219 () Bool)

(assert (=> b!846562 (=> (not res!575219) (not e!472432))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!846562 (= res!575219 (validMask!0 mask!1196))))

(declare-fun b!846563 () Bool)

(declare-fun res!575216 () Bool)

(assert (=> b!846563 (=> (not res!575216) (not e!472432))))

(declare-datatypes ((List!16383 0))(
  ( (Nil!16380) (Cons!16379 (h!17510 (_ BitVec 64)) (t!22745 List!16383)) )
))
(declare-fun arrayNoDuplicates!0 (array!48171 (_ BitVec 32) List!16383) Bool)

(assert (=> b!846563 (= res!575216 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16380))))

(declare-fun b!846556 () Bool)

(assert (=> b!846556 (= e!472432 false)))

(declare-fun v!557 () V!26353)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10524 0))(
  ( (tuple2!10525 (_1!5273 (_ BitVec 64)) (_2!5273 V!26353)) )
))
(declare-datatypes ((List!16384 0))(
  ( (Nil!16381) (Cons!16380 (h!17511 tuple2!10524) (t!22746 List!16384)) )
))
(declare-datatypes ((ListLongMap!9283 0))(
  ( (ListLongMap!9284 (toList!4657 List!16384)) )
))
(declare-fun lt!381364 () ListLongMap!9283)

(declare-fun minValue!654 () V!26353)

(declare-fun zeroValue!654 () V!26353)

(declare-fun getCurrentListMapNoExtraKeys!2671 (array!48171 array!48173 (_ BitVec 32) (_ BitVec 32) V!26353 V!26353 (_ BitVec 32) Int) ListLongMap!9283)

(assert (=> b!846556 (= lt!381364 (getCurrentListMapNoExtraKeys!2671 _keys!868 (array!48174 (store (arr!23118 _values!688) i!612 (ValueCellFull!7550 v!557)) (size!23560 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!381365 () ListLongMap!9283)

(assert (=> b!846556 (= lt!381365 (getCurrentListMapNoExtraKeys!2671 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!575223 () Bool)

(assert (=> start!72910 (=> (not res!575223) (not e!472432))))

(assert (=> start!72910 (= res!575223 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23559 _keys!868))))))

(assert (=> start!72910 e!472432))

(assert (=> start!72910 tp_is_empty!15979))

(assert (=> start!72910 true))

(assert (=> start!72910 tp!49034))

(declare-fun array_inv!18436 (array!48171) Bool)

(assert (=> start!72910 (array_inv!18436 _keys!868)))

(declare-fun array_inv!18437 (array!48173) Bool)

(assert (=> start!72910 (and (array_inv!18437 _values!688) e!472434)))

(declare-fun mapNonEmpty!25568 () Bool)

(declare-fun tp!49033 () Bool)

(assert (=> mapNonEmpty!25568 (= mapRes!25568 (and tp!49033 e!472430))))

(declare-fun mapValue!25568 () ValueCell!7550)

(declare-fun mapRest!25568 () (Array (_ BitVec 32) ValueCell!7550))

(declare-fun mapKey!25568 () (_ BitVec 32))

(assert (=> mapNonEmpty!25568 (= (arr!23118 _values!688) (store mapRest!25568 mapKey!25568 mapValue!25568))))

(declare-fun b!846564 () Bool)

(assert (=> b!846564 (= e!472431 tp_is_empty!15979)))

(assert (= (and start!72910 res!575223) b!846562))

(assert (= (and b!846562 res!575219) b!846560))

(assert (= (and b!846560 res!575220) b!846561))

(assert (= (and b!846561 res!575221) b!846563))

(assert (= (and b!846563 res!575216) b!846555))

(assert (= (and b!846555 res!575222) b!846559))

(assert (= (and b!846559 res!575218) b!846554))

(assert (= (and b!846554 res!575217) b!846556))

(assert (= (and b!846558 condMapEmpty!25568) mapIsEmpty!25568))

(assert (= (and b!846558 (not condMapEmpty!25568)) mapNonEmpty!25568))

(get-info :version)

(assert (= (and mapNonEmpty!25568 ((_ is ValueCellFull!7550) mapValue!25568)) b!846557))

(assert (= (and b!846558 ((_ is ValueCellFull!7550) mapDefault!25568)) b!846564))

(assert (= start!72910 b!846558))

(declare-fun m!787319 () Bool)

(assert (=> b!846559 m!787319))

(declare-fun m!787321 () Bool)

(assert (=> b!846554 m!787321))

(declare-fun m!787323 () Bool)

(assert (=> start!72910 m!787323))

(declare-fun m!787325 () Bool)

(assert (=> start!72910 m!787325))

(declare-fun m!787327 () Bool)

(assert (=> b!846561 m!787327))

(declare-fun m!787329 () Bool)

(assert (=> mapNonEmpty!25568 m!787329))

(declare-fun m!787331 () Bool)

(assert (=> b!846556 m!787331))

(declare-fun m!787333 () Bool)

(assert (=> b!846556 m!787333))

(declare-fun m!787335 () Bool)

(assert (=> b!846556 m!787335))

(declare-fun m!787337 () Bool)

(assert (=> b!846563 m!787337))

(declare-fun m!787339 () Bool)

(assert (=> b!846562 m!787339))

(check-sat (not mapNonEmpty!25568) tp_is_empty!15979 b_and!22903 (not b!846561) (not b!846559) (not start!72910) (not b!846556) (not b_next!13843) (not b!846563) (not b!846562))
(check-sat b_and!22903 (not b_next!13843))
