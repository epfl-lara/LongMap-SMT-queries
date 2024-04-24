; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73012 () Bool)

(assert start!73012)

(declare-fun b_free!13759 () Bool)

(declare-fun b_next!13759 () Bool)

(assert (=> start!73012 (= b_free!13759 (not b_next!13759))))

(declare-fun tp!48782 () Bool)

(declare-fun b_and!22855 () Bool)

(assert (=> start!73012 (= tp!48782 b_and!22855)))

(declare-fun res!574662 () Bool)

(declare-fun e!472533 () Bool)

(assert (=> start!73012 (=> (not res!574662) (not e!472533))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48057 0))(
  ( (array!48058 (arr!23055 (Array (_ BitVec 32) (_ BitVec 64))) (size!23496 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48057)

(assert (=> start!73012 (= res!574662 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23496 _keys!868))))))

(assert (=> start!73012 e!472533))

(assert (=> start!73012 true))

(assert (=> start!73012 tp!48782))

(declare-fun array_inv!18376 (array!48057) Bool)

(assert (=> start!73012 (array_inv!18376 _keys!868)))

(declare-datatypes ((V!26241 0))(
  ( (V!26242 (val!7995 Int)) )
))
(declare-datatypes ((ValueCell!7508 0))(
  ( (ValueCellFull!7508 (v!10420 V!26241)) (EmptyCell!7508) )
))
(declare-datatypes ((array!48059 0))(
  ( (array!48060 (arr!23056 (Array (_ BitVec 32) ValueCell!7508)) (size!23497 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48059)

(declare-fun e!472531 () Bool)

(declare-fun array_inv!18377 (array!48059) Bool)

(assert (=> start!73012 (and (array_inv!18377 _values!688) e!472531)))

(declare-fun tp_is_empty!15895 () Bool)

(assert (=> start!73012 tp_is_empty!15895))

(declare-fun b!846310 () Bool)

(declare-fun res!574665 () Bool)

(assert (=> b!846310 (=> (not res!574665) (not e!472533))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!846310 (= res!574665 (and (= (size!23497 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23496 _keys!868) (size!23497 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!846311 () Bool)

(declare-fun res!574668 () Bool)

(assert (=> b!846311 (=> (not res!574668) (not e!472533))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!846311 (= res!574668 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!25442 () Bool)

(declare-fun mapRes!25442 () Bool)

(assert (=> mapIsEmpty!25442 mapRes!25442))

(declare-fun b!846312 () Bool)

(declare-fun res!574663 () Bool)

(assert (=> b!846312 (=> (not res!574663) (not e!472533))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!846312 (= res!574663 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23496 _keys!868))))))

(declare-fun b!846313 () Bool)

(declare-fun e!472534 () Bool)

(assert (=> b!846313 (= e!472534 tp_is_empty!15895)))

(declare-fun b!846314 () Bool)

(declare-fun res!574669 () Bool)

(assert (=> b!846314 (=> (not res!574669) (not e!472533))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!846314 (= res!574669 (validKeyInArray!0 k0!854))))

(declare-fun b!846315 () Bool)

(declare-fun res!574664 () Bool)

(assert (=> b!846315 (=> (not res!574664) (not e!472533))))

(declare-datatypes ((List!16237 0))(
  ( (Nil!16234) (Cons!16233 (h!17370 (_ BitVec 64)) (t!22600 List!16237)) )
))
(declare-fun arrayNoDuplicates!0 (array!48057 (_ BitVec 32) List!16237) Bool)

(assert (=> b!846315 (= res!574664 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16234))))

(declare-fun b!846316 () Bool)

(declare-fun res!574667 () Bool)

(assert (=> b!846316 (=> (not res!574667) (not e!472533))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48057 (_ BitVec 32)) Bool)

(assert (=> b!846316 (= res!574667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!25442 () Bool)

(declare-fun tp!48781 () Bool)

(declare-fun e!472532 () Bool)

(assert (=> mapNonEmpty!25442 (= mapRes!25442 (and tp!48781 e!472532))))

(declare-fun mapValue!25442 () ValueCell!7508)

(declare-fun mapKey!25442 () (_ BitVec 32))

(declare-fun mapRest!25442 () (Array (_ BitVec 32) ValueCell!7508))

(assert (=> mapNonEmpty!25442 (= (arr!23056 _values!688) (store mapRest!25442 mapKey!25442 mapValue!25442))))

(declare-fun b!846317 () Bool)

(assert (=> b!846317 (= e!472532 tp_is_empty!15895)))

(declare-fun b!846318 () Bool)

(assert (=> b!846318 (= e!472531 (and e!472534 mapRes!25442))))

(declare-fun condMapEmpty!25442 () Bool)

(declare-fun mapDefault!25442 () ValueCell!7508)

(assert (=> b!846318 (= condMapEmpty!25442 (= (arr!23056 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7508)) mapDefault!25442)))))

(declare-fun b!846319 () Bool)

(declare-fun res!574666 () Bool)

(assert (=> b!846319 (=> (not res!574666) (not e!472533))))

(assert (=> b!846319 (= res!574666 (and (= (select (arr!23055 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!846320 () Bool)

(assert (=> b!846320 (= e!472533 false)))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10372 0))(
  ( (tuple2!10373 (_1!5197 (_ BitVec 64)) (_2!5197 V!26241)) )
))
(declare-datatypes ((List!16238 0))(
  ( (Nil!16235) (Cons!16234 (h!17371 tuple2!10372) (t!22601 List!16238)) )
))
(declare-datatypes ((ListLongMap!9143 0))(
  ( (ListLongMap!9144 (toList!4587 List!16238)) )
))
(declare-fun lt!381770 () ListLongMap!9143)

(declare-fun minValue!654 () V!26241)

(declare-fun zeroValue!654 () V!26241)

(declare-fun getCurrentListMapNoExtraKeys!2645 (array!48057 array!48059 (_ BitVec 32) (_ BitVec 32) V!26241 V!26241 (_ BitVec 32) Int) ListLongMap!9143)

(assert (=> b!846320 (= lt!381770 (getCurrentListMapNoExtraKeys!2645 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!73012 res!574662) b!846311))

(assert (= (and b!846311 res!574668) b!846310))

(assert (= (and b!846310 res!574665) b!846316))

(assert (= (and b!846316 res!574667) b!846315))

(assert (= (and b!846315 res!574664) b!846312))

(assert (= (and b!846312 res!574663) b!846314))

(assert (= (and b!846314 res!574669) b!846319))

(assert (= (and b!846319 res!574666) b!846320))

(assert (= (and b!846318 condMapEmpty!25442) mapIsEmpty!25442))

(assert (= (and b!846318 (not condMapEmpty!25442)) mapNonEmpty!25442))

(get-info :version)

(assert (= (and mapNonEmpty!25442 ((_ is ValueCellFull!7508) mapValue!25442)) b!846317))

(assert (= (and b!846318 ((_ is ValueCellFull!7508) mapDefault!25442)) b!846313))

(assert (= start!73012 b!846318))

(declare-fun m!788525 () Bool)

(assert (=> mapNonEmpty!25442 m!788525))

(declare-fun m!788527 () Bool)

(assert (=> start!73012 m!788527))

(declare-fun m!788529 () Bool)

(assert (=> start!73012 m!788529))

(declare-fun m!788531 () Bool)

(assert (=> b!846314 m!788531))

(declare-fun m!788533 () Bool)

(assert (=> b!846316 m!788533))

(declare-fun m!788535 () Bool)

(assert (=> b!846319 m!788535))

(declare-fun m!788537 () Bool)

(assert (=> b!846315 m!788537))

(declare-fun m!788539 () Bool)

(assert (=> b!846311 m!788539))

(declare-fun m!788541 () Bool)

(assert (=> b!846320 m!788541))

(check-sat (not start!73012) (not b_next!13759) (not b!846320) (not b!846315) b_and!22855 tp_is_empty!15895 (not b!846316) (not b!846311) (not b!846314) (not mapNonEmpty!25442))
(check-sat b_and!22855 (not b_next!13759))
