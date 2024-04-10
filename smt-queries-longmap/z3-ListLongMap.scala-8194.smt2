; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100032 () Bool)

(assert start!100032)

(declare-fun b_free!25611 () Bool)

(declare-fun b_next!25611 () Bool)

(assert (=> start!100032 (= b_free!25611 (not b_next!25611))))

(declare-fun tp!89546 () Bool)

(declare-fun b_and!42089 () Bool)

(assert (=> start!100032 (= tp!89546 b_and!42089)))

(declare-fun mapNonEmpty!47039 () Bool)

(declare-fun mapRes!47039 () Bool)

(declare-fun tp!89547 () Bool)

(declare-fun e!677577 () Bool)

(assert (=> mapNonEmpty!47039 (= mapRes!47039 (and tp!89547 e!677577))))

(declare-datatypes ((V!45315 0))(
  ( (V!45316 (val!15127 Int)) )
))
(declare-datatypes ((ValueCell!14361 0))(
  ( (ValueCellFull!14361 (v!17765 V!45315)) (EmptyCell!14361) )
))
(declare-fun mapRest!47039 () (Array (_ BitVec 32) ValueCell!14361))

(declare-datatypes ((array!77071 0))(
  ( (array!77072 (arr!37185 (Array (_ BitVec 32) ValueCell!14361)) (size!37721 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77071)

(declare-fun mapKey!47039 () (_ BitVec 32))

(declare-fun mapValue!47039 () ValueCell!14361)

(assert (=> mapNonEmpty!47039 (= (arr!37185 _values!996) (store mapRest!47039 mapKey!47039 mapValue!47039))))

(declare-fun b!1192032 () Bool)

(declare-fun res!792941 () Bool)

(declare-fun e!677573 () Bool)

(assert (=> b!1192032 (=> (not res!792941) (not e!677573))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1192032 (= res!792941 (validMask!0 mask!1564))))

(declare-fun b!1192033 () Bool)

(declare-fun res!792933 () Bool)

(assert (=> b!1192033 (=> (not res!792933) (not e!677573))))

(declare-datatypes ((array!77073 0))(
  ( (array!77074 (arr!37186 (Array (_ BitVec 32) (_ BitVec 64))) (size!37722 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77073)

(declare-datatypes ((List!26188 0))(
  ( (Nil!26185) (Cons!26184 (h!27393 (_ BitVec 64)) (t!38791 List!26188)) )
))
(declare-fun arrayNoDuplicates!0 (array!77073 (_ BitVec 32) List!26188) Bool)

(assert (=> b!1192033 (= res!792933 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26185))))

(declare-fun b!1192034 () Bool)

(declare-fun tp_is_empty!30141 () Bool)

(assert (=> b!1192034 (= e!677577 tp_is_empty!30141)))

(declare-fun b!1192035 () Bool)

(declare-fun e!677571 () Bool)

(assert (=> b!1192035 (= e!677571 tp_is_empty!30141)))

(declare-fun mapIsEmpty!47039 () Bool)

(assert (=> mapIsEmpty!47039 mapRes!47039))

(declare-fun b!1192036 () Bool)

(declare-fun e!677578 () Bool)

(assert (=> b!1192036 (= e!677578 true)))

(declare-fun zeroValue!944 () V!45315)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!542063 () array!77073)

(declare-fun minValue!944 () V!45315)

(declare-fun lt!542061 () array!77071)

(declare-datatypes ((tuple2!19444 0))(
  ( (tuple2!19445 (_1!9733 (_ BitVec 64)) (_2!9733 V!45315)) )
))
(declare-datatypes ((List!26189 0))(
  ( (Nil!26186) (Cons!26185 (h!27394 tuple2!19444) (t!38792 List!26189)) )
))
(declare-datatypes ((ListLongMap!17413 0))(
  ( (ListLongMap!17414 (toList!8722 List!26189)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5163 (array!77073 array!77071 (_ BitVec 32) (_ BitVec 32) V!45315 V!45315 (_ BitVec 32) Int) ListLongMap!17413)

(declare-fun -!1747 (ListLongMap!17413 (_ BitVec 64)) ListLongMap!17413)

(assert (=> b!1192036 (= (getCurrentListMapNoExtraKeys!5163 lt!542063 lt!542061 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1747 (getCurrentListMapNoExtraKeys!5163 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!39544 0))(
  ( (Unit!39545) )
))
(declare-fun lt!542064 () Unit!39544)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!956 (array!77073 array!77071 (_ BitVec 32) (_ BitVec 32) V!45315 V!45315 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39544)

(assert (=> b!1192036 (= lt!542064 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!956 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1192037 () Bool)

(declare-fun res!792936 () Bool)

(declare-fun e!677572 () Bool)

(assert (=> b!1192037 (=> (not res!792936) (not e!677572))))

(assert (=> b!1192037 (= res!792936 (arrayNoDuplicates!0 lt!542063 #b00000000000000000000000000000000 Nil!26185))))

(declare-fun b!1192038 () Bool)

(declare-fun e!677575 () Bool)

(assert (=> b!1192038 (= e!677572 (not e!677575))))

(declare-fun res!792934 () Bool)

(assert (=> b!1192038 (=> res!792934 e!677575)))

(assert (=> b!1192038 (= res!792934 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77073 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1192038 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!542059 () Unit!39544)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77073 (_ BitVec 64) (_ BitVec 32)) Unit!39544)

(assert (=> b!1192038 (= lt!542059 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1192040 () Bool)

(declare-fun res!792937 () Bool)

(assert (=> b!1192040 (=> (not res!792937) (not e!677573))))

(assert (=> b!1192040 (= res!792937 (and (= (size!37721 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37722 _keys!1208) (size!37721 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1192041 () Bool)

(declare-fun res!792942 () Bool)

(assert (=> b!1192041 (=> (not res!792942) (not e!677573))))

(assert (=> b!1192041 (= res!792942 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37722 _keys!1208))))))

(declare-fun b!1192042 () Bool)

(declare-fun res!792935 () Bool)

(assert (=> b!1192042 (=> (not res!792935) (not e!677573))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77073 (_ BitVec 32)) Bool)

(assert (=> b!1192042 (= res!792935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!792932 () Bool)

(assert (=> start!100032 (=> (not res!792932) (not e!677573))))

(assert (=> start!100032 (= res!792932 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37722 _keys!1208))))))

(assert (=> start!100032 e!677573))

(assert (=> start!100032 tp_is_empty!30141))

(declare-fun array_inv!28356 (array!77073) Bool)

(assert (=> start!100032 (array_inv!28356 _keys!1208)))

(assert (=> start!100032 true))

(assert (=> start!100032 tp!89546))

(declare-fun e!677574 () Bool)

(declare-fun array_inv!28357 (array!77071) Bool)

(assert (=> start!100032 (and (array_inv!28357 _values!996) e!677574)))

(declare-fun b!1192039 () Bool)

(assert (=> b!1192039 (= e!677573 e!677572)))

(declare-fun res!792940 () Bool)

(assert (=> b!1192039 (=> (not res!792940) (not e!677572))))

(assert (=> b!1192039 (= res!792940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542063 mask!1564))))

(assert (=> b!1192039 (= lt!542063 (array!77074 (store (arr!37186 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37722 _keys!1208)))))

(declare-fun b!1192043 () Bool)

(declare-fun res!792943 () Bool)

(assert (=> b!1192043 (=> (not res!792943) (not e!677573))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1192043 (= res!792943 (validKeyInArray!0 k0!934))))

(declare-fun b!1192044 () Bool)

(assert (=> b!1192044 (= e!677574 (and e!677571 mapRes!47039))))

(declare-fun condMapEmpty!47039 () Bool)

(declare-fun mapDefault!47039 () ValueCell!14361)

(assert (=> b!1192044 (= condMapEmpty!47039 (= (arr!37185 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14361)) mapDefault!47039)))))

(declare-fun b!1192045 () Bool)

(declare-fun res!792938 () Bool)

(assert (=> b!1192045 (=> (not res!792938) (not e!677573))))

(assert (=> b!1192045 (= res!792938 (= (select (arr!37186 _keys!1208) i!673) k0!934))))

(declare-fun b!1192046 () Bool)

(assert (=> b!1192046 (= e!677575 e!677578)))

(declare-fun res!792939 () Bool)

(assert (=> b!1192046 (=> res!792939 e!677578)))

(assert (=> b!1192046 (= res!792939 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!542062 () ListLongMap!17413)

(assert (=> b!1192046 (= lt!542062 (getCurrentListMapNoExtraKeys!5163 lt!542063 lt!542061 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3096 (Int (_ BitVec 64)) V!45315)

(assert (=> b!1192046 (= lt!542061 (array!77072 (store (arr!37185 _values!996) i!673 (ValueCellFull!14361 (dynLambda!3096 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37721 _values!996)))))

(declare-fun lt!542060 () ListLongMap!17413)

(assert (=> b!1192046 (= lt!542060 (getCurrentListMapNoExtraKeys!5163 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!100032 res!792932) b!1192032))

(assert (= (and b!1192032 res!792941) b!1192040))

(assert (= (and b!1192040 res!792937) b!1192042))

(assert (= (and b!1192042 res!792935) b!1192033))

(assert (= (and b!1192033 res!792933) b!1192041))

(assert (= (and b!1192041 res!792942) b!1192043))

(assert (= (and b!1192043 res!792943) b!1192045))

(assert (= (and b!1192045 res!792938) b!1192039))

(assert (= (and b!1192039 res!792940) b!1192037))

(assert (= (and b!1192037 res!792936) b!1192038))

(assert (= (and b!1192038 (not res!792934)) b!1192046))

(assert (= (and b!1192046 (not res!792939)) b!1192036))

(assert (= (and b!1192044 condMapEmpty!47039) mapIsEmpty!47039))

(assert (= (and b!1192044 (not condMapEmpty!47039)) mapNonEmpty!47039))

(get-info :version)

(assert (= (and mapNonEmpty!47039 ((_ is ValueCellFull!14361) mapValue!47039)) b!1192034))

(assert (= (and b!1192044 ((_ is ValueCellFull!14361) mapDefault!47039)) b!1192035))

(assert (= start!100032 b!1192044))

(declare-fun b_lambda!20755 () Bool)

(assert (=> (not b_lambda!20755) (not b!1192046)))

(declare-fun t!38790 () Bool)

(declare-fun tb!10423 () Bool)

(assert (=> (and start!100032 (= defaultEntry!1004 defaultEntry!1004) t!38790) tb!10423))

(declare-fun result!21413 () Bool)

(assert (=> tb!10423 (= result!21413 tp_is_empty!30141)))

(assert (=> b!1192046 t!38790))

(declare-fun b_and!42091 () Bool)

(assert (= b_and!42089 (and (=> t!38790 result!21413) b_and!42091)))

(declare-fun m!1100433 () Bool)

(assert (=> b!1192032 m!1100433))

(declare-fun m!1100435 () Bool)

(assert (=> b!1192033 m!1100435))

(declare-fun m!1100437 () Bool)

(assert (=> b!1192043 m!1100437))

(declare-fun m!1100439 () Bool)

(assert (=> b!1192045 m!1100439))

(declare-fun m!1100441 () Bool)

(assert (=> b!1192042 m!1100441))

(declare-fun m!1100443 () Bool)

(assert (=> b!1192038 m!1100443))

(declare-fun m!1100445 () Bool)

(assert (=> b!1192038 m!1100445))

(declare-fun m!1100447 () Bool)

(assert (=> mapNonEmpty!47039 m!1100447))

(declare-fun m!1100449 () Bool)

(assert (=> start!100032 m!1100449))

(declare-fun m!1100451 () Bool)

(assert (=> start!100032 m!1100451))

(declare-fun m!1100453 () Bool)

(assert (=> b!1192039 m!1100453))

(declare-fun m!1100455 () Bool)

(assert (=> b!1192039 m!1100455))

(declare-fun m!1100457 () Bool)

(assert (=> b!1192046 m!1100457))

(declare-fun m!1100459 () Bool)

(assert (=> b!1192046 m!1100459))

(declare-fun m!1100461 () Bool)

(assert (=> b!1192046 m!1100461))

(declare-fun m!1100463 () Bool)

(assert (=> b!1192046 m!1100463))

(declare-fun m!1100465 () Bool)

(assert (=> b!1192036 m!1100465))

(declare-fun m!1100467 () Bool)

(assert (=> b!1192036 m!1100467))

(assert (=> b!1192036 m!1100467))

(declare-fun m!1100469 () Bool)

(assert (=> b!1192036 m!1100469))

(declare-fun m!1100471 () Bool)

(assert (=> b!1192036 m!1100471))

(declare-fun m!1100473 () Bool)

(assert (=> b!1192037 m!1100473))

(check-sat (not b_lambda!20755) (not b!1192032) (not mapNonEmpty!47039) b_and!42091 (not b!1192033) (not b!1192038) (not b!1192046) (not b!1192043) (not start!100032) tp_is_empty!30141 (not b!1192042) (not b!1192037) (not b_next!25611) (not b!1192039) (not b!1192036))
(check-sat b_and!42091 (not b_next!25611))
