; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99622 () Bool)

(assert start!99622)

(declare-fun b_free!25207 () Bool)

(declare-fun b_next!25207 () Bool)

(assert (=> start!99622 (= b_free!25207 (not b_next!25207))))

(declare-fun tp!88335 () Bool)

(declare-fun b_and!41259 () Bool)

(assert (=> start!99622 (= tp!88335 b_and!41259)))

(declare-fun mapNonEmpty!46433 () Bool)

(declare-fun mapRes!46433 () Bool)

(declare-fun tp!88334 () Bool)

(declare-fun e!671142 () Bool)

(assert (=> mapNonEmpty!46433 (= mapRes!46433 (and tp!88334 e!671142))))

(declare-datatypes ((V!44777 0))(
  ( (V!44778 (val!14925 Int)) )
))
(declare-datatypes ((ValueCell!14159 0))(
  ( (ValueCellFull!14159 (v!17562 V!44777)) (EmptyCell!14159) )
))
(declare-fun mapValue!46433 () ValueCell!14159)

(declare-fun mapRest!46433 () (Array (_ BitVec 32) ValueCell!14159))

(declare-fun mapKey!46433 () (_ BitVec 32))

(declare-datatypes ((array!76210 0))(
  ( (array!76211 (arr!36755 (Array (_ BitVec 32) ValueCell!14159)) (size!37293 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76210)

(assert (=> mapNonEmpty!46433 (= (arr!36755 _values!996) (store mapRest!46433 mapKey!46433 mapValue!46433))))

(declare-fun b!1180493 () Bool)

(declare-datatypes ((array!76212 0))(
  ( (array!76213 (arr!36756 (Array (_ BitVec 32) (_ BitVec 64))) (size!37294 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76212)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!671138 () Bool)

(declare-fun arrayContainsKey!0 (array!76212 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1180493 (= e!671138 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1180494 () Bool)

(declare-fun e!671137 () Bool)

(declare-fun tp_is_empty!29737 () Bool)

(assert (=> b!1180494 (= e!671137 tp_is_empty!29737)))

(declare-fun b!1180495 () Bool)

(declare-fun res!784421 () Bool)

(declare-fun e!671141 () Bool)

(assert (=> b!1180495 (=> (not res!784421) (not e!671141))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1180495 (= res!784421 (validMask!0 mask!1564))))

(declare-fun b!1180497 () Bool)

(declare-datatypes ((Unit!38877 0))(
  ( (Unit!38878) )
))
(declare-fun e!671136 () Unit!38877)

(declare-fun Unit!38879 () Unit!38877)

(assert (=> b!1180497 (= e!671136 Unit!38879)))

(declare-fun b!1180498 () Bool)

(declare-fun e!671140 () Bool)

(assert (=> b!1180498 (= e!671140 e!671138)))

(declare-fun res!784415 () Bool)

(assert (=> b!1180498 (=> res!784415 e!671138)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1180498 (= res!784415 (not (= (select (arr!36756 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1180499 () Bool)

(declare-fun res!784419 () Bool)

(assert (=> b!1180499 (=> (not res!784419) (not e!671141))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76212 (_ BitVec 32)) Bool)

(assert (=> b!1180499 (= res!784419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1180500 () Bool)

(declare-fun res!784422 () Bool)

(assert (=> b!1180500 (=> (not res!784422) (not e!671141))))

(assert (=> b!1180500 (= res!784422 (= (select (arr!36756 _keys!1208) i!673) k0!934))))

(declare-fun b!1180501 () Bool)

(declare-fun res!784413 () Bool)

(assert (=> b!1180501 (=> (not res!784413) (not e!671141))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1180501 (= res!784413 (validKeyInArray!0 k0!934))))

(declare-fun b!1180502 () Bool)

(declare-fun e!671145 () Bool)

(declare-datatypes ((tuple2!19224 0))(
  ( (tuple2!19225 (_1!9623 (_ BitVec 64)) (_2!9623 V!44777)) )
))
(declare-datatypes ((List!25932 0))(
  ( (Nil!25929) (Cons!25928 (h!27137 tuple2!19224) (t!38122 List!25932)) )
))
(declare-datatypes ((ListLongMap!17193 0))(
  ( (ListLongMap!17194 (toList!8612 List!25932)) )
))
(declare-fun lt!533639 () ListLongMap!17193)

(declare-fun lt!533632 () ListLongMap!17193)

(assert (=> b!1180502 (= e!671145 (= lt!533639 lt!533632))))

(declare-fun b!1180503 () Bool)

(declare-fun e!671143 () Bool)

(declare-fun e!671144 () Bool)

(assert (=> b!1180503 (= e!671143 e!671144)))

(declare-fun res!784418 () Bool)

(assert (=> b!1180503 (=> res!784418 e!671144)))

(assert (=> b!1180503 (= res!784418 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!533636 () ListLongMap!17193)

(declare-fun lt!533643 () array!76210)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44777)

(declare-fun lt!533637 () array!76212)

(declare-fun zeroValue!944 () V!44777)

(declare-fun getCurrentListMapNoExtraKeys!5069 (array!76212 array!76210 (_ BitVec 32) (_ BitVec 32) V!44777 V!44777 (_ BitVec 32) Int) ListLongMap!17193)

(assert (=> b!1180503 (= lt!533636 (getCurrentListMapNoExtraKeys!5069 lt!533637 lt!533643 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!533635 () V!44777)

(assert (=> b!1180503 (= lt!533643 (array!76211 (store (arr!36755 _values!996) i!673 (ValueCellFull!14159 lt!533635)) (size!37293 _values!996)))))

(declare-fun dynLambda!2980 (Int (_ BitVec 64)) V!44777)

(assert (=> b!1180503 (= lt!533635 (dynLambda!2980 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!533634 () ListLongMap!17193)

(assert (=> b!1180503 (= lt!533634 (getCurrentListMapNoExtraKeys!5069 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1180504 () Bool)

(declare-fun Unit!38880 () Unit!38877)

(assert (=> b!1180504 (= e!671136 Unit!38880)))

(declare-fun lt!533640 () Unit!38877)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76212 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38877)

(assert (=> b!1180504 (= lt!533640 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1180504 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!533642 () Unit!38877)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76212 (_ BitVec 32) (_ BitVec 32)) Unit!38877)

(assert (=> b!1180504 (= lt!533642 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25933 0))(
  ( (Nil!25930) (Cons!25929 (h!27138 (_ BitVec 64)) (t!38123 List!25933)) )
))
(declare-fun arrayNoDuplicates!0 (array!76212 (_ BitVec 32) List!25933) Bool)

(assert (=> b!1180504 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25930)))

(declare-fun lt!533633 () Unit!38877)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76212 (_ BitVec 64) (_ BitVec 32) List!25933) Unit!38877)

(assert (=> b!1180504 (= lt!533633 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25930))))

(assert (=> b!1180504 false))

(declare-fun res!784416 () Bool)

(assert (=> start!99622 (=> (not res!784416) (not e!671141))))

(assert (=> start!99622 (= res!784416 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37294 _keys!1208))))))

(assert (=> start!99622 e!671141))

(assert (=> start!99622 tp_is_empty!29737))

(declare-fun array_inv!28176 (array!76212) Bool)

(assert (=> start!99622 (array_inv!28176 _keys!1208)))

(assert (=> start!99622 true))

(assert (=> start!99622 tp!88335))

(declare-fun e!671146 () Bool)

(declare-fun array_inv!28177 (array!76210) Bool)

(assert (=> start!99622 (and (array_inv!28177 _values!996) e!671146)))

(declare-fun b!1180496 () Bool)

(declare-fun e!671134 () Bool)

(assert (=> b!1180496 (= e!671134 (not e!671143))))

(declare-fun res!784414 () Bool)

(assert (=> b!1180496 (=> res!784414 e!671143)))

(assert (=> b!1180496 (= res!784414 (bvsgt from!1455 i!673))))

(assert (=> b!1180496 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!533641 () Unit!38877)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76212 (_ BitVec 64) (_ BitVec 32)) Unit!38877)

(assert (=> b!1180496 (= lt!533641 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1180505 () Bool)

(assert (=> b!1180505 (= e!671141 e!671134)))

(declare-fun res!784423 () Bool)

(assert (=> b!1180505 (=> (not res!784423) (not e!671134))))

(assert (=> b!1180505 (= res!784423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!533637 mask!1564))))

(assert (=> b!1180505 (= lt!533637 (array!76213 (store (arr!36756 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37294 _keys!1208)))))

(declare-fun b!1180506 () Bool)

(declare-fun res!784411 () Bool)

(assert (=> b!1180506 (=> (not res!784411) (not e!671141))))

(assert (=> b!1180506 (= res!784411 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25930))))

(declare-fun b!1180507 () Bool)

(assert (=> b!1180507 (= e!671142 tp_is_empty!29737)))

(declare-fun b!1180508 () Bool)

(declare-fun res!784407 () Bool)

(assert (=> b!1180508 (=> (not res!784407) (not e!671145))))

(declare-fun lt!533638 () ListLongMap!17193)

(declare-fun lt!533645 () tuple2!19224)

(declare-fun +!3911 (ListLongMap!17193 tuple2!19224) ListLongMap!17193)

(assert (=> b!1180508 (= res!784407 (= lt!533634 (+!3911 lt!533638 lt!533645)))))

(declare-fun b!1180509 () Bool)

(declare-fun res!784408 () Bool)

(assert (=> b!1180509 (=> (not res!784408) (not e!671141))))

(assert (=> b!1180509 (= res!784408 (and (= (size!37293 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37294 _keys!1208) (size!37293 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!46433 () Bool)

(assert (=> mapIsEmpty!46433 mapRes!46433))

(declare-fun b!1180510 () Bool)

(assert (=> b!1180510 (= e!671146 (and e!671137 mapRes!46433))))

(declare-fun condMapEmpty!46433 () Bool)

(declare-fun mapDefault!46433 () ValueCell!14159)

(assert (=> b!1180510 (= condMapEmpty!46433 (= (arr!36755 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14159)) mapDefault!46433)))))

(declare-fun b!1180511 () Bool)

(declare-fun res!784410 () Bool)

(assert (=> b!1180511 (=> (not res!784410) (not e!671141))))

(assert (=> b!1180511 (= res!784410 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37294 _keys!1208))))))

(declare-fun b!1180512 () Bool)

(declare-fun e!671135 () Bool)

(assert (=> b!1180512 (= e!671135 true)))

(assert (=> b!1180512 e!671145))

(declare-fun res!784420 () Bool)

(assert (=> b!1180512 (=> (not res!784420) (not e!671145))))

(assert (=> b!1180512 (= res!784420 (not (= (select (arr!36756 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!533644 () Unit!38877)

(assert (=> b!1180512 (= lt!533644 e!671136)))

(declare-fun c!116908 () Bool)

(assert (=> b!1180512 (= c!116908 (= (select (arr!36756 _keys!1208) from!1455) k0!934))))

(assert (=> b!1180512 e!671140))

(declare-fun res!784412 () Bool)

(assert (=> b!1180512 (=> (not res!784412) (not e!671140))))

(assert (=> b!1180512 (= res!784412 (= lt!533636 (+!3911 lt!533639 lt!533645)))))

(declare-fun get!18804 (ValueCell!14159 V!44777) V!44777)

(assert (=> b!1180512 (= lt!533645 (tuple2!19225 (select (arr!36756 _keys!1208) from!1455) (get!18804 (select (arr!36755 _values!996) from!1455) lt!533635)))))

(declare-fun b!1180513 () Bool)

(assert (=> b!1180513 (= e!671144 e!671135)))

(declare-fun res!784417 () Bool)

(assert (=> b!1180513 (=> res!784417 e!671135)))

(assert (=> b!1180513 (= res!784417 (not (validKeyInArray!0 (select (arr!36756 _keys!1208) from!1455))))))

(assert (=> b!1180513 (= lt!533632 lt!533639)))

(declare-fun -!1574 (ListLongMap!17193 (_ BitVec 64)) ListLongMap!17193)

(assert (=> b!1180513 (= lt!533639 (-!1574 lt!533638 k0!934))))

(assert (=> b!1180513 (= lt!533632 (getCurrentListMapNoExtraKeys!5069 lt!533637 lt!533643 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1180513 (= lt!533638 (getCurrentListMapNoExtraKeys!5069 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!533646 () Unit!38877)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!838 (array!76212 array!76210 (_ BitVec 32) (_ BitVec 32) V!44777 V!44777 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38877)

(assert (=> b!1180513 (= lt!533646 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!838 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1180514 () Bool)

(declare-fun res!784409 () Bool)

(assert (=> b!1180514 (=> (not res!784409) (not e!671134))))

(assert (=> b!1180514 (= res!784409 (arrayNoDuplicates!0 lt!533637 #b00000000000000000000000000000000 Nil!25930))))

(assert (= (and start!99622 res!784416) b!1180495))

(assert (= (and b!1180495 res!784421) b!1180509))

(assert (= (and b!1180509 res!784408) b!1180499))

(assert (= (and b!1180499 res!784419) b!1180506))

(assert (= (and b!1180506 res!784411) b!1180511))

(assert (= (and b!1180511 res!784410) b!1180501))

(assert (= (and b!1180501 res!784413) b!1180500))

(assert (= (and b!1180500 res!784422) b!1180505))

(assert (= (and b!1180505 res!784423) b!1180514))

(assert (= (and b!1180514 res!784409) b!1180496))

(assert (= (and b!1180496 (not res!784414)) b!1180503))

(assert (= (and b!1180503 (not res!784418)) b!1180513))

(assert (= (and b!1180513 (not res!784417)) b!1180512))

(assert (= (and b!1180512 res!784412) b!1180498))

(assert (= (and b!1180498 (not res!784415)) b!1180493))

(assert (= (and b!1180512 c!116908) b!1180504))

(assert (= (and b!1180512 (not c!116908)) b!1180497))

(assert (= (and b!1180512 res!784420) b!1180508))

(assert (= (and b!1180508 res!784407) b!1180502))

(assert (= (and b!1180510 condMapEmpty!46433) mapIsEmpty!46433))

(assert (= (and b!1180510 (not condMapEmpty!46433)) mapNonEmpty!46433))

(get-info :version)

(assert (= (and mapNonEmpty!46433 ((_ is ValueCellFull!14159) mapValue!46433)) b!1180507))

(assert (= (and b!1180510 ((_ is ValueCellFull!14159) mapDefault!46433)) b!1180494))

(assert (= start!99622 b!1180510))

(declare-fun b_lambda!20333 () Bool)

(assert (=> (not b_lambda!20333) (not b!1180503)))

(declare-fun t!38121 () Bool)

(declare-fun tb!10011 () Bool)

(assert (=> (and start!99622 (= defaultEntry!1004 defaultEntry!1004) t!38121) tb!10011))

(declare-fun result!20597 () Bool)

(assert (=> tb!10011 (= result!20597 tp_is_empty!29737)))

(assert (=> b!1180503 t!38121))

(declare-fun b_and!41261 () Bool)

(assert (= b_and!41259 (and (=> t!38121 result!20597) b_and!41261)))

(declare-fun m!1087955 () Bool)

(assert (=> b!1180514 m!1087955))

(declare-fun m!1087957 () Bool)

(assert (=> b!1180503 m!1087957))

(declare-fun m!1087959 () Bool)

(assert (=> b!1180503 m!1087959))

(declare-fun m!1087961 () Bool)

(assert (=> b!1180503 m!1087961))

(declare-fun m!1087963 () Bool)

(assert (=> b!1180503 m!1087963))

(declare-fun m!1087965 () Bool)

(assert (=> b!1180513 m!1087965))

(declare-fun m!1087967 () Bool)

(assert (=> b!1180513 m!1087967))

(declare-fun m!1087969 () Bool)

(assert (=> b!1180513 m!1087969))

(declare-fun m!1087971 () Bool)

(assert (=> b!1180513 m!1087971))

(declare-fun m!1087973 () Bool)

(assert (=> b!1180513 m!1087973))

(declare-fun m!1087975 () Bool)

(assert (=> b!1180513 m!1087975))

(assert (=> b!1180513 m!1087973))

(declare-fun m!1087977 () Bool)

(assert (=> b!1180496 m!1087977))

(declare-fun m!1087979 () Bool)

(assert (=> b!1180496 m!1087979))

(declare-fun m!1087981 () Bool)

(assert (=> b!1180500 m!1087981))

(declare-fun m!1087983 () Bool)

(assert (=> b!1180499 m!1087983))

(assert (=> b!1180498 m!1087973))

(declare-fun m!1087985 () Bool)

(assert (=> start!99622 m!1087985))

(declare-fun m!1087987 () Bool)

(assert (=> start!99622 m!1087987))

(declare-fun m!1087989 () Bool)

(assert (=> b!1180505 m!1087989))

(declare-fun m!1087991 () Bool)

(assert (=> b!1180505 m!1087991))

(declare-fun m!1087993 () Bool)

(assert (=> b!1180508 m!1087993))

(declare-fun m!1087995 () Bool)

(assert (=> b!1180501 m!1087995))

(declare-fun m!1087997 () Bool)

(assert (=> b!1180506 m!1087997))

(declare-fun m!1087999 () Bool)

(assert (=> b!1180493 m!1087999))

(declare-fun m!1088001 () Bool)

(assert (=> mapNonEmpty!46433 m!1088001))

(declare-fun m!1088003 () Bool)

(assert (=> b!1180504 m!1088003))

(declare-fun m!1088005 () Bool)

(assert (=> b!1180504 m!1088005))

(declare-fun m!1088007 () Bool)

(assert (=> b!1180504 m!1088007))

(declare-fun m!1088009 () Bool)

(assert (=> b!1180504 m!1088009))

(declare-fun m!1088011 () Bool)

(assert (=> b!1180504 m!1088011))

(declare-fun m!1088013 () Bool)

(assert (=> b!1180495 m!1088013))

(assert (=> b!1180512 m!1087973))

(declare-fun m!1088015 () Bool)

(assert (=> b!1180512 m!1088015))

(declare-fun m!1088017 () Bool)

(assert (=> b!1180512 m!1088017))

(assert (=> b!1180512 m!1088017))

(declare-fun m!1088019 () Bool)

(assert (=> b!1180512 m!1088019))

(check-sat (not b_lambda!20333) (not b!1180493) (not start!99622) (not b!1180496) (not b!1180514) (not b!1180512) (not mapNonEmpty!46433) (not b!1180513) b_and!41261 tp_is_empty!29737 (not b_next!25207) (not b!1180499) (not b!1180503) (not b!1180505) (not b!1180504) (not b!1180506) (not b!1180508) (not b!1180501) (not b!1180495))
(check-sat b_and!41261 (not b_next!25207))
