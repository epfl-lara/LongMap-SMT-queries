; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74570 () Bool)

(assert start!74570)

(declare-fun b_free!15145 () Bool)

(declare-fun b_next!15145 () Bool)

(assert (=> start!74570 (= b_free!15145 (not b_next!15145))))

(declare-fun tp!53114 () Bool)

(declare-fun b_and!24953 () Bool)

(assert (=> start!74570 (= tp!53114 b_and!24953)))

(declare-fun b!876821 () Bool)

(declare-fun e!488207 () Bool)

(declare-fun tp_is_empty!17389 () Bool)

(assert (=> b!876821 (= e!488207 tp_is_empty!17389)))

(declare-fun b!876822 () Bool)

(declare-fun res!595568 () Bool)

(declare-fun e!488208 () Bool)

(assert (=> b!876822 (=> (not res!595568) (not e!488208))))

(declare-datatypes ((array!50953 0))(
  ( (array!50954 (arr!24499 (Array (_ BitVec 32) (_ BitVec 64))) (size!24940 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50953)

(declare-datatypes ((List!17328 0))(
  ( (Nil!17325) (Cons!17324 (h!18461 (_ BitVec 64)) (t!24369 List!17328)) )
))
(declare-fun arrayNoDuplicates!0 (array!50953 (_ BitVec 32) List!17328) Bool)

(assert (=> b!876822 (= res!595568 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17325))))

(declare-fun mapIsEmpty!27695 () Bool)

(declare-fun mapRes!27695 () Bool)

(assert (=> mapIsEmpty!27695 mapRes!27695))

(declare-fun b!876823 () Bool)

(declare-fun e!488205 () Bool)

(assert (=> b!876823 (= e!488205 tp_is_empty!17389)))

(declare-fun res!595571 () Bool)

(assert (=> start!74570 (=> (not res!595571) (not e!488208))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74570 (= res!595571 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24940 _keys!868))))))

(assert (=> start!74570 e!488208))

(assert (=> start!74570 tp_is_empty!17389))

(assert (=> start!74570 true))

(assert (=> start!74570 tp!53114))

(declare-fun array_inv!19368 (array!50953) Bool)

(assert (=> start!74570 (array_inv!19368 _keys!868)))

