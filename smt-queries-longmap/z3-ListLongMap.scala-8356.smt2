; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101954 () Bool)

(assert start!101954)

(declare-fun b_free!26407 () Bool)

(declare-fun b_next!26407 () Bool)

(assert (=> start!101954 (= b_free!26407 (not b_next!26407))))

(declare-fun tp!92266 () Bool)

(declare-fun b_and!44077 () Bool)

(assert (=> start!101954 (= tp!92266 b_and!44077)))

(declare-fun b!1225316 () Bool)

(declare-fun e!696020 () Bool)

(declare-fun e!696027 () Bool)

(assert (=> b!1225316 (= e!696020 e!696027)))

(declare-fun res!813835 () Bool)

(assert (=> b!1225316 (=> res!813835 e!696027)))

(declare-datatypes ((array!79043 0))(
  ( (array!79044 (arr!38142 (Array (_ BitVec 32) (_ BitVec 64))) (size!38679 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!79043)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1225316 (= res!813835 (not (= (select (arr!38142 _keys!1208) from!1455) k0!934)))))

(declare-fun res!813834 () Bool)

(declare-fun e!696029 () Bool)

(assert (=> start!101954 (=> (not res!813834) (not e!696029))))

(assert (=> start!101954 (= res!813834 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38679 _keys!1208))))))

(assert (=> start!101954 e!696029))

(declare-fun tp_is_empty!31111 () Bool)

(assert (=> start!101954 tp_is_empty!31111))

(declare-fun array_inv!29096 (array!79043) Bool)

(assert (=> start!101954 (array_inv!29096 _keys!1208)))

(assert (=> start!101954 true))

(assert (=> start!101954 tp!92266))

(declare-datatypes ((V!46609 0))(
  ( (V!46610 (val!15612 Int)) )
))
(declare-datatypes ((ValueCell!14846 0))(
  ( (ValueCellFull!14846 (v!18270 V!46609)) (EmptyCell!14846) )
))
(declare-datatypes ((array!79045 0))(
  ( (array!79046 (arr!38143 (Array (_ BitVec 32) ValueCell!14846)) (size!38680 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!79045)

(declare-fun e!696028 () Bool)

(declare-fun array_inv!29097 (array!79045) Bool)

(assert (=> start!101954 (and (array_inv!29097 _values!996) e!696028)))

(declare-fun mapIsEmpty!48565 () Bool)

(declare-fun mapRes!48565 () Bool)

(assert (=> mapIsEmpty!48565 mapRes!48565))

(declare-fun b!1225317 () Bool)

(declare-datatypes ((Unit!40515 0))(
  ( (Unit!40516) )
))
(declare-fun e!696023 () Unit!40515)

(declare-fun Unit!40517 () Unit!40515)

(assert (=> b!1225317 (= e!696023 Unit!40517)))

(declare-fun lt!557735 () Unit!40515)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!79043 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40515)

(assert (=> b!1225317 (= lt!557735 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!79043 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1225317 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!557741 () Unit!40515)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!79043 (_ BitVec 32) (_ BitVec 32)) Unit!40515)

(assert (=> b!1225317 (= lt!557741 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26941 0))(
  ( (Nil!26938) (Cons!26937 (h!28155 (_ BitVec 64)) (t!40320 List!26941)) )
))
(declare-fun arrayNoDuplicates!0 (array!79043 (_ BitVec 32) List!26941) Bool)

(assert (=> b!1225317 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26938)))

(declare-fun lt!557730 () Unit!40515)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!79043 (_ BitVec 64) (_ BitVec 32) List!26941) Unit!40515)

(assert (=> b!1225317 (= lt!557730 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26938))))

(assert (=> b!1225317 false))

(declare-fun b!1225318 () Bool)

(declare-fun e!696026 () Bool)

(assert (=> b!1225318 (= e!696026 tp_is_empty!31111)))

(declare-fun b!1225319 () Bool)

