; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99786 () Bool)

(assert start!99786)

(declare-fun b_free!25129 () Bool)

(declare-fun b_next!25129 () Bool)

(assert (=> start!99786 (= b_free!25129 (not b_next!25129))))

(declare-fun tp!88100 () Bool)

(declare-fun b_and!41127 () Bool)

(assert (=> start!99786 (= tp!88100 b_and!41127)))

(declare-fun b!1179324 () Bool)

(declare-fun e!670533 () Bool)

(declare-fun tp_is_empty!29659 () Bool)

(assert (=> b!1179324 (= e!670533 tp_is_empty!29659)))

(declare-fun mapNonEmpty!46316 () Bool)

(declare-fun mapRes!46316 () Bool)

(declare-fun tp!88101 () Bool)

(declare-fun e!670532 () Bool)

(assert (=> mapNonEmpty!46316 (= mapRes!46316 (and tp!88101 e!670532))))

(declare-datatypes ((V!44673 0))(
  ( (V!44674 (val!14886 Int)) )
))
(declare-datatypes ((ValueCell!14120 0))(
  ( (ValueCellFull!14120 (v!17520 V!44673)) (EmptyCell!14120) )
))
(declare-fun mapValue!46316 () ValueCell!14120)

(declare-fun mapRest!46316 () (Array (_ BitVec 32) ValueCell!14120))

