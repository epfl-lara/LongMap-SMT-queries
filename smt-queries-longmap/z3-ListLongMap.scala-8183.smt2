; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99966 () Bool)

(assert start!99966)

(declare-fun b_free!25545 () Bool)

(declare-fun b_next!25545 () Bool)

(assert (=> start!99966 (= b_free!25545 (not b_next!25545))))

(declare-fun tp!89349 () Bool)

(declare-fun b_and!41957 () Bool)

(assert (=> start!99966 (= tp!89349 b_and!41957)))

(declare-fun b!1190481 () Bool)

(declare-fun e!676784 () Bool)

(declare-fun e!676786 () Bool)

(declare-fun mapRes!46940 () Bool)

(assert (=> b!1190481 (= e!676784 (and e!676786 mapRes!46940))))

(declare-fun condMapEmpty!46940 () Bool)

(declare-datatypes ((V!45227 0))(
  ( (V!45228 (val!15094 Int)) )
))
(declare-datatypes ((ValueCell!14328 0))(
  ( (ValueCellFull!14328 (v!17732 V!45227)) (EmptyCell!14328) )
))
(declare-datatypes ((array!76941 0))(
  ( (array!76942 (arr!37120 (Array (_ BitVec 32) ValueCell!14328)) (size!37656 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76941)

(declare-fun mapDefault!46940 () ValueCell!14328)

(assert (=> b!1190481 (= condMapEmpty!46940 (= (arr!37120 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14328)) mapDefault!46940)))))

(declare-fun b!1190482 () Bool)

(declare-fun res!791744 () Bool)

(declare-fun e!676780 () Bool)

(assert (=> b!1190482 (=> (not res!791744) (not e!676780))))

(declare-datatypes ((array!76943 0))(
  ( (array!76944 (arr!37121 (Array (_ BitVec 32) (_ BitVec 64))) (size!37657 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76943)

(declare-datatypes ((List!26136 0))(
  ( (Nil!26133) (Cons!26132 (h!27341 (_ BitVec 64)) (t!38673 List!26136)) )
))
(declare-fun arrayNoDuplicates!0 (array!76943 (_ BitVec 32) List!26136) Bool)

(assert (=> b!1190482 (= res!791744 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26133))))

(declare-fun b!1190483 () Bool)

(declare-fun res!791753 () Bool)

(declare-fun e!676782 () Bool)

(assert (=> b!1190483 (=> (not res!791753) (not e!676782))))

(declare-fun lt!541469 () array!76943)

(assert (=> b!1190483 (= res!791753 (arrayNoDuplicates!0 lt!541469 #b00000000000000000000000000000000 Nil!26133))))

(declare-fun b!1190484 () Bool)

(declare-fun res!791747 () Bool)

(assert (=> b!1190484 (=> (not res!791747) (not e!676780))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1190484 (= res!791747 (validKeyInArray!0 k0!934))))

(declare-fun b!1190485 () Bool)

(declare-fun res!791754 () Bool)

(assert (=> b!1190485 (=> (not res!791754) (not e!676780))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1190485 (= res!791754 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37657 _keys!1208))))))

(declare-fun b!1190486 () Bool)

(declare-fun e!676785 () Bool)

(assert (=> b!1190486 (= e!676785 true)))

(declare-fun zeroValue!944 () V!45227)

(declare-fun lt!541466 () array!76941)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45227)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!19390 0))(
  ( (tuple2!19391 (_1!9706 (_ BitVec 64)) (_2!9706 V!45227)) )
))
(declare-datatypes ((List!26137 0))(
  ( (Nil!26134) (Cons!26133 (h!27342 tuple2!19390) (t!38674 List!26137)) )
))
(declare-datatypes ((ListLongMap!17359 0))(
  ( (ListLongMap!17360 (toList!8695 List!26137)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5136 (array!76943 array!76941 (_ BitVec 32) (_ BitVec 32) V!45227 V!45227 (_ BitVec 32) Int) ListLongMap!17359)

(declare-fun -!1722 (ListLongMap!17359 (_ BitVec 64)) ListLongMap!17359)

(assert (=> b!1190486 (= (getCurrentListMapNoExtraKeys!5136 lt!541469 lt!541466 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1722 (getCurrentListMapNoExtraKeys!5136 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!39486 0))(
  ( (Unit!39487) )
))
(declare-fun lt!541470 () Unit!39486)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!931 (array!76943 array!76941 (_ BitVec 32) (_ BitVec 32) V!45227 V!45227 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39486)

(assert (=> b!1190486 (= lt!541470 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!931 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1190487 () Bool)

(declare-fun res!791749 () Bool)

(assert (=> b!1190487 (=> (not res!791749) (not e!676780))))

(assert (=> b!1190487 (= res!791749 (= (select (arr!37121 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!46940 () Bool)

(declare-fun tp!89348 () Bool)

(declare-fun e!676783 () Bool)

(assert (=> mapNonEmpty!46940 (= mapRes!46940 (and tp!89348 e!676783))))

(declare-fun mapValue!46940 () ValueCell!14328)

(declare-fun mapKey!46940 () (_ BitVec 32))

(declare-fun mapRest!46940 () (Array (_ BitVec 32) ValueCell!14328))

(assert (=> mapNonEmpty!46940 (= (arr!37120 _values!996) (store mapRest!46940 mapKey!46940 mapValue!46940))))

(declare-fun b!1190488 () Bool)

(declare-fun e!676779 () Bool)

(assert (=> b!1190488 (= e!676782 (not e!676779))))

(declare-fun res!791745 () Bool)

(assert (=> b!1190488 (=> res!791745 e!676779)))

(assert (=> b!1190488 (= res!791745 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76943 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1190488 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!541468 () Unit!39486)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76943 (_ BitVec 64) (_ BitVec 32)) Unit!39486)

(assert (=> b!1190488 (= lt!541468 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!46940 () Bool)

(assert (=> mapIsEmpty!46940 mapRes!46940))

(declare-fun b!1190489 () Bool)

(declare-fun tp_is_empty!30075 () Bool)

(assert (=> b!1190489 (= e!676786 tp_is_empty!30075)))

(declare-fun b!1190490 () Bool)

(assert (=> b!1190490 (= e!676783 tp_is_empty!30075)))

(declare-fun res!791750 () Bool)

(assert (=> start!99966 (=> (not res!791750) (not e!676780))))

(assert (=> start!99966 (= res!791750 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37657 _keys!1208))))))

(assert (=> start!99966 e!676780))

(assert (=> start!99966 tp_is_empty!30075))

(declare-fun array_inv!28308 (array!76943) Bool)

(assert (=> start!99966 (array_inv!28308 _keys!1208)))

(assert (=> start!99966 true))

(assert (=> start!99966 tp!89349))

(declare-fun array_inv!28309 (array!76941) Bool)

(assert (=> start!99966 (and (array_inv!28309 _values!996) e!676784)))

(declare-fun b!1190491 () Bool)

(declare-fun res!791752 () Bool)

(assert (=> b!1190491 (=> (not res!791752) (not e!676780))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1190491 (= res!791752 (validMask!0 mask!1564))))

(declare-fun b!1190492 () Bool)

(declare-fun res!791751 () Bool)

(assert (=> b!1190492 (=> (not res!791751) (not e!676780))))

(assert (=> b!1190492 (= res!791751 (and (= (size!37656 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37657 _keys!1208) (size!37656 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1190493 () Bool)

(assert (=> b!1190493 (= e!676779 e!676785)))

(declare-fun res!791748 () Bool)

(assert (=> b!1190493 (=> res!791748 e!676785)))

(assert (=> b!1190493 (= res!791748 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!541467 () ListLongMap!17359)

(assert (=> b!1190493 (= lt!541467 (getCurrentListMapNoExtraKeys!5136 lt!541469 lt!541466 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3075 (Int (_ BitVec 64)) V!45227)

(assert (=> b!1190493 (= lt!541466 (array!76942 (store (arr!37120 _values!996) i!673 (ValueCellFull!14328 (dynLambda!3075 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37656 _values!996)))))

(declare-fun lt!541465 () ListLongMap!17359)

(assert (=> b!1190493 (= lt!541465 (getCurrentListMapNoExtraKeys!5136 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1190494 () Bool)

(declare-fun res!791746 () Bool)

(assert (=> b!1190494 (=> (not res!791746) (not e!676780))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76943 (_ BitVec 32)) Bool)

(assert (=> b!1190494 (= res!791746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1190495 () Bool)

(assert (=> b!1190495 (= e!676780 e!676782)))

(declare-fun res!791755 () Bool)

(assert (=> b!1190495 (=> (not res!791755) (not e!676782))))

(assert (=> b!1190495 (= res!791755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541469 mask!1564))))

(assert (=> b!1190495 (= lt!541469 (array!76944 (store (arr!37121 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37657 _keys!1208)))))

(assert (= (and start!99966 res!791750) b!1190491))

(assert (= (and b!1190491 res!791752) b!1190492))

(assert (= (and b!1190492 res!791751) b!1190494))

(assert (= (and b!1190494 res!791746) b!1190482))

(assert (= (and b!1190482 res!791744) b!1190485))

(assert (= (and b!1190485 res!791754) b!1190484))

(assert (= (and b!1190484 res!791747) b!1190487))

(assert (= (and b!1190487 res!791749) b!1190495))

(assert (= (and b!1190495 res!791755) b!1190483))

(assert (= (and b!1190483 res!791753) b!1190488))

(assert (= (and b!1190488 (not res!791745)) b!1190493))

(assert (= (and b!1190493 (not res!791748)) b!1190486))

(assert (= (and b!1190481 condMapEmpty!46940) mapIsEmpty!46940))

(assert (= (and b!1190481 (not condMapEmpty!46940)) mapNonEmpty!46940))

(get-info :version)

(assert (= (and mapNonEmpty!46940 ((_ is ValueCellFull!14328) mapValue!46940)) b!1190490))

(assert (= (and b!1190481 ((_ is ValueCellFull!14328) mapDefault!46940)) b!1190489))

(assert (= start!99966 b!1190481))

(declare-fun b_lambda!20689 () Bool)

(assert (=> (not b_lambda!20689) (not b!1190493)))

(declare-fun t!38672 () Bool)

(declare-fun tb!10357 () Bool)

(assert (=> (and start!99966 (= defaultEntry!1004 defaultEntry!1004) t!38672) tb!10357))

(declare-fun result!21281 () Bool)

(assert (=> tb!10357 (= result!21281 tp_is_empty!30075)))

(assert (=> b!1190493 t!38672))

(declare-fun b_and!41959 () Bool)

(assert (= b_and!41957 (and (=> t!38672 result!21281) b_and!41959)))

(declare-fun m!1099047 () Bool)

(assert (=> b!1190493 m!1099047))

(declare-fun m!1099049 () Bool)

(assert (=> b!1190493 m!1099049))

(declare-fun m!1099051 () Bool)

(assert (=> b!1190493 m!1099051))

(declare-fun m!1099053 () Bool)

(assert (=> b!1190493 m!1099053))

(declare-fun m!1099055 () Bool)

(assert (=> b!1190494 m!1099055))

(declare-fun m!1099057 () Bool)

(assert (=> b!1190488 m!1099057))

(declare-fun m!1099059 () Bool)

(assert (=> b!1190488 m!1099059))

(declare-fun m!1099061 () Bool)

(assert (=> b!1190484 m!1099061))

(declare-fun m!1099063 () Bool)

(assert (=> b!1190487 m!1099063))

(declare-fun m!1099065 () Bool)

(assert (=> b!1190482 m!1099065))

(declare-fun m!1099067 () Bool)

(assert (=> b!1190495 m!1099067))

(declare-fun m!1099069 () Bool)

(assert (=> b!1190495 m!1099069))

(declare-fun m!1099071 () Bool)

(assert (=> mapNonEmpty!46940 m!1099071))

(declare-fun m!1099073 () Bool)

(assert (=> b!1190486 m!1099073))

(declare-fun m!1099075 () Bool)

(assert (=> b!1190486 m!1099075))

(assert (=> b!1190486 m!1099075))

(declare-fun m!1099077 () Bool)

(assert (=> b!1190486 m!1099077))

(declare-fun m!1099079 () Bool)

(assert (=> b!1190486 m!1099079))

(declare-fun m!1099081 () Bool)

(assert (=> start!99966 m!1099081))

(declare-fun m!1099083 () Bool)

(assert (=> start!99966 m!1099083))

(declare-fun m!1099085 () Bool)

(assert (=> b!1190483 m!1099085))

(declare-fun m!1099087 () Bool)

(assert (=> b!1190491 m!1099087))

(check-sat (not b!1190494) (not b!1190482) (not b!1190484) (not b!1190483) (not b_next!25545) (not start!99966) (not mapNonEmpty!46940) tp_is_empty!30075 (not b!1190491) (not b!1190486) (not b!1190495) (not b!1190493) (not b!1190488) b_and!41959 (not b_lambda!20689))
(check-sat b_and!41959 (not b_next!25545))
