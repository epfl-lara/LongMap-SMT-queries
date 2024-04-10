; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99900 () Bool)

(assert start!99900)

(declare-fun b_free!25479 () Bool)

(declare-fun b_next!25479 () Bool)

(assert (=> start!99900 (= b_free!25479 (not b_next!25479))))

(declare-fun tp!89150 () Bool)

(declare-fun b_and!41825 () Bool)

(assert (=> start!99900 (= tp!89150 b_and!41825)))

(declare-fun mapNonEmpty!46841 () Bool)

(declare-fun mapRes!46841 () Bool)

(declare-fun tp!89151 () Bool)

(declare-fun e!675987 () Bool)

(assert (=> mapNonEmpty!46841 (= mapRes!46841 (and tp!89151 e!675987))))

(declare-datatypes ((V!45139 0))(
  ( (V!45140 (val!15061 Int)) )
))
(declare-datatypes ((ValueCell!14295 0))(
  ( (ValueCellFull!14295 (v!17699 V!45139)) (EmptyCell!14295) )
))
(declare-fun mapValue!46841 () ValueCell!14295)

(declare-fun mapRest!46841 () (Array (_ BitVec 32) ValueCell!14295))

(declare-datatypes ((array!76813 0))(
  ( (array!76814 (arr!37056 (Array (_ BitVec 32) ValueCell!14295)) (size!37592 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76813)

(declare-fun mapKey!46841 () (_ BitVec 32))

(assert (=> mapNonEmpty!46841 (= (arr!37056 _values!996) (store mapRest!46841 mapKey!46841 mapValue!46841))))

(declare-fun b!1188930 () Bool)

(declare-fun res!790567 () Bool)

(declare-fun e!675992 () Bool)

(assert (=> b!1188930 (=> (not res!790567) (not e!675992))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1188930 (= res!790567 (validMask!0 mask!1564))))

(declare-fun b!1188931 () Bool)

(declare-fun res!790560 () Bool)

(assert (=> b!1188931 (=> (not res!790560) (not e!675992))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1188931 (= res!790560 (validKeyInArray!0 k0!934))))

(declare-fun b!1188932 () Bool)

(declare-fun e!675989 () Bool)

(declare-fun tp_is_empty!30009 () Bool)

(assert (=> b!1188932 (= e!675989 tp_is_empty!30009)))

(declare-fun b!1188933 () Bool)

(assert (=> b!1188933 (= e!675987 tp_is_empty!30009)))

(declare-fun b!1188934 () Bool)

(declare-fun e!675988 () Bool)

(assert (=> b!1188934 (= e!675992 e!675988)))

(declare-fun res!790559 () Bool)

(assert (=> b!1188934 (=> (not res!790559) (not e!675988))))

(declare-datatypes ((array!76815 0))(
  ( (array!76816 (arr!37057 (Array (_ BitVec 32) (_ BitVec 64))) (size!37593 (_ BitVec 32))) )
))
(declare-fun lt!540873 () array!76815)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76815 (_ BitVec 32)) Bool)

(assert (=> b!1188934 (= res!790559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!540873 mask!1564))))

(declare-fun _keys!1208 () array!76815)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1188934 (= lt!540873 (array!76816 (store (arr!37057 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37593 _keys!1208)))))

(declare-fun b!1188935 () Bool)

(declare-fun e!675991 () Bool)

(declare-fun e!675990 () Bool)

(assert (=> b!1188935 (= e!675991 e!675990)))

(declare-fun res!790564 () Bool)

