; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101760 () Bool)

(assert start!101760)

(declare-fun b_free!26455 () Bool)

(declare-fun b_next!26455 () Bool)

(assert (=> start!101760 (= b_free!26455 (not b_next!26455))))

(declare-fun tp!92411 () Bool)

(declare-fun b_and!44153 () Bool)

(assert (=> start!101760 (= tp!92411 b_and!44153)))

(declare-fun b!1225448 () Bool)

(declare-fun e!696003 () Bool)

(declare-fun e!696006 () Bool)

(declare-fun mapRes!48637 () Bool)

(assert (=> b!1225448 (= e!696003 (and e!696006 mapRes!48637))))

(declare-fun condMapEmpty!48637 () Bool)

(declare-datatypes ((V!46673 0))(
  ( (V!46674 (val!15636 Int)) )
))
(declare-datatypes ((ValueCell!14870 0))(
  ( (ValueCellFull!14870 (v!18297 V!46673)) (EmptyCell!14870) )
))
(declare-datatypes ((array!79020 0))(
  ( (array!79021 (arr!38137 (Array (_ BitVec 32) ValueCell!14870)) (size!38675 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!79020)

(declare-fun mapDefault!48637 () ValueCell!14870)

(assert (=> b!1225448 (= condMapEmpty!48637 (= (arr!38137 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14870)) mapDefault!48637)))))

(declare-fun b!1225449 () Bool)

(declare-fun e!696002 () Bool)

(assert (=> b!1225449 (= e!696002 true)))

(declare-fun zeroValue!944 () V!46673)

(declare-datatypes ((array!79022 0))(
  ( (array!79023 (arr!38138 (Array (_ BitVec 32) (_ BitVec 64))) (size!38676 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!79022)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!558310 () array!79020)

(declare-fun minValue!944 () V!46673)

(declare-fun lt!558311 () array!79022)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!20240 0))(
  ( (tuple2!20241 (_1!10131 (_ BitVec 64)) (_2!10131 V!46673)) )
))
(declare-datatypes ((List!27020 0))(
  ( (Nil!27017) (Cons!27016 (h!28225 tuple2!20240) (t!40446 List!27020)) )
))
(declare-datatypes ((ListLongMap!18209 0))(
  ( (ListLongMap!18210 (toList!9120 List!27020)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5549 (array!79022 array!79020 (_ BitVec 32) (_ BitVec 32) V!46673 V!46673 (_ BitVec 32) Int) ListLongMap!18209)

(declare-fun -!1937 (ListLongMap!18209 (_ BitVec 64)) ListLongMap!18209)

(assert (=> b!1225449 (= (getCurrentListMapNoExtraKeys!5549 lt!558311 lt!558310 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1937 (getCurrentListMapNoExtraKeys!5549 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!40471 0))(
  ( (Unit!40472) )
))
(declare-fun lt!558309 () Unit!40471)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1168 (array!79022 array!79020 (_ BitVec 32) (_ BitVec 32) V!46673 V!46673 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40471)

(assert (=> b!1225449 (= lt!558309 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1168 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1225450 () Bool)

(declare-fun e!696004 () Bool)

(assert (=> b!1225450 (= e!696004 e!696002)))

(declare-fun res!814391 () Bool)

(assert (=> b!1225450 (=> res!814391 e!696002)))

(assert (=> b!1225450 (= res!814391 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!558312 () ListLongMap!18209)

(assert (=> b!1225450 (= lt!558312 (getCurrentListMapNoExtraKeys!5549 lt!558311 lt!558310 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3394 (Int (_ BitVec 64)) V!46673)

(assert (=> b!1225450 (= lt!558310 (array!79021 (store (arr!38137 _values!996) i!673 (ValueCellFull!14870 (dynLambda!3394 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38675 _values!996)))))

(declare-fun lt!558308 () ListLongMap!18209)

(assert (=> b!1225450 (= lt!558308 (getCurrentListMapNoExtraKeys!5549 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1225451 () Bool)

(declare-fun e!696000 () Bool)

(assert (=> b!1225451 (= e!696000 (not e!696004))))

(declare-fun res!814384 () Bool)

(assert (=> b!1225451 (=> res!814384 e!696004)))

(assert (=> b!1225451 (= res!814384 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!79022 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1225451 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!558313 () Unit!40471)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79022 (_ BitVec 64) (_ BitVec 32)) Unit!40471)

(assert (=> b!1225451 (= lt!558313 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1225452 () Bool)

(declare-fun res!814387 () Bool)

(declare-fun e!696005 () Bool)

(assert (=> b!1225452 (=> (not res!814387) (not e!696005))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1225452 (= res!814387 (validMask!0 mask!1564))))

(declare-fun b!1225453 () Bool)

(declare-fun res!814392 () Bool)

(assert (=> b!1225453 (=> (not res!814392) (not e!696005))))

(assert (=> b!1225453 (= res!814392 (= (select (arr!38138 _keys!1208) i!673) k0!934))))

(declare-fun b!1225454 () Bool)

(declare-fun res!814381 () Bool)

(assert (=> b!1225454 (=> (not res!814381) (not e!696005))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1225454 (= res!814381 (validKeyInArray!0 k0!934))))

(declare-fun b!1225455 () Bool)

(declare-fun res!814385 () Bool)

(assert (=> b!1225455 (=> (not res!814385) (not e!696005))))

(assert (=> b!1225455 (= res!814385 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38676 _keys!1208))))))

(declare-fun res!814383 () Bool)

(assert (=> start!101760 (=> (not res!814383) (not e!696005))))

(assert (=> start!101760 (= res!814383 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38676 _keys!1208))))))

(assert (=> start!101760 e!696005))

(declare-fun tp_is_empty!31159 () Bool)

(assert (=> start!101760 tp_is_empty!31159))

(declare-fun array_inv!29130 (array!79022) Bool)

(assert (=> start!101760 (array_inv!29130 _keys!1208)))

(assert (=> start!101760 true))

(assert (=> start!101760 tp!92411))

(declare-fun array_inv!29131 (array!79020) Bool)

(assert (=> start!101760 (and (array_inv!29131 _values!996) e!696003)))

(declare-fun b!1225456 () Bool)

(declare-fun res!814388 () Bool)

(assert (=> b!1225456 (=> (not res!814388) (not e!696005))))

(assert (=> b!1225456 (= res!814388 (and (= (size!38675 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38676 _keys!1208) (size!38675 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1225457 () Bool)

(declare-fun e!696001 () Bool)

(assert (=> b!1225457 (= e!696001 tp_is_empty!31159)))

(declare-fun b!1225458 () Bool)

(declare-fun res!814382 () Bool)

(assert (=> b!1225458 (=> (not res!814382) (not e!696005))))

(declare-datatypes ((List!27021 0))(
  ( (Nil!27018) (Cons!27017 (h!28226 (_ BitVec 64)) (t!40447 List!27021)) )
))
(declare-fun arrayNoDuplicates!0 (array!79022 (_ BitVec 32) List!27021) Bool)

(assert (=> b!1225458 (= res!814382 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!27018))))

(declare-fun b!1225459 () Bool)

(declare-fun res!814389 () Bool)

(assert (=> b!1225459 (=> (not res!814389) (not e!696005))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79022 (_ BitVec 32)) Bool)

(assert (=> b!1225459 (= res!814389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1225460 () Bool)

(assert (=> b!1225460 (= e!696006 tp_is_empty!31159)))

(declare-fun mapNonEmpty!48637 () Bool)

(declare-fun tp!92410 () Bool)

(assert (=> mapNonEmpty!48637 (= mapRes!48637 (and tp!92410 e!696001))))

(declare-fun mapKey!48637 () (_ BitVec 32))

(declare-fun mapRest!48637 () (Array (_ BitVec 32) ValueCell!14870))

(declare-fun mapValue!48637 () ValueCell!14870)

(assert (=> mapNonEmpty!48637 (= (arr!38137 _values!996) (store mapRest!48637 mapKey!48637 mapValue!48637))))

(declare-fun mapIsEmpty!48637 () Bool)

(assert (=> mapIsEmpty!48637 mapRes!48637))

(declare-fun b!1225461 () Bool)

(declare-fun res!814390 () Bool)

(assert (=> b!1225461 (=> (not res!814390) (not e!696000))))

(assert (=> b!1225461 (= res!814390 (arrayNoDuplicates!0 lt!558311 #b00000000000000000000000000000000 Nil!27018))))

(declare-fun b!1225462 () Bool)

(assert (=> b!1225462 (= e!696005 e!696000)))

(declare-fun res!814386 () Bool)

(assert (=> b!1225462 (=> (not res!814386) (not e!696000))))

(assert (=> b!1225462 (= res!814386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!558311 mask!1564))))

(assert (=> b!1225462 (= lt!558311 (array!79023 (store (arr!38138 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38676 _keys!1208)))))

(assert (= (and start!101760 res!814383) b!1225452))

(assert (= (and b!1225452 res!814387) b!1225456))

(assert (= (and b!1225456 res!814388) b!1225459))

(assert (= (and b!1225459 res!814389) b!1225458))

(assert (= (and b!1225458 res!814382) b!1225455))

(assert (= (and b!1225455 res!814385) b!1225454))

(assert (= (and b!1225454 res!814381) b!1225453))

(assert (= (and b!1225453 res!814392) b!1225462))

(assert (= (and b!1225462 res!814386) b!1225461))

(assert (= (and b!1225461 res!814390) b!1225451))

(assert (= (and b!1225451 (not res!814384)) b!1225450))

(assert (= (and b!1225450 (not res!814391)) b!1225449))

(assert (= (and b!1225448 condMapEmpty!48637) mapIsEmpty!48637))

(assert (= (and b!1225448 (not condMapEmpty!48637)) mapNonEmpty!48637))

(get-info :version)

(assert (= (and mapNonEmpty!48637 ((_ is ValueCellFull!14870) mapValue!48637)) b!1225457))

(assert (= (and b!1225448 ((_ is ValueCellFull!14870) mapDefault!48637)) b!1225460))

(assert (= start!101760 b!1225448))

(declare-fun b_lambda!22425 () Bool)

(assert (=> (not b_lambda!22425) (not b!1225450)))

(declare-fun t!40445 () Bool)

(declare-fun tb!11247 () Bool)

(assert (=> (and start!101760 (= defaultEntry!1004 defaultEntry!1004) t!40445) tb!11247))

(declare-fun result!23115 () Bool)

(assert (=> tb!11247 (= result!23115 tp_is_empty!31159)))

(assert (=> b!1225450 t!40445))

(declare-fun b_and!44155 () Bool)

(assert (= b_and!44153 (and (=> t!40445 result!23115) b_and!44155)))

(declare-fun m!1130129 () Bool)

(assert (=> start!101760 m!1130129))

(declare-fun m!1130131 () Bool)

(assert (=> start!101760 m!1130131))

(declare-fun m!1130133 () Bool)

(assert (=> b!1225461 m!1130133))

(declare-fun m!1130135 () Bool)

(assert (=> b!1225452 m!1130135))

(declare-fun m!1130137 () Bool)

(assert (=> b!1225449 m!1130137))

(declare-fun m!1130139 () Bool)

(assert (=> b!1225449 m!1130139))

(assert (=> b!1225449 m!1130139))

(declare-fun m!1130141 () Bool)

(assert (=> b!1225449 m!1130141))

(declare-fun m!1130143 () Bool)

(assert (=> b!1225449 m!1130143))

(declare-fun m!1130145 () Bool)

(assert (=> b!1225451 m!1130145))

(declare-fun m!1130147 () Bool)

(assert (=> b!1225451 m!1130147))

(declare-fun m!1130149 () Bool)

(assert (=> b!1225454 m!1130149))

(declare-fun m!1130151 () Bool)

(assert (=> b!1225459 m!1130151))

(declare-fun m!1130153 () Bool)

(assert (=> b!1225450 m!1130153))

(declare-fun m!1130155 () Bool)

(assert (=> b!1225450 m!1130155))

(declare-fun m!1130157 () Bool)

(assert (=> b!1225450 m!1130157))

(declare-fun m!1130159 () Bool)

(assert (=> b!1225450 m!1130159))

(declare-fun m!1130161 () Bool)

(assert (=> b!1225453 m!1130161))

(declare-fun m!1130163 () Bool)

(assert (=> b!1225462 m!1130163))

(declare-fun m!1130165 () Bool)

(assert (=> b!1225462 m!1130165))

(declare-fun m!1130167 () Bool)

(assert (=> mapNonEmpty!48637 m!1130167))

(declare-fun m!1130169 () Bool)

(assert (=> b!1225458 m!1130169))

(check-sat (not start!101760) (not b!1225451) (not b!1225462) (not b!1225454) b_and!44155 tp_is_empty!31159 (not b!1225458) (not b_next!26455) (not b!1225450) (not b!1225449) (not b!1225459) (not b!1225452) (not b_lambda!22425) (not mapNonEmpty!48637) (not b!1225461))
(check-sat b_and!44155 (not b_next!26455))