(declare-datatypes ((array!76171 0))(
  ( (array!76172 (arr!36729 (Array (_ BitVec 32) ValueCell!14120)) (size!37266 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76171)

(declare-fun mapKey!46316 () (_ BitVec 32))

(assert (=> mapNonEmpty!46316 (= (arr!36729 _values!996) (store mapRest!46316 mapKey!46316 mapValue!46316))))

(declare-fun b!1179325 () Bool)

(declare-fun res!783067 () Bool)

(declare-fun e!670535 () Bool)

(assert (=> b!1179325 (=> (not res!783067) (not e!670535))))

(declare-datatypes ((array!76173 0))(
  ( (array!76174 (arr!36730 (Array (_ BitVec 32) (_ BitVec 64))) (size!37267 (_ BitVec 32))) )
))
(declare-fun lt!532565 () array!76173)

(declare-datatypes ((List!25825 0))(
  ( (Nil!25822) (Cons!25821 (h!27039 (_ BitVec 64)) (t!37938 List!25825)) )
))
(declare-fun arrayNoDuplicates!0 (array!76173 (_ BitVec 32) List!25825) Bool)

(assert (=> b!1179325 (= res!783067 (arrayNoDuplicates!0 lt!532565 #b00000000000000000000000000000000 Nil!25822))))

(declare-fun b!1179326 () Bool)

(declare-fun res!783065 () Bool)

(declare-fun e!670529 () Bool)

(assert (=> b!1179326 (=> (not res!783065) (not e!670529))))

(declare-fun _keys!1208 () array!76173)

(assert (=> b!1179326 (= res!783065 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25822))))

(declare-fun b!1179327 () Bool)

(assert (=> b!1179327 (= e!670532 tp_is_empty!29659)))

(declare-fun e!670523 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun b!1179328 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76173 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1179328 (= e!670523 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1179329 () Bool)

(assert (=> b!1179329 (= e!670529 e!670535)))

(declare-fun res!783069 () Bool)

(assert (=> b!1179329 (=> (not res!783069) (not e!670535))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76173 (_ BitVec 32)) Bool)

(assert (=> b!1179329 (= res!783069 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!532565 mask!1564))))

(assert (=> b!1179329 (= lt!532565 (array!76174 (store (arr!36730 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37267 _keys!1208)))))

(declare-fun b!1179330 () Bool)

(declare-fun res!783068 () Bool)

(assert (=> b!1179330 (=> (not res!783068) (not e!670529))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1179330 (= res!783068 (validKeyInArray!0 k0!934))))

(declare-fun b!1179331 () Bool)

(declare-fun e!670526 () Bool)

(declare-fun e!670525 () Bool)

(assert (=> b!1179331 (= e!670526 e!670525)))

(declare-fun res!783077 () Bool)

(assert (=> b!1179331 (=> res!783077 e!670525)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1179331 (= res!783077 (not (validKeyInArray!0 (select (arr!36730 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19092 0))(
  ( (tuple2!19093 (_1!9557 (_ BitVec 64)) (_2!9557 V!44673)) )
))
(declare-datatypes ((List!25826 0))(
  ( (Nil!25823) (Cons!25822 (h!27040 tuple2!19092) (t!37939 List!25826)) )
))
(declare-datatypes ((ListLongMap!17069 0))(
  ( (ListLongMap!17070 (toList!8550 List!25826)) )
))
(declare-fun lt!532560 () ListLongMap!17069)

(declare-fun lt!532563 () ListLongMap!17069)

(assert (=> b!1179331 (= lt!532560 lt!532563)))

(declare-fun lt!532564 () ListLongMap!17069)

(declare-fun -!1583 (ListLongMap!17069 (_ BitVec 64)) ListLongMap!17069)

(assert (=> b!1179331 (= lt!532563 (-!1583 lt!532564 k0!934))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44673)

(declare-fun zeroValue!944 () V!44673)

(declare-fun lt!532567 () array!76171)

(declare-fun getCurrentListMapNoExtraKeys!5029 (array!76173 array!76171 (_ BitVec 32) (_ BitVec 32) V!44673 V!44673 (_ BitVec 32) Int) ListLongMap!17069)

(assert (=> b!1179331 (= lt!532560 (getCurrentListMapNoExtraKeys!5029 lt!532565 lt!532567 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1179331 (= lt!532564 (getCurrentListMapNoExtraKeys!5029 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38905 0))(
  ( (Unit!38906) )
))
(declare-fun lt!532558 () Unit!38905)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!808 (array!76173 array!76171 (_ BitVec 32) (_ BitVec 32) V!44673 V!44673 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38905)

(assert (=> b!1179331 (= lt!532558 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!808 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1179332 () Bool)

(declare-fun e!670531 () Unit!38905)

(declare-fun Unit!38907 () Unit!38905)

(assert (=> b!1179332 (= e!670531 Unit!38907)))

(declare-fun lt!532553 () Unit!38905)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76173 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38905)

(assert (=> b!1179332 (= lt!532553 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1179332 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!532554 () Unit!38905)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76173 (_ BitVec 32) (_ BitVec 32)) Unit!38905)

(assert (=> b!1179332 (= lt!532554 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1179332 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25822)))

(declare-fun lt!532557 () Unit!38905)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76173 (_ BitVec 64) (_ BitVec 32) List!25825) Unit!38905)

(assert (=> b!1179332 (= lt!532557 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25822))))

(assert (=> b!1179332 false))

(declare-fun b!1179333 () Bool)

(declare-fun res!783072 () Bool)

(assert (=> b!1179333 (=> (not res!783072) (not e!670529))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1179333 (= res!783072 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!46316 () Bool)

(assert (=> mapIsEmpty!46316 mapRes!46316))

(declare-fun b!1179334 () Bool)

(declare-fun Unit!38908 () Unit!38905)

(assert (=> b!1179334 (= e!670531 Unit!38908)))

(declare-fun b!1179335 () Bool)

(assert (=> b!1179335 (= e!670525 true)))

(declare-fun e!670530 () Bool)

(assert (=> b!1179335 e!670530))

(declare-fun res!783074 () Bool)

(assert (=> b!1179335 (=> (not res!783074) (not e!670530))))

(assert (=> b!1179335 (= res!783074 (not (= (select (arr!36730 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!532562 () Unit!38905)

(assert (=> b!1179335 (= lt!532562 e!670531)))

(declare-fun c!117215 () Bool)

(assert (=> b!1179335 (= c!117215 (= (select (arr!36730 _keys!1208) from!1455) k0!934))))

(declare-fun e!670527 () Bool)

(assert (=> b!1179335 e!670527))

(declare-fun res!783063 () Bool)

(assert (=> b!1179335 (=> (not res!783063) (not e!670527))))

(declare-fun lt!532555 () tuple2!19092)

(declare-fun lt!532559 () ListLongMap!17069)

(declare-fun +!3876 (ListLongMap!17069 tuple2!19092) ListLongMap!17069)

(assert (=> b!1179335 (= res!783063 (= lt!532559 (+!3876 lt!532563 lt!532555)))))

(declare-fun lt!532566 () V!44673)

(declare-fun get!18802 (ValueCell!14120 V!44673) V!44673)

(assert (=> b!1179335 (= lt!532555 (tuple2!19093 (select (arr!36730 _keys!1208) from!1455) (get!18802 (select (arr!36729 _values!996) from!1455) lt!532566)))))

(declare-fun lt!532556 () ListLongMap!17069)

(declare-fun b!1179336 () Bool)

(assert (=> b!1179336 (= e!670530 (= lt!532556 (+!3876 lt!532564 lt!532555)))))

(declare-fun b!1179337 () Bool)

(declare-fun res!783064 () Bool)

(assert (=> b!1179337 (=> (not res!783064) (not e!670529))))

(assert (=> b!1179337 (= res!783064 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37267 _keys!1208))))))

(declare-fun b!1179338 () Bool)

(declare-fun e!670534 () Bool)

(assert (=> b!1179338 (= e!670534 (and e!670533 mapRes!46316))))

(declare-fun condMapEmpty!46316 () Bool)

(declare-fun mapDefault!46316 () ValueCell!14120)

(assert (=> b!1179338 (= condMapEmpty!46316 (= (arr!36729 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14120)) mapDefault!46316)))))

(declare-fun b!1179339 () Bool)

(declare-fun e!670524 () Bool)

(assert (=> b!1179339 (= e!670524 e!670526)))

(declare-fun res!783075 () Bool)

(assert (=> b!1179339 (=> res!783075 e!670526)))

(assert (=> b!1179339 (= res!783075 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1179339 (= lt!532559 (getCurrentListMapNoExtraKeys!5029 lt!532565 lt!532567 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1179339 (= lt!532567 (array!76172 (store (arr!36729 _values!996) i!673 (ValueCellFull!14120 lt!532566)) (size!37266 _values!996)))))

(declare-fun dynLambda!3001 (Int (_ BitVec 64)) V!44673)

(assert (=> b!1179339 (= lt!532566 (dynLambda!3001 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1179339 (= lt!532556 (getCurrentListMapNoExtraKeys!5029 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1179340 () Bool)

(declare-fun res!783066 () Bool)

(assert (=> b!1179340 (=> (not res!783066) (not e!670529))))

(assert (=> b!1179340 (= res!783066 (and (= (size!37266 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37267 _keys!1208) (size!37266 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1179341 () Bool)

(assert (=> b!1179341 (= e!670535 (not e!670524))))

(declare-fun res!783070 () Bool)

(assert (=> b!1179341 (=> res!783070 e!670524)))

(assert (=> b!1179341 (= res!783070 (bvsgt from!1455 i!673))))

(assert (=> b!1179341 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!532561 () Unit!38905)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76173 (_ BitVec 64) (_ BitVec 32)) Unit!38905)

(assert (=> b!1179341 (= lt!532561 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1179342 () Bool)

(declare-fun res!783071 () Bool)

(assert (=> b!1179342 (=> (not res!783071) (not e!670529))))

(assert (=> b!1179342 (= res!783071 (= (select (arr!36730 _keys!1208) i!673) k0!934))))

(declare-fun b!1179343 () Bool)

(declare-fun res!783076 () Bool)

(assert (=> b!1179343 (=> (not res!783076) (not e!670529))))

(assert (=> b!1179343 (= res!783076 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1179344 () Bool)

(assert (=> b!1179344 (= e!670527 e!670523)))

(declare-fun res!783073 () Bool)

(assert (=> b!1179344 (=> res!783073 e!670523)))

(assert (=> b!1179344 (= res!783073 (not (= (select (arr!36730 _keys!1208) from!1455) k0!934)))))

(declare-fun res!783062 () Bool)

(assert (=> start!99786 (=> (not res!783062) (not e!670529))))

(assert (=> start!99786 (= res!783062 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37267 _keys!1208))))))

(assert (=> start!99786 e!670529))

(assert (=> start!99786 tp_is_empty!29659))

(declare-fun array_inv!28120 (array!76173) Bool)

(assert (=> start!99786 (array_inv!28120 _keys!1208)))

(assert (=> start!99786 true))

(assert (=> start!99786 tp!88100))

(declare-fun array_inv!28121 (array!76171) Bool)

(assert (=> start!99786 (and (array_inv!28121 _values!996) e!670534)))

(assert (= (and start!99786 res!783062) b!1179333))

(assert (= (and b!1179333 res!783072) b!1179340))

(assert (= (and b!1179340 res!783066) b!1179343))

(assert (= (and b!1179343 res!783076) b!1179326))

(assert (= (and b!1179326 res!783065) b!1179337))

(assert (= (and b!1179337 res!783064) b!1179330))

(assert (= (and b!1179330 res!783068) b!1179342))

(assert (= (and b!1179342 res!783071) b!1179329))

(assert (= (and b!1179329 res!783069) b!1179325))

(assert (= (and b!1179325 res!783067) b!1179341))

(assert (= (and b!1179341 (not res!783070)) b!1179339))

(assert (= (and b!1179339 (not res!783075)) b!1179331))

(assert (= (and b!1179331 (not res!783077)) b!1179335))

(assert (= (and b!1179335 res!783063) b!1179344))

(assert (= (and b!1179344 (not res!783073)) b!1179328))

(assert (= (and b!1179335 c!117215) b!1179332))

(assert (= (and b!1179335 (not c!117215)) b!1179334))

(assert (= (and b!1179335 res!783074) b!1179336))

(assert (= (and b!1179338 condMapEmpty!46316) mapIsEmpty!46316))

(assert (= (and b!1179338 (not condMapEmpty!46316)) mapNonEmpty!46316))

(get-info :version)

(assert (= (and mapNonEmpty!46316 ((_ is ValueCellFull!14120) mapValue!46316)) b!1179327))

(assert (= (and b!1179338 ((_ is ValueCellFull!14120) mapDefault!46316)) b!1179324))

(assert (= start!99786 b!1179338))

(declare-fun b_lambda!20267 () Bool)

(assert (=> (not b_lambda!20267) (not b!1179339)))

(declare-fun t!37937 () Bool)

(declare-fun tb!9933 () Bool)

(assert (=> (and start!99786 (= defaultEntry!1004 defaultEntry!1004) t!37937) tb!9933))

(declare-fun result!20441 () Bool)

(assert (=> tb!9933 (= result!20441 tp_is_empty!29659)))

(assert (=> b!1179339 t!37937))

(declare-fun b_and!41129 () Bool)

(assert (= b_and!41127 (and (=> t!37937 result!20441) b_and!41129)))

(declare-fun m!1087563 () Bool)

(assert (=> start!99786 m!1087563))

(declare-fun m!1087565 () Bool)

(assert (=> start!99786 m!1087565))

(declare-fun m!1087567 () Bool)

(assert (=> b!1179335 m!1087567))

(declare-fun m!1087569 () Bool)

(assert (=> b!1179335 m!1087569))

(declare-fun m!1087571 () Bool)

(assert (=> b!1179335 m!1087571))

(assert (=> b!1179335 m!1087571))

(declare-fun m!1087573 () Bool)

(assert (=> b!1179335 m!1087573))

(declare-fun m!1087575 () Bool)

(assert (=> b!1179329 m!1087575))

(declare-fun m!1087577 () Bool)

(assert (=> b!1179329 m!1087577))

(declare-fun m!1087579 () Bool)

(assert (=> b!1179343 m!1087579))

(declare-fun m!1087581 () Bool)

(assert (=> b!1179332 m!1087581))

(declare-fun m!1087583 () Bool)

(assert (=> b!1179332 m!1087583))

(declare-fun m!1087585 () Bool)

(assert (=> b!1179332 m!1087585))

(declare-fun m!1087587 () Bool)

(assert (=> b!1179332 m!1087587))

(declare-fun m!1087589 () Bool)

(assert (=> b!1179332 m!1087589))

(declare-fun m!1087591 () Bool)

(assert (=> b!1179336 m!1087591))

(declare-fun m!1087593 () Bool)

(assert (=> b!1179341 m!1087593))

(declare-fun m!1087595 () Bool)

(assert (=> b!1179341 m!1087595))

(declare-fun m!1087597 () Bool)

(assert (=> b!1179325 m!1087597))

(declare-fun m!1087599 () Bool)

(assert (=> b!1179328 m!1087599))

(declare-fun m!1087601 () Bool)

(assert (=> b!1179330 m!1087601))

(declare-fun m!1087603 () Bool)

(assert (=> b!1179339 m!1087603))

(declare-fun m!1087605 () Bool)

(assert (=> b!1179339 m!1087605))

(declare-fun m!1087607 () Bool)

(assert (=> b!1179339 m!1087607))

(declare-fun m!1087609 () Bool)

(assert (=> b!1179339 m!1087609))

(declare-fun m!1087611 () Bool)

(assert (=> b!1179342 m!1087611))

(declare-fun m!1087613 () Bool)

(assert (=> b!1179333 m!1087613))

(declare-fun m!1087615 () Bool)

(assert (=> b!1179331 m!1087615))

(declare-fun m!1087617 () Bool)

(assert (=> b!1179331 m!1087617))

(assert (=> b!1179331 m!1087567))

(declare-fun m!1087619 () Bool)

(assert (=> b!1179331 m!1087619))

(declare-fun m!1087621 () Bool)

(assert (=> b!1179331 m!1087621))

(declare-fun m!1087623 () Bool)

(assert (=> b!1179331 m!1087623))

(assert (=> b!1179331 m!1087567))

(assert (=> b!1179344 m!1087567))

(declare-fun m!1087625 () Bool)

(assert (=> b!1179326 m!1087625))

(declare-fun m!1087627 () Bool)

(assert (=> mapNonEmpty!46316 m!1087627))

(check-sat (not b!1179341) (not start!99786) (not b!1179326) (not b!1179332) (not b!1179339) (not b_lambda!20267) (not b!1179328) tp_is_empty!29659 (not b!1179336) (not b_next!25129) (not mapNonEmpty!46316) (not b!1179333) (not b!1179343) b_and!41129 (not b!1179335) (not b!1179329) (not b!1179325) (not b!1179330) (not b!1179331))
(check-sat b_and!41129 (not b_next!25129))
