; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99514 () Bool)

(assert start!99514)

(declare-fun b_free!25099 () Bool)

(declare-fun b_next!25099 () Bool)

(assert (=> start!99514 (= b_free!25099 (not b_next!25099))))

(declare-fun tp!88010 () Bool)

(declare-fun b_and!41043 () Bool)

(assert (=> start!99514 (= tp!88010 b_and!41043)))

(declare-fun b!1176936 () Bool)

(declare-fun res!781770 () Bool)

(declare-fun e!669028 () Bool)

(assert (=> b!1176936 (=> (not res!781770) (not e!669028))))

(declare-datatypes ((array!75996 0))(
  ( (array!75997 (arr!36648 (Array (_ BitVec 32) (_ BitVec 64))) (size!37186 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75996)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1176936 (= res!781770 (= (select (arr!36648 _keys!1208) i!673) k0!934))))

(declare-fun res!781780 () Bool)

(assert (=> start!99514 (=> (not res!781780) (not e!669028))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99514 (= res!781780 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37186 _keys!1208))))))

(assert (=> start!99514 e!669028))

(declare-fun tp_is_empty!29629 () Bool)

(assert (=> start!99514 tp_is_empty!29629))

(declare-fun array_inv!28098 (array!75996) Bool)

(assert (=> start!99514 (array_inv!28098 _keys!1208)))

(assert (=> start!99514 true))

(assert (=> start!99514 tp!88010))

