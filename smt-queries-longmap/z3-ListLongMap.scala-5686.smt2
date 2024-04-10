; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73902 () Bool)

(assert start!73902)

(declare-fun b_free!14817 () Bool)

(declare-fun b_next!14817 () Bool)

(assert (=> start!73902 (= b_free!14817 (not b_next!14817))))

(declare-fun tp!51954 () Bool)

(declare-fun b_and!24569 () Bool)

(assert (=> start!73902 (= tp!51954 b_and!24569)))

(declare-fun mapNonEmpty!27029 () Bool)

(declare-fun mapRes!27029 () Bool)

(declare-fun tp!51955 () Bool)

(declare-fun e!483652 () Bool)

(assert (=> mapNonEmpty!27029 (= mapRes!27029 (and tp!51955 e!483652))))

(declare-datatypes ((V!27651 0))(
  ( (V!27652 (val!8524 Int)) )
))
(declare-datatypes ((ValueCell!8037 0))(
  ( (ValueCellFull!8037 (v!10949 V!27651)) (EmptyCell!8037) )
))
(declare-fun mapRest!27029 () (Array (_ BitVec 32) ValueCell!8037))

(declare-datatypes ((array!50062 0))(
  ( (array!50063 (arr!24062 (Array (_ BitVec 32) ValueCell!8037)) (size!24502 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50062)

(declare-fun mapKey!27029 () (_ BitVec 32))

(declare-fun mapValue!27029 () ValueCell!8037)

(assert (=> mapNonEmpty!27029 (= (arr!24062 _values!688) (store mapRest!27029 mapKey!27029 mapValue!27029))))

(declare-fun b!868359 () Bool)

(declare-fun res!590048 () Bool)

(declare-fun e!483651 () Bool)

(assert (=> b!868359 (=> (not res!590048) (not e!483651))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50064 0))(
  ( (array!50065 (arr!24063 (Array (_ BitVec 32) (_ BitVec 64))) (size!24503 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50064)

(assert (=> b!868359 (= res!590048 (and (= (size!24502 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24503 _keys!868) (size!24502 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!868360 () Bool)

(declare-fun res!590047 () Bool)

(assert (=> b!868360 (=> (not res!590047) (not e!483651))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!868360 (= res!590047 (validMask!0 mask!1196))))

(declare-fun res!590049 () Bool)

(assert (=> start!73902 (=> (not res!590049) (not e!483651))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73902 (= res!590049 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24503 _keys!868))))))

(assert (=> start!73902 e!483651))

(declare-fun tp_is_empty!16953 () Bool)

(assert (=> start!73902 tp_is_empty!16953))

(assert (=> start!73902 true))

(assert (=> start!73902 tp!51954))

(declare-fun array_inv!19012 (array!50064) Bool)

(assert (=> start!73902 (array_inv!19012 _keys!868)))

(declare-fun e!483650 () Bool)

(declare-fun array_inv!19013 (array!50062) Bool)

(assert (=> start!73902 (and (array_inv!19013 _values!688) e!483650)))

(declare-fun b!868361 () Bool)

(declare-fun res!590045 () Bool)

(assert (=> b!868361 (=> (not res!590045) (not e!483651))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50064 (_ BitVec 32)) Bool)

(assert (=> b!868361 (= res!590045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!868362 () Bool)

(declare-fun res!590050 () Bool)

(assert (=> b!868362 (=> (not res!590050) (not e!483651))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!868362 (= res!590050 (validKeyInArray!0 k0!854))))

(declare-fun b!868363 () Bool)

(declare-fun res!590044 () Bool)

(assert (=> b!868363 (=> (not res!590044) (not e!483651))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!868363 (= res!590044 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24503 _keys!868))))))

(declare-fun b!868364 () Bool)

(declare-fun res!590043 () Bool)

(assert (=> b!868364 (=> (not res!590043) (not e!483651))))

(assert (=> b!868364 (= res!590043 (and (= (select (arr!24063 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!27029 () Bool)

(assert (=> mapIsEmpty!27029 mapRes!27029))

(declare-fun b!868365 () Bool)

(declare-fun e!483654 () Bool)

(assert (=> b!868365 (= e!483650 (and e!483654 mapRes!27029))))

(declare-fun condMapEmpty!27029 () Bool)

(declare-fun mapDefault!27029 () ValueCell!8037)

(assert (=> b!868365 (= condMapEmpty!27029 (= (arr!24062 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8037)) mapDefault!27029)))))

(declare-fun b!868366 () Bool)

(assert (=> b!868366 (= e!483654 tp_is_empty!16953)))

(declare-fun b!868367 () Bool)

(declare-fun e!483653 () Bool)

(assert (=> b!868367 (= e!483651 e!483653)))

(declare-fun res!590051 () Bool)

(assert (=> b!868367 (=> (not res!590051) (not e!483653))))

(assert (=> b!868367 (= res!590051 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!394442 () array!50062)

(declare-datatypes ((tuple2!11316 0))(
  ( (tuple2!11317 (_1!5669 (_ BitVec 64)) (_2!5669 V!27651)) )
))
(declare-datatypes ((List!17112 0))(
  ( (Nil!17109) (Cons!17108 (h!18239 tuple2!11316) (t!24149 List!17112)) )
))
(declare-datatypes ((ListLongMap!10085 0))(
  ( (ListLongMap!10086 (toList!5058 List!17112)) )
))
(declare-fun lt!394443 () ListLongMap!10085)

(declare-fun minValue!654 () V!27651)

(declare-fun zeroValue!654 () V!27651)

(declare-fun getCurrentListMapNoExtraKeys!3027 (array!50064 array!50062 (_ BitVec 32) (_ BitVec 32) V!27651 V!27651 (_ BitVec 32) Int) ListLongMap!10085)

(assert (=> b!868367 (= lt!394443 (getCurrentListMapNoExtraKeys!3027 _keys!868 lt!394442 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27651)

(assert (=> b!868367 (= lt!394442 (array!50063 (store (arr!24062 _values!688) i!612 (ValueCellFull!8037 v!557)) (size!24502 _values!688)))))

(declare-fun lt!394444 () ListLongMap!10085)

(assert (=> b!868367 (= lt!394444 (getCurrentListMapNoExtraKeys!3027 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!868368 () Bool)

(assert (=> b!868368 (= e!483652 tp_is_empty!16953)))

(declare-fun b!868369 () Bool)

(declare-fun res!590046 () Bool)

(assert (=> b!868369 (=> (not res!590046) (not e!483651))))

(declare-datatypes ((List!17113 0))(
  ( (Nil!17110) (Cons!17109 (h!18240 (_ BitVec 64)) (t!24150 List!17113)) )
))
(declare-fun arrayNoDuplicates!0 (array!50064 (_ BitVec 32) List!17113) Bool)

(assert (=> b!868369 (= res!590046 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17110))))

(declare-fun b!868370 () Bool)

(assert (=> b!868370 (= e!483653 (not true))))

(declare-fun +!2400 (ListLongMap!10085 tuple2!11316) ListLongMap!10085)

(assert (=> b!868370 (= (getCurrentListMapNoExtraKeys!3027 _keys!868 lt!394442 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2400 (getCurrentListMapNoExtraKeys!3027 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11317 k0!854 v!557)))))

(declare-datatypes ((Unit!29798 0))(
  ( (Unit!29799) )
))
(declare-fun lt!394441 () Unit!29798)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!594 (array!50064 array!50062 (_ BitVec 32) (_ BitVec 32) V!27651 V!27651 (_ BitVec 32) (_ BitVec 64) V!27651 (_ BitVec 32) Int) Unit!29798)

(assert (=> b!868370 (= lt!394441 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!594 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73902 res!590049) b!868360))

(assert (= (and b!868360 res!590047) b!868359))

(assert (= (and b!868359 res!590048) b!868361))

(assert (= (and b!868361 res!590045) b!868369))

(assert (= (and b!868369 res!590046) b!868363))

(assert (= (and b!868363 res!590044) b!868362))

(assert (= (and b!868362 res!590050) b!868364))

(assert (= (and b!868364 res!590043) b!868367))

(assert (= (and b!868367 res!590051) b!868370))

(assert (= (and b!868365 condMapEmpty!27029) mapIsEmpty!27029))

(assert (= (and b!868365 (not condMapEmpty!27029)) mapNonEmpty!27029))

(get-info :version)

(assert (= (and mapNonEmpty!27029 ((_ is ValueCellFull!8037) mapValue!27029)) b!868368))

(assert (= (and b!868365 ((_ is ValueCellFull!8037) mapDefault!27029)) b!868366))

(assert (= start!73902 b!868365))

(declare-fun m!810077 () Bool)

(assert (=> b!868361 m!810077))

(declare-fun m!810079 () Bool)

(assert (=> b!868367 m!810079))

(declare-fun m!810081 () Bool)

(assert (=> b!868367 m!810081))

(declare-fun m!810083 () Bool)

(assert (=> b!868367 m!810083))

(declare-fun m!810085 () Bool)

(assert (=> mapNonEmpty!27029 m!810085))

(declare-fun m!810087 () Bool)

(assert (=> b!868362 m!810087))

(declare-fun m!810089 () Bool)

(assert (=> start!73902 m!810089))

(declare-fun m!810091 () Bool)

(assert (=> start!73902 m!810091))

(declare-fun m!810093 () Bool)

(assert (=> b!868364 m!810093))

(declare-fun m!810095 () Bool)

(assert (=> b!868360 m!810095))

(declare-fun m!810097 () Bool)

(assert (=> b!868370 m!810097))

(declare-fun m!810099 () Bool)

(assert (=> b!868370 m!810099))

(assert (=> b!868370 m!810099))

(declare-fun m!810101 () Bool)

(assert (=> b!868370 m!810101))

(declare-fun m!810103 () Bool)

(assert (=> b!868370 m!810103))

(declare-fun m!810105 () Bool)

(assert (=> b!868369 m!810105))

(check-sat (not b!868367) (not b!868370) (not b_next!14817) tp_is_empty!16953 (not start!73902) (not b!868360) b_and!24569 (not b!868362) (not mapNonEmpty!27029) (not b!868369) (not b!868361))
(check-sat b_and!24569 (not b_next!14817))