(declare-datatypes ((V!28233 0))(
  ( (V!28234 (val!8742 Int)) )
))
(declare-datatypes ((ValueCell!8255 0))(
  ( (ValueCellFull!8255 (v!11175 V!28233)) (EmptyCell!8255) )
))
(declare-datatypes ((array!50955 0))(
  ( (array!50956 (arr!24500 (Array (_ BitVec 32) ValueCell!8255)) (size!24941 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50955)

(declare-fun e!488210 () Bool)

(declare-fun array_inv!19369 (array!50955) Bool)

(assert (=> start!74570 (and (array_inv!19369 _values!688) e!488210)))

(declare-fun b!876824 () Bool)

(declare-fun res!595572 () Bool)

(assert (=> b!876824 (=> (not res!595572) (not e!488208))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50953 (_ BitVec 32)) Bool)

(assert (=> b!876824 (= res!595572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun v!557 () V!28233)

(declare-fun b!876825 () Bool)

(declare-fun e!488206 () Bool)

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((tuple2!11488 0))(
  ( (tuple2!11489 (_1!5755 (_ BitVec 64)) (_2!5755 V!28233)) )
))
(declare-datatypes ((List!17329 0))(
  ( (Nil!17326) (Cons!17325 (h!18462 tuple2!11488) (t!24370 List!17329)) )
))
(declare-datatypes ((ListLongMap!10259 0))(
  ( (ListLongMap!10260 (toList!5145 List!17329)) )
))
(declare-fun call!38723 () ListLongMap!10259)

(declare-fun call!38724 () ListLongMap!10259)

(declare-fun +!2492 (ListLongMap!10259 tuple2!11488) ListLongMap!10259)

(assert (=> b!876825 (= e!488206 (= call!38724 (+!2492 call!38723 (tuple2!11489 k0!854 v!557))))))

(declare-fun b!876826 () Bool)

(declare-fun e!488211 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!876826 (= e!488211 (bvslt i!612 (size!24941 _values!688)))))

(declare-fun lt!396709 () ListLongMap!10259)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!28233)

(declare-fun zeroValue!654 () V!28233)

(declare-fun lt!396710 () array!50955)

(declare-fun getCurrentListMapNoExtraKeys!3187 (array!50953 array!50955 (_ BitVec 32) (_ BitVec 32) V!28233 V!28233 (_ BitVec 32) Int) ListLongMap!10259)

(declare-fun get!12899 (ValueCell!8255 V!28233) V!28233)

(declare-fun dynLambda!1229 (Int (_ BitVec 64)) V!28233)

(assert (=> b!876826 (= lt!396709 (+!2492 (getCurrentListMapNoExtraKeys!3187 _keys!868 lt!396710 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11489 (select (arr!24499 _keys!868) from!1053) (get!12899 (select (arr!24500 lt!396710) from!1053) (dynLambda!1229 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!876827 () Bool)

(declare-fun e!488209 () Bool)

(assert (=> b!876827 (= e!488209 (not e!488211))))

(declare-fun res!595567 () Bool)

(assert (=> b!876827 (=> res!595567 e!488211)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!876827 (= res!595567 (not (validKeyInArray!0 (select (arr!24499 _keys!868) from!1053))))))

(assert (=> b!876827 e!488206))

(declare-fun c!92849 () Bool)

(assert (=> b!876827 (= c!92849 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29934 0))(
  ( (Unit!29935) )
))
(declare-fun lt!396711 () Unit!29934)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!661 (array!50953 array!50955 (_ BitVec 32) (_ BitVec 32) V!28233 V!28233 (_ BitVec 32) (_ BitVec 64) V!28233 (_ BitVec 32) Int) Unit!29934)

(assert (=> b!876827 (= lt!396711 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!661 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876828 () Bool)

(declare-fun res!595569 () Bool)

(assert (=> b!876828 (=> (not res!595569) (not e!488208))))

(assert (=> b!876828 (= res!595569 (and (= (select (arr!24499 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!876829 () Bool)

(declare-fun res!595564 () Bool)

(assert (=> b!876829 (=> (not res!595564) (not e!488208))))

(assert (=> b!876829 (= res!595564 (and (= (size!24941 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24940 _keys!868) (size!24941 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!876830 () Bool)

(declare-fun res!595573 () Bool)

(assert (=> b!876830 (=> (not res!595573) (not e!488208))))

(assert (=> b!876830 (= res!595573 (validKeyInArray!0 k0!854))))

(declare-fun bm!38720 () Bool)

(assert (=> bm!38720 (= call!38723 (getCurrentListMapNoExtraKeys!3187 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876831 () Bool)

(declare-fun res!595570 () Bool)

(assert (=> b!876831 (=> (not res!595570) (not e!488208))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!876831 (= res!595570 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!27695 () Bool)

(declare-fun tp!53113 () Bool)

(assert (=> mapNonEmpty!27695 (= mapRes!27695 (and tp!53113 e!488205))))

(declare-fun mapValue!27695 () ValueCell!8255)

(declare-fun mapRest!27695 () (Array (_ BitVec 32) ValueCell!8255))

(declare-fun mapKey!27695 () (_ BitVec 32))

(assert (=> mapNonEmpty!27695 (= (arr!24500 _values!688) (store mapRest!27695 mapKey!27695 mapValue!27695))))

(declare-fun b!876832 () Bool)

(assert (=> b!876832 (= e!488210 (and e!488207 mapRes!27695))))

(declare-fun condMapEmpty!27695 () Bool)

(declare-fun mapDefault!27695 () ValueCell!8255)

(assert (=> b!876832 (= condMapEmpty!27695 (= (arr!24500 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8255)) mapDefault!27695)))))

(declare-fun b!876833 () Bool)

(declare-fun res!595565 () Bool)

(assert (=> b!876833 (=> (not res!595565) (not e!488208))))

(assert (=> b!876833 (= res!595565 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24940 _keys!868))))))

(declare-fun bm!38721 () Bool)

(assert (=> bm!38721 (= call!38724 (getCurrentListMapNoExtraKeys!3187 _keys!868 lt!396710 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876834 () Bool)

(assert (=> b!876834 (= e!488208 e!488209)))

(declare-fun res!595566 () Bool)

(assert (=> b!876834 (=> (not res!595566) (not e!488209))))

(assert (=> b!876834 (= res!595566 (= from!1053 i!612))))

(assert (=> b!876834 (= lt!396709 (getCurrentListMapNoExtraKeys!3187 _keys!868 lt!396710 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!876834 (= lt!396710 (array!50956 (store (arr!24500 _values!688) i!612 (ValueCellFull!8255 v!557)) (size!24941 _values!688)))))

(declare-fun lt!396712 () ListLongMap!10259)

(assert (=> b!876834 (= lt!396712 (getCurrentListMapNoExtraKeys!3187 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!876835 () Bool)

(assert (=> b!876835 (= e!488206 (= call!38724 call!38723))))

(assert (= (and start!74570 res!595571) b!876831))

(assert (= (and b!876831 res!595570) b!876829))

(assert (= (and b!876829 res!595564) b!876824))

(assert (= (and b!876824 res!595572) b!876822))

(assert (= (and b!876822 res!595568) b!876833))

(assert (= (and b!876833 res!595565) b!876830))

(assert (= (and b!876830 res!595573) b!876828))

(assert (= (and b!876828 res!595569) b!876834))

(assert (= (and b!876834 res!595566) b!876827))

(assert (= (and b!876827 c!92849) b!876825))

(assert (= (and b!876827 (not c!92849)) b!876835))

(assert (= (or b!876825 b!876835) bm!38721))

(assert (= (or b!876825 b!876835) bm!38720))

(assert (= (and b!876827 (not res!595567)) b!876826))

(assert (= (and b!876832 condMapEmpty!27695) mapIsEmpty!27695))

(assert (= (and b!876832 (not condMapEmpty!27695)) mapNonEmpty!27695))

(get-info :version)

(assert (= (and mapNonEmpty!27695 ((_ is ValueCellFull!8255) mapValue!27695)) b!876823))

(assert (= (and b!876832 ((_ is ValueCellFull!8255) mapDefault!27695)) b!876821))

(assert (= start!74570 b!876832))

(declare-fun b_lambda!12227 () Bool)

(assert (=> (not b_lambda!12227) (not b!876826)))

(declare-fun t!24368 () Bool)

(declare-fun tb!4897 () Bool)

(assert (=> (and start!74570 (= defaultEntry!696 defaultEntry!696) t!24368) tb!4897))

(declare-fun result!9421 () Bool)

(assert (=> tb!4897 (= result!9421 tp_is_empty!17389)))

(assert (=> b!876826 t!24368))

(declare-fun b_and!24955 () Bool)

(assert (= b_and!24953 (and (=> t!24368 result!9421) b_and!24955)))

(declare-fun m!817025 () Bool)

(assert (=> b!876831 m!817025))

(declare-fun m!817027 () Bool)

(assert (=> b!876824 m!817027))

(declare-fun m!817029 () Bool)

(assert (=> start!74570 m!817029))

(declare-fun m!817031 () Bool)

(assert (=> start!74570 m!817031))

(declare-fun m!817033 () Bool)

(assert (=> b!876822 m!817033))

(declare-fun m!817035 () Bool)

(assert (=> b!876826 m!817035))

(declare-fun m!817037 () Bool)

(assert (=> b!876826 m!817037))

(declare-fun m!817039 () Bool)

(assert (=> b!876826 m!817039))

(declare-fun m!817041 () Bool)

(assert (=> b!876826 m!817041))

(assert (=> b!876826 m!817035))

(declare-fun m!817043 () Bool)

(assert (=> b!876826 m!817043))

(assert (=> b!876826 m!817037))

(declare-fun m!817045 () Bool)

(assert (=> b!876826 m!817045))

(assert (=> b!876826 m!817039))

(declare-fun m!817047 () Bool)

(assert (=> b!876834 m!817047))

(declare-fun m!817049 () Bool)

(assert (=> b!876834 m!817049))

(declare-fun m!817051 () Bool)

(assert (=> b!876834 m!817051))

(declare-fun m!817053 () Bool)

(assert (=> bm!38720 m!817053))

(assert (=> b!876827 m!817045))

(assert (=> b!876827 m!817045))

(declare-fun m!817055 () Bool)

(assert (=> b!876827 m!817055))

(declare-fun m!817057 () Bool)

(assert (=> b!876827 m!817057))

(declare-fun m!817059 () Bool)

(assert (=> b!876828 m!817059))

(assert (=> bm!38721 m!817035))

(declare-fun m!817061 () Bool)

(assert (=> mapNonEmpty!27695 m!817061))

(declare-fun m!817063 () Bool)

(assert (=> b!876825 m!817063))

(declare-fun m!817065 () Bool)

(assert (=> b!876830 m!817065))

(check-sat (not b!876830) (not start!74570) (not bm!38720) (not b!876831) (not b!876825) (not b!876826) tp_is_empty!17389 (not b_next!15145) (not b_lambda!12227) (not b!876822) (not b!876827) (not bm!38721) b_and!24955 (not b!876824) (not mapNonEmpty!27695) (not b!876834))
(check-sat b_and!24955 (not b_next!15145))
