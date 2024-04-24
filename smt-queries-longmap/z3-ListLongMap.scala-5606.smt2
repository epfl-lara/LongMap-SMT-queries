; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73588 () Bool)

(assert start!73588)

(declare-fun b_free!14335 () Bool)

(declare-fun b_next!14335 () Bool)

(assert (=> start!73588 (= b_free!14335 (not b_next!14335))))

(declare-fun tp!50510 () Bool)

(declare-fun b_and!23701 () Bool)

(assert (=> start!73588 (= tp!50510 b_and!23701)))

(declare-fun b!858057 () Bool)

(declare-fun res!582577 () Bool)

(declare-fun e!478340 () Bool)

(assert (=> b!858057 (=> (not res!582577) (not e!478340))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!858057 (= res!582577 (validMask!0 mask!1196))))

(declare-fun b!858058 () Bool)

(declare-fun res!582583 () Bool)

(assert (=> b!858058 (=> (not res!582583) (not e!478340))))

(declare-datatypes ((array!49179 0))(
  ( (array!49180 (arr!23616 (Array (_ BitVec 32) (_ BitVec 64))) (size!24057 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49179)

(declare-datatypes ((List!16690 0))(
  ( (Nil!16687) (Cons!16686 (h!17823 (_ BitVec 64)) (t!23323 List!16690)) )
))
(declare-fun arrayNoDuplicates!0 (array!49179 (_ BitVec 32) List!16690) Bool)

(assert (=> b!858058 (= res!582583 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16687))))

(declare-fun b!858059 () Bool)

(declare-fun res!582582 () Bool)

(assert (=> b!858059 (=> (not res!582582) (not e!478340))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!858059 (= res!582582 (and (= (select (arr!23616 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!858060 () Bool)

(declare-fun res!582579 () Bool)

(assert (=> b!858060 (=> (not res!582579) (not e!478340))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49179 (_ BitVec 32)) Bool)

(assert (=> b!858060 (= res!582579 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!858061 () Bool)

(declare-fun res!582580 () Bool)

(assert (=> b!858061 (=> (not res!582580) (not e!478340))))

(assert (=> b!858061 (= res!582580 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24057 _keys!868))))))

(declare-fun b!858062 () Bool)

(declare-fun e!478337 () Bool)

(declare-fun tp_is_empty!16471 () Bool)

(assert (=> b!858062 (= e!478337 tp_is_empty!16471)))

(declare-fun mapIsEmpty!26306 () Bool)

(declare-fun mapRes!26306 () Bool)

(assert (=> mapIsEmpty!26306 mapRes!26306))

(declare-fun b!858063 () Bool)

(declare-fun e!478341 () Bool)

(assert (=> b!858063 (= e!478340 e!478341)))

(declare-fun res!582581 () Bool)

(assert (=> b!858063 (=> (not res!582581) (not e!478341))))

(assert (=> b!858063 (= res!582581 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!27009 0))(
  ( (V!27010 (val!8283 Int)) )
))
(declare-datatypes ((tuple2!10846 0))(
  ( (tuple2!10847 (_1!5434 (_ BitVec 64)) (_2!5434 V!27009)) )
))
(declare-datatypes ((List!16691 0))(
  ( (Nil!16688) (Cons!16687 (h!17824 tuple2!10846) (t!23324 List!16691)) )
))
(declare-datatypes ((ListLongMap!9617 0))(
  ( (ListLongMap!9618 (toList!4824 List!16691)) )
))
(declare-fun lt!386558 () ListLongMap!9617)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27009)

(declare-datatypes ((ValueCell!7796 0))(
  ( (ValueCellFull!7796 (v!10708 V!27009)) (EmptyCell!7796) )
))
(declare-datatypes ((array!49181 0))(
  ( (array!49182 (arr!23617 (Array (_ BitVec 32) ValueCell!7796)) (size!24058 (_ BitVec 32))) )
))
(declare-fun lt!386555 () array!49181)

(declare-fun zeroValue!654 () V!27009)

(declare-fun getCurrentListMapNoExtraKeys!2880 (array!49179 array!49181 (_ BitVec 32) (_ BitVec 32) V!27009 V!27009 (_ BitVec 32) Int) ListLongMap!9617)

(assert (=> b!858063 (= lt!386558 (getCurrentListMapNoExtraKeys!2880 _keys!868 lt!386555 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27009)

(declare-fun _values!688 () array!49181)

(assert (=> b!858063 (= lt!386555 (array!49182 (store (arr!23617 _values!688) i!612 (ValueCellFull!7796 v!557)) (size!24058 _values!688)))))

(declare-fun lt!386556 () ListLongMap!9617)

(assert (=> b!858063 (= lt!386556 (getCurrentListMapNoExtraKeys!2880 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!26306 () Bool)

(declare-fun tp!50509 () Bool)

(declare-fun e!478338 () Bool)

(assert (=> mapNonEmpty!26306 (= mapRes!26306 (and tp!50509 e!478338))))

(declare-fun mapRest!26306 () (Array (_ BitVec 32) ValueCell!7796))

(declare-fun mapKey!26306 () (_ BitVec 32))

(declare-fun mapValue!26306 () ValueCell!7796)

(assert (=> mapNonEmpty!26306 (= (arr!23617 _values!688) (store mapRest!26306 mapKey!26306 mapValue!26306))))

(declare-fun b!858065 () Bool)

(declare-fun res!582576 () Bool)

(assert (=> b!858065 (=> (not res!582576) (not e!478340))))

(assert (=> b!858065 (= res!582576 (and (= (size!24058 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24057 _keys!868) (size!24058 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!858066 () Bool)

(assert (=> b!858066 (= e!478338 tp_is_empty!16471)))

(declare-fun b!858067 () Bool)

(assert (=> b!858067 (= e!478341 (not true))))

(declare-fun +!2234 (ListLongMap!9617 tuple2!10846) ListLongMap!9617)

(assert (=> b!858067 (= (getCurrentListMapNoExtraKeys!2880 _keys!868 lt!386555 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2234 (getCurrentListMapNoExtraKeys!2880 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10847 k0!854 v!557)))))

(declare-datatypes ((Unit!29224 0))(
  ( (Unit!29225) )
))
(declare-fun lt!386557 () Unit!29224)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!432 (array!49179 array!49181 (_ BitVec 32) (_ BitVec 32) V!27009 V!27009 (_ BitVec 32) (_ BitVec 64) V!27009 (_ BitVec 32) Int) Unit!29224)

(assert (=> b!858067 (= lt!386557 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!432 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!858068 () Bool)

(declare-fun e!478339 () Bool)

(assert (=> b!858068 (= e!478339 (and e!478337 mapRes!26306))))

(declare-fun condMapEmpty!26306 () Bool)

(declare-fun mapDefault!26306 () ValueCell!7796)

(assert (=> b!858068 (= condMapEmpty!26306 (= (arr!23617 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7796)) mapDefault!26306)))))

(declare-fun res!582575 () Bool)

(assert (=> start!73588 (=> (not res!582575) (not e!478340))))

(assert (=> start!73588 (= res!582575 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24057 _keys!868))))))

(assert (=> start!73588 e!478340))

(assert (=> start!73588 tp_is_empty!16471))

(assert (=> start!73588 true))

(assert (=> start!73588 tp!50510))

(declare-fun array_inv!18760 (array!49179) Bool)

(assert (=> start!73588 (array_inv!18760 _keys!868)))

(declare-fun array_inv!18761 (array!49181) Bool)

(assert (=> start!73588 (and (array_inv!18761 _values!688) e!478339)))

(declare-fun b!858064 () Bool)

(declare-fun res!582578 () Bool)

(assert (=> b!858064 (=> (not res!582578) (not e!478340))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!858064 (= res!582578 (validKeyInArray!0 k0!854))))

(assert (= (and start!73588 res!582575) b!858057))

(assert (= (and b!858057 res!582577) b!858065))

(assert (= (and b!858065 res!582576) b!858060))

(assert (= (and b!858060 res!582579) b!858058))

(assert (= (and b!858058 res!582583) b!858061))

(assert (= (and b!858061 res!582580) b!858064))

(assert (= (and b!858064 res!582578) b!858059))

(assert (= (and b!858059 res!582582) b!858063))

(assert (= (and b!858063 res!582581) b!858067))

(assert (= (and b!858068 condMapEmpty!26306) mapIsEmpty!26306))

(assert (= (and b!858068 (not condMapEmpty!26306)) mapNonEmpty!26306))

(get-info :version)

(assert (= (and mapNonEmpty!26306 ((_ is ValueCellFull!7796) mapValue!26306)) b!858066))

(assert (= (and b!858068 ((_ is ValueCellFull!7796) mapDefault!26306)) b!858062))

(assert (= start!73588 b!858068))

(declare-fun m!799271 () Bool)

(assert (=> b!858060 m!799271))

(declare-fun m!799273 () Bool)

(assert (=> b!858057 m!799273))

(declare-fun m!799275 () Bool)

(assert (=> b!858059 m!799275))

(declare-fun m!799277 () Bool)

(assert (=> b!858067 m!799277))

(declare-fun m!799279 () Bool)

(assert (=> b!858067 m!799279))

(assert (=> b!858067 m!799279))

(declare-fun m!799281 () Bool)

(assert (=> b!858067 m!799281))

(declare-fun m!799283 () Bool)

(assert (=> b!858067 m!799283))

(declare-fun m!799285 () Bool)

(assert (=> b!858058 m!799285))

(declare-fun m!799287 () Bool)

(assert (=> b!858063 m!799287))

(declare-fun m!799289 () Bool)

(assert (=> b!858063 m!799289))

(declare-fun m!799291 () Bool)

(assert (=> b!858063 m!799291))

(declare-fun m!799293 () Bool)

(assert (=> mapNonEmpty!26306 m!799293))

(declare-fun m!799295 () Bool)

(assert (=> start!73588 m!799295))

(declare-fun m!799297 () Bool)

(assert (=> start!73588 m!799297))

(declare-fun m!799299 () Bool)

(assert (=> b!858064 m!799299))

(check-sat (not b!858067) (not b!858058) b_and!23701 (not mapNonEmpty!26306) (not b!858063) (not start!73588) (not b!858064) (not b!858060) tp_is_empty!16471 (not b_next!14335) (not b!858057))
(check-sat b_and!23701 (not b_next!14335))
