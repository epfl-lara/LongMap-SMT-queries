; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99564 () Bool)

(assert start!99564)

(declare-fun b_free!24907 () Bool)

(declare-fun b_next!24907 () Bool)

(assert (=> start!99564 (= b_free!24907 (not b_next!24907))))

(declare-fun tp!87434 () Bool)

(declare-fun b_and!40683 () Bool)

(assert (=> start!99564 (= tp!87434 b_and!40683)))

(declare-fun b!1172192 () Bool)

(declare-fun e!666361 () Bool)

(declare-fun e!666357 () Bool)

(assert (=> b!1172192 (= e!666361 e!666357)))

(declare-fun res!777674 () Bool)

(assert (=> b!1172192 (=> res!777674 e!666357)))

(declare-datatypes ((array!75743 0))(
  ( (array!75744 (arr!36515 (Array (_ BitVec 32) (_ BitVec 64))) (size!37052 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75743)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1172192 (= res!777674 (not (= (select (arr!36515 _keys!1208) from!1455) k0!934)))))

(declare-fun mapIsEmpty!45983 () Bool)

(declare-fun mapRes!45983 () Bool)

(assert (=> mapIsEmpty!45983 mapRes!45983))

(declare-fun b!1172193 () Bool)

(declare-fun res!777672 () Bool)

(declare-fun e!666367 () Bool)

(assert (=> b!1172193 (=> (not res!777672) (not e!666367))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1172193 (= res!777672 (= (select (arr!36515 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!45983 () Bool)

(declare-fun tp!87435 () Bool)

(declare-fun e!666363 () Bool)

(assert (=> mapNonEmpty!45983 (= mapRes!45983 (and tp!87435 e!666363))))

(declare-fun mapKey!45983 () (_ BitVec 32))

(declare-datatypes ((V!44377 0))(
  ( (V!44378 (val!14775 Int)) )
))
(declare-datatypes ((ValueCell!14009 0))(
  ( (ValueCellFull!14009 (v!17409 V!44377)) (EmptyCell!14009) )
))
(declare-fun mapRest!45983 () (Array (_ BitVec 32) ValueCell!14009))

(declare-fun mapValue!45983 () ValueCell!14009)

(declare-datatypes ((array!75745 0))(
  ( (array!75746 (arr!36516 (Array (_ BitVec 32) ValueCell!14009)) (size!37053 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75745)

(assert (=> mapNonEmpty!45983 (= (arr!36516 _values!996) (store mapRest!45983 mapKey!45983 mapValue!45983))))

(declare-fun b!1172194 () Bool)

(declare-fun e!666366 () Bool)

(declare-fun e!666356 () Bool)

(assert (=> b!1172194 (= e!666366 e!666356)))

(declare-fun res!777675 () Bool)

(assert (=> b!1172194 (=> res!777675 e!666356)))

(assert (=> b!1172194 (= res!777675 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44377)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!527882 () array!75745)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18900 0))(
  ( (tuple2!18901 (_1!9461 (_ BitVec 64)) (_2!9461 V!44377)) )
))
(declare-datatypes ((List!25635 0))(
  ( (Nil!25632) (Cons!25631 (h!26849 tuple2!18900) (t!37526 List!25635)) )
))
(declare-datatypes ((ListLongMap!16877 0))(
  ( (ListLongMap!16878 (toList!8454 List!25635)) )
))
(declare-fun lt!527888 () ListLongMap!16877)

(declare-fun minValue!944 () V!44377)

(declare-fun lt!527890 () array!75743)

(declare-fun getCurrentListMapNoExtraKeys!4941 (array!75743 array!75745 (_ BitVec 32) (_ BitVec 32) V!44377 V!44377 (_ BitVec 32) Int) ListLongMap!16877)

(assert (=> b!1172194 (= lt!527888 (getCurrentListMapNoExtraKeys!4941 lt!527890 lt!527882 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!527884 () V!44377)

(assert (=> b!1172194 (= lt!527882 (array!75746 (store (arr!36516 _values!996) i!673 (ValueCellFull!14009 lt!527884)) (size!37053 _values!996)))))

(declare-fun dynLambda!2922 (Int (_ BitVec 64)) V!44377)

(assert (=> b!1172194 (= lt!527884 (dynLambda!2922 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!527886 () ListLongMap!16877)

(assert (=> b!1172194 (= lt!527886 (getCurrentListMapNoExtraKeys!4941 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1172195 () Bool)

(declare-fun res!777660 () Bool)

(assert (=> b!1172195 (=> (not res!777660) (not e!666367))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1172195 (= res!777660 (validMask!0 mask!1564))))

(declare-fun res!777665 () Bool)

(assert (=> start!99564 (=> (not res!777665) (not e!666367))))

(assert (=> start!99564 (= res!777665 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37052 _keys!1208))))))

(assert (=> start!99564 e!666367))

(declare-fun tp_is_empty!29437 () Bool)

(assert (=> start!99564 tp_is_empty!29437))

(declare-fun array_inv!27980 (array!75743) Bool)

(assert (=> start!99564 (array_inv!27980 _keys!1208)))

(assert (=> start!99564 true))

(assert (=> start!99564 tp!87434))

(declare-fun e!666362 () Bool)

(declare-fun array_inv!27981 (array!75745) Bool)

(assert (=> start!99564 (and (array_inv!27981 _values!996) e!666362)))

(declare-fun b!1172196 () Bool)

(declare-fun e!666368 () Bool)

(assert (=> b!1172196 (= e!666367 e!666368)))

(declare-fun res!777664 () Bool)

(assert (=> b!1172196 (=> (not res!777664) (not e!666368))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75743 (_ BitVec 32)) Bool)

(assert (=> b!1172196 (= res!777664 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!527890 mask!1564))))

(assert (=> b!1172196 (= lt!527890 (array!75744 (store (arr!36515 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37052 _keys!1208)))))

(declare-fun b!1172197 () Bool)

(declare-fun e!666359 () Bool)

(declare-fun e!666364 () Bool)

(assert (=> b!1172197 (= e!666359 e!666364)))

(declare-fun res!777670 () Bool)

(assert (=> b!1172197 (=> res!777670 e!666364)))

(assert (=> b!1172197 (= res!777670 (or (bvsge (size!37052 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!37052 _keys!1208)) (bvsge from!1455 (size!37052 _keys!1208))))))

(declare-datatypes ((List!25636 0))(
  ( (Nil!25633) (Cons!25632 (h!26850 (_ BitVec 64)) (t!37527 List!25636)) )
))
(declare-fun arrayNoDuplicates!0 (array!75743 (_ BitVec 32) List!25636) Bool)

(assert (=> b!1172197 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25633)))

(declare-datatypes ((Unit!38597 0))(
  ( (Unit!38598) )
))
(declare-fun lt!527881 () Unit!38597)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75743 (_ BitVec 32) (_ BitVec 32)) Unit!38597)

(assert (=> b!1172197 (= lt!527881 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun arrayContainsKey!0 (array!75743 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1172197 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!527885 () Unit!38597)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75743 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38597)

(assert (=> b!1172197 (= lt!527885 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1172198 () Bool)

(declare-fun res!777676 () Bool)

(assert (=> b!1172198 (=> (not res!777676) (not e!666367))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1172198 (= res!777676 (validKeyInArray!0 k0!934))))

(declare-fun b!1172199 () Bool)

(declare-fun e!666365 () Bool)

(assert (=> b!1172199 (= e!666365 e!666359)))

(declare-fun res!777669 () Bool)

(assert (=> b!1172199 (=> res!777669 e!666359)))

(assert (=> b!1172199 (= res!777669 (not (= (select (arr!36515 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1172199 e!666361))

(declare-fun res!777662 () Bool)

(assert (=> b!1172199 (=> (not res!777662) (not e!666361))))

(declare-fun lt!527880 () ListLongMap!16877)

(declare-fun +!3793 (ListLongMap!16877 tuple2!18900) ListLongMap!16877)

(declare-fun get!18647 (ValueCell!14009 V!44377) V!44377)

(assert (=> b!1172199 (= res!777662 (= lt!527888 (+!3793 lt!527880 (tuple2!18901 (select (arr!36515 _keys!1208) from!1455) (get!18647 (select (arr!36516 _values!996) from!1455) lt!527884)))))))

(declare-fun b!1172200 () Bool)

(declare-fun res!777666 () Bool)

(assert (=> b!1172200 (=> (not res!777666) (not e!666367))))

(assert (=> b!1172200 (= res!777666 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25633))))

(declare-fun b!1172201 () Bool)

(assert (=> b!1172201 (= e!666363 tp_is_empty!29437)))

(declare-fun b!1172202 () Bool)

(assert (=> b!1172202 (= e!666357 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1172203 () Bool)

(declare-fun res!777668 () Bool)

(assert (=> b!1172203 (=> res!777668 e!666364)))

(declare-fun contains!6871 (List!25636 (_ BitVec 64)) Bool)

(assert (=> b!1172203 (= res!777668 (contains!6871 Nil!25633 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1172204 () Bool)

(declare-fun e!666360 () Bool)

(assert (=> b!1172204 (= e!666362 (and e!666360 mapRes!45983))))

(declare-fun condMapEmpty!45983 () Bool)

(declare-fun mapDefault!45983 () ValueCell!14009)

(assert (=> b!1172204 (= condMapEmpty!45983 (= (arr!36516 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14009)) mapDefault!45983)))))

(declare-fun b!1172205 () Bool)

(assert (=> b!1172205 (= e!666356 e!666365)))

(declare-fun res!777661 () Bool)

(assert (=> b!1172205 (=> res!777661 e!666365)))

(assert (=> b!1172205 (= res!777661 (not (validKeyInArray!0 (select (arr!36515 _keys!1208) from!1455))))))

(declare-fun lt!527879 () ListLongMap!16877)

(assert (=> b!1172205 (= lt!527879 lt!527880)))

(declare-fun lt!527883 () ListLongMap!16877)

(declare-fun -!1509 (ListLongMap!16877 (_ BitVec 64)) ListLongMap!16877)

(assert (=> b!1172205 (= lt!527880 (-!1509 lt!527883 k0!934))))

(assert (=> b!1172205 (= lt!527879 (getCurrentListMapNoExtraKeys!4941 lt!527890 lt!527882 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1172205 (= lt!527883 (getCurrentListMapNoExtraKeys!4941 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!527878 () Unit!38597)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!734 (array!75743 array!75745 (_ BitVec 32) (_ BitVec 32) V!44377 V!44377 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38597)

(assert (=> b!1172205 (= lt!527878 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!734 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1172206 () Bool)

(assert (=> b!1172206 (= e!666360 tp_is_empty!29437)))

(declare-fun b!1172207 () Bool)

(declare-fun res!777671 () Bool)

(assert (=> b!1172207 (=> res!777671 e!666364)))

(declare-fun noDuplicate!1621 (List!25636) Bool)

(assert (=> b!1172207 (= res!777671 (not (noDuplicate!1621 Nil!25633)))))

(declare-fun b!1172208 () Bool)

(assert (=> b!1172208 (= e!666368 (not e!666366))))

(declare-fun res!777663 () Bool)

(assert (=> b!1172208 (=> res!777663 e!666366)))

(assert (=> b!1172208 (= res!777663 (bvsgt from!1455 i!673))))

(assert (=> b!1172208 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!527889 () Unit!38597)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75743 (_ BitVec 64) (_ BitVec 32)) Unit!38597)

(assert (=> b!1172208 (= lt!527889 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1172209 () Bool)

(declare-fun res!777677 () Bool)

(assert (=> b!1172209 (=> (not res!777677) (not e!666367))))

(assert (=> b!1172209 (= res!777677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1172210 () Bool)

(declare-fun res!777673 () Bool)

(assert (=> b!1172210 (=> (not res!777673) (not e!666367))))

(assert (=> b!1172210 (= res!777673 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37052 _keys!1208))))))

(declare-fun b!1172211 () Bool)

(declare-fun res!777667 () Bool)

(assert (=> b!1172211 (=> (not res!777667) (not e!666367))))

(assert (=> b!1172211 (= res!777667 (and (= (size!37053 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37052 _keys!1208) (size!37053 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1172212 () Bool)

(assert (=> b!1172212 (= e!666364 true)))

(declare-fun lt!527887 () Bool)

(assert (=> b!1172212 (= lt!527887 (contains!6871 Nil!25633 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1172213 () Bool)

(declare-fun res!777659 () Bool)

(assert (=> b!1172213 (=> (not res!777659) (not e!666368))))

(assert (=> b!1172213 (= res!777659 (arrayNoDuplicates!0 lt!527890 #b00000000000000000000000000000000 Nil!25633))))

(assert (= (and start!99564 res!777665) b!1172195))

(assert (= (and b!1172195 res!777660) b!1172211))

(assert (= (and b!1172211 res!777667) b!1172209))

(assert (= (and b!1172209 res!777677) b!1172200))

(assert (= (and b!1172200 res!777666) b!1172210))

(assert (= (and b!1172210 res!777673) b!1172198))

(assert (= (and b!1172198 res!777676) b!1172193))

(assert (= (and b!1172193 res!777672) b!1172196))

(assert (= (and b!1172196 res!777664) b!1172213))

(assert (= (and b!1172213 res!777659) b!1172208))

(assert (= (and b!1172208 (not res!777663)) b!1172194))

(assert (= (and b!1172194 (not res!777675)) b!1172205))

(assert (= (and b!1172205 (not res!777661)) b!1172199))

(assert (= (and b!1172199 res!777662) b!1172192))

(assert (= (and b!1172192 (not res!777674)) b!1172202))

(assert (= (and b!1172199 (not res!777669)) b!1172197))

(assert (= (and b!1172197 (not res!777670)) b!1172207))

(assert (= (and b!1172207 (not res!777671)) b!1172203))

(assert (= (and b!1172203 (not res!777668)) b!1172212))

(assert (= (and b!1172204 condMapEmpty!45983) mapIsEmpty!45983))

(assert (= (and b!1172204 (not condMapEmpty!45983)) mapNonEmpty!45983))

(get-info :version)

(assert (= (and mapNonEmpty!45983 ((_ is ValueCellFull!14009) mapValue!45983)) b!1172201))

(assert (= (and b!1172204 ((_ is ValueCellFull!14009) mapDefault!45983)) b!1172206))

(assert (= start!99564 b!1172204))

(declare-fun b_lambda!20045 () Bool)

(assert (=> (not b_lambda!20045) (not b!1172194)))

(declare-fun t!37525 () Bool)

(declare-fun tb!9711 () Bool)

(assert (=> (and start!99564 (= defaultEntry!1004 defaultEntry!1004) t!37525) tb!9711))

(declare-fun result!19997 () Bool)

(assert (=> tb!9711 (= result!19997 tp_is_empty!29437)))

(assert (=> b!1172194 t!37525))

(declare-fun b_and!40685 () Bool)

(assert (= b_and!40683 (and (=> t!37525 result!19997) b_and!40685)))

(declare-fun m!1080291 () Bool)

(assert (=> b!1172208 m!1080291))

(declare-fun m!1080293 () Bool)

(assert (=> b!1172208 m!1080293))

(declare-fun m!1080295 () Bool)

(assert (=> b!1172199 m!1080295))

(declare-fun m!1080297 () Bool)

(assert (=> b!1172199 m!1080297))

(assert (=> b!1172199 m!1080297))

(declare-fun m!1080299 () Bool)

(assert (=> b!1172199 m!1080299))

(declare-fun m!1080301 () Bool)

(assert (=> b!1172199 m!1080301))

(declare-fun m!1080303 () Bool)

(assert (=> b!1172203 m!1080303))

(declare-fun m!1080305 () Bool)

(assert (=> b!1172200 m!1080305))

(declare-fun m!1080307 () Bool)

(assert (=> b!1172196 m!1080307))

(declare-fun m!1080309 () Bool)

(assert (=> b!1172196 m!1080309))

(declare-fun m!1080311 () Bool)

(assert (=> b!1172209 m!1080311))

(declare-fun m!1080313 () Bool)

(assert (=> b!1172193 m!1080313))

(declare-fun m!1080315 () Bool)

(assert (=> b!1172194 m!1080315))

(declare-fun m!1080317 () Bool)

(assert (=> b!1172194 m!1080317))

(declare-fun m!1080319 () Bool)

(assert (=> b!1172194 m!1080319))

(declare-fun m!1080321 () Bool)

(assert (=> b!1172194 m!1080321))

(declare-fun m!1080323 () Bool)

(assert (=> b!1172205 m!1080323))

(declare-fun m!1080325 () Bool)

(assert (=> b!1172205 m!1080325))

(declare-fun m!1080327 () Bool)

(assert (=> b!1172205 m!1080327))

(declare-fun m!1080329 () Bool)

(assert (=> b!1172205 m!1080329))

(assert (=> b!1172205 m!1080295))

(declare-fun m!1080331 () Bool)

(assert (=> b!1172205 m!1080331))

(assert (=> b!1172205 m!1080295))

(declare-fun m!1080333 () Bool)

(assert (=> b!1172212 m!1080333))

(declare-fun m!1080335 () Bool)

(assert (=> start!99564 m!1080335))

(declare-fun m!1080337 () Bool)

(assert (=> start!99564 m!1080337))

(declare-fun m!1080339 () Bool)

(assert (=> b!1172213 m!1080339))

(declare-fun m!1080341 () Bool)

(assert (=> b!1172197 m!1080341))

(declare-fun m!1080343 () Bool)

(assert (=> b!1172197 m!1080343))

(declare-fun m!1080345 () Bool)

(assert (=> b!1172197 m!1080345))

(declare-fun m!1080347 () Bool)

(assert (=> b!1172197 m!1080347))

(declare-fun m!1080349 () Bool)

(assert (=> b!1172195 m!1080349))

(declare-fun m!1080351 () Bool)

(assert (=> mapNonEmpty!45983 m!1080351))

(declare-fun m!1080353 () Bool)

(assert (=> b!1172207 m!1080353))

(assert (=> b!1172192 m!1080295))

(declare-fun m!1080355 () Bool)

(assert (=> b!1172202 m!1080355))

(declare-fun m!1080357 () Bool)

(assert (=> b!1172198 m!1080357))

(check-sat (not b!1172194) (not b!1172196) (not start!99564) (not b!1172209) (not b!1172195) tp_is_empty!29437 b_and!40685 (not b_lambda!20045) (not b!1172213) (not b!1172197) (not b!1172200) (not b!1172202) (not b!1172205) (not b!1172212) (not b!1172203) (not b!1172208) (not b!1172198) (not b!1172199) (not b_next!24907) (not mapNonEmpty!45983) (not b!1172207))
(check-sat b_and!40685 (not b_next!24907))
