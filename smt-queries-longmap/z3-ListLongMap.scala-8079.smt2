; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99342 () Bool)

(assert start!99342)

(declare-fun b_free!24921 () Bool)

(declare-fun b_next!24921 () Bool)

(assert (=> start!99342 (= b_free!24921 (not b_next!24921))))

(declare-fun tp!87476 () Bool)

(declare-fun b_and!40709 () Bool)

(assert (=> start!99342 (= tp!87476 b_and!40709)))

(declare-fun b!1171380 () Bool)

(declare-fun e!665807 () Bool)

(declare-fun e!665798 () Bool)

(assert (=> b!1171380 (= e!665807 e!665798)))

(declare-fun res!777564 () Bool)

(assert (=> b!1171380 (=> res!777564 e!665798)))

(declare-datatypes ((array!75721 0))(
  ( (array!75722 (arr!36510 (Array (_ BitVec 32) (_ BitVec 64))) (size!37046 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75721)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1171380 (= res!777564 (or (bvsge (size!37046 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!37046 _keys!1208)) (bvsge from!1455 (size!37046 _keys!1208))))))

(declare-datatypes ((List!25620 0))(
  ( (Nil!25617) (Cons!25616 (h!26825 (_ BitVec 64)) (t!37533 List!25620)) )
))
(declare-fun arrayNoDuplicates!0 (array!75721 (_ BitVec 32) List!25620) Bool)

(assert (=> b!1171380 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25617)))

(declare-datatypes ((Unit!38636 0))(
  ( (Unit!38637) )
))
(declare-fun lt!527667 () Unit!38636)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75721 (_ BitVec 32) (_ BitVec 32)) Unit!38636)

