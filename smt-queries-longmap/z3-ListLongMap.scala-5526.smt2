; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72942 () Bool)

(assert start!72942)

(declare-fun b_free!13857 () Bool)

(declare-fun b_next!13857 () Bool)

(assert (=> start!72942 (= b_free!13857 (not b_next!13857))))

(declare-fun tp!49075 () Bool)

(declare-fun b_and!22943 () Bool)

(assert (=> start!72942 (= tp!49075 b_and!22943)))

(declare-fun b!847024 () Bool)

(declare-fun res!575495 () Bool)

(declare-fun e!472685 () Bool)

(assert (=> b!847024 (=> (not res!575495) (not e!472685))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!847024 (= res!575495 (validMask!0 mask!1196))))

(declare-fun b!847025 () Bool)

(declare-fun res!575501 () Bool)

(assert (=> b!847025 (=> (not res!575501) (not e!472685))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!48198 0))(
  ( (array!48199 (arr!23130 (Array (_ BitVec 32) (_ BitVec 64))) (size!23570 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48198)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!847025 (= res!575501 (and (= (select (arr!23130 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!847026 () Bool)

(declare-fun e!472686 () Bool)

(declare-fun tp_is_empty!15993 () Bool)

(assert (=> b!847026 (= e!472686 tp_is_empty!15993)))

(declare-fun b!847027 () Bool)

(assert (=> b!847027 (= e!472685 false)))

(declare-datatypes ((V!26371 0))(
  ( (V!26372 (val!8044 Int)) )
))
(declare-datatypes ((tuple2!10504 0))(
  ( (tuple2!10505 (_1!5263 (_ BitVec 64)) (_2!5263 V!26371)) )
))
(declare-datatypes ((List!16365 0))(
  ( (Nil!16362) (Cons!16361 (h!17492 tuple2!10504) (t!22736 List!16365)) )
))
(declare-datatypes ((ListLongMap!9273 0))(
  ( (ListLongMap!9274 (toList!4652 List!16365)) )
))
(declare-fun lt!381643 () ListLongMap!9273)

(declare-fun v!557 () V!26371)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7557 0))(
  ( (ValueCellFull!7557 (v!10469 V!26371)) (EmptyCell!7557) )
))
(declare-datatypes ((array!48200 0))(
  ( (array!48201 (arr!23131 (Array (_ BitVec 32) ValueCell!7557)) (size!23571 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48200)

(declare-fun minValue!654 () V!26371)

(declare-fun zeroValue!654 () V!26371)

(declare-fun getCurrentListMapNoExtraKeys!2637 (array!48198 array!48200 (_ BitVec 32) (_ BitVec 32) V!26371 V!26371 (_ BitVec 32) Int) ListLongMap!9273)

(assert (=> b!847027 (= lt!381643 (getCurrentListMapNoExtraKeys!2637 _keys!868 (array!48201 (store (arr!23131 _values!688) i!612 (ValueCellFull!7557 v!557)) (size!23571 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!381642 () ListLongMap!9273)

(assert (=> b!847027 (= lt!381642 (getCurrentListMapNoExtraKeys!2637 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!847028 () Bool)

(declare-fun res!575500 () Bool)

(assert (=> b!847028 (=> (not res!575500) (not e!472685))))

(declare-datatypes ((List!16366 0))(
  ( (Nil!16363) (Cons!16362 (h!17493 (_ BitVec 64)) (t!22737 List!16366)) )
))
(declare-fun arrayNoDuplicates!0 (array!48198 (_ BitVec 32) List!16366) Bool)

(assert (=> b!847028 (= res!575500 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16363))))

(declare-fun mapNonEmpty!25589 () Bool)

(declare-fun mapRes!25589 () Bool)

(declare-fun tp!49074 () Bool)

(assert (=> mapNonEmpty!25589 (= mapRes!25589 (and tp!49074 e!472686))))

(declare-fun mapKey!25589 () (_ BitVec 32))

(declare-fun mapRest!25589 () (Array (_ BitVec 32) ValueCell!7557))

(declare-fun mapValue!25589 () ValueCell!7557)

(assert (=> mapNonEmpty!25589 (= (arr!23131 _values!688) (store mapRest!25589 mapKey!25589 mapValue!25589))))

(declare-fun b!847030 () Bool)

(declare-fun res!575499 () Bool)

(assert (=> b!847030 (=> (not res!575499) (not e!472685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48198 (_ BitVec 32)) Bool)

(assert (=> b!847030 (= res!575499 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!847031 () Bool)

(declare-fun res!575496 () Bool)

(assert (=> b!847031 (=> (not res!575496) (not e!472685))))

(assert (=> b!847031 (= res!575496 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23570 _keys!868))))))

(declare-fun res!575498 () Bool)

(assert (=> start!72942 (=> (not res!575498) (not e!472685))))

(assert (=> start!72942 (= res!575498 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23570 _keys!868))))))

(assert (=> start!72942 e!472685))

(assert (=> start!72942 tp_is_empty!15993))

(assert (=> start!72942 true))

(assert (=> start!72942 tp!49075))

(declare-fun array_inv!18370 (array!48198) Bool)

(assert (=> start!72942 (array_inv!18370 _keys!868)))

(declare-fun e!472687 () Bool)

(declare-fun array_inv!18371 (array!48200) Bool)

(assert (=> start!72942 (and (array_inv!18371 _values!688) e!472687)))

(declare-fun b!847029 () Bool)

(declare-fun res!575494 () Bool)

(assert (=> b!847029 (=> (not res!575494) (not e!472685))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!847029 (= res!575494 (validKeyInArray!0 k0!854))))

(declare-fun b!847032 () Bool)

(declare-fun e!472684 () Bool)

(assert (=> b!847032 (= e!472684 tp_is_empty!15993)))

(declare-fun b!847033 () Bool)

(declare-fun res!575497 () Bool)

(assert (=> b!847033 (=> (not res!575497) (not e!472685))))

(assert (=> b!847033 (= res!575497 (and (= (size!23571 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23570 _keys!868) (size!23571 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!25589 () Bool)

(assert (=> mapIsEmpty!25589 mapRes!25589))

(declare-fun b!847034 () Bool)

(assert (=> b!847034 (= e!472687 (and e!472684 mapRes!25589))))

(declare-fun condMapEmpty!25589 () Bool)

(declare-fun mapDefault!25589 () ValueCell!7557)

(assert (=> b!847034 (= condMapEmpty!25589 (= (arr!23131 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7557)) mapDefault!25589)))))

(assert (= (and start!72942 res!575498) b!847024))

(assert (= (and b!847024 res!575495) b!847033))

(assert (= (and b!847033 res!575497) b!847030))

(assert (= (and b!847030 res!575499) b!847028))

(assert (= (and b!847028 res!575500) b!847031))

(assert (= (and b!847031 res!575496) b!847029))

(assert (= (and b!847029 res!575494) b!847025))

(assert (= (and b!847025 res!575501) b!847027))

(assert (= (and b!847034 condMapEmpty!25589) mapIsEmpty!25589))

(assert (= (and b!847034 (not condMapEmpty!25589)) mapNonEmpty!25589))

(get-info :version)

(assert (= (and mapNonEmpty!25589 ((_ is ValueCellFull!7557) mapValue!25589)) b!847026))

(assert (= (and b!847034 ((_ is ValueCellFull!7557) mapDefault!25589)) b!847032))

(assert (= start!72942 b!847034))

(declare-fun m!788227 () Bool)

(assert (=> start!72942 m!788227))

(declare-fun m!788229 () Bool)

(assert (=> start!72942 m!788229))

(declare-fun m!788231 () Bool)

(assert (=> b!847029 m!788231))

(declare-fun m!788233 () Bool)

(assert (=> mapNonEmpty!25589 m!788233))

(declare-fun m!788235 () Bool)

(assert (=> b!847028 m!788235))

(declare-fun m!788237 () Bool)

(assert (=> b!847027 m!788237))

(declare-fun m!788239 () Bool)

(assert (=> b!847027 m!788239))

(declare-fun m!788241 () Bool)

(assert (=> b!847027 m!788241))

(declare-fun m!788243 () Bool)

(assert (=> b!847030 m!788243))

(declare-fun m!788245 () Bool)

(assert (=> b!847024 m!788245))

(declare-fun m!788247 () Bool)

(assert (=> b!847025 m!788247))

(check-sat b_and!22943 (not b!847030) (not start!72942) (not b!847027) (not b!847024) (not b_next!13857) (not b!847028) (not b!847029) (not mapNonEmpty!25589) tp_is_empty!15993)
(check-sat b_and!22943 (not b_next!13857))