(assert (=> b!1188935 (=> res!790564 e!675990)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1188935 (= res!790564 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((tuple2!19340 0))(
  ( (tuple2!19341 (_1!9681 (_ BitVec 64)) (_2!9681 V!45139)) )
))
(declare-datatypes ((List!26085 0))(
  ( (Nil!26082) (Cons!26081 (h!27290 tuple2!19340) (t!38556 List!26085)) )
))
(declare-datatypes ((ListLongMap!17309 0))(
  ( (ListLongMap!17310 (toList!8670 List!26085)) )
))
(declare-fun lt!540874 () ListLongMap!17309)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!540871 () array!76813)

(declare-fun minValue!944 () V!45139)

(declare-fun zeroValue!944 () V!45139)

(declare-fun getCurrentListMapNoExtraKeys!5111 (array!76815 array!76813 (_ BitVec 32) (_ BitVec 32) V!45139 V!45139 (_ BitVec 32) Int) ListLongMap!17309)

(assert (=> b!1188935 (= lt!540874 (getCurrentListMapNoExtraKeys!5111 lt!540873 lt!540871 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3055 (Int (_ BitVec 64)) V!45139)

(assert (=> b!1188935 (= lt!540871 (array!76814 (store (arr!37056 _values!996) i!673 (ValueCellFull!14295 (dynLambda!3055 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37592 _values!996)))))

(declare-fun lt!540872 () ListLongMap!17309)

(assert (=> b!1188935 (= lt!540872 (getCurrentListMapNoExtraKeys!5111 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!46841 () Bool)

(assert (=> mapIsEmpty!46841 mapRes!46841))

(declare-fun b!1188936 () Bool)

(declare-fun res!790566 () Bool)

(assert (=> b!1188936 (=> (not res!790566) (not e!675992))))

(assert (=> b!1188936 (= res!790566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1188937 () Bool)

(declare-fun res!790562 () Bool)

(assert (=> b!1188937 (=> (not res!790562) (not e!675992))))

(assert (=> b!1188937 (= res!790562 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37593 _keys!1208))))))

(declare-fun b!1188938 () Bool)

(declare-fun res!790563 () Bool)

(assert (=> b!1188938 (=> (not res!790563) (not e!675992))))

(assert (=> b!1188938 (= res!790563 (= (select (arr!37057 _keys!1208) i!673) k0!934))))

(declare-fun res!790561 () Bool)

(assert (=> start!99900 (=> (not res!790561) (not e!675992))))

(assert (=> start!99900 (= res!790561 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37593 _keys!1208))))))

(assert (=> start!99900 e!675992))

(assert (=> start!99900 tp_is_empty!30009))

(declare-fun array_inv!28264 (array!76815) Bool)

(assert (=> start!99900 (array_inv!28264 _keys!1208)))

(assert (=> start!99900 true))

(assert (=> start!99900 tp!89150))

(declare-fun e!675994 () Bool)

(declare-fun array_inv!28265 (array!76813) Bool)

(assert (=> start!99900 (and (array_inv!28265 _values!996) e!675994)))

(declare-fun b!1188939 () Bool)

(declare-fun res!790556 () Bool)

(assert (=> b!1188939 (=> (not res!790556) (not e!675992))))

(declare-datatypes ((List!26086 0))(
  ( (Nil!26083) (Cons!26082 (h!27291 (_ BitVec 64)) (t!38557 List!26086)) )
))
(declare-fun arrayNoDuplicates!0 (array!76815 (_ BitVec 32) List!26086) Bool)

(assert (=> b!1188939 (= res!790556 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26083))))

(declare-fun b!1188940 () Bool)

(declare-fun res!790565 () Bool)

(assert (=> b!1188940 (=> (not res!790565) (not e!675988))))

(assert (=> b!1188940 (= res!790565 (arrayNoDuplicates!0 lt!540873 #b00000000000000000000000000000000 Nil!26083))))

(declare-fun b!1188941 () Bool)

(assert (=> b!1188941 (= e!675988 (not e!675991))))

(declare-fun res!790557 () Bool)

(assert (=> b!1188941 (=> res!790557 e!675991)))

(assert (=> b!1188941 (= res!790557 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76815 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1188941 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39440 0))(
  ( (Unit!39441) )
))
(declare-fun lt!540875 () Unit!39440)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76815 (_ BitVec 64) (_ BitVec 32)) Unit!39440)

(assert (=> b!1188941 (= lt!540875 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1188942 () Bool)

(assert (=> b!1188942 (= e!675990 true)))

(declare-fun -!1700 (ListLongMap!17309 (_ BitVec 64)) ListLongMap!17309)

(assert (=> b!1188942 (= (getCurrentListMapNoExtraKeys!5111 lt!540873 lt!540871 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1700 (getCurrentListMapNoExtraKeys!5111 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!540876 () Unit!39440)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!909 (array!76815 array!76813 (_ BitVec 32) (_ BitVec 32) V!45139 V!45139 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39440)

(assert (=> b!1188942 (= lt!540876 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!909 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1188943 () Bool)

(declare-fun res!790558 () Bool)

(assert (=> b!1188943 (=> (not res!790558) (not e!675992))))

(assert (=> b!1188943 (= res!790558 (and (= (size!37592 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37593 _keys!1208) (size!37592 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1188944 () Bool)

(assert (=> b!1188944 (= e!675994 (and e!675989 mapRes!46841))))

(declare-fun condMapEmpty!46841 () Bool)

(declare-fun mapDefault!46841 () ValueCell!14295)

(assert (=> b!1188944 (= condMapEmpty!46841 (= (arr!37056 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14295)) mapDefault!46841)))))

(assert (= (and start!99900 res!790561) b!1188930))

(assert (= (and b!1188930 res!790567) b!1188943))

(assert (= (and b!1188943 res!790558) b!1188936))

(assert (= (and b!1188936 res!790566) b!1188939))

(assert (= (and b!1188939 res!790556) b!1188937))

(assert (= (and b!1188937 res!790562) b!1188931))

(assert (= (and b!1188931 res!790560) b!1188938))

(assert (= (and b!1188938 res!790563) b!1188934))

(assert (= (and b!1188934 res!790559) b!1188940))

(assert (= (and b!1188940 res!790565) b!1188941))

(assert (= (and b!1188941 (not res!790557)) b!1188935))

(assert (= (and b!1188935 (not res!790564)) b!1188942))

(assert (= (and b!1188944 condMapEmpty!46841) mapIsEmpty!46841))

(assert (= (and b!1188944 (not condMapEmpty!46841)) mapNonEmpty!46841))

(get-info :version)

(assert (= (and mapNonEmpty!46841 ((_ is ValueCellFull!14295) mapValue!46841)) b!1188933))

(assert (= (and b!1188944 ((_ is ValueCellFull!14295) mapDefault!46841)) b!1188932))

(assert (= start!99900 b!1188944))

(declare-fun b_lambda!20623 () Bool)

(assert (=> (not b_lambda!20623) (not b!1188935)))

(declare-fun t!38555 () Bool)

(declare-fun tb!10291 () Bool)

(assert (=> (and start!99900 (= defaultEntry!1004 defaultEntry!1004) t!38555) tb!10291))

(declare-fun result!21149 () Bool)

(assert (=> tb!10291 (= result!21149 tp_is_empty!30009)))

(assert (=> b!1188935 t!38555))

(declare-fun b_and!41827 () Bool)

(assert (= b_and!41825 (and (=> t!38555 result!21149) b_and!41827)))

(declare-fun m!1097661 () Bool)

(assert (=> mapNonEmpty!46841 m!1097661))

(declare-fun m!1097663 () Bool)

(assert (=> b!1188930 m!1097663))

(declare-fun m!1097665 () Bool)

(assert (=> start!99900 m!1097665))

(declare-fun m!1097667 () Bool)

(assert (=> start!99900 m!1097667))

(declare-fun m!1097669 () Bool)

(assert (=> b!1188938 m!1097669))

(declare-fun m!1097671 () Bool)

(assert (=> b!1188939 m!1097671))

(declare-fun m!1097673 () Bool)

(assert (=> b!1188935 m!1097673))

(declare-fun m!1097675 () Bool)

(assert (=> b!1188935 m!1097675))

(declare-fun m!1097677 () Bool)

(assert (=> b!1188935 m!1097677))

(declare-fun m!1097679 () Bool)

(assert (=> b!1188935 m!1097679))

(declare-fun m!1097681 () Bool)

(assert (=> b!1188934 m!1097681))

(declare-fun m!1097683 () Bool)

(assert (=> b!1188934 m!1097683))

(declare-fun m!1097685 () Bool)

(assert (=> b!1188941 m!1097685))

(declare-fun m!1097687 () Bool)

(assert (=> b!1188941 m!1097687))

(declare-fun m!1097689 () Bool)

(assert (=> b!1188931 m!1097689))

(declare-fun m!1097691 () Bool)

(assert (=> b!1188942 m!1097691))

(declare-fun m!1097693 () Bool)

(assert (=> b!1188942 m!1097693))

(assert (=> b!1188942 m!1097693))

(declare-fun m!1097695 () Bool)

(assert (=> b!1188942 m!1097695))

(declare-fun m!1097697 () Bool)

(assert (=> b!1188942 m!1097697))

(declare-fun m!1097699 () Bool)

(assert (=> b!1188936 m!1097699))

(declare-fun m!1097701 () Bool)

(assert (=> b!1188940 m!1097701))

(check-sat b_and!41827 (not b!1188930) (not b!1188934) (not b_lambda!20623) (not b!1188936) (not b!1188940) (not b!1188935) (not b!1188942) (not mapNonEmpty!46841) (not b!1188941) (not b!1188939) (not b!1188931) (not start!99900) tp_is_empty!30009 (not b_next!25479))
(check-sat b_and!41827 (not b_next!25479))