(declare-fun e!696031 () Bool)

(declare-datatypes ((tuple2!20126 0))(
  ( (tuple2!20127 (_1!10074 (_ BitVec 64)) (_2!10074 V!46609)) )
))
(declare-datatypes ((List!26942 0))(
  ( (Nil!26939) (Cons!26938 (h!28156 tuple2!20126) (t!40321 List!26942)) )
))
(declare-datatypes ((ListLongMap!18103 0))(
  ( (ListLongMap!18104 (toList!9067 List!26942)) )
))
(declare-fun lt!557733 () ListLongMap!18103)

(declare-fun lt!557734 () ListLongMap!18103)

(assert (=> b!1225319 (= e!696031 (= lt!557733 lt!557734))))

(declare-fun b!1225320 () Bool)

(declare-fun res!813839 () Bool)

(assert (=> b!1225320 (=> (not res!813839) (not e!696029))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79043 (_ BitVec 32)) Bool)

(assert (=> b!1225320 (= res!813839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1225321 () Bool)

(declare-fun e!696022 () Bool)

(assert (=> b!1225321 (= e!696022 tp_is_empty!31111)))

(declare-fun b!1225322 () Bool)

(declare-fun e!696019 () Bool)

(declare-fun e!696021 () Bool)

(assert (=> b!1225322 (= e!696019 e!696021)))

(declare-fun res!813837 () Bool)

(assert (=> b!1225322 (=> res!813837 e!696021)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1225322 (= res!813837 (not (validKeyInArray!0 (select (arr!38142 _keys!1208) from!1455))))))

(assert (=> b!1225322 (= lt!557734 lt!557733)))

(declare-fun lt!557731 () ListLongMap!18103)

(declare-fun -!1942 (ListLongMap!18103 (_ BitVec 64)) ListLongMap!18103)

(assert (=> b!1225322 (= lt!557733 (-!1942 lt!557731 k0!934))))

(declare-fun zeroValue!944 () V!46609)

(declare-fun lt!557737 () array!79045)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!557727 () array!79043)

(declare-fun minValue!944 () V!46609)

(declare-fun getCurrentListMapNoExtraKeys!5517 (array!79043 array!79045 (_ BitVec 32) (_ BitVec 32) V!46609 V!46609 (_ BitVec 32) Int) ListLongMap!18103)

(assert (=> b!1225322 (= lt!557734 (getCurrentListMapNoExtraKeys!5517 lt!557727 lt!557737 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1225322 (= lt!557731 (getCurrentListMapNoExtraKeys!5517 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!557739 () Unit!40515)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1157 (array!79043 array!79045 (_ BitVec 32) (_ BitVec 32) V!46609 V!46609 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40515)

(assert (=> b!1225322 (= lt!557739 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1157 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1225323 () Bool)

(declare-fun res!813829 () Bool)

(assert (=> b!1225323 (=> (not res!813829) (not e!696029))))

(assert (=> b!1225323 (= res!813829 (= (select (arr!38142 _keys!1208) i!673) k0!934))))

(declare-fun b!1225324 () Bool)

(declare-fun res!813836 () Bool)

(assert (=> b!1225324 (=> (not res!813836) (not e!696029))))

(assert (=> b!1225324 (= res!813836 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38679 _keys!1208))))))

(declare-fun b!1225325 () Bool)

(declare-fun res!813827 () Bool)

(assert (=> b!1225325 (=> (not res!813827) (not e!696029))))

(assert (=> b!1225325 (= res!813827 (and (= (size!38680 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38679 _keys!1208) (size!38680 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1225326 () Bool)

(declare-fun res!813838 () Bool)

(assert (=> b!1225326 (=> (not res!813838) (not e!696029))))

(assert (=> b!1225326 (= res!813838 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26938))))

(declare-fun b!1225327 () Bool)

(declare-fun res!813824 () Bool)

(declare-fun e!696024 () Bool)

(assert (=> b!1225327 (=> (not res!813824) (not e!696024))))

(assert (=> b!1225327 (= res!813824 (arrayNoDuplicates!0 lt!557727 #b00000000000000000000000000000000 Nil!26938))))

(declare-fun b!1225328 () Bool)

(assert (=> b!1225328 (= e!696029 e!696024)))

(declare-fun res!813830 () Bool)

(assert (=> b!1225328 (=> (not res!813830) (not e!696024))))

(assert (=> b!1225328 (= res!813830 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!557727 mask!1564))))

(assert (=> b!1225328 (= lt!557727 (array!79044 (store (arr!38142 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38679 _keys!1208)))))

(declare-fun mapNonEmpty!48565 () Bool)

(declare-fun tp!92267 () Bool)

(assert (=> mapNonEmpty!48565 (= mapRes!48565 (and tp!92267 e!696026))))

(declare-fun mapRest!48565 () (Array (_ BitVec 32) ValueCell!14846))

(declare-fun mapKey!48565 () (_ BitVec 32))

(declare-fun mapValue!48565 () ValueCell!14846)

(assert (=> mapNonEmpty!48565 (= (arr!38143 _values!996) (store mapRest!48565 mapKey!48565 mapValue!48565))))

(declare-fun b!1225329 () Bool)

(declare-fun res!813826 () Bool)

(assert (=> b!1225329 (=> (not res!813826) (not e!696031))))

(declare-fun lt!557732 () ListLongMap!18103)

(declare-fun lt!557728 () tuple2!20126)

(declare-fun +!4169 (ListLongMap!18103 tuple2!20126) ListLongMap!18103)

(assert (=> b!1225329 (= res!813826 (= lt!557732 (+!4169 lt!557731 lt!557728)))))

(declare-fun b!1225330 () Bool)

(assert (=> b!1225330 (= e!696028 (and e!696022 mapRes!48565))))

(declare-fun condMapEmpty!48565 () Bool)

(declare-fun mapDefault!48565 () ValueCell!14846)

(assert (=> b!1225330 (= condMapEmpty!48565 (= (arr!38143 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14846)) mapDefault!48565)))))

(declare-fun b!1225331 () Bool)

(assert (=> b!1225331 (= e!696027 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1225332 () Bool)

(declare-fun e!696030 () Bool)

(assert (=> b!1225332 (= e!696024 (not e!696030))))

(declare-fun res!813825 () Bool)

(assert (=> b!1225332 (=> res!813825 e!696030)))

(assert (=> b!1225332 (= res!813825 (bvsgt from!1455 i!673))))

(assert (=> b!1225332 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!557740 () Unit!40515)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79043 (_ BitVec 64) (_ BitVec 32)) Unit!40515)

(assert (=> b!1225332 (= lt!557740 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1225333 () Bool)

(declare-fun Unit!40518 () Unit!40515)

(assert (=> b!1225333 (= e!696023 Unit!40518)))

(declare-fun b!1225334 () Bool)

(assert (=> b!1225334 (= e!696021 (bvslt from!1455 (size!38679 _keys!1208)))))

(assert (=> b!1225334 e!696031))

(declare-fun res!813831 () Bool)

(assert (=> b!1225334 (=> (not res!813831) (not e!696031))))

(assert (=> b!1225334 (= res!813831 (not (= (select (arr!38142 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!557738 () Unit!40515)

(assert (=> b!1225334 (= lt!557738 e!696023)))

(declare-fun c!120829 () Bool)

(assert (=> b!1225334 (= c!120829 (= (select (arr!38142 _keys!1208) from!1455) k0!934))))

(assert (=> b!1225334 e!696020))

(declare-fun res!813840 () Bool)

(assert (=> b!1225334 (=> (not res!813840) (not e!696020))))

(declare-fun lt!557736 () ListLongMap!18103)

(assert (=> b!1225334 (= res!813840 (= lt!557736 (+!4169 lt!557733 lt!557728)))))

(declare-fun lt!557729 () V!46609)

(declare-fun get!19520 (ValueCell!14846 V!46609) V!46609)

(assert (=> b!1225334 (= lt!557728 (tuple2!20127 (select (arr!38142 _keys!1208) from!1455) (get!19520 (select (arr!38143 _values!996) from!1455) lt!557729)))))

(declare-fun b!1225335 () Bool)

(declare-fun res!813832 () Bool)

(assert (=> b!1225335 (=> (not res!813832) (not e!696029))))

(assert (=> b!1225335 (= res!813832 (validKeyInArray!0 k0!934))))

(declare-fun b!1225336 () Bool)

(declare-fun res!813833 () Bool)

(assert (=> b!1225336 (=> (not res!813833) (not e!696029))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1225336 (= res!813833 (validMask!0 mask!1564))))

(declare-fun b!1225337 () Bool)

(assert (=> b!1225337 (= e!696030 e!696019)))

(declare-fun res!813828 () Bool)

(assert (=> b!1225337 (=> res!813828 e!696019)))

(assert (=> b!1225337 (= res!813828 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1225337 (= lt!557736 (getCurrentListMapNoExtraKeys!5517 lt!557727 lt!557737 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1225337 (= lt!557737 (array!79046 (store (arr!38143 _values!996) i!673 (ValueCellFull!14846 lt!557729)) (size!38680 _values!996)))))

(declare-fun dynLambda!3416 (Int (_ BitVec 64)) V!46609)

(assert (=> b!1225337 (= lt!557729 (dynLambda!3416 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1225337 (= lt!557732 (getCurrentListMapNoExtraKeys!5517 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!101954 res!813834) b!1225336))

(assert (= (and b!1225336 res!813833) b!1225325))

(assert (= (and b!1225325 res!813827) b!1225320))

(assert (= (and b!1225320 res!813839) b!1225326))

(assert (= (and b!1225326 res!813838) b!1225324))

(assert (= (and b!1225324 res!813836) b!1225335))

(assert (= (and b!1225335 res!813832) b!1225323))

(assert (= (and b!1225323 res!813829) b!1225328))

(assert (= (and b!1225328 res!813830) b!1225327))

(assert (= (and b!1225327 res!813824) b!1225332))

(assert (= (and b!1225332 (not res!813825)) b!1225337))

(assert (= (and b!1225337 (not res!813828)) b!1225322))

(assert (= (and b!1225322 (not res!813837)) b!1225334))

(assert (= (and b!1225334 res!813840) b!1225316))

(assert (= (and b!1225316 (not res!813835)) b!1225331))

(assert (= (and b!1225334 c!120829) b!1225317))

(assert (= (and b!1225334 (not c!120829)) b!1225333))

(assert (= (and b!1225334 res!813831) b!1225329))

(assert (= (and b!1225329 res!813826) b!1225319))

(assert (= (and b!1225330 condMapEmpty!48565) mapIsEmpty!48565))

(assert (= (and b!1225330 (not condMapEmpty!48565)) mapNonEmpty!48565))

(get-info :version)

(assert (= (and mapNonEmpty!48565 ((_ is ValueCellFull!14846) mapValue!48565)) b!1225318))

(assert (= (and b!1225330 ((_ is ValueCellFull!14846) mapDefault!48565)) b!1225321))

(assert (= start!101954 b!1225330))

(declare-fun b_lambda!22381 () Bool)

(assert (=> (not b_lambda!22381) (not b!1225337)))

(declare-fun t!40319 () Bool)

(declare-fun tb!11199 () Bool)

(assert (=> (and start!101954 (= defaultEntry!1004 defaultEntry!1004) t!40319) tb!11199))

(declare-fun result!23019 () Bool)

(assert (=> tb!11199 (= result!23019 tp_is_empty!31111)))

(assert (=> b!1225337 t!40319))

(declare-fun b_and!44079 () Bool)

(assert (= b_and!44077 (and (=> t!40319 result!23019) b_and!44079)))

(declare-fun m!1130633 () Bool)

(assert (=> b!1225322 m!1130633))

(declare-fun m!1130635 () Bool)

(assert (=> b!1225322 m!1130635))

(declare-fun m!1130637 () Bool)

(assert (=> b!1225322 m!1130637))

(declare-fun m!1130639 () Bool)

(assert (=> b!1225322 m!1130639))

(declare-fun m!1130641 () Bool)

(assert (=> b!1225322 m!1130641))

(declare-fun m!1130643 () Bool)

(assert (=> b!1225322 m!1130643))

(assert (=> b!1225322 m!1130639))

(declare-fun m!1130645 () Bool)

(assert (=> b!1225328 m!1130645))

(declare-fun m!1130647 () Bool)

(assert (=> b!1225328 m!1130647))

(assert (=> b!1225334 m!1130639))

(declare-fun m!1130649 () Bool)

(assert (=> b!1225334 m!1130649))

(declare-fun m!1130651 () Bool)

(assert (=> b!1225334 m!1130651))

(assert (=> b!1225334 m!1130651))

(declare-fun m!1130653 () Bool)

(assert (=> b!1225334 m!1130653))

(declare-fun m!1130655 () Bool)

(assert (=> b!1225337 m!1130655))

(declare-fun m!1130657 () Bool)

(assert (=> b!1225337 m!1130657))

(declare-fun m!1130659 () Bool)

(assert (=> b!1225337 m!1130659))

(declare-fun m!1130661 () Bool)

(assert (=> b!1225337 m!1130661))

(declare-fun m!1130663 () Bool)

(assert (=> b!1225317 m!1130663))

(declare-fun m!1130665 () Bool)

(assert (=> b!1225317 m!1130665))

(declare-fun m!1130667 () Bool)

(assert (=> b!1225317 m!1130667))

(declare-fun m!1130669 () Bool)

(assert (=> b!1225317 m!1130669))

(declare-fun m!1130671 () Bool)

(assert (=> b!1225317 m!1130671))

(declare-fun m!1130673 () Bool)

(assert (=> b!1225323 m!1130673))

(declare-fun m!1130675 () Bool)

(assert (=> mapNonEmpty!48565 m!1130675))

(declare-fun m!1130677 () Bool)

(assert (=> b!1225332 m!1130677))

(declare-fun m!1130679 () Bool)

(assert (=> b!1225332 m!1130679))

(declare-fun m!1130681 () Bool)

(assert (=> b!1225326 m!1130681))

(declare-fun m!1130683 () Bool)

(assert (=> b!1225329 m!1130683))

(declare-fun m!1130685 () Bool)

(assert (=> b!1225331 m!1130685))

(declare-fun m!1130687 () Bool)

(assert (=> start!101954 m!1130687))

(declare-fun m!1130689 () Bool)

(assert (=> start!101954 m!1130689))

(declare-fun m!1130691 () Bool)

(assert (=> b!1225327 m!1130691))

(declare-fun m!1130693 () Bool)

(assert (=> b!1225335 m!1130693))

(assert (=> b!1225316 m!1130639))

(declare-fun m!1130695 () Bool)

(assert (=> b!1225336 m!1130695))

(declare-fun m!1130697 () Bool)

(assert (=> b!1225320 m!1130697))

(check-sat (not b!1225332) (not b_lambda!22381) (not b!1225327) (not b_next!26407) (not b!1225337) (not b!1225335) (not b!1225328) (not start!101954) (not b!1225320) (not b!1225322) (not b!1225317) b_and!44079 (not b!1225334) (not b!1225326) tp_is_empty!31111 (not mapNonEmpty!48565) (not b!1225331) (not b!1225329) (not b!1225336))
(check-sat b_and!44079 (not b_next!26407))
