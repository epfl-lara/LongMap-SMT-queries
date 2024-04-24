; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100044 () Bool)

(assert start!100044)

(declare-fun b_free!25387 () Bool)

(declare-fun b_next!25387 () Bool)

(assert (=> start!100044 (= b_free!25387 (not b_next!25387))))

(declare-fun tp!88874 () Bool)

(declare-fun b_and!41643 () Bool)

(assert (=> start!100044 (= tp!88874 b_and!41643)))

(declare-fun b!1187572 () Bool)

(declare-datatypes ((Unit!39314 0))(
  ( (Unit!39315) )
))
(declare-fun e!675329 () Unit!39314)

(declare-fun Unit!39316 () Unit!39314)

(assert (=> b!1187572 (= e!675329 Unit!39316)))

(declare-fun b!1187573 () Bool)

(declare-fun e!675333 () Bool)

(declare-fun e!675332 () Bool)

(assert (=> b!1187573 (= e!675333 e!675332)))

(declare-fun res!789125 () Bool)

(assert (=> b!1187573 (=> res!789125 e!675332)))

(declare-datatypes ((array!76677 0))(
  ( (array!76678 (arr!36982 (Array (_ BitVec 32) (_ BitVec 64))) (size!37519 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76677)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1187573 (= res!789125 (not (validKeyInArray!0 (select (arr!36982 _keys!1208) from!1455))))))

(declare-datatypes ((V!45017 0))(
  ( (V!45018 (val!15015 Int)) )
))
(declare-datatypes ((tuple2!19310 0))(
  ( (tuple2!19311 (_1!9666 (_ BitVec 64)) (_2!9666 V!45017)) )
))
(declare-datatypes ((List!26045 0))(
  ( (Nil!26042) (Cons!26041 (h!27259 tuple2!19310) (t!38416 List!26045)) )
))
(declare-datatypes ((ListLongMap!17287 0))(
  ( (ListLongMap!17288 (toList!8659 List!26045)) )
))
(declare-fun lt!539271 () ListLongMap!17287)

(declare-fun lt!539266 () ListLongMap!17287)

(assert (=> b!1187573 (= lt!539271 lt!539266)))

(declare-fun lt!539273 () ListLongMap!17287)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1679 (ListLongMap!17287 (_ BitVec 64)) ListLongMap!17287)

(assert (=> b!1187573 (= lt!539266 (-!1679 lt!539273 k0!934))))

(declare-fun zeroValue!944 () V!45017)

(declare-fun lt!539281 () array!76677)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14249 0))(
  ( (ValueCellFull!14249 (v!17649 V!45017)) (EmptyCell!14249) )
))
(declare-datatypes ((array!76679 0))(
  ( (array!76680 (arr!36983 (Array (_ BitVec 32) ValueCell!14249)) (size!37520 (_ BitVec 32))) )
))
(declare-fun lt!539267 () array!76679)

(declare-fun minValue!944 () V!45017)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5128 (array!76677 array!76679 (_ BitVec 32) (_ BitVec 32) V!45017 V!45017 (_ BitVec 32) Int) ListLongMap!17287)

