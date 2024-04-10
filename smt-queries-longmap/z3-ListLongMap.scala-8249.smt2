; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100444 () Bool)

(assert start!100444)

(declare-fun b_free!25767 () Bool)

(declare-fun b_next!25767 () Bool)

(assert (=> start!100444 (= b_free!25767 (not b_next!25767))))

(declare-fun tp!90291 () Bool)

(declare-fun b_and!42421 () Bool)

(assert (=> start!100444 (= tp!90291 b_and!42421)))

(declare-fun b!1199276 () Bool)

(declare-fun res!798242 () Bool)

(declare-fun e!681168 () Bool)

(assert (=> b!1199276 (=> (not res!798242) (not e!681168))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1199276 (= res!798242 (validMask!0 mask!1564))))

(declare-fun b!1199277 () Bool)

(declare-fun e!681170 () Bool)

(declare-fun e!681169 () Bool)

(assert (=> b!1199277 (= e!681170 (not e!681169))))

(declare-fun res!798233 () Bool)

(assert (=> b!1199277 (=> res!798233 e!681169)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1199277 (= res!798233 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!77719 0))(
  ( (array!77720 (arr!37504 (Array (_ BitVec 32) (_ BitVec 64))) (size!38040 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77719)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77719 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1199277 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39762 0))(
  ( (Unit!39763) )
))
(declare-fun lt!543727 () Unit!39762)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77719 (_ BitVec 64) (_ BitVec 32)) Unit!39762)