(assert (=> b!1171380 (= lt!527667 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75721 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1171380 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!527669 () Unit!38636)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75721 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38636)

(assert (=> b!1171380 (= lt!527669 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1171381 () Bool)

(declare-fun res!777561 () Bool)

(declare-fun e!665797 () Bool)

(assert (=> b!1171381 (=> (not res!777561) (not e!665797))))

(assert (=> b!1171381 (= res!777561 (= (select (arr!36510 _keys!1208) i!673) k0!934))))

(declare-fun b!1171382 () Bool)

(declare-fun e!665806 () Bool)

(assert (=> b!1171382 (= e!665806 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1171383 () Bool)

(declare-fun e!665808 () Bool)

(declare-fun e!665799 () Bool)

(declare-fun mapRes!46004 () Bool)

(assert (=> b!1171383 (= e!665808 (and e!665799 mapRes!46004))))

(declare-fun condMapEmpty!46004 () Bool)

(declare-datatypes ((V!44395 0))(
  ( (V!44396 (val!14782 Int)) )
))
(declare-datatypes ((ValueCell!14016 0))(
  ( (ValueCellFull!14016 (v!17420 V!44395)) (EmptyCell!14016) )
))
(declare-datatypes ((array!75723 0))(
  ( (array!75724 (arr!36511 (Array (_ BitVec 32) ValueCell!14016)) (size!37047 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75723)

(declare-fun mapDefault!46004 () ValueCell!14016)

(assert (=> b!1171383 (= condMapEmpty!46004 (= (arr!36511 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14016)) mapDefault!46004)))))

(declare-fun b!1171384 () Bool)

(declare-fun res!777567 () Bool)

(assert (=> b!1171384 (=> (not res!777567) (not e!665797))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1171384 (= res!777567 (validMask!0 mask!1564))))

(declare-fun b!1171385 () Bool)

(assert (=> b!1171385 (= e!665798 true)))

(declare-fun lt!527677 () Bool)

(declare-fun contains!6847 (List!25620 (_ BitVec 64)) Bool)

(assert (=> b!1171385 (= lt!527677 (contains!6847 Nil!25617 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!46004 () Bool)

(declare-fun tp!87477 () Bool)

(declare-fun e!665809 () Bool)

(assert (=> mapNonEmpty!46004 (= mapRes!46004 (and tp!87477 e!665809))))

(declare-fun mapKey!46004 () (_ BitVec 32))

(declare-fun mapRest!46004 () (Array (_ BitVec 32) ValueCell!14016))

(declare-fun mapValue!46004 () ValueCell!14016)

(assert (=> mapNonEmpty!46004 (= (arr!36511 _values!996) (store mapRest!46004 mapKey!46004 mapValue!46004))))

(declare-fun b!1171386 () Bool)

(declare-fun res!777568 () Bool)

(assert (=> b!1171386 (=> (not res!777568) (not e!665797))))

(assert (=> b!1171386 (= res!777568 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25617))))

(declare-fun b!1171387 () Bool)

(declare-fun res!777566 () Bool)

(assert (=> b!1171387 (=> (not res!777566) (not e!665797))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1171387 (= res!777566 (and (= (size!37047 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37046 _keys!1208) (size!37047 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1171388 () Bool)

(declare-fun res!777565 () Bool)

(assert (=> b!1171388 (=> (not res!777565) (not e!665797))))

(assert (=> b!1171388 (= res!777565 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37046 _keys!1208))))))

(declare-fun b!1171389 () Bool)

(declare-fun res!777558 () Bool)

(declare-fun e!665805 () Bool)

(assert (=> b!1171389 (=> (not res!777558) (not e!665805))))

(declare-fun lt!527678 () array!75721)

(assert (=> b!1171389 (= res!777558 (arrayNoDuplicates!0 lt!527678 #b00000000000000000000000000000000 Nil!25617))))

(declare-fun b!1171390 () Bool)

(declare-fun e!665804 () Bool)

(declare-fun e!665802 () Bool)

(assert (=> b!1171390 (= e!665804 e!665802)))

(declare-fun res!777550 () Bool)

(assert (=> b!1171390 (=> res!777550 e!665802)))

(assert (=> b!1171390 (= res!777550 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((tuple2!18884 0))(
  ( (tuple2!18885 (_1!9453 (_ BitVec 64)) (_2!9453 V!44395)) )
))
(declare-datatypes ((List!25621 0))(
  ( (Nil!25618) (Cons!25617 (h!26826 tuple2!18884) (t!37534 List!25621)) )
))
(declare-datatypes ((ListLongMap!16853 0))(
  ( (ListLongMap!16854 (toList!8442 List!25621)) )
))
(declare-fun lt!527672 () ListLongMap!16853)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44395)

(declare-fun zeroValue!944 () V!44395)

(declare-fun lt!527676 () array!75723)

(declare-fun getCurrentListMapNoExtraKeys!4906 (array!75721 array!75723 (_ BitVec 32) (_ BitVec 32) V!44395 V!44395 (_ BitVec 32) Int) ListLongMap!16853)

(assert (=> b!1171390 (= lt!527672 (getCurrentListMapNoExtraKeys!4906 lt!527678 lt!527676 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!527674 () V!44395)

(assert (=> b!1171390 (= lt!527676 (array!75724 (store (arr!36511 _values!996) i!673 (ValueCellFull!14016 lt!527674)) (size!37047 _values!996)))))

(declare-fun dynLambda!2879 (Int (_ BitVec 64)) V!44395)

(assert (=> b!1171390 (= lt!527674 (dynLambda!2879 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!527668 () ListLongMap!16853)

(assert (=> b!1171390 (= lt!527668 (getCurrentListMapNoExtraKeys!4906 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1171379 () Bool)

(declare-fun res!777553 () Bool)

(assert (=> b!1171379 (=> (not res!777553) (not e!665797))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75721 (_ BitVec 32)) Bool)

(assert (=> b!1171379 (= res!777553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!777563 () Bool)

(assert (=> start!99342 (=> (not res!777563) (not e!665797))))

(assert (=> start!99342 (= res!777563 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37046 _keys!1208))))))

(assert (=> start!99342 e!665797))

(declare-fun tp_is_empty!29451 () Bool)

(assert (=> start!99342 tp_is_empty!29451))

(declare-fun array_inv!27902 (array!75721) Bool)

(assert (=> start!99342 (array_inv!27902 _keys!1208)))

(assert (=> start!99342 true))

(assert (=> start!99342 tp!87476))

(declare-fun array_inv!27903 (array!75723) Bool)

(assert (=> start!99342 (and (array_inv!27903 _values!996) e!665808)))

(declare-fun b!1171391 () Bool)

(declare-fun e!665803 () Bool)

(assert (=> b!1171391 (= e!665803 e!665807)))

(declare-fun res!777562 () Bool)

(assert (=> b!1171391 (=> res!777562 e!665807)))

(assert (=> b!1171391 (= res!777562 (not (= (select (arr!36510 _keys!1208) from!1455) k0!934)))))

(declare-fun e!665800 () Bool)

(assert (=> b!1171391 e!665800))

(declare-fun res!777556 () Bool)

(assert (=> b!1171391 (=> (not res!777556) (not e!665800))))

(declare-fun lt!527673 () ListLongMap!16853)

(declare-fun +!3768 (ListLongMap!16853 tuple2!18884) ListLongMap!16853)

(declare-fun get!18622 (ValueCell!14016 V!44395) V!44395)

(assert (=> b!1171391 (= res!777556 (= lt!527672 (+!3768 lt!527673 (tuple2!18885 (select (arr!36510 _keys!1208) from!1455) (get!18622 (select (arr!36511 _values!996) from!1455) lt!527674)))))))

(declare-fun b!1171392 () Bool)

(declare-fun res!777554 () Bool)

(assert (=> b!1171392 (=> res!777554 e!665798)))

(declare-fun noDuplicate!1608 (List!25620) Bool)

(assert (=> b!1171392 (= res!777554 (not (noDuplicate!1608 Nil!25617)))))

(declare-fun b!1171393 () Bool)

(assert (=> b!1171393 (= e!665799 tp_is_empty!29451)))

(declare-fun b!1171394 () Bool)

(assert (=> b!1171394 (= e!665805 (not e!665804))))

(declare-fun res!777557 () Bool)

(assert (=> b!1171394 (=> res!777557 e!665804)))

(assert (=> b!1171394 (= res!777557 (bvsgt from!1455 i!673))))

(assert (=> b!1171394 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!527679 () Unit!38636)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75721 (_ BitVec 64) (_ BitVec 32)) Unit!38636)

(assert (=> b!1171394 (= lt!527679 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1171395 () Bool)

(assert (=> b!1171395 (= e!665800 e!665806)))

(declare-fun res!777551 () Bool)

(assert (=> b!1171395 (=> res!777551 e!665806)))

(assert (=> b!1171395 (= res!777551 (not (= (select (arr!36510 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1171396 () Bool)

(declare-fun res!777559 () Bool)

(assert (=> b!1171396 (=> res!777559 e!665798)))

(assert (=> b!1171396 (= res!777559 (contains!6847 Nil!25617 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1171397 () Bool)

(declare-fun res!777555 () Bool)

(assert (=> b!1171397 (=> (not res!777555) (not e!665797))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1171397 (= res!777555 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!46004 () Bool)

(assert (=> mapIsEmpty!46004 mapRes!46004))

(declare-fun b!1171398 () Bool)

(assert (=> b!1171398 (= e!665797 e!665805)))

(declare-fun res!777560 () Bool)

(assert (=> b!1171398 (=> (not res!777560) (not e!665805))))

(assert (=> b!1171398 (= res!777560 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!527678 mask!1564))))

(assert (=> b!1171398 (= lt!527678 (array!75722 (store (arr!36510 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37046 _keys!1208)))))

(declare-fun b!1171399 () Bool)

(assert (=> b!1171399 (= e!665809 tp_is_empty!29451)))

(declare-fun b!1171400 () Bool)

(assert (=> b!1171400 (= e!665802 e!665803)))

(declare-fun res!777552 () Bool)

(assert (=> b!1171400 (=> res!777552 e!665803)))

(assert (=> b!1171400 (= res!777552 (not (validKeyInArray!0 (select (arr!36510 _keys!1208) from!1455))))))

(declare-fun lt!527671 () ListLongMap!16853)

(assert (=> b!1171400 (= lt!527671 lt!527673)))

(declare-fun lt!527670 () ListLongMap!16853)

(declare-fun -!1511 (ListLongMap!16853 (_ BitVec 64)) ListLongMap!16853)

(assert (=> b!1171400 (= lt!527673 (-!1511 lt!527670 k0!934))))

(assert (=> b!1171400 (= lt!527671 (getCurrentListMapNoExtraKeys!4906 lt!527678 lt!527676 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1171400 (= lt!527670 (getCurrentListMapNoExtraKeys!4906 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!527675 () Unit!38636)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!738 (array!75721 array!75723 (_ BitVec 32) (_ BitVec 32) V!44395 V!44395 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38636)

(assert (=> b!1171400 (= lt!527675 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!738 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!99342 res!777563) b!1171384))

(assert (= (and b!1171384 res!777567) b!1171387))

(assert (= (and b!1171387 res!777566) b!1171379))

(assert (= (and b!1171379 res!777553) b!1171386))

(assert (= (and b!1171386 res!777568) b!1171388))

(assert (= (and b!1171388 res!777565) b!1171397))

(assert (= (and b!1171397 res!777555) b!1171381))

(assert (= (and b!1171381 res!777561) b!1171398))

(assert (= (and b!1171398 res!777560) b!1171389))

(assert (= (and b!1171389 res!777558) b!1171394))

(assert (= (and b!1171394 (not res!777557)) b!1171390))

(assert (= (and b!1171390 (not res!777550)) b!1171400))

(assert (= (and b!1171400 (not res!777552)) b!1171391))

(assert (= (and b!1171391 res!777556) b!1171395))

(assert (= (and b!1171395 (not res!777551)) b!1171382))

(assert (= (and b!1171391 (not res!777562)) b!1171380))

(assert (= (and b!1171380 (not res!777564)) b!1171392))

(assert (= (and b!1171392 (not res!777554)) b!1171396))

(assert (= (and b!1171396 (not res!777559)) b!1171385))

(assert (= (and b!1171383 condMapEmpty!46004) mapIsEmpty!46004))

(assert (= (and b!1171383 (not condMapEmpty!46004)) mapNonEmpty!46004))

(get-info :version)

(assert (= (and mapNonEmpty!46004 ((_ is ValueCellFull!14016) mapValue!46004)) b!1171399))

(assert (= (and b!1171383 ((_ is ValueCellFull!14016) mapDefault!46004)) b!1171393))

(assert (= start!99342 b!1171383))

(declare-fun b_lambda!20065 () Bool)

(assert (=> (not b_lambda!20065) (not b!1171390)))

(declare-fun t!37532 () Bool)

(declare-fun tb!9733 () Bool)

(assert (=> (and start!99342 (= defaultEntry!1004 defaultEntry!1004) t!37532) tb!9733))

(declare-fun result!20033 () Bool)

(assert (=> tb!9733 (= result!20033 tp_is_empty!29451)))

(assert (=> b!1171390 t!37532))

(declare-fun b_and!40711 () Bool)

(assert (= b_and!40709 (and (=> t!37532 result!20033) b_and!40711)))

(declare-fun m!1079195 () Bool)

(assert (=> b!1171379 m!1079195))

(declare-fun m!1079197 () Bool)

(assert (=> b!1171384 m!1079197))

(declare-fun m!1079199 () Bool)

(assert (=> start!99342 m!1079199))

(declare-fun m!1079201 () Bool)

(assert (=> start!99342 m!1079201))

(declare-fun m!1079203 () Bool)

(assert (=> b!1171381 m!1079203))

(declare-fun m!1079205 () Bool)

(assert (=> b!1171392 m!1079205))

(declare-fun m!1079207 () Bool)

(assert (=> b!1171391 m!1079207))

(declare-fun m!1079209 () Bool)

(assert (=> b!1171391 m!1079209))

(assert (=> b!1171391 m!1079209))

(declare-fun m!1079211 () Bool)

(assert (=> b!1171391 m!1079211))

(declare-fun m!1079213 () Bool)

(assert (=> b!1171391 m!1079213))

(declare-fun m!1079215 () Bool)

(assert (=> b!1171386 m!1079215))

(declare-fun m!1079217 () Bool)

(assert (=> b!1171400 m!1079217))

(declare-fun m!1079219 () Bool)

(assert (=> b!1171400 m!1079219))

(declare-fun m!1079221 () Bool)

(assert (=> b!1171400 m!1079221))

(declare-fun m!1079223 () Bool)

(assert (=> b!1171400 m!1079223))

(assert (=> b!1171400 m!1079207))

(declare-fun m!1079225 () Bool)

(assert (=> b!1171400 m!1079225))

(assert (=> b!1171400 m!1079207))

(assert (=> b!1171395 m!1079207))

(declare-fun m!1079227 () Bool)

(assert (=> b!1171380 m!1079227))

(declare-fun m!1079229 () Bool)

(assert (=> b!1171380 m!1079229))

(declare-fun m!1079231 () Bool)

(assert (=> b!1171380 m!1079231))

(declare-fun m!1079233 () Bool)

(assert (=> b!1171380 m!1079233))

(declare-fun m!1079235 () Bool)

(assert (=> b!1171390 m!1079235))

(declare-fun m!1079237 () Bool)

(assert (=> b!1171390 m!1079237))

(declare-fun m!1079239 () Bool)

(assert (=> b!1171390 m!1079239))

(declare-fun m!1079241 () Bool)

(assert (=> b!1171390 m!1079241))

(declare-fun m!1079243 () Bool)

(assert (=> b!1171394 m!1079243))

(declare-fun m!1079245 () Bool)

(assert (=> b!1171394 m!1079245))

(declare-fun m!1079247 () Bool)

(assert (=> b!1171398 m!1079247))

(declare-fun m!1079249 () Bool)

(assert (=> b!1171398 m!1079249))

(declare-fun m!1079251 () Bool)

(assert (=> b!1171396 m!1079251))

(declare-fun m!1079253 () Bool)

(assert (=> mapNonEmpty!46004 m!1079253))

(declare-fun m!1079255 () Bool)

(assert (=> b!1171385 m!1079255))

(declare-fun m!1079257 () Bool)

(assert (=> b!1171382 m!1079257))

(declare-fun m!1079259 () Bool)

(assert (=> b!1171389 m!1079259))

(declare-fun m!1079261 () Bool)

(assert (=> b!1171397 m!1079261))

(check-sat (not b!1171385) (not b!1171380) (not mapNonEmpty!46004) (not b_lambda!20065) (not b_next!24921) (not b!1171389) (not b!1171396) (not b!1171392) (not start!99342) (not b!1171398) (not b!1171397) tp_is_empty!29451 (not b!1171390) (not b!1171400) (not b!1171394) (not b!1171386) b_and!40711 (not b!1171382) (not b!1171379) (not b!1171384) (not b!1171391))
(check-sat b_and!40711 (not b_next!24921))
