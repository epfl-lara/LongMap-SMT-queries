; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74964 () Bool)

(assert start!74964)

(declare-fun b_free!15373 () Bool)

(declare-fun b_next!15373 () Bool)

(assert (=> start!74964 (= b_free!15373 (not b_next!15373))))

(declare-fun tp!53816 () Bool)

(declare-fun b_and!25423 () Bool)

(assert (=> start!74964 (= tp!53816 b_and!25423)))

(declare-fun b!882547 () Bool)

(declare-fun e!491240 () Bool)

(declare-fun tp_is_empty!17617 () Bool)

(assert (=> b!882547 (= e!491240 tp_is_empty!17617)))

(declare-fun res!599288 () Bool)

(declare-fun e!491242 () Bool)

(assert (=> start!74964 (=> (not res!599288) (not e!491242))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!51401 0))(
  ( (array!51402 (arr!24717 (Array (_ BitVec 32) (_ BitVec 64))) (size!25158 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51401)

(assert (=> start!74964 (= res!599288 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25158 _keys!868))))))

(assert (=> start!74964 e!491242))

(assert (=> start!74964 tp_is_empty!17617))

(assert (=> start!74964 true))

(assert (=> start!74964 tp!53816))

(declare-fun array_inv!19508 (array!51401) Bool)

(assert (=> start!74964 (array_inv!19508 _keys!868)))

