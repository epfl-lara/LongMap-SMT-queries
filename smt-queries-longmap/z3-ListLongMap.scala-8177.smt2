; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99922 () Bool)

(assert start!99922)

(declare-fun b_free!25507 () Bool)

(declare-fun b_next!25507 () Bool)

(assert (=> start!99922 (= b_free!25507 (not b_next!25507))))

(declare-fun tp!89235 () Bool)

(declare-fun b_and!41859 () Bool)

(assert (=> start!99922 (= tp!89235 b_and!41859)))

(declare-fun b!1189464 () Bool)

(declare-fun e!676251 () Bool)

(declare-fun e!676249 () Bool)

(declare-fun mapRes!46883 () Bool)

(assert (=> b!1189464 (= e!676251 (and e!676249 mapRes!46883))))

(declare-fun condMapEmpty!46883 () Bool)

(declare-datatypes ((V!45177 0))(
  ( (V!45178 (val!15075 Int)) )
))
(declare-datatypes ((ValueCell!14309 0))(
  ( (ValueCellFull!14309 (v!17712 V!45177)) (EmptyCell!14309) )
))
(declare-datatypes ((array!76802 0))(
  ( (array!76803 (arr!37051 (Array (_ BitVec 32) ValueCell!14309)) (size!37589 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76802)

(declare-fun mapDefault!46883 () ValueCell!14309)

(assert (=> b!1189464 (= condMapEmpty!46883 (= (arr!37051 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14309)) mapDefault!46883)))))

(declare-fun b!1189465 () Bool)

(declare-fun res!790994 () Bool)

(declare-fun e!676252 () Bool)

(assert (=> b!1189465 (=> (not res!790994) (not e!676252))))

(declare-datatypes ((array!76804 0))(
  ( (array!76805 (arr!37052 (Array (_ BitVec 32) (_ BitVec 64))) (size!37590 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76804)

(declare-datatypes ((List!26191 0))(
  ( (Nil!26188) (Cons!26187 (h!27396 (_ BitVec 64)) (t!38681 List!26191)) )
))
(declare-fun arrayNoDuplicates!0 (array!76804 (_ BitVec 32) List!26191) Bool)

(assert (=> b!1189465 (= res!790994 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26188))))

(declare-fun b!1189466 () Bool)

(declare-fun e!676247 () Bool)

(assert (=> b!1189466 (= e!676252 e!676247)))

(declare-fun res!790997 () Bool)

(assert (=> b!1189466 (=> (not res!790997) (not e!676247))))

(declare-fun lt!540936 () array!76804)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76804 (_ BitVec 32)) Bool)

(assert (=> b!1189466 (= res!790997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!540936 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1189466 (= lt!540936 (array!76805 (store (arr!37052 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37590 _keys!1208)))))

(declare-fun b!1189467 () Bool)

(declare-fun res!790995 () Bool)

(assert (=> b!1189467 (=> (not res!790995) (not e!676252))))

(assert (=> b!1189467 (= res!790995 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37590 _keys!1208))))))

(declare-fun b!1189468 () Bool)

(declare-fun res!791002 () Bool)

(assert (=> b!1189468 (=> (not res!791002) (not e!676247))))

(assert (=> b!1189468 (= res!791002 (arrayNoDuplicates!0 lt!540936 #b00000000000000000000000000000000 Nil!26188))))

(declare-fun b!1189469 () Bool)

(declare-fun tp_is_empty!30037 () Bool)

(assert (=> b!1189469 (= e!676249 tp_is_empty!30037)))

(declare-fun b!1189470 () Bool)

(declare-fun res!791004 () Bool)

(assert (=> b!1189470 (=> (not res!791004) (not e!676252))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1189470 (= res!791004 (= (select (arr!37052 _keys!1208) i!673) k0!934))))

(declare-fun b!1189471 () Bool)

(declare-fun e!676246 () Bool)

(declare-fun e!676250 () Bool)

(assert (=> b!1189471 (= e!676246 e!676250)))

(declare-fun res!790998 () Bool)

(assert (=> b!1189471 (=> res!790998 e!676250)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1189471 (= res!790998 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45177)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19480 0))(
  ( (tuple2!19481 (_1!9751 (_ BitVec 64)) (_2!9751 V!45177)) )
))
(declare-datatypes ((List!26192 0))(
  ( (Nil!26189) (Cons!26188 (h!27397 tuple2!19480) (t!38682 List!26192)) )
))
(declare-datatypes ((ListLongMap!17449 0))(
  ( (ListLongMap!17450 (toList!8740 List!26192)) )
))
(declare-fun lt!540935 () ListLongMap!17449)

(declare-fun minValue!944 () V!45177)

(declare-fun lt!540933 () array!76802)

(declare-fun getCurrentListMapNoExtraKeys!5190 (array!76804 array!76802 (_ BitVec 32) (_ BitVec 32) V!45177 V!45177 (_ BitVec 32) Int) ListLongMap!17449)

(assert (=> b!1189471 (= lt!540935 (getCurrentListMapNoExtraKeys!5190 lt!540936 lt!540933 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3085 (Int (_ BitVec 64)) V!45177)

(assert (=> b!1189471 (= lt!540933 (array!76803 (store (arr!37051 _values!996) i!673 (ValueCellFull!14309 (dynLambda!3085 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37589 _values!996)))))

(declare-fun lt!540932 () ListLongMap!17449)

(assert (=> b!1189471 (= lt!540932 (getCurrentListMapNoExtraKeys!5190 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1189472 () Bool)

(declare-fun res!791001 () Bool)

(assert (=> b!1189472 (=> (not res!791001) (not e!676252))))

(assert (=> b!1189472 (= res!791001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1189473 () Bool)

(declare-fun res!791005 () Bool)

(assert (=> b!1189473 (=> (not res!791005) (not e!676252))))

(assert (=> b!1189473 (= res!791005 (and (= (size!37589 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37590 _keys!1208) (size!37589 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1189474 () Bool)

(declare-fun res!791003 () Bool)

(assert (=> b!1189474 (=> (not res!791003) (not e!676252))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1189474 (= res!791003 (validKeyInArray!0 k0!934))))

(declare-fun res!790996 () Bool)

(assert (=> start!99922 (=> (not res!790996) (not e!676252))))

(assert (=> start!99922 (= res!790996 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37590 _keys!1208))))))

(assert (=> start!99922 e!676252))

(assert (=> start!99922 tp_is_empty!30037))

(declare-fun array_inv!28382 (array!76804) Bool)

(assert (=> start!99922 (array_inv!28382 _keys!1208)))

(assert (=> start!99922 true))

(assert (=> start!99922 tp!89235))

(declare-fun array_inv!28383 (array!76802) Bool)

(assert (=> start!99922 (and (array_inv!28383 _values!996) e!676251)))

(declare-fun b!1189475 () Bool)

(assert (=> b!1189475 (= e!676247 (not e!676246))))

(declare-fun res!791000 () Bool)

(assert (=> b!1189475 (=> res!791000 e!676246)))

(assert (=> b!1189475 (= res!791000 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76804 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1189475 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39341 0))(
  ( (Unit!39342) )
))
(declare-fun lt!540931 () Unit!39341)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76804 (_ BitVec 64) (_ BitVec 32)) Unit!39341)

(assert (=> b!1189475 (= lt!540931 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1189476 () Bool)

(assert (=> b!1189476 (= e!676250 true)))

(declare-fun -!1686 (ListLongMap!17449 (_ BitVec 64)) ListLongMap!17449)

(assert (=> b!1189476 (= (getCurrentListMapNoExtraKeys!5190 lt!540936 lt!540933 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1686 (getCurrentListMapNoExtraKeys!5190 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!540934 () Unit!39341)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!936 (array!76804 array!76802 (_ BitVec 32) (_ BitVec 32) V!45177 V!45177 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39341)

(assert (=> b!1189476 (= lt!540934 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!936 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!46883 () Bool)

(assert (=> mapIsEmpty!46883 mapRes!46883))

(declare-fun b!1189477 () Bool)

(declare-fun res!790999 () Bool)

(assert (=> b!1189477 (=> (not res!790999) (not e!676252))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1189477 (= res!790999 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!46883 () Bool)

(declare-fun tp!89234 () Bool)

(declare-fun e!676245 () Bool)

(assert (=> mapNonEmpty!46883 (= mapRes!46883 (and tp!89234 e!676245))))

(declare-fun mapKey!46883 () (_ BitVec 32))

(declare-fun mapValue!46883 () ValueCell!14309)

(declare-fun mapRest!46883 () (Array (_ BitVec 32) ValueCell!14309))

(assert (=> mapNonEmpty!46883 (= (arr!37051 _values!996) (store mapRest!46883 mapKey!46883 mapValue!46883))))

(declare-fun b!1189478 () Bool)

(assert (=> b!1189478 (= e!676245 tp_is_empty!30037)))

(assert (= (and start!99922 res!790996) b!1189477))

(assert (= (and b!1189477 res!790999) b!1189473))

(assert (= (and b!1189473 res!791005) b!1189472))

(assert (= (and b!1189472 res!791001) b!1189465))

(assert (= (and b!1189465 res!790994) b!1189467))

(assert (= (and b!1189467 res!790995) b!1189474))

(assert (= (and b!1189474 res!791003) b!1189470))

(assert (= (and b!1189470 res!791004) b!1189466))

(assert (= (and b!1189466 res!790997) b!1189468))

(assert (= (and b!1189468 res!791002) b!1189475))

(assert (= (and b!1189475 (not res!791000)) b!1189471))

(assert (= (and b!1189471 (not res!790998)) b!1189476))

(assert (= (and b!1189464 condMapEmpty!46883) mapIsEmpty!46883))

(assert (= (and b!1189464 (not condMapEmpty!46883)) mapNonEmpty!46883))

(get-info :version)

(assert (= (and mapNonEmpty!46883 ((_ is ValueCellFull!14309) mapValue!46883)) b!1189478))

(assert (= (and b!1189464 ((_ is ValueCellFull!14309) mapDefault!46883)) b!1189469))

(assert (= start!99922 b!1189464))

(declare-fun b_lambda!20633 () Bool)

(assert (=> (not b_lambda!20633) (not b!1189471)))

(declare-fun t!38680 () Bool)

(declare-fun tb!10311 () Bool)

(assert (=> (and start!99922 (= defaultEntry!1004 defaultEntry!1004) t!38680) tb!10311))

(declare-fun result!21197 () Bool)

(assert (=> tb!10311 (= result!21197 tp_is_empty!30037)))

(assert (=> b!1189471 t!38680))

(declare-fun b_and!41861 () Bool)

(assert (= b_and!41859 (and (=> t!38680 result!21197) b_and!41861)))

(declare-fun m!1097639 () Bool)

(assert (=> b!1189474 m!1097639))

(declare-fun m!1097641 () Bool)

(assert (=> b!1189468 m!1097641))

(declare-fun m!1097643 () Bool)

(assert (=> b!1189471 m!1097643))

(declare-fun m!1097645 () Bool)

(assert (=> b!1189471 m!1097645))

(declare-fun m!1097647 () Bool)

(assert (=> b!1189471 m!1097647))

(declare-fun m!1097649 () Bool)

(assert (=> b!1189471 m!1097649))

(declare-fun m!1097651 () Bool)

(assert (=> b!1189476 m!1097651))

(declare-fun m!1097653 () Bool)

(assert (=> b!1189476 m!1097653))

(assert (=> b!1189476 m!1097653))

(declare-fun m!1097655 () Bool)

(assert (=> b!1189476 m!1097655))

(declare-fun m!1097657 () Bool)

(assert (=> b!1189476 m!1097657))

(declare-fun m!1097659 () Bool)

(assert (=> b!1189477 m!1097659))

(declare-fun m!1097661 () Bool)

(assert (=> b!1189472 m!1097661))

(declare-fun m!1097663 () Bool)

(assert (=> b!1189470 m!1097663))

(declare-fun m!1097665 () Bool)

(assert (=> b!1189466 m!1097665))

(declare-fun m!1097667 () Bool)

(assert (=> b!1189466 m!1097667))

(declare-fun m!1097669 () Bool)

(assert (=> start!99922 m!1097669))

(declare-fun m!1097671 () Bool)

(assert (=> start!99922 m!1097671))

(declare-fun m!1097673 () Bool)

(assert (=> mapNonEmpty!46883 m!1097673))

(declare-fun m!1097675 () Bool)

(assert (=> b!1189465 m!1097675))

(declare-fun m!1097677 () Bool)

(assert (=> b!1189475 m!1097677))

(declare-fun m!1097679 () Bool)

(assert (=> b!1189475 m!1097679))

(check-sat b_and!41861 (not b!1189465) (not b!1189475) (not b!1189466) (not b!1189468) (not b!1189474) (not b!1189477) (not b!1189472) (not start!99922) (not mapNonEmpty!46883) (not b!1189471) (not b!1189476) tp_is_empty!30037 (not b_next!25507) (not b_lambda!20633))
(check-sat b_and!41861 (not b_next!25507))
