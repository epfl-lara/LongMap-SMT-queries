; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74646 () Bool)

(assert start!74646)

(declare-fun b_free!15313 () Bool)

(declare-fun b_next!15313 () Bool)

(assert (=> start!74646 (= b_free!15313 (not b_next!15313))))

(declare-fun tp!53628 () Bool)

(declare-fun b_and!25219 () Bool)

(assert (=> start!74646 (= tp!53628 b_and!25219)))

(declare-fun b!879684 () Bool)

(declare-fun res!597683 () Bool)

(declare-fun e!489540 () Bool)

(assert (=> b!879684 (=> (not res!597683) (not e!489540))))

(declare-datatypes ((array!51223 0))(
  ( (array!51224 (arr!24636 (Array (_ BitVec 32) (_ BitVec 64))) (size!25078 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51223)

(declare-datatypes ((List!17493 0))(
  ( (Nil!17490) (Cons!17489 (h!18620 (_ BitVec 64)) (t!24599 List!17493)) )
))
(declare-fun arrayNoDuplicates!0 (array!51223 (_ BitVec 32) List!17493) Bool)

(assert (=> b!879684 (= res!597683 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17490))))

(declare-fun b!879685 () Bool)

(declare-fun res!597687 () Bool)

(assert (=> b!879685 (=> (not res!597687) (not e!489540))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!879685 (= res!597687 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25078 _keys!868))))))

(declare-fun b!879686 () Bool)

(declare-fun res!597685 () Bool)