(declare-datatypes ((V!44633 0))(
  ( (V!44634 (val!14871 Int)) )
))
(declare-datatypes ((ValueCell!14105 0))(
  ( (ValueCellFull!14105 (v!17508 V!44633)) (EmptyCell!14105) )
))
(declare-datatypes ((array!75998 0))(
  ( (array!75999 (arr!36649 (Array (_ BitVec 32) ValueCell!14105)) (size!37187 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75998)

(declare-fun e!669034 () Bool)

(declare-fun array_inv!28099 (array!75998) Bool)

(assert (=> start!99514 (and (array_inv!28099 _values!996) e!669034)))

(declare-fun e!669032 () Bool)

(declare-fun b!1176937 () Bool)

(declare-fun arrayContainsKey!0 (array!75996 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1176937 (= e!669032 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1176938 () Bool)

(declare-fun e!669039 () Bool)

(assert (=> b!1176938 (= e!669039 tp_is_empty!29629)))

(declare-fun b!1176939 () Bool)

(declare-datatypes ((Unit!38699 0))(
  ( (Unit!38700) )
))
(declare-fun e!669040 () Unit!38699)

(declare-fun Unit!38701 () Unit!38699)

(assert (=> b!1176939 (= e!669040 Unit!38701)))

(declare-fun lt!531202 () Unit!38699)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75996 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38699)

(assert (=> b!1176939 (= lt!531202 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1176939 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!531215 () Unit!38699)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75996 (_ BitVec 32) (_ BitVec 32)) Unit!38699)

(assert (=> b!1176939 (= lt!531215 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25836 0))(
  ( (Nil!25833) (Cons!25832 (h!27041 (_ BitVec 64)) (t!37918 List!25836)) )
))
(declare-fun arrayNoDuplicates!0 (array!75996 (_ BitVec 32) List!25836) Bool)

(assert (=> b!1176939 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25833)))

(declare-fun lt!531203 () Unit!38699)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75996 (_ BitVec 64) (_ BitVec 32) List!25836) Unit!38699)

(assert (=> b!1176939 (= lt!531203 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25833))))

(assert (=> b!1176939 false))

(declare-fun b!1176940 () Bool)

(declare-fun res!781778 () Bool)

(assert (=> b!1176940 (=> (not res!781778) (not e!669028))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1176940 (= res!781778 (and (= (size!37187 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37186 _keys!1208) (size!37187 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1176941 () Bool)

(declare-fun e!669037 () Bool)

(assert (=> b!1176941 (= e!669028 e!669037)))

(declare-fun res!781773 () Bool)

(assert (=> b!1176941 (=> (not res!781773) (not e!669037))))

(declare-fun lt!531209 () array!75996)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75996 (_ BitVec 32)) Bool)

(assert (=> b!1176941 (= res!781773 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!531209 mask!1564))))

(assert (=> b!1176941 (= lt!531209 (array!75997 (store (arr!36648 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37186 _keys!1208)))))

(declare-fun mapIsEmpty!46271 () Bool)

(declare-fun mapRes!46271 () Bool)

(assert (=> mapIsEmpty!46271 mapRes!46271))

(declare-fun b!1176942 () Bool)

(declare-fun e!669029 () Bool)

(assert (=> b!1176942 (= e!669037 (not e!669029))))

(declare-fun res!781779 () Bool)

(assert (=> b!1176942 (=> res!781779 e!669029)))

(assert (=> b!1176942 (= res!781779 (bvsgt from!1455 i!673))))

(assert (=> b!1176942 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!531208 () Unit!38699)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75996 (_ BitVec 64) (_ BitVec 32)) Unit!38699)

(assert (=> b!1176942 (= lt!531208 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1176943 () Bool)

(declare-datatypes ((tuple2!19126 0))(
  ( (tuple2!19127 (_1!9574 (_ BitVec 64)) (_2!9574 V!44633)) )
))
(declare-fun lt!531207 () tuple2!19126)

(declare-datatypes ((List!25837 0))(
  ( (Nil!25834) (Cons!25833 (h!27042 tuple2!19126) (t!37919 List!25837)) )
))
(declare-datatypes ((ListLongMap!17095 0))(
  ( (ListLongMap!17096 (toList!8563 List!25837)) )
))
(declare-fun lt!531211 () ListLongMap!17095)

(declare-fun e!669031 () Bool)

(declare-fun lt!531205 () ListLongMap!17095)

(declare-fun +!3866 (ListLongMap!17095 tuple2!19126) ListLongMap!17095)

(assert (=> b!1176943 (= e!669031 (= lt!531205 (+!3866 lt!531211 lt!531207)))))

(declare-fun b!1176944 () Bool)

(declare-fun e!669030 () Bool)

(assert (=> b!1176944 (= e!669030 tp_is_empty!29629)))

(declare-fun b!1176945 () Bool)

(declare-fun res!781781 () Bool)

(assert (=> b!1176945 (=> (not res!781781) (not e!669028))))

(assert (=> b!1176945 (= res!781781 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25833))))

(declare-fun b!1176946 () Bool)

(declare-fun e!669033 () Bool)

(declare-fun e!669038 () Bool)

(assert (=> b!1176946 (= e!669033 e!669038)))

(declare-fun res!781777 () Bool)

(assert (=> b!1176946 (=> res!781777 e!669038)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1176946 (= res!781777 (not (validKeyInArray!0 (select (arr!36648 _keys!1208) from!1455))))))

(declare-fun lt!531216 () ListLongMap!17095)

(declare-fun lt!531210 () ListLongMap!17095)

(assert (=> b!1176946 (= lt!531216 lt!531210)))

(declare-fun -!1539 (ListLongMap!17095 (_ BitVec 64)) ListLongMap!17095)

(assert (=> b!1176946 (= lt!531210 (-!1539 lt!531211 k0!934))))

(declare-fun zeroValue!944 () V!44633)

(declare-fun lt!531204 () array!75998)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44633)

(declare-fun getCurrentListMapNoExtraKeys!5030 (array!75996 array!75998 (_ BitVec 32) (_ BitVec 32) V!44633 V!44633 (_ BitVec 32) Int) ListLongMap!17095)

(assert (=> b!1176946 (= lt!531216 (getCurrentListMapNoExtraKeys!5030 lt!531209 lt!531204 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1176946 (= lt!531211 (getCurrentListMapNoExtraKeys!5030 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!531212 () Unit!38699)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!803 (array!75996 array!75998 (_ BitVec 32) (_ BitVec 32) V!44633 V!44633 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38699)

(assert (=> b!1176946 (= lt!531212 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!803 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1176947 () Bool)

(declare-fun res!781771 () Bool)

(assert (=> b!1176947 (=> (not res!781771) (not e!669028))))

(assert (=> b!1176947 (= res!781771 (validKeyInArray!0 k0!934))))

(declare-fun b!1176948 () Bool)

(declare-fun res!781776 () Bool)

(assert (=> b!1176948 (=> (not res!781776) (not e!669028))))

(assert (=> b!1176948 (= res!781776 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37186 _keys!1208))))))

(declare-fun b!1176949 () Bool)

(declare-fun e!669035 () Bool)

(assert (=> b!1176949 (= e!669035 e!669032)))

(declare-fun res!781769 () Bool)

(assert (=> b!1176949 (=> res!781769 e!669032)))

(assert (=> b!1176949 (= res!781769 (not (= (select (arr!36648 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1176950 () Bool)

(declare-fun res!781783 () Bool)

(assert (=> b!1176950 (=> (not res!781783) (not e!669028))))

(assert (=> b!1176950 (= res!781783 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1176951 () Bool)

(assert (=> b!1176951 (= e!669029 e!669033)))

(declare-fun res!781774 () Bool)

(assert (=> b!1176951 (=> res!781774 e!669033)))

(assert (=> b!1176951 (= res!781774 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!531214 () ListLongMap!17095)

(assert (=> b!1176951 (= lt!531214 (getCurrentListMapNoExtraKeys!5030 lt!531209 lt!531204 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!531213 () V!44633)

(assert (=> b!1176951 (= lt!531204 (array!75999 (store (arr!36649 _values!996) i!673 (ValueCellFull!14105 lt!531213)) (size!37187 _values!996)))))

(declare-fun dynLambda!2947 (Int (_ BitVec 64)) V!44633)

(assert (=> b!1176951 (= lt!531213 (dynLambda!2947 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1176951 (= lt!531205 (getCurrentListMapNoExtraKeys!5030 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1176952 () Bool)

(assert (=> b!1176952 (= e!669038 true)))

(assert (=> b!1176952 e!669031))

(declare-fun res!781772 () Bool)

(assert (=> b!1176952 (=> (not res!781772) (not e!669031))))

(assert (=> b!1176952 (= res!781772 (not (= (select (arr!36648 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!531206 () Unit!38699)

(assert (=> b!1176952 (= lt!531206 e!669040)))

(declare-fun c!116746 () Bool)

(assert (=> b!1176952 (= c!116746 (= (select (arr!36648 _keys!1208) from!1455) k0!934))))

(assert (=> b!1176952 e!669035))

(declare-fun res!781775 () Bool)

(assert (=> b!1176952 (=> (not res!781775) (not e!669035))))

(assert (=> b!1176952 (= res!781775 (= lt!531214 (+!3866 lt!531210 lt!531207)))))

(declare-fun get!18729 (ValueCell!14105 V!44633) V!44633)

(assert (=> b!1176952 (= lt!531207 (tuple2!19127 (select (arr!36648 _keys!1208) from!1455) (get!18729 (select (arr!36649 _values!996) from!1455) lt!531213)))))

(declare-fun b!1176953 () Bool)

(declare-fun res!781782 () Bool)

(assert (=> b!1176953 (=> (not res!781782) (not e!669037))))

(assert (=> b!1176953 (= res!781782 (arrayNoDuplicates!0 lt!531209 #b00000000000000000000000000000000 Nil!25833))))

(declare-fun b!1176954 () Bool)

(declare-fun res!781768 () Bool)

(assert (=> b!1176954 (=> (not res!781768) (not e!669028))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1176954 (= res!781768 (validMask!0 mask!1564))))

(declare-fun b!1176955 () Bool)

(assert (=> b!1176955 (= e!669034 (and e!669039 mapRes!46271))))

(declare-fun condMapEmpty!46271 () Bool)

(declare-fun mapDefault!46271 () ValueCell!14105)

(assert (=> b!1176955 (= condMapEmpty!46271 (= (arr!36649 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14105)) mapDefault!46271)))))

(declare-fun b!1176956 () Bool)

(declare-fun Unit!38702 () Unit!38699)

(assert (=> b!1176956 (= e!669040 Unit!38702)))

(declare-fun mapNonEmpty!46271 () Bool)

(declare-fun tp!88011 () Bool)

(assert (=> mapNonEmpty!46271 (= mapRes!46271 (and tp!88011 e!669030))))

(declare-fun mapRest!46271 () (Array (_ BitVec 32) ValueCell!14105))

(declare-fun mapKey!46271 () (_ BitVec 32))

(declare-fun mapValue!46271 () ValueCell!14105)

(assert (=> mapNonEmpty!46271 (= (arr!36649 _values!996) (store mapRest!46271 mapKey!46271 mapValue!46271))))

(assert (= (and start!99514 res!781780) b!1176954))

(assert (= (and b!1176954 res!781768) b!1176940))

(assert (= (and b!1176940 res!781778) b!1176950))

(assert (= (and b!1176950 res!781783) b!1176945))

(assert (= (and b!1176945 res!781781) b!1176948))

(assert (= (and b!1176948 res!781776) b!1176947))

(assert (= (and b!1176947 res!781771) b!1176936))

(assert (= (and b!1176936 res!781770) b!1176941))

(assert (= (and b!1176941 res!781773) b!1176953))

(assert (= (and b!1176953 res!781782) b!1176942))

(assert (= (and b!1176942 (not res!781779)) b!1176951))

(assert (= (and b!1176951 (not res!781774)) b!1176946))

(assert (= (and b!1176946 (not res!781777)) b!1176952))

(assert (= (and b!1176952 res!781775) b!1176949))

(assert (= (and b!1176949 (not res!781769)) b!1176937))

(assert (= (and b!1176952 c!116746) b!1176939))

(assert (= (and b!1176952 (not c!116746)) b!1176956))

(assert (= (and b!1176952 res!781772) b!1176943))

(assert (= (and b!1176955 condMapEmpty!46271) mapIsEmpty!46271))

(assert (= (and b!1176955 (not condMapEmpty!46271)) mapNonEmpty!46271))

(get-info :version)

(assert (= (and mapNonEmpty!46271 ((_ is ValueCellFull!14105) mapValue!46271)) b!1176944))

(assert (= (and b!1176955 ((_ is ValueCellFull!14105) mapDefault!46271)) b!1176938))

(assert (= start!99514 b!1176955))

(declare-fun b_lambda!20225 () Bool)

(assert (=> (not b_lambda!20225) (not b!1176951)))

(declare-fun t!37917 () Bool)

(declare-fun tb!9903 () Bool)

(assert (=> (and start!99514 (= defaultEntry!1004 defaultEntry!1004) t!37917) tb!9903))

(declare-fun result!20381 () Bool)

(assert (=> tb!9903 (= result!20381 tp_is_empty!29629)))

(assert (=> b!1176951 t!37917))

(declare-fun b_and!41045 () Bool)

(assert (= b_and!41043 (and (=> t!37917 result!20381) b_and!41045)))

(declare-fun m!1084391 () Bool)

(assert (=> b!1176946 m!1084391))

(declare-fun m!1084393 () Bool)

(assert (=> b!1176946 m!1084393))

(declare-fun m!1084395 () Bool)

(assert (=> b!1176946 m!1084395))

(declare-fun m!1084397 () Bool)

(assert (=> b!1176946 m!1084397))

(declare-fun m!1084399 () Bool)

(assert (=> b!1176946 m!1084399))

(declare-fun m!1084401 () Bool)

(assert (=> b!1176946 m!1084401))

(assert (=> b!1176946 m!1084397))

(declare-fun m!1084403 () Bool)

(assert (=> b!1176953 m!1084403))

(declare-fun m!1084405 () Bool)

(assert (=> b!1176942 m!1084405))

(declare-fun m!1084407 () Bool)

(assert (=> b!1176942 m!1084407))

(declare-fun m!1084409 () Bool)

(assert (=> b!1176950 m!1084409))

(declare-fun m!1084411 () Bool)

(assert (=> start!99514 m!1084411))

(declare-fun m!1084413 () Bool)

(assert (=> start!99514 m!1084413))

(declare-fun m!1084415 () Bool)

(assert (=> b!1176943 m!1084415))

(declare-fun m!1084417 () Bool)

(assert (=> b!1176951 m!1084417))

(declare-fun m!1084419 () Bool)

(assert (=> b!1176951 m!1084419))

(declare-fun m!1084421 () Bool)

(assert (=> b!1176951 m!1084421))

(declare-fun m!1084423 () Bool)

(assert (=> b!1176951 m!1084423))

(assert (=> b!1176949 m!1084397))

(assert (=> b!1176952 m!1084397))

(declare-fun m!1084425 () Bool)

(assert (=> b!1176952 m!1084425))

(declare-fun m!1084427 () Bool)

(assert (=> b!1176952 m!1084427))

(assert (=> b!1176952 m!1084427))

(declare-fun m!1084429 () Bool)

(assert (=> b!1176952 m!1084429))

(declare-fun m!1084431 () Bool)

(assert (=> mapNonEmpty!46271 m!1084431))

(declare-fun m!1084433 () Bool)

(assert (=> b!1176947 m!1084433))

(declare-fun m!1084435 () Bool)

(assert (=> b!1176939 m!1084435))

(declare-fun m!1084437 () Bool)

(assert (=> b!1176939 m!1084437))

(declare-fun m!1084439 () Bool)

(assert (=> b!1176939 m!1084439))

(declare-fun m!1084441 () Bool)

(assert (=> b!1176939 m!1084441))

(declare-fun m!1084443 () Bool)

(assert (=> b!1176939 m!1084443))

(declare-fun m!1084445 () Bool)

(assert (=> b!1176941 m!1084445))

(declare-fun m!1084447 () Bool)

(assert (=> b!1176941 m!1084447))

(declare-fun m!1084449 () Bool)

(assert (=> b!1176954 m!1084449))

(declare-fun m!1084451 () Bool)

(assert (=> b!1176945 m!1084451))

(declare-fun m!1084453 () Bool)

(assert (=> b!1176936 m!1084453))

(declare-fun m!1084455 () Bool)

(assert (=> b!1176937 m!1084455))

(check-sat (not b!1176945) (not b!1176950) (not b!1176939) (not mapNonEmpty!46271) (not b!1176947) tp_is_empty!29629 (not b!1176937) (not b!1176942) (not b!1176952) (not b!1176954) (not b!1176946) (not b_next!25099) (not b_lambda!20225) (not start!99514) (not b!1176943) (not b!1176951) (not b!1176941) b_and!41045 (not b!1176953))
(check-sat b_and!41045 (not b_next!25099))
