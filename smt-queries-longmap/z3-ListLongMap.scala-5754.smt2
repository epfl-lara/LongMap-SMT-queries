; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74354 () Bool)

(assert start!74354)

(declare-fun b_free!15117 () Bool)

(declare-fun b_next!15117 () Bool)

(assert (=> start!74354 (= b_free!15117 (not b_next!15117))))

(declare-fun tp!53026 () Bool)

(declare-fun b_and!24893 () Bool)

(assert (=> start!74354 (= tp!53026 b_and!24893)))

(declare-datatypes ((V!28195 0))(
  ( (V!28196 (val!8728 Int)) )
))
(declare-datatypes ((tuple2!11526 0))(
  ( (tuple2!11527 (_1!5774 (_ BitVec 64)) (_2!5774 V!28195)) )
))
(declare-datatypes ((List!17351 0))(
  ( (Nil!17348) (Cons!17347 (h!18478 tuple2!11526) (t!24392 List!17351)) )
))
(declare-datatypes ((ListLongMap!10295 0))(
  ( (ListLongMap!10296 (toList!5163 List!17351)) )
))
(declare-fun call!38577 () ListLongMap!10295)

(declare-fun v!557 () V!28195)

(declare-fun e!487207 () Bool)

(declare-fun b!875152 () Bool)

(declare-fun call!38576 () ListLongMap!10295)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2467 (ListLongMap!10295 tuple2!11526) ListLongMap!10295)

(assert (=> b!875152 (= e!487207 (= call!38577 (+!2467 call!38576 (tuple2!11527 k0!854 v!557))))))

(declare-fun b!875153 () Bool)

(declare-fun res!594750 () Bool)

(declare-fun e!487205 () Bool)

(assert (=> b!875153 (=> (not res!594750) (not e!487205))))

(declare-datatypes ((array!50848 0))(
  ( (array!50849 (arr!24452 (Array (_ BitVec 32) (_ BitVec 64))) (size!24892 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50848)

(declare-datatypes ((List!17352 0))(
  ( (Nil!17349) (Cons!17348 (h!18479 (_ BitVec 64)) (t!24393 List!17352)) )
))
(declare-fun arrayNoDuplicates!0 (array!50848 (_ BitVec 32) List!17352) Bool)

(assert (=> b!875153 (= res!594750 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17349))))

(declare-fun b!875154 () Bool)

(assert (=> b!875154 (= e!487207 (= call!38577 call!38576))))

(declare-fun b!875155 () Bool)

(declare-fun res!594758 () Bool)

(assert (=> b!875155 (=> (not res!594758) (not e!487205))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!875155 (= res!594758 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24892 _keys!868))))))

(declare-fun b!875156 () Bool)

(declare-fun res!594759 () Bool)

(assert (=> b!875156 (=> (not res!594759) (not e!487205))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!875156 (= res!594759 (validKeyInArray!0 k0!854))))

(declare-fun b!875157 () Bool)

(declare-fun e!487208 () Bool)

(declare-fun e!487206 () Bool)

(declare-fun mapRes!27650 () Bool)

(assert (=> b!875157 (= e!487208 (and e!487206 mapRes!27650))))

(declare-fun condMapEmpty!27650 () Bool)

(declare-datatypes ((ValueCell!8241 0))(
  ( (ValueCellFull!8241 (v!11157 V!28195)) (EmptyCell!8241) )
))
(declare-datatypes ((array!50850 0))(
  ( (array!50851 (arr!24453 (Array (_ BitVec 32) ValueCell!8241)) (size!24893 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50850)

(declare-fun mapDefault!27650 () ValueCell!8241)

(assert (=> b!875157 (= condMapEmpty!27650 (= (arr!24453 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8241)) mapDefault!27650)))))

(declare-fun b!875158 () Bool)

(declare-fun tp_is_empty!17361 () Bool)

(assert (=> b!875158 (= e!487206 tp_is_empty!17361)))

(declare-fun res!594753 () Bool)

(assert (=> start!74354 (=> (not res!594753) (not e!487205))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74354 (= res!594753 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24892 _keys!868))))))

