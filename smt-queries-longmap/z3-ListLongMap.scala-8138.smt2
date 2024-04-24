; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99930 () Bool)

(assert start!99930)

(declare-fun b_free!25273 () Bool)

(declare-fun b_next!25273 () Bool)

(assert (=> start!99930 (= b_free!25273 (not b_next!25273))))

(declare-fun tp!88533 () Bool)

(declare-fun b_and!41415 () Bool)

(assert (=> start!99930 (= tp!88533 b_and!41415)))

(declare-fun res!786562 () Bool)

(declare-fun e!673277 () Bool)

(assert (=> start!99930 (=> (not res!786562) (not e!673277))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!76453 0))(
  ( (array!76454 (arr!36870 (Array (_ BitVec 32) (_ BitVec 64))) (size!37407 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76453)

(assert (=> start!99930 (= res!786562 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37407 _keys!1208))))))

(assert (=> start!99930 e!673277))

(declare-fun tp_is_empty!29803 () Bool)

(assert (=> start!99930 tp_is_empty!29803))

(declare-fun array_inv!28218 (array!76453) Bool)

(assert (=> start!99930 (array_inv!28218 _keys!1208)))

(assert (=> start!99930 true))

(assert (=> start!99930 tp!88533))

(declare-datatypes ((V!44865 0))(
  ( (V!44866 (val!14958 Int)) )
))
(declare-datatypes ((ValueCell!14192 0))(
  ( (ValueCellFull!14192 (v!17592 V!44865)) (EmptyCell!14192) )
))
(declare-datatypes ((array!76455 0))(
  ( (array!76456 (arr!36871 (Array (_ BitVec 32) ValueCell!14192)) (size!37408 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76455)

(declare-fun e!673276 () Bool)

(declare-fun array_inv!28219 (array!76455) Bool)

(assert (=> start!99930 (and (array_inv!28219 _values!996) e!673276)))

(declare-fun mapNonEmpty!46532 () Bool)

(declare-fun mapRes!46532 () Bool)

(declare-fun tp!88532 () Bool)

(declare-fun e!673283 () Bool)

(assert (=> mapNonEmpty!46532 (= mapRes!46532 (and tp!88532 e!673283))))

(declare-fun mapRest!46532 () (Array (_ BitVec 32) ValueCell!14192))

(declare-fun mapValue!46532 () ValueCell!14192)

(declare-fun mapKey!46532 () (_ BitVec 32))

(assert (=> mapNonEmpty!46532 (= (arr!36871 _values!996) (store mapRest!46532 mapKey!46532 mapValue!46532))))

(declare-fun b!1184038 () Bool)

(assert (=> b!1184038 (= e!673283 tp_is_empty!29803)))

(declare-fun b!1184039 () Bool)

(declare-fun res!786561 () Bool)

(assert (=> b!1184039 (=> (not res!786561) (not e!673277))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1184039 (= res!786561 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!46532 () Bool)

(assert (=> mapIsEmpty!46532 mapRes!46532))

(declare-fun b!1184040 () Bool)

(declare-datatypes ((Unit!39129 0))(
  ( (Unit!39130) )
))
(declare-fun e!673275 () Unit!39129)

(declare-fun Unit!39131 () Unit!39129)

(assert (=> b!1184040 (= e!673275 Unit!39131)))

(declare-fun lt!536019 () Unit!39129)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76453 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39129)

(assert (=> b!1184040 (= lt!536019 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76453 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1184040 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!536024 () Unit!39129)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76453 (_ BitVec 32) (_ BitVec 32)) Unit!39129)

(assert (=> b!1184040 (= lt!536024 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25945 0))(
  ( (Nil!25942) (Cons!25941 (h!27159 (_ BitVec 64)) (t!38202 List!25945)) )
))
(declare-fun arrayNoDuplicates!0 (array!76453 (_ BitVec 32) List!25945) Bool)

(assert (=> b!1184040 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25942)))

(declare-fun lt!536028 () Unit!39129)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76453 (_ BitVec 64) (_ BitVec 32) List!25945) Unit!39129)

(assert (=> b!1184040 (= lt!536028 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25942))))

(assert (=> b!1184040 false))

(declare-fun b!1184041 () Bool)

(declare-fun e!673280 () Bool)

(declare-fun e!673285 () Bool)

(assert (=> b!1184041 (= e!673280 e!673285)))

(declare-fun res!786559 () Bool)

(assert (=> b!1184041 (=> res!786559 e!673285)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1184041 (= res!786559 (not (validKeyInArray!0 (select (arr!36870 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19214 0))(
  ( (tuple2!19215 (_1!9618 (_ BitVec 64)) (_2!9618 V!44865)) )
))
(declare-datatypes ((List!25946 0))(
  ( (Nil!25943) (Cons!25942 (h!27160 tuple2!19214) (t!38203 List!25946)) )
))
(declare-datatypes ((ListLongMap!17191 0))(
  ( (ListLongMap!17192 (toList!8611 List!25946)) )
))
(declare-fun lt!536029 () ListLongMap!17191)

(declare-fun lt!536030 () ListLongMap!17191)

(assert (=> b!1184041 (= lt!536029 lt!536030)))

(declare-fun lt!536035 () ListLongMap!17191)

(declare-fun -!1633 (ListLongMap!17191 (_ BitVec 64)) ListLongMap!17191)

(assert (=> b!1184041 (= lt!536030 (-!1633 lt!536035 k0!934))))

(declare-fun zeroValue!944 () V!44865)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!536023 () array!76453)

(declare-fun lt!536027 () array!76455)

(declare-fun minValue!944 () V!44865)

(declare-fun getCurrentListMapNoExtraKeys!5083 (array!76453 array!76455 (_ BitVec 32) (_ BitVec 32) V!44865 V!44865 (_ BitVec 32) Int) ListLongMap!17191)

(assert (=> b!1184041 (= lt!536029 (getCurrentListMapNoExtraKeys!5083 lt!536023 lt!536027 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1184041 (= lt!536035 (getCurrentListMapNoExtraKeys!5083 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!536034 () Unit!39129)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!856 (array!76453 array!76455 (_ BitVec 32) (_ BitVec 32) V!44865 V!44865 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39129)

(assert (=> b!1184041 (= lt!536034 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!856 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1184042 () Bool)

(declare-fun res!786566 () Bool)

(declare-fun e!673279 () Bool)

(assert (=> b!1184042 (=> (not res!786566) (not e!673279))))

(assert (=> b!1184042 (= res!786566 (arrayNoDuplicates!0 lt!536023 #b00000000000000000000000000000000 Nil!25942))))

(declare-fun b!1184043 () Bool)

(declare-fun e!673286 () Bool)

(assert (=> b!1184043 (= e!673286 tp_is_empty!29803)))

(declare-fun b!1184044 () Bool)

(declare-fun e!673284 () Bool)

(assert (=> b!1184044 (= e!673279 (not e!673284))))

(declare-fun res!786556 () Bool)

(assert (=> b!1184044 (=> res!786556 e!673284)))

(assert (=> b!1184044 (= res!786556 (bvsgt from!1455 i!673))))

(assert (=> b!1184044 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!536020 () Unit!39129)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76453 (_ BitVec 64) (_ BitVec 32)) Unit!39129)

(assert (=> b!1184044 (= lt!536020 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun e!673281 () Bool)

(declare-fun b!1184045 () Bool)

(assert (=> b!1184045 (= e!673281 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1184046 () Bool)

(declare-fun res!786552 () Bool)

(assert (=> b!1184046 (=> (not res!786552) (not e!673277))))

(assert (=> b!1184046 (= res!786552 (validKeyInArray!0 k0!934))))

(declare-fun b!1184047 () Bool)

(declare-fun res!786558 () Bool)

(assert (=> b!1184047 (=> (not res!786558) (not e!673277))))

(assert (=> b!1184047 (= res!786558 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25942))))

(declare-fun b!1184048 () Bool)

(declare-fun res!786553 () Bool)

(assert (=> b!1184048 (=> (not res!786553) (not e!673277))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76453 (_ BitVec 32)) Bool)

(assert (=> b!1184048 (= res!786553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1184049 () Bool)

(declare-fun e!673278 () Bool)

(assert (=> b!1184049 (= e!673278 e!673281)))

(declare-fun res!786564 () Bool)

(assert (=> b!1184049 (=> res!786564 e!673281)))

(assert (=> b!1184049 (= res!786564 (not (= (select (arr!36870 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1184050 () Bool)

(assert (=> b!1184050 (= e!673285 true)))

(declare-fun lt!536022 () ListLongMap!17191)

(declare-fun lt!536031 () ListLongMap!17191)

(assert (=> b!1184050 (= (-!1633 lt!536022 k0!934) lt!536031)))

(declare-fun lt!536033 () Unit!39129)

(declare-fun lt!536025 () V!44865)

(declare-fun addRemoveCommutativeForDiffKeys!147 (ListLongMap!17191 (_ BitVec 64) V!44865 (_ BitVec 64)) Unit!39129)

(assert (=> b!1184050 (= lt!536033 (addRemoveCommutativeForDiffKeys!147 lt!536035 (select (arr!36870 _keys!1208) from!1455) lt!536025 k0!934))))

(declare-fun lt!536026 () ListLongMap!17191)

(assert (=> b!1184050 (and (= lt!536026 lt!536022) (= lt!536030 lt!536029))))

(declare-fun lt!536021 () tuple2!19214)

(declare-fun +!3931 (ListLongMap!17191 tuple2!19214) ListLongMap!17191)

(assert (=> b!1184050 (= lt!536022 (+!3931 lt!536035 lt!536021))))

(assert (=> b!1184050 (not (= (select (arr!36870 _keys!1208) from!1455) k0!934))))

(declare-fun lt!536032 () Unit!39129)

(assert (=> b!1184050 (= lt!536032 e!673275)))

(declare-fun c!117431 () Bool)

(assert (=> b!1184050 (= c!117431 (= (select (arr!36870 _keys!1208) from!1455) k0!934))))

(assert (=> b!1184050 e!673278))

(declare-fun res!786554 () Bool)

(assert (=> b!1184050 (=> (not res!786554) (not e!673278))))

(declare-fun lt!536017 () ListLongMap!17191)

(assert (=> b!1184050 (= res!786554 (= lt!536017 lt!536031))))

(assert (=> b!1184050 (= lt!536031 (+!3931 lt!536030 lt!536021))))

(assert (=> b!1184050 (= lt!536021 (tuple2!19215 (select (arr!36870 _keys!1208) from!1455) lt!536025))))

(declare-fun lt!536018 () V!44865)

(declare-fun get!18900 (ValueCell!14192 V!44865) V!44865)

(assert (=> b!1184050 (= lt!536025 (get!18900 (select (arr!36871 _values!996) from!1455) lt!536018))))

(declare-fun b!1184051 () Bool)

(declare-fun Unit!39132 () Unit!39129)

(assert (=> b!1184051 (= e!673275 Unit!39132)))

(declare-fun b!1184052 () Bool)

(assert (=> b!1184052 (= e!673277 e!673279)))

(declare-fun res!786560 () Bool)

(assert (=> b!1184052 (=> (not res!786560) (not e!673279))))

(assert (=> b!1184052 (= res!786560 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!536023 mask!1564))))

(assert (=> b!1184052 (= lt!536023 (array!76454 (store (arr!36870 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37407 _keys!1208)))))

(declare-fun b!1184053 () Bool)

(declare-fun res!786557 () Bool)

(assert (=> b!1184053 (=> (not res!786557) (not e!673277))))

(assert (=> b!1184053 (= res!786557 (and (= (size!37408 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37407 _keys!1208) (size!37408 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1184054 () Bool)

(assert (=> b!1184054 (= e!673276 (and e!673286 mapRes!46532))))

(declare-fun condMapEmpty!46532 () Bool)

(declare-fun mapDefault!46532 () ValueCell!14192)

(assert (=> b!1184054 (= condMapEmpty!46532 (= (arr!36871 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14192)) mapDefault!46532)))))

(declare-fun b!1184055 () Bool)

(assert (=> b!1184055 (= e!673284 e!673280)))

(declare-fun res!786555 () Bool)

(assert (=> b!1184055 (=> res!786555 e!673280)))

(assert (=> b!1184055 (= res!786555 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1184055 (= lt!536017 (getCurrentListMapNoExtraKeys!5083 lt!536023 lt!536027 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1184055 (= lt!536027 (array!76456 (store (arr!36871 _values!996) i!673 (ValueCellFull!14192 lt!536018)) (size!37408 _values!996)))))

(declare-fun dynLambda!3047 (Int (_ BitVec 64)) V!44865)

(assert (=> b!1184055 (= lt!536018 (dynLambda!3047 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1184055 (= lt!536026 (getCurrentListMapNoExtraKeys!5083 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1184056 () Bool)

(declare-fun res!786565 () Bool)

(assert (=> b!1184056 (=> (not res!786565) (not e!673277))))

(assert (=> b!1184056 (= res!786565 (= (select (arr!36870 _keys!1208) i!673) k0!934))))

(declare-fun b!1184057 () Bool)

(declare-fun res!786563 () Bool)

(assert (=> b!1184057 (=> (not res!786563) (not e!673277))))

(assert (=> b!1184057 (= res!786563 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37407 _keys!1208))))))

(assert (= (and start!99930 res!786562) b!1184039))

(assert (= (and b!1184039 res!786561) b!1184053))

(assert (= (and b!1184053 res!786557) b!1184048))

(assert (= (and b!1184048 res!786553) b!1184047))

(assert (= (and b!1184047 res!786558) b!1184057))

(assert (= (and b!1184057 res!786563) b!1184046))

(assert (= (and b!1184046 res!786552) b!1184056))

(assert (= (and b!1184056 res!786565) b!1184052))

(assert (= (and b!1184052 res!786560) b!1184042))

(assert (= (and b!1184042 res!786566) b!1184044))

(assert (= (and b!1184044 (not res!786556)) b!1184055))

(assert (= (and b!1184055 (not res!786555)) b!1184041))

(assert (= (and b!1184041 (not res!786559)) b!1184050))

(assert (= (and b!1184050 res!786554) b!1184049))

(assert (= (and b!1184049 (not res!786564)) b!1184045))

(assert (= (and b!1184050 c!117431) b!1184040))

(assert (= (and b!1184050 (not c!117431)) b!1184051))

(assert (= (and b!1184054 condMapEmpty!46532) mapIsEmpty!46532))

(assert (= (and b!1184054 (not condMapEmpty!46532)) mapNonEmpty!46532))

(get-info :version)

(assert (= (and mapNonEmpty!46532 ((_ is ValueCellFull!14192) mapValue!46532)) b!1184038))

(assert (= (and b!1184054 ((_ is ValueCellFull!14192) mapDefault!46532)) b!1184043))

(assert (= start!99930 b!1184054))

(declare-fun b_lambda!20411 () Bool)

(assert (=> (not b_lambda!20411) (not b!1184055)))

(declare-fun t!38201 () Bool)

(declare-fun tb!10077 () Bool)

(assert (=> (and start!99930 (= defaultEntry!1004 defaultEntry!1004) t!38201) tb!10077))

(declare-fun result!20729 () Bool)

(assert (=> tb!10077 (= result!20729 tp_is_empty!29803)))

(assert (=> b!1184055 t!38201))

(declare-fun b_and!41417 () Bool)

(assert (= b_and!41415 (and (=> t!38201 result!20729) b_and!41417)))

(declare-fun m!1092387 () Bool)

(assert (=> b!1184047 m!1092387))

(declare-fun m!1092389 () Bool)

(assert (=> b!1184049 m!1092389))

(declare-fun m!1092391 () Bool)

(assert (=> mapNonEmpty!46532 m!1092391))

(declare-fun m!1092393 () Bool)

(assert (=> b!1184046 m!1092393))

(declare-fun m!1092395 () Bool)

(assert (=> b!1184050 m!1092395))

(assert (=> b!1184050 m!1092389))

(declare-fun m!1092397 () Bool)

(assert (=> b!1184050 m!1092397))

(declare-fun m!1092399 () Bool)

(assert (=> b!1184050 m!1092399))

(declare-fun m!1092401 () Bool)

(assert (=> b!1184050 m!1092401))

(declare-fun m!1092403 () Bool)

(assert (=> b!1184050 m!1092403))

(assert (=> b!1184050 m!1092389))

(assert (=> b!1184050 m!1092395))

(declare-fun m!1092405 () Bool)

(assert (=> b!1184050 m!1092405))

(declare-fun m!1092407 () Bool)

(assert (=> b!1184056 m!1092407))

(declare-fun m!1092409 () Bool)

(assert (=> b!1184055 m!1092409))

(declare-fun m!1092411 () Bool)

(assert (=> b!1184055 m!1092411))

(declare-fun m!1092413 () Bool)

(assert (=> b!1184055 m!1092413))

(declare-fun m!1092415 () Bool)

(assert (=> b!1184055 m!1092415))

(declare-fun m!1092417 () Bool)

(assert (=> b!1184042 m!1092417))

(declare-fun m!1092419 () Bool)

(assert (=> b!1184045 m!1092419))

(declare-fun m!1092421 () Bool)

(assert (=> b!1184040 m!1092421))

(declare-fun m!1092423 () Bool)

(assert (=> b!1184040 m!1092423))

(declare-fun m!1092425 () Bool)

(assert (=> b!1184040 m!1092425))

(declare-fun m!1092427 () Bool)

(assert (=> b!1184040 m!1092427))

(declare-fun m!1092429 () Bool)

(assert (=> b!1184040 m!1092429))

(declare-fun m!1092431 () Bool)

(assert (=> b!1184048 m!1092431))

(declare-fun m!1092433 () Bool)

(assert (=> b!1184044 m!1092433))

(declare-fun m!1092435 () Bool)

(assert (=> b!1184044 m!1092435))

(declare-fun m!1092437 () Bool)

(assert (=> b!1184039 m!1092437))

(declare-fun m!1092439 () Bool)

(assert (=> b!1184052 m!1092439))

(declare-fun m!1092441 () Bool)

(assert (=> b!1184052 m!1092441))

(declare-fun m!1092443 () Bool)

(assert (=> b!1184041 m!1092443))

(declare-fun m!1092445 () Bool)

(assert (=> b!1184041 m!1092445))

(declare-fun m!1092447 () Bool)

(assert (=> b!1184041 m!1092447))

(assert (=> b!1184041 m!1092389))

(assert (=> b!1184041 m!1092389))

(declare-fun m!1092449 () Bool)

(assert (=> b!1184041 m!1092449))

(declare-fun m!1092451 () Bool)

(assert (=> b!1184041 m!1092451))

(declare-fun m!1092453 () Bool)

(assert (=> start!99930 m!1092453))

(declare-fun m!1092455 () Bool)

(assert (=> start!99930 m!1092455))

(check-sat (not b!1184047) (not b!1184044) (not b!1184046) tp_is_empty!29803 b_and!41417 (not b!1184055) (not b_lambda!20411) (not b!1184039) (not b!1184050) (not b!1184048) (not b!1184040) (not b!1184045) (not b!1184052) (not mapNonEmpty!46532) (not b!1184041) (not start!99930) (not b!1184042) (not b_next!25273))
(check-sat b_and!41417 (not b_next!25273))
