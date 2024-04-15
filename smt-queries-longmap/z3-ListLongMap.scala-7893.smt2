; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98096 () Bool)

(assert start!98096)

(declare-fun b_free!23803 () Bool)

(declare-fun b_next!23803 () Bool)

(assert (=> start!98096 (= b_free!23803 (not b_next!23803))))

(declare-fun tp!84113 () Bool)

(declare-fun b_and!38367 () Bool)

(assert (=> start!98096 (= tp!84113 b_and!38367)))

(declare-fun b!1126954 () Bool)

(declare-fun res!753104 () Bool)

(declare-fun e!641436 () Bool)

(assert (=> b!1126954 (=> (not res!753104) (not e!641436))))

(declare-datatypes ((array!73452 0))(
  ( (array!73453 (arr!35379 (Array (_ BitVec 32) (_ BitVec 64))) (size!35917 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73452)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1126954 (= res!753104 (= (select (arr!35379 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!44317 () Bool)

(declare-fun mapRes!44317 () Bool)

(assert (=> mapIsEmpty!44317 mapRes!44317))

(declare-fun b!1126955 () Bool)

(declare-fun e!641432 () Bool)

(declare-fun tp_is_empty!28333 () Bool)

(assert (=> b!1126955 (= e!641432 tp_is_empty!28333)))

(declare-fun b!1126956 () Bool)

(declare-fun e!641428 () Bool)

(assert (=> b!1126956 (= e!641428 true)))

(declare-datatypes ((V!42905 0))(
  ( (V!42906 (val!14223 Int)) )
))
(declare-fun zeroValue!944 () V!42905)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!500253 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13457 0))(
  ( (ValueCellFull!13457 (v!16855 V!42905)) (EmptyCell!13457) )
))
(declare-datatypes ((array!73454 0))(
  ( (array!73455 (arr!35380 (Array (_ BitVec 32) ValueCell!13457)) (size!35918 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73454)

(declare-fun minValue!944 () V!42905)

(declare-datatypes ((tuple2!17980 0))(
  ( (tuple2!17981 (_1!9001 (_ BitVec 64)) (_2!9001 V!42905)) )
))
(declare-datatypes ((List!24737 0))(
  ( (Nil!24734) (Cons!24733 (h!25942 tuple2!17980) (t!35523 List!24737)) )
))
(declare-datatypes ((ListLongMap!15949 0))(
  ( (ListLongMap!15950 (toList!7990 List!24737)) )
))
(declare-fun contains!6451 (ListLongMap!15949 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!4490 (array!73452 array!73454 (_ BitVec 32) (_ BitVec 32) V!42905 V!42905 (_ BitVec 32) Int) ListLongMap!15949)

(assert (=> b!1126956 (= lt!500253 (contains!6451 (getCurrentListMapNoExtraKeys!4490 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun res!753106 () Bool)

(assert (=> start!98096 (=> (not res!753106) (not e!641436))))

(assert (=> start!98096 (= res!753106 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35917 _keys!1208))))))

(assert (=> start!98096 e!641436))

(assert (=> start!98096 tp_is_empty!28333))

(declare-fun array_inv!27228 (array!73452) Bool)

(assert (=> start!98096 (array_inv!27228 _keys!1208)))

(assert (=> start!98096 true))

(assert (=> start!98096 tp!84113))

(declare-fun e!641430 () Bool)

(declare-fun array_inv!27229 (array!73454) Bool)

(assert (=> start!98096 (and (array_inv!27229 _values!996) e!641430)))

(declare-fun b!1126957 () Bool)

(declare-fun e!641435 () Bool)

(declare-fun call!47668 () ListLongMap!15949)

(declare-fun call!47669 () ListLongMap!15949)

(assert (=> b!1126957 (= e!641435 (= call!47668 call!47669))))

(declare-fun b!1126958 () Bool)

(declare-fun res!753107 () Bool)

(assert (=> b!1126958 (=> (not res!753107) (not e!641436))))

(assert (=> b!1126958 (= res!753107 (and (= (size!35918 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35917 _keys!1208) (size!35918 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1126959 () Bool)

(declare-fun res!753100 () Bool)

(assert (=> b!1126959 (=> (not res!753100) (not e!641436))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1126959 (= res!753100 (validKeyInArray!0 k0!934))))

(declare-fun b!1126960 () Bool)

(declare-fun res!753101 () Bool)

(assert (=> b!1126960 (=> (not res!753101) (not e!641436))))

(assert (=> b!1126960 (= res!753101 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35917 _keys!1208))))))

(declare-fun b!1126961 () Bool)

(declare-fun e!641434 () Bool)

(declare-fun e!641433 () Bool)

(assert (=> b!1126961 (= e!641434 (not e!641433))))

(declare-fun res!753109 () Bool)

(assert (=> b!1126961 (=> res!753109 e!641433)))

(assert (=> b!1126961 (= res!753109 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73452 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1126961 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36781 0))(
  ( (Unit!36782) )
))
(declare-fun lt!500259 () Unit!36781)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73452 (_ BitVec 64) (_ BitVec 32)) Unit!36781)

(assert (=> b!1126961 (= lt!500259 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1126962 () Bool)

(declare-fun res!753108 () Bool)

(assert (=> b!1126962 (=> (not res!753108) (not e!641436))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73452 (_ BitVec 32)) Bool)

(assert (=> b!1126962 (= res!753108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun lt!500258 () array!73452)

(declare-fun bm!47665 () Bool)

(declare-fun lt!500255 () array!73454)

(assert (=> bm!47665 (= call!47668 (getCurrentListMapNoExtraKeys!4490 lt!500258 lt!500255 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44317 () Bool)

(declare-fun tp!84112 () Bool)

(assert (=> mapNonEmpty!44317 (= mapRes!44317 (and tp!84112 e!641432))))

(declare-fun mapKey!44317 () (_ BitVec 32))

(declare-fun mapRest!44317 () (Array (_ BitVec 32) ValueCell!13457))

(declare-fun mapValue!44317 () ValueCell!13457)

(assert (=> mapNonEmpty!44317 (= (arr!35380 _values!996) (store mapRest!44317 mapKey!44317 mapValue!44317))))

(declare-fun b!1126963 () Bool)

(declare-fun e!641427 () Bool)

(assert (=> b!1126963 (= e!641430 (and e!641427 mapRes!44317))))

(declare-fun condMapEmpty!44317 () Bool)

(declare-fun mapDefault!44317 () ValueCell!13457)

(assert (=> b!1126963 (= condMapEmpty!44317 (= (arr!35380 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13457)) mapDefault!44317)))))

(declare-fun b!1126964 () Bool)

(declare-fun -!1115 (ListLongMap!15949 (_ BitVec 64)) ListLongMap!15949)

(assert (=> b!1126964 (= e!641435 (= call!47668 (-!1115 call!47669 k0!934)))))

(declare-fun b!1126965 () Bool)

(declare-fun res!753103 () Bool)

(assert (=> b!1126965 (=> (not res!753103) (not e!641434))))

(declare-datatypes ((List!24738 0))(
  ( (Nil!24735) (Cons!24734 (h!25943 (_ BitVec 64)) (t!35524 List!24738)) )
))
(declare-fun arrayNoDuplicates!0 (array!73452 (_ BitVec 32) List!24738) Bool)

(assert (=> b!1126965 (= res!753103 (arrayNoDuplicates!0 lt!500258 #b00000000000000000000000000000000 Nil!24735))))

(declare-fun b!1126966 () Bool)

(declare-fun e!641431 () Bool)

(assert (=> b!1126966 (= e!641433 e!641431)))

(declare-fun res!753102 () Bool)

(assert (=> b!1126966 (=> res!753102 e!641431)))

(assert (=> b!1126966 (= res!753102 (not (= from!1455 i!673)))))

(declare-fun lt!500254 () ListLongMap!15949)

(assert (=> b!1126966 (= lt!500254 (getCurrentListMapNoExtraKeys!4490 lt!500258 lt!500255 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2504 (Int (_ BitVec 64)) V!42905)

(assert (=> b!1126966 (= lt!500255 (array!73455 (store (arr!35380 _values!996) i!673 (ValueCellFull!13457 (dynLambda!2504 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35918 _values!996)))))

(declare-fun lt!500256 () ListLongMap!15949)

(assert (=> b!1126966 (= lt!500256 (getCurrentListMapNoExtraKeys!4490 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1126967 () Bool)

(assert (=> b!1126967 (= e!641436 e!641434)))

(declare-fun res!753110 () Bool)

(assert (=> b!1126967 (=> (not res!753110) (not e!641434))))

(assert (=> b!1126967 (= res!753110 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500258 mask!1564))))

(assert (=> b!1126967 (= lt!500258 (array!73453 (store (arr!35379 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35917 _keys!1208)))))

(declare-fun b!1126968 () Bool)

(assert (=> b!1126968 (= e!641431 e!641428)))

(declare-fun res!753112 () Bool)

(assert (=> b!1126968 (=> res!753112 e!641428)))

(assert (=> b!1126968 (= res!753112 (not (= (select (arr!35379 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1126968 e!641435))

(declare-fun c!109668 () Bool)

(assert (=> b!1126968 (= c!109668 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!500257 () Unit!36781)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!395 (array!73452 array!73454 (_ BitVec 32) (_ BitVec 32) V!42905 V!42905 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36781)

(assert (=> b!1126968 (= lt!500257 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!395 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126969 () Bool)

(assert (=> b!1126969 (= e!641427 tp_is_empty!28333)))

(declare-fun b!1126970 () Bool)

(declare-fun res!753111 () Bool)

(assert (=> b!1126970 (=> (not res!753111) (not e!641436))))

(assert (=> b!1126970 (= res!753111 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24735))))

(declare-fun bm!47666 () Bool)

(assert (=> bm!47666 (= call!47669 (getCurrentListMapNoExtraKeys!4490 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126971 () Bool)

(declare-fun res!753105 () Bool)

(assert (=> b!1126971 (=> (not res!753105) (not e!641436))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1126971 (= res!753105 (validMask!0 mask!1564))))

(assert (= (and start!98096 res!753106) b!1126971))

(assert (= (and b!1126971 res!753105) b!1126958))

(assert (= (and b!1126958 res!753107) b!1126962))

(assert (= (and b!1126962 res!753108) b!1126970))

(assert (= (and b!1126970 res!753111) b!1126960))

(assert (= (and b!1126960 res!753101) b!1126959))

(assert (= (and b!1126959 res!753100) b!1126954))

(assert (= (and b!1126954 res!753104) b!1126967))

(assert (= (and b!1126967 res!753110) b!1126965))

(assert (= (and b!1126965 res!753103) b!1126961))

(assert (= (and b!1126961 (not res!753109)) b!1126966))

(assert (= (and b!1126966 (not res!753102)) b!1126968))

(assert (= (and b!1126968 c!109668) b!1126964))

(assert (= (and b!1126968 (not c!109668)) b!1126957))

(assert (= (or b!1126964 b!1126957) bm!47665))

(assert (= (or b!1126964 b!1126957) bm!47666))

(assert (= (and b!1126968 (not res!753112)) b!1126956))

(assert (= (and b!1126963 condMapEmpty!44317) mapIsEmpty!44317))

(assert (= (and b!1126963 (not condMapEmpty!44317)) mapNonEmpty!44317))

(get-info :version)

(assert (= (and mapNonEmpty!44317 ((_ is ValueCellFull!13457) mapValue!44317)) b!1126955))

(assert (= (and b!1126963 ((_ is ValueCellFull!13457) mapDefault!44317)) b!1126969))

(assert (= start!98096 b!1126963))

(declare-fun b_lambda!18755 () Bool)

(assert (=> (not b_lambda!18755) (not b!1126966)))

(declare-fun t!35522 () Bool)

(declare-fun tb!8607 () Bool)

(assert (=> (and start!98096 (= defaultEntry!1004 defaultEntry!1004) t!35522) tb!8607))

(declare-fun result!17783 () Bool)

(assert (=> tb!8607 (= result!17783 tp_is_empty!28333)))

(assert (=> b!1126966 t!35522))

(declare-fun b_and!38369 () Bool)

(assert (= b_and!38367 (and (=> t!35522 result!17783) b_and!38369)))

(declare-fun m!1040295 () Bool)

(assert (=> b!1126956 m!1040295))

(assert (=> b!1126956 m!1040295))

(declare-fun m!1040297 () Bool)

(assert (=> b!1126956 m!1040297))

(declare-fun m!1040299 () Bool)

(assert (=> b!1126968 m!1040299))

(declare-fun m!1040301 () Bool)

(assert (=> b!1126968 m!1040301))

(declare-fun m!1040303 () Bool)

(assert (=> b!1126961 m!1040303))

(declare-fun m!1040305 () Bool)

(assert (=> b!1126961 m!1040305))

(declare-fun m!1040307 () Bool)

(assert (=> b!1126966 m!1040307))

(declare-fun m!1040309 () Bool)

(assert (=> b!1126966 m!1040309))

(declare-fun m!1040311 () Bool)

(assert (=> b!1126966 m!1040311))

(declare-fun m!1040313 () Bool)

(assert (=> b!1126966 m!1040313))

(declare-fun m!1040315 () Bool)

(assert (=> b!1126971 m!1040315))

(declare-fun m!1040317 () Bool)

(assert (=> bm!47665 m!1040317))

(declare-fun m!1040319 () Bool)

(assert (=> mapNonEmpty!44317 m!1040319))

(declare-fun m!1040321 () Bool)

(assert (=> b!1126967 m!1040321))

(declare-fun m!1040323 () Bool)

(assert (=> b!1126967 m!1040323))

(declare-fun m!1040325 () Bool)

(assert (=> b!1126962 m!1040325))

(assert (=> bm!47666 m!1040295))

(declare-fun m!1040327 () Bool)

(assert (=> start!98096 m!1040327))

(declare-fun m!1040329 () Bool)

(assert (=> start!98096 m!1040329))

(declare-fun m!1040331 () Bool)

(assert (=> b!1126965 m!1040331))

(declare-fun m!1040333 () Bool)

(assert (=> b!1126954 m!1040333))

(declare-fun m!1040335 () Bool)

(assert (=> b!1126970 m!1040335))

(declare-fun m!1040337 () Bool)

(assert (=> b!1126964 m!1040337))

(declare-fun m!1040339 () Bool)

(assert (=> b!1126959 m!1040339))

(check-sat (not b!1126956) (not b!1126968) tp_is_empty!28333 (not mapNonEmpty!44317) (not bm!47665) (not b!1126959) (not b!1126967) (not b!1126971) (not b!1126964) (not bm!47666) (not b_next!23803) (not b!1126965) (not b!1126961) (not start!98096) b_and!38369 (not b!1126970) (not b_lambda!18755) (not b!1126966) (not b!1126962))
(check-sat b_and!38369 (not b_next!23803))