(assert (=> b!1199277 (= lt!543727 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1199278 () Bool)

(declare-fun e!681166 () Bool)

(declare-fun tp_is_empty!30471 () Bool)

(assert (=> b!1199278 (= e!681166 tp_is_empty!30471)))

(declare-fun b!1199279 () Bool)

(declare-fun e!681167 () Bool)

(assert (=> b!1199279 (= e!681167 tp_is_empty!30471)))

(declare-fun b!1199280 () Bool)

(assert (=> b!1199280 (= e!681169 true)))

(declare-datatypes ((V!45755 0))(
  ( (V!45756 (val!15292 Int)) )
))
(declare-fun zeroValue!944 () V!45755)

(declare-fun lt!543726 () array!77719)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!19574 0))(
  ( (tuple2!19575 (_1!9798 (_ BitVec 64)) (_2!9798 V!45755)) )
))
(declare-datatypes ((List!26390 0))(
  ( (Nil!26387) (Cons!26386 (h!27595 tuple2!19574) (t!39137 List!26390)) )
))
(declare-datatypes ((ListLongMap!17543 0))(
  ( (ListLongMap!17544 (toList!8787 List!26390)) )
))
(declare-fun lt!543725 () ListLongMap!17543)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14526 0))(
  ( (ValueCellFull!14526 (v!17930 V!45755)) (EmptyCell!14526) )
))
(declare-datatypes ((array!77721 0))(
  ( (array!77722 (arr!37505 (Array (_ BitVec 32) ValueCell!14526)) (size!38041 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77721)

(declare-fun minValue!944 () V!45755)

(declare-fun getCurrentListMapNoExtraKeys!5226 (array!77719 array!77721 (_ BitVec 32) (_ BitVec 32) V!45755 V!45755 (_ BitVec 32) Int) ListLongMap!17543)

(declare-fun dynLambda!3146 (Int (_ BitVec 64)) V!45755)

(assert (=> b!1199280 (= lt!543725 (getCurrentListMapNoExtraKeys!5226 lt!543726 (array!77722 (store (arr!37505 _values!996) i!673 (ValueCellFull!14526 (dynLambda!3146 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38041 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!543724 () ListLongMap!17543)

(assert (=> b!1199280 (= lt!543724 (getCurrentListMapNoExtraKeys!5226 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1199281 () Bool)

(declare-fun res!798234 () Bool)

(assert (=> b!1199281 (=> (not res!798234) (not e!681168))))

(assert (=> b!1199281 (= res!798234 (= (select (arr!37504 _keys!1208) i!673) k0!934))))

(declare-fun b!1199282 () Bool)

(declare-fun res!798239 () Bool)

(assert (=> b!1199282 (=> (not res!798239) (not e!681168))))

(assert (=> b!1199282 (= res!798239 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38040 _keys!1208))))))

(declare-fun b!1199283 () Bool)

(declare-fun res!798236 () Bool)

(assert (=> b!1199283 (=> (not res!798236) (not e!681168))))

(declare-datatypes ((List!26391 0))(
  ( (Nil!26388) (Cons!26387 (h!27596 (_ BitVec 64)) (t!39138 List!26391)) )
))
(declare-fun arrayNoDuplicates!0 (array!77719 (_ BitVec 32) List!26391) Bool)

(assert (=> b!1199283 (= res!798236 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26388))))

(declare-fun b!1199284 () Bool)

(declare-fun res!798235 () Bool)

(assert (=> b!1199284 (=> (not res!798235) (not e!681168))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1199284 (= res!798235 (validKeyInArray!0 k0!934))))

(declare-fun res!798241 () Bool)

(assert (=> start!100444 (=> (not res!798241) (not e!681168))))

(assert (=> start!100444 (= res!798241 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38040 _keys!1208))))))

(assert (=> start!100444 e!681168))

(assert (=> start!100444 tp_is_empty!30471))

(declare-fun array_inv!28578 (array!77719) Bool)

(assert (=> start!100444 (array_inv!28578 _keys!1208)))

(assert (=> start!100444 true))

(assert (=> start!100444 tp!90291))

(declare-fun e!681171 () Bool)

(declare-fun array_inv!28579 (array!77721) Bool)

(assert (=> start!100444 (and (array_inv!28579 _values!996) e!681171)))

(declare-fun b!1199285 () Bool)

(declare-fun res!798240 () Bool)

(assert (=> b!1199285 (=> (not res!798240) (not e!681170))))

(assert (=> b!1199285 (= res!798240 (arrayNoDuplicates!0 lt!543726 #b00000000000000000000000000000000 Nil!26388))))

(declare-fun b!1199286 () Bool)

(declare-fun res!798243 () Bool)

(assert (=> b!1199286 (=> (not res!798243) (not e!681168))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77719 (_ BitVec 32)) Bool)

(assert (=> b!1199286 (= res!798243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!47549 () Bool)

(declare-fun mapRes!47549 () Bool)

(declare-fun tp!90290 () Bool)

(assert (=> mapNonEmpty!47549 (= mapRes!47549 (and tp!90290 e!681167))))

(declare-fun mapKey!47549 () (_ BitVec 32))

(declare-fun mapValue!47549 () ValueCell!14526)

(declare-fun mapRest!47549 () (Array (_ BitVec 32) ValueCell!14526))

(assert (=> mapNonEmpty!47549 (= (arr!37505 _values!996) (store mapRest!47549 mapKey!47549 mapValue!47549))))

(declare-fun b!1199287 () Bool)

(assert (=> b!1199287 (= e!681168 e!681170)))

(declare-fun res!798237 () Bool)

(assert (=> b!1199287 (=> (not res!798237) (not e!681170))))

(assert (=> b!1199287 (= res!798237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543726 mask!1564))))

(assert (=> b!1199287 (= lt!543726 (array!77720 (store (arr!37504 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38040 _keys!1208)))))

(declare-fun b!1199288 () Bool)

(assert (=> b!1199288 (= e!681171 (and e!681166 mapRes!47549))))

(declare-fun condMapEmpty!47549 () Bool)

(declare-fun mapDefault!47549 () ValueCell!14526)

(assert (=> b!1199288 (= condMapEmpty!47549 (= (arr!37505 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14526)) mapDefault!47549)))))

(declare-fun mapIsEmpty!47549 () Bool)

(assert (=> mapIsEmpty!47549 mapRes!47549))

(declare-fun b!1199289 () Bool)

(declare-fun res!798238 () Bool)

(assert (=> b!1199289 (=> (not res!798238) (not e!681168))))

(assert (=> b!1199289 (= res!798238 (and (= (size!38041 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38040 _keys!1208) (size!38041 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!100444 res!798241) b!1199276))

(assert (= (and b!1199276 res!798242) b!1199289))

(assert (= (and b!1199289 res!798238) b!1199286))

(assert (= (and b!1199286 res!798243) b!1199283))

(assert (= (and b!1199283 res!798236) b!1199282))

(assert (= (and b!1199282 res!798239) b!1199284))

(assert (= (and b!1199284 res!798235) b!1199281))

(assert (= (and b!1199281 res!798234) b!1199287))

(assert (= (and b!1199287 res!798237) b!1199285))

(assert (= (and b!1199285 res!798240) b!1199277))

(assert (= (and b!1199277 (not res!798233)) b!1199280))

(assert (= (and b!1199288 condMapEmpty!47549) mapIsEmpty!47549))

(assert (= (and b!1199288 (not condMapEmpty!47549)) mapNonEmpty!47549))

(get-info :version)

(assert (= (and mapNonEmpty!47549 ((_ is ValueCellFull!14526) mapValue!47549)) b!1199279))

(assert (= (and b!1199288 ((_ is ValueCellFull!14526) mapDefault!47549)) b!1199278))

(assert (= start!100444 b!1199288))

(declare-fun b_lambda!20963 () Bool)

(assert (=> (not b_lambda!20963) (not b!1199280)))

(declare-fun t!39136 () Bool)

(declare-fun tb!10567 () Bool)

(assert (=> (and start!100444 (= defaultEntry!1004 defaultEntry!1004) t!39136) tb!10567))

(declare-fun result!21711 () Bool)

(assert (=> tb!10567 (= result!21711 tp_is_empty!30471)))

(assert (=> b!1199280 t!39136))

(declare-fun b_and!42423 () Bool)

(assert (= b_and!42421 (and (=> t!39136 result!21711) b_and!42423)))

(declare-fun m!1105851 () Bool)

(assert (=> start!100444 m!1105851))

(declare-fun m!1105853 () Bool)

(assert (=> start!100444 m!1105853))

(declare-fun m!1105855 () Bool)

(assert (=> b!1199286 m!1105855))

(declare-fun m!1105857 () Bool)

(assert (=> b!1199284 m!1105857))

(declare-fun m!1105859 () Bool)

(assert (=> b!1199280 m!1105859))

(declare-fun m!1105861 () Bool)

(assert (=> b!1199280 m!1105861))

(declare-fun m!1105863 () Bool)

(assert (=> b!1199280 m!1105863))

(declare-fun m!1105865 () Bool)

(assert (=> b!1199280 m!1105865))

(declare-fun m!1105867 () Bool)

(assert (=> b!1199287 m!1105867))

(declare-fun m!1105869 () Bool)

(assert (=> b!1199287 m!1105869))

(declare-fun m!1105871 () Bool)

(assert (=> b!1199283 m!1105871))

(declare-fun m!1105873 () Bool)

(assert (=> mapNonEmpty!47549 m!1105873))

(declare-fun m!1105875 () Bool)

(assert (=> b!1199281 m!1105875))

(declare-fun m!1105877 () Bool)

(assert (=> b!1199285 m!1105877))

(declare-fun m!1105879 () Bool)

(assert (=> b!1199277 m!1105879))

(declare-fun m!1105881 () Bool)

(assert (=> b!1199277 m!1105881))

(declare-fun m!1105883 () Bool)

(assert (=> b!1199276 m!1105883))

(check-sat tp_is_empty!30471 (not b!1199284) (not mapNonEmpty!47549) b_and!42423 (not b!1199277) (not b!1199283) (not b!1199285) (not start!100444) (not b!1199287) (not b!1199286) (not b!1199276) (not b_next!25767) (not b_lambda!20963) (not b!1199280))
(check-sat b_and!42423 (not b_next!25767))
