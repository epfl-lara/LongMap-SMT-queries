; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99688 () Bool)

(assert start!99688)

(declare-fun b_free!25273 () Bool)

(declare-fun b_next!25273 () Bool)

(assert (=> start!99688 (= b_free!25273 (not b_next!25273))))

(declare-fun tp!88532 () Bool)

(declare-fun b_and!41391 () Bool)

(assert (=> start!99688 (= tp!88532 b_and!41391)))

(declare-fun b!1182625 () Bool)

(declare-fun res!785986 () Bool)

(declare-fun e!672371 () Bool)

(assert (=> b!1182625 (=> (not res!785986) (not e!672371))))

(declare-datatypes ((array!76340 0))(
  ( (array!76341 (arr!36820 (Array (_ BitVec 32) (_ BitVec 64))) (size!37358 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76340)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76340 (_ BitVec 32)) Bool)

(assert (=> b!1182625 (= res!785986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1182626 () Bool)

(declare-fun res!785991 () Bool)

(assert (=> b!1182626 (=> (not res!785991) (not e!672371))))

(declare-datatypes ((List!25988 0))(
  ( (Nil!25985) (Cons!25984 (h!27193 (_ BitVec 64)) (t!38244 List!25988)) )
))
(declare-fun arrayNoDuplicates!0 (array!76340 (_ BitVec 32) List!25988) Bool)

(assert (=> b!1182626 (= res!785991 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25985))))

(declare-fun b!1182627 () Bool)

(declare-fun e!672376 () Bool)

(declare-fun tp_is_empty!29803 () Bool)

(assert (=> b!1182627 (= e!672376 tp_is_empty!29803)))

(declare-fun b!1182628 () Bool)

(declare-fun res!785984 () Bool)

(assert (=> b!1182628 (=> (not res!785984) (not e!672371))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1182628 (= res!785984 (validMask!0 mask!1564))))

(declare-fun b!1182629 () Bool)

(declare-fun res!785987 () Bool)

(declare-fun e!672368 () Bool)

(assert (=> b!1182629 (=> (not res!785987) (not e!672368))))

(declare-fun lt!535345 () array!76340)

(assert (=> b!1182629 (= res!785987 (arrayNoDuplicates!0 lt!535345 #b00000000000000000000000000000000 Nil!25985))))

(declare-fun b!1182630 () Bool)

(declare-fun res!785992 () Bool)

(assert (=> b!1182630 (=> (not res!785992) (not e!672371))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!44865 0))(
  ( (V!44866 (val!14958 Int)) )
))
(declare-datatypes ((ValueCell!14192 0))(
  ( (ValueCellFull!14192 (v!17595 V!44865)) (EmptyCell!14192) )
))
(declare-datatypes ((array!76342 0))(
  ( (array!76343 (arr!36821 (Array (_ BitVec 32) ValueCell!14192)) (size!37359 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76342)

(assert (=> b!1182630 (= res!785992 (and (= (size!37359 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37358 _keys!1208) (size!37359 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1182631 () Bool)

(declare-fun res!785982 () Bool)

(assert (=> b!1182631 (=> (not res!785982) (not e!672371))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1182631 (= res!785982 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37358 _keys!1208))))))

(declare-fun b!1182632 () Bool)

(assert (=> b!1182632 (= e!672371 e!672368)))

(declare-fun res!785985 () Bool)

(assert (=> b!1182632 (=> (not res!785985) (not e!672368))))

(assert (=> b!1182632 (= res!785985 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!535345 mask!1564))))

(assert (=> b!1182632 (= lt!535345 (array!76341 (store (arr!36820 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37358 _keys!1208)))))

(declare-fun b!1182633 () Bool)

(declare-fun e!672365 () Bool)

(assert (=> b!1182633 (= e!672365 tp_is_empty!29803)))

(declare-fun b!1182634 () Bool)

(declare-fun e!672375 () Bool)

(declare-fun e!672370 () Bool)

(assert (=> b!1182634 (= e!672375 e!672370)))

(declare-fun res!785983 () Bool)

(assert (=> b!1182634 (=> res!785983 e!672370)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1182634 (= res!785983 (not (= (select (arr!36820 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1182635 () Bool)

(declare-fun e!672372 () Bool)

(declare-fun e!672366 () Bool)

(assert (=> b!1182635 (= e!672372 e!672366)))

(declare-fun res!785981 () Bool)

(assert (=> b!1182635 (=> res!785981 e!672366)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1182635 (= res!785981 (not (validKeyInArray!0 (select (arr!36820 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19282 0))(
  ( (tuple2!19283 (_1!9652 (_ BitVec 64)) (_2!9652 V!44865)) )
))
(declare-datatypes ((List!25989 0))(
  ( (Nil!25986) (Cons!25985 (h!27194 tuple2!19282) (t!38245 List!25989)) )
))
(declare-datatypes ((ListLongMap!17251 0))(
  ( (ListLongMap!17252 (toList!8641 List!25989)) )
))
(declare-fun lt!535343 () ListLongMap!17251)

(declare-fun lt!535356 () ListLongMap!17251)

(assert (=> b!1182635 (= lt!535343 lt!535356)))

(declare-fun lt!535354 () ListLongMap!17251)

(declare-fun -!1598 (ListLongMap!17251 (_ BitVec 64)) ListLongMap!17251)

(assert (=> b!1182635 (= lt!535356 (-!1598 lt!535354 k0!934))))

(declare-fun zeroValue!944 () V!44865)

(declare-fun lt!535359 () array!76342)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44865)

(declare-fun getCurrentListMapNoExtraKeys!5096 (array!76340 array!76342 (_ BitVec 32) (_ BitVec 32) V!44865 V!44865 (_ BitVec 32) Int) ListLongMap!17251)

(assert (=> b!1182635 (= lt!535343 (getCurrentListMapNoExtraKeys!5096 lt!535345 lt!535359 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1182635 (= lt!535354 (getCurrentListMapNoExtraKeys!5096 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38984 0))(
  ( (Unit!38985) )
))
(declare-fun lt!535349 () Unit!38984)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!860 (array!76340 array!76342 (_ BitVec 32) (_ BitVec 32) V!44865 V!44865 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38984)

(assert (=> b!1182635 (= lt!535349 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!860 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1182636 () Bool)

(declare-fun res!785978 () Bool)

(assert (=> b!1182636 (=> (not res!785978) (not e!672371))))

(assert (=> b!1182636 (= res!785978 (= (select (arr!36820 _keys!1208) i!673) k0!934))))

(declare-fun b!1182638 () Bool)

(declare-fun e!672373 () Bool)

(assert (=> b!1182638 (= e!672368 (not e!672373))))

(declare-fun res!785979 () Bool)

(assert (=> b!1182638 (=> res!785979 e!672373)))

(assert (=> b!1182638 (= res!785979 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76340 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1182638 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!535358 () Unit!38984)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76340 (_ BitVec 64) (_ BitVec 32)) Unit!38984)

(assert (=> b!1182638 (= lt!535358 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1182639 () Bool)

(assert (=> b!1182639 (= e!672370 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1182640 () Bool)

(assert (=> b!1182640 (= e!672373 e!672372)))

(declare-fun res!785988 () Bool)

(assert (=> b!1182640 (=> res!785988 e!672372)))

(assert (=> b!1182640 (= res!785988 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!535350 () ListLongMap!17251)

(assert (=> b!1182640 (= lt!535350 (getCurrentListMapNoExtraKeys!5096 lt!535345 lt!535359 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!535348 () V!44865)

(assert (=> b!1182640 (= lt!535359 (array!76343 (store (arr!36821 _values!996) i!673 (ValueCellFull!14192 lt!535348)) (size!37359 _values!996)))))

(declare-fun dynLambda!3002 (Int (_ BitVec 64)) V!44865)

(assert (=> b!1182640 (= lt!535348 (dynLambda!3002 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!535346 () ListLongMap!17251)

(assert (=> b!1182640 (= lt!535346 (getCurrentListMapNoExtraKeys!5096 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1182641 () Bool)

(declare-fun res!785980 () Bool)

(assert (=> b!1182641 (=> (not res!785980) (not e!672371))))

(assert (=> b!1182641 (= res!785980 (validKeyInArray!0 k0!934))))

(declare-fun b!1182642 () Bool)

(declare-fun e!672367 () Unit!38984)

(declare-fun Unit!38986 () Unit!38984)

(assert (=> b!1182642 (= e!672367 Unit!38986)))

(declare-fun b!1182643 () Bool)

(declare-fun Unit!38987 () Unit!38984)

(assert (=> b!1182643 (= e!672367 Unit!38987)))

(declare-fun lt!535355 () Unit!38984)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76340 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38984)

(assert (=> b!1182643 (= lt!535355 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1182643 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!535341 () Unit!38984)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76340 (_ BitVec 32) (_ BitVec 32)) Unit!38984)

(assert (=> b!1182643 (= lt!535341 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1182643 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25985)))

(declare-fun lt!535344 () Unit!38984)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76340 (_ BitVec 64) (_ BitVec 32) List!25988) Unit!38984)

(assert (=> b!1182643 (= lt!535344 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25985))))

(assert (=> b!1182643 false))

(declare-fun b!1182644 () Bool)

(assert (=> b!1182644 (= e!672366 true)))

(declare-fun lt!535352 () ListLongMap!17251)

(declare-fun lt!535342 () ListLongMap!17251)

(assert (=> b!1182644 (= (-!1598 lt!535352 k0!934) lt!535342)))

(declare-fun lt!535351 () Unit!38984)

(declare-fun lt!535353 () V!44865)

(declare-fun addRemoveCommutativeForDiffKeys!146 (ListLongMap!17251 (_ BitVec 64) V!44865 (_ BitVec 64)) Unit!38984)

(assert (=> b!1182644 (= lt!535351 (addRemoveCommutativeForDiffKeys!146 lt!535354 (select (arr!36820 _keys!1208) from!1455) lt!535353 k0!934))))

(assert (=> b!1182644 (and (= lt!535346 lt!535352) (= lt!535356 lt!535343))))

(declare-fun lt!535357 () tuple2!19282)

(declare-fun +!3932 (ListLongMap!17251 tuple2!19282) ListLongMap!17251)

(assert (=> b!1182644 (= lt!535352 (+!3932 lt!535354 lt!535357))))

(assert (=> b!1182644 (not (= (select (arr!36820 _keys!1208) from!1455) k0!934))))

(declare-fun lt!535347 () Unit!38984)

(assert (=> b!1182644 (= lt!535347 e!672367)))

(declare-fun c!117007 () Bool)

(assert (=> b!1182644 (= c!117007 (= (select (arr!36820 _keys!1208) from!1455) k0!934))))

(assert (=> b!1182644 e!672375))

(declare-fun res!785990 () Bool)

(assert (=> b!1182644 (=> (not res!785990) (not e!672375))))

(assert (=> b!1182644 (= res!785990 (= lt!535350 lt!535342))))

(assert (=> b!1182644 (= lt!535342 (+!3932 lt!535356 lt!535357))))

(assert (=> b!1182644 (= lt!535357 (tuple2!19283 (select (arr!36820 _keys!1208) from!1455) lt!535353))))

(declare-fun get!18845 (ValueCell!14192 V!44865) V!44865)

(assert (=> b!1182644 (= lt!535353 (get!18845 (select (arr!36821 _values!996) from!1455) lt!535348))))

(declare-fun mapIsEmpty!46532 () Bool)

(declare-fun mapRes!46532 () Bool)

(assert (=> mapIsEmpty!46532 mapRes!46532))

(declare-fun mapNonEmpty!46532 () Bool)

(declare-fun tp!88533 () Bool)

(assert (=> mapNonEmpty!46532 (= mapRes!46532 (and tp!88533 e!672365))))

(declare-fun mapValue!46532 () ValueCell!14192)

(declare-fun mapKey!46532 () (_ BitVec 32))

(declare-fun mapRest!46532 () (Array (_ BitVec 32) ValueCell!14192))

(assert (=> mapNonEmpty!46532 (= (arr!36821 _values!996) (store mapRest!46532 mapKey!46532 mapValue!46532))))

(declare-fun res!785989 () Bool)

(assert (=> start!99688 (=> (not res!785989) (not e!672371))))

(assert (=> start!99688 (= res!785989 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37358 _keys!1208))))))

(assert (=> start!99688 e!672371))

(assert (=> start!99688 tp_is_empty!29803))

(declare-fun array_inv!28218 (array!76340) Bool)

(assert (=> start!99688 (array_inv!28218 _keys!1208)))

(assert (=> start!99688 true))

(assert (=> start!99688 tp!88532))

(declare-fun e!672369 () Bool)

(declare-fun array_inv!28219 (array!76342) Bool)

(assert (=> start!99688 (and (array_inv!28219 _values!996) e!672369)))

(declare-fun b!1182637 () Bool)

(assert (=> b!1182637 (= e!672369 (and e!672376 mapRes!46532))))

(declare-fun condMapEmpty!46532 () Bool)

(declare-fun mapDefault!46532 () ValueCell!14192)

(assert (=> b!1182637 (= condMapEmpty!46532 (= (arr!36821 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14192)) mapDefault!46532)))))

(assert (= (and start!99688 res!785989) b!1182628))

(assert (= (and b!1182628 res!785984) b!1182630))

(assert (= (and b!1182630 res!785992) b!1182625))

(assert (= (and b!1182625 res!785986) b!1182626))

(assert (= (and b!1182626 res!785991) b!1182631))

(assert (= (and b!1182631 res!785982) b!1182641))

(assert (= (and b!1182641 res!785980) b!1182636))

(assert (= (and b!1182636 res!785978) b!1182632))

(assert (= (and b!1182632 res!785985) b!1182629))

(assert (= (and b!1182629 res!785987) b!1182638))

(assert (= (and b!1182638 (not res!785979)) b!1182640))

(assert (= (and b!1182640 (not res!785988)) b!1182635))

(assert (= (and b!1182635 (not res!785981)) b!1182644))

(assert (= (and b!1182644 res!785990) b!1182634))

(assert (= (and b!1182634 (not res!785983)) b!1182639))

(assert (= (and b!1182644 c!117007) b!1182643))

(assert (= (and b!1182644 (not c!117007)) b!1182642))

(assert (= (and b!1182637 condMapEmpty!46532) mapIsEmpty!46532))

(assert (= (and b!1182637 (not condMapEmpty!46532)) mapNonEmpty!46532))

(get-info :version)

(assert (= (and mapNonEmpty!46532 ((_ is ValueCellFull!14192) mapValue!46532)) b!1182633))

(assert (= (and b!1182637 ((_ is ValueCellFull!14192) mapDefault!46532)) b!1182627))

(assert (= start!99688 b!1182637))

(declare-fun b_lambda!20399 () Bool)

(assert (=> (not b_lambda!20399) (not b!1182640)))

(declare-fun t!38243 () Bool)

(declare-fun tb!10077 () Bool)

(assert (=> (and start!99688 (= defaultEntry!1004 defaultEntry!1004) t!38243) tb!10077))

(declare-fun result!20729 () Bool)

(assert (=> tb!10077 (= result!20729 tp_is_empty!29803)))

(assert (=> b!1182640 t!38243))

(declare-fun b_and!41393 () Bool)

(assert (= b_and!41391 (and (=> t!38243 result!20729) b_and!41393)))

(declare-fun m!1090205 () Bool)

(assert (=> b!1182625 m!1090205))

(declare-fun m!1090207 () Bool)

(assert (=> b!1182638 m!1090207))

(declare-fun m!1090209 () Bool)

(assert (=> b!1182638 m!1090209))

(declare-fun m!1090211 () Bool)

(assert (=> b!1182644 m!1090211))

(assert (=> b!1182644 m!1090211))

(declare-fun m!1090213 () Bool)

(assert (=> b!1182644 m!1090213))

(declare-fun m!1090215 () Bool)

(assert (=> b!1182644 m!1090215))

(declare-fun m!1090217 () Bool)

(assert (=> b!1182644 m!1090217))

(declare-fun m!1090219 () Bool)

(assert (=> b!1182644 m!1090219))

(declare-fun m!1090221 () Bool)

(assert (=> b!1182644 m!1090221))

(declare-fun m!1090223 () Bool)

(assert (=> b!1182644 m!1090223))

(assert (=> b!1182644 m!1090221))

(declare-fun m!1090225 () Bool)

(assert (=> b!1182641 m!1090225))

(declare-fun m!1090227 () Bool)

(assert (=> b!1182639 m!1090227))

(declare-fun m!1090229 () Bool)

(assert (=> b!1182632 m!1090229))

(declare-fun m!1090231 () Bool)

(assert (=> b!1182632 m!1090231))

(declare-fun m!1090233 () Bool)

(assert (=> b!1182636 m!1090233))

(declare-fun m!1090235 () Bool)

(assert (=> b!1182640 m!1090235))

(declare-fun m!1090237 () Bool)

(assert (=> b!1182640 m!1090237))

(declare-fun m!1090239 () Bool)

(assert (=> b!1182640 m!1090239))

(declare-fun m!1090241 () Bool)

(assert (=> b!1182640 m!1090241))

(declare-fun m!1090243 () Bool)

(assert (=> mapNonEmpty!46532 m!1090243))

(declare-fun m!1090245 () Bool)

(assert (=> start!99688 m!1090245))

(declare-fun m!1090247 () Bool)

(assert (=> start!99688 m!1090247))

(declare-fun m!1090249 () Bool)

(assert (=> b!1182628 m!1090249))

(declare-fun m!1090251 () Bool)

(assert (=> b!1182635 m!1090251))

(declare-fun m!1090253 () Bool)

(assert (=> b!1182635 m!1090253))

(declare-fun m!1090255 () Bool)

(assert (=> b!1182635 m!1090255))

(assert (=> b!1182635 m!1090221))

(declare-fun m!1090257 () Bool)

(assert (=> b!1182635 m!1090257))

(declare-fun m!1090259 () Bool)

(assert (=> b!1182635 m!1090259))

(assert (=> b!1182635 m!1090221))

(declare-fun m!1090261 () Bool)

(assert (=> b!1182626 m!1090261))

(assert (=> b!1182634 m!1090221))

(declare-fun m!1090263 () Bool)

(assert (=> b!1182629 m!1090263))

(declare-fun m!1090265 () Bool)

(assert (=> b!1182643 m!1090265))

(declare-fun m!1090267 () Bool)

(assert (=> b!1182643 m!1090267))

(declare-fun m!1090269 () Bool)

(assert (=> b!1182643 m!1090269))

(declare-fun m!1090271 () Bool)

(assert (=> b!1182643 m!1090271))

(declare-fun m!1090273 () Bool)

(assert (=> b!1182643 m!1090273))

(check-sat (not b_next!25273) tp_is_empty!29803 (not b!1182635) (not b!1182640) b_and!41393 (not b!1182625) (not b!1182643) (not b_lambda!20399) (not b!1182632) (not start!99688) (not b!1182629) (not b!1182628) (not b!1182638) (not b!1182641) (not b!1182639) (not mapNonEmpty!46532) (not b!1182644) (not b!1182626))
(check-sat b_and!41393 (not b_next!25273))
