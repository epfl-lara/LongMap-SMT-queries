; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72880 () Bool)

(assert start!72880)

(declare-fun b_free!13813 () Bool)

(declare-fun b_next!13813 () Bool)

(assert (=> start!72880 (= b_free!13813 (not b_next!13813))))

(declare-fun tp!48943 () Bool)

(declare-fun b_and!22873 () Bool)

(assert (=> start!72880 (= tp!48943 b_and!22873)))

(declare-fun res!574862 () Bool)

(declare-fun e!472205 () Bool)

(assert (=> start!72880 (=> (not res!574862) (not e!472205))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48113 0))(
  ( (array!48114 (arr!23088 (Array (_ BitVec 32) (_ BitVec 64))) (size!23530 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48113)

(assert (=> start!72880 (= res!574862 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23530 _keys!868))))))

(assert (=> start!72880 e!472205))

(declare-fun tp_is_empty!15949 () Bool)

(assert (=> start!72880 tp_is_empty!15949))

(assert (=> start!72880 true))

(assert (=> start!72880 tp!48943))

(declare-fun array_inv!18416 (array!48113) Bool)

(assert (=> start!72880 (array_inv!18416 _keys!868)))

(declare-datatypes ((V!26313 0))(
  ( (V!26314 (val!8022 Int)) )
))
(declare-datatypes ((ValueCell!7535 0))(
  ( (ValueCellFull!7535 (v!10441 V!26313)) (EmptyCell!7535) )
))
(declare-datatypes ((array!48115 0))(
  ( (array!48116 (arr!23089 (Array (_ BitVec 32) ValueCell!7535)) (size!23531 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48115)

(declare-fun e!472206 () Bool)

(declare-fun array_inv!18417 (array!48115) Bool)

(assert (=> start!72880 (and (array_inv!18417 _values!688) e!472206)))

(declare-fun b!846059 () Bool)

(declare-fun res!574857 () Bool)

(assert (=> b!846059 (=> (not res!574857) (not e!472205))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!846059 (= res!574857 (and (= (size!23531 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23530 _keys!868) (size!23531 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!846060 () Bool)

(declare-fun e!472207 () Bool)

(declare-fun mapRes!25523 () Bool)

(assert (=> b!846060 (= e!472206 (and e!472207 mapRes!25523))))

(declare-fun condMapEmpty!25523 () Bool)

(declare-fun mapDefault!25523 () ValueCell!7535)

(assert (=> b!846060 (= condMapEmpty!25523 (= (arr!23089 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7535)) mapDefault!25523)))))

(declare-fun b!846061 () Bool)

(declare-fun res!574861 () Bool)

(assert (=> b!846061 (=> (not res!574861) (not e!472205))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!846061 (= res!574861 (validMask!0 mask!1196))))

(declare-fun b!846062 () Bool)

(declare-fun res!574863 () Bool)

(assert (=> b!846062 (=> (not res!574863) (not e!472205))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!846062 (= res!574863 (and (= (select (arr!23088 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!846063 () Bool)

(declare-fun e!472208 () Bool)

(assert (=> b!846063 (= e!472208 tp_is_empty!15949)))

(declare-fun mapIsEmpty!25523 () Bool)

(assert (=> mapIsEmpty!25523 mapRes!25523))

(declare-fun b!846064 () Bool)

(assert (=> b!846064 (= e!472207 tp_is_empty!15949)))

(declare-fun mapNonEmpty!25523 () Bool)

(declare-fun tp!48944 () Bool)

(assert (=> mapNonEmpty!25523 (= mapRes!25523 (and tp!48944 e!472208))))

(declare-fun mapRest!25523 () (Array (_ BitVec 32) ValueCell!7535))

(declare-fun mapKey!25523 () (_ BitVec 32))

(declare-fun mapValue!25523 () ValueCell!7535)

(assert (=> mapNonEmpty!25523 (= (arr!23089 _values!688) (store mapRest!25523 mapKey!25523 mapValue!25523))))

(declare-fun b!846065 () Bool)

(declare-fun res!574858 () Bool)

(assert (=> b!846065 (=> (not res!574858) (not e!472205))))

(declare-datatypes ((List!16362 0))(
  ( (Nil!16359) (Cons!16358 (h!17489 (_ BitVec 64)) (t!22724 List!16362)) )
))
(declare-fun arrayNoDuplicates!0 (array!48113 (_ BitVec 32) List!16362) Bool)

(assert (=> b!846065 (= res!574858 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16359))))

(declare-fun b!846066 () Bool)

(declare-fun res!574860 () Bool)

(assert (=> b!846066 (=> (not res!574860) (not e!472205))))

(assert (=> b!846066 (= res!574860 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23530 _keys!868))))))

(declare-fun b!846067 () Bool)

(declare-fun res!574856 () Bool)

(assert (=> b!846067 (=> (not res!574856) (not e!472205))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48113 (_ BitVec 32)) Bool)

(assert (=> b!846067 (= res!574856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!846068 () Bool)

(declare-fun res!574859 () Bool)

(assert (=> b!846068 (=> (not res!574859) (not e!472205))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!846068 (= res!574859 (validKeyInArray!0 k0!854))))

(declare-fun b!846069 () Bool)

(assert (=> b!846069 (= e!472205 false)))

(declare-fun v!557 () V!26313)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10504 0))(
  ( (tuple2!10505 (_1!5263 (_ BitVec 64)) (_2!5263 V!26313)) )
))
(declare-datatypes ((List!16363 0))(
  ( (Nil!16360) (Cons!16359 (h!17490 tuple2!10504) (t!22725 List!16363)) )
))
(declare-datatypes ((ListLongMap!9263 0))(
  ( (ListLongMap!9264 (toList!4647 List!16363)) )
))
(declare-fun lt!381274 () ListLongMap!9263)

(declare-fun minValue!654 () V!26313)

(declare-fun zeroValue!654 () V!26313)

(declare-fun getCurrentListMapNoExtraKeys!2661 (array!48113 array!48115 (_ BitVec 32) (_ BitVec 32) V!26313 V!26313 (_ BitVec 32) Int) ListLongMap!9263)

(assert (=> b!846069 (= lt!381274 (getCurrentListMapNoExtraKeys!2661 _keys!868 (array!48116 (store (arr!23089 _values!688) i!612 (ValueCellFull!7535 v!557)) (size!23531 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!381275 () ListLongMap!9263)

(assert (=> b!846069 (= lt!381275 (getCurrentListMapNoExtraKeys!2661 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!72880 res!574862) b!846061))

(assert (= (and b!846061 res!574861) b!846059))

(assert (= (and b!846059 res!574857) b!846067))

(assert (= (and b!846067 res!574856) b!846065))

(assert (= (and b!846065 res!574858) b!846066))

(assert (= (and b!846066 res!574860) b!846068))

(assert (= (and b!846068 res!574859) b!846062))

(assert (= (and b!846062 res!574863) b!846069))

(assert (= (and b!846060 condMapEmpty!25523) mapIsEmpty!25523))

(assert (= (and b!846060 (not condMapEmpty!25523)) mapNonEmpty!25523))

(get-info :version)

(assert (= (and mapNonEmpty!25523 ((_ is ValueCellFull!7535) mapValue!25523)) b!846063))

(assert (= (and b!846060 ((_ is ValueCellFull!7535) mapDefault!25523)) b!846064))

(assert (= start!72880 b!846060))

(declare-fun m!786989 () Bool)

(assert (=> b!846065 m!786989))

(declare-fun m!786991 () Bool)

(assert (=> b!846068 m!786991))

(declare-fun m!786993 () Bool)

(assert (=> b!846069 m!786993))

(declare-fun m!786995 () Bool)

(assert (=> b!846069 m!786995))

(declare-fun m!786997 () Bool)

(assert (=> b!846069 m!786997))

(declare-fun m!786999 () Bool)

(assert (=> start!72880 m!786999))

(declare-fun m!787001 () Bool)

(assert (=> start!72880 m!787001))

(declare-fun m!787003 () Bool)

(assert (=> mapNonEmpty!25523 m!787003))

(declare-fun m!787005 () Bool)

(assert (=> b!846062 m!787005))

(declare-fun m!787007 () Bool)

(assert (=> b!846061 m!787007))

(declare-fun m!787009 () Bool)

(assert (=> b!846067 m!787009))

(check-sat tp_is_empty!15949 (not mapNonEmpty!25523) (not b!846068) (not b!846069) (not b!846061) (not b!846067) (not b!846065) (not start!72880) (not b_next!13813) b_and!22873)
(check-sat b_and!22873 (not b_next!13813))
