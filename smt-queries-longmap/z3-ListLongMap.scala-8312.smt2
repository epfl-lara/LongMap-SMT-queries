; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101222 () Bool)

(assert start!101222)

(declare-fun b_free!26145 () Bool)

(declare-fun b_next!26145 () Bool)

(assert (=> start!101222 (= b_free!26145 (not b_next!26145))))

(declare-fun tp!91457 () Bool)

(declare-fun b_and!43407 () Bool)

(assert (=> start!101222 (= tp!91457 b_and!43407)))

(declare-fun b!1215464 () Bool)

(declare-fun e!690158 () Bool)

(declare-fun tp_is_empty!30849 () Bool)

(assert (=> b!1215464 (= e!690158 tp_is_empty!30849)))

(declare-fun b!1215465 () Bool)

(declare-fun res!807023 () Bool)

(declare-fun e!690157 () Bool)

(assert (=> b!1215465 (=> (not res!807023) (not e!690157))))

(declare-datatypes ((array!78473 0))(
  ( (array!78474 (arr!37871 (Array (_ BitVec 32) (_ BitVec 64))) (size!38407 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78473)

(declare-datatypes ((List!26698 0))(
  ( (Nil!26695) (Cons!26694 (h!27903 (_ BitVec 64)) (t!39823 List!26698)) )
))
(declare-fun arrayNoDuplicates!0 (array!78473 (_ BitVec 32) List!26698) Bool)

(assert (=> b!1215465 (= res!807023 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26695))))

(declare-fun b!1215466 () Bool)

(declare-fun e!690155 () Bool)

(declare-fun mapRes!48148 () Bool)

(assert (=> b!1215466 (= e!690155 (and e!690158 mapRes!48148))))

(declare-fun condMapEmpty!48148 () Bool)

(declare-datatypes ((V!46259 0))(
  ( (V!46260 (val!15481 Int)) )
))
(declare-datatypes ((ValueCell!14715 0))(
  ( (ValueCellFull!14715 (v!18134 V!46259)) (EmptyCell!14715) )
))
(declare-datatypes ((array!78475 0))(
  ( (array!78476 (arr!37872 (Array (_ BitVec 32) ValueCell!14715)) (size!38408 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78475)

(declare-fun mapDefault!48148 () ValueCell!14715)

(assert (=> b!1215466 (= condMapEmpty!48148 (= (arr!37872 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14715)) mapDefault!48148)))))

(declare-fun b!1215467 () Bool)

(declare-fun res!807030 () Bool)

(declare-fun e!690159 () Bool)

(assert (=> b!1215467 (=> (not res!807030) (not e!690159))))

(declare-fun lt!552621 () array!78473)

(assert (=> b!1215467 (= res!807030 (arrayNoDuplicates!0 lt!552621 #b00000000000000000000000000000000 Nil!26695))))

(declare-fun b!1215469 () Bool)

(declare-fun e!690156 () Bool)

(assert (=> b!1215469 (= e!690159 (not e!690156))))

(declare-fun res!807026 () Bool)

(assert (=> b!1215469 (=> res!807026 e!690156)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1215469 (= res!807026 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78473 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1215469 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40300 0))(
  ( (Unit!40301) )
))
(declare-fun lt!552622 () Unit!40300)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78473 (_ BitVec 64) (_ BitVec 32)) Unit!40300)

(assert (=> b!1215469 (= lt!552622 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1215470 () Bool)

(declare-fun res!807027 () Bool)

(assert (=> b!1215470 (=> (not res!807027) (not e!690157))))

(assert (=> b!1215470 (= res!807027 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38407 _keys!1208))))))

(declare-fun mapIsEmpty!48148 () Bool)

(assert (=> mapIsEmpty!48148 mapRes!48148))

(declare-fun b!1215471 () Bool)

(declare-fun res!807032 () Bool)

(assert (=> b!1215471 (=> (not res!807032) (not e!690157))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1215471 (= res!807032 (and (= (size!38408 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38407 _keys!1208) (size!38408 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!48148 () Bool)

(declare-fun tp!91456 () Bool)

(declare-fun e!690160 () Bool)

(assert (=> mapNonEmpty!48148 (= mapRes!48148 (and tp!91456 e!690160))))

(declare-fun mapKey!48148 () (_ BitVec 32))

(declare-fun mapRest!48148 () (Array (_ BitVec 32) ValueCell!14715))

(declare-fun mapValue!48148 () ValueCell!14715)

(assert (=> mapNonEmpty!48148 (= (arr!37872 _values!996) (store mapRest!48148 mapKey!48148 mapValue!48148))))

(declare-fun b!1215472 () Bool)

(assert (=> b!1215472 (= e!690160 tp_is_empty!30849)))

(declare-fun b!1215473 () Bool)

(declare-fun res!807025 () Bool)

(assert (=> b!1215473 (=> (not res!807025) (not e!690157))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78473 (_ BitVec 32)) Bool)

(assert (=> b!1215473 (= res!807025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1215474 () Bool)

(assert (=> b!1215474 (= e!690156 true)))

(declare-fun zeroValue!944 () V!46259)

(declare-datatypes ((tuple2!19898 0))(
  ( (tuple2!19899 (_1!9960 (_ BitVec 64)) (_2!9960 V!46259)) )
))
(declare-datatypes ((List!26699 0))(
  ( (Nil!26696) (Cons!26695 (h!27904 tuple2!19898) (t!39824 List!26699)) )
))
(declare-datatypes ((ListLongMap!17867 0))(
  ( (ListLongMap!17868 (toList!8949 List!26699)) )
))
(declare-fun lt!552624 () ListLongMap!17867)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46259)

(declare-fun getCurrentListMapNoExtraKeys!5376 (array!78473 array!78475 (_ BitVec 32) (_ BitVec 32) V!46259 V!46259 (_ BitVec 32) Int) ListLongMap!17867)

(declare-fun dynLambda!3265 (Int (_ BitVec 64)) V!46259)

(assert (=> b!1215474 (= lt!552624 (getCurrentListMapNoExtraKeys!5376 lt!552621 (array!78476 (store (arr!37872 _values!996) i!673 (ValueCellFull!14715 (dynLambda!3265 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38408 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552623 () ListLongMap!17867)

(assert (=> b!1215474 (= lt!552623 (getCurrentListMapNoExtraKeys!5376 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1215475 () Bool)

(declare-fun res!807031 () Bool)

(assert (=> b!1215475 (=> (not res!807031) (not e!690157))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1215475 (= res!807031 (validMask!0 mask!1564))))

(declare-fun res!807029 () Bool)

(assert (=> start!101222 (=> (not res!807029) (not e!690157))))

(assert (=> start!101222 (= res!807029 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38407 _keys!1208))))))

(assert (=> start!101222 e!690157))

(assert (=> start!101222 tp_is_empty!30849))

(declare-fun array_inv!28836 (array!78473) Bool)

(assert (=> start!101222 (array_inv!28836 _keys!1208)))

(assert (=> start!101222 true))

(assert (=> start!101222 tp!91457))

(declare-fun array_inv!28837 (array!78475) Bool)

(assert (=> start!101222 (and (array_inv!28837 _values!996) e!690155)))

(declare-fun b!1215468 () Bool)

(assert (=> b!1215468 (= e!690157 e!690159)))

(declare-fun res!807024 () Bool)

(assert (=> b!1215468 (=> (not res!807024) (not e!690159))))

(assert (=> b!1215468 (= res!807024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552621 mask!1564))))

(assert (=> b!1215468 (= lt!552621 (array!78474 (store (arr!37871 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38407 _keys!1208)))))

(declare-fun b!1215476 () Bool)

(declare-fun res!807022 () Bool)

(assert (=> b!1215476 (=> (not res!807022) (not e!690157))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1215476 (= res!807022 (validKeyInArray!0 k0!934))))

(declare-fun b!1215477 () Bool)

(declare-fun res!807028 () Bool)

(assert (=> b!1215477 (=> (not res!807028) (not e!690157))))

(assert (=> b!1215477 (= res!807028 (= (select (arr!37871 _keys!1208) i!673) k0!934))))

(assert (= (and start!101222 res!807029) b!1215475))

(assert (= (and b!1215475 res!807031) b!1215471))

(assert (= (and b!1215471 res!807032) b!1215473))

(assert (= (and b!1215473 res!807025) b!1215465))

(assert (= (and b!1215465 res!807023) b!1215470))

(assert (= (and b!1215470 res!807027) b!1215476))

(assert (= (and b!1215476 res!807022) b!1215477))

(assert (= (and b!1215477 res!807028) b!1215468))

(assert (= (and b!1215468 res!807024) b!1215467))

(assert (= (and b!1215467 res!807030) b!1215469))

(assert (= (and b!1215469 (not res!807026)) b!1215474))

(assert (= (and b!1215466 condMapEmpty!48148) mapIsEmpty!48148))

(assert (= (and b!1215466 (not condMapEmpty!48148)) mapNonEmpty!48148))

(get-info :version)

(assert (= (and mapNonEmpty!48148 ((_ is ValueCellFull!14715) mapValue!48148)) b!1215472))

(assert (= (and b!1215466 ((_ is ValueCellFull!14715) mapDefault!48148)) b!1215464))

(assert (= start!101222 b!1215466))

(declare-fun b_lambda!21821 () Bool)

(assert (=> (not b_lambda!21821) (not b!1215474)))

(declare-fun t!39822 () Bool)

(declare-fun tb!10945 () Bool)

(assert (=> (and start!101222 (= defaultEntry!1004 defaultEntry!1004) t!39822) tb!10945))

(declare-fun result!22487 () Bool)

(assert (=> tb!10945 (= result!22487 tp_is_empty!30849)))

(assert (=> b!1215474 t!39822))

(declare-fun b_and!43409 () Bool)

(assert (= b_and!43407 (and (=> t!39822 result!22487) b_and!43409)))

(declare-fun m!1120429 () Bool)

(assert (=> start!101222 m!1120429))

(declare-fun m!1120431 () Bool)

(assert (=> start!101222 m!1120431))

(declare-fun m!1120433 () Bool)

(assert (=> mapNonEmpty!48148 m!1120433))

(declare-fun m!1120435 () Bool)

(assert (=> b!1215475 m!1120435))

(declare-fun m!1120437 () Bool)

(assert (=> b!1215469 m!1120437))

(declare-fun m!1120439 () Bool)

(assert (=> b!1215469 m!1120439))

(declare-fun m!1120441 () Bool)

(assert (=> b!1215468 m!1120441))

(declare-fun m!1120443 () Bool)

(assert (=> b!1215468 m!1120443))

(declare-fun m!1120445 () Bool)

(assert (=> b!1215465 m!1120445))

(declare-fun m!1120447 () Bool)

(assert (=> b!1215473 m!1120447))

(declare-fun m!1120449 () Bool)

(assert (=> b!1215474 m!1120449))

(declare-fun m!1120451 () Bool)

(assert (=> b!1215474 m!1120451))

(declare-fun m!1120453 () Bool)

(assert (=> b!1215474 m!1120453))

(declare-fun m!1120455 () Bool)

(assert (=> b!1215474 m!1120455))

(declare-fun m!1120457 () Bool)

(assert (=> b!1215476 m!1120457))

(declare-fun m!1120459 () Bool)

(assert (=> b!1215467 m!1120459))

(declare-fun m!1120461 () Bool)

(assert (=> b!1215477 m!1120461))

(check-sat (not b!1215469) (not b_next!26145) (not b!1215476) (not b_lambda!21821) (not b!1215467) tp_is_empty!30849 (not b!1215475) (not start!101222) (not b!1215465) (not b!1215473) (not b!1215474) (not mapNonEmpty!48148) (not b!1215468) b_and!43409)
(check-sat b_and!43409 (not b_next!26145))
