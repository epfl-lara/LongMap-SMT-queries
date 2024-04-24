; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100146 () Bool)

(assert start!100146)

(declare-fun b_free!25489 () Bool)

(declare-fun b_next!25489 () Bool)

(assert (=> start!100146 (= b_free!25489 (not b_next!25489))))

(declare-fun tp!89180 () Bool)

(declare-fun b_and!41847 () Bool)

(assert (=> start!100146 (= tp!89180 b_and!41847)))

(declare-fun b!1190454 () Bool)

(declare-fun res!791244 () Bool)

(declare-fun e!676943 () Bool)

(assert (=> b!1190454 (=> (not res!791244) (not e!676943))))

(declare-datatypes ((array!76875 0))(
  ( (array!76876 (arr!37081 (Array (_ BitVec 32) (_ BitVec 64))) (size!37618 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76875)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45153 0))(
  ( (V!45154 (val!15066 Int)) )
))
(declare-datatypes ((ValueCell!14300 0))(
  ( (ValueCellFull!14300 (v!17700 V!45153)) (EmptyCell!14300) )
))
(declare-datatypes ((array!76877 0))(
  ( (array!76878 (arr!37082 (Array (_ BitVec 32) ValueCell!14300)) (size!37619 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76877)

(assert (=> b!1190454 (= res!791244 (and (= (size!37619 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37618 _keys!1208) (size!37619 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1190455 () Bool)

(declare-fun res!791254 () Bool)

(assert (=> b!1190455 (=> (not res!791254) (not e!676943))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1190455 (= res!791254 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!46856 () Bool)

(declare-fun mapRes!46856 () Bool)

(assert (=> mapIsEmpty!46856 mapRes!46856))

(declare-fun b!1190456 () Bool)

(declare-fun res!791245 () Bool)

(assert (=> b!1190456 (=> (not res!791245) (not e!676943))))

(declare-datatypes ((List!26124 0))(
  ( (Nil!26121) (Cons!26120 (h!27338 (_ BitVec 64)) (t!38597 List!26124)) )
))
(declare-fun arrayNoDuplicates!0 (array!76875 (_ BitVec 32) List!26124) Bool)

(assert (=> b!1190456 (= res!791245 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26121))))

(declare-fun b!1190457 () Bool)

(declare-fun e!676944 () Bool)

(assert (=> b!1190457 (= e!676943 e!676944)))

(declare-fun res!791255 () Bool)

(assert (=> b!1190457 (=> (not res!791255) (not e!676944))))

(declare-fun lt!541448 () array!76875)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76875 (_ BitVec 32)) Bool)

(assert (=> b!1190457 (= res!791255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541448 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1190457 (= lt!541448 (array!76876 (store (arr!37081 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37618 _keys!1208)))))

(declare-fun b!1190458 () Bool)

(declare-fun e!676942 () Bool)

(declare-fun tp_is_empty!30019 () Bool)

(assert (=> b!1190458 (= e!676942 tp_is_empty!30019)))

(declare-fun b!1190459 () Bool)

(declare-fun res!791246 () Bool)

(assert (=> b!1190459 (=> (not res!791246) (not e!676943))))

(assert (=> b!1190459 (= res!791246 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37618 _keys!1208))))))

(declare-fun b!1190460 () Bool)

(declare-fun e!676939 () Bool)

(declare-fun e!676940 () Bool)

(assert (=> b!1190460 (= e!676939 e!676940)))

(declare-fun res!791250 () Bool)

(assert (=> b!1190460 (=> res!791250 e!676940)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1190460 (= res!791250 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45153)

(declare-datatypes ((tuple2!19382 0))(
  ( (tuple2!19383 (_1!9702 (_ BitVec 64)) (_2!9702 V!45153)) )
))
(declare-datatypes ((List!26125 0))(
  ( (Nil!26122) (Cons!26121 (h!27339 tuple2!19382) (t!38598 List!26125)) )
))
(declare-datatypes ((ListLongMap!17359 0))(
  ( (ListLongMap!17360 (toList!8695 List!26125)) )
))
(declare-fun lt!541450 () ListLongMap!17359)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!541447 () array!76877)

(declare-fun minValue!944 () V!45153)

(declare-fun getCurrentListMapNoExtraKeys!5163 (array!76875 array!76877 (_ BitVec 32) (_ BitVec 32) V!45153 V!45153 (_ BitVec 32) Int) ListLongMap!17359)

(assert (=> b!1190460 (= lt!541450 (getCurrentListMapNoExtraKeys!5163 lt!541448 lt!541447 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3121 (Int (_ BitVec 64)) V!45153)

(assert (=> b!1190460 (= lt!541447 (array!76878 (store (arr!37082 _values!996) i!673 (ValueCellFull!14300 (dynLambda!3121 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37619 _values!996)))))

(declare-fun lt!541445 () ListLongMap!17359)

(assert (=> b!1190460 (= lt!541445 (getCurrentListMapNoExtraKeys!5163 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1190461 () Bool)

(declare-fun e!676946 () Bool)

(assert (=> b!1190461 (= e!676946 (and e!676942 mapRes!46856))))

(declare-fun condMapEmpty!46856 () Bool)

(declare-fun mapDefault!46856 () ValueCell!14300)

(assert (=> b!1190461 (= condMapEmpty!46856 (= (arr!37082 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14300)) mapDefault!46856)))))

(declare-fun b!1190462 () Bool)

(declare-fun res!791248 () Bool)

(assert (=> b!1190462 (=> (not res!791248) (not e!676943))))

(assert (=> b!1190462 (= res!791248 (= (select (arr!37081 _keys!1208) i!673) k0!934))))

(declare-fun b!1190463 () Bool)

(assert (=> b!1190463 (= e!676944 (not e!676939))))

(declare-fun res!791252 () Bool)

(assert (=> b!1190463 (=> res!791252 e!676939)))

(assert (=> b!1190463 (= res!791252 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76875 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1190463 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39431 0))(
  ( (Unit!39432) )
))
(declare-fun lt!541449 () Unit!39431)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76875 (_ BitVec 64) (_ BitVec 32)) Unit!39431)

(assert (=> b!1190463 (= lt!541449 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1190464 () Bool)

(declare-fun e!676941 () Bool)

(assert (=> b!1190464 (= e!676941 tp_is_empty!30019)))

(declare-fun b!1190466 () Bool)

(declare-fun res!791251 () Bool)

(assert (=> b!1190466 (=> (not res!791251) (not e!676943))))

(assert (=> b!1190466 (= res!791251 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1190467 () Bool)

(declare-fun res!791253 () Bool)

(assert (=> b!1190467 (=> (not res!791253) (not e!676943))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1190467 (= res!791253 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!46856 () Bool)

(declare-fun tp!89181 () Bool)

(assert (=> mapNonEmpty!46856 (= mapRes!46856 (and tp!89181 e!676941))))

(declare-fun mapValue!46856 () ValueCell!14300)

(declare-fun mapRest!46856 () (Array (_ BitVec 32) ValueCell!14300))

(declare-fun mapKey!46856 () (_ BitVec 32))

(assert (=> mapNonEmpty!46856 (= (arr!37082 _values!996) (store mapRest!46856 mapKey!46856 mapValue!46856))))

(declare-fun b!1190468 () Bool)

(declare-fun res!791249 () Bool)

(assert (=> b!1190468 (=> (not res!791249) (not e!676944))))

(assert (=> b!1190468 (= res!791249 (arrayNoDuplicates!0 lt!541448 #b00000000000000000000000000000000 Nil!26121))))

(declare-fun b!1190465 () Bool)

(assert (=> b!1190465 (= e!676940 true)))

(declare-fun -!1711 (ListLongMap!17359 (_ BitVec 64)) ListLongMap!17359)

(assert (=> b!1190465 (= (getCurrentListMapNoExtraKeys!5163 lt!541448 lt!541447 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1711 (getCurrentListMapNoExtraKeys!5163 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!541446 () Unit!39431)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!926 (array!76875 array!76877 (_ BitVec 32) (_ BitVec 32) V!45153 V!45153 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39431)

(assert (=> b!1190465 (= lt!541446 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!926 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!791247 () Bool)

(assert (=> start!100146 (=> (not res!791247) (not e!676943))))

(assert (=> start!100146 (= res!791247 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37618 _keys!1208))))))

(assert (=> start!100146 e!676943))

(assert (=> start!100146 tp_is_empty!30019))

(declare-fun array_inv!28350 (array!76875) Bool)

(assert (=> start!100146 (array_inv!28350 _keys!1208)))

(assert (=> start!100146 true))

(assert (=> start!100146 tp!89180))

(declare-fun array_inv!28351 (array!76877) Bool)

(assert (=> start!100146 (and (array_inv!28351 _values!996) e!676946)))

(assert (= (and start!100146 res!791247) b!1190467))

(assert (= (and b!1190467 res!791253) b!1190454))

(assert (= (and b!1190454 res!791244) b!1190466))

(assert (= (and b!1190466 res!791251) b!1190456))

(assert (= (and b!1190456 res!791245) b!1190459))

(assert (= (and b!1190459 res!791246) b!1190455))

(assert (= (and b!1190455 res!791254) b!1190462))

(assert (= (and b!1190462 res!791248) b!1190457))

(assert (= (and b!1190457 res!791255) b!1190468))

(assert (= (and b!1190468 res!791249) b!1190463))

(assert (= (and b!1190463 (not res!791252)) b!1190460))

(assert (= (and b!1190460 (not res!791250)) b!1190465))

(assert (= (and b!1190461 condMapEmpty!46856) mapIsEmpty!46856))

(assert (= (and b!1190461 (not condMapEmpty!46856)) mapNonEmpty!46856))

(get-info :version)

(assert (= (and mapNonEmpty!46856 ((_ is ValueCellFull!14300) mapValue!46856)) b!1190464))

(assert (= (and b!1190461 ((_ is ValueCellFull!14300) mapDefault!46856)) b!1190458))

(assert (= start!100146 b!1190461))

(declare-fun b_lambda!20627 () Bool)

(assert (=> (not b_lambda!20627) (not b!1190460)))

(declare-fun t!38596 () Bool)

(declare-fun tb!10293 () Bool)

(assert (=> (and start!100146 (= defaultEntry!1004 defaultEntry!1004) t!38596) tb!10293))

(declare-fun result!21161 () Bool)

(assert (=> tb!10293 (= result!21161 tp_is_empty!30019)))

(assert (=> b!1190460 t!38596))

(declare-fun b_and!41849 () Bool)

(assert (= b_and!41847 (and (=> t!38596 result!21161) b_and!41849)))

(declare-fun m!1099443 () Bool)

(assert (=> mapNonEmpty!46856 m!1099443))

(declare-fun m!1099445 () Bool)

(assert (=> b!1190460 m!1099445))

(declare-fun m!1099447 () Bool)

(assert (=> b!1190460 m!1099447))

(declare-fun m!1099449 () Bool)

(assert (=> b!1190460 m!1099449))

(declare-fun m!1099451 () Bool)

(assert (=> b!1190460 m!1099451))

(declare-fun m!1099453 () Bool)

(assert (=> b!1190463 m!1099453))

(declare-fun m!1099455 () Bool)

(assert (=> b!1190463 m!1099455))

(declare-fun m!1099457 () Bool)

(assert (=> b!1190465 m!1099457))

(declare-fun m!1099459 () Bool)

(assert (=> b!1190465 m!1099459))

(assert (=> b!1190465 m!1099459))

(declare-fun m!1099461 () Bool)

(assert (=> b!1190465 m!1099461))

(declare-fun m!1099463 () Bool)

(assert (=> b!1190465 m!1099463))

(declare-fun m!1099465 () Bool)

(assert (=> start!100146 m!1099465))

(declare-fun m!1099467 () Bool)

(assert (=> start!100146 m!1099467))

(declare-fun m!1099469 () Bool)

(assert (=> b!1190455 m!1099469))

(declare-fun m!1099471 () Bool)

(assert (=> b!1190457 m!1099471))

(declare-fun m!1099473 () Bool)

(assert (=> b!1190457 m!1099473))

(declare-fun m!1099475 () Bool)

(assert (=> b!1190468 m!1099475))

(declare-fun m!1099477 () Bool)

(assert (=> b!1190462 m!1099477))

(declare-fun m!1099479 () Bool)

(assert (=> b!1190466 m!1099479))

(declare-fun m!1099481 () Bool)

(assert (=> b!1190467 m!1099481))

(declare-fun m!1099483 () Bool)

(assert (=> b!1190456 m!1099483))

(check-sat (not b!1190457) (not b!1190460) (not b_next!25489) (not b!1190455) (not b_lambda!20627) (not mapNonEmpty!46856) (not start!100146) (not b!1190468) (not b!1190467) (not b!1190463) b_and!41849 tp_is_empty!30019 (not b!1190456) (not b!1190465) (not b!1190466))
(check-sat b_and!41849 (not b_next!25489))
