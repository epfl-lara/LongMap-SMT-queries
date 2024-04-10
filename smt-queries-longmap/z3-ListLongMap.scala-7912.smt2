; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98218 () Bool)

(assert start!98218)

(declare-fun b_free!23919 () Bool)

(declare-fun b_next!23919 () Bool)

(assert (=> start!98218 (= b_free!23919 (not b_next!23919))))

(declare-fun tp!84461 () Bool)

(declare-fun b_and!38621 () Bool)

(assert (=> start!98218 (= tp!84461 b_and!38621)))

(declare-fun b!1130956 () Bool)

(declare-fun e!643640 () Bool)

(declare-fun e!643638 () Bool)

(assert (=> b!1130956 (= e!643640 (not e!643638))))

(declare-fun res!755597 () Bool)

(assert (=> b!1130956 (=> res!755597 e!643638)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1130956 (= res!755597 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!73755 0))(
  ( (array!73756 (arr!35530 (Array (_ BitVec 32) (_ BitVec 64))) (size!36066 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73755)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73755 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1130956 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!37050 0))(
  ( (Unit!37051) )
))
(declare-fun lt!502282 () Unit!37050)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73755 (_ BitVec 64) (_ BitVec 32)) Unit!37050)

(assert (=> b!1130956 (= lt!502282 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1130957 () Bool)

(declare-fun res!755596 () Bool)

(declare-fun e!643647 () Bool)

(assert (=> b!1130957 (=> (not res!755596) (not e!643647))))

(assert (=> b!1130957 (= res!755596 (= (select (arr!35530 _keys!1208) i!673) k0!934))))

(declare-fun b!1130958 () Bool)

(declare-fun call!48505 () Bool)

(assert (=> b!1130958 call!48505))

(declare-fun lt!502290 () Unit!37050)

(declare-fun call!48508 () Unit!37050)

(assert (=> b!1130958 (= lt!502290 call!48508)))

(declare-fun e!643636 () Unit!37050)

(assert (=> b!1130958 (= e!643636 lt!502290)))

(declare-fun res!755600 () Bool)

(assert (=> start!98218 (=> (not res!755600) (not e!643647))))

(assert (=> start!98218 (= res!755600 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36066 _keys!1208))))))

(assert (=> start!98218 e!643647))

(declare-fun tp_is_empty!28449 () Bool)

(assert (=> start!98218 tp_is_empty!28449))

(declare-fun array_inv!27254 (array!73755) Bool)

(assert (=> start!98218 (array_inv!27254 _keys!1208)))

(assert (=> start!98218 true))

(assert (=> start!98218 tp!84461))

