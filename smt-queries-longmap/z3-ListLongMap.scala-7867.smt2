; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97948 () Bool)

(assert start!97948)

(declare-fun b_free!23649 () Bool)

(declare-fun b_next!23649 () Bool)

(assert (=> start!97948 (= b_free!23649 (not b_next!23649))))

(declare-fun tp!83650 () Bool)

(declare-fun b_and!38081 () Bool)

(assert (=> start!97948 (= tp!83650 b_and!38081)))

(declare-fun b!1122573 () Bool)

(declare-fun e!639115 () Bool)

(declare-fun tp_is_empty!28179 () Bool)

(assert (=> b!1122573 (= e!639115 tp_is_empty!28179)))

(declare-fun res!749977 () Bool)

(declare-fun e!639113 () Bool)

(assert (=> start!97948 (=> (not res!749977) (not e!639113))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!73235 0))(
  ( (array!73236 (arr!35270 (Array (_ BitVec 32) (_ BitVec 64))) (size!35806 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73235)

(assert (=> start!97948 (= res!749977 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35806 _keys!1208))))))

(assert (=> start!97948 e!639113))

(assert (=> start!97948 tp_is_empty!28179))

(declare-fun array_inv!27080 (array!73235) Bool)

(assert (=> start!97948 (array_inv!27080 _keys!1208)))

(assert (=> start!97948 true))

(assert (=> start!97948 tp!83650))

