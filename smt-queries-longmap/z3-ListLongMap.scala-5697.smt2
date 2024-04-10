; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73968 () Bool)

(assert start!73968)

(declare-fun b_free!14883 () Bool)

(declare-fun b_next!14883 () Bool)

(assert (=> start!73968 (= b_free!14883 (not b_next!14883))))

(declare-fun tp!52153 () Bool)

(declare-fun b_and!24635 () Bool)

(assert (=> start!73968 (= tp!52153 b_and!24635)))

(declare-fun b!869547 () Bool)

(declare-fun res!590940 () Bool)

(declare-fun e!484248 () Bool)

(assert (=> b!869547 (=> (not res!590940) (not e!484248))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!869547 (= res!590940 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!27128 () Bool)

(declare-fun mapRes!27128 () Bool)

(assert (=> mapIsEmpty!27128 mapRes!27128))

(declare-fun b!869548 () Bool)

(declare-fun e!484244 () Bool)

(assert (=> b!869548 (= e!484244 (not true))))

(declare-datatypes ((V!27739 0))(
  ( (V!27740 (val!8557 Int)) )
))
(declare-fun v!557 () V!27739)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50186 0))(
  ( (array!50187 (arr!24124 (Array (_ BitVec 32) (_ BitVec 64))) (size!24564 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50186)

(declare-datatypes ((ValueCell!8070 0))(
  ( (ValueCellFull!8070 (v!10982 V!27739)) (EmptyCell!8070) )
))
(declare-datatypes ((array!50188 0))(
  ( (array!50189 (arr!24125 (Array (_ BitVec 32) ValueCell!8070)) (size!24565 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50188)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!27739)

(declare-fun zeroValue!654 () V!27739)

(declare-fun lt!394838 () array!50188)

(declare-datatypes ((tuple2!11368 0))(
  ( (tuple2!11369 (_1!5695 (_ BitVec 64)) (_2!5695 V!27739)) )
))
(declare-datatypes ((List!17158 0))(
  ( (Nil!17155) (Cons!17154 (h!18285 tuple2!11368) (t!24195 List!17158)) )
))
(declare-datatypes ((ListLongMap!10137 0))(
  ( (ListLongMap!10138 (toList!5084 List!17158)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3053 (array!50186 array!50188 (_ BitVec 32) (_ BitVec 32) V!27739 V!27739 (_ BitVec 32) Int) ListLongMap!10137)

(declare-fun +!2424 (ListLongMap!10137 tuple2!11368) ListLongMap!10137)

(assert (=> b!869548 (= (getCurrentListMapNoExtraKeys!3053 _keys!868 lt!394838 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2424 (getCurrentListMapNoExtraKeys!3053 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11369 k0!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29846 0))(
  ( (Unit!29847) )
))
(declare-fun lt!394840 () Unit!29846)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!618 (array!50186 array!50188 (_ BitVec 32) (_ BitVec 32) V!27739 V!27739 (_ BitVec 32) (_ BitVec 64) V!27739 (_ BitVec 32) Int) Unit!29846)

(assert (=> b!869548 (= lt!394840 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!618 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!27128 () Bool)

(declare-fun tp!52152 () Bool)

(declare-fun e!484245 () Bool)

(assert (=> mapNonEmpty!27128 (= mapRes!27128 (and tp!52152 e!484245))))

(declare-fun mapValue!27128 () ValueCell!8070)

(declare-fun mapRest!27128 () (Array (_ BitVec 32) ValueCell!8070))

(declare-fun mapKey!27128 () (_ BitVec 32))

(assert (=> mapNonEmpty!27128 (= (arr!24125 _values!688) (store mapRest!27128 mapKey!27128 mapValue!27128))))

(declare-fun b!869549 () Bool)

(assert (=> b!869549 (= e!484248 e!484244)))

(declare-fun res!590934 () Bool)

(assert (=> b!869549 (=> (not res!590934) (not e!484244))))

(assert (=> b!869549 (= res!590934 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!394837 () ListLongMap!10137)

(assert (=> b!869549 (= lt!394837 (getCurrentListMapNoExtraKeys!3053 _keys!868 lt!394838 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!869549 (= lt!394838 (array!50189 (store (arr!24125 _values!688) i!612 (ValueCellFull!8070 v!557)) (size!24565 _values!688)))))

(declare-fun lt!394839 () ListLongMap!10137)

(assert (=> b!869549 (= lt!394839 (getCurrentListMapNoExtraKeys!3053 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!869550 () Bool)

(declare-fun res!590935 () Bool)

(assert (=> b!869550 (=> (not res!590935) (not e!484248))))

(assert (=> b!869550 (= res!590935 (and (= (size!24565 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24564 _keys!868) (size!24565 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!869551 () Bool)

(declare-fun tp_is_empty!17019 () Bool)

(assert (=> b!869551 (= e!484245 tp_is_empty!17019)))

(declare-fun b!869552 () Bool)

(declare-fun res!590941 () Bool)

(assert (=> b!869552 (=> (not res!590941) (not e!484248))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50186 (_ BitVec 32)) Bool)

(assert (=> b!869552 (= res!590941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!869553 () Bool)

(declare-fun res!590937 () Bool)

(assert (=> b!869553 (=> (not res!590937) (not e!484248))))

(declare-datatypes ((List!17159 0))(
  ( (Nil!17156) (Cons!17155 (h!18286 (_ BitVec 64)) (t!24196 List!17159)) )
))
(declare-fun arrayNoDuplicates!0 (array!50186 (_ BitVec 32) List!17159) Bool)

(assert (=> b!869553 (= res!590937 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17156))))

(declare-fun b!869555 () Bool)

(declare-fun res!590938 () Bool)

(assert (=> b!869555 (=> (not res!590938) (not e!484248))))

(assert (=> b!869555 (= res!590938 (and (= (select (arr!24124 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!869556 () Bool)

(declare-fun res!590942 () Bool)

(assert (=> b!869556 (=> (not res!590942) (not e!484248))))

(assert (=> b!869556 (= res!590942 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24564 _keys!868))))))

(declare-fun b!869557 () Bool)

(declare-fun e!484249 () Bool)

(declare-fun e!484247 () Bool)

(assert (=> b!869557 (= e!484249 (and e!484247 mapRes!27128))))

(declare-fun condMapEmpty!27128 () Bool)

(declare-fun mapDefault!27128 () ValueCell!8070)

(assert (=> b!869557 (= condMapEmpty!27128 (= (arr!24125 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8070)) mapDefault!27128)))))

(declare-fun b!869558 () Bool)

(assert (=> b!869558 (= e!484247 tp_is_empty!17019)))

(declare-fun b!869554 () Bool)

(declare-fun res!590936 () Bool)

(assert (=> b!869554 (=> (not res!590936) (not e!484248))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!869554 (= res!590936 (validMask!0 mask!1196))))

(declare-fun res!590939 () Bool)

(assert (=> start!73968 (=> (not res!590939) (not e!484248))))

(assert (=> start!73968 (= res!590939 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24564 _keys!868))))))

(assert (=> start!73968 e!484248))

(assert (=> start!73968 tp_is_empty!17019))

(assert (=> start!73968 true))

(assert (=> start!73968 tp!52153))

(declare-fun array_inv!19056 (array!50186) Bool)

(assert (=> start!73968 (array_inv!19056 _keys!868)))

(declare-fun array_inv!19057 (array!50188) Bool)

(assert (=> start!73968 (and (array_inv!19057 _values!688) e!484249)))

(assert (= (and start!73968 res!590939) b!869554))

(assert (= (and b!869554 res!590936) b!869550))

(assert (= (and b!869550 res!590935) b!869552))

(assert (= (and b!869552 res!590941) b!869553))

(assert (= (and b!869553 res!590937) b!869556))

(assert (= (and b!869556 res!590942) b!869547))

(assert (= (and b!869547 res!590940) b!869555))

(assert (= (and b!869555 res!590938) b!869549))

(assert (= (and b!869549 res!590934) b!869548))

(assert (= (and b!869557 condMapEmpty!27128) mapIsEmpty!27128))

(assert (= (and b!869557 (not condMapEmpty!27128)) mapNonEmpty!27128))

(get-info :version)

(assert (= (and mapNonEmpty!27128 ((_ is ValueCellFull!8070) mapValue!27128)) b!869551))

(assert (= (and b!869557 ((_ is ValueCellFull!8070) mapDefault!27128)) b!869558))

(assert (= start!73968 b!869557))

(declare-fun m!811067 () Bool)

(assert (=> b!869549 m!811067))

(declare-fun m!811069 () Bool)

(assert (=> b!869549 m!811069))

(declare-fun m!811071 () Bool)

(assert (=> b!869549 m!811071))

(declare-fun m!811073 () Bool)

(assert (=> b!869555 m!811073))

(declare-fun m!811075 () Bool)

(assert (=> b!869553 m!811075))

(declare-fun m!811077 () Bool)

(assert (=> b!869548 m!811077))

(declare-fun m!811079 () Bool)

(assert (=> b!869548 m!811079))

(assert (=> b!869548 m!811079))

(declare-fun m!811081 () Bool)

(assert (=> b!869548 m!811081))

(declare-fun m!811083 () Bool)

(assert (=> b!869548 m!811083))

(declare-fun m!811085 () Bool)

(assert (=> b!869547 m!811085))

(declare-fun m!811087 () Bool)

(assert (=> start!73968 m!811087))

(declare-fun m!811089 () Bool)

(assert (=> start!73968 m!811089))

(declare-fun m!811091 () Bool)

(assert (=> b!869554 m!811091))

(declare-fun m!811093 () Bool)

(assert (=> mapNonEmpty!27128 m!811093))

(declare-fun m!811095 () Bool)

(assert (=> b!869552 m!811095))

(check-sat tp_is_empty!17019 (not b_next!14883) (not b!869553) (not b!869554) (not b!869552) (not b!869549) (not b!869548) (not b!869547) b_and!24635 (not start!73968) (not mapNonEmpty!27128))
(check-sat b_and!24635 (not b_next!14883))
