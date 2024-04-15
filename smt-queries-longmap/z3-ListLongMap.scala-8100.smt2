; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99460 () Bool)

(assert start!99460)

(declare-fun b_free!25045 () Bool)

(declare-fun b_next!25045 () Bool)

(assert (=> start!99460 (= b_free!25045 (not b_next!25045))))

(declare-fun tp!87848 () Bool)

(declare-fun b_and!40935 () Bool)

(assert (=> start!99460 (= tp!87848 b_and!40935)))

(declare-datatypes ((array!75890 0))(
  ( (array!75891 (arr!36595 (Array (_ BitVec 32) (_ BitVec 64))) (size!37133 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75890)

(declare-fun b!1175215 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!668018 () Bool)

(declare-fun arrayContainsKey!0 (array!75890 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1175215 (= e!668018 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1175216 () Bool)

(declare-fun e!668012 () Bool)

(assert (=> b!1175216 (= e!668012 true)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1175216 (not (= (select (arr!36595 _keys!1208) from!1455) k0!934))))

(declare-datatypes ((Unit!38618 0))(
  ( (Unit!38619) )
))
(declare-fun lt!530027 () Unit!38618)

(declare-fun e!668016 () Unit!38618)

(assert (=> b!1175216 (= lt!530027 e!668016)))

(declare-fun c!116665 () Bool)

(assert (=> b!1175216 (= c!116665 (= (select (arr!36595 _keys!1208) from!1455) k0!934))))

(declare-fun e!668017 () Bool)

(assert (=> b!1175216 e!668017))

(declare-fun res!780507 () Bool)

(assert (=> b!1175216 (=> (not res!780507) (not e!668017))))

(declare-datatypes ((V!44561 0))(
  ( (V!44562 (val!14844 Int)) )
))
(declare-datatypes ((tuple2!19082 0))(
  ( (tuple2!19083 (_1!9552 (_ BitVec 64)) (_2!9552 V!44561)) )
))
(declare-datatypes ((List!25793 0))(
  ( (Nil!25790) (Cons!25789 (h!26998 tuple2!19082) (t!37821 List!25793)) )
))
(declare-datatypes ((ListLongMap!17051 0))(
  ( (ListLongMap!17052 (toList!8541 List!25793)) )
))
(declare-fun lt!530030 () ListLongMap!17051)

(declare-fun lt!530034 () V!44561)

(declare-fun lt!530026 () ListLongMap!17051)

(declare-datatypes ((ValueCell!14078 0))(
  ( (ValueCellFull!14078 (v!17481 V!44561)) (EmptyCell!14078) )
))
(declare-datatypes ((array!75892 0))(
  ( (array!75893 (arr!36596 (Array (_ BitVec 32) ValueCell!14078)) (size!37134 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75892)

(declare-fun +!3847 (ListLongMap!17051 tuple2!19082) ListLongMap!17051)

(declare-fun get!18695 (ValueCell!14078 V!44561) V!44561)

(assert (=> b!1175216 (= res!780507 (= lt!530030 (+!3847 lt!530026 (tuple2!19083 (select (arr!36595 _keys!1208) from!1455) (get!18695 (select (arr!36596 _values!996) from!1455) lt!530034)))))))

(declare-fun b!1175217 () Bool)

(declare-fun e!668014 () Bool)

(declare-fun tp_is_empty!29575 () Bool)

(assert (=> b!1175217 (= e!668014 tp_is_empty!29575)))

(declare-fun b!1175218 () Bool)

(declare-fun e!668010 () Bool)

(declare-fun e!668011 () Bool)

(assert (=> b!1175218 (= e!668010 (not e!668011))))

(declare-fun res!780516 () Bool)

(assert (=> b!1175218 (=> res!780516 e!668011)))

(assert (=> b!1175218 (= res!780516 (bvsgt from!1455 i!673))))

(assert (=> b!1175218 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!530032 () Unit!38618)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75890 (_ BitVec 64) (_ BitVec 32)) Unit!38618)

(assert (=> b!1175218 (= lt!530032 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!46190 () Bool)

(declare-fun mapRes!46190 () Bool)

(assert (=> mapIsEmpty!46190 mapRes!46190))

(declare-fun b!1175219 () Bool)

(declare-fun e!668009 () Bool)

(assert (=> b!1175219 (= e!668009 e!668012)))

(declare-fun res!780509 () Bool)

(assert (=> b!1175219 (=> res!780509 e!668012)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1175219 (= res!780509 (not (validKeyInArray!0 (select (arr!36595 _keys!1208) from!1455))))))

(declare-fun lt!530023 () ListLongMap!17051)

(assert (=> b!1175219 (= lt!530023 lt!530026)))

(declare-fun lt!530029 () ListLongMap!17051)

(declare-fun -!1524 (ListLongMap!17051 (_ BitVec 64)) ListLongMap!17051)

(assert (=> b!1175219 (= lt!530026 (-!1524 lt!530029 k0!934))))

(declare-fun zeroValue!944 () V!44561)

(declare-fun lt!530028 () array!75890)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!530022 () array!75892)

(declare-fun minValue!944 () V!44561)

(declare-fun getCurrentListMapNoExtraKeys!5011 (array!75890 array!75892 (_ BitVec 32) (_ BitVec 32) V!44561 V!44561 (_ BitVec 32) Int) ListLongMap!17051)

(assert (=> b!1175219 (= lt!530023 (getCurrentListMapNoExtraKeys!5011 lt!530028 lt!530022 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1175219 (= lt!530029 (getCurrentListMapNoExtraKeys!5011 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!530033 () Unit!38618)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!788 (array!75890 array!75892 (_ BitVec 32) (_ BitVec 32) V!44561 V!44561 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38618)

(assert (=> b!1175219 (= lt!530033 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!788 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1175220 () Bool)

(declare-fun res!780518 () Bool)

(declare-fun e!668020 () Bool)

(assert (=> b!1175220 (=> (not res!780518) (not e!668020))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75890 (_ BitVec 32)) Bool)

(assert (=> b!1175220 (= res!780518 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1175221 () Bool)

(declare-fun res!780510 () Bool)

(assert (=> b!1175221 (=> (not res!780510) (not e!668020))))

(declare-datatypes ((List!25794 0))(
  ( (Nil!25791) (Cons!25790 (h!26999 (_ BitVec 64)) (t!37822 List!25794)) )
))
(declare-fun arrayNoDuplicates!0 (array!75890 (_ BitVec 32) List!25794) Bool)

(assert (=> b!1175221 (= res!780510 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25791))))

(declare-fun b!1175222 () Bool)

(declare-fun res!780520 () Bool)

(assert (=> b!1175222 (=> (not res!780520) (not e!668020))))

(assert (=> b!1175222 (= res!780520 (validKeyInArray!0 k0!934))))

(declare-fun b!1175223 () Bool)

(declare-fun Unit!38620 () Unit!38618)

(assert (=> b!1175223 (= e!668016 Unit!38620)))

(declare-fun b!1175225 () Bool)

(declare-fun Unit!38621 () Unit!38618)

(assert (=> b!1175225 (= e!668016 Unit!38621)))

(declare-fun lt!530021 () Unit!38618)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75890 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38618)

(assert (=> b!1175225 (= lt!530021 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1175225 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!530024 () Unit!38618)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75890 (_ BitVec 32) (_ BitVec 32)) Unit!38618)

(assert (=> b!1175225 (= lt!530024 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1175225 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25791)))

(declare-fun lt!530031 () Unit!38618)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75890 (_ BitVec 64) (_ BitVec 32) List!25794) Unit!38618)

(assert (=> b!1175225 (= lt!530031 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25791))))

(assert (=> b!1175225 false))

(declare-fun b!1175226 () Bool)

(assert (=> b!1175226 (= e!668017 e!668018)))

(declare-fun res!780517 () Bool)

(assert (=> b!1175226 (=> res!780517 e!668018)))

(assert (=> b!1175226 (= res!780517 (not (= (select (arr!36595 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1175227 () Bool)

(assert (=> b!1175227 (= e!668020 e!668010)))

(declare-fun res!780506 () Bool)

(assert (=> b!1175227 (=> (not res!780506) (not e!668010))))

(assert (=> b!1175227 (= res!780506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!530028 mask!1564))))

(assert (=> b!1175227 (= lt!530028 (array!75891 (store (arr!36595 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37133 _keys!1208)))))

(declare-fun b!1175228 () Bool)

(declare-fun e!668019 () Bool)

(declare-fun e!668015 () Bool)

(assert (=> b!1175228 (= e!668019 (and e!668015 mapRes!46190))))

(declare-fun condMapEmpty!46190 () Bool)

(declare-fun mapDefault!46190 () ValueCell!14078)

(assert (=> b!1175228 (= condMapEmpty!46190 (= (arr!36596 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14078)) mapDefault!46190)))))

(declare-fun b!1175229 () Bool)

(assert (=> b!1175229 (= e!668015 tp_is_empty!29575)))

(declare-fun b!1175230 () Bool)

(declare-fun res!780513 () Bool)

(assert (=> b!1175230 (=> (not res!780513) (not e!668020))))

(assert (=> b!1175230 (= res!780513 (= (select (arr!36595 _keys!1208) i!673) k0!934))))

(declare-fun b!1175224 () Bool)

(declare-fun res!780511 () Bool)

(assert (=> b!1175224 (=> (not res!780511) (not e!668020))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1175224 (= res!780511 (validMask!0 mask!1564))))

(declare-fun res!780508 () Bool)

(assert (=> start!99460 (=> (not res!780508) (not e!668020))))

(assert (=> start!99460 (= res!780508 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37133 _keys!1208))))))

(assert (=> start!99460 e!668020))

(assert (=> start!99460 tp_is_empty!29575))

(declare-fun array_inv!28064 (array!75890) Bool)

(assert (=> start!99460 (array_inv!28064 _keys!1208)))

(assert (=> start!99460 true))

(assert (=> start!99460 tp!87848))

(declare-fun array_inv!28065 (array!75892) Bool)

(assert (=> start!99460 (and (array_inv!28065 _values!996) e!668019)))

(declare-fun b!1175231 () Bool)

(declare-fun res!780515 () Bool)

(assert (=> b!1175231 (=> (not res!780515) (not e!668020))))

(assert (=> b!1175231 (= res!780515 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37133 _keys!1208))))))

(declare-fun b!1175232 () Bool)

(declare-fun res!780512 () Bool)

(assert (=> b!1175232 (=> (not res!780512) (not e!668020))))

(assert (=> b!1175232 (= res!780512 (and (= (size!37134 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37133 _keys!1208) (size!37134 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1175233 () Bool)

(assert (=> b!1175233 (= e!668011 e!668009)))

(declare-fun res!780519 () Bool)

(assert (=> b!1175233 (=> res!780519 e!668009)))

(assert (=> b!1175233 (= res!780519 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1175233 (= lt!530030 (getCurrentListMapNoExtraKeys!5011 lt!530028 lt!530022 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1175233 (= lt!530022 (array!75893 (store (arr!36596 _values!996) i!673 (ValueCellFull!14078 lt!530034)) (size!37134 _values!996)))))

(declare-fun dynLambda!2928 (Int (_ BitVec 64)) V!44561)

(assert (=> b!1175233 (= lt!530034 (dynLambda!2928 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!530025 () ListLongMap!17051)

(assert (=> b!1175233 (= lt!530025 (getCurrentListMapNoExtraKeys!5011 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1175234 () Bool)

(declare-fun res!780514 () Bool)

(assert (=> b!1175234 (=> (not res!780514) (not e!668010))))

(assert (=> b!1175234 (= res!780514 (arrayNoDuplicates!0 lt!530028 #b00000000000000000000000000000000 Nil!25791))))

(declare-fun mapNonEmpty!46190 () Bool)

(declare-fun tp!87849 () Bool)

(assert (=> mapNonEmpty!46190 (= mapRes!46190 (and tp!87849 e!668014))))

(declare-fun mapRest!46190 () (Array (_ BitVec 32) ValueCell!14078))

(declare-fun mapKey!46190 () (_ BitVec 32))

(declare-fun mapValue!46190 () ValueCell!14078)

(assert (=> mapNonEmpty!46190 (= (arr!36596 _values!996) (store mapRest!46190 mapKey!46190 mapValue!46190))))

(assert (= (and start!99460 res!780508) b!1175224))

(assert (= (and b!1175224 res!780511) b!1175232))

(assert (= (and b!1175232 res!780512) b!1175220))

(assert (= (and b!1175220 res!780518) b!1175221))

(assert (= (and b!1175221 res!780510) b!1175231))

(assert (= (and b!1175231 res!780515) b!1175222))

(assert (= (and b!1175222 res!780520) b!1175230))

(assert (= (and b!1175230 res!780513) b!1175227))

(assert (= (and b!1175227 res!780506) b!1175234))

(assert (= (and b!1175234 res!780514) b!1175218))

(assert (= (and b!1175218 (not res!780516)) b!1175233))

(assert (= (and b!1175233 (not res!780519)) b!1175219))

(assert (= (and b!1175219 (not res!780509)) b!1175216))

(assert (= (and b!1175216 res!780507) b!1175226))

(assert (= (and b!1175226 (not res!780517)) b!1175215))

(assert (= (and b!1175216 c!116665) b!1175225))

(assert (= (and b!1175216 (not c!116665)) b!1175223))

(assert (= (and b!1175228 condMapEmpty!46190) mapIsEmpty!46190))

(assert (= (and b!1175228 (not condMapEmpty!46190)) mapNonEmpty!46190))

(get-info :version)

(assert (= (and mapNonEmpty!46190 ((_ is ValueCellFull!14078) mapValue!46190)) b!1175217))

(assert (= (and b!1175228 ((_ is ValueCellFull!14078) mapDefault!46190)) b!1175229))

(assert (= start!99460 b!1175228))

(declare-fun b_lambda!20171 () Bool)

(assert (=> (not b_lambda!20171) (not b!1175233)))

(declare-fun t!37820 () Bool)

(declare-fun tb!9849 () Bool)

(assert (=> (and start!99460 (= defaultEntry!1004 defaultEntry!1004) t!37820) tb!9849))

(declare-fun result!20273 () Bool)

(assert (=> tb!9849 (= result!20273 tp_is_empty!29575)))

(assert (=> b!1175233 t!37820))

(declare-fun b_and!40937 () Bool)

(assert (= b_and!40935 (and (=> t!37820 result!20273) b_and!40937)))

(declare-fun m!1082633 () Bool)

(assert (=> b!1175224 m!1082633))

(declare-fun m!1082635 () Bool)

(assert (=> b!1175220 m!1082635))

(declare-fun m!1082637 () Bool)

(assert (=> b!1175222 m!1082637))

(declare-fun m!1082639 () Bool)

(assert (=> b!1175227 m!1082639))

(declare-fun m!1082641 () Bool)

(assert (=> b!1175227 m!1082641))

(declare-fun m!1082643 () Bool)

(assert (=> b!1175226 m!1082643))

(declare-fun m!1082645 () Bool)

(assert (=> b!1175233 m!1082645))

(declare-fun m!1082647 () Bool)

(assert (=> b!1175233 m!1082647))

(declare-fun m!1082649 () Bool)

(assert (=> b!1175233 m!1082649))

(declare-fun m!1082651 () Bool)

(assert (=> b!1175233 m!1082651))

(declare-fun m!1082653 () Bool)

(assert (=> b!1175219 m!1082653))

(assert (=> b!1175219 m!1082643))

(declare-fun m!1082655 () Bool)

(assert (=> b!1175219 m!1082655))

(declare-fun m!1082657 () Bool)

(assert (=> b!1175219 m!1082657))

(assert (=> b!1175219 m!1082643))

(declare-fun m!1082659 () Bool)

(assert (=> b!1175219 m!1082659))

(declare-fun m!1082661 () Bool)

(assert (=> b!1175219 m!1082661))

(declare-fun m!1082663 () Bool)

(assert (=> b!1175218 m!1082663))

(declare-fun m!1082665 () Bool)

(assert (=> b!1175218 m!1082665))

(declare-fun m!1082667 () Bool)

(assert (=> b!1175230 m!1082667))

(assert (=> b!1175216 m!1082643))

(declare-fun m!1082669 () Bool)

(assert (=> b!1175216 m!1082669))

(assert (=> b!1175216 m!1082669))

(declare-fun m!1082671 () Bool)

(assert (=> b!1175216 m!1082671))

(declare-fun m!1082673 () Bool)

(assert (=> b!1175216 m!1082673))

(declare-fun m!1082675 () Bool)

(assert (=> start!99460 m!1082675))

(declare-fun m!1082677 () Bool)

(assert (=> start!99460 m!1082677))

(declare-fun m!1082679 () Bool)

(assert (=> b!1175234 m!1082679))

(declare-fun m!1082681 () Bool)

(assert (=> mapNonEmpty!46190 m!1082681))

(declare-fun m!1082683 () Bool)

(assert (=> b!1175215 m!1082683))

(declare-fun m!1082685 () Bool)

(assert (=> b!1175221 m!1082685))

(declare-fun m!1082687 () Bool)

(assert (=> b!1175225 m!1082687))

(declare-fun m!1082689 () Bool)

(assert (=> b!1175225 m!1082689))

(declare-fun m!1082691 () Bool)

(assert (=> b!1175225 m!1082691))

(declare-fun m!1082693 () Bool)

(assert (=> b!1175225 m!1082693))

(declare-fun m!1082695 () Bool)

(assert (=> b!1175225 m!1082695))

(check-sat (not b!1175219) (not b_next!25045) (not b!1175224) (not b!1175218) (not b!1175220) tp_is_empty!29575 (not b!1175234) (not b_lambda!20171) (not b!1175216) (not b!1175227) (not mapNonEmpty!46190) b_and!40937 (not start!99460) (not b!1175225) (not b!1175233) (not b!1175221) (not b!1175222) (not b!1175215))
(check-sat b_and!40937 (not b_next!25045))
