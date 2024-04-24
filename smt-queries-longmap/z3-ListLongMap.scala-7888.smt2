; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98308 () Bool)

(assert start!98308)

(declare-fun b_free!23773 () Bool)

(declare-fun b_next!23773 () Bool)

(assert (=> start!98308 (= b_free!23773 (not b_next!23773))))

(declare-fun tp!84022 () Bool)

(declare-fun b_and!38339 () Bool)

(assert (=> start!98308 (= tp!84022 b_and!38339)))

(declare-fun b!1127561 () Bool)

(declare-fun e!641921 () Bool)

(declare-fun e!641920 () Bool)

(assert (=> b!1127561 (= e!641921 e!641920)))

(declare-fun res!753107 () Bool)

(assert (=> b!1127561 (=> res!753107 e!641920)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1127561 (= res!753107 (not (= from!1455 i!673)))))

(declare-datatypes ((V!42865 0))(
  ( (V!42866 (val!14208 Int)) )
))
(declare-fun zeroValue!944 () V!42865)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13442 0))(
  ( (ValueCellFull!13442 (v!16837 V!42865)) (EmptyCell!13442) )
))
(declare-datatypes ((array!73517 0))(
  ( (array!73518 (arr!35405 (Array (_ BitVec 32) ValueCell!13442)) (size!35942 (_ BitVec 32))) )
))
(declare-fun lt!500664 () array!73517)

(declare-fun minValue!944 () V!42865)

(declare-datatypes ((array!73519 0))(
  ( (array!73520 (arr!35406 (Array (_ BitVec 32) (_ BitVec 64))) (size!35943 (_ BitVec 32))) )
))
(declare-fun lt!500668 () array!73519)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!17876 0))(
  ( (tuple2!17877 (_1!8949 (_ BitVec 64)) (_2!8949 V!42865)) )
))
(declare-datatypes ((List!24664 0))(
  ( (Nil!24661) (Cons!24660 (h!25878 tuple2!17876) (t!35421 List!24664)) )
))
(declare-datatypes ((ListLongMap!15853 0))(
  ( (ListLongMap!15854 (toList!7942 List!24664)) )
))
(declare-fun lt!500666 () ListLongMap!15853)

(declare-fun getCurrentListMapNoExtraKeys!4467 (array!73519 array!73517 (_ BitVec 32) (_ BitVec 32) V!42865 V!42865 (_ BitVec 32) Int) ListLongMap!15853)

