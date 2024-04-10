; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98164 () Bool)

(assert start!98164)

(declare-fun b_free!23865 () Bool)

(declare-fun b_next!23865 () Bool)

(assert (=> start!98164 (= b_free!23865 (not b_next!23865))))

(declare-fun tp!84299 () Bool)

(declare-fun b_and!38513 () Bool)

(assert (=> start!98164 (= tp!84299 b_and!38513)))

(declare-fun mapNonEmpty!44410 () Bool)

(declare-fun mapRes!44410 () Bool)

(declare-fun tp!84298 () Bool)

(declare-fun e!642438 () Bool)

(assert (=> mapNonEmpty!44410 (= mapRes!44410 (and tp!84298 e!642438))))

(declare-fun mapKey!44410 () (_ BitVec 32))

(declare-datatypes ((V!42987 0))(
  ( (V!42988 (val!14254 Int)) )
))
(declare-datatypes ((ValueCell!13488 0))(
  ( (ValueCellFull!13488 (v!16887 V!42987)) (EmptyCell!13488) )
))
(declare-fun mapRest!44410 () (Array (_ BitVec 32) ValueCell!13488))

(declare-datatypes ((array!73647 0))(
  ( (array!73648 (arr!35476 (Array (_ BitVec 32) ValueCell!13488)) (size!36012 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73647)

(declare-fun mapValue!44410 () ValueCell!13488)

(assert (=> mapNonEmpty!44410 (= (arr!35476 _values!996) (store mapRest!44410 mapKey!44410 mapValue!44410))))

(declare-fun b!1128828 () Bool)

(declare-fun e!642447 () Bool)

(declare-fun e!642446 () Bool)

(assert (=> b!1128828 (= e!642447 (not e!642446))))

(declare-fun res!754399 () Bool)

(assert (=> b!1128828 (=> res!754399 e!642446)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1128828 (= res!754399 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!73649 0))(
  ( (array!73650 (arr!35477 (Array (_ BitVec 32) (_ BitVec 64))) (size!36013 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73649)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73649 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1128828 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36980 0))(
  ( (Unit!36981) )
))
(declare-fun lt!501099 () Unit!36980)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73649 (_ BitVec 64) (_ BitVec 32)) Unit!36980)

(assert (=> b!1128828 (= lt!501099 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1128829 () Bool)

(declare-fun res!754397 () Bool)

(declare-fun e!642443 () Bool)

(assert (=> b!1128829 (=> (not res!754397) (not e!642443))))

(assert (=> b!1128829 (= res!754397 (= (select (arr!35477 _keys!1208) i!673) k0!934))))

(declare-fun b!1128830 () Bool)

(declare-fun e!642444 () Bool)

(declare-datatypes ((tuple2!17942 0))(
  ( (tuple2!17943 (_1!8982 (_ BitVec 64)) (_2!8982 V!42987)) )
))
(declare-datatypes ((List!24710 0))(
  ( (Nil!24707) (Cons!24706 (h!25915 tuple2!17942) (t!35567 List!24710)) )
))
(declare-datatypes ((ListLongMap!15911 0))(
  ( (ListLongMap!15912 (toList!7971 List!24710)) )
))
(declare-fun call!47877 () ListLongMap!15911)

(declare-fun call!47878 () ListLongMap!15911)

(assert (=> b!1128830 (= e!642444 (= call!47877 call!47878))))

(declare-fun res!754393 () Bool)

(assert (=> start!98164 (=> (not res!754393) (not e!642443))))

(assert (=> start!98164 (= res!754393 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36013 _keys!1208))))))

(assert (=> start!98164 e!642443))

(declare-fun tp_is_empty!28395 () Bool)

(assert (=> start!98164 tp_is_empty!28395))

(declare-fun array_inv!27220 (array!73649) Bool)

(assert (=> start!98164 (array_inv!27220 _keys!1208)))

(assert (=> start!98164 true))

(assert (=> start!98164 tp!84299))

(declare-fun e!642440 () Bool)

(declare-fun array_inv!27221 (array!73647) Bool)

(assert (=> start!98164 (and (array_inv!27221 _values!996) e!642440)))

(declare-fun zeroValue!944 () V!42987)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!47874 () Bool)

(declare-fun lt!501097 () array!73647)

(declare-fun minValue!944 () V!42987)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!501095 () array!73649)

(declare-fun getCurrentListMapNoExtraKeys!4458 (array!73649 array!73647 (_ BitVec 32) (_ BitVec 32) V!42987 V!42987 (_ BitVec 32) Int) ListLongMap!15911)

