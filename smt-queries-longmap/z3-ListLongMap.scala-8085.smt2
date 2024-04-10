; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99378 () Bool)

(assert start!99378)

(declare-fun b_free!24957 () Bool)

(declare-fun b_next!24957 () Bool)

(assert (=> start!99378 (= b_free!24957 (not b_next!24957))))

(declare-fun tp!87585 () Bool)

(declare-fun b_and!40781 () Bool)

(assert (=> start!99378 (= tp!87585 b_and!40781)))

(declare-fun b!1172603 () Bool)

(declare-fun e!666504 () Bool)

(declare-fun e!666501 () Bool)

(assert (=> b!1172603 (= e!666504 e!666501)))

(declare-fun res!778582 () Bool)

(assert (=> b!1172603 (=> res!778582 e!666501)))

(declare-datatypes ((array!75787 0))(
  ( (array!75788 (arr!36543 (Array (_ BitVec 32) (_ BitVec 64))) (size!37079 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75787)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1172603 (= res!778582 (not (= (select (arr!36543 _keys!1208) from!1455) k0!934)))))

(declare-fun e!666502 () Bool)

(assert (=> b!1172603 e!666502))

(declare-fun res!778580 () Bool)

(assert (=> b!1172603 (=> (not res!778580) (not e!666502))))

(declare-datatypes ((V!44443 0))(
  ( (V!44444 (val!14800 Int)) )
))
(declare-fun lt!528381 () V!44443)

(declare-datatypes ((tuple2!18910 0))(
  ( (tuple2!18911 (_1!9466 (_ BitVec 64)) (_2!9466 V!44443)) )
))
(declare-datatypes ((List!25647 0))(
  ( (Nil!25644) (Cons!25643 (h!26852 tuple2!18910) (t!37596 List!25647)) )
))
(declare-datatypes ((ListLongMap!16879 0))(
  ( (ListLongMap!16880 (toList!8455 List!25647)) )
))
(declare-fun lt!528377 () ListLongMap!16879)

(declare-datatypes ((ValueCell!14034 0))(
  ( (ValueCellFull!14034 (v!17438 V!44443)) (EmptyCell!14034) )
))
(declare-datatypes ((array!75789 0))(
  ( (array!75790 (arr!36544 (Array (_ BitVec 32) ValueCell!14034)) (size!37080 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75789)

(declare-fun lt!528369 () ListLongMap!16879)

(declare-fun +!3775 (ListLongMap!16879 tuple2!18910) ListLongMap!16879)

(declare-fun get!18641 (ValueCell!14034 V!44443) V!44443)

(assert (=> b!1172603 (= res!778580 (= lt!528369 (+!3775 lt!528377 (tuple2!18911 (select (arr!36543 _keys!1208) from!1455) (get!18641 (select (arr!36544 _values!996) from!1455) lt!528381)))))))

(declare-fun b!1172604 () Bool)

(declare-fun e!666503 () Bool)

(assert (=> b!1172604 (= e!666501 e!666503)))

(declare-fun res!778593 () Bool)

(assert (=> b!1172604 (=> res!778593 e!666503)))

(assert (=> b!1172604 (= res!778593 (or (bvsge (size!37079 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!37079 _keys!1208)) (bvsge from!1455 (size!37079 _keys!1208))))))

(declare-datatypes ((List!25648 0))(
  ( (Nil!25645) (Cons!25644 (h!26853 (_ BitVec 64)) (t!37597 List!25648)) )
))
(declare-fun arrayNoDuplicates!0 (array!75787 (_ BitVec 32) List!25648) Bool)

(assert (=> b!1172604 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25645)))

(declare-datatypes ((Unit!38664 0))(
  ( (Unit!38665) )
))
(declare-fun lt!528370 () Unit!38664)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75787 (_ BitVec 32) (_ BitVec 32)) Unit!38664)

(assert (=> b!1172604 (= lt!528370 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun arrayContainsKey!0 (array!75787 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1172604 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!528378 () Unit!38664)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75787 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38664)

(assert (=> b!1172604 (= lt!528378 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1172605 () Bool)

(declare-fun e!666505 () Bool)

(declare-fun e!666506 () Bool)

(assert (=> b!1172605 (= e!666505 (not e!666506))))

(declare-fun res!778587 () Bool)

(assert (=> b!1172605 (=> res!778587 e!666506)))

(assert (=> b!1172605 (= res!778587 (bvsgt from!1455 i!673))))

(assert (=> b!1172605 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!528379 () Unit!38664)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75787 (_ BitVec 64) (_ BitVec 32)) Unit!38664)

(assert (=> b!1172605 (= lt!528379 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1172606 () Bool)

(declare-fun res!778577 () Bool)

(assert (=> b!1172606 (=> res!778577 e!666503)))

(declare-fun noDuplicate!1621 (List!25648) Bool)

(assert (=> b!1172606 (= res!778577 (not (noDuplicate!1621 Nil!25645)))))

(declare-fun b!1172607 () Bool)

(declare-fun res!778589 () Bool)

(declare-fun e!666499 () Bool)

(assert (=> b!1172607 (=> (not res!778589) (not e!666499))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1172607 (= res!778589 (and (= (size!37080 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37079 _keys!1208) (size!37080 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1172608 () Bool)

(declare-fun res!778591 () Bool)

(assert (=> b!1172608 (=> (not res!778591) (not e!666499))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1172608 (= res!778591 (validMask!0 mask!1564))))

(declare-fun b!1172609 () Bool)

(assert (=> b!1172609 (= e!666499 e!666505)))

(declare-fun res!778579 () Bool)

(assert (=> b!1172609 (=> (not res!778579) (not e!666505))))

(declare-fun lt!528371 () array!75787)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75787 (_ BitVec 32)) Bool)

(assert (=> b!1172609 (= res!778579 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!528371 mask!1564))))

(assert (=> b!1172609 (= lt!528371 (array!75788 (store (arr!36543 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37079 _keys!1208)))))

(declare-fun b!1172610 () Bool)

(declare-fun e!666509 () Bool)

(declare-fun e!666510 () Bool)

(declare-fun mapRes!46058 () Bool)

(assert (=> b!1172610 (= e!666509 (and e!666510 mapRes!46058))))

(declare-fun condMapEmpty!46058 () Bool)

(declare-fun mapDefault!46058 () ValueCell!14034)

(assert (=> b!1172610 (= condMapEmpty!46058 (= (arr!36544 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14034)) mapDefault!46058)))))

(declare-fun b!1172611 () Bool)

(declare-fun e!666511 () Bool)

(declare-fun tp_is_empty!29487 () Bool)

(assert (=> b!1172611 (= e!666511 tp_is_empty!29487)))

(declare-fun b!1172612 () Bool)

(declare-fun res!778594 () Bool)

(assert (=> b!1172612 (=> (not res!778594) (not e!666499))))

(assert (=> b!1172612 (= res!778594 (= (select (arr!36543 _keys!1208) i!673) k0!934))))

(declare-fun b!1172613 () Bool)

(declare-fun res!778576 () Bool)

(assert (=> b!1172613 (=> (not res!778576) (not e!666505))))

(assert (=> b!1172613 (= res!778576 (arrayNoDuplicates!0 lt!528371 #b00000000000000000000000000000000 Nil!25645))))

(declare-fun b!1172615 () Bool)

(assert (=> b!1172615 (= e!666503 true)))

(declare-fun lt!528374 () Bool)

(declare-fun contains!6859 (List!25648 (_ BitVec 64)) Bool)

(assert (=> b!1172615 (= lt!528374 (contains!6859 Nil!25645 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1172616 () Bool)

(declare-fun e!666500 () Bool)

(assert (=> b!1172616 (= e!666500 e!666504)))

(declare-fun res!778578 () Bool)

(assert (=> b!1172616 (=> res!778578 e!666504)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1172616 (= res!778578 (not (validKeyInArray!0 (select (arr!36543 _keys!1208) from!1455))))))

(declare-fun lt!528376 () ListLongMap!16879)

(assert (=> b!1172616 (= lt!528376 lt!528377)))

(declare-fun lt!528372 () ListLongMap!16879)

(declare-fun -!1522 (ListLongMap!16879 (_ BitVec 64)) ListLongMap!16879)

(assert (=> b!1172616 (= lt!528377 (-!1522 lt!528372 k0!934))))

(declare-fun zeroValue!944 () V!44443)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44443)

(declare-fun lt!528373 () array!75789)

(declare-fun getCurrentListMapNoExtraKeys!4919 (array!75787 array!75789 (_ BitVec 32) (_ BitVec 32) V!44443 V!44443 (_ BitVec 32) Int) ListLongMap!16879)

(assert (=> b!1172616 (= lt!528376 (getCurrentListMapNoExtraKeys!4919 lt!528371 lt!528373 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1172616 (= lt!528372 (getCurrentListMapNoExtraKeys!4919 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!528375 () Unit!38664)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!749 (array!75787 array!75789 (_ BitVec 32) (_ BitVec 32) V!44443 V!44443 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38664)

(assert (=> b!1172616 (= lt!528375 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!749 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1172617 () Bool)

(declare-fun res!778588 () Bool)

(assert (=> b!1172617 (=> (not res!778588) (not e!666499))))

(assert (=> b!1172617 (= res!778588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!46058 () Bool)

(assert (=> mapIsEmpty!46058 mapRes!46058))

(declare-fun b!1172618 () Bool)

(assert (=> b!1172618 (= e!666506 e!666500)))

(declare-fun res!778584 () Bool)

(assert (=> b!1172618 (=> res!778584 e!666500)))

(assert (=> b!1172618 (= res!778584 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1172618 (= lt!528369 (getCurrentListMapNoExtraKeys!4919 lt!528371 lt!528373 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1172618 (= lt!528373 (array!75790 (store (arr!36544 _values!996) i!673 (ValueCellFull!14034 lt!528381)) (size!37080 _values!996)))))

(declare-fun dynLambda!2890 (Int (_ BitVec 64)) V!44443)

(assert (=> b!1172618 (= lt!528381 (dynLambda!2890 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!528380 () ListLongMap!16879)

(assert (=> b!1172618 (= lt!528380 (getCurrentListMapNoExtraKeys!4919 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1172619 () Bool)

(declare-fun res!778581 () Bool)

(assert (=> b!1172619 (=> (not res!778581) (not e!666499))))

(assert (=> b!1172619 (= res!778581 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37079 _keys!1208))))))

(declare-fun b!1172620 () Bool)

(assert (=> b!1172620 (= e!666510 tp_is_empty!29487)))

(declare-fun b!1172621 () Bool)

(declare-fun res!778583 () Bool)

(assert (=> b!1172621 (=> (not res!778583) (not e!666499))))

(assert (=> b!1172621 (= res!778583 (validKeyInArray!0 k0!934))))

(declare-fun b!1172622 () Bool)

(declare-fun e!666507 () Bool)

(assert (=> b!1172622 (= e!666502 e!666507)))

(declare-fun res!778590 () Bool)

(assert (=> b!1172622 (=> res!778590 e!666507)))

(assert (=> b!1172622 (= res!778590 (not (= (select (arr!36543 _keys!1208) from!1455) k0!934)))))

(declare-fun res!778585 () Bool)

(assert (=> start!99378 (=> (not res!778585) (not e!666499))))

(assert (=> start!99378 (= res!778585 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37079 _keys!1208))))))

(assert (=> start!99378 e!666499))

(assert (=> start!99378 tp_is_empty!29487))

(declare-fun array_inv!27924 (array!75787) Bool)

(assert (=> start!99378 (array_inv!27924 _keys!1208)))

(assert (=> start!99378 true))

(assert (=> start!99378 tp!87585))

(declare-fun array_inv!27925 (array!75789) Bool)

(assert (=> start!99378 (and (array_inv!27925 _values!996) e!666509)))

(declare-fun b!1172614 () Bool)

(declare-fun res!778586 () Bool)

(assert (=> b!1172614 (=> (not res!778586) (not e!666499))))

(assert (=> b!1172614 (= res!778586 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25645))))

(declare-fun b!1172623 () Bool)

(assert (=> b!1172623 (= e!666507 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1172624 () Bool)

(declare-fun res!778592 () Bool)

(assert (=> b!1172624 (=> res!778592 e!666503)))

(assert (=> b!1172624 (= res!778592 (contains!6859 Nil!25645 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!46058 () Bool)

(declare-fun tp!87584 () Bool)

(assert (=> mapNonEmpty!46058 (= mapRes!46058 (and tp!87584 e!666511))))

(declare-fun mapKey!46058 () (_ BitVec 32))

(declare-fun mapValue!46058 () ValueCell!14034)

(declare-fun mapRest!46058 () (Array (_ BitVec 32) ValueCell!14034))

(assert (=> mapNonEmpty!46058 (= (arr!36544 _values!996) (store mapRest!46058 mapKey!46058 mapValue!46058))))

(assert (= (and start!99378 res!778585) b!1172608))

(assert (= (and b!1172608 res!778591) b!1172607))

(assert (= (and b!1172607 res!778589) b!1172617))

(assert (= (and b!1172617 res!778588) b!1172614))

(assert (= (and b!1172614 res!778586) b!1172619))

(assert (= (and b!1172619 res!778581) b!1172621))

(assert (= (and b!1172621 res!778583) b!1172612))

(assert (= (and b!1172612 res!778594) b!1172609))

(assert (= (and b!1172609 res!778579) b!1172613))

(assert (= (and b!1172613 res!778576) b!1172605))

(assert (= (and b!1172605 (not res!778587)) b!1172618))

(assert (= (and b!1172618 (not res!778584)) b!1172616))

(assert (= (and b!1172616 (not res!778578)) b!1172603))

(assert (= (and b!1172603 res!778580) b!1172622))

(assert (= (and b!1172622 (not res!778590)) b!1172623))

(assert (= (and b!1172603 (not res!778582)) b!1172604))

(assert (= (and b!1172604 (not res!778593)) b!1172606))

(assert (= (and b!1172606 (not res!778577)) b!1172624))

(assert (= (and b!1172624 (not res!778592)) b!1172615))

(assert (= (and b!1172610 condMapEmpty!46058) mapIsEmpty!46058))

(assert (= (and b!1172610 (not condMapEmpty!46058)) mapNonEmpty!46058))

(get-info :version)

(assert (= (and mapNonEmpty!46058 ((_ is ValueCellFull!14034) mapValue!46058)) b!1172611))

(assert (= (and b!1172610 ((_ is ValueCellFull!14034) mapDefault!46058)) b!1172620))

(assert (= start!99378 b!1172610))

(declare-fun b_lambda!20101 () Bool)

(assert (=> (not b_lambda!20101) (not b!1172618)))

(declare-fun t!37595 () Bool)

(declare-fun tb!9769 () Bool)

(assert (=> (and start!99378 (= defaultEntry!1004 defaultEntry!1004) t!37595) tb!9769))

(declare-fun result!20105 () Bool)

(assert (=> tb!9769 (= result!20105 tp_is_empty!29487)))

(assert (=> b!1172618 t!37595))

(declare-fun b_and!40783 () Bool)

(assert (= b_and!40781 (and (=> t!37595 result!20105) b_and!40783)))

(declare-fun m!1080419 () Bool)

(assert (=> b!1172612 m!1080419))

(declare-fun m!1080421 () Bool)

(assert (=> start!99378 m!1080421))

(declare-fun m!1080423 () Bool)

(assert (=> start!99378 m!1080423))

(declare-fun m!1080425 () Bool)

(assert (=> b!1172613 m!1080425))

(declare-fun m!1080427 () Bool)

(assert (=> b!1172617 m!1080427))

(declare-fun m!1080429 () Bool)

(assert (=> b!1172606 m!1080429))

(declare-fun m!1080431 () Bool)

(assert (=> b!1172609 m!1080431))

(declare-fun m!1080433 () Bool)

(assert (=> b!1172609 m!1080433))

(declare-fun m!1080435 () Bool)

(assert (=> b!1172605 m!1080435))

(declare-fun m!1080437 () Bool)

(assert (=> b!1172605 m!1080437))

(declare-fun m!1080439 () Bool)

(assert (=> b!1172616 m!1080439))

(declare-fun m!1080441 () Bool)

(assert (=> b!1172616 m!1080441))

(declare-fun m!1080443 () Bool)

(assert (=> b!1172616 m!1080443))

(declare-fun m!1080445 () Bool)

(assert (=> b!1172616 m!1080445))

(assert (=> b!1172616 m!1080443))

(declare-fun m!1080447 () Bool)

(assert (=> b!1172616 m!1080447))

(declare-fun m!1080449 () Bool)

(assert (=> b!1172616 m!1080449))

(declare-fun m!1080451 () Bool)

(assert (=> b!1172621 m!1080451))

(assert (=> b!1172622 m!1080443))

(declare-fun m!1080453 () Bool)

(assert (=> b!1172618 m!1080453))

(declare-fun m!1080455 () Bool)

(assert (=> b!1172618 m!1080455))

(declare-fun m!1080457 () Bool)

(assert (=> b!1172618 m!1080457))

(declare-fun m!1080459 () Bool)

(assert (=> b!1172618 m!1080459))

(declare-fun m!1080461 () Bool)

(assert (=> b!1172624 m!1080461))

(declare-fun m!1080463 () Bool)

(assert (=> b!1172604 m!1080463))

(declare-fun m!1080465 () Bool)

(assert (=> b!1172604 m!1080465))

(declare-fun m!1080467 () Bool)

(assert (=> b!1172604 m!1080467))

(declare-fun m!1080469 () Bool)

(assert (=> b!1172604 m!1080469))

(declare-fun m!1080471 () Bool)

(assert (=> b!1172623 m!1080471))

(declare-fun m!1080473 () Bool)

(assert (=> b!1172615 m!1080473))

(assert (=> b!1172603 m!1080443))

(declare-fun m!1080475 () Bool)

(assert (=> b!1172603 m!1080475))

(assert (=> b!1172603 m!1080475))

(declare-fun m!1080477 () Bool)

(assert (=> b!1172603 m!1080477))

(declare-fun m!1080479 () Bool)

(assert (=> b!1172603 m!1080479))

(declare-fun m!1080481 () Bool)

(assert (=> b!1172608 m!1080481))

(declare-fun m!1080483 () Bool)

(assert (=> b!1172614 m!1080483))

(declare-fun m!1080485 () Bool)

(assert (=> mapNonEmpty!46058 m!1080485))

(check-sat (not b!1172621) (not b!1172604) (not b!1172618) (not b!1172609) tp_is_empty!29487 (not mapNonEmpty!46058) (not b!1172614) (not b_next!24957) b_and!40783 (not b!1172603) (not b!1172623) (not b!1172616) (not b!1172606) (not b!1172615) (not start!99378) (not b!1172624) (not b!1172617) (not b!1172608) (not b!1172605) (not b_lambda!20101) (not b!1172613))
(check-sat b_and!40783 (not b_next!24957))