(assert (=> b!1127561 (= lt!500666 (getCurrentListMapNoExtraKeys!4467 lt!500668 lt!500664 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!73517)

(declare-fun dynLambda!2538 (Int (_ BitVec 64)) V!42865)

(assert (=> b!1127561 (= lt!500664 (array!73518 (store (arr!35405 _values!996) i!673 (ValueCellFull!13442 (dynLambda!2538 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35942 _values!996)))))

(declare-fun _keys!1208 () array!73519)

(declare-fun lt!500665 () ListLongMap!15853)

(assert (=> b!1127561 (= lt!500665 (getCurrentListMapNoExtraKeys!4467 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1127562 () Bool)

(declare-fun e!641918 () Bool)

(assert (=> b!1127562 (= e!641918 (not e!641921))))

(declare-fun res!753100 () Bool)

(assert (=> b!1127562 (=> res!753100 e!641921)))

(assert (=> b!1127562 (= res!753100 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73519 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1127562 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36899 0))(
  ( (Unit!36900) )
))
(declare-fun lt!500667 () Unit!36899)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73519 (_ BitVec 64) (_ BitVec 32)) Unit!36899)

(assert (=> b!1127562 (= lt!500667 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1127563 () Bool)

(declare-fun res!753102 () Bool)

(declare-fun e!641916 () Bool)

(assert (=> b!1127563 (=> (not res!753102) (not e!641916))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73519 (_ BitVec 32)) Bool)

(assert (=> b!1127563 (= res!753102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1127564 () Bool)

(declare-fun e!641913 () Bool)

(declare-fun call!47669 () ListLongMap!15853)

(declare-fun call!47668 () ListLongMap!15853)

(assert (=> b!1127564 (= e!641913 (= call!47669 call!47668))))

(declare-fun b!1127565 () Bool)

(declare-fun res!753104 () Bool)

(assert (=> b!1127565 (=> (not res!753104) (not e!641916))))

(declare-datatypes ((List!24665 0))(
  ( (Nil!24662) (Cons!24661 (h!25879 (_ BitVec 64)) (t!35422 List!24665)) )
))
(declare-fun arrayNoDuplicates!0 (array!73519 (_ BitVec 32) List!24665) Bool)

(assert (=> b!1127565 (= res!753104 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24662))))

(declare-fun res!753106 () Bool)

(assert (=> start!98308 (=> (not res!753106) (not e!641916))))

(assert (=> start!98308 (= res!753106 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35943 _keys!1208))))))

(assert (=> start!98308 e!641916))

(declare-fun tp_is_empty!28303 () Bool)

(assert (=> start!98308 tp_is_empty!28303))

(declare-fun array_inv!27230 (array!73519) Bool)

(assert (=> start!98308 (array_inv!27230 _keys!1208)))

(assert (=> start!98308 true))

(assert (=> start!98308 tp!84022))

(declare-fun e!641917 () Bool)

(declare-fun array_inv!27231 (array!73517) Bool)

(assert (=> start!98308 (and (array_inv!27231 _values!996) e!641917)))

(declare-fun b!1127566 () Bool)

(declare-fun e!641922 () Bool)

(assert (=> b!1127566 (= e!641922 true)))

(declare-fun lt!500663 () Bool)

(declare-fun contains!6490 (ListLongMap!15853 (_ BitVec 64)) Bool)

(assert (=> b!1127566 (= lt!500663 (contains!6490 (getCurrentListMapNoExtraKeys!4467 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun mapIsEmpty!44272 () Bool)

(declare-fun mapRes!44272 () Bool)

(assert (=> mapIsEmpty!44272 mapRes!44272))

(declare-fun b!1127567 () Bool)

(declare-fun res!753098 () Bool)

(assert (=> b!1127567 (=> (not res!753098) (not e!641916))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1127567 (= res!753098 (validKeyInArray!0 k0!934))))

(declare-fun b!1127568 () Bool)

(declare-fun res!753097 () Bool)

(assert (=> b!1127568 (=> (not res!753097) (not e!641918))))

(assert (=> b!1127568 (= res!753097 (arrayNoDuplicates!0 lt!500668 #b00000000000000000000000000000000 Nil!24662))))

(declare-fun b!1127569 () Bool)

(declare-fun res!753103 () Bool)

(assert (=> b!1127569 (=> (not res!753103) (not e!641916))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1127569 (= res!753103 (validMask!0 mask!1564))))

(declare-fun b!1127570 () Bool)

(declare-fun -!1119 (ListLongMap!15853 (_ BitVec 64)) ListLongMap!15853)

(assert (=> b!1127570 (= e!641913 (= call!47668 (-!1119 call!47669 k0!934)))))

(declare-fun b!1127571 () Bool)

(declare-fun e!641919 () Bool)

(assert (=> b!1127571 (= e!641917 (and e!641919 mapRes!44272))))

(declare-fun condMapEmpty!44272 () Bool)

(declare-fun mapDefault!44272 () ValueCell!13442)

(assert (=> b!1127571 (= condMapEmpty!44272 (= (arr!35405 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13442)) mapDefault!44272)))))

(declare-fun b!1127572 () Bool)

(declare-fun res!753099 () Bool)

(assert (=> b!1127572 (=> (not res!753099) (not e!641916))))

(assert (=> b!1127572 (= res!753099 (and (= (size!35942 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35943 _keys!1208) (size!35942 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1127573 () Bool)

(assert (=> b!1127573 (= e!641916 e!641918)))

(declare-fun res!753109 () Bool)

(assert (=> b!1127573 (=> (not res!753109) (not e!641918))))

(assert (=> b!1127573 (= res!753109 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500668 mask!1564))))

(assert (=> b!1127573 (= lt!500668 (array!73520 (store (arr!35406 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35943 _keys!1208)))))

(declare-fun c!110060 () Bool)

(declare-fun bm!47665 () Bool)

(assert (=> bm!47665 (= call!47669 (getCurrentListMapNoExtraKeys!4467 (ite c!110060 _keys!1208 lt!500668) (ite c!110060 _values!996 lt!500664) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!47666 () Bool)

(assert (=> bm!47666 (= call!47668 (getCurrentListMapNoExtraKeys!4467 (ite c!110060 lt!500668 _keys!1208) (ite c!110060 lt!500664 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127574 () Bool)

(assert (=> b!1127574 (= e!641920 e!641922)))

(declare-fun res!753101 () Bool)

(assert (=> b!1127574 (=> res!753101 e!641922)))

(assert (=> b!1127574 (= res!753101 (not (= (select (arr!35406 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1127574 e!641913))

(assert (=> b!1127574 (= c!110060 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!500662 () Unit!36899)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!383 (array!73519 array!73517 (_ BitVec 32) (_ BitVec 32) V!42865 V!42865 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36899)

(assert (=> b!1127574 (= lt!500662 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!383 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127575 () Bool)

(assert (=> b!1127575 (= e!641919 tp_is_empty!28303)))

(declare-fun b!1127576 () Bool)

(declare-fun res!753108 () Bool)

(assert (=> b!1127576 (=> (not res!753108) (not e!641916))))

(assert (=> b!1127576 (= res!753108 (= (select (arr!35406 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!44272 () Bool)

(declare-fun tp!84023 () Bool)

(declare-fun e!641914 () Bool)

(assert (=> mapNonEmpty!44272 (= mapRes!44272 (and tp!84023 e!641914))))

(declare-fun mapRest!44272 () (Array (_ BitVec 32) ValueCell!13442))

(declare-fun mapKey!44272 () (_ BitVec 32))

(declare-fun mapValue!44272 () ValueCell!13442)

(assert (=> mapNonEmpty!44272 (= (arr!35405 _values!996) (store mapRest!44272 mapKey!44272 mapValue!44272))))

(declare-fun b!1127577 () Bool)

(declare-fun res!753105 () Bool)

(assert (=> b!1127577 (=> (not res!753105) (not e!641916))))

(assert (=> b!1127577 (= res!753105 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35943 _keys!1208))))))

(declare-fun b!1127578 () Bool)

(assert (=> b!1127578 (= e!641914 tp_is_empty!28303)))

(assert (= (and start!98308 res!753106) b!1127569))

(assert (= (and b!1127569 res!753103) b!1127572))

(assert (= (and b!1127572 res!753099) b!1127563))

(assert (= (and b!1127563 res!753102) b!1127565))

(assert (= (and b!1127565 res!753104) b!1127577))

(assert (= (and b!1127577 res!753105) b!1127567))

(assert (= (and b!1127567 res!753098) b!1127576))

(assert (= (and b!1127576 res!753108) b!1127573))

(assert (= (and b!1127573 res!753109) b!1127568))

(assert (= (and b!1127568 res!753097) b!1127562))

(assert (= (and b!1127562 (not res!753100)) b!1127561))

(assert (= (and b!1127561 (not res!753107)) b!1127574))

(assert (= (and b!1127574 c!110060) b!1127570))

(assert (= (and b!1127574 (not c!110060)) b!1127564))

(assert (= (or b!1127570 b!1127564) bm!47665))

(assert (= (or b!1127570 b!1127564) bm!47666))

(assert (= (and b!1127574 (not res!753101)) b!1127566))

(assert (= (and b!1127571 condMapEmpty!44272) mapIsEmpty!44272))

(assert (= (and b!1127571 (not condMapEmpty!44272)) mapNonEmpty!44272))

(get-info :version)

(assert (= (and mapNonEmpty!44272 ((_ is ValueCellFull!13442) mapValue!44272)) b!1127578))

(assert (= (and b!1127571 ((_ is ValueCellFull!13442) mapDefault!44272)) b!1127575))

(assert (= start!98308 b!1127571))

(declare-fun b_lambda!18753 () Bool)

(assert (=> (not b_lambda!18753) (not b!1127561)))

(declare-fun t!35420 () Bool)

(declare-fun tb!8577 () Bool)

(assert (=> (and start!98308 (= defaultEntry!1004 defaultEntry!1004) t!35420) tb!8577))

(declare-fun result!17723 () Bool)

(assert (=> tb!8577 (= result!17723 tp_is_empty!28303)))

(assert (=> b!1127561 t!35420))

(declare-fun b_and!38341 () Bool)

(assert (= b_and!38339 (and (=> t!35420 result!17723) b_and!38341)))

(declare-fun m!1041907 () Bool)

(assert (=> start!98308 m!1041907))

(declare-fun m!1041909 () Bool)

(assert (=> start!98308 m!1041909))

(declare-fun m!1041911 () Bool)

(assert (=> b!1127561 m!1041911))

(declare-fun m!1041913 () Bool)

(assert (=> b!1127561 m!1041913))

(declare-fun m!1041915 () Bool)

(assert (=> b!1127561 m!1041915))

(declare-fun m!1041917 () Bool)

(assert (=> b!1127561 m!1041917))

(declare-fun m!1041919 () Bool)

(assert (=> b!1127566 m!1041919))

(assert (=> b!1127566 m!1041919))

(declare-fun m!1041921 () Bool)

(assert (=> b!1127566 m!1041921))

(declare-fun m!1041923 () Bool)

(assert (=> b!1127574 m!1041923))

(declare-fun m!1041925 () Bool)

(assert (=> b!1127574 m!1041925))

(declare-fun m!1041927 () Bool)

(assert (=> b!1127567 m!1041927))

(declare-fun m!1041929 () Bool)

(assert (=> b!1127569 m!1041929))

(declare-fun m!1041931 () Bool)

(assert (=> mapNonEmpty!44272 m!1041931))

(declare-fun m!1041933 () Bool)

(assert (=> bm!47665 m!1041933))

(declare-fun m!1041935 () Bool)

(assert (=> b!1127573 m!1041935))

(declare-fun m!1041937 () Bool)

(assert (=> b!1127573 m!1041937))

(declare-fun m!1041939 () Bool)

(assert (=> bm!47666 m!1041939))

(declare-fun m!1041941 () Bool)

(assert (=> b!1127565 m!1041941))

(declare-fun m!1041943 () Bool)

(assert (=> b!1127568 m!1041943))

(declare-fun m!1041945 () Bool)

(assert (=> b!1127570 m!1041945))

(declare-fun m!1041947 () Bool)

(assert (=> b!1127576 m!1041947))

(declare-fun m!1041949 () Bool)

(assert (=> b!1127562 m!1041949))

(declare-fun m!1041951 () Bool)

(assert (=> b!1127562 m!1041951))

(declare-fun m!1041953 () Bool)

(assert (=> b!1127563 m!1041953))

(check-sat (not b!1127562) (not b!1127567) (not b!1127569) (not b!1127574) (not bm!47665) (not b!1127561) (not b!1127570) (not b!1127563) (not start!98308) (not bm!47666) tp_is_empty!28303 (not mapNonEmpty!44272) (not b_next!23773) (not b!1127565) b_and!38341 (not b!1127573) (not b!1127566) (not b!1127568) (not b_lambda!18753))
(check-sat b_and!38341 (not b_next!23773))