(assert (=> bm!47874 (= call!47877 (getCurrentListMapNoExtraKeys!4458 lt!501095 lt!501097 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128831 () Bool)

(declare-fun e!642439 () Bool)

(assert (=> b!1128831 (= e!642446 e!642439)))

(declare-fun res!754394 () Bool)

(assert (=> b!1128831 (=> res!754394 e!642439)))

(assert (=> b!1128831 (= res!754394 (not (= from!1455 i!673)))))

(declare-fun lt!501098 () ListLongMap!15911)

(assert (=> b!1128831 (= lt!501098 (getCurrentListMapNoExtraKeys!4458 lt!501095 lt!501097 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2539 (Int (_ BitVec 64)) V!42987)

(assert (=> b!1128831 (= lt!501097 (array!73648 (store (arr!35476 _values!996) i!673 (ValueCellFull!13488 (dynLambda!2539 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36012 _values!996)))))

(declare-fun lt!501100 () ListLongMap!15911)

(assert (=> b!1128831 (= lt!501100 (getCurrentListMapNoExtraKeys!4458 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1128832 () Bool)

(declare-fun e!642445 () Bool)

(assert (=> b!1128832 (= e!642440 (and e!642445 mapRes!44410))))

(declare-fun condMapEmpty!44410 () Bool)

(declare-fun mapDefault!44410 () ValueCell!13488)

(assert (=> b!1128832 (= condMapEmpty!44410 (= (arr!35476 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13488)) mapDefault!44410)))))

(declare-fun mapIsEmpty!44410 () Bool)

(assert (=> mapIsEmpty!44410 mapRes!44410))

(declare-fun b!1128833 () Bool)

(declare-fun res!754389 () Bool)

(assert (=> b!1128833 (=> (not res!754389) (not e!642443))))

(assert (=> b!1128833 (= res!754389 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36013 _keys!1208))))))

(declare-fun b!1128834 () Bool)

(assert (=> b!1128834 (= e!642445 tp_is_empty!28395)))

(declare-fun b!1128835 () Bool)

(declare-fun res!754398 () Bool)

(assert (=> b!1128835 (=> (not res!754398) (not e!642447))))

(declare-datatypes ((List!24711 0))(
  ( (Nil!24708) (Cons!24707 (h!25916 (_ BitVec 64)) (t!35568 List!24711)) )
))
(declare-fun arrayNoDuplicates!0 (array!73649 (_ BitVec 32) List!24711) Bool)

(assert (=> b!1128835 (= res!754398 (arrayNoDuplicates!0 lt!501095 #b00000000000000000000000000000000 Nil!24708))))

(declare-fun b!1128836 () Bool)

(declare-fun -!1153 (ListLongMap!15911 (_ BitVec 64)) ListLongMap!15911)

(assert (=> b!1128836 (= e!642444 (= call!47877 (-!1153 call!47878 k0!934)))))

(declare-fun b!1128837 () Bool)

(assert (=> b!1128837 (= e!642438 tp_is_empty!28395)))

(declare-fun bm!47875 () Bool)

(assert (=> bm!47875 (= call!47878 (getCurrentListMapNoExtraKeys!4458 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128838 () Bool)

(declare-fun res!754387 () Bool)

(assert (=> b!1128838 (=> (not res!754387) (not e!642443))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1128838 (= res!754387 (validMask!0 mask!1564))))

(declare-fun b!1128839 () Bool)

(declare-fun e!642442 () Bool)

(assert (=> b!1128839 (= e!642442 true)))

(declare-fun lt!501101 () Bool)

(declare-fun contains!6495 (ListLongMap!15911 (_ BitVec 64)) Bool)

(assert (=> b!1128839 (= lt!501101 (contains!6495 (getCurrentListMapNoExtraKeys!4458 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1128840 () Bool)

(declare-fun res!754395 () Bool)

(assert (=> b!1128840 (=> (not res!754395) (not e!642443))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73649 (_ BitVec 32)) Bool)

(assert (=> b!1128840 (= res!754395 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1128841 () Bool)

(assert (=> b!1128841 (= e!642439 e!642442)))

(declare-fun res!754390 () Bool)

(assert (=> b!1128841 (=> res!754390 e!642442)))

(assert (=> b!1128841 (= res!754390 (not (= (select (arr!35477 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1128841 e!642444))

(declare-fun c!109788 () Bool)

(assert (=> b!1128841 (= c!109788 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!501096 () Unit!36980)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!407 (array!73649 array!73647 (_ BitVec 32) (_ BitVec 32) V!42987 V!42987 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36980)

(assert (=> b!1128841 (= lt!501096 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!407 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128842 () Bool)

(declare-fun res!754392 () Bool)

(assert (=> b!1128842 (=> (not res!754392) (not e!642443))))

(assert (=> b!1128842 (= res!754392 (and (= (size!36012 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36013 _keys!1208) (size!36012 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1128843 () Bool)

(assert (=> b!1128843 (= e!642443 e!642447)))

(declare-fun res!754396 () Bool)

(assert (=> b!1128843 (=> (not res!754396) (not e!642447))))

(assert (=> b!1128843 (= res!754396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!501095 mask!1564))))

(assert (=> b!1128843 (= lt!501095 (array!73650 (store (arr!35477 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36013 _keys!1208)))))

(declare-fun b!1128844 () Bool)

(declare-fun res!754388 () Bool)

(assert (=> b!1128844 (=> (not res!754388) (not e!642443))))

(assert (=> b!1128844 (= res!754388 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24708))))

(declare-fun b!1128845 () Bool)

(declare-fun res!754391 () Bool)

(assert (=> b!1128845 (=> (not res!754391) (not e!642443))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1128845 (= res!754391 (validKeyInArray!0 k0!934))))

(assert (= (and start!98164 res!754393) b!1128838))

(assert (= (and b!1128838 res!754387) b!1128842))

(assert (= (and b!1128842 res!754392) b!1128840))

(assert (= (and b!1128840 res!754395) b!1128844))

(assert (= (and b!1128844 res!754388) b!1128833))

(assert (= (and b!1128833 res!754389) b!1128845))

(assert (= (and b!1128845 res!754391) b!1128829))

(assert (= (and b!1128829 res!754397) b!1128843))

(assert (= (and b!1128843 res!754396) b!1128835))

(assert (= (and b!1128835 res!754398) b!1128828))

(assert (= (and b!1128828 (not res!754399)) b!1128831))

(assert (= (and b!1128831 (not res!754394)) b!1128841))

(assert (= (and b!1128841 c!109788) b!1128836))

(assert (= (and b!1128841 (not c!109788)) b!1128830))

(assert (= (or b!1128836 b!1128830) bm!47874))

(assert (= (or b!1128836 b!1128830) bm!47875))

(assert (= (and b!1128841 (not res!754390)) b!1128839))

(assert (= (and b!1128832 condMapEmpty!44410) mapIsEmpty!44410))

(assert (= (and b!1128832 (not condMapEmpty!44410)) mapNonEmpty!44410))

(get-info :version)

(assert (= (and mapNonEmpty!44410 ((_ is ValueCellFull!13488) mapValue!44410)) b!1128837))

(assert (= (and b!1128832 ((_ is ValueCellFull!13488) mapDefault!44410)) b!1128834))

(assert (= start!98164 b!1128832))

(declare-fun b_lambda!18835 () Bool)

(assert (=> (not b_lambda!18835) (not b!1128831)))

(declare-fun t!35566 () Bool)

(declare-fun tb!8677 () Bool)

(assert (=> (and start!98164 (= defaultEntry!1004 defaultEntry!1004) t!35566) tb!8677))

(declare-fun result!17915 () Bool)

(assert (=> tb!8677 (= result!17915 tp_is_empty!28395)))

(assert (=> b!1128831 t!35566))

(declare-fun b_and!38515 () Bool)

(assert (= b_and!38513 (and (=> t!35566 result!17915) b_and!38515)))

(declare-fun m!1042351 () Bool)

(assert (=> b!1128844 m!1042351))

(declare-fun m!1042353 () Bool)

(assert (=> b!1128838 m!1042353))

(declare-fun m!1042355 () Bool)

(assert (=> start!98164 m!1042355))

(declare-fun m!1042357 () Bool)

(assert (=> start!98164 m!1042357))

(declare-fun m!1042359 () Bool)

(assert (=> b!1128840 m!1042359))

(declare-fun m!1042361 () Bool)

(assert (=> bm!47874 m!1042361))

(declare-fun m!1042363 () Bool)

(assert (=> b!1128835 m!1042363))

(declare-fun m!1042365 () Bool)

(assert (=> b!1128829 m!1042365))

(declare-fun m!1042367 () Bool)

(assert (=> b!1128839 m!1042367))

(assert (=> b!1128839 m!1042367))

(declare-fun m!1042369 () Bool)

(assert (=> b!1128839 m!1042369))

(declare-fun m!1042371 () Bool)

(assert (=> b!1128828 m!1042371))

(declare-fun m!1042373 () Bool)

(assert (=> b!1128828 m!1042373))

(declare-fun m!1042375 () Bool)

(assert (=> mapNonEmpty!44410 m!1042375))

(declare-fun m!1042377 () Bool)

(assert (=> b!1128836 m!1042377))

(assert (=> bm!47875 m!1042367))

(declare-fun m!1042379 () Bool)

(assert (=> b!1128845 m!1042379))

(declare-fun m!1042381 () Bool)

(assert (=> b!1128841 m!1042381))

(declare-fun m!1042383 () Bool)

(assert (=> b!1128841 m!1042383))

(declare-fun m!1042385 () Bool)

(assert (=> b!1128843 m!1042385))

(declare-fun m!1042387 () Bool)

(assert (=> b!1128843 m!1042387))

(declare-fun m!1042389 () Bool)

(assert (=> b!1128831 m!1042389))

(declare-fun m!1042391 () Bool)

(assert (=> b!1128831 m!1042391))

(declare-fun m!1042393 () Bool)

(assert (=> b!1128831 m!1042393))

(declare-fun m!1042395 () Bool)

(assert (=> b!1128831 m!1042395))

(check-sat (not b!1128844) (not b!1128840) (not b_lambda!18835) tp_is_empty!28395 (not b!1128843) (not b!1128835) b_and!38515 (not start!98164) (not b!1128836) (not b!1128845) (not mapNonEmpty!44410) (not b!1128839) (not b!1128831) (not bm!47874) (not b!1128828) (not bm!47875) (not b!1128838) (not b!1128841) (not b_next!23865))
(check-sat b_and!38515 (not b_next!23865))