(assert (=> b!1187573 (= lt!539271 (getCurrentListMapNoExtraKeys!5128 lt!539281 lt!539267 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!76679)

(assert (=> b!1187573 (= lt!539273 (getCurrentListMapNoExtraKeys!5128 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lt!539283 () Unit!39314)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!896 (array!76677 array!76679 (_ BitVec 32) (_ BitVec 32) V!45017 V!45017 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39314)

(assert (=> b!1187573 (= lt!539283 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!896 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1187574 () Bool)

(declare-fun res!789121 () Bool)

(declare-fun e!675330 () Bool)

(assert (=> b!1187574 (=> (not res!789121) (not e!675330))))

(assert (=> b!1187574 (= res!789121 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37519 _keys!1208))))))

(declare-fun mapNonEmpty!46703 () Bool)

(declare-fun mapRes!46703 () Bool)

(declare-fun tp!88875 () Bool)

(declare-fun e!675328 () Bool)

(assert (=> mapNonEmpty!46703 (= mapRes!46703 (and tp!88875 e!675328))))

(declare-fun mapKey!46703 () (_ BitVec 32))

(declare-fun mapRest!46703 () (Array (_ BitVec 32) ValueCell!14249))

(declare-fun mapValue!46703 () ValueCell!14249)

(assert (=> mapNonEmpty!46703 (= (arr!36983 _values!996) (store mapRest!46703 mapKey!46703 mapValue!46703))))

(declare-fun res!789130 () Bool)

(assert (=> start!100044 (=> (not res!789130) (not e!675330))))

(assert (=> start!100044 (= res!789130 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37519 _keys!1208))))))

(assert (=> start!100044 e!675330))

(declare-fun tp_is_empty!29917 () Bool)

(assert (=> start!100044 tp_is_empty!29917))

(declare-fun array_inv!28296 (array!76677) Bool)

(assert (=> start!100044 (array_inv!28296 _keys!1208)))

(assert (=> start!100044 true))

(assert (=> start!100044 tp!88874))

(declare-fun e!675331 () Bool)

(declare-fun array_inv!28297 (array!76679) Bool)

(assert (=> start!100044 (and (array_inv!28297 _values!996) e!675331)))

(declare-fun b!1187575 () Bool)

(declare-fun Unit!39317 () Unit!39314)

(assert (=> b!1187575 (= e!675329 Unit!39317)))

(declare-fun lt!539274 () Unit!39314)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76677 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39314)

(assert (=> b!1187575 (= lt!539274 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76677 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1187575 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!539272 () Unit!39314)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76677 (_ BitVec 32) (_ BitVec 32)) Unit!39314)

(assert (=> b!1187575 (= lt!539272 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26046 0))(
  ( (Nil!26043) (Cons!26042 (h!27260 (_ BitVec 64)) (t!38417 List!26046)) )
))
(declare-fun arrayNoDuplicates!0 (array!76677 (_ BitVec 32) List!26046) Bool)

(assert (=> b!1187575 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26043)))

(declare-fun lt!539282 () Unit!39314)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76677 (_ BitVec 64) (_ BitVec 32) List!26046) Unit!39314)

(assert (=> b!1187575 (= lt!539282 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26043))))

(assert (=> b!1187575 false))

(declare-fun b!1187576 () Bool)

(assert (=> b!1187576 (= e!675332 true)))

(declare-fun lt!539284 () ListLongMap!17287)

(declare-fun lt!539276 () ListLongMap!17287)

(assert (=> b!1187576 (= (-!1679 lt!539284 k0!934) lt!539276)))

(declare-fun lt!539280 () Unit!39314)

(declare-fun lt!539275 () V!45017)

(declare-fun addRemoveCommutativeForDiffKeys!192 (ListLongMap!17287 (_ BitVec 64) V!45017 (_ BitVec 64)) Unit!39314)

(assert (=> b!1187576 (= lt!539280 (addRemoveCommutativeForDiffKeys!192 lt!539273 (select (arr!36982 _keys!1208) from!1455) lt!539275 k0!934))))

(declare-fun lt!539277 () ListLongMap!17287)

(assert (=> b!1187576 (and (= lt!539277 lt!539284) (= lt!539266 lt!539271))))

(declare-fun lt!539268 () tuple2!19310)

(declare-fun +!3976 (ListLongMap!17287 tuple2!19310) ListLongMap!17287)

(assert (=> b!1187576 (= lt!539284 (+!3976 lt!539273 lt!539268))))

(assert (=> b!1187576 (not (= (select (arr!36982 _keys!1208) from!1455) k0!934))))

(declare-fun lt!539278 () Unit!39314)

(assert (=> b!1187576 (= lt!539278 e!675329)))

(declare-fun c!117602 () Bool)

(assert (=> b!1187576 (= c!117602 (= (select (arr!36982 _keys!1208) from!1455) k0!934))))

