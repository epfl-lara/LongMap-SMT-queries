; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100714 () Bool)

(assert start!100714)

(declare-fun b_free!25801 () Bool)

(declare-fun b_next!25801 () Bool)

(assert (=> start!100714 (= b_free!25801 (not b_next!25801))))

(declare-fun tp!90392 () Bool)

(declare-fun b_and!42491 () Bool)

(assert (=> start!100714 (= tp!90392 b_and!42491)))

(declare-fun b!1201313 () Bool)

(declare-fun e!682357 () Bool)

(declare-fun tp_is_empty!30505 () Bool)

(assert (=> b!1201313 (= e!682357 tp_is_empty!30505)))

(declare-fun b!1201314 () Bool)

(declare-fun res!799311 () Bool)

(declare-fun e!682356 () Bool)

(assert (=> b!1201314 (=> (not res!799311) (not e!682356))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!77821 0))(
  ( (array!77822 (arr!37549 (Array (_ BitVec 32) (_ BitVec 64))) (size!38086 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77821)

(assert (=> b!1201314 (= res!799311 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38086 _keys!1208))))))

(declare-fun mapNonEmpty!47600 () Bool)

(declare-fun mapRes!47600 () Bool)

(declare-fun tp!90393 () Bool)

(declare-fun e!682359 () Bool)

(assert (=> mapNonEmpty!47600 (= mapRes!47600 (and tp!90393 e!682359))))

(declare-datatypes ((V!45801 0))(
  ( (V!45802 (val!15309 Int)) )
))
(declare-datatypes ((ValueCell!14543 0))(
  ( (ValueCellFull!14543 (v!17943 V!45801)) (EmptyCell!14543) )
))
(declare-fun mapRest!47600 () (Array (_ BitVec 32) ValueCell!14543))

(declare-fun mapValue!47600 () ValueCell!14543)

(declare-fun mapKey!47600 () (_ BitVec 32))

(declare-datatypes ((array!77823 0))(
  ( (array!77824 (arr!37550 (Array (_ BitVec 32) ValueCell!14543)) (size!38087 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77823)

(assert (=> mapNonEmpty!47600 (= (arr!37550 _values!996) (store mapRest!47600 mapKey!47600 mapValue!47600))))

(declare-fun b!1201315 () Bool)

(declare-fun e!682360 () Bool)

(declare-fun e!682358 () Bool)

(assert (=> b!1201315 (= e!682360 (not e!682358))))

(declare-fun res!799305 () Bool)

(assert (=> b!1201315 (=> res!799305 e!682358)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1201315 (= res!799305 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77821 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1201315 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39751 0))(
  ( (Unit!39752) )
))
(declare-fun lt!544415 () Unit!39751)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77821 (_ BitVec 64) (_ BitVec 32)) Unit!39751)

(assert (=> b!1201315 (= lt!544415 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!799303 () Bool)

(assert (=> start!100714 (=> (not res!799303) (not e!682356))))

(assert (=> start!100714 (= res!799303 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38086 _keys!1208))))))

(assert (=> start!100714 e!682356))

(assert (=> start!100714 tp_is_empty!30505))

(declare-fun array_inv!28684 (array!77821) Bool)

(assert (=> start!100714 (array_inv!28684 _keys!1208)))

(assert (=> start!100714 true))

(assert (=> start!100714 tp!90392))

(declare-fun e!682361 () Bool)

(declare-fun array_inv!28685 (array!77823) Bool)

(assert (=> start!100714 (and (array_inv!28685 _values!996) e!682361)))

(declare-fun b!1201316 () Bool)

(declare-fun res!799302 () Bool)

(assert (=> b!1201316 (=> (not res!799302) (not e!682356))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77821 (_ BitVec 32)) Bool)

(assert (=> b!1201316 (= res!799302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1201317 () Bool)

(declare-fun res!799310 () Bool)

(assert (=> b!1201317 (=> (not res!799310) (not e!682356))))

(declare-datatypes ((List!26431 0))(
  ( (Nil!26428) (Cons!26427 (h!27645 (_ BitVec 64)) (t!39204 List!26431)) )
))
(declare-fun arrayNoDuplicates!0 (array!77821 (_ BitVec 32) List!26431) Bool)

(assert (=> b!1201317 (= res!799310 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26428))))

(declare-fun b!1201318 () Bool)

(declare-fun res!799309 () Bool)

(assert (=> b!1201318 (=> (not res!799309) (not e!682356))))

(assert (=> b!1201318 (= res!799309 (= (select (arr!37549 _keys!1208) i!673) k0!934))))

(declare-fun b!1201319 () Bool)

(assert (=> b!1201319 (= e!682361 (and e!682357 mapRes!47600))))

(declare-fun condMapEmpty!47600 () Bool)

(declare-fun mapDefault!47600 () ValueCell!14543)

(assert (=> b!1201319 (= condMapEmpty!47600 (= (arr!37550 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14543)) mapDefault!47600)))))