(declare-datatypes ((V!28537 0))(
  ( (V!28538 (val!8856 Int)) )
))
(declare-datatypes ((ValueCell!8369 0))(
  ( (ValueCellFull!8369 (v!11316 V!28537)) (EmptyCell!8369) )
))
(declare-datatypes ((array!51403 0))(
  ( (array!51404 (arr!24718 (Array (_ BitVec 32) ValueCell!8369)) (size!25159 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51403)

(declare-fun e!491241 () Bool)

(declare-fun array_inv!19509 (array!51403) Bool)

(assert (=> start!74964 (and (array_inv!19509 _values!688) e!491241)))

(declare-fun b!882548 () Bool)

(declare-fun e!491246 () Bool)

(declare-fun e!491245 () Bool)

(assert (=> b!882548 (= e!491246 (not e!491245))))

(declare-fun res!599290 () Bool)

(assert (=> b!882548 (=> res!599290 e!491245)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!882548 (= res!599290 (not (validKeyInArray!0 (select (arr!24717 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11664 0))(
  ( (tuple2!11665 (_1!5843 (_ BitVec 64)) (_2!5843 V!28537)) )
))
(declare-datatypes ((List!17494 0))(
  ( (Nil!17491) (Cons!17490 (h!18627 tuple2!11664) (t!24661 List!17494)) )
))
(declare-datatypes ((ListLongMap!10435 0))(
  ( (ListLongMap!10436 (toList!5233 List!17494)) )
))
(declare-fun lt!399147 () ListLongMap!10435)

(declare-fun lt!399146 () ListLongMap!10435)

(assert (=> b!882548 (= lt!399147 lt!399146)))

(declare-fun v!557 () V!28537)

(declare-fun lt!399139 () ListLongMap!10435)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2548 (ListLongMap!10435 tuple2!11664) ListLongMap!10435)

(assert (=> b!882548 (= lt!399146 (+!2548 lt!399139 (tuple2!11665 k0!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!28537)

(declare-fun zeroValue!654 () V!28537)

(declare-fun lt!399141 () array!51403)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3273 (array!51401 array!51403 (_ BitVec 32) (_ BitVec 32) V!28537 V!28537 (_ BitVec 32) Int) ListLongMap!10435)

(assert (=> b!882548 (= lt!399147 (getCurrentListMapNoExtraKeys!3273 _keys!868 lt!399141 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!882548 (= lt!399139 (getCurrentListMapNoExtraKeys!3273 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!30064 0))(
  ( (Unit!30065) )
))
(declare-fun lt!399140 () Unit!30064)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!713 (array!51401 array!51403 (_ BitVec 32) (_ BitVec 32) V!28537 V!28537 (_ BitVec 32) (_ BitVec 64) V!28537 (_ BitVec 32) Int) Unit!30064)

(assert (=> b!882548 (= lt!399140 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!713 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!28056 () Bool)

(declare-fun mapRes!28056 () Bool)

(declare-fun tp!53817 () Bool)

(assert (=> mapNonEmpty!28056 (= mapRes!28056 (and tp!53817 e!491240))))

(declare-fun mapKey!28056 () (_ BitVec 32))

(declare-fun mapRest!28056 () (Array (_ BitVec 32) ValueCell!8369))

(declare-fun mapValue!28056 () ValueCell!8369)

(assert (=> mapNonEmpty!28056 (= (arr!24718 _values!688) (store mapRest!28056 mapKey!28056 mapValue!28056))))

(declare-fun b!882549 () Bool)

(declare-fun res!599284 () Bool)

(assert (=> b!882549 (=> (not res!599284) (not e!491242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51401 (_ BitVec 32)) Bool)

(assert (=> b!882549 (= res!599284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!882550 () Bool)

(declare-fun res!599282 () Bool)

(assert (=> b!882550 (=> (not res!599282) (not e!491242))))

(assert (=> b!882550 (= res!599282 (and (= (size!25159 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25158 _keys!868) (size!25159 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!882551 () Bool)

(declare-fun res!599281 () Bool)

(assert (=> b!882551 (=> (not res!599281) (not e!491242))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!882551 (= res!599281 (validMask!0 mask!1196))))

(declare-fun b!882552 () Bool)

(declare-fun res!599289 () Bool)

(assert (=> b!882552 (=> (not res!599289) (not e!491242))))

(declare-datatypes ((List!17495 0))(
  ( (Nil!17492) (Cons!17491 (h!18628 (_ BitVec 64)) (t!24662 List!17495)) )
))
(declare-fun arrayNoDuplicates!0 (array!51401 (_ BitVec 32) List!17495) Bool)

(assert (=> b!882552 (= res!599289 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17492))))

(declare-fun b!882553 () Bool)

(declare-fun e!491243 () Bool)

(assert (=> b!882553 (= e!491243 tp_is_empty!17617)))

(declare-fun b!882554 () Bool)

(assert (=> b!882554 (= e!491242 e!491246)))

(declare-fun res!599287 () Bool)

(assert (=> b!882554 (=> (not res!599287) (not e!491246))))

(assert (=> b!882554 (= res!599287 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!399143 () ListLongMap!10435)

(assert (=> b!882554 (= lt!399143 (getCurrentListMapNoExtraKeys!3273 _keys!868 lt!399141 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!882554 (= lt!399141 (array!51404 (store (arr!24718 _values!688) i!612 (ValueCellFull!8369 v!557)) (size!25159 _values!688)))))

(declare-fun lt!399145 () ListLongMap!10435)

(assert (=> b!882554 (= lt!399145 (getCurrentListMapNoExtraKeys!3273 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!882555 () Bool)

(declare-fun res!599291 () Bool)

(assert (=> b!882555 (=> (not res!599291) (not e!491242))))

(assert (=> b!882555 (= res!599291 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25158 _keys!868))))))

(declare-fun b!882556 () Bool)

(declare-fun e!491244 () Bool)

(assert (=> b!882556 (= e!491244 true)))

(declare-fun arrayContainsKey!0 (array!51401 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!882556 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!399142 () Unit!30064)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51401 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30064)

(assert (=> b!882556 (= lt!399142 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!882556 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17492)))

(declare-fun lt!399144 () Unit!30064)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51401 (_ BitVec 32) (_ BitVec 32)) Unit!30064)

(assert (=> b!882556 (= lt!399144 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun mapIsEmpty!28056 () Bool)

(assert (=> mapIsEmpty!28056 mapRes!28056))

(declare-fun b!882557 () Bool)

(declare-fun res!599283 () Bool)

(assert (=> b!882557 (=> (not res!599283) (not e!491242))))

(assert (=> b!882557 (= res!599283 (and (= (select (arr!24717 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!882558 () Bool)

(declare-fun res!599286 () Bool)

(assert (=> b!882558 (=> (not res!599286) (not e!491242))))

(assert (=> b!882558 (= res!599286 (validKeyInArray!0 k0!854))))

(declare-fun b!882559 () Bool)

(assert (=> b!882559 (= e!491241 (and e!491243 mapRes!28056))))

(declare-fun condMapEmpty!28056 () Bool)

(declare-fun mapDefault!28056 () ValueCell!8369)

(assert (=> b!882559 (= condMapEmpty!28056 (= (arr!24718 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8369)) mapDefault!28056)))))

(declare-fun b!882560 () Bool)

(assert (=> b!882560 (= e!491245 e!491244)))

(declare-fun res!599285 () Bool)

(assert (=> b!882560 (=> res!599285 e!491244)))

(assert (=> b!882560 (= res!599285 (not (= (select (arr!24717 _keys!868) from!1053) k0!854)))))

(declare-fun get!13028 (ValueCell!8369 V!28537) V!28537)

(declare-fun dynLambda!1269 (Int (_ BitVec 64)) V!28537)

(assert (=> b!882560 (= lt!399143 (+!2548 lt!399146 (tuple2!11665 (select (arr!24717 _keys!868) from!1053) (get!13028 (select (arr!24718 _values!688) from!1053) (dynLambda!1269 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!74964 res!599288) b!882551))

(assert (= (and b!882551 res!599281) b!882550))

(assert (= (and b!882550 res!599282) b!882549))

(assert (= (and b!882549 res!599284) b!882552))

(assert (= (and b!882552 res!599289) b!882555))

(assert (= (and b!882555 res!599291) b!882558))

(assert (= (and b!882558 res!599286) b!882557))

(assert (= (and b!882557 res!599283) b!882554))

(assert (= (and b!882554 res!599287) b!882548))

(assert (= (and b!882548 (not res!599290)) b!882560))

(assert (= (and b!882560 (not res!599285)) b!882556))

(assert (= (and b!882559 condMapEmpty!28056) mapIsEmpty!28056))

(assert (= (and b!882559 (not condMapEmpty!28056)) mapNonEmpty!28056))

(get-info :version)

(assert (= (and mapNonEmpty!28056 ((_ is ValueCellFull!8369) mapValue!28056)) b!882547))

(assert (= (and b!882559 ((_ is ValueCellFull!8369) mapDefault!28056)) b!882553))

(assert (= start!74964 b!882559))

(declare-fun b_lambda!12597 () Bool)

(assert (=> (not b_lambda!12597) (not b!882560)))

(declare-fun t!24660 () Bool)

(declare-fun tb!5023 () Bool)

(assert (=> (and start!74964 (= defaultEntry!696 defaultEntry!696) t!24660) tb!5023))

(declare-fun result!9685 () Bool)

(assert (=> tb!5023 (= result!9685 tp_is_empty!17617)))

(assert (=> b!882560 t!24660))

(declare-fun b_and!25425 () Bool)

(assert (= b_and!25423 (and (=> t!24660 result!9685) b_and!25425)))

(declare-fun m!822809 () Bool)

(assert (=> b!882557 m!822809))

(declare-fun m!822811 () Bool)

(assert (=> start!74964 m!822811))

(declare-fun m!822813 () Bool)

(assert (=> start!74964 m!822813))

(declare-fun m!822815 () Bool)

(assert (=> b!882548 m!822815))

(declare-fun m!822817 () Bool)

(assert (=> b!882548 m!822817))

(declare-fun m!822819 () Bool)

(assert (=> b!882548 m!822819))

(declare-fun m!822821 () Bool)

(assert (=> b!882548 m!822821))

(assert (=> b!882548 m!822819))

(declare-fun m!822823 () Bool)

(assert (=> b!882548 m!822823))

(declare-fun m!822825 () Bool)

(assert (=> b!882548 m!822825))

(declare-fun m!822827 () Bool)

(assert (=> b!882560 m!822827))

(declare-fun m!822829 () Bool)

(assert (=> b!882560 m!822829))

(declare-fun m!822831 () Bool)

(assert (=> b!882560 m!822831))

(declare-fun m!822833 () Bool)

(assert (=> b!882560 m!822833))

(assert (=> b!882560 m!822829))

(assert (=> b!882560 m!822819))

(assert (=> b!882560 m!822831))

(declare-fun m!822835 () Bool)

(assert (=> b!882551 m!822835))

(declare-fun m!822837 () Bool)

(assert (=> b!882554 m!822837))

(declare-fun m!822839 () Bool)

(assert (=> b!882554 m!822839))

(declare-fun m!822841 () Bool)

(assert (=> b!882554 m!822841))

(declare-fun m!822843 () Bool)

(assert (=> b!882549 m!822843))

(declare-fun m!822845 () Bool)

(assert (=> mapNonEmpty!28056 m!822845))

(declare-fun m!822847 () Bool)

(assert (=> b!882552 m!822847))

(declare-fun m!822849 () Bool)

(assert (=> b!882558 m!822849))

(declare-fun m!822851 () Bool)

(assert (=> b!882556 m!822851))

(declare-fun m!822853 () Bool)

(assert (=> b!882556 m!822853))

(declare-fun m!822855 () Bool)

(assert (=> b!882556 m!822855))

(declare-fun m!822857 () Bool)

(assert (=> b!882556 m!822857))

(check-sat (not start!74964) (not b_lambda!12597) (not b!882558) (not b!882552) (not b_next!15373) (not b!882554) (not mapNonEmpty!28056) b_and!25425 tp_is_empty!17617 (not b!882551) (not b!882548) (not b!882556) (not b!882549) (not b!882560))
(check-sat b_and!25425 (not b_next!15373))