(declare-datatypes ((V!43059 0))(
  ( (V!43060 (val!14281 Int)) )
))
(declare-datatypes ((ValueCell!13515 0))(
  ( (ValueCellFull!13515 (v!16914 V!43059)) (EmptyCell!13515) )
))
(declare-datatypes ((array!73757 0))(
  ( (array!73758 (arr!35531 (Array (_ BitVec 32) ValueCell!13515)) (size!36067 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73757)

(declare-fun e!643645 () Bool)

(declare-fun array_inv!27255 (array!73757) Bool)

(assert (=> start!98218 (and (array_inv!27255 _values!996) e!643645)))

(declare-fun b!1130959 () Bool)

(declare-fun res!755601 () Bool)

(assert (=> b!1130959 (=> (not res!755601) (not e!643647))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1130959 (= res!755601 (validKeyInArray!0 k0!934))))

(declare-fun b!1130960 () Bool)

(declare-fun res!755606 () Bool)

(assert (=> b!1130960 (=> (not res!755606) (not e!643647))))

(declare-datatypes ((List!24760 0))(
  ( (Nil!24757) (Cons!24756 (h!25965 (_ BitVec 64)) (t!35671 List!24760)) )
))
(declare-fun arrayNoDuplicates!0 (array!73755 (_ BitVec 32) List!24760) Bool)

(assert (=> b!1130960 (= res!755606 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24757))))

(declare-fun zeroValue!944 () V!43059)

(declare-datatypes ((tuple2!17996 0))(
  ( (tuple2!17997 (_1!9009 (_ BitVec 64)) (_2!9009 V!43059)) )
))
(declare-datatypes ((List!24761 0))(
  ( (Nil!24758) (Cons!24757 (h!25966 tuple2!17996) (t!35672 List!24761)) )
))
(declare-datatypes ((ListLongMap!15965 0))(
  ( (ListLongMap!15966 (toList!7998 List!24761)) )
))
(declare-fun lt!502289 () ListLongMap!15965)

(declare-fun call!48501 () ListLongMap!15965)

(declare-fun bm!48498 () Bool)

(declare-fun c!110101 () Bool)

(declare-fun minValue!944 () V!43059)

(declare-fun c!110102 () Bool)

(declare-fun +!3445 (ListLongMap!15965 tuple2!17996) ListLongMap!15965)

(assert (=> bm!48498 (= call!48501 (+!3445 lt!502289 (ite (or c!110102 c!110101) (tuple2!17997 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!17997 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun bm!48499 () Bool)

(declare-fun call!48507 () ListLongMap!15965)

(assert (=> bm!48499 (= call!48507 call!48501)))

(declare-fun b!1130961 () Bool)

(declare-fun e!643637 () Bool)

(declare-fun e!643644 () Bool)

(assert (=> b!1130961 (= e!643637 e!643644)))

(declare-fun res!755599 () Bool)

(assert (=> b!1130961 (=> res!755599 e!643644)))

(declare-fun contains!6520 (ListLongMap!15965 (_ BitVec 64)) Bool)

(assert (=> b!1130961 (= res!755599 (not (contains!6520 lt!502289 k0!934)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4485 (array!73755 array!73757 (_ BitVec 32) (_ BitVec 32) V!43059 V!43059 (_ BitVec 32) Int) ListLongMap!15965)

(assert (=> b!1130961 (= lt!502289 (getCurrentListMapNoExtraKeys!4485 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!48500 () Bool)

(declare-fun call!48503 () Bool)

(assert (=> bm!48500 (= call!48505 call!48503)))

(declare-fun bm!48501 () Bool)

(declare-fun lt!502279 () ListLongMap!15965)

(assert (=> bm!48501 (= call!48503 (contains!6520 (ite c!110102 lt!502279 call!48507) k0!934))))

(declare-fun bm!48502 () Bool)

(declare-fun call!48506 () Unit!37050)

(declare-fun addStillContains!707 (ListLongMap!15965 (_ BitVec 64) V!43059 (_ BitVec 64)) Unit!37050)

(assert (=> bm!48502 (= call!48506 (addStillContains!707 (ite c!110102 lt!502279 lt!502289) (ite c!110102 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110101 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110102 minValue!944 (ite c!110101 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1130962 () Bool)

(declare-fun res!755604 () Bool)

(assert (=> b!1130962 (=> (not res!755604) (not e!643647))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1130962 (= res!755604 (validMask!0 mask!1564))))

(declare-fun b!1130963 () Bool)

(declare-fun e!643646 () Unit!37050)

(declare-fun lt!502291 () Unit!37050)

(assert (=> b!1130963 (= e!643646 lt!502291)))

(assert (=> b!1130963 (= lt!502291 call!48508)))

(assert (=> b!1130963 call!48505))

(declare-fun b!1130964 () Bool)

(declare-fun e!643633 () Bool)

(declare-fun call!48504 () ListLongMap!15965)

(declare-fun call!48502 () ListLongMap!15965)

(assert (=> b!1130964 (= e!643633 (= call!48504 call!48502))))

(declare-fun bm!48503 () Bool)

(assert (=> bm!48503 (= call!48508 call!48506)))

(declare-fun b!1130965 () Bool)

(declare-fun res!755607 () Bool)

(assert (=> b!1130965 (=> (not res!755607) (not e!643647))))

(assert (=> b!1130965 (= res!755607 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36066 _keys!1208))))))

(declare-fun b!1130966 () Bool)

(declare-fun e!643643 () Bool)

(assert (=> b!1130966 (= e!643643 tp_is_empty!28449)))

(declare-fun b!1130967 () Bool)

(declare-fun -!1175 (ListLongMap!15965 (_ BitVec 64)) ListLongMap!15965)

(assert (=> b!1130967 (= e!643633 (= call!48504 (-!1175 call!48502 k0!934)))))

(declare-fun b!1130968 () Bool)

(declare-fun res!755595 () Bool)

(assert (=> b!1130968 (=> (not res!755595) (not e!643647))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73755 (_ BitVec 32)) Bool)

(assert (=> b!1130968 (= res!755595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!48504 () Bool)

(assert (=> bm!48504 (= call!48502 (getCurrentListMapNoExtraKeys!4485 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44491 () Bool)

(declare-fun mapRes!44491 () Bool)

(declare-fun tp!84460 () Bool)

(declare-fun e!643639 () Bool)

(assert (=> mapNonEmpty!44491 (= mapRes!44491 (and tp!84460 e!643639))))

(declare-fun mapRest!44491 () (Array (_ BitVec 32) ValueCell!13515))

(declare-fun mapValue!44491 () ValueCell!13515)

(declare-fun mapKey!44491 () (_ BitVec 32))

(assert (=> mapNonEmpty!44491 (= (arr!35531 _values!996) (store mapRest!44491 mapKey!44491 mapValue!44491))))

(declare-fun b!1130969 () Bool)

(declare-fun c!110103 () Bool)

(declare-fun lt!502280 () Bool)

(assert (=> b!1130969 (= c!110103 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!502280))))

(assert (=> b!1130969 (= e!643636 e!643646)))

(declare-fun lt!502278 () array!73755)

(declare-fun bm!48505 () Bool)

(declare-fun lt!502286 () array!73757)

(assert (=> bm!48505 (= call!48504 (getCurrentListMapNoExtraKeys!4485 lt!502278 lt!502286 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130970 () Bool)

(declare-fun e!643641 () Bool)

(assert (=> b!1130970 (= e!643641 true)))

(declare-fun lt!502288 () Bool)

(declare-fun getCurrentListMap!4428 (array!73755 array!73757 (_ BitVec 32) (_ BitVec 32) V!43059 V!43059 (_ BitVec 32) Int) ListLongMap!15965)

(assert (=> b!1130970 (= lt!502288 (contains!6520 (getCurrentListMap!4428 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1130971 () Bool)

(declare-fun e!643634 () Bool)

(assert (=> b!1130971 (= e!643638 e!643634)))

(declare-fun res!755594 () Bool)

(assert (=> b!1130971 (=> res!755594 e!643634)))

(assert (=> b!1130971 (= res!755594 (not (= from!1455 i!673)))))

(declare-fun lt!502292 () ListLongMap!15965)

(assert (=> b!1130971 (= lt!502292 (getCurrentListMapNoExtraKeys!4485 lt!502278 lt!502286 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2559 (Int (_ BitVec 64)) V!43059)

(assert (=> b!1130971 (= lt!502286 (array!73758 (store (arr!35531 _values!996) i!673 (ValueCellFull!13515 (dynLambda!2559 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36067 _values!996)))))

(declare-fun lt!502285 () ListLongMap!15965)

(assert (=> b!1130971 (= lt!502285 (getCurrentListMapNoExtraKeys!4485 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1130972 () Bool)

(declare-fun e!643635 () Unit!37050)

(declare-fun lt!502287 () Unit!37050)

(assert (=> b!1130972 (= e!643635 lt!502287)))

(declare-fun lt!502284 () Unit!37050)

(assert (=> b!1130972 (= lt!502284 (addStillContains!707 lt!502289 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1130972 (= lt!502279 call!48501)))

(assert (=> b!1130972 call!48503))

(assert (=> b!1130972 (= lt!502287 call!48506)))

(assert (=> b!1130972 (contains!6520 (+!3445 lt!502279 (tuple2!17997 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1130973 () Bool)

(assert (=> b!1130973 (= e!643639 tp_is_empty!28449)))

(declare-fun b!1130974 () Bool)

(assert (=> b!1130974 (= e!643645 (and e!643643 mapRes!44491))))

(declare-fun condMapEmpty!44491 () Bool)

(declare-fun mapDefault!44491 () ValueCell!13515)

(assert (=> b!1130974 (= condMapEmpty!44491 (= (arr!35531 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13515)) mapDefault!44491)))))

(declare-fun b!1130975 () Bool)

(declare-fun res!755598 () Bool)

(assert (=> b!1130975 (=> (not res!755598) (not e!643647))))

(assert (=> b!1130975 (= res!755598 (and (= (size!36067 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36066 _keys!1208) (size!36067 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1130976 () Bool)

(assert (=> b!1130976 (= e!643635 e!643636)))

(assert (=> b!1130976 (= c!110101 (and (not lt!502280) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1130977 () Bool)

(assert (=> b!1130977 (= e!643647 e!643640)))

(declare-fun res!755603 () Bool)

(assert (=> b!1130977 (=> (not res!755603) (not e!643640))))

(assert (=> b!1130977 (= res!755603 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!502278 mask!1564))))

(assert (=> b!1130977 (= lt!502278 (array!73756 (store (arr!35530 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36066 _keys!1208)))))

(declare-fun b!1130978 () Bool)

(declare-fun res!755602 () Bool)

(assert (=> b!1130978 (=> (not res!755602) (not e!643640))))

(assert (=> b!1130978 (= res!755602 (arrayNoDuplicates!0 lt!502278 #b00000000000000000000000000000000 Nil!24757))))

(declare-fun b!1130979 () Bool)

(assert (=> b!1130979 (= e!643644 e!643641)))

(declare-fun res!755608 () Bool)

(assert (=> b!1130979 (=> res!755608 e!643641)))

(assert (=> b!1130979 (= res!755608 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36066 _keys!1208))))))

(declare-fun lt!502281 () Unit!37050)

(assert (=> b!1130979 (= lt!502281 e!643635)))

(assert (=> b!1130979 (= c!110102 (and (not lt!502280) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1130979 (= lt!502280 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!44491 () Bool)

(assert (=> mapIsEmpty!44491 mapRes!44491))

(declare-fun b!1130980 () Bool)

(assert (=> b!1130980 (= e!643634 e!643637)))

(declare-fun res!755605 () Bool)

(assert (=> b!1130980 (=> res!755605 e!643637)))

(assert (=> b!1130980 (= res!755605 (not (= (select (arr!35530 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1130980 e!643633))

(declare-fun c!110100 () Bool)

(assert (=> b!1130980 (= c!110100 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!502283 () Unit!37050)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!427 (array!73755 array!73757 (_ BitVec 32) (_ BitVec 32) V!43059 V!43059 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37050)

(assert (=> b!1130980 (= lt!502283 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!427 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130981 () Bool)

(declare-fun Unit!37052 () Unit!37050)

(assert (=> b!1130981 (= e!643646 Unit!37052)))

(assert (= (and start!98218 res!755600) b!1130962))

(assert (= (and b!1130962 res!755604) b!1130975))

(assert (= (and b!1130975 res!755598) b!1130968))

(assert (= (and b!1130968 res!755595) b!1130960))

(assert (= (and b!1130960 res!755606) b!1130965))

(assert (= (and b!1130965 res!755607) b!1130959))

(assert (= (and b!1130959 res!755601) b!1130957))

(assert (= (and b!1130957 res!755596) b!1130977))

(assert (= (and b!1130977 res!755603) b!1130978))

(assert (= (and b!1130978 res!755602) b!1130956))

(assert (= (and b!1130956 (not res!755597)) b!1130971))

(assert (= (and b!1130971 (not res!755594)) b!1130980))

(assert (= (and b!1130980 c!110100) b!1130967))

(assert (= (and b!1130980 (not c!110100)) b!1130964))

(assert (= (or b!1130967 b!1130964) bm!48505))

(assert (= (or b!1130967 b!1130964) bm!48504))

(assert (= (and b!1130980 (not res!755605)) b!1130961))

(assert (= (and b!1130961 (not res!755599)) b!1130979))

(assert (= (and b!1130979 c!110102) b!1130972))

(assert (= (and b!1130979 (not c!110102)) b!1130976))

(assert (= (and b!1130976 c!110101) b!1130958))

(assert (= (and b!1130976 (not c!110101)) b!1130969))

(assert (= (and b!1130969 c!110103) b!1130963))

(assert (= (and b!1130969 (not c!110103)) b!1130981))

(assert (= (or b!1130958 b!1130963) bm!48503))

(assert (= (or b!1130958 b!1130963) bm!48499))

(assert (= (or b!1130958 b!1130963) bm!48500))

(assert (= (or b!1130972 bm!48500) bm!48501))

(assert (= (or b!1130972 bm!48503) bm!48502))

(assert (= (or b!1130972 bm!48499) bm!48498))

(assert (= (and b!1130979 (not res!755608)) b!1130970))

(assert (= (and b!1130974 condMapEmpty!44491) mapIsEmpty!44491))

(assert (= (and b!1130974 (not condMapEmpty!44491)) mapNonEmpty!44491))

(get-info :version)

(assert (= (and mapNonEmpty!44491 ((_ is ValueCellFull!13515) mapValue!44491)) b!1130973))

(assert (= (and b!1130974 ((_ is ValueCellFull!13515) mapDefault!44491)) b!1130966))

(assert (= start!98218 b!1130974))

(declare-fun b_lambda!18889 () Bool)

(assert (=> (not b_lambda!18889) (not b!1130971)))

(declare-fun t!35670 () Bool)

(declare-fun tb!8731 () Bool)

(assert (=> (and start!98218 (= defaultEntry!1004 defaultEntry!1004) t!35670) tb!8731))

(declare-fun result!18023 () Bool)

(assert (=> tb!8731 (= result!18023 tp_is_empty!28449)))

(assert (=> b!1130971 t!35670))

(declare-fun b_and!38623 () Bool)

(assert (= b_and!38621 (and (=> t!35670 result!18023) b_and!38623)))

(declare-fun m!1043995 () Bool)

(assert (=> b!1130961 m!1043995))

(declare-fun m!1043997 () Bool)

(assert (=> b!1130961 m!1043997))

(declare-fun m!1043999 () Bool)

(assert (=> b!1130967 m!1043999))

(assert (=> bm!48504 m!1043997))

(declare-fun m!1044001 () Bool)

(assert (=> b!1130970 m!1044001))

(assert (=> b!1130970 m!1044001))

(declare-fun m!1044003 () Bool)

(assert (=> b!1130970 m!1044003))

(declare-fun m!1044005 () Bool)

(assert (=> bm!48505 m!1044005))

(declare-fun m!1044007 () Bool)

(assert (=> start!98218 m!1044007))

(declare-fun m!1044009 () Bool)

(assert (=> start!98218 m!1044009))

(declare-fun m!1044011 () Bool)

(assert (=> b!1130978 m!1044011))

(declare-fun m!1044013 () Bool)

(assert (=> b!1130977 m!1044013))

(declare-fun m!1044015 () Bool)

(assert (=> b!1130977 m!1044015))

(declare-fun m!1044017 () Bool)

(assert (=> mapNonEmpty!44491 m!1044017))

(declare-fun m!1044019 () Bool)

(assert (=> b!1130960 m!1044019))

(declare-fun m!1044021 () Bool)

(assert (=> b!1130956 m!1044021))

(declare-fun m!1044023 () Bool)

(assert (=> b!1130956 m!1044023))

(declare-fun m!1044025 () Bool)

(assert (=> bm!48498 m!1044025))

(declare-fun m!1044027 () Bool)

(assert (=> bm!48501 m!1044027))

(declare-fun m!1044029 () Bool)

(assert (=> b!1130971 m!1044029))

(declare-fun m!1044031 () Bool)

(assert (=> b!1130971 m!1044031))

(declare-fun m!1044033 () Bool)

(assert (=> b!1130971 m!1044033))

(declare-fun m!1044035 () Bool)

(assert (=> b!1130971 m!1044035))

(declare-fun m!1044037 () Bool)

(assert (=> b!1130962 m!1044037))

(declare-fun m!1044039 () Bool)

(assert (=> b!1130980 m!1044039))

(declare-fun m!1044041 () Bool)

(assert (=> b!1130980 m!1044041))

(declare-fun m!1044043 () Bool)

(assert (=> b!1130959 m!1044043))

(declare-fun m!1044045 () Bool)

(assert (=> b!1130957 m!1044045))

(declare-fun m!1044047 () Bool)

(assert (=> b!1130968 m!1044047))

(declare-fun m!1044049 () Bool)

(assert (=> b!1130972 m!1044049))

(declare-fun m!1044051 () Bool)

(assert (=> b!1130972 m!1044051))

(assert (=> b!1130972 m!1044051))

(declare-fun m!1044053 () Bool)

(assert (=> b!1130972 m!1044053))

(declare-fun m!1044055 () Bool)

(assert (=> bm!48502 m!1044055))

(check-sat (not b_next!23919) (not b!1130971) (not b!1130956) (not b!1130968) (not bm!48502) (not start!98218) (not b!1130977) (not b!1130972) (not b!1130970) (not bm!48501) (not bm!48504) (not b!1130961) (not bm!48498) (not b!1130978) (not b!1130967) (not bm!48505) b_and!38623 (not b!1130960) tp_is_empty!28449 (not b_lambda!18889) (not b!1130959) (not mapNonEmpty!44491) (not b!1130980) (not b!1130962))
(check-sat b_and!38623 (not b_next!23919))