(declare-fun b!1201320 () Bool)

(assert (=> b!1201320 (= e!682356 e!682360)))

(declare-fun res!799308 () Bool)

(assert (=> b!1201320 (=> (not res!799308) (not e!682360))))

(declare-fun lt!544413 () array!77821)

(assert (=> b!1201320 (= res!799308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544413 mask!1564))))

(assert (=> b!1201320 (= lt!544413 (array!77822 (store (arr!37549 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38086 _keys!1208)))))

(declare-fun b!1201321 () Bool)

(declare-fun res!799304 () Bool)

(assert (=> b!1201321 (=> (not res!799304) (not e!682360))))

(assert (=> b!1201321 (= res!799304 (arrayNoDuplicates!0 lt!544413 #b00000000000000000000000000000000 Nil!26428))))

(declare-fun b!1201322 () Bool)

(declare-fun res!799312 () Bool)

(assert (=> b!1201322 (=> (not res!799312) (not e!682356))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1201322 (= res!799312 (and (= (size!38087 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38086 _keys!1208) (size!38087 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1201323 () Bool)

(declare-fun res!799307 () Bool)

(assert (=> b!1201323 (=> (not res!799307) (not e!682356))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1201323 (= res!799307 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!47600 () Bool)

(assert (=> mapIsEmpty!47600 mapRes!47600))

(declare-fun b!1201324 () Bool)

(assert (=> b!1201324 (= e!682359 tp_is_empty!30505)))

(declare-fun b!1201325 () Bool)

(assert (=> b!1201325 (= e!682358 true)))

(declare-fun zeroValue!944 () V!45801)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45801)

(declare-datatypes ((tuple2!19612 0))(
  ( (tuple2!19613 (_1!9817 (_ BitVec 64)) (_2!9817 V!45801)) )
))
(declare-datatypes ((List!26432 0))(
  ( (Nil!26429) (Cons!26428 (h!27646 tuple2!19612) (t!39205 List!26432)) )
))
(declare-datatypes ((ListLongMap!17589 0))(
  ( (ListLongMap!17590 (toList!8810 List!26432)) )
))
(declare-fun lt!544414 () ListLongMap!17589)

(declare-fun getCurrentListMapNoExtraKeys!5277 (array!77821 array!77823 (_ BitVec 32) (_ BitVec 32) V!45801 V!45801 (_ BitVec 32) Int) ListLongMap!17589)

(declare-fun dynLambda!3221 (Int (_ BitVec 64)) V!45801)

(assert (=> b!1201325 (= lt!544414 (getCurrentListMapNoExtraKeys!5277 lt!544413 (array!77824 (store (arr!37550 _values!996) i!673 (ValueCellFull!14543 (dynLambda!3221 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38087 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!544412 () ListLongMap!17589)

(assert (=> b!1201325 (= lt!544412 (getCurrentListMapNoExtraKeys!5277 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1201326 () Bool)

(declare-fun res!799306 () Bool)

(assert (=> b!1201326 (=> (not res!799306) (not e!682356))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1201326 (= res!799306 (validKeyInArray!0 k0!934))))

(assert (= (and start!100714 res!799303) b!1201323))

(assert (= (and b!1201323 res!799307) b!1201322))

(assert (= (and b!1201322 res!799312) b!1201316))

(assert (= (and b!1201316 res!799302) b!1201317))

(assert (= (and b!1201317 res!799310) b!1201314))

(assert (= (and b!1201314 res!799311) b!1201326))

(assert (= (and b!1201326 res!799306) b!1201318))

(assert (= (and b!1201318 res!799309) b!1201320))

(assert (= (and b!1201320 res!799308) b!1201321))

(assert (= (and b!1201321 res!799304) b!1201315))

(assert (= (and b!1201315 (not res!799305)) b!1201325))

(assert (= (and b!1201319 condMapEmpty!47600) mapIsEmpty!47600))

(assert (= (and b!1201319 (not condMapEmpty!47600)) mapNonEmpty!47600))

(get-info :version)

(assert (= (and mapNonEmpty!47600 ((_ is ValueCellFull!14543) mapValue!47600)) b!1201324))

(assert (= (and b!1201319 ((_ is ValueCellFull!14543) mapDefault!47600)) b!1201313))

(assert (= start!100714 b!1201319))

(declare-fun b_lambda!20991 () Bool)

(assert (=> (not b_lambda!20991) (not b!1201325)))

(declare-fun t!39203 () Bool)

(declare-fun tb!10593 () Bool)

(assert (=> (and start!100714 (= defaultEntry!1004 defaultEntry!1004) t!39203) tb!10593))

(declare-fun result!21771 () Bool)

(assert (=> tb!10593 (= result!21771 tp_is_empty!30505)))

(assert (=> b!1201325 t!39203))

(declare-fun b_and!42493 () Bool)

(assert (= b_and!42491 (and (=> t!39203 result!21771) b_and!42493)))

(declare-fun m!1108001 () Bool)

(assert (=> mapNonEmpty!47600 m!1108001))

(declare-fun m!1108003 () Bool)

(assert (=> b!1201317 m!1108003))

(declare-fun m!1108005 () Bool)

(assert (=> b!1201326 m!1108005))

(declare-fun m!1108007 () Bool)

(assert (=> b!1201320 m!1108007))

(declare-fun m!1108009 () Bool)

(assert (=> b!1201320 m!1108009))

(declare-fun m!1108011 () Bool)

(assert (=> b!1201315 m!1108011))

(declare-fun m!1108013 () Bool)

(assert (=> b!1201315 m!1108013))

(declare-fun m!1108015 () Bool)

(assert (=> b!1201318 m!1108015))

(declare-fun m!1108017 () Bool)

(assert (=> b!1201316 m!1108017))

(declare-fun m!1108019 () Bool)

(assert (=> b!1201321 m!1108019))

(declare-fun m!1108021 () Bool)

(assert (=> start!100714 m!1108021))

(declare-fun m!1108023 () Bool)

(assert (=> start!100714 m!1108023))

(declare-fun m!1108025 () Bool)

(assert (=> b!1201325 m!1108025))

(declare-fun m!1108027 () Bool)

(assert (=> b!1201325 m!1108027))

(declare-fun m!1108029 () Bool)

(assert (=> b!1201325 m!1108029))

(declare-fun m!1108031 () Bool)

(assert (=> b!1201325 m!1108031))

(declare-fun m!1108033 () Bool)

(assert (=> b!1201323 m!1108033))

(check-sat (not b!1201321) b_and!42493 (not start!100714) (not b!1201325) (not b!1201323) (not b!1201315) (not b!1201320) tp_is_empty!30505 (not mapNonEmpty!47600) (not b!1201317) (not b!1201316) (not b_lambda!20991) (not b_next!25801) (not b!1201326))
(check-sat b_and!42493 (not b_next!25801))