(declare-fun e!675337 () Bool)

(assert (=> b!1187576 e!675337))

(declare-fun res!789127 () Bool)

(assert (=> b!1187576 (=> (not res!789127) (not e!675337))))

(declare-fun lt!539279 () ListLongMap!17287)

(assert (=> b!1187576 (= res!789127 (= lt!539279 lt!539276))))

(assert (=> b!1187576 (= lt!539276 (+!3976 lt!539266 lt!539268))))

(assert (=> b!1187576 (= lt!539268 (tuple2!19311 (select (arr!36982 _keys!1208) from!1455) lt!539275))))

(declare-fun lt!539269 () V!45017)

(declare-fun get!18983 (ValueCell!14249 V!45017) V!45017)

(assert (=> b!1187576 (= lt!539275 (get!18983 (select (arr!36983 _values!996) from!1455) lt!539269))))

(declare-fun b!1187577 () Bool)

(declare-fun res!789128 () Bool)

(assert (=> b!1187577 (=> (not res!789128) (not e!675330))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1187577 (= res!789128 (validMask!0 mask!1564))))

(declare-fun b!1187578 () Bool)

(declare-fun res!789124 () Bool)

(assert (=> b!1187578 (=> (not res!789124) (not e!675330))))

(assert (=> b!1187578 (= res!789124 (and (= (size!37520 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37519 _keys!1208) (size!37520 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1187579 () Bool)

(declare-fun res!789123 () Bool)

(assert (=> b!1187579 (=> (not res!789123) (not e!675330))))

(assert (=> b!1187579 (= res!789123 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26043))))

(declare-fun b!1187580 () Bool)

(declare-fun res!789131 () Bool)

(assert (=> b!1187580 (=> (not res!789131) (not e!675330))))

(assert (=> b!1187580 (= res!789131 (validKeyInArray!0 k0!934))))

(declare-fun b!1187581 () Bool)

(declare-fun res!789117 () Bool)

(assert (=> b!1187581 (=> (not res!789117) (not e!675330))))

(assert (=> b!1187581 (= res!789117 (= (select (arr!36982 _keys!1208) i!673) k0!934))))

(declare-fun b!1187582 () Bool)

(declare-fun e!675335 () Bool)

(assert (=> b!1187582 (= e!675335 tp_is_empty!29917)))

(declare-fun mapIsEmpty!46703 () Bool)

(assert (=> mapIsEmpty!46703 mapRes!46703))

(declare-fun b!1187583 () Bool)

(declare-fun res!789118 () Bool)

(assert (=> b!1187583 (=> (not res!789118) (not e!675330))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76677 (_ BitVec 32)) Bool)

(assert (=> b!1187583 (= res!789118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1187584 () Bool)

(declare-fun e!675336 () Bool)

(assert (=> b!1187584 (= e!675337 e!675336)))

(declare-fun res!789129 () Bool)

(assert (=> b!1187584 (=> res!789129 e!675336)))

(assert (=> b!1187584 (= res!789129 (not (= (select (arr!36982 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1187585 () Bool)

(declare-fun e!675334 () Bool)

(assert (=> b!1187585 (= e!675334 e!675333)))

(declare-fun res!789126 () Bool)

(assert (=> b!1187585 (=> res!789126 e!675333)))

(assert (=> b!1187585 (= res!789126 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1187585 (= lt!539279 (getCurrentListMapNoExtraKeys!5128 lt!539281 lt!539267 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1187585 (= lt!539267 (array!76680 (store (arr!36983 _values!996) i!673 (ValueCellFull!14249 lt!539269)) (size!37520 _values!996)))))

(declare-fun dynLambda!3088 (Int (_ BitVec 64)) V!45017)

(assert (=> b!1187585 (= lt!539269 (dynLambda!3088 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1187585 (= lt!539277 (getCurrentListMapNoExtraKeys!5128 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1187586 () Bool)

(assert (=> b!1187586 (= e!675336 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1187587 () Bool)

(declare-fun e!675327 () Bool)

(assert (=> b!1187587 (= e!675327 (not e!675334))))

(declare-fun res!789122 () Bool)

(assert (=> b!1187587 (=> res!789122 e!675334)))

(assert (=> b!1187587 (= res!789122 (bvsgt from!1455 i!673))))

(assert (=> b!1187587 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!539270 () Unit!39314)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76677 (_ BitVec 64) (_ BitVec 32)) Unit!39314)

(assert (=> b!1187587 (= lt!539270 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1187588 () Bool)

(assert (=> b!1187588 (= e!675330 e!675327)))

(declare-fun res!789119 () Bool)

(assert (=> b!1187588 (=> (not res!789119) (not e!675327))))

(assert (=> b!1187588 (= res!789119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!539281 mask!1564))))

(assert (=> b!1187588 (= lt!539281 (array!76678 (store (arr!36982 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37519 _keys!1208)))))

(declare-fun b!1187589 () Bool)

(declare-fun res!789120 () Bool)

(assert (=> b!1187589 (=> (not res!789120) (not e!675327))))

(assert (=> b!1187589 (= res!789120 (arrayNoDuplicates!0 lt!539281 #b00000000000000000000000000000000 Nil!26043))))

(declare-fun b!1187590 () Bool)

(assert (=> b!1187590 (= e!675331 (and e!675335 mapRes!46703))))

(declare-fun condMapEmpty!46703 () Bool)

(declare-fun mapDefault!46703 () ValueCell!14249)

(assert (=> b!1187590 (= condMapEmpty!46703 (= (arr!36983 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14249)) mapDefault!46703)))))

(declare-fun b!1187591 () Bool)

(assert (=> b!1187591 (= e!675328 tp_is_empty!29917)))

(assert (= (and start!100044 res!789130) b!1187577))

(assert (= (and b!1187577 res!789128) b!1187578))

(assert (= (and b!1187578 res!789124) b!1187583))

(assert (= (and b!1187583 res!789118) b!1187579))

(assert (= (and b!1187579 res!789123) b!1187574))

(assert (= (and b!1187574 res!789121) b!1187580))

(assert (= (and b!1187580 res!789131) b!1187581))

(assert (= (and b!1187581 res!789117) b!1187588))

(assert (= (and b!1187588 res!789119) b!1187589))

(assert (= (and b!1187589 res!789120) b!1187587))

(assert (= (and b!1187587 (not res!789122)) b!1187585))

(assert (= (and b!1187585 (not res!789126)) b!1187573))

(assert (= (and b!1187573 (not res!789125)) b!1187576))

(assert (= (and b!1187576 res!789127) b!1187584))

(assert (= (and b!1187584 (not res!789129)) b!1187586))

(assert (= (and b!1187576 c!117602) b!1187575))

(assert (= (and b!1187576 (not c!117602)) b!1187572))

(assert (= (and b!1187590 condMapEmpty!46703) mapIsEmpty!46703))

(assert (= (and b!1187590 (not condMapEmpty!46703)) mapNonEmpty!46703))

(get-info :version)

(assert (= (and mapNonEmpty!46703 ((_ is ValueCellFull!14249) mapValue!46703)) b!1187591))

(assert (= (and b!1187590 ((_ is ValueCellFull!14249) mapDefault!46703)) b!1187582))

(assert (= start!100044 b!1187590))

(declare-fun b_lambda!20525 () Bool)

(assert (=> (not b_lambda!20525) (not b!1187585)))

(declare-fun t!38415 () Bool)

(declare-fun tb!10191 () Bool)

(assert (=> (and start!100044 (= defaultEntry!1004 defaultEntry!1004) t!38415) tb!10191))

(declare-fun result!20957 () Bool)

(assert (=> tb!10191 (= result!20957 tp_is_empty!29917)))

(assert (=> b!1187585 t!38415))

(declare-fun b_and!41645 () Bool)

(assert (= b_and!41643 (and (=> t!38415 result!20957) b_and!41645)))

(declare-fun m!1096377 () Bool)

(assert (=> b!1187579 m!1096377))

(declare-fun m!1096379 () Bool)

(assert (=> b!1187589 m!1096379))

(declare-fun m!1096381 () Bool)

(assert (=> start!100044 m!1096381))

(declare-fun m!1096383 () Bool)

(assert (=> start!100044 m!1096383))

(declare-fun m!1096385 () Bool)

(assert (=> b!1187580 m!1096385))

(declare-fun m!1096387 () Bool)

(assert (=> b!1187581 m!1096387))

(declare-fun m!1096389 () Bool)

(assert (=> b!1187573 m!1096389))

(declare-fun m!1096391 () Bool)

(assert (=> b!1187573 m!1096391))

(declare-fun m!1096393 () Bool)

(assert (=> b!1187573 m!1096393))

(declare-fun m!1096395 () Bool)

(assert (=> b!1187573 m!1096395))

(declare-fun m!1096397 () Bool)

(assert (=> b!1187573 m!1096397))

(declare-fun m!1096399 () Bool)

(assert (=> b!1187573 m!1096399))

(assert (=> b!1187573 m!1096395))

(declare-fun m!1096401 () Bool)

(assert (=> b!1187583 m!1096401))

(declare-fun m!1096403 () Bool)

(assert (=> mapNonEmpty!46703 m!1096403))

(declare-fun m!1096405 () Bool)

(assert (=> b!1187575 m!1096405))

(declare-fun m!1096407 () Bool)

(assert (=> b!1187575 m!1096407))

(declare-fun m!1096409 () Bool)

(assert (=> b!1187575 m!1096409))

(declare-fun m!1096411 () Bool)

(assert (=> b!1187575 m!1096411))

(declare-fun m!1096413 () Bool)

(assert (=> b!1187575 m!1096413))

(declare-fun m!1096415 () Bool)

(assert (=> b!1187587 m!1096415))

(declare-fun m!1096417 () Bool)

(assert (=> b!1187587 m!1096417))

(declare-fun m!1096419 () Bool)

(assert (=> b!1187585 m!1096419))

(declare-fun m!1096421 () Bool)

(assert (=> b!1187585 m!1096421))

(declare-fun m!1096423 () Bool)

(assert (=> b!1187585 m!1096423))

(declare-fun m!1096425 () Bool)

(assert (=> b!1187585 m!1096425))

(declare-fun m!1096427 () Bool)

(assert (=> b!1187586 m!1096427))

(assert (=> b!1187584 m!1096395))

(declare-fun m!1096429 () Bool)

(assert (=> b!1187588 m!1096429))

(declare-fun m!1096431 () Bool)

(assert (=> b!1187588 m!1096431))

(declare-fun m!1096433 () Bool)

(assert (=> b!1187577 m!1096433))

(declare-fun m!1096435 () Bool)

(assert (=> b!1187576 m!1096435))

(declare-fun m!1096437 () Bool)

(assert (=> b!1187576 m!1096437))

(declare-fun m!1096439 () Bool)

(assert (=> b!1187576 m!1096439))

(assert (=> b!1187576 m!1096395))

(declare-fun m!1096441 () Bool)

(assert (=> b!1187576 m!1096441))

(declare-fun m!1096443 () Bool)

(assert (=> b!1187576 m!1096443))

(assert (=> b!1187576 m!1096435))

(declare-fun m!1096445 () Bool)

(assert (=> b!1187576 m!1096445))

(assert (=> b!1187576 m!1096395))

(check-sat (not b!1187588) b_and!41645 (not mapNonEmpty!46703) (not b!1187577) (not b!1187586) (not b!1187573) (not b!1187589) (not b!1187580) (not b_lambda!20525) (not b!1187579) (not b!1187583) (not b!1187585) tp_is_empty!29917 (not b_next!25387) (not b!1187576) (not b!1187575) (not b!1187587) (not start!100044))
(check-sat b_and!41645 (not b_next!25387))
