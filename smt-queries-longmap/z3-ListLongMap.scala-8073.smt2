; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99540 () Bool)

(assert start!99540)

(declare-fun b_free!24883 () Bool)

(declare-fun b_next!24883 () Bool)

(assert (=> start!99540 (= b_free!24883 (not b_next!24883))))

(declare-fun tp!87363 () Bool)

(declare-fun b_and!40635 () Bool)

(assert (=> start!99540 (= tp!87363 b_and!40635)))

(declare-fun b!1171478 () Bool)

(declare-fun res!777090 () Bool)

(declare-fun e!665929 () Bool)

(assert (=> b!1171478 (=> (not res!777090) (not e!665929))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!75695 0))(
  ( (array!75696 (arr!36491 (Array (_ BitVec 32) (_ BitVec 64))) (size!37028 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75695)

(assert (=> b!1171478 (= res!777090 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37028 _keys!1208))))))

(declare-fun b!1171479 () Bool)

(declare-fun e!665930 () Bool)

(declare-fun e!665933 () Bool)

(assert (=> b!1171479 (= e!665930 e!665933)))

(declare-fun res!777082 () Bool)

(assert (=> b!1171479 (=> res!777082 e!665933)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1171479 (= res!777082 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!527479 () array!75695)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((V!44345 0))(
  ( (V!44346 (val!14763 Int)) )
))
(declare-datatypes ((ValueCell!13997 0))(
  ( (ValueCellFull!13997 (v!17397 V!44345)) (EmptyCell!13997) )
))
(declare-datatypes ((array!75697 0))(
  ( (array!75698 (arr!36492 (Array (_ BitVec 32) ValueCell!13997)) (size!37029 (_ BitVec 32))) )
))
(declare-fun lt!527488 () array!75697)

(declare-fun minValue!944 () V!44345)

(declare-datatypes ((tuple2!18882 0))(
  ( (tuple2!18883 (_1!9452 (_ BitVec 64)) (_2!9452 V!44345)) )
))
(declare-datatypes ((List!25618 0))(
  ( (Nil!25615) (Cons!25614 (h!26832 tuple2!18882) (t!37485 List!25618)) )
))
(declare-datatypes ((ListLongMap!16859 0))(
  ( (ListLongMap!16860 (toList!8445 List!25618)) )
))
(declare-fun lt!527486 () ListLongMap!16859)

(declare-fun zeroValue!944 () V!44345)

(declare-fun getCurrentListMapNoExtraKeys!4933 (array!75695 array!75697 (_ BitVec 32) (_ BitVec 32) V!44345 V!44345 (_ BitVec 32) Int) ListLongMap!16859)

(assert (=> b!1171479 (= lt!527486 (getCurrentListMapNoExtraKeys!4933 lt!527479 lt!527488 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!527483 () V!44345)

(declare-fun _values!996 () array!75697)

(assert (=> b!1171479 (= lt!527488 (array!75698 (store (arr!36492 _values!996) i!673 (ValueCellFull!13997 lt!527483)) (size!37029 _values!996)))))

(declare-fun dynLambda!2915 (Int (_ BitVec 64)) V!44345)

(assert (=> b!1171479 (= lt!527483 (dynLambda!2915 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!527484 () ListLongMap!16859)

(assert (=> b!1171479 (= lt!527484 (getCurrentListMapNoExtraKeys!4933 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!45947 () Bool)

(declare-fun mapRes!45947 () Bool)

(assert (=> mapIsEmpty!45947 mapRes!45947))

(declare-fun b!1171480 () Bool)

(declare-fun e!665923 () Bool)

(declare-fun e!665932 () Bool)

(assert (=> b!1171480 (= e!665923 e!665932)))

(declare-fun res!777079 () Bool)

(assert (=> b!1171480 (=> res!777079 e!665932)))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1171480 (= res!777079 (not (= (select (arr!36491 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1171481 () Bool)

(declare-fun e!665931 () Bool)

(declare-fun e!665925 () Bool)

(assert (=> b!1171481 (= e!665931 e!665925)))

(declare-fun res!777091 () Bool)

(assert (=> b!1171481 (=> res!777091 e!665925)))

(assert (=> b!1171481 (= res!777091 (not (= (select (arr!36491 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1171481 e!665923))

(declare-fun res!777092 () Bool)

(assert (=> b!1171481 (=> (not res!777092) (not e!665923))))

(declare-fun lt!527478 () ListLongMap!16859)

(declare-fun +!3784 (ListLongMap!16859 tuple2!18882) ListLongMap!16859)

(declare-fun get!18630 (ValueCell!13997 V!44345) V!44345)

(assert (=> b!1171481 (= res!777092 (= lt!527486 (+!3784 lt!527478 (tuple2!18883 (select (arr!36491 _keys!1208) from!1455) (get!18630 (select (arr!36492 _values!996) from!1455) lt!527483)))))))

(declare-fun b!1171483 () Bool)

(declare-fun e!665928 () Bool)

(assert (=> b!1171483 (= e!665929 e!665928)))

(declare-fun res!777081 () Bool)

(assert (=> b!1171483 (=> (not res!777081) (not e!665928))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75695 (_ BitVec 32)) Bool)

(assert (=> b!1171483 (= res!777081 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!527479 mask!1564))))

(assert (=> b!1171483 (= lt!527479 (array!75696 (store (arr!36491 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37028 _keys!1208)))))

(declare-fun b!1171484 () Bool)

(declare-fun res!777084 () Bool)

(assert (=> b!1171484 (=> (not res!777084) (not e!665928))))

(declare-datatypes ((List!25619 0))(
  ( (Nil!25616) (Cons!25615 (h!26833 (_ BitVec 64)) (t!37486 List!25619)) )
))
(declare-fun arrayNoDuplicates!0 (array!75695 (_ BitVec 32) List!25619) Bool)

(assert (=> b!1171484 (= res!777084 (arrayNoDuplicates!0 lt!527479 #b00000000000000000000000000000000 Nil!25616))))

(declare-fun b!1171485 () Bool)

(assert (=> b!1171485 (= e!665928 (not e!665930))))

(declare-fun res!777078 () Bool)

(assert (=> b!1171485 (=> res!777078 e!665930)))

(assert (=> b!1171485 (= res!777078 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75695 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1171485 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38579 0))(
  ( (Unit!38580) )
))
(declare-fun lt!527485 () Unit!38579)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75695 (_ BitVec 64) (_ BitVec 32)) Unit!38579)

(assert (=> b!1171485 (= lt!527485 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1171486 () Bool)

(assert (=> b!1171486 (= e!665933 e!665931)))

(declare-fun res!777080 () Bool)

(assert (=> b!1171486 (=> res!777080 e!665931)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1171486 (= res!777080 (not (validKeyInArray!0 (select (arr!36491 _keys!1208) from!1455))))))

(declare-fun lt!527480 () ListLongMap!16859)

(assert (=> b!1171486 (= lt!527480 lt!527478)))

(declare-fun lt!527482 () ListLongMap!16859)

(declare-fun -!1501 (ListLongMap!16859 (_ BitVec 64)) ListLongMap!16859)

(assert (=> b!1171486 (= lt!527478 (-!1501 lt!527482 k0!934))))

(assert (=> b!1171486 (= lt!527480 (getCurrentListMapNoExtraKeys!4933 lt!527479 lt!527488 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1171486 (= lt!527482 (getCurrentListMapNoExtraKeys!4933 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!527481 () Unit!38579)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!726 (array!75695 array!75697 (_ BitVec 32) (_ BitVec 32) V!44345 V!44345 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38579)

(assert (=> b!1171486 (= lt!527481 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!726 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1171487 () Bool)

(declare-fun e!665924 () Bool)

(declare-fun e!665926 () Bool)

(assert (=> b!1171487 (= e!665924 (and e!665926 mapRes!45947))))

(declare-fun condMapEmpty!45947 () Bool)

(declare-fun mapDefault!45947 () ValueCell!13997)

(assert (=> b!1171487 (= condMapEmpty!45947 (= (arr!36492 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13997)) mapDefault!45947)))))

(declare-fun b!1171488 () Bool)

(declare-fun tp_is_empty!29413 () Bool)

(assert (=> b!1171488 (= e!665926 tp_is_empty!29413)))

(declare-fun b!1171489 () Bool)

(declare-fun res!777088 () Bool)

(assert (=> b!1171489 (=> (not res!777088) (not e!665929))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1171489 (= res!777088 (validMask!0 mask!1564))))

(declare-fun b!1171490 () Bool)

(declare-fun e!665927 () Bool)

(assert (=> b!1171490 (= e!665927 tp_is_empty!29413)))

(declare-fun b!1171491 () Bool)

(assert (=> b!1171491 (= e!665925 true)))

(assert (=> b!1171491 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!527487 () Unit!38579)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75695 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38579)

(assert (=> b!1171491 (= lt!527487 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1171492 () Bool)

(declare-fun res!777089 () Bool)

(assert (=> b!1171492 (=> (not res!777089) (not e!665929))))

(assert (=> b!1171492 (= res!777089 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25616))))

(declare-fun b!1171493 () Bool)

(declare-fun res!777086 () Bool)

(assert (=> b!1171493 (=> (not res!777086) (not e!665929))))

(assert (=> b!1171493 (= res!777086 (validKeyInArray!0 k0!934))))

(declare-fun b!1171482 () Bool)

(assert (=> b!1171482 (= e!665932 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun res!777085 () Bool)

(assert (=> start!99540 (=> (not res!777085) (not e!665929))))

(assert (=> start!99540 (= res!777085 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37028 _keys!1208))))))

(assert (=> start!99540 e!665929))

(assert (=> start!99540 tp_is_empty!29413))

(declare-fun array_inv!27962 (array!75695) Bool)

(assert (=> start!99540 (array_inv!27962 _keys!1208)))

(assert (=> start!99540 true))

(assert (=> start!99540 tp!87363))

(declare-fun array_inv!27963 (array!75697) Bool)

(assert (=> start!99540 (and (array_inv!27963 _values!996) e!665924)))

(declare-fun b!1171494 () Bool)

(declare-fun res!777077 () Bool)

(assert (=> b!1171494 (=> (not res!777077) (not e!665929))))

(assert (=> b!1171494 (= res!777077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1171495 () Bool)

(declare-fun res!777083 () Bool)

(assert (=> b!1171495 (=> (not res!777083) (not e!665929))))

(assert (=> b!1171495 (= res!777083 (and (= (size!37029 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37028 _keys!1208) (size!37029 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1171496 () Bool)

(declare-fun res!777087 () Bool)

(assert (=> b!1171496 (=> (not res!777087) (not e!665929))))

(assert (=> b!1171496 (= res!777087 (= (select (arr!36491 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!45947 () Bool)

(declare-fun tp!87362 () Bool)

(assert (=> mapNonEmpty!45947 (= mapRes!45947 (and tp!87362 e!665927))))

(declare-fun mapValue!45947 () ValueCell!13997)

(declare-fun mapKey!45947 () (_ BitVec 32))

(declare-fun mapRest!45947 () (Array (_ BitVec 32) ValueCell!13997))

(assert (=> mapNonEmpty!45947 (= (arr!36492 _values!996) (store mapRest!45947 mapKey!45947 mapValue!45947))))

(assert (= (and start!99540 res!777085) b!1171489))

(assert (= (and b!1171489 res!777088) b!1171495))

(assert (= (and b!1171495 res!777083) b!1171494))

(assert (= (and b!1171494 res!777077) b!1171492))

(assert (= (and b!1171492 res!777089) b!1171478))

(assert (= (and b!1171478 res!777090) b!1171493))

(assert (= (and b!1171493 res!777086) b!1171496))

(assert (= (and b!1171496 res!777087) b!1171483))

(assert (= (and b!1171483 res!777081) b!1171484))

(assert (= (and b!1171484 res!777084) b!1171485))

(assert (= (and b!1171485 (not res!777078)) b!1171479))

(assert (= (and b!1171479 (not res!777082)) b!1171486))

(assert (= (and b!1171486 (not res!777080)) b!1171481))

(assert (= (and b!1171481 res!777092) b!1171480))

(assert (= (and b!1171480 (not res!777079)) b!1171482))

(assert (= (and b!1171481 (not res!777091)) b!1171491))

(assert (= (and b!1171487 condMapEmpty!45947) mapIsEmpty!45947))

(assert (= (and b!1171487 (not condMapEmpty!45947)) mapNonEmpty!45947))

(get-info :version)

(assert (= (and mapNonEmpty!45947 ((_ is ValueCellFull!13997) mapValue!45947)) b!1171490))

(assert (= (and b!1171487 ((_ is ValueCellFull!13997) mapDefault!45947)) b!1171488))

(assert (= start!99540 b!1171487))

(declare-fun b_lambda!20021 () Bool)

(assert (=> (not b_lambda!20021) (not b!1171479)))

(declare-fun t!37484 () Bool)

(declare-fun tb!9687 () Bool)

(assert (=> (and start!99540 (= defaultEntry!1004 defaultEntry!1004) t!37484) tb!9687))

(declare-fun result!19949 () Bool)

(assert (=> tb!9687 (= result!19949 tp_is_empty!29413)))

(assert (=> b!1171479 t!37484))

(declare-fun b_and!40637 () Bool)

(assert (= b_and!40635 (and (=> t!37484 result!19949) b_and!40637)))

(declare-fun m!1079595 () Bool)

(assert (=> b!1171492 m!1079595))

(declare-fun m!1079597 () Bool)

(assert (=> b!1171485 m!1079597))

(declare-fun m!1079599 () Bool)

(assert (=> b!1171485 m!1079599))

(declare-fun m!1079601 () Bool)

(assert (=> b!1171483 m!1079601))

(declare-fun m!1079603 () Bool)

(assert (=> b!1171483 m!1079603))

(declare-fun m!1079605 () Bool)

(assert (=> b!1171479 m!1079605))

(declare-fun m!1079607 () Bool)

(assert (=> b!1171479 m!1079607))

(declare-fun m!1079609 () Bool)

(assert (=> b!1171479 m!1079609))

(declare-fun m!1079611 () Bool)

(assert (=> b!1171479 m!1079611))

(declare-fun m!1079613 () Bool)

(assert (=> b!1171482 m!1079613))

(declare-fun m!1079615 () Bool)

(assert (=> start!99540 m!1079615))

(declare-fun m!1079617 () Bool)

(assert (=> start!99540 m!1079617))

(declare-fun m!1079619 () Bool)

(assert (=> b!1171491 m!1079619))

(declare-fun m!1079621 () Bool)

(assert (=> b!1171491 m!1079621))

(declare-fun m!1079623 () Bool)

(assert (=> b!1171496 m!1079623))

(declare-fun m!1079625 () Bool)

(assert (=> b!1171494 m!1079625))

(declare-fun m!1079627 () Bool)

(assert (=> b!1171489 m!1079627))

(declare-fun m!1079629 () Bool)

(assert (=> b!1171481 m!1079629))

(declare-fun m!1079631 () Bool)

(assert (=> b!1171481 m!1079631))

(assert (=> b!1171481 m!1079631))

(declare-fun m!1079633 () Bool)

(assert (=> b!1171481 m!1079633))

(declare-fun m!1079635 () Bool)

(assert (=> b!1171481 m!1079635))

(assert (=> b!1171480 m!1079629))

(declare-fun m!1079637 () Bool)

(assert (=> b!1171486 m!1079637))

(declare-fun m!1079639 () Bool)

(assert (=> b!1171486 m!1079639))

(declare-fun m!1079641 () Bool)

(assert (=> b!1171486 m!1079641))

(assert (=> b!1171486 m!1079629))

(declare-fun m!1079643 () Bool)

(assert (=> b!1171486 m!1079643))

(declare-fun m!1079645 () Bool)

(assert (=> b!1171486 m!1079645))

(assert (=> b!1171486 m!1079629))

(declare-fun m!1079647 () Bool)

(assert (=> b!1171493 m!1079647))

(declare-fun m!1079649 () Bool)

(assert (=> mapNonEmpty!45947 m!1079649))

(declare-fun m!1079651 () Bool)

(assert (=> b!1171484 m!1079651))

(check-sat (not b!1171484) (not b!1171479) tp_is_empty!29413 b_and!40637 (not b!1171482) (not b!1171486) (not b!1171492) (not b_next!24883) (not mapNonEmpty!45947) (not start!99540) (not b!1171493) (not b!1171489) (not b!1171485) (not b!1171481) (not b!1171494) (not b_lambda!20021) (not b!1171491) (not b!1171483))
(check-sat b_and!40637 (not b_next!24883))
