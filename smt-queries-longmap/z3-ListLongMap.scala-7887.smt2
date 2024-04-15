; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98060 () Bool)

(assert start!98060)

(declare-fun b_free!23767 () Bool)

(declare-fun b_next!23767 () Bool)

(assert (=> start!98060 (= b_free!23767 (not b_next!23767))))

(declare-fun tp!84005 () Bool)

(declare-fun b_and!38295 () Bool)

(assert (=> start!98060 (= tp!84005 b_and!38295)))

(declare-fun b!1125937 () Bool)

(declare-fun e!640889 () Bool)

(declare-fun e!640891 () Bool)

(declare-fun mapRes!44263 () Bool)

(assert (=> b!1125937 (= e!640889 (and e!640891 mapRes!44263))))

(declare-fun condMapEmpty!44263 () Bool)

(declare-datatypes ((V!42857 0))(
  ( (V!42858 (val!14205 Int)) )
))
(declare-datatypes ((ValueCell!13439 0))(
  ( (ValueCellFull!13439 (v!16837 V!42857)) (EmptyCell!13439) )
))
(declare-datatypes ((array!73384 0))(
  ( (array!73385 (arr!35345 (Array (_ BitVec 32) ValueCell!13439)) (size!35883 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73384)

(declare-fun mapDefault!44263 () ValueCell!13439)

(assert (=> b!1125937 (= condMapEmpty!44263 (= (arr!35345 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13439)) mapDefault!44263)))))

(declare-fun e!640890 () Bool)

(declare-fun b!1125938 () Bool)

(declare-datatypes ((tuple2!17948 0))(
  ( (tuple2!17949 (_1!8985 (_ BitVec 64)) (_2!8985 V!42857)) )
))
(declare-datatypes ((List!24707 0))(
  ( (Nil!24704) (Cons!24703 (h!25912 tuple2!17948) (t!35457 List!24707)) )
))
(declare-datatypes ((ListLongMap!15917 0))(
  ( (ListLongMap!15918 (toList!7974 List!24707)) )
))
(declare-fun call!47560 () ListLongMap!15917)

(declare-fun call!47561 () ListLongMap!15917)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1102 (ListLongMap!15917 (_ BitVec 64)) ListLongMap!15917)

(assert (=> b!1125938 (= e!640890 (= call!47560 (-!1102 call!47561 k0!934)))))

(declare-fun res!752397 () Bool)

(declare-fun e!640894 () Bool)

(assert (=> start!98060 (=> (not res!752397) (not e!640894))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!73386 0))(
  ( (array!73387 (arr!35346 (Array (_ BitVec 32) (_ BitVec 64))) (size!35884 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73386)

(assert (=> start!98060 (= res!752397 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35884 _keys!1208))))))

(assert (=> start!98060 e!640894))

(declare-fun tp_is_empty!28297 () Bool)

(assert (=> start!98060 tp_is_empty!28297))

(declare-fun array_inv!27200 (array!73386) Bool)

(assert (=> start!98060 (array_inv!27200 _keys!1208)))

(assert (=> start!98060 true))

(assert (=> start!98060 tp!84005))

(declare-fun array_inv!27201 (array!73384) Bool)

(assert (=> start!98060 (and (array_inv!27201 _values!996) e!640889)))

(declare-fun b!1125939 () Bool)

(declare-fun e!640896 () Bool)

(declare-fun e!640888 () Bool)

(assert (=> b!1125939 (= e!640896 e!640888)))

(declare-fun res!752399 () Bool)

(assert (=> b!1125939 (=> res!752399 e!640888)))

(assert (=> b!1125939 (= res!752399 (not (= (select (arr!35346 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1125939 e!640890))

(declare-fun c!109614 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1125939 (= c!109614 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!42857)

(declare-datatypes ((Unit!36755 0))(
  ( (Unit!36756) )
))
(declare-fun lt!499887 () Unit!36755)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42857)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!383 (array!73386 array!73384 (_ BitVec 32) (_ BitVec 32) V!42857 V!42857 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36755)

(assert (=> b!1125939 (= lt!499887 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!383 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125940 () Bool)

(assert (=> b!1125940 (= e!640891 tp_is_empty!28297)))

(declare-fun bm!47557 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4476 (array!73386 array!73384 (_ BitVec 32) (_ BitVec 32) V!42857 V!42857 (_ BitVec 32) Int) ListLongMap!15917)

(assert (=> bm!47557 (= call!47561 (getCurrentListMapNoExtraKeys!4476 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125941 () Bool)

(declare-fun e!640892 () Bool)

(assert (=> b!1125941 (= e!640894 e!640892)))

(declare-fun res!752398 () Bool)

(assert (=> b!1125941 (=> (not res!752398) (not e!640892))))

(declare-fun lt!499888 () array!73386)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73386 (_ BitVec 32)) Bool)

(assert (=> b!1125941 (= res!752398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499888 mask!1564))))

(assert (=> b!1125941 (= lt!499888 (array!73387 (store (arr!35346 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35884 _keys!1208)))))

(declare-fun b!1125942 () Bool)

(assert (=> b!1125942 (= e!640890 (= call!47560 call!47561))))

(declare-fun b!1125943 () Bool)

(declare-fun res!752396 () Bool)

(assert (=> b!1125943 (=> (not res!752396) (not e!640894))))

(assert (=> b!1125943 (= res!752396 (and (= (size!35883 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35884 _keys!1208) (size!35883 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1125944 () Bool)

(declare-fun res!752389 () Bool)

(assert (=> b!1125944 (=> (not res!752389) (not e!640894))))

(assert (=> b!1125944 (= res!752389 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35884 _keys!1208))))))

(declare-fun b!1125945 () Bool)

(declare-fun e!640893 () Bool)

(assert (=> b!1125945 (= e!640892 (not e!640893))))

(declare-fun res!752400 () Bool)

(assert (=> b!1125945 (=> res!752400 e!640893)))

(assert (=> b!1125945 (= res!752400 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73386 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1125945 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!499885 () Unit!36755)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73386 (_ BitVec 64) (_ BitVec 32)) Unit!36755)

(assert (=> b!1125945 (= lt!499885 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1125946 () Bool)

(assert (=> b!1125946 (= e!640893 e!640896)))

(declare-fun res!752390 () Bool)

(assert (=> b!1125946 (=> res!752390 e!640896)))

(assert (=> b!1125946 (= res!752390 (not (= from!1455 i!673)))))

(declare-fun lt!499886 () ListLongMap!15917)

(declare-fun lt!499884 () array!73384)

(assert (=> b!1125946 (= lt!499886 (getCurrentListMapNoExtraKeys!4476 lt!499888 lt!499884 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2493 (Int (_ BitVec 64)) V!42857)

(assert (=> b!1125946 (= lt!499884 (array!73385 (store (arr!35345 _values!996) i!673 (ValueCellFull!13439 (dynLambda!2493 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35883 _values!996)))))

(declare-fun lt!499890 () ListLongMap!15917)

(assert (=> b!1125946 (= lt!499890 (getCurrentListMapNoExtraKeys!4476 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!44263 () Bool)

(assert (=> mapIsEmpty!44263 mapRes!44263))

(declare-fun b!1125947 () Bool)

(declare-fun res!752395 () Bool)

(assert (=> b!1125947 (=> (not res!752395) (not e!640894))))

(assert (=> b!1125947 (= res!752395 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1125948 () Bool)

(declare-fun res!752392 () Bool)

(assert (=> b!1125948 (=> (not res!752392) (not e!640892))))

(declare-datatypes ((List!24708 0))(
  ( (Nil!24705) (Cons!24704 (h!25913 (_ BitVec 64)) (t!35458 List!24708)) )
))
(declare-fun arrayNoDuplicates!0 (array!73386 (_ BitVec 32) List!24708) Bool)

(assert (=> b!1125948 (= res!752392 (arrayNoDuplicates!0 lt!499888 #b00000000000000000000000000000000 Nil!24705))))

(declare-fun b!1125949 () Bool)

(declare-fun res!752394 () Bool)

(assert (=> b!1125949 (=> (not res!752394) (not e!640894))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1125949 (= res!752394 (validMask!0 mask!1564))))

(declare-fun b!1125950 () Bool)

(declare-fun e!640895 () Bool)

(assert (=> b!1125950 (= e!640895 tp_is_empty!28297)))

(declare-fun b!1125951 () Bool)

(declare-fun res!752393 () Bool)

(assert (=> b!1125951 (=> (not res!752393) (not e!640894))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1125951 (= res!752393 (validKeyInArray!0 k0!934))))

(declare-fun b!1125952 () Bool)

(assert (=> b!1125952 (= e!640888 true)))

(declare-fun lt!499889 () Bool)

(declare-fun contains!6440 (ListLongMap!15917 (_ BitVec 64)) Bool)

(assert (=> b!1125952 (= lt!499889 (contains!6440 (getCurrentListMapNoExtraKeys!4476 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1125953 () Bool)

(declare-fun res!752401 () Bool)

(assert (=> b!1125953 (=> (not res!752401) (not e!640894))))

(assert (=> b!1125953 (= res!752401 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24705))))

(declare-fun b!1125954 () Bool)

(declare-fun res!752391 () Bool)

(assert (=> b!1125954 (=> (not res!752391) (not e!640894))))

(assert (=> b!1125954 (= res!752391 (= (select (arr!35346 _keys!1208) i!673) k0!934))))

(declare-fun bm!47558 () Bool)

(assert (=> bm!47558 (= call!47560 (getCurrentListMapNoExtraKeys!4476 lt!499888 lt!499884 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44263 () Bool)

(declare-fun tp!84004 () Bool)

(assert (=> mapNonEmpty!44263 (= mapRes!44263 (and tp!84004 e!640895))))

(declare-fun mapValue!44263 () ValueCell!13439)

(declare-fun mapKey!44263 () (_ BitVec 32))

(declare-fun mapRest!44263 () (Array (_ BitVec 32) ValueCell!13439))

(assert (=> mapNonEmpty!44263 (= (arr!35345 _values!996) (store mapRest!44263 mapKey!44263 mapValue!44263))))

(assert (= (and start!98060 res!752397) b!1125949))

(assert (= (and b!1125949 res!752394) b!1125943))

(assert (= (and b!1125943 res!752396) b!1125947))

(assert (= (and b!1125947 res!752395) b!1125953))

(assert (= (and b!1125953 res!752401) b!1125944))

(assert (= (and b!1125944 res!752389) b!1125951))

(assert (= (and b!1125951 res!752393) b!1125954))

(assert (= (and b!1125954 res!752391) b!1125941))

(assert (= (and b!1125941 res!752398) b!1125948))

(assert (= (and b!1125948 res!752392) b!1125945))

(assert (= (and b!1125945 (not res!752400)) b!1125946))

(assert (= (and b!1125946 (not res!752390)) b!1125939))

(assert (= (and b!1125939 c!109614) b!1125938))

(assert (= (and b!1125939 (not c!109614)) b!1125942))

(assert (= (or b!1125938 b!1125942) bm!47557))

(assert (= (or b!1125938 b!1125942) bm!47558))

(assert (= (and b!1125939 (not res!752399)) b!1125952))

(assert (= (and b!1125937 condMapEmpty!44263) mapIsEmpty!44263))

(assert (= (and b!1125937 (not condMapEmpty!44263)) mapNonEmpty!44263))

(get-info :version)

(assert (= (and mapNonEmpty!44263 ((_ is ValueCellFull!13439) mapValue!44263)) b!1125950))

(assert (= (and b!1125937 ((_ is ValueCellFull!13439) mapDefault!44263)) b!1125940))

(assert (= start!98060 b!1125937))

(declare-fun b_lambda!18719 () Bool)

(assert (=> (not b_lambda!18719) (not b!1125946)))

(declare-fun t!35456 () Bool)

(declare-fun tb!8571 () Bool)

(assert (=> (and start!98060 (= defaultEntry!1004 defaultEntry!1004) t!35456) tb!8571))

(declare-fun result!17711 () Bool)

(assert (=> tb!8571 (= result!17711 tp_is_empty!28297)))

(assert (=> b!1125946 t!35456))

(declare-fun b_and!38297 () Bool)

(assert (= b_and!38295 (and (=> t!35456 result!17711) b_and!38297)))

(declare-fun m!1039467 () Bool)

(assert (=> b!1125947 m!1039467))

(declare-fun m!1039469 () Bool)

(assert (=> b!1125951 m!1039469))

(declare-fun m!1039471 () Bool)

(assert (=> b!1125945 m!1039471))

(declare-fun m!1039473 () Bool)

(assert (=> b!1125945 m!1039473))

(declare-fun m!1039475 () Bool)

(assert (=> bm!47558 m!1039475))

(declare-fun m!1039477 () Bool)

(assert (=> start!98060 m!1039477))

(declare-fun m!1039479 () Bool)

(assert (=> start!98060 m!1039479))

(declare-fun m!1039481 () Bool)

(assert (=> bm!47557 m!1039481))

(declare-fun m!1039483 () Bool)

(assert (=> b!1125946 m!1039483))

(declare-fun m!1039485 () Bool)

(assert (=> b!1125946 m!1039485))

(declare-fun m!1039487 () Bool)

(assert (=> b!1125946 m!1039487))

(declare-fun m!1039489 () Bool)

(assert (=> b!1125946 m!1039489))

(declare-fun m!1039491 () Bool)

(assert (=> b!1125939 m!1039491))

(declare-fun m!1039493 () Bool)

(assert (=> b!1125939 m!1039493))

(declare-fun m!1039495 () Bool)

(assert (=> b!1125941 m!1039495))

(declare-fun m!1039497 () Bool)

(assert (=> b!1125941 m!1039497))

(declare-fun m!1039499 () Bool)

(assert (=> b!1125938 m!1039499))

(declare-fun m!1039501 () Bool)

(assert (=> b!1125954 m!1039501))

(declare-fun m!1039503 () Bool)

(assert (=> b!1125953 m!1039503))

(declare-fun m!1039505 () Bool)

(assert (=> b!1125949 m!1039505))

(declare-fun m!1039507 () Bool)

(assert (=> b!1125948 m!1039507))

(declare-fun m!1039509 () Bool)

(assert (=> mapNonEmpty!44263 m!1039509))

(assert (=> b!1125952 m!1039481))

(assert (=> b!1125952 m!1039481))

(declare-fun m!1039511 () Bool)

(assert (=> b!1125952 m!1039511))

(check-sat (not b!1125949) (not mapNonEmpty!44263) (not b!1125953) (not b!1125952) (not start!98060) b_and!38297 tp_is_empty!28297 (not b!1125948) (not b_lambda!18719) (not b!1125938) (not b!1125951) (not bm!47557) (not bm!47558) (not b!1125945) (not b_next!23767) (not b!1125939) (not b!1125947) (not b!1125946) (not b!1125941))
(check-sat b_and!38297 (not b_next!23767))
