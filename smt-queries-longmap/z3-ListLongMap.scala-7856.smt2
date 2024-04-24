; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98116 () Bool)

(assert start!98116)

(declare-fun b_free!23581 () Bool)

(declare-fun b_next!23581 () Bool)

(assert (=> start!98116 (= b_free!23581 (not b_next!23581))))

(declare-fun tp!83446 () Bool)

(declare-fun b_and!37955 () Bool)

(assert (=> start!98116 (= tp!83446 b_and!37955)))

(declare-datatypes ((V!42609 0))(
  ( (V!42610 (val!14112 Int)) )
))
(declare-fun zeroValue!944 () V!42609)

(declare-datatypes ((ValueCell!13346 0))(
  ( (ValueCellFull!13346 (v!16741 V!42609)) (EmptyCell!13346) )
))
(declare-datatypes ((array!73151 0))(
  ( (array!73152 (arr!35222 (Array (_ BitVec 32) ValueCell!13346)) (size!35759 (_ BitVec 32))) )
))
(declare-fun lt!498638 () array!73151)

(declare-datatypes ((array!73153 0))(
  ( (array!73154 (arr!35223 (Array (_ BitVec 32) (_ BitVec 64))) (size!35760 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73153)

(declare-datatypes ((tuple2!17720 0))(
  ( (tuple2!17721 (_1!8871 (_ BitVec 64)) (_2!8871 V!42609)) )
))
(declare-datatypes ((List!24516 0))(
  ( (Nil!24513) (Cons!24512 (h!25730 tuple2!17720) (t!35081 List!24516)) )
))
(declare-datatypes ((ListLongMap!15697 0))(
  ( (ListLongMap!15698 (toList!7864 List!24516)) )
))
(declare-fun call!47093 () ListLongMap!15697)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!498635 () array!73153)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun _values!996 () array!73151)

(declare-fun minValue!944 () V!42609)

(declare-fun c!109772 () Bool)

(declare-fun bm!47089 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4394 (array!73153 array!73151 (_ BitVec 32) (_ BitVec 32) V!42609 V!42609 (_ BitVec 32) Int) ListLongMap!15697)

(assert (=> bm!47089 (= call!47093 (getCurrentListMapNoExtraKeys!4394 (ite c!109772 _keys!1208 lt!498635) (ite c!109772 _values!996 lt!498638) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122066 () Bool)

(declare-fun e!639013 () Bool)

(declare-fun e!639015 () Bool)

(assert (=> b!1122066 (= e!639013 (not e!639015))))

(declare-fun res!749237 () Bool)

(assert (=> b!1122066 (=> res!749237 e!639015)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1122066 (= res!749237 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73153 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1122066 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36761 0))(
  ( (Unit!36762) )
))
(declare-fun lt!498637 () Unit!36761)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73153 (_ BitVec 64) (_ BitVec 32)) Unit!36761)

(assert (=> b!1122066 (= lt!498637 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!43984 () Bool)

(declare-fun mapRes!43984 () Bool)

(declare-fun tp!83447 () Bool)

(declare-fun e!639016 () Bool)

(assert (=> mapNonEmpty!43984 (= mapRes!43984 (and tp!83447 e!639016))))

(declare-fun mapValue!43984 () ValueCell!13346)

(declare-fun mapRest!43984 () (Array (_ BitVec 32) ValueCell!13346))

(declare-fun mapKey!43984 () (_ BitVec 32))

(assert (=> mapNonEmpty!43984 (= (arr!35222 _values!996) (store mapRest!43984 mapKey!43984 mapValue!43984))))

(declare-fun e!639018 () Bool)

(declare-fun call!47092 () ListLongMap!15697)

(declare-fun b!1122067 () Bool)

(declare-fun -!1066 (ListLongMap!15697 (_ BitVec 64)) ListLongMap!15697)

(assert (=> b!1122067 (= e!639018 (= call!47092 (-!1066 call!47093 k0!934)))))

(declare-fun b!1122068 () Bool)

(declare-fun e!639019 () Bool)

(declare-fun e!639014 () Bool)

(assert (=> b!1122068 (= e!639019 (and e!639014 mapRes!43984))))

(declare-fun condMapEmpty!43984 () Bool)

(declare-fun mapDefault!43984 () ValueCell!13346)

(assert (=> b!1122068 (= condMapEmpty!43984 (= (arr!35222 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13346)) mapDefault!43984)))))

(declare-fun res!749239 () Bool)

(declare-fun e!639020 () Bool)

(assert (=> start!98116 (=> (not res!749239) (not e!639020))))

(assert (=> start!98116 (= res!749239 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35760 _keys!1208))))))

(assert (=> start!98116 e!639020))

(declare-fun tp_is_empty!28111 () Bool)

(assert (=> start!98116 tp_is_empty!28111))

(declare-fun array_inv!27116 (array!73153) Bool)

