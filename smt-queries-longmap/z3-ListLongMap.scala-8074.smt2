; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99546 () Bool)

(assert start!99546)

(declare-fun b_free!24889 () Bool)

(declare-fun b_next!24889 () Bool)

(assert (=> start!99546 (= b_free!24889 (not b_next!24889))))

(declare-fun tp!87380 () Bool)

(declare-fun b_and!40647 () Bool)

(assert (=> start!99546 (= tp!87380 b_and!40647)))

(declare-fun res!777226 () Bool)

(declare-fun e!666039 () Bool)

(assert (=> start!99546 (=> (not res!777226) (not e!666039))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!75707 0))(
  ( (array!75708 (arr!36497 (Array (_ BitVec 32) (_ BitVec 64))) (size!37034 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75707)

(assert (=> start!99546 (= res!777226 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37034 _keys!1208))))))

(assert (=> start!99546 e!666039))

(declare-fun tp_is_empty!29419 () Bool)

(assert (=> start!99546 tp_is_empty!29419))

(declare-fun array_inv!27966 (array!75707) Bool)

(assert (=> start!99546 (array_inv!27966 _keys!1208)))

(assert (=> start!99546 true))

(assert (=> start!99546 tp!87380))

(declare-datatypes ((V!44353 0))(
  ( (V!44354 (val!14766 Int)) )
))
(declare-datatypes ((ValueCell!14000 0))(
  ( (ValueCellFull!14000 (v!17400 V!44353)) (EmptyCell!14000) )
))
(declare-datatypes ((array!75709 0))(
  ( (array!75710 (arr!36498 (Array (_ BitVec 32) ValueCell!14000)) (size!37035 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75709)

(declare-fun e!666040 () Bool)

(declare-fun array_inv!27967 (array!75709) Bool)

(assert (=> start!99546 (and (array_inv!27967 _values!996) e!666040)))

(declare-fun mapIsEmpty!45956 () Bool)

(declare-fun mapRes!45956 () Bool)

(assert (=> mapIsEmpty!45956 mapRes!45956))

(declare-fun b!1171655 () Bool)

(declare-fun e!666038 () Bool)

(assert (=> b!1171655 (= e!666038 true)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75707 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1171655 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!38583 0))(
  ( (Unit!38584) )
))
(declare-fun lt!527581 () Unit!38583)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75707 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38583)

(assert (=> b!1171655 (= lt!527581 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1171656 () Bool)

(declare-fun res!777223 () Bool)

(assert (=> b!1171656 (=> (not res!777223) (not e!666039))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1171656 (= res!777223 (and (= (size!37035 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37034 _keys!1208) (size!37035 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1171657 () Bool)

(declare-fun e!666033 () Bool)

(assert (=> b!1171657 (= e!666040 (and e!666033 mapRes!45956))))

(declare-fun condMapEmpty!45956 () Bool)

(declare-fun mapDefault!45956 () ValueCell!14000)

(assert (=> b!1171657 (= condMapEmpty!45956 (= (arr!36498 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14000)) mapDefault!45956)))))

(declare-fun b!1171658 () Bool)

(declare-fun e!666035 () Bool)

(assert (=> b!1171658 (= e!666035 tp_is_empty!29419)))

(declare-fun b!1171659 () Bool)

(assert (=> b!1171659 (= e!666033 tp_is_empty!29419)))

(declare-fun b!1171660 () Bool)

(declare-fun res!777228 () Bool)

(assert (=> b!1171660 (=> (not res!777228) (not e!666039))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1171660 (= res!777228 (validKeyInArray!0 k0!934))))

(declare-fun b!1171661 () Bool)

(declare-fun e!666036 () Bool)

(assert (=> b!1171661 (= e!666036 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1171662 () Bool)

(declare-fun e!666037 () Bool)

(assert (=> b!1171662 (= e!666037 e!666038)))

(declare-fun res!777236 () Bool)

(assert (=> b!1171662 (=> res!777236 e!666038)))

(assert (=> b!1171662 (= res!777236 (not (= (select (arr!36497 _keys!1208) from!1455) k0!934)))))

(declare-fun e!666031 () Bool)

(assert (=> b!1171662 e!666031))

(declare-fun res!777233 () Bool)

(assert (=> b!1171662 (=> (not res!777233) (not e!666031))))

(declare-datatypes ((tuple2!18888 0))(
  ( (tuple2!18889 (_1!9455 (_ BitVec 64)) (_2!9455 V!44353)) )
))
(declare-datatypes ((List!25622 0))(
  ( (Nil!25619) (Cons!25618 (h!26836 tuple2!18888) (t!37495 List!25622)) )
))
(declare-datatypes ((ListLongMap!16865 0))(
  ( (ListLongMap!16866 (toList!8448 List!25622)) )
))
(declare-fun lt!527586 () ListLongMap!16865)

(declare-fun lt!527579 () ListLongMap!16865)

(declare-fun lt!527585 () V!44353)

(declare-fun +!3787 (ListLongMap!16865 tuple2!18888) ListLongMap!16865)

(declare-fun get!18635 (ValueCell!14000 V!44353) V!44353)

(assert (=> b!1171662 (= res!777233 (= lt!527579 (+!3787 lt!527586 (tuple2!18889 (select (arr!36497 _keys!1208) from!1455) (get!18635 (select (arr!36498 _values!996) from!1455) lt!527585)))))))

(declare-fun b!1171663 () Bool)

(assert (=> b!1171663 (= e!666031 e!666036)))

(declare-fun res!777229 () Bool)

(assert (=> b!1171663 (=> res!777229 e!666036)))

(assert (=> b!1171663 (= res!777229 (not (= (select (arr!36497 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1171664 () Bool)

(declare-fun e!666030 () Bool)

(assert (=> b!1171664 (= e!666039 e!666030)))

(declare-fun res!777234 () Bool)

(assert (=> b!1171664 (=> (not res!777234) (not e!666030))))

(declare-fun lt!527583 () array!75707)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75707 (_ BitVec 32)) Bool)

(assert (=> b!1171664 (= res!777234 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!527583 mask!1564))))

(assert (=> b!1171664 (= lt!527583 (array!75708 (store (arr!36497 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37034 _keys!1208)))))

(declare-fun b!1171665 () Bool)

(declare-fun res!777221 () Bool)

(assert (=> b!1171665 (=> (not res!777221) (not e!666039))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1171665 (= res!777221 (validMask!0 mask!1564))))

(declare-fun b!1171666 () Bool)

(declare-fun e!666041 () Bool)

(assert (=> b!1171666 (= e!666030 (not e!666041))))

(declare-fun res!777232 () Bool)

(assert (=> b!1171666 (=> res!777232 e!666041)))

(assert (=> b!1171666 (= res!777232 (bvsgt from!1455 i!673))))

(assert (=> b!1171666 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!527582 () Unit!38583)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75707 (_ BitVec 64) (_ BitVec 32)) Unit!38583)

(assert (=> b!1171666 (= lt!527582 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1171667 () Bool)

(declare-fun e!666032 () Bool)

(assert (=> b!1171667 (= e!666032 e!666037)))

(declare-fun res!777235 () Bool)

(assert (=> b!1171667 (=> res!777235 e!666037)))

(assert (=> b!1171667 (= res!777235 (not (validKeyInArray!0 (select (arr!36497 _keys!1208) from!1455))))))

(declare-fun lt!527578 () ListLongMap!16865)

(assert (=> b!1171667 (= lt!527578 lt!527586)))

(declare-fun lt!527584 () ListLongMap!16865)

(declare-fun -!1503 (ListLongMap!16865 (_ BitVec 64)) ListLongMap!16865)

(assert (=> b!1171667 (= lt!527586 (-!1503 lt!527584 k0!934))))

(declare-fun zeroValue!944 () V!44353)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!527587 () array!75709)

(declare-fun minValue!944 () V!44353)

(declare-fun getCurrentListMapNoExtraKeys!4935 (array!75707 array!75709 (_ BitVec 32) (_ BitVec 32) V!44353 V!44353 (_ BitVec 32) Int) ListLongMap!16865)

(assert (=> b!1171667 (= lt!527578 (getCurrentListMapNoExtraKeys!4935 lt!527583 lt!527587 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1171667 (= lt!527584 (getCurrentListMapNoExtraKeys!4935 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!527577 () Unit!38583)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!728 (array!75707 array!75709 (_ BitVec 32) (_ BitVec 32) V!44353 V!44353 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38583)

(assert (=> b!1171667 (= lt!527577 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!728 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1171668 () Bool)

(declare-fun res!777225 () Bool)

(assert (=> b!1171668 (=> (not res!777225) (not e!666039))))

(assert (=> b!1171668 (= res!777225 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37034 _keys!1208))))))

(declare-fun b!1171669 () Bool)

(declare-fun res!777231 () Bool)

(assert (=> b!1171669 (=> (not res!777231) (not e!666039))))

(assert (=> b!1171669 (= res!777231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1171670 () Bool)

(assert (=> b!1171670 (= e!666041 e!666032)))

(declare-fun res!777224 () Bool)

(assert (=> b!1171670 (=> res!777224 e!666032)))

(assert (=> b!1171670 (= res!777224 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1171670 (= lt!527579 (getCurrentListMapNoExtraKeys!4935 lt!527583 lt!527587 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1171670 (= lt!527587 (array!75710 (store (arr!36498 _values!996) i!673 (ValueCellFull!14000 lt!527585)) (size!37035 _values!996)))))

(declare-fun dynLambda!2916 (Int (_ BitVec 64)) V!44353)

(assert (=> b!1171670 (= lt!527585 (dynLambda!2916 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!527580 () ListLongMap!16865)

(assert (=> b!1171670 (= lt!527580 (getCurrentListMapNoExtraKeys!4935 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1171671 () Bool)

(declare-fun res!777227 () Bool)

(assert (=> b!1171671 (=> (not res!777227) (not e!666039))))

(assert (=> b!1171671 (= res!777227 (= (select (arr!36497 _keys!1208) i!673) k0!934))))

(declare-fun b!1171672 () Bool)

(declare-fun res!777230 () Bool)

(assert (=> b!1171672 (=> (not res!777230) (not e!666039))))

(declare-datatypes ((List!25623 0))(
  ( (Nil!25620) (Cons!25619 (h!26837 (_ BitVec 64)) (t!37496 List!25623)) )
))
(declare-fun arrayNoDuplicates!0 (array!75707 (_ BitVec 32) List!25623) Bool)

(assert (=> b!1171672 (= res!777230 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25620))))

(declare-fun b!1171673 () Bool)

(declare-fun res!777222 () Bool)

(assert (=> b!1171673 (=> (not res!777222) (not e!666030))))

(assert (=> b!1171673 (= res!777222 (arrayNoDuplicates!0 lt!527583 #b00000000000000000000000000000000 Nil!25620))))

(declare-fun mapNonEmpty!45956 () Bool)

(declare-fun tp!87381 () Bool)

(assert (=> mapNonEmpty!45956 (= mapRes!45956 (and tp!87381 e!666035))))

(declare-fun mapRest!45956 () (Array (_ BitVec 32) ValueCell!14000))

(declare-fun mapValue!45956 () ValueCell!14000)

(declare-fun mapKey!45956 () (_ BitVec 32))

(assert (=> mapNonEmpty!45956 (= (arr!36498 _values!996) (store mapRest!45956 mapKey!45956 mapValue!45956))))

(assert (= (and start!99546 res!777226) b!1171665))

(assert (= (and b!1171665 res!777221) b!1171656))

(assert (= (and b!1171656 res!777223) b!1171669))

(assert (= (and b!1171669 res!777231) b!1171672))

(assert (= (and b!1171672 res!777230) b!1171668))

(assert (= (and b!1171668 res!777225) b!1171660))

(assert (= (and b!1171660 res!777228) b!1171671))

(assert (= (and b!1171671 res!777227) b!1171664))

(assert (= (and b!1171664 res!777234) b!1171673))

(assert (= (and b!1171673 res!777222) b!1171666))

(assert (= (and b!1171666 (not res!777232)) b!1171670))

(assert (= (and b!1171670 (not res!777224)) b!1171667))

(assert (= (and b!1171667 (not res!777235)) b!1171662))

(assert (= (and b!1171662 res!777233) b!1171663))

(assert (= (and b!1171663 (not res!777229)) b!1171661))

(assert (= (and b!1171662 (not res!777236)) b!1171655))

(assert (= (and b!1171657 condMapEmpty!45956) mapIsEmpty!45956))

(assert (= (and b!1171657 (not condMapEmpty!45956)) mapNonEmpty!45956))

(get-info :version)

(assert (= (and mapNonEmpty!45956 ((_ is ValueCellFull!14000) mapValue!45956)) b!1171658))

(assert (= (and b!1171657 ((_ is ValueCellFull!14000) mapDefault!45956)) b!1171659))

(assert (= start!99546 b!1171657))

(declare-fun b_lambda!20027 () Bool)

(assert (=> (not b_lambda!20027) (not b!1171670)))

(declare-fun t!37494 () Bool)

(declare-fun tb!9693 () Bool)

(assert (=> (and start!99546 (= defaultEntry!1004 defaultEntry!1004) t!37494) tb!9693))

(declare-fun result!19961 () Bool)

(assert (=> tb!9693 (= result!19961 tp_is_empty!29419)))

(assert (=> b!1171670 t!37494))

(declare-fun b_and!40649 () Bool)

(assert (= b_and!40647 (and (=> t!37494 result!19961) b_and!40649)))

(declare-fun m!1079769 () Bool)

(assert (=> b!1171655 m!1079769))

(declare-fun m!1079771 () Bool)

(assert (=> b!1171655 m!1079771))

(declare-fun m!1079773 () Bool)

(assert (=> b!1171666 m!1079773))

(declare-fun m!1079775 () Bool)

(assert (=> b!1171666 m!1079775))

(declare-fun m!1079777 () Bool)

(assert (=> b!1171663 m!1079777))

(declare-fun m!1079779 () Bool)

(assert (=> mapNonEmpty!45956 m!1079779))

(assert (=> b!1171662 m!1079777))

(declare-fun m!1079781 () Bool)

(assert (=> b!1171662 m!1079781))

(assert (=> b!1171662 m!1079781))

(declare-fun m!1079783 () Bool)

(assert (=> b!1171662 m!1079783))

(declare-fun m!1079785 () Bool)

(assert (=> b!1171662 m!1079785))

(declare-fun m!1079787 () Bool)

(assert (=> b!1171670 m!1079787))

(declare-fun m!1079789 () Bool)

(assert (=> b!1171670 m!1079789))

(declare-fun m!1079791 () Bool)

(assert (=> b!1171670 m!1079791))

(declare-fun m!1079793 () Bool)

(assert (=> b!1171670 m!1079793))

(declare-fun m!1079795 () Bool)

(assert (=> b!1171660 m!1079795))

(declare-fun m!1079797 () Bool)

(assert (=> b!1171669 m!1079797))

(declare-fun m!1079799 () Bool)

(assert (=> b!1171671 m!1079799))

(declare-fun m!1079801 () Bool)

(assert (=> b!1171664 m!1079801))

(declare-fun m!1079803 () Bool)

(assert (=> b!1171664 m!1079803))

(declare-fun m!1079805 () Bool)

(assert (=> b!1171673 m!1079805))

(declare-fun m!1079807 () Bool)

(assert (=> b!1171672 m!1079807))

(declare-fun m!1079809 () Bool)

(assert (=> b!1171661 m!1079809))

(declare-fun m!1079811 () Bool)

(assert (=> start!99546 m!1079811))

(declare-fun m!1079813 () Bool)

(assert (=> start!99546 m!1079813))

(declare-fun m!1079815 () Bool)

(assert (=> b!1171665 m!1079815))

(declare-fun m!1079817 () Bool)

(assert (=> b!1171667 m!1079817))

(assert (=> b!1171667 m!1079777))

(declare-fun m!1079819 () Bool)

(assert (=> b!1171667 m!1079819))

(declare-fun m!1079821 () Bool)

(assert (=> b!1171667 m!1079821))

(assert (=> b!1171667 m!1079777))

(declare-fun m!1079823 () Bool)

(assert (=> b!1171667 m!1079823))

(declare-fun m!1079825 () Bool)

(assert (=> b!1171667 m!1079825))

(check-sat tp_is_empty!29419 (not b!1171670) (not b!1171655) (not b!1171673) (not b!1171661) b_and!40649 (not b!1171669) (not b!1171662) (not b!1171660) (not b!1171666) (not b!1171667) (not b!1171664) (not b_lambda!20027) (not b_next!24889) (not mapNonEmpty!45956) (not start!99546) (not b!1171665) (not b!1171672))
(check-sat b_and!40649 (not b_next!24889))