(assert (=> b!879686 (=> (not res!597685) (not e!489540))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!879686 (= res!597685 (and (= (select (arr!24636 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!27957 () Bool)

(declare-fun mapRes!27957 () Bool)

(assert (=> mapIsEmpty!27957 mapRes!27957))

(declare-fun b!879687 () Bool)

(declare-fun e!489541 () Bool)

(declare-fun tp_is_empty!17557 () Bool)

(assert (=> b!879687 (= e!489541 tp_is_empty!17557)))

(declare-fun b!879688 () Bool)

(declare-fun e!489536 () Bool)

(assert (=> b!879688 (= e!489536 tp_is_empty!17557)))

(declare-fun b!879689 () Bool)

(declare-fun res!597682 () Bool)

(assert (=> b!879689 (=> (not res!597682) (not e!489540))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!879689 (= res!597682 (validKeyInArray!0 k0!854))))

(declare-fun b!879691 () Bool)

(declare-fun res!597690 () Bool)

(assert (=> b!879691 (=> (not res!597690) (not e!489540))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!28457 0))(
  ( (V!28458 (val!8826 Int)) )
))
(declare-datatypes ((ValueCell!8339 0))(
  ( (ValueCellFull!8339 (v!11268 V!28457)) (EmptyCell!8339) )
))
(declare-datatypes ((array!51225 0))(
  ( (array!51226 (arr!24637 (Array (_ BitVec 32) ValueCell!8339)) (size!25079 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51225)

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!879691 (= res!597690 (and (= (size!25079 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25078 _keys!868) (size!25079 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!879692 () Bool)

(declare-fun res!597688 () Bool)

(assert (=> b!879692 (=> (not res!597688) (not e!489540))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51223 (_ BitVec 32)) Bool)

(assert (=> b!879692 (= res!597688 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!879693 () Bool)

(declare-fun e!489539 () Bool)

(declare-fun e!489537 () Bool)

(assert (=> b!879693 (= e!489539 (not e!489537))))

(declare-fun res!597689 () Bool)

(assert (=> b!879693 (=> res!597689 e!489537)))

(assert (=> b!879693 (= res!597689 (not (validKeyInArray!0 (select (arr!24636 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11694 0))(
  ( (tuple2!11695 (_1!5858 (_ BitVec 64)) (_2!5858 V!28457)) )
))
(declare-datatypes ((List!17494 0))(
  ( (Nil!17491) (Cons!17490 (h!18621 tuple2!11694) (t!24600 List!17494)) )
))
(declare-datatypes ((ListLongMap!10453 0))(
  ( (ListLongMap!10454 (toList!5242 List!17494)) )
))
(declare-fun lt!397617 () ListLongMap!10453)

(declare-fun lt!397618 () ListLongMap!10453)

(assert (=> b!879693 (= lt!397617 lt!397618)))

(declare-fun lt!397619 () ListLongMap!10453)

(declare-fun v!557 () V!28457)

(declare-fun +!2538 (ListLongMap!10453 tuple2!11694) ListLongMap!10453)

(assert (=> b!879693 (= lt!397618 (+!2538 lt!397619 (tuple2!11695 k0!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!397614 () array!51225)

(declare-fun minValue!654 () V!28457)

(declare-fun zeroValue!654 () V!28457)

(declare-fun getCurrentListMapNoExtraKeys!3234 (array!51223 array!51225 (_ BitVec 32) (_ BitVec 32) V!28457 V!28457 (_ BitVec 32) Int) ListLongMap!10453)

(assert (=> b!879693 (= lt!397617 (getCurrentListMapNoExtraKeys!3234 _keys!868 lt!397614 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!879693 (= lt!397619 (getCurrentListMapNoExtraKeys!3234 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29987 0))(
  ( (Unit!29988) )
))
(declare-fun lt!397616 () Unit!29987)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!705 (array!51223 array!51225 (_ BitVec 32) (_ BitVec 32) V!28457 V!28457 (_ BitVec 32) (_ BitVec 64) V!28457 (_ BitVec 32) Int) Unit!29987)

(assert (=> b!879693 (= lt!397616 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!705 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!27957 () Bool)

(declare-fun tp!53627 () Bool)

(assert (=> mapNonEmpty!27957 (= mapRes!27957 (and tp!53627 e!489541))))

(declare-fun mapValue!27957 () ValueCell!8339)

(declare-fun mapKey!27957 () (_ BitVec 32))

(declare-fun mapRest!27957 () (Array (_ BitVec 32) ValueCell!8339))

(assert (=> mapNonEmpty!27957 (= (arr!24637 _values!688) (store mapRest!27957 mapKey!27957 mapValue!27957))))

(declare-fun b!879694 () Bool)

(assert (=> b!879694 (= e!489540 e!489539)))

(declare-fun res!597691 () Bool)

(assert (=> b!879694 (=> (not res!597691) (not e!489539))))

(assert (=> b!879694 (= res!597691 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!397615 () ListLongMap!10453)

(assert (=> b!879694 (= lt!397615 (getCurrentListMapNoExtraKeys!3234 _keys!868 lt!397614 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!879694 (= lt!397614 (array!51226 (store (arr!24637 _values!688) i!612 (ValueCellFull!8339 v!557)) (size!25079 _values!688)))))

(declare-fun lt!397620 () ListLongMap!10453)

(assert (=> b!879694 (= lt!397620 (getCurrentListMapNoExtraKeys!3234 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!879695 () Bool)

(declare-fun e!489538 () Bool)

(assert (=> b!879695 (= e!489538 (and e!489536 mapRes!27957))))

(declare-fun condMapEmpty!27957 () Bool)

(declare-fun mapDefault!27957 () ValueCell!8339)

(assert (=> b!879695 (= condMapEmpty!27957 (= (arr!24637 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8339)) mapDefault!27957)))))

(declare-fun b!879696 () Bool)

(declare-fun res!597686 () Bool)

(assert (=> b!879696 (=> (not res!597686) (not e!489540))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!879696 (= res!597686 (validMask!0 mask!1196))))

(declare-fun b!879690 () Bool)

(assert (=> b!879690 (= e!489537 (or (not (= (select (arr!24636 _keys!868) from!1053) k0!854)) (bvsge (size!25078 _keys!868) #b01111111111111111111111111111111) (bvsle #b00000000000000000000000000000000 (size!25078 _keys!868))))))

(declare-fun get!12962 (ValueCell!8339 V!28457) V!28457)

(declare-fun dynLambda!1232 (Int (_ BitVec 64)) V!28457)

(assert (=> b!879690 (= lt!397615 (+!2538 lt!397618 (tuple2!11695 (select (arr!24636 _keys!868) from!1053) (get!12962 (select (arr!24637 _values!688) from!1053) (dynLambda!1232 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!597684 () Bool)

(assert (=> start!74646 (=> (not res!597684) (not e!489540))))

(assert (=> start!74646 (= res!597684 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25078 _keys!868))))))

(assert (=> start!74646 e!489540))

(assert (=> start!74646 tp_is_empty!17557))

(assert (=> start!74646 true))

(assert (=> start!74646 tp!53628))

(declare-fun array_inv!19458 (array!51223) Bool)

(assert (=> start!74646 (array_inv!19458 _keys!868)))

(declare-fun array_inv!19459 (array!51225) Bool)

(assert (=> start!74646 (and (array_inv!19459 _values!688) e!489538)))

(assert (= (and start!74646 res!597684) b!879696))

(assert (= (and b!879696 res!597686) b!879691))

(assert (= (and b!879691 res!597690) b!879692))

(assert (= (and b!879692 res!597688) b!879684))

(assert (= (and b!879684 res!597683) b!879685))

(assert (= (and b!879685 res!597687) b!879689))

(assert (= (and b!879689 res!597682) b!879686))

(assert (= (and b!879686 res!597685) b!879694))

(assert (= (and b!879694 res!597691) b!879693))

(assert (= (and b!879693 (not res!597689)) b!879690))

(assert (= (and b!879695 condMapEmpty!27957) mapIsEmpty!27957))

(assert (= (and b!879695 (not condMapEmpty!27957)) mapNonEmpty!27957))

(get-info :version)

(assert (= (and mapNonEmpty!27957 ((_ is ValueCellFull!8339) mapValue!27957)) b!879687))

(assert (= (and b!879695 ((_ is ValueCellFull!8339) mapDefault!27957)) b!879688))

(assert (= start!74646 b!879695))

(declare-fun b_lambda!12403 () Bool)

(assert (=> (not b_lambda!12403) (not b!879690)))

(declare-fun t!24598 () Bool)

(declare-fun tb!4963 () Bool)

(assert (=> (and start!74646 (= defaultEntry!696 defaultEntry!696) t!24598) tb!4963))

(declare-fun result!9559 () Bool)

(assert (=> tb!4963 (= result!9559 tp_is_empty!17557)))

(assert (=> b!879690 t!24598))

(declare-fun b_and!25221 () Bool)

(assert (= b_and!25219 (and (=> t!24598 result!9559) b_and!25221)))

(declare-fun m!818927 () Bool)

(assert (=> b!879694 m!818927))

(declare-fun m!818929 () Bool)

(assert (=> b!879694 m!818929))

(declare-fun m!818931 () Bool)

(assert (=> b!879694 m!818931))

(declare-fun m!818933 () Bool)

(assert (=> mapNonEmpty!27957 m!818933))

(declare-fun m!818935 () Bool)

(assert (=> b!879689 m!818935))

(declare-fun m!818937 () Bool)

(assert (=> b!879693 m!818937))

(declare-fun m!818939 () Bool)

(assert (=> b!879693 m!818939))

(declare-fun m!818941 () Bool)

(assert (=> b!879693 m!818941))

(declare-fun m!818943 () Bool)

(assert (=> b!879693 m!818943))

(assert (=> b!879693 m!818941))

(declare-fun m!818945 () Bool)

(assert (=> b!879693 m!818945))

(declare-fun m!818947 () Bool)

(assert (=> b!879693 m!818947))

(declare-fun m!818949 () Bool)

(assert (=> b!879690 m!818949))

(declare-fun m!818951 () Bool)

(assert (=> b!879690 m!818951))

(declare-fun m!818953 () Bool)

(assert (=> b!879690 m!818953))

(declare-fun m!818955 () Bool)

(assert (=> b!879690 m!818955))

(assert (=> b!879690 m!818951))

(assert (=> b!879690 m!818941))

(assert (=> b!879690 m!818953))

(declare-fun m!818957 () Bool)

(assert (=> b!879692 m!818957))

(declare-fun m!818959 () Bool)

(assert (=> start!74646 m!818959))

(declare-fun m!818961 () Bool)

(assert (=> start!74646 m!818961))

(declare-fun m!818963 () Bool)

(assert (=> b!879686 m!818963))

(declare-fun m!818965 () Bool)

(assert (=> b!879684 m!818965))

(declare-fun m!818967 () Bool)

(assert (=> b!879696 m!818967))

(check-sat (not b!879684) b_and!25221 tp_is_empty!17557 (not b!879694) (not start!74646) (not b!879696) (not b!879690) (not b_next!15313) (not b!879692) (not b_lambda!12403) (not b!879693) (not mapNonEmpty!27957) (not b!879689))
(check-sat b_and!25221 (not b_next!15313))
