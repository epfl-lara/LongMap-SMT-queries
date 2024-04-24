; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101604 () Bool)

(assert start!101604)

(declare-fun b_free!26239 () Bool)

(declare-fun b_next!26239 () Bool)

(assert (=> start!101604 (= b_free!26239 (not b_next!26239))))

(declare-fun tp!91744 () Bool)

(declare-fun b_and!43633 () Bool)

(assert (=> start!101604 (= tp!91744 b_and!43633)))

(declare-fun b!1219286 () Bool)

(declare-fun res!809390 () Bool)

(declare-fun e!692343 () Bool)

(assert (=> b!1219286 (=> (not res!809390) (not e!692343))))

(declare-datatypes ((array!78703 0))(
  ( (array!78704 (arr!37978 (Array (_ BitVec 32) (_ BitVec 64))) (size!38515 (_ BitVec 32))) )
))
(declare-fun lt!554138 () array!78703)

(declare-datatypes ((List!26794 0))(
  ( (Nil!26791) (Cons!26790 (h!28008 (_ BitVec 64)) (t!40005 List!26794)) )
))
(declare-fun arrayNoDuplicates!0 (array!78703 (_ BitVec 32) List!26794) Bool)

(assert (=> b!1219286 (= res!809390 (arrayNoDuplicates!0 lt!554138 #b00000000000000000000000000000000 Nil!26791))))

(declare-fun b!1219287 () Bool)

(declare-fun e!692350 () Bool)

(assert (=> b!1219287 (= e!692350 e!692343)))

(declare-fun res!809388 () Bool)

(assert (=> b!1219287 (=> (not res!809388) (not e!692343))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78703 (_ BitVec 32)) Bool)

(assert (=> b!1219287 (= res!809388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!554138 mask!1564))))

(declare-fun _keys!1208 () array!78703)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1219287 (= lt!554138 (array!78704 (store (arr!37978 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38515 _keys!1208)))))

(declare-fun b!1219288 () Bool)

(declare-fun res!809379 () Bool)

(assert (=> b!1219288 (=> (not res!809379) (not e!692350))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!46385 0))(
  ( (V!46386 (val!15528 Int)) )
))
(declare-datatypes ((ValueCell!14762 0))(
  ( (ValueCellFull!14762 (v!18179 V!46385)) (EmptyCell!14762) )
))
(declare-datatypes ((array!78705 0))(
  ( (array!78706 (arr!37979 (Array (_ BitVec 32) ValueCell!14762)) (size!38516 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78705)

(assert (=> b!1219288 (= res!809379 (and (= (size!38516 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38515 _keys!1208) (size!38516 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!48295 () Bool)

(declare-fun mapRes!48295 () Bool)

(assert (=> mapIsEmpty!48295 mapRes!48295))

(declare-fun b!1219289 () Bool)

(declare-fun res!809387 () Bool)

(assert (=> b!1219289 (=> (not res!809387) (not e!692350))))

(assert (=> b!1219289 (= res!809387 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38515 _keys!1208))))))

(declare-fun b!1219290 () Bool)

(declare-fun e!692344 () Bool)

(declare-fun tp_is_empty!30943 () Bool)

(assert (=> b!1219290 (= e!692344 tp_is_empty!30943)))

(declare-fun b!1219291 () Bool)

(declare-fun res!809389 () Bool)

(assert (=> b!1219291 (=> (not res!809389) (not e!692350))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1219291 (= res!809389 (= (select (arr!37978 _keys!1208) i!673) k0!934))))

(declare-fun res!809378 () Bool)

(assert (=> start!101604 (=> (not res!809378) (not e!692350))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!101604 (= res!809378 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38515 _keys!1208))))))

(assert (=> start!101604 e!692350))

(assert (=> start!101604 tp_is_empty!30943))

(declare-fun array_inv!28974 (array!78703) Bool)

(assert (=> start!101604 (array_inv!28974 _keys!1208)))

(assert (=> start!101604 true))

(assert (=> start!101604 tp!91744))

(declare-fun e!692342 () Bool)

(declare-fun array_inv!28975 (array!78705) Bool)

(assert (=> start!101604 (and (array_inv!28975 _values!996) e!692342)))

(declare-fun b!1219292 () Bool)

(declare-fun res!809386 () Bool)

(assert (=> b!1219292 (=> (not res!809386) (not e!692350))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1219292 (= res!809386 (validKeyInArray!0 k0!934))))

(declare-fun b!1219293 () Bool)

(declare-fun e!692348 () Bool)

(assert (=> b!1219293 (= e!692343 (not e!692348))))

(declare-fun res!809391 () Bool)

(assert (=> b!1219293 (=> res!809391 e!692348)))

(assert (=> b!1219293 (= res!809391 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78703 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1219293 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40350 0))(
  ( (Unit!40351) )
))
(declare-fun lt!554139 () Unit!40350)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78703 (_ BitVec 64) (_ BitVec 32)) Unit!40350)

(assert (=> b!1219293 (= lt!554139 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!48295 () Bool)

(declare-fun tp!91745 () Bool)

(assert (=> mapNonEmpty!48295 (= mapRes!48295 (and tp!91745 e!692344))))

(declare-fun mapValue!48295 () ValueCell!14762)

(declare-fun mapRest!48295 () (Array (_ BitVec 32) ValueCell!14762))

(declare-fun mapKey!48295 () (_ BitVec 32))

(assert (=> mapNonEmpty!48295 (= (arr!37979 _values!996) (store mapRest!48295 mapKey!48295 mapValue!48295))))

(declare-fun b!1219294 () Bool)

(declare-fun e!692341 () Bool)

(assert (=> b!1219294 (= e!692341 tp_is_empty!30943)))

(declare-fun b!1219295 () Bool)

(declare-fun res!809383 () Bool)

(assert (=> b!1219295 (=> (not res!809383) (not e!692350))))

(assert (=> b!1219295 (= res!809383 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26791))))

(declare-fun e!692345 () Bool)

(declare-fun b!1219296 () Bool)

(assert (=> b!1219296 (= e!692345 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1219297 () Bool)

(declare-fun res!809380 () Bool)

(assert (=> b!1219297 (=> (not res!809380) (not e!692350))))

(assert (=> b!1219297 (= res!809380 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1219298 () Bool)

(declare-fun e!692349 () Bool)

(assert (=> b!1219298 (= e!692348 e!692349)))

(declare-fun res!809381 () Bool)

(assert (=> b!1219298 (=> res!809381 e!692349)))

(assert (=> b!1219298 (= res!809381 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46385)

(declare-datatypes ((tuple2!19984 0))(
  ( (tuple2!19985 (_1!10003 (_ BitVec 64)) (_2!10003 V!46385)) )
))
(declare-datatypes ((List!26795 0))(
  ( (Nil!26792) (Cons!26791 (h!28009 tuple2!19984) (t!40006 List!26795)) )
))
(declare-datatypes ((ListLongMap!17961 0))(
  ( (ListLongMap!17962 (toList!8996 List!26795)) )
))
(declare-fun lt!554142 () ListLongMap!17961)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!554134 () array!78705)

(declare-fun minValue!944 () V!46385)

(declare-fun getCurrentListMapNoExtraKeys!5453 (array!78703 array!78705 (_ BitVec 32) (_ BitVec 32) V!46385 V!46385 (_ BitVec 32) Int) ListLongMap!17961)

(assert (=> b!1219298 (= lt!554142 (getCurrentListMapNoExtraKeys!5453 lt!554138 lt!554134 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!554141 () V!46385)

(assert (=> b!1219298 (= lt!554134 (array!78706 (store (arr!37979 _values!996) i!673 (ValueCellFull!14762 lt!554141)) (size!38516 _values!996)))))

(declare-fun dynLambda!3358 (Int (_ BitVec 64)) V!46385)

(assert (=> b!1219298 (= lt!554141 (dynLambda!3358 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!554137 () ListLongMap!17961)

(assert (=> b!1219298 (= lt!554137 (getCurrentListMapNoExtraKeys!5453 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1219299 () Bool)

(declare-fun e!692351 () Bool)

(assert (=> b!1219299 (= e!692349 e!692351)))

(declare-fun res!809382 () Bool)

(assert (=> b!1219299 (=> res!809382 e!692351)))

(assert (=> b!1219299 (= res!809382 (not (validKeyInArray!0 (select (arr!37978 _keys!1208) from!1455))))))

(declare-fun lt!554133 () ListLongMap!17961)

(declare-fun lt!554136 () ListLongMap!17961)

(assert (=> b!1219299 (= lt!554133 lt!554136)))

(declare-fun lt!554135 () ListLongMap!17961)

(declare-fun -!1887 (ListLongMap!17961 (_ BitVec 64)) ListLongMap!17961)

(assert (=> b!1219299 (= lt!554136 (-!1887 lt!554135 k0!934))))

(assert (=> b!1219299 (= lt!554133 (getCurrentListMapNoExtraKeys!5453 lt!554138 lt!554134 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1219299 (= lt!554135 (getCurrentListMapNoExtraKeys!5453 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!554140 () Unit!40350)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1102 (array!78703 array!78705 (_ BitVec 32) (_ BitVec 32) V!46385 V!46385 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40350)

(assert (=> b!1219299 (= lt!554140 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1102 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1219300 () Bool)

(declare-fun e!692347 () Bool)

(assert (=> b!1219300 (= e!692347 e!692345)))

(declare-fun res!809385 () Bool)

(assert (=> b!1219300 (=> res!809385 e!692345)))

(assert (=> b!1219300 (= res!809385 (not (= (select (arr!37978 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1219301 () Bool)

(declare-fun res!809392 () Bool)

(assert (=> b!1219301 (=> (not res!809392) (not e!692350))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1219301 (= res!809392 (validMask!0 mask!1564))))

(declare-fun b!1219302 () Bool)

(assert (=> b!1219302 (= e!692342 (and e!692341 mapRes!48295))))

(declare-fun condMapEmpty!48295 () Bool)

(declare-fun mapDefault!48295 () ValueCell!14762)

(assert (=> b!1219302 (= condMapEmpty!48295 (= (arr!37979 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14762)) mapDefault!48295)))))

(declare-fun b!1219303 () Bool)

(assert (=> b!1219303 (= e!692351 true)))

(assert (=> b!1219303 e!692347))

(declare-fun res!809384 () Bool)

(assert (=> b!1219303 (=> (not res!809384) (not e!692347))))

(declare-fun +!4108 (ListLongMap!17961 tuple2!19984) ListLongMap!17961)

(declare-fun get!19396 (ValueCell!14762 V!46385) V!46385)

(assert (=> b!1219303 (= res!809384 (= lt!554142 (+!4108 lt!554136 (tuple2!19985 (select (arr!37978 _keys!1208) from!1455) (get!19396 (select (arr!37979 _values!996) from!1455) lt!554141)))))))

(assert (= (and start!101604 res!809378) b!1219301))

(assert (= (and b!1219301 res!809392) b!1219288))

(assert (= (and b!1219288 res!809379) b!1219297))

(assert (= (and b!1219297 res!809380) b!1219295))

(assert (= (and b!1219295 res!809383) b!1219289))

(assert (= (and b!1219289 res!809387) b!1219292))

(assert (= (and b!1219292 res!809386) b!1219291))

(assert (= (and b!1219291 res!809389) b!1219287))

(assert (= (and b!1219287 res!809388) b!1219286))

(assert (= (and b!1219286 res!809390) b!1219293))

(assert (= (and b!1219293 (not res!809391)) b!1219298))

(assert (= (and b!1219298 (not res!809381)) b!1219299))

(assert (= (and b!1219299 (not res!809382)) b!1219303))

(assert (= (and b!1219303 res!809384) b!1219300))

(assert (= (and b!1219300 (not res!809385)) b!1219296))

(assert (= (and b!1219302 condMapEmpty!48295) mapIsEmpty!48295))

(assert (= (and b!1219302 (not condMapEmpty!48295)) mapNonEmpty!48295))

(get-info :version)

(assert (= (and mapNonEmpty!48295 ((_ is ValueCellFull!14762) mapValue!48295)) b!1219290))

(assert (= (and b!1219302 ((_ is ValueCellFull!14762) mapDefault!48295)) b!1219294))

(assert (= start!101604 b!1219302))

(declare-fun b_lambda!21985 () Bool)

(assert (=> (not b_lambda!21985) (not b!1219298)))

(declare-fun t!40004 () Bool)

(declare-fun tb!11031 () Bool)

(assert (=> (and start!101604 (= defaultEntry!1004 defaultEntry!1004) t!40004) tb!11031))

(declare-fun result!22671 () Bool)

(assert (=> tb!11031 (= result!22671 tp_is_empty!30943)))

(assert (=> b!1219298 t!40004))

(declare-fun b_and!43635 () Bool)

(assert (= b_and!43633 (and (=> t!40004 result!22671) b_and!43635)))

(declare-fun m!1124347 () Bool)

(assert (=> b!1219298 m!1124347))

(declare-fun m!1124349 () Bool)

(assert (=> b!1219298 m!1124349))

(declare-fun m!1124351 () Bool)

(assert (=> b!1219298 m!1124351))

(declare-fun m!1124353 () Bool)

(assert (=> b!1219298 m!1124353))

(declare-fun m!1124355 () Bool)

(assert (=> b!1219292 m!1124355))

(declare-fun m!1124357 () Bool)

(assert (=> b!1219293 m!1124357))

(declare-fun m!1124359 () Bool)

(assert (=> b!1219293 m!1124359))

(declare-fun m!1124361 () Bool)

(assert (=> b!1219297 m!1124361))

(declare-fun m!1124363 () Bool)

(assert (=> b!1219300 m!1124363))

(declare-fun m!1124365 () Bool)

(assert (=> b!1219295 m!1124365))

(declare-fun m!1124367 () Bool)

(assert (=> mapNonEmpty!48295 m!1124367))

(declare-fun m!1124369 () Bool)

(assert (=> start!101604 m!1124369))

(declare-fun m!1124371 () Bool)

(assert (=> start!101604 m!1124371))

(declare-fun m!1124373 () Bool)

(assert (=> b!1219301 m!1124373))

(declare-fun m!1124375 () Bool)

(assert (=> b!1219299 m!1124375))

(declare-fun m!1124377 () Bool)

(assert (=> b!1219299 m!1124377))

(declare-fun m!1124379 () Bool)

(assert (=> b!1219299 m!1124379))

(assert (=> b!1219299 m!1124363))

(declare-fun m!1124381 () Bool)

(assert (=> b!1219299 m!1124381))

(assert (=> b!1219299 m!1124363))

(declare-fun m!1124383 () Bool)

(assert (=> b!1219299 m!1124383))

(assert (=> b!1219303 m!1124363))

(declare-fun m!1124385 () Bool)

(assert (=> b!1219303 m!1124385))

(assert (=> b!1219303 m!1124385))

(declare-fun m!1124387 () Bool)

(assert (=> b!1219303 m!1124387))

(declare-fun m!1124389 () Bool)

(assert (=> b!1219303 m!1124389))

(declare-fun m!1124391 () Bool)

(assert (=> b!1219286 m!1124391))

(declare-fun m!1124393 () Bool)

(assert (=> b!1219291 m!1124393))

(declare-fun m!1124395 () Bool)

(assert (=> b!1219296 m!1124395))

(declare-fun m!1124397 () Bool)

(assert (=> b!1219287 m!1124397))

(declare-fun m!1124399 () Bool)

(assert (=> b!1219287 m!1124399))

(check-sat (not b!1219286) (not b_next!26239) (not b!1219301) tp_is_empty!30943 (not mapNonEmpty!48295) (not b!1219287) (not b!1219299) (not start!101604) (not b_lambda!21985) (not b!1219296) (not b!1219303) (not b!1219298) (not b!1219293) b_and!43635 (not b!1219292) (not b!1219297) (not b!1219295))
(check-sat b_and!43635 (not b_next!26239))