(declare-datatypes ((V!42699 0))(
  ( (V!42700 (val!14146 Int)) )
))
(declare-datatypes ((ValueCell!13380 0))(
  ( (ValueCellFull!13380 (v!16779 V!42699)) (EmptyCell!13380) )
))
(declare-datatypes ((array!73237 0))(
  ( (array!73238 (arr!35271 (Array (_ BitVec 32) ValueCell!13380)) (size!35807 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73237)

(declare-fun e!639110 () Bool)

(declare-fun array_inv!27081 (array!73237) Bool)

(assert (=> start!97948 (and (array_inv!27081 _values!996) e!639110)))

(declare-fun b!1122574 () Bool)

(declare-fun e!639109 () Bool)

(declare-fun e!639117 () Bool)

(assert (=> b!1122574 (= e!639109 e!639117)))

(declare-fun res!749980 () Bool)

(assert (=> b!1122574 (=> res!749980 e!639117)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1122574 (= res!749980 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!42699)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!498765 () array!73235)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!498766 () array!73237)

(declare-fun minValue!944 () V!42699)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((tuple2!17764 0))(
  ( (tuple2!17765 (_1!8893 (_ BitVec 64)) (_2!8893 V!42699)) )
))
(declare-datatypes ((List!24544 0))(
  ( (Nil!24541) (Cons!24540 (h!25749 tuple2!17764) (t!35185 List!24544)) )
))
(declare-datatypes ((ListLongMap!15733 0))(
  ( (ListLongMap!15734 (toList!7882 List!24544)) )
))
(declare-fun lt!498769 () ListLongMap!15733)

(declare-fun getCurrentListMapNoExtraKeys!4371 (array!73235 array!73237 (_ BitVec 32) (_ BitVec 32) V!42699 V!42699 (_ BitVec 32) Int) ListLongMap!15733)

(assert (=> b!1122574 (= lt!498769 (getCurrentListMapNoExtraKeys!4371 lt!498765 lt!498766 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2467 (Int (_ BitVec 64)) V!42699)

(assert (=> b!1122574 (= lt!498766 (array!73238 (store (arr!35271 _values!996) i!673 (ValueCellFull!13380 (dynLambda!2467 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35807 _values!996)))))

(declare-fun lt!498767 () ListLongMap!15733)

(assert (=> b!1122574 (= lt!498767 (getCurrentListMapNoExtraKeys!4371 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1122575 () Bool)

(declare-fun e!639114 () Bool)

(assert (=> b!1122575 (= e!639113 e!639114)))

(declare-fun res!749975 () Bool)

(assert (=> b!1122575 (=> (not res!749975) (not e!639114))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73235 (_ BitVec 32)) Bool)

(assert (=> b!1122575 (= res!749975 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498765 mask!1564))))

(assert (=> b!1122575 (= lt!498765 (array!73236 (store (arr!35270 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35806 _keys!1208)))))

(declare-fun b!1122576 () Bool)

(declare-fun e!639112 () Bool)

(assert (=> b!1122576 (= e!639117 e!639112)))

(declare-fun res!749972 () Bool)

(assert (=> b!1122576 (=> res!749972 e!639112)))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1122576 (= res!749972 (not (= (select (arr!35270 _keys!1208) from!1455) k0!934)))))

(declare-fun e!639108 () Bool)

(assert (=> b!1122576 e!639108))

(declare-fun c!109464 () Bool)

(assert (=> b!1122576 (= c!109464 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36820 0))(
  ( (Unit!36821) )
))
(declare-fun lt!498768 () Unit!36820)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!337 (array!73235 array!73237 (_ BitVec 32) (_ BitVec 32) V!42699 V!42699 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36820)

(assert (=> b!1122576 (= lt!498768 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!337 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!47229 () ListLongMap!15733)

(declare-fun bm!47226 () Bool)

(assert (=> bm!47226 (= call!47229 (getCurrentListMapNoExtraKeys!4371 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44086 () Bool)

(declare-fun mapRes!44086 () Bool)

(declare-fun tp!83651 () Bool)

(declare-fun e!639116 () Bool)

(assert (=> mapNonEmpty!44086 (= mapRes!44086 (and tp!83651 e!639116))))

(declare-fun mapRest!44086 () (Array (_ BitVec 32) ValueCell!13380))

(declare-fun mapValue!44086 () ValueCell!13380)

(declare-fun mapKey!44086 () (_ BitVec 32))

(assert (=> mapNonEmpty!44086 (= (arr!35271 _values!996) (store mapRest!44086 mapKey!44086 mapValue!44086))))

(declare-fun b!1122577 () Bool)

(assert (=> b!1122577 (= e!639110 (and e!639115 mapRes!44086))))

(declare-fun condMapEmpty!44086 () Bool)

(declare-fun mapDefault!44086 () ValueCell!13380)

(assert (=> b!1122577 (= condMapEmpty!44086 (= (arr!35271 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13380)) mapDefault!44086)))))

(declare-fun b!1122578 () Bool)

(declare-fun call!47230 () ListLongMap!15733)

(assert (=> b!1122578 (= e!639108 (= call!47230 call!47229))))

(declare-fun mapIsEmpty!44086 () Bool)

(assert (=> mapIsEmpty!44086 mapRes!44086))

(declare-fun b!1122579 () Bool)

(declare-fun res!749968 () Bool)

(assert (=> b!1122579 (=> (not res!749968) (not e!639114))))

(declare-datatypes ((List!24545 0))(
  ( (Nil!24542) (Cons!24541 (h!25750 (_ BitVec 64)) (t!35186 List!24545)) )
))
(declare-fun arrayNoDuplicates!0 (array!73235 (_ BitVec 32) List!24545) Bool)

(assert (=> b!1122579 (= res!749968 (arrayNoDuplicates!0 lt!498765 #b00000000000000000000000000000000 Nil!24542))))

(declare-fun b!1122580 () Bool)

(declare-fun res!749971 () Bool)

(assert (=> b!1122580 (=> (not res!749971) (not e!639113))))

(assert (=> b!1122580 (= res!749971 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1122581 () Bool)

(assert (=> b!1122581 (= e!639114 (not e!639109))))

(declare-fun res!749970 () Bool)

(assert (=> b!1122581 (=> res!749970 e!639109)))

(assert (=> b!1122581 (= res!749970 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73235 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1122581 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!498764 () Unit!36820)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73235 (_ BitVec 64) (_ BitVec 32)) Unit!36820)

(assert (=> b!1122581 (= lt!498764 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1122582 () Bool)

(declare-fun res!749969 () Bool)

(assert (=> b!1122582 (=> (not res!749969) (not e!639113))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1122582 (= res!749969 (validMask!0 mask!1564))))

(declare-fun b!1122583 () Bool)

(declare-fun res!749979 () Bool)

(assert (=> b!1122583 (=> (not res!749979) (not e!639113))))

(assert (=> b!1122583 (= res!749979 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35806 _keys!1208))))))

(declare-fun b!1122584 () Bool)

(assert (=> b!1122584 (= e!639116 tp_is_empty!28179)))

(declare-fun b!1122585 () Bool)

(declare-fun res!749978 () Bool)

(assert (=> b!1122585 (=> (not res!749978) (not e!639113))))

(assert (=> b!1122585 (= res!749978 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24542))))

(declare-fun b!1122586 () Bool)

(declare-fun res!749976 () Bool)

(assert (=> b!1122586 (=> (not res!749976) (not e!639113))))

(assert (=> b!1122586 (= res!749976 (and (= (size!35807 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35806 _keys!1208) (size!35807 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1122587 () Bool)

(assert (=> b!1122587 (= e!639112 true)))

(declare-fun lt!498770 () Bool)

(declare-fun contains!6425 (ListLongMap!15733 (_ BitVec 64)) Bool)

(assert (=> b!1122587 (= lt!498770 (contains!6425 (getCurrentListMapNoExtraKeys!4371 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun bm!47227 () Bool)

(assert (=> bm!47227 (= call!47230 (getCurrentListMapNoExtraKeys!4371 lt!498765 lt!498766 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122588 () Bool)

(declare-fun -!1088 (ListLongMap!15733 (_ BitVec 64)) ListLongMap!15733)

(assert (=> b!1122588 (= e!639108 (= call!47230 (-!1088 call!47229 k0!934)))))

(declare-fun b!1122589 () Bool)

(declare-fun res!749974 () Bool)

(assert (=> b!1122589 (=> (not res!749974) (not e!639113))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1122589 (= res!749974 (validKeyInArray!0 k0!934))))

(declare-fun b!1122590 () Bool)

(declare-fun res!749973 () Bool)

(assert (=> b!1122590 (=> (not res!749973) (not e!639113))))

(assert (=> b!1122590 (= res!749973 (= (select (arr!35270 _keys!1208) i!673) k0!934))))

(assert (= (and start!97948 res!749977) b!1122582))

(assert (= (and b!1122582 res!749969) b!1122586))

(assert (= (and b!1122586 res!749976) b!1122580))

(assert (= (and b!1122580 res!749971) b!1122585))

(assert (= (and b!1122585 res!749978) b!1122583))

(assert (= (and b!1122583 res!749979) b!1122589))

(assert (= (and b!1122589 res!749974) b!1122590))

(assert (= (and b!1122590 res!749973) b!1122575))

(assert (= (and b!1122575 res!749975) b!1122579))

(assert (= (and b!1122579 res!749968) b!1122581))

(assert (= (and b!1122581 (not res!749970)) b!1122574))

(assert (= (and b!1122574 (not res!749980)) b!1122576))

(assert (= (and b!1122576 c!109464) b!1122588))

(assert (= (and b!1122576 (not c!109464)) b!1122578))

(assert (= (or b!1122588 b!1122578) bm!47227))

(assert (= (or b!1122588 b!1122578) bm!47226))

(assert (= (and b!1122576 (not res!749972)) b!1122587))

(assert (= (and b!1122577 condMapEmpty!44086) mapIsEmpty!44086))

(assert (= (and b!1122577 (not condMapEmpty!44086)) mapNonEmpty!44086))

(get-info :version)

(assert (= (and mapNonEmpty!44086 ((_ is ValueCellFull!13380) mapValue!44086)) b!1122584))

(assert (= (and b!1122577 ((_ is ValueCellFull!13380) mapDefault!44086)) b!1122573))

(assert (= start!97948 b!1122577))

(declare-fun b_lambda!18619 () Bool)

(assert (=> (not b_lambda!18619) (not b!1122574)))

(declare-fun t!35184 () Bool)

(declare-fun tb!8461 () Bool)

(assert (=> (and start!97948 (= defaultEntry!1004 defaultEntry!1004) t!35184) tb!8461))

(declare-fun result!17483 () Bool)

(assert (=> tb!8461 (= result!17483 tp_is_empty!28179)))

(assert (=> b!1122574 t!35184))

(declare-fun b_and!38083 () Bool)

(assert (= b_and!38081 (and (=> t!35184 result!17483) b_and!38083)))

(declare-fun m!1037201 () Bool)

(assert (=> b!1122580 m!1037201))

(declare-fun m!1037203 () Bool)

(assert (=> b!1122590 m!1037203))

(declare-fun m!1037205 () Bool)

(assert (=> b!1122574 m!1037205))

(declare-fun m!1037207 () Bool)

(assert (=> b!1122574 m!1037207))

(declare-fun m!1037209 () Bool)

(assert (=> b!1122574 m!1037209))

(declare-fun m!1037211 () Bool)

(assert (=> b!1122574 m!1037211))

(declare-fun m!1037213 () Bool)

(assert (=> b!1122587 m!1037213))

(assert (=> b!1122587 m!1037213))

(declare-fun m!1037215 () Bool)

(assert (=> b!1122587 m!1037215))

(declare-fun m!1037217 () Bool)

(assert (=> b!1122579 m!1037217))

(declare-fun m!1037219 () Bool)

(assert (=> b!1122588 m!1037219))

(declare-fun m!1037221 () Bool)

(assert (=> b!1122582 m!1037221))

(declare-fun m!1037223 () Bool)

(assert (=> start!97948 m!1037223))

(declare-fun m!1037225 () Bool)

(assert (=> start!97948 m!1037225))

(declare-fun m!1037227 () Bool)

(assert (=> mapNonEmpty!44086 m!1037227))

(declare-fun m!1037229 () Bool)

(assert (=> b!1122581 m!1037229))

(declare-fun m!1037231 () Bool)

(assert (=> b!1122581 m!1037231))

(declare-fun m!1037233 () Bool)

(assert (=> bm!47227 m!1037233))

(declare-fun m!1037235 () Bool)

(assert (=> b!1122585 m!1037235))

(declare-fun m!1037237 () Bool)

(assert (=> b!1122575 m!1037237))

(declare-fun m!1037239 () Bool)

(assert (=> b!1122575 m!1037239))

(assert (=> bm!47226 m!1037213))

(declare-fun m!1037241 () Bool)

(assert (=> b!1122589 m!1037241))

(declare-fun m!1037243 () Bool)

(assert (=> b!1122576 m!1037243))

(declare-fun m!1037245 () Bool)

(assert (=> b!1122576 m!1037245))

(check-sat (not b_next!23649) (not b!1122585) (not b!1122580) (not bm!47226) (not b!1122576) (not b!1122574) (not bm!47227) (not b!1122589) (not b!1122587) tp_is_empty!28179 (not b_lambda!18619) (not b!1122581) (not b!1122575) (not b!1122588) (not b!1122579) (not b!1122582) (not mapNonEmpty!44086) b_and!38083 (not start!97948))
(check-sat b_and!38083 (not b_next!23649))
