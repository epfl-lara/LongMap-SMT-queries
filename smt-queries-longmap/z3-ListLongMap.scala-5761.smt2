; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74416 () Bool)

(assert start!74416)

(declare-fun b_free!15159 () Bool)

(declare-fun b_next!15159 () Bool)

(assert (=> start!74416 (= b_free!15159 (not b_next!15159))))

(declare-fun tp!53154 () Bool)

(declare-fun b_and!24971 () Bool)

(assert (=> start!74416 (= tp!53154 b_and!24971)))

(declare-fun b!876247 () Bool)

(declare-fun e!487791 () Bool)

(declare-datatypes ((V!28251 0))(
  ( (V!28252 (val!8749 Int)) )
))
(declare-datatypes ((tuple2!11566 0))(
  ( (tuple2!11567 (_1!5794 (_ BitVec 64)) (_2!5794 V!28251)) )
))
(declare-datatypes ((List!17384 0))(
  ( (Nil!17381) (Cons!17380 (h!18511 tuple2!11566) (t!24447 List!17384)) )
))
(declare-datatypes ((ListLongMap!10335 0))(
  ( (ListLongMap!10336 (toList!5183 List!17384)) )
))
(declare-fun call!38720 () ListLongMap!10335)

(declare-fun call!38721 () ListLongMap!10335)

(assert (=> b!876247 (= e!487791 (= call!38720 call!38721))))

(declare-fun b!876248 () Bool)

(declare-fun res!595430 () Bool)

(declare-fun e!487790 () Bool)