(assert (=> start!98116 (array_inv!27116 _keys!1208)))

(assert (=> start!98116 true))

(assert (=> start!98116 tp!83446))

(declare-fun array_inv!27117 (array!73151) Bool)

(assert (=> start!98116 (and (array_inv!27117 _values!996) e!639019)))

(declare-fun b!1122069 () Bool)

(declare-fun res!749234 () Bool)

(assert (=> b!1122069 (=> (not res!749234) (not e!639013))))

(declare-datatypes ((List!24517 0))(
  ( (Nil!24514) (Cons!24513 (h!25731 (_ BitVec 64)) (t!35082 List!24517)) )
))
(declare-fun arrayNoDuplicates!0 (array!73153 (_ BitVec 32) List!24517) Bool)

(assert (=> b!1122069 (= res!749234 (arrayNoDuplicates!0 lt!498635 #b00000000000000000000000000000000 Nil!24514))))

(declare-fun b!1122070 () Bool)

(assert (=> b!1122070 (= e!639020 e!639013)))

(declare-fun res!749235 () Bool)

(assert (=> b!1122070 (=> (not res!749235) (not e!639013))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73153 (_ BitVec 32)) Bool)

(assert (=> b!1122070 (= res!749235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498635 mask!1564))))

(assert (=> b!1122070 (= lt!498635 (array!73154 (store (arr!35223 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35760 _keys!1208)))))

(declare-fun b!1122071 () Bool)

(declare-fun res!749236 () Bool)

(assert (=> b!1122071 (=> (not res!749236) (not e!639020))))

(assert (=> b!1122071 (= res!749236 (and (= (size!35759 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35760 _keys!1208) (size!35759 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1122072 () Bool)

(declare-fun res!749244 () Bool)

(assert (=> b!1122072 (=> (not res!749244) (not e!639020))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1122072 (= res!749244 (validMask!0 mask!1564))))

(declare-fun b!1122073 () Bool)

(declare-fun res!749245 () Bool)

(assert (=> b!1122073 (=> (not res!749245) (not e!639020))))

(assert (=> b!1122073 (= res!749245 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24514))))

(declare-fun b!1122074 () Bool)

(declare-fun res!749242 () Bool)

(assert (=> b!1122074 (=> (not res!749242) (not e!639020))))

(assert (=> b!1122074 (= res!749242 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35760 _keys!1208))))))

(declare-fun b!1122075 () Bool)

(declare-fun res!749240 () Bool)

(assert (=> b!1122075 (=> (not res!749240) (not e!639020))))

(assert (=> b!1122075 (= res!749240 (= (select (arr!35223 _keys!1208) i!673) k0!934))))

(declare-fun b!1122076 () Bool)

(declare-fun e!639017 () Bool)

(assert (=> b!1122076 (= e!639015 e!639017)))

(declare-fun res!749241 () Bool)

(assert (=> b!1122076 (=> res!749241 e!639017)))

(assert (=> b!1122076 (= res!749241 (not (= from!1455 i!673)))))

(declare-fun lt!498639 () ListLongMap!15697)

(assert (=> b!1122076 (= lt!498639 (getCurrentListMapNoExtraKeys!4394 lt!498635 lt!498638 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2481 (Int (_ BitVec 64)) V!42609)

(assert (=> b!1122076 (= lt!498638 (array!73152 (store (arr!35222 _values!996) i!673 (ValueCellFull!13346 (dynLambda!2481 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35759 _values!996)))))

(declare-fun lt!498640 () ListLongMap!15697)

(assert (=> b!1122076 (= lt!498640 (getCurrentListMapNoExtraKeys!4394 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1122077 () Bool)

(assert (=> b!1122077 (= e!639018 (= call!47093 call!47092))))

(declare-fun b!1122078 () Bool)

(declare-fun res!749243 () Bool)

(assert (=> b!1122078 (=> (not res!749243) (not e!639020))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1122078 (= res!749243 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!43984 () Bool)

(assert (=> mapIsEmpty!43984 mapRes!43984))

(declare-fun b!1122079 () Bool)

(assert (=> b!1122079 (= e!639014 tp_is_empty!28111)))

(declare-fun b!1122080 () Bool)

(assert (=> b!1122080 (= e!639016 tp_is_empty!28111)))

(declare-fun bm!47090 () Bool)

(assert (=> bm!47090 (= call!47092 (getCurrentListMapNoExtraKeys!4394 (ite c!109772 lt!498635 _keys!1208) (ite c!109772 lt!498638 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122081 () Bool)

(assert (=> b!1122081 (= e!639017 true)))

(assert (=> b!1122081 e!639018))

(assert (=> b!1122081 (= c!109772 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!498636 () Unit!36761)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!329 (array!73153 array!73151 (_ BitVec 32) (_ BitVec 32) V!42609 V!42609 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36761)

(assert (=> b!1122081 (= lt!498636 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!329 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122082 () Bool)

(declare-fun res!749238 () Bool)

(assert (=> b!1122082 (=> (not res!749238) (not e!639020))))

(assert (=> b!1122082 (= res!749238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!98116 res!749239) b!1122072))

(assert (= (and b!1122072 res!749244) b!1122071))

(assert (= (and b!1122071 res!749236) b!1122082))

(assert (= (and b!1122082 res!749238) b!1122073))

(assert (= (and b!1122073 res!749245) b!1122074))

(assert (= (and b!1122074 res!749242) b!1122078))

(assert (= (and b!1122078 res!749243) b!1122075))

(assert (= (and b!1122075 res!749240) b!1122070))

(assert (= (and b!1122070 res!749235) b!1122069))

(assert (= (and b!1122069 res!749234) b!1122066))

(assert (= (and b!1122066 (not res!749237)) b!1122076))

(assert (= (and b!1122076 (not res!749241)) b!1122081))

(assert (= (and b!1122081 c!109772) b!1122067))

(assert (= (and b!1122081 (not c!109772)) b!1122077))

(assert (= (or b!1122067 b!1122077) bm!47089))

(assert (= (or b!1122067 b!1122077) bm!47090))

(assert (= (and b!1122068 condMapEmpty!43984) mapIsEmpty!43984))

(assert (= (and b!1122068 (not condMapEmpty!43984)) mapNonEmpty!43984))

(get-info :version)

(assert (= (and mapNonEmpty!43984 ((_ is ValueCellFull!13346) mapValue!43984)) b!1122080))

(assert (= (and b!1122068 ((_ is ValueCellFull!13346) mapDefault!43984)) b!1122079))

(assert (= start!98116 b!1122068))

(declare-fun b_lambda!18561 () Bool)

(assert (=> (not b_lambda!18561) (not b!1122076)))

(declare-fun t!35080 () Bool)

(declare-fun tb!8385 () Bool)

(assert (=> (and start!98116 (= defaultEntry!1004 defaultEntry!1004) t!35080) tb!8385))

(declare-fun result!17339 () Bool)

(assert (=> tb!8385 (= result!17339 tp_is_empty!28111)))

(assert (=> b!1122076 t!35080))

(declare-fun b_and!37957 () Bool)

(assert (= b_and!37955 (and (=> t!35080 result!17339) b_and!37957)))

(declare-fun m!1037397 () Bool)

(assert (=> b!1122070 m!1037397))

(declare-fun m!1037399 () Bool)

(assert (=> b!1122070 m!1037399))

(declare-fun m!1037401 () Bool)

(assert (=> b!1122073 m!1037401))

(declare-fun m!1037403 () Bool)

(assert (=> b!1122069 m!1037403))

(declare-fun m!1037405 () Bool)

(assert (=> b!1122066 m!1037405))

(declare-fun m!1037407 () Bool)

(assert (=> b!1122066 m!1037407))

(declare-fun m!1037409 () Bool)

(assert (=> b!1122067 m!1037409))

(declare-fun m!1037411 () Bool)

(assert (=> b!1122076 m!1037411))

(declare-fun m!1037413 () Bool)

(assert (=> b!1122076 m!1037413))

(declare-fun m!1037415 () Bool)

(assert (=> b!1122076 m!1037415))

(declare-fun m!1037417 () Bool)

(assert (=> b!1122076 m!1037417))

(declare-fun m!1037419 () Bool)

(assert (=> b!1122081 m!1037419))

(declare-fun m!1037421 () Bool)

(assert (=> mapNonEmpty!43984 m!1037421))

(declare-fun m!1037423 () Bool)

(assert (=> b!1122078 m!1037423))

(declare-fun m!1037425 () Bool)

(assert (=> bm!47089 m!1037425))

(declare-fun m!1037427 () Bool)

(assert (=> b!1122072 m!1037427))

(declare-fun m!1037429 () Bool)

(assert (=> bm!47090 m!1037429))

(declare-fun m!1037431 () Bool)

(assert (=> start!98116 m!1037431))

(declare-fun m!1037433 () Bool)

(assert (=> start!98116 m!1037433))

(declare-fun m!1037435 () Bool)

(assert (=> b!1122082 m!1037435))

(declare-fun m!1037437 () Bool)

(assert (=> b!1122075 m!1037437))

(check-sat (not b!1122070) tp_is_empty!28111 (not b_lambda!18561) (not bm!47090) (not start!98116) (not b!1122069) (not b!1122072) (not b_next!23581) (not b!1122066) (not mapNonEmpty!43984) (not bm!47089) (not b!1122076) (not b!1122073) (not b!1122067) (not b!1122082) b_and!37957 (not b!1122081) (not b!1122078))
(check-sat b_and!37957 (not b_next!23581))