(assert (=> start!74354 e!487205))

(assert (=> start!74354 tp_is_empty!17361))

(assert (=> start!74354 true))

(assert (=> start!74354 tp!53026))

(declare-fun array_inv!19276 (array!50848) Bool)

(assert (=> start!74354 (array_inv!19276 _keys!868)))

(declare-fun array_inv!19277 (array!50850) Bool)

(assert (=> start!74354 (and (array_inv!19277 _values!688) e!487208)))

(declare-fun bm!38573 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!28195)

(declare-fun zeroValue!654 () V!28195)

(declare-fun getCurrentListMapNoExtraKeys!3130 (array!50848 array!50850 (_ BitVec 32) (_ BitVec 32) V!28195 V!28195 (_ BitVec 32) Int) ListLongMap!10295)

(assert (=> bm!38573 (= call!38576 (getCurrentListMapNoExtraKeys!3130 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875159 () Bool)

(declare-fun res!594756 () Bool)

(assert (=> b!875159 (=> (not res!594756) (not e!487205))))

(assert (=> b!875159 (= res!594756 (and (= (size!24893 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24892 _keys!868) (size!24893 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!875160 () Bool)

(declare-fun res!594752 () Bool)

(assert (=> b!875160 (=> (not res!594752) (not e!487205))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!875160 (= res!594752 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!27650 () Bool)

(assert (=> mapIsEmpty!27650 mapRes!27650))

(declare-fun b!875161 () Bool)

(declare-fun e!487209 () Bool)

(assert (=> b!875161 (= e!487205 e!487209)))

(declare-fun res!594751 () Bool)

(assert (=> b!875161 (=> (not res!594751) (not e!487209))))

(assert (=> b!875161 (= res!594751 (= from!1053 i!612))))

(declare-fun lt!396094 () array!50850)

(declare-fun lt!396093 () ListLongMap!10295)

(assert (=> b!875161 (= lt!396093 (getCurrentListMapNoExtraKeys!3130 _keys!868 lt!396094 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!875161 (= lt!396094 (array!50851 (store (arr!24453 _values!688) i!612 (ValueCellFull!8241 v!557)) (size!24893 _values!688)))))

(declare-fun lt!396095 () ListLongMap!10295)

(assert (=> b!875161 (= lt!396095 (getCurrentListMapNoExtraKeys!3130 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!875162 () Bool)

(declare-fun e!487210 () Bool)

(assert (=> b!875162 (= e!487209 (not e!487210))))

(declare-fun res!594757 () Bool)

(assert (=> b!875162 (=> res!594757 e!487210)))

(assert (=> b!875162 (= res!594757 (not (validKeyInArray!0 (select (arr!24452 _keys!868) from!1053))))))

(assert (=> b!875162 e!487207))

(declare-fun c!92489 () Bool)

(assert (=> b!875162 (= c!92489 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29932 0))(
  ( (Unit!29933) )
))
(declare-fun lt!396092 () Unit!29932)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!659 (array!50848 array!50850 (_ BitVec 32) (_ BitVec 32) V!28195 V!28195 (_ BitVec 32) (_ BitVec 64) V!28195 (_ BitVec 32) Int) Unit!29932)

(assert (=> b!875162 (= lt!396092 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!659 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875163 () Bool)

(declare-fun res!594755 () Bool)

(assert (=> b!875163 (=> (not res!594755) (not e!487205))))

(assert (=> b!875163 (= res!594755 (and (= (select (arr!24452 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun bm!38574 () Bool)

(assert (=> bm!38574 (= call!38577 (getCurrentListMapNoExtraKeys!3130 _keys!868 lt!396094 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!27650 () Bool)

(declare-fun tp!53025 () Bool)

(declare-fun e!487211 () Bool)

(assert (=> mapNonEmpty!27650 (= mapRes!27650 (and tp!53025 e!487211))))

(declare-fun mapKey!27650 () (_ BitVec 32))

(declare-fun mapValue!27650 () ValueCell!8241)

(declare-fun mapRest!27650 () (Array (_ BitVec 32) ValueCell!8241))

(assert (=> mapNonEmpty!27650 (= (arr!24453 _values!688) (store mapRest!27650 mapKey!27650 mapValue!27650))))

(declare-fun b!875164 () Bool)

(assert (=> b!875164 (= e!487210 (bvslt i!612 (size!24893 _values!688)))))

(declare-fun b!875165 () Bool)

(assert (=> b!875165 (= e!487211 tp_is_empty!17361)))

(declare-fun b!875166 () Bool)

(declare-fun res!594754 () Bool)

(assert (=> b!875166 (=> (not res!594754) (not e!487205))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50848 (_ BitVec 32)) Bool)

(assert (=> b!875166 (= res!594754 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!74354 res!594753) b!875160))

(assert (= (and b!875160 res!594752) b!875159))

(assert (= (and b!875159 res!594756) b!875166))

(assert (= (and b!875166 res!594754) b!875153))

(assert (= (and b!875153 res!594750) b!875155))

(assert (= (and b!875155 res!594758) b!875156))

(assert (= (and b!875156 res!594759) b!875163))

(assert (= (and b!875163 res!594755) b!875161))

(assert (= (and b!875161 res!594751) b!875162))

(assert (= (and b!875162 c!92489) b!875152))

(assert (= (and b!875162 (not c!92489)) b!875154))

(assert (= (or b!875152 b!875154) bm!38574))

(assert (= (or b!875152 b!875154) bm!38573))

(assert (= (and b!875162 (not res!594757)) b!875164))

(assert (= (and b!875157 condMapEmpty!27650) mapIsEmpty!27650))

(assert (= (and b!875157 (not condMapEmpty!27650)) mapNonEmpty!27650))

(get-info :version)

(assert (= (and mapNonEmpty!27650 ((_ is ValueCellFull!8241) mapValue!27650)) b!875165))

(assert (= (and b!875157 ((_ is ValueCellFull!8241) mapDefault!27650)) b!875158))

(assert (= start!74354 b!875157))

(declare-fun m!815087 () Bool)

(assert (=> bm!38573 m!815087))

(declare-fun m!815089 () Bool)

(assert (=> b!875162 m!815089))

(assert (=> b!875162 m!815089))

(declare-fun m!815091 () Bool)

(assert (=> b!875162 m!815091))

(declare-fun m!815093 () Bool)

(assert (=> b!875162 m!815093))

(declare-fun m!815095 () Bool)

(assert (=> b!875153 m!815095))

(declare-fun m!815097 () Bool)

(assert (=> b!875163 m!815097))

(declare-fun m!815099 () Bool)

(assert (=> b!875160 m!815099))

(declare-fun m!815101 () Bool)

(assert (=> b!875156 m!815101))

(declare-fun m!815103 () Bool)

(assert (=> b!875161 m!815103))

(declare-fun m!815105 () Bool)

(assert (=> b!875161 m!815105))

(declare-fun m!815107 () Bool)

(assert (=> b!875161 m!815107))

(declare-fun m!815109 () Bool)

(assert (=> bm!38574 m!815109))

(declare-fun m!815111 () Bool)

(assert (=> start!74354 m!815111))

(declare-fun m!815113 () Bool)

(assert (=> start!74354 m!815113))

(declare-fun m!815115 () Bool)

(assert (=> mapNonEmpty!27650 m!815115))

(declare-fun m!815117 () Bool)

(assert (=> b!875152 m!815117))

(declare-fun m!815119 () Bool)

(assert (=> b!875166 m!815119))

(check-sat (not b!875166) (not b_next!15117) tp_is_empty!17361 (not b!875161) (not b!875162) (not bm!38573) (not bm!38574) (not b!875152) (not b!875160) (not b!875153) (not b!875156) (not mapNonEmpty!27650) (not start!74354) b_and!24893)
(check-sat b_and!24893 (not b_next!15117))
