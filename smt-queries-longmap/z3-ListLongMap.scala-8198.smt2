; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100048 () Bool)

(assert start!100048)

(declare-fun b_free!25633 () Bool)

(declare-fun b_next!25633 () Bool)

(assert (=> start!100048 (= b_free!25633 (not b_next!25633))))

(declare-fun tp!89612 () Bool)

(declare-fun b_and!42111 () Bool)

(assert (=> start!100048 (= tp!89612 b_and!42111)))

(declare-fun mapIsEmpty!47072 () Bool)

(declare-fun mapRes!47072 () Bool)

(assert (=> mapIsEmpty!47072 mapRes!47072))

(declare-fun b!1192425 () Bool)

(declare-fun res!793273 () Bool)

(declare-fun e!677764 () Bool)

(assert (=> b!1192425 (=> (not res!793273) (not e!677764))))

(declare-datatypes ((array!77044 0))(
  ( (array!77045 (arr!37172 (Array (_ BitVec 32) (_ BitVec 64))) (size!37710 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77044)

(declare-datatypes ((List!26284 0))(
  ( (Nil!26281) (Cons!26280 (h!27489 (_ BitVec 64)) (t!38900 List!26284)) )
))
(declare-fun arrayNoDuplicates!0 (array!77044 (_ BitVec 32) List!26284) Bool)

(assert (=> b!1192425 (= res!793273 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26281))))

(declare-fun b!1192426 () Bool)

(declare-fun e!677762 () Bool)

(declare-fun tp_is_empty!30163 () Bool)

(assert (=> b!1192426 (= e!677762 tp_is_empty!30163)))

(declare-fun b!1192427 () Bool)

(declare-fun res!793270 () Bool)

(assert (=> b!1192427 (=> (not res!793270) (not e!677764))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45345 0))(
  ( (V!45346 (val!15138 Int)) )
))
(declare-datatypes ((ValueCell!14372 0))(
  ( (ValueCellFull!14372 (v!17775 V!45345)) (EmptyCell!14372) )
))
(declare-datatypes ((array!77046 0))(
  ( (array!77047 (arr!37173 (Array (_ BitVec 32) ValueCell!14372)) (size!37711 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77046)

(assert (=> b!1192427 (= res!793270 (and (= (size!37711 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37710 _keys!1208) (size!37711 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1192428 () Bool)

(declare-fun res!793272 () Bool)

(assert (=> b!1192428 (=> (not res!793272) (not e!677764))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1192428 (= res!793272 (= (select (arr!37172 _keys!1208) i!673) k0!934))))

(declare-fun b!1192429 () Bool)

(declare-fun e!677763 () Bool)

(assert (=> b!1192429 (= e!677764 e!677763)))

(declare-fun res!793267 () Bool)

(assert (=> b!1192429 (=> (not res!793267) (not e!677763))))

(declare-fun lt!542068 () array!77044)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77044 (_ BitVec 32)) Bool)

(assert (=> b!1192429 (= res!793267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542068 mask!1564))))

(assert (=> b!1192429 (= lt!542068 (array!77045 (store (arr!37172 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37710 _keys!1208)))))

(declare-fun b!1192430 () Bool)

(declare-fun res!793268 () Bool)

(assert (=> b!1192430 (=> (not res!793268) (not e!677764))))

(assert (=> b!1192430 (= res!793268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1192431 () Bool)

(declare-fun res!793264 () Bool)

(assert (=> b!1192431 (=> (not res!793264) (not e!677763))))

(assert (=> b!1192431 (= res!793264 (arrayNoDuplicates!0 lt!542068 #b00000000000000000000000000000000 Nil!26281))))

(declare-fun b!1192432 () Bool)

(declare-fun e!677759 () Bool)

(assert (=> b!1192432 (= e!677759 (and e!677762 mapRes!47072))))

(declare-fun condMapEmpty!47072 () Bool)

(declare-fun mapDefault!47072 () ValueCell!14372)

(assert (=> b!1192432 (= condMapEmpty!47072 (= (arr!37173 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14372)) mapDefault!47072)))))

(declare-fun b!1192433 () Bool)

(declare-fun res!793269 () Bool)

(assert (=> b!1192433 (=> (not res!793269) (not e!677764))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1192433 (= res!793269 (validMask!0 mask!1564))))

(declare-fun b!1192434 () Bool)

(declare-fun e!677760 () Bool)

(assert (=> b!1192434 (= e!677760 tp_is_empty!30163)))

(declare-fun b!1192435 () Bool)

(declare-fun res!793265 () Bool)

(assert (=> b!1192435 (=> (not res!793265) (not e!677764))))

(assert (=> b!1192435 (= res!793265 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37710 _keys!1208))))))

(declare-fun mapNonEmpty!47072 () Bool)

(declare-fun tp!89613 () Bool)

(assert (=> mapNonEmpty!47072 (= mapRes!47072 (and tp!89613 e!677760))))

(declare-fun mapKey!47072 () (_ BitVec 32))

(declare-fun mapValue!47072 () ValueCell!14372)

(declare-fun mapRest!47072 () (Array (_ BitVec 32) ValueCell!14372))

(assert (=> mapNonEmpty!47072 (= (arr!37173 _values!996) (store mapRest!47072 mapKey!47072 mapValue!47072))))

(declare-fun b!1192436 () Bool)

(declare-fun e!677761 () Bool)

(assert (=> b!1192436 (= e!677761 true)))

(declare-fun zeroValue!944 () V!45345)

(declare-fun lt!542066 () array!77046)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!45345)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19570 0))(
  ( (tuple2!19571 (_1!9796 (_ BitVec 64)) (_2!9796 V!45345)) )
))
(declare-datatypes ((List!26285 0))(
  ( (Nil!26282) (Cons!26281 (h!27490 tuple2!19570) (t!38901 List!26285)) )
))
(declare-datatypes ((ListLongMap!17539 0))(
  ( (ListLongMap!17540 (toList!8785 List!26285)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5235 (array!77044 array!77046 (_ BitVec 32) (_ BitVec 32) V!45345 V!45345 (_ BitVec 32) Int) ListLongMap!17539)

(declare-fun -!1727 (ListLongMap!17539 (_ BitVec 64)) ListLongMap!17539)

(assert (=> b!1192436 (= (getCurrentListMapNoExtraKeys!5235 lt!542068 lt!542066 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1727 (getCurrentListMapNoExtraKeys!5235 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!39439 0))(
  ( (Unit!39440) )
))
(declare-fun lt!542067 () Unit!39439)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!977 (array!77044 array!77046 (_ BitVec 32) (_ BitVec 32) V!45345 V!45345 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39439)

(assert (=> b!1192436 (= lt!542067 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!977 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1192437 () Bool)

(declare-fun res!793266 () Bool)

(assert (=> b!1192437 (=> (not res!793266) (not e!677764))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1192437 (= res!793266 (validKeyInArray!0 k0!934))))

(declare-fun res!793263 () Bool)

(assert (=> start!100048 (=> (not res!793263) (not e!677764))))

(assert (=> start!100048 (= res!793263 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37710 _keys!1208))))))

(assert (=> start!100048 e!677764))

(assert (=> start!100048 tp_is_empty!30163))

(declare-fun array_inv!28466 (array!77044) Bool)

(assert (=> start!100048 (array_inv!28466 _keys!1208)))

(assert (=> start!100048 true))

(assert (=> start!100048 tp!89612))

(declare-fun array_inv!28467 (array!77046) Bool)

(assert (=> start!100048 (and (array_inv!28467 _values!996) e!677759)))

(declare-fun b!1192438 () Bool)

(declare-fun e!677757 () Bool)

(assert (=> b!1192438 (= e!677763 (not e!677757))))

(declare-fun res!793262 () Bool)

(assert (=> b!1192438 (=> res!793262 e!677757)))

(assert (=> b!1192438 (= res!793262 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77044 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1192438 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!542065 () Unit!39439)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77044 (_ BitVec 64) (_ BitVec 32)) Unit!39439)

(assert (=> b!1192438 (= lt!542065 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1192439 () Bool)

(assert (=> b!1192439 (= e!677757 e!677761)))

(declare-fun res!793271 () Bool)

(assert (=> b!1192439 (=> res!793271 e!677761)))

(assert (=> b!1192439 (= res!793271 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!542069 () ListLongMap!17539)

(assert (=> b!1192439 (= lt!542069 (getCurrentListMapNoExtraKeys!5235 lt!542068 lt!542066 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3120 (Int (_ BitVec 64)) V!45345)

(assert (=> b!1192439 (= lt!542066 (array!77047 (store (arr!37173 _values!996) i!673 (ValueCellFull!14372 (dynLambda!3120 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37711 _values!996)))))

(declare-fun lt!542070 () ListLongMap!17539)

(assert (=> b!1192439 (= lt!542070 (getCurrentListMapNoExtraKeys!5235 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!100048 res!793263) b!1192433))

(assert (= (and b!1192433 res!793269) b!1192427))

(assert (= (and b!1192427 res!793270) b!1192430))

(assert (= (and b!1192430 res!793268) b!1192425))

(assert (= (and b!1192425 res!793273) b!1192435))

(assert (= (and b!1192435 res!793265) b!1192437))

(assert (= (and b!1192437 res!793266) b!1192428))

(assert (= (and b!1192428 res!793272) b!1192429))

(assert (= (and b!1192429 res!793267) b!1192431))

(assert (= (and b!1192431 res!793264) b!1192438))

(assert (= (and b!1192438 (not res!793262)) b!1192439))

(assert (= (and b!1192439 (not res!793271)) b!1192436))

(assert (= (and b!1192432 condMapEmpty!47072) mapIsEmpty!47072))

(assert (= (and b!1192432 (not condMapEmpty!47072)) mapNonEmpty!47072))

(get-info :version)

(assert (= (and mapNonEmpty!47072 ((_ is ValueCellFull!14372) mapValue!47072)) b!1192434))

(assert (= (and b!1192432 ((_ is ValueCellFull!14372) mapDefault!47072)) b!1192426))

(assert (= start!100048 b!1192432))

(declare-fun b_lambda!20759 () Bool)

(assert (=> (not b_lambda!20759) (not b!1192439)))

(declare-fun t!38899 () Bool)

(declare-fun tb!10437 () Bool)

(assert (=> (and start!100048 (= defaultEntry!1004 defaultEntry!1004) t!38899) tb!10437))

(declare-fun result!21449 () Bool)

(assert (=> tb!10437 (= result!21449 tp_is_empty!30163)))

(assert (=> b!1192439 t!38899))

(declare-fun b_and!42113 () Bool)

(assert (= b_and!42111 (and (=> t!38899 result!21449) b_and!42113)))

(declare-fun m!1100285 () Bool)

(assert (=> b!1192428 m!1100285))

(declare-fun m!1100287 () Bool)

(assert (=> b!1192429 m!1100287))

(declare-fun m!1100289 () Bool)

(assert (=> b!1192429 m!1100289))

(declare-fun m!1100291 () Bool)

(assert (=> b!1192436 m!1100291))

(declare-fun m!1100293 () Bool)

(assert (=> b!1192436 m!1100293))

(assert (=> b!1192436 m!1100293))

(declare-fun m!1100295 () Bool)

(assert (=> b!1192436 m!1100295))

(declare-fun m!1100297 () Bool)

(assert (=> b!1192436 m!1100297))

(declare-fun m!1100299 () Bool)

(assert (=> b!1192438 m!1100299))

(declare-fun m!1100301 () Bool)

(assert (=> b!1192438 m!1100301))

(declare-fun m!1100303 () Bool)

(assert (=> b!1192437 m!1100303))

(declare-fun m!1100305 () Bool)

(assert (=> b!1192430 m!1100305))

(declare-fun m!1100307 () Bool)

(assert (=> start!100048 m!1100307))

(declare-fun m!1100309 () Bool)

(assert (=> start!100048 m!1100309))

(declare-fun m!1100311 () Bool)

(assert (=> b!1192439 m!1100311))

(declare-fun m!1100313 () Bool)

(assert (=> b!1192439 m!1100313))

(declare-fun m!1100315 () Bool)

(assert (=> b!1192439 m!1100315))

(declare-fun m!1100317 () Bool)

(assert (=> b!1192439 m!1100317))

(declare-fun m!1100319 () Bool)

(assert (=> b!1192425 m!1100319))

(declare-fun m!1100321 () Bool)

(assert (=> b!1192431 m!1100321))

(declare-fun m!1100323 () Bool)

(assert (=> b!1192433 m!1100323))

(declare-fun m!1100325 () Bool)

(assert (=> mapNonEmpty!47072 m!1100325))

(check-sat (not b!1192425) b_and!42113 (not b!1192430) (not mapNonEmpty!47072) (not b!1192438) (not b_lambda!20759) (not b!1192433) (not b!1192429) (not start!100048) (not b!1192439) (not b!1192437) (not b!1192436) (not b!1192431) (not b_next!25633) tp_is_empty!30163)
(check-sat b_and!42113 (not b_next!25633))