(assert (=> b!876248 (=> (not res!595430) (not e!487790))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!50932 0))(
  ( (array!50933 (arr!24493 (Array (_ BitVec 32) (_ BitVec 64))) (size!24933 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50932)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!876248 (= res!595430 (and (= (select (arr!24493 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!876249 () Bool)

(declare-fun res!595437 () Bool)

(assert (=> b!876249 (=> (not res!595437) (not e!487790))))

(assert (=> b!876249 (= res!595437 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24933 _keys!868))))))

(declare-fun b!876250 () Bool)

(declare-fun e!487793 () Bool)

(assert (=> b!876250 (= e!487790 e!487793)))

(declare-fun res!595434 () Bool)

(assert (=> b!876250 (=> (not res!595434) (not e!487793))))

(assert (=> b!876250 (= res!595434 (= from!1053 i!612))))

(declare-datatypes ((ValueCell!8262 0))(
  ( (ValueCellFull!8262 (v!11182 V!28251)) (EmptyCell!8262) )
))
(declare-datatypes ((array!50934 0))(
  ( (array!50935 (arr!24494 (Array (_ BitVec 32) ValueCell!8262)) (size!24934 (_ BitVec 32))) )
))
(declare-fun lt!396433 () array!50934)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun lt!396434 () ListLongMap!10335)

(declare-fun minValue!654 () V!28251)

(declare-fun zeroValue!654 () V!28251)

(declare-fun getCurrentListMapNoExtraKeys!3150 (array!50932 array!50934 (_ BitVec 32) (_ BitVec 32) V!28251 V!28251 (_ BitVec 32) Int) ListLongMap!10335)

(assert (=> b!876250 (= lt!396434 (getCurrentListMapNoExtraKeys!3150 _keys!868 lt!396433 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28251)

(declare-fun _values!688 () array!50934)

(assert (=> b!876250 (= lt!396433 (array!50935 (store (arr!24494 _values!688) i!612 (ValueCellFull!8262 v!557)) (size!24934 _values!688)))))

(declare-fun lt!396432 () ListLongMap!10335)

(assert (=> b!876250 (= lt!396432 (getCurrentListMapNoExtraKeys!3150 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!876251 () Bool)

(declare-fun +!2484 (ListLongMap!10335 tuple2!11566) ListLongMap!10335)

(assert (=> b!876251 (= e!487791 (= call!38720 (+!2484 call!38721 (tuple2!11567 k0!854 v!557))))))

(declare-fun bm!38717 () Bool)

(assert (=> bm!38717 (= call!38720 (getCurrentListMapNoExtraKeys!3150 _keys!868 lt!396433 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876253 () Bool)

(declare-fun e!487796 () Bool)

(assert (=> b!876253 (= e!487793 (not e!487796))))

(declare-fun res!595431 () Bool)

(assert (=> b!876253 (=> res!595431 e!487796)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!876253 (= res!595431 (not (validKeyInArray!0 (select (arr!24493 _keys!868) from!1053))))))

(assert (=> b!876253 e!487791))

(declare-fun c!92588 () Bool)

(assert (=> b!876253 (= c!92588 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29964 0))(
  ( (Unit!29965) )
))
(declare-fun lt!396435 () Unit!29964)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!675 (array!50932 array!50934 (_ BitVec 32) (_ BitVec 32) V!28251 V!28251 (_ BitVec 32) (_ BitVec 64) V!28251 (_ BitVec 32) Int) Unit!29964)

(assert (=> b!876253 (= lt!396435 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!675 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876254 () Bool)

(assert (=> b!876254 (= e!487796 (bvslt from!1053 (size!24934 _values!688)))))

(declare-fun get!12880 (ValueCell!8262 V!28251) V!28251)

(declare-fun dynLambda!1212 (Int (_ BitVec 64)) V!28251)

(assert (=> b!876254 (= lt!396434 (+!2484 (getCurrentListMapNoExtraKeys!3150 _keys!868 lt!396433 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11567 (select (arr!24493 _keys!868) from!1053) (get!12880 (select (arr!24494 lt!396433) from!1053) (dynLambda!1212 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!876255 () Bool)

(declare-fun res!595435 () Bool)

(assert (=> b!876255 (=> (not res!595435) (not e!487790))))

(assert (=> b!876255 (= res!595435 (and (= (size!24934 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24933 _keys!868) (size!24934 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!876256 () Bool)

(declare-fun res!595438 () Bool)

(assert (=> b!876256 (=> (not res!595438) (not e!487790))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50932 (_ BitVec 32)) Bool)

(assert (=> b!876256 (= res!595438 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!876257 () Bool)

(declare-fun res!595439 () Bool)

(assert (=> b!876257 (=> (not res!595439) (not e!487790))))

(assert (=> b!876257 (= res!595439 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!27716 () Bool)

(declare-fun mapRes!27716 () Bool)

(declare-fun tp!53155 () Bool)

(declare-fun e!487797 () Bool)

(assert (=> mapNonEmpty!27716 (= mapRes!27716 (and tp!53155 e!487797))))

(declare-fun mapRest!27716 () (Array (_ BitVec 32) ValueCell!8262))

(declare-fun mapKey!27716 () (_ BitVec 32))

(declare-fun mapValue!27716 () ValueCell!8262)

(assert (=> mapNonEmpty!27716 (= (arr!24494 _values!688) (store mapRest!27716 mapKey!27716 mapValue!27716))))

(declare-fun mapIsEmpty!27716 () Bool)

(assert (=> mapIsEmpty!27716 mapRes!27716))

(declare-fun bm!38718 () Bool)

(assert (=> bm!38718 (= call!38721 (getCurrentListMapNoExtraKeys!3150 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876258 () Bool)

(declare-fun res!595436 () Bool)

(assert (=> b!876258 (=> (not res!595436) (not e!487790))))

(declare-datatypes ((List!17385 0))(
  ( (Nil!17382) (Cons!17381 (h!18512 (_ BitVec 64)) (t!24448 List!17385)) )
))
(declare-fun arrayNoDuplicates!0 (array!50932 (_ BitVec 32) List!17385) Bool)

(assert (=> b!876258 (= res!595436 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17382))))

(declare-fun b!876252 () Bool)

(declare-fun tp_is_empty!17403 () Bool)

(assert (=> b!876252 (= e!487797 tp_is_empty!17403)))

(declare-fun res!595432 () Bool)

(assert (=> start!74416 (=> (not res!595432) (not e!487790))))

(assert (=> start!74416 (= res!595432 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24933 _keys!868))))))

(assert (=> start!74416 e!487790))

(assert (=> start!74416 tp_is_empty!17403))

(assert (=> start!74416 true))

(assert (=> start!74416 tp!53154))

(declare-fun array_inv!19310 (array!50932) Bool)

(assert (=> start!74416 (array_inv!19310 _keys!868)))

(declare-fun e!487792 () Bool)

(declare-fun array_inv!19311 (array!50934) Bool)

(assert (=> start!74416 (and (array_inv!19311 _values!688) e!487792)))

(declare-fun b!876259 () Bool)

(declare-fun e!487794 () Bool)

(assert (=> b!876259 (= e!487792 (and e!487794 mapRes!27716))))

(declare-fun condMapEmpty!27716 () Bool)

(declare-fun mapDefault!27716 () ValueCell!8262)

(assert (=> b!876259 (= condMapEmpty!27716 (= (arr!24494 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8262)) mapDefault!27716)))))

(declare-fun b!876260 () Bool)

(declare-fun res!595433 () Bool)

(assert (=> b!876260 (=> (not res!595433) (not e!487790))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!876260 (= res!595433 (validMask!0 mask!1196))))

(declare-fun b!876261 () Bool)

(assert (=> b!876261 (= e!487794 tp_is_empty!17403)))

(assert (= (and start!74416 res!595432) b!876260))

(assert (= (and b!876260 res!595433) b!876255))

(assert (= (and b!876255 res!595435) b!876256))

(assert (= (and b!876256 res!595438) b!876258))

(assert (= (and b!876258 res!595436) b!876249))

(assert (= (and b!876249 res!595437) b!876257))

(assert (= (and b!876257 res!595439) b!876248))

(assert (= (and b!876248 res!595430) b!876250))

(assert (= (and b!876250 res!595434) b!876253))

(assert (= (and b!876253 c!92588) b!876251))

(assert (= (and b!876253 (not c!92588)) b!876247))

(assert (= (or b!876251 b!876247) bm!38718))

(assert (= (or b!876251 b!876247) bm!38717))

(assert (= (and b!876253 (not res!595431)) b!876254))

(assert (= (and b!876259 condMapEmpty!27716) mapIsEmpty!27716))

(assert (= (and b!876259 (not condMapEmpty!27716)) mapNonEmpty!27716))

(get-info :version)

(assert (= (and mapNonEmpty!27716 ((_ is ValueCellFull!8262) mapValue!27716)) b!876252))

(assert (= (and b!876259 ((_ is ValueCellFull!8262) mapDefault!27716)) b!876261))

(assert (= start!74416 b!876259))

(declare-fun b_lambda!12227 () Bool)

(assert (=> (not b_lambda!12227) (not b!876254)))

(declare-fun t!24446 () Bool)

(declare-fun tb!4919 () Bool)

(assert (=> (and start!74416 (= defaultEntry!696 defaultEntry!696) t!24446) tb!4919))

(declare-fun result!9457 () Bool)

(assert (=> tb!4919 (= result!9457 tp_is_empty!17403)))

(assert (=> b!876254 t!24446))

(declare-fun b_and!24973 () Bool)

(assert (= b_and!24971 (and (=> t!24446 result!9457) b_and!24973)))

(declare-fun m!816029 () Bool)

(assert (=> b!876253 m!816029))

(assert (=> b!876253 m!816029))

(declare-fun m!816031 () Bool)

(assert (=> b!876253 m!816031))

(declare-fun m!816033 () Bool)

(assert (=> b!876253 m!816033))

(declare-fun m!816035 () Bool)

(assert (=> start!74416 m!816035))

(declare-fun m!816037 () Bool)

(assert (=> start!74416 m!816037))

(declare-fun m!816039 () Bool)

(assert (=> b!876260 m!816039))

(declare-fun m!816041 () Bool)

(assert (=> b!876257 m!816041))

(declare-fun m!816043 () Bool)

(assert (=> b!876256 m!816043))

(declare-fun m!816045 () Bool)

(assert (=> bm!38718 m!816045))

(declare-fun m!816047 () Bool)

(assert (=> b!876254 m!816047))

(declare-fun m!816049 () Bool)

(assert (=> b!876254 m!816049))

(declare-fun m!816051 () Bool)

(assert (=> b!876254 m!816051))

(declare-fun m!816053 () Bool)

(assert (=> b!876254 m!816053))

(declare-fun m!816055 () Bool)

(assert (=> b!876254 m!816055))

(assert (=> b!876254 m!816029))

(assert (=> b!876254 m!816049))

(assert (=> b!876254 m!816047))

(assert (=> b!876254 m!816053))

(assert (=> bm!38717 m!816053))

(declare-fun m!816057 () Bool)

(assert (=> b!876258 m!816057))

(declare-fun m!816059 () Bool)

(assert (=> b!876251 m!816059))

(declare-fun m!816061 () Bool)

(assert (=> b!876248 m!816061))

(declare-fun m!816063 () Bool)

(assert (=> mapNonEmpty!27716 m!816063))

(declare-fun m!816065 () Bool)

(assert (=> b!876250 m!816065))

(declare-fun m!816067 () Bool)

(assert (=> b!876250 m!816067))

(declare-fun m!816069 () Bool)

(assert (=> b!876250 m!816069))

(check-sat (not b!876250) (not b!876254) (not start!74416) (not b!876260) tp_is_empty!17403 (not b!876251) (not b!876258) b_and!24973 (not b!876257) (not bm!38717) (not b_next!15159) (not bm!38718) (not b!876253) (not mapNonEmpty!27716) (not b!876256) (not b_lambda!12227))
(check-sat b_and!24973 (not b_next!15159))
