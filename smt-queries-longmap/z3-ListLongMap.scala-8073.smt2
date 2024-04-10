; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99306 () Bool)

(assert start!99306)

(declare-fun b_free!24885 () Bool)

(declare-fun b_next!24885 () Bool)

(assert (=> start!99306 (= b_free!24885 (not b_next!24885))))

(declare-fun tp!87368 () Bool)

(declare-fun b_and!40637 () Bool)

(assert (=> start!99306 (= tp!87368 b_and!40637)))

(declare-fun b!1170248 () Bool)

(declare-fun res!776629 () Bool)

(declare-fun e!665133 () Bool)

(assert (=> b!1170248 (=> (not res!776629) (not e!665133))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1170248 (= res!776629 (validKeyInArray!0 k0!934))))

(declare-fun b!1170249 () Bool)

(declare-fun e!665127 () Bool)

(assert (=> b!1170249 (= e!665127 true)))

(declare-datatypes ((array!75649 0))(
  ( (array!75650 (arr!36474 (Array (_ BitVec 32) (_ BitVec 64))) (size!37010 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75649)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!75649 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1170249 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!38606 0))(
  ( (Unit!38607) )
))
(declare-fun lt!527031 () Unit!38606)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75649 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38606)

(assert (=> b!1170249 (= lt!527031 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1170250 () Bool)

(declare-fun res!776621 () Bool)

(assert (=> b!1170250 (=> (not res!776621) (not e!665133))))

(assert (=> b!1170250 (= res!776621 (= (select (arr!36474 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!45950 () Bool)

(declare-fun mapRes!45950 () Bool)

(declare-fun tp!87369 () Bool)

(declare-fun e!665136 () Bool)

(assert (=> mapNonEmpty!45950 (= mapRes!45950 (and tp!87369 e!665136))))

(declare-fun mapKey!45950 () (_ BitVec 32))

(declare-datatypes ((V!44347 0))(
  ( (V!44348 (val!14764 Int)) )
))
(declare-datatypes ((ValueCell!13998 0))(
  ( (ValueCellFull!13998 (v!17402 V!44347)) (EmptyCell!13998) )
))
(declare-datatypes ((array!75651 0))(
  ( (array!75652 (arr!36475 (Array (_ BitVec 32) ValueCell!13998)) (size!37011 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75651)

(declare-fun mapRest!45950 () (Array (_ BitVec 32) ValueCell!13998))

(declare-fun mapValue!45950 () ValueCell!13998)

(assert (=> mapNonEmpty!45950 (= (arr!36475 _values!996) (store mapRest!45950 mapKey!45950 mapValue!45950))))

(declare-fun b!1170251 () Bool)

(declare-fun e!665134 () Bool)

(declare-fun e!665130 () Bool)

(assert (=> b!1170251 (= e!665134 e!665130)))

(declare-fun res!776626 () Bool)

(assert (=> b!1170251 (=> res!776626 e!665130)))

(assert (=> b!1170251 (= res!776626 (not (validKeyInArray!0 (select (arr!36474 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!18854 0))(
  ( (tuple2!18855 (_1!9438 (_ BitVec 64)) (_2!9438 V!44347)) )
))
(declare-datatypes ((List!25590 0))(
  ( (Nil!25587) (Cons!25586 (h!26795 tuple2!18854) (t!37467 List!25590)) )
))
(declare-datatypes ((ListLongMap!16823 0))(
  ( (ListLongMap!16824 (toList!8427 List!25590)) )
))
(declare-fun lt!527035 () ListLongMap!16823)

(declare-fun lt!527033 () ListLongMap!16823)

(assert (=> b!1170251 (= lt!527035 lt!527033)))

(declare-fun lt!527036 () ListLongMap!16823)

(declare-fun -!1498 (ListLongMap!16823 (_ BitVec 64)) ListLongMap!16823)

(assert (=> b!1170251 (= lt!527033 (-!1498 lt!527036 k0!934))))

(declare-fun zeroValue!944 () V!44347)

(declare-fun lt!527030 () array!75651)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!527037 () array!75649)

(declare-fun minValue!944 () V!44347)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4891 (array!75649 array!75651 (_ BitVec 32) (_ BitVec 32) V!44347 V!44347 (_ BitVec 32) Int) ListLongMap!16823)

(assert (=> b!1170251 (= lt!527035 (getCurrentListMapNoExtraKeys!4891 lt!527037 lt!527030 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1170251 (= lt!527036 (getCurrentListMapNoExtraKeys!4891 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!527034 () Unit!38606)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!725 (array!75649 array!75651 (_ BitVec 32) (_ BitVec 32) V!44347 V!44347 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38606)

(assert (=> b!1170251 (= lt!527034 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!725 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1170252 () Bool)

(declare-fun e!665132 () Bool)

(declare-fun e!665137 () Bool)

(assert (=> b!1170252 (= e!665132 e!665137)))

(declare-fun res!776618 () Bool)

(assert (=> b!1170252 (=> res!776618 e!665137)))

(assert (=> b!1170252 (= res!776618 (not (= (select (arr!36474 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1170253 () Bool)

(declare-fun e!665129 () Bool)

(declare-fun e!665128 () Bool)

(assert (=> b!1170253 (= e!665129 (not e!665128))))

(declare-fun res!776625 () Bool)

(assert (=> b!1170253 (=> res!776625 e!665128)))

(assert (=> b!1170253 (= res!776625 (bvsgt from!1455 i!673))))

(assert (=> b!1170253 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!527027 () Unit!38606)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75649 (_ BitVec 64) (_ BitVec 32)) Unit!38606)

(assert (=> b!1170253 (= lt!527027 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1170254 () Bool)

(assert (=> b!1170254 (= e!665137 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1170255 () Bool)

(declare-fun tp_is_empty!29415 () Bool)

(assert (=> b!1170255 (= e!665136 tp_is_empty!29415)))

(declare-fun b!1170256 () Bool)

(declare-fun res!776619 () Bool)

(assert (=> b!1170256 (=> (not res!776619) (not e!665133))))

(declare-datatypes ((List!25591 0))(
  ( (Nil!25588) (Cons!25587 (h!26796 (_ BitVec 64)) (t!37468 List!25591)) )
))
(declare-fun arrayNoDuplicates!0 (array!75649 (_ BitVec 32) List!25591) Bool)

(assert (=> b!1170256 (= res!776619 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25588))))

(declare-fun b!1170257 () Bool)

(declare-fun res!776623 () Bool)

(assert (=> b!1170257 (=> (not res!776623) (not e!665133))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1170257 (= res!776623 (validMask!0 mask!1564))))

(declare-fun b!1170258 () Bool)

(declare-fun res!776632 () Bool)

(assert (=> b!1170258 (=> (not res!776632) (not e!665133))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75649 (_ BitVec 32)) Bool)

(assert (=> b!1170258 (= res!776632 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1170259 () Bool)

(assert (=> b!1170259 (= e!665133 e!665129)))

(declare-fun res!776630 () Bool)

(assert (=> b!1170259 (=> (not res!776630) (not e!665129))))

(assert (=> b!1170259 (= res!776630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!527037 mask!1564))))

(assert (=> b!1170259 (= lt!527037 (array!75650 (store (arr!36474 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37010 _keys!1208)))))

(declare-fun b!1170260 () Bool)

(declare-fun res!776617 () Bool)

(assert (=> b!1170260 (=> (not res!776617) (not e!665129))))

(assert (=> b!1170260 (= res!776617 (arrayNoDuplicates!0 lt!527037 #b00000000000000000000000000000000 Nil!25588))))

(declare-fun b!1170261 () Bool)

(declare-fun res!776627 () Bool)

(assert (=> b!1170261 (=> (not res!776627) (not e!665133))))

(assert (=> b!1170261 (= res!776627 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37010 _keys!1208))))))

(declare-fun b!1170262 () Bool)

(declare-fun res!776631 () Bool)

(assert (=> b!1170262 (=> (not res!776631) (not e!665133))))

(assert (=> b!1170262 (= res!776631 (and (= (size!37011 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37010 _keys!1208) (size!37011 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1170263 () Bool)

(assert (=> b!1170263 (= e!665130 e!665127)))

(declare-fun res!776628 () Bool)

(assert (=> b!1170263 (=> res!776628 e!665127)))

(assert (=> b!1170263 (= res!776628 (not (= (select (arr!36474 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1170263 e!665132))

(declare-fun res!776620 () Bool)

(assert (=> b!1170263 (=> (not res!776620) (not e!665132))))

(declare-fun lt!527028 () ListLongMap!16823)

(declare-fun lt!527029 () V!44347)

(declare-fun +!3756 (ListLongMap!16823 tuple2!18854) ListLongMap!16823)

(declare-fun get!18598 (ValueCell!13998 V!44347) V!44347)

(assert (=> b!1170263 (= res!776620 (= lt!527028 (+!3756 lt!527033 (tuple2!18855 (select (arr!36474 _keys!1208) from!1455) (get!18598 (select (arr!36475 _values!996) from!1455) lt!527029)))))))

(declare-fun b!1170264 () Bool)

(assert (=> b!1170264 (= e!665128 e!665134)))

(declare-fun res!776624 () Bool)

(assert (=> b!1170264 (=> res!776624 e!665134)))

(assert (=> b!1170264 (= res!776624 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1170264 (= lt!527028 (getCurrentListMapNoExtraKeys!4891 lt!527037 lt!527030 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1170264 (= lt!527030 (array!75652 (store (arr!36475 _values!996) i!673 (ValueCellFull!13998 lt!527029)) (size!37011 _values!996)))))

(declare-fun dynLambda!2868 (Int (_ BitVec 64)) V!44347)

(assert (=> b!1170264 (= lt!527029 (dynLambda!2868 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!527032 () ListLongMap!16823)

(assert (=> b!1170264 (= lt!527032 (getCurrentListMapNoExtraKeys!4891 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1170265 () Bool)

(declare-fun e!665135 () Bool)

(declare-fun e!665131 () Bool)

(assert (=> b!1170265 (= e!665135 (and e!665131 mapRes!45950))))

(declare-fun condMapEmpty!45950 () Bool)

(declare-fun mapDefault!45950 () ValueCell!13998)

(assert (=> b!1170265 (= condMapEmpty!45950 (= (arr!36475 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13998)) mapDefault!45950)))))

(declare-fun res!776622 () Bool)

(assert (=> start!99306 (=> (not res!776622) (not e!665133))))

(assert (=> start!99306 (= res!776622 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37010 _keys!1208))))))

(assert (=> start!99306 e!665133))

(assert (=> start!99306 tp_is_empty!29415))

(declare-fun array_inv!27878 (array!75649) Bool)

(assert (=> start!99306 (array_inv!27878 _keys!1208)))

(assert (=> start!99306 true))

(assert (=> start!99306 tp!87368))

(declare-fun array_inv!27879 (array!75651) Bool)

(assert (=> start!99306 (and (array_inv!27879 _values!996) e!665135)))

(declare-fun b!1170266 () Bool)

(assert (=> b!1170266 (= e!665131 tp_is_empty!29415)))

(declare-fun mapIsEmpty!45950 () Bool)

(assert (=> mapIsEmpty!45950 mapRes!45950))

(assert (= (and start!99306 res!776622) b!1170257))

(assert (= (and b!1170257 res!776623) b!1170262))

(assert (= (and b!1170262 res!776631) b!1170258))

(assert (= (and b!1170258 res!776632) b!1170256))

(assert (= (and b!1170256 res!776619) b!1170261))

(assert (= (and b!1170261 res!776627) b!1170248))

(assert (= (and b!1170248 res!776629) b!1170250))

(assert (= (and b!1170250 res!776621) b!1170259))

(assert (= (and b!1170259 res!776630) b!1170260))

(assert (= (and b!1170260 res!776617) b!1170253))

(assert (= (and b!1170253 (not res!776625)) b!1170264))

(assert (= (and b!1170264 (not res!776624)) b!1170251))

(assert (= (and b!1170251 (not res!776626)) b!1170263))

(assert (= (and b!1170263 res!776620) b!1170252))

(assert (= (and b!1170252 (not res!776618)) b!1170254))

(assert (= (and b!1170263 (not res!776628)) b!1170249))

(assert (= (and b!1170265 condMapEmpty!45950) mapIsEmpty!45950))

(assert (= (and b!1170265 (not condMapEmpty!45950)) mapNonEmpty!45950))

(get-info :version)

(assert (= (and mapNonEmpty!45950 ((_ is ValueCellFull!13998) mapValue!45950)) b!1170255))

(assert (= (and b!1170265 ((_ is ValueCellFull!13998) mapDefault!45950)) b!1170266))

(assert (= start!99306 b!1170265))

(declare-fun b_lambda!20029 () Bool)

(assert (=> (not b_lambda!20029) (not b!1170264)))

(declare-fun t!37466 () Bool)

(declare-fun tb!9697 () Bool)

(assert (=> (and start!99306 (= defaultEntry!1004 defaultEntry!1004) t!37466) tb!9697))

(declare-fun result!19961 () Bool)

(assert (=> tb!9697 (= result!19961 tp_is_empty!29415)))

(assert (=> b!1170264 t!37466))

(declare-fun b_and!40639 () Bool)

(assert (= b_and!40637 (and (=> t!37466 result!19961) b_and!40639)))

(declare-fun m!1078081 () Bool)

(assert (=> b!1170250 m!1078081))

(declare-fun m!1078083 () Bool)

(assert (=> mapNonEmpty!45950 m!1078083))

(declare-fun m!1078085 () Bool)

(assert (=> b!1170264 m!1078085))

(declare-fun m!1078087 () Bool)

(assert (=> b!1170264 m!1078087))

(declare-fun m!1078089 () Bool)

(assert (=> b!1170264 m!1078089))

(declare-fun m!1078091 () Bool)

(assert (=> b!1170264 m!1078091))

(declare-fun m!1078093 () Bool)

(assert (=> b!1170253 m!1078093))

(declare-fun m!1078095 () Bool)

(assert (=> b!1170253 m!1078095))

(declare-fun m!1078097 () Bool)

(assert (=> b!1170256 m!1078097))

(declare-fun m!1078099 () Bool)

(assert (=> b!1170260 m!1078099))

(declare-fun m!1078101 () Bool)

(assert (=> b!1170252 m!1078101))

(declare-fun m!1078103 () Bool)

(assert (=> b!1170251 m!1078103))

(declare-fun m!1078105 () Bool)

(assert (=> b!1170251 m!1078105))

(assert (=> b!1170251 m!1078101))

(declare-fun m!1078107 () Bool)

(assert (=> b!1170251 m!1078107))

(assert (=> b!1170251 m!1078101))

(declare-fun m!1078109 () Bool)

(assert (=> b!1170251 m!1078109))

(declare-fun m!1078111 () Bool)

(assert (=> b!1170251 m!1078111))

(declare-fun m!1078113 () Bool)

(assert (=> b!1170248 m!1078113))

(assert (=> b!1170263 m!1078101))

(declare-fun m!1078115 () Bool)

(assert (=> b!1170263 m!1078115))

(assert (=> b!1170263 m!1078115))

(declare-fun m!1078117 () Bool)

(assert (=> b!1170263 m!1078117))

(declare-fun m!1078119 () Bool)

(assert (=> b!1170263 m!1078119))

(declare-fun m!1078121 () Bool)

(assert (=> b!1170258 m!1078121))

(declare-fun m!1078123 () Bool)

(assert (=> b!1170249 m!1078123))

(declare-fun m!1078125 () Bool)

(assert (=> b!1170249 m!1078125))

(declare-fun m!1078127 () Bool)

(assert (=> b!1170257 m!1078127))

(declare-fun m!1078129 () Bool)

(assert (=> start!99306 m!1078129))

(declare-fun m!1078131 () Bool)

(assert (=> start!99306 m!1078131))

(declare-fun m!1078133 () Bool)

(assert (=> b!1170254 m!1078133))

(declare-fun m!1078135 () Bool)

(assert (=> b!1170259 m!1078135))

(declare-fun m!1078137 () Bool)

(assert (=> b!1170259 m!1078137))

(check-sat (not b!1170249) (not b!1170254) (not start!99306) (not b!1170260) (not b!1170263) (not b!1170264) (not b!1170256) (not b!1170257) tp_is_empty!29415 (not b_next!24885) (not b!1170251) (not b_lambda!20029) b_and!40639 (not b!1170253) (not b!1170258) (not b!1170259) (not b!1170248) (not mapNonEmpty!45950))
(check-sat b_and!40639 (not b_next!24885))
